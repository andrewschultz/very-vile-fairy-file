# vmc.py
# VVFF mistake checker (for duplicates)

import re
import i7
from collections import defaultdict
import mytools as mt

mist_done = defaultdict(int)
mist_sec = defaultdict(str)

mi = i7.hdr('vv', 'mi')
errs_table = errs_todo = mist_table = mist_todo = mists = 0
total_errs = 0

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
                print("<{}>".format(mist_quote), x, "in line", line_count, "section", cur_sec, "is duplicated from", mist_done[x], "section", mist_sec[x] + ("/" + subsection if subsection else ""))
                mt.add_postopen_file_line(mi, line_count, rewrite = False)
                total_errs += 1
                if cur_sec == 'TO-DO':
                    errs_todo += 1
                else:
                    errs_table += 1
            else:
                mist_done[x] = line_count
                mist_sec[x] = cur_sec

print("Gauged", mists, "total mistakes,", mist_table, "in table and", mist_todo, "in todo.")

if not total_errs: print("Hooray! No mistakes!")
else:
    print("Duplicates:", errs_table, "in table and", errs_todo, "in todo.")

mt.postopen_files()