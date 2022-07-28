#
# rhyru.py: checks vc- rhyming rules in the local CSDD table file
#

import sys
import re
import os
import i7
import mytools as mt

addables = [ 'vcp', 'vcal', 'say' ]
my_ary = []

def anything_but(my_ary, my_text):
    for x in my_ary:
        if x != my_text:
            return True
    return False

def check_rhymes(this_proj=i7.dir2proj()):
    my_file = i7.hdr(this_proj, 'ta')
    print("Checking vc- and vr- rules for the right say-stubs in", my_file)
    in_vc_rule = False
    mb = os.path.basename(my_file)
    got_one = False
    with open(my_file) as file:
        for (line_count, line) in enumerate(file, 1):
            l0 = line.strip()
            if not l0:
                in_vc_rule = False
            if "this is the vc-" in l0:
                in_vc_rule = True
                this_rule = re.sub("^.*?\(", "", line.strip())
                this_rule = re.sub("\).*", "", this_rule)
                my_ary = []
            if not in_vc_rule:
                continue
            for x in addables:
                if l0.startswith(x) and '[oksay]' not in line:
                    my_ary.append(x)
            if 'already-done;' in line:
                if anything_but(my_ary, 'vcal'):
                    print(this_rule, "already-done has non-vcal print above line", line_count)
                    got_one = True
                    mt.add_postopen(my_file, line_count)
                my_ary = []
            if 'not-yet;' in line:
                if anything_but(my_ary, 'vcp'):
                    print(this_rule, "not-yet has non-vcp print above line", line_count)
                    got_one = True
                    mt.add_postopen(my_file, line_count)
                my_ary = []
            if 'ready;' in line:
                if anything_but(my_ary, 'xxx'):
                    print(this_rule, "ready has printing above line", line_count)
                    mt.add_postopen(my_file, line_count)
                    got_one = True
                my_ary = []
    if not got_one:
        print("Everything worked out for", mb)

try:
    if len(sys.argv) == 1:
        check_rhymes()
    elif sys.argv[1] == 'a':
        check_rhymes('vvff')
        check_rhymes('qqnn')
        check_rhymes('lljj')
    elif sys.argv[1] == '2':
        check_rhymes('vvff')
        check_rhymes('lljj')
    elif re.search(r"^[vql]+$", sys.argv[1]):
        if 'l' in argv[1]:
            check_rhymes['lljj']
        if 'v' in argv[1]:
            check_rhymes['vvff']
        if 'q' in argv[1]:
            check_rhymes['qqnn']
except:
    print("a tries all 3 projects, 2 tries the 2 main ones.")

mt.post_open()
