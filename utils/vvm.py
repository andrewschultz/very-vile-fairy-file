#
# vvm.py
#
# very vile fairy file mistake guesser
#

from mytools import nohy
import sys
import os
import re
import i7
from collections import defaultdict

debug = False
add_and_verify = True

os.chdir(i7.sdir("vv"))
mistake_cfg = os.path.join(i7.sdir("vv"), "vvm.txt")
source_cfg = os.path.join(i7.sdir("vv"), "vvs.txt")
my_src = i7.src("vv")
mistake_file = i7.hdr("vvff", "mi")
table_file = i7.hdr("vvff", "ta")

ignores = defaultdict(bool)
should_be = defaultdict(str)
found_yet = defaultdict(bool)
file_open_after = defaultdict(int)
verbs = defaultdict(bool)
got_yet = defaultdict(bool)

def usage(hdr="GENERAL USAGE"):
    print("=" * 20 + hdr)
    print("a = add and verify, na/an = don't add and verify")
    print("e/ec/ce = edit config file")
    print("es/se = edit source file")
    exit()

def read_rhymes_table():
    skip_next = False
    in_table = False
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("table of verb checks"):
                in_table = True
                skip_next = True
            if skip_next:
                skip_next = False
                continue
            if in_table and not line.strip():
                in_table = False
                continue
            if not in_table: continue
            tary = line.lower().strip().split("\t")
            my_cmd = re.sub("^vr-", "", tary[6]).replace("-", " ")
            my_cmd = re.sub(" rule.*", "", my_cmd)
            is_opt = (tary[3] == 'false')
            verbs[my_cmd] = is_opt
            got_yet[my_cmd] = False

def learner_shift(from_words, to_words):
    from_words = re.sub("[^a-z ]", "", from_words, 0, re.IGNORECASE)
    extra_letters = equal_letters = fewer_letters = 0
    fw = from_words.split(" ")
    tw = to_words.split(" ")
    for a in range(0, len(fw)):
        b = a % 2
        lf = len(fw[a])
        lt = len(tw[b])
        extra_letters += (lf < lt)
        equal_letters += (lf == lt)
        fewer_letters += (lf > lt)
    if debug: print(from_words, "/", to_words, "equal", equal_letters, "extra", extra_letters, "fewer", fewer_letters)
    if not extra_letters and not fewer_letters: return "leteq"
    if extra_letters and fewer_letters: return "letboth"
    if extra_letters and equal_letters: return "partplus"
    if extra_letters and not equal_letters: return "letplus"
    if fewer_letters and equal_letters: return "partminus"
    if fewer_letters and not equal_letters: return "letminus"
    return "unknown"

def first_understands(l):
    preface = re.sub(" *as a mistake.*", "", l.lower().strip())
    ret_val = preface.split("\"")[1::2]
    return ret_val

def check_source_clues():
    ignores.clear()
    should_be.clear()
    found_yet.clear()
    read_rhyme_cfg(source_cfg)
    source_files = [ my_src, table_file ]
    for q in source_files:
        with open(q) as file:
            for (line_count, line) in enumerate(file, 1):
                ll = line.lower().strip().replace(",", "").replace(".", "")
                if "\"" not in ll: continue
                need_valid_leet = "leetclue" in ll
                for x in should_be:
                    if x in ll:
                        my_shift = learner_shift(x, should_be[x])
                        if my_shift not in line:
                            print("We need to {0} [leetclue of {1}] to line {2}: {3}".format("REPLACE" if "leetclue" in line else "ADD", my_shift, line_count, line[:50]))
                            if q not in file_open_after:
                                file_open_after[q] = line_count
                                print(q, line_count)
                        if found_yet[x]: print("DUPLICATE find", x, "at line", line_count)
                        found_yet[x] = True
    r = sorted([x for x in found_yet if not found_yet[x]])
    if len(r): print("NOT FOUND YET:", ', '.join(r))
    else: print("EVERYTHING WAS FOUND!")

