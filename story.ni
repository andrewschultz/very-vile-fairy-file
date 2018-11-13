"Very Vile Fairy File" by Billy Boling

the story headline is "Rhymes Rue Times Two"

[implement help toggling: HELP HOW/WELP WOW]

volume includes

the release number is 1.

include Trivial Niceties Z-Only by Andrew Schultz.

include Basic Screen Effects by Emily Short.

include Very Vile Fairy File Mistakes by Andrew Schultz.

include Very Vile Fairy File Tables by Andrew Schultz.

section establish debug - not for release

include Very Vile Fairy File Tests by Andrew Schultz.

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

to bold-my-room:
	say "[b][location of player][r][paragraph break]"

min-needed is a number that varies. min-needed is 30.

min-gotten is a number that varies. min-gotten is 0.

the maximum score is 38.

max-poss is a number that varies.

to up-min:
	increment min-needed;
	increment min-gotten;
	increment the score;

to max-down: decrement max-poss;

Worst Whew is a region. [first few]

Piddling Pain is a region. [middling main]

Poorly Penned is a region. [early end]

Verminal Vale is a region. [terminal tale]

there is a region called Get a Ghost. [meta most]

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

the zig zag rig rag is a thing. The player carries the zig zag rig rag.

after examining zig zag rig rag when bag-hint is true:
	say "[if Fun Fen is visited]You can probably change it to a BIG BAG, now[else]You don't feel this is the place to change it to a BIG BAG, yet[end if].";
	continue the action;

the big bag is a thing.

chapter bigbaging

bigbaging is an action applying to nothing.

understand the command "big bag" as something new.

understand "big bag" as bigbaging.

bag-hint is a truth state that varies.

carry out bigbaging:
	if player has big bag, say "You already made the big bag." instead;
	if Fun Fen is unvisited:
		now bag-hint is true;
		say "That would be a good idea, once you had possessions to carry around. But right now, you don't have enough that would need a big bag." instead;
	say "You now have a more useful big bag!";
	increment the score; [nec]
	moot zig zag rig rag;
	now player has big bag;
	now bag-hint is false;
	the rule succeeds.

volume Worst Whew

part Wet Wood

Wet Wood is a room in Worst Whew. "You just don't feel competent enough to get out of here. You can't find any way to go. You need to become better ... [oh-simp]. You also think you can hear something.". noway-text is "You figure you'd just get lost. You don't feel confident enough to learn from getting lost, either. You need to come into competence ... [oh-simp].".

to say oh-simp: say "oh, there's GOT to be a simple way to say things"

every turn when player is in Wet Wood:
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

Vined Vault is a room in Worst Whew. "[if mean mass is in vined vault]You found fault in the vined vault, but you still can't leave.[else if green grass is in vined vault]If only that strong stray weren't skulking around nearby, you could leave.[else]You're stuck here! There looks to be no way out. It looks like a perfect trap, but...[end if]". noway-text is "You can't tell directions here. You need to think up a safe way out."

the green grass is scenery. "The green grass goes well with the vined vault."

instead of doing something with green grass:
	if action is procedural, continue the action;
	say "The green grass is there. You don't need to do anything with it."

chapter findfaulting

findfaulting is an action applying to nothing.

understand the command "find fault" as something new.

understand "find fault" as findfaulting when player is in vined vault.

carry out findfaulting:
	if mean mass is moot, say "Things are pretty good now. You probably want to deal with the strong stray." instead;
	if mean mass is in vined vault, say "You already did, and things got worse. You'll have to try something else." instead;
	say "Oh, wait! It isn't perfect. There you go ... if you do THIS, and THIS ...[wfak-d]";
	say "[line break]But of course something outside was guarding the vault, just waiting to walk in. A mean mass.";
	move mean mass to vined vault;
	increment the score; [nec]
	the rule succeeds.

chapter mean mass

The mean mass is a thing. "The mean mass continues to pulse and block the way out of the vined vault.". description is "The mean mass doesn't quite attack you, but it hangs menacingly, unnaturally.".

chapter greengrassing

greengrassing is an action applying to nothing.

understand the command "green grass" as something new.

understand "green grass" as greengrassing when player is in vined vault and mean mass is in vined vault.

carry out greengrassing:
	say "The mean mass collapses into much safer green grass. You walk by and arrive at...";
	increment the score; [nec]
	move player to Po' Pit;
	moot mean mass;
	the rule succeeds;

