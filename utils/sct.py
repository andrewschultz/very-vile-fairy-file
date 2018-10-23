from collections import defaultdict
import re
import i7

x_of_y = defaultdict(lambda: defaultdict(bool))
scores = defaultdict(int)
got = defaultdict(int)

open_post = True
to_open = 0

hdr_str = "                  NE OP UD TO"

def check_walkthrough():
    got_thru = defaultdict(int)
    pts_in_walkthrough = 0
    with open("walkthrough.txt") as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith(">") and re.search("\([0-9]+\)", line):
                my_cmd = re.sub("^> *", "", line.strip())
                my_cmd = re.sub(" *\(.*", "", my_cmd)
                got_thru[my_cmd.lower()] = line_count
                pts_in_walkthrough += 1
                #print(line_count, my_cmd)
    if pts_in_walkthrough != scores["nec"]:
        print("ERROR Walkthrough points =", pts_in_walkthrough, "necessary scores flagged in source code =", scores["nec"])
    x1 = list(set(list(got.keys())) - set(list(got_thru.keys())))
    x2 = list(set(list(got_thru.keys())) - set(list(got.keys())))
    if x1: print ("Score commands not in walkthrough:", len(x1), ', '.join(x1))
    if x2: print ("Walkthrough commands not in score:", len(x2), ', '.join(x2))
    #print(len(sorted(got.keys())), sorted(got.keys()))
    #print(len(sorted(got_thru.keys())), sorted(got_thru.keys()))
    #print(sorted(got.keys()))

def check_points():
    last_line = 0
    last_cmd = "(undefined)"
    global min_sco
    global max_sco
    print(hdr_str)
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("min-needed"):
                if min_sco: sys.exit("Minimum score redefined at line {:d}.".format(line_count))
                min_sco = int(re.sub(".* is ", "", re.sub("\.$", "", line.lower().strip())))
                continue
            if line.startswith("the maximum score is"):
                if max_sco: sys.exit("Maximum score redefined at line {:d}.".format(line_count))
                max_sco = int(re.sub(".* is ", "", re.sub("\.$", "", line.lower().strip())))
                continue
            if re.search("understand \".*\" as", line):
                q = line.split("\"")
                last_cmd = q[1]
                last_line = line_count
            if line.startswith("to up-min"): continue
            if line.startswith("to check-russell-go"):
                last_cmd = ""
                continue
            if "increment the score" in line or "check-russell-go" in line or "up-min" in line:
                if last_line and last_cmd:
                    if last_cmd in got.keys():
                        print("WARNING", line_Count, last_cmd, "already flagged for a point at", got[last_cmd])
                    if "[x-of-y" in line:
                        puz_type = re.sub(".*x-of-y ", "", line.strip())
                        puz_type = re.sub("\].*", "", puz_type)
                        x_of_y[puz_type][last_cmd] = True
                    if "[opt]" in line or "\tup-min" in line: score_idx = "opt"
                    elif "[x-of-y]" in line: continue
                    elif "[nec]" in line: score_idx = "nec"
                    else:
                        score_idx = "undef"
                        to_open = line_count
                    got[last_cmd] = line_count
                    scores[score_idx] += 1
                    scores["total"] += 1
                    print("({:>5s}) Cur score {:02d}+{:02d}+{:02d}={:02d} Line {:4d}".format(score_idx, scores["nec"], scores["opt"], scores["undef"], scores["total"], line_count), "score increment for command {:20s} Line {:4d}".format(last_cmd, last_line))
    print(hdr_str)

min_sco = 0
max_sco = 0

check_points()
check_walkthrough()

if min_sco != scores['nec']: print(min_sco, "in source but # of necessary scores in file = ", scores['nec'])
else: print("MINIMUM SCORES MATCH IN SOURCE!")

if max_sco != scores['total']: print(max_sco, "in source but # of possible scores in file = ", scores['total'])
else: print("MAXIMUM SCORES MATCH IN SOURCE!")

for q in sorted(x_of_y.keys()):
    print('X-of-Y puzzle for', q, ':', ', '.join(sorted(x_of_y[q].keys())))

if open_post and to_open: i7.npo("story.ni", to_open)