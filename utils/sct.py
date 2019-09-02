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
to_open = defaultdict(int)

#initialize values

open_source_post = True


min_line = 0
max_line = 0

max_sco = 0
core_max = 0

verbose = False

show_nec = False
show_opt = False

i7.go_proj("vv")
should_update = update = os.path.getmtime("wbase.txt") > os.path.getmtime("walkthrough.txt")
update = should_update

hdr_str = "                  NE OP UD TO"

src = i7.main_src("vv")
wthru = i7.walkthrough_file("vv")
wfull = re.sub("walkthrough", "walkthrough-full", wthru)
wthru2 = re.sub("\.txt", "2.txt", wthru)
vv_table = i7.table_file("vv")

def usage(msg = "CMD LINE USAGE"):
    print(msg)
    print("=" * 50)
    print("b o n x = both optional necessary neither")
    print("p py = open source post run / pn = don't open it")
    print("u = update, nu/un = don't update")
    exit()

def clue_hint_verify():
    found_table = False
    in_forlaters = False
    file_name = "story.ni"
    for_laters = defaultdict(int)
    cmd_laters = defaultdict(int)
    global to_open
    with open(vv_table) as file:
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
    with open(src) as file:
        for (line_count, line) in enumerate(file, 1):
            if "\tclue-later " in line:
                q = re.sub("\";.*", "", line.strip())
                q = re.sub(".*\"", "", q)
                cmd_laters[q] = line_count
    if not found_table: sys.exit("Did not find table of forlaters in", file_name)
    x1 = list(set(list(cmd_laters)) - set(list(for_laters)))
    if len(x1):
        print("Stuff in commands but not table of forlaters:", ', '.join(x1))
        if vv_table not in to_open: to_open[vv_table] = forlater_start
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
        if open_source_post and "story.ni" not in to_open:
            to_open["story.ni"] = first_showmiss

def print_here_not(a, b, title = "generic", print_w_not = False):
    x1 = list(set(list(a.keys())) - set(list(b.keys())))
    x2 = list(set(list(b.keys())) - set(list(a.keys())))
    if not print_w_not:
        if x1: print (title, ":", len(x1), ', '.join(x1))
        else: print("I found no differences for {:s}!".format(title))
    if print_w_not:
        if x2: print (title, ":", len(x2), ', '.join(x2))
        else: print("It worked!")

def extract_num(my_line):
    temp = re.sub("\).*", "", my_line)
    try:
        return int(re.sub(".*\(", "", temp))
    except:
        print("Bad score in line", my_line)
        return -1

def check_walkthrough(my_file, is_opt):
    got_thru = defaultdict(int)
    pts_in_walkthrough = 0
    wthru_string = ""
    found_dif = 0
    num_dif = 0
    point_count = 0
    dif_map = []
    last_num = 0
    print("=" * 50, my_file, "=" * 50)
    with open(my_file) as file:
        for (line_count, line) in enumerate(file, 1):
            new_line = line
            if line.startswith(">") and "(" in line:
                my_num = extract_num(re.sub(".*\(", "", line))
                if my_num - last_num > 1:
                    print("Nonsequential number {:d} vs {:d} at line {:d}: {:s}".format(my_num, last_num, line_count, line.strip()))
                last_num = my_num
                my_cmd = re.sub(" *\(.*", "", line.strip().lower())
                my_cmd = re.sub("^> *", "", my_cmd)
                if my_cmd != "w":
                    got_thru[my_cmd] = line_count
    print_here_not(got_detail["nec"], got_thru, "In source but not walkthrough".format(my_file))
    if is_opt: print_here_not(got_detail["opt"], got_thru, "Optional LLP commands in source but not walkthrough {}".format(my_file))
    temp = defaultdict(int)
    for q in got_detail["opt"]: temp[q] = 1
    for q in got_detail["nec"]: temp[q] = 2
    print_here_not(got_thru, temp, "Commands in walkthrough but not source")
    if not is_opt:
        temp = [x for x in got_thru.keys() if x in got_detail["opt"].keys()]
        if len(temp):
            print("Optional command{:s} in streamlined walkthrough:".format(i7.plur(len(temp))), ", ".join(sorted(temp)))
    #print(len(sorted(got.keys())), sorted(got.keys()))
    #print(len(sorted(got_thru.keys())), sorted(got_thru.keys()))
    #print(sorted(got.keys()))

def pointup_type(l, ru): # deprecated
    if not l.startswith("\t"): return ''
    if 'check-russell-go' in l: return 'nec'
    if 'reg-up' in l or 'min-up' in l: return 'bug'
    if 'up-reg' in l:
        if 'check-russell-go' in ru: return ''
        if 'opt' in l: return ''
        return 'nec'
    if 'up-min' in l: return 'opt'
    return ''

def first_word(x):
    x = x.replace('"', '')
    return re.sub("\|.*", "", x)

