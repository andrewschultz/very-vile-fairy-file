Version 1/220705 of Jest Jokes Pest Pokes Common by Andrew Schultz begins here.

"This is a common file for all the entries in the Jest Jokes Pest Pokes series. It includes variables used for the hinting device, among other things."

volume leet learner portable code

chapter stubs

to say ll: say "[b]LL[r]"

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

section halfing

halfing is an action applying to nothing.

understand the command "ha half" as something new.

understand "ha half" as halfing.
understand "half" as halfing.
understand "hh" as halfing.

carry out halfing:
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

volume scoring and such

book replace old score/thinking rule(s)

the score and thinking changes rule is listed instead of the notify score changes rule in the turn sequence rulebook.

llp-notify is a truth state that varies.

this is the score and thinking changes rule:
	process the notify score changes rule;
	repeat through table of verb checks:
		if think-cue entry is true and idid entry is true, now think-cue entry is false;
	process the narrative-checking rule;
	if llp-notify is false and min-needed > core-max:
		say "A stun-steed zooms by, bellowing 'None-need-done deed!' Have you lost focus on what's really important? Or just put in a bit of extra rigor? You decide on the second, as you could also picture the Very Vile Fairy File summoning a bin-bare-min mare to insult you for finding no extra neat stuff.";
		now llp-notify is true;

book checking/running point-scoring command rule definitions

the goodrhyme rules are a rulebook. the goodrhyme rules have outcomes unavailable, not-yet, already-done and ready.

Jest Jokes Pest Pokes Common ends here.

---- DOCUMENTATION ----
