# vv.py: lets the user see all the possible string replacements
#
# at first for 26 letters, but later, sounds
#
# todo: toggle showing long list of 0-matches
# toggle max # of matches shown
# allow for slashes in syntax so we can look for multiple word combos e.g. be/bee bad
# 2o and 1o command line syntax, align_matches option
# cmd_line_stuff merged with main STDIN read function
# if no match, print nothing / give option for full printout with v-f-ile
#
# usage: vv.py -i
#
# strong strand should look for 1-3 with similarity flag turned on
# can we also look for first/last names?
# remember to be able to toggle this and to check stuff like dict a = b, dict a = c
#
# cl-sm-oke looks for cloak/smoke rhymes parallels

from collections import defaultdict
from string import ascii_lowercase
import sys
import re
import os
import i7

this_time = defaultdict(int)
all_time = defaultdict(int)

all_time_file = os.path.join(i7.sdir("vvff"), "vva.txt")

standard_input_if_no_array = True

verbose = False
standard_input = False
two_letter = 0
every_x = 5
termwidth = os.get_terminal_size().columns
max_every_x = termwidth // 12
warn_every_x = termwidth // 18
tot_freq = 0
show_zeros = True
align_matches = True
max_search_chars = 10

search_til_different = True

word_ary = []
default_array = [ 'vast', 'void' ]
two_letter_ary = []

dels = defaultdict(bool)
dels[1] = True

word_dict = defaultdict(lambda: defaultdict(bool))
freq = defaultdict(int)

let_blank = [''] + list(ascii_lowercase)

##############start functions

def del_ary(x):
    return [a for a,b in x.items() if x[a] == True]

def read_all_time():
    all_time.clear()
    if not os.path.exists(all_time_file):
        print("Could not find", all_time_file)
        return
    with open(all_time_file) as file:
        for line in file:
            l = line.lower().strip().split("=")
            all_time[l[0]] = int(l[1])

def print_configs():
    print("Replacing first two letters is {:s}.".format(i7.oo[2 in dels]))
    print("Replacing first letter is {:s}.".format(i7.oo[1 in dels]))
    print("Do we replace two letters:", ', '.join(two_letter_ary[0:two_letter]))
    print("# of two-letter replacements of original letters:", two_letter)
    print("carriage returns after every", every_x, "matches.")
    return

def stdin_or_basic_usage():
    print("=" * 50)
    print("Dashes at start are highly recommended, since we could be dealing with any words.")
    print("-? = this")
    print("-?? = details/examples")
    print("-e/c = CR every x matches. 1-{:d} are possible values.".format(max_every_x))
    print("-v = verbose output (prints under the hood info)")
    print("-sd / -nsd / -sdn = search til different on/off (default={:s})".i7.on_off[search_til_different])
    print("-t = two letter combos as well")
    print("-ta = see all")
    print("-t#(number) = try for 2-letter matches with combinations that start more than (number) words.")
    print("-z/yz/zy and -nz/zn = show zero-matches or hide them.")
    print("=" * 50)

def cmd_line_usage():
    stdin_or_basic_usage()
    print("-i = standard input")
    exit()

def stdin_help():
    stdin_or_basic_usage()
    print("q = quit, qx = quit without adding to the vva.txt try frequency data file.")
    print("ri = list which files are read in so far")
    print("(12) = toggling whether or not you show 1 or 2, (12)(ny) forces things. If you add a space, you can have a command after that.")
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

