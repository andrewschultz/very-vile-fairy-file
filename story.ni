"Very Vile Fairy File" by Billy Boling

the story headline is "Rhymes Rue Times Two"

[implement help toggling: HELP HOW/WELP WOW]

volume includes

the release number is 1.

include Trivial Niceties Z-Only by Andrew Schultz.

include Basic Screen Effects by Emily Short.

include Very Vile Fairy File Mistakes by Andrew Schultz

section establish debug - not for release

when play begins (this is the set debug state rule): now debug-state is true;

volume definitions

to decide whether the action is procedural:
	if examining, yes;
	no;

definition: a thing (called th) is moot:
	if th is in Zapped Zone, yes;
	no;

to say swh of (rm - a room): say "[if rm is unvisited]somewhere new[else][rm][end if]"

to bring-here (th - a thing): move th to location of player.

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

min-needed is a number that varies. min-needed is 24.

min-gotten is a number that varies. min-gotten is 0.

the maximum score is 32.

max-poss is a number that varies.

to up-min:
	increment min-needed;
	increment min-gotten;
	increment the score;

to max-down: decrement max-poss;

main is a region.

intro is a region.

Meta is a region.

a room has text called noway-text.

the can't go that way rule is not listed in any rulebook.

check going nowhere:
	unless noway-text of location of player is empty, say "[noway-text of location of player][line break]" instead;
	say "You can't go [noun], [if number of viable directions is 0]and you may need to figure a puzzle to go anywhere[else]but you can go [list of viable directions][end if]." instead;

definition: a direction (called d) is viable:
	if the room d of location of the player is nowhere, no;
	yes;

volume you

Kerry Kyle is a person. The player is Kerry Kyle.

volume intro

part wet wood

Wet Wood is a room in intro. "You just don't feel competent enough to get out of here. You can't find any way to go. You need to become better ... [oh-simp]. You also think you can hear something.". noway-text is "You figure you'd just get lost. You don't feel confident enough to learn from getting lost, either. You need to come into competence ... [oh-simp].".

to say oh-simp: say "oh, there's GOT to be a simple way to say things"

every turn when player is in wet wood:
	if turn count < 5, continue the action;
	if the remainder after dividing turn count by 3 is 0, say "You think back [one of][or]again [stopping]to being made fun of for being bad at Kick the Can. Who led the chants? Oh, that's right. Mick-the-Man.";

chapter getgooding

getgooding is an action applying to nothing.

understand the command "getgood" as something new.
understand the command "get good" as something new.

understand "getgood" as getgooding.
understand "get good" as getgooding.

get-good is a truth state that varies.

carry out getgooding:
	if get-good is true, say "You already did." instead;
	say "You realize you can reason your way out of the Wet Wood. You feel so good about it, you overlook a trap that springs just as you're about to exit...[wfak-d]";
	increment the score; [nec]
	move player to Vined Vault;
	the rule succeeds;

part vined vault

Vined Vault is a room in intro. "[if mean mass is in vined vault]You found fault in the vined vault, but you still can't leave.[else if green grass is in vined vault]If only that strong stray weren't skulking around nearby, you could leave.[else]You're stuck here! There looks to be no way out. It looks like a perfect trap, but...[end if]"

chapter findfaulting

findfaulting is an action applying to nothing.

understand the command "find fault" as something new.

understand "find fault" as findfaulting when player is in vined vault.

carry out findfaulting:
	if mean mass is moot, say "Things are pretty good now. You probably want to deal with the strong stray." instead;
	if mean mass is in vined vault, say "You already did, and things got worse. You'll have to try something else." instead;
	say "Oh, wait! It isn't perfect. There you go ... if you do THIS, and THIS ...[wfak-d]";
	say "But of course something outside was guarding the vault. A mean mass.";
	move mean mass to vined vault;
	increment the score; [nec]
	the rule succeeds.

chapter mean mass

The mean mass is a thing.

chapter greengrassing

greengrassing is an action applying to nothing.