def check_points():
    core_points = 0
    opt_points = 0
    read_next_line = False
    in_verb_checks = False
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            temp_pass = False
            if 'up-reg' in line and '[+' in line:
                cmd_type = "QUEST"
                temp_pass = True
                my_cmd = re.sub(".*\[\+", "", line.strip())
                my_cmd = re.sub("\].*", "", my_cmd)
            if line.startswith("table of verb checks"):
                read_next_line = True
                in_verb_checks = True
                continue
            if read_next_line:
                read_next_line = False
                continue
            if not in_verb_checks and not temp_pass:
                continue
            if not line.strip():
                in_verb_checks = False
                continue
            score_list = line.split("\t")
            if cmd_type == "QUEST":
                core_points += 1
            elif score_list[3] == 'true':
                core_points += 1
                cmd_type = "CORE"
            elif score_list[3] == 'false':
                opt_points += 1
                cmd_type = "OPT"
            else:
                cmd_type = "<reversal>"
            if not temp_pass:
                my_cmd = first_word(score_list[0])
                if score_list[2] != '--':
                    my_cmd += " " + first_word(score_list[1])
            if verbose: print(core_points, opt_points, cmd_type, "Command", my_cmd.upper())
            cmd_type = ""
    print("Core points", core_points)
    print("Opt points", opt_points)

def qpeel(my_str):
    if my_str == '--': return ''
    temp = my_str.replace('"', '')
    return re.sub("\|.*", "", temp)

def check_points():
    this_rule = ""
    last_line = 0
    last_cmd = "(undefined)"
    global core_max
    global min_line
    global max_sco
    global max_line
    in_verb_checks = False
    skip_next = False
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            temp_pass = False
            if line.startswith("core-max"):
                if core_max: sys.exit("Core max / minimum score redefined at line {:d}.".format(line_count))
                core_max = int(re.sub(".* is ", "", re.sub("\.$", "", line.lower().strip())))
                min_line = line_count
                continue
            if line.startswith("table of verb checks"):
                in_verb_checks = True
                skip_next = True
                continue
            if 'up-reg' in line and '[+' in line:
                temp_pass = True
                base_cmd = re.sub(".*\[\+", "", line.lower().strip())
                base_cmd = re.sub("\].*", "", base_cmd)
                pt_type = 'nec'
            if not in_verb_checks and not temp_pass: continue
            if skip_next:
                skip_next = False
                continue
            if not line.strip():
                in_verb_checks = False
                continue
            if not temp_pass:
                a = line.lower().strip().split("\t")
                b = qpeel(a[0])
                c = qpeel(a[1])
                base_cmd = "{} {}".format(qpeel(a[0]), qpeel(a[1])).strip()
                try:
                    pt_type = 'nec' if a[3].lower() == 'true' else 'opt' if a[3].lower() == 'false' else 'skip'
                except:
                    print("Bad value for 3rd column at line {}: {}".format(line_count, line.strip()))
                if pt_type == 'skip': continue
            if verbose: print("Command: {}".format(base_cmd))
            scores[pt_type] += 1
            if not temp_pass: got_detail[pt_type][base_cmd] = True

def read_cmd_line():
    global show_nec
    global show_opt
    global open_source_post
    global verbose
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
        elif arg == 'u': update = True
        elif arg == 'v': verbose = True
        elif arg == 'nu' or arg == 'un': update = False
        elif arg == 'p' or arg == 'yp' or arg == 'py': open_source_post = True
        elif arg == 'pn' or arg == 'np': open_source_post = False
        elif arg == '?': usage()
        else: usage("Bad option {:s}".format(arg))
        cmd_count += 1
#
# main program
#

read_cmd_line()

if update:
    if not should_update: print("You don't seem to need to update since wbase was edited before the walkthroughs, but I'll do so anyway.")
    else: print("Detecting change in wbase after change in walkthroughs.")
    print("Updating wbase.txt with rbr and wdrop...")
    os.system("rbr.py wbase.txt")
    print("...updated.")
else:
    if should_update: print("Ignoring wbase's time being ahead of walkthroughs.")
    else: print("Wbase is behind walkthroughs, and updating is not forced.")

check_points()
check_walkthrough("walkthrough.txt", False)
check_walkthrough("walkthrough-full.txt", True)

#
# post-processing
#

if core_max != scores['nec']:
    print("MINIMUM SCORE DISCREPANCY: {:d} in source but # of necessary scores in file = {:d}. Line {:d} defines core max.".format(core_max, scores['nec'], min_line))
    if open_source_post and "story.ni" not in to_open: to_open["story.ni"] = min_line
else: print("MINIMUM SCORES MATCH IN SOURCE!")

if max_sco != scores['total']:
    print("MAXIMUM SCORE DISCREPANCY: {:d} in source but # of possible scores in file = {:d}. Line {:d} defines max score.".format(max_sco, scores['total'], max_line))
    if open_source_post and "story.ni" not in to_open: to_open["story.ni"] = max_line
else: print("MAXIMUM SCORES MATCH IN SOURCE!")

if len(got_detail['bug']):
    print("SCORING COMMAND (up-min/up-reg backwards) BUG: ", ', '.join(["{:s} at line {:d}".format(x, got[x]) for x in sorted(got_detail['bug'], key=lambda x:got[x])]))

check_miss_rule()

clue_hint_verify()

for q in sorted(x_of_y.keys()):
    xqs = sorted(x_of_y[q].keys())
    xq = x_of_y[q]
    print('X-of-Y puzzle for', q, ':', ', '.join(sorted([z for z in xqs if xq[z] == True])), '/', ', '.join(sorted([z for z in xqs if xq[z] == False])))

if open_source_post:
    if len(to_open) == 0: sys.exit("No files to open.")
    for fi_open in to_open:
        i7.npo(fi_open, to_open[fi_open], bail=False)
    exit()