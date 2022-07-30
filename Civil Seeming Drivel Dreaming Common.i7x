Version 1/220705 of Civil Seeming Drivel Dreaming Common by Andrew Schultz begins here.

"This is a common file for the two larger entries in the Civil Seeming Drivel Dreaming series: Very Vile Fairy File and Low-Key Learny Jokey Journey. It includes variables used for the hinting device, among other things."

include Civil Seeming Drivel Dreaming Universal by Andrew Schultz.

volume leet learner portable code

chapter stubs

to say ll: say "[b]LL[r]"

book room- and rule-based stubs

to say here-in of (rm - a room): say "[if rm is location of player]here[else]in [rm][end if]"

to say here-to of (rm - a room): say "[if rm is location of player]here[else]to [rm][end if]"

to say swh of (rm - a room): say "[if rm is unvisited]somewhere new[else][rm][end if]"

to say once-now of (ru - a rule):
	process ru;
	let rbo be the outcome of the rulebook;
	say "[if rbo is the ready outcome]now[else]once[end if]"

book leet learner and needle

the leet learner is a thing. description is "It says [b]LEET LEARNER/CHEAT CHURNER[r]. You can probably [b]READ[r] it more in depth, because, well, there's more.[paragraph break]It has two main settings: [b]HUT! CAN![r] (on) and [b]SHUT SCAN[r] (off). It's currently [off-on of shut-scan]. [ll]/[b]CC ON[r]/[b]OFF[r] can turn it on or off.[paragraph break]Also, to use it, [ll] (something). [ll] with no argument scans the current location.[paragraph break]It also has a toggle between [b]HA HALF[r] (on) and [b]NAH NAFF[r] (off) to note when you are half right. It's currently [on-off of ha-half]. There's another toggle between [b]TWO TOO[r] (on) and [b]DO DUE[r] (off)[if core-score > 1] for homonym detection[end if]."

the needle is part of the leet learner. it is boring. description is "The needle will move (or not) whenever you SCAN something.". bore-text of needle is "You can't really operate the needle, and you don't need to.".

understand "cheat/churner" and "cheat churner" as leet learner.

after printing the name of leet learner while taking inventory: say " ([off-on of shut-scan])";

understand "ll" and "cc" as leet learner.

to say will-wont of (ts - a truth state):
	say "[if ts is true]will[else]won't[end if]"

ll-flip-warn is a truth state that varies.

first-room is a room that varies.

first-main-room is a room that varies.

this is the wait-after-intro rule:
	if player is in first-room, say "I want to make sure you have some basic familiarity with the game mechanic before disabling any Leet Learner options. So I'm going to make you wait until you've explored beyond [first-room]." instead;
	if first-main-room is not visited and ll-flip-warn is false:
		now ll-flip-warn is true;
		say "It's recommended you wait until finishing the introduction before shutting off the Leet Learner. Do you still wish to toggle a feature?";
		if the player yes-consents, continue the action;
		say "OK. This nag won't appear again.";

book options verbs

chapter two too functionality

two-too is a truth state that varies.

section twotooing

twotooing is an action applying to nothing.

understand the command "two too" as something new.

understand "two too" as twotooing.

carry out twotooing:
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
	abide by the wait-after-intro rule;
	say "[if two-too is false]Homonym detection is already set[else]You set homonym detection[end if] to off.";
	now two-too is false;
	the rule succeeds.

chapter ha half functionality

section ha half button

ha-half is a truth state that varies.

the ha half nah naff button is part of the leet learner. description is "It is set [on-off of ha-half], meaning if you get a guess half-right, the Leet Learner [will-wont of ha-half] alert you."

section hahalfing

hahalfing is an action applying to nothing.

understand the command "ha half" as something new.

understand "ha half" as hahalfing.
understand "half" as hahalfing.
understand "hh" as hahalfing.

carry out hahalfing:
	say "[if ha-half is true]The Leet Learner is already set[else]You set the Leet Learner[end if] to Ha Half.";
	now ha-half is true;
	the rule succeeds.

section nahnaffing

nahnaffing is an action applying to nothing.

understand the command "nah naff" as something new.

understand "nah naff" as nahnaffing.
understand "naff" as nahnaffing.
understand "nn" as nahnaffing.

carry out nahnaffing:
	abide by the wait-after-intro rule;
	say "[if ha-half is false]The Leet Learner is already set[else]You set the Leet Learner[end if] to Nah Naff.";
	now ha-half is false;
	the rule succeeds.

chapter lling

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

rule for supplying a missing noun when lling:
	if cht of the player is not phbt:
		say "You are so focused inward, you just point the learner at yourself.";
		now the noun is the player;
	else:
		say "You wave the leet learner all around [location of player]...";
		now the noun is the location of the player;
	continue the action;

ever-opt-scan is a truth state that varies.

