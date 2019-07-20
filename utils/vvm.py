#
# vvm.py
#
# very vile fairy file mistake guesser
#

from mytools import nohy
import sys
import os
import re
import i7
from collections import defaultdict

os.chdir(i7.sdir("vv"))
mistake_cfg = os.path.join(i7.sdir("vv"), "vvm.txt")
my_src = i7.src("vv")

ignores = defaultdict(bool)
should_be = defaultdict(str)
found_yet = defaultdict(bool)
file_open_after = defaultdict(int)

def usage(hdr="GENERAL USAGE"):
    print("=" * 20 + hdr)
    print("a = add and verify, na/an = don't add and verify")
    print("e/ec/ce = edit config file")
    print("es/se = edit source file")
    exit()

def learner_shift(x):
    x = re.sub("[^a-z ]", "", x, 0, re.IGNORECASE)
    extra_letters = equal_letters = fewer_letters = 0
    y = should_be[x]
    x0 = x.split(" ")
    y0 = y.split(" ")
    for a in range(0, 2):
        lx = len(x0[a])
        ly = len(y0[a])
        if lx < ly: extra_letters += 1
        if lx == ly: equal_letters += 1
        if lx > ly: fewer_letters += 1
    if not extra_letters and not fewer_letters: return "leteq"
    if extra_letters and fewer_letters: return "letboth"
    if extra_letters and equal_letters: return "partplus"
    if extra_letters and not equal_letters: return "letplus"
    if fewer_letters and equal_letters: return "partminus"
    if fewer_letters and not equal_letters: return "letminus"
    return "unknown"

def first_understands(l):
    preface = re.sub(" *as a mistake.*", "", l.lower().strip())
    ret_val = preface.split("\"")[1::2]
    return ret_val

def read_mistake_file():
    mistake_file = i7.hdr("vvff", "mi")
    need_add = 0
    cfg_needed = 0
    unnecc = 0
    last_error_room = ""
    this_error_room = ""
    add_leetclue = defaultdict(bool)
    out_file = open(i7.temp_hdr, "w")
    with open(mistake_file) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("chapter"):
                if not line.lower().strip().endswith("mistakes"):
                    print("TRIVIAL ERROR need chapter...mistakes format for", line.strip())
                this_error_room = line.strip().lower()[8:]
            if not line.startswith("understand \""):
                out_file.write(line)
                continue
            unds = first_understands(line)
            line_replace = line
            for u in unds:
                if u not in should_be and u not in ignores:
                    if this_error_room != last_error_room:
                        last_error_room = this_error_room
                        print("========", this_error_room)
                    cfg_needed += 1
                    print(cfg_needed, "Need cfg entry for", u, "at line", line_count, "    NOTE: we already have the leetclue value." if "leetclue" in line else "")
                    if "leetclue" in line:
                        add_leetclue[u] = True
                    continue
                if found_yet[u]:
                    print("WARNING duplicate", u, "line", line_count)
                found_yet[u] = True
                if u in ignores:
                    if "leetclue" in u:
                        if this_error_room != last_error_room:
                            last_error_room = this_error_room
                            print("========", this_error_room)
                        unnecc += 1
                        print(line_count, "has unnecessary leetclue")
                    continue
                temp = learner_shift(u)
                leet_to_add = "leetclue of {0}".format(temp)
                if leet_to_add not in line:
                    need_add += 1
                    print("rooms", this_error_room, last_error_room)
                    if this_error_room != last_error_room:
                        last_error_room = this_error_room
                        print("========", this_error_room)
                    print(need_add, "Line", line_count, ":", u, "~", should_be[u], "... needs you to {0}".format("FIX ERRONEOUS READING TO" if "leetclue" in line else "ADD READING"), leet_to_add)
                    if leet_to_add not in line_replace:
                        line_prev = line_replace
                        line_replace = re.sub(r"\"\)", "[{0}]\")".format(leet_to_add), line_replace, 1, re.IGNORECASE)
                        if line_replace == line_prev:
                            print("    **** failed to add {0} at line {1}.".format(leet_to_add, line_count))
            out_file.write(line_replace)
    out_file.close()
    if add_and_verify and need_add:
        i7.wm(mistake_file, i7.tmp_hdr)
    os.remove(i7.tmp_hdr)
    print("Error summary: {0} cfg needed, {1} need to add leetclue, {2} excess leetclue.".format(cfg_needed, need_add, unnecc))
    if len(add_leetclue):
        print(len(add_leetclue), "Leetclues to add to vvm.txt:", ", ".join(sorted(add_leetclue)))

def read_mistake_cfg():
    with open(mistake_cfg) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("#"): continue
            if line.startswith(";"): break
            if "=" not in line:
                print("Line", line_count, "should have an equals sign in it.")
                continue
            lary = line.lower().strip().split("=")
            from_ary = lary[0].split(",")
            for f in from_ary:
                if lary[1] == 'x':
                    ignores[f] = True
                else:
                    should_be[f] = lary[1]
                found_yet[f] = False

def cht_change(my_line):
    mll = my_line.lower()
    if "now cht" in mll: return True
    if mll.startswith("\t"): return False
    if "cht of" in mll: return True
    return False

def parse_learner_line(l):
    ll = l.lower().strip()
    what_adjusted_to = re.sub(".*-> *(.*?)\].*", r'\1', ll)
    if "[->" in l:
        what_to_adj = re.sub(".*cht of *", "", ll)
        what_to_adj = re.sub(" +is.*", "", what_to_adj)
    else:
        what_to_adj = re.sub(".*\[(.*?) *->.*", r'\1', ll)
    if debug: print("What to adjust:", what_to_adj, "/", "What adjusted to:", what_adjusted_to)
    return (0, 0)

def check_for_cht():
    cht_to_replace = 0
    cht_count = 0
    need_arrow = 0
    with open(my_src) as file:
        for (line_count, line) in enumerate(file, 1):
            if "cht is" in line.lower():
                cht_to_replace += 1
                cht_count += 1
                print("'cht is' needs 'cht of * is' at line {0} (#{1})".format(line_count, cht_count))
                if my_src not in file_open_after:
                    file_open_after[my_src] = line_count
                continue
            if cht_change(line):
                if not re.search("\[([^\]])*->([^\]])*\]", line):
                    if 'is phbt' in line or 'is usually phbt' in line: continue # phbt means disabling things, so we pass on that, or default definitions
                # if not re.search("\[([^\]])*->(^[^\]])*\]", line):
                    need_arrow += 1
                    print(need_arrow, "Need [->] at line", line_count, line.strip())
                    if my_src not in file_open_after:
                        file_open_after[my_src] = line_count
                    continue
                (my_from, my_to) = parse_learner_line(line)
                # print(line_count, line.strip())
                continue
    if cht_count: print(cht_count, "total cht-is constructions to fix.")
    else: print("Woohoo! No cht-is bugs in the main source.")

debug = False
add_and_verify = True

cmd_count = 1
while cmd_count < len(sys.argv):
    arg = nohy(sys.argv[cmd_count])
    if arg == 'a':
        add_and_verify = True
    elif arg == 'd':
        debug = True
    elif arg == 'na' or arg == 'an':
        add_and_verify = False
    elif arg == 'e' or arg == 'ec' or arg == 'ce':
        i7.open_source_config()
        exit()
    elif arg == 'es' or arg == 'se':
        i7.open_source()
        exit()
    else:
        usage()
    cmd_count += 1

read_mistake_cfg()
read_mistake_file()

check_for_cht()

if len(file_open_after):
    for x in file_open_after:
        i7.npo(x, file_open_after[x], bail=False)
    exit()
