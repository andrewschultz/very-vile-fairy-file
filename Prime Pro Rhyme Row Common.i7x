Version 1/220705 of Prime Pro Rhyme Row Common by Andrew Schultz begins here.

"This is a common file for the two larger entries in the Prime Pro-Rhyme Row series: Very Vile Fairy File and Low-Key Learny Jokey Journey. It includes variables used for the hinting device, among other things."

include Prime Pro Rhyme Row Universal by Andrew Schultz.

volume properties

a room has a rule called room-hint-rule. room-hint-rule of a room is usually trivially false rule.

a thing has a rule called thing-hint-rule. thing-hint-rule of a thing is usually trivially false rule.

volume leet learner portable code

chapter stubs

to say ll: say "[b]LL[r]"

book room- and rule-based stubs

to say here-in of (rm - a room): say "[if rm is location of player]here[else]in [rm][end if]"

to say here-to of (rm - a room): say "[if rm is location of player]here[else]to [rm][end if]"

to say swh of (rm - a room): say "[if rm is unvisited]somewhere new[else][rm][end if]"

to nobreak-if-think: if current action is thinking, skip upcoming rulebook break;

to say once-now of (ru - a rule):
	nobreak-if-think;
	process ru;
	let rbo be the outcome of the rulebook;
	say "[if rbo is the ready outcome or rbo is the already-done outcome]now[else]once[end if]"

book leet learner

the leet learner is a rhymable. description is "It says [b]LEET LEARNER/CHEAT CHURNER[r]. It has two main settings: [b]HUT! CAN![r] (on) and [b]SHUT SCAN[r] (off). It's currently [off-on of shut-scan]. [ll]/[b]CC ON[r]/[b]OFF[r] can turn it on or off.[paragraph break]Also, to use it, [ll] (something). [ll] with no argument scans the current location.[paragraph break]You can [b]READ[r] it for more detailed information."

guess-table of leet learner is table of leet learner guesses.

understand "cheat/churner" and "cheat churner" and "device" as leet learner.

after printing the name of leet learner while taking inventory: say " ([off-on of shut-scan])";

understand "ll" and "cc" as leet learner.

to say will-wont of (ts - a truth state):
	say "[if ts is true]will[else]won't[end if]"

ll-flip-warn is a truth state that varies.

first-room is a room that varies.

first-main-room is a room that varies.

book options verbs

chapter two too functionality

two-too is a truth state that varies. two-too is true.

two-too-check is a truth state that varies.

this is the two-too-help rule:
	abide by the disable-learner-options rule;
	if two-too-check is false, say "[i][bracket][b]ONE-TIME NOTE[r][i]: typing [b]DO DUE[r][i] will switch the homonym-detection option off on your Leet Learner[opt-out-note].[close bracket]";
	now two-too-check is true;
	the rule succeeds;

to say opt-out-note: say ". It will make [this-game][i] more difficult. I wanted to make this feature opt-out so the player did not miss it"

section twotooing

twotooing is an action applying to nothing.

understand the command "two too" as something new.

understand "two too" as twotooing.

carry out twotooing:
	abide by the disable-learner-options rule;
	say "[if two-too is true]Homonym detection is already set[else]You set homonym detection[end if] to on.";
	now two-too is true;
	the rule succeeds.

chapter dueing

dueing is an action applying to nothing.

understand the command "do due" as something new.
understand the command "due do" as something new.

understand "due do" as dueing.
understand "do due" as dueing.

carry out dueing:
	abide by the disable-learner-options rule;
	say "[if two-too is false]Homonym detection is already set[else]You set homonym detection[end if] to off.";
	now two-too is false;
	the rule succeeds.

chapter ha half functionality

section ha half button

ha-half is a truth state that varies. ha-half is true.

the ha half nah naff button is part of the leet learner. description is "It is set [on-off of ha-half], meaning if you get a guess half-right, the Leet Learner [will-wont of ha-half] alert you."