to say ll-cheat of (rm - a room): say "[scancol of cht of rm]"

to say ll-cheat of (th - a thing):
	if force-partminus of th:
		say "[scancol of partminus]";
	else:
		say "[scancol of cht of th]"

zap-weird-break is a truth state that varies.

carry out lling:
	if player does not have the leet learner, say "Regular hints aren't available." instead; [this should not happen]
	if noun is leet learner, say "The leet learner is great as it is. You don't want to change it." instead;
	if shut-scan is true, say "You turned the Leet Learner off, so nothing shows up." instead;
	abide by the game-specific-ll-direction rule;
	if cht of noun is phbt, say "The needle area of the leet learner stays dark when you scan [the noun][if noun is a room], so there's nothing you need to do with the room title[end if]." instead;
	say "The leet learner needle lights up[if noun is optional], but dimly[end if]. Then it [ll-cheat of noun] as you [if noun is a room]wave it around[else]focus it on [the noun][end if].[if zap-weird-break is true][run paragraph on][end if]";
	if noun is optional and ever-opt-scan is false:
		say "[line break]The faint light must mean something. The learner is usually lit solidly or not at all.";
		now ever-opt-scan is true;
	the rule succeeds.

ever-leet-clue is a truth state that varies.

to say leetclue of (x - a cheattype) and (isopt - a truth state):
	if shut-scan is true, continue the action;
	say "[line break]As you say/think this, the Leet Learner[if isopt is true] dims a bit, and the[end if] needle [scancol of x]";
	if first-main-room is visited and ever-leet-clue is true, continue the action;
	now ever-leet-clue is true;
	if leetcool is 0:
		say ". Once you do something that makes progress, you may wish to remember how the words you saw or read combined with the Leet Learner reading";
		now leetcool is a random number between 3 and 6;
	else:
		decrement leetcool;

leetcool is a number that varies. leetcool is 0.

to say scancol of (x - a cheattype): say "[if x is letplus]swerves left[else if x is partplus]slides center-left[else if x is leteq]stays at the center[else if x is partminus]slides center-right[else if x is letminus]swerves right[else if x is letboth]bounces back and forth[else if x is phbt]sits in the center[else]BUG[end if]"

this is the welp-wow-check rule:
	if help-how is false:
		say "You've disabled hints with [b]WELP WOW[r]. You need to [b]HELP HOW[r] to turn them on again.";
		the rule succeeds;

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
	abide by the wait-after-intro rule;
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

book deciphering mistakes

[to decide which number is variable-scan-length of (mynum - a number):] [keep this in the main file]

