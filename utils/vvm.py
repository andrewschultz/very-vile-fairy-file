#
# vvm.py
#
# very vile fairy file mistake guesser
#

import os
import re
import i7
from collections import defaultdict

ignores = defaultdict(bool)
should_be = defaultdict(str)
found_yet = defaultdict(bool)

def learner_shift(x):
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
    if need_add:
        i7.wm(mistake_file, i7.tmp_hdr)
    os.remove(i7.tmp_hdr)
    print("Error summary: {0} cfg needed, {1} need to add leetclue, {2} excess leetclue.".format(cfg_needed, need_add, unnecc))
    if len(add_leetclue):
        print(len(add_leetclue), "Leetclues to add to vvm.txt:", ", ".join(sorted(add_leetclue)))

def read_mistake_cfg():
    mistake_cfg = "vvm.txt"
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

read_mistake_cfg()
read_mistake_file()


