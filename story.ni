"Very Vile Fairy File" by Andrew Schultz

volume includes

include Trivial Niceties Z-Only by Andrew Schultz.

volume definitions

definition: a thing (called th) is moot:
	if th is in Zapped Zone, yes;
	no;

to say swh of (r - a room): say "[if r is unvisited]somewhere new[else][r][end if]"

to moot (th - a thing):
	move th to Zapped Zone; [ic]

to move-to-temp (th - a thing):
	if th is in location of player, move th to hidey house;

to move-from-temp (th - a thing):
	if th is in hidey house or th is off-stage, move th to location of player;

to bold-my-room:
	say "[b][location of player][r][paragraph break]"

min-needed is a number that varies. min-needed is 3.

the maximum score is 4.

to up-min:
	increment min-needed;
	increment the score;

main is a region.

volume you

Kerry Kyle is a person. The player is Kerry Kyle.

volume rooms

part wet wood

Wet Wood is a room.

chapter getgooding

getgooding is an action applying to nothing.

understand the command "getgood" as something new.
understand the command "get good" as something new.

understand "getgood" as getgooding.
understand "get good" as getgooding.

get-good is a truth state that varies.

carry out getgooding:
	if get-good is true, say "You already did." instead;
	say "You realize you can reason your way out of the Wet Wood.";
	increment the score;
	move player to cark cliff;
	the rule succeeds;

part Cark Cliff

Cark Cliff is a room. "'Cark' is an ancient word meaning worry[if spliff-sparked is true]. You forget what you were supposed to be worried about, now."

tree-down is a truth state that varies.

The Tall Tree is a thing in Cark Cliff. "[if tree-down is false]A tall tree sits here, bending out over the cliff to the north. It could make a bridge reaching the other side[else]The tree has fallen north, giving passage to [swh of the room north of cark cliff][end if]."

check going north in cark cliff:
	if tree-down is false, say "You need a way off the cliff edge. Well, a safe one." instead;

chapter spark-spliffing

sparkspliffing is an action applying to nothing.

understand the command "spark spliff" as something new.

understand "spark spliff" as sparkspliffing.

spliff-sparked is a truth state that varies.

carry out sparkspliffing:
	if spliff-sparked is true, say "Whoah, dude. You already did." instead;
	now spliff-sparked is true;
	say "Whoah, dude! You totally discover a hidden spliff. You're less worried now.";
	up-min;
	the rule succeeds;

chapter freefalling

freefalling is an action applying to nothing.

understand the command "free fall" as something new.
understand the command "fall free" as something new.

understand "free fall" as freefalling.
understand "fall free" as freefalling.

carry out freefalling:
	if tree-down is true, say "You don't need the tree to fall any further." instead;
	say "The tree, already tipping over the cliff, leans and ... falls over. You can go north across it now.";
	now tree-down is true;
	increment the score;
	the rule succeeds;

part History Hall

mistmall is a truth state that varies.

History Hall is north of Cark Cliff. printed name of history hall is "[if mistmall is true]Mystery Mall[else]History Hall[end if]".

the Gutta Ganksta is a person.

chapter historyhalling

historyhalling is an action applying to nothing.

understand the command "history hall" as something new.

understand "history hall" as historyhalling.

carry out historyhalling:
	if mistmall is false, say "You're already in History Hall.";
	move-to-temp gutta ganksta;
	bold-my-room;
	the rule succeeds;

chapter mysterymalling

evermall is a truth state that varies.

mysterymalling is an action applying to nothing.

understand the command "mystery mall" as something new.

understand "mystery mall" as mysterymalling when player is in history hall.

carry out mysterymalling:
	if mistmall is true, say "You're already in the mystery mall." instead;
	move-from-temp gutta ganksta;
	now mistmall is true;
	if evermall is false:
		increment the score;
		now evermall is true;
	bold-my-room;
	the rule succeeds;

part curst cave

Curst Cave is a room.

the worst wave is scenery in Curst Cave.

chapter firstfaveing

firstfaveing is an action applying to nothing.

understand the command "firstfave" as something new.
understand the command "first fave" as something new.

understand "firstfave" as firstfaveing when player is in curst cave.
understand "first fave" as firstfaveing.

first-fave is a truth state that varies.

carry out firstfaveing:
	if first-fave is true, say "You already did." instead;
	say "Suddenly, the curst cave isn't very bad at all.";
	increment the score;
	now first-fave is true;
	the rule succeeds;

part dead doom

dead doom is a room.

volume verbs

chapter listening

instead of listening:
	if player is in wet wood, say "Bet, bud! Met mud!" instead;
	say "Nothing special."

volume meta

Meta is a region.

a capped cone is a thing.

Zapped Zone is a room in Meta.

Hidey House is a room in Meta.

volume unsorted

book pain peasant

the pain peasant is a person.

chapter plainpleasanting

plainpleasanting is an action applying to nothing.

understand the command "plainpleasant" as something new.

understand "plainpleasant" as plainpleasanting.

carry out plainpleasanting:
	say "The pain peasant is much nicer now. You have a chat about stuff, and the peasant takes leave to go do peasant things.";
	moot Pain Peasant;
	the rule succeeds;

Lit Lawn is a room.

[?? burned bower/turned tower]

Vast Void is a room.