understand the command "green grass" as something new.

understand "green grass" as greengrassing when player is in vined vault and mean mass is in vined vault.

carry out greengrassing:
	say "The mean mass collapses into green grass. But in the distance you hear a strong stray.";
	increment the score; [nec]
	move strong stray to vined vault;
	moot mean mass;
	the rule succeeds;

chapter strong stray

the strong stray is scenery. "You can't see the strong stray, but you know it's out there."

instead of doing something with strong stray:
	if action is procedural, continue the action;
	say "You have to mislead the strong stray someway."

chapter wrongwaying

wrongwaying is an action applying to nothing.

understand the command "wrong way" as something new.

understand "wrong way" as wrongwaying.

carry out wrongwaying:
	say "The strong stray stops pacing back and forth and wanders off. You wait and listen to be sure it's gone, then walk into a ...";
	increment the score; [nec]
	move player to Trim Tram;
	the rule succeeds.

part Trim Tram

Trim Tram is a room in intro. "There's got to be a way to pay here to get the trim tram going."

chapter flimflaming

skim-not-flim is a truth state that varies;

flimflaming is an action applying to nothing.

understand the command "flim flam" as something new.
understand the command "flimflam" as something new.
understand the command "skim scam" as something new.

understand "flim flam" and "flimflam" and "skim scam" as flimflaming when player is in Trim Tram.

carry out flimflaming:
	if the player's command includes "skim", now skim-not-flim is true;
	say "That does it! The tram moves off...";
	move the player to Cark Cliff;
	increment the score; [nec]
	say "(By the way, you could also have tried [if skim-not-flim is true]FLIM FLAM[else]SKIM SCAM[end if].)";
	the rule succeeds.

volume main

part Cark Cliff

Cark Cliff is a room. "'Cark' is an ancient word meaning worry[if spliff-sparked is true]. You forget what you were supposed to be worried about, now[end if]. There's also a silly sign here. The wet wood is back every way except north, where there's, um, a cliff.". noway-text is "You don't want to go back to the Wet Wood. Or fall off Cark Cliff.".

tree-down is a truth state that varies.

The Tall Tree is a thing in Cark Cliff. "[if tree-down is false]A tall tree sits here, bending out over the cliff to the north. It could make a bridge reaching the other side[else]You made the tall tree fall free to the north, giving passage to [swh of the room north of cark cliff][end if]."

check going in cark cliff:
	if noun is north and tree-down is false, say "You need a way off the cliff edge. Well, a safe one." instead;
	if noun is down, say "'Don't die.' / 'Won't! Why?'" instead;

instead of doing something with tall tree:
	if action is procedural, continue the action;
	say "[if tree-down is true]You'd better not do anything to the tree. It's your way across[else]You need to do something specific to the tree. Maybe give it an order[end if].";

the hive heap is a thing.

the vapor vile is a thing.

the paper pile is a thing. "A paper pile lies here. You'd like it to be a bit more firmly bound together before you take it.". description is "It is a bit loose. Every single paper is labeled FACT FINDER.".

check taking paper pile: say "There's got to be a way to put the paper pile together a bit better first." instead;

the backed binder is a thing.

chapter silly sign

The silly sign is scenery in Cark Cliff. "The silly sign reads WILL [']E WHINE?"

instead of doing something with silly sign:
	if action is procedural, continue the action;
	say "The silly sign is just there for atmosphere."

chapter spark-spliffing

sparkspliffing is an action applying to nothing.

understand the command "spark spliff" as something new.

understand "spark spliff" as sparkspliffing.

spliff-sparked is a truth state that varies.

carry out sparkspliffing:
	if spliff-sparked is true, say "Whoah, dude. You already did." instead;
	now spliff-sparked is true;
	say "Whoah, dude! You totally discover not only a hidden spliff but two pieces of flint ideal for creating a flame to light it. It only takes 15 minutes, and it is totally worth it, even without munchies.";
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
	say "The tree, already tipping over the cliff, leans and ... falls over. You can go north across it now. Also, a hive heap falls from the tree and lands nearby.[paragraph break]You get greedy for a second wishing it was a teal tree so you could feel free, too, but this is good enough.";
	now tree-down is true;
	move hive heap to cark cliff;
	increment the score; [nec]
	the rule succeeds;

