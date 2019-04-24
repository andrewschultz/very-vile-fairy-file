"Very Vile Fairy File" by Billy Boling

the story headline is "Less Lame Guess Game: Double Dip Trouble Trip"

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

volume definitions and properties

book definitions

to too-generic: if debug-state is true, say "TEXT BELOW IS TOO GENERIC. Fix."

to decide which region is mrlp:
	decide on map region of location of player;

to decide whether the action is procedural:
	if examining, yes;
	no;

definition: a thing (called th) is moot:
	if th is in Hidey House, yes;
	no;

to say here-in of (rm - a room): say "[if rm is location of player]here[else]in [rm][end if]"

to say swh of (rm - a room): say "[if rm is unvisited]somewhere new[else][rm][end if]"

to say once-now of (ru - a rule):
	process ru;
	say "[if the rule succeeded]now[else]once[end if]"

to bring-here (th - a thing): move th to location of player.

to moot (th - a thing):
	move th to Hidey House; [ic]

to move-to-temp (th - a thing):
	if th is in location of player, move th to Hidey House;

to move-from-temp (th - a thing):
	if th is in Hidey House or th is off-stage, move th to location of player;

definition: a thing (called th) is quicknear:
	if player carries th or th is in location of player, yes;
	no;

to bold-my-room:
	say "[b][location of player][r][paragraph break]"

section flags for testers

