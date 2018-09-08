from string import ascii_lowercase
import sys

if len(sys.argv) > 2:
	w1 = sys.argv[1].lower()
	w2 = sys.argv[2].lower()
else:
	w1 = 'vast'
	w2 = 'void'

for x in ascii_lowercase:
	print(x + w1[1:], x + w2[1:])