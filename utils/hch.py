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

def name_to_row(tabname): # this could be in a dict but there are so few arguments
    if tabname == 'room': return 2
    if tabname == 'thing': return 1
    if tabname == 'verb' : return 2
    return -1

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
        lary = line.lower().split("\t")
        test_case = "{}-{}".format(table_name, lary[0])
        if create_bookmarks:
            #print("#homonym test {}".format(test_case))
            pass
        else:
            basic_to_check[test_case] = -1
            test_notes[test_case] = lary[match_row].replace('"', '').strip()

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

for x in basic_to_check:
    if basic_to_check[x] == -1:
        count += 1
        print("#homonym test {} {} needed: {}.".format(x, count, test_notes[x]))

mt.postopen_files()