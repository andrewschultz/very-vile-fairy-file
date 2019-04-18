Version 1/181111 of Very Vile Fairy File Tests by Andrew Schultz begins here.

"This is the tests file for Very Vile Fairy File."

volume in-IDE tests

chapter warps

test qw with "gonear merry mile/bury bile"

chapter walkthrough

test w1 with "get good/find fault/green grass/grow grit/mash map/mind me/flim flam/big bag".
test w1r with "get good/find fault/green grass/mash map/grow grit/mash map/flim flam/mind me/flim flam/big bag".

volume odd property tests

chapter talksing

talksing is an action applying to nothing.

understand the command "talks" as something new.

understand "talks" as talksing.

carry out talksing:
	let empties be 0;
	repeat with Q running through people:
		if talk-text of Q is empty:
			increment empties;
			say "[Q] needs talk-text.";
	if empties is 0, say "Everyone has talk-text.";
	the rule succeeds.

chapter nowaying

nowaying is an action out of world.

understand the command "noway" as something new.

understand "noway" as nowaying.
understand "noway v" as nowaying.

carry out nowaying:
	let needs be 0;
	let noway-verbose be whether or not the player's command includes "v";
	say "==================NOWAY TEST==================[paragraph break]";
	repeat with Q running through rooms:
		if the noway-text of Q is empty:
			say "[b][Q] needs noway-text.[r]";
			increment needs;
		else:
			if noway-verbose is true, say "[Q]: [noway-text of Q][line break]";
	say "[if needs is 0]Every noway-text is defined[else]You need to define noway-text for [needs] room[plur of needs][end if].";
	the rule succeeds.

volume monty stuff

include Full Monty Testing by Andrew Schultz.

table of monties (continued)
montopic (topic)	on-off	test-title (text)	test-action	topic-as-text (text)
"ll"	false	"Leet Learner"	show-leets rule	"showing leet learner readings"

this is the show-leets rule:
	let c be cht of location of player;
	say "[if c is phbt]No puzzles for [location of player][else][location of player] is scanned as [scancol of c][end if].";
	repeat with Q running through things enclosed by location of player:
		say "Checking [Q]...";
		let cq be cht of Q;
		if cq is not phbt, say "[Q] is scanned as [scancol of cq][if Q is optional]. OPTIONAL[end if].";

Very Vile Fairy File Tests ends here.

---- DOCUMENTATION ----
