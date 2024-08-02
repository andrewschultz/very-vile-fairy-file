Version 1/220705 of Prime Pro Rhyme Row Universal by Andrew Schultz begins here.

"This is a universal file for all the entries in the Prime Pro Rhyme Row series. It includes very basic things such as the meta-rooms for done items and fungibility."

volume everyone includes these

include Punctuation Stripper by Andrew Schultz.

include Bold Final Question Rows by Andrew Schultz.

understand the command "say" as something new.

volume variables and their stubs

press-pro-level is a number that varies. press-pro-level is 1.

press-pro-warn is a truth state that varies.

note-learner-dots is a truth state that varies.

book global flags

already-rhymed-this is a truth state that varies.

vc-dont-print is a truth state that varies.

in-jerk-jump is a truth state that varies.

section printing

to vcal (t - text): [verb conditional print, flag already rhymed e.g. if HEAP HEAT and then try it again]
	now already-rhymed-this is true;
	if vc-dont-print is false, say "[t][line break]";

to vcp (t - text): [verb conditional print]
	if vc-dont-print is false:
		if vcp-ignore:
			say "That's got to be right somewhere, but you can't focus now. When your mind's less scrambled, you'll figure it out.";
		else:
			say "[t][line break]";

to say first-of-ors of (x - indexed text):
	replace the regular expression "\|.*" in x with "";
	say "[x]";

compare-item is a thing that varies.

got-half-match is a truth state that varies.

book scoring

chapter base variables

core-score is a number that varies. core-score is 0.

cur-bonus is a number that varies. cur-bonus is 0. [ how many bonus points now? ]

core-max is a number that varies. [all necessary points]

max-bonus is a number that varies. [ what is the overall maximum bonus? ]

cur-max-bonus is a number that varies. [ what is achievable in the current game state? ]

to decide which number is bonus-locked-out: decide on max-bonus - cur-max-bonus;

when play begins (this is the set current max points to max points rule): now cur-max-bonus is max-bonus;

to decide which number is current-score: decide on core-score + cur-bonus;

to decide which number is min-needed: decide on core-max + cur-bonus.

to decide which number is max-available: decide on core-max + cur-max-bonus.

to decide which number is max-overall: decide on core-max + max-bonus.

to flip-bonus-core (nu - a number):
	increase core-max by nu;
	decrease max-bonus by nu;
	decrease cur-max-bonus by nu;

zap-core-entry is a truth state that varies.

to up-min: increment cur-bonus;

to up-reg: increment core-score;

to up-which (ts - a truth state):
	if ts is true:
		up-reg;
	else:
		up-min;

to max-down: decrement cur-max-bonus;

chapter replace old score/thinking rule(s)

the score and thinking changes rule is listed instead of the notify score changes rule in the turn sequence rulebook.

llp-notify is a truth state that varies.

last-cur-bonus is a number that varies. last-cur-bonus is 0. cur-bonus is 0.
last-current-score is a number that varies.

to say went-by (nu - a number): say "just went [if nu > 0]up[else]down[end if] by [nu in words] point[unless nu is 1 or nu is -1]s[end if]";

this is the score and thinking changes rule:
	let bonus-delt be cur-bonus - last-cur-bonus;
	let sco-delt be current-score - last-current-score;
	if sco-delt is 0 and bonus-delt is 0, continue the action;
[	say "[core-score] + [cur-bonus] = [core-score + cur-bonus].";]
	say "[i][bracket]Your score ";
	if bonus-delt is 0:
		say "[went-by sco-delt]";
	else if bonus-delt is sco-delt:
		say "and bonus points [went-by bonus-delt]";
	else:
		say "[went-by sco-delt], and your bonus points [went-by bonus-delt]";
	say ".[close bracket][r][line break]";
	now last-cur-bonus is cur-bonus;
	now last-current-score is current-score;
	process the narrative-checking rule;
	if llp-notify is false and last-cur-bonus > 0:
		say "[line break]A stun-steed zooms by, bellowing 'None-need-done deed!' Have you lost focus on what's really important? Or just put in a bit of extra rigor? You decide on the second, as [if entry-in-series is 1]you could also picture the Very Vile Fairy File summoning[else]you could also imagine[end if] a bin-bare-min mare to insult you for finding no extra neat stuff.";
		now llp-notify is true;
	process the note learner changes rule;

to zap-clue (ru - a rule):
	repeat through table of verb checks:
		if ru is check-rule entry or ru is run-rule entry, now think-cue entry is false;

book blank table

section readables

table of readables
read-thing	read-txt
a thing	indexed text

section generic table

