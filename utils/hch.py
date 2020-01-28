# hch.py
# homonym checker

import sys
import re
import i7
import mytools as mt
from collections import defaultdict

test_notes = defaultdict(str)

basic_to_check = defaultdict(int)
close_to_check = defaultdict(int)

def is_hom_table(x):
    xl = x.lower()
    if re.search("^table of (room|thing) homonyms", x):
        return True
    if x.startswith("table of verb checks"):
        return True
    return False

def name_to_row(tabname): # this could be in a dict but there are so few arguments. Also, all values are 2 but just in case a table changes...
    if tabname == 'room': return 2
    if tabname == 'thing': return 2
    if tabname == 'verb' : return 2
    return -1

def after_to(rule_name):
    tary = re.sub(" rule$", "", rule_name).split("-")
    xx = tary.index("to")
    test_subcases = tary[xx+1:]
    return test_subcases

def shake_out_unused(my_dict, descrip):
    retval = 0
    for x in my_dict:
        if my_dict[x] == -1:
            retval += 1
            left = "#homonyms {} test {}".format(descrip, x)
            right = "{:02d}/{:02d} {}".format(retval, retval + count, test_notes[x])
            print("{:50s}{}".format(left, right))
    return retval

def check_any_or_dupe(my_line, my_dict, search_string, line_count):
    if not my_line.startswith("#" + search_string + " "): return False
    my_test = re.sub(".*?test +", "", my_line.strip())
    if my_test not in my_dict:
        print("Undefined test case {} for <{}> at line {} in {}.".format(my_test, search_string, line_count, rbr))
        mt.add_postopen_file_line(rbr, line_count)
        return True
    elif ' retest' in search_string and my_dict[my_test] == -1:
        print("Bogus duplicate test case {} for <{}> at line {} in {}.".format(my_test, search_string, line_count, rbr))
        mt.add_postopen_file_line(rbr, line_count, priority=9)
        return True
    elif ' test' in search_string and my_dict[my_test] > -1:
        print("Duplicate test case {} for <{}> at line {} in {}.".format(my_test, search_string, line_count, rbr))
        mt.add_postopen_file_line(rbr, line_count, priority=9)
        return True
    return False

f = i7.hdr('vv', 'ta')

create_bookmarks = False
in_table = False
skip_line = False
table_name = "<NONE>"
descriptor = "<UNDEFINED>"
descriptor = 'close' if table_name == 'verb' else 'basic'

with open(f) as file:
    for (line_count, line) in enumerate (file, 1):
        if is_hom_table(line):
            in_table = True
            table_name = line.split(' ')[2]
            match_row = name_to_row(table_name)
            skip_line = True
            continue
        if skip_line:
            skip_line = False
            continue
        if not in_table: continue
        if not line.strip():
            in_table = False
            table_name = "<NONE>"
            continue
        lary = line.lower().strip().split("\t")
        if table_name == 'verb':
            if lary[match_row] == '--' or not lary[match_row]:
                continue
        if table_name == 'verb':
            test_case = "{}-{}".format(table_name, re.sub(" .*", "", lary[10][3:]))
            if "|" in lary[2]:
                print("Replace | with / at line", line_count, "of", f)
            test_subcases = lary[2].replace('"', '').strip().split("/")
        else:
            test_case = "{}-{}".format(table_name, lary[0])
            if lary[2] == '--':
                test_subcases = after_to(lary[1])
            else:
                test_subcases = lary[match_row].replace('"', '').strip().split("/")
        if create_bookmarks:
            #print("#homonym test {}".format(test_case))
            pass
        else:
            if table_name == 'verb':
                for q in test_subcases:
                    close_to_check[test_case + "-" + q] = -1
                    test_notes[test_case + "-" + q] = q
            else:
                for q in test_subcases:
                    basic_to_check[test_case + "-" + q] = -1
                    test_notes[test_case + "-" + q] = q

rbr = i7.rbr('vv')

with open(rbr) as file:
    for (line_count, line) in enumerate (file, 1):
        if not line.startswith("#homonym"): next
        check_any_or_dupe(line, close_to_check, "homonyms close test", line_count)
        if check_any_or_dupe(line, close_to_check, "homonyms close retest", line_count): continue
        check_any_or_dupe(line, basic_to_check, "homonyms basic test", line_count)
        if check_any_or_dupe(line, basic_to_check, "homonyms basic retest", line_count): continue
        if line.startswith("#homonyms "):
            my_test = re.sub("^.*? (re)?test ", "", line.strip())
            if 'homonyms basic' in line:
                basic_to_check[my_test] = line_count
            elif 'homonyms close' in line:
                close_to_check[my_test] = line_count
            else:
                print("Bad homonym test {} at line {}".format(my_test, line_count))

#print(basic_to_check)
#print(close_to_check)

count = 0

count += shake_out_unused(basic_to_check, "basic")
count += shake_out_unused(close_to_check, "close")

if not count: print("Everything worked! Hooray!")

mt.postopen_files()