Version 1/181111 of Very Vile Fairy File Tests by Andrew Schultz begins here.

"This is the tests file for Very Vile Fairy File."

[wch.py checks the walkthrough versus this]

volume implementation test(s)

when play begins (this is the room hint check rule):
	let hint-idx be 0;
	repeat with Q running through rooms:
		if map region of Q is poorly penned or map region of Q is Get a Guess, continue the action;
		if room-hint-rule of Q is trivially false rule:
			increment hint-idx;
			say "[hint-idx]. The room-hint-rule of [Q] is the [printed name of Q in lower case]-hint rule.";
	say "[if hint-idx > 0][hint-idx] room hint[plur of hint-idx] to implement[else]All room hints implemented[end if].";


when play begins (this is the thing hint check rule):
	let hint-idx be 0;
	let max-hint be 20;
	let ignore-text be false;
	repeat with Q running through things:
		if thing-hint-rule of Q is trivially false rule:
			increment hint-idx;
			if hint-idx > max-hint and ignore-text is false:
				say "I went over the maximum. Not listing the rest.";
				now ignore-text is true;
				next;
			if ignore-text is false, say "[hint-idx]. The thing-hint-rule of [Q] is the [printed name of Q in lower case]-hint rule.";
	if hint-idx > 0, say "[hint-idx] thing hint[plur of hint-idx] to implement.";

volume optional tests

[include Property Checking by Emily Short.

a thing can be abstract. A thing is usually not abstract.]

volume in-IDE tests

chapter warps

chapter walkthrough

test qbug with "purloin toe/gonear violent vale/purloin cake cap/silent sail/boring boat/no nappin/enter boat/mo mappin/ho happen/lean luggin/mean muggin"

test w1 with "get good/gift giver/find fault/green grass/grow grit/mash map/mind me/flim flam/big bag/s". [this is the intro.]

test w2 with "s/kneel near/feel fear/deal dear/n/fall free/dive deep/paper pile/backed binder". [real rear 1st try, get binder]

test w3 with "n/w/dark door/mark more/cleared clay/w/mystery mall/listen" [get TTRR]

test w3b with "whatta wanksta/ho happen/dimd" [bonus points: songs and get ganksta before gone]

test w4 with "lots lame/w/hard hat" [get first hat]

test w5 with "e/e/e/n/w/work well/e/loft land/w/dreaming dull/first fave/cool cap" [get 2nd cap]

test w6 with "/e/s/e/brightening bridge/silent sail/boring boat/no nappin/enter boat/wake whee". [get cap, take boat]

test w7 with "take tea/fake fee/e/make map/co capn/snake snap/enter boat". [this is part 1 of the boat quest]

test w8 with "stay strong/glow glad/mean muggin/lean luggin"

test w9 with "enter boat/w/w/w/glean glows/history hall/youre yonder/out/smashing smoke/in/w/lending libe/see sign/e/e/e/n/n/plain pleasant/w/moral mage". [release the moral mage. This part is a bit long because there were no good breaks and I wanted to start a test with the stay strong/glow glad verbs that were twiddled late in the release.]

test w10 with "e/e/sit sound/fit found/e/winding ways/mo mappin/luck lair/w/w/s/s/w/d/tight tunnel/w/knives niche/u/e/n/e". [set the trap for the bull]

test w11 with "dear dull/near null/w/s/w/d/w" [bye bye bull beast]

test w12 with "s/beast boss/least loss/s/s/heal here/n" [ready to defeat the beast boss]

test w13 with "n/cull ceased/full feast/e/e/so sappin/shining shore/dining door/pull pieced/mining more". [get the hold hard gold guard]

test w14 with "w/w/n/n/show shield/n/go gappin/couple caps/cast cap"

test w15 with "meeker muscle/wood one/n". [enter airy isle]

test w16 with "hot horde/lot lord/got gored/whoah wait/tell torn/merry mile/bury bile".

test wa with "test w1/test w2/test w3/test w4/test w5/test w6/test w7/test w8/test w9/test w10/test w11/test w12/test w13/test w14/test w15/test w16".

test wb with "really rolling/test w1/appealing appear/test w2/strong start/test w3/test w3b/test w4/lie lol/not near/test w5/test w6/break brie/test w7/test w8/bumped buster/test w9/test w10/test w11/test w12/wild weed/spark spliff/test w13/test w14/beaker bustle/test w15/test w16".

chapter beta jump

test cc1 with "climb clear/got gored/test w16".

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

volume quaint questin' taint testin' (Ha! Ha!)

Table of Final Question Options (continued)
final question wording	only if victorious	topic		final response rule		final response activity
"track CHT of each room"	true	"cht"	--	chttracking

chttracking is an activity.

rule for chttracking:
	let phbts be 0;
	repeat with X running through rooms:
		let mrx be map region of location of X;
		if mrx is Poorly Penned or mrx is Get a Guess, next; [meta rooms don't count]
		if X is History Hall or X is Soft Sand, next; [these are always switchable back and forth]
		if cht of X is not phbt:
			increment phbts;
			say "[phbts]. [X] should be phbt but is [cht of X].";
	if phbts is 0, say "Hooray! All rooms have been reduced to PHBT.";

volume monty stuff

[include Full Monty Testing by Andrew Schultz.

table of monties (continued)
montopic (topic)	on-off	test-title (text)	test-action	topic-as-text (text)
"ll"	false	"Leet Learner"	show-leets rule	"showing leet learner readings"

this is the show-leets rule:
	try lling;]

Very Vile Fairy File Tests ends here.

---- DOCUMENTATION ----
