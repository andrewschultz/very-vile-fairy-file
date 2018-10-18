"Very Vile Fairy File" by Billy Boling

the story headline is "Rhymes Rue Times Two"

volume includes

include Trivial Niceties Z-Only by Andrew Schultz.

include Basic Screen Effects by Emily Short.

section establish debug - not for release

when play begins (this is the set debug state rule): now debug-state is true;

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

Wet Wood is a room. "You just don't feel competent enough to get out of here. You can't find any way to go. You need to become better ... [oh-simp]."

check going in wet wood: say "You figure you'd just get lost. You don't feel confident enough to learn from getting lost, either. You need to come into competence ... [oh-simp]." instead;

to say oh-simp: say "oh, there's GOT to be a simple way to say things"

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

Cark Cliff is a room. "'Cark' is an ancient word meaning worry[if spliff-sparked is true]. You forget what you were supposed to be worried about, now[end if]."

tree-down is a truth state that varies.

The Tall Tree is a thing in Cark Cliff. "[if tree-down is false]A tall tree sits here, bending out over the cliff to the north. It could make a bridge reaching the other side[else]You made the tall tree fall free to the north, giving passage to [swh of the room north of cark cliff][end if]."

check going north in cark cliff:
	if tree-down is false, say "You need a way off the cliff edge. Well, a safe one." instead;

check going in cark cliff: say "You don't want to go back to the Wet Wood. Or fall off Cark Cliff." instead;

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

Reeker Russell is a person in Last Lap. Reeker Russell carries the good gun.

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

part Merry Mile

Merry Mile is north of Last Lap. "You hear laughter here, but it's all wrong."

chapter very vile fairy file

the very vile fairy file is a thing in Merry Mile. "The very vile fairy file is here! It sort of repels you, but you know there must be a way to neutralize it."

instead of doing anything with the fairy file, say "[ff-no].";

instead of doing anything when noun is fairy file, say "[ff-no].";

to say ff-no: say "You can't do anything directly with or to the fairy file. There must be some overarching action"

chapter burybileing

burybileing is an action applying to nothing.

understand the command "bury bile" as something new.

understand "bury bile" as burybileing.

carry out burybileing:
	if location of very vile fairy file is unvisited, say "You can't do that until you find the very vile fairy file." instead;
	if very vile fairy file is not in location of player, say "You can't do that if you're not around the very vile fairy file." instead;
	say "Yes. You know what to do. As you bury the bile -- yours for others, and so forth -- the very vile fairy file itself dissolves.";
	end the game in victory;
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
	say "You have scored a total of [score] out of [maximum score] points in [turn count] moves. You have found [min-gotten] optional points so far and need [min-needed] to win.";
	say "[line break]Your current rank is [your-rank].";
	the rule succeeds;

to say your-rank:
	if score is maximum score:
		say "gold god";
		continue the action;
	repeat through table of ranks:
		if there is no rank-max entry or score < rank-max entry:
			say "[rank-name entry]";
			continue the action;

table of ranks
rank-max	rank-name
2	"sold sod"
4	"cold cod"
6	"old, odd"
--	"bold bod"

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

when play begins (this is the opening text rule):
	now the left hand status line is "West Wall";
	force-status;
	say "You wouldn't have gone to Fall Fest if you hadn't gotten a free ticket. But of course, the ticket was the only thing that was free. Inside, super high food prices. Lots of noise. And, well, the sun always seeming to get in your eyes. But you still feel you might as well see everything.[paragraph break]And you do. Then off on the west edge, there's a wall. A wall west, if you will. 'Oh, man,' you think. 'Why did I bother?' Well, at least you didn't waste all afternoon watching football games you didn't care about. But you're still mumbling to yourself about how there must be something, anything interesting here. Then you feel a tap on your shoulder.[wfak-d]";
	say "[line break]'So, you want to get goin[']? Well, I might be able to help. I'm Kit Cohen.' You're just not in the mood for motivational nonsense right now, so you brush Kit off. Or try to.[wfak-d]";
	say "[line break]'No! Seriously! You managed to bawl best--well, the best of anyone I've seen today--so you get a chance at a tall test!'[paragraph break]'What sort of test?'[paragraph break]'The PALL PEST of CRAWL CREST!'[wfak-d]";
	say "[line break]It approaches. It's about to touch you ...and reflexively you boom, 'GALL, guest!'[paragraph break]The pall pest stumbles back into the west wall, which crumbles. Kit Cohen applauds. 'Well done! You did it! I think you are the one ... the one to recover the Very Vile Fairy File.[wfak-d]";
	say "[line break]You accept. You might as well. Kit guides you across the remains of the wall, leaving you in ...";
	say "[line break]And it's a big one. You look to Kit for help, but Kit shrugs.";
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

book Whining War

Whining War is a room.

chapter shiningshoreing

shiningshoreing is an action applying to nothing.

understand the command "shining shore" as something new.

understand "shining shore" as shiningshoreing when player is in Whining War.

shore-shine is a truth state that varies.

carry out shiningshoreing:
	if shore-shine is true, say "You already got (t)here." instead;
	say "The whining stops. It's much brighter here. You feel there may be something else to find here.";
	increment the score;
	the rule succeeds.

chapter miningmoreing

miningmoreing is an action applying to nothing.

understand the command "mining more" as something new.

understand "mining more" as miningmoreing when player is in Whining War and mine-more is false.

mine-more is a truth state that varies.

carry out miningmoreing:
	abide by the shone-yet rule;
	increment the score;
	now mine-more is true;
	the rule succeeds.

this is the shone-yet rule:
	if shore-shine is false, say "Too whiny for that right now." instead;

chapter diningdooring

diningdooring is an action applying to nothing.

understand the command "dining door" as something new.

understand "dining door" as diningdooring when player is in Whining War and dine-door is false.

dine-door is a truth state that varies.

carry out diningdooring:
	abide by the shone-yet rule;
	increment the score;
	now dine-door is true;
	the rule succeeds.

book Soft Sand

Soft Sand is a room.

ever-loft is a truth state that varies.

loft-land is a truth state that varies.

chapter softsanding

softsanding is an action applying to nothing.

understand the command "soft sand" as something new.

understand "soft sand" as softsanding.

loft-land is a truth state that varies.

carry out softsanding:
	if loft-land is false, say "You're already on the soft sand." instead;
	say "The loft land reverts to the soft sand.";
	now loft-land is true;
	the rule succeeds;

chapter loftlanding

loftlanding is an action applying to nothing.

understand the command "loft land" as something new.

understand "loft land" as loftlanding.

carry out loftlanding:
	if loft-land is true, say "You're already on the loft land." instead;
	say "Boom! The soft sand rises up and becomes the Loft Land[one of][or] again[stopping].";
	if ever-loft is false:
		now ever-loft is true;
		now loft-land is false;
		increment the score;
	the rule succeeds;

book other places

Vast Void is a room.

volume testables
