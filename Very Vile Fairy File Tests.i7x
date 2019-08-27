Version 1/181111 of Very Vile Fairy File Tests by Andrew Schultz begins here.

"This is the tests file for Very Vile Fairy File."

volume optional tests

[include Property Checking by Emily Short.

a thing can be abstract. A thing is usually not abstract.]

volume in-IDE tests

chapter warps

test qw with "gonear merry mile/bury bile"

chapter walkthrough

test w1 with "get good/gift giver/find fault/green grass/grow grit/mash map/mind me/flim flam/big bag".
test w1r with "get good/gift giver/find fault/green grass/bash bap/grow grit/mash map/flim flam/mind me/skim scam/big bag".

test w2 with "dive deep/paper pile/backed binder/s/kneel near/feel fear/deal dear/n/fall free".
test w3 with "n/w/dark door/mark more/cleared clay/w/mystery mall/listen/lots lame/no nappin/w/hard hat/e/e/e/n/w/work well/e/stay strong/e"

test w4 with "loft land/w/dreaming dull/first fave/cool cap/e/s/e/silent sail/brightening bridge/boring boat/no nappin/in"

[
> W
> DARK DOOR (1)
> MARK MORE (1)
> CLEARED CLAY (1)
> W
> MYSTERY MALL (1)
> W
> LENDING LIBE (1)
> E
> FIRST FLOOR (1)
> IN
> S
> COLD CARD (1)
> N
> OUT
]
[> LOFT LAND (1)
> W
> DREAMING DULL (1)
> FIRST FAVE (1)
> COOL CAP (1)
> E
> N
> SHOW SHIELD (1)
> W
> MORAL MAGE (1)
> E
> S
> S
> E
> WAKE WHEE (1)
> E
> BRIGHTENING BRIDGE (1)
> SHINING SHORE (1)
> SNAKE SNAP
> MAKE MAP
> W
> MYSTERY MALL (1)
> LISTEN
> E
> E
> N
> W
> WORK WELL (1)
> E
>LOFT LAND (1)
> W
> DREAMING DULL (1)
>
> SNAKE SNAP (1)
> MAKE MAP (1)
> FEARFUL (1)
> W
> S
> E
> E
> DEAR DULL (1)
> DINING DOOR (1)
> MINING MORE (1)
> SIT SOUND (1)
> FIT FOUND (1)
> SO SAPPIN (1)
> WILD WEED (1)
> W
> W
> SPARK SPLIFF (1)
> BEAST BOSS (x-15)
> BEAST BOSS (x-14)
> LEAST LOSS (1)
> S
> S
> HEAL HERE (1)
> N
> N
> CULL CEASED (1)
> FULL FEAST (1)
> CAST CAP (1)
> BEAKER BUSTLE (1)
> MEEKER MUSCLE (1)
> WOOD ONE (1)
> N
> HOT HORDE (1)
> LOT LORD (1)
> GOT GORED (1)
> WHOAH WAIT (1)
> TELL TORN (1)
> MERRY MILE (1)
> BURY BILE (1)]

chapter beta jump

test cc1 with "climb clear/got gored/hot horde/got gored/lot lord/got gored/whoah wait/merry mile/tell torn/merry mile/bury bile".
test cc2 with "bury bile/climb clear/bury bile/got gored/lot lord/got gored/hot horde/got gored/woe wait/bury bile/tell torn/bury bile/merry mile/bury bile".

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
	try lling;

Very Vile Fairy File Tests ends here.

---- DOCUMENTATION ----
