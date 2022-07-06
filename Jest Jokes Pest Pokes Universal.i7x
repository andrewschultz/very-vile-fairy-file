Version 1/220705 of Jest Jokes Pest Pokes Universal by Andrew Schultz begins here.

"This is a universal file for all the entries in the Jest Jokes Pest Pokes series. It includes very basic things such as the meta-rooms for done items and fungibility."

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
	say "[this-game] is not the first parser game to deal with rhymes. While [other-two] do, other authors have worked with the concept.";
	say "[line break]So, if you like the idea, I recommend the following games from the parser side: Michael Martin's [i]EXTERMINATE![run paragraph on][r] (SpeedIF 2008) and DCBSupafly's [i]Beythilda the Witch Queen[r] (2011 EctoComp) were both SpeedIF. Joey Jones's [i]Danse Nocturne[r] (as Eggerich von Eggermond) as part of Taleslinger's 2012 New Year's competition offered more of a narrative and provides source.";
	say "[line break]On the choice-based side, Pace Smith's [i]Limerick Heist[r] and its sequel [i]Limerick Quest[r] offer rhyme-based puzzles (and meta-commands!) as well, while Snoother's [i]A Tale of the Cave[r] is a tribute to William McGonagall's wonderfully bad poetry.";
	say "[line break]I would love to hear of more such games.";
	the rule succeeds.

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
