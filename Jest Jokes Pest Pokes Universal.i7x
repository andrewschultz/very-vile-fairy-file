Version 1/220705 of Jest Jokes Pest Pokes Universal by Andrew Schultz begins here.

"This is a universal file for all the entries in the Jest Jokes Pest Pokes series. It includes very basic things such as the meta-rooms for done items and fungibility."

volume variables and their stubs

book global flags

already-rhymed-this is a truth state that varies.

vc-dont-print is a truth state that varies.

section printing

to vcp (t - text): [verb conditional print]
	if vc-dont-print is false, say "[t][line break]";

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

volume rules and rulebooks

the rhymeguess rules are a table name based rulebook.

volume types

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

definition: a thing (called th) is known-to-player:
	if th is in Hidey House, no;
	if th is off-stage, no;
	if th is not a backdrop and location of th is unvisited, yes;
	yes;

definition: a thing (called th) is acquired:
	if th is moot, yes;
	if th is enclosed by the player, yes;
	no;

volume universal meta command(s)

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

chapter xyzzying

xyzzying is an action out of world.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

report xyzzying for the first time:
	say "(Cross-promotion: why, yes, [other-two], have different and equally 'witty' [b]XYZZY[r] responses. Of course they do!)";
	continue the action;

volume proper names

series-names is a list of text variable. series-names is { "[vvff]", "[qqnn]", "[lljj]" }

entry-in-series is a number that varies.

when play begins:
	remove entry entry-in-series from series-names;

to say other-two: say "[series-names], the other two entries in [jjpp]"

to say jjpp: say "[i]Jest Jokes Pest Pokes[r]"

to say jjpps: say "the [jjpp] series"

to say vvff: say "[i]Very Vile Fairy File[r]"

to say qqnn: say "[i]Quite Queer Night Near[r]"

to say lljj: say "[i]Low-Key Learny Jokey Journey[r]"

Jest Jokes Pest Pokes Universal ends here.

---- DOCUMENTATION ----