def write_all_26(a, b, dels, two_letter_starts = 10):
    if a == b:
        print("I won't let you compare two equivalent words.")
        return
    if search_til_different:
        temp = 0
        while a[:temp] == b[:temp] and temp < min(len(a), len(b)):
            temp += 1
        if temp == 0:
            print("Since the first letter is different, searching until different turns up nothing. Returning.")
            return
        dels = list(range(1, temp))
    elif not len(dels):
        print("You need to set 1-letter or 2-letter replacements to true.")
        return
    global let_blank
    done_anything = False
    aa = re.split("[,/]", a)
    ab = re.split("[,/]", b)
    anno = [ "no match", "single match", "DOUBLE MATCH!!!!" ]
    strings_array = [ [], [], [] ]
    starts_array = list(let_blank)
    if two_letter_starts: starts_array.extend(two_letter_ary[0:two_letter_starts])
    warns = defaultdict(bool)
    max_string_size = max([len(ax) for ax in aa]) + max([len(ax) for ax in ab]) + 1
    if two_letter_starts: max_string_size += 2
    if 1 not in dels: max_string_size -= 2
    for d in dels:
        for a in aa:
            for b in ab:
                if a[:d] != b[:d]:
                    print("Skipping {:s} and {:s} due to first {:d} letter{:s} mismatch.".format(a, b, d, i7.plur(d)))
                    continue
                done_anything = True
                la = len(a)
                lb = len(b)
                read_words_of_length(la)
                read_words_of_length(lb)
                if a not in word_dict[la] and a not in warns.keys():
                    print("WARNING", a, "may not be a word.")
                    warns[a] = True
                if b not in word_dict[lb] and b not in warns.keys():
                    print("WARNING", b, "may not be a word.")
                    warns[b] = True
                if '' in let_blank:
                    read_words_of_length(la-d)
                    read_words_of_length(lb-d) # since we need to consider lair -> air
                if two_letter_starts and d == 1:
                    read_words_of_length(la+1)
                    read_words_of_length(lb+1)
                this_combo = "{:s} {:s}".format(a, b)
                this_time[this_combo] = 1
                if this_combo in all_time.keys(): print("Note:", this_combo, "already done", all_time[this_combo], "time" + i7.plur(all_time[this_combo]))
                a_in = ""
                b_in = ""
                for q in all_time.keys():
                    if a in q and not a_in: a_in = q
                    if b in q and not b_in: b_in = q
                if a_in and b_in:
                    print(a, b, "both seen separately in {:s}/{:s}.".format(a_in, b_in))
                for x in starts_array:
                    if x == a[0]: continue
                    if len(x) == 2 and x[:2] == a[:2]: continue
                    q = word_upper(x + a[d:])
                    r = word_upper(x + b[d:])
                    wo = q[1] + r[1]
                    strings_array[wo].append("{:s} {:s}".format(q[0], r[0]))
    if not done_anything:
        print("Couldn't find anything to do.")
        return
    strings_array = [sorted(q, key=str.lower) for q in strings_array]
    for q1 in range(1 - show_zeros, 3):
        count = 0
        end_string = ""
        for q in range (0, len(strings_array[q1])):
            end_string += "{:{max_string_size}s}".format(strings_array[q1][q], max_string_size=max_string_size) if align_matches else strings_array[q1][q]
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

def replace_one(q):
    got_any = False
    if q.count("-") != 1:
        if q.count("-") == 0: print("You need a ? in the string for simple replacement.")
        else: print("Only one dash for simple replacement.")
        return
    q1 = re.sub("-", "", q)
    for i in range(3, max_search_chars + 1):
        read_words_of_length(i)
    (x1, x2) = q.lower().strip().split("-")
    for i in range(3, max_search_chars + 1):
        for q2 in word_dict[i]:
            if q2.endswith(x2):
                print("{:s}- => {:s}- gives {:s} => {:s}".format(q1[:-len(x2)], q2[:-len(x2)], q1,  q2))
                got_any = True
    if not got_any: print("Got nothing for the word {:s}{:s}/{:s}-{:s}.".format(x1, x2, x1, x2))

def replace_two(q):
    got_any = False
    max_width_local = (termwidth * 4) // 5
    if q.count("-") != 2:
        print("You need 2 dashes in the string to do complex replacements: from, to, suffix.")
        return
    (pre1, pre2, suff) = q.lower().strip().split("-")
    for i in range(3, max_search_chars + 1):
        read_words_of_length(i)
    chars_this_line = 0
    big_string = ""
    for i in range(max_search_chars, 2, -1):
        for q2 in word_dict[i]:
            if q2.startswith(pre2):
                base_word = pre1 + q2[len(pre2):]
                if base_word in word_dict[len(base_word)]:
                    if not got_any:
                        print("{:s} / {:s}".format(pre1, pre2))
                        print("=" * 50)
                    got_any = True
                    out_string = "{:s}~{:s}".format(q2, base_word)
                    if chars_this_line + len(out_string) > max_width_local:
                        big_string += "\n"
                        chars_this_line = 0
                    else:
                        if chars_this_line: big_string += " | "
                        chars_this_line += 3
                    chars_this_line += len(out_string)
                    big_string += out_string
    print(big_string)
    if not got_any: print("Got nothing for the words {:s}-{:s}/{:s}-{:s}.".format(pre1, suff, pre2, suff))

##############end functions

count = 1

read_two_letters()

