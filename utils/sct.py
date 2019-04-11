#
# sct.py : score tracker for Very Vile Fairy File
#
# todo: walkthrough branching, spoiler/nonspoiler

from shutil import copy
from collections import defaultdict
import re
import i7
import sys
import os

x_of_y = defaultdict(lambda: defaultdict(bool))
scores = defaultdict(int)
got = defaultdict(int)
got_detail = defaultdict(lambda: defaultdict(int))

#initialize values

copy_walkthrough_back = False
open_source_post = True
to_open = 0

min_line = 0
max_line = 0

max_sco = 0
min_sco = 0

show_nec = False
show_opt = False

hdr_str = "                  NE OP UD TO"

def usage(msg = "CMD LINE USAGE"):
    print(msg)
    print("=" * 50)
    print("b o n x = both optional necessary neither")
    print("p py = open source post run / pn = don't open it")
    exit()

def clue_hint_verify():
    found_table = False
    in_forlaters = False
    file_name = "story.ni"
    for_laters = defaultdict(int)
    cmd_laters = defaultdict(int)
    global to_open
    with open(file_name) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("table of forlaters"):
                found_table = True
                in_forlaters = True
                forlater_start = line_count
                continue
            if in_forlaters:
                if not line.strip():
                    in_forlaters = False
                    continue
                if not line.startswith("\""): continue
                l = line.strip().split("\t")
                q = re.sub("\"", "", l[0])
                for_laters[q] = line_count
            if "\tclue-later " in line:
                q = re.sub("\";.*", "", line.strip())
                q = re.sub(".*\"", "", q)
                cmd_laters[q] = line_count
    if not found_table: sys.exit("Did not find table of forlaters in", file_name)
    x1 = list(set(list(cmd_laters)) - set(list(for_laters)))
    if len(x1):
        print("Stuff in commands but not table of forlaters:", ', '.join(x1))
        if not to_open: to_open = forlater_start
    x1 = list(set(list(for_laters)) - set(list(cmd_laters)))
    if len(x1):
        print("Stuff in table of forlaters but not commands:", ', '.join(x1))

def check_miss_rule():
    in_showmiss = False
    first_showmiss = 0
    showmiss_count = 0
    miss_accounted = defaultdict(lambda: defaultdict(int))
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            if "rule for showmissesing:" in line:
                in_showmiss = True
                first_showmiss = line_count + 1
                continue
            if in_showmiss:
                if not line.strip(): in_showmiss = False
                else:
                    for q in got_detail['opt']:
                        if q.upper() in line:
                            miss_accounted[q] = line_count
    if len(miss_accounted) == len(got_detail['opt']): print("SHOWMISS rule has everything accounted for! Way to go!")
    else:
        x1 = list(set(list(got_detail['opt'].keys())) - set(list(miss_accounted.keys())))
        x1 = sorted(x1, key=lambda x:got_detail['opt'][x])
        print("RULE FOR SHOW MISSING needs", ', '.join(x1))
        global to_open
        if open_source_post and not to_open:
            to_open = first_showmiss

def print_here_not(a, b, title = "generic", print_w_not = False):
    x1 = list(set(list(a.keys())) - set(list(b.keys())))
    x2 = list(set(list(b.keys())) - set(list(a.keys())))
    if not print_w_not:
        if x1: print (title, ":", len(x1), ', '.join(x1))
        else: print("It worked!")
    if print_w_not:
        if x2: print (title, ":", len(x2), ', '.join(x2))
        else: print("It worked!")

def check_walkthrough():
    got_thru = defaultdict(int)
    pts_in_walkthrough = 0
    wthru_string = ""
    found_dif = 0
    point_count = 0
    dif_map = []
    with open("walkthrough.txt") as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith(">") and re.search("\(((x-)?[0-9]+|x)\)", line):
                point_count += 1
                my_cmd = re.sub("^> *", "", line.strip())
                my_cmd = re.sub(" *\((x)?.*", "", my_cmd)
                got_thru[my_cmd.lower()] = line_count
                pts_in_walkthrough += 1
                #print(line_count, my_cmd)
                new_line = re.sub("\([0-9]+\)", "({:d})".format(point_count), line)
                if new_line != line:
                    found_dif += 1
                    old_num = re.sub(".*\(", "", line.strip())
                    old_num = re.sub("\).*", "", old_num)
                    dif_map.append("{:s} {:s}->{:d}".format(my_cmd, old_num, point_count))
                wthru_string += new_line
            else: wthru_string += line
    if found_dif:
        if copy_walkthrough_back:
            f = open("walkthrough2.txt", "w")
            f.write(wthru_string)
            f.close()
            copy("walkthrough2.txt", "walkthrough.txt")
            os.remove("walkthrough2.txt")
            print("Rejigged walkthrough.txt with", found_dif, "difference" + i7.plur(found_dif))
        else: print("Walkthrough numbered wrong. I found", found_dif, "difference" + i7.plur(found_dif) + ":", ', '.join(dif_map))
    else: print("Walkthrough numbering okay.")
    if pts_in_walkthrough != scores["nec"]:
        print("ERROR Walkthrough points =", pts_in_walkthrough, "necessary scores flagged in source code =", scores["nec"])
    print_here_not(got_detail["nec"], got_thru, "Necessary-source-not-walkthrough")
    print_here_not(got_detail["opt"], got_thru, "Optional-source-not-walkthrough")
    temp = defaultdict(int)
    for q in got_detail["opt"]: temp[q] = 1
    for q in got_detail["nec"]: temp[q] = 2
    print_here_not(got_thru, temp, "Walkthrough-not-source")
    #print(len(sorted(got.keys())), sorted(got.keys()))
    #print(len(sorted(got_thru.keys())), sorted(got_thru.keys()))
    #print(sorted(got.keys()))