a rhymeguess rule for a table name (called tn) (this is the rhyme-guess-checker rule):
	repeat through tn:
		if the player's command matches mist-cmd entry:
			if there is a mist-rule entry:
				process the mist-rule entry;
				unless the rule succeeded, continue the action;
			say "[mist-txt entry][line break]";
			let see-leet-read be true;
			let is-opt be false;
			if there is a leet-rule entry:
				process the leet-rule entry;
				unless the rule succeeded, now see-leet-read is false;
			if see-leet-read is true and there is a magicnum entry: [see mistakes file for explanations of magic numbers]
				let Q be magicnum entry;
				if Q >= 100: [Just to make sure we start with a number that's out of bounds]
					now Q is variable-scan-length of Q;
					if debug-state is true, say "DEBUG: dynamic magic number directed us to [Q / 10] / [the remainder after dividing Q by 10].";
				if Q < 0:
					now is-opt is true;
					now Q is 0 - Q;
				if Q is not 0:
					let d1 be Q / 10;
					let d2 be the remainder after dividing Q by 10;
					decrease d1 by number of characters in word number 1 in the player's command;
					decrease d2 by number of characters in word number 2 in the player's command;
					let cc be cluecheat of d1 and d2;
					say "[leetclue of cc and is-opt].";
			if got-yet entry is false:
				increment total-good-guesses;
				check-lump-progress;
			now got-yet entry is true;
			the rule succeeds;

to decide which cheattype is the cluecheat of (n1 - a number) and (n2 - a number):
	if n2 > n1, decide on cluecheat of n2 and n1;
	if n1 is 0 and n2 is 0, decide on leteq; [center]
	if n1 > 0 and n2 is 0, decide on partplus; [center left]
	if n1 > 0 and n2 > 0, decide on letplus; [left]
	if n1 is 0 and n2 < 0, decide on partminus; [center right]
	if n1 < 0 and n2 < 0, decide on letminus; [right]
	decide on letboth; [one +, one minus, wobbles]

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

report optsing:
	if core-score >= 1, say "[2da]Y[narr-toggle]. Extra point-scoring narrative is currently [on-off of narr-on].";
	continue the action;

narr-on is a truth state that varies. narr-on is true.

to say narr-toggle: say "ou can turn off post-point-scoring narratives with [b]NO NARR[r] or turn them back on with [b]WHOA(H) WHERE[r]"

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
			if my-exits is 0, say "LIST OF EXITS:[line break]";
			say "[Q]: [if Q is blocked](unavailable.)[else if RQ is visited][RQ].[else](unvisited.)[end if]";
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

section thing hint rule definitions

a thing has a rule called thing-hint-rule. thing-hint-rule of a thing is usually trivially false rule. [postalf]

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

chapter initialize the table

table of readables
read-thing	read-txt
leet learner	"Some text matches up with where the needle nose might spin. It's a bit of a stretch, in some cases, but you figure the more help the better.[paragraph break][table-of-needle-hints][run paragraph on]"

section stuff about the leet learner

to say table-of-needle-hints: [puncok]
	repeat through table of color clues:
		say "[fixed letter spacing][my-text entry][variable letter spacing] is written to the [my-color entry].";
	say "[line break]Also, TREAT TURNER is plastered across the bottom in wavy font. Maybe if you know what everything else stands for, you can figure that, too."

table of color clues
my-text	my-color
"CONCEIT CONCERNER"	"left"
"  CHEAT CHURNER  "	"center-left"
"   MEET MOURNER  "	"center"
"   BEAT BURNER   "	"center-right"
"    EAT EARNER   "	"right"

volume scoring and such

book SCORE, the parser action

chapter score

the announce the score rule is not listed in the carry out requesting the score rulebook.

to say it-they of (n - a number): say "[if n is 1]it[else]they[end if]";

carry out requesting the score:
	now vc-dont-print is true;
	say "You have scored a total of [score] out of [max-overall] points and need [min-needed] to win. You have found [cur-bonus] of [max-bonus] optional points so far.";
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
		say "[line break]You have also used the lurking lump [lump-uses] time[plur of lump-uses] and are [gguess] of [next-lump-level] good-guess rhymes away from it re[if lurking lump is moot]turn[else]charg[end if]ing. You have made a total of [total-good-guesses] good guesses, as well.";
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

section replace old score/thinking rule(s)

the score and thinking changes rule is listed instead of the notify score changes rule in the turn sequence rulebook.

llp-notify is a truth state that varies.

this is the score and thinking changes rule:
	process the notify score changes rule;
	repeat through table of verb checks:
		if think-cue entry is true and idid entry is true, now think-cue entry is false;
	process the narrative-checking rule;
	if llp-notify is false and min-needed > core-max:
		say "[line break]A stun-steed zooms by, bellowing 'None-need-done deed!' Have you lost focus on what's really important? Or just put in a bit of extra rigor? You decide on the second, as [if entry-in-series is 1]you could also picture the Very Vile Fairy File summoning[else]you could also imagine[end if] a bin-bare-min mare to insult you for finding no extra neat stuff.";
		now llp-notify is true;

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
				if thought-any is false, say "[line break]";
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
			if thought-any is false, say "[line break]";
			if there is a core entry and core entry is false, say "([b]OPTIONAL[r]) ";
			if rb-out is the ready outcome, say "([b]CAN DO NOW[r]) ";
			now thought-any is true;
			say "[think-advice entry][line break]";

[ first, we check if there is anything we can look ahead to ]

check thinking (this is the check for any presolves before thinking rule):
	say "You think about more specific challenges you've encountered and not solved, and what you've done and tried, and what you can do[optional-hint-think-item].";
	if all-hinted is 0, say "[line break]But you don't have leads for any puzzles right now." instead;
	now vc-dont-print is true; [ in VVFF, we insert two rules to check for places you can flip ]

check thinking (this is the list all presolves while thinking rule):
	read-laters no-details;
	read-laters doable-now;
	read-laters undoable-now;
	if ever-thought is false:
		now ever-thought is true;
		say "[line break][b]NOTE[r]: The game will indicate when one command you found early will be applicable. An asterisk or (+) will also appear in the score in the upper right. Until then, you can [b]THINK[r] to see things you figured but aren't quite ready to do yet.";

check thinking (this is the list all optional presolves while thinking rule):
	if number of optional-noted things > 0, say "You also know several things that are optional to figure out: [list of optional-noted things].";

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

the goodrhyme rules are a rulebook. the goodrhyme rules have outcomes unavailable, not-yet, already-done and ready.

volume common item-known rules

this is the lump-known rule: if lurking lump is not off-stage, the rule succeeds;

volume common parser errors

[ this was formerly after the clue half right words rule. We can adjust them. ]

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
			if word number 1 in the player's command is "ll":
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

volume item(s) common to both major games

table of lurking lump guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"clerking clump"	lump-known rule	false	--	--	"The lump can't keep track of things. That would be the Leet Learner."
"perking pump"	lump-known rule	false	--	--	"I don't want to know."

Civil Seeming Drivel Dreaming Common ends here.

---- DOCUMENTATION ----
