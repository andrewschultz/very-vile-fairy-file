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

while cmd_count < len(sys.argv):
    arg = nohy(sys.argv[1:])
    if arg == 'ia': ignore_already_got = True
    elif arg == 'ni' or arg == 'in' or arg == 'nia' or arg == 'ian': ignore_already_got = False
    elif arg == '?': usage()
    else: usage("Bad argument {}".format(arg))
    cmd_count += 1

with open(vvm) as file:
    bn = os.path.basename(vvm)
    for (line_count, line) in enumerate(file, 1):
        if line.startswith("table of"):
            cur_table = re.sub(" *\[.*", "", line.strip())
            cur_table_start = line_count + 1
            continue
        if not line.strip():
            cur_table = ""
        if not cur_table: continue
        if line_count == cur_table_start: continue # get rid of header row
        ary = line.split("\t")
        hom_cand = ' '.join(ary[0].split('"')[1::2])
        a2 = hom_cand.split(" ")
        for q in a2:
            if q in hom.hom_list:
                if q in hom_ignore: continue
                if q in already_got and ignore_already_got: continue
                count += 1
                print("{}: {}{} <{}> line {} in <{}> may need homonyms: {}.".format(count, "(already got) " if q in already_got else "", q, bn, line_count, cur_table, ", ".join(hom.hom_list[q])))
                already_got[q] = line_count
                mytools.add_postopen_file_line(vvm, line_count)

print("Summary of stuff to replace:", ', '.join(sorted(already_got)))

mytools.postopen_files()
