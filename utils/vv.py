# vv.py: lets the user see all the possible string replacements
#
# at first for 26 letters, but later, sounds
#

from collections import defaultdict
from string import ascii_lowercase
import sys

verbose = False
standard_input = False

word_ary = []
default_array = [ 'vast', 'void' ]

word_dict = defaultdict(lambda: defaultdict(bool))

##############start functions

def word_upper(q):
    if q in word_dict[len(q)].keys(): return (q.upper(), True)
    return (q.lower(), False)

def write_all_26(a, b):
    read_words_of_length(a)
    read_words_of_length(b)
    for x in ascii_lowercase:
        if x == a[0]: continue
        q = word_upper(x + a[1:])
        r = word_upper(x + b[1:])
        xtra_string = "" if q[1] + r[1] < 2 else "<- DOUBLE MATCH"
        print(q[0], r[0], xtra_string)

def read_words_of_length(a):
    la = len(a)
    if la in word_dict.keys():
        if verbose:
            print("Already read words of length", la, "so returning.")
        return
    my_file = "c:/writing/dict/words-{:d}.txt".format(la)
    with open(my_file) as f:
        for line in f:
            word_dict[la][line.lower().strip()] = True
    print("Read in", len(word_dict[la].keys()), "words", "for", la)

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