section hahalfing

ha-half-check is a truth state that varies.

hahalfing is an action applying to nothing.

understand the command "ha half" as something new.

understand "ha half" as hahalfing.
understand "half" as hahalfing.
understand "hh" as hahalfing.

carry out hahalfing:
	say "[if ha-half is true]The Leet Learner is already set[else]You set the Leet Learner[end if] to Ha Half.";
	now ha-half is true;
	now ha-half-check is true;
	the rule succeeds.

this is the ha-half-help rule:
	if ha-half-check is false:
		say "[line break][i][bracket][b]ONE-TIME NOTE[r][i]: typing [b]NAH NAFF[r][i] will switch this option off on your Leet Learner[opt-out-note].[close bracket]";
	now ha-half-check is true;
	the rule succeeds;

section nahnaffing

nahnaffing is an action applying to nothing.

understand the command "nah naff" as something new.

understand "nah naff" as nahnaffing.
understand "naff" as nahnaffing.
understand "nn" as nahnaffing.

carry out nahnaffing:
	abide by the disable-learner-options rule;
	say "[if ha-half is false]The Leet Learner is already set[else]You set the Leet Learner[end if] to Nah Naff.";
	now ha-half is false;
	now ha-half-check is true;
	the rule succeeds.

chapter lling

[ note LLing is different for VVFF and LLJJ ]

lling is an action applying to one thing.

understand the command "cc" as something new.
understand the command "ll" as something new.
understand the command "scan" as something new.

understand "cc [thing]" as lling when player has leet learner.
understand "ll [thing]" as lling when player has leet learner.
understand "scan [thing]" as lling when player has leet learner.
understand "cc" as lling when player has leet learner.
understand "ll" as lling when player has leet learner.
understand "scan" as lling when player has leet learner.

chapter shutscaning

shutscaning is an action applying to nothing.

understand the command "cc off" as something new.
understand the command "ll off" as something new.
understand the command "shut scan" as something new.

understand "cc off" as shutscaning.
understand "ll off" as shutscaning.
understand "shut scan" as shutscaning.

shut-scan is a truth state that varies.

carry out shutscaning:
	abide by the disable-learner-options rule;
	say "[if shut-scan is true]The Leet Learner is already[else]You turn the Leet Learner[end if] off. You can turn it on with [llon-cmd].";
	now shut-scan is true;
	the rule succeeds.

to say llon-cmd: say "[b]HUT CAN[r] or [b]LL ON[r] or [b]CC ON[r]"

chapter hutcaning

hutcaning is an action applying to nothing.

understand the command "cc on" as something new.
understand the command "ll on" as something new.
understand the command "hut can" as something new.

understand "cc on" as hutcaning.
understand "ll on" as hutcaning.
understand "hut can" as hutcaning.

carry out hutcaning:
	say "[if shut-scan is false]The Leet Learner is already[else]You turn the Leet Learner[end if] on. You can turn it on with [llon-cmd].";
	now shut-scan is false;
	the rule succeeds.

to say lloff-cmd: say "[b]SHUT SCAN[r] or [b]LL OFF[r] or [b]CC OFF[r]"

chapter helphowing

help-how is a truth state that varies. help-how is true.

helphowing is an action out of world.

understand the command "help how" as something new.

understand "help how" as helphowing.

carry out helphowing:
	if help-how is true, say "Help-how is already on." instead;
	now help-how is true;
	say "Help-how is on. Welp-wow mode is off. In other words, more hints now." instead;
	the rule succeeds.

chapter welpwowing

welpwowing is an action out of world.

understand the command "welp wow" as something new.

understand "welp wow" as welpwowing.

carry out welpwowing:
	if help-how is false, say "Help-how is already off." instead;
	now help-how is false;
	say "Help-how is off. Welp-wow mode is on. In other words, fewer hints now." instead;
	the rule succeeds.

chapter less-loing

less-loing is an action out of world.

