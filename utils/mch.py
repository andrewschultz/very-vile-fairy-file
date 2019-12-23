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

hunt_mistake_alpha = True
only_mistake_alpha = False
no_leet_checks = False

my_line = defaultdict(int)
text_needed = defaultdict(str)

need_mistake_test = defaultdict(bool)
got_mistake_test = defaultdict(bool)

need_leet_check = defaultdict(bool)
got_leet_check = defaultdict(bool)

look_leet_rules = defaultdict(bool)
look_mist_rules = defaultdict(bool)

in_leet_rules = defaultdict(bool)
in_mist_rules = defaultdict(bool)

needed_text = "Learner needle"
my_proj = i7.dir2proj(os.getcwd(), to_abbrev = True)

if not my_proj or my_proj == 'vv': my_proj = "vvff"

ignorable_commands = [ 'gonear', 'n', 's', 'e', 'w', 'u', 'd', 'z', 'undo', 'cs' ]

if my_proj == "qq":
    my_proj = "qqnn"
    needed_text = "sheep sheet"

mist_file = i7.hdrfile(my_proj, 'mi')

quote_col = i7.column_from_file(mist_file, "table of first check rhymes", "mist-txt")
leet_rule_col = i7.column_from_file(mist_file, "table of first check rhymes", "leet-rule")
magic_num_col = i7.column_from_file(mist_file, "table of first check rhymes", "magicnum")

max_count = 15

def whole_command(my_cmd):
    return re.sub("^> *", "", my_cmd.strip().lower())

def first_word(my_cmd):
    return re.sub("#.*", "", whole_command(my_cmd)).split(' ')[0]

def valid_leet_rule(x):
    return x != '--' and x != 'llp-trivial rule'

def the_rule(l):
    l = re.sub("^this is the *", "", l)
    return re.sub(" *:.*", "", l.strip())

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

cmd_count = 1
while cmd_count < len(sys.argv):
    arg = sys.argv[cmd_count]
    if arg == 'nl':
        no_leet_checks = True
    elif arg == 'nh' or arg == 'hn':
        hunt_mistake_alpha = False
        only_mistake_alpha = False
    elif arg == 'oh' or arg == 'ho':
        hunt_mistake_alpha = True
        only_mistake_alpha = True
    else:
        try:
            max_count = int(arg)
            cmd_count += 1
            continue
        except:
            sys.exit("Bad parameter {}.".format(arg))
    cmd_count += 1

in_table = ''

print("Opening", mist_file)
with open(mist_file) as file:
    for (line_count, line) in enumerate(file, 1):
        if not line.strip():
            in_table = ''
            continue
        if line.startswith("table of"):
            in_table = line.strip()
            #print("Opening", in_table, "line", line_count)
            continue
        if not in_table: continue
        if "\t\t" in line: sys.exit("Double tabs line {}".format(line_count))
        if '  ' in line or '\t' not in line:
            print("WARNING check line {} for spaces/lack of tabs.".format(line_count))
        if 'sheet spoilers' in in_table: continue
        ary = re.split("\t", line.strip())
        if "|" in ary[0]:
            mt.print_and_warn("Uh oh. We have a pipe instead of a slash for the topic {} in line {}.".format(ary[0], line_count))
        if '"' not in ary[0] or len(ary) == 1: continue
        try:
            if ary[1] == '--': sys.exit("Fatal error line {} has no mistake rule.".format(line_count))
        except:
            sys.exit("Oops, misread line {}: {}.".format(line_count, line.strip()))
        if ary[1] != '--': look_mist_rules[ary[1]] = True
        try:
            if valid_leet_rule(ary[leet_rule_col]):
                look_leet_rules[ary[leet_rule_col]] = True
        except:
            print("{} Line {} didn't have column {}: {}".format(in_table.upper(), line_count, leet_rule_col, ary))
        if len(ary) != quote_col + 1:
            print(ary)
            sys.exit("{} bad number of tabs (have {}, should be {}) at line {}: {}.".format(in_table.upper(), len(ary), quote_col + 1, line_count, line.strip()))
        for my_cmd in noquo(ary[0].lower()):
            need_mistake_test[my_cmd] = True
            my_line[my_cmd] = line_count
            need_leet_check[my_cmd] = valid_leet_rule(ary[leet_rule_col])
            try:
                text_needed[my_cmd] = ('!' if ary[3] == '--' else '') + needed_text + "\n" + noquo_single(i7.a2q(ary[quote_col]))
            except:
                print("Bad range error at line {} (needed 7 columns, got {}): {}".format(line_count, len(ary), line.rstrip()))
                print('//'.join(ary))
                sys.exit()

ever_mist = in_mist = ever_leet = in_leet = False

mist_alph_err = 0

if hunt_mistake_alpha:
    with open(mist_file) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith('section'): in_mist = in_leet = False
            if 'section mist-rules alphabetized' in line:
                ever_mist = True
                in_mist = True
            elif 'section leet-rules alphabetized' in line:
                ever_leet = True
                in_leet = True
            if in_mist:
                if line.startswith("this is the"):
                    in_mist_rules[the_rule(line)] = True
            if in_leet:
                if line.startswith("this is the"):
                    in_leet_rules[the_rule(line)] = True
        for x in sorted(look_mist_rules):
            if x not in in_mist_rules:
                if 'trivially true rule' in x: continue
                print("{} Need {} in the alpha mist rules.".format(mist_alph_err, x))
                mist_alph_err += 1
        for x in sorted(look_leet_rules):
            if x in look_mist_rules: continue
            if x not in in_leet_rules:
                mist_alph_err += 1
                print("{} Need {} in the alpha leet rules{}.".format(mist_alph_err, x, ', but it is in the mist rules' if x in in_mist_rules else ''))
    if not ever_mist: print("Did not find mist-rules alphabetized line.")
    if not ever_leet: print("Did not find leet-rules alphabetized line.")
    if not mist_alph_err:
        print("SUCCESS with mistake/leet classification")
    else:
        print(mist_alph_err, "error(s) found in mistake/leet classification.")
    if only_mistake_alpha: sys.exit()

okay_next_dup = False

in_mistakes = False
in_cs_check = False

rbr_file = "rbr-{}-thru.txt".format(my_proj)
next_cmd_pass = False
ignore_the_rest = False

with open(rbr_file) as file:
    for (line_count, line) in enumerate(file, 1):
        if okay_next_dup:
            okay_next_dup = False
            continue
        if '@mis' in line: in_mistakes = True
        if '@cs' in line: in_cs_check = True
        if 'okdup' in line: okay_next_dup = True
        if line.startswith("#ignore-the-rest"):
            if ignore_the_rest: print("WARNING superfluous ignore-the-rest at line", line_count)
            ignore_the_rest = True
            continue
        if line.startswith("#unignore-the-rest"):
            if not ignore_the_rest: print("WARNING superfluous unignore-the-rest at line", line_count)
            ignore_the_rest = False
            continue
        if line.startswith("#next-cmd-pass"):
            next_cmd_pass = True
            continue
        if not line.strip():
            ignore_the_rest = in_mistakes = in_cs_check = False
            continue
        if not in_mistakes and not in_cs_check:
            if needed_text in line and not line.startswith(">"):
                print("Possible errant cluing message line {}: make sure an @mis is above it.".format(line_count))
            continue
        if ignore_the_rest: continue
        if not line.startswith(">"): continue
        if first_word(line) in ignorable_commands: continue
        if in_cs_check: continue
        line_cmd = whole_command(line)
        if next_cmd_pass:
            next_cmd_pass = False
            continue
        if line_cmd not in need_mistake_test:
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
