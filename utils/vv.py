# vv.py: lets the user see all the possible string replacements
#
# at first for 26 letters, but later, sounds
#

from collections import defaultdict
from string import ascii_lowercase
import sys
import re

verbose = False
standard_input = False
two_letter = False
every_x = 3

on_off = [ 'on', 'off' ]
word_ary = []
default_array = [ 'vast', 'void' ]
two_letter_ary = []

word_dict = defaultdict(lambda: defaultdict(bool))

let_blank = [''] + ascii_lowercase

##############start functions

def usage():
    print("-e = CR every x")
    print("-i = standard input")
    print("-v = verbose output (prints under the hood info)")
    print("-t = two letter combos as well")
    exit()

def read_two_letters():
    with open("2s.txt") as file:
        for line in file:
            if line.startswith("#"): continue
            if line.startswith(";"): break
            l = re.sub(" .*", "", line.lower().strip())
            two_letter_ary.append(l)

def word_upper(q):
    if q in word_dict[len(q)].keys(): return (q.upper(), True)
    return (q.lower(), False)

def write_all_26(a, b, two_letters_too = 0):
    read_words_of_length(a)
    read_words_of_length(b)
    end_string_ary = []
    anno = [ "no match", "single match", "DOUBLE MATCH!!!!" ]
    strings_array = [ [], [], [] ]
    starts_array = let_blank + two_letter_ary[0:two_letters_too]
    for x in starts_array:
        if x == a[0]: continue
        if len(x) == 2 and x[:2] == a[:2]: continue
        q = word_upper(x + a[1+first_two:])
        r = word_upper(x + b[1+first_two:])
        wo = q[1] + r[1]
        strings_array[wo].append("{:s} {:s}".format(q[0], r[0]))
    count = 0
    for q1 in range(0, 3):
        end_string = ""
        for q in range (0, len(strings_array[q1])):
            end_string += strings_array[q1][q]
            if q == len(strings_array[q1]) - 1: continue
            elif (q + 1) % every_x == 0: end_string += "\n"
            else: end_string += " / "
            count += 1
        if (end_string): print("{:s} {:s} ({:d})\n{:s}".format('=' * 40,  anno[q1], len(strings_array[q1]), end_string) )

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

read_two_letters()

while count < len(sys.argv):
    arg = sys.argv[count].lower()
    if arg == 'i': standard_input = True
    elif arg == 'v': verbose = True
    elif arg == '2': first_two = True
    elif arg[0] == 't':
        two_letter = int(arg[1:])
    else: word_ary.append(arg)
    count += 1

starts_array = let_blank

if not len(word_ary):
    standard_input = True
    print("Going with standard input by default.")

if standard_input:
    keep_going = True
    while keep_going:
        x = input(">>").lower()
        if x[0] == 't' and x[1].isdigit():
            two_letter = int(x[1:])
            continue
        if x == '2':
            first_two = not first_two
            print("First two is now", on_off[first_two])
            continue
        if x == '2y':
            first_two = True
            continue
        if x == '2n':
            first_two = True
            continue
        if x.startswith("2n"):
            first_two = False
            x = re.sub("^2n *", "", x)
        if x.startswith("2y"):
            first_two = True
            x = re.sub("^2y *", "", x)
        if x.startswith("2"):
            first_two = not first_two
            x = re.sub("^2 *", "", x)
        si = x.lower().strip().split(" ")
        if x == 'q': break
        if not x.strip(): break
        write_all_26(si[0], si[1], two_letter)
else:
    for i in range(0, len(word_ary) // 2):
        write_all_26(word_ary[i*2], word_ary[i*2+1], two_letter)
    if len(word_ary) % 2: print("Warning odd number of characters in word array. Last is", word_ary[len(word_ary)-1])