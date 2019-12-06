#
# sct.py : score tracker for Very Vile Fairy File
#
# this tracks not only walkthrough branching but also specific tests.
# tests include death rooms and multiple commands (e.g. mining more|moor)

from shutil import copy
from collections import defaultdict
import re
import i7
import sys
import os
import mytools as mt

scores = defaultdict(int)
got = defaultdict(int)
got_detail = defaultdict(lambda: defaultdict(int))
to_open = defaultdict(int)

#initialize values

open_source_post = True

core_column = 4
topic_column = 8

min_line = 0
max_line = 0

max_sco = 0
core_max = 0

verbose_code = True
verbose = False

print_forlaters = False
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

def check_invisiclues_vs_walkthrough():
    fname = "c:/writing/scripts/invis/vv.txt"
    in_invisiclues = defaultdict(int)
    first_invis = defaultdict(str)
    dubs = 0
    last_dup_comment = -1
    with open(fname) as file:
        for (line_count, line) in enumerate(file, 1):
            if "#duphint" in line: last_dup_comment = line_count
            for q in list(got_detail['nec']) + list(got_detail['opt']):
                if q.upper() in line:
                    if q in in_invisiclues:
                        if last_dup_comment == line_count - 1:
                            last_dup_comment = -1
                            continue
                        if last_dup_comment != -1:
                            print("Mistaken duphint line {} after {}.".format(line_count, last_dup_comment))
                            mt.add_postopen_file_line(fname, line_count)
                            continue
                        dubs += 1
                        print("Potential double {} {} {} vs {}: {} / {}".format(dubs, q.upper(), line_count, in_invisiclues[q], line.strip(), first_invis[q]))
                        mt.add_postopen_file_line(fname, line_count)
                    else:
                        first_invis[q] = line.strip()
                    in_invisiclues[q] = line_count
            if last_dup_comment == line_count - 1:
                print("Uh oh, had a duphint which didn't precede any point scoring command at line {}.".format(line_count))
                mt.add_postopen_file_line(fname, line_count)
    count = tot = 0
    for x in got_detail['nec']:
        if x not in in_invisiclues:
            count += 1
            tot += 1
            print(count, tot, "Necessary command {} not found in invisiclues.".format(x.upper()))
    count = 0
    for x in got_detail['opt']:
        if x not in in_invisiclues:
            count += 1
            tot += 1
            print(count, tot, "Optional command {} not found in invisiclues.".format(x.upper()))
    if last_dup_comment != -1: print("Unacknowledged duplicate comment at line {}.".format(last_dup_comment))

def check_think_tests():
    think_needed = defaultdict(int)
    fin = i7.hdr('vv', 'ta')
    ft = "rbr-vvff-thru.txt"
    in_think_table = False
    skip_header = False
    with open(fin) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("table of forlaters"):
                skip_header = True
                in_think_table = True
                continue
            if skip_header:
                skip_header = False
                continue
            if not line.strip():
                in_think_table = False
            if not in_think_table: continue
            tary = line.split("\t")
            tnq = tary[0].replace('"', '')
            think_needed[tnq] = 0
            think_needed["!" + tnq] = 0
    in_think_test = False
    prev_think = False
    with open(ft) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("==t") and '2' in line:
                in_think_test = True
                continue
            if in_think_test and not line.strip():
                in_think_test = False
            if not in_think_test:
                if '>' in line and 'think' in line:
                    print("Bad think test line {} {}".format(line_count, line))
                    think_errs += 1
                continue
            prev_think = 'think' in line.lower() and '>' in line.lower()
            if line.strip() in think_needed:
                think_needed[line.strip()] += 1
    think_errs = 0
    for q in sorted(think_needed, key=lambda x: (re.sub("^!", "", x), "!" in x)):
        if q == '!BURY BILE': continue #special case for final command
        if think_needed[q] == 0:
            print("Think test needed for", q)
            think_errs += 1
        elif think_needed[q] > 1:
            print("Excess think test for", q)
            think_errs += 1
    if think_errs == 0: print("THINK ERR TESTS ALL IN PLACE")
    else: print(think_errs, "THINK ERR tests to fix")