[ this won't appear in the release version, but since these flags crop up in a lot of actions to help with playtesting, we can't put them in a debug version. debug-state is another such variable, but it's included in Trivial Niceties. ]

in-beta is a truth state that varies.

climb-clear is a truth state that varies. [ did the beta tester jump ahead until the end? ]

section scoring stuff

the maximum score is 61.

min-needed is a number that varies. min-needed is 53.

min-gotten is a number that varies. min-gotten is 0.

core-score is a number that varies. core-score is 0.

core-max is a number that varies.

max-poss is a number that varies.

to up-min:
	increment min-needed;
	increment min-gotten;
	increment the score;

to up-reg:
	increment core-score;
	increment the score;

to max-down: decrement max-poss;

Worst Whew is a region. [first few]

Piddling Pain is a region. [middling main]

Poorly Penned is a region. [early end]

Vale Verminous is a region. [terminal tale]

there is a region called Get a Guess. [meta mess]

book properties

a room has text called noway-text.

a person has text called talk-text.

cheattype is a kind of value. the cheattypes are phbt, letplus, letminus, partplus, partminus, leteq, letboth.

to phbt (x - a thing):
	now cht of x is phbt;
	now x is not optional-noted;

to phbt (x - a room): now cht of x is phbt;

a room has a cheattype called cht. cht of a room is usually phbt.

a thing has a cheattype called cht. cht of a thing is usually phbt.

a thing can be optional. a thing is usually not optional.

a thing can be optional-noted. A thing is usually not optional-noted.

volume going nowhere

the wry wall is a backdrop. "The wry wall reads:[line break][sign-dir]"

nother-room is a room that varies.

after looking in a signable room:
	if nother-room is Wet Wood and player is not in Fun Fen:
		now nother-room is location of player;
	say "There's also [if player is in Fun Fen]a[else if location of player is nother-room]another[else]yet another[end if] wry wall here.";
	continue the action;

to say sign-dir:
	let got-wry be false;
	repeat through table of bad locs: [this is in the tables file]
		if there is an e1 entry and e1 entry is location of player:
			now got-wry is true;
			say "[line break][b][fake-name entry][r]: [e2 entry].";
	if got-wry is false, say " (NOTHING) -- that's a bug.";

instead of doing something with wry wall:
	if action is procedural, continue the action;
	say "The wry wall is just there for atmosphere."

definition: a room (called rm) is signable:
	repeat through table of bad locs:
		if there is no e1 entry or there is no e2 entry, next;
		if rm is e1 entry, yes;
	no;

the can't go that way rule is not listed in any rulebook.

ever-wry-wall is a truth state that varies.
wry-wall-found is a number that varies. wry-wall-found is 0.

check going nowhere:
	repeat through table of bad locs: [this is in the tables file]
		if there is no e1 entry or there is no e2 entry:
			if debug-state is true, say "(DEBUG) Fill in location/direction for [fake-name entry].";
			next;
		if location of player is e1 entry and noun is e2 entry:
			if been-here entry is true, say "You already went [noun] to [fake-name entry]. It's a death trap." instead;
			say "[death-trap entry][paragraph break]";
			say "[b][location of player][r][paragraph break]";
			now been-here entry is true;
			increment wry-wall-found;
			if wry-wall-found is number of rows in table of bad locs, say "Incidentally, you've found everything." instead;
			the rule succeeds;
	unless noway-text of location of player is empty, say "[noway-text of location of player][line break]" instead;
	say "You can't go [noun], [if number of viable directions is 0]and you may need to figure a puzzle to go anywhere[else]but you can go [list of viable directions][end if]." instead;

definition: a direction (called d) is viable:
	if the room d of location of the player is nowhere, no;
	yes;

[see header file for table of bad locs]

chapter lieloling

lieloling is an action applying to nothing.

understand the command "lie lol" as something new.

understand "lie lol" as lieloling when Fun Fen is visited.

lol-yet is a truth state that varies.

carry out lieloling:
	if lol-yet is true, say "You already exposed the wry wall." instead;
	up-min; [LIE LOL]
	say "You have a chuckle to yourself. You see through the wry wall! Well, not literally. But you know its tricks. While this doesn't uncover anything you have to do, you're that much more sure of what you don't have to do, and that's a big morale boost.";
	now lol-yet is true;
	the rule succeeds.

volume you

Kerry Kyle is a person. The player is Kerry Kyle. talk-text of Kerry Kyle is "My mumble: 'Hi!' Humble."

the zig zag rig rag is a thing. cht is leteq. The player carries the zig zag rig rag.

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
		clue-later "BIG BAG";
		say "That would be a good idea, once you had possessions to carry around. But right now, you don't have enough that would need a big bag." instead;
	say "You now have a more useful big bag!";
	up-reg;
	moot zig zag rig rag;
	now player has big bag;
	now bag-hint is false;
	the rule succeeds.

volume Worst Whew

part Wet Wood 3,0

Wet Wood is a room in Worst Whew. "You just don't feel competent enough to get out of here. You can't find any way to go. You need to become better ... [oh-simp]. You also think you can hear something.". noway-text is "[wood-noway][paragraph break]Oh, there's GOT to be a simple way to become better.". cht is leteq.

wood-row is a number that varies.

to say wood-noway:
	increment wood-row;
	if wood-row > number of rows in table of Wet Wood clues, now wood-row is 1;
	choose row wood-row in table of Wet Wood clues;
	say "[randtxt entry]";

to say oh-simp: say "oh, there's GOT to be a simple way to say things"

every turn when player is in Wet Wood:
	if turn count < 5, continue the action;
	if the remainder after dividing turn count by 3 is 0, say "You think back [one of][or]again [stopping]to being made fun of for being bad at Kick the Can. Who led the chants? Oh, that's right. Mick-the-Man.";

after looking in Wet Wood for the first time:
	say "And what's this on the ground? Something called a Leet Learner. You pick it up. It looks like you could EXAMINE or READ it for instructions. (NOTE: You can use point the learner at something by typing LL (thing), or you can refer to the learner as LL. You can also LL to scan your current location.)[line break]";
	now player has leet learner;
	set the pronoun it to leet learner;
	continue the action;

chapter getgooding

getgooding is an action applying to nothing.

understand the command "getgood" as something new.
understand the command "get good" as something new.

understand "getgood" as getgooding.
understand "get good" as getgooding.

get-good is a truth state that varies.

carry out getgooding:
	if get-good is true, say "You already did." instead;
	say "You realize you can reason your way out of the Wet Wood. You feel so good about it, even musing 'good guy's wood wise!' But this brings up a question: if you need to work on rhymes, does it matter if they are spelled identically? Will that make things easier or harder in the long run?[paragraph break]While doing so, you overlook a trap that you fall into just as you see the way out...[wfak-d]";
	up-reg;
	move player to Vined Vault;
	the rule succeeds;

part Vined Vault 3,-1

Vined Vault is a room in Worst Whew. "[if mean mass is in Vined Vault]You found fault in the Vined Vault, but you still can't leave.[else]You're stuck here! There looks to be no way out. It looks like a perfect trap, but...[end if]". noway-text is "You can't tell directions here. You need to think up a safe way out.". cht is partminus.

chapter findfaulting

findfaulting is an action applying to nothing.

understand the command "find fault" as something new.

understand "find fault" as findfaulting when player is in Vined Vault.

carry out findfaulting:
	if mean mass is in Vined Vault, say "You already did, and things got worse. You'll have to try something else." instead;
	say "Oh, wait! It isn't perfect. There you go ... if you do THIS, and THIS ...[wfak-d]";
	say "[line break]But of course something outside was guarding the vault, just waiting to walk in. A mean mass.";
	move mean mass to Vined Vault;
	up-reg;
	the rule succeeds.

chapter mean mass

The mean mass is a thing. "The mean mass continues to pulse and block the way out of the Vined Vault.". description is "The mean mass doesn't quite attack you, but it hangs menacingly, unnaturally.". cht is letplus.

chapter greengrassing

greengrassing is an action applying to nothing.

understand the command "green grass" as something new.

understand "green grass" as greengrassing when player is in Vined Vault and mean mass is in Vined Vault.

carry out greengrassing:
	say "The mean mass collapses into much safer green grass. You walk by and arrive at...";
	up-reg;
	move player to Po' Pit;
	moot mean mass;
	the rule succeeds;

part Po' Pit 2,-1

Po' Pit is a room in Worst Whew. "Just beyond a trash trap ... an obvious one, no less ... looks like freedom, of a sort. You've got to get by! There is a row writ, which may or may not be helpful, by an obvious trash trap that guards a long gash gap.". noway-text is "You can't go back, and directions don't seem to apply here. You need to think your way past the trash trap.". cht is letplus.

the row writ is scenery in Po' Pit. "[if grit-grown is true]It doesn't seem to be helpful any more, but it got you started. Yay[else]It's obviously meant to be motivational, but it's the sort of motivation that says if you want to do better, you have to be better. Be more of a person and have more hustle or desire. Still, despite its lack of detail, perhaps it is in the Po['] Pit for a reason[end if].". cht is partplus.

the trash trap is a scenery in Po' Pit. "It's pretty obvious that if you step on the trap, you'll plunge into a further pit.". cht is letminus.

the cache cap is a thing in Po' Pit. "A cap sits here, with half its bill under something. You're not going to pull it out. It's intricately designed. I guess you could call it a cache cap, since it is stuck.". description is "Oh, look here. The cache cap has a layout of the Po['] Pit, along with the gash gap and trash trap. Okay, maybe layout isn't quite the right word. But it seems to indicate there's no way through. [if grit-grown is true]You'd like to believe there is[else]With your new-found confidence, perhaps the right action could convince you otherwise[end if].". cht is partminus.

the gash gap is scenery in Po' Pit. "It looks intimidating, but who knows? Maybe you can figure a way across.". cht is leteq.

check taking the cache cap:
	say "No, the cache cap is too tacky. Perhaps it can help you in other ways." instead;

instead of doing something with cache cap:
	if action is procedural, continue the action;
	say "The cache cap is only there to (sort of) help you figure how to get beyond the Po['] Pit."

instead of doing something with trash trap:
	if action is procedural, continue the action;
	say "You want to NOT do anything with the trash trap. You don't know what could set it off."

instead of doing something with cache cap:
	if action is procedural, continue the action;
	say "The cache cap is only there to (sort of) help you figure how to get beyond the Po['] Pit."

understand "map" as trash trap when player is in Po' Pit.

chapter mashmaping

mashmaping is an action applying to nothing.

understand the command "mash map" as something new.

understand "mash map" as mashmaping when player is in Po' Pit.

carry out mashmaping:
	if grit-grown is false:
		clue-later "MASH MAP";
		say "You aren't brave enough yet. Perhaps you can face down the po['] pit so you can be." instead;
	say "The heck with this! You just don't trust the trash trap to tell you the way through.";
	up-reg;
	move player to Trim Tram;
	the rule succeeds.

chapter growgriting

growgriting is an action applying to nothing.

understand the command "grow grit" as something new.

understand "grow grit" as growgriting when player is in Po' Pit.

grit-grown is a truth state that varies.

carry out growgriting:
	if grit-grown is true, say "You already did that." instead;
	say "The trash trap looks less yucky now.";
	now grit-grown is true;
	phbt row writ;
	phbt Po' Pit;
	up-reg;
	the rule succeeds.

part Trim Tram 1,-1

Trim Tram is a room in Worst Whew. "[if me-minded is false]FIND FEE is plastered all over the Trim Tram. [end if]There's got to be a way to pay here to get the Trim Tram going. You hope so. Because there's no easy way out.". noway-text is "You're on the tram. There's no way to get off, and it'd probably lead back to the Vined Vault. How can you fake your way to paying a fare?". cht is leteq.

FIND FEE is scenery in Trim Tram. cht is partplus.

chapter mindmeing

me-minded is a truth state that varies.

mindmeing is an action applying to nothing.

understand the command "mind me" as something new.

understand "mind me" as mindmeing when player is in Trim Tram.

carry out mindmeing:
	if me-minded is true, say "You already did." instead;
	say "FIND FEE can't be right. There's nobody here to collect it. You have a bit more confidence in your ability to swindle someone, or something, else now. The FIND FEE plastered everywhere vanishes.";
	now me-minded is true;
	up-reg;
	the rule succeeds.

chapter flimflaming

skim-not-flim is a truth state that varies;

flimflaming is an action applying to nothing.

understand the command "flim flam" as something new.
understand the command "flimflam" as something new.
understand the command "skim scam" as something new.

understand "flim flam" and "flimflam" and "skim scam" as flimflaming when player is in Trim Tram.

carry out flimflaming:
	if me-minded is false:
		clue-later "FLIM FLAM";
		say "That's a good idea, but you don't have the confidence yet! You need to get your bearings a bit." instead;
	if the player's command includes "skim", now skim-not-flim is true;
	say "That does it! The tram moves off...";
	move the player to Fun Fen;
	up-reg;
	say "(By the way, you could also have tried [if skim-not-flim is true]FLIM FLAM[else]SKIM SCAM[end if].)";
	the rule succeeds.

volume Piddling Pain

part Fun Fen 0,0

Fun Fen is a room in Piddling Pain. "It's a bit nicer than back in the Done Den. You don't fear ambush by a hun hen. There's also a wry wall here. The Done Den [if tree-down is false]you just left [end if]is also around. You can go south, and [if tall tree is moot]with the tall tree pushed over, you can go north[else]it looks like you could go north, buit the way looks treacherous and murky. Maybe you can do something with the tall tree nearby[end if].". noway-text is "You don't want to go back through the Done Den to the Wet Wood or Vined Vault. Or fall off Fun Fen.".

the done den is scenery in Fun Fen. "You feel a sense of accomplishment having made it through the done den, but you don't want to go back."

instead of entering done den, say "As you start to enter, you imagine a weight falling on you. How much? A ton. Ten.[paragraph break]You don't need to revisit your initial success."

tree-down is a truth state that varies.

The Tall Tree is scenery in Fun Fen. "[if tree-down is false]The tall tree sits here, bending out over the gap to the north. It could make a bridge reaching the other side[else]You made the tall tree fall free to the north, giving passage to [swh of the room north of Fun Fen][end if].". cht is leteq.

the wrong art is optional scenery in Fun Fen. "It just looks wrong here. But perhaps it is sort of right, because it may give you one more idea about how to do things.". cht of the wrong art is letplus.

check going in Fun Fen:
	if noun is north and tree-down is false, say "You need a way off the cliff edge. Well, a safe one." instead;
	if noun is down, say "'Don't die.' / 'Won't! Why?'" instead;

instead of doing something with tall tree:
	if action is procedural, continue the action;
	say "[if tree-down is true]You'd better not do anything to the tree. It's your way across[else]You need to do something specific to the tree. Maybe give it an order[end if].";

the hive heap is a thing. cht is leteq.

check taking hive heap: say "You'd probably get stung." instead;

the vapor vile is a thing. cht is leteq.

check taking vapor vile: say "It's too ethereal to take," instead;

the paper pile is a thing. "A paper pile lies here. You'd like it to be a bit more firmly bound together before you take it.". description is "It is a bit loose. Every single paper is labeled FACT FINDER.". cht is partplus.

check taking paper pile: say "There's got to be a way to put the paper pile together a bit better first." instead;

the backed binder is a thing.

chapter strongstarting

strongstarting is an action applying to nothing.

understand the command "strong start" as something new.

understand "strong start" as strongstarting when player is in Fun Fen.

started-strong is a truth state that varies.

carry out strongstarting:
	if started-strong is true, say "You already did. You wouldn't want a stale start. Why, you might get sent to Male Mart. Or run over by a kale cart." instead;
	now started-strong is true;
	say "Boom!";
	up-min;
	phbt wrong art;
	the rule succeeds.

chapter Cark Cliff

Cark Cliff is optional proper-named scenery in Fun Fen. "[if wild weed is moot]You don't feel so worried about Cark Cliff now[else]It's intimidating, but it would be neat if it weren't[end if].". cht is letplus. [?? bark biff]

chapter sparkspliffing

sparkspliffing is an action applying to nothing.

understand the command "spark spliff" as something new.

understand "spark spliff" as sparkspliffing when wild weed is quicknear or player is in Fun Fen.

carry out sparkspliffing:
	if wild weed is moot, say "Whoah, dude. You already did." instead;
	if player does not have wild weed, say "Whoah, dude. You have nothing to light up with." instead;
	if player is not in Fun Fen, say "Not here, dude! No source of flame!" instead;
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
	phbt tall tree;
	move hive heap to Fun Fen;
	up-reg;
	the rule succeeds;

chapter divedeeping

divedeeping is an action applying to nothing.

understand the command "dive deep" as something new.

understand "dive deep" as divedeeping when hive heap is quicknear.

carry out divedeeping:
	say "You look through the hive heap. You don't hear buzzing. You keep throwing hives over until ... well, a vapor, vile, is released.[paragraph break]Hmm. That's interesting. DEEP and HEAP rhyme, but the spelling's a bit different.";
	moot hive heap;
	up-reg;
	bring-here vapor vile;
	the rule succeeds.

chapter paperpileing

paperpileing is an action applying to nothing.

understand the command "paper pile" as something new.

understand "paper pile" as paperpileing when vapor vile is quicknear.

carry out paperpileing:
	say "The vapor vile changes to a paper pile.";
	up-reg;
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
	up-reg;
	the rule succeeds.

part Real Rear 0,-1

Real Rear is south of Fun Fen. Real Rear is in Piddling Pain. "Yup. This feels about like the edge of where you can explore. You can really only go back north. A peeling pier leads out south to the Sage Sea, which expands on all sides. There's also a steel steer here, and you sense the presence of a Ceiling Seer as well. This seems like a place for reflection on your emotions.". noway-text is "The Sage Sea surrounds you all ways except back north[if cage key is not off-stage]. You already got the cage key from it, anyway[end if]. You also sense a Ceiling Seer above, judging what you do.". cht is partplus.

the Sage Sea is scenery in Real Rear. [?? cage key as a mistake, mage me]

the steel steer is a thing in Real Rear. description is "It's probably a good thing it's not a stealing steer, which would fit in fully with the pier, but all the same, it suggests things you might be able to do.". cht is partminus.

the peeling pier is scenery in Real Rear.

check taking steel steer: say "It is way too heavy." instead;

the cage key is a thing.

chapter kneelnearing

kneelnearing is an action applying to nothing.

understand the command "kneel/kneeling near" as something new.

understand "kneeling near" as kneelnearing when player is in Real Rear.
understand "kneel near" as kneelnearing when player is in Real Rear.

knelt-yet is a truth state that varies.

carry out kneelnearing:
	if knelt-yet is true, say "You already did!" instead;
	up-reg; [kneel near]
	say "You kneel at the pier, facing away from the Steel Steer to avoid any semblance of idolatry that might cause the Ceiling Seer to strike you down. You feel peace and acceptance and potential and ability wash over you.";
	now knelt-yet is true; [?? track difference]
	now cht of Real Rear is leteq;
	now cht of steel steer is letminus;
	the rule succeeds.

chapter feelfearing

feelfearing is an action applying to nothing.

understand the command "feel fear" as something new.

understand "feel fear" as feelfearing when player is in Real Rear.

felt-fear is a truth state that varies.

carry out feelfearing:
	if knelt-yet is false:
		clue-later "FEEL FEAR";
		say "Fear isn't something you can try to feel. The Ceiling Seer seems to be watching down on you, saying you can't do that yet." instead;
	up-reg;
	now felt-fear is true;
	the rule succeeds.

chapter dealdearing

dealdearing is an action applying to nothing.

understand the command "deal dear" as something new.

understand "deal dear" as dealdearing when player is in Real Rear.

carry out dealdearing:
	if knelt-yet is false:
		clue-later "DEAL DEAR";
		say "Fear isn't something you can try to feel. The Ceiling Seer seems to be watching down on you, saying you can't do that yet." instead;
	say "The Sage Sea calms and parts briefly to reveal a cage key. You step in, slightly worried it may engulf you, but you've practiced your serenity.";
	now player has cage key;
	up-reg;
	phbt Real Rear;
	phbt steel steer;
	the rule succeeds.

chapter healhereing

healhereing is an action applying to nothing.

understand the command "heal here" as something new.

understand "heal here" as healhereing.

healed-here is a truth state that varies.

carry out healhereing:
	clue-later "HEAL HERE";
	say "You don't have anything to heal from, yet. Sorry." instead;
	up-reg;
	now healed-here is true;
	the rule succeeds.

part Creased Cross 0,1

Creased Cross is north of Fun Fen. Creased Cross is in Piddling Pain. "You can go in all four directions here.". cht is letminus.

chapter Bull Beast

The Bull Beast is a person. talk-text is "'Tame? Tush! Maim! Mush!'". "[if cull-ceased is true]The Bull Beast lies dead here[else]The Bull Beast roars around here[end if]."

instead of doing something with Bull Beast when cull-ceased is true: say "The Bull Beast is dead."

chapter cullceaseding

cullceaseding is an action applying to nothing.

understand the command "lul least" as something new.
understand the command "cull ceased" as something new.

understand "lul least" as cullceaseding when can-kill-beast.
understand "cull ceased" as cullceaseding when can-kill-beast.

cull-ceased is a truth state that varies.

to decide whether can-kill-beast:
	if player is in Creased Cross and Bull Beast is in Creased Cross and healed-here is true, yes;
	no;

carry out cullceaseding:
	say "YOU KILLED THE BULL BEAST.";
	now cull-ceased is true;
	up-reg;
	the rule succeeds.

chapter fullfeasting

fullfeasting is an action applying to nothing.

understand the command "full feast" as something new.

understand "full feast" as fullfeasting.

carry out fullfeasting:
	if Bull Beast is not in location of player, say "Not here." instead;
	if Bull Beast is in location of player:
		clue-later "FULL FEAST";
		say "That should work. It might work better if the Bull Beast were incapacitated." instead;
	if Bull Beast is moot, say "You already made a feast." instead;
	up-reg;
	say "BOOM! You managed to make a full feast of the Bull Beast. Everyone loves it. It tastes good. Nothing is left.";
	moot Bull Beast;
	the rule succeeds.

chapter leastlossing

leastlossing is an action applying to nothing.

understand the command "least loss" as something new.

understand "least loss" as leastlossing.

least-loss is a truth state that varies.

carry out leastlossing:
	if player is not in Creased Cross, say "Not here." instead;
	if Bull Beast is off-stage:
		clue-later "LEAST LOSS";
		say "Not yet. You need to be in a fighting situation" instead;
	if least-loss is true, say "You already did." instead;
	now least-loss is true;
	up-reg;
	say "BOOM! The Bull Beast, upset it only got to take (minor random item) from you, falls over in a fit of shame.";
	the rule succeeds.

part History Hall -1,1

mistmall is a truth state that varies.

History Hall is west of Creased Cross. cht is leteq. History Hall is in Piddling Pain. printed name of History Hall is "[if mistmall is true]Mystery Mall[else]History Hall[end if]".

Name Notes Tame Totes is scenery in History Hall. "You read about [next-rand-txt of table of miscellaneous people]."

the Gutta Ganksta is an optional person. description is "GOTS GAME is tattooed on the Gutta Ganksta.". talk-text is "'Chill, chap. Will WHAP!'". cht is leteq.

GOTS GAME is part of the Gutta Ganksta. cht is leteq.

after lling gutta ganksta:
	if cht of gots game is leteq:
		say "But the GOTS GAME tattoo is worth scanning, too, so you do so.";
		try lling gots game;
	continue the action;

Toe Tappin Row Rappin is scenery. "You [one of]listen a bit. The song is Toe Tappin Row Rappin['], and it's actually pretty catchy and good and might help you in the future. It's stuck in your head now, and that's not all bad, because it tunes out, making way for something much worse[or]already have the song in your head. Perhaps it will be useful to see things differently[stopping]."

after examining Toe Tappin Row Rappin:
	if player does not have Row Rappin, now player has Row Rappin;
	continue the action;

Oi Mo by Tim T Sims Pimp is optional scenery. "It's a truly awful song. If you could find a way to turn it down...". cht is leteq.

check going west in History Hall:
	if mistmall is true, continue the action;
	say "[if ever-mall is true]You'll have to change back to History Hall[else]There should be something there, but there isn't, right now[end if]." instead;

chapter sappining

sosappining is an action applying to nothing.

understand the command "so sappin" as something new.

understand "so sappin" as sosappining when toe tappin row rappin is in location of player or player has toe tappin row rappin.

carry out sosappining: [ho happen??]
	say "Man! The tune in your head, the one you feel you have to whistle and sing, flows freely. But it's not exciting like it was. It's all slowed down.";
	moot toe tappin row rappin;
	up-reg;
	the rule succeeds.

chapter historyhalling

historyhalling is an action applying to nothing.

understand the command "history hall" as something new.

understand "history hall" as historyhalling.

carry out historyhalling:
	if mistmall is false, say "You're already in History Hall.";
	move-to-temp gutta ganksta;
	move-from-temp Name Notes Tame Totes;
	now Vending Vibe is mapped west of History Hall;
	now History Hall is mapped east of Vending Vibe;
[	move-from-temp Erst Lore;?? should have scenery defining this]
	move-to-temp gutta ganksta;
	move-to-temp Oi Mo;
	bold-my-room;
	now mistmall is false;
	the rule succeeds;

chapter mysterymalling

ever-mall is a truth state that varies.

mysterymalling is an action applying to nothing.

understand the command "mystery mall" as something new.

understand "mystery mall" as mysterymalling when player is in History Hall.

carry out mysterymalling:
	if mistmall is true, say "You're already in the Mystery Mall." instead;
	move-to-temp Name Notes Tame Totes;
	move-from-temp gutta ganksta;
	move-from-temp Oi Mo;
	if Toe Tappin is not off-stage, move-from-temp Toe Tappin;
	now Got Gear Hot Here is mapped west of History Hall;
	now mistmall is true;
	if ever-mall is false:
		up-reg;
		now ever-mall is true;
	bold-my-room;
	the rule succeeds;

chapter lotslameing

lotslameing is an action applying to nothing.

understand the command "lots lame" as something new.

understand "lots lame" as lotslameing.

lots-lame is a truth state that varies.

carry out lotslameing:
	if lots-lame is true, say "You already pinged the Gutta Ganksta like that." instead;
	say "The Gutta Ganksta suddenly feels dissed. Not enough to move out of the way, but enough to make you feel clever.";
	up-min; [opt]
	now lots-lame is true;
	the rule succeeds.

chapter dimding

dimding is an action applying to nothing.

understand the command "dimd" as something new.

understand "dimd" as dimding when Oi Mo is quicknear.

carry out dimding:
	say "The beats of [i]Oi, Mo[r] quiet down out of hearing. You're worried they may be replaced by some song like 'Primp'r' or flip flop to Tip Top Hip Hop, but it's your lucky day. Blissful silence.";
	moot oi mo;
	up-min;
	the rule succeeds.

chapter whatawankstaing

whatawankstaing is an action applying to nothing.

understand the command "whatawanksta" as something new.

understand "what a wanksta" as whatawankstaing when ever-mall is true.
understand "whatta wanksta" as whatawankstaing when ever-mall is true.

carry out whatawankstaing:
	if ganksta is moot, say "You already got rid of the ganksta." instead;
	if ganksta is not quicknear, say "That might work with the ganksta around." instead;
	say "Exposed, the [ganksta] turns red. It just can't face you any more and runs off for another mall to look cool in.";
	moot ganksta;
	up-min;
	the rule succeeds;

chapter firstflooring

firstflooring is an action applying to nothing.

understand the command "first floor" as something new.

understand "first floor" as firstflooring when player is in History Hall and mistmall is false.

floor-yet is a truth state that varies.

carry out firstflooring:
	if floor-yet is true, say "You already did." instead;
	up-reg;
	say "Erst Lore, up on the ceiling, comes down. You can go IN, now.";
	now Erst Lore is mapped inside History Hall;
	now History Hall is mapped outside Erst Lore;
	the rule succeeds.

part Erst Lore -2,0

Erst Lore is a room in Piddling Pain.

part Y'Old Yard -2,-1

Y'Old Yard is south of Erst Lore. It is in Piddling Pain.

The Bold Bard is a person in Y'Old Yard.

Hold Hard is scenery in Y'Old Yard.

the gold guard is a thing.

chapter coldcarding

coldcarding is an action applying to nothing.

understand the command "cold card" as something new.

understand "cold card" as coldcarding when player is in Y'Old Yard.

carry out coldcarding:
	up-reg;
	moot Bold Bard;
	now player has gold guard;
	the rule succeeds.

part Vending Vibe -2,1 a

Vending Vibe is a room in Piddling Pain. "You can only go back east here."

The Trending Tribe are plural-named people in Vending Vibe. cht is letplus. talk-text is "'Bam, burning! Am earning!'"

the Lending Libe is scenery. "Looking in, you see one book labeled [i][next-rand-txt of table of vvff books][r]. This locational libe has no vocational vibe.";

chapter lendinglibeing

lendinglibeing is an action applying to nothing.

understand the command "lending libe" as something new.

understand "lending libe" as lendinglibeing.

carry out lendinglibeing:
	if trending tribe is moot, say "You already disposed of the trending tribe." instead;
	moot trending tribe;
	up-reg;
	say "The Trending Tribe is appalled by the possibility of people getting something for free. Even books that don't help you profit.";
	now printed name of Vending Vibe is "Lending Libe";
	move lending libe to Vending Vibe;
	the rule succeeds.

part Got Gear Hot Here -2,1 b

Got Gear Hot Here is a room in Piddling Pain. It is west of History Hall.

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
	up-reg;
	the rule succeeds.

part Lake Lea 1,1

Lake Lea is east of Creased Cross. It is in Piddling Pain. "You're on the Lake Lea, which borders on Lake Lap.".

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
	up-reg; [x-of-y jake]
	the rule succeeds.

chapter wakewheeing

wakewheeing is an action applying to nothing.

understand the command "wake whee" as something new.

understand "wake whee" as wakewheeing.

wake-whee is a truth state that varies.

carry out wakewheeing:
	if wake-whee is true, say "You already did the whole wake-whee bit." instead;
	now wake-whee is true;
	up-reg; [x-of-y jake]
	the rule succeeds.

chapter achying

achying is an action applying to nothing.

understand the command "achy" as something new.

understand "achy" as achying.

achy is a truth state that varies.

carry out achying:
	if achy is true, say "You already made Jake G achy." instead;
	now achy is true;
	up-reg; [opt] [x-of-y jake]
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
	up-reg; [opt] [x-of-y jake]
	eval-jake-g;
	the rule succeeds.

part Whining War 2,1

Whining War is east of Lake Lea. It is in Piddling Pain. "You can't get a close enough view.". cht is partplus.

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
	if beer bull is not moot:
		clue-later "SHINING SHORE";
		say "It could be that way. But you need to get rid of the whining first." instead;
	say "The Whining War dissipates, leaving the shining shore of ... Lake Lap! It's much brighter here. You feel there may be something else to find here.";
	up-reg;
	phbt Whining War;
	move lake lap to Whining War; [??fake fap]
	now shore-shine is true;
	the rule succeeds.

chapter miningmoreing

miningmoreing is an action applying to nothing.

understand the command "mining more" as something new.

understand "mining more" as miningmoreing when player is in Whining War and mine-more is false.

mine-more is a truth state that varies.

carry out miningmoreing:
	abide by the shone-yet rule;
	up-reg;
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
	up-reg;
	now dine-door is true;
	the rule succeeds.

chapter snakesnaping

snakesnaping is an action applying to nothing.

understand the command "snake snap" as something new.

understand "snake snap" as snakesnaping when ache app is off-stage and player is in lake lap.

carry out snakesnaping:
	up-reg;
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
	up-reg;
	the rule succeeds.

part Soft Sand 0,2

Soft Sand is a room in Piddling Pain. Soft Sand is north of Creased Cross. cht is leteq.

ever-loft is a truth state that varies.

loft-land is a truth state that varies.

check going west in Soft Sand:
	if loft-land is false and jerk gel is not in Shirk Shell, say "The smirk smell is too repulsive. You can't go back." instead;

part Here Hull 1,2

Here Hull is a room in Piddling Pain. It is east of Soft Sand.

The Beer Bull is a person in Here Hull. cht of beer bull is partminus. talk-text is "It can't speak, but its look says 'Real rude? Deal, dude!'"

to decide whether hull-bull:
	if player is in Here Hull or beer bull is in location of player, yes;
	no;

to reset-bull:
	move beer bull to Here Hull;
	now cht of beer bull is partminus;

chapter fearfuling

fearfuling is an action applying to nothing.

understand the command "fearful" as something new.

understand "fearful" as fearfuling when hull-bull.

fearful-ever is a truth state that varies.

carry out fearfuling:
	if fearful-ever is false:
		now fearful-ever is true;
		up-reg;
	now cht of beer bull is leteq;
	say "The beer bull snorts and begins to follow you.";
	now fearful-on is true;
	the rule succeeds.

chapter deardulling

deardulling is an action applying to nothing.

understand the command "dear dull" as something new.

understand "dear dull" as deardulling when hull-bull.

fearful-on is a truth state that varies.

carry out deardulling:
	if fearful-on is false, say "No. The beer bull is too dull." instead;
	if player is not in Whining War, say "This isn't the right place to calm the beer bull down." instead;
	say "The beer bull settles down. Both sides of the Whining War cautiously approach. It's not very good beer, but it doesn't matter. They all get drunk. Once each side has had their fill, the bull wanders off." instead;
	up-reg;
	moot beer bull;
	the rule succeeds.

part Shirk Shell -1,2 a

Shirk Shell is a room in Piddling Pain. It is west of Soft Sand.

the jerk gel is a thing in Shirk Shell.

understand "glowing/globs" and "glowing globs" as jerk gel when player has jerk gel.

check taking jerk gel when jerk gel is in Shirk Shell:
	say "The jerk gel has spilled out a bit." instead;

chapter workwelling

workwelling is an action applying to nothing.

understand the command "work well" as something new.

understand "work well" as workwelling.

carry out workwelling:
	say "You work to put all the jerk gel back in. It becomes glowing globs.";
	now the player has the jerk gel;
	up-reg;
	the rule succeeds.

part Curst Cave -1,2 b

Curst Cave is a room in Piddling Pain. "You can only go back east[tap-in-cave]."

the worst wave is scenery in Curst Cave.

the screaming skull is a thing in Curst Cave.

check taking screaming skull: say "You need to 'take' it figuratively." instead;

to say tap-in-cave:
	if tool tap is in Curst Cave, say ". A tool tap sits where the worst wave used to be[if cool cap is not off-stage], but you already got something from it[else], and you haven't gotten anything interesting from it yet[end if]."

the tool tap is scenery.

the cool cap is a thing.

chapter dreamingdulling

dreamingdulling is an action applying to nothing.

understand the command "dreaming dull" as something new.

understand "dreaming dull" as dreamingdulling when player is in Curst Cave and screaming skull is in Curst Cave.

carry out dreamingdulling:
	moot screaming skull;
	say "The screaming skull stops screaming and starts alternatively snoring and mumbling about that time it wound up naked at Undead Orientation, or the time the ghost of its secret crush found proof of said crush, or its own groundhog day studying for an exam it still can't pass, dreaming of their job when home from work, or walking in as a skeleton at its own funeral, or how it wrote a brilliant poem but then woke up, or how its final judgment went a bit differently, for better or worse. You try to show empathy and interest, but it's hopeless. The skull, upset and exhausted from its harangue, rolls off through the worst wave. Unable to help yourself, you call out 'May you sleep in interesting dreams!'";
	up-reg;
	the rule succeeds.

chapter firstfaveing

firstfaveing is an action applying to nothing.

understand the command "firstfave" as something new.
understand the command "first fave" as something new.

understand "firstfave" as firstfaveing when player is in Curst Cave.
understand "first fave" as firstfaveing.

first-fave is a truth state that varies.

carry out firstfaveing:
	if first-fave is true, say "You already did." instead;
	if screaming skull is in Curst Cave,
		clue-later "FIRST FAVE";
		say "You can't like anything with that screaming skull around!" instead;
	say "Suddenly, the worst wave isn't very bad or evil at all.";
	up-reg;
	now first-fave is true;
	move tool tap to Curst Cave;
	the rule succeeds;

chapter coolcaping

coolcaping is an action applying to nothing.

understand the command "cool cap" as something new.

understand "cool cap" as coolcaping when player is in Curst Cave and tool tap is in cool cap.

carry out coolcaping:
	if cool cap is not off-stage, say "You already got the cool cap." instead;
	up-reg;
	say "What do you know? A cool cap DOES come out.";
	now player has cool cap;
	the rule succeeds.

part Foe Field So Sealed 0,3

Foe Field So Sealed is a room in Piddling Pain. It is north of Soft Sand. printed name is "Foe Field[if shield-shown is false] So Sealed[end if]".

check going west in Foe Field So Sealed: if shield-shown is false, say "A booming voice calls 'YO! YIELD!' You need to find a way to protect yourself from it." instead;

chapter showshielding

showshielding is an action out of world.

understand the command "show shield" as something new.

understand "show shield" as showshielding.

shield-shown is a truth state that varies.

carry out showshielding:
	if shield-shown is true, say "You already did." instead;
	if player does not have gold guard:
		clue-later "SHOW SHIELD";
		say "You have nothing that would guard you effectively. Maybe later." instead;
	up-reg;
	say "You flash your gold guard, and bam, the voice that says YO YIELD quiets down. You can go west now.";
	now shield-shown is true;
	the rule succeeds.

part Store All Stage -1,3

Store All Stage is a room in Piddling Pain. It is west of Foe Field.

the coral cage is a thing in Store All Stage.

the moral mage is a person in Store All Stage.

chapter moralmageing

moralmageing is an action applying to nothing.

understand the command "moral mage" as something new.

understand "moral mage" as moralmageing when coral cage is quicknear.

carry out moralmageing:
	if player does not have cage key:
		clue-later "MORAL MAGE";
		say "The coral cage is too dense to see through or destroy right now. Maybe if you were able to get into it." instead;
	say "The inner bars of the coral cage crumble. The moral mage thanks you.";
	up-reg;
	moot moral mage;
	moot coral cage;
	the rule succeeds.

volume Vale Verminous

part Gassed Gap 0,4

Gassed Gap is a room in Vale Verminous. "[if Reeker Russell is off-stage]It looks like there should be a way to the north, but it's too hazy. You may need to do something to break things up[else]There's a way to the north, now that you cast your cap[end if]."

Gassed Gap is north of Foe Field. cht is partminus.

printed name of Gassed Gap is "[if cap-cast is true]Last Lap[else]Gassed Gap[end if]".

cap-cast is a truth state that varies.

check going north in Gassed Gap:
	if Reeker Russell is off-stage, say "You haven't found the way, yet." instead;
	if Reeker Russell is in Gassed Gap, say "Not with Reeker Russell around." instead;
	say "You avoid the trap leading to the Vined Vault...";

[?? trusty tap / crusty cap]

chapter Reeker Russell

Reeker Russell is a person. Reeker Russell carries the good gun. "Reeker Russell is blocking the way north.". talk-text is "'My mood: DIE, dude!'".

to decide which number is russell-progress:
	let rp be 0;
	if meeker-yet is true, increment rp;
	if good gun is moot, increment rp;
	decide on rp;

to check-russell-go:
	up-reg;
	if russell-progress is 2:
		say "Russell flees!";
		moot Reeker Russell;
		if beaker-yet is false, max-down;
	else:
		say "Russell looks confused! One more setback, and he's had it.";

chapter castcaping

castcaping is an action applying to nothing.

understand the command "cast cap" as something new.

understand "cast cap" as castcaping when player is in Gassed Gap.

carry out castcaping:
	if cool cap is moot, say "You already did." instead;
	if player does not have cool cap:
		clue-later "CAST CAP";
		say "You need a cap to cast!" instead;
	say "You cast your cap, and the haze to the north disappears. You can see the way! But you can also see someone big and mean: you know it must be (W)re(a/e)ker Russell!";
	moot cool cap;
	move Reeker Russell to Gassed Gap;
	up-reg;
	phbt Gassed Gap;
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

understand "wood one" as woodoneing when good gun is quicknear or player is in Gassed Gap.

carry out woodoneing:
	if good gun is moot, say "You already got rid of the good gun." instead;
	say "The good gun turns into a wood one in Reeker Russell's hands! He throws it away in disgust.";
	moot good gun;
	check-russell-go; [nec]
	the rule succeeds;

part Airy Isle 0,5

Airy Isle is north of Gassed Gap. It is in Vale Verminous. "You hear laughter here, but it's all wrong. You could back out to the south, but you sense your destiny is to deal with the Very Vile Fairy File.". noway-text is "The Fairy File's presence makes you bump into walls figuratively. Let's not to so literally."

check going south in Airy Isle:
	if climb-clear is true, say "Since you used the CLIMB CLEAR jump command, going south would mess things up." instead;
	if bot board is in Airy Isle, say "The bot board loses interest as you flee back south.";

the frightening fridge is scenery.

the Bot Board are plural-named people in Airy Isle. talk-text is "Meep, mate! Heap hate! Weep, wait!"

chapter lotlording

the Lot Lord is a person.

lotlording is an action applying to nothing.

understand the command "lot lord" as something new.

understand "lot lord" as lotlording.

carry out lotlording:
	if Lot Lord is not off-stage, say "You already summoned the Hot Horde." instead;
	up-reg;
	say "The Lot Lord appears.";
	the rule succeeds.

chapter hothordeing

the Hot Horde are plural-named people. talk-text is "Lots of rot roared right now.".

hothordeing is an action applying to nothing.

understand the command "hot horde" as something new.

understand "hot horde" as hothordeing.

carry out hothordeing:
	if Hot Horde is not off-stage, say "You already summoned the Hot Horde." instead;
	up-reg;
	say "The legendary Hot Horde appears.";
	the rule succeeds.

chapter gotgoreding

gotgoreding is an action applying to nothing.

understand the command "got gored" as something new.

understand "got gored" as gotgoreding when player is in Airy Isle.

carry out gotgoreding:
	if Lot Lord is moot and Hot Horde is moot, say "You already told the battle cry." instead;
	if Lot Lord is in Airy Isle and Hot Horde is in Airy Isle:
		say "YES! That's the cheer they need.";
		up-reg;
		moot Hot Horde;
		moot Lot Lord;
		moot Bot Board;
		the rule succeeds;
	clue-later "GOT GORED";
	if Hot Horde is in Airy Isle: [and Lot Lord is off-stage]
		say "The Hot Horde needs more than a battle cry. It needs a leader." instead;
	else if Lot Lord is in Airy Isle: [and Hot Horde is off-stage]
		say "The Lot Lord nods, but alas, one person using a battle cry against the Bot Board won't work." instead;
	else:
		say "That would just be your epitaph right now. But with some help--a lot--it could be a potent rallying cry.";
	the rule succeeds.

chapter telltorning

the well worn hell horn is a thing in Airy Isle. cht is leteq.

instead of doing something with the well worn hell horn:
	if action is procedural, continue the action;
	say "It ... well, it looks used, but it still hasn't fallen apart.";

telltorning is an action applying to nothing.

understand the command "tell torn" as something new.

understand "tell torn" as telltorning when well worn hell horn .

carry out telltorning:
	say "The well worn hell horn rips apart and unwinds. Fortunately, as it does so, there is no bell born.";
	moot well worn hell horn;
	up-reg;
	the rule succeeds.

chapter brighteningbridgeing

brighteningbridgeing is an action applying to nothing.

understand the command "brightening bridge" as something new.

understand "brightening bridge" as brighteningbridgeing when player is in Airy Isle and frightening fridge is in Airy Isle.

carry out brighteningbridgeing:
	say "Boom! There goes the fridge!";
	up-reg;
	moot frightening fridge;
	the rule succeeds.

part Tarry Tile 1,5

Tarry Tile is a room in Vale Verminous. printed name is "[if merry-mile is true]Merry Mile[else]Tarry Tile[end if]"

chapter Very Vile Fairy File

the Very Vile Fairy File is a thing in Tarry Tile. "The Very Vile Fairy File sort of repels you and attracts you at the same time. You know there must be a way to neutralize it. It is co-written by, unsurprisingly, Harry Hile, Larry Lyle, Perry Pyle and Sherry Shiel[one of]. They must be the Crimes Crew Times Two that Kit Cohen talked about! There's an even number of them, so that part works out[or][stopping]. You may or may not be up to READing it[ever-tried of table of vvff digs].". cht is partminus.

to say ever-tried of (t - a table name):
	repeat through table of all randoms:
		if tabnam entry is t and tabidx entry > 0, say " some more"

vvff-row is a number that varies.

instead of doing anything with the Fairy File:
	if action is procedural, continue the action;
	say "[ff-no].";

instead of doing anything when noun is Fairy File:
	if action is procedural, continue the action;
	say "[ff-no].";

to say ff-no: say "You can't do anything directly with or to the Fairy File. There must be some overarching action"

chapter burybileing

burybileing is an action applying to nothing.

understand the command "bury bile" as something new.

understand "bury bile" as burybileing.

carry out burybileing:
	if player is in Tarry Tile:
		if well worn hell horn is in Tarry Tile:
			clue-later "BURY BILE";
			say "The well worn hell horn makes a loud noise. It's intimidating, and yet, you could find a way to prep yourself to ignore or get rid of the horn, then take the file." instead;
		if merry-mile is false:
			clue-later "MERRY MILE";
			say "You want to, but you're still just barely forcing it. You need a way to cheer yourself up to get going." instead;
	clue-later "BURY BILE";
	if player is in Airy Isle, say "You'd like to do that, but not here with so many distractions, during perhaps the big last fight." instead;
	if mrlp is Vale Verminous:
		too-generic;
		say "It must be about the right time. But you are not quite there, yet." instead;
	if mrlp is Worst Whew, say "You try, and it seems right, but it's not that easy. You have quite a journey before you, until you can do that. But when the time is right, it will be very effective." instead;
	if mrlp is Piddling Pain, say "You can sort of deal with that right now. But you need to do better! You still have adventure to go!";
	say "Yes. You know what to do. As you bury the bile -- yours for others you have met in the game and in the past, the Very Vile Fairy File itself dissolves. The Merry Mile changes significantly. You are on your way back.";
	up-reg;
	win-the-game;
	the rule succeeds; [Larry Lyle, Wary Wile, Dare-y Dial, Perry Pyle, Gary Guile]

to win-the-game:
	if wry-wall-found < 2 or wry-wall-found is number of rows in table of bad locs:
		choose row with final response activity of showdeathsing in the Table of Final Question Options;
		blank out the whole row;
	if score is maximum score:
		choose row with final response activity of showmissesing in the Table of Final Question Options;
		blank out the whole row; [don't let the player see MISSED if they got everything]
	end the story finally saying "DEALS DONE: FEELS FUN!";

volume verbs

book standard modifications

chapter dropping

instead of dropping when number of entries in multiple object list > 1 (this is the don't allow dropping all rule):
	alter the multiple object list to { };
	add noun to multiple object list;
	continue the action;

instead of dropping:
	say "You don't need to drop anything in this game[if player has zig zag rig rag]. However, you have a way to make a carryall that can hold everything you want. Check your inventory[end if].";

chapter taking

check taking:
	if player has zig zag rig rag and number of things enclosed by the player > 4:
		alter the multiple object list to { };
		add noun to multiple object list;
		say "You're juggling too much! Maybe something you're carrying can be repurposed." instead;

chapter waiting

check waiting: say "Hi ho! Lie low." instead;

chapter talking

talktoing is an action applying to one thing.

understand the command "talk to" as something new.
understand the command "talk" as something new.
understand the command "t" as something new.

understand "talk to [something]" as talktoing.
understand "talk [something]" as talktoing.
understand "t [something]" as talktoing.

check talktoing:
	if noun is not a person, say "You can only talk to living things, and [the noun] doesn't qualify." instead;
	if talk-text of noun is empty, say "BUG: there should be text, but there isn't." instead;
	say "[talk-text of noun]" instead;

chapter inventory

after printing the name of jerk gel while taking inventory: say " (glowing globs)";

check taking inventory:
	if player has big bag, say "Boy! You can carry all you need with your big bag![paragraph break]";
	now all things enclosed by the player are marked for listing;
	now toe tappin is unmarked for listing;
	now cool cap is unmarked for listing;
	now big bag is unmarked for listing;
	say "Stuff stole (rough role):[line break]";
	list the contents of the player, with newlines, indented, including contents, giving inventory information, with extra indentation, listing marked items only;
	if player has toe tappin, say "Toe Tappin Row Rappin['], that catchy song, is in your head. Maybe you can do things with it.";
	if player has cool cap, say "You're also wearing a cool cap.";
	the rule succeeds;

check taking when player does not have big bag:
	if number of things enclosed by the player > 3:
		say "You can't carry so much at once! ";
		if tried-yet of "BIG BAG":
			say "Perhaps now is a good time to change the zig zag rig rag to a big bag, as you tried before." instead;
		say "Maybe you can finagle, or create, a container that'll let you hold as much as you want." instead;

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
	if player is in Wet Wood, say "'Bet, bud! Met mud!' That sounds a bit off, but ... perhaps it can help you in some odd way beyond just going in random directions." instead;
	if player is in History Hall and Toe Tappin Row Rappin is in History Hall, try examining Row Rappin instead;
	if player is in History Hall and Oi Mo is in History Hall, say "Tim T. Sims, Pimp, still sings [i]Oi, Mo[r]. The chorus mentions double duty, which, eww. Maybe there's a way to quiet it down." instead;
	say "Nothing special."

chapter thinking

thought-any is a truth state that varies.

to say tat: now thought-any is true;

ever-thought is a truth state that varies.

instead of thinking:
	let thought-any be false;
	say "Here's general information you know from your experience so far: [rhyme-display][line break]You think about more specific challenges you've encounterd and not solved, and what you've done and tried, and what you can do.";
	repeat through table of forlaters:
		if ready-to-hint entry is true:
			consider the is-done entry;
			if the rule succeeded:
				now ready-to-hint entry is false;
				continue the action; [ this may be duplicate code in score and thinking changes rules but I'm a bit nervous about it at the moment, and this shuts the door 100%. Test later with this gone if I have time. ]
			now thought-any is true;
			consider the can-do-now entry;
			if the rule succeeded, say "(CAN DO NOW) ";
			say "[tat][think-advice entry][line break]";
	if thought-any is false, say "[line break]But you don't have leads for any puzzles right now." instead;
	if ever-thought is false:
		now ever-thought is true;
		say "[line break]NOTE: The game will indicate when one command you found early will be applicable. An asterisk or (+) will also appear in the score in the upper right. Until then, you can THINK or type SCORE to see things you figured but aren't quite ready to do yet.";
	if number of optional-noted things > 0:
		say "You also know several things that are optional to figure out: [list of optional-noted things].";
	the rule succeeds;

to decide whether tried-yet of (ct - text):
	let tried-any be false;
	repeat through table of forlaters:
		if ct is cmd-to-say entry:
			now tried-any is true;
			if ready-to-hint entry is true:
				process the can-do-now entry;
				if the rule succeeded, decide yes;
	if tried-any is false, say "BUG in the tried-yet code for text [ct]. This is not critical, but it is worth fixing on my end.";
	decide no;

to clue-later (ct - text):
	now first-think-clue-flag is true;
	repeat through table of forlaters:
		if ct is cmd-to-say entry:
			if ready-to-hint entry is true, say "(re-checking) ";
			now ready-to-hint entry is true;
			the rule succeeds;
	say "Oops. I tried to hint something for later, but failed. This is a bug I need to know about. Text = [ct].";

first-think-clue-flag is a truth state that varies.
ever-think-flag is a truth state that varies.

every turn when first-think-clue-flag is true and ever-think-flag is false:
	if ever-think-flag is false, say "[line break]NOTE: this is the first time you guessed a command right but aren't ready to use it, yet. These commands will be tracked under THINK, with clues as to when they work.";
	now ever-think-flag is true;
	continue the action;

chapter score

check requesting the score:
	say "You have scored a total of [score] out of [maximum score] points in [turn count] moves. You have found [min-gotten] optional points so far and need [min-needed] to win.";
	say "[line break]Your current rank is [your-rank].";
	let dh be doable-hinted;
	let fh be future-hinted;
	if dh + fh > 0, say "[line break]You also have [dh + fh] task[plur of dh + fh] you performed when you weren't quite ready. [if dh is 0][fh] still need[plur of fh] to wait[else if fh is 0][dh] can be done now[else][dh] can be done now, but [fh] must wait[end if]. You can see more detailed information with THINK.";
	the rule succeeds;

the score and thinking changes rule is listed after the notify score changes rule in the turn sequence rulebook.

this is the score and thinking changes rule:
	repeat through table of forlaters:
		if ready-to-hint entry is true:
			process the is-done entry;
			if the rule succeeded, now ready-to-hint entry is false;

to decide which number is doable-hinted:
	let temp be 0;
	repeat through the table of forlaters:
		if ready-to-hint entry is true:
			process the can-do-now entry;
			if the rule succeeded:
				process the is-done entry;
				if the rule failed, increment temp;
	decide on temp;

to decide which number is future-hinted:
	let temp be 0;
	repeat through the table of forlaters:
		if ready-to-hint entry is true:
			process the can-do-now entry;
			if the rule failed, increment temp;
	decide on temp;

[see header file for table of ranks]

book nonstandard but general verbs

chapter reading

reading is an action applying to one thing.

understand the command "read" as something new.

understand "read [thing]" as reading.

definition: a thing (called th) is readable:
	if th is Very Vile Fairy File, yes;
	if th is leet learner, yes;
	no;

read-exam-note is a truth state that varies.

carry out reading:
	repeat through table of readables:
		if read-thing entry is noun, say "[read-txt entry][line break]" instead;
	if read-exam-note is false, say "NOTE: READ and X/EXAMINE are functionally equivalent for most items. Items you can [b]READ[r] usually say so when you examine them.";
	now read-exam-note is true;
	try examining the noun instead;

table of readables
read-thing	read-txt
Very Vile Fairy File	"You note one book is [i][next-rand-txt of table of vvff digs][r]."
leet learner	"Some multi-colored text on the leet learner (itself written in yellow) seems to function as examples.[paragraph break][table-of-color-hints][run paragraph on]"

to say table-of-color-hints:
	repeat through table of color clues:
		say "[fixed letter spacing][my-text entry][variable letter spacing] is inscribed in [my-color entry]."

table of color clues
my-text	my-color
"CONCEIT CONCERNER"	"blue"
"  CHEAT CHURNER  "	"green"
"   MEET MOURNER  "	"yellow"
"   BEAT BURNER   "	"orange"
"    EAT EARNER   "	"red"
"  TREAT TURNER   "	"brown"

chapter xyzzying

xyzzying is an action applying to nothing.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

carry out xyzzying:
	say "Fie, fie. Sigh, sigh. Why, why?";
	the rule succeeds.

chapter helphowing

help-how is a truth state that varies. help-how is true.

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

understand the command "v" as something new.
understand the command "verb" as something new.
understand the command "verbs" as something new.

understand "v" as verbsing.
understand "verb" as verbsing.
understand "verbs" as verbsing.

carry out verbsing:
	say "[2da]You can use the general directions, but you often have to figure out what to do, here. It's a guess the verb situation, but not really.";
	say "[2da][b]HELP HOW[r] and [b]WELP WOW[r] toggle the [b]HINT[r] command on and off, respectively. Currently they are [on-off of help-how].";
	say "[2da]The Leet Learner can help you determine what needs to be changed. [b]LL[r] or [b]CC[r] is the shorthand for scanning a location, and [b]LL[r] or [b]CC[r] (any thing) scans it.";
	say "[2da][llon-cmd] turn the Leet Learner on while [lloff-cmd] turn it off. Currently it is [on-off of shut-scan].";
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
	say "Very Vile Fairy File came about after I noticed alliterative rhymes and thought, neat, how many are there? As someone who pokes around with spoonerisms, I like this sort of thing. It seemed like VVFF would, at first, make a nice short EctoComp game at first until I dug deeper. I don't know when I first had the idea, but once I had the name, things picked up. My daily notes suggest it started gaining momentum in June of 2018.[paragraph break]I wanted a reasonably intuitive game mechanic that still made use of the parser, though I recognize the spelling for some of the commands may be tricky. I hope the alliterative rhymes are interesting and amusing.[paragraph break]I'm not the first parser game to deal with rhymes. Michael Martin's [i]EXTERMINATE![r] and DCBSupafly's [i]Beythilda the Witch Queen[r] did it first. They were both SpeedIF. Joey Jones's [i]Danse Nocturne[r] (as Eggerich von Eggermond) offered more of a narrative. But I hope this is something new and does not abuse the concept.";
	the rule succeeds;

book hinting

the leet learner is a thing. description is "It says CHEAT CHURNER in green letters. You can probably READ it more in depth, because, well, there's more.[paragraph break]It has two settings: [b]HUT! CAN![r] (on) and [b]SHUT SCAN[r] (off) It's currently [off-on of shut-scan]. [b]LL/CC ON/OFF[r] can turn it on or off.[paragraph break]Also, to use it, [b]LL[r] (something). [b]LL[r] with no argument scans the current location."

after printing the name of leet learner while taking inventory: say " ([off-on of shut-scan])";

understand "ll" and "cc" as leet learner.

chapter lling

lling is an action applying to one thing.

understand the command "cc" as something new.
understand the command "ll" as something new.

understand "cc [thing]" as lling when player has leet learner.
understand "ll [thing]" as lling when player has leet learner.
understand "cc" as lling when player has leet learner.
understand "ll" as lling when player has leet learner.

rule for supplying a missing noun when lling:
	if cht of the player is not phbt:
		say "You are so focused inward, you just point the learner at yourself.";
		now the noun is the player;
	else:
		say "You wave the leet learner all around [location of player].";
		now the noun is the location of the player;
	continue the action;

ever-opt-scan is a truth state that varies.

carry out lling:
	if player does not have the leet learner, say "Regular hints aren't available." instead; [this should not happen]
	if noun is leet learner, say "It's great as it is. You don't want to change it." instead;
	if cht of noun is phbt, say "The leet learner turns up nothing." instead;
	if noun is peeling pier and healed-here is false, say "It seems like the leet learner is registering something everywhere except on the peeling pier, here." instead;
	say "The leet learner light turns [if noun is optional]faint[else]solid[end if]ly [scancol of cht of noun] as you [if noun is a room]wave it around[else]focus it on[end if] [the noun].";
	if ever-opt-scan is false:
		say "[line break]The blinking light must mean something. The learner is usually lit solidly or not at all.";
		now ever-opt-scan is true;
	the rule succeeds.

to say scancol of (x - a cheattype):
	say "[if x is letplus]blue[else if x is partplus]green[else if x is leteq]yellow[else if x is partminus]orange[else if x is letminus]red[else if x is letboth]brown[else if x is phbt]undefined[else]BUG[end if]"

this is the welp-wow-check rule:
	if help-how is false:
		say "You've disabled hints with [b]WELP WOW[r]. You need to [b]HELP HOW[r] to turn them on again.";
		the rule succeeds;

chapter shutscaning

shutscaning is an action applying to nothing.

understand the command "cc off" as something new.
understand the command "ll off" as something new.
understand the command "shut scan" as something new.

understand "cc off" as shutscaning.
understand "ll off" as shutscaning.
understand "shut scan" as shutscaning.

shut-scan is a truth state that varies.

carry out shutscaning:
	if shut-scan is true, say "The Leet Learner is already off." instead;
	now shut-scan is true;
	say "You turn the Leet Learner off. You can turn it on again with [llon-cmd].";
	the rule succeeds.

to say llon-cmd: say "[b]HUT CAN[r] or [b]LL ON[r] or [b]CC ON[r]"

chapter hutcaning

hutcaning is an action applying to nothing.

understand the command "cc on" as something new.
understand the command "ll on" as something new.
understand the command "hut can" as something new.

understand "cc on" as hutcaning.
understand "ll on" as hutcaning.
understand "hut can" as hutcaning.

carry out hutcaning:
	if shut-scan is false, say "The Leet Learner is already on." instead;
	now shut-scan is false;
	say "You turn the Leet Learner on. You can turn it off again with [lloff-cmd].";
	the rule succeeds.

to say lloff-cmd: say "[b]SHUT SCAN[r] or [b]LL OFF[r] or [b]CC OFF[r]"

chapter hinting verb

hinting is an action applying to nothing.

understand the command "hint" as something new.

understand "hint" as hinting.

carry out hinting:
	abide by the welp-wow-check rule;
	process room-hint-rule of location of player;
	if the rule failed, say "There doesn't seem to be anything more to do with [location of player] in general, but specific things in [location of player] may be worth looking at.";
	the rule succeeds.

section hint room rule definitions

a room has a rule called room-hint-rule. room-hint-rule of a room is usually trivially false rule. [postalf]

room-hint-rule of Airy Isle is airy-isle-hint rule.
room-hint-rule of Creased Cross is creased-cross-hint rule.
room-hint-rule of Curst Cave is curst-cave-hint rule.
room-hint-rule of Erst Lore is erst-lore-hint rule.
room-hint-rule of Foe Field is foe-field-so-sealed-hint rule.
room-hint-rule of Fun Fen is fun-fen-hint rule.
room-hint-rule of Gassed Gap is gassed-gap-hint rule.
room-hint-rule of Got Gear Hot Here is got-gear-hot-here-hint rule.
room-hint-rule of Here Hull is here-hull-hint rule.
room-hint-rule of History Hall is history-hall-hint rule.
room-hint-rule of Lake Lea is lake-lea-hint rule.
room-hint-rule of Po' Pit is po-pit-hint rule.
room-hint-rule of Real Rear is real-rear-hint rule.
room-hint-rule of Shirk Shell is shirk-shell-hint rule.
room-hint-rule of Soft Sand is soft-sand-hint rule.
room-hint-rule of Store All Stage is store-all-stage-hint rule.
room-hint-rule of Tarry Tile is tarry-tile-hint rule.
room-hint-rule of Trim Tram is trim-tram-hint rule.
room-hint-rule of Vending Vibe is vending-vibe-hint rule.
room-hint-rule of Vined Vault is vined-vault-hint rule.
room-hint-rule of Wet Wood is wet-wood-hint rule.
room-hint-rule of Whining War is whining-war-hint rule.
room-hint-rule of Y'Old Yard is yold-yard-hint rule.

section hint room rules [xxhrr]

this is the airy-isle-hint rule:
	say "The Bot Board needs to be dealt with here, not the location.";
	the rule succeeds;

this is the creased-cross-hint rule:
	if Bull Beast is moot, the rule fails;
	if Bull Beast is off-stage:
		say "There's not much to do now in Creased Cross.";
	else:
		say "Dispose of the Bull Beast.";
	the rule succeeds.

this is the curst-cave-hint rule:
	if first-fave is true, the rule fails;
	say "[one of]You need to show optimism.[or]FIRST FAVE.[stopping]";
	the rule succeeds.

this is the erst-lore-hint rule:
	say "I think I'll need to fix this later, but for now, there's nothing to do.";
	the rule fails.

this is the foe-field-so-sealed-hint rule:
	if shield-shown is true, the rule fails;
	if player does not have gold guard:
		say "You don't have what you need, yet, to open up the Foe Field.";
	else:
		say "[one of]You need to brandish protection to get further in the Foe Field.[or]That's a fancy way of saying something much simpler[or]What's a synonym for guard? Especially the gold guard?[or]SHOW SHIELD.[stopping]";

this is the fun-fen-hint rule:
	say "The Fun Fen is a busy place, but there's nothing you need to do to it in general.";
	the rule succeeds.

this is the gassed-gap-hint rule:
	if cool cap is moot, the rule fails;
	if player does not have cool cap:
		say "You don't have what you need yet to change the Gassed Gap.";
	else:
		say "[one of]You need to put forth a challenge.[or]You don't have a gauntlet to throw down, but you have something else.[or]You have a cap.[or]CAST CAP.[stopping]";

this is the got-gear-hot-here-hint rule:
	the rule fails. [??not near]

this is the here-hull-hint rule:
	if beer bull is moot, the rule fails;

this is the history-hall-hint rule:
	if ever-mall is true:
		say "You can pretty much twiddle the Mystery Mall and History Hall as you want.";
	else:
		say "[one of]The History Hall can become something a bit less profound.[or]A place of commerce, not of study.[or]MYSTERY MALL.[stopping]";

this is the lake-lea-hint rule:
	the rule fails.

this is the po-pit-hint rule:
	if grit-grown is false:
		say "[one of]You have to deal with the Po['] Pit itself before dealing with the trash trap. You can find the right verb for the trash trap, but you can't use it until you deal with the Po['] Pit.[or]The learner giving a blue light in the pit indicates you need two longer words.[or]The learner giving a green light indicates that either row or writ is the right number of letters.[or]You need to get a lot tougher. Become a bigger person.[or]GROW GRIT.[stopping]";
	else:
		say "[one of]The trash trap has a way through...sort of.[or]The row writ has been drawn on so that there is no way through. Even though you've grown grit, you can't see a way through it.[or]The gash gap is treacherous, and the cache cap is stupid, but they both turn the leet learner yellow.[or]Looking at the cache cap, it's got a rendering of the trap and gap. Which seems all wrong.[or]MASH MAP.[stopping]"; [??bash bap]

this is the real-rear-hint rule:
	if healed-here is true, the rule fails;
	say "You need to do 3 things here rhyming with REAL REAR.";
	if knelt-yet is false:
		say "SPOILER need to KNEEL NEAR.";
	else if felt-fear is false:
		say "SPOILER need to FEEL FEAR.";
	else if cage key is off-stage:
		say "SPOILER need to DEAL DEAR.";
	else:
		say "BUG in the hint code, but you're probably done here."

this is the shirk-shell-hint rule:
	if player has jerk gel, the rule fails;
	process the jerk-gel-hint rule;

this is the soft-sand-hint rule:
	if ever-loft is false:
		say "[one of]You can't quite reach what's to the west[or]The Soft Sand can change its contours[or]Perhaps it could rise or fall based on what you do or think[or]LOFT LAND will raise the Soft Sand so you can go west[stopping].";
	else:
		say "You can toggle LOFT LAND and SOFT SAND back and forth as needed.";
	the rule succeeds.

this is the store-all-stage-hint rule:
	if moral mage is moot, the rule fails;
	say "The coral cage is what's important here.";
	process the coral-cage-hint rule;

this is the tarry-tile-hint rule:
	if well worn hell horn is in Tarry Tile:
		say "You can do something with this location [once-now of can-merry-mile rule] the well worn hell horn is dealt with.";
	else if merry-mile is false:
		say "[one of]The Tarry Tile can become cheerier.[or]It's a rather long tile, and it can become...[or]...a MERRY MILE.[stopping]";
	else:
		consider the very-vile-fairy-file-hint rule;
	the rule fails.

this is the trim-tram-hint rule:
	if me-minded is true:
		say "[one of]You need to find a way to sucker the Trim Tram into thinking you paid.[or]There are two ways.[or]FLIM FLAM, or SKIM SCAM.[stopping]";
	else:
		say "[one of]You can't get FIND FEE out of your head. It distracts you from thinking of you.[or]Wait, 'you' is the wrong pronoun from your perspective.[or]What can you do to ME?[or]MIND ME.[stopping]";

this is the vending-vibe-hint rule:
	if trending tribe is moot, the rule fails;
	say "You can deal with the trending tribe here.";
	process the trending-tribe-hint rule;

this is the vined-vault-hint rule:
	if mean mass is off-stage:
		say "[one of]You need to deal with the Vined Vault. Another room, another rhyme[or]In this case, it isn't a quick letter replacement. You may wish to consult the leet learner. It's orange, which is different from the yellow of the Wet Wood[or]You also need to discover some weakness in the Vined Vault[or]Again, you can go through the 25 other letters, and this time, there will be a homonym that makes sense[or]You need to FIND FAULT[stopping].";
	else:
		say "[one of]The mean mass is a bit trickier. The leet learner gives you a different color, blue[or]If you understand leet learner colors, this means you need to add letters to both mean and mass[or]Try and think of a word or two that rhyme with mean or mass that are harmless, then pull that new beginning sound to the other word[or]GREEN GRASS will dispose of the mean mass[stopping].";
	the rule succeeds;

this is the wet-wood-hint rule:
	say "[one of]You may notice a pattern to items and people here, especially if you try going certain directions in the Wet Wood. You're very bad at finding your way through[or]There are parallel rhymes[or]Perhaps a parallel rhyme would help you get out of the Wet Wood[or]It's the first location, so you may guess the first action is easy[or]Try replacing W with each of the other 25 letters. Maybe one pair of words stands out[or]You need to GET GOOD[stopping].";
	the rule succeeds;

this is the whining-war-hint rule:
	if shore-shine is true, the rule fails;
	say "[one of]You need to make the Whining War something more positive.[or]Brighter. This is a waterfront, sort of, as well.[or]SHINING SHORE.[stopping]";

this is the yold-yard-hint rule:
	if Bold Bard is moot, the rule fails;
	say "The Bold Bard needs your help here.";
	process the bold-bard-hint rule;

[zzhrr]

section debug check - not for release

when play begins:
	let hint-idx be 0;
	repeat with Q running through rooms:
		if map region of Q is poorly penned or map region of Q is Get a Guess, continue the action;
		if room-hint-rule of Q is trivially false rule:
			increment hint-idx;
			say "[hint-idx]. You need to specify room-hint-rule for [Q].";
	if hint-idx > 0, say "[hint-idx] room hint[plur of hint-idx] to implement.";

chapter hinting an object verb

hintobjing is an action applying to one thing.

understand "hint [thing]" as hintobjing.

carry out hintobjing:
	abide by the welp-wow-check rule;
	if noun is optional and noun is not optional-noted:
		now noun is optional-noted;
		say "While you can score a point from [the noun], it's not critical to the game. HINTing it again will show what to do with [the noun]." instead;
	process thing-hint-rule of noun;
	if the rule failed, say "There doesn't seem to be anything more to do with [the noun] in general.";
	the rule succeeds.

section thing hint rule definitions

a thing has a rule called thing-hint-rule. thing-hint-rule of a thing is usually trivially false rule. [postalf]

the thing-hint-rule of big bag is the big-bag-hint rule.
the thing-hint-rule of Bold Bard is bold-bard-hint rule.
the thing-hint-rule of Bot Board is bot-board-hint rule.
the thing-hint-rule of cage key is the cage-key-hint rule.
the thing-hint-rule of Cark Cliff is cark-cliff-hint rule.
the thing-hint-rule of cache cap is the cache-cap-hint rule.
the thing-hint-rule of coral cage is coral-cage-hint rule.
the thing-hint-rule of done den is done-den-hint rule.
the thing-hint-rule of FIND FEE is find-fee-hint rule.
the thing-hint-rule of frightening fridge is frightening-fridge-hint rule.
the thing-hint-rule of gash gap is the cache-cap-hint rule.
the thing-hint-rule of gold guard is gold-guard-hint rule.
the thing-hint-rule of good gun is good-gun-hint rule.
the thing-hint-rule of GOTS GAME is gots-game-hint rule.
the thing-hint-rule of Gutta Ganksta is gutta-ganksta-hint rule.
the thing-hint-rule of hive heap is hive-heap-hint rule.
the thing-hint-rule of Hold Hard is hold-hard-hint rule.
the thing-hint-rule of Hot Horde is bot-board-hint rule.
the thing-hint-rule of jerk gel is jerk-gel-hint rule.
the thing-hint-rule of Kerry Kyle is kerry-kyle-hint rule.
the thing-hint-rule of leet learner is the leet-learner-hint rule.
the thing-hint-rule of Lot Lord is bot-board-hint rule.
the thing-hint-rule of marred mat is marred-mat-hint rule.
the thing-hint-rule of mean mass is mean-mass-hint rule.
the thing-hint-rule of mild mead is mild-mead-hint rule.
the thing-hint-rule of Name Notes Tame Totes is name-notes-tame-totes-hint rule.
the thing-hint-rule of Oi Mo by Tim T Sims Pimp is oi-mo-hint rule.
the thing-hint-rule of Pain Peasant is pain-peasant-hint rule.
the thing-hint-rule of paper pile is paper-pile-hint rule.
the thing-hint-rule of peeling pier is the peeling-pier-hint rule.
the thing-hint-rule of Reeker Russell is reeker-russell-hint rule.
the thing-hint-rule of row writ is row-writ-hint rule.
the thing-hint-rule of Sage Sea is the sage-sea-hint rule.
the thing-hint-rule of screaming skull is screaming-skull-hint rule.
the thing-hint-rule of steel steer is the steel-steer-hint rule.
the thing-hint-rule of tall tree is the tall-tree-hint rule.
the thing-hint-rule of Toe Tappin Row Rappin is toe-tappin-row-rappin-hint rule.
the thing-hint-rule of tool tap is tool-tap-hint rule.
the thing-hint-rule of trash trap is the cache-cap-hint rule.
the thing-hint-rule of trending tribe is trending-tribe-hint rule.
the thing-hint-rule of vapor vile is vapor-vile-hint rule.
the thing-hint-rule of Very Vile Fairy File is the very-vile-fairy-file-hint rule.
the thing-hint-rule of well worn hell horn is well-worn-hell-horn-hint rule.
the thing-hint-rule of wrong art is wrong-art-hint rule.
the thing-hint-rule of wry wall is the wry-wall-hint rule.
the thing-hint-rule of zig zag rig rag is the zig-zag-rig-rag-hint rule.
the thing-hint-rule of worst wave is worst-wave-hint rule.
the thing-hint-rule of Lending Libe is lending-libe-hint rule.

[
the thing-hint-rule of backed binder is backed-binder-hint rule.
the thing-hint-rule of Bull Beast is bull-beast-hint rule.
the thing-hint-rule of hard hat is hard-hat-hint rule.
the thing-hint-rule of Jake G is jake-g-hint rule.
the thing-hint-rule of Lake Lap is lake-lap-hint rule.
the thing-hint-rule of Ache App is ache-app-hint rule.
the thing-hint-rule of Beer Bull is beer-bull-hint rule.
the thing-hint-rule of cool cap is cool-cap-hint rule.
the thing-hint-rule of moral mage is moral-mage-hint rule.
the thing-hint-rule of silly sign is silly-sign-hint rule.
the thing-hint-rule of knowing nobs is knowing-nobs-hint rule.
the thing-hint-rule of wild weed is wild-weed-hint rule.
the thing-hint-rule of go gate is go-gate-hint rule.
the thing-hint-rule of grow grate is grow-grate-hint rule.
]

[??styled steed]

section thing hint rules [xxthr] [??general problems with what if you already know a certain command and the hints may not know this]

this is the big-bag-hint rule:
	say "The big bag just holds as many items as you want without you doing anything to it. It's working great as-is.";

this is the bold-bard-hint rule:
	say "[one of]The Bold Bard needs something like an ID.[or]COLD CARD.[stopping]";

this is the bot-board-hint rule:
	if Lot Lord is in Airy Isle and Hot Horde is in Airy Isle:
		say "[one of]Now that the Lot Lord and Hot Horde are in Airy Isle, they need a rallying cry[or]Or a victory cry[or]GOT GORED[stopping].";
	else if Lot Lord is in Airy Isle:
		say "[one of]The Lot Lord needs people to lead[or]The Lot Lord needs an enthusiastic, large following[or]HOT HORDE[stopping].";
	else if Hot Horde is in Airy Isle:
		say "[one of]The Hot Horde is disorganized and needs a leader[or]Someone regal would gain the horde's attention[or]LOT LORD[stopping].";
	else:
		say "[one of]You need allies to take out the Bot Board. One leader and one group of people.[or]This will give both answers if you go through.[or]The leader isn't quite a baron or king.[or]LOT LORD.[or]The people to be led must also be enthusiastic.[or]HOT HORDE.[stopping]";

this is the cage-key-hint rule:
	if player is in Store All Stage:
		say "The cage key will help you open the cage here";
	else:
		say "The cage key will help you open a cage you have[if Store All Stage is unvisited]n't yet[end if] seen";
	say ", but you need to figure the right command.";

this is the worst-wave-hint rule:
	say "[one of]What is a rhyming opposite of worst?[or]In this case, the rhyming opposite of worst also changes 'wave' more favorably.[or]FIRST FAVE.[stopping]"

this is the lending-libe-hint rule:
	say "Now that you have the Lending Libe, you can take whatever books you need."

this is the cark-cliff-hint rule:
	say "[one of]The Cark Cliff point is a bit obscure. You need to mellow out, man.[or]SPARK SPLIFF.[stopping]";

this is the cache-cap-hint rule:
	say "[one of]As you may have guessed, the cache cap, trash trap and gash gap are linked. One of them gives clues about the other two[or][if grit-grown is false]You need to deal with the row writ and Po['] Pit, first[else][one of]The cache cap seems to offer a way through the trash trap or gash gap, but not really[or]You need to find a way to put the cache cap out of its misery[or]BASH BAP or MASH MAP both work to get out of Po['] Pit for good[stopping][end if][stopping].";
	the rule succeeds;

this is the coral-cage-hint rule:
	if player does not have cage key:
		say "You don't have the key you need yet. Look for something that rhymes with key.";
	else:
		say "[one of]You need to call out the denizen of the coral cage.[or]What sort of person could be in there?[or]*ORAL *AGE is likely, according to the Leet Learner.[or]MORAL MAGE.[stopping]";

this is the done-den-hint rule:
	say "You don't need to go back through the done den. There are not even any extra points."

this is the find-fee-hint rule:
	say "[one of]The FIND FEE makes you feel as though you need to pay, but you need to pay attention to yourself.[or]The leet learner scans orange, but the first word has to be *IND. So the second word must be very short indeed.[or]MIND ME.[stopping]"

this is the frightening-fridge-hint rule:
	say "[one of]The frightening fridge could be more cheery, and it could stop blocking your way.[or]BRIGHTENING BRIDGE.[stopping]"

this is the gold-guard-hint rule:
	say "[one of]The gold guard helps protect you [if player is in Foe Field]here[else if Foe Field is unvisited]somewhere you haven't been[else]somewhere you've been[end if].[or]Once the gold guard is in the right place, you can use it to protect yourself.[or]You need to be in the Foe Field for the gold guard to work.[or]Once in the Foe Field, SHOW SHIELD.[stopping]"

this is the good-gun-hint rule:
	say "[one of]You want to make the gun worthless.[or]A good gun is generally made out of metal. Any material you could change it to?[or]This sort of reverses a very early puzzle.[or]WOOD ONE.[stopping]"

this is the gots-game-hint rule:
	say "[one of]The Gutta Ganksta seems proud of the GOTS GAME tattoo, but perhaps there's a way to cut it down.[or]LOTS LAME.[stopping]"

this is the gutta-ganksta-hint rule:
	say "[one of]This is a tricky one. The gutta ganksta's tattoo is/was more important.[or]Calling the gutta ganksta a name gets you an optional point, but it's only esoteric name calling.[or]WHATTA WANKSTA.[stopping]";

this is the hive-heap-hint rule:
	say "[one of]The hive heap has nothing on the surface, but maybe if you dig in...[or]Look way down into the hive heap...[or]DIVE DEEP.[stopping]"

this is the hold-hard-hint rule:
	if Bold Bard is moot, the rule fails;
	process the bold-bard-hint rule;

this is the jerk-gel-hint rule:
	if player does not have jerk gel:
		say "[one of]There's something hidden in the Shirk Shell, if you just expend the energy.[or]What you need to find is Jerk Gel.[or]You won't find the Jerk Gel if you're lazy.[or]WORK WELL.[stopping]";
	else:
		say "You need to find whom to use the jerk gel and its glowing globs on.";

this is the kerry-kyle-hint rule:
	if in-so-sad is true:
		say "[one of]You need to make yourself happier, from being so sad.[or]Become shiny and happy.[or]GLOW GLAD.[stopping]";
	else if in-way-wrong is true:
		say "[one of]You feel not just wrong but weak. Things are slipping away.[or]How to keep things from slipping away?[or]STAY STRONG.[stopping]";
	else:
		say "Woohoo! There's nothing wrong with you right now!"

this is the leet-learner-hint rule:
	say "[one of]First, note the leet learner may give different readings if you scan an area or an item. If it gives a reading when you scan an area, you can do something with the room.[or]So the big thing is, probably, what do the colors on the leet learner mean? Read it again, if you haven't.[or]LEET LEARNER and MEET MOURNER both are in yellow, suggesting that spelling may be an unimportant variable.[or]What do MOURNER and LEARNER have in common?[or]MOURNER and LEARNER both have seven letters. LEET and MEET also each have four letters.[or]The color the leet learner gives when you scan is related to how many letters are in the solution.[or]CONCEIT CONCERNER adds letters to each word, and it is blue.[or]CHEAT CHURNER adds a letter only to LEET, and it is green. Note the mnemonic that green is blue plus yellow.[or]EAT EARNER takes one letter each from LEET LEARNER. It is red. So red is subtraction.[or]BEAT BURNER is in orange. It only takes one letter from one word.[or]So orange, a combination of yellow and red, means you need to drop a letter or letters from one word.[or]Finally, TREAT TURNER adds a letter and subtracts another. What's up with that?[or]In this case, brown is a small muddle of colors. I suppose it could be purple, too, but that might give people a false rainbow hint.[or]There's one more thing: some items may cause the leet learner to blink. You may be able to guess what this means.[or]Items that make the learner blink are optional.[or]So, in conclusion: for the leet learner, blue means add letters, red means subtract, yellow means keep letters. Blue or red mixed with yellow means add letters to only one word. Blinking means the target is optional.[stopping]";
	the rule succeeds;

this is the marred-mat-hint rule:
	say "[one of]The marred mat is in Got Gear Hot Here, suggesting maybe it can become something you can wear.[or]What can you wear that rhymes with mat?[or]HARD HAT.[stopping]"

this is the mean-mass-hint rule:
	say "[one of]You need to make the mean mass into something much less harmful. Wholesome, even.[or]Maybe the mean mass can be changed to something you're missing on the outside. Something from nature.[or]The mean mass can become GREEN GRASS.[stopping]"

this is the mild-mead-hint rule:
	say "[one of]You can make the mild mead have a bit more kick, but you don't need to.[or]The mild mead can become a slightly harder drug.[or]WILD WEED.[stopping]";

this is the name-notes-tame-totes-hint rule: say "The random names are just for fun."

this is the oi-mo-hint rule:
	say "[one of]Oi Mo['] is a bad song, but there may be a way to tune it out.[or]This is a bit tricky, because it relies on something different than the usual mechanic. That's why it's an optional point.[or]Everything is in the XimX format.[or]DIMD will turn the volume down.[stopping]"

this is the pain-peasant-hint rule:
	say "[one of]There needs to be a way to calm the peasant down and make it nicer.[or]PLAIN PLEASANT.[stopping]"

this is the paper-pile-hint rule:
	say "[one of]It's not what the paper pile is, but that it's a rather messy FACT FINDER. You need to organize it.[or]You can organize the paper pile/fact finder into a BACKED BINDER.[stopping]"

this is the peeling-pier-hint rule:
	if healed-here is true, the rule fails;
	say "The peeling pier is just here to bring home that there's a lot to do in the Real Rear, but ... the pier is not quite right.";
	process the real-rear-hint rule;

this is the reeker-russell-hint rule:
	say "[one of]Reeker Russell is big and tough, but you can make him less strong.[or]No, 'weaker wussle' doesn't quite work, but there's a synonym for weaker.[or]MEEKER MUSCLE.[stopping]"

this is the row-writ-hint rule:
	if grit-grown is true, the rule fails;
	say "[one of]The row writ and Po['] Pit may have you stumped.[or]The leet learner on both will give you a clue of the nomber of letters.[or]You need to toughen up.[or]GROW GRIT.[stopping]"

this is the sage-sea-hint rule:
	say "You don't need to do anything specifically with the Sage Sea. It just blocks you from elsewhere, [if cage key is off-stage]but it holds something you need, if you deal with Real Rear correctly[else]and you already got the cage key from it[end if].";
	the rule succeeds;

this is the screaming-skull-hint rule: say "[one of]If there only were a way to make the screaming skull less imposing![or]Maybe there is a way the skull can make less noise as well.[or]DREAMING DULL.[stopping]"

this is the steel-steer-hint rule:
	if healed-here is true, the rule fails;
	say "The steel steer is just here to bring home that there's a lot to do in the Real Rear.";
	process the real-rear-hint rule;

this is the tall-tree-hint rule:
	if tree-down is true, the rule fails;
	say "[one of]The way north is treacherous, and having a bridge over it would be nice.[or]The tall tree would make a nice bridge, if it were on the ground. But it is fixed upright.[or]How do you loosen the tall tree so it creates a walkway?[or]FALL FREE.[stopping]";

this is the toe-tappin-row-rappin-hint rule:
	say "[one of]Man! The Toe Tappin Row Rappin song is energetic. But you don't need that.[or]You can slow the song down some.[or]SO SAPPIN[stopping]"

this is the tool-tap-hint rule: [FOOL FAP?? / POOL PAP / CRUEL CRAP]
	say "[one of]You can request something from the tool tap.[or]It might not be a tool, but who knows when it comes in handy.[or]Summon a COOL CAP.[stopping]"

this is the trending-tribe-hint rule:
	say "[one of]The trending tribe seems very focused on money.[or]What is something that would be free that might disappoint the trending tribe?[or]LENDING LIBE.[stopping]"

this is the vapor-vile-hint rule:
	say "[one of]It would be nice if the vapor vile became something more substansive.[or]It can become a PAPER PILE.[stopping]"

this is the very-vile-fairy-file-hint rule:
	if merry-mile is false:
		say "You can't do anything with the file until the Tarry Tile is cheerier.";
	else:
		say "[one of]Now that you're happy, the Fairy File can't affect you so much. But it still needs to be put out to pasture.[or]What can you do that will bury the hatchet?[or]The leet learner gives an orange reading. This tells you the second word is four letters and the first is four or less.[or]BURY BILE to win the game.[stopping]";
	the rule succeeds;

this is the well-worn-hell-horn-hint rule:
	say "[one of]The well worn hell horn seems old but sturdy. It has no apparent cracks.[or]There's a way to look for a crack in the horn.[or]TELL TORN.[stopping]";

this is the wrong-art-hint rule:
	say "[one of]The wrong art is at the beginning. Understanding how to get rid of it will help, but like much art, it is not strictly necessary.[or]Even if you've got a few points along the way, you can still get a boost from setting the wrong art right.[or]Make a STRONG START.[stopping]";

this is the wry-wall-hint rule:
	say "The wry wall is simply there to provide amusing deaths.";

this is the zig-zag-rig-rag-hint rule:
	say "[one of]The zig zag rig rag can actually be simplified[or]The leet learner flags the rag as yellow, so you have 24 possibilities for -IG -AG[or]One possibility for the rag is extremelty practical for carrying a lot of things[or]BIG BAG[stopping].";
	the rule succeeds;

[zzthr]

section debug check - not for release

when play begins:
	let hint-idx be 0;
	let max-hint be 20;
	let ignore-text be false;
	repeat with Q running through things:
		if thing-hint-rule of Q is trivially false rule:
			increment hint-idx;
			if hint-idx > max-hint and ignore-text is false:
				say "I went over the maximum. Not listing the rest.";
				now ignore-text is true;
				next;
			if ignore-text is false, say "[hint-idx]. You need to specify thing-hint-rule for [Q].";
	if hint-idx > 0, say "[hint-idx] thing hint[plur of hint-idx] to implement.";

chapter going to rooms

section gotoing

gotoing is an action applying to one visible thing.

understand the command "gi" as something new.
understand the command "gr" as something new.
understand the command "gt" as something new.
understand the command "goto" as something new.
understand the command "go to" as something new.

understand "go to [any room]" as gotoing.
understand "goto [any room]" as gotoing.
understand "gt [any room]" as gotoing.
understand "gr [any room]" as gotoing.
understand "go [any room]" as gotoing.

to decide whether goto-available:
	yes.

to decide whether (rm - a room) is available-from-here:
	if map region of rm is Worst Whew, no;
	if mrlp is Vale Verminous, no;
	yes;

carry out gotoing:
	if noun is location of player, say "Already there! Er, here." instead;
	if noun is unvisited, say "You've tried to GT a room you haven't seen yet." instead;
	if noun is available-from-here:
		move player to noun;
	else:
		say "You can't get to [noun] from here.";
	the rule succeeds;

section gotothinging

gotothinging is an action applying to one visible thing.

does the player mean gotothinging a moot thing: it is very unlikely.
does the player mean gotothinging a thing in an unvisited room: it is very unlikely.
does the player mean gotothinging an off-stage thing: it is very unlikely.
does the player mean gotothinging a thing carried by the player: it is unlikely.

understand "go to [any thing]" as gotothinging.
understand "goto [any thing]" as gotothinging.
understand "gt [any thing]" as gotothinging.
understand "gi [any thing]" as gotothinging.
understand "go [any thing]" as gotothinging.

carry out gotothinging:
	let Q be location of noun;
	if Q is Hidey House, say "Right now [the noun] is temporarily unavailable." instead;
	if noun is moot, say "Unfortunately, you tried to go to something that has been dealt with. Okay, it's fortunate you dealt with [the noun], but GT doesn't know where to go." instead;
	if noun is off-stage, say "Unfortunately, you tried to go to something that wasn't introduced to the game world yet." instead;
	try gotoing Q instead;

volume when play begins

when play begins (this is the opening text rule):
	now the left hand status line is "West Wall";
	force-status;
	if debug-state is false, ask-screenread;
	say "You wouldn't have gone to Fall Fest if you hadn't gotten a free ticket. But of course, the ticket was the only thing that was free. Inside, super high food prices. Lots of noise. And, well, the sun always seeming to get in your eyes. But you still feel you might as well see everything.[paragraph break]And you do. Then off on the west edge, there's a wall. A wall west, if you will. 'Oh, man,' you think. 'Why did I bother?' Well, at least you didn't waste all afternoon watching football games you didn't care about. But you're still mumbling to yourself about how there must be something, anything interesting here. Then you feel a tap on your shoulder.[wfak-d]";
	say "[line break]'So, you want to get goin[']? Well, I might be able to help. I'm Kit Cohen.' You're just not in the mood for motivational nonsense right now, so you brush Kit off. Or try to.[wfak-d]";
	say "[line break]'No! Seriously! You managed to bawl best--well, the best of anyone I've seen today--so you get a chance at a tall test!'[paragraph break]'What sort of test?'[paragraph break]'The PALL PEST of CRAWL CREST!'[wfak-d]";
	say "[line break]And it's a big one. You look to Kit for help, but Kit shrugs.[wfak-d]";
	say "[line break]It approaches. It's about to touch you ...and reflexively you boom, 'GALL, guest!'[paragraph break]The pall pest stumbles back into the west wall, which crumbles. Kit Cohen applauds. 'Well done! You did it! I think you are the one ... the one to recover the Very Vile Fairy File from ... from ...'[wfak-d]";
	say "[line break]It takes a second for Kit Cohen to regain composure. 'The CRIMES CREW TIMES TWO.' Are you ready?[wfak-d]";
	say "[line break]You accept. You might as well. Kit guides you across the remains of the wall, before going off to the Set-So Inn with Rhett Rowan. You are left in ...";
	now max-poss is the maximum score;
	now the right hand status line is "[score][if doable-hinted > 0](+[doable-hinted])[end if]/[min-needed]-[max-poss]";
	now the left hand status line is "[location of the player]";
	now the turn count is 0;

when play begins (this is the backdrop and score seeding rule):
	seed-score-list; [this is in the table file]
	move the wry wall backdrop to all signable rooms;

section when play begins - not for release

volume meta

Gazy Gap is a room in Get a Guess. [crazy crap]

Hidey House is a room in Get a Guess. [mighty mouse: stuff that's only temporarily gone]

volume unsorted

The silly sign is scenery. "The silly sign reads 'One of many by Willie Wines and Tillie Tines.'[line break][sign-dir]"

chapter glowglading

glowglading is an action applying to nothing.

understand the command "glow glad" as something new.

understand "glow glad" as glowglading when in-so-sad is true.

in-so-sad is a truth state that varies.
in-so-saded is a truth state that varies.

carry out glowglading:
	up-reg;
	say "That's it! You feel much more comfortable now.";
	now in-so-sad is false;
	now in-so-saded is true;
	phbt Kerry Kyle;
	the rule succeeds.

the get-sad rule is listed after the notify score changes rule in the turn sequence rulebook.

this is the get-sad rule:
	if in-so-saded is false and in-so-sad is false and score >= 30:
		now in-so-sad is true;
		say "Everything feels pointless. You're sick of these silly rhymes. They feel way wrong, way wrong.";
		now cht of the player is letplus;
	the rule succeeds;

every turn when in-so-sad is true:
	say "So sad ... so sad ... you feel so depressed and upset. Maybe there's an easy way out of this, but you wouldn't feel accomplished. And if there's a hard way out of this, it's too hard.";

instead of doing something when in-so-sad is true:
	if action is procedural, continue the action;
	if current action is glowglading, continue the action;
	say "You can't. You just feel ... so sad. Mo['] mad.";

chapter staystronging

staystronging is an action applying to nothing.

understand the command "stay strong" as something new.

understand "stay strong" as staystronging when in-way-wrong is true.

in-way-wrong is a truth state that varies.
in-way-wronged is a truth state that varies.

carry out staystronging:
	say "That's it! You feel much more comfortable now.";
	now in-way-wrong is false;
	now in-way-wronged is true;
	up-reg;
	phbt Kerry Kyle;
	the rule succeeds.

the get-wrong rule is listed after the notify score changes rule in the turn sequence rulebook.

this is the get-wrong rule:
	if in-way-wronged is false and in-way-wrong is false and score >= 20:
		now in-way-wrong is true;
		say "Everything feels pointless. You're sick of these silly rhymes. They feel way wrong, way wrong.";
		now cht of the player is letplus;
	the rule succeeds;

every turn when in-way-wrong is true:
	say "Way wrong ... way wrong ... you feel so depressed and upset. Maybe there's an easy way out of this, but you wouldn't feel accomplished. And if there's a hard way out of this, it's too hard.";

instead of doing something when in-way-wrong is true:
	if action is procedural, continue the action;
	if current action is not staystronging, continue the action;
	say "You can't. Everything feels ... way wrong. You feel so weak!";

chapter blowingblobsing

the knowing nobs are plural-named people.

blowingblobsing is an action applying to nothing.

understand the command "blowing blobs" as something new.
understand the command "sowing sobs" as something new.
understand the command "slowing slobs" as something new.

understand "blowing blobs" and "sowing sobs" and "slowing slobs" as blowingblobsing when player has jerk gel.

hint-nobs is a truth state that varies.

carry out blowingblobsing:
	if knowing nobs are not in location of player:
		now hint-nobs is true;
		say "That might work, but not here." instead;
	up-reg;
	say "Bye bye nobs!";
	moot knowing nobs;
	the rule succeeds.

chapter wildweeding

the wild weed is a thing.

the mild mead is a thing. description is "It probably tastes gross and is not very psychoactive, either."

wildweeding is an action applying to nothing.

understand the command "wild weed" as something new.

understand "wild weed" as wildweeding when player has mild mead.

carry out wildweeding:
	say "Bingo! The mild mead becomes wild weed.";
	up-min;
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
	up-reg;
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

[?? burned bower/turned tower]

chapter softsanding

softsanding is an action applying to nothing.

understand the command "soft sand" as something new.

understand "soft sand" as softsanding.

loft-land is a truth state that varies.

carry out softsanding:
	if loft-land is false, say "You're already on the Soft Sand." instead;
	say "The loft land reverts to the Soft Sand.";
	now loft-land is false;
	now Shirk Shell is mapped west of Soft Sand;
	the rule succeeds;

chapter loftlanding

loftlanding is an action applying to nothing.

understand the command "loft land" as something new.

understand "loft land" as loftlanding.

carry out loftlanding:
	if loft-land is true, say "You're already on the loft land." instead;
	say "Boom! The Soft Sand rises up and becomes the Loft Land[one of][or] again[stopping].";
	if ever-loft is false:
		now ever-loft is true;
		now loft-land is false;
		up-reg;
	now Curst Cave is mapped west of Soft Sand;
	now Soft Sand is mapped west of Curst Cave;
	the rule succeeds;

volume Poorly Penned

volume Get a Guess

[this is a sort of fake region. There are fake rooms you can't visit.]

[a capped cone is a scenery.] [?? where? It leads to the Zapped Zone]

volume Vale Verminous

Table of Final Question Options (continued)
final question wording	only if victorious	topic		final response rule		final response activity
"see what you MISSED"	true	"missed"	--	showmissesing
"see other DEATH TRAPS"	true	"death/traps" or "death traps"	--	showdeathsing

showmissesing is an activity.

rule for showmissesing:
	if started-strong is false, say "You could've used the wrong art for a STRONG START.";
	if lol-yet is false, say "You could have LIE LOL'd anywhere around the wry wall.";
	if wild weed is off-stage, say "You could've made the mild mead into WILD WEED.";
	if wild weed is not moot, say "You could've tried to SPARK SPLIFF by Cark Cliff [if player has wild weed]with[else]once you had the[end if] wild weed.";
	if lots-lame is false, say "You could've said the Gutta Ganksta's Gots Game tattoo was LOTS LAME.";
	if ganksta is not moot, say "You could've said WHATTA WANKSTA to the Gutta Ganksta.";
	unless oi mo is moot, say "You could have DIMD (dim'd) Oi Mo.";
	if beaker-yet is false, say "You could've given Reeker Russell BEAKER BUSTLE.";

showdeathsing is an activity.

rule for showdeathsing:
	let temp be wry-wall-found;
	let tot-rows be number of rows in table of bad locs; [this is in the tables file]
	say "You could have gone";
	repeat through table of bad locs:
		if there is no e1 entry or there is no e2 entry:
			say "[fake-name entry] needs a location/direction.";
			next;
		if been-here entry is false:
			increment temp;
			if temp is tot-rows and wry-wall-found < tot-rows - 1, say " and ";
			say "[e2 entry] of [e1 entry]";
			if temp < wry-wall-found - 1, say ", ";
	say ".";

volume parser errors guiding us

Rule for printing a parser error (this is the clue half right words rule):
	repeat through table of understands:
		if there is a myloc entry:
			if location of player is myloc entry:
				if the player's command includes mytxt entry:
					say "[myexp entry][line break]";
					the rule succeeds;
		else:
			process the myrule entry;
			if the rule succeeded and the player's command includes mytxt entry:
				say "[myexp entry][line break]";
				the rule succeeds;
	continue the action;

Rule for printing a parser error when the latest parser error is the didn't understand error or the latest parser error is the not a verb I recognise error:
	say "You may have used an unrecognized verb, or a verb in the wrong context. Or maybe you just guessed the wrong action to solve a puzzle, and it wasn't close enough that I could offer a hint.[paragraph break][b]VERBS[r] can show you a list used in this game. More obscure verbs from old-school parser games have been disabled, to help you focus on the puzzles.";

[see header file for table of understands]

volume beta testing - not for release

the force tester wherever rule is listed last in the when play begins rulebook.

when play begins (this is the force tester wherever rule):
	now in-beta is true;
	if currently transcripting:
		say "It looks like you restarted, and the transcript should still be running.";
	else if debug-state is false:
		say "Note: I like to make sure beta testers have a transcript working. It's a big help to me. So, after you press a key, you'll be asked to save a file.";
		wfak;
		try switching the story transcript on;
		say "Transcripts can be sent to blurglecruncheon@gmail.com. Any punctuation before the comment is okay, e.g. *TYPO or ;typo or :typo. Also, you can report issues in the repository.";
	if debug-state is false:
		say "Currently I'm just worried about what there is up until the Fun Fen and if it's hinted well enough, but if you want to poke around more, feel free to go ahead.[paragraph break]Also, you can CLIMB CLEAR to jump to the (relatively brief) endgame.";
	continue the action;

chapter climbclearing

climbclearing is an action applying to nothing.

understand the command "climb clear" as something new.

understand "climb clear" as climbclearing.

carry out climbclearing:
	if airy isle is visited, say "You're already in the endgame.";
	say "You bolt ahead, booming 'I'm [']ere!'[paragraph break]Note that stuff like the score is probably hosed now. Your object is just to get through the game. You also should not be able to go back south.";
	move player to airy isle;
	the rule succeeds.

volume map index

index map with Trim Tram mapped east of Real Rear.
index map with Po' Pit mapped east of Trim Tram.
index map with Vined Vault mapped east of Po' Pit.
index map with Vined Vault mapped south of Wet Wood.

section odd directions

index map with Erst Lore mapped south of Got Gear Hot Here.

section endrooms

index map with Tarry Tile mapped east of Airy Isle.

chapter merrymileing

merrymileing is an action applying to nothing.

understand the command "merry mile" as something new.

understand "merry mile" as merrymileing when mrlp is Vale Verminous.

merry-mile is a truth state that varies.

carry out merrymileing:
	if merry-mile is true, say "You already did. And if you force things, it might undo the good you did." instead;
	if player is in Tarry Tile:
		if well worn hell horn is in Tarry Tile:
			clue-later "MERRY MILE";
			say "Not with the well worn hell horn making those un-merry noises." instead;
		up-reg;
		now merry-mile is true;
		say "You're much happier now! You are ready to deal with the Very Vile Fairy File fully, now." instead;
	clue-later "MERRY MILE";
	if player is in Airy Isle, say "Hard to be happy with the Bot Board around." instead;
	the rule succeeds.

section altrooms

index map with Vending Vibe mapped south of Po' Pit.
index map with Curst Cave mapped south of Vined Vault.

section nonrooms

index map with Gazy Gap mapped south of Trim Tram.
index map with Hidey House mapped west of Gazy Gap.

section side room to include

include Very Vile Fairy File Fake Rooms by Andrew Schultz.
