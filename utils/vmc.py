# vmc.py
# VVFF mistake checker (for duplicates)
# also can open a specific section by room or inform you if it is there

import sys
import re
import i7
from collections import defaultdict
import mytools as mt

mist_done = defaultdict(int)
mist_sec = defaultdict(str)

my_proj = i7.dir2proj(to_abbrev=True)
if my_proj != 'vv' and my_proj != 'qq':
    sys.exit("You need to run this from the VVFF or QQNN source directory.")


mi = i7.hdr(my_proj, 'mi')
errs_table = errs_todo = mist_table = mist_todo = mists = 0
total_errs = 0

def search_for_opening(search_string, look_alphabetical = True, bail_on_misorder = True):
    cur_index = ""
    where_if_nothing = 0
    actual_search_string = re.sub(".*?\?", "", search_string)
    actual_search_string = re.sub("\\b", "", actual_search_string)
    with open(mi) as file:
        for (line_count, line) in enumerate(file, 1):
            if '[start ' in line:
                this_index = re.sub(".*\[start ", "", line.lower().strip())
                print(line.strip())
                print(this_index, "vs", cur_index)
                if this_index < cur_index:
                    if look_alphabetical:
                        print("OUT OF ORDER INDEX {} vs {} at line {}.".format(this_index, cur_index, line_count))
                if look_alphabetical and this_index > actual_search_string and bail_on_misorder:
                    print("Looking alphabetically, we overshot {} with {}.".format(actual_search_string, this_index))
                    i7.npo(mi, line_count - 1)
                    exit()
                cur_index = this_index
            if 'start' in line: print(line.strip())
            if re.search(search_string, line, re.IGNORECASE):
                print("Got", search_string, "in line", line_count)
                i7.npo(mi, line_count)
                exit()
    print("Found nothing to open.")
    i7.npo(mi, where_if_nothing)
    exit()

with open(mi) as file:
    header_next = False
    in_table = False
    cur_sec = "<BLANK>"
    subsection = "<INTRO>"
    for (line_count, line) in enumerate(file, 1):
        if header_next:
            header_next = False
            continue
        if line.startswith("table of mistake substitutions"):
            cur_sec = "MAIN TABLE" if "continued" not in line else "EXT TABLE"
            header_next = True
            in_table = True
            subsection = ""
            continue
        if line.startswith("[stuff I haven't sorted yet"):
            cur_sec = "TO-DO"
            in_table = True
            header_next = False
            continue
        if line.startswith("#"):
            subsection = re.sub("^#*", "", line.lower().strip())
            continue
        if not in_table: continue
        if "[start" in line:
            subsection = re.sub(".*\[start (of )?", "", line.strip())
        if not line.strip() or line.strip == ']':
            in_table = False
            cur_sec = "<BLANK>"
            continue
        mist_quote = line.strip().partition('\t')[0].lower().replace('"', '')
        mist_quote = re.sub(" *#.*", "", mist_quote)
        mists += 1
        if cur_sec == 'TO-DO':
            mist_todo += 1
        else:
            mist_table += 1
        # print(line_count, mists, mist_quote)
        if ' ' in mist_quote:
            my_stuff = mist_quote.split(' ')
            mist_array = ["{} {}".format(x, y) for x in my_stuff[0].split("/") for y in my_stuff[1].split("/")]
        else:
            mist_array = [mist_quote]
        for x in mist_array:
            if x in mist_done:
                print("<{}>".format(mist_quote), x, "in line", line_count, "section", cur_sec + ("/" + subsection if subsection else "") , "is duplicated from", mist_done[x], "section", mist_sec[x])
                mt.add_postopen_file_line(mi, line_count, rewrite = False)
                total_errs += 1
                if cur_sec == 'TO-DO':
                    errs_todo += 1
                else:
                    errs_table += 1
            else:
                mist_done[x] = line_count
                mist_sec[x] = cur_sec + ("/" + subsection if subsection else "")

cmd_count = 1
while cmd_count < len(sys.argv):
    arg = mt.nohy(sys.argv[cmd_count])
    if arg[:2] == 's:':
        search_for_opening(r'\[start (of )?{}\b'.format(arg[2:]))
        search_for_opening(r'\[start (of )? {}\b'.format(arg[2:]))
        exit()
    cmd_count += 1

print("Gauged", mists, "total good guesses,", mist_table, "in table and", mist_todo, "in todo.")

if not total_errs: print("Hooray! No mistakes in the, um, mistakes!")
else:
    print("Duplicates:", errs_table, "in table and", errs_todo, "in todo.")

mt.postopen_files()