def check_multiple_command_tests():
    need_base_test = defaultdict(int)
    need_mult_test = defaultdict(int)
    fin = i7.hdr('vv', 'ta')
    skip_header = False
    in_verb_table = False
    fatal_error = 0
    with open(fin) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("table of verb checks"):
                skip_header = True
                in_verb_table = True
                continue
            if skip_header:
                skip_header = False
                continue
            if not in_verb_table: continue
            if not line.strip():
                in_verb_table = False
                continue
            tary = line.strip().split("\t")
            if True:
                if tary[topic_column].startswith('"'):
                    got_first = False
                    if '|' in tary[topic_column]:
                        print("OOPS need / not | at line {}".format(line_count))
                        sys.exit()
                    for q0 in i7.topx2ary(tary[topic_column]):
                        #print("C8 {} Need to verify {}".format(line_count, q0))
                        if got_first:
                            need_mult_test[q0] = 0
                        else:
                            need_base_test[q0] = 0
                        got_first = True
                elif '/' in tary[0] or '/' in tary[1]:
                    print("UH OH fatal error: need | and not / at line {} for {} and {}".format(line_count, tary[0], tary[1]))
                    fatal_error = 1
                    mt.add_postopen_file_line(fin, line_count)
                    continue
                elif '|' in tary[0] or '|' in tary[1]:
                    tz = (tary[0] + " " + tary[1]).replace('"', '')
                    if '/' in tz: sys.exit("OOPS need | not / at line {}".format(line_count))
                    got_first = False
                    temp = i7.topx2ary(tz, div_char='|')
                    for q0 in temp:
                        #print("C1/2 {} Need to verify {}".format(line_count, q0))
                        if got_first:
                            need_mult_test[q0] = 0
                        else:
                            need_base_test[q0] = 0
                        got_first = True
                #sys.exit("Uh oh bad table line read {} len={} {}.".format(line_count, len(tary), tary))
    if fatal_error:
        mt.postopen_files()
    in_alt_verbs = False
    skip_next = False
    mult_err = 0
    need_byone = False
    need_undo = False
    rbr = i7.rbr()
    with open(rbr) as file:
        for (line_count, line) in enumerate(file, 1):
            if need_byone:
                if not line.startswith('by one point'):
                    print("Need -by one point- at line {}: {}.".format(line_count, line.strip()))
                need_byone = False
                need_undo = True
                continue
            if need_undo:
                if not line.startswith(">") or 'undo' not in line:
                    print("Need -undo- at line {}: {}.".format(line_count, line.strip()))
                need_undo = False
                continue
            if 'okdup' in line:
                skip_next = True
                continue
            if skip_next:
                skip_next = False
                continue
            if line.startswith("==t3") or line.startswith("@alt"):
                in_alt_verbs = True
                continue
            if in_alt_verbs and not line.strip():
                in_alt_verbs = False
                continue
            if not in_alt_verbs: continue
            if not line.startswith(">"): continue
            my_cmd = re.sub("^> *", "", line.strip().lower())
            if my_cmd == 'undo' or my_cmd == 'z': continue
            if my_cmd not in need_mult_test:
                mult_err += 1
                print(mult_err, "Bad command {} at {} line {}.".format(my_cmd, rbr, line_count))
            else:
                need_mult_test[my_cmd] += 1
                need_byone = True
    for x in sorted(need_mult_test):
        if need_mult_test[x] == 0:
            mult_err += 1
            if verbose_code:
                print("@alt\n> {}\nby one point\n>undo".format(x))
            else:
                print(mult_err, "No mult-cmd test for", x)
        elif need_mult_test[x] > 1:
            mult_err += 1
            print(mult_err, "Multiple mult-cmd test for", x)
    if mult_err: print(mult_err, "total multiple command test file errors")
    else: print("ALL MULTIPLE COMMANDS HAVE TEST CASE!")

def check_bad_loc_tests():
    death_moves = defaultdict(int)
    fin = i7.hdr('vvff', 'ta')
    ft = "rbr-vvff-thru.txt"
    in_death_test = False
    loc_errs = 0
    skip_header = False
    in_loc_table = False
    with open(fin) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("table of bad locs"):
                skip_header = True
                in_loc_table = True
                continue
            if skip_header:
                skip_header = False
                continue
            if not line.strip():
                in_loc_table = False
            if not in_loc_table: continue
            tary = line.split("\t")
            try:
                temp_string = tary[1] + " to " + i7.a2q(tary[4].replace('"', ''))
            except:
                sys.exit("Bad array {} line {}".format(tary, line_count))
            death_moves[temp_string] = 0
            if tary[2] == 'false':
                temp_string = "!" + temp_string
                death_moves[temp_string] = 0
    got_main_yet = False
    with open(ft) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith('==t') and '4' in line:
                if not got_main_yet: continue
                in_death_test = True
                continue
            if not got_main_yet:
                if "* main-thru" in line: got_main_yet = True
            if in_death_test and not line.strip():
                in_death_test = False
            if not in_death_test: continue
            if line.startswith(">"): continue
            ls = line.strip()
            if ls.startswith("You already went"): continue
            if ls.startswith("#"): continue
            if ls not in death_moves:
                print(os.path.basename(ft), "has bad death_moves line", line_count, line.strip())
                loc_errs += 1
            else:
                death_moves[ls] += 1
    for x in death_moves:
        if death_moves[x] == 0:
            print("Did not find test case for", x)
            loc_errs += 1
        elif death_moves[x] > 1:
            print("Found excess test case for", x)
            loc_errs += 1
    if loc_errs: print(loc_errs, "total location test errors")
    else: print("ALL DEATH LOCATIONS ARE TESTED!")