part Po' Pit

Po' Pit is a room in Worst Whew. "Just beyond a trash trap ... an obvious one, no less ... looks like freedom, of a sort. You've got to get by! There is some wrong art by the trash trap which may or may not be helpful.". noway-text is "You can't go back, and directions don't seem to apply here. You need to think your way past the trash trap."

the wrong art is scenery in Po' Pit. "It says STRONG START [if fee-found is false]and also FIND FEE[end if]. It -- well, it seems to diagram the trash trap meticulously. What do you call those things where they draw what is where? Anyway, lots of dead ends are labeled ... CRASH! ****![paragraph break]Gosh! You've always felt uneasy around profanity, weak or strong. It's been used to hard-sell you on stuff and ideas you really didn't want before."

chapter mindmeing

fee-found is a truth state that varies.

mindmeing is an action applying to nothing.

understand the command "mind me" as something new.

understand "mind me" as mindmeing when player is in Po' Pit.

carry out mindmeing:
	if fee-found is true, say "You already did." instead;
	say "FIND FEE can't be right. There's nobody here to collect it. You make a point to focus on what you can do. You rip off the top page of the wrong art ... and there's something below.";
	now fee-found is true;
	increment the score; [nec]
	the rule succeeds.

chapter mashmaping

mashmaping is an action applying to nothing.

understand the command "mash map" as something new.

understand "mash map" as mashmaping when player is in Po' Pit.

carry out mashmaping:
	if fee-found is false, say "You don't have the guts or trust in yourself yet!" instead;
	say "The heck with this! You just don't trust the trash trap to tell you the way through.";
	increment the score; [nec]
	move player to Trim Tram;
	the rule succeeds.

chapter growgriting

growgriting is an action out of world.

understand the command "grow grit" as something new.

understand "grow grit" as growgriting when player is in po' pit.

grit-grown is a truth state that varies.

carry out growgriting:
	if grit-grown is false, say "You already did that." instead;
	say "The trash trap looks less yucky now.";
	now grit-grown is true;
	increment the score; [nec]
	the rule succeeds.

part Trim Tram

Trim Tram is a room in Worst Whew. "There's got to be a way to pay here to get the Trim Tram going.". noway-text is "You're on the tram. There's no way to get off, and it'd probably lead back to the Vined Vault. How can you fake your way to paying a fare?"

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
	move the player to Fun Fen;
	increment the score; [nec]
	say "(By the way, you could also have tried [if skim-not-flim is true]FLIM FLAM[else]SKIM SCAM[end if].)";
	the rule succeeds.

volume Piddling Pain

part Fun Fen

Fun Fen is a room in Piddling Pain. "It's a bit nicer than back in the Done Den. You don't fear ambush by a hun hen. There's also a silly sign here. The Done Den [if tree-down is false]you just left [end if]is also around. Back north, well ... [if tall tree is moot]you can go that way now[else]there's no way, right now. But there is a tall tree nearby[end if].". noway-text is "You don't want to go back through the Done Den to the Wet Wood or Vined Vault. Or fall off Fun Fen.".

the done den is scenery in Fun Fen. "You feel a sense of accomplishment having made it through the done den, but you don't want to go back."

instead of entering done den, say "As you start to enter, you imagine a weight falling on you. How much? A ton. Ten.[paragraph break]You don't need to revisit your initial success."

tree-down is a truth state that varies.

The Tall Tree is scenery in Fun Fen. "[if tree-down is false]The tall tree sits here, bending out over the gap to the north. It could make a bridge reaching the other side[else]You made the tall tree fall free to the north, giving passage to [swh of the room north of Fun Fen][end if]."

check going in Fun Fen:
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

chapter cark cliff

Cark Cliff is scenery in Fun Fen. "[if wild weed is moot]You don't feel so worried about Cark Cliff now[else]It's intimidating, but it would be neat if it weren't[end if]."

chapter silly sign

The silly sign is scenery in Fun Fen. "The silly sign reads WILL [']E WHINE?"

instead of doing something with silly sign:
	if action is procedural, continue the action;
	say "The silly sign is just there for atmosphere."

chapter sparkspliffing

sparkspliffing is an action applying to nothing.

understand the command "spark spliff" as something new.

understand "spark spliff" as sparkspliffing when wild weed is quicknear or player is in fun fen.

