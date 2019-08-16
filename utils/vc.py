#
# vc.py: given 2 words, put the verb check rules along with the verb result/run rules
#   to the screen and clipboard.

import re
import sys
import pyperclip
import mytools as mt

def get_ups():
    new_rule = "<NO RULE YET>"
    rule_line = 0
    count = 0
    with open("story.ni") as file:
        for (line_count, line) in enumerate(file, 1):
            if not line.startswith("\t"):
                if not line.startswith("["):
                    new_rule = line.strip()
                    new_rule = re.sub(":.*", "", new_rule)
                    rule_line = line_count
            else:
                ls = line.strip();
                if ls.startswith("up-"):
                    if new_rule is "this is the verb-checker rule": continue
                    count += 1
                    print("RULE", count, rule_line, new_rule)
                    print("    UP/DOWN", line_count, ls)
                    mt.add_postopen_file_line("story.ni", line_count)
    mt.postopen_files()

myary = []

lsa = len(sys.argv)

if lsa > 1 and sys.argv[1] == 'up':
    get_ups()
    exit()

if lsa == 3:
    myary = sys.argv[1:]
elif lsa == 2:
    temp = sum(not c.isalpha() for c in sys.argv[1])
    if temp == 1:
        myary = re.split("[^a-zA-Z]", sys.argv[1])

if len(myary) != 2:
    print("Need 2 args, or 1 arg with a separator. Or use up to track the remaining stuff to delete.")
    exit()

w1 = myary[0]
w2 = myary[1]


vc = "vc-{}-{} rule".format(w1, w2)
vr = "vr-{}-{} rule".format(w1, w2)

pastestr = "\"{}\"\t\"{}\"\ttrue/false\ttrue/false\t{}\t{}\t--\r\n".format(w1, w2, vc, vr)
pastestr += "\r\nthis is the {}:\r\n".format(vc)
pastestr += "\r\nthis is the {}:\r\n".format(vr)

print(pastestr.rstrip())

print("first word, last word, ok to flip, core, vc rule, vr rule")
print("Flip stuff: {0} {1} right, {1} {0} reverse.".format(w1, w2))

pyperclip.copy(pastestr)