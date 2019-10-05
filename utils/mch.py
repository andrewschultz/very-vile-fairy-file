#
# mch.py
#
# mistake vs test script checker

import mytools as mt
import sys
from collections import defaultdict
import re
import i7

my_line = defaultdict(int)
text_needed = defaultdict(str)

need_mistake_test = defaultdict(bool)
got_mistake_test = defaultdict(bool)

need_leet_check = defaultdict(bool)
got_leet_check = defaultdict(bool)

mist_file = i7.hdrfile('vv', 'mi')

max_count = 20

def first_slash(x):
    return re.sub("[\|/][a-zA-Z]+", "", x)

def noquo_single(top):
    top = i7.rmbrax(top, replace_string = "/")
    if top.startswith('"'): top = top[1:]
    return re.sub("\".*", "", top)
    
def noquo(topic):
    topic = re.sub("^\"", "", topic)
    topic = re.sub("\"$", "", topic)
    the_ary = re.split("\" *or *\"", topic)
    return [first_slash(x) for x in the_ary]

with open(mist_file) as file:
    for (line_count, line) in enumerate(file, 1):
        if "\t" not in line: continue
        if "\t\t" in line: sys.exit("Double tabs line {}".format(line_count))
        ary = re.split("\t", line.strip())
        if '"' not in ary[0] or len(ary) == 1: continue
        try:
            if ary[1] == '--': sys.exit("Fatal error line {} has no mistake rule.".format(line_count))
        except:
            sys.exit("Oops, misread line {}: {}.".format(line_count, line.strip()))
        for my_cmd in noquo(ary[0].lower()):
            if (ary[3] == '--') != (ary[4] == '--'):
                sys.exit("w1 and w2 entries conflict--both or neither should be blank.")
            need_mistake_test[my_cmd] = True
            my_line[my_cmd] = line_count
            need_leet_check[my_cmd] = ary[5] != '--'
            text_needed[my_cmd] = ('!' if ary[3] == '--' else '') + "Learner needle\n" + noquo_single(ary[6])

okay_next_dup = False

in_mistakes = False

with open("rbr-vvff-thru.txt") as file:
    for (line_count, line) in enumerate(file, 1):
        if okay_next_dup:
            okay_next_dup = False
            continue
        if '==t6' in line: in_mistakes = True
        if 'okdup' in line: okay_next_dup = True
        if not line.strip():
            in_mistakes = False
            continue
        if not in_mistakes:
            if 'Learner needle' in line:
                print("Maybe errant needle message line {}.".format(line_count))
            continue
        if not line.startswith(">"): continue
        line_cmd = re.sub("^> *", "", line.lower().strip())
        if line_cmd == 'undo': continue
        if line_cmd not in need_mistake_test:
            print("Erroneous mistake command line {}: {}.".format(line_count, line_cmd))
        elif line_cmd in got_mistake_test:
            if line_cmd not in need_leet_check:
                print("Duplicate mistake try at line {}: {}.".format(line_count, line_cmd))
            elif need_leet_check[line_cmd] == False:
                print("Erroneous leet-check rule at line {}: {}.".format(line_count, line_cmd))
            got_leet_check[line_cmd] = True
        got_mistake_test[line_cmd] = True

err_found = 0

y = [x for x in need_mistake_test if x not in got_mistake_test]

if len(y):
    err_found += len(y)
    count = 0
    print(len(y), "mistake checks needed.")
    for q in sorted(y, key=lambda x:my_line[x]):
        count += 1
        if count > max_count:
            print("Went over max.")
            break;
        print(">", q)
        print(text_needed[q])
else: print("No mistake checks needed.")

y = [x for x in got_mistake_test if x not in need_mistake_test]

if len(y):
    err_found += len(y)
    print("Extraneous mistake checks({}): {}".format(len(y), ', '.join(sorted(y, key=lambda x:my_line[x]))))
else: print("No extraneous mistake checks.")

y = [x for x in need_leet_check if need_leet_check[x] and x not in got_leet_check]

if len(y):
    err_found += len(y)
    count = 0
    print(len(y), "leet checks needed.")
    for q in sorted(y, key=lambda x:my_line[x]):
        count += 1
        if count > max_count:
            print("Went over max.")
            break;
        print(">", q)
        tn = re.sub("^([^a-zA-Z])?", "!", text_needed[q])
        print(tn)
else: print("No leet checks needed.")

y = [x for x in got_mistake_test if x not in need_mistake_test or need_mistake_test[x] == False]

if len(y):
    err_found += len(y)
    print("Extraneous leet checks({}): {}".format(len(y), ', '.join(sorted(y, key=lambda x:my_line[x]))))
else: print("No extraneous leet checks.")

if err_found:
    print(err_found, "total error" + mt.plur(err_found))
else:
    print("SUCCESS! The mistake file and test file match.")