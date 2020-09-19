#
# wdrop.py
#
# Very Vile Fairy File specific at first, branched to Under They Thunder
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
# the maximum score is ...
max_score = 0
# vvff specific: if we have optional points
max_bonus = 0
core_max = 0

my_proj = i7.dir2proj()

wri_dir = i7.gh_src(my_proj, give_source = False)
wri_loc = i7.sdir(my_proj)

fix_spaces = False

out_read_only = True
delete_after = False #It's ok to have this, since we don't copy over the pre-files to the source control directory
verbose = True

open_last_err = True
need_core_max = False

show_rbr_warning = '-norbr' in sys.argv or 'norbr' in sys.argv
if show_rbr_warning: print("NOTE do not run wdrop.py on its own--run rbr.py wbase.txt.")


def get_max_file():
    my_proj = i7.dir2proj()
    if my_proj == 'under-they-thunder':
        return i7.hdr('ut', 'glo')
    return i7.main_src(my_proj)

def usage(cmd="USAGE LIST"):
    print(cmd)
    print("=" * 50)
    print("-d/-da = delete after, -nd/-dn = don't")
    print("-v = verbose")
    exit()

def need_core_from_path():
    if 'very-vile' in os.path():
        return True
    return False

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
    elif arg == 'cm': need_core_max = True
    elif arg == 'fs': fix_spaces = True
    elif arg == 'ncm' or arg == 'nc': need_core_max = False
    elif arg == 'rl':
        relink()
        exit()
    elif arg == 'norbr': show_rbr_warning = False
    elif arg == '?': usage()
    else: usage("BAD COMMAND {:s}".format(sys.argv[cmd_count]))
    cmd_count += 1

file_with_max = get_max_file()

with open(file_with_max) as file:
    for (line_count, line) in enumerate(file, 1):
        if line.startswith("max-bonus"):
            max_bonus = mt.num_value_from_text(line)
            if max_bonus and core_max: break
        elif line.startswith("core-max"):
            core_max = mt.num_value_from_text(line)
            if max_bonus and core_max: break
        elif line.startswith("the maximum score is "):
            max_score = mt.num_value_from_text(line)
            break

if max_score or (max_bonus and core_max):
    pass
else:
    sys.exit("Failed to read in maximum and minimum full scores. Max={} Min={}. Bailing.".format(max_bonus, core_max))

max_full_score = max_bonus if max_bonus else max_score

warnings = []
base_out_string = ''

with open("wbase.txt") as file:
    for (line_count, line) in enumerate(file, 1):
        if line.startswith(">"):
            if line[1] != ' ':
                warnings.append(line_count)
                print("WARNING bad spacing line {:d} of wbase.txt: {:s}".format(line_count, line.strip()))
                line = line[0] + ' ' + line[1:]
        if fix_spaces:
            base_out_string += line

lw = len(warnings)

if fix_spaces and lw:
    print("Fixing", len(warnings), "spacing(s)")
    fout = open("wbase.txt", "w")
    fout.write(base_out_string)
    fout.close()

insert_stuff("walkthrough-pre.txt", os.path.join(wri_dir, "walkthrough.txt"), delete_after, core_max)

if my_proj != 'under-they-thunder':
    insert_stuff("walkthrough-full-pre.txt", os.path.join(wri_dir, "walkthrough-full.txt"), delete_after, max_full_score)

if lw and not fix_spaces:
    print("Found {:d} warning{:s}: {:s} (fix with -fs)".format(lw, mt.plur(lw), ", ".join([str(x) for x in warnings])))
    i7.npo("wbase.txt", warnings[-1 if open_last_err else 0])