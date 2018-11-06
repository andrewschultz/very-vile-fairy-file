#
# vvsp.py: checks out spoonerism/rhyme crossovers
#

from collections import defaultdict
import re
import i7

note_dict = defaultdict(int)

def read_notes_file(j):
    global internal_crossovers
    print("START INTERNAL CHECK FOR", j)
    with open("notes.txt") as file:
        for (line_count, line) in enumerate (file, 1):
            ll = line.strip().lower()
            if not ll: continue
            if "/" not in ll: continue
            ll = re.sub(" *#.*", "", ll)
            lla = re.split(" *\/ *", ll)
            w1 = []
            w2 = []
            for q in lla:
                q2 = q.split(" ")
                if len(q2) == 2:
                    w1.append(q2[0])
                    w2.append(q2[1])
            for w1a in w1:
                for w2a in w2:
                    mys = "{:s} {:s}".format(w1a, w2a)
                    note_dict[mys] = line_count

def read_source_files(j):
    global crossovers
    print("CHECKING", j)
    for x in i7.i7f[j]:
        with open(x) as file:
            for (line_count, line) in enumerate (file, 1):
                for q in note_dict.keys():
                    if q in line.lower():
                        print("CROSSOVER <<{:s} line {:d}>>".format(q, note_dict[q]), "From <<{:s} line {:d}>> =\n    {:s}".format(os.path.basename(x), line_count, line.strip()))
                        crossovers += 1

crossovers = 0
read_notes_file("very-vile-fairy-file")
read_source_files("tragic-mix")

print("Total possible ideas:", len(note_dict.keys()))
print("Total crossovers with TM:", crossovers)
