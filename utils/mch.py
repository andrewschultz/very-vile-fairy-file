#
# mch.py
#
# mistake vs test script checker
#
# checks/generates test cases for both when leet learner is necessary and when it is disabled via the leet-rule
#
# valid for both VVFF and QQNN
#
# symlinked from QQNN to VVFF
#

import os
import mytools as mt
import sys
from collections import defaultdict
import re
import i7

no_leet_checks = False

my_line = defaultdict(int)
text_needed = defaultdict(str)

need_mistake_test = defaultdict(bool)
got_mistake_test = defaultdict(bool)

need_leet_check = defaultdict(bool)
got_leet_check = defaultdict(bool)

needed_text = "Learner needle"
my_proj = i7.dir2proj(os.getcwd(), to_abbrev = True)

if not my_proj or my_proj == 'vv': my_proj = "vvff"

quote_col = 6

if my_proj == "qq":
    my_proj = "qqnn"
    needed_text = "sheep sheet"
    quote_col += 1

mist_file = i7.hdrfile(my_proj, 'mi')

max_count = 15

def err_print_and_bail():
    global err_found
    final_string = "{} total error{}".format(err_found, mt.plur(err_found)) if err_found else "SUCCESS! The mistake file and test file match."
    mt.print_and_warn(final_string)
    mt.postopen_files()

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
        if len(ary) != quote_col + 1:
            sys.exit("Bad number of tabs at line {}: {}.".format(line_count, line.strip()))
        for my_cmd in noquo(ary[0].lower()):
            if (ary[3] == '--') != (ary[4] == '--'):
                sys.exit("w1 and w2 entries conflict--both or neither should be blank.")
            need_mistake_test[my_cmd] = True
            my_line[my_cmd] = line_count
            need_leet_check[my_cmd] = ary[5] != '--'
            try:
                text_needed[my_cmd] = ('!' if ary[3] == '--' else '') + needed_text + "\n" + noquo_single(i7.a2q(ary[quote_col]))
            except:
                print("Bad range error at line {} (needed 7 columns, got {}): {}".format(line_count, len(ary), line.rstrip()))
                print('//'.join(ary))
                sys.exit()

cmd_count = 1
while cmd_count < len(sys.argv):
    arg = sys.argv[cmd_count]
    if arg == 'nl':
        no_leet_checks = True
    else:
        try:
            max_count = int(arg)
            cmd_count += 1
            continue
        except:
            sys.exit("Bad parameter {}.".format(arg))
    cmd_count += 1

okay_next_dup = False

in_mistakes = False
in_cs_check = False

rbr_file = "rbr-{}-thru.txt".format(my_proj)
next_cmd_pass = False

with open(rbr_file) as file:
    for (line_count, line) in enumerate(file, 1):
        if okay_next_dup:
            okay_next_dup = False
            continue
        if '@mis' in line: in_mistakes = True
        if '@cs' in line: in_cs_check = True
        if 'okdup' in line: okay_next_dup = True
        if line.startswith("#next-cmd-pass"):
            next_cmd_pass = True
            continue
        if not line.strip():
            in_mistakes = in_cs_check = False
            continue
        if not in_mistakes and not in_cs_check:
            if needed_text in line and not line.startswith(">"):
                print("Possible errant cluing message line {}: make sure an @mis is above it.".format(line_count))
            continue
        if not line.startswith(">"): continue
        if in_cs_check: continue
        line_cmd = re.sub("^> *", "", line.lower().strip())
        if line_cmd == 'undo' or line_cmd.startswith('cs'): continue
        if line_cmd not in need_mistake_test:
            if next_cmd_pass:
                next_cmd_pass = False
                continue
            print("Erroneous mistake command {} line {}: {}. Use #next-cmd-pass to flag this as okay.".format(rbr_file, line_count, line_cmd))
            mt.add_postopen_file_line(rbr_file, line_count)
        elif line_cmd in got_mistake_test:
            if line_cmd not in need_leet_check:
                print("Duplicate mistake try at {} line {}: {}. Use #next-cmd-pass to flag this as okay.".format(rbr_file, line_count, line_cmd))
                mt.add_postopen_file_line(rbr_file, line_count)
            elif need_leet_check[line_cmd] == False:
                print("Erroneous leet-check rule at {} line {}: {}. Use #next-cmd-pass to flag this as okay.".format(rbr_file, line_count, line_cmd))
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

if no_leet_checks:
    err_print_and_bail()

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

err_print_and_bail()
