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

def read_notes_file(j):
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
    print("CHECKING", j)
    for x in i7.i7f[j]:
        with open(x) as file:
            for (line_count, line) in enumerate (file, 1):
                for q in note_dict.keys():
                    if q in line.lower():
                        print("DUPLICATE <<{:s} line {:d}>>".format(q, note_dict[q]), "From <<{:s} line {:d}>> =\n    {:s}".format(os.path.basename(x), line_count, line.strip()))
                        source_dupes[q].append("{:s} L{:d}".format(os.path.basename(x), line_count))
                        dupes += 1

read_notes_file("very-vile-fairy-file")
read_source_files("very-vile-fairy-file")

print("Total duplicates:", dupes)
print("Total internal duplicates:", internal_dupes)

for j in sorted(source_dupes.keys()): print(j, "appears", len(source_dupes[j]), "extra times in the source:", '/'.join(source_dupes[j]))