def pointup_type(l, ru):
    if not l.startswith("\t"): return ''
    if 'check-russell-go' in l: return 'nec'
    if 'up-reg' in l and 'check-russell-go' not in ru: return 'nec'
    if 'up-min' in l: return 'opt'
    return ''

def check_points():
    this_rule = ""
    last_line = 0
    last_cmd = "(undefined)"
    global min_sco
    global min_line
    global max_sco
    global max_line
    if show_nec or show_opt: print(hdr_str)
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
            if line.strip() and not line.startswith("\t") and not line.startswith("["): this_rule = line.strip()
            if "increment the score" in line:
                if this_rule.startswith("to up-"): continue
                print("WARNING errant 'increment the score' at line {:d}: {:s}".format(line_count, line.strip()))
                print("Rule:", this_rule)
            if "[x-of-y" in line:
                puz_type = re.sub(".*x-of-y ", "", line.strip())
                puz_type = re.sub("\].*", "", puz_type)
                x_of_y[puz_type][last_cmd] = "[nec]" in line
                continue
            score_idx = pointup_type(line, this_rule)
            if score_idx:
                if "[!" in line: #force last command
                    last_cmd = re.sub(".*\[!", "", line.strip())
                    last_cmd = re.sub("\].*", "", last_cmd)
                scores[score_idx] += 1
                got[last_cmd] = line_count
                got_detail[score_idx][last_cmd] = line_count
                scores["total"] += 1
                show_it = (score_idx == 'opt') and show_opt
                show_it |= (score_idx == 'nec') and show_nec
                if show_it: print("({:>5s}) Cur score {:02d}+{:02d}+{:02d}={:02d} Line {:4d}".format(score_idx, scores["nec"], scores["opt"], scores["undef"], scores["total"], line_count), "score increment for command {:20s} Line {:4d} Rule {:s}".format(last_cmd, last_line, this_rule))
                continue
            if "[nec]" in line: print("Warning, deprecated NEC at line", line_count)
    if show_nec or show_opt: print(hdr_str)

def read_cmd_line():
    global show_nec
    global show_opt
    global open_source_post
    global copy_walkthrough_back
    cmd_count = 1
    while cmd_count < len(sys.argv):
        arg = sys.argv[cmd_count]
        if arg == 'n':
            show_nec = True
            show_opt = False
        elif arg == 'o':
            show_nec = False
            show_opt = True
        elif arg == 'b':
            show_nec = True
            show_opt = True
        elif arg == 'x':
            show_nec = False
            show_opt = False
        elif arg == 'cw': copy_walkthrough_back = True
        elif arg == 'ncw': copy_walkthrough_back = False
        elif arg == 'p' or arg == 'yp' or arg == 'py': open_source_post = True
        elif arg == 'pn' or arg == 'np': open_source_post = False
        elif arg == '?': usage()
        else: usage("Bad option {:s}".format(arg))
        cmd_count += 1
#
# main program
#

read_cmd_line()

check_points()
check_walkthrough()

#
# post-processing
#

if min_sco != scores['nec']:
    print("MINIMUM SCORE DISCREPANCY: {:d} in source but # of necessary scores in file = {:d}. Line {:d} defines min score.".format(min_sco, scores['nec'], min_line))
    if open_source_post and not to_open: to_open = min_line
else: print("MINIMUM SCORES MATCH IN SOURCE!")

if max_sco != scores['total']:
    print("MAXIMUM SCORE DISCREPANCY: {:d} in source but # of possible scores in file = {:d}. Line {:d} defines max score.".format(max_sco, scores['total'], max_line))
    if open_source_post and not to_open: to_open = max_line
else: print("MAXIMUM SCORES MATCH IN SOURCE!")

check_miss_rule()

clue_hint_verify()

for q in sorted(x_of_y.keys()):
    xqs = sorted(x_of_y[q].keys())
    xq = x_of_y[q]
    print('X-of-Y puzzle for', q, ':', ', '.join(sorted([z for z in xqs if xq[z] == True])), '/', ', '.join(sorted([z for z in xqs if xq[z] == False])))

if open_source_post and to_open: i7.npo("story.ni", to_open)