#
# dno.py: reads in VVFF notes
#

from collections import defaultdict
import i7
import re
import os
import sys

note_dict = defaultdict(int)
already_done = defaultdict(int)
source_dupes = defaultdict(list)
dupes = 0
internal_dupes = 0

open_last = False
open_first = False

def usage():
    print("ol / of / lo / fo = open last or first duplicate in notes.txt.")
    exit()

def read_notes_file(j):
    global line_to_open
    global internal_dupes
    print("START INTERNAL CHECK FOR", j)
    with open("notes.txt") as file:
        for (line_count, line) in enumerate (file, 1):
            ll = line.strip().lower()
            if not ll: continue
            ll = re.sub(" *#.*", "", ll)
            lla = re.split(" *\/ *", ll)
            for q in lla:
                if q and q in note_dict.keys():
                    if q in already_done.keys():
                        if not line_to_open: line_to_open = line_count
                        internal_dupes += 1
                        print(q, "already in note_dict.keys at line", note_dict[q], "duplicated at line", line_count)
                    already_done[q] += 1
                    continue
                else: note_dict[q] = line_count
    print("END INTERNAL CHECK FOR", j)
    if internal_dupes: print(internal_dupes, "internal dupes.")
    else: print("NO INTERNAL DUPES! YAY!")

def read_source_files(j):
    global dupes
    global line_to_open
    print("CHECKING", j)
    for x in i7.i7f[j]:
        with open(x) as file:
            for (line_count, line) in enumerate (file, 1):
                for q in note_dict.keys():
                    if q in line.lower():
                        if not line_to_open: line_to_open = note_dict[q]
                        print("DUPLICATE <<{:s} line {:d}>>".format(q, note_dict[q]), "From <<{:s} line {:d}>> =\n    {:s}".format(os.path.basename(x), line_count, line.strip()))
                        source_dupes[q].append("{:s} L{:d}".format(os.path.basename(x), line_count))
                        dupes += 1


count = 1
while count < len(sys.argv):
    arg = sys.argv[count]
    if arg == 'ol' or arg == 'lo':
        open_last = True
        open_first = False
    elif arg == 'of' or arg == 'fo':
        open_last = False
        open_first = True
    else:
        usage()
    count += 1

read_notes_file("very-vile-fairy-file")
read_source_files("very-vile-fairy-file")

for j in sorted(source_dupes.keys()): print(j, "appears", len(source_dupes[j]), "extra times in the source:", '/'.join(source_dupes[j]))

print("Total duplicates:", dupes)
print("Total internal duplicates:", internal_dupes)

if open_last or open_first:
    u = list(set(source_dupes.keys()) | set(already_done.keys()))
    if open_last:
        u1 = min(u, key=lambda x: note_dict[x], reverse=True)
    else:
        u1 = max(u, key=lambda x: note_dict[x])
    i7.npo("notes.txt", note_dict[u1])
elif len(source_dupes.keys()) + len(already_done.keys()):
    print("Run -lo / -fo to open up the notes file at the first duplicate.")
