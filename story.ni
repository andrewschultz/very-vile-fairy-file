"Very Vile Fairy File" by Andrew Schultz

volume definitions

definition: a thing (called th) is moot:
	if th is in Zapped Zone, yes;
	no;

to moot (th - a thing):
	move th to Zapped Zone; [ic]

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
	now get-good is true;
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

