#
# mch.py
#
# mistake vs test script checker

import os
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

needed_text = "Learner needle"
my_proj = i7.dir2proj(os.getcwd(), to_abbrev = True)

if not my_proj or my_proj == 'vv': my_proj = "vvff"

if my_proj == "qq":
    my_proj = "qqnn"
    needed_text = "sheep sheet"

mist_file = i7.hdrfile(my_proj, 'mi')

max_count = 15

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
        if "|" in ary[0]:
            mt.print_and_warn("Uh oh. We have a pipe instead of a slash for the topic {} in line {}.".format(ary[0], line_count))
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
            text_needed[my_cmd] = ('!' if ary[3] == '--' else '') + needed_text + "\n" + noquo_single(i7.a2q(ary[6]))

cmd_count = 1
while cmd_count < len(sys.argv):
    arg = sys.argv[cmd_count]
    try:
        max_count = int(arg)
        cmd_count += 1
        continue
    except:
        pass
    sys.exit("Can only define max_count with a number.")
    cmd_count += 1

okay_next_dup = False

in_mistakes = False

rbr_file = "rbr-{}-thru.txt".format(my_proj)
next_cmd_pass = True

with open(rbr_file) as file:
    for (line_count, line) in enumerate(file, 1):
        if okay_next_dup:
            okay_next_dup = False
            continue
        if '@mis' in line: in_mistakes = True
        if 'okdup' in line: okay_next_dup = True
        if line.startswith("#next-cmd-pass"):
            next_cmd_pass = True
            continue
        if not line.strip():
            in_mistakes = False
            continue
        if not in_mistakes:
            if needed_text in line:
                print("Maybe errant cluing message line {}.".format(line_count))
            continue
        if not line.startswith(">"): continue
        line_cmd = re.sub("^> *", "", line.lower().strip())
        if line_cmd == 'undo': continue
        if line_cmd not in need_mistake_test:
            if next_cmd_pass:
                next_cmd_pass = True
                continue
            print("Erroneous mistake command {} line {}: {}.".format(rbr_file, line_count, line_cmd))
            mt.add_postopen_file_line(rbr_file, line_count)
        elif line_cmd in got_mistake_test:
            if line_cmd not in need_leet_check:
                print("Duplicate mistake try at {} line {}: {}.".format(rbr_file, line_count, line_cmd))
                mt.add_postopen_file_line(rbr_file, line_count)
            elif need_leet_check[line_cmd] == False:
                print("Erroneous leet-check rule at {} line {}: {}.".format(rbr_file, line_count, line_cmd))
                mt.add_postopen_file_line(rbr_file, line_count)
            got_leet_check[line_cmd] = True
        got_mistake_test[line_cmd] = True
        next_cmd_pass = False

err_found = 0

print("DETAILS ABOVE SUMMARY BELOW")

y = [x for x in need_mistake_test if x not in got_mistake_test]

if len(y):
    err_found += len(y)
    count = 0
    print(len(y), "mistake checks needed.")
    for q in sorted(y, key=lambda x:my_line[x]):
        count += 1
        if count > max_count:
            print("Went over max of {}.".format(max_count))
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
            print("Went over max of {}.".format(max_count))
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

final_string = "{} total error{}".format(err_found, mt.plur(err_found)) if err_found else "SUCCESS! The mistake file and test file match."

mt.print_and_warn(final_string)

mt.postopen_files()