less-lo-warn is a truth state that varies.

understand the command "less lo" as something new.
understand the command "lesslo" as something new.
understand the command "llo" as something new.

understand "lesslo" as less-loing when player has leet learner.
understand "less lo" as less-loing when player has leet learner.
understand "llo" as less-loing when player has leet learner.

carry out less-loing:
	now less-lo-warn is false;
	now guess-go is false;
	say "Guess-go is [if guess-go is false]already[else]now[end if] in less-lo mode. You will not see how many possible good guesses you've found about a location or a thing each time you get a new rhyme. To change this, type [b]YES YO[r].";
	the rule succeeds;

chapter yes-yoing

guess-go is a truth state that varies. guess-go is true.

yes-yoing is an action out of world.

understand the command "yes yo" as something new.
understand the command "yesyo" as something new.

understand "yesyo" as yes-yoing.
understand "yes yo" as yes-yoing.
understand "yyo" as yes-yoing.
understand "yy" as yes-yoing.

carry out yes-yoing:
	now less-lo-warn is true;
	now guess-go is false;
	say "Guess-go is [if guess-go is true]already[else]now[end if] in yes-yo mode. You will now see how many possible good guesses you've found about a location or a thing each time you find a new rhyme. To change this, type [b]LESS LO[r].";
	the rule succeeds;

chapter blue bleahing

blue-bleah is a truth state that varies. blue-bleah is false.

bluebleahing is an action out of world.

understand the command "blue bleah" as something new.

understand "blue bleah" as bluebleahing.

carry out bluebleahing:
	if blue-bleah is true, say "Blue-bleah is already on." instead;
	now blue-bleah is true;
	say "Blue-bleah is on. Hoo-Heh is off. In other words, risque writing (mostly random text) has been redacted.";
	the rule succeeds;

chapter hoo hehing

hoohehing is an action out of world.

understand the command "hoo heh" as something new.
understand the command "hooh heh" as something new.
understand the command "heh hooh" as something new.
understand the command "heh hoo" as something new.

understand "hoo heh" as hoohehing.
understand "hooh heh" as hoohehing.
understand "heh hoo" as hoohehing.
understand "heh hooh" as hoohehing.

carry out hoohehing:
	if blue-bleah is false, say "Blue-bleah is already off." instead;
	now blue-bleah is false;
	say "Blue-bleah is off. Hoo-Heh is on. In other words, risque writing (mostly random text) is no longer redacted.";
	the rule succeeds;

chapter guess table stubs

section guess table progress tally

to current-table-note (tn - a table name):
	if guess-go is false, continue the action;
	let temp-poss be 0;
	let temp-got be 0;
	repeat through tn:
		if there is a mist-rule entry:
			process the mist-rule entry;
			if the rule failed, next;
		increment temp-poss;
		if got-yet entry is true, increment temp-got;
	say "[line break]";
	if temp-got is temp-poss:
		say "You've gotten everything you can for that rhyme-pair.";
	else:
		say "You've gotten [temp-got in words] of [temp-poss in words] available related rhyme pairs.";

section guess table arithmetic

to decide which number is nudge-points of (tn - a table name):
	let temp-total be 0;
	repeat through tn:
		if there is a got-yet entry and got-yet entry is true, increment temp-total;
	decide on temp-total;

to decide whether is-exhausted of (tn - a table name):
	repeat through tn:
		if there is no got-yet entry or got-yet entry is false, no;
	yes;

book lurking lump

a lurking lump is a boring rhymable. description is "The lurking lump shines dully. It looks to have [lump-charges in words] charge[plur of lump-charges] for you to make a JERKING JUMP (JJ) if anything is baffling you.". bore-text of lurking lump is "You can only [b]JERKING JUMP[r] ([b]JJ[r]) with the lurking lump.". guess-table of lurking lump is the table of lurking lump guesses.

