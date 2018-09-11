"Very Vile Fairy File" by Andrew Schultz

volume definitions

definition: a thing (called th) is moot:
	if th is in Zapped Zone, yes;
	no;

to say swh of (r - a room): say "[if r is unvisited]somewhere new[else][r][end if]"

to moot (th - a thing):
	move th to Zapped Zone; [ic]

min-needed is a number that varies. min-needed is 1.

the maximum score is 2.

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

sparkspliffing is an action out of world.

understand the command "spark spliff" as something new.

understand "spark spliff" as sparkspliffing.

spliff-sparked is a truth state that varies.

carry out sparkspliffing:
	if spliff-sparked is true, say "Whoah, dude. You already did." instead;
	now spliff-sparked is true;
	say "Whoah, dude! You totally discover a hidden spliff. You're less worried now.";
	increment the score;
	the rule succeeds;

part History Hall

History Hall is north of Cark Cliff.

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

meta is a region.

a capped cone is a thing.

Zapped Zone is a room in meta.

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

