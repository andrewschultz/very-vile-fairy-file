# hch.py
# homonym checker

import sys
import re
import i7
import mytools as mt
from collections import defaultdict

to_check = defaultdict(int)

def is_hom_table(x):
    if re.search("^table of (room|thing) homonyms", x.lower()):
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
            print("#homonym test {}".format(test_case))
        else:
            to_check[test_case] = -1

if create_bookmarks:
    sys.exit()

rbr = i7.rbr('vv')

with open(rbr) as file:
    for (line_count, line) in enumerate (file, 1):
        if line.startswith("#homonym retest "):
            my_test = re.sub("^.*? retest ", "", line.strip())
            if my_test not in to_check:
                print("Wack test case {} at line {} in {}.".format(my_test, line_count, rbr))
                mt.add_postopen_file_line(rbr, line_count)
            elif to_check[my_test] == -1:
                print("Bogus duplicate test case {} at line {} in {}.".format(my_test, line_count, rbr))
                mt.add_postopen_file_line(rbr, line_count, priority=9)
        if line.startswith("#homonym test "):
            my_test = re.sub("^.*? test ", "", line.strip())
            if my_test not in to_check:
                print("Wack test case {} at line {} in {}.".format(my_test, line_count, rbr))
                mt.add_postopen_file_line(rbr, line_count)
            elif to_check[my_test] > -1:
                print("Duplicate test case {} at line {} in {}.".format(my_test, line_count, rbr))
                mt.add_postopen_file_line(rbr, line_count, priority=9)
            else:
                to_check[my_test] = line_count

count = 0

for x in to_check:
    if to_check[x] == -1:
        count += 1
        print("#homonym test {} {} needed.".format(x, count))

mt.postopen_files()