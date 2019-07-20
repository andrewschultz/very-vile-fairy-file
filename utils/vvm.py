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
        if lx > ly: extra_letters += 1
        if lx == ly: equal_letters += 1
        if lx < ly: fewer_letters += 1
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
    with open(mistake_file) as file:
        for (line_count, line) in enumerate(file, 1):
            if not line.startswith("understand \""): continue
            u = first_understand(line)
            if u not in should_be and u not in ignores:
                print("Need cfg entry for", u)
                continue
            if found_yet[u]:
                print("WARNING duplicate", u, "line", line_count)
            found_yet[u] = True
            if u in ignores: continue
            temp = learner_shift(u)
            if temp not in line:
                print("Line", line_count, "/", u, "/", should_be[u], "... needs you to add", temp)

def read_mistake_cfg():
    mistake_cfg = "vvm.txt"
    with open(mistake_cfg) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("#"): continue
            if line.startswith(";"): break
            if "\t" not in line:
                print("Line", line_count, "should have tabs in it.")
                continue
            lary = line.lower().strip().split("\t")
            if lary[1] == 'x':
                ignores[lary[0]] = True
            else:
                should_be[lary[0]] = lary[1]
            found_yet[lary[0]] = False



read_mistake_cfg()
read_mistake_file()