def read_mistake_file():
    read_rhyme_cfg(mistake_cfg)
    need_add = 0
    cfg_needed = 0
    unnecc = 0
    last_error_room = ""
    this_error_room = ""
    add_leetclue = defaultdict(bool)
    out_file = open(i7.temp_hdr, "w")
    with open(mistake_file) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("chapter"):
                if not line.lower().strip().endswith("mistakes"):
                    print("TRIVIAL ERROR need chapter...mistakes format for", line.strip())
                this_error_room = line.strip().lower()[8:]
            if not line.startswith("understand \""):
                out_file.write(line)
                continue
            unds = first_understands(line)
            line_replace = line
            for u in unds:
                if u not in should_be and u not in ignores:
                    if this_error_room != last_error_room:
                        last_error_room = this_error_room
                        print("========", this_error_room)
                    cfg_needed += 1
                    print(cfg_needed, "Need cfg entry for", u, "at line", line_count, "    NOTE: we already have the leetclue value." if "leetclue" in line else "")
                    if "leetclue" in line:
                        add_leetclue[u] = True
                    continue
                if found_yet[u]:
                    print("WARNING duplicate", u, "line", line_count)
                found_yet[u] = True
                if u in ignores:
                    if "leetclue" in u:
                        if this_error_room != last_error_room:
                            last_error_room = this_error_room
                            print("========", this_error_room)
                        unnecc += 1
                        print(line_count, "has unnecessary leetclue")
                    continue
                temp = learner_shift(u, should_be[u])
                leet_to_add = "leetclue of {0}".format(temp)
                if leet_to_add not in line:
                    need_add += 1
                    print("rooms", this_error_room, last_error_room)
                    if this_error_room != last_error_room:
                        last_error_room = this_error_room
                        print("========", this_error_room)
                    print(need_add, "Line", line_count, ":", u, "~", should_be[u], "... needs you to {0}".format("FIX ERRONEOUS READING TO" if "leetclue" in line else "ADD READING"), leet_to_add)
                    if mistake_file not in file_open_after:
                        file_open_after[mistake_file] = line_count
                    if leet_to_add not in line_replace:
                        line_prev = line_replace
                        line_replace = re.sub(r"\"\)", "[{0}]\")".format(leet_to_add), line_replace, 1, re.IGNORECASE)
                        if line_replace == line_prev:
                            print("    **** failed to add {0} at line {1}.".format(leet_to_add, line_count))
            out_file.write(line_replace)
    out_file.close()
    if add_and_verify and need_add:
        i7.wm(mistake_file, i7.tmp_hdr)
    os.remove(i7.tmp_hdr)
    print("Error summary: {0} cfg needed, {1} need to add leetclue, {2} excess leetclue.".format(cfg_needed, need_add, unnecc))
    if len(add_leetclue):
        print(len(add_leetclue), "Leetclues to add to vvm.txt:", ", ".join(sorted(add_leetclue)))

def read_rhyme_cfg(cfg_to_read):
    with open(cfg_to_read) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("#"): continue
            if line.startswith(";"): break
            if "=" not in line:
                print("Line", line_count, "should have an equals sign in it.")
                continue
            lary = line.lower().strip().split("=")
            from_ary = lary[0].split(",")
            for f in from_ary:
                if lary[1] == 'x':
                    ignores[f] = True
                else:
                    should_be[f] = lary[1]
                found_yet[f] = False

def cht_change(my_line):
    mll = my_line.lower()
    if "now cht" in mll: return True
    if mll.startswith("\t"): return False
    if "cht of" in mll: return True
    return False

def parse_learner_line(l, lc):
    ll = l.lower().strip()
    what_adjusted_to = re.sub(".*-> *(.*?)\].*", r'\1', ll)
    if "[->" in l:
        what_to_adj = re.sub(".*cht of *", "", ll)
        what_to_adj = re.sub(" +is.*", "", what_to_adj)
    else:
        what_to_adj = re.sub(".*\[(.*?) *->.*", r'\1', ll)
    if debug: print("What to adjust:", what_to_adj, "/", "What adjusted to:", what_adjusted_to)
    if got_yet[what_adjusted_to]:
        print("Potential duplicate for", what_to_adj, "->", what_adjusted_to, "at line", lc)
    got_yet[what_adjusted_to] = True
    return (what_to_adj, what_adjusted_to)

def check_for_cht():
    cht_to_replace = 0
    cht_count = 0
    need_arrow = 0
    with open(my_src) as file:
        for (line_count, line) in enumerate(file, 1):
            if "cht is" in line.lower():
                cht_to_replace += 1
                cht_count += 1
                print("'cht is' needs 'cht of * is' at line {0} (#{1})".format(line_count, cht_count))
                if my_src not in file_open_after:
                    file_open_after[my_src] = line_count
                continue
            if cht_change(line):
                if not re.search("\[([^\]])*->([^\]])*\]", line):
                    if 'is phbt' in line or 'is usually phbt' in line: continue # phbt means disabling things, so we pass on that, or default definitions
                # if not re.search("\[([^\]])*->(^[^\]])*\]", line):
                    need_arrow += 1
                    print(need_arrow, "Need [->] at line", line_count, line.strip())
                    if my_src not in file_open_after:
                        file_open_after[my_src] = line_count
                    continue
                (my_from, my_to) = parse_learner_line(line, line_count)
                settings_needed = learner_shift(my_from, my_to)
                if settings_needed in line: continue
                print(line_count, "Need", settings_needed, "have", my_from, "->", my_to, "for", line.strip(), "REPLACE" if 'cht' in line else "ADD")
                # print(line_count, line.strip())
                if my_src not in file_open_after:
                    file_open_after[my_src] = line_count
                continue
    if cht_count: print(cht_count, "total cht-is constructions to fix.")
    else: print("Woohoo! No cht-is bugs in the main source.")

cmd_count = 1
while cmd_count < len(sys.argv):
    arg = nohy(sys.argv[cmd_count])
    if arg == 'a':
        add_and_verify = True
    elif arg == 'd':
        debug = True
    elif arg == 'na' or arg == 'an':
        add_and_verify = False
    elif arg == 'e' or arg == 'ec' or arg == 'ce':
        i7.open_source_config()
        exit()
    elif arg == 'es' or arg == 'se':
        i7.open_source()
        exit()
    else:
        usage()
    cmd_count += 1

read_rhymes_table()

read_mistake_file()
check_source_clues()

check_for_cht()

need_adj = 0

for x in sorted(verbs):
    if got_yet[x]: continue
    print("Didn't have any adjustments for {}.".format(x))
    need_adj += 1

if need_adj: print("Total potential adjustments needed = {}.".format(need_adj))

if len(file_open_after):
    for x in file_open_after:
        i7.npo(x, file_open_after[x], bail=False)
    exit()
