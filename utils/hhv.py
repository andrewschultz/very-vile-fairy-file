#
# hhv.py ha half verifier
# creaetes and verifies script code for HA HALF test file
#

import sys
import re
from collections import defaultdict
import mytools as mt

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

def print_stuff(range_needed, range_starts, put_in_punc = False, double_test = False):
    my_punc = "!" if put_in_punc else ""
    temp_ary = [x for x in range_needed if x not in range_starts]
    temp_ary = sorted(temp_ary, key=range_needed.get)
    for x in temp_ary:
        ta2 = re.sub(" .*", "", x).split('-')
        try:
            if double_test:
                print()
                print("==t6")
                print("> {} {}".format(ta2[1], ta2[2]))
                print("!by one point")
                print("REPLACE TEXT HERE")
                continue
            if x == 'vc-dimd rule': continue
            half_light = "The HA HALF button lights up on your Leet Learner{}.".format("" if opt[x] else ", but dimly")
            print("==t6")
            print("> z{} {}".format(ta2[1], ta2[2]))
            print(my_punc + "DEBUG: {} tipped off the HA HALF button.".format(x))
            print(my_punc + half_light)
            print("> {} z{}".format(ta2[1], ta2[2]))
            print(my_punc + "DEBUG: {} tipped off the HA HALF button.".format(x))
            print(my_punc + half_light)
            print()
        except:
            print("OH NO botched with", x)

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
            if 'bury' not in ary[0]: #There's nothing post successful BURY BILE, because that's the end of the game
                neg_need_range[this_rule] = line_count
            if ary[3] == '--': continue # non point gainers like HISTORY HALL and SOFT SAND
            need_range[this_rule] = line_count
            opt[this_rule] = (ary[3].lower() == 'true')            
        if len(ary) < 7:
            sys.exit(ary)

last_command = ""

with open("rbr-vvff-thru.txt") as file:
    for (line_count, line) in enumerate(file, 1):
        if line.startswith("DEBUG") and 'tipped off the HA HALF button' in line:
            my_arg = get_rule(line)
            if my_arg not in range_start: range_start[my_arg] = line_count
            range_end[my_arg] = line_count
            range_tot[my_arg] += 1
        if line.startswith("!DEBUG") and 'tipped off the HA HALF button' in line:
            my_arg = get_rule(line)
            if my_arg not in neg_range_start: neg_range_start[my_arg] = line_count
            neg_range_end[my_arg] = line_count
            neg_range_tot[my_arg] += 1
        if line.startswith(">"): last_command = re.sub("^> *", "", line.strip())
        if "!by one point" in line:
            rule_to_check = "vc-" + last_command.replace(" ", "-") + " rule"
            if rule_to_check not in need_range:
                print('Line', line_count, last_command, '/', rule_to_check, '=', 'unrecognized rule.')
            else:
                double_item_list[rule_to_check] = line_count

if print_freq:
    for x in sorted(range_start, key=range_start.get):
        print("For {}: {} total, range {}-{}".format(x, range_tot[x], range_start[x], range_end[x]))
    for x in sorted(neg_range_start, key=neg_range_start.get):
        print("For {}: {} total, range {}-{}".format(x, neg_range_tot[x], neg_range_start[x], neg_range_end[x]))

print_stuff(need_range, range_start, False)
print_stuff(neg_need_range, neg_range_start, True)

print_stuff(neg_need_range, double_item_list, double_test = True)