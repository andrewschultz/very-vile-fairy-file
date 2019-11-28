#
# hhv.py ha half verifier
# creaetes and verifies script code for HA HALF test file
#

import i7
import sys
import re
from collections import defaultdict
import mytools as mt

ignores = defaultdict(int)
need_range = defaultdict(int)
range_start = defaultdict(int)
range_end = defaultdict(int)
range_tot = defaultdict(int)

print_freq = False

neg_need_range = defaultdict(int)
neg_range_start = defaultdict(int)
neg_range_end = defaultdict(int)
neg_range_tot = defaultdict(int)

opt = defaultdict(bool)

double_item_list = defaultdict(int)

def usage():
    print("-p/-pf = print frequencies.")
    exit()

def print_stuff(test_name, range_needed, range_starts, put_in_punc = False, double_test = False):
    my_punc = "!" if put_in_punc else ""
    temp_ary = [x for x in range_needed if x not in range_starts and x != 'vc-dimd rule']
    temp_ary = sorted(temp_ary, key=range_needed.get)
    for x in temp_ary:
        ta2 = re.sub(" .*", "", x).split('-')
        try:
            if double_test:
                print()
                print("@ha")
                print("> {} {}".format(ta2[1], ta2[2]))
                print("!by one point")
                print("REPLACE TEXT HERE")
                continue
            half_light = "{}{}.".format(half_msg, "" if opt[x] else ", but dimly")
            print("@ha")
            print("> z{} {}".format(ta2[1], ta2[2]))
            print(my_punc + "DEBUG: {} {}.".format(x, right_string))
            print(my_punc + half_light)
            print("> {} z{}".format(ta2[1], ta2[2]))
            print(my_punc + "DEBUG: {} {}.".format(x, right_string))
            print(my_punc + half_light)
            print()
        except:
            print("OH NO botched with", x)
    print(test_name, "failed" if len(temp_ary) else "passed" , len(temp_ary))

def get_rule(x):
    x = re.sub(" rule.*", " rule", x.strip())
    x = re.sub(".*: *", "", x)
    return x

cmd_count = 1
while cmd_count < len(sys.argv):
    arg = mt.nohy(sys.argv[cmd_count])
    if arg == 'p' or arg == 'pf': print_freq = True
    else: usage()
    cmd_count += 1

in_verb_checks = False

with open("story.ni") as file:
    for (line_count, line) in enumerate(file, 1):
        if line.startswith("table of verb checks"):
            in_verb_checks = True
            print("Starting verb checks line", line_count, "in story.ni.")
            continue
        if not in_verb_checks: continue
        ary = line.strip().split("\t")
        if in_verb_checks and not line.strip(): break
        this_rule = 'vc-' + ary[6][3:]
        if ary[6].startswith("vr-"):
            #if 'dimd' in ary[6]: continue
            if 'bury' not in ary[0] and 'told' not in ary[0]: #There's nothing post successful BURY BILE/TOLD TALE, because that's the end of the games
                neg_need_range[this_rule] = line_count
            if ary[3] == '--':
                ignores[ary[5]] = True
                continue # non point gainers like HISTORY HALL and SOFT SAND
            need_range[this_rule] = line_count
            opt[this_rule] = (ary[3].lower() == 'true')            
        if len(ary) < 7:
            sys.exit(ary)

last_command = ""

in_t6 = False

my_proj = i7.dir2proj(to_abbrev=True)

rbr_file = 'rbr-vvff-thru.txt' if my_proj == 'vv' else 'rbr-qqnn-thru.txt'
right_string = 'tipped off the HA HALF button' if my_proj == 'vv' else 'tipped off half-body tingling'
half_msg = 'The HA HALF button lights up on your Leet Learner' if my_proj == 'vv' else 'Half of your body tingles. Perhaps you are (yeah, this is corny) halfway right'

with open(rbr_file) as file:
    for (line_count, line) in enumerate(file, 1):
        if my_proj == 'vv' and line.startswith("==t") and "6" in line: in_t6 = True
        if line.startswith("@ha") : in_t6 = True
        if not line.strip(): in_t6 = False
        if line.startswith("DEBUG") and right_string in line:
            if not in_t6: print("WARNING DEBUG/HA HALF check outside of @ha file branch at line {}.".format(line_count))
            my_arg = get_rule(line)
            if my_arg not in range_start: range_start[my_arg] = line_count
            range_end[my_arg] = line_count
            range_tot[my_arg] += 1
        if line.startswith("!DEBUG") and right_string in line:
            my_arg = get_rule(line)
            if my_arg not in neg_range_start: neg_range_start[my_arg] = line_count
            neg_range_end[my_arg] = line_count
            neg_range_tot[my_arg] += 1
        if line.startswith(">"): last_command = re.sub("^> *", "", line.strip())
        if "!by one point" in line:
            rule_to_check = "vc-" + last_command.replace(" ", "-") + " rule"
            if rule_to_check not in need_range and rule_to_check not in ignores:
                print('Line', line_count, rbr_file, last_command, '/', rule_to_check, '=', 'unrecognized rule.')
            else:
                double_item_list[rule_to_check] = line_count

if print_freq:
    for x in sorted(range_start, key=range_start.get):
        print("For {}: {} total, range {}-{}".format(x, range_tot[x], range_start[x], range_end[x]))
    for x in sorted(neg_range_start, key=neg_range_start.get):
        print("For {}: {} total, range {}-{}".format(x, neg_range_tot[x], neg_range_start[x], neg_range_end[x]))

print_stuff('pre-point-scoring', need_range, range_start, False)
print_stuff('post-point-scoring', neg_need_range, neg_range_start, True)

print_stuff('Double items tests', neg_need_range, double_item_list, double_test = True)