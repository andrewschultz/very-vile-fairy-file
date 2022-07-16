#
# rhyru.py: checks vc- rhyming rules in the local CSDD table file
#

import re
import i7

def anything_but(my_ary, my_text):
    for x in my_ary:
        if x != my_text:
            return True
    return False

this_proj = i7.dir2proj()
my_file = i7.hdr(this_proj, 'ta')

addables = [ 'vcp', 'vcal', 'say' ]
my_ary = []

with open(my_file) as file:
    for (line_count, line) in enumerate(file, 1):
        l0 = line.strip()
        if "this is the vc-" in l0:
            this_rule = re.sub("^.*?\(", "", line.strip())
            this_rule = re.sub("\).*", "", this_rule)
            my_ary = []
        for x in addables:
            if l0.startswith(x) and '[oksay]' not in line:
                my_ary.append(x)
        if 'already-done;' in line:
            if anything_but(my_ary, 'vcal'):
                print(this_rule, "already-done has non-vcal print above line", line_count)
            my_ary = []
        if 'not-yet;' in line:
            if anything_but(my_ary, 'vcp'):
                print(this_rule, "not-yet has non-vcp print above line", line_count)
            my_ary = []
        if 'ready;' in line:
            if anything_but(my_ary, 'xxx'):
                print(this_rule, "ready has printing above line", line_count)
            my_ary = []
