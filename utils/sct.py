from collections import defaultdict
import re
import i7

x_of_y = defaultdict(lambda: defaultdict(bool))
scores = defaultdict(int)
got = defaultdict(int)

last_line = 0
last_cmd = "(undefined)"

open_post = True
to_open = 0

hdr_str = "                  NE OP UD TO"

print(hdr_str)

with open("story.ni") as file:
    for (line_count, line) in enumerate(file, 1):
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
                got[last_cmd] = line_count
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
                scores[score_idx] += 1
                scores["total"] += 1
                print("({:>5s}) Cur score {:02d}+{:02d}+{:02d}={:02d} Line {:4d}".format(score_idx, scores["nec"], scores["opt"], scores["undef"], scores["total"], line_count), "score increment for command {:20s} Line {:4d}".format(last_cmd, last_line))

print(hdr_str)

for q in sorted(x_of_y.keys()):
    print('X-of-Y puzzle for', q, ':', ', '.join(sorted(x_of_y[q].keys())))

if open_post and to_open: i7.npo("story.ni", to_open)