table of no good guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
a topic	a rule	a truth state	a number	a rule	text

a room has a table name called guess-table. the guess-table of a room is usually the Table of No Good Guesses.

a rhymable is a kind of thing. a rhymable has a table name called guess-table. the guess-table of a rhymable is usually the Table of No Good Guesses.

a person has a table name called guess-table. the guess-table of a person is usually the Table of No Good Guesses.

volume common verb definitions

chapter dropping

check dropping: say "You never need to drop anything in [this-game]. To help with inventory management, items are usually destroyed once you're done with them, hopefully with some degree of believability." instead;

chapter searching

search-warn is a truth state that varies.

the redirect from search rule is listed first in the check searching rules.

check searching (this is the redirect from search rule):
	if search-warn is false:
		say "One-time note: in [this-game], [b]LOOK IN[r] or [b]SEARCH[r] is redirected to examining, so you can just focus on the [if core-score is 0]puzzle mechanice[else]rhyme pairs[end if].";
		now search-warn is true;
	try examining the noun instead;

volume rules and rulebooks

The print final score rule is not listed in for printing the player's obituary.

the rhymeguess rules are a table name based rulebook.

book universal rules

this is the flag reflexive goto rule: if noun is location of player, say "You're already there! Well, here." instead;

volume types and properties

book rooms