carry out sparkspliffing:
	if wild weed is moot, say "Whoah, dude. You already did." instead;
	if player does not have wild weed, say "Whoah, dude. You have nothing to light up with." instead;
	if player is not in fun fen, say "Not here, dude! No source of flame!" instead;
	say "Whoah, dude! You totally discover not only a hidden spliff but two pieces of flint ideal for creating a flame to light it. It only takes 15 minutes, and it is totally worth it, even without munchies.";
	moot wild weed;
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
	move hive heap to Fun Fen;
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

part Lake Lea

Lake Lea is north of Fun Fen. It is in Piddling Pain. "You're on the Lake Lea, which borders on Lake Lap.".

check going east in Lake Lea when Jake G is in Lake Lea: say "Jake G. doesn't let you go that way." instead;

Jake G is a person in Lake Lea. "Jake G paces back and forth here, muttering 'Make me take tea!' He seems a bit out of place because, well, reasons.".

this is the jake-g-gone rule: if Jake G is moot, say "You've already chased Jake G." instead;

jake-gone is a number that varies.

to eval-jake-g:
	increment jake-gone;
	if jake-gone is 2:
		moot Jake G;
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

understand "break brie" as breakbrieing when player is in Lake Lea.

brie-broke is a truth state that varies;

carry out breakbrieing:
	if brie-broke is true, say "You already broke brie with Jake G." instead;
	follow the jake-g-gone rule;
	say "You find some fresh (relatively) brie cheese under a rock, and you split it and offer it to Jake G.";
	increment the score; [opt] [x-of-y jake]
	eval-jake-g;
	the rule succeeds.

part History Hall

mistmall is a truth state that varies.

History Hall is west of Lake Lea. it is in Piddling Pain. printed name of History Hall is "[if mistmall is true]Mystery Mall[else]History Hall[end if]".

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

understand "mystery mall" as mysterymalling when player is in History Hall.

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

part Vending Vibe

Vending Vibe is a room in Piddling Pain.

The Trending Tribe are plural-named people in Vending Vibe.

the Lending Libe is scenery. "Looking in, you see one book labeled [next-rand-txt of table of vvff books].";

chapter lendinglibeing

lendinglibeing is an action applying to nothing.

understand the command "lending libe" as something new.

understand "lending libe" as lendinglibeing.

carry out lendinglibeing:
	moot trending tribe;
	increment the score; [nec]
	say "The Trending Tribe is appalled by the possibility of people getting something for free. Even books that don't help you profit.";
	now printed name of Vending Vibe is "Lending Libe";
	move lending libe to Vending Vibe;
	the rule succeeds.

part curst cave

Curst Cave is a room in Piddling Pain.

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

part Last Lap

Last Lap is a room in Verminal Vale. "[if Reeker Russell is off-stage]It looks like there should be a way to the north, but there isn't[else]There's a way to the north[end if]."

cap-cast is a truth state that varies.

check going north in Last Lap:
	if Reeker Russell is off-stage, say "You haven't found the way, yet." instead;
	if Reeker Russell is in Last Lap, say "Not with Reeker Russell around." instead;
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

understand "cast cap" as castcaping when player is in Last Lap.

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

understand "wood one" as woodoneing when good gun is quicknear or player is in Last Lap.

carry out woodoneing:
	if good gun is moot, say "You already got rid of the good gun." instead;
	say "The good gun turns into a wood one in Reeker Russell's hands! He throws it away in disgust.";
	moot good gun;
	check-russell-go; [nec]
	the rule succeeds;

part Airy Isle

Airy Isle is north of Last Lap. It is in Verminal Vale. "You hear laughter here, but it's all wrong. You could back out to the south, but you sense your destiny is to deal with the very vile fairy file.". noway-text is "The fairy file's presence makes you bump into walls figuratively. Let's not to so literally."

chapter telltorning

the well worn hell horn is a thing in Airy Isle.

instead of doing something with the well worn hell horn:
	if action is procedural, continue the action;
	say "It ... well, it looks used, but it still hasn't fallen apart.";

telltorning is an action applying to nothing.

understand the command "tell torn" as something new.

understand "tell torn" as telltorning when well worn hell horn .

carry out telltorning:
	say "The well worn hell horn rips apart and unwinds. Fortunately, as it does so, there is no bell born.";
	moot well worn hell horn;
	increment the score; [nec]
	the rule succeeds.

chapter very vile fairy file

