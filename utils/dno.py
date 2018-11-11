#
# dno.py: reads in VVFF notes
#
# -e = edits so slashes have spaces
#

from collections import defaultdict
from shutil import copy
import i7
import re
import os
import sys

long_lines = defaultdict(int)
note_dict = defaultdict(int)
already_done = defaultdict(int)
source_dupes = defaultdict(list)
dupes = 0
uniq_dupes = 0
internal_dupes = 0
line_to_open = 0
space_check = 0

open_last = False
open_first = False
force_open = False
check_spaces = False
copy_rejigged = False

def usage():
    print("ol / of / lo / fo / l / f = open last or first duplicate in notes.txt. e = random.")
    print("cs / sc / s / c = check spaces in notes file.")
    print("e = forces open-notes file.")
    print("a = checks notes file for slashes without spaces before and after. You need ac / ca to copy back over.")
    exit()

def rejig_notes_file():
    got_dif = 0
    byte_delta = 0
    f = open("notes2.txt", "w")
    with open("notes.txt") as file:
        for (line_count, line) in enumerate (file, 1):
            ll = re.sub(" *\/ *", " / ", line)
            if ll != line:
                got_dif += 1
                byte_delta += abs(len(line) - len(ll))
            f.write(ll)
    f.close()
    if not got_dif:
        print("No differences. Deleting notes2.txt.")
    else:
        if copy_rejigged:
            copy("notes2.txt", "notes.txt")
        else:
            print("{:d} difference(s), {:d} byte-delta. -ac really copies over".format(got_dif, byte_delta))
            i7.wm("notes.txt", "notes2.txt")
    os.remove("notes2.txt")
    exit()

def read_notes_file(j):
    global line_to_open
    global internal_dupes
    global space_check
    blank_yet = False
    long_so_far = 0
    print("START INTERNAL CHECK FOR", j)
    with open("notes.txt") as file:
        for (line_count, line) in enumerate (file, 1):
            ll = line.strip().lower()
            if not ll: blank_yet = True
            if not ll or ll[0] == "#": continue
            ll = re.sub(" *#.*", "", ll)
            lla = re.split(" *\/ *", ll)
            if check_spaces and '#' not in line:
                flag_spaces = False
                for q in lla:
                    if q.count(" ") >= 3 and not blank_yet: flag_spaces = True
                if flag_spaces:
                    ld = "line-{:d}".format(line_count)
                    note_dict[ld] = long_lines[ld] = line_count
                    long_so_far += 1
                    print("Long line {:d} ({:d}):".format(line_count, long_so_far), line.strip()[:50] + ("" if len(line) < 50 else "..."), "has lots of spaces. Maybe use slashes or comments or put long ideas at the top.")
                    space_check += 1
            for q in lla:
                if q and q in note_dict.keys():
                    if q in already_done.keys():
                        if not line_to_open: line_to_open = line_count
                        internal_dupes += 1
                    else:
                        print(q, "already in note_dict.keys at line", note_dict[q], "duplicated at line", line_count)
                    already_done[q] += 1
                    continue
                else: note_dict[q] = line_count
    print("END INTERNAL CHECK FOR", j)
    if internal_dupes: print(internal_dupes, "internal dupes.")
    else: print("NO INTERNAL DUPES! YAY!")
    if not blank_yet: print("You may wish to put a blank line in notes.txt so spacing can be detected.")
    elif check_spaces:
        if space_check: print("Found", space_check, "places to check spaces.")
        else: print("Spacing all checked out.")

def read_source_files(j):
    global uniq_dupes
    global dupes
    global line_to_open
    uniqs = defaultdict(bool)
    print("CHECKING PROJECT", j)
    for x in i7.i7f[j]:
        print("CHECKING FILE", x)
        with open(x) as file:
            for (line_count, line) in enumerate (file, 1):
                for q in note_dict.keys():
                    if q in line.lower():
                        dupes += 1
                        if not line_to_open: line_to_open = note_dict[q]
                        if q not in uniqs.keys():
                            uniq_dupes += 1
                            print("DUPLICATE #{:3d}/{:3d} <<{:s} line {:d}>>".format(dupes, uniq_dupes, q, note_dict[q]), "From <<{:s} line {:d}>> =\n    {:s}".format(os.path.basename(x), line_count, line.strip()))
                        uniqs[q] = True
                        source_dupes[q].append("{:s} L{:d}".format(os.path.basename(x), line_count))


i7.go_proj("vvff")

count = 1

while count < len(sys.argv):
    arg = sys.argv[count].lower()
    if arg[0] == '-': arg = arg[1:]
    if arg == 'a' or arg == 'ac' or arg == 'ca':
        copy_rejigged = 'c' in arg
        rejig_notes_file()
        exit()
    if arg[0] == 'e':
        if arg == 'e': i7.npo("notes.txt")
        search_token = r'=={:s}'.format(arg[1:])
        with open("notes.txt") as file:
            for (line_count, line) in enumerate(file, 1):
                if re.search(search_token, line):
                    i7.npo("notes.txt", line_count)
        try:
            q = int(arg[1:])
            pluses = 0
            with open("notes.txt") as file:
                for (line_count, line) in enumerate(file, 1):
                    if re.search("==", line):
                        pluses += 1
                        if pluses == q:
                            print("Opening === line #", pluses)
                            i7.npo("notes.txt", line_count)
            print("Couldn't find === line # {:d}. There were only {:d}.".format(q, pluses))
        except:
            print("Couldn't find === line with", arg[1:])
        i7.npo("notes.txt")
    if arg == 'ol' or arg == 'lo' or arg == 'l':
        open_last = True
        open_first = False
    elif arg == 'cs' or arg == 'sc' or arg == 's' or arg == 'c':
        check_spaces = True
    elif arg == 'of' or arg == 'fo' or arg == 'f':
        open_last = False
        open_first = True
    elif arg == 'e':
        force_open = True
    else:
        usage()
    count += 1

read_notes_file("very-vile-fairy-file")
read_source_files("very-vile-fairy-file")

for j in sorted(source_dupes.keys()): print(j, "appears", len(source_dupes[j]), "extra times in the source:", '/'.join(source_dupes[j]))

if dupes + uniq_dupes + internal_dupes:
    print("Total duplicates:", dupes)
    print("Total unique duplicates:", uniq_dupes)
    print("Total internal duplicates:", internal_dupes)
else:
    print("Yay! Everything passed!")

if force_open and not open_last and not open_first:
    if random.randint(0, 2): open_last = True
    else: open_first = True
    print("Opening", "first" if open_first else open_last)

if open_last or open_first:
    u = list(set(source_dupes.keys()) | set(already_done.keys()) | set(long_lines.keys()))
    if len(u):
        if open_last:
            u1 = max(u, key=lambda x: note_dict[x])
        else:
            u1 = min(u, key=lambda x: note_dict[x])
        i7.npo("notes.txt", note_dict[u1])
    elif force_open:
        print("No duplicates. Opening notes file.")
        i7.npo("notes.txt")
    else:
        print("Nothing to open. Use -e to force opening.")
elif len(source_dupes.keys()) + len(already_done.keys()) + len(long_lines.keys()):
    print("Run -lo / -fo to open up the notes file at the first duplicate.")
