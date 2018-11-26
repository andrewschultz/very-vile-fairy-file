#
# sct.py : score tracker for Very Vile Fairy File
#

from collections import defaultdict
import re
import i7
import sys

x_of_y = defaultdict(lambda: defaultdict(bool))
scores = defaultdict(int)
got = defaultdict(int)
got_detail = defaultdict(lambda: defaultdict(int))

open_post = True
to_open = 0

min_line = 0
max_line = 0

hdr_str = "                  NE OP UD TO"

def showmiss_check():
    in_showmiss = False
    first_showmiss = 0
    showmiss_count = 0
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            if "rule for showmissesing:" in line:
                in_showmiss = True
                first_showmiss = line_count + 1
                continue
            if in_showmiss:
                if not line.strip(): in_showmiss = False
                else: showmiss_count += 1
    return (showmiss_count, first_showmiss)

def print_here_not(a, b):
    x1 = list(set(list(got_detail[a].keys())) - set(list(b.keys())))
    x2 = list(set(list(b.keys())) - set(list(got_detail[a].keys())))
    if x1: print (a.title(), "score commands not in walkthrough:", len(x1), ', '.join(x1))
    if x2: print ("Walkthrough commands not in", a.title(), "score:", len(x2), ', '.join(x2))

def check_walkthrough():
    got_thru = defaultdict(int)
    pts_in_walkthrough = 0
    with open("walkthrough.txt") as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith(">") and re.search("\((x-)?[0-9]+\)", line):
                my_cmd = re.sub("^> *", "", line.strip())
                my_cmd = re.sub(" *\((x)?.*", "", my_cmd)
                got_thru[my_cmd.lower()] = line_count
                pts_in_walkthrough += 1
                #print(line_count, my_cmd)
    if pts_in_walkthrough != scores["nec"]:
        print("ERROR Walkthrough points =", pts_in_walkthrough, "necessary scores flagged in source code =", scores["nec"])
    print_here_not("nec", got_thru)
    print_here_not("opt", got_thru)
    #print(len(sorted(got.keys())), sorted(got.keys()))
    #print(len(sorted(got_thru.keys())), sorted(got_thru.keys()))
    #print(sorted(got.keys()))

def check_points():
    last_line = 0
    last_cmd = "(undefined)"
    global min_sco
    global min_line
    global max_sco
    global max_line
    print(hdr_str)
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("min-needed"):
                if min_sco: sys.exit("Minimum score redefined at line {:d}.".format(line_count))
                min_sco = int(re.sub(".* is ", "", re.sub("\.$", "", line.lower().strip())))
                min_line = line_count
                continue
            if line.startswith("the maximum score is"):
                if max_sco: sys.exit("Maximum score redefined at line {:d}.".format(line_count))
                max_sco = int(re.sub(".* is ", "", re.sub("\.$", "", line.lower().strip())))
                max_line = line_count
                continue
            if re.search("understand \".*\" as", line):
                q = line.split("\"")
                last_cmd = q[1]
                last_line = line_count
            if line.startswith("to up-min"): continue
            if line.startswith("to check-russell-go"):
                last_cmd = ""
                continue
            if "increment the score" in line or "check-russell-go" in line or "up-min" in line:
                if last_line and last_cmd:
                    if last_cmd in got.keys():
                        print("WARNING", line_Count, last_cmd, "already flagged for a point at", got[last_cmd])
                    if "[x-of-y" in line:
                        puz_type = re.sub(".*x-of-y ", "", line.strip())
                        puz_type = re.sub("\].*", "", puz_type)
                        x_of_y[puz_type][last_cmd] = "[nec]" in line
                    if "[nec]" in line: score_idx = "nec"
                    elif "[x-of-y" in line: continue
                    elif "[opt]" in line or "\tup-min" in line: score_idx = "opt"
                    else:
                        score_idx = "undef"
                        to_open = line_count
                    got[last_cmd] = line_count
                    got_detail[score_idx][last_cmd] = line_count
                    scores[score_idx] += 1
                    scores["total"] += 1
                    print("({:>5s}) Cur score {:02d}+{:02d}+{:02d}={:02d} Line {:4d}".format(score_idx, scores["nec"], scores["opt"], scores["undef"], scores["total"], line_count), "score increment for command {:20s} Line {:4d}".format(last_cmd, last_line))
    print(hdr_str)

min_sco = 0
max_sco = 0

check_points()
check_walkthrough()
showmiss_in_rule = showmiss_check()

if min_sco != scores['nec']:
    print("{:d} in source but # of necessary scores in file = {:d}. Maybe fix line {:d}.".format(min_sco, scores['nec'], min_line))
    if open_post and not to_open: to_open = min_line
else: print("MINIMUM SCORES MATCH IN SOURCE!")

if showmiss_in_rule[0] != max_sco - min_sco:
    print("Expected", max_sco - min_sco, "in final rule but got", showmiss_in_rule[0])
    if open_post and not to_open: to_open = showmiss_in_rule[1]

if max_sco != scores['total']:
    print("{:d} in source but # of possible scores in file = {:d}. Maybe fix line {:d}.".format(max_sco, scores['total'], max_line))
    if open_post and not to_open: to_open = max_line
else: print("MAXIMUM SCORES MATCH IN SOURCE!")

for q in sorted(x_of_y.keys()):
    xqs = sorted(x_of_y[q].keys())
    xq = x_of_y[q]
    print('X-of-Y puzzle for', q, ':', ', '.join(sorted([z for z in xqs if xq[z] == True])), '/', ', '.join(sorted([z for z in xqs if xq[z] == False])))

if open_post and to_open: i7.npo("story.ni", to_open)