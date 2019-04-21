#
# wdrop.py
#
# run after rbr.py wbase.txt for VVFF
#

from collections import defaultdict
import os
import re
import i7
import sys

delete_after = True

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
	fstream = open(fout, "w")
	cur_points = 0
	inserts = 0
	with open(f) as file:
		for (line_count, line) in enumerate(file, 1):
			if re.search("^>.*\([0-9]+\)", line):
				cur_points += 1
				fstream.write(new_points(line, cur_points, max_num = max_here))
				if cur_points in insert_point:
				    fstream.write(new_points(insert_point[cur_points].format(cur_points), cur_points+1, max_num = max_here))
				    cur_points += 1
				    inserts += 1
			elif re.search(r'^>.*\(x(-[0-9]+)?\)', line):
				fstream.write(new_points(line, cur_points, max_num = max_here))
			else:
				fstream.write(line)
	fstream.close()
	print(f, "twiddled to", fout, "with", inserts, "command insertion{:s}: {:s}.".format(i7.plur(inserts), ', '.join([str(x) + "=" + first_line(insert_point[x]) for x in insert_point])))
	#if delete_after: os.remove(f)

insert_point = defaultdict(str)

max_full_score = 0
min_full_score = 0

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

insert_stuff("walkthrough-pre.txt", "walkthrough.txt", delete_after, min_full_score)
insert_stuff("walkthrough-full-pre.txt", "walkthrough-full.txt", delete_after, max_full_score)

