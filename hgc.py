# hgc.py
# homophone/homonym guess check
#

from collections import defaultdict
import os
import sys
import hom
import i7
import re
import mytools as mt

comb_source_files = False
comb_text_files = False

my_proj = i7.dir2proj(to_abbrev=True)

hom_ignore = defaultdict(int)

src = i7.src(my_proj)
vvt = i7.hdr(my_proj, "ta")
vvm = i7.hdr(my_proj, "mi")

count = 0

config_file = "hgc.txt"
object_text_file = "vv-things-list.txt"

ignore_already_got = False
already_got = defaultdict(int)

def read_ignores():
    with open(config_file) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith(";"): break
            if line.startswith("#"): continue
            ary = line.lower().strip().split(",")
            for q in ary:
                if q in hom_ignore:
                    print("Duplicate word to ignore {} at line {}.".format(q, line_count))
                    mt.add_postopen_file("hgc.txt", line_count)
                hom_ignore[q] = True

def usage(msg = "General usage"):
    print(msg)
    print("=" * 50)
    print("ia = ignore homonyms we already got, ni/in/nia/ian = don't ignore.")
    print("r=room homonyms, t=thing homonyms, b=both.")
    exit()

cmd_count = 1

def comb_text(x):
    print("##hgc.py reading", x)
    with open(x) as file:
        for (line_count, line) in enumerate(file, 1):
            if q.startswith(";"): break
            if q.startswith("#"): continue
            q = line.lower().strip().split(' ')
            for r in q:
                if r in hom.hom_list:
                    print(line_count, line.lower().strip(), ":", r, "~=", hom.hom_list[r])

def comb_source(file_name, tables_needed, cols_needed = [0]):
    count = 0
    cur_table = ""
    tables_got = defaultdict(bool)
    for x in tables_needed: tables_got[x] = False
    bn = os.path.basename(file_name)
    with open(file_name) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("table of"):
                temp_table = re.sub(" *\[.*", "", line.strip())
                if (not len(tables_needed)) or temp_table in tables_got:
                    if tables_got[temp_table]:
                        print("WARNING duplicate table start", temp_table, bn, line_count)
                    cur_table = temp_table
                    cur_table_start = line_count + 1
                    tables_got[temp_table] = True
                continue
            if not line.strip():
                cur_table = ""
            if not cur_table: continue
            if line_count == cur_table_start: continue # get rid of header row
            ary = line.split("\t")
            err_list = []
            for col in cols_needed:
                hom_cand = ' '.join(ary[col].split('"')[1::2])
                a2 = hom_cand.split(" ")
                hom_got = []
                if '"' in ary[2]:
                    hom_got = ary[2][1:-1].split("|")
                for q in a2:
                    if q in hom.hom_list:
                        if q in hom_ignore: continue
                        if q in already_got and ignore_already_got: continue
                        need_hom = False
                        for x in hom.hom_list[q]:
                            if x in hom_got or x in hom_ignore: continue
                            need_hom = True
                            err_list.append(x)
                        if need_hom:
                            count += 1
                            print("{}: {}{} <{}> line {} col {} in <{}>/{} may need homophone: {}.".format(count, "(already got) " if q in already_got else "", q, bn, line_count, col, cur_table, ary[col], ", ".join(err_list)))
                            already_got[q] = line_count
                            mt.add_postopen_file_line(file_name, line_count)
    if len(already_got):
        print("Summary of stuff to replace in {}: {}.", ', '.format(bn, join(sorted(already_got))))
    else:
        print("Nothing to replace in", bn)
    for x in tables_got:
        if not tables_got[x]: print("Did not find", x, "in", bn)

homs = []
tried_hom = False

while cmd_count < len(sys.argv):
    arg = mt.nohy(sys.argv[cmd_count])
    if arg == 'ia': ignore_already_got = True
    elif arg == 'ni' or arg == 'in' or arg == 'nia' or arg == 'ian': ignore_already_got = False
    elif arg == '?': usage()
    elif ',' in arg or len(arg) > 2:
        tary = arg.split(",")
        for t in tary:
            homs.extend(list(hom.hom_list[t]))
        tried_hom = True
    elif arg == 'b':
        comb_source_files = True
        comb_text_files = True
    elif arg == 't':
        comb_source_files = False
        comb_text_files = True
    elif arg == 'r':
        comb_source_files = True
        comb_text_files = False
    elif arg == 'er' or arg == 're':
        os.system(config_file)
    elif arg == 'et' or arg == 'te':
        os.system(object_text_file)
    else: usage("Bad argument {}".format(arg))
    cmd_count += 1

if not comb_source_files and not comb_text_files:
    sys.exit("You need to specify r for room, t for things, or b for both.")

if tried_hom:
    if len(homs):
        print("Homophones:", ', '.join(homs))
    else:
        print("No homophones found.")
    sys.exit()

read_ignores()

if comb_source_files:
    comb_source(vvt, ["table of verb checks"], [0, 1])
    comb_source(vvm, ["table of mistake substitutions", "table of homonym rejections"], [0])

if comb_text_files:
    comb_text(object_text_file) # this is the list of things

mt.postopen_files()
