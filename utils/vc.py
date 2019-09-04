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
from mytools import nohy

ignore_rule = defaultdict(bool)
mult_succ_fail_ok = defaultdict(bool)
nofail_ok = defaultdict(bool)

go_to_verbcheck_end = True

def check_vc_rules(): # count # of rule succeeds/fails in VC rules. There should be 1.
    out_file = open("story.niv", "w", newline="\n")
    in_vc = False
    in_vr = False
    got_succeeds_yet = 0
    got_fails_yet = 0
    rule_start_line = 0
    rule_name = "<NO RULE>"
    mult_succ = 0
    mult_fail = 0
    no_succ = 0
    no_fail = 0
    any_say = total_say = say_rules = 0
    ex_vcp = 0
    suggested_changes = 0
    last_multi_tab = "continue the action"
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("this is the vc-"):
                in_vc = True
                got_succeeds_yet = 0
                got_fails_yet = 0
                any_say = 0
                rule_start_line = line_count
                rule_name = re.sub(".*vc-", "vc-", line).strip()
                rule_name = re.sub(" *rule:", "", rule_name)
                last_multi_tab = "continue the action"
            elif line.startswith("this is the vr-"):
                in_vr = True
                vcp_count = 0
                got_succeeds_yet = 0
                got_fails_yet = 0
                rule_start_line = line_count
                rule_name = re.sub(".*vr-", "vr-", line).strip()
                rule_name = re.sub(" *rule:", "", rule_name)
            elif in_vr and not line.strip():
                in_vc = False
                in_vr = False
                if vcp_count:
                    ex_vcp += 1
                    print("{} Extraneous VCP in {} lines {}-{}.".format(ex_vcp, rule_name, rule_start_line, line_count))
                if got_succeeds_yet:
                    print("Harmless extra rule-succeeds in {} line {}.".format(rule_name, line_count - 1))
                if got_fails_yet:
                    print("Harmless extra rule-fails in {} line {}.".format(rule_name, line_count - 1))
            elif in_vc and not line.strip():
                if not got_succeeds_yet:
                    no_succ += 1
                    print("{}/{} Oops no 'rule succeeds' text in {} lines {}-{}.".format(no_succ, no_fail + no_succ, rule_name, rule_start_line, line_count))
                    mt.add_postopen_file_line("story.ni", line_count)
                elif got_succeeds_yet > 1 and rule_name not in mult_succ_fail_ok:
                    mult_succ += 1
                    print("{}/{}Oops multiple 'rule succeeds' text in {} lines {}-{}.".format(no_succ, no_fail + no_succ, rule_name, rule_start_line, line_count))
                    mt.add_postopen_file_line("story.ni", line_count)
                if not got_fails_yet and rule_name not in nofail_ok:
                    no_fail += 1
                    print("{}/{} Oops no 'rule fails' text in {} lines {}-{}.".format(no_fail, no_fail + no_succ, rule_name, rule_start_line, line_count))
                    mt.add_postopen_file_line("story.ni", line_count)
                elif got_fails_yet > 1 and rule_name not in mult_succ_fail_ok:
                    no_fail += 1
                    print("{}/{} Oops no 'rule fails' text in {} lines {}-{}.".format(no_fail, no_fail + no_succ, rule_name, rule_start_line, line_count))
                    mt.add_postopen_file_line("story.ni", line_count)
                if any_say:
                    say_rules += 1
                    total_say += any_say
                    print("{}{}/{} potential excess 'say' in {} lines {}-{}.".format("****" if any_say > 1 else "", total_say, say_rules, rule_name, rule_start_line, line_count))
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
                got_succeeds_yet += 'rule succeeds' in line
                got_fails_yet += 'rule fails' in line
                any_say += 'say "' in line and "[oksay]" not in line
                if line.startswith("\t\t"):
                    last_multi_tab = line
                elif line.startswith("\t"):
                    if 'continue the action' not in last_multi_tab:
                        print("May be missing CONTINUE THE ACTION in line", line_count - 1)
            elif in_vr:
                vcp_count += 'vcp "' in line
                got_succeeds_yet += 'rule succeeds' in line
                got_fails_yet += 'rule fails' in line
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
    if mult_succ or mult_fail:
        print("Need to trim {} extra 'rule succeeds' and {} extra 'rule fails'.".format(mult_succ, mult_fail))
    else:
        print("No rules have excess rule succeeds/rule fails.")
    if say_rules:
        print("No fishy 'say' in vc- rules.")
    else:
        print(say_rules, "vc- rules have say, total =", total_say)
    if ex_vcp:
        print("Need to fix {} extraneous VCP in vr- rules.",format(ex_vcp))
    else:
        print("No extraneous VCP in vr- rules.")
    os.remove("story.niv")
    mt.postopen_files()
    exit()

