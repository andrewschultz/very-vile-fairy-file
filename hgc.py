# hgc.py
# homophone/homonym guess check
#

from collections import defaultdict
import os
import sys
import hom
import i7
import re
import mytools

vvm = i7.hdr("vv", "mi")

count = 0
cur_table = ""
hom_ignore = [ 'bark', 'me' ]

ignore_already_got = False
already_got = defaultdict(int)

def usage(msg = "General usage"):
    print("ia = ignore homonyms we already got, ni/in/nia/ian = don't ignore.")
    print(usage)
    exit()

cmd_count = 1

def comb_one_file(file_name, tables_needed, cols_needed = [0])
    tables_got = defaultdict(bool)
    for x in tables_needed: tables_got[x] = False
    bn = os.path.basename(file_name)
    with open(file_name) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("table of"):
                temp_table = re.sub(" *\[.*", "", line.strip())
                if temp_table in tables_got:
                    if tables_got[temp_table]:
                        print("WARNING duplicate table start", temp_table, bn, line_count
                    cur_table = temp_table
                    cur_table_start = line_count + 1
                    tables_got[temp_table] = True
                continue
            if not line.strip():
                cur_table = ""
            if not cur_table: continue
            if line_count == cur_table_start: continue # get rid of header row
            ary = line.split("\t")
            for col in cols_needed:
                hom_cand = ' '.join(ary[0].split('"')[1::2])
                a2 = hom_cand.split(" ")
                for q in a2:
                    if q in hom.hom_list:
                        if q in hom_ignore: continue
                        if q in already_got and ignore_already_got: continue
                        count += 1
                        print("{}: {}{} <{}> line {} in <{}> may need homonyms: {}.".format(count, "(already got) " if q in already_got else "", q, bn, line_count, cur_table, ", ".join(hom.hom_list[q])))
                        already_got[q] = line_count
                        mytools.add_postopen_file_line(file_name, line_count)
    print("Summary of stuff to replace:", ', '.join(sorted(already_got)))
    for x in tables_got:
        if not tables_got[x]: print("Did not find", x, "in", bn)

while cmd_count < len(sys.argv):
    arg = nohy(sys.argv[1:])
    if arg == 'ia': ignore_already_got = True
    elif arg == 'ni' or arg == 'in' or arg == 'nia' or arg == 'ian': ignore_already_got = False
    elif arg == '?': usage()
    else: usage("Bad argument {}".format(arg))
    cmd_count += 1

comb_one_file(src, ["table of verb checks"], [0, 1])
comb_one_file(vvm, ["table of mistake substitutions", "table of homonym rejections"], [0])

mytools.postopen_files()
