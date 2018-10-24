# vv.py: lets the user see all the possible string replacements
#
# at first for 26 letters, but later, sounds
#
# todo: toggle showing long list of 0-matches
# toggle max # of matches shown
# allow for slashes in syntax so we can look for multiple word combos e.g. be/bee bad
#

from collections import defaultdict
from string import ascii_lowercase
import sys
import re
import os
import i7

this_time = defaultdict(int)
all_time = defaultdict(int)

all_time_file = os.path.join(i7.sdir("vvff"), "vva.txt")

verbose = False
standard_input = False
two_letter = 0
every_x = 5
first_two = False
tot_freq = 0

word_ary = []
default_array = [ 'vast', 'void' ]
two_letter_ary = []

word_dict = defaultdict(lambda: defaultdict(bool))
freq = defaultdict(int)

let_blank = [''] + list(ascii_lowercase)

##############start functions

def read_all_time():
    if not os.path.exists(all_time_file):
        print("Could not find", all_time_file)
        return
    with open(all_time_file) as file:
        for line in file:
            l = line.lower().strip().split("=")
            all_time[l[0]] = int(l[1])

def print_configs():
    print("Replacing first two letters is {:s}.".format(i7.oo[first_two]))
    print("Do we replace two letters:", ', '.join(two_letter_ary[0:two_letter]))
    print("# of two-letter replacements of original letters:", two_letter)
    print("carriage returns after every", every_x, "matches.")
    return

def cmd_line_usage():
    print("-e/c = CR every x matches. 1-10 are possible values.")
    print("-i = standard input")
    print("-v = verbose output (prints under the hood info)")
    print("-t = two letter combos as well")
    print("-? = this")
    exit()

def stdin_help():
    print("? = this.")
    print("-e/c = CR every x matches. 1-10 are possible values.")
    print("ri = what is read in")
    print("t(number) = how many two-letter matches to look at.")
    print("t#(number) = try for 2-letter matches with combinations that start more than (number) words.")
    print("ta = see all")
    print("2 = toggling replacing 1 or 1st 2, 2y = force 1st 2, 2n = force only 1st character. You can have a command after that.")
    print("standard input = 2 words to look through alliterative rhymes.")
    return

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
    global let_blank
    la = len(a)
    lb = len(b)
    read_words_of_length(la)
    read_words_of_length(lb)
    if '' in let_blank:
        read_words_of_length(la-1)
        read_words_of_length(lb-1) # since we need to consider lair -> air
    if two_letter_starts:
        read_words_of_length(la+1)
        read_words_of_length(lb+1)
    end_string_ary = []
    anno = [ "no match", "single match", "DOUBLE MATCH!!!!" ]
    strings_array = [ [], [], [] ]
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

def read_words_of_length(la):
    if la in word_dict.keys():
        if verbose:
            print("Already read words of length", la, "so returning.")
        return
    my_file = "c:/writing/dict/words-{:d}.txt".format(la)
    if not os.path.exists(my_file):
        print(my_file, "does not exist, won't bother with words of length", la)
        word_dict[la] = {}
        return
    with open(my_file) as f:
        for line in f:
            word_dict[la][line.lower().strip()] = True
    print("Read in", len(word_dict[la].keys()), "words of length", la)

##############end functions

count = 1

read_two_letters()

while count < len(sys.argv):
    arg = sys.argv[count].lower()
    if arg[0] == '-': arg = arg[1:]
    if arg == 'i': standard_input = True
    elif arg == 'v': verbose = True
    elif arg == '2': first_two = True
    elif arg[0] == 't': two_letter = int(arg[1:])
    elif re.search("^[ec][0-9]", arg): every_x = int(arg[1:])
    elif '?' in arg: cmd_line_usage()
    else: word_ary.append(arg)
    count += 1

starts_array = let_blank

if not len(word_ary):
    standard_input = True
    print("Going with standard input by default.")

read_all_time()

if standard_input:
    last_lookup = ""
    keep_going = True
    cmds = []
    while keep_going:
        x = input(">>").lower().strip()
        x = re.sub("[ \t]+", " ", x)
        if x == 'c':
            print(cmds)
            continue
        cmds.append(x)
        if x == 'q' or x == '':
            print("Bailing.")
            if len(this_time.keys()):
                for j in this_time.keys():
                    all_time[j] += 1
                f = open(all_time_file, "w")
                for j in sorted(all_time.keys()):
                    f.write("{:s}={:d}\n".format(j, all_time[j]))
                f.close()
                print("Wrote successfully to", all_time_file)
                this_time_list = []
                ttk = sorted(this_time.keys())
                for w in range(0, len(ttk), 5):
                    this_time_list.append(' / '.join(ttk[w:w+5]))
                print("Added:", "\n       ".join(this_time_list), "({:d} total)".format(len(ttk)))
            else:
                print("No pairs tried, so I'm not rewriting", all_time_file)
            break
        if x[0] == '?':
            stdin_help()
            continue
        if re.search("^[ec][0-9]", x):
            temp = int(x[1:])
            if temp < 1 or temp > 10: print("You can only make line breaks every 1 through 10.")
            else: every_x = temp
            print("Now there are line breaks after every", every_x, "pair{:s}.".format(i7.plur(every_x)))
            continue
        if x[0] == '??':
            print_configs()
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
            elif x == 'ta': two_letter = len(two_letter_ary)
            elif x[1] == '#':
                two_letter = len(two_letter_ary) - 1
                try:
                    if len(x) == 2 or not x[2:].strip():
                        my_freq = len(two_letter_array)
                    else:
                        my_freq = int(x[2:])
                except:
                    print("T requires a, an integer, or # then an integer.")
                    continue
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
            print("Replacing first two is now {:s}. That means they will be replaced with *ALL* 0- 1- and 2-letter combos.".format(i7.oo[first_two]))
            continue
        if x == '2y':
            first_two = True
            continue
        if x == '2n':
            first_two = False
            continue
        if x == 'ri':
            print(len(word_dict.keys()), "total word files read in.")
            for q in sorted(word_dict.keys()):
                print(q, "has", len(word_dict[q]), "total words")
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
        x = x.lower().strip()
        if not x: break
        if x.count(' ') > 1:
            print("Too many words. A 2 word command should work.")
            continue
        if x == '<' or x == '`':
            if not last_lookup:
                print("Can't use < until you've written something previously.")
                continue
            x = last_lookup
            print("Trying", x)
        elif ' ' not in x:
            print("1-word command not recognized. You need a 2-word command. Type ? to see your options.")
            continue
        else:
            if re.search("[^a-z ,/]", x):
                print("WARNING: some non alpha characters are in here. Try again.")
                continue
            last_lookup = x
        si = x.split(" ")
        si0 = re.split("[,/]", si[0])
        si1 = re.split("[,/]", si[1])
        for s0 in si0:
            for s1 in si1:
                this_combo = "{:s} {:s}".format(s0, s1)
                this_time[this_combo] = 1
                if this_combo in all_time.keys(): print("Note:", this_combo, "already done", all_time[this_combo], "time" + i7.plur(all_time[this_combo]))
                #print(s0, s1)
                write_all_26(s0, s1, first_two, two_letter)
else:
    for i in range(0, len(word_ary) // 2):
        write_all_26(word_ary[i*2], word_ary[i*2+1], two_letter)
    if len(word_ary) % 2: print("Warning odd number of characters in word array. Last is", word_ary[len(word_ary)-1])