next-lump-level is a number that varies. next-lump-level is 5.
next-lump-delta is a number that varies. next-lump-delta is 1.
lump-count is a number that varies. lump-count is 0.
lump-charges is a number that varies. lump-charges is 0.
lump-uses is a number that varies. lump-uses is 0.
max-guesses-needed is a number that varies. max-guesses-needed is 10.
total-good-guesses is a number that varies.

to say jjj: say "[b]JJ[r] or [r]JERKING JUMP[r]"

to check-lump-progress:
	increment lump-count;
	if debug-state is true, say "DEBUG count=[lump-count] level=[next-lump-level].";
	if lump-count >= next-lump-level:
		say "[line break][if lurking lump is off-stage]Thwup! You hear a sound...and notice a lurking lump has fallen. Gazing at its dull shine, you realize it could help you move ahead on a tricky rhyme, at the right place at the right time, with [jjj].[paragraph break]You take the lump[else if lurking lump is moot]Thwup! A lurking lump appears again. You take it[else]The lurking lump pulses and grows. All your guesses have paid off[end if].";
		now player has lurking lump;
		increment lump-charges;
		decrease lump-count by next-lump-level;
		increase next-lump-level by next-lump-delta;
		if next-lump-level > max-guesses-needed, now next-lump-level is max-guesses-needed;

volume meta verb definitions

chapter optsing

optsing is an action applying to nothing.

understand the command "opts" as something new.

understand "opts" as optsing.

check optsing:
	say "[2da][b]HELP HOW[r] and [b]WELP WOW[r] toggle the [b]HINT[r] command on and off, respectively. Currently they are [on-off of help-how].";

carry out optsing:
	say "[2da][llon-cmd] turn the Leet Learner on while [lloff-cmd] turn it off. Currently it is [off-on of shut-scan]. You can also use it to see or hide if you're half-right with [b]HA HALF[r]/[b]NAH NAFF[r]. [b]TWO TOO[r] and [b]DO DUE/DUE DO[r] set homonym detection on and off.";

volume more active or help-seeking verb(s)

chapter exitsing

exitsing is an action applying to nothing.

understand the command "exits" as something new.

understand "exits" as exitsing.

exitdirs is a list of directions variable. exitdirs is { north, south, east, west, inside, outside, up, down }.

carry out exitsing:
	let my-exits be 0;
	repeat with Q running through exitdirs:
		let RQ be the room Q of location of player;
		if RQ is not nowhere:
			if my-exits is 0, say "[b]EXIT LIST[r]:[line break]";
			say "[Q]: [if Q is blocked](blocked.)[else if RQ is visited][RQ].[else](unvisited.)[end if]";
			increment my-exits;
	if my-exits is 0, say "There are no clear safe exits. It looks like you need to solve a puzzle to find your way out of here.";
	the rule succeeds.

chapter gotoing

section gotoing

gotoing is an action applying to one visible thing.

understand the command "gi" as something new.
understand the command "gr" as something new.
understand the command "gt" as something new.
understand the command "goto" as something new.
understand the command "go to" as something new.

understand "go to [any visited room]" as gotoing.
understand "goto [any visited room]" as gotoing.
understand "gt [any visited room]" as gotoing.
understand "gr [any visited room]" as gotoing.
understand "go [any visited room]" as gotoing.

does the player mean gotoing a room (called rm):
	if rm is location of player, it is unlikely;
	if rm is visited, it is very likely;
	if rm is available-from-here, it is likely;

carry out gotoing:
	move player to noun;

check gotoing (this is the prevent bad game-specific gotos rule):
	abide by the flag bad goto from rule;
	abide by the flag bad goto to rule;
	if noun is not available-from-here, say "You can't walk to [noun] from here." instead;

section gotothinging

[maybe move this to universal?]

definition: a thing (called th) is known-to-player:
	if th is in Hidey House, yes;
	if th is off-stage, no;
	if location of th is unvisited, no;
	if th is not a backdrop and location of th is visited, yes;
	yes;

