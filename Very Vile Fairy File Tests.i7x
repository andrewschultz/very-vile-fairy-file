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
test w1r with "get good/gift giver/find fault/green grass/bash bap/grow grit/mash map/flim flam/mind me/skim scam/big bag". [this is the intro]

test w2 with "dive deep/paper pile/backed binder/s/kneel near/feel fear/deal dear/n/fall free/n". [real rear 1st try, plus get to Creased Cross]
test w3 with "w/dark door/mark more/cleared clay/w/mystery mall/listen/lots lame/no nappin/w/hard hat/e/stay strong/e/e/n/w/work well/e". [get jerk gel, clear shirk shell]

test w4 with "loft land/w/dreaming dull/first fave/cool cap/e/s/e/silent sail/brightening bridge/boring boat/no nappin/in" [get cap, take boat]

test w5 with "wake whee/z/glow glad/take tea/fake fee/e/make map/co capn/snake snap/enter boat/mean muggin/lean luggin/enter boat" [this is the boat quest]

test w6 with "w/w/w/w/history hall/first floor/s/smashing smoke/n/w/lending libe/dabbler data/e/e/e/n/n/w/moral mage" [release the moral mage]

test w7 with "e/e/sit sound/fit found/e/minding maze/mo mappin/luck lair/w/w/s/s/w/d/tight tunnel/w/knives niche/e/u/e/n/e" [set the trap for the bull]

test w8 with "dear dull/near null/w/s/w/d/w/w/s/beast boss/least loss/s/s/s/heal here/n/n/cull ceased/full feast" [deal with the beer bull and beast boss]

test wa with "test w1/test w2/test w3/test w4/test w5/test w6/test w7".

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
