#
# vc.py: given 2 words, put the verb check rules along with the verb result/run rules
#   to the screen and clipboard.

import os
import re
import sys
import pyperclip
import mytools as mt
from i7 import is_outline_start
from collections import defaultdict

ignore_dict = defaultdict(bool)
nofail = defaultdict(bool)

def check_vc_rules():
    out_file = open("story.niv", "w", newline="\n")
    in_vc = False
    in_vr = False
    got_succeeds_yet = False
    got_fails_yet = False
    rule_start_line = 0
    rule_name = "<NO RULE>"
    no_succ = 0
    no_fail = 0
    suggested_changes = 0
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("this is the vc-"):
                in_vc = True
                got_succeeds_yet = False
                got_fails_yet = False
                rule_start_line = line_count
                rule_name = re.sub(".*vc-", "vc-", line).strip()
                rule_name = re.sub(" *rule:", "", rule_name)
            elif line.startswith("this is the vr-"):
                in_vr = True
                rule_start_line = line_count
                rule_name = re.sub(".*vc-", "vc-", line).strip()
                rule_name = re.sub(" *rule:", "", rule_name)
            elif in_vr and not line.strip():
                in_vc = False
                in_vr = False
            elif in_vc and not line.strip():
                if not got_succeeds_yet:
                    no_succ += 1
                    print("{}/{}Oops no 'rule succeeds' text in {} lines {}-{}.".format(no_succ, no_fail + no_succ, rule_name, rule_start_line, line_count))
                    mt.add_postopen_file_line("story.ni", line_count)
                if not got_fails_yet and rule_name not in nofail:
                    no_fail += 1
                    print("{}/{} Oops no 'rule fails' text in {} lines {}-{}.".format(no_fail, no_fail + no_succ, rule_name, rule_start_line, line_count))
                    mt.add_postopen_file_line("story.ni", line_count)
                in_vc = False
                in_vr = False
            elif (in_vc or in_vr) and "instead;" in line:
                notabs = re.sub("[^\t]", "", line.rstrip())
                l2 = re.sub(" *instead;", ";", line)
                if "\tif" in l2:
                    l2 = re.sub(", *(say \")", ":\n" + notabs + "\t" + r'\1', l2)
                    opt_tab = "\t"
                else:
                    opt_tab = ""
                out_file.write(l2)
                out_file.write(notabs + opt_tab + "continue the action;\n");
                suggested_changes += 1
                print("Suggested changes for {} at line {}.".format(rule_name, line_count))
                continue
            elif in_vc:
                got_succeeds_yet |= 'rule succeeds' in line
                got_fails_yet |= 'rule fails' in line
            out_file.write(line)
    out_file.close()
    if suggested_changes:
        print(suggested_changes, "suggested changes.")
        mt.wm("story.ni", "story.niv")
    else:
        print("No suggested changes.")
    if no_succ or no_fail:
        print("Need {} 'rule succeeds' and {} 'rule fails'.".format(no_succ, no_fail))
    else:
        print("All rules have rule succeeds/rule fails in place.")
    os.remove("story.niv")
    mt.postopen_files()
    exit()

def get_ignore_dict():
    with open("vc.txt") as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("#"): continue
            if line.startswith(";"): continue
            l = line.lower().strip()
            if l.startswith("ignoredict:") or l.startswith("ignorerule"):
                l = l[11:]
                ary = l.split(",")
                for a in ary:
                    if a in ignore_dict:
                        print("WARNING duplicate ignore dict entry", a, "at line", line_count)
                    ignore_dict[a] = True
            elif l.startswith("nofail:"):
                l = l[7:]
                ary = l.split(",")
                for a in ary:
                    if a in nofail:
                        print("WARNING duplicate nofail entry", a, "at line", line_count)
                    nofail[a] = True
    return

def get_ups():
    new_rule = "<NO RULE YET>"
    rule_line = 0
    count = 0
    in_vr_rules = False
    out_of_place = []
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            if in_vr_rules and is_outline_start(line):
                in_vr_rules = False
                in_vr_end = line_count
                continue
            if line.startswith("section vc vr rules"):
                in_vr_rules = True
                in_vr_start = line_count
            if not in_vr_rules and (line.startswith("this is the vr-") or line.startswith("this is the vc-")):
                out_of_place.append("OUT OF PLACE rule {0} at line {1}".format(line.strip(), line_count))
            if not line.startswith("\t"):
                if not line.startswith("["):
                    new_rule = line.strip()
                    new_rule = re.sub(":.*", "", new_rule)
                    rule_line = line_count
            else:
                ls = line.strip();
                if ls.startswith("up-"):
                    if new_rule in ignore_dict: continue
                    count += 1
                    print("RULE", count, rule_line, new_rule)
                    print("    UP/DOWN", line_count, ls)
                    if "vc" in new_rule:
                        print("UH OH NEW RULE NEEDS ERASING.")
                        mt.add_postopen_file_line("story.ni", line_count, True)
                    else:
                        mt.add_postopen_file_line("story.ni", line_count)
    if len(out_of_place):
        print("vc vr rules between", in_vr_start, "and", in_vr_end)
        print("\n".join(out_of_place))
    else:
        print("Go me, or former me! All the vc/vr rules are ORGANIZED.")
    mt.postopen_files()

myary = []

lsa = len(sys.argv)
get_ignore_dict()

if lsa > 1:
    if (sys.argv[1] == 'u' or sys.argv[1] == 'up'):
        get_ups()
        exit()
    if (sys.argv[1] == 'vc'):
        check_vc_rules()
        exit()

# ok, no checking source. Let's create auto-text.

if lsa == 3:
    myary = sys.argv[1:]
elif lsa == 2:
    temp = sum(not c.isalpha() for c in sys.argv[1])
    if temp == 1:
        myary = re.split("[^a-zA-Z]", sys.argv[1])

if len(myary) != 2:
    print("Need 2 args, or 1 arg with a separator. Or use u to track the remaining stuff to delete.")
    exit()

w1 = myary[0]
w2 = myary[1]

vc = "vc-{}-{} rule".format(w1, w2)
vr = "vr-{}-{} rule".format(w1, w2)

pastestr = "\"{}\"\t\"{}\"\tFLIP:true/false\tCORE:true/false\t{}\t{}\t--\r\n".format(w1, w2, vc, vr)
pastestr += "\r\nthis is the {}:\r\n".format(vc)
pastestr += "\r\nthis is the {}:\r\n".format(vr)

print(pastestr.rstrip())

print("first word, last word, ok to flip, core, vc rule, vr rule")
print("Flip stuff: {0} {1} right, {1} {0} reverse.".format(w1, w2))

pyperclip.copy(pastestr)