gotothinging is an action applying to one visible thing.

does the player mean gotothinging a thing (called th):
	if location of th is unvisited, it is very unlikely;
	if th is moot, it is unlikely;
	if th is carried by the player, it is unlikely;
	if th is not in location of player, it is likely.

understand "go to [any known-to-player thing]" as gotothinging.
understand "goto [any known-to-player thing]" as gotothinging.
understand "gt [any known-to-player thing]" as gotothinging.
understand "gi [any known-to-player thing]" as gotothinging.
understand "go [any known-to-player thing]" as gotothinging.

carry out gotothinging:
	if noun is off-stage, say "Unfortunately, you tried to go to something that wasn't introduced to the game world yet." instead; [shouldn't be necessary, but just in case... we want to avoid weird errors, for now, until things have been tested. ??]
	let Q be location of noun;
	if Q is Hidey House, say "Right now [the noun] is temporarily unavailable." instead;
	if noun is moot, say "Unfortunately, you tried to go to something that has been dealt with. Okay, it's fortunate you dealt with [the noun], but [b]GT[r] doesn't know where to go." instead;
	if debug-state is true, say "DEBUG: [noun] is in [Q], so gotoing there.";
	try gotoing Q instead;

chapter hinting an object verb

rule for supplying a missing noun when hintobjing:
	say "You need to specify what to hint.";
	the rule fails;

hintobjing is an action applying to one thing.

understand "hint [thing]" as hintobjing.
understand "hint on [thing]" as hintobjing.
understand "help [thing]" as hintobjing.
understand "help on [thing]" as hintobjing.

carry out hintobjing:
	abide by the welp-wow-check rule;
	if noun is optional and noun is not optional-noted:
		now noun is optional-noted;
		say "While you can score a point from [the noun], it's not critical to the game. [this-game] notes each such item before giving concrete help. [b]HINT[r] it again to see what to do [the noun]." instead;
	process thing-hint-rule of noun;
	if the rule failed, say "There doesn't seem to be anything more to do with [the noun] in general.";
	the rule succeeds.

this is the welp-wow-check rule:
	if help-how is false:
		say "You've disabled hints with [b]WELP WOW[r]. You need to [b]HELP HOW[r] to turn them on again.";
		the rule succeeds;

book reading

reading is an action applying to one thing.

understand the command "r" as something new.
understand the command "read" as something new.

understand "r [thing]" as reading.
understand "read [thing]" as reading.

definition: a thing (called th) is readable:
	if th is a read-thing listed in the table of readables, yes;
	no;

does the player mean reading a readable thing: it is very likely.
does the player mean reading the leet learner: it is likely.

read-exam-note is a truth state that varies.

carry out reading:
	repeat through table of readables:
		if read-thing entry is noun, say "[read-txt entry][line break]" instead;
	if read-exam-note is false, say "[i][bracket][r][b]NOTE: READ[r][i] and [b]X/EXAMINE[r][i] are functionally equivalent for all items except those giving general advice. Items you can [b]READ[r][i] usually say so when you examine them.[close bracket][r]";
	now read-exam-note is true;
	try examining the noun instead;

volume scoring and such

book SCORE, the parser action

chapter score

the announce the score rule is not listed in the carry out requesting the score rulebook.

to say it-they of (n - a number): say "[if n is 1]it[else]they[end if]";

carry out requesting the score:
	now vc-dont-print is true;
	say "You have scored a total of [current-score] out of [max-overall] points and need [min-needed] to win. You have found [cur-bonus] of [max-bonus] bonus points so far[if bonus-locked-out > 0]. You are locked out of [bonus-locked-out] point[plur of bonus-locked-out][one of]. You can check for the maximum score dropping in the upper right, which usually happens when you take a one-way passage[or][stopping][end if].";
	continue the action;

report requesting the score (this is the lump and half-solved notes rule):
	let dh be doable-hinted;
	let fh be future-hinted;
	if dh + fh > 0:
		say "You also have [dh + fh in words] useful idea[plur of dh + fh] you thought of before you weren't quite ready, and [if dh is 0][it-they of fh] still need[plurnos of fh] to wait[else if fh is 0][dh in words] can be done now[else][dh in words] can be done now, but [fh in words] can't, yet[end if]. You can see more detailed information with [b]THINK[r].";
	else:
		say "You haven't figured any ideas that might score a point later, but if you do, [this-game] will explicitly warn you. [b]THINK[r] would give more detailed information.";
	if lurking lump is not off-stage:
		let gguess be next-lump-level - lump-count;
		say "[line break]You have also used the lurking lump [lump-uses] time[plur of lump-uses] ([lump-charges - lump-uses] left) and are [gguess] of [next-lump-level] good-guess rhymes away from it re[if lurking lump is moot]turn[else]charg[end if]ing. You have made a total of [total-good-guesses] good guesses, as well.";
	now vc-dont-print is false;
	the rule succeeds;

to decide which number is can-do-hint of (ts - a truth state):
	let temp be 0;
	now vc-dont-print is true;
	repeat through the table of verb checks:
		if think-cue entry is true:
			process the check-rule entry;
			let rb-out be the outcome of the rulebook;
			if ts is true:
				if rb-out is the ready outcome or there is no think-advice entry, increment temp; [the reason for "no think-advice entry" is because we also want to track when the beer bull distracts us. If there is no think-advice entry, there are no normal barriers to a certain command.]
			else if rb-out is the not-yet outcome:
				increment temp;
	now vc-dont-print is false;
	decide on temp;

to decide which number is doable-hinted:
	decide on can-do-hint of true;

to decide which number is future-hinted:
	decide on can-do-hint of false;

to decide which number is all-hinted:
	let temp be 0;
	repeat through table of verb checks:
		if think-cue entry is true, increment temp;
	decide on temp;

chapter thinking

the block thinking rule is not listed in any rulebook.

ever-thought is a truth state that varies.

a which-think is a kind of value. the which-thinks are no-details, doable-now, undoable-now. [ we could use 2 booleans for read-laters below, but that is awkward magic number stuff]

to read-laters (wt - a which-think):
	let thought-any be false;
	repeat through table of verb checks:
		if think-cue entry is true:
			if idid entry is true:
				say "DEBUG note--I forgot to clear [b][first-of-ors of w1 entry in upper case][if there is a w2 entry] [first-of-ors of w2 entry in upper case][r][end if] somehow. It would be nice to know how and when this happened.";
				now think-cue entry is false;
				next;
			process the check-rule entry;
			let rb-out be the outcome of the rulebook;
			if wt is no-details:
				if there is a think-advice entry and not too-distracted, next;
				if immediate-attention of check-rule entry, next;
				now thought-any is true;
				let desired-command be indexed text;
				now desired-command is "[first-of-ors of w1 entry in upper case][if there is a w2 entry] [first-of-ors of w2 entry in upper case][end if]";
				if too-distracted:
					say "You tried to [b][desired-command][r], which should've worked, but you were and still are too distracted.";
				else:
					say "Now you're not too distracted, [b][desired-command][r] will probably work[if there is a best-room entry] [here-in of best-room entry][end if].";
				next;
			if there is no think-advice entry or too-distracted:
				unless immediate-attention of check-rule entry, next;
			if wt is doable-now and rb-out is not the ready outcome, next;
			if wt is undoable-now and rb-out is the ready outcome, next;
			if there is a core entry and core entry is false, say "([b]OPTIONAL[r]) ";
			if rb-out is the ready outcome, say "([b]CAN DO NOW[r]) ";
			now thought-any is true;
			say "[think-advice entry][line break]";

[ first, we check if there is anything we can look ahead to ]

check thinking (this is the check for any presolves before thinking rule):
	say "You think about more specific challenges you've encountered and not solved, and what you've done and tried, and what you can do[optional-hint-think-item].";

check thinking (this is the list all presolves while thinking rule):
	if all-hinted > 0:
		now vc-dont-print is true; [ in VVFF, we insert two rules to check for places you can flip ]
		read-laters no-details;
		read-laters doable-now;
		read-laters undoable-now;
	else:
		say "But you don't have leads for any puzzles right now.";

check thinking (this is the list all optional presolves while thinking rule):
	if number of optional-noted things > 0, say "You also know several things that are optional to figure out: [list of optional-noted things].";

carry out thinking:
	if ever-thought is false:
		now ever-thought is true;
		say "[i][bracket][b]NOTE[r][i]: [this-game][i] should indicate whenever you find the right rhyme but can't execute it yet. An asterisk or (+) will also appear in the score in the upper right. Until then, you can [b]THINK[r][i] to see things you figured but aren't quite ready to do yet.";

report thinking:
	now vc-dont-print is false;
	the rule succeeds;

section tried-yet stub

[this isn't in THINK, but it is an auxiliary to say "Hey! You can do Act X now!" ]

to decide whether tried-yet of (vc - a rule):
	let tried-any be false;
	repeat through table of verb checks:
		if vc is check-rule entry:
			now tried-any is true;
			if think-cue entry is true and idid entry is false, decide yes;
	if tried-any is false, say "I tried to check if [vc] was hinted in the THINK command but it wasn't in the help table[not-crit-but].";
	decide no;

book checking/running point-scoring command rule definitions

the goodrhyme rules are a rulebook. the goodrhyme rules have outcomes unavailable, not-yet, already-done, jump-reject, semi-pass and ready.

definition: a rulebook outcome (called oc) is worth-parsing:
	if oc is not-yet outcome or oc is ready outcome, yes;
	no;

volume common item-known rules

this is the lump-known rule: if lurking lump is not off-stage, the rule succeeds;

volume common parser errors

[ this was formerly after the clue half right words rule. We can adjust them. ]

zap-weird-break is a truth state that varies.

to say not-quite-homonyms: say "You feel ... something. But not enough. Homonyms must not quite be the way to go, here. Something similar, but not quite that similar"

Rule for printing a parser error (this is the check for room name and homonyms in player command rule):
	repeat through table of room homonyms:
		if location of player is loc entry:
			if there is a hom-rule entry:
				process the hom-rule entry;
				if the rule failed, break;
				if the rule succeeded, the rule succeeds;
				if there is no myhom entry, next;
			if the player's command includes myhom entry:
				if there is a custom-msg entry:
					say "[custom-msg entry][line break]";
				else:
					say "[not-quite-homonyms].";
				the rule succeeds;
			break;
	if two-too is true:
		repeat through table of thing homonyms: [these look very similar, but I'd like to save a bit of time with breaking on loc entry for room homonyms, so I can't quite combine the code.]
			if mything entry is fungible:
				if there is a hom-rule entry:
					process the hom-rule entry;
					if the rule failed, next;
					if the rule succeeded, the rule succeeds;
					if there is no myhom entry, next;
				if the player's command includes myhom entry:
					if there is a custom-msg entry:
						say "[custom-msg entry][line break]";
					else:
						say "[not-quite-homonyms].";
					the rule succeeds;
	repeat with X running from 1 to the number of words in the player's command:
		if the printed name of location of player matches the regular expression "(^|\W)([word number X in the player's command])($|\W)", case insensitively:
			if action-to-be is the lling action:
				say "It looks like you may have tried to scan the current location. You just need to say [b]LL[r] to do this. Would you like to do so now?[line break]";
				if the player consents:
					skip upcoming rulebook break;
					now zap-weird-break is true;
					try lling location of player;
					now zap-weird-break is false;
					the rule succeeds;
				say "Okay. ";
			else:
				say "It looks like you may have tried to refer to the room name, or part of it. ";
			say "You often need to riff on the room name, but you never need to use the room name directly.";
			the rule succeeds;
	if debug-state is true, say "DEBUG: [the latest parser error].";
	continue the action;

volume jerkingjumping

jerkingjumping is an action applying to nothing.

understand the command "jerking jump" as something new.
understand the command "jj" as something new.

understand "jerking jump" as jerkingjumping.
understand "jj" as jerkingjumping.

in-jerk-jump is a truth state that varies.

to lump-minus:
	decrement lump-charges;
	say "[line break]The lurking lump shrivels[if lump-charges is 0] and vanishes. Maybe more good guesses will bring it back[one of][or] again[stopping][else], but it still looks functional[end if].";
	if lump-charges is 0, moot lurking lump;
	now in-jerk-jump is false;
	increment lump-uses;
	process the score and thinking changes rule;

check jerkingjumping (this is the basic jerkjump check rule):
	if debug-state is false:
		if lurking lump is off-stage:
			say "You have nothing that would help you do that." instead;
		if lurking lump is moot, say "You used up all the lump's charges, but maybe you can get more." instead;
	else:
		say "DEBUG: ignoring the charges in the lump, currently at [lump-charges].";
	now in-jerk-jump is true;

check jerkingjumping (this is the check for finished before jerkjumping rule):
	if doable-hinted > 0:
		say "The lump glistens weirdly. Perhaps you've forgotten something you tried, which didn't work then, but it does, now. ([b]THINK[r] should give details.) Use it anyway?";
		if the player switch-consents, continue the action;
		now in-jerk-jump is false;
		say "Okay. Again, [b]THINK[r] should show what you can do now." instead;

carry out jerkingjumping:
	now vc-dont-print is true;
	repeat through table of verb checks:
		unless there is a core entry, next;
		if core entry is false, next;
		if idid entry is true, next;
		process the check-rule entry;
		let vr be the outcome of the rulebook;
		if vr is the ready outcome:
			say "After some thought, you consider the right way forward: [b][firstor of w1 entry][if there is a w2 entry and check-rule entry is spaceable] [end if][firstor of w2 entry][r]...";
			now idid entry is true; [this is so BURY BILE gets processed. We already checked IDID above.]
			up-which core entry; [?? I really need to clean this code up. I want just to increment the score in one place. If a rule can keep track of the current row, that would be nifty.]
			process the run-rule entry;
			if zap-core-entry is true:
				blank out the core entry;
				now zap-core-entry is false;
			lump-minus;
			now think-cue entry is false;
			now vc-dont-print is false;
			the rule succeeds;
	now vc-dont-print is false;
	say "The lurking lump remains immovable. I guess you've done all you need, here.";
	the rule fails.

volume table variables

to decide which number is left-count of (ta - a table name):
	let temp be 0;
	repeat through ta:
		if got-yet entry is false, increment temp;
	decide on temp;

volume item(s) common to both major games

table of readables
read-thing	read-txt
leet learner	"The [learner] has three toggles: [b]HA HALF[r] (on) and [b]NAH NAFF[r] (off) to note when you are half right. It's currently [on-off of ha-half]. [b]TWO TOO[r] (on) and [b]DO DUE[r] (off) is for homonym detection, and a [b]GUESS GO[r] toggle has [b]YES YO[r] and [b]LESS LO[r], which seems to track how many good guesses you've found so far."

table of leet learner guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"yeet yearner"	--	false	--	--	"Yes, with such a device, you can reach for the skies."

table of lurking lump guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"clerking clump"	lump-known rule	false	--	--	"The lump can't keep track of things. That would be the Leet Learner."
"perking pump"	lump-known rule	false	--	--	"I don't want to know."
"working whump/wump"	lump-known rule	false	--	--	"The lump will act with whatever sound effects it chooses."

Prime Pro Rhyme Row Common ends here.

---- DOCUMENTATION ----
