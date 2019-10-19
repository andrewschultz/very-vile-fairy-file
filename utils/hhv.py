import sys
import re
from collections import defaultdict

range_start = defaultdict(int)
range_end = defaultdict(int)
range_tot = defaultdict(int)
need_range = defaultdict(int)
opt = defaultdict(bool)

def get_rule(x):
    x = re.sub(" rule.*", " rule", x.strip())
    x = re.sub(".*: *", "", x)
    return x

in_verb_checks = False

with open("story.ni") as file:
    for (line_count, line) in enumerate(file, 1):
        if line.startswith("table of verb checks"):
            in_verb_checks = True
            print("Starting verb checks line", line_count)
            continue
        if not in_verb_checks: continue
        ary = line.strip().split("\t")
        if in_verb_checks and not line.strip(): break
        if ary[3] == '--': continue # non point gainers like HISTORY HALL and SOFT SAND
        this_rule = 'vc-' + ary[6][3:]
        if ary[6].startswith("vr-"):
            if 'dimd' in ary[6]: continue
            need_range[this_rule] = line_count
        opt[this_rule] = (ary[3].lower() == 'true')            
        if len(ary) < 7:
            sys.exit(ary)

with open("rbr-vvff-thru.txt") as file:
    for (line_count, line) in enumerate(file, 1):
        if line.startswith("DEBUG") and 'tipped off the HA HALF button' in line:
            my_arg = get_rule(line)
            if my_arg not in range_start: range_start[my_arg] = line_count
            range_end[my_arg] = line_count
            range_tot[my_arg] += 1

for x in sorted(range_start, key=range_start.get):
    print("For {}: {} total, range {}-{}".format(x, range_tot[x], range_start[x], range_end[x]))

temp_ary = [x for x in need_range if x not in range_start]
temp_ary = sorted(temp_ary, key=need_range.get)

#print(len(need_range))

#print("Undefined: {} {} total".format(len(temp_ary), ', '.join(["{}={}".format(u, need_range[u]) for u in temp_ary])))

for x in temp_ary:
    ta2 = x.split('-')
    try:
        half_light = "The HA HALF button lights up on your Leet Learner{}.".format("" if opt[x] else ", but dimly")
        print("==t6")
        print("> z{} {}".format(ta2[1], ta2[2]))
        print("DEBUG: {} tipped off the HA HALF button.".format(x))
        print(half_light)
        print("> {} z{}".format(ta2[1], ta2[2]))
        print("DEBUG: {} tipped off the HA HALF button.".format(x))
        print(half_light)
        print()
    except:
        print("OH NO botched with", x)