cmd_line_stuff = " ".join(sys.argv[1:]).split(";")

while count < len(sys.argv):
    arg = sys.argv[count].lower()
    if arg[0] == '-': arg = arg[1:]
    if arg == 'i': standard_input = True
    elif arg == 'ni': standard_input = False
    elif arg == 'v': verbose = True
    elif arg[0] == 't': two_letter = int(arg[1:])
    elif re.search("^[ec][0-9]", arg): every_x = int(arg[1:])
    elif '?' in arg: cmd_line_usage()
    else:
        if '1' in arg: dels[1] = True
        if '2' in arg:
            dels[2] = True
            if '1' not in arg: dels[1] = False
        arg = re.sub("[12]", "", arg)
        word_ary.append(arg)
    count += 1

if not standard_input and not len(word_ary):
    if standard_input_if_no_array is True:
        standard_input = True
        print("No word array, so going to standard input.")
    else:
        sys.exit("I don't have a word array, and standard input is not specified or defaulteed to. Set standard_input_if_no_array to True or use the -i flag for standard input.")

starts_array = let_blank

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
        if ' ' not in x:
            if x.count('-') == 1:
                replace_one(x)
                continue
            if x.count('-') == 2:
                replace_two(x)
                continue
        if x == 'sd':
            search_til_different = True
            continue
        if x == 'nsd' or x == 'sdn':
            search_til_different = False
            continue
        if x == 'q' or x == '' or x == 'qx':
            if x == 'qx':
                print("Bailing without saving.")
            elif len(this_time.keys()):
                print("Bailing.")
                read_all_time() # this is in case I've opened up 2 instances of vv.py
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
            if temp < 1 or temp > max_every_x: print("You can only make line breaks every 1 through {:d}, to avoid line breaking. However, if you can increase the terminal width before running, this number may rise.".format(max_every_x))
            else:
                every_x = temp
                if every_x >= warn_every_x: print("WARNING: this may cause a broken line.")
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
        if x == 'z':
            show_zeros = not show_zeros
            print("Toggling show_zeros. It is now {:s}. To fix the value, type yz/zy (on) or nz/zn (off).".format(i7.oo[show_zeros]))
            continue
        if x == 'yz' or x == 'zy':
            if show_zeros:
                print("Zeros already shown.")
                continue
            show_zeros = True
            print("Showing zeros.")
            continue
        if x == 'nz' or x == 'zn':
            if not show_zeros:
                print("Zeros already hidden.")
                continue
            show_zeros = False
            print("Hiding zeros.")
            continue
        if x == 'ri':
            print(len(word_dict.keys()), "total word files read in.")
            for q in sorted(word_dict.keys()):
                print(q, "has", len(word_dict[q]), "total words")
            continue
        x = x.lower().strip()
        if re.search("^[12]([nyo])?($| +)", x):
            iv = int(x[0])
            if len(x) == 1 or x[1] == ' ':
                dels[iv] = not dels[iv]
                toggles = "Toggling"
            elif x[1] == 'o':
                for i in range(0, 3): dels[i] = (i == iv)
                toggles = "Forcing only"
            else:
                dels[iv] = (x[1] == 'y')
                toggles = "Setting"
            print("{:s} {:d} to {:s}.".format(toggles, iv, i7.oo[dels[iv]]))
            if not len(del_ary(dels)): print("WARNING: replacing starting 1 and 2 letters is both off.")
            x = re.sub("^[12]([ny]?)( +)?", "", x)
            if not x: continue
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
            if re.search("^[12]", x):
                print("1/2 command must be followed by n/y or a space. Type ? to see your options.")
                continue
            print("1-word command ({:s}) not recognized. You need a 2-word command. Type ? to see your options.".format(x))
            continue
        else:
            if re.search("[^a-z ,/]", x):
                print("WARNING: some non alpha characters are in {:s}. Try again.".format(x))
                continue
            last_lookup = x
        si = x.split(" ")
        if len(si) != 2:
            print("You need 2 words or word groups separated by spaces. You have {:d}. Groups can contain slashes/commas.".format(len(si)))
            continue
        #print(s0, s1)
        write_all_26(si[0], si[1], del_ary(dels), two_letter)
else:
    for i in range(0, len(word_ary) // 2):
        write_all_26(word_ary[i*2], word_ary[i*2+1], del_ary(dels), two_letter)
    if len(word_ary) % 2: print("Warning odd number of characters in word array. Last is", word_ary[len(word_ary)-1])