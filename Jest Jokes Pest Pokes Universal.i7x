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

Jest Jokes Pest Pokes Universal ends here.

---- DOCUMENTATION ----
