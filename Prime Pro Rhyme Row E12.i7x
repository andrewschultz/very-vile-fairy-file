Version 1/221103 of Prime Pro Rhyme Row E12 by Andrew Schultz begins here.

cheattype is a kind of value. the cheattypes are phbt, letplus, letminus, partplus, partminus, leteq, letboth and allover.

book properties

a room has a cheattype called cht. cht of a room is usually phbt.

a thing has a cheattype called cht. cht of a thing is usually phbt.

to phbt (x - a room): now cht of x is phbt;

to phbt (x - a thing):
	now cht of x is phbt;
	now x is not optional-noted;
	now x is not optional;

to decide which cheattype is the cluecheat of (n1 - a number) and (n2 - a number):
	if n1 > 10, decide on allover; [this is for ambiguous cases in the Dark Dump]
	if n2 > n1, decide on cluecheat of n2 and n1;
	if n1 is 0 and n2 is 0, decide on leteq; [center]
	if n1 > 0 and n2 is 0, decide on partplus; [center left]
	if n1 > 0 and n2 > 0, decide on letplus; [left]
	if n1 is 0 and n2 < 0, decide on partminus; [center right]
	if n1 < 0 and n2 < 0, decide on letminus; [right]
	decide on letboth; [one +, one minus, wobbles]

Prime Pro Rhyme Row E12 ends here.
