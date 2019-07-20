#
# vvm.py
#
# very vile fairy file mistake guesser
#

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

def first_understand(l):
    ret_val = l.lower().strip()
    x = ret_val.split("\"")
    return x[1]

def read_mistake_file():
    mistake_file = i7.hdr("vvff", "mi")
    need_add = 0
    cfg_needed = 0
    unnecc = 0
    last_error_room = ""
    this_error_room = ""
    add_leetclue = defaultdict(bool)
    with open(mistake_file) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("chapter"):
                if not line.lower().strip().endswith("mistakes"):
                    print("TRIVIAL ERROR need chapter...mistakes format for", line.strip())
                this_error_room = line.strip().lower()[8:]
            if not line.startswith("understand \""): continue
            u = first_understand(line)
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
            if "leetclue of " + temp not in line:
                need_add += 1
                print("rooms", this_error_room, last_error_room)
                if this_error_room != last_error_room:
                    last_error_room = this_error_room
                    print("========", this_error_room)
                print(need_add, "Line", line_count, ":", u, "~", should_be[u], "... needs you to {0}".format("FIX ERRONEOUS READING TO" if "leetclue" in line else "ADD READING"), "[leetclue of {0}]".format(temp))
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


