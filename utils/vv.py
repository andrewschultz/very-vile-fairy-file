# vv.py: lets the user see all the possible string replacements
#
# at first for 26 letters, but later, sounds
#

from string import ascii_lowercase
import sys

standard_input = False

word_ary = []
default_array = [ 'vast', 'void' ]

##############start functions

def write_all_26(a, b):
    for x in ascii_lowercase:
        print(x + a[1:], x + b[1:])

##############end functions

count = 1

while count < len(sys.argv):
    arg = sys.argv[count].lower()
    if arg == 'i': standard_input = True
    else: word_ary.append(arg)
    count += 1

if standard_input:
    keep_going = True
    while keep_going:
        x = input(">>")
        si = x.lower().strip().split(" ")
        if x == 'q': break
        if not x.strip(): break
        write_all_26(si[0], si[1])
else:
    for i in range(0, len(word_ary) // 2):
        write_all_26(word_ary[i*2], word_ary[i*2+1])
    if len(word_ary) % 2: print("Warning odd number of characters in word array. Last is", word_ary[len(word_ary)-1])