chapter divedeeping

divedeeping is an action applying to nothing.

understand the command "dive deep" as something new.

understand "dive deep" as divedeeping when hive heap is quicknear.

carry out divedeeping:
	say "You look through the hive heap. You don't hear buzzing. You keep throwing hives over until ... well, a vapor, vile, is released.[paragraph break]Hmm. That's interesting. DEEP and HEAP rhyme, but the spelling's a bit different.";
	moot hive heap;
	increment the score; [nec]
	bring-here vapor vile;
	the rule succeeds.

chapter paperpileing

paperpileing is an action applying to nothing.

understand the command "paper pile" as something new.

understand "paper pile" as paperpileing when vapor vile is quicknear.

carry out paperpileing:
	say "The vapor vile changes to a paper pile.";
	increment the score; [nec]
	moot vapor vile;
	bring-here paper pile;
	the rule succeeds.

chapter backedbindering

backedbindering is an action applying to nothing.

understand the command "backed binder" as something new.

understand "backed binder" as backedbindering when paper pile is quicknear.

carry out backedbindering:
	say "The papers labeled FACT FINDER should be useful. But you find a way to glue them all together. Go, you![paragraph break]Hmm, that was a bit tricker. BACKED and FACT rhyme, but the letters are different.";
	now player has backed binder;
	increment the score; [nec]
	the rule succeeds.

part History Hall

mistmall is a truth state that varies.

History Hall is north of Cark Cliff. printed name of history hall is "[if mistmall is true]Mystery Mall[else]History Hall[end if]".

the Gutta Ganksta is a person. description is "GOTS GAME is tattooed on the Gutta Ganksta."

Oi Mo by Tim T Sims Pimp is scenery. "It's a truly awful song. If you could find a way to turn it down..."

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
	move-from-temp oi mo;
	now mistmall is true;
	if evermall is false:
		increment the score; [nec]
		now evermall is true;
	bold-my-room;
	the rule succeeds;

chapter lotslameing

lotslameing is an action applying to nothing.

understand the command "lots lame" as something new.

understand "lots lame" as lotslameing.

lots-lame is a truth state that varies.

carry out lotslameing:
	if lots-lame is true, say "You already pinged the Gutta Ganksta like that." instead;
	say "The Gutta Ganksta suddenly feeels dissed.";
	increment the score; [opt]
	now lots-lame is true;
	the rule succeeds.

chapter dimding

dimding is an action applying to nothing.

understand the command "dimd" as something new.

understand "dimd" as dimding when Oi Mo is quicknear.

carry out dimding:
	say "The beats of [i]Oi, Mo[r] quiet down out of hearing. Whew! That's a relief.";
	moot oi mo;
	up-min;
	the rule succeeds.

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
	increment the score; [nec]
	now first-fave is true;
	the rule succeeds;

part last lap

Last Lap is a room. "[if reeker russell is off-stage]It looks like there should be a way to the north, but there isn't[else]There's a way to the north[end if]."

cap-cast is a truth state that varies.

check going north in Last Lap:
	if reeker russell is off-stage, say "You haven't found the way, yet." instead;
	if reeker russell is in Last Lap, say "Not with Reeker Russell around." instead;
	say "You avoid the trap leading to the Vined Vault...";

[?? trusty tap / crusty cap]

chapter Reeker Russell

Reeker Russell is a person. Reeker Russell carries the good gun. "Reeker Russell is blocking the way north."

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
	increment the score; [nec]
	the rule succeeds;

chapter beakerbustleing

beakerbustleing is an action applying to nothing.

understand the command "beaker bustle" as something new.

understand "beaker bustle" as beakerbustleing.

beaker-yet is a truth state that varies;

