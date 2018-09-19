"Very Vile Fairy File" by Billy Boling

the story headline is "Rhymes Rue Times Two"

volume includes

include Trivial Niceties Z-Only by Andrew Schultz.

include Basic Screen Effects by Emily Short.

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

definition: a thing (called th) is quicknear:
	if player carries th or th is in location of player, yes;
	no;

to win-the-game:
	say "DEALS: DONE. FEELS FUN.";
	end the story;

to bold-my-room:
	say "[b][location of player][r][paragraph break]"

min-needed is a number that varies. min-needed is 6.

min-gotten is a number that varies. min-gotten is 0.

the maximum score is 9.

max-poss is a number that varies.

to up-min:
	increment min-needed;
	increment min-gotten;
	increment the score;

to max-down:
	decrement max-poss;

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

chapter whatawankstaing

whatawankstaing is an action applying to nothing.

understand the command "whatawanksta" as something new.

understand "what a wanksta" as whatawankstaing when evermall is true.
understand "whatta wanksta" as whatawankstaing when evermall is true.

carry out whatawankstaing:
	if ganksta is moot, say "You already got rid of the ganksta." instead;
	if ganksta is not quicknear, say "That might work with the ganksta around." instead;
	say "Exposed, the [ganksta] turns red. It just can't face you any more and runs off for another mall to look cool in.";
	moot ganksta;
	up-min;
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

part last lap

Last Lap is a room.

cap-cast is a truth state that varies.

[?? trusty tap / crusty cap]

chapter Reeker Russell

Reeker Russell is a person. Reeker Russell carries the good gun.

to decide which number is russell-progress:
	let rp be 0;
	if meeker-yet is true, increment rp;
	if good gun is moot, increment rp;
	decide on rp;

to check-russell-go:
	increment the score;
	if russell-progress is 2:
		say "Russell flees!";
		moot Reeker Russell;
		if beaker-yet is false, max-down;
	else:
		say "Russell looks confused! One more setback, and he's had it.";

chapter castcaping

castcaping is an action applying to nothing.

understand the command "cast cap" as something new.

understand "cast cap" as castcaping when player is in last lap.

carry out castcaping:
	if cap-cast is true, say "You already did." instead;
	say "You cast your cap, and someone big and mean appears: (W)re(a/e)ker Russell!";
	move Reeker Russell to Last Lap;
	increment the score;
	the rule succeeds;

chapter beakerbustleing

beakerbustleing is an action applying to nothing.

understand the command "beaker bustle" as something new.

understand "beaker bustle" as beakerbustleing.

beaker-yet is a truth state that varies;

carry out beakerbustleing:
	if beaker-yet is true, say "You already did that!" instead;
	say "You have a vision of a much nerdier version of Wreaker Russell going around and performing weird experiments. But you quickly snap back to reality. Still, it's good to be able to laugh at things.";
	now beaker-yet is true;
	up-min;
	the rule succeeds;

chapter meekermuscleing

meekermuscleing is an action applying to nothing.

understand the command "meeker muscle" as something new.

understand "meeker muscle" as meekermuscleing.

meeker-yet is a truth state that varies;

carry out meekermuscleing:
	if meeker-yet is true, say "You already did that!" instead;
	now meeker-yet is true;
	say "Russell becomes noticeably less muscular.";
	check-russell-go;
	the rule succeeds;

chapter woodoneing

woodoneing is an action applying to nothing.

understand the command "wood one" as something new.

understand "wood one" as woodoneing when good gun is quicknear or player is in last lap.

carry out woodoneing:
	if good gun is moot, say "You already got rid of the good gun." instead;
	say "The good gun turns into a wood one in Wreaker Russell's hands! He throws it away in disgust.";
	moot good gun;
	check-russell-go;
	the rule succeeds;

part dead doom

dead doom is a room.

volume verbs

book standard modifications

chapter listening

instead of listening:
	if player is in wet wood, say "Bet, bud! Met mud!" instead;
	say "Nothing special."

chapter score

check requesting the score:
	say "You have scored a total of [score] out of [maximum score] points in [turn count] moves. You have found [min-gotten] optional points so far and need [min-needed] to win."

book nonstandard but general verbs

chapter creditsing

creditsing is an action out of world.

understand the command "credits" as something new.

understand "credits" as creditsing.

carry out creditsing:
	say "PUT CREDITS HERE.";
	the rule succeeds;

chapter abouting

abouting is an action out of world.

understand the command "about" as something new.

understand "about" as abouting.

carry out abouting:
	say "Very Vile Fairy File came about when I was writing a yet-unnamed game on spoonerisms. I found a few spoonerisms that made more sense as alliteration, which was sort of fun, until I realized I had a lot more than that--enough for a game. It seemed like a nice short EctoComp game at first until I dug deeper. I don't know when I first had the idea, but my daily notes suggest it started gaining momentum in June of 2018.[paragraph break]I wanted a reasonably intuitive game, though I recognize the spelling for some of the commands may be tricky. I hope the alliterative rhymes are interesting and amusing.";
	the rule succeeds;

volume when play begins

when play begins:
	now max-poss is the maximum score;
	now the right hand status line is "[score]/[min-needed]-[max-poss]";
	now the turn count is 0;

section when play begins - not for release

volume meta

Meta is a region.

a capped cone is a thing.

Zapped Zone is a room in Meta.

Gazy Gap is a room in Meta.

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

book Soft Sand

Soft Sand is a room.

ever-loft is a truth state that varies.

land-loft is a truth state that varies.

chapter softsanding

softsanding is an action applying to nothing.

understand the command "soft sand" as something new.

understand "soft sand" as softsanding.

carry out softsanding:
	if land-loft is false, say "You're already on the soft sand." instead;
	say "The loft land reverts to the soft sand.";
	now loft-land is true;
	the rule succeeds;

chapter loftlanding

loftlanding is an action applying to nothing.

understand the command "loft land" as something new.

understand "loft land" as loftlanding.

carry out loftlanding:
	if land-loft is true, say "You're already on the loft land." instead;
	if ever-loft is false:
		now ever-loft is true;
		say "Boom! The soft sand rises up and becomes the Loft Land.";
		now land-loft is false;
		increment the score;
	the rule succeeds;

book other places

Vast Void is a room.
