#
# vc.py: given 2 words, put the verb check rules along with the verb result/run rules
#   to the screen and clipboard.

import re
import sys
import pyperclip

myary = []

if len(sys.argv) == 3:
    myary = sys.argv[1:]
elif len(sys.argv) == 2:
    temp = sum(not c.isalpha() for c in sys.argv[1])
    if temp == 1:
        myary = re.split("[^a-zA-Z]", sys.argv[1])

if len(myary) != 2:
    print("Need 2 args, or 1 arg with a separator.")
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