[a room has text called noway-text.] [it conserves memory to put stuff in tables, so that's what we did.]

book boringness

a thing has a rule called bore-rule. bore-rule of a thing is usually the bore-nothing rule.

a thing can be boring. a thing is usually boring. a thing has text called bore-text.

a thing can be borewarned. a thing is usually not borewarned.

skip-bore-text is a truth state that varies.

this is the bore-nothing rule: do nothing;

book LLPs/optionality

a thing can be optional. a thing is usually not optional.

a thing can be optional-noted. A thing is usually not optional-noted.

volume meta item shuffling

there is a region called Get a Guess. [meta mess]

book Gazy Gap

Gazy Gap is a room in Get a Guess. [crazy crap]

book Hidey House

Hidey House is a room in Get a Guess. [mighty mouse: stuff that's only temporarily gone]

book stubs

to moot (th - a thing):
	move th to Gazy Gap; [ic]

definition: a thing (called th) is moot:
	if th is in Gazy Gap, yes;
	no;

definition: a thing (called th) is fungible:
	if th is a backdrop:
		if th is in location of player, yes;
		no;
	if th is in location of player, yes;
	if th is enclosed by the player, yes;
	no;

to decide which region is mrlp:
	decide on map region of location of player;

definition: a thing (called th) is acquired:
	if th is moot, yes;
	if th is enclosed by the player, yes;
	no;

to say firstor of (t - indexed text):
	replace the regular expression "\|.*" in t with "";
	say "[t in upper case]";

volume universal common verbs

book going

[ viability is defined in the game itself. Most of the time it's, is there a room d of location of player? But VVFF switches rooms and exits around a bit. ]

chapter going

check going nowhere (this is the print my own can't go that way rule):
	repeat through table of noways:
		if location of player is noway-rm entry, say "[noway-txt entry][line break]" instead;
	carry out the exitlisting activity;
	the rule succeeds;

section exitslisting

exitlisting is an activity.

rule for exitlisting:
	let lvd be list of viable-gone directions;
	let lvd2 be list of viable-ungone directions;
	add lvd2 to lvd;
	say "You [if noun is diagonal]never need to use diagonal directions[else]can't go [noun][end if], [if number of viable directions is 0]and you may need to figure a puzzle to go anywhere[else]but you can go [lvd][end if].";

after printing the name of a direction (called d) while exitlisting:
	let rm be the room d of location of player;
	if rm is visited, say " to [rm]";

definition: a direction (called d) is viable-gone:
	if d is viable and the room d of location of player is visited, yes;
	no;

definition: a direction (called d) is viable-ungone:
	if d is viable and the room d of location of player is unvisited, yes;
	no;

check going (this is the check diagonal directions rule): if noun is diagonal, say "Diagonal directions aren't used in [this-game]." instead;

the check diagonal directions rule is listed first in the check going rules.

volume universal meta command(s)

chapter abouting

abouting is an action out of world.

understand the command "about" as something new.

understand "about" as abouting.

chapter creditsing

creditsing is an action out of world.

understand the command "credits" as something new.
understand the command "credit" as something new.

understand "credits" as creditsing.
understand "credit" as creditsing.

chapter hinting verb

rmhinting is an action out of world.

understand the command "hint" as something new.
understand the command "help" as something new.
understand the command "hints" as something new.

understand "hint" as rmhinting.
understand "help" as rmhinting.
understand "hints" as rmhinting.

carry out rmhinting:
	abide by the room-hint-rule of location of player;
	say "I should have advice here, but I don't." instead;

chapter no/yes

the block saying no rule is not listed in any rulebook.

check saying no: say "Hi-ho! Why woe? [yn-tell]" instead;

the block saying yes rule is not listed in any rulebook.

check saying yes: say "Yay! Yep! Hey, hep! [yn-tell]" instead;

to say yn-tell: say "[one of](you never need to answer yes/no questions unless specifically prompted.)[or][line break][stopping]"

chapter metaing

metaing is an action out of world.

understand the command "meta" as something new.

understand "meta" as metaing.

report metaing:
	say "[b]CREDITS[r] lists people who helped, and [b]ABOUT[r] gives general information about [this-game].";
	say "[line break][b]VERSION[r] shows you release dates of each version, and [b]EXT[r] shows extension and internal Inform compiler information.";
	say "[line break][b]THINK[r] notes, among other things, where and when you guessed a useful command but weren't prepared yet.";
	say "[line break][b]SOUNDS[r] tells you the complete list of English sounds. [b]OTHER[r] tells you other games similar to [this-game].";

chapter othersing

othersing is an action out of world.

understand the command "others" as something new.
understand the command "other" as something new.

understand "other" as othersing.
understand "others" as othersing.

carry out othersing:
	say "[this-game] is not the first parser game to deal with rhymes in a puzzly context. While [other-ones], do as well, other authors have worked with the concept.";
	say "[line break]So, if you like the idea, I recommend the following games from the parser side: Michael Martin's [i]EXTERMINATE![run paragraph on][r] (SpeedIF 2008) and DCBSupafly's [i]Beythilda the Witch Queen[r] (2011 EctoComp) were both SpeedIF. Joey Jones's [i]Danse Nocturne[r] (as Eggerich von Eggermond) as part of Taleslinger's 2012 New Year's competition offered more of a narrative and provides source.";
	say "[line break]On the choice-based side, Pace Smith's [i]Limerick Heist[r] and its sequel [i]Limerick Quest[r] offer rhyme-based puzzles (and meta-commands!) as well, while Snoother's [i]A Tale of the Cave[r] is a tribute to William McGonagall's wonderfully bad poetry.";
	say "[line break]I would love to hear of more such games.";
	the rule succeeds.

chapter jumping

the block jumping rule is not listed in any rulebook.

check jumping: say "Well, better to have a jumpy jones than grumpy groans." instead;

chapter singing

the block singing rule is not listed in any rulebook.

check singing:
	if entry-in-series is 2 or entry-in-series is 4 or entry-in-series is 5, say "The only sign that comes to mind is [i]Dearie, Dark Eerie Ark[r]." instead;
	say "You hum a few too-totes-new notes, almost stringing together a wry witty dry ditty." instead;

chapter soundsing

soundsing is an action applying to nothing.

understand the command "sounds" as something new.
understand the command "sound" as something new.
understand the command "soun" as something new.
understand the command "sou" as something new.

understand "sounds" and "sound" and "soun" and "sou" as soundsing.

carry out soundsing:
	say "The basic sounds in the English language are:[paragraph break]";
	say "one letter: b k d f g h j l m n p r s t v w x z (c q and x map to others.)";
	say "two letters: ur ar or bl br cl cr dr fl fr gl gr pl pr sk sl sp st sw spr str tr.";
	say "rarer two letters: ch so th (thing or this) wh ng nk oi ow oo (took) aw zh (vision.)";
	the rule succeeds.

chapter swearing

the block swearing mildly rule is not listed in any rulebook.

the block swearing obscenely rule is not listed in any rulebook.

check swearing mildly: try swearing obscenely instead;

chapter talking / talktoing

talktoing is an action applying to one thing.

understand the command "talk to" as something new.
understand the command "talk" as something new.
understand the command "t" as something new.

understand "talk to [something]" as talktoing.
understand "talk [something]" as talktoing.
understand "t [something]" as talktoing.

does the player mean talktoing the player: it is unlikely.

does the player mean talktoing a person: it is very likely.

chapter verbsing

verbsing is an action out of world.

understand the command "v" as something new.
understand the command "verb" as something new.
understand the command "verbs" as something new.

understand "v" as verbsing.
understand "verb" as verbsing.
understand "verbs" as verbsing.

chapter renaming what versioning does

section versioning

versioning is an action applying to nothing.

understand the command "version" as something new.
understand the command "versions" as something new.

understand "version" as versioning.
understand "versions" as versioning.

report versioning: say "To see extensions used in [this-game] and Inform's internal release data, type [b]EXT[r].";

chapter exting

exting is an action out of world.

understand the command "ext" as something new.
understand the command "exts" as something new.

understand "ext" as exting.
understand "exts" as exting.

to showext: (- ShowExtensionVersions(); -)

carry out exting:
	showext;
	say "[line break]All of my extensions should be in the GitHub repo found in [b]ABOUT[r][if entry-in-series > 1], except for the Prime Pro Rhyme Row extensions, which are in the very-vile-fairy-file repo[end if].";
	the rule succeeds;

chapter xyzzying

xyzzying is an action out of world.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

report xyzzying for the first time:
	say "(Cross-promotion: why, yes, [other-ones], have different and equally 'witty' [b]XYZZY[r] responses. Of course they do!)";
	continue the action;

volume guide gong / pride prong / stride strong

hunt-bonus-points is a truth state that varies. [ this is for detailed path checking since I7 can only take two many arguments to a function ]

guide-gong-warn is a truth state that varies. [this is for going north in rocks -- we only see the GONG nag once]

book gong core actions

this is the nothing-left gong rule: completed;

this is the everything-left gong rule: uncompleted;

[this may be moved to PPRR common later]

the gong rules are a rulebook. the gong rules have outcomes completed, llp-remaining, and uncompleted.

a room has a rule called this-gong-rule. this-gong-rule of a room is usually the everything-left gong rule.

a room-hint-state is a kind of value. The room-hint-states are points-left, bonus-left, and nothing-left.

player-room-allow-threshold is a room-hint-state that varies. player-room-allow-threshold is nothing-left.

to reset-go-check:
	now all rooms are not go-checked;
	now location of player is go-checked;

check going when player-room-allow-threshold is not nothing-left:
	if the room gone to is nothing, continue the action;
	now hunt-bonus-points is false;
	reset-go-check;
	if the room gone to is overall-go-useful, continue the action;
	say "[one of]A guide gong[or]That guide gong, again,[stopping] rings to notify you that you don't need to go back through [room gone to]." instead;

a room can be go-checked. a room is usually not go-checked.

book gong core definitions

definition: a room (called rm) is overall-go-useful:
	now hunt-bonus-points is false;
	reset-go-check;
	if rm is go-useful, yes;
	if player-room-allow-threshold is nothing-left, yes;
	if player-room-allow-threshold is bonus-left:
		now hunt-bonus-points is true;
		reset-go-check;
		if rm is go-useful:
			vcal "The pride-prong you summoned earlier pokes you to go and see what's ahead, even if it might not be critical to your quest.";
			yes;
	no;

definition: a room (called rm) is go-useful:
	if rm is location of player, no;
	now rm is go-checked;
	process the this-gong-rule of rm;
	let room-done be the outcome of the rulebook;
	if room-done is the uncompleted outcome, yes;
	if room-done is the llp-remaining outcome and hunt-bonus-points is true, yes;
	repeat with R2 running through rooms:
		unless R2 and rm are gong-adjacent, next;
		if R2 is go-checked, next;
		if R2 is go-useful, yes;
	no;

book gong rules

chapter guide-gonging

guide-gonging is an action out of world.

understand the command "guide gong" as something new.

understand "guide gong" as guide-gonging.

carry out guide-gonging:
	follow the know-ide-ong rule;
	say "You are [if player-room-allow-threshold is points-left]already[else]now[end if] repelled by a guide gong if you try to go down a path where you have nothing game-critical to do in any branches.";
	now player-room-allow-threshold is points-left;
	the rule succeeds;

this is the know-ide-ong rule:
	if guide-gong-warn is false:
		now guide-gong-warn is true;
		say "(disabling later explanation of [b]GUIDE GONG[r], etc., but it will still be in [b]VERBS[r])[paragraph break]";

chapter stride-stronging

stride-stronging is an action out of world.

understand the command "stride strong" as something new.

understand "stride strong" as stride-stronging.

carry out stride-stronging:
	follow the know-ide-ong rule;
	say "You are [if player-room-allow-threshold is nothing-left]already[else]now[end if] able to move freely between locations, even ones with nothing left to do.";
	now player-room-allow-threshold is nothing-left;
	the rule succeeds;

chapter pride-pronging

pride-pronging is an action out of world.

understand the command "pride prong" as something new.

understand "pride prong" as pride-pronging.

carry out pride-pronging:
	follow the know-ide-ong rule;
	say "You are [if player-room-allow-threshold is bonus-left]already[else]now[end if] blocked from paths with no points, critical or bonus, available in any branches.";
	now player-room-allow-threshold is bonus-left;
	the rule succeeds;

volume status line

when play begins (this is the score and status tweak rule):
	now the right hand status line is "[current-score][if doable-hinted > 0](+[doable-hinted])[end if]/[min-needed][if score is min-needed][else if min-needed is max-available]*[else]-[max-available][end if]";
	force-status;
	if map region of location of player is not nothing, now the left hand status line is "[location of the player] ([mrlp])";
	now the turn count is 1;

volume after reading a command

say-warn is a truth state that varies.

no-punc-flag is a truth state that varies.

after reading a command:
	if the player's command matches the regular expression "^ *<\*;>":
		if currently transcripting or debug-state is true:
			say "Noted.";
			reject the player's command;
	let XX be indexed text;
	if the player's command matches the regular expression "<A-Z>": [bold-ok]
		let XX be the player's command;
		change the text of the player's command to "[XX in lower case]";
		if debug-state is true, say "(LOWERCASING) [XX][line break]";
	if word number 1 in the player's command is "say":
		unless good-say-guess:
			if say-warn is false:
				now say-warn is true;
				say "[i][bracket][b]NOTE[r][i]: you never need to [b]SAY[r][i] anything. Just type it in. In other words, [b]WHOAH[r][i] is the same as [b]SAY WHOAH[r][i]. [this-game] will cut [b]SAY[r][i] off of the start of all commands. Use [b]T[r][i] to talk to an NPC.[close bracket][r]";
			let XX be the player's command;
			replace the regular expression "^say " in XX with "";
			change the text of the player's command to XX;

volume text stubs

book hint text stubs

to say done-here: say "you're done here in [location of player]"

to say done-item: say "you're done rhyming that"

this is the hint-just-scenery rule: say "You don't have to worry about [the noun], which is just scenery to provide clues or atmosphere." instead;
this is the hint-done-stuff rule: say "You summoned [the noun] into existence, which is enough. You'll want to look elsewhere for double-rhymes." instead;

to say outside-item: say "An outside item is required for what you need to do next"

book proper names

series-names is a list of text variable. series-names is { "[vvff]", "[qqnn]", "[lljj]", "[csdd]", "[ttdd]" }

entry-in-series is a number that varies.

when play begins:
	if entry-in-series > 0, remove entry entry-in-series from series-names;

to say other-ones: say "[series-names], the other [(number of entries in series-names) in words] entries in the [pprr] series"

to say pprr: say "[i]Prime Pro-Rhyme Row[r]"

to say pprrs: say "the [pprr] series"

to say vvff: say "[i]Very Vile Fairy File[r]"

to say qqnn: say "[i]Quite Queer Night Near[r]"

to say lljj: say "[i]Low-Key Learny Jokey Journey[r]"

to say csdd: say "[i]Civil Seeming Drivel Dreaming[r]"

to say ttdd: say "[i]There Those Dare Doze[r]"

book bug notes

to say not-crit-but: say ". This is not a critical bug, but I'd like to know about it"

volume parser stuff that's everywhere

[this is the big one that is consistent across games, where we detect good guesses]

Rule for printing a parser error (this is the look through good guess tables rule):
	now compare-item is the player;
	now got-half-match is false;
	abide by the rhyme-guess-checker rule for the table of first check rhymes;
	abide by the game-specific-backdrop-check rule;
	unless guess-table of location of player is table of no good guesses:
		[if debug-state is true, say "DEBUG location guesses: [location of player], [guess-table of location of player].";]
		abide by the rhyme-guess-checker rule for guess-table of location of player;
	let table-list be a list of table names;
	repeat with fun running through fungible rhymables:
		let gtt be guess-table of fun;
		if gtt is table of no good guesses or gtt is listed in table-list, next;
		add gtt to table-list;
		now compare-item is fun;
		abide by the rhyme-guess-checker rule for gtt;
	repeat with fun running through fungible people:
		let gtt be guess-table of fun;
		if gtt is table of no good guesses or gtt is listed in table-list, next;
		add gtt to table-list;
		now compare-item is fun;
		abide by the rhyme-guess-checker rule for gtt;
	abide by the verb-checker rule;
	abide by the rhyme-guess-checker rule for table of general good guesses;
	if press-pro-level is 4 and got-half-match is true, say "The leet learner beeps weirdly. You had one word guessed right." instead;
	continue the action;

the look through good guess tables rule is listed first in the for printing a parser error rulebook.

volume backwards compatibility for now

table of stuff
mist-cmd (topic)	mist-regex (text)
--	--

Prime Pro Rhyme Row Universal ends here.

---- DOCUMENTATION ----