def print_list_dif(dkey1, dkey2, descrip):
    x1 = list(set(list(dkey1)) - set(list(dkey2)))
    if len(x1):
        print("Stuff in table of forlaters but not called by {} ({}): {}".format(descrip, len(x1), ', '.join(sorted(x1))))
    else:
        print("CLUE VERIFICATION:", descrip, "all matches up.")

# deprecated now that I merged table of forlaters and table of verb checks
def clue_hint_verify():
    found_table = False
    in_forlaters = False
    file_name = "story.ni"
    for_laters = defaultdict(int)
    cmd_laters = defaultdict(int)
    cmd_zaps = defaultdict(int)
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
            if "\tclue-zap " in line:
                q = re.sub("\";.*", "", line.strip())
                q = re.sub(".*\"", "", q)
                cmd_zaps[q] = line_count
    if not found_table: sys.exit("Did not find table of forlaters in {}.".format(file_name))
    x1 = list(set(list(cmd_laters)) - set(list(for_laters)))
    if len(x1):
        x1s = sorted(x1)
        print("Stuff in commands but not table of forlaters:", ', '.join(x1s))
        if print_forlaters:
            for_later_print = ""
            for u in x1s:
                uld = re.sub(" ", "-", u.lower())
                print("\"{}\"\tfalse\tcan-{} rule\tdid-{} rule\t\"\"".format(u, uld, uld))
                for_later_print += "\nthis is the can-{} rule:\n\tif 1 is 1, the rule succeeds;\n\tthe rule fails;\n\nthis is the did-{} rule:\n\tif 1 is 1, the rule succeeds;\n\tthe rule fails;\n".format(uld, uld);
            print(for_later_print)
        else:
            print("-pfl prints stuff to forlaters")
        if vv_table not in to_open: to_open[vv_table] = forlater_start + 2
    print_list_dif(for_laters, cmd_laters, "clue-later")
    print_list_dif(for_laters, cmd_zaps, "clue-zap")

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
            elif score_list[core_column] == 'true':
                core_points += 1
                cmd_type = "CORE"
            elif score_list[core_column] == 'false':
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
    got_verb_checks = False
    with open(i7.hdr('vv', 'ta')) as file:
        for (line_count, line) in enumerate(file, 1):
            temp_pass = False
            if line.startswith("core-max"):
                if core_max: sys.exit("Core max / minimum score redefined at line {}.".format(line_count))
                core_max = int(re.sub(".* is ", "", re.sub("\.( *\[.*?\])$", "", line.lower().strip())))
                min_line = line_count
                continue
            if line.startswith("table of verb checks"):
                in_verb_checks = True
                skip_next = True
                got_verb_checks = True
                continue
            if 'up-reg' in line and '[+' in line and 0:
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
                    pt_type = 'nec' if a[4].lower() == 'true' else 'opt' if a[4].lower() == 'false' else 'skip'
                except:
                    print("Bad value for 3rd column at line {}: {}".format(line_count, line.strip()))
                if pt_type == 'skip': continue
            if verbose: print("Command: {}".format(base_cmd))
            scores[pt_type] += 1
            if not temp_pass: got_detail[pt_type][base_cmd] = True
    if not got_verb_checks: sys.exit("Did not find table of verb checks.")

def read_cmd_line():
    global show_nec
    global show_opt
    global open_source_post
    global verbose
    global print_forlaters
    cmd_count = 1
    while cmd_count < len(sys.argv):
        arg = sys.argv[cmd_count]
        if arg[0] == '-': arg = arg[1:]
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
        elif arg == 'pfl': print_forlaters = True
        elif arg == 'vc': verbose_code = True
        elif arg == 'vn' or arg == 'nv': verbose_code = False
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

#check_miss_rule()

#clue_hint_verify()

check_think_tests()
check_bad_loc_tests()
check_multiple_command_tests()

check_invisiclues_vs_walkthrough()

mt.postopen_files()
