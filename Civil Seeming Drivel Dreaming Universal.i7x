Version 1/220705 of Civil Seeming Drivel Dreaming Universal by Andrew Schultz begins here.

"This is a universal file for all the entries in the Civil Seeming Drivel Dreaming series. It includes very basic things such as the meta-rooms for done items and fungibility."

volume variables and their stubs

book global flags

already-rhymed-this is a truth state that varies.

vc-dont-print is a truth state that varies.

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

book scoring

core-score is a number that varies. core-score is 0.

core-max is a number that varies.

min-needed is a number that varies.

max-bonus is a number that varies.

cur-bonus is a number that varies.

to decide which number is max-overall:
	decide on core-max + max-bonus.

max-poss is a number that varies.

zap-core-entry is a truth state that varies.

to up-min:
	increment min-needed;
	increment the score;

to up-reg:
	increment core-score;
	increment the score;

to up-which (ts - a truth state):
	if ts is true:
		up-reg;
	else:
		up-min;
		increment cur-bonus;

to max-down: decrement max-poss;

book blank table

section generic table

table of no good guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
a topic	a rule	a truth state	a number	a rule	text

a room has a table name called guess-table. the guess-table of a room is usually the Table of No Good Guesses.

a rhymable is a kind of thing. a rhymable has a table name called guess-table. the guess-table of a rhymable is usually the Table of No Good Guesses.

a person has a table name called guess-table. the guess-table of a person is usually the Table of No Good Guesses.

volume common verb definitions

volume rules and rulebooks

The print final score rule is not listed in for printing the player's obituary.

the rhymeguess rules are a table name based rulebook.

volume types and properties

book rooms

a room has text called noway-text.

book boringness

a thing has a rule called bore-rule. bore-rule of a thing is usually the bore-nothing rule.

a thing can be boring. a thing is usually boring. a thing has text called bore-text.

a thing can be borewarned. a thing is usually not borewarned.

skip-bore-text is a truth state that varies.

this is the bore-nothing rule: do nothing;

book LLPs/optionality

a thing can be optional. a thing is usually not optional.

a thing can be optional-noted. A thing is usually not optional-noted.

book cheat/hint types

cheattype is a kind of value. the cheattypes are phbt, letplus, letminus, partplus, partminus, leteq, letboth, and allover.

chapter un-hinting

to phbt (x - a thing):
	now cht of x is phbt;
	now x is not optional-noted;
	now x is not optional;

to phbt (x - a room): now cht of x is phbt;

a room has a cheattype called cht. cht of a room is usually phbt.

a thing has a cheattype called cht. cht of a thing is usually phbt.

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

understand "credits" as creditsing.

chapter hinting verb

hinting is an action out of world.

understand the command "hint" as something new.
understand the command "help" as something new.
understand the command "hints" as something new.

understand "hint" as hinting.
understand "help" as hinting.
understand "hints" as hinting.

chapter othersing

othersing is an action out of world.

understand the command "others" as something new.
understand the command "other" as something new.

understand "other" as othersing.
understand "others" as othersing.

carry out othersing:
	say "[this-game] is not the first parser game to deal with rhymes. While [other-two], do as well, other authors have worked with the concept.";
	say "[line break]So, if you like the idea, I recommend the following games from the parser side: Michael Martin's [i]EXTERMINATE![run paragraph on][r] (SpeedIF 2008) and DCBSupafly's [i]Beythilda the Witch Queen[r] (2011 EctoComp) were both SpeedIF. Joey Jones's [i]Danse Nocturne[r] (as Eggerich von Eggermond) as part of Taleslinger's 2012 New Year's competition offered more of a narrative and provides source.";
	say "[line break]On the choice-based side, Pace Smith's [i]Limerick Heist[r] and its sequel [i]Limerick Quest[r] offer rhyme-based puzzles (and meta-commands!) as well, while Snoother's [i]A Tale of the Cave[r] is a tribute to William McGonagall's wonderfully bad poetry.";
	say "[line break]I would love to hear of more such games.";
	the rule succeeds.

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

chapter verbsing

verbsing is an action out of world.

understand the command "v" as something new.
understand the command "verb" as something new.
understand the command "verbs" as something new.

understand "v" as verbsing.
understand "verb" as verbsing.
understand "verbs" as verbsing.

chapter versioning

versioning is an action applying to nothing.

understand the command "version" as something new.

understand "version" as versioning.

chapter xyzzying

xyzzying is an action out of world.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

report xyzzying for the first time:
	say "(Cross-promotion: why, yes, [other-two], have different and equally 'witty' [b]XYZZY[r] responses. Of course they do!)";
	continue the action;

volume status line

when play begins (this is the score and status tweak rule):
	now the maximum score is min-needed + max-bonus;
	now max-poss is the maximum score;
	now the right hand status line is "[score][if doable-hinted > 0](+[doable-hinted])[end if]/[min-needed][if score is min-needed][else if min-needed is max-poss]*[else]-[max-poss][end if]";
	force-status;
	now the left hand status line is "[location of the player] ([mrlp])";
	now the turn count is 1;

volume text stubs

book proper names

series-names is a list of text variable. series-names is { "[vvff]", "[qqnn]", "[lljj]" }

entry-in-series is a number that varies.

when play begins:
	remove entry entry-in-series from series-names;

to say other-two: say "[series-names], the other two entries in [csdd]"

to say csdd: say "[i]Civil Seeming Drivel Dreaming[r]"

to say csdds: say "the [csdd] series"

to say vvff: say "[i]Very Vile Fairy File[r]"

to say qqnn: say "[i]Quite Queer Night Near[r]"

to say lljj: say "[i]Low-Key Learny Jokey Journey[r]"

book bug notes

to say not-crit-but: say ". This is not a critical bug, but I'd like to know about it"

Civil Seeming Drivel Dreaming Universal ends here.

---- DOCUMENTATION ----
