#
# wdrop.py
#
# Very Vile Fairy File specific
#
# this drops in the new walkthroughs created after rbr.py wbase.txt forks the min- and max- point walkthroughs.
#
# It should not be run by itself.
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
import __main__ as main

max_full_score = 0
max_bonus = 0
core_max = 0

wri_dir = i7.gh_src("vv", give_source = False)
wri_loc = i7.sdir("vv")

out_read_only = True
delete_after = False #It's ok to have this, since we don't copy over the pre-files to the source control directory
verbose = True

open_last_err = True

print("NOTE do not run wdrop.py on its own--run rbr.py wbase.txt.")

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
    return re.sub(r'\([u0-9]+\)', "({:d})".format(my_score), my_line)

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
            if re.search("^>.*\([u0-9]+\)", line):
                cur_points += 1
                fstream.write(new_points(line, cur_points, max_num = max_here))
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
        if line.startswith("max-bonus"):
            max_bonus = get_first_num(line)
            if max_bonus and core_max: break
        elif line.startswith("core-max"):
            core_max = get_first_num(line)
            if max_bonus and core_max: break

if not (max_bonus and core_max): sys.exit("Failed to read in maximum and minimum full scores. Max={} Min={}. Bailing.".format(max_bonus, core_max))
max_full_score = max_bonus

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

insert_stuff("walkthrough-pre.txt", os.path.join(wri_dir, "walkthrough.txt"), delete_after, core_max)
insert_stuff("walkthrough-full-pre.txt", os.path.join(wri_dir, "walkthrough-full.txt"), delete_after, max_full_score)

lw = len(warnings)
if lw:
    print("Found {:d} warning{:s}: {:s}".format(lw, mt.plur(lw), ", ".join(lw)))
    i7.npo("wbase.txt", warnings[-1 if open_last_err else 0])