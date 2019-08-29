# vmc.py
# VVFF mistake checker (for duplicates)

import re
import i7
from collections import defaultdict

mist_done = defaultdict(int)
mist_sec = defaultdict(str)

mi = i7.hdr('vv', 'mi')
mists = 0

with open(mi) as file:
    header_next = False
    in_table = False
    cur_sec = "<BLANK>"
    for (line_count, line) in enumerate(file):
        if header_next:
            header_next = False
            continue
        if line.startswith("table of mistake substitutions"):
            cur_sec = "MAIN TABLE" if "continued" not in line else "EXT TABLE"
            header_next = True
            in_table = True
            continue
        if line.startswith("[stuff I haven't sorted yet"):
            cur_sec = "TO-DO"
            in_table = True
            header_next = False
            continue
        if line.startswith("#"): continue
        if not in_table: continue
        if not line.strip() or line.strip == ']':
            in_table = False
            cur_sec = "<BLANK>"
            continue
        mist_quote = line.strip().partition('\t')[0].lower().replace('"', '')
        mist_quote = re.sub(" *#.*", "", mist_quote)
        mists += 1
        # print(line_count, mists, mist_quote)
        if ' ' in mist_quote:
            my_stuff = mist_quote.split(' ')
            mist_array = ["{} {}".format(x, y) for x in my_stuff[0].split("/") for y in my_stuff[1].split("/")]
        else:
            mist_array = [mist_quote]
        for x in mist_array:
            if x in mist_done:
                print("<{}>".format(mist_quote), x, "in line", line_count, "section", cur_sec, "is duplicated from", mist_done[x], "section", mist_sec[x])
            else:
                mist_done[x] = line_count
                mist_sec[x] = cur_sec