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
first_two = False
tot_freq = 0

on_off = [ 'on', 'off' ]
word_ary = []
default_array = [ 'vast', 'void' ]
two_letter_ary = []

word_dict = defaultdict(lambda: defaultdict(bool))
freq = defaultdict(int)

let_blank = [''] + list(ascii_lowercase)

##############start functions

def usage():
    print("-e = CR every x")
    print("-i = standard input")
    print("-v = verbose output (prints under the hood info)")
    print("-t = two letter combos as well")
    exit()

def read_two_letters():
    global tot_freq
    with open("2s.txt") as file:
        for line in file:
            if line.startswith("#"): continue
            if line.startswith(";"): break
            temp_ary = line.lower().strip().split(" ")
            l = temp_ary[0]
            two_letter_ary.append(l)
            try:
                i = int(temp_ary[1])
            except:
                i = 0
                print("WARNING: line", line_count, line.lower().strip(), "is not of the form TEXT ##")
            freq[l] = i
            tot_freq += i

def word_upper(q):
    if q in word_dict[len(q)].keys(): return (q.upper(), True)
    return (q.lower(), False)

def write_all_26(a, b, two_letters_too = False, two_letter_starts = 10):
    read_words_of_length(a)
    read_words_of_length(b)
    end_string_ary = []
    anno = [ "no match", "single match", "DOUBLE MATCH!!!!" ]
    strings_array = [ [], [], [] ]
    global let_blank
    starts_array = list(let_blank)
    if two_letter_starts: starts_array.extend(two_letter_ary[0:two_letter_starts])
    for x in range(0, 3): strings_array[x] = []
    for x in starts_array:
        if x == a[0]: continue
        if len(x) == 2 and x[:2] == a[:2]: continue
        q = word_upper(x + a[1+two_letters_too:])
        r = word_upper(x + b[1+two_letters_too:])
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

def stdin_help():
    print("? = this.")
    print("t# = how many two-letter things to see.")
    print("2 = toggling replacing 1 or 1st 2, 2y = force 1st 2, 2n = force only 1st character. You can have a command after that.")
    print("standard input = 2 words to look through alliterative rhymes.")
    return

if standard_input:
    keep_going = True
    cmds = []
    while keep_going:
        x = input(">>").lower()
        if x == 'c':
            print(cmds)
            continue
        cmds.append(x)
        if x == 'q' or x == '':
            print("Bailing.")
            break
        if x[0] == '?':
            stdin_help()
            continue
        if x[0] == '??':
            print("Replacing first two letters is {:s}.".format(on_off[first_two]))
            print("Two-letter replacement texts:", ', '.join(two_letter_ary[0:two_letter]))
            continue
        if x[0] == 't':
            let_check = re.sub("^t *", "", x)
            look_num = True
            if not let_check: let_check = "0"
            elif let_check.isdigit():
                if int(let_check) == 0:
                    print("No longer checking changes to two-letter combos.")
                    two_letter = 0
                    continue
                two_letter = int(let_check)
            elif x[1] == 'a': two_letter = len(two_letter_ary)
            elif x[1] == '#':
                two_letter = len(two_letter_ary) - 1
                my_freq = int(x[2:])
                while freq[two_letter_ary[two_letter]] < my_freq and two_letter > 0:
                    two_letter -= 1
            else:
                look_num = False
            if look_num:
                if two_letter > len(two_letter_ary):
                    print("Warning max replaceables =", len(two_letter_ary))
                    two_letter = len(two_letter_ary)
                print("We now will check for the", two_letter, "most popular 2-letter combos:", ', '.join(two_letter_ary[:two_letter]))
                print("Lowest replaceable frequency:", freq[two_letter_ary[two_letter-1]], "of", tot_freq, "= {:.2f} %".format(freq[two_letter_ary[two_letter-1]]*100/tot_freq))
                continue
        if x == '2':
            first_two = not first_two
            print("Replacing first two is now {:s}. That means they will be replaced with *ALL* 0- 1- and 2-letter combos.".format(on_off[first_two]))
            continue
        if x == '2y':
            first_two = True
            continue
        if x == '2n':
            first_two = False
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
        if not x.strip(): break
        if ' ' not in x:
            print("1-word command not recognized. You need a 2-word command. Type ? to see your options.")
            continue
        if x.count(' ') > 1:
            print("Too many words. A 2 word command should work.")
            continue
        write_all_26(si[0], si[1], first_two, two_letter)
else:
    for i in range(0, len(word_ary) // 2):
        write_all_26(word_ary[i*2], word_ary[i*2+1], two_letter)
    if len(word_ary) % 2: print("Warning odd number of characters in word array. Last is", word_ary[len(word_ary)-1])