carry out beakerbustleing:
	if beaker-yet is true, say "You already did that!" instead;
	say "You have a vision of a much nerdier version of Reeker Russell going around and performing weird experiments. But you quickly snap back to reality. Still, it's good to be able to laugh at things.";
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
	check-russell-go; [nec]
	the rule succeeds;

chapter woodoneing

woodoneing is an action applying to nothing.

understand the command "wood one" as something new.

understand "wood one" as woodoneing when good gun is quicknear or player is in last lap.

carry out woodoneing:
	if good gun is moot, say "You already got rid of the good gun." instead;
	say "The good gun turns into a wood one in Reeker Russell's hands! He throws it away in disgust.";
	moot good gun;
	check-russell-go; [nec]
	the rule succeeds;

part Merry Mile

Merry Mile is north of Last Lap. "You hear laughter here, but it's all wrong. You could back out to the south, but you sense your destiny is to deal with the very vile fairy file.". noway-text is "The fairy file's presence makes you bump into walls figuratively. Let's not to so literally."

chapter very vile fairy file

the very vile fairy file is a thing in Merry Mile. "The very vile fairy file sort of repels you and attracts you at the same time. You know there must be a way to neutralize it."

description of very vile fairy file is "Ooh! You get mad just looking at it. It seems to be actively trolling you. One line reads: [vvff-nonsense]"

vvff-row is a number that varies.

to say vvff-nonsense:
	increment vvff-row;
	choose row vvff-row in table of vvff digs;
	say "[vvff-dis entry]";
	if vvff-row is number of rows in table of vvff digs + 1:
		say "The final entry reads, simply, 'Stare-y style!'[paragraph break]That's all. A vicious slam book, indeed. Yet you feel pulled to looking at it again, instead of dispelling it once and for all"

table of vvff digs
vvff-dis
"Gonna go off! Shun a show-off!"
"Rotten role: gotten goal?"
"'My magic try: TRAGIC!'"

instead of doing anything with the fairy file:
	if action is procedural, continue the action;
	say "[ff-no].";

instead of doing anything when noun is fairy file:
	if action is procedural, continue the action;
	say "[ff-no].";

to say ff-no: say "You can't do anything directly with or to the fairy file. There must be some overarching action"

chapter burybileing

burybileing is an action applying to nothing.

understand the command "bury bile" as something new.

understand "bury bile" as burybileing.

carry out burybileing:
	if very vile fairy file is not in location of player:
		now burybile-clue is true;
		say "[if location of very vile fairy file is unvisited]You want to. But you don't feel up to it. You can't do that until you find the very vile fairy file[else]You can't do that if you're not around the very vile fairy file[end if]." instead;
	say "Yes. You know what to do. As you bury the bile -- yours for others, and so forth -- the very vile fairy file itself dissolves.";
	increment the score; [nec]
	check-max-score;
	end the game in victory;
	the rule succeeds;