def get_ignore_notone():
    with open("vc.txt") as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("#"): continue
            if line.startswith(";"): continue
            l = line.lower().strip()
            if l.startswith("ignorezero:"):
                l = l[11:]
                ary = l.split(",")
                for a in ary:
                    if a in ignore_rule:
                        print("WARNING duplicate ignore zero dict entry", a, "at line", line_count)
                    ignore_rule[a] = True
            if l.startswith("multok:"):
                l = l[11:]
                ary = l.split(",")
                for a in ary:
                    if a in mult_succ_fail_ok:
                        print("WARNING duplicate ignore mult dict entry", a, "at line", line_count)
                    mult_succ_fail_ok[a] = True
            elif l.startswith("nofail:"):
                l = l[7:]
                ary = l.split(",")
                for a in ary:
                    if a in nofail_ok:
                        print("WARNING duplicate nofail_ok entry", a, "at line", line_count)
                    nofail_ok[a] = True
            elif re.search("^[a-z]+:", l):
                l0 = re.sub(":.*", "", l)
                print("Uh oh line {} has bad dict-type val {}.".format(line_count, l0))
    return

def get_ups(): # make sure up-(min/reg) isn't anywhere it shouldn't be
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
                    if new_rule in ignore_rule: continue
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
get_ignore_notone()

cmd_count = 1

myary = []

while cmd_count < lsa:
    arg = nohy(sys.argv[cmd_count])
    if arg == 'u' or arg == 'up':
        get_ups()
        exit()
    if arg == 'vc':
        check_vc_rules()
        exit()
    if arg == 'ne':
        go_to_verbcheck_end = False
    else:
        temp = sum(not c.isalpha() for c in arg)
        if temp == 1:
            myary += re.split("[^a-zA-Z]", arg)
        else:
            myary.append(arg)
    cmd_count += 1

# ok, no checking source. Let's create auto-text. We need 2 arguments.

if len(myary) != 2:
    print("Need 2 args, or 1 arg with a separator.")
    print("Or use u to track the remaining stuff to delete.")
    print("Or vc to check the vc- and vr- rules.")
    exit()

w1 = myary[0]
w2 = myary[1]

vc = "vc-{}-{} rule".format(w1, w2)
vr = "vr-{}-{} rule".format(w1, w2)

pastestr = "\"{}\"\t\"{}\"\tFLIP:true/false\tCORE:true/false\tfalse\t{}\t{}\t--\r\n".format(w1, w2, vc, vr)
pastestr += "\r\nthis is the {}:\r\n\tthe rule succeeds;\r\n".format(vc)
pastestr += "\r\nthis is the {}:\r\n".format(vr)

print(pastestr.rstrip())

print("first word, last word, ok to flip, core, vc rule, vr rule")
print("Flip stuff: {0} {1} right, {1} {0} reverse.".format(w1, w2))

pyperclip.copy(pastestr)

if go_to_verbcheck_end:
    line_to_open = 0
    in_necc_table = False
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            if line.startswith("table of verb checks"):
                in_necc_table = True
                continue
            if in_necc_table and not line.strip():
                line_to_open = line_count
                break
    if line_to_open:
        mt.npo("story.ni", line_to_open)