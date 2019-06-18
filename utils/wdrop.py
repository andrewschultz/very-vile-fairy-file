#
# wdrop.py
#
# Very Vile Fairy File specific
#
# this drops in the new walkthroughs created after rbr.py wbase.txt forks the min- and max- point walkthroughs.
#
# Note that I meddle with the Github repo files. The fils in inform/source have
#

from collections import defaultdict
import os
import re
import i7
import sys
import stat
import mytools as mt

insert_point = defaultdict(str)

max_full_score = 0
min_full_score = 0

wri_dir = i7.gh_src("vv", give_source = False)
wri_loc = i7.sdir("vv")

out_read_only = True
delete_after = False #It's ok to have this, since we don't copy over the pre-files to the source control directory
verbose = True

open_last_err = True

def usage(cmd="USAGE LIST"):
    print(cmd)
    print("=" * 50)
    print("-d/-da = delete after, -nd/-dn = don't")
    print("-v = verbose")
    exit()

def zap_it(base):
    print("Relinking", base)
    os.system("attrib -r {:s}".format(base))
    os.system("erase {:s}".format(base))
    os.system("mklink {:s} {:s}".format(os.path.join(wri_loc, base), os.path.join(wri_dir, base)))
    os.system("attrib +r {:s}".format(base))

def relink():
    zap_it("walkthrough.txt")
    zap_it("walkthrough-full.txt")
    exit()

def first_line(txt):
    temp = txt.split("\n")
    for q in temp:
        if q.startswith(">"):
            q2 = q
            q = re.sub(" *\(.*", "", q)
            q = re.sub("^> *", "", q)
            return q
    return ""

def get_first_num(txt):
    temp = re.sub(".*? -?([0-9]+).*", r'\1', txt)
    try:
        return int(temp)
    except:
        print("WARNING no number found in line string {:s}. Returning 0.".format(txt.strip()))

def new_points(my_line, my_score, end_points = False, max_num = 0):
    if max_num:
        if re.search(r'\(x-([0-9]+)\)', my_line):
            return re.sub(r'\(x-([0-9]+)\)', lambda x:"(" + str(max_num-int(x.group(1))) + ")", my_line)
        if re.search("\(x\)", my_line):
            return re.sub(r'\(x\)', "(" + str(max_num) + ")", my_line)
    return re.sub(r'\([0-9]+\)', "({:d})".format(my_score), my_line)

def insert_stuff(f, fout, delete=False, max_here = 0):
    if not os.path.exists(f):
        print("WARNING need to create {:s}".format(f))
        return
    if out_read_only and os.path.exists(fout): # the final output file should be read-only by default
        os.chmod(fout, stat.S_IWGRP|stat.S_IWRITE|stat.S_IWUSR)
        os.remove(fout)
    fstream = open(fout, "w")
    cur_points = 0
    inserts = 0
    with open(f) as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("##"): continue #this is for comments
            if re.search("^>.*\([0-9]+\)", line):
                cur_points += 1
                fstream.write(new_points(line, cur_points, max_num = max_here))
                if cur_points in insert_point:
                    fstream.write(new_points(insert_point[cur_points].format(cur_points), cur_points+1, max_num = max_here))
                    cur_points += 1
                    inserts += 1
            elif re.search(r'^>.*\(x(-[0-9]+)?\)', line):
                temp = new_points(line, cur_points, max_num = max_here)
                if verbose: print("Updating x- line to", temp)
                fstream.write(temp)
                temp = re.sub(".*\(", "", temp)
                cur_points = int(re.sub("\).*", "", temp))
                if verbose: print("Updating current points to", cur_points)
            else:
                fstream.write(line)
    fstream.close()
    if out_read_only: os.chmod(fout, stat.S_IRGRP|stat.S_IREAD|stat.S_IRUSR)
    print(f, "twiddled to", fout, "with", inserts, "command insertion{:s}: {:s}.".format(i7.plur(inserts), ', '.join([str(x) + "=" + first_line(insert_point[x]) for x in insert_point])))
    if delete_after: os.remove(f)

#
# start main file
#

cmd_count = 1
while cmd_count < len(sys.argv):
    arg = sys.argv[cmd_count].lower()
    if arg[0] == '-': arg = arg[1:]
    if arg == 'v': verbose = True
    if arg == 'd' or arg == 'da': delete_after = True
    elif arg == 'dn' or arg == 'nd': delete_after = True
    elif arg == 'lo' or arg == 'loc': wri_dir = wri_loc
    elif arg == 'of': open_last = False
    elif arg == 'ol': open_last = True
    elif arg == 'rl':
        relink()
        exit()
    elif arg == '?': usage()
    else: usage("BAD COMMAND {:s}".format(sys.argv[cmd_count]))
    cmd_count += 1

i7.dir2proj("vv")

with open("story.ni") as file:
    for (line_count, line) in enumerate(file, 1):
        if line.startswith("the maximum score is"):
            max_full_score = get_first_num(line)
            if max_full_score and min_full_score: break
        elif line.startswith("min-needed"):
            min_full_score = get_first_num(line)
            if max_full_score and min_full_score: break

if not (max_full_score and min_full_score): sys.exit("Failed to read in maximum and minimum full scores.")

with open("wdrop.txt") as file:
    for (line_count, line) in enumerate(file, 1):
        l = line.strip().split("\t")
        insert_point[int(l[0])] = re.sub(r'\\n', "\n", l[1])

warnings = []

with open("wbase.txt") as file:
    for (line_count, line) in enumerate(file, 1):
        if line.startswith(">"):
            old_line = line
            line = re.sub("^> *", "> ", line)
            line = re.sub(" *\(", " (", line)
            if old_line != line:
                warnings.append(line_count)
                print("WARNING bad spacing line {:d} of wbase.txt: {:s}".format(line_count, line.strip()))

insert_stuff("walkthrough-pre.txt", os.path.join(wri_dir, "walkthrough.txt"), delete_after, min_full_score)
insert_stuff("walkthrough-full-pre.txt", os.path.join(wri_dir, "walkthrough-full.txt"), delete_after, max_full_score)

lw = len(warnings)
if lw:
    print("Found {:d} warning{:s}: {:s}".format(lw, mt.plur(lw), ", ".join(lw)))
    i7.npo("wbase.txt", warnings[-1 if open_last_err else 0])