to check-max-score:
	if score is maximum score:
		choose row with final response rule of missed-show rule in the Table of Final Question Options;
		blank out the whole row; [don't let the player see MISSED if they got everything]

part dead doom

dead doom is a room.

volume verbs

book standard modifications

chapter trivial pointless but amusing verbs

instead of attacking:
	if noun is Reeker russell, say "But he'd become Rager Russell. With major muscle." instead;
	say "Gauge gore: wage war! Rage! Roar![one of] (NOTE: you don't need to attack anything. Well, not with the ATTACK command.)[or][stopping]"

instead of saying no, say "No-no? Hoho, dodo! [yn-tell]"

instead of saying yes, say "Yay! Yep! Hey, hep! [yn-tell]"

to say yn-tell: say "[one of](you never need to answer yes/no questions unless specifically prompted.)[or][stopping][paragraph break]"

instead of swearing obscenely, say "Gee, gad! Be bad! 'Me, mad!'"

instead of swearing mildly, say "Gee, gad! Be bad! 'Me, mad!'"

chapter listening

instead of listening:
	if player is in wet wood, say "'Bet, bud! Met mud!' That sounds a bit off, but ... it seems like a clue, sort of." instead;
	if player is in history hall and Oi Mo is in history hall, say "Tim T. Sims, Pimp, still sings [i]Oi, Mo[r]. Maybe there's a way to quiet it down." instead;
	say "Nothing special."

chapter thinking

burybile-clue is a truth state that varies.

thought-any is a truth state that varies.

to say tat: now thought-any is true;

instead of thinking:
	let thought-any be false;
	say "You think about what you've done, what you've tried, and what you can do.";
	if burybile-clue is true, say "[line break][tat]You tried to BURY BILE, but it didn't feel like the right place. Maybe somewhere else.";
	if thought-any is false, say "[line break]But you don't have any leads right now."

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
6	"sold sod"
9	"trolled, trod"
12	"cold cod"
15	"old, odd"
18	"rolled, rah'd"
--	"bold bod"

book nonstandard but general verbs

chapter xyzzying

xyzzying is an action applying to nothing.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

carry out xyzzying:
	say "Fie, fie. Sigh, sigh. Why, why?";
	the rule succeeds.

chapter helphowing

help-how is a truth state that varies.

helphowing is an action applying to nothing.

understand the command "help how" as something new.

understand "help how" as helphowing.

carry out helphowing:
	if help-how is true, say "Help-how is already on." instead;
	now help-how is true;
	say "Help-how is on. Welp-wow mode is off. In other words, more hints now." instead;
	the rule succeeds.

chapter welpwowing

welpwowing is an action applying to nothing.

understand the command "welp wow" as something new.

understand "welp wow" as welpwowing.

carry out welpwowing:
	if help-how is false, say "Help-how is already off." instead;
	now help-how is false;
	say "Help-how is off. Welp-wow mode is on. In other words, fewer hints now." instead;
	the rule succeeds.

chapter verbsing

verbsing is an action applying to nothing.

understand the command "verbs" as something new.

understand "verbs" as verbsing.

carry out verbsing:
	say "[2da]You can use the general directions, but you often have to figure out what to do, here. It's a guess the verb situation, but not really.";
	say "[2da][b]HELP HOW[r] and [b]WELP WOW[r] toggle hints on and off, respectively. Currently they are [on-off of help-how].";
	the rule succeeds.

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
	if debug-state is false, ask-screenread;
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

a capped cone is a thing.

Zapped Zone is a room in Meta.

Gazy Gap is a room in Meta.

Hidey House is a room in Meta.

volume unsorted

book go gate

there is a thing called the go gate. the grow grate is part of the go gate.

check entering go gate: [?? oh ate! Lo, late! / Foe, fate / D'oh date Ho Hate Mo Mate crow crate know Nate ]
	say "Too fast. Boom! A hidden grow grate pops up and crushes you. 'Lo, late! Foe, fate!' a voice says, and your last thought is, 'Ho, hate!'[paragraph  break]Maybe you should have expected that. Perhaps you need to be more circumspect.";
	end the story;

chapter whoawaiting

whoawaiting is an action applying to nothing.

understand the command "whoa wait" as something new.
understand the command "whoah wait" as something new.

understand "whoah wait" as whoawaiting when go gate is quicknear.
understand "whoa wait" as whoawaiting when go gate is quicknear.

carry out whoawaiting:
	say "You decide not to run in right away. The gate crumbles.";
	increment the score; [nec]
	the rule succeeds.

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
	say "The whining war dissipates, leaving the shining shore of ... Lake Lap! It's much brighter here. You feel there may be something else to find here.";
	increment the score; [nec]
	move lake lap to whining war;
	the rule succeeds.

chapter miningmoreing

miningmoreing is an action applying to nothing.

understand the command "mining more" as something new.

understand "mining more" as miningmoreing when player is in Whining War and mine-more is false.

mine-more is a truth state that varies.

carry out miningmoreing:
	abide by the shone-yet rule;
	increment the score; [nec]
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
	increment the score; [nec]
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
		increment the score; [nec]
	the rule succeeds;

part other places

Done Dune is a room. "This room is full of things you should shun soon."

book vast void

Vast Void is a room.

book Lake Lea

Lake Lea is a room. "You're on the Lake Lea, which borders on Lake Lap.".

check going east in Lake Lea when Jake G is in Lake Lea: say "Jake G. doesn't let you go that way." instead;

Jake G is a person in Lake Lea. "Jake G paces back and forth here, muttering 'Make me take tea!' He seems a bit out of place because, well, reasons.".

this is the jake-g-gone rule: if jake g is moot, say "You've already chased Jake G." instead;

jake-gone is a number that varies.

to eval-jake-g:
	increment jake-gone;
	if jake-gone is 2:
		moot jake g;
		say "Jake leaves, satisfied.";

chapter fakefeeing

fakefeeing is an action applying to nothing.

understand the command "fake fee" as something new.

understand "fake fee" as fakefeeing.

fake-fee is a truth state that varies.

carry out fakefeeing:
	if fake-fee is true, say "You already pretended to charge Jake G. a fake fee." instead;
	now fake-fee is true;
	increment the score; [nec] [x-of-y jake]
	the rule succeeds.

chapter wakewheeing

wakewheeing is an action applying to nothing.

understand the command "wake whee" as something new.

understand "wake whee" as wakewheeing.

wake-whee is a truth state that varies.

carry out wakewheeing:
	if wake-whee is true, say "You already did the whole wake-whee bit." instead;
	now wake-whee is true;
	increment the score; [nec] [x-of-y jake]
	the rule succeeds.

chapter achying

achying is an action applying to nothing.

understand the command "achy" as something new.

understand "achy" as achying.

achy is a truth state that varies.

carry out achying:
	if achy is true, say "You already made Jake G achy." instead;
	now achy is true;
	increment the score; [opt] [x-of-y jake]
	the rule succeeds.

chapter breakbrieing

breakbrieing is an action applying to nothing.

understand the command "break brie" as something new.

understand "break brie" as breakbrieing when player is in lake lea.

brie-broke is a truth state that varies;

carry out breakbrieing:
	if brie-broke is true, say "You already broke brie with Jake G." instead;
	follow the jake-g-gone rule;
	say "You find some fresh (relatively) brie cheese under a rock, and you split it and offer it to Jake G.";
	increment the score; [opt] [x-of-y jake]
	eval-jake-g;
	the rule succeeds.

book lake lap

Whining War is east of Lake Lea. "You can't get a close enough view."

[??mining more / dining door]

Lake Lap is scenery.

Ache App is a thing.

chapter hardhating

the marred mat is a thing.

the hard hat is a thing.

hardhating is an action applying to nothing.

understand the command "hard mat" as something new.

understand "hard hat" as hardhating when marred mat is quicknear.

carry out hardhating:
	say "Poof! The marred mat changes into a hard hat.";
	moot marred mat;
	now player wears hard hat;
	increment the score; [nec]
	the rule succeeds.

chapter snakesnaping

snakesnaping is an action applying to nothing.

understand the command "snake snap" as something new.

understand "snake snap" as snakesnaping when ache app is off-stage and player is in lake lap.

carry out snakesnaping:
	increment the score; [nec]
	say "The snake hissing in the lake leaves an Ache App behind.";
	now ache app is in lake lap;
	the rule succeeds.

chapter makemaping

makemaping is an action applying to nothing.

understand the command "make map" as something new.

understand "make map" as makemaping when ache app is in lake lap.

carry out makemaping:
	say "You can now see a map with M or MAP.";
	moot ache app;
	increment the score; [nec]
	the rule succeeds.

volume endgame

Table of Final Question Options (continued)
final question wording	only if victorious	topic		final response rule		final response activity
"see what you MISSED"	true	"missed"	missed-show rule	--

this is the missed-show rule:
	unless oi mo is moot, say "You could have DIM'D Oi Mo.";

volume meta rooms

volume testables