the very vile fairy file is a thing in Airy Isle. "The very vile fairy file sort of repels you and attracts you at the same time. You know there must be a way to neutralize it. It is co-written by, unsurprisingly, Harry Hile, Larry Lyle, and Perry Pyle."

description of very vile fairy file is "Ooh! You get mad just looking at it. It seems to be actively trolling you. One line reads: [next-rand-txt of table of vvff digs]"

vvff-row is a number that varies.

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
		if player is in Airy Isle:
			if well worn hell horn is in airy isle, say "That is hard, with the well worn hell horn booming out." instead;
			say "Oh! You almost can. But you're not happy enough yet. You need somewhere big, open, and happy. Almost like the airy isle, but not quite." instead;
		say "[if location of very vile fairy file is unvisited]You want to. But you don't feel up to it. You can't do that until you find the very vile fairy file[else]You can't do that if you're not around the very vile fairy file[end if][if airy isle is visited]. But you've found it, and that's a huge start[end if]." instead;
	say "Yes. You know what to do. As you bury the bile -- yours for others, and so forth -- the very vile fairy file itself dissolves.";
	increment the score; [nec]
	win-the-game;
	the rule succeeds;

to win-the-game:
	if score is maximum score:
		choose row with final response activity of showmissesing in the Table of Final Question Options;
		blank out the whole row; [don't let the player see MISSED if they got everything]
	end the story finally saying "DEALS DONE: FEELS FUN!";

part Merry Mile

Merry Mile is a room in Verminal Vale.

part Tarry Tile

Tarry Tile is a room in Verminal Vale.

part dead doom

dead doom is a room.

volume verbs

book standard modifications

chapter trivial pointless but amusing verbs

instead of attacking:
	if noun is go gate, say "Ho! Hate!" instead;
	if noun is Reeker Russell, say "But he'd become Rager Russell. With major muscle." instead;
	say "Gauge gore: wage war! Rage! Roar![one of] (NOTE: you don't need to attack anything. Well, not with the ATTACK command.)[or][stopping]"

instead of saying no, say "No-no? Hoho, dodo! [yn-tell]"

instead of saying yes, say "Yay! Yep! Hey, hep! [yn-tell]"

to say yn-tell: say "[one of](you never need to answer yes/no questions unless specifically prompted.)[or][stopping][paragraph break]"

instead of swearing obscenely, say "Gee, gad! Be bad! 'Me, mad!'"

instead of swearing mildly, say "Gee, gad! Be bad! 'Me, mad!'"

chapter listening

instead of listening:
	if player is in Wet Wood, say "'Bet, bud! Met mud!' That sounds a bit off, but ... it seems like a clue, sort of." instead;
	if player is in History Hall and Oi Mo is in History Hall, say "Tim T. Sims, Pimp, still sings [i]Oi, Mo[r]. The chorus mentions double duty, which, eww. Maybe there's a way to quiet it down." instead;
	say "Nothing special."

chapter thinking

burybile-clue is a truth state that varies.

thought-any is a truth state that varies.

to say tat: now thought-any is true;

instead of thinking:
	let thought-any be false;
	say "You think about what you've done, what you've tried, and what you can do.[paragraph break]Here's what you know from your experience so far: [rhyme-display]";
	if bag-hint is true, say "[line break][tat]You tried to make a BIG BAG from the zig zag rig rag, but it didn't feel right at the time[if Fun Fen is visited]. Maybe it will, now[end if].";
	if burybile-clue is true, say "[line break][tat]You tried to BURY BILE, but it didn't feel like the right place. Maybe somewhere else.";
	if thought-any is false, say "[line break]But you don't have leads for any puzzles right now."

to say rhyme-display:
	if Fun Fen is visited:
		say "you realize that you can change the first two letters to one, or vice versa, or change the first two letters completely. And it can be anything that rhymes.";
	else if player is in Trim Tram:
		say "you've been able to collapse the first two letters to one (Trash Trap to Mash Map, which is an action, too) and vice versa (Mean Mass to Green Grass) but maybe there's something else to do.";
	else if fee-found is true:
		say "You managed to FIND FEE, but now you need to evade the trash trap.";
	else if player is in Po' Pit:
		say "you've been able to change the mean mass to green grass, meaning the number of letters doesn't have to be constant. You're not likely to find a fee, but maybe you can do something else.";
	else if mean mass is in vined vault:
		say "FIND FAULT wasn't spelled quite the same as VINED VAULT. In fact, FIND had fewer letters than VINED. So maybe you just need to change a different number of letters again.";
	else if player is in vined vault:
		say "GET GOOD was just switching two letters from WET WOOD, but maybe you need to change a bit more here. While still rhyming.";
	else:
		say "WET WOOD. You've got that zig zag rig rag. Maybe there's alliterative rhyming, here. What rhymes with WET WOOD?";

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
4	"sold sod"
8	"trolled, trod"
12	"cold cod"
16	"old, odd"
20	"rolled, rah'd"
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

Zapped Zone is a room in Get a Ghost.

Gazy Gap is a room in Get a Ghost.

Hidey House is a room in Get a Ghost.

volume unsorted

the wild weed is a thing.

the mild mead is a thing. description is "It probably tastes gross and is not very psychoactive, either."

chapter wildweeding

wildweeding is an action applying to nothing.

understand the command "wild weed" as something new.

understand "wild weed" as wildweeding when player has mild mead.

carry out wildweeding:
	say "Bingo! The mild mead becomes wild weed.";
	up-min;
	the rule succeeds.

book got gear hot here

Got Gear Hot Here is a room.

chapter hardhating

the marred mat is a thing in Got Gear Hot Here.

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

book go gate

there is a thing called the go gate. the grow grate is part of the go gate.

check entering go gate:
	say "Too fast. Boom! A hidden grow grate pops up and crushes you. 'Lo, late! Foe, fate!' a voice says, and your last thought is, 'Ho, hate!'[paragraph  break]Today is definitely a ... d'oh date.[paragraph break]Maybe you should have expected that. Perhaps you need to be more circumspect.";
	end the story;

chapter whoawaiting

whoawaiting is an action applying to nothing.

understand the command "woe wait" as something new.
understand the command "whoa wait" as something new.
understand the command "whoah wait" as something new.

understand "whoah wait" as whoawaiting when go gate is quicknear.
understand "whoa wait" as whoawaiting when go gate is quicknear.
understand "woe wait" as whoawaiting when go gate is quicknear.

carry out whoawaiting:
	say "You decide not to run in right away. The gate crumbles.";
	increment the score; [nec]
	the rule succeeds.

book Pain Peasant

the Pain Peasant is a person.

chapter plainpleasanting

plainpleasanting is an action applying to nothing.

understand the command "plainpleasant" as something new.

understand "plainpleasant" as plainpleasanting.

carry out plainpleasanting:
	say "The Pain Peasant is much nicer now. You have a chat about stuff, and the peasant takes leave to go do peasant things.";
	moot Pain Peasant;
	the rule succeeds;

Lit Lawn is a room. [??get gone]

[?? burned bower/turned tower]

part Soft Sand

Soft Sand is a room in Piddling Pain.

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

part Whining War

Whining War is east of Lake Lea. It is in Piddling Pain. "You can't get a close enough view."

[??mining more / dining door]

Lake Lap is scenery.

Ache App is a thing.

chapter shiningshoreing

shiningshoreing is an action applying to nothing.

understand the command "shining shore" as something new.

understand "shining shore" as shiningshoreing when player is in Whining War.

shore-shine is a truth state that varies.

carry out shiningshoreing:
	if shore-shine is true, say "You already got (t)here." instead;
	say "The Whining War dissipates, leaving the shining shore of ... Lake Lap! It's much brighter here. You feel there may be something else to find here.";
	increment the score; [nec]
	move lake lap to Whining War;
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

Volume Poorly Penned

Done Dune is a room in Poorly Penned. "This room is full of things you should shun soon."

book vast void

Vast Void is a room in Poorly Penned.

Volume Get a Gain

Volume Verminal Vale

Table of Final Question Options (continued)
final question wording	only if victorious	topic		final response rule		final response activity
"see what you MISSED"	true	"missed"	--	showmissesing

showmissesing is an activity.

rule for showmissesing:
	unless oi mo is moot, say "You could have DIM'D Oi Mo.";

volume map index

index map with vined vault mapped east of wet wood.
index map with po' pit mapped east of vined vault.
index map with trim tram mapped east of po' pit.
index map with fun fen mapped east of trim tram.

index map with soft sand mapped east of fun fen.
index map with last lap mapped north of lake lea.

section needs fixing

index map with got gear hot here mapped west of history hall.
index map with lit lawn mapped west of got gear hot here.
index map with dead doom mapped west of lit lawn.
