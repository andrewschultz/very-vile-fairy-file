#
# wdrop.py
#
# run after rbr.py wbase.txt for VVFF
#

from collections import defaultdict
import os
import re
import i7

delete_after = True

def new_points(a, b, end_points = False, max_num = 0):
	if max_num and re.search(r'\(x-([0-9]+)\)', a):
		return re.sub(r'\(x-([0-9]+)\)', lambda x:str(max_num-int(x.group(1))), a)
	return re.sub(r'\([0-9]+\)', "({:d})".format(b), a)

def insert_stuff(f, fout, delete=False):
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
				fstream.write(new_points(line, cur_points))
				if cur_points in insert_point:
					fstream.write(new_points(insert_point[cur_points].format(cur_points), cur_points+1))
					cur_points += 1
					inserts += 1
			else:
				fstream.write(line)
	fstream.close()
	if delete: os.remove(f)
	print(f, "twiddled to", fout, "with", inserts, "command insertion{:s}.".format(i7.plur(inserts)))

insert_point = defaultdict(str)

with open("wdrop.txt") as file:
	for (line_count, line) in enumerate(file, 1):
		l = line.strip().split("\t")
		insert_point[int(l[0])] = re.sub(r'\\n', "\n", l[1])

insert_stuff("walkthrough-pre.txt", "walkthrough.txt", delete_after)
insert_stuff("walkthrough-full-pre.txt", "walkthrough-full.txt", delete_after)

