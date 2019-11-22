"Very Vile Fairy File" by Billy Boling

[?? run through all possible directions you can't go in various areas]

[note that arrows in comments are for the vvm.py script to detect that, yes, the clues indeed work right. So don't delete them!]

the story headline is "Less Lame Guess Game: Double Dip Trouble Trip"

volume includes

the release number is 2.

release along with a website.

release along with an interpreter.

release along with cover art.

include Trivial Niceties by Andrew Schultz.

include Intro Restore Skip by Andrew Schultz.

include Basic Screen Effects by Emily Short.

[a lot of stuff is commented out here because I wanted to keep VVFF as a z-machine game. Perhaps this is quixotic, but I enjoyed the programming exercise. Long story short: the mistakes and tables take up a ton of space I don't really need for testing. But they don't take up enough to threaten a beta build's z8-ness.]

[include Property Checking for VVFF by Emily Short.] [modified version]

include Very Vile Fairy File Mistakes by Andrew Schultz.

include Very Vile Fairy File Tables by Andrew Schultz.

include undo output control by Erik Temple.

use authorial modesty.

use MAX_ACTIONS of 210.

section verb carnage

[xxvvcarn]

understand the command "attach" as something new.
understand the command "buy" as something new.
understand the command "chop" as something new.
understand the command "crack" as something new.
understand the command "embrace" as something new.
understand the command "fight" as something new.
understand the command "hold" as something new.
understand the command "hop" as something new.
understand the command "hug" as something new.
understand the command "insert" as something new.
understand the command "jump" as something new.
understand the command "kill" as something new.
understand the command "kiss" as something new.
understand the command "light" as something new.
understand the command "murder" as something new.
understand the command "polish" as something new.
understand the command "prune" as something new.
understand the command "punch" as something new.
understand the command "purchase" as something new.
understand the command "say" as something new.
understand the command "scrub" as something new.
understand the command "shine" as something new.
understand the command "sip" as something new.
understand the command "skip" as something new.
understand the command "slice" as something new.
understand the command "slice" as something new.
understand the command "sorry" as something new.
understand the command "swallow" as something new.
understand the command "sweep" as something new.
understand the command "taste" as something new.
understand the command "tell" as something new.
understand the command "thump" as something new.
understand the command "tie" as something new.
understand the command "torture" as something new.
understand the command "touch" as something new.
understand the command "wave" as something new.
understand the command "wipe" as something new.
understand the command "wreck" as something new.

[zzvvcarn]

section debug include values - not for release

use MAX_VERBS of 200

section establish debug - not for release

when play begins (this is the set debug state rule): now debug-state is true;

[Include this line after, as it may have some "when play begins" tests]

include Very Vile Fairy File Tests by Andrew Schultz.

section rules to exclude

The print final score rule is not listed in for printing the player's obituary.

book i6 replacemets

Include (-
Replace LanguageVerb;
-) after "Definitions.i6t".

Include (-
[ LanguageVerb i;
	switch (i) {
	  'i//','inv','inventory':
			   print "take inventory";
	  'll', 'cc':   print "scan";
	  't', 'talk':   print "talk to";
	  'x//':   print "examine";
	  'gt//':   print "go to";
	  'r//':   print "read";
	  'z//':   print "wait";
	  default: rfalse;
	}
	rtrue;
];
-) after "Language.i6t".

volume definitions and properties

book definitions

[to too-generic: if debug-state is true, say "TEXT BELOW IS TOO GENERIC. Fix."] [replaced with double question mark and GENERIC]

to decide which region is mrlp:
	decide on map region of location of player;

to decide whether the action is procedural:
	if examining, yes;
	if reading, yes;
	if hintobjing, yes;
	if lling, yes;
	if thinking, yes;
	if jerkingjumping, yes;
	no;

definition: a thing (called th) is moot:
	if th is in Gazy Gap, yes;
	no;

definition: a thing (called th) is known-to-player:
	if th is in Hidey House, no;
	if th is off-stage, no;
	if th is not a backdrop and location of th is unvisited, yes;
	yes;

definition: a thing (called th) is acquired:
	if th is moot, yes;
	if th is enclosed by the player, yes;
	no;

to say here-in of (rm - a room): say "[if rm is location of player]here[else]in [rm][end if]"

to say swh of (rm - a room): say "[if rm is unvisited]somewhere new[else][rm][end if]"

to say once-now of (ru - a rule):
	process ru;
	say "[if the rule succeeded]now[else]once[end if]"

to bring-here (th - a thing): move th to location of player.

to moot (th - a thing):
	move th to Gazy Gap; [ic]

to move-to-temp (th - a thing):
	if th is in location of player, move th to Hidey House;

to move-from-temp (th - a thing):
	if th is in Hidey House or th is off-stage, move th to location of player;

definition: a thing (called th) is quicknear:
	if player carries th or th is in location of player, yes;
	no;

to bold-new-room (newrm - a room):
	move player to newrm, without printing a room description;
	bold-my-room;

to bold-my-room:
	say "[b][location of player][r][line break]"

to say ll: say "[b]LL[r]"

section flags for testers

[ this won't appear in the release version, but since these flags crop up in a lot of actions to help with playtesting, we can't put them in a debug version. debug-state is another such variable, but it's included in Trivial Niceties. ]

in-beta is a truth state that varies. [general beta flag]

climb-clear is a truth state that varies. [ did the beta tester jump ahead until the end? ]

section scoring stuff

to say hc: say "ch"

to say email: say "blurglecrun[hc]eon@gmail.com"

to say gh: say "https://github.com/andrews[hc]ultz/very-vile-fairy-file (currently private)"

whew-score is a number that varies. whew-score is 8.

core-max is a number that varies. core-max is 81. [core-max is fixed. It is the number of point-scoring actions you need.]

min-needed is a number that varies. min-needed is 81. [min-needed increases as you find LLPs.]

max-bonus is a number that varies. max-bonus is 13.

cur-bonus is a number that varies. cur-bonus is 0. [we could define min-needed as core-max + cur-bonus I guess.]

isle-score is a number that varies. isle-score is 7. [this is the number of points in the endgame.]

core-score is a number that varies. core-score is 0.

max-overall is a number that varies.

max-poss is a number that varies.

to up-min:
	increment min-needed;
	increment the score;

to up-reg:
	increment core-score;
	increment the score;

to max-down: decrement max-poss;

Worst Whew is a region. [first few]

Piddling Pain is a region. [middling main]

Browsy Breaks is a region. [lousy lakes]

Poorly Penned is a region. [early end]

Vale Verminous is a region. [terminal tale]

there is a region called Get a Guess. [meta mess]

book properties

a room has text called noway-text.

a person has text called talk-text.

a gaphat is a kind of thing.

cheattype is a kind of value. the cheattypes are phbt, letplus, letminus, partplus, partminus, leteq, letboth.

to phbt (x - a thing):
	now cht of x is phbt;
	now x is not optional-noted;
	now x is not optional;

to phbt (x - a room): now cht of x is phbt;

a room has a cheattype called cht. cht of a room is usually phbt.

a thing has a cheattype called cht. cht of a thing is usually phbt.

a thing can be optional. a thing is usually not optional.

a thing can be optional-noted. A thing is usually not optional-noted.

a thing can be boring. a thing is usually not boring.

a thing has text called bore-text.

a thing has a rule called bore-rule. bore-rule of a thing is usually the bore-nothing rule.

a thing can be fakeenter. a thing is usually not fakeenter.

rule for supplying a missing noun when entering: [?? yes, this is bad coding. I should define a property. But ... later.]
	let TFE be number of touchable fakeenter things;
	if TFE > 1:
		say "There's more than one thing you can logically enter here. IN works better as a command.";
		reject the player's command;
	else if TFE is 0:
		say "I didn't find anything to enter.";
		reject the player's command;
	now noun is a random touchable fakeenter thing;
	say "([the noun])[line break][one of][line break]NOTE: IN is a substitute for trying to enter something, and you only need to do so with one object.[or][stopping]";

section boring rules

skip-bore-text is a truth state that varies.

this is the bore-nothing rule: do nothing;

instead of doing something with a boring thing:
	if action is procedural, continue the action;
	abide by the bore-rule of noun;
	if skip-bore-text is true:
		now skip-bore-text is false;
		continue the action;
	if bore-text of noun is not empty, say "[bore-text of noun][line break]" instead;
	say "Not much to do with [the noun], so, examining...";
	try examining the noun instead;

volume going nowhere

the wry wall is a boring backdrop. "The wry wall reads:[line break][sign-dir][one of][paragraph break]The wall looks too sturdy to manipulate with rhymes. But maybe trying would be good exercise[if lurking lump is not off-stage] and super- or re-charge that lurking lump[else], because more practice is always good[end if].[or][stopping]". bore-text of wry wall is "The wry wall is just there for atmosphere.".

nother-room is a room that varies.

after looking in a signable room:
	if nother-room is Wet Wood and player is not in Fun Fen:
		now nother-room is location of player;
	say "There's also [if player is in Fun Fen]a[else if location of player is nother-room]another[else]yet another[end if] wry wall here.";
	continue the action;

to say sign-dir:
	let got-wry be false;
	say "[line break]";
	repeat through table of bad locs: [this is in the tables file]
		if there is an e1 entry and e1 entry is location of player and there is an e2 entry:
			now got-wry is true;
			say "[b][fake-name entry][r]: [e2 entry].";
	if player is in Fun Fen, say "[b]CARK CLIFF: straight down.[r]";
	say "[run paragraph on]";
	if got-wry is false, say " (NOTHING) -- that's a bug.";

definition: a room (called rm) is signable:
	if rm is airy isle and bot board is in airy isle, no;
	repeat through table of bad locs:
		if avail entry is false, next;
		if rm is e1 entry, yes;
	no;

the can't go that way rule is not listed in any rulebook.

ever-wry-wall is a truth state that varies.
wry-wall-found is a number that varies. wry-wall-found is 0.

check going nowhere (this is the look for bad locs rule):
	say "[chase-pass]";
	repeat through table of bad locs: [this is in the tables file]
		if there is no e1 entry or there is no e2 entry:
			if debug-state is true, say "(DEBUG) Fill in location/direction for [fake-name entry].";
			next;
		if avail entry is false, next;
		if location of player is e1 entry and noun is e2 entry:
			if been-here entry is true, say "You already went [noun] to the joke death-trap [fake-name entry]." instead;
			say "You decide to go [noun] to [fake-name entry].[paragraph break]";
			say "[death-trap entry][paragraph break]";
			now been-here entry is true;
			increment wry-wall-found;
			if wry-wall-found is number of rows in table of bad locs, say "Incidentally, you've found everything." instead;
			say "[if ever-wry-wall is false]NOTE: The wry wall just leads to a bunch of joke deaths. You can avoid them or follow them as you please. You don't get any bonus for finding them all, but maybe you'll find them fun. You'll always be kicked back to where you were, with no harm done[else]Well, that's another joke death trap visited. Let's kick you back to where you were[end if].";
			now ever-wry-wall is true;
			say "[line break][b][location of player][r][paragraph break]";
			the rule succeeds;
	unless noway-text of location of player is empty, say "[noway-text of location of player][line break]" instead;
	carry out the exitlisting activity;
	the rule succeeds;

definition: a direction (called d) is viable:
	if the room d of location of the player is nowhere, no;
	if player is in history hall and mistmall is true and d is outside, no;
	yes;

definition: a direction (called d) is viable-gone:
	if d is viable and the room d of location of player is visited, yes;
	no;

definition: a direction (called d) is viable-ungone:
	if d is viable and the room d of location of player is unvisited, yes;
	no;

[see header file for table of bad locs]

section exitslisting

exitlisting is an activity.

rule for exitlisting:
	let lvd be list of viable-gone directions;
	let lvd2 be list of viable-ungone directions;
	add lvd2 to lvd;
	say "You [if noun is diagonal]never need to use diagonal directions[else]can't go [noun][end if], [if number of viable directions is 0]and you may need to figure a puzzle to go anywhere[else]but you can go [lvd][end if].";

after printing the name of a direction (called d) while exitlisting:
	let rm be the room d of location of player;
	if rm is visited, say " to [rm]";

volume you

Kerry Kyle is a person. The player is Kerry Kyle. talk-text of Kerry Kyle is "My mumble: 'Hi!' Humble.". description of Kerry Kyle is "You're you! Bore! Boo! Or ... ooh..."

the zig zag rig rag is a thing. cht of zig zag rig rag is leteq. The player carries the zig zag rig rag. description of zig zag rig rag is "It certainly looks snazzy, but maybe you can convert it to something more practical.". [-> big bag]

the big bag is a thing. description of big bag is "It's pretty nondescript, but it gets the job done. You can hold everything you want tn, now!"

volume Worst Whew

part Wet Wood 3,0

Wet Wood is a room in Worst Whew. "You just don't feel competent enough to get out of here. You can't find any way to go. You need to become better ... [oh-simp]. You also think you can hear something.". noway-text is "[wood-noway][paragraph break][how-better].". cht of wet wood is leteq. [-> get good]

to say how-better:
	say "[one of]You'd like a simple way to become better[or]Wandering around has fleshed things out, but maybe there's a concise way to put things together and improve[or]You remember self-help about how you can get better if you just want to, and it's a matter of flicking a switch. It's not that simple in life, but maybe it could help for leaving the Wet Wood and getting started[cycling]"

wood-row is a number that varies.

to say wood-noway:
	increment wood-row;
	if wood-row > number of rows in table of Wet Wood clues:
		now wood-row is 1;
		say "You go and get lost again, but there are no more unique clues in any direction. You can probably wander around again to get the old clues, though";
		continue the action;
	choose row wood-row in table of Wet Wood clues;
	say "[randtxt entry]";

to say oh-simp: say "oh, there's GOT to be a simple way to say things"

every turn when player is in Wet Wood:
	if turn count < 5, continue the action;
	if the remainder after dividing turn count by 3 is 0, say "You think back [one of][or]again [stopping]to being made fun of for being bad at Kick the Can. Who led the chants? Oh, that's right. Mick-the-Man.";

after looking in Wet Wood for the first time:
	say "And what's this on the ground? Something called a Leet Learner. You pick it up. It looks like you could [b]EXAMINE[r] or [b]READ[r] it for instructions. (NOTE: You can point the learner at something by typing [ll] (thing), or you can refer to the learner as [ll]. You can also [ll] to scan your current location.)[line break]";
	now player has leet learner;
	set the pronoun it to leet learner;
	continue the action;

part Rift River

Rift River is a room in Worst Whew. "The rift river blocks you, and you can't go back, and you don't know which direction to go in, anyway. You managed to GET GOOD to get out of the wood, and maybe you'll need to do something similar to get around the river. It's too wide to cross, and you don't want to go back. Maybe you could summon a guide.". cht of rift river is leteq. noway-text of Rift River is "Directions don't seem to work here. You feel like a guide would be helpful.". [-> gift giver]

chapter Mind Malt

a packet of Mind Malt is a thing. description is "It looks like there used to be Mind Malt, or powder that could make Mind Malt, here. Pity. It could've helped you figure what to do!". cht of Mind Malt is partplus. [-> find fault]

Too Totes New Notes is a thing. description is "You read about your accomplishments and what the Leet Learner scanned, or would have scanned:[paragraph break][fixed letter spacing][my-notes][variable letter spacing][run paragraph on]"

to say my-notes:
	if player has big bag, say "    RIG RAG to BIG BAG     = center.";
	repeat through table of newnotes:
		if there is a score-needed entry and core-score < score-needed entry, continue the action;
		say "[note-to-give entry][line break]";

table of newnotes
score-needed	note-to-give
1	"   GET GOOD to WET WOOD    = center."
2	" RIFT RIVER to GIFT GIVER  = center."
3	"VINED VAULT to FIND FAULT  = center-right."
--	"  MIND MALT to FIND FAULT  = center-left."
4	"  MEAN MASS to GREEN GRASS = left."
5	"     PO PIT to GROW GRIT   = left."
--	"   ROW WRIT to GROW GRIT   = center-left."
6	" TRASH TRAP to [ash-ap]    = right."
--	"   GASH GAP to [ash-ap]    = center."
--	"  CACHE CAP to [ash-ap]    = center-right."
7	"   FIND FEE to MIND ME     = center-right."
8	"  TRIM TRAM to [ski-fli]   = center."

to say ski-fli: say "[if skim-not-flim is true]SKIM SCAM[else]FLIM FLAM[end if]"

to say ash-ap: say "[if bap-map-rap is 1]BASH BAP[else if bap-map-rap is 2]RASH RAP[else]MASH MAP[end if]"

to say cul-lul: say "[if lul-clue is true]LUL LEAST[else]CULL CEASED[end if]"

part Vined Vault 3,-1

Vined Vault is a room in Worst Whew. "[if mean mass is in Vined Vault]You found fault in the Vined Vault, so there's a way out.[else]You're stuck here! There looks to be no way out. It looks like a perfect trap, but...[end if]". noway-text is "You can't tell directions here, but then again, there's no actual unblocked way out. You need to use your head[if mean mass is in vined vault] again[end if].". cht of vined vault is partminus. [-> find fault]

chapter mean mass

The mean mass is a thing. "The mean mass continues to pulse and block the way out of the Vined Vault.". description is "The mean mass doesn't quite attack you, but it hangs menacingly, unnaturally, too dangerous to walk through.". cht of mean mass is letplus. [-> green grass]

part Po' Pit 2,-1

Po' Pit is a room in Worst Whew. "Just beyond a trash trap ... an obvious one, no less ... looks like freedom, of a sort. You've got to get by! There is a row writ, which may or may not be helpful, by an obvious trash trap that guards a long gash gap[if grit-grown is false]. But right now you feel too immature and jumpy to have a revelation how to even start. You suspect there is more than one way, and that's frustrating[end if].". noway-text is "You can't go back, and directions don't seem to apply here. You need to think your way past the trash trap.". cht of po' pit is letplus. [-> grow grit]

the row writ is scenery in Po' Pit. "[if grit-grown is true]It doesn't seem to be helpful any more, but it got you started. Yay[else]It's obviously meant to be motivational, but it's the sort of motivation that says if you want to do better, you have to be better. Be more of a person and have more hustle or desire. Still, despite its lack of detail, perhaps it is in the Po['] Pit for a reason[end if].". cht of row writ is partplus. [-> grow grit]

the trash trap is boring scenery in Po' Pit. "It's pretty obvious that if you step on the trap, you'll plunge into a further pit.". cht of trash trap is letminus. bore-text of trash trap is "You want to NOT do anything with the trash trap. You don't know what could set it off.". [-> mash map]

the cache cap is a boring thing in Po' Pit. "A cap sits here, with half its bill under something. You're not going to pull it out. It's intricately designed. I guess you could call it a cache cap, since it is stuck.". description is "Oh, look here. The cache cap has a layout of the Po['] Pit, along with the gash gap and trash trap. Okay, maybe layout isn't quite the right word. But it seems to indicate there's no way through. [if grit-grown is false]You'd like to believe there is[else]With your new-found confidence, perhaps the right action could convince you otherwise[end if].". cht of cache cap is partminus. bore-text of cache cap is "The cache cap is only there to (sort of) help you figure how to get beyond the Po['] Pit.". bore-rule of cache cap is bore-cache-cap rule. [-> mash map]

the gash gap is boring scenery in Po' Pit. "It looks intimidating, but who knows? Maybe you can figure a way across.". cht of gash gap is leteq. bore-text of gash gap is "The gash gap is an obstacle you need to find a special way around.". [-> mash map]

bap-map-rap is a number that varies.

understand "map" as trash trap when player is in Po' Pit.

this is the bore-cache-cap rule:
	if current action is taking, say "No, the cache cap is too tacky. Perhaps it can help you in other ways." instead;

grit-grown is a truth state that varies.

part Trim Tram 1,-1

Trim Tram is a room in Worst Whew. "[if me-minded is false]FIND FEE is plastered all over the Trim Tram, making you feel poor and worthless compared to other adventurers. [end if]There's got to be a way to pay here to get the Trim Tram going. You hope so. Because there's no easy way out.". noway-text is "You're on the tram. There's no way to get off, and it'd probably lead back to the Vined Vault. How can you fake your way to paying a fare?". cht of trim tram is leteq. [-> flim flam]

FIND FEE is scenery in Trim Tram. cht of FIND FEE is partminus. "FIND FEE is plastered everywhere. [if me-minded is true]But you can shrug it off now[else]You wish you could find something a bit different to do[end if].". [-> mind me]

me-minded is a truth state that varies.

chapter flimflaming

skim-not-flim is a truth state that varies;

volume Piddling Pain

part Fun Fen 0,0

Fun Fen is a room in Piddling Pain. "It's a bit nicer here than back in the Done Den [one of]you came from[or]back below[stopping]. You don't fear ambush by a hun hen. You can go south, and [if tree-down is true]with the tall tree pushed over, you can go north[else]it looks like you could go north, but the way looks treacherous and murky. Maybe you could do something with the tall tree nearby[end if][if wrong art is in Fun Fen], and maybe that wrong art is worth poking at. Or not[end if].". noway-text is "You don't want to go back through the Done Den to the Wet Wood or Vined Vault. Or fall off Fun Fen.".

to decide whether need-healing:
	if least-loss is true and healed-here is false, yes;
	no;

check going in Fun Fen:
	if noun is north:
		if tree-down is false, say "A voice booms in your head 'WORK WITH MURK? MYTH!' You need a way through the murky bit to the north. Well, a much safer one." instead;
		if need-healing, say "You're not ready to go back and confront the Bull Beast in your injured state yet." instead;
	if noun is down, say "Perhaps Cark Cliff has some use, but tumbling down it isn't one of them. 'Don't die.' / 'Won't! Why?'" instead;

section done den

the done den is scenery in Fun Fen. "It looks nice and cozy. You feel a sense of accomplishment having made it through the done den, but you don't want to go back."

check entering done den: say "As you start to enter, you imagine a weight falling on you. How much? A ton. Ten. Perhaps before, or after, you would be mauled by a wild hun hen.[paragraph break]You don't need to revisit your initial success." instead;

section wrong art

the wrong art is optional scenery in Fun Fen. "It just looks wrong here. But perhaps it is sort of right, because it may give you one more idea about how to do things. Like all art, it's strictly not necessary, and neither is viewing it the right way. The wrong art also has a prong part sticking out from it.". cht of wrong art is letplus. [-> strong start]

check taking wrong art: say "Not worth it at all." instead;

the prong part is part of the wrong art. The prong part is optional. description is "It's a particularly ugly part of the wrong art.". cht of prong part is letplus. [-> strong start]

started-strong is a truth state that varies.

section tall tree

tree-down is a truth state that varies.

The Tall Tree is boring scenery in Fun Fen. "[if tree-down is false]The tall tree sits here, bending out over the gap to the north. It could make a bridge reaching the other side[else]You made the tall tree fall free to the north, giving passage to [swh of the room north of Fun Fen][end if].". cht of tall tree is leteq. bore-text of tall tree is "[if tree-down is true]You'd better not do anything to the tree. It's your way across[else]You need to do something specific to the tree. Maybe a sort of order[end if].". [-> fall free]

section hive heap

the hive heap is a thing. cht of hive heap is leteq. "The hive heap that was released when the tall tree fell is here. There's got to be a way to look through it.". description is "The hive heap seems like it may be hiding something below the surface, but how best to attack it?". [-> dive deep]

check taking hive heap: say "You might not get stung, but it's too unwieldy to carry[if player has big bag], even with your big bag[end if]." instead;

section vapor vial

the vapor vial is a thing. cht of vapor vial is leteq. "A vapor vial fell out from the hive heap. Perhaps there is something inside it.". description is "The vapor vial may or may not be easy to shatter and release the toxic, err, vile vapor within. Perhaps there is a way to make it and its contents less toxic and more biodegradable.". [-> paper pile]

understand "vapor vile" and "vile" and "vile vapor" as vapor vial when vapor vial is touchable.

check opening vapor vial: say "It might be poisonous." instead;

check taking vapor vial: say "It might break in its current form." instead;

section paper pile

the paper pile is a thing. "A paper pile lies here. You'd like it to be a bit more firmly bound together before you take it.". description is "It is a bit loose. Every single paper is labeled FACT FINDER.". cht of paper pile is partplus. [fact finder -> backed binder]

check taking paper pile: say "It's too disorganized as-is[if player has big bag], even with your big bag[end if]." instead;

understand "fact/finder" and "fact finder" as backed binder.

section backed binder

the backed binder is a thing. description is "The backed binder holds critical, but obscure, information on the Crimes Crew Times Two and how they made the Very Vile Fairy File. It's pretty high level stuff. The ideas sound grand, but they're not backed up by evidence."

understand "paper/pile" and "paper pile" as backed binder when paper pile is moot.

chapter Cark Cliff

Cark Cliff is optional proper-named scenery in Fun Fen. "[if wild weed is moot]You don't feel so worried about Cark Cliff now[else]It's intimidating, but it would be neat if it weren't[end if].". cht of cark cliff is letplus. [-> spark spliff]

tree-down is a truth state that varies.

part Real Rear 0,-1

Real Rear is south of Fun Fen. Real Rear is in Piddling Pain. "Yup. This feels about like the edge of where you can explore. You can really only go back north. A peeling pier leads out south to the Sage Sea, which expands on all sides. There's also a steel steer here, and you sense the presence of a Ceiling Seer as well. [seer-is].". noway-text is "The Sage Sea surrounds you all ways except back north[if cage key is not off-stage]. You already got the cage key from it, anyway[end if]. You also sense a Ceiling Seer above, judging what you do.". cht of real rear is partplus. [-> kneel near]

to say seer-is:
	say "[if healed-here is true]You're glad it's there, even though you don't need it any more[else if knelt-yet is false]You don't feel it's paying attention to you, yet[else if felt-fear is false]Perhaps you should confide, somehow[else if cage key is off-stage]You remember the fear you felt, and you just need to show you can do something for yourself, now[else]Perhaps the Seer can do a bit more for you, if you ask right[end if]";

chapter ceiling seer

the ceiling seer is boring scenery in Real Rear. "The Ceiling Seer is all around. You can't do anything with it, [if healed-here is true]and it's given enough[else if knelt-yet is true]. though you may be able to gain more favors[else]though if you do the right thing, you may be worthy of something valuable[end if].". [the seer is redirected to the rear]

chapter Sage Sea

the Sage Sea is scenery in Real Rear. "[if cage key is off-stage]You feel as though the Sage Sea must hold something, if you can prove yourself worthy[else]You've proved yourself worthy enough. The Sage Sea may hold other mysteries, but they are beyond the bounds of this quest[end if]."

check inserting into the Sage Sea: say "The Sage Sea is not a place to dump stuff." instead;

chapter peeling pier

the peeling pier is optional scenery in Real Rear. "It's -- well, not in great shape, but it feels appropriate for a semi-spiritual area under the Ceiling Seer's surveillance. [if appeal-appear is false]You can't quite read who constructed it, and it's not a necessary mystery, but maybe it's a fun one[else]In fact, you fully notice the wabi-sabi thing it's got going on. Not flashy, but appropriate and welcoming[end if].". cht of peeling pier is letplus. [->APPEALING APPEAR]

appeal-appear is a truth state that varies.

chapter Steel Steer

the steel steer is scenery in Real Rear. description is "It's probably a good thing it's not a stealing steer, which would fit in fully with the pier, but all the same, it suggests things you might be able to do.". cht of steel steer is partminus. [-> kneel near]

check taking steel steer: say "It is way too heavy to STEAL STEER." instead;

chapter Cage Key

the cage key is a thing. description is "It looks important. It must open something. There can only be so many cages around.".

knelt-yet is a truth state that varies.

felt-fear is a truth state that varies.

healed-here is a truth state that varies.

part Creased Cross 0,1

Creased Cross is north of Fun Fen. Creased Cross is in Piddling Pain. "This feels like a boring old intersection, but you [if bull beast is moot]defeated the bull beast here, which was exciting[else]sense it could be so much more, later[end if]. You can go in all four directions here[beast-clue].". cht of creased cross is letminus. [-> beast boss] [-> least loss]

after going from creased cross when healed-here is true and cull-ceased is false:
	say "Hmm. The Bull Beast didn't chase you as you left. Maybe you were better equipped to dispose of it than you think.";
	continue the action;

to say beast-clue:
	if bull beast is not moot:
		say "[if healed-here is true]You get the feeling the right cry could bring the bull beast out[else if least-loss is true]The bull beast must be waiting in the shadows[end if]";

need-loss is a truth state that varies.

instead of doing something when need-loss is true:
	if action is procedural, continue the action;
	say "You need to do something ... no chance of winning, but you can't be routed here.";

chapter Bull Beast

The Bull Beast is a person. talk-text is "'Tame? Tush! Maim! Mush!'". "[if cull-ceased is true]The Bull Beast lies dead here[else]The Bull Beast roars around here. Perhaps one phrase would dispel it--maybe a weird one, but it IS a beast boss, after all[end if].". bore-text of Bull Beast is "The Bull Beast is dead. No need to muck around.". description of Bull Beast is "[if cull-ceased is true]Dead. Perhaps it can be remade into something nicer[else if healed-here is true]Not quite as impressive and intimidating as when it mauled you at first. Maybe the right words can repel it[else]Too tough to beat now, but maybe you can avoid total defeat[end if].". cht of bull beast is partplus. [bull beast->cull ceased]

cull-ceased is a truth state that varies.

least-loss is a truth state that varies.

chapter full feast

The full feast is a thing. "A full feast lies here. You can't eat it all by yourself, and you have no way to move it on your own.". description is "It's what remains of the bull beast, and it's surprisingly tasty looking. Pre-cooked, too! Because you sure burned it with your magic words, there. Ahaha.". cht of full feast is partplus. [->pull pieced]

check taking the full feast: say "Too much at once." instead;

part Stark Store -1,1

Stark Store is west of Creased Cross. cht of stark store is letminus. Stark Store is in Piddling Pain. "[if dark door is in stark store]A dark door leads to the west. You have no idea how to open it[else if dark door is moot]There's a way west where the dark door was[else]It's far too empty here! You can't have hit a dead end so soon[end if][if weird way is in stark store]. There's also a (blocked) weird way down[else if weird way is moot]. You cleared a weird way down as well[end if]. You can go back east to Creased Cross, too.". noway-text of Stark Store is "It's pretty stark here. You can only go [if weird way is moot]down, [end if][if dark door is moot]west and [end if]east.". [-> dark door]

check going west in Stark Store:
	if dark door is off-stage, say "Maybe there's something there. This can't just be a dead end." instead;
	if dark door is in Stark Store, say "You can't seem to get past the dark door. It's too featureless right now. You can't find anything to grab." instead;

check going down in Stark Store:
	if weird way is off-stage, try going north instead;
	if weird way is in Stark Store, say "You can't seem to get past the weird way." instead;

chapter clumped cluster

a clumped cluster is optional scenery. "The clumped cluster is useless, but it's not blocking you, and you doubt anything's in there. It would've turned up when you turned the weird way to the cleared clay, anyhow.". cht of clumped cluster is letminus. [-> bumped buster]

chapter dark door

There is a thing called the dark door. It is fakeenter and scenery. "You can't seem to open the dark door. It's there, and it's forbidding.". cht of dark door is leteq. [-> mark more]

check entering dark door: try opening dark door instead;

chapter weird way

the Weird Way is boring scenery. cht of Weird Way is letplus. "You can't see a way past, but there has to be one.". bore-text of Weird Way is "You must be able to do something with it, somehow. Something a bit unorthodox." [-> cleared clay]

part Fight Funnel -2,2

Fight Funnel is below Stark Store. It is in Piddling Pain. cht of Fight Funnel is leteq. printed name is "[if funnel-to-tunnel is true]Tight Tunnel[else]Fight Funnel[end if]". "This is a narrow east-west passage[if funnel-to-tunnel is false], but you're not going further west past the fight[else if player does not have big bag], but it tapers to the west and you won't be able to fit with all your possessions scattered about you. The Leet Learner alone is too unwieldy, and you don't want to let go of it. You might need some simple organization to go west[else if beer bull is moot]. You don't need to go west now you trapped the beer bull[else if snare is moot]. You set a trap west, so you probably don't want to go there unless you're trying to catch someone[else]. You can probably just fit west[end if].". [-> tight tunnel]

funnel-to-tunnel is a truth state that varies.

this is the drop-snare rule:
	if player has snuck snare and kni-ni is true:
		moot snuck snare;
		phbt dives ditch;
		if bull beast is in fight funnel:
			say "Oh no! You don't have the time to place the snare AND distract the bull beast at once! Sorry about that. On the bright side, you managed to place the snare, though, and the bull beast was so busy beating you up, it didn't notice you setting a trap. So it's probably no problem just to come back here, now.";
			reset-bull-chase;
		else:
			say "As you go [if player is in fight funnel]west[else]look around[end if], you realize the snuck snare would be quite nice for trapping someone unsuspecting, somewhere, somehow. So you place it and return.";
			move player to fight funnel;
		the rule succeeds;

check going west in Fight Funnel:
	if funnel-to-tunnel is false, say "You're not getting past the fight." instead;
	if big bag is off-stage:
		say "You don't have enough space. You need to organize your possessions first. Maybe your inventory can be simplified--perhaps one item, changed, could hold the others, for convenience." instead;
	if snuck snare is moot and beer bull is not in location of player, say "Not now. You've prepared the trap. Let someone, or something, else walk into it." instead;
	process the drop-snare rule;
	if beer bull is in location of player:
		if snuck snare is moot:
			say "You crawl through the Fight Funnel and roll off to the side. The beer bull, not knowing better, springs the snare! Aigh! The Beer Bull's last words are 'TRICK! TRAP! SICK SAP!' before it explodes, most of it tumbling into the remains of the Dives Ditch. But something's left behind: a flagon (or firkin or whatever) of mild mead. You walk back to Here Hull, where a Gear Gull rests. 'Thank you for freeing me from the Beer Bull. I would like to do you a favor in return.' The Gear Gull inspects you.";
			solve-bull-chase;
			the rule succeeds;
		say "You lead the beast bull into [the room west of Fight Funnel] but it corners you. Yet--you must be close!";
		reset-bull-chase;
		the rule succeeds;
	if beer bull is moot, say "You don't need to set or trigger the Knives Niche again." instead;

to solve-bull-chase:
	if player has gold guard:
		buff-gold-guard;
	else:
		say "[line break]'I see no armor I could help improve. Come back when you find it. But for now, I need time to reorganize my domain.'";
	up-reg; [+beat beer bull]
	now in-bull-chase is false;
	moot beer bull;
	now player has mild mead;
	say "[line break]Man! I guess you could say you had ... one wound run-round.";
	bold-new-room Soft Sand;

part Dives Ditch -3,2

Dives Ditch is west of Fight Funnel. cht of Dives Ditch is partplus. Dives Ditch is in Piddling Pain. printed name is "[if kni-ni is true]Knives Niche[else]Dives Ditch[end if]". "[if kni-ni is true]You've set a trap, but for whom?[else]The dives ditch seems to recount many people lured, somehow, to their death. Perhaps you could construct a sneakier trap.[end if]". [-> knives niche]

kni-ni is a truth state that varies.

chapter mild mead and wild weed

the mild mead is a thing. the indefinite article of mild mead is "some". description is "It probably tastes gross and is not very psychoactive, either. But perhaps it will do, for a nice quiet victory celebration.". cht of mild mead is leteq. [->wild weed]

the wild weed is a thing. the indefinite article of wild weed is "some". description is "You can't tell how potent it is by looking at it. It could be very weak, paralleling the mild mead, or very strong, because that's where all the beer bull's vitality went, instead of into the mead.".

part History Hall -2,1

History Hall is west of Stark Store. cht of history hall is leteq. History Hall is in Piddling Pain. printed name of History Hall is "[mist-hist of true]". "[if mistmall is true][mystdesc][else][histdesc][end if].[paragraph break]You can go back east[if the room outside of History Hall is Y'Old Yard], or you can go outside[end if][if ever-mall is true], and there's a store west[end if][if ever-mall is true]. Or you could just shift back to [mist-hist of false][end if].". [-> mystery mall] [mystery mall->history hall]

check going outside in history hall:
	if mistmall is true and poor ponder is moot, say "You'd have to switch back to History Hall to try that." instead;

to say mist-hist of (ts - a truth state): say "[if mistmall is ts]Mystery Mall[else]History Hall[end if]"

to say mystdesc:
	say "[if ever-mall is false]The wall to the west seems hollow[else if mistmall is true]History Hall's wist-eerie wall has disappeared, affording passage west[end if]. [if oi mo is in History Hall]There's a horrible song providing atmosphere[else if toe tappin is in History Hall]There's mall music in the air you can LISTEN to[else]You can LISTEN to random music if you want, too[end if][if mean moe's is in history hall]. There's also something called Mean Moe's Clean Clothes, a small booth where you could tidy up, if you figured how to use it[end if]"

to say histdesc:
	say "[if poor ponder is in History Hall][Poor Ponder] lies here seeming, or trying to seem, more important[else if ever-mall is false]It's pretty empty in here. Perhaps it could become something more modern. Or less ancient[else]History Hall is empty once again[end if]"

check going west in History Hall: [gutta ganksta blocks you]
	if ever-mall is true:
		if gutta ganksta is in history hall, say "The gutta ganksta pushes you back. Maybe you can win a quick diss war to, well, displace the ganksta." instead;
		continue the action;
	say "[if ever-mall is true]You'll have to change back to History Hall[else]Thud! But a hollow thud. Maybe shifted around a bit, [location of player] might afford passage west[end if]." instead;

section truth states for puzzles/map

mistmall is a truth state that varies. [are we in the mall or the hall?]

ever-mall is a truth state that varies. [have we ever flipped to the mall?]

ever-hall is a truth state that varies. [have we ever flipped to the hall?]

gan-wan is a truth state that varies. [have we called the ganksta a rude name?]

chapter Gutta Ganksta (M)

the Gutta Ganksta is an optional person. "A Gutta Ganksta with a tattoo chills (unconvincingly) here.". description is "GOTS GAME is tattooed on the Gutta Ganksta.". talk-text is "'Chill, chap. Will WHAP!'". cht of gutta ganksta is partplus. [-> whatta wanksta]

understand "tattoo" as GOTS GAME when Gutta Ganksta is quicknear.

GOTS GAME is part of the Gutta Ganksta. cht of gots game is leteq. description is "It's pretty bad, as tattoos go. It has so much wrong with it. Perhaps you could point it out, without being too hurtful.". [-> lots lame]

after lling gutta ganksta:
	if cht of gots game is leteq:
		say "But the GOTS GAME tattoo is worth scanning, too, so you do so.";
		try lling gots game;
	continue the action;

chapter Toe Tappin Row Rappin (M)

Toe Tappin Row Rappin is scenery. printed name is "[i]Toe Tappin['] Row Rappin['][r]". "You [one of]listen a bit. The song is [Toe], and it's actually pretty catchy and good even a bit self-conscious with the 'Yo, Yappin' start. It might help you in the future, in the right place or places. Lateral thinking and all that. It's stuck in your head now, and that's not all bad, because what replaced it is even worse.[paragraph break]Now that [Toe] is in your head, it may help you in places where the usual rhymes don't work. Use [b]SAVE SONG[r] and [b]RAVE WRONG[r] to toggle this help, which is on by default[or]already have the song in your head. The 'Yo, Yappin[']' bit at the start suggests it is flexible and may help you do or see things another way[stopping].". cht of Toe Tappin Row Rappin is partminus. [-> no nappin] [-> ho happen] [?? LL TOE needs to break down into specific cases]

understand "song" as toe tappin row rappin when player is in History Hall and oi mo is in History Hall.

after examining Toe Tappin Row Rappin:
	if player does not have Row Rappin:
		now player has Row Rappin;
		now sing-clue is true;
		move Oi Mo to History Hall;
	continue the action;

chapter Oi Mo (M)

Oi Mo by Tim T Sims Pimp is optional scenery. "It's a truly awful song. If you could find a way to turn it down...". cht of oi mo is leteq. [oimo -> dimd]

understand "song" as oi mo when player is in History Hall and oi mo is in History Hall.

chapter Poor Ponder for Fonder

Poor Ponder for Fonder is scenery. cht of Poor Ponder for Fonder is partplus. "Reading [poor ponder], it seems quite bad. It's trying to give the reader a grasp of history, but it seems like it doesn't really place the reader IN the era it's trying to describe. It's not even trying. And yet, perhaps it is worth the effort for YOU to try.". [->youre yonder]

printed name of Poor Ponder is "[i]Poor? Ponder for Fonder[r]".

understand "book" as Poor Ponder when Poor Ponder is touchable.

check taking Poor Ponder: say "You can figure out its inner meaning right here." instead;

chapter Mean Moe's (M)

Mean Moe's Clean Clothes is scenery. "It's some sort of machine you could use to clean something that needed it. But it's not that easy. You probably need to discover the lights and bells and whistles that make it tick.". cht of Mean Moe's Clean Clothes is letboth. [-> glean glows]

to decide whether can-glean:
	if tried-yet of "GLEAN GLOWS", yes;
	no;

check entering Mean Moe's: say "It is too small to do anything to accept clothes." instead;

check inserting into Mean Moe's:
	say "You need to [if can-glean]GLEAN GLOWS[else]find the right command to get Mean Moe's to work[end if]." instead;

chapter clashing cloak (M)

the clashing cloak is a thing. description is "It seems suited for more than just fashionable conflict, if you knew what to do.". cht of clashing cloak is leteq. [-> smashing smoke]

part Y'Old Yard -2,-1

Y'Old Yard is a room in Piddling Pain. "The Shoaled Shard, a forbidding fortress indeed, surrounds you on all sides. [if bold bard is not moot]It probably won't respond to any direct rhyming. It's that imposing. [end if]You can go back INSIDE to the History Hall[if bold bard is moot], and with the Bold Bard gone, there's really nothing else to do[end if].". printed name of Y'Old Yard is "Y'Old(e) Yard(e)".

The Bold Bard is a person in Y'Old Yard. description is "The Bold Bard looks longingly at the Shoaled Shard. There must be some way in!". "[one of]'Hi! I'm a bold bard, and I'd love to get into the Shoaled Shard to perform and show how great I am. But the guards won't let me in. Maybe you could help? Some sort of distraction?'[or]The Bold Bard continues to pace back and forth here, looking for a way in the Shoaled Shard. Probably the obvious local ones didn't work.[stopping]"

talk-text of bold bard is "'Scold-scarred. Told. Tarred.' The bold bard clearly wants to get into the Shoaled Shard but probably got thrown out by now-watchful guards. You both decide some sort of sneak attack or diversion would be best. If rhyming had worked, the bold bard would've found one that went old-ard.".

chapter gold guard

the mold marred gold guard is a thing. description is "[if beer bull is not moot]Very flimsy indeed, but maybe it could be repaired[else if mine-more is false]Could sturdier be sturdier, actually. The gear gull said something about finding other materials[else]Super sturdy now you got the boost from the Shining Shore[end if].". printed name is "[if gull-guard is false]mold-marred [else if mine-more is true]hold-hard [end if]gold guard"

understand "hold hard gold/guard" and "hold hard gold guard" and "hold/hard gold/guard" and "hold/hard gold guard" and "hold/hard" and "hold" as gold guard when mine-more is true. [ugh! This is terrible, but I checked, and it covers all the possibilities.]

chapter shoaled shard

the Shoaled Shard is scenery in Y'Old Yard. "It's intimidating and obviously well-guarded, but it could be breached with the right distraction."

the cold card is a thing. description is "It's useful for one very useless boring ... hmm. It's blurred. You can't see.".

part Vending Vibe -2,1 a

Vending Vibe is a room in Piddling Pain. "This isn't a very big place[if lending libe is off-stage]. And the 'vibe' here is a bit slangy[else if fussed folks is in Vending Vibe]. A book called [fussed folks] lies here you [may-already] to check out something more substantial[end if]. You can only go back east."

to say may-already:
	say "[if we whine is off-stage]may wish[else]managed[end if]"

The Trending Tribe are plural-named people in Vending Vibe. cht of trending tribe is letminus. talk-text is "'Bam, burning! Am earning!'". "A Trending Tribe stands here, just waiting to sell you something you can't afford, because there is no money in this game.". description is "They look greedy enough. They'd overcharge you to BORROW. Perhaps they can be vacated for something different, if a bit slangy". [-> lending libe]

the Lending Libe is scenery. "Looking in, you see one book labeled [i][next-rand-txt of table of vvff books][r]. This locational libe has no vocational vibe.";

after going to Vending Vibe:
	process the card-and-libe rule;
	continue the action;

this is the card-and-libe rule:
	if trending tribe is moot and player has cold card:
		say "[line break]You look at your cold card for a minute. You realize that it's actually a library card! In fact, it has a book on hold! Unfortunately, the book is [We Whine], about how to be a jerk for profit and excitement. And you don't need that, being a hero. Still, you take it.";
		now player has We Whine ME MINE;
		moot cold card;
	continue the action;

We Whine ME MINE is a thing. cht of We Whine is letboth. description is "It's about how to be an extremely effective jerk and to get what you want. [if sign-seen is true]This isn't something you would want to know, but it explains how and why certain people behaved that way in the past, and now.[else]Why would you want to know that? Maybe a careful reading would turn something up.[end if]". [-> see sign]

understand "book" as We Whine Me Mine when We Whine Me Mine is touchable.

the printed name of We Whine is "[i]We Whine: ME, MINE[r]".

sign-seen is a truth state that varies.

chapter fussed folks

Fussed Folks Just Jokes is scenery. "You read about [next-rand-txt of table of miscellaneous people].". printed name of Fussed Folks Just Jokes is "[i]Fussed Folks Just Jokes[r]".

understand "book" as Fussed Folks when Fussed Folks is touchable.

check taking Fussed Folks: say "It's pretty obviously got nothing concrete to help you. It's just for entertainment." instead;

part Got Gear Hot Here -2,1 b

Got Gear Hot Here is a room in Piddling Pain. It is west of History Hall. "A dilapidated store. The only obvious exit is back east[if trounce-track is false], but there may be another useless silly way to leave[end if]."

trounce-track is a truth state that varies.

chapter hard hat

the marred mat is a thing in Got Gear Hot Here. description is "What is a marred mat doing in a clothing store? Either it's misplaced, or ... it's more appropriate in another form. It has a message, of course.". "You can't imagine what a marred mat is doing in a clothing store, but here it is.". cht of marred mat is partminus. [->hard hat]

check taking marred mat: say "It can't be useful in that form." instead;

the hard hat is a gaphat. description is "The hard hat looks like it can protect you well enough, but it doesn't have a lot of flair, and it's not terribly lightweight.".

check taking off hard hat: say "No. Something will come out of nowhere to conk you on the head, and then you'd be sorry. If you were conscious enough to be sorry." instead;

chapter shy shawl

the shy shawl is an optional thing in Got Gear Hot Here. "A shy shawl lies here. It can't possibly be directly useful.". cht of shy shawl is partminus. description is "Its weird and amorphous. The design is weird and abstract and, well, let's be charitable--open to possibilities. Maybe finding them would be good practice[if lurking lump is not off-stage] or help build the lump back up[else], but the shawl can't actually be useful[end if].". [-> lie lol]

check taking the shy shawl: say "It is not suitable apparel for a hero. But you can practice your rhyming on it. Anyway, being shy, it somehow scootches out of your reach." instead;

lie-lol is a truth state that varies.

part Violent Vale 1,1

Violent Vale is east of Creased Cross. It is in Piddling Pain. cht of Violent Vale is partminus. "Creased Cross is back west, and it's sort of watery to the north or south. [if silent-sale is false]It's scary here--there must be some way to get rid of the oppression! [end if][if fridge is in Vale]A frightening fridge towers over you to the east[duz-help][else]The way east is clear with the frightening fridge gone[end if][if boring boat is moot]. There's just a faint memory of how violent it was[else if silent-sale is true]. It's not really violent here at all any more[end if].". [-> silent sail]

silent-sale is a truth state that varies.

to say duz-help: if silent-sale is false, say ", and getting rid of it might help things, a bit"

printed name of Violent Vale is "[if silent-sale is false]Violent Vale[else]Silent Sail[end if]"

check going east in Violent Vale: if frightening fridge is not moot, say "Not with the frightening fridge blocking the way!" instead;

chapter frightening fridge

the frightening fridge is scenery in Violent Vale. cht of frightening fridge is leteq. "It's really scary, darkening everything around by virtue of being fifteen feet tall. It's probably packed with spoiled and/or 'seriously, kid, it'll help you grow' food, too.". [-> brightening bridge]

chapter flooring float

the flooring float is a fakeenter thing. cht of flooring float is letminus. "A flooring float bobs here.". description is "The flooring float is too impractical to ride or sail anywhere you might need. But it's impressive and gaudy!". [-> boring boat]

check taking flooring float: say "It's too heavy, and you can't take it anywhere. Maybe some other watercraft, though." instead;

check entering flooring float: say "It's there for decoration, not transport. But something like it might let you go somewhere new..." instead;

chapter boring boat

the boring boat is a fakeenter thing. "A boring boat is docked here. Perhaps you could ENTER it to [if player is in Violent Vale]see somewhere new[else]return to [Violent Vale][end if].". description is "Just the sight of the boring boat leaves you yawning[if snake-snap is true], but it seems sturdy enough for more adventure[else if nap-no is true] a bit even though you think NO NAPPIN, NO NAPPIN[else]. It's not going to make itself more exciting, but maybe you can break its sleep-spell so you can board and ride it[end if]."

does the player mean entering boring boat: it is very likely;

check taking boring boat: try entering boring boat instead;

check going inside when boring boat is touchable: try entering boring boat instead;
check going inside when flooring float is touchable: try entering flooring float instead;

nap-no is a truth state that varies.

hap-ho is a truth state that varies.

boat-reject is a truth state that varies.

check entering boring boat:
	if nap-no is false:
		say "You try to enter the boat, but it seems so ... boring. If only you could get a jaunty tune stuck in your head to keep you alert!";
		now boat-reject is true;
		the rule succeeds;
	if player is in Been Buggin':
		if player does not have way woke clay cloak, say "Dean Duggan stops you. You have not properly passed [if lean-lugged is false and mean-mugged is false]any[else]both[end if] of the tests you need yet. You need to face things now. Perhaps there is some slang involved, but sometimes you need to brute-force your way through problems." instead;
		say "With your way woke clay cloak in hand, you return to [Violent Vale]. After a moment, the boring boat floats off, perhaps to refuel from all the excitement.";
		moot boring boat;
		if clumped cluster is not moot, max-down;
		move player to violent vale;
		the rule succeeds;
	if player is in lake lea:
		say "You take the boring boat back to [Violent Vale].";
		move boring boat to violent vale;
		move player to violent vale;
		the rule succeeds;
	if player has clay cloak, say "The boat shouldn't be here, but you don't need it any more." instead;
	if cake cap is not off-stage:
		say "The boring boat takes a slightly different path this time. You go somewhere new, somewhere interesting... but when you get there, well, it feels like a tough new challenge.";
		move boring boat to Been Buggin';
		move player to Been Buggin';
		the rule succeeds;
	say "You take the boring boat [if lake lea is unvisited]somewhere new[else]back to Lake Lea[end if].";
	move boring boat to Lake Lea;
	move player to Lake Lea;
	the rule succeeds;

part Lake Lea 3,2

Lake Lea is a room. It is in Piddling Pain. "You're on the Lake Lea, which borders on Lake Lap to the east.".

check going east in Lake Lea when Jake G is touchable:
	if jake-woke is false, say "You have a feeling you may need Jake G.[']s guidance.";
	if jake-fee is false, say "You haven't fully negotiated with Jake G. yet." instead;

Jake G is a person in Lake Lea. "[one of]You come on someone with JAKE G tattooed on him. It's the guy the boring boat told you to see. But he's sleeping right now[or]Jake G [if jake-woke is false]dozes here[else if jake-tea is false]seems to be waiting to give you hospitality[else if jake-fee is false]seems to want payment, but not really[else if jake-cocapn is false]looks at you longingly, as if for more equal companionship, maybe a song[else]paces back and forth here[end if][stopping].". talk-text of Jake G is "[if jake-woke is false]Sleep/slumber, deep/dumber(?)[else]'Achy! Make me!'[end if]". cht of Jake G is partplus. [-> wake whee] [-> fake fee] [-> take tea]

description of Jake G is "[if jake-woke is false]He's sleeping. You need a personalized, cheery greeting[else if jake-tea is false]Jake seems to be fiddling with utensils and snack packs[else if jake-fee is false]Jake rubs the fingers of one hand together but waves it off with the other[else if jake-map is false]Jake looks a little lost[else if jake-cocapn is false]Jake looks a little down here, as if he wants to feel equal to you, or he could use a song[else]Jake seems eager for battle[end if]."

jake-woke is a truth state that varies.
jake-tea is a truth state that varies.
jake-fee is a truth state that varies.
jake-brie is a truth state that varies.

part Whining War 2,1

Whining War is east of Violent Vale. It is in Piddling Pain. "[if war-sapped is false]You can't get a close enough view of the war, but you can sure hear it. Maybe there's a way to make people tired of fighting, with a song or something.[else if shore-shine is false]It's less whiny here, but it's still a bit too dull.[else]It's quieter and brighter here now than when you started. Yay![end if][if dining door is in whining war][paragraph break]Also, the dining door you summoned is still here. How can you provide a banquet to celebrate the war's end?[else if dining door is off-stage] But it's too barren. Maybe there's some scenery that's appropriate here?[else if pining poor are moot] With the dining door and pining poor gone, you feel there's little more to do here.[end if]". cht of whining war is partplus. printed name of Whining War is "[if shore-shine is true]Shining Shore[else]Whining War[end if]". [-> shining shore]

[Lining, Lor'! Fining Four: well, it's a weird name, but if you whined about it, that might cause another whining war.]
[mild mead from Bull Beast will help them do something. The Bull Beast's carcass as well. Once you have the big party, it is all over.]

[??mining more / dining door]

war-sapped is a truth state that varies.

mine-more is a truth state that varies.

dine-door is a truth state that varies.

shore-shine is a truth state that varies.

chapter pining poor

the pining poor are plural-named people. talk-text of pining poor is "'Rich row niche? No! ... Which woe?'". description of pining poor is "They look [if full feast is not moot]hungry and exhausted[else]idle, waiting for work[end if].". "The pining poor, relics of the whining war, stand here, looking needy.". cht of pining poor is leteq. [->dining door]

chapter dining door

the dining door is fakeenter scenery. "The dining door is just there to invite people to eat, once there's a proper meal. It's not intrinsically useful."

check entering dining door: say "It doesn't seem to budge. Perhaps you need to prepare a meal somehow first." instead;

part Lake Lap ??,??

Lake Lap is east of Lake Lea. It is in Piddling Pain. "You could go back west to Lake Lea, but you have a feeling that, whatever you need to do with Jake G., it's here[if jake-map is true]. You hear a hissing noise[end if].". cht of Lake Lap is leteq. [->make map]

jake-cocapn is a truth state that varies.
jake-snap is a truth state that varies.
jake-map is a truth state that varies.
snake-snap is a truth state that varies. [equivalent to "if cake cap is off-stage"]

The cake cap is a gaphat. description is "The cake cap looks tasty and yet still incomplete and not quite wearable on its own."

part Been Buggin'

Been Buggin' is a room in Piddling Pain. cht of Been Buggin' is leteq. "An isolated island too small to explore[if clumped cluster is in Been Buggin']. A clumped cluster lies in the corner. It doesn't need to be cleaned up, but it might be fun or therapeutic to[end if].". [->mean muggin]

Dean Duggan is a person. "[one of]'Hi! I'm Dean Duggan. Congratulations on making it here. Well, sort of. If you have, you -- well, you've done well, but you still need help with life skills and stuff.'[or]Dean Duggan smiles here, ready to help you with whatever you need to ask about[bug-so-far].[stopping]". description of Dean Duggan is "Dean Duggan nods patiently. Though he mumbles motivational slang to himself, he's ready to help you, but you need to know what to ask for[bug-so-far].". talk-text is "'Teach tons, reach runs!' You don't need beach buns, but you probably need a specific phrase suitable to him, or this place. His lax demeanor suggests a bit of slang.". cht of Dean Duggan is leteq. [-> lean luggin]

to say bug-so-far:
	if mean-mugged is true:
		say ". So far, you've managed to look tougher";
	else if lean-lugged is true:
		say ". So far, you've found new ways to be and feel stronger";
	else:
		say ". You'd love to be able to be stronger and tougher, mentally and physically";

mean-mugged is a truth state that varies.

lean-lugged is a truth state that varies.

to decide whether dean-done:
	if mean-mugged is true and lean-lugged is true, yes;
	no;

the way woke clay cloak is a thing. description is "It's unwearable in its current state and may just bog you down."

chapter staystronging

in-way-wrong is a truth state that varies.
in-way-wronged is a truth state that varies.

after looking in Been Buggin' for the first time:
	now in-way-wrong is true;
	say "Everything feels pointless. You're sick of these silly rhymes. They feel way wrong, way wrong.";
	now cht of the player is letplus; [way wrong->stay strong]
	continue the action;

every turn when in-way-wrong is true:
	say "Way wrong ... way wrong ... you feel so depressed and upset. Maybe there's an easy way out of this, but you wouldn't feel accomplished. And if there's a hard way out of this, it's too hard.";

instead of doing something when in-way-wrong is true:
	if action is procedural, continue the action;
	say "You can't. Everything feels ... way wrong. You feel so weak!";

chapter glowglading

in-so-sad is a truth state that varies.
in-so-saded is a truth state that varies.

every turn when in-so-sad is true:
	say "So sad ... so sad ... you feel so depressed and upset. Maybe there's an easy way out of this, but you wouldn't feel accomplished. And if there's a hard way out of this, it's too hard.";

instead of doing something when in-so-sad is true:
	if action is procedural, continue the action;
	say "You can't. You just feel ... so sad. Mo['] mad.";

part Soft Sand 0,2

Soft Sand is a room in Piddling Pain. Soft Sand is north of Creased Cross. cht of soft sand is leteq. "You can go all four directions here[check-hull][if ever-loft is true]. Or you can change back to [soft-loft of false][else]. But ... well, it also feels a bit low. It seems like there's something way high above to the west[end if].". [-> loft land] [loft land->soft sand]

to say check-hull:
	if gull-guard is true:
		say ", though you're done to the east";
	else if beer bull is moot:
		say ", and you remember the Gear Gull waits east in Here Hull to help with [if player has gold guard]your gold guard[else]any armor you find[end if]"

to say soft-loft of (ts - a truth state): say "[if loft-land is ts]Loft Land[else]Soft Sand[end if]".

printed name of Soft Sand is "[soft-loft of true]".

to say soft-or-loft:
	if loft-land is false:
		say "[if ever-loft is false]The sand feels unstable, not like it's going to swallow you up, but like it could become something else. There's also something to the west you can't reach by flying. It's just--up there[else]Or you could bring back the loft land[end if]";
	else:
		say "The cave you couldn't reach in the soft sand is now easily accessible to the west"

ever-loft is a truth state that varies.

loft-land is a truth state that varies.

check going west in Soft Sand:
	if loft-land is false and jerk gel is not in Shirk Shell, say "The smirk smell is too repulsive. You can't go back. But you got the jerk gel, and that's enough." instead;

check going east in Soft Sand:
	if gull-guard is true, say "You already got what you wanted from Here Hull and the Gear Gull. You must confront things more ... fearful." instead;
	if beer bull is moot:
		if player has gold guard:
			say "As you go east, the Gear Gull inspects your mold-marred gold guard. 'I can do something now.'";
			buff-gold-guard;
		else:
			say "You don't have anything for the Gear Gull to buff.";
		the rule succeeds;

section booleans for location appearance

loft-land is a truth state that varies.

part Here Hull 1,2

Here Hull is east of Soft Sand. It is in Piddling Pain. "The only exit here is back west to [soft sand]."

gull-guard is a truth state that varies.

to buff-gold-guard:
	say "[line break]The Gear Gull breaks out some polish. It doesn't just remove the mold but thickens the gold guard without making it heavier. You smile, but the Gear Gull says, 'I can only make the gold guard so strong. There are materials that can do more. You must find them to be able to reach your goal. You are done here--no need to come back.'[wfak]";
	if tried-yet of "BEAST BOSS", say "[line break]You also feel more ready to face the beast boss, now.";
	now gull-guard is true;

check going west in here hull:
	if bull-null is false and in-bull-chase is true:
		say "The bull is too fast and strong. It tears you up. Maybe there was some way to weaken it. At least it slinks back to where it was, maybe saving another beating for later.[paragraph break]";
		reset-bull-chase;
		the rule succeeds;

The Beer Bull is a person in Here Hull. cht of beer bull is leteq. talk-text is "It can't speak, but its look says 'Real rude? Deal, dude!'". "[if in-bull-chase is false][bull-standby][else]The Beer Bull looks quite upset, ready to chase you wherever you may go. While it's too quick for you to double back on, it could be goaded somewhere dangerous[end if].". description of Beer Bull is "It has FEAR FULL tattooed on its chest, because that's how beer advertising is--but maybe you should've expected it, since BULL and HULL don't quite rhyme, anyway. [if in-bull-chase is true]And boy, you annoyed it. Better try to keep running while you can[else]It looks formidable, and yet -- you'd love to outsmart it, somehow[end if]." [->dear dull] [->near null]

check taking beer bull: say "You need to worry about the beer bull taking you." instead;

to say bull-standby:
	say "[if ever-bull-chase is false]A beer bull stands motionless here. There may be a way to wake it up, and it looks like there's something behind it[else]You saw something behind the Beer Bull before you made it chase you by saying DEAR DULL. If only you could dispose of the bull, you could see what it is[end if]"

bull-null is a truth state that varies.

in-bull-chase is a truth state that varies.
ever-bull-chase is a truth state that varies.

to decide whether hull-bull:
	if player is in Here Hull or beer bull is in location of player, yes;
	no;

to reset-bull-chase:
	say "You limp [if player is in creased cross]around[else]back to[end if] Creased Cross.";
	move beer bull to here hull;
	move player to Creased Cross;
	now in-bull-chase is false;
	now bull-from is Here Hull;

bull-from is a room that varies. bull-from is Here Hull.

check going when in-bull-chase is true:
	if the room noun of location of player is bull-from:
		say "The beer bull catches you doubling back! What follows is ... not pretty.[paragraph break]";
		reset-bull-chase;
		the rule succeeds;

chase-mulligan is a truth state that varies.

to say chase-pass: if in-bull-chase is true, now chase-mulligan is true;

every turn when in-bull-chase is true: [?? make this so that we track by last-bull-loc]
	if action is procedural:
		continue the action;
	if chase-mulligan is true:
		now chase-mulligan is false;
		continue the action;
	if beer bull is in location of player:
		say "The beer bull, upset with your lack of action, charges and kicks you around for a while. Some part of it realizes if it does too much damage, it won't have a chance to kick you around again, so it retreats [if player is in here hull]into its corner[else]back to Here Hull[end if].[paragraph break]";
		reset-bull-chase;
		the rule succeeds;
	if beer bull is not in location of player:
		say "You hear the Beer Bull thunder behind you.";
		now bull-from is location of beer bull;
		move beer bull to location of player;

to start-bull-chase:
	now ever-bull-chase is true;
	now in-bull-chase is true;

part Shirk Shell -1,2 a

Shirk Shell is west of Soft Sand. IT is a room in Piddling Pain. "You feel like there's not a lot to do here in the Shirk Shell. Nothing to do except go back east, in fact.". cht of shirk shell is letminus. [->work well]

check going east in shirk shell: if player has jerk gel, say "A smirk smell erupts in Shirk Shell. You don't want or need to go back.";

after printing the name of jerk gel while taking inventory: say " (brand name: SUPPLE SAPS)";

the tube of jerk gel is a thing in Shirk Shell. "A slightly leaky tube of Jerk Gel lies here. It doesn't seem trivial to take, but maybe it will come in handy.". description is "It seems to be a powerful glue, the sort jerks use for pranks, hence jerk gel. You figure you'll know what to do with it when the time comes[if player does not have jerk gel], but right now, you'll want to figure how to pick it up carefully[else]. A closer look indicates its ingredients include SUPPLE SAPS[end if].". cht of jerk gel is partplus. [-> work well]

understand "supple/saps" and "supple saps" as jerk gel.

check taking jerk gel when jerk gel is in Shirk Shell:
	say "The jerk gel has spilled out a bit, and it's too icky to take as-is. You'll need to show diligence putting it back in." instead;

part Curst Cave -1,2 b

Curst Cave is a room in Piddling Pain. "You can only go back east[tap-in-cave][if worst wave is in curst cave]. A worst wave rushes about, leaving you feeling terrible[end if]."

the worst wave is scenery in Curst Cave. cht of worst wave is leteq. "Whoah! It's not terribly friendly or welcoming. Perhaps you can make it more likable.". [->first fave]

the screaming skull is a thing in Curst Cave. description is "The skull opens and closes its mouth, but the volume of its screaming remains constant.". "A screaming skull bobs up and down here, well, just screaming. It's not threatening, but it's really disruptive.". cht of screaming skull is letminus. [->dreaming dull]

check taking screaming skull: say "You need to 'take' it figuratively." instead;

to say tap-in-cave:
	if tool tap is in Curst Cave, say ". A tool tap sits where the worst wave used to be[if cool cap is not off-stage], but you already got something from it[else], and you haven't gotten anything interesting from it yet[end if]"

the tool tap is boring scenery. "It looks stiff and unresponsive, but with the right word, something will come out. Something must come out of it. But what?". cht of tool tap is leteq. [->cool cap]

bore-text of tool tap is "You can't see any way to operate the tool tap, not even the usual you'd expect for, well, a tap.".

the cool cap is a gaphat. description is "The cool cap looks great[if jerk gel is moot], and boy, it feels great now you glued the other hats to it[else], but it doesn't seem functional, yet[end if]."

first-fave is a truth state that varies.

part Foe Field So Sealed 0,3

Foe Field So Sealed is a room in Piddling Pain. It is north of Soft Sand. printed name is "Foe Field[if pain peasant is in Foe Field] So Sealed[else if shield-shown is true]: Ho, HEALED[end if]". "Passages lead all four directions[if shield-shown is false]. However, the words YO YIELD to the north suggest you'll be blocked if you go that way[end if].". cht of Foe Field So Sealed is partplus. [->show shield]

check going south in Foe Field So Sealed:
	if pain peasant is in Foe Field, say "The pain peasant booms 'Go, gassed foe, fast!'" instead;

check going north in Foe Field So Sealed: if shield-shown is false and pain peasant is moot, say "A booming voice calls 'YO! YIELD!' You need to find a way to protect yourself from it." instead;

chapter showshielding

shield-shown is a truth state that varies.

chapter Pain Peasant

the Pain Peasant is a person in Foe Field. description is "Pretty simple looking, really. But clearly Upset about Stuff enough to push you back out of spite.". "A pain peasant paces back and forth, looking nervously east and west.". cht of pain peasant is letplus. [-> plain pleasant]

check going in Foe Field So Sealed when Pain Peasant is in Foe Field:
	say "The Pain Peasant blocks you, saying 'It is even worse there than in here! Trust me!' Geez, what a pain!" instead; [?? fain pheasant]

part Store All Stage -1,3

Store All Stage is a room in Piddling Pain. It is west of Foe Field. "'All' probably refers more to potential than anything else. Lots could fit here, but [if coral cage is in Store All Stage]there's only a coral cage[else]even the coral cage is gone now[end if].[paragraph break]You can really only go back east.".

the coral cage is scenery in Store All Stage. "It looks locked, and it's too opaque to see who's there. You [if cage key is off-stage]have no way of opening it[else]could use the cage key on it, but you probably need to figure out who or what is inside[end if].". cht of coral cage is leteq. [-> moral mage]

[does the player mean unlocking the coral cage with: it is very likely.]
does the player mean unlocking the coral cage with the cage key: it is very likely.
does the player mean unlocking the cage key with: it is very unlikely.
[does the player mean unlocking with the coral cage: it is unlikely.]

check taking coral cage: say "It's too heavy, but you can unlock it." instead;

check unlocking coral cage with: try opening coral cage instead;

section Here Hip Queer Quip

Here Hip Queer Quip is a proper-named thing. description is "It contains summaries of the Moral Mage's lecture."

part Pit Pound 1,3

Pit Pound is east of Foe Field. It is in Piddling Pain. cht of Pit Pound is leteq. printed name of Pit Pound is "[if found-fit is false]Pit Pound[else]Grit Ground[end if]". description of Pit Pound is "[if found-fit is false]You feel like you don't belong here, yet[else]You finally feel comfortable here[end if]. [if blaze-ways is false]There's a blaze to the east that may be trickier to visit, though[else if stuck stair is moot]There's not much left east[else]Why, you could even deal with the maze to the east[end if]. You can also go back west." [->fit found]

A Hit Hound is a person in Pit Pound. cht of Hit Hound is leteq. "A hit hound paces menacingly back and forth here.". description is "The Hit Hound seems attuned to your slightest moves. It doesn't strike, but it certainly leaves you fidgeting!". talk-text is "Yowl. Yip. Growl. Grip?". [->sit sound]

check going east in Pit Pound:
	if hit hound is in pit pound, say "Not with the hit hound guarding you, you aren't." instead;
	if found-fit is false, say "It's weird. You don't feel like you belong in the pit pound enough to go further east beyond it. Maybe you need a little more mental preparation, more than just to sit sound." instead;

found-fit is a truth state that varies.

part Blinding Blaze 2,3

Blinding Blaze is east of Pit Pound. It is in Piddling Pain. cht of Blinding Blaze is letminus. printed name of Blinding Blaze is "[if stuck stair is moot]Grinding Grays[else if blaze-ways is true]Winding Ways[else]Blinding Blaze[end if]". description is "[if blaze-ways is false]This is such a terrible blaze. Unless you can make it into something else, you can only go back west[else if maze-mapped is false]There's a maze to the south and east. You'll want to plan out fully how to deal with it. It feels like you'll need something to lighten the mood of brute-forcing through[else if stuck stair is touchable]A stuck stair leads down, but to where?[else]You've probably dealt with everything you can, here.[end if] [if blaze-ways is true][can-nothing] can also just go back west[end if].". noway-text is "[blazno]." [-> minding maze]

to say can-nothing: say "[if snuck snare is off-stage]You can also[else]Nothing to do except[end if]"

to say blazno:
	if blaze-ways is false:
		say "You can't see any way other than back west";
	else if stuck stair is off-stage:
		say "You explore the minding maze a bit, but you get frustrated quickly. You need some emotional support, support from inside you and not related to this location, to negate the drudgery of working through all the dead ends and to make it through smoothly and happily";
	else:
		say "You found a way through the maze[if stuck stair is not moot], but you now need to figure how to operate the stuck stair[end if]. No directions except exiting back west were, or are, needed";

blaze-ways is a truth state that varies.

maze-mapped is a truth state that varies.

check going down in Blinding Blaze when stuck stair is in blinding blaze: say "It's not that easy. The stair's stuck. Maybe if you knew where to go or what you wanted to do, it'd be easier." instead;

chapter minding maze

the minding maze is fakeenter scenery. "The minding maze looks complicated. Perhaps you could find a way to make exploring it a little more whimsical. Some art, or something. Or a variation on said art."

check entering minding maze: try going east instead;

chapter stuck stair

the stuck stair is fakeenter scenery. "It looks like you may have to figure where the stair might go to use it.". cht of stuck stair is letminus. [-> luck lair]

chapter snuck snare

a snuck snare is a thing. description is "You feel lucky enough that you'll know where to put the snuck snare when the time is right.";

[?? burned bower/turned tower]

volume Vale Verminous

part Gassed Gap 0,4

Gassed Gap is a room in Vale Verminous. "[if Reeker Russell is off-stage]It looks like there should be a way to the north, but it's too hazy. You may need to do something to break things up[else]There's a way to the north, now that you cast your cap[end if]. [if evidence-pieces < 3]However, it's still too intimidating[else]You feel confident you can make it through[end if].". cht of Gassed Gap is partminus. [-> cast cap]

Gassed Gap is north of Foe Field. cht of gassed gap is partminus. [-> last lap]

printed name of Gassed Gap is "[if cap-cast is true]Last Lap[else]Gassed Gap[end if]".

cap-cast is a truth state that varies.

gap-go is a truth state that varies.

check going north in Gassed Gap:
	if Reeker Russell is off-stage, say "Oh, it's much too intimidating[if gap-go is true], even though you have a courageous song in your head[end if]. You just fear there's someone blocking your way, someone to summon and defeat." instead;
	if Reeker Russell is in Gassed Gap, say "Not with Reeker Russell around." instead;
	if gap-go is false, say "You whistle in fear. You need some sort of motivation. One last song, maybe" instead;
	unless evidence-pieces is 3, say "You aren't armed with enough evidence to take down the Very Vile Fairy File." instead;
	say "You review the evidence you have and take a deep breath. The backed binder, revealing the worst of the VVFF's ideas. [We Whine] and its examples of how such meanness affects everyday people. The lessons from the Moral Mage. You understand the VVFF. You can resist. You're not going to give up in this last bit.";
	isle-max-score;

to decide what number is bag-point: decide on boolval of whether or not player has big bag;

to isle-max-score:
	now max-poss is isle-score + score + 1 - bag-point + boolval of whether or not rolling-yet is false;

to decide which number is evidence-pieces:
	decide on boolval of sign-seen + boolval of (whether or not player has backed binder) + boolval of (whether or not coral cage is moot);

[?? trusty tap / crusty cap]

extra-cool-cap is a truth state that varies.

chapter Reeker Russell

Reeker Russell is a person. Reeker Russell carries the good gun. "Reeker Russell blocks the way north[if good gun is not moot], and he's armed with a good gun![else].[end if]". talk-text is "'My mood: DIE, dude!'". description of Reeker Russell is "He looks [if meeker-yet is true]meeker than at first[else]pretty strong[end if]. He is also [if good gun is moot]unarmed[else]holding a good gun[end if].". cht of Reeker Russell is partminus. [-> meeker muscle] [-> beaker bustle]

description of good gun is "It's made up of an obviously sleek and superior metal. A lesser material, and it might fall apart and be useless.". cht of good gun is leteq. [->wood one]

to decide which number is russell-progress:
	decide on boolval of meeker-yet + boolval of whether or not good gun is moot;

to check-russell-go:
	say "[line break]";
	if russell-progress is 2:
		say "Ashamed of how effortlessly and nonviolently you disarmed him, Russell flees! 'Cold cad rolled, rad,' you think to yourself.";
		moot Reeker Russell;
		if beaker-yet is false, max-down;
	else:
		say "Russell looks confused! One more setback, and he's had it.";

to adjust-russell:
	if beaker-yet is false and meeker-yet is true:
		phbt reeker russell;
		now reeker russell is not optional;
	else if beaker-yet is false:
		now reeker russell is optional;

beaker-yet is a truth state that varies.

meeker-yet is a truth state that varies.

part Airy Isle 0,5

Airy Isle is north of Gassed Gap. It is in Vale Verminous. "You hear laughter here, but it's all wrong. You could back out to the south, but you sense you must be very close to the Very Vile Fairy File now[if sought sword is in Airy Isle].[paragraph break]A sought sword (I mean, it just LOOKS important) lies unused here. Yet it's not for you[end if].". noway-text is "[if lot lord is touchable]You need to figure how to win a battle, not run away[else]You need to move a bit differently to advance[end if]."

check going south in Airy Isle:
	if climb-clear is true, say "Since you used the CLIMB CLEAR jump command, going south would mess things up." instead;
	if Bot Board is in Airy Isle, say "The Bot Board loses interest as you flee back south.";

for printing a locale paragraph about a person (called per) in Airy Isle:
	now per is mentioned;
	if per is not Bot Board, continue the action;
	say "[one of]A Bot Board stands here, impassive, emotionless, not looking for a fight but looking extremely hard to budge[or]The Bot Board stands here, unrattled[if lot lord is in airy isle or hot horde is in airy isle] despite your having summoned help[end if][stopping].";
	if lot lord is off-stage and hot horde is off-stage, continue the action;
	say "[line break]";
	if Lot Lord is off-stage:
		say "A Hot Horde rambles around aimlessly here. Maybe they could take down the Bot Board, but they need discipline and leadership and order.";
	else if Hot Horde is off-stage:
		say "A powerful-looking Lot Lord stands here, pacing around as if waiting for an army to help him out.";
	else:
		say "The Lot Lord and Hot Horde mumble amongst themselves. The right battle cry, and they will be fully jazzed to take down the Bot Board!";

the Bot Board are plural-named people in Airy Isle. talk-text is "'Meep, mate! Heap hate! Weep, wait!'". description is "They stand impassively, likely programmed by the Very Vile Fairy File to strike down anyone with a creative or potentially subversive thought, yet thankfully unable to attack on their own. NOT [']NORED is etched on each of their chests.". cht of Bot Board is leteq. [->got gored] [-> hot horde]

the sought sword is scenery in Airy Isle. "It looks important, much better than a sot sword, shot sword, or swat sword, but it's intimidating. It says PROPERTY OF ... Man, maybe if you figured out who owned it, they might be able to help you.". cht of sought sword is letminus. [-> lot lord]

check taking the sought sword: say "You can't get near it. It must be someone else's. But who?" instead;

the Lot Lord is a person. talk-text is "'Eeg, not ig-nored.' Ugh?". description is "The Lot Lord's authority as a battle leader is unquestionable. Yet he needs [if hot horde is off-stage]followers[else]a battle cry for his followers--he doesn't seem much of a poet[end if].". cht of Lot Lord is partplus. [->got gored]

the Hot Horde are plural-named people. talk-text is "Lots of rot roared right now.". description is "The Hot Horde are all over the place. [if lot lord is off-stage]Even with the Lot Lord's leadership, they need something like a battle cry to unify them fully[else]They need a leader, and you're not tough enough. No offense[end if].". cht of Hot Horde is leteq. [-> got gored]

book go gate

there is a thing called the go gate. it is fakeenter. "A go gate stands here. You can just walk through it ... or can you?". description is "The go gate isn't just one piece. On further inspection, you see a grow grate.". cht of go gate is partplus. [->whoa wait]

check taking go gate: try entering go gate instead.

check entering go gate:
	say "Too fast. Boom! The grow grate pops up and crushes you. 'Lo, late! Foe, fate!' a voice says, and your last thought is, 'Ho, hate!'[paragraph  break]Today is definitely a ... d'oh date.[paragraph break]Maybe you should have expected that. Perhaps you need to be more circumspect.";
	end the story;

the grow grate is part of the go gate. description is "The grow grate looks like it could spring up at any time.". cht of grow grate is partminus. [->whoa wait]

part Tarry Tile 1,5

Tarry Tile is a room in Vale Verminous. "A listless mist-mess surrounds you on all sides. Yup. This is where you're supposed to be.". printed name is "[if merry-mile is true]Merry Mile[else]Tarry Tile[end if]". noway-text of Tarry Tile is "No way through the listless mist mess.". cht of Tarry Tile is leteq. [->merry mile]

section listless mist mess

the listless mist mess is scenery in Tarry Tile. "It's very thick. No way through."

chapter well worn hell horn

the well worn hell horn is a boring thing in Tarry Tile. cht of well worn hell horn is leteq. "A well worn hell horn balefully drones out dirgeful noises that makes you wonder why you should even bother.". description is "The well worn hell horn looks old, but still in good shape. At least with a cursory glance. But maybe there is a flaw.". bore-text of well worn hell horn is "It ... well, it looks used, but it still hasn't fallen apart.".[-> tell torn]

chapter Very Vile Fairy File

the Very Vile Fairy File is a boring thing in Tarry Tile. "The Very Vile Fairy File sort of repels you and attracts you at the same time. You know there must be a way to neutralize it. It is co-written by, unsurprisingly, Harry Hile, Larry Lyle, Perry Pyle and Sherry Shiel[one of]. They must be the Crimes Crew Times Two that Kit Cohen talked about! There's an even number of them, so that part works out[or][stopping]. You may or may not be up to READing it[ever-tried of table of vvff digs].". cht of very vile fairy file is partminus. bore-text of Very Vile Fairy File is "[ff-no].". [-> bury bile]

description of Very Vile Fairy File is "You regard the Very Vile Fairy File nervously. You are pretty sure you have all you need to deal with it, and yet at the same time, you feel as if you must either follow it or be beaten down by its ways, and there is no third way to render it irrelevant and powerless."

to say ever-tried of (t - a table name):
	repeat through table of all randoms:
		if tabnam entry is t and tabidx entry > 0, say " some more"

vvff-row is a number that varies.

instead of doing anything when second noun is Fairy File:
	if action is procedural, continue the action;
	say "[ff-no].";

to say ff-no: say "You can't do anything directly with or to the Fairy File. There must be some overarching action"

merry-mile is a truth state that varies.

chapter burybileing

bile-buried is a truth state that varies.

volume verbs

book standard modifications

chapter giving

check giving it to: say "You never need to give anyone anything in this game." instead;

chapter opening

the can't open unless openable rule is not listed in any rulebook.

check opening:
	if noun is dark door, say "You can't find a way off-hand. It doesn't even seem to have a handle. Perhaps careful observation will turn something up." instead;
	if noun is frightening fridge, say "You're scared to. There must be a better way to get rid of the fridge." instead;
	if noun is coral cage, say "[if player does not have cage key]You have nothing that opens the coral cage[else]The cage key seems to fit, but you feel a sense of dread. Perhaps you should consider WHOM you are releasing before opening the cage[end if]." instead;
	if noun is dining door, say "You'd need a big banquet around before doing that." instead;
	say "You don't need to use OPEN anywhere in this game." instead;

chapter eating

procedural rule while eating something: ignore the carrying requirements rule.

the can't eat unless edible rule is not listed in any rulebook.

check eating:
	if noun is Mind Malt, say "Worthless. It's empty." instead;
	if noun is a gaphat, say "Idioms are neat, but this adventure is about rhyming." instead;
	if noun is wild weed, say "That is not filed feed." instead;
	if noun is full feast, say "Too much for one person. You need to move it somewhere everyone can enjoy it." instead;
	say "You [if full feast is moot]already had a feast. [end if]don't need to eat anything explicitly." instead;

chapter drinking

the block drinking rule is not listed in any rulebook.

check drinking:
	if noun is mild mead, say "It's too much mead for one person. You need to share it, with something to eat." instead;
	if noun is sage sea or noun is worst wave, say "Sea salt? Ee! Alt!" instead;
	say "Drink dry? Sink ... sigh ... [one of] (you don't need to DRINK anything in this game.)[or][line break][stopping]" instead;

chapter wearing

procedural rule while wearing something: ignore the can't wear what's not held rule.

the can't wear what's not clothing rule is not listed in any rulebook.

check wearing:
	if noun is a gaphat, say "Somehow, [the noun] isn't quite right to WEAR around. You will probably reflexively slip it on for the right occasion." instead;
	if noun is gold guard, say "You'll wear it when you need to." instead;
	say "You never need to WEAR anything explicitly in this adventure." instead;

chapter cleaning

the block rubbing rule is not listed in any rulebook.

check rubbing:
	if mean moe's clean clothes is not touchable, say "You aren't by any machine that can clean anything. And you don't need to clean anything directly." instead;
	say "You can just [if can-glean]GLEAN GLOWS[else]riff on [mean moe's][end if] to see if anything in your inventory is cleanable." instead;

chapter singing

the block singing rule is not listed in any rulebook.

sing-clue is a truth state that varies.

check singing:
	if toe tappin is moot, say "You have fond memories of the tunes [Toe] opened to you. It and the others are worth writing down when you get home, when you're not quite as tired of it. But you've done enough." instead;
	if player does not have Toe Tappin, say "Nothing comes to mind. But perhaps the right song, if found, might help you in many ways." instead;
	say "You sing [Toe] for a bit. Catchier than you expected. It may help you [if sing-max is 0]in the future, who knows[else if sing-max < 3]more[else]a bit more[end if]." instead;

chapter savesonging

savesonging is an action applying to nothing.

understand the command "save song" as something new.

understand "save song" as savesonging when toe tappin is enclosed by the player.

carry out savesonging:
	say "[Toe] is [if sing-clue is true]already[else]now back[end if] in your head." instead;
	now sing-clue is true;

chapter ravewronging

ravewronging is an action applying to nothing.

understand the command "rave wrong" as something new.

understand "rave wrong" as ravewronging.

carry out ravewronging:
	say "[Toe] is [if sing-clue is false]already[else]now back[end if] out of your head.";
	now sing-clue is false;

every turn when sing-clue is true:
	if song-clue, say "[Toe] bounces around in your head a bit.";

to decide whether song-clue:
	if player is in violent vale and boring boat is in violent vale and nap-no is false, yes; [now cht of toe tappin is partminus] [->no nappin]
	if player is in gassed gap and gap-go is false, yes; [now cht of toe tappin is partminus] [now cht of toe tappin is partminus] [->go gappin]
	if jake g is touchable and jake-fee is true and jake-cocapn is false, yes; [now cht of toe tappin is letminus] [->co capn]
	if maze-mapped is false and player is in blinding blaze and blaze-ways is true, yes; [now cht of toe tappin is partminus] [->mo mappin]
	if player is in whining war and war-sapped is false, yes; [now cht of toe tappin is partminus] [->so sappin]
	no;

sing-clues is a number that varies.
sing-max is a number that varies. sing-max is 5.

this is the check-sing-max rule:
	increment sing-clues;
	if sing-clues is sing-max:
		say "[line break]Suddenly, [Toe] feels played out. You'll enjoy it later, but not now. It's done its job, and it's out of your mind, for the moment.";
		if hap-ho is false, max-down; [can't HO HAPPEN]
		moot Toe Tappin Row Rappin;
	else:
		say "[line break]You feel clever now, and you bet you could do [one of][or]even [or]yet [or]still [stopping]more with [Toe] when the time is right."

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
		say "You're juggling too much! Maybe something you're carrying can be repurposed. Something you've found useless so far.";
		the rule succeeds;

chapter sleeping

the block sleeping rule is not listed in any rulebook.

check sleeping: say "Lie late, my mate? Why wait?" instead;

chapter waiting

check waiting: say "[one of]Hi ho! Lie low[or]Woo! Will stew, still[cycling]." instead;

chapter talking

talktoing is an action applying to one thing.

understand the command "talk to" as something new.
understand the command "talk" as something new.
understand the command "t" as something new.

understand "talk to [something]" as talktoing.
understand "talk [something]" as talktoing.
understand "t [something]" as talktoing.

does the player mean talktoing a person: it is very likely.

check talktoing:
	if noun is not a person, say "You can only talk to living things, and [the noun] doesn't qualify." instead;
	if talk-text of noun is empty, say "BUG: there should be text, but there isn't." instead;
	say "[talk-text of noun][line break]" instead;

chapter inventory

after printing the name of We Whine while taking inventory: if sign-seen is true, say " (in which you can SEE SIGN)"

to decide which number is my-hats: decide on number of gaphats carried by player;

definition: a thing (called th) is evidencey:
  if th is Here Hip Queer Quip, yes;
  if th is We Whine and sign-seen is true, yes;
  if th is backed binder, yes;

check taking inventory:
	if player has big bag, say "Boy! You can carry all you need with your big bag![paragraph break]";
	now all things enclosed by the player are marked for listing;
	now toe tappin is unmarked for listing;
	now lurking lump is unmarked for listing;
	now all gaphats are unmarked for listing;
	now all evidencey things are unmarked for listing;
	now big bag is unmarked for listing;
	say "Stuff stole (rough role):[line break]";
	list the contents of the player, with newlines, indented, including contents, giving inventory information, with extra indentation, listing marked items only;
	if player has toe tappin, say "[Toe], that catchy song, is [if sing-clue is false]out of your head, but you can bring it back with [b]SAVE SONG[r][else]in your head. It has ... possibilities. [toe-poss][end if].";
	show-evidence-and-hats;
	if player has lurking lump, say "You also have a lurking lump that will help make a jerking jump if you are stuck. It has [lump-charges in words] charge[plur of lump-charges] left.";
	if lurking lump is moot, say "The lurking lump disappeared when you used it, but maybe with more good guesses, it will come back.";
	check-injury;
	the rule succeeds;

to show-evidence-and-hats:
	if my-hats > 0:
		if jerk gel is moot:
			say "You also have the extra cool cap you constructed.";
		else:
			say "You are also carrying a [if my-hats < 3]budding[else]complete[end if] hat collection: [the list of gaphats carried by player].";
	if evidence-pieces > 0, say "[line break]You also have evidence[if evidence-pieces < 3], but not enough yet,[end if] of the Crimes Crew Times Two's misdeeds: [the list of carried evidencey things].";

to check-injury: if least-loss is true and healed-here is false, say "[line break]You're injured and should do something about that before re-facing the Bull Beast.";

to decide which number is toe-clued:
	let temp be 0;
	if tried-yet of "SO SAPPIN", increment temp;
	if tried-yet of "CO CAPN", increment temp;
	if tried-yet of "GO GAPPIN", increment temp;
	if tried-yet of "MO MAPPIN", increment temp;
	decide on temp;

to say toe-poss:
	say "[if sing-clues is 0]The title just seems so fungible[else if sing-clues is 1]Yes, beyond what you found to start[else if sing-clues is 2]Even more than what you've seen[else if sing-clues is 4]Well, maybe just one more[end if][if toe-clued > 0]. You also found a riff you weren't ready for yet[end if]"

to decide which number is carried-fungible:
	let temp be number of things enclosed by player;
	if the player carries Toe Tappin Row Rappin, decrement temp;
	decide on temp;

check taking when player does not have big bag (this is the need bag for lots of items rule):
	if carried-fungible > 3:
		say "You can't carry so much at once! Maybe you can finagle, or create, a container that'll let you hold as much as you want." instead;

the need bag for lots of items rule is listed last in the check taking rulebook.

chapter undoing

before undoing an action:
	showme save undo state;
	if save undo state is false:
		say "You hear a voice booming 'Take two? Fake, foo[']!'[paragraph break]The lurking lump still [if lurking lump is moot]rematerializes[else]grows bigger[end if], though. Hopefully your time-bending and potential double-dipping didn't make it radioactive or something.";
		enable saving of undo state;
	else:
		say "Wiping one's typing ... TONS!";
	the rule succeeds;

chapter trivial pointless but amusing verbs

the block attacking rule is not listed in any rulebook.

check attacking:
	if noun is go gate, say "Ho! Hate!" instead;
	if noun is Reeker Russell, say "But he'd become Rager Russell. With major muscle." instead;
	if noun is Bot Board, say "The bot board intones 'Pif-paf? Riff-raff!' That's about as close to a joke as they'll get." instead;
	if noun is Bull Beast or noun is Beer Bull, say "You'd get a triple-tough cripple-cuff in return. You must fight with words." instead;
	say "[if noun is a person]Gauge gore: wage war! Rage! Roar[else]Very vandal-ous? Scary! Scandalous[end if]! [one of](NOTE: you don't need to attack anything. Well, not with the ATTACK command.)[or][line break][stopping]"

the block saying no rule is not listed in any rulebook.

check saying no: say "No-no? Hoho, dodo! [yn-tell]" instead;

the block saying yes rule is not listed in any rulebook.

check saying yes: say "Yay! Yep! Hey, hep! [yn-tell]" instead;

to say yn-tell: say "[one of](you never need to answer yes/no questions unless specifically prompted.)[or][stopping][paragraph break]"

the block swearing obscenely rule is not listed in any rulebook.

check swearing obscenely: say "[one of]Dang, dude rang RUDE![or]Gee, gad! Be bad! 'Me, mad!'[in random order]" instead;

the block swearing mildly rule is not listed in any rulebook.

check swearing mildly: try swearing obscenely instead;

chapter smelling

the block smelling rule is not listed in any rulebook.

check smelling:
	if noun is Reeker Russell, say "Stench-stained, drench-drained." instead;
	if noun is Gassed Gap, try smelling Reeker Russell instead;
	say "[one of]'Scent so went. Whoah!'[paragraph break][or][stopping]You don't need to SMELL anything." instead;

chapter listening

the block listening rule is not listed in any rulebook.

check listening:
	if player is in Wet Wood, say "'Bet, bud! Met mud!' That sounds a bit off, but ... perhaps it can help you in some odd way beyond just going in random directions." instead;
	if player is in whining war, say "[if war-sapped is false]Boy! The whining is pretty intense and constant! You don't see how you could change the whining by itself. Maybe some artiness might help, here[else]It's quieted down now. You can think and plan more things to do[end if]." instead;
	if player is in History Hall and mistmall is true:
		if Toe is in History Hall, try examining Toe Tappin instead;
		if Oi Mo is in History Hall, say "Tim T. Sims, Pimp, still 'sings' [i]Oi, Mo[r]. The chorus mentions double duty, which, eww. Maybe there's a way to quiet it down." instead;
		say "A random song plays briefly: [next-rand-txt of table of mall songs]." instead;
	if player is in Lake Lap and jake-map is true, say "The hissing noise continues." instead;
	say "You hear nothing worth focusing on." instead;

chapter thinking

ever-thought is a truth state that varies.

the block thinking rule is not listed in any rulebook.

to read-laters (ts - a truth state):
	let thought-any be false;
	repeat through table of forlaters:
		if ready-to-hint entry is true:
			if is-done entry is true:
				if debug-state is true, say "(DEBUG NOTE) Somehow the [cmd-to-say entry] is-done entry didn't get wiped out after the score adjustments.";
				now ready-to-hint entry is false;
				next; [ this may duplicate code from the score and thinking changes rules but I'm still a bit nervous about it at the moment. This shuts the door 100%. ]
			process the can-do-now entry; [?? surround with vc-dont-print being true then false ??]
			let Q be whether or not the rule succeeded;
			if Q is not ts, next;
			if thought-any is false, say "[line break]";
			if the rule succeeded, say "([b]CAN DO NOW[r]) ";
			now thought-any is true;
			say "[think-advice entry][line break]";

to check-flip-verbs:
	if player is in soft sand and ever-loft is true, say "[line break]You can switch between LOFT LAND and SOFT SAND freely.";
	if player is in history hall and ever-mall is true, say "[line break]You can switch between MYSTERY MALL and HISTORY HALL freely.";

check thinking:
	say "Here's general information you know from your experience so far: [rhyme-display][line break]You think about more specific challenges you've encountered and not solved, and what you've done and tried, and what you can do.";
	if all-hinted is 0:
		say "[line break]But you don't have leads for any puzzles right now." instead;
	now vc-dont-print is true;
	check-flip-verbs;
	read-laters true;
	read-laters false;
	if ever-thought is false:
		now ever-thought is true;
		say "[line break][b]NOTE[r]: The game will indicate when one command you found early will be applicable. An asterisk or (+) will also appear in the score in the upper right. Until then, you can [b]THINK[r] to see things you figured but aren't quite ready to do yet.";
	if boat-reject is true and nap-no is true and lake lea is unvisited, say "[line break]You also feel up to going back to the boring boat.";
	if number of optional-noted things > 0:
		say "You also know several things that are optional to figure out: [list of optional-noted things].";
	check-injury;
	now vc-dont-print is false;
	the rule succeeds;

to decide whether tried-yet of (ct - text):
	let tried-any be false;
	repeat through table of forlaters:
		if ct is cmd-to-say entry:
			now tried-any is true;
			if ready-to-hint entry is true:
				process the can-do-now entry;
				if the rule succeeded, decide yes;
	if tried-any is false, say "I tried to check if [ct] was hinted in the THINK command but it wasn't in the help table[not-crit-but].";
	decide no;

to clue-later (ct - text):
	if vc-dont-print is true, continue the action;
	repeat through table of forlaters:
		if ct is cmd-to-say entry:
			if debug-state is true and ready-to-hint entry is true, say "(DEBUG re-checking)[line break]";
			if ready-to-hint entry is false, now think-clue-flag is true;
			now ready-to-hint entry is true;
			continue the action;
	now think-clue-flag is true;
	say "Oops. I tried to save [ct] in the THINK command for later, but failed[not-crit-but].";

to clue-zap (ct - text):
	repeat through table of forlaters:
		if ct is cmd-to-say entry:
			now ready-to-hint entry is false;
			continue the action;
	say "Oops, I tried to de-hint [ct] in the THINK command for later but failed[not-crit-but].";

to say not-crit-but: say ". This is not a critical bug, but I'd like to know about it"

think-clue-flag is a truth state that varies.

every turn when think-clue-flag is true (this is the note right guess wrong time rule):
	say "[line break][one of][b]NOTE[r]: this command will be useful later, but you aren't ready to use it, yet. You can track commands like this by typing [b]THINK[r], which will also clue you if they now work.[or](useful command again saved to [b]THINK[r] for later reference.)[stopping]";
	now think-clue-flag is false;
	continue the action;

chapter score

to say it-they of (n - a number): say "[if n is 1]it[else]they[end if]";

check requesting the score:
	now vc-dont-print is true;
	say "You have scored a total of [score] out of [maximum score] points and need [min-needed] to win. You have found [cur-bonus] of [max-bonus] optional points so far.";
	say "[line break]Your current[one of] (utterly meaningless but hopefully amusing)[or][stopping] rank is [your-rank].[paragraph break]";
	show-evidence-and-hats;
	let dh be doable-hinted;
	let fh be future-hinted;
	if dh + fh > 0:
		say "You also have [dh + fh in words] task[plur of dh + fh] you performed when you weren't quite ready, and [if dh is 0][it-they of fh] still need[plurnos of fh] to wait[else if fh is 0][dh in words] can be done now[else][dh in words] can be done now, but [fh in words] can't, yet[end if]. You can see more detailed information with THINK.";
	else:
		say "There are no tasks you have figured out but weren't quite ready.";
	if lurking lump is not off-stage:
		let gguess be next-lump-level - lump-count;
		say "[line break]You have also used the lurking lump [lump-uses] time[plur of lump-uses] and are [gguess] of [next-lump-level] good-guess rhymes away from it re[if lurking lump is moot]turn[else]charg[end if]ing.";
	now vc-dont-print is false;
	the rule succeeds;

the score and thinking changes rule is listed after the notify score changes rule in the turn sequence rulebook.

this is the score and thinking changes rule:
	repeat through table of forlaters:
		if ready-to-hint entry is true:
			if is-done entry is true, now ready-to-hint entry is false;

to decide which number is doable-hinted:
	let temp be 0;
	now vc-dont-print is true;
	repeat through the table of forlaters:
		if ready-to-hint entry is true:
			process the can-do-now entry;
			if the rule succeeded:
				if is-done entry is false, increment temp;
	now vc-dont-print is false;
	decide on temp;

to decide which number is future-hinted:
	let temp be 0;
	now vc-dont-print is true;
	repeat through the table of forlaters:
		if ready-to-hint entry is true:
			process the can-do-now entry;
			unless the rule succeeded, increment temp;
	now vc-dont-print is false;
	decide on temp;

to decide which number is all-hinted: decide on doable-hinted + future-hinted;

[see header file for table of ranks]

book nonstandard but general verbs

chapter reading

reading is an action applying to one thing.

understand the command "r" as something new.
understand the command "read" as something new.

understand "r [thing]" as reading.
understand "read [thing]" as reading.

definition: a thing (called th) is readable:
	if th is Very Vile Fairy File, yes;
	if th is leet learner, yes;
	no;

read-exam-note is a truth state that varies.

carry out reading:
	if noun is evidencey, say "Yes, [the noun]'s details are important, but you've gotten enough." instead;
	repeat through table of readables:
		if read-thing entry is noun, say "[read-txt entry][line break]" instead;
	if read-exam-note is false, say "NOTE: READ and X/EXAMINE are functionally equivalent for most items. Items you can [b]READ[r] usually say so when you examine them.";
	now read-exam-note is true;
	try examining the noun instead;

table of readables
read-thing	read-txt
Very Vile Fairy File	"The file contains advice and catch-phrases to seem like an alpha male or whatever. One is [i][next-rand-txt of table of vvff digs][r]"
leet learner	"Some text matches up with where the needle nose might spin. It's a bit of a stretch, in some cases, but you figure the more help the better.[paragraph break][table-of-needle-hints][run paragraph on]"
marred mat	"SCARRED? SCAT.[paragraph break]Hmm. Not very welcoming. In another form, it might repel other things more usefully."
paper pile	"It's too disorganized to read any details. You do notice FACT FINDER is stamped on pretty much every single page, though."

to say table-of-needle-hints: [puncok]
	repeat through table of color clues:
		say "[fixed letter spacing][my-text entry][variable letter spacing] is written to the [my-color entry].";
	say "[line break]Also, TREAT TURNER is plastered across the bottom in wavy font. Maybe if you know what everything else stands for, you can figure that, too."

table of color clues
my-text	my-color
"CONCEIT CONCERNER"	"left"
"  CHEAT CHURNER  "	"center-left"
"   MEET MOURNER  "	"center"
"   BEAT BURNER   "	"center-right"
"    EAT EARNER   "	"right"

chapter xyzzying

xyzzying is an action out of world.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

carry out xyzzying:
	say "Fie, fie. Sigh, sigh. Why, why?";
	the rule succeeds.

chapter helphowing

help-how is a truth state that varies. help-how is true.

helphowing is an action out of world.

understand the command "help how" as something new.

understand "help how" as helphowing.

carry out helphowing:
	if help-how is true, say "Help-how is already on." instead;
	now help-how is true;
	say "Help-how is on. Welp-wow mode is off. In other words, more hints now." instead;
	the rule succeeds.

chapter welpwowing

welpwowing is an action out of world.

understand the command "welp wow" as something new.

understand "welp wow" as welpwowing.

carry out welpwowing:
	if help-how is false, say "Help-how is already off." instead;
	now help-how is false;
	say "Help-how is off. Welp-wow mode is on. In other words, fewer hints now." instead;
	the rule succeeds.

chapter verbsing

verbsing is an action out of world.

understand the command "v" as something new.
understand the command "verb" as something new.
understand the command "verbs" as something new.

understand "v" as verbsing.
understand "verb" as verbsing.
understand "verbs" as verbsing.

carry out verbsing:
	say "[one of]NOTE: More obscure verbs from old-school parser games have been disabled, to help you focus on the puzzles.[paragraph break][or][stopping]";
	say "[2da]You can use the general directions, but you often have to figure out what to do, here. It's a guess the verb situation, but not really. The verb should never involve proper names, though clever or sensible guesses may help you gain a hint/spoiler item.";
	say "[2da][b]HELP HOW[r] and [b]WELP WOW[r] toggle the [b]HINT[r] command on and off, respectively. Currently they are [on-off of help-how]. [b]HINT[r] with no object tells you if you need to do anything with the room, while [b]HINT[r] (object) looks at specific objects.";
	say "[2da][b]ABOUT[r] and [b]CREDITS[r] give general information.";
	say "[2da]The Leet Learner can help you determine what needs to be changed. [ll] or [b]CC[r] is the shorthand for scanning a location, and [ll] or [b]CC[r] (any thing) scans it.";
	say "[2da][llon-cmd] turn the Leet Learner on while [lloff-cmd] turn it off. Currently it is [off-on of shut-scan]. You can also use it to see or hide if you're half-right with [b]HA HALF[r]/[b]NAH NAFF[r].";
	if player has Toe Tappin, say "[2da]You can also [b]SAVE SONG[r] or [b]RAVE WRONG[r] to toggle hints whether [Toe] could help you, or [b]LL TOE[r] for further hints.";
	check-flip-verbs;
	if lurking lump is not off-stage, say "[2da]You can [jjj] to use the Lurking Lump spoiler item[if lurking lump is moot] once you get it back[end if].";
	say "[2da][b]EXITS[r] lists exits available.";
	if core-score > 1, say "[2da]You can also see a list of [b]SOUND(S)[r] if you want to brute-force things.";
	the rule succeeds.

to say jjj: say "[b]JJ[r] or [r]JERKING JUMP[r]"

chapter soundsing

soundsing is an action applying to nothing.

understand the command "sounds" as something new.
understand the command "sound" as something new.

understand "sounds" and "sound" as soundsing.

carry out soundsing:
	say "The basic sounds in the English language are:[paragraph break]";
	say "one letter: b k d f g h j l m n p r s t v w x z (c q and x map to others.)";
	say "two letters: ur ar or bl br cl cr dr fl fr gl gr pl pr sk sl sp st sw spr str tr.";
	say "rarer two letters: ch so th (thing or this) wh ng nk oi ow oo (took) aw zh (vision.)";
	the rule succeeds.

chapter creditsing

creditsing is an action out of world.

understand the command "credits" as something new.

understand "credits" as creditsing.

carry out creditsing:
	say "First, thanks to Wade Clarke, dgtziea, Arthur DiBianca, Juhana Leinonen, Anssi Räisänen, Jack Welch and Ingrid Wolf for testing. Their requests, observations, clever tries and plowing on in the face of some pretty obvious bugs helped push me to do things I didn't consider or put off--in particular, many ways of hinting. Testers always see things I would not have, and though sometimes it means extra work, well--my bugs caused them extra work, and it's quite absorbing and rewarding and helps me grow as a programmer and game designer. It's an adventure of its own. If there still are bugs, well, that's on me, and I'd like to know.";
	say "[line break]Thanks to Arclight_Dynamo and Matt Weiner for finding and reporting in-comp bugs that, uh, revealed other bugs, too.";
	say "[line break]Thanks to GitHub for hosting private repositories that helped keep VVFF hidden and let me organize it fully. I'm also a fan of bitbucket, but GitHub's daily commit tracker helps so much with big and small goals.";
	say "[line break]Thanks to the IFComp crew past and present for giving me motivation to write all kinds of odd things.";
	say "[line break]Thanks to https://www.thoughtco.com/sounds-in-english-language-3111166 for giving me a list of sounds to cycle through.";
	say "[line break]You can get in the testing credits too if you find a bug or a worthwhile game-related rhyme command. I suspect I've missed some.";
	the rule succeeds;

chapter abouting

abouting is an action out of world.

understand the command "about" as something new.

understand "about" as abouting.

carry out abouting:
	say "Very Vile Fairy File came about after I noticed alliterative rhymes and thought, neat, how many are there? As someone who pokes around with spoonerisms, I was looking for a variant, and I think I found it after unintentionally scrambling 'Very Fine Fairy Vine.' No progress without deviation, as Frank Zappa said.[paragraph break]It seemed like VVFF would, at first, make a nice short EctoComp game at first until I dug deeper. I don't know when I first had the idea, but once I had the name, things picked up. My daily notes suggest it started gaining momentum in June of 2018.[paragraph break]I wanted a reasonably intuitive game mechanic that still made use of the parser, though I recognize the spelling for some of the commands may be tricky. I hope the alliterative rhymes are interesting and amusing.[paragraph break][b]OTHERS[r] will list games that used this concept first. But I hope this is something new and does not abuse the concept. Well, not TOO much.";
	say "[line break]VVFF is overall meant to be family friendly, although there is one bonus point for using a minor pejorative, and if you deliberately look for crude non-solutions, some are implemented. VVFF is also meant to be polite on the Zarfian cruelty scale.[paragraph break]If you find a good try I didn't implement, let me know. I may put you in the [b]CREDITS[r], which gives information on people who helped with the game.";
	the rule succeeds;

chapter othersing

othersing is an action applying to nothing.

understand the command "others" as something new.
understand the command "other" as something new.

understand "other" as othersing.
understand "others" as othersing.

carry out othersing:
	say "VVFF is not the first parser game to deal with rhymes. If you like the idea, you may wish to check out the following games: Michael Martin's [i]EXTERMINATE![r] (SpeedIF 2008) and DCBSupafly's [i]Beythilda the Witch Queen[r] (2011 EctoComp) were both SpeedIF. Joey Jones's [i]Danse Nocturne[r] (as Eggerich von Eggermond) as part of Taleslinger's New Year's competitions offered more of a narrative.";
	the rule succeeds.

book hinting

the leet learner is a thing. description is "It says [b]LEET LEARNER/CHEAT CHURNER[r]. You can probably [b]READ[r] it more in depth, because, well, there's more.[paragraph break]It has two main settings: [b]HUT! CAN![r] (on) and [b]SHUT SCAN[r] (off). It's currently [off-on of shut-scan]. [ll]/[b]CC ON[r]/[b]OFF[r] can turn it on or off.[paragraph break]Also, to use it, [ll] (something). [ll] with no argument scans the current location.[paragraph break]It also has a toggle between [b]HA HALF[r] (on) and [b]NAH NAFF[r] (off) to note when you are half right. It's currently [on-off of ha-half]."

the needle is part of the leet learner. it is boring. description is "The needle will move (or not) whenever you SCAN something.". bore-text of needle is "You can't really operate the needle, and you don't need to.".

understand "cheat/churner" and "cheat churner" as leet learner.

after printing the name of leet learner while taking inventory: say " ([off-on of shut-scan])";

understand "ll" and "cc" as leet learner.

ha-half is a truth state that varies.

to say will-wont of (ts - a truth state):
	say "[if ts is true]will[else]won't[end if]"

chapter ha half button

the ha half nah naff button is part of the leet learner. description is "It is set [on-off of ha-half], meaning if you get a guess half-right, the Leet Learner [will-wont of ha-half] alert you."

chapter halfing

halfing is an action applying to nothing.

understand the command "ha half" as something new.

understand "ha half" as halfing.
understand "half" as halfing.
understand "hh" as halfing.

carry out halfing:
	say "[if ha-half is true]The Leet Learner is already set[else]You set the Leet Learner[end if] to Ha Half.";
	now ha-half is true;
	the rule succeeds.

chapter nahnaffing

nahnaffing is an action applying to nothing.

understand the command "nah naff" as something new.

understand "nah naff" as nahnaffing.
understand "naff" as nahnaffing.
understand "nn" as nahnaffing.

carry out nahnaffing:
	say "[if ha-half is false]The Leet Learner is already set[else]You set the Leet Learner[end if] to Nah Naff.";
	now ha-half is false;
	the rule succeeds.

chapter lling

lling is an action applying to one thing.

understand the command "cc" as something new.
understand the command "ll" as something new.
understand the command "scan" as something new.

understand "cc [thing]" as lling when player has leet learner.
understand "ll [thing]" as lling when player has leet learner.
understand "scan [thing]" as lling when player has leet learner.
understand "cc" as lling when player has leet learner.
understand "ll" as lling when player has leet learner.
understand "scan" as lling when player has leet learner.

rule for supplying a missing noun when lling:
	if cht of the player is not phbt:
		say "You are so focused inward, you just point the learner at yourself.";
		now the noun is the player;
	else:
		say "You wave the leet learner all around [location of player]...";
		now the noun is the location of the player;
	continue the action;

ever-opt-scan is a truth state that varies.

to say ll-cheat of (rm - a room): say "[scancol of cht of rm]"

to say ll-cheat of (th - a thing):
	if th is Toe and Jake G is touchable and jake-fee is true and jake-cocapn is false:
		say "[scancol of partminus]";
	else:
		say "[scancol of cht of th]"

carry out lling:
	if player does not have the leet learner, say "Regular hints aren't available." instead; [this should not happen]
	if noun is leet learner, say "The leet learner is great as it is. You don't want to change it." instead;
	if noun is Here Hull:
		say "Only the beer bull picks anything up.";
		try lling beer bull instead;
	if noun is Store All Stage and coral cage is not moot:
		say "Only the coral cage picks anything up.[paragraph break]";
		try lling coral cage instead;
	if noun is ceiling seer:
		say "You don't know where the ceiling seer is, exactly, so you just scan the whole [location of the player].";
		try lling location of player instead;
	if cht of noun is phbt, say "The needle area of the leet learner stays dark when you scan [the noun][if noun is a room], so there's nothing you need to do with the room title[end if]." instead;
	say "The leet learner needle lights up[if noun is optional], but dimly[end if]. Then it [ll-cheat of noun] as you [if noun is a room]wave it around[else]focus it on [the noun][end if].[if zap-weird-break is true][run paragraph on][end if]";
	if noun is optional and ever-opt-scan is false:
		say "[line break]The faint light must mean something. The learner is usually lit solidly or not at all.";
		now ever-opt-scan is true;
	the rule succeeds.

report lling:
	if noun is We Whine and sign-seen is false, say "[line break]Well, it's alternately in the center and waving around, actually.";

ever-leet-clue is a truth state that varies.

to say leetclue of (x - a cheattype):
	if shut-scan is true, continue the action;
	say "[line break]As you say/think this, the Leet Learner needle [scancol of x]";
	if fun fen is visited and ever-leet-clue is true, continue the action;
	now ever-leet-clue is true;
	if leetcool is 0:
		say ". Once you figure out what to do, you may wish to remember how the words you saw or read combined with the Leet Learner reading";
		now leetcool is a random number between 3 and 6;
	else:
		decrement leetcool;

leetcool is a number that varies. leetcool is 0.

to say scancol of (x - a cheattype): say "[if x is letplus]swerves left[else if x is partplus]slides center-left[else if x is leteq]stays at the center[else if x is partminus]slides center-right[else if x is letminus]swerves right[else if x is letboth]bounces back and forth[else if x is phbt]sits in the center[else]BUG[end if]"

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
understand the command "help" as something new.
understand the command "hints" as something new.

understand "hint" as hinting.
understand "help" as hinting.
understand "hints" as hinting.

to say sorry-bull: say ". Sorry. But you can try as often as you need"

carry out hinting:
	abide by the welp-wow-check rule;
	if in-bull-chase is true:
		if player does not have snuck snare, say "You don't have what you need to neutralize the beer bull yet[sorry-bull]." instead;
		if dives ditch is unvisited, say "You haven't found the place to take the beer bull too, yet. Sorry. But you can try as often as you need[sorry-bull].";
		if snuck snare is not moot, say "[one of]You won't have time to place the snuck snare AND sucker the bull beast this chase, but you will be able to place the snare. HINT again to see where to put the snare[or]You will automatically put the snare in [dives ditch] once you get there[if kni-ni is false], though you need to change the name, first[end if][stopping]." instead;
		say "You need to lure the beer bull to [dives ditch] now you've placed the snare." instead;
	process room-hint-rule of location of player;
	if the rule failed, say "There doesn't seem to be anything more to do with [location of player] in general, but you can still hint specific things in [location of player] with HINT (object).";
	the rule succeeds.

section auxiliary functions

to decide which number is buggin-score:
	decide on (boolval of mean-mugged) + (boolval of lean-lugged);

to decide whether should-mug-first:
	if mean-mugged is true, no;
	if mugged-first is true, yes;
	no;

section hint room rule definitions

a room has a rule called room-hint-rule. room-hint-rule of a room is usually trivially false rule. [postalf]

room-hint-rule of Airy Isle is airy-isle-hint rule.
room-hint-rule of Been Buggin' is been-buggin-hint rule.
room-hint-rule of Blinding Blaze is blinding-blaze-hint rule.
room-hint-rule of Creased Cross is creased-cross-hint rule.
room-hint-rule of Curst Cave is curst-cave-hint rule.
room-hint-rule of Dives Ditch is dives-ditch-hint rule.
room-hint-rule of Fight Funnel is fight-funnel-hint rule.
room-hint-rule of Foe Field is foe-field-so-sealed-hint rule.
room-hint-rule of Fun Fen is fun-fen-hint rule.
room-hint-rule of Gassed Gap is gassed-gap-hint rule.
room-hint-rule of Got Gear Hot Here is got-gear-hot-here-hint rule.
room-hint-rule of Here Hull is here-hull-hint rule.
room-hint-rule of History Hall is history-hall-hint rule.
room-hint-rule of Lake Lap is lake-lap-hint rule.
room-hint-rule of Lake Lea is lake-lea-hint rule.
room-hint-rule of Pit Pound is pit-pound-hint rule.
room-hint-rule of Po' Pit is po-pit-hint rule.
room-hint-rule of Real Rear is real-rear-hint rule.
room-hint-rule of Rift River is rift-river-hint rule.
room-hint-rule of Shirk Shell is shirk-shell-hint rule.
room-hint-rule of Soft Sand is soft-sand-hint rule.
room-hint-rule of Stark Store is stark-store-hint rule.
room-hint-rule of Store All Stage is store-all-stage-hint rule.
room-hint-rule of Tarry Tile is tarry-tile-hint rule.
room-hint-rule of Trim Tram is trim-tram-hint rule.
room-hint-rule of Vending Vibe is vending-vibe-hint rule.
room-hint-rule of Vined Vault is vined-vault-hint rule.
room-hint-rule of Violent Vale is violent-vale-hint rule.
room-hint-rule of Wet Wood is wet-wood-hint rule.
room-hint-rule of Whining War is whining-war-hint rule.
room-hint-rule of Y'Old Yard is yold-yard-hint rule.

section hint room rules [xxhrr] [xxrhr]

this is the airy-isle-hint rule:
	say "The Bot Board needs to be dealt with here, not the location.";
	the rule succeeds;

this is the been-buggin-hint rule:
	if dean duggan is moot:
		say "You're done here. You can take the boring boat back to [Violent Vale] now.";
		the rule fails;
	if buggin-score is 0, say "[one of]There are two things to do, and they can be done in any order, so I picked one at random.[or][stopping]";
	if should-mug-first:
		say "[one of]You need to look a bit tougher, since you've been buggin['][or]You need to change your facial expression[or]Change your facial expression with [b]MEAN MUGGIN[r][stopping].";
	else:
		say "[one of]You need to be able to carry more weight.[or]You need to be stronger and, not quite thinner, but ...[or]...leaner.[or]LEAN LUGGIN.[stopping]";
	the rule succeeds;

this is the blinding-blaze-hint rule:
	if blaze-ways is true, the rule fails;
	say "[one of]The blinding blaze can become more navigable[or]Something more solid, yet still annoying[or]It can become WINDING WAYS. There are actually three acceptable answers here[or]WINDING WAYS, MINDING MAZE or FINDING PHASE[stopping].";
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

this is the dives-ditch-hint rule:
	if kni-ni is true, the rule fails;
	say "[one of]Set up a subtler trap.[or]KNIVES NICHE.[stopping]";

this is the fight-funnel-hint rule:
	if funnel-to-tunnel is true, the rule fails;
	say "[one of]You need to get rid of the fighters[or]Maybe make it more awkward to fight[or]TIGHT TUNNEL[stopping].";

this is the foe-field-so-sealed-hint rule:
	if shield-shown is true, the rule fails;
	if player does not have gold guard:
		say "You don't have what you need, yet, to open up the Foe Field.";
	else:
		say "[one of]You need to brandish protection to get further in the Foe Field.[or]That's a fancy way of saying something much simpler[or]What's a synonym for guard? Especially the gold guard?[or]SHOW SHIELD.[stopping]";

this is the fun-fen-hint rule:
	if backed binder is not off-stage, the rule succeeds;
	say "The Fun Fen is a busy place, but there's nothing you need to do to it in general. You may try HINTing individual objects, though.";
	the rule succeeds.

this is the gassed-gap-hint rule:
	if cool cap is moot, the rule fails;
	if player does not have cool cap:
		say "You don't have what you need yet to change the Gassed Gap.";
	else:
		say "[one of]You need to put forth a challenge.[or]You don't have a gauntlet to throw down, but you have something else.[or]You have a cap.[or]CAST CAP.[stopping]";

this is the got-gear-hot-here-hint rule:
	if marred mat is moot, the rule fails;
	say "You need to change the marred mat."

this is the here-hull-hint rule:
	if beer bull is moot, the rule fails;
	say "You need to dispose of the Beer Bull, here. There are hints for it, if you need them.";

this is the history-hall-hint rule:
	if mean moe's is moot and gutta ganksta is moot and poor ponder is moot, the rule fails;
	if ever-mall is true:
		say "You can pretty much twiddle the Mystery Mall and History Hall as you want. There are plenty of things to hint in each of them.";
	else:
		say "[one of]The History Hall can become something a bit less profound.[or]A place of commerce, not of study.[or]MYSTERY MALL.[stopping]";

this is the lake-lap-hint rule:
	say "Later..."; [??]
	the rule succeeds;

this is the lake-lea-hint rule:
	the rule fails.

this is the pit-pound-hint rule:
	if hit hound is in pit pound:
		say "The hit hound has your full attention here.";
		try hintobjing hit hound instead;
	say "[one of]The pit pound still leaves you uncomfortable[or]Like you don't belong here[or]FIT FOUND[stopping]."

this is the po-pit-hint rule:
	if grit-grown is false:
		say "[one of]You have to deal with the Po['] Pit itself before dealing with the trash trap. You can find the right verb for the trash trap, but you can't use it until you deal with the Po['] Pit.[or]The learner needle swinging left indicates you need two longer words.[or]The learner needle going center-left indicates that either row or writ is the right number of letters.[or]You need to get a lot tougher. Become a bigger person.[or]GROW GRIT.[stopping]";
	else:
		say "[one of]The trash trap has a way through...sort of.[or]The row writ has been drawn on so that there is no way through. Even though you've grown grit, you can't see a way through it.[or]The gash gap is treacherous, and the cache cap is stupid, but they both keep the learner needle in the center.[or]Looking at the cache cap, it's got a rendering of the trap and gap. Which seems all wrong.[or]MASH MAP.[stopping]"; [??bash bap]

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

this is the rift-river-hint rule:
	say "[one of]You need someone to help you here[or]Maybe you could use an item, too[or]You need a GIFT GIVER to come by[stopping].";

this is the shirk-shell-hint rule:
	if player has jerk gel, the rule fails;
	process the jerk-gel-hint rule;

this is the soft-sand-hint rule:
	if ever-loft is false:
		say "[one of]You can't quite reach what's to the west[or]The Soft Sand can change its contours[or]Perhaps it could rise or fall based on what you do or think[or]LOFT LAND will raise the Soft Sand so you can go west[stopping].";
	else:
		say "You can toggle LOFT LAND and SOFT SAND back and forth as needed.";
	the rule succeeds.

this is the stark-store-hint rule:
	if dark door is moot, the rule fails;
	if dark door is off-stage:
		say "[one of]You need to find something that would indicate passage. What rhymes with store?[or]The something that might indicate passage also might not be easily seen. What rhymes with stark?[or]You need to find a DARK DOOR.[stopping]";
	else:
		say "[one of]You can't see much about the dark door, so you need to increase how observant you are.[or]You need to become more observant.[or]MARK MORE.[stopping]";
	the rule succeeds;

this is the store-all-stage-hint rule:
	if coral cage is moot, the rule fails;
	say "The coral cage is what's important here.[paragraph break]";
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
		say "[one of]You need to deal with the Vined Vault. Another room, another rhyme[or]In this case, it isn't a quick letter replacement. You may wish to consult the leet learner. It's pointing center-right, which is different from the center of the Wet Wood and Rift River[or]You also need to discover some weakness in the Vined Vault[or]Again, you can go through the 25 other letters, and this time, there will be a homophone that makes sense[or]You need to FIND FAULT[stopping].";
	else:
		say "[one of]The mean mass is a bit trickier. The leet learner swings to the left[or]If you've been observant, you may notice VINED VAULT and MIND MALT swung center-right and center-left, respectively, for FIND FAULT. This may help you guess what swinging left could mean[or]Try and think of a word or two that rhyme with mean or mass that are harmless, then pull that new beginning sound to the other word[or]GREEN GRASS will dispose of the mean mass[stopping].";
	the rule succeeds;

this is the violent-vale-hint rule:
	if boring boat is moot:
		say "You've done all you need to here.";
		the rule fails;
	if float is off-stage:
		say "[one of]You need to make the violent vale less violent[or]Quieter, perhaps[or]SILENT SAIL (or SALE)[stopping].";
		the rule succeeds;
	if fridge is not moot:
		say "Have a look at the fridge, for the moment.";
		the rule succeeds;
	say "Have a look at the boring boat.";
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

chapter hinting an object verb

hintobjing is an action applying to one thing.

understand "hint [thing]" as hintobjing.
understand "hint on [thing]" as hintobjing.
understand "help [thing]" as hintobjing.
understand "help on [thing]" as hintobjing.

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

the thing-hint-rule of backed binder is backed-binder-hint rule.
the thing-hint-rule of Beer Bull is beer-bull-hint rule.
the thing-hint-rule of big bag is big-bag-hint rule.
the thing-hint-rule of Bold Bard is bold-bard-hint rule.
the thing-hint-rule of boring boat is the boring-boat-hint rule.
the thing-hint-rule of Bot Board is bot-board-hint rule.
the thing-hint-rule of Bull Beast is the bull-beast-hint rule.
the thing-hint-rule of cache cap is cache-cap-hint rule.
the thing-hint-rule of cage key is cage-key-hint rule.
the thing-hint-rule of cake cap is all-caps-hint rule.
the thing-hint-rule of Cark Cliff is cark-cliff-hint rule.
the thing-hint-rule of ceiling seer is ceiling-seer-hint rule.
the thing-hint-rule of clashing cloak is the clashing-cloak-hint rule.
the thing-hint-rule of clumped cluster is the clumped-cluster-hint rule.
the thing-hint-rule of cold card is the cold-card-hint rule.
the thing-hint-rule of cool cap is all-caps-hint rule.
the thing-hint-rule of coral cage is coral-cage-hint rule.
the thing-hint-rule of dark door is the dark-door-hint rule.
the thing-hint-rule of Dean Duggan is dean-duggan-hint rule.
the thing-hint-rule of dining door is dining-door-hint rule.
the thing-hint-rule of done den is done-den-hint rule.
the thing-hint-rule of FIND FEE is find-fee-hint rule.
the thing-hint-rule of flooring float is the flooring-float-hint rule.
the thing-hint-rule of frightening fridge is frightening-fridge-hint rule.
the thing-hint-rule of full feast is the full-feast-hint rule.
the thing-hint-rule of Fussed Folks Just Jokes is fussed-folks-just-jokes-hint rule.
the thing-hint-rule of gash gap is cache-cap-hint rule.
the thing-hint-rule of go gate is go-gate-hint rule.
the thing-hint-rule of gold guard is gold-guard-hint rule.
the thing-hint-rule of good gun is good-gun-hint rule.
the thing-hint-rule of GOTS GAME is gots-game-hint rule.
the thing-hint-rule of grow grate is grow-grate-hint rule.
the thing-hint-rule of Gutta Ganksta is gutta-ganksta-hint rule.
the thing-hint-rule of ha half nah naff is ha-half-nah-naff-hint rule.
the thing-hint-rule of hard hat is all-caps-hint rule.
the thing-hint-rule of Here Hip Queer Quip is the here-hip-queer-quip-hint rule.
the thing-hint-rule of hit hound is hit-hound-hint rule.
the thing-hint-rule of hive heap is hive-heap-hint rule.
the thing-hint-rule of Hot Horde is bot-board-hint rule.
the thing-hint-rule of Jake G is the jake-g-hint rule.
the thing-hint-rule of jerk gel is jerk-gel-hint rule.
the thing-hint-rule of Kerry Kyle is kerry-kyle-hint rule.
the thing-hint-rule of leet learner is leet-learner-hint rule.
the thing-hint-rule of Lending Libe is lending-libe-hint rule.
the thing-hint-rule of listless mist mess is the listless-mist-mess-hint rule.
the thing-hint-rule of Lot Lord is bot-board-hint rule.
the thing-hint-rule of lurking lump is lurking-lump-hint rule.
the thing-hint-rule of marred mat is marred-mat-hint rule.
the thing-hint-rule of mean mass is mean-mass-hint rule.
the thing-hint-rule of Mean Moe's Clean Clothes is the mean-moes-clean-clothes-hint rule.
the thing-hint-rule of mild mead is mild-mead-hint rule.
the thing-hint-rule of mind malt is mind-malt-hint rule.
the thing-hint-rule of minding maze is minding-maze-hint rule.
the thing-hint-rule of needle is leet-learner-hint rule.
the thing-hint-rule of Oi Mo by Tim T Sims Pimp is oi-mo-hint rule.
the thing-hint-rule of Pain Peasant is pain-peasant-hint rule.
the thing-hint-rule of paper pile is paper-pile-hint rule.
the thing-hint-rule of peeling pier is peeling-pier-hint rule.
the thing-hint-rule of pining poor is dining-door-hint rule. [pining poor and dining door both map to mining more]
the thing-hint-rule of poor ponder for fonder is poor-ponder-for-fonder rule.
the thing-hint-rule of prong part is prong-part-hint rule.
the thing-hint-rule of Reeker Russell is reeker-russell-hint rule.
the thing-hint-rule of row writ is row-writ-hint rule.
the thing-hint-rule of Sage Sea is sage-sea-hint rule.
the thing-hint-rule of screaming skull is screaming-skull-hint rule.
the thing-hint-rule of Shoaled Shard is the shoaled-shard-hint rule.
the thing-hint-rule of shy shawl is the shy-shawl-hint rule.
the thing-hint-rule of snuck snare is the snuck-snare-hint rule.
the thing-hint-rule of sought sword is sought-sword-hint rule.
the thing-hint-rule of steel steer is steel-steer-hint rule.
the thing-hint-rule of stuck stair is the stuck-stair-hint rule.
the thing-hint-rule of tall tree is tall-tree-hint rule.
the thing-hint-rule of Toe Tappin Row Rappin is toe-tappin-row-rappin-hint rule.
the thing-hint-rule of Too Totes New Notes is the too-totes-new-notes-hint rule.
the thing-hint-rule of tool tap is tool-tap-hint rule.
the thing-hint-rule of trash trap is cache-cap-hint rule.
the thing-hint-rule of trending tribe is trending-tribe-hint rule.
the thing-hint-rule of vapor vial is vapor-vial-hint rule.
the thing-hint-rule of Very Vile Fairy File is very-vile-fairy-file-hint rule.
the thing-hint-rule of way woke clay cloak is the way-woke-clay-cloak-hint rule.
the thing-hint-rule of We Whine ME MINE is the we-whine-me-mine-hint rule.
the thing-hint-rule of Weird Way is the weird-way-hint rule.
the thing-hint-rule of well worn hell horn is well-worn-hell-horn-hint rule.
the thing-hint-rule of wild weed is wild-weed-hint rule.
the thing-hint-rule of worst wave is worst-wave-hint rule.
the thing-hint-rule of wrong art is wrong-art-hint rule.
the thing-hint-rule of wry wall is wry-wall-hint rule.
the thing-hint-rule of zig zag rig rag is zig-zag-rig-rag-hint rule.

[??styled steed]

section variables etc

[this is just to keep hinting code a bit cleaner and avoid nested one of/or when possible and sensible.]

ttnn-yet is a truth state that varies.

ssh-yet is a truth state that varies.

to say part-ev of (x - a thing):
	say "You don't need to do anything with [the x]. It [if airy isle is visited]got you to the final area[else if gassed gap is visited]will get you past the gap[else]will help automatically unlock a passage later[end if]."

section thing hint rules [xxthr] [??general problems with what if you already know a certain command and the hints may not know this]

this is the all-caps-hint rule:
	let N be my-hats;
	say "You need to combine three hats, eventually. You have [N in words]. So no need to do anything now.";
	if N is 3:
		if player does not have jerk gel:
			say "You need to find something to glue the hats together with." instead;
		say "You can use the jerk gel to glue the hats together, but you need the right command.";

this is the backed-binder-hint rule:
	say "[part-ev of backed binder].";

this is the beer-bull-hint rule:
	if bull-null is false:
		say "[one of]The beer bull is too powerful in its present form! You have to lessen its power a bit. A pretty simple rhyme will work[or]NEAR NULL[stopping]." instead;
	if ever-bull-chase is false, say "[one of]You need to provoke the Beer Bull to chase you[or]There's a phrase that might insult something or someone who is part of something as exciting as alcohol advertising[or]DEAR DULL[stopping]." instead;
	if in-bull-chase is false
	, say "You can say DEAR DULL to get the bull to chase you again." instead;
	say "This is a bit tricky--you need to get the bull to chase you somewhere and spring a trap. I'm going to palm the rest of these hints on to an item you have[if snuck snare is off-stage]n't found yet[end if].";

this is the big-bag-hint rule:
	say "The big bag just holds as many items as you want without you doing anything to it. It's working great as-is.";

this is the bold-bard-hint rule:
	if player does not have clashing cloak, say "You have nothing to help the Bold Bard make a distraction, yet." instead;
	say "[one of]The Bold Bard needs a distraction, and something you have will help.[or]More precisely, use something you're wearing.[or]The clashing cloak is distracting in another form, too.[or]SMASHING SMOKE.[stopping]";

this is the boring-boat-hint rule:
	if nap-no is true, say "You can just board the boat.";
	say "A song might help the boring boat be less boring.";
	if player does not have toe tappin row rappin, say "[line break]You haven't found one yet." instead;
	say "[line break][one of][Toe] can be modified[or]How to feel less sleepy or bored on the boat, using [Toe]?[or][Toe] can become NO NAPPIN.[stopping]";

this is the bot-board-hint rule:
	if Lot Lord is in Airy Isle and Hot Horde is in Airy Isle:
		say "[one of]Now that the Lot Lord and Hot Horde are in Airy Isle, they need a rallying cry[or]Or a victory cry[or]GOT GORED[stopping].";
	else if Lot Lord is in Airy Isle:
		say "[one of]The Lot Lord needs people to lead[or]The Lot Lord needs an enthusiastic, large following[or]HOT HORDE[stopping].";
	else if Hot Horde is in Airy Isle:
		say "[one of]The Hot Horde is disorganized and needs a leader[or]Someone regal would gain the horde's attention[or]LOT LORD[stopping].";
	else:
		say "[one of]You need allies to take out the Bot Board. One leader and one group of people.[or]This will give both answers if you go through.[or]The leader isn't quite a baron or king.[or]LOT LORD.[or]The people to be led must also be enthusiastic.[or]HOT HORDE.[stopping]";

this is the bull-beast-hint rule:
	if need-loss is true:
		if tried-yet of "LEAST LOSS", say "Now is the time to go in for LEAST LOSS." instead;
		say "[one of]The Beast Boss/Bull Beast is going to hurt you, no question. But you want to minimize the damage[or]LEAST LOSS[stopping]." instead;
	if tried-yet of "CULL CEASED", say "You already tried to say CULL CEASED. Now, it will work!" instead; [?? what if LUL LEAST??]
	say "[one of]You need to say or do something that will put the Bull Beast down[or]There are two ways to nail the Bull Beast[or][one of]CULL CEASED tells the Bull Beast its rampaging days are over[or]LUL LEAST is a put-down that leaves the beast in shame[stopping][stopping].";

this is the cache-cap-hint rule:
	say "[one of]As you may have guessed, the cache cap, trash trap and gash gap are linked. One of them gives clues about the other two[or][if grit-grown is false]You need to deal with the row writ and Po['] Pit, first[else][one of]The cache cap seems to offer a way through the trash trap or gash gap, but not really[or]You need to find a way to put the cache cap out of its misery[or]BASH BAP or MASH MAP both work to get out of Po['] Pit for good[stopping][end if][stopping].";
	the rule succeeds;

this is the cage-key-hint rule:
	if player is in Store All Stage:
		say "The cage key will help you open the cage here";
	else:
		say "The cage key will help you open a cage you have[if Store All Stage is unvisited]n't yet[end if] seen";
	say ", but you need to figure the right command.";

this is the cark-cliff-hint rule:
	say "[one of]The Cark Cliff point is a bit obscure. You need to mellow out, man.[or]SPARK SPLIFF.[stopping]";

this is the ceiling-seer-hint rule:
	say "The Ceiling Seer is just there to reinforce what you need to do in the Real Rear. The -ing in each act is superfluous.";

this is the clashing-cloak-hint rule:
	if tried-yet of "SMASHING SMOKE":
		say "You know what to do with the cloak, but the question is, where?";
		if poor ponder is not moot:
			say "You haven't unlocked the room, yet. You need to look at [poor ponder] [here-in of History Hall].";
		else if y'old yard is unvisited:
			say "You haven't visited beyond [poor ponder].";
		else:
			say "Using the cloak in Y'Old Yard will help the Bold Bard.";
		the rule succeeds;
	say "[one of]The clashing cloak can transform into another sort of distraction[or]SMASHING SMOKE[stopping].";
	if poor ponder is not moot, say "You can't use the clashing cloak yet."

this is the clumped-cluster-hint rule:
	say "[one of]The clumped cluster can be moved two ways. Either is equivalent[or]You can use an order to move the cluster or find an item[or][one of]BUMPED BUSTER is one way[or]DUMPED DUSTER is one way[cycling] to clear the clumped cluster[stopping].";

this is the cold-card-hint rule:
	say "You need to bring the cold card somewhere as a voucher[one of]. Hint again to see where[or]. [if the room east of vending vibe is nowhere]You will need to change Mystery Mall back, first[else if vending vibe is unvisited]You need to visit west of Mystery Mall[else if trending tribe is moot]The Lending Libe[else]The Vending Vibe, but first you must deal with the Trending Tribe[end if][stopping]."

this is the coral-cage-hint rule:
	if player does not have cage key:
		say "You don't have the key you need yet. Look for something that rhymes with key.";
	else:
		say "[one of]You need to call out the denizen of the coral cage.[or]What sort of person could be in there?[or]*ORAL *AGE is likely, according to the Leet Learner.[or]MORAL MAGE.[stopping]";

this is the dark-door-hint rule:
	say "[one of]The dark door is sort of defined and accessible, but not enough. You need to observe it a bit extra.[or]MARK MORE.[stopping]"

this is the dean-duggan-hint rule:
	say "[one of]Dean Duggan is an integral part of Been Buggin[']. So hints about him are hints about Been Buggin['].[or][stopping]";
	process the been-buggin-hint rule;

this is the dining-door-hint rule:
	if full feast is not moot, say "(NOTE: you can't fully solve this until you do something else. But you can guess the verb.)[paragraph break]";
	say "[one of]There's one more thing you can do with the dining door and pining poor once you've had a feast[or]The pining poor want jobs, or to discover riches[or]You can find riches here if you look the right way[or]MINING MORE[stopping]";

this is the done-den-hint rule:
	say "You don't need to go back through the done den. There are not even any extra points."

this is the find-fee-hint rule:
	say "[one of]The FIND FEE makes you feel as though you need to pay, but you need to pay attention to yourself.[or]The leet learner scans center-right, but the first word has to be *IND. So the second word must be very short indeed.[or]MIND ME.[stopping]"

this is the flooring-float-hint rule:
	say "[one of]The flooring float seems almost too exciting to use. You need to tone it down.[or]Make the float a BORING BOAT.[stopping]";

this is the frightening-fridge-hint rule:
	say "[one of]The frightening fridge could be more cheery, and it could stop blocking your way.[or]BRIGHTENING BRIDGE.[stopping]"

this is the full-feast-hint rule:
	if tried-yet of "PULL PIECED":
		say "You know what to do with the full feast. Nobody's ready for it yet." instead;
	say "[one of]The full feast is too much to carry by yourself all at once[or]You can bring the full feast over a bit at a time[or]PULL PIECED[stopping].";

this is the fussed-folks-just-jokes-hint rule: say "The random names are just for fun."

this is the go-gate-hint rule:
	say "[one of]You want to go through the go gate, but you need to show a bit of caution[or]LO LATE doesn't quite cut it, here[or]You can also scan the component part, the grow grate, for maybe a bit of help[or]WHOAH WAIT, or any of three alternate spellings, works[stopping].";

this is the gold-guard-hint rule:
	say "[one of]The gold guard helps protect you [if player is in Foe Field]here[else if Foe Field is unvisited]somewhere you haven't been[else]somewhere you've been[end if].[or]Once the gold guard is in the right place, you can use it to protect yourself.[or]You need to be in the Foe Field for the gold guard to work.[or]Once in the Foe Field, SHOW SHIELD.[stopping]"

this is the good-gun-hint rule:
	say "[one of]You want to make the gun worthless.[or]A good gun is generally made out of metal. Any material you could change it to?[or]This sort of reverses a very early puzzle.[or]WOOD ONE.[stopping]"

this is the gots-game-hint rule:
	say "[one of]The Gutta Ganksta seems proud of the GOTS GAME tattoo, but perhaps there's a way to cut it down.[or]LOTS LAME.[stopping]"

this is the grow-grate-hint rule:
	say "[one of]Since the grow grate is part of the go gate, and they rhyme, they make the same puzzle.[or][stopping]";
	process the go-gate-hint rule;

this is the gutta-ganksta-hint rule:
	say "[one of]This is a tricky one. The gutta ganksta's tattoo is/was more important.[or]Calling the gutta ganksta a name gets you an optional point, but it's only esoteric name calling.[or]WHATTA (or WHAT A) WANKSTA.[stopping]";

this is the ha-half-nah-naff-hint rule:
	say "HA HALF will tell you if one of your words is right. NAH NAFF hides that.";

this is the here-hip-queer-quip-hint rule:
	say "[part-ev of queer quip]."

this is the hit-hound-hint rule:
	say "[one of]The hit hound can smell fear. You can't really run or lash out at it.[or]You need to stand your ground or, figuratively...[or]You can SIT SOUND.[stopping]"

this is the hive-heap-hint rule:
	say "[one of]The hive heap has nothing on the surface, but maybe if you dig in...[or]Look way down into the hive heap...[or]DIVE DEEP.[stopping]"

this is the jake-g-hint rule:
	if jake-woke is false, say "[one of]Jake needs to be roused from his sleep gently and cheerily[or]Maybe you can rouse him with enthusiasm[or]WAKE WHEE[stopping]." instead;
	if jake-tea is false, say "[one of]Time to eat and drink with Jake[or]A standard Inform verb does nicely here[or]TAKE TEA[stopping]." instead;
	if jake-fee is false, say "[one of]Jake wants payment, but not really[or]You've sort of done this back at the Trim Tram, but it's a bit different[or]FAKE FEE[stopping]." instead;
	if jake-cocapn is false, say "[one of]Jake wants to feel like an equal[or]You may or may not hear [Toe Tappin] again[or]A riff on [Toe Tappin] will make Jake happy[or]You can say CO CAPN[stopping]." instead;
	if jake-map is false, say "[one of]You and Jake G are lost. You're in Lake Lap, so you may do things a bit differently[or]I'm pretty sure you know an item that helps you not get lost[or]MAKE MAP[stopping]." instead;
	if jake-snap is false, say "[one of]Now you and Jake must deal with that hissing noise[or]I think you know what sort of animal makes a hissing noise[or]SNAKE SNAP[stopping]" instead;
	say "Oops. It's a bug you got this far, but it's not a fatal one."

this is the jerk-gel-hint rule:
	if player does not have jerk gel:
		say "[one of]There's something hidden in the Shirk Shell, if you just expend the energy.[or]The Jerk Gel is there, but you can't just take it.[or]You won't find the Jerk Gel if you're lazy.[or]WORK WELL.[stopping]";
	else:
		say "You need to find whom to use the jerk gel on.";

this is the kerry-kyle-hint rule:
	if in-so-sad is true:
		say "[one of]You need to make yourself happier, from being so sad.[or]Become shiny and happy.[or]GLOW GLAD.[stopping]";
	else if in-way-wrong is true:
		say "[one of]You feel not just wrong but weak. Things are slipping away.[or]How to keep things from slipping away?[or]STAY STRONG.[stopping]";
	else:
		say "Woohoo! There's nothing wrong with you right now!"

this is the leet-learner-hint rule:
	say "[one of]First, note the leet learner may give different readings if you scan an area or an item. If it gives a reading when you scan an area, you can do something with the room.[or]So the big thing is, probably, what do the colors on the leet learner mean? Read it again, if you haven't.[or]LEET LEARNER and MEET MOURNER both point to the center, suggesting that spelling may be an unimportant variable.[or]What do MOURNER and LEARNER have in common?[or]MOURNER and LEARNER both have seven letters. LEET and MEET also each have four letters.[or]The reading the needle gives when you scan is related to how many letters are in the solution.[or]CONCEIT CONCERNER adds letters to each word, and it is on the left.[or]CHEAT CHURNER adds a letter only to LEET, and it is center-left.[or]EAT EARNER takes one letter each from LEET LEARNER and is on the right.[or]BEAT BURNER is center-right. It only takes one letter from one word.[or]Finally, TREAT TURNER adds a letter and subtracts another. What's up with that?[or]In this case, the Leet Learner will swing back and forth.[or]There's one more thing: some items may cause the leet learner to blink. You may be able to guess what this means.[or]Items that make the learner blink are optional.[or]So, in conclusion: for the leet learner, left means add letters to both words, center-left means add to one, center means no change in the number of letters, center-right means subtract letters from one word, and right means subtract letters from both words. Blinking means the target is optional.[stopping]";
	the rule succeeds;

this is the lending-libe-hint rule:
	say "Now that you have the Lending Libe, you can take whatever books you need."

this is the listless-mist-mess-hint rule:
	say "The listless mist mess is just there to make it clear this is your final destination."

this is the lurking-lump-hint rule:
	say "The lurking lump can be used to bypass any available local puzzle with [jjj]. It gains charges when you make enough good guesses--some especially amusing guesses may count extra.";
	say "[line break][one of]HINT the lump again to see the mechanics of when you get a good guess[or]The lump drops after the first [next-lump-level in words] good guesses, then the next [(next-lump-level + next-lump-delta) in words], then [(next-lump-level + (2 * next-lump-delta)) in words], and so on. Particularly good guesses (author's discretion,) or bonus points, count double[stopping]."

this is the marred-mat-hint rule:
	say "[one of]The marred mat is in Got Gear Hot Here, suggesting maybe it can become something you can wear.[or]What can you wear that rhymes with mat?[or]HARD HAT.[stopping]"

this is the mean-mass-hint rule:
	say "[one of]You need to make the mean mass into something much less harmful. Wholesome, even.[or]Maybe the mean mass can be changed to something you're missing on the outside. Something from nature.[or]The mean mass can become GREEN GRASS.[stopping]"

this is the mean-moes-clean-clothes-hint rule:
	say "You need something to clean as well as a way to operate the machine.";
	if can-glean:
		say "You already know to GLEAN GLOWS.";
	else:
		say "[one of]How can you look into the inner mechanism of [clean clothes]?[or]Bells and lights and whistles.[or]GLEAN GLOWS.[stopping]";
		the rule succeeds;
	if player has way woke clay cloak:
		say "The way woke clay cloak can be cleaned.";
	else:
		say "[one of]You'll need a dirty-ish clothing item. You don't have it yet, but you'll know when you do. Or the next hint will spoil it[or]The way woke clay cloak goes in once you GLEAN GLOWS[stopping].";

this is the mild-mead-hint rule: say "The mild mead is there just to provide a liquid refreshment for a feast. It has no use on its own. [if wild weed is off-stage][one of]It does have a bonus point, though[or]The mild mead can get a little more kick[or]It can become a different drug, sort of[or]WILD WEED[stopping][else]And you already got the wild weed from it[end if]."

this is the mind-malt-hint rule: say "The mind malt is just there to give another clue about weaknesses in the Vined Vault."

this is the minding-maze-hint rule:
	if toe tappin row rappin is not acquired, say "You don't have what you need yet to get through the maze. You need a riff on another item." instead;
	say "[one of]You need to think outside the box, or the maze, for the minding maze.[or]If you have Toe Tappin in your head, well, you may have a clue you need to use it.[or]What do you need to do to get through a maze?[or]You need to MAP it. A lot.[or]You can only map a bit if you just use your head.[or]MO MAPPIN will make mapping the maze go faster.[stopping]";

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

this is the poor-ponder-for-fonder rule:
	say "[one of][poor ponder] isn't a good read. It doesn't really put the reader where the history was[or]So you have to force what [poor ponder] does. Imagine being there[or]YOU'RE (or YORE) YONDER[stopping].";

this is the prong-part-hint rule:
	say "[one of]The prong part is part of the wrong art, so future clues will refer you there.[or][stopping]";
	process the wrong-art-hint rule;

this is the reeker-russell-hint rule:
	say "[one of]Reeker Russell is big and tough, but you can make him less strong.[or]No, 'weaker wussle' doesn't quite work, but there's a synonym for weaker.[or]MEEKER MUSCLE.[stopping]"

this is the row-writ-hint rule:
	if grit-grown is true, the rule fails;
	say "[one of]The row writ and Po['] Pit may have you stumped.[or]The leet learner on both will give you a clue of the number of letters.[or]You need to toughen up.[or]GROW GRIT.[stopping]"

this is the sage-sea-hint rule:
	say "You don't need to do anything specifically with the Sage Sea. It just blocks you from elsewhere, [if cage key is off-stage]but it holds something you need, if you deal with Real Rear correctly[else]and you already got the cage key from it[end if].";
	the rule succeeds;

this is the screaming-skull-hint rule: say "[one of]If there only were a way to make the screaming skull less imposing![or]Maybe there is a way the skull can make less noise as well.[or]DREAMING DULL.[stopping]"

this is the shoaled-shard-hint rule:
	say "The Shoaled Shard is just the place the Bold Bard need[if bold bard is moot]s[else]ed[end if] to get to. It's irrelevant on its own."

this is the shy-shawl-hint rule:
	say "[one of]The shy shawl isn't necessary, but it allows a lot of good guesses that may give you a spoiler [if lump is not off-stage]with the lump[else]item[end if] later[or]The shawl looks silly and stupid and wrong. There's a right way to make light of this, spoiled if you HINT again[or]LIE LOL[stopping]."

this is the snuck-snare-hint rule:
	if ssh-yet is false:
		now ssh-yet is true;
		say "You need to find the right place to drop the snuck snare. You'll do so automatically." instead;
	if weird way is not moot, say "You can get past the Weird Way." instead;
	if fight funnel is not visited, say "Go down in Stark Store." instead;
	if funnel-to-tunnel is false, say "You can get past the Fight Funnel." instead;
	if Dives Ditch is unvisited, say "Go west in Fight Funnel." instead;
	if kni-ni is false, say "You should see about changing Dives Ditch." instead;
	say "You will need to place the snare in [Dives Ditch] before leading someone on a chase. Then, run back there to spring the trap.";

this is the sought-sword-hint rule:
	say "[one of]The sought sword belongs to someone. It just looks important[or]Who might the owner be? Someone with a noble title[or]Call the LOT LORD[stopping].";

this is the steel-steer-hint rule:
	if healed-here is true, the rule fails;
	say "The steel steer is just here to bring home that there's a lot to do in the Real Rear.";
	process the real-rear-hint rule;

this is the stuck-stair-hint rule:
	say "[one of]The stuck stair holds a place as well as an item. Guessing either one works, but the place has fewer letters[or]The stair may lead to good fortune[or]Or luck[or][one of]The place is LUCK LAIR[or]The item is a SNUCK SNARE[cycling][stopping]."

this is the tall-tree-hint rule:
	if tree-down is true, the rule fails;
	say "[one of]The way north is treacherous, and having a bridge over it would be nice.[or]The tall tree would make a nice bridge, if it were on the ground. But it is fixed upright.[or]How do you loosen the tall tree so it creates a walkway?[or]FALL FREE.[stopping]";

this is the toe-tappin-row-rappin-hint rule:
	say "[Toe] is useful many different places, and a rhyming riff on it will help solve puzzles elsewhere. Hinting the right room at the right time will give more detail."

this is the too-totes-new-notes-hint rule:
	if ttnn-yet is false:
		now ttnn-yet is true;
		say "Too Totes New Notes just lists what you've done to give an idea how the Leet Learner works. Spoilers ahead.";
	else:
		process the leet-learner-hint rule;

this is the tool-tap-hint rule: [FOOL FAP?? / POOL PAP / CRUEL CRAP]
	say "[one of]You can request something from the tool tap.[or]It might not be a tool, but who knows when it comes in handy.[or]Summon a COOL CAP.[stopping]"

this is the trending-tribe-hint rule:
	say "[one of]The trending tribe seems very focused on money.[or]What is something that would be free that might disappoint the trending tribe?[or]LENDING LIBE.[stopping]"

this is the vapor-vial-hint rule:
	say "[one of]It would be nice if the vapor vial became something more useful or at least less toxic.[or]It can become a PAPER PILE.[stopping]"

this is the very-vile-fairy-file-hint rule:
	if merry-mile is false:
		say "You can't do anything with the file until the Tarry Tile is cheerier.";
	else:
		say "[one of]Now that you're happy, the Fairy File can't affect you so much. But it still needs to be put out to pasture.[or]What can you do that will bury the hatchet?[or]The leet learner gives a center-right reading. This tells you the second word is four letters and the first is four or less.[or]BURY BILE to win the game.[stopping]";
	the rule succeeds;

this is the way-woke-clay-cloak-hint rule:
	say "[one of]You need to find a place to clean the cloak[or]A machine off to the side can clean your cloak[or]The Mystery Mall holds [clean clothes][or]In the Mystery Mall, GLEAN GLOWS[stopping]."

this is the we-whine-me-mine-hint rule:
	say "[one of][We Whine] is useless read straight-up, but reading the right way can give insights[or]SEE SIGN[stopping]."

this is the weird-way-hint rule:
	say "[one of]The weird way is some odd substance blocking you. Maybe it could vanish and there'd be less of it.[or]Make it CLEARED CLAY.[stopping]"

this is the well-worn-hell-horn-hint rule:
	say "[one of]The well worn hell horn seems old but sturdy. It has no apparent cracks.[or]There's a way to look for a crack in the horn.[or]TELL TORN.[stopping]";

this is the wild-weed-hint rule:
	say "[one of]The point for the wild weed is truly optional and recreational and slang-based[or]There's one place that makes you feel nervous, but you can relax[or]The wild weed may help at Cark Cliff[or]You can SPARK SPLIFF[stopping]."

this is the worst-wave-hint rule:
	say "[one of]What is a rhyming opposite of worst?[or]In this case, the rhyming opposite of worst also changes 'wave' more favorably.[or]FIRST FAVE.[stopping]"

this is the wrong-art-hint rule:
	say "[one of]The wrong art is at the beginning. Understanding how to get rid of it will help, but like much art, it is not strictly necessary.[or]Even if you've got a few points along the way, you can still get a boost from setting the wrong art right.[or]Make a STRONG START.[stopping]";

this is the wry-wall-hint rule:
	say "The wry wall is simply there to provide amusing deaths.";

this is the zig-zag-rig-rag-hint rule:
	say "[one of]The zig zag rig rag can be changed with a simple command[or]The leet learner flags the rag in the center, so you have 24 possibilities for -IG -AG[or]One possibility for the rag is extremely practical for carrying a lot of things[or]BIG BAG[stopping].";
	the rule succeeds;

[zzthr]

chapter going to rooms

section gotoing

gotoing is an action applying to one visible thing.

understand the command "gi" as something new.
understand the command "gr" as something new.
understand the command "gt" as something new.
understand the command "goto" as something new.
understand the command "go to" as something new.

understand "go to [any available-from-here room]" as gotoing.
understand "goto [any available-from-here room]" as gotoing.
understand "gt [any available-from-here room]" as gotoing.
understand "gr [any available-from-here room]" as gotoing.
understand "go [any available-from-here room]" as gotoing.

does the player mean gotoing a room:
	if noun is available-from-here, it is very likely.

to decide whether goto-available:
	yes.

definition: a room (called rm) is available-from-here:
	let mrrm be map region of rm;
	if rm is unvisited, no;
	if player is in Tarry Tile, no;
	if rm is Here Hull and beer bull is moot, no;
	if mrrm is Worst Whew, no;
	if mrrm is Browsy Breaks, no;
	if rm is Shirk Shell and jerk gel is not in Shirk Shell, no;
	yes;

to decide which room is fliproom of (rm - a room):
	if mistmall is true:
		if rm is got gear hot here, decide on History Hall;
	else:
		if rm is Y'Old Yard or rm is Vending Vibe, decide on History Hall;
	if loft-land is true:
		if rm is shirk shell, decide on Soft Sand;
	else:
		if rm is curst cave, decide on Soft Sand;
	decide on Fun Fen;

carry out gotoing:
	let rm be location of player;
	if noun is rm, say "Already there! Er, here." instead;
	if noun is unvisited, say "You've tried to GT a room you haven't seen yet." instead;
	if in-bull-chase is true, say "Sorry, GO TO is disabled during the beer bull chase." instead;
	if mrlp is Browsy Breaks, say "Sorry, GO TO is disabled during this side-quest." instead;
	if mrlp is vale verminous, say "There's no way back. You are so close to the end." instead;
	if need-healing, say "You can't zoom around in your weakened state. But maybe what you need is close by." instead;
	if noun is available-from-here:
		let N be fliproom of noun;
		say "[line break]You twiddle [N] back as you go.";
		if N is History Hall, now mistmall is whether or not mistmall is false;
		if N is Soft Sand, now loft-land is whether or not loft-land is false;
		move player to noun;
	else:
		say "You can't walk to [noun] from here.";
	the rule succeeds;

section gotothinging

gotothinging is an action applying to one visible thing.

does the player mean gotothinging a thing carried by the player: it is unlikely.
does the player mean gotothinging a thing in location of the player: it is unlikely.

understand "go to [any known-to-player thing]" as gotothinging.
understand "goto [any known-to-player thing]" as gotothinging.
understand "gt [any known-to-player thing]" as gotothinging.
understand "gi [any known-to-player thing]" as gotothinging.
understand "go [any known-to-player thing]" as gotothinging.

carry out gotothinging:
	if noun is off-stage, say "Unfortunately, you tried to go to something that wasn't introduced to the game world yet." instead; [shouldn't be necessary, but just in case... we want to avoid weird errors, for now, until things have been tested. ??]
	let Q be location of noun;
	if Q is Hidey House, say "Right now [the noun] is temporarily unavailable." instead;
	if noun is moot, say "Unfortunately, you tried to go to something that has been dealt with. Okay, it's fortunate you dealt with [the noun], but GT doesn't know where to go." instead;
	try gotoing Q instead;

chapter exitsing

exitsing is an action applying to nothing.

understand the command "exits" as something new.

understand "exits" as exitsing.

exitdirs is a list of directions variable. exitdirs is { north, south, east, west, inside, outside, up, down }.

carry out exitsing:
	let my-exits be 0;
	repeat with Q running through exitdirs:
		let RQ be the room Q of location of player;
		if RQ is not nowhere:
			if my-exits is 0, say "LIST OF EXITS:[line break]";
			say "[Q]: [if Q is blocked](unavailable.)[else if RQ is visited][RQ].[else](unvisited.)[end if]";
			increment my-exits;
	if my-exits is 0, say "There are no clear safe exits. It looks like you need to solve a puzzle to find your way out of here.";
	the rule succeeds.

to decide whether (di - a direction) is blocked:
	if player is in Fun Fen and di is north and tree-down is false, yes;
	no;

volume when play begins

when play begins (this is the backdrop and score seeding rule):
	seed-score-list; [this is in the table file]
	wall-refresh;

when play begins (this is the randomize all the things rule):
	if a random chance of 1 in 2 succeeds, now mugged-first is true;
	repeat through table of all randoms:
		sort tabnam entry in random order;

when play begins (this is the opening text rule):
	now ha-half is true;
	now the left hand status line is "West Wall";
	force-status;
	process the check-skip-intro rule;
	if the rule succeeded, continue the action;
	if debug-state is false, ask-screenread;
	say "[paragraph break]You wouldn't have gone to Fall Fest if you hadn't gotten a free ticket. But of course, the ticket was the only thing that was free. Inside, super high food prices. Lots of noise. And, well, the sun always seeming to get in your eyes. But you still feel you might as well see everything.[paragraph break]And you do. Then off on the west edge, there's a wall. A wall west, if you will. 'Oh, man,' you think. 'Why did I bother?' Well, at least you didn't waste all afternoon watching football games you didn't care about. But you're still mumbling to yourself about how there must be something, anything interesting here. Then you feel a tap on your shoulder.[paragraph break][wfak]";
	say "'So, you want to get goin[']? Well, I might be able to help. I'm Kit Cohen.' You're just not in the mood for motivational nonsense right now, so you brush Kit off. Or try to.[wfak]";
	say "[line break]'No! Seriously! You managed to bawl best--well, the best of anyone I've seen today--so you get a chance at a tall test!'[paragraph break]'What sort of test?'[paragraph break]'The PALL PEST of CRAWL CREST!'[wfak]";
	say "[line break]And it's a big one. You look to Kit for help, but Kit shrugs.[wfak]";
	say "[line break]It approaches. It's about to touch you ...and reflexively you boom, 'GALL, guest!'[paragraph break]The pall pest stumbles back into the west wall, which crumbles. Kit Cohen applauds. 'Well done! You did it! I think you are the one ... the one to recover the Very Vile Fairy File from ... from ...'[wfak]";
	say "[line break]It takes a second for Kit Cohen to regain composure. 'The CRIMES CREW TIMES TWO.' Are you ready?[wfak]";
	say "[line break]You accept. You might as well. Kit guides you across the remains of the wall, before going off to the Set-So Inn with Rhett Rowan. You are left in ...";

when play begins (this is the score and status tweak rule):
	now the maximum score is min-needed + max-bonus;
	now max-poss is the maximum score;
	now the right hand status line is "[score][if doable-hinted > 0](+[doable-hinted])[end if]/[min-needed][if min-needed is max-poss]*[else]-[max-poss][end if]";
	force-status;
	now the left hand status line is "[location of the player] ([mrlp])";
	now the turn count is 0;

to wall-refresh: move the wry wall backdrop to all signable rooms;

to wall-add (rm - a room):
	repeat through table of bad locs:
		if e1 entry is rm, now avail entry is true;
	wall-refresh;

mugged-first is a truth state that varies.

section when play begins - not for release

volume meta

book region and rooms

Gazy Gap is a room in Get a Guess. [crazy crap]

Hidey House is a room in Get a Guess. [mighty mouse: stuff that's only temporarily gone]

book meta verbs

check quitting the game: say "You say to yourself, not fully convinced, 'Best bit? Quest quit!'";

volume unsorted

volume Poorly Penned

volume Get a Guess

[this is a sort of fake region. There are fake rooms you can't visit.]

[a capped cone is a scenery.] [?? where? It leads to the Zapped Zone]

volume Vale Verminous

Table of Final Question Options (continued)
final question wording	only if victorious	topic		final response rule		final response activity
"see the points you [b]MISSED[r]"	true	"missed"	--	showmissesing
"see other [b]DEATH TRAPS[r]"	true	"death/traps/trap" or "death traps/trap"	--	showdeathsing
"see [b]ALT[r]ernate point scoring verbs"	true	"alt/alternate"	--	showaltverbsing
"see the [b]RANK[r]s"	true	"rank/ranks"	--	showranksing
"see lists of random text (RAND 0 for list, RAND 1-[number of rows in table of all randoms] for specific table, RN for next table)"	true	"RAND [number]"	--	rling
--	true	"RN"	--	rlning
--	true	"RAND"	--	rl0ing

chapter rling

rlning is an activity.

rule for rlning:
	increment last-table-tried;
	if last-table-tried > number of rows in table of all randoms:
		say "(Cycling back to the first table)[paragraph break]";
		now last-table-tried is 1;
	try randlisting last-table-tried instead;

rl0ing is an activity.

rule for rl0ing: try randlisting 0 instead;

rling is an activity.

rule for rling: try randlisting number understood instead;

randlisting is an action applying to one number.

last-table-tried is a number that varies.

carry out randlisting:
	let count be 0;
	say "[one of][line break]You can also rummage through Very Vile Fairy File Tables.i7x for details if you want.[or][stopping]";
	if number understood is 0:
		repeat through table of all randoms:
			increment count;
			say "[count]. [desc entry][line break]";
		the rule succeeds;
	if number understood < 0 or number understood > number of rows in table of all randoms, say "Need 1-[number of rows in table of all randoms]." instead;
	now last-table-tried is number understood;
	choose row number understood in table of all randoms;
	let mytab be tabnam entry;
	now count is 0;
	say "All random text for [desc entry]:[line break]";
	repeat through mytab:
		increment count;
		say "[randtxt entry][line break]";
		if the remainder after dividing count by 20 is 0, wfak;

chapter showranksing

showranksing is an activity.

rule for showranksing:
	let low-bound-score be 0;
	repeat through table of ranks:
		say "[rank-name entry] is [if rank-max entry > 0][low-bound-score] to [end if][rank-max entry] points.";
		now low-bound-score is rank-max entry + 1;
	say "[line break]Gold God is [core-max - 1] to [core-max] points. Yes, you get it before you get the last point, but if you UNDO, you'll see an (almost) to hedge things.";

chapter showaltverbsing

showaltverbsing is an activity.

rule for showaltverbsing:
	say "[2da]You could either [b]GROW GRIT[r], [b]SO SIT[r] or [b]OH IT[r] in Po['] Pit.";
	say "[2da]You could either [b]MASH MAP[r], [b]BASH BAP[r] or [b]RASH RAP[r] the cache cap.";
	say "[2da]You could either [b]FLIM FLAM[r] or [b]SKIM SCAM[r] to leave the Trim Tram.";
	say "[2da][b]BUMPED BUSTER[r] or [b]DUMPED DUSTER[r] could've cleared the clumped cluster.";
	say "[2da][b]WHAT A/WHATTA WANKSTA[r] would've annoyed the Gutta Ganksta.";
	say "[2da][b]KNEEL NEAR/FEEL FEAR/DEAL DEAR/HEAL HERE[r] could've had an ING because of the Ceiling Seer.";
	say "[2da]You could've dispersed the Blinding Blaze with [b]WINDING WAYS[r], [b]MINDING MAZE[r] or [b]FINDING PHASE[r].";
	say "[2da]You could've found the [b]LUCK LAIR[r] or the [b]SNUCK SNARE[r].";
	say "[2da][b]SILENT SAIL/SALE[r]  could've quieted the Violent Vale.";
	say "[2da][b]CULL CEASED[r] or [b]LUL LEAST[r] could've taken down the Bull Beast.";
	say "[2da][b]MINING MOOR/MORE[r] could give the pining poor employment.";
	say "[2da][b]WHOA/WOE/WHOAH WAIT[r] were all acceptable by the Go Gate in Airy Isle.";

chapter showmissesing

showmissesing is an activity.

rule for showmissesing:
	if rolling-yet is false, say "At any time, you could've guessed my pen name was a riff on [b]REALLY ROLLING[r].";
	if started-strong is false, say "In the Fun Fen, you could've used the wrong art for a [b]STRONG START[r].";
	if appeal-appear is false, say "You could've figured the Peeling Pier's brand name as [b]APPEALING APPEAR[r].";
	if gan-wan is false, say "You could've said [b]WHAT A or WHATTA WANKSTA[r] to the Gutta Ganksta before saying LOTS LAME in the mall.";
	if hap-ho is false, say "You could've said [b]HO HAPPEN[r] while listening to [Toe].";
	unless oi mo is moot, say "You could have [b]DIMD[r] (dim'd) the horrible song Oi Mo in Mystery Mall.";
	if lie-lol is false, say "You could've said [b]LIE LOL[r] to the shy shawl in Got Here Hot Here.";
	if trounce-track is false, say "You could've gone [b]NOT NEAR[r] in Got Gear Hot Here.";
	if jake-brie is false, say "You could've tried to [b]BREAK BRIE[r] with Jake G. after taking tea.";
	if clumped cluster is not moot, say "You could've cleared up the clumped cluster in Been Buggin['] with [b]BUMPED BUSTER[r] or [b]DUMPED DUSTER[r].";
	if wild weed is off-stage, say "You could've made the mild mead into [b]WILD WEED[r].";
	if wild weed is not moot, say "You could've tried to [b]SPARK SPLIFF[r] by Cark Cliff [if player has wild weed]with[else]once you had[end if] [if wild weed is off-stage]something worth lighting, from the mild mead[else]the wild weed[end if].";
	if beaker-yet is false, say "You could've given Reeker Russell [b]BEAKER BUSTLE[r] in the Gassed Gap/Last Lap.";

chapter showdeathsing

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

volume parser stuff

book command reading

after reading a command:
	if the player's command matches the regular expression "^ *<\*;>":
		if currently transcripting:
			say "Noted.";
			reject the player's command;

book parser errors

to decide whether buggin-freeze:
	if in-so-sad is true or in-way-wrong is true, yes;
	no;

table-to-scour is a table name that varies.

Rule for printing a parser error (this is the clue half right words rule):
	now table-to-scour is table of first check rhymes;
	abide by the mistake-checker rule;
	abide by the verb-checker rule;
	now table-to-scour is table of mistake substitutions;
	abide by the mistake-checker rule;
	if buggin-freeze:
		say "You can't do much, but that doesn't seem like it. You sort of have to break out of being and feeling [if in-so-sad is true]so sad[else]way wrong[end if].";
		the rule succeeds;
	continue the action;

zap-weird-break is a truth state that varies.

Rule for printing a parser error (this is the check for room name in player command rule):
	repeat with X running from 1 to the number of words in the player's command:
		if the printed name of location of player matches the regular expression "(^|\W)([word number X in the player's command])($|\W)", case insensitively:
			if word number 1 in the player's command is "ll":
				say "It looks like you may have tried to scan the current location. You just need to say LL to do this. Would you like to do so now?[line break]";
				if the player consents:
					skip upcoming rulebook break;
					now zap-weird-break is true;
					try lling location of player;
					now zap-weird-break is false;
					the rule succeeds;
				say "Okay. ";
			else:
				say "It looks like you may have tried to refer to the room name, or part of it. ";
			say "You never need to use the room name directly.";
			the rule succeeds;
	continue the action;

Rule for printing a parser error when the latest parser error is the can't see any such thing error:
	if player is in lake lea and jake-tea is false and word number 1 in the player's command is "take", continue the action;
	if player is in wet wood and word number 1 in the player's command is "get", continue the action;
	say "You can't see any objects like that here.";

Rule for printing a parser error when the latest parser error is the i beg your pardon error:
	say "Blank blather? Rank! Rather!"

the check for room name in player command rule is listed first in the for printing a parser error rulebook.

the clue half right words rule is listed before the check for room name in player command rule in the for printing a parser error rulebook.

Rule for printing a parser error when the latest parser error is the didn't understand error or the latest parser error is the not a verb I recognise error:
	if debug-state is true, say "[the latest parser error].";
	say "[one of]You may have used an unrecognized verb, or a verb in the wrong context. Or maybe you just guessed the wrong action to solve a puzzle, and it wasn't close enough that I could offer a hint--if you feel I should add something, write to [email]. Or perhaps you poked at some scenery I neglected to implement or describe as unimportant to progress.[paragraph break][b]VERBS[r] can show you a list used in this game. More obscure verbs from old-school parser games have been disabled, to help you focus on the puzzles.[or]This isn't something you need to do here. [b]VERBS[r] has a list of standard verbs.[stopping]";

ha-half is a truth state that varies.

zap-core-entry is a truth state that varies.

to up-which (ts - a truth state):
	if ts is true:
		up-reg;
	else:
		up-min;
		increment cur-bonus

this is the verb-checker rule:
	let local-ha-half be false;
	let brightness be false;
	repeat through the table of verb checks:
		let my-count be 0;
		if buggin-freeze and ver-rule entry is vc-get-good rule, break;
		if the player's command matches the regular expression "(^|\W)([w1 entry])($|\W)", increment my-count;
		if there is a w2 entry:
			if the player's command matches the regular expression "(^|\W)([w2 entry])($|\W)", increment my-count;
		else if my-count > 0:
			increment my-count;
		let wfull-fail be false;
		[say "[ver-rule entry].";]
		if there is a wfull entry:
			if the player's command matches the wfull entry:
				now my-count is 3;
			else if my-count is 2:
				now wfull-fail is true;
		if my-count >= 2:
			process the ver-rule entry;
			if the rule failed:
				next;
			else if the rule succeeded:
				if in-so-sad is true and do-rule entry is not vr-glow-glad rule, say "Maybe later, when you're not feeling so sad ... so sad ..." instead;
				if in-way-wrong is true and do-rule entry is not vr-stay-strong rule, say "Maybe later, when you're not feeling way wrong ... way wrong ..." instead;
				if okflip entry is false:
					unless my-count is 3 or there is no w2 entry or the player's command matches the regular expression "^([w1 entry])\W": [this is for the DIM'D test case... and "my-count is 3" is a hack for FLIMFLAM]
						say "You've got it backwards! Just flip things around, and it'll be okay.";
						the rule succeeds;
				if wfull-fail is true:
					say "Ooh! You're close, but you juggled things up, somehow.";
					the rule succeeds;
				if there is a core entry and idid entry is false:
					up-which core entry;
					if core entry is false:
						increase lump-count by 1;
				now idid entry is true;
				process the do-rule entry;
				if zap-core-entry is true: [must be after "process the do-rule entry" or next LLP may not register]
					blank out the core entry;
					now zap-core-entry is false;
				process the notify score changes rule;
				if there is a core entry and core entry is false, check-lump-progress;
			process the note right guess wrong time rule;
			the rule succeeds;
		if ha-half is true and my-count is 1: [there is a bug here with, say, DEAL DIER instead of DEAL DEAR. It prints something extra.]
			now vc-dont-print is true;
			now already-rhymed-this is false;
			process the ver-rule entry;
			if the rule failed:
				now vc-dont-print is false;
				next;
			now vc-dont-print is false;
			if already-rhymed-this is true, break;
			now local-ha-half is true;
			if debug-state is true, say "DEBUG: [ver-rule entry] tipped off the HA HALF button.";
			if there is a core entry and core entry is true, now brightness is true;
			next;
	if local-ha-half is true:
		say "The HA HALF button lights up on your Leet Learner[if brightness is false], but dimly[end if].";
		the rule succeeds;

already-rhymed-this is a truth state that varies.

vc-dont-print is a truth state that varies.

next-lump-level is a number that varies. next-lump-level is 5.
next-lump-delta is a number that varies. next-lump-delta is 1.
lump-count is a number that varies. lump-count is 0.
lump-charges is a number that varies. lump-charges is 0.
lump-uses is a number that varies. lump-uses is 0.
max-guesses-needed is a number that varies. max-guesses-needed is 10.

to check-lump-progress:
	increment lump-count;
	if debug-state is true, say "DEBUG count=[lump-count] level=[next-lump-level].";
	if lump-count >= next-lump-level:
		say "[line break][if lurking lump is off-stage]Thwup! You hear a sound...and notice a lurking lump has fallen. Gazing at its dull shine, you realize it could help you move ahead on a tricky rhyme, at the right place at the right time, with [jjj].[paragraph break]You take the lump[else if lurking lump is moot]Thwup! A lurking lump appears again. You take it[else]The lurking lump pulses and grows. All your guesses have paid off[end if].";
		now player has lurking lump;
		increment lump-charges;
		decrease lump-count by next-lump-level;
		increase next-lump-level by next-lump-delta;
		if next-lump-level > max-guesses-needed, now next-lump-level is max-guesses-needed;

a lurking lump is a boring thing. description is "The lurking lump shines dully. It looks to have [lump-charges in words] charge[plur of lump-charges] for you to make a JERKING JUMP (JJ) if anything is baffling you.". bore-text of lurking lump is "You can only JERKING JUMP (JJ) with the lurking lump."

this is the mistake-checker rule:
	repeat through table-to-scour:
		if the player's command matches mist-cmd entry:
			process the mist-rule entry;
			if the rule succeeded:
				say "[mist-txt entry][line break]";
				let see-leet-read be true;
				if there is a leet-rule entry:
					process the leet-rule entry;
					unless the rule succeeded, now see-leet-read is false;
				if see-leet-read is true:
					let d1 be -10;
					let d2 be -10;
					if there is a w1let entry:
						now d1 is w1let entry - number of characters in word number 1 in the player's command;
						if there is a w2let entry:
							now d2 is w2let entry - number of characters in word number 2 in the player's command;
						if d2 is -10, now d2 is d1;
						say "[leetclue of cluecheat of d1 and d2].";
				if got-yet entry is false:
					check-lump-progress;
				now got-yet entry is true;
				the rule succeeds;

to decide which cheattype is the cluecheat of (n1 - a number) and (n2 - a number):
	if n2 > n1, decide on cluecheat of n2 and n1;
	if n1 is 0 and n2 is 0, decide on leteq; [center]
	if n1 > 0 and n2 is 0, decide on partplus; [center left]
	if n1 > 0 and n2 > 0, decide on letplus; [left]
	if n1 is 0 and n2 < 0, decide on partminus; [center right]
	if n1 < 0 and n2 < 0, decide on letminus; [right]
	decide on letboth; [one +, one minus, wobbles]

section jerkingjumping

jerkingjumping is an action applying to nothing.

understand the command "jerking jump" as something new.
understand the command "jj" as something new.

understand "jerking jump" as jerkingjumping.
understand "jj" as jerkingjumping.

in-jerk-jump is a truth state that varies.

to say firstor of (t - indexed text):
	replace the regular expression "\|.*" in t with "";
	say "[t in upper case]";

to lump-minus:
	decrement lump-charges;
	say "The lurking lump shrivels[if lump-charges is 0] and vanishes. Maybe more good guesses will bring it back[one of][or] again[stopping][else], but it still looks functional[end if].";
	if lump-charges is 0, moot lurking lump;
	now in-jerk-jump is false;
	increment lump-uses;
	process the notify score changes rule;

carry out jerkingjumping:
	if debug-state is false:
		if lurking lump is off-stage, say "You have nothing that would help you do that." instead;
		if lurking lump is moot, say "You used up all the lump's charges, but maybe you can get more." instead;
	else:
		say "DEBUG: ignoring the charges in the lump, currently at [lump-charges].";
	now in-jerk-jump is true;
	if in-bull-chase is true and bull-null is true:
		if snuck snare is not moot, say "The lurking lump remains immovable. Perhaps you can't quite outrun or outsmart the Beer Bull, yet, and you'll have to take your lumps. Which is a hint in its own way, I guess." instead;
		say "The lurking lump bounces down and around all the way to the Knives Niche. Where you trick the beer bull into running into the trap you set. You head back to the Gear Gull in Here Hull.";
		solve-bull-chase;
		lump-minus;
		the rule succeeds;
	if doable-hinted > 0:
		say "The lump glistens weirdly. Perhaps you've forgotten something you can do. Use it anyway?";
		unless the player yes-consents:
			say "OK. You may wish to THINK to see what you can do." instead;
	now vc-dont-print is true;
	repeat through table of verb checks:
		unless there is a core entry, next;
		if core entry is false, next;
		if idid entry is true, next;
		process the ver-rule entry;
		if the rule succeeded:
			say "After some thought, you consider the right way forward: [firstor of w1 entry] [firstor of w2 entry]...";
			now idid entry is true; [this is so BURY BILE gets processed. We already checked IDID above.]
			up-which core entry; [?? I really need to clean this code up. I want just to increment the score in one place. If a rule can keep track of the current row, that would be nifty.]
			process the do-rule entry;
			if zap-core-entry is true:
				blank out the core entry;
				now zap-core-entry is false;
			skip upcoming rulebook break;
			lump-minus;
			now vc-dont-print is false;
			showme save undo state;
			disable saving of undo state;
			showme save undo state;
			the rule succeeds;
	now vc-dont-print is false;
	say "The lurking lump remains immovable. I guess you've done all you need, here.";
	the rule succeeds.

section verb check table

[verb check and verb run rules. This is in approximate game-solve order.]

table of verb checks [xxvc]
w1 (text)	w2 (text)	okflip	core	idid	ver-rule	do-rule	wfull (topic)
"glow"	"glad"	true	true	false	vc-glow-glad rule	vr-glow-glad rule	-- [start interlude-y]
"stay"	"strong"	false	true	false	vc-stay-strong rule	vr-stay-strong rule	-- [must be at top for JJ]
"get"	"good"	false	true	false	vc-get-good rule	vr-get-good rule	-- [start Intro]
"gift"	"giver"	false	true	false	vc-gift-giver rule	vr-gift-giver rule	--
"find"	"fault"	true	true	false	vc-find-fault rule	vr-find-fault rule	--
"green"	"grass"	false	true	false	vc-green-grass rule	vr-green-grass rule	--
"grow|oh|so"	"grit|it|sit"	true	true	false	vc-grow-grit rule	vr-grow-grit rule	"grow grit" or "oh it" or "so sit"
"mash|bash|rash|slash"	"map|bap|rap|slap"	true	true	false	vc-mash-map rule	vr-mash-map rule	"mash map" or "bash bap" or "rash rap" or "slash slap"
"mind"	"me"	false	true	false	vc-mind-me rule	vr-mind-me rule	--
"flim|skim"	"flam|scam"	false	true	false	vc-flim-flam rule	vr-flim-flam rule	"flim flam" or "flimflam" or "skim scam"
"spark"	"spliff"	true	false	false	vc-spark-spliff rule	vr-spark-spliff rule	-- [start of Fun Fen]
"strong"	"start"	true	false	false	vc-strong-start rule	vr-strong-start rule	--
"fall"	"free"	true	true	false	vc-fall-free rule	vr-fall-free rule	--
"dive"	"deep"	true	true	false	vc-dive-deep rule	vr-dive-deep rule	--
"paper"	"pile"	true	true	false	vc-paper-pile rule	vr-paper-pile rule	--
"backed"	"binder"	false	true	false	vc-backed-binder rule	vr-backed-binder rule	--
"appealing"	"appear"	true	false	false	vc-appealing-appear rule	vr-appealing-appear rule	-- [start of Real Rear]
"kneel|kneeling"	"near"	false	true	false	vc-kneel-near rule	vr-kneel-near rule	--
"feel|feeling"	"fear"	false	true	false	vc-feel-fear rule	vr-feel-fear rule	--
"deal|dealing"	"dear"	true	true	false	vc-deal-dear rule	vr-deal-dear rule	--
"heal|healing"	"here"	true	true	false	vc-heal-here rule	vr-heal-here rule	--
"history"	"hall"	false	--	false	vc-history-hall rule	vr-history-hall rule	--
"mystery"	"mall"	false	true	false	vc-mystery-mall rule	vr-mystery-mall rule	--
"dark"	"door"	false	true	false	vc-dark-door rule	vr-dark-door rule	-- [start stark store]
"mark"	"more"	false	true	false	vc-mark-more rule	vr-mark-more rule	--
"cleared"	"clay"	true	true	false	vc-cleared-clay rule	vr-cleared-clay rule	--
"bumped|dumped"	"buster|duster"	true	false	false	vc-bumped-buster rule	vr-bumped-buster rule	"bumped buster" or "dumped duster"
"tight"	"tunnel"	false	true	false	vc-tight-tunnel rule	vr-tight-tunnel rule	-- [start fight funnel]
"knives"	"niche"	false	true	false	vc-knives-niche rule	vr-knives-niche rule	-- [start dives ditch]
"wild"	"weed"	true	false	false	vc-wild-weed rule	vr-wild-weed rule	--
"lots"	"lame"	false	true	false	vc-lots-lame rule	vr-lots-lame rule	-- [start Mystery Mall]
"no"	"nappin"	true	true	false	vc-no-nappin rule	vr-no-nappin rule	--
"ho"	"happen"	true	false	false	vc-ho-happen rule	vr-ho-happen rule	--
"dimd"	--	false	false	false	vc-dimd rule	vr-dimd rule	--
"whatta"	"wanksta"	true	false	false	vc-whatta-wanksta rule	vr-whatta-wanksta rule	"what a wanksta" or "whatta wanksta"
"youre|your|yore"	"yonder"	false	true	false	vc-youre-yonder rule	vr-youre-yonder rule	--
"glean"	"glows"	false	true	false	vc-glean-glows rule	vr-glean-glows rule	--
"smashing"	"smoke"	false	true	false	vc-smashing-smoke rule	vr-smashing-smoke rule	-- [start Y'Old Yard]
"lending"	"libe"	false	true	false	vc-lending-libe rule	vr-lending-libe rule	-- [start vending vibe]
"see"	"sign"	false	true	false	vc-see-sign rule	vr-see-sign rule	--
"hard"	"hat"	false	true	false	vc-hard-hat rule	vr-hard-hat rule	-- [start got gear hot here]
"lie"	"lol"	true	false	false	vc-lie-lol rule	vr-lie-lol rule	--
"not"	"near"	true	false	false	vc-not-near rule	vr-not-near rule	--
"beast"	"boss"	true	true	false	vc-beast-boss rule	vr-beast-boss rule	-- [start Creased Cross]
"cull|lul"	"ceased|least"	true	true	false	vc-cull-ceased rule	vr-cull-ceased rule	"cull ceased" or "lul least"
"full"	"feast"	true	true	false	vc-full-feast rule	vr-full-feast rule	--
"least"	"loss"	true	true	false	vc-least-loss rule	vr-least-loss rule	--
"loft"	"land"	false	true	false	vc-loft-land rule	vr-loft-land rule	-- [start soft sand]
"soft"	"sand"	false	--	false	vc-soft-sand rule	vr-soft-sand rule	--
"plain"	"pleasant"	true	true	false	vc-plain-pleasant rule	vr-plain-pleasant rule	-- [start foe field]
"show"	"shield"	true	true	false	vc-show-shield rule	vr-show-shield rule	--
"cool"	"cap"	true	true	false	vc-cool-cap rule	vr-cool-cap rule	-- [start curst cave]
"dreaming"	"dull"	true	true	false	vc-dreaming-dull rule	vr-dreaming-dull rule	--
"first"	"fave"	false	true	false	vc-first-fave rule	vr-first-fave rule	--
"moral"	"mage"	false	true	false	vc-moral-mage rule	vr-moral-mage rule	--
"work"	"well"	true	true	false	vc-work-well rule	vr-work-well rule	-- [start shirk shell]
"dear"	"dull"	true	true	false	vc-dear-dull rule	vr-dear-dull rule	-- [start here hull]
"near"	"null"	true	true	false	vc-near-null rule	vr-near-null rule	--
"sit"	"sound"	false	true	false	vc-sit-sound rule	vr-sit-sound rule	-- [start pit pound]
"fit"	"found"	true	true	false	vc-fit-found rule	vr-fit-found rule	--
"winding|minding|finding"	"ways|maze|phase|fays"	false	true	false	vc-winding-ways rule	vr-winding-ways rule	"winding ways" or "minding maze" or "finding phase/fays" [start blinding blaze]
"mo"	"mappin"	true	true	false	vc-mo-mappin rule	vr-mo-mappin rule	--
"luck|snuck"	"lair|snare"	false	true	false	vc-luck-lair rule	vr-luck-lair rule	"luck lair" or "snuck snare"
"brightening"	"bridge"	false	true	false	vc-brightening-bridge rule	vr-brightening-bridge rule	-- [start Violent Vale]
"silent"	"sail|sale"	false	true	false	vc-silent-sail rule	vr-silent-sail rule	--
"boring"	"boat"	false	true	false	vc-boring-boat rule	vr-boring-boat rule	--
"wake"	"whee|wee"	true	true	false	vc-wake-whee rule	vr-wake-whee rule	-- [start Lake Lea]
"take"	"tea"	false	true	false	vc-take-tea rule	vr-take-tea rule	--
"fake"	"fee"	false	true	false	vc-fake-fee rule	vr-fake-fee rule	--
"break"	"brie"	false	false	false	vc-break-brie rule	vr-break-brie rule	--
"make"	"map"	false	true	false	vc-make-map rule	vr-make-map rule	-- [start Lake Lap]
"snake"	"snap"	true	true	false	vc-snake-snap rule	vr-snake-snap rule	--
"co"	"capn"	false	true	false	vc-co-capn rule	vr-co-capn rule	--
"so"	"sappin"	true	true	false	vc-so-sappin rule	vr-so-sappin rule	-- [start whining war]
"shining"	"shore"	false	true	false	vc-shining-shore rule	vr-shining-shore rule	--
"mining"	"more|moor"	true	true	false	vc-mining-more rule	vr-mining-more rule	--
"dining"	"door"	false	true	false	vc-dining-door rule	vr-dining-door rule	--
"mean"	"muggin"	false	true	false	vc-mean-muggin rule	vr-mean-muggin rule	--
"lean"	"luggin"	false	true	false	vc-lean-luggin rule	vr-lean-luggin rule	--
"pull"	"pieced"	true	true	false	vc-pull-pieced rule	vr-pull-pieced rule	--
"cast"	"cap"	false	true	false	vc-cast-cap rule	vr-cast-cap rule	-- [start gassed gap]
"beaker"	"bustle"	true	false	false	vc-beaker-bustle rule	vr-beaker-bustle rule	--
"meeker"	"muscle"	true	true	false	vc-meeker-muscle rule	vr-meeker-muscle rule	--
"wood"	"one"	false	true	false	vc-wood-one rule	vr-wood-one rule	--
"go"	"gappin"	false	true	false	vc-go-gappin rule	vr-go-gappin rule	--
"couple"	"caps"	false	true	false	vc-couple-caps rule	vr-couple-caps rule	--
"lot"	"lord"	false	true	false	vc-lot-lord rule	vr-lot-lord rule	-- [start airy isle]
"hot"	"horde"	false	true	false	vc-hot-horde rule	vr-hot-horde rule	--
"got"	"gored"	false	true	false	vc-got-gored rule	vr-got-gored rule	--
"whoa|whoah|woe"	"wait"	true	true	false	vc-whoa-wait rule	vr-whoa-wait rule	--
"tell"	"torn"	false	true	false	vc-tell-torn rule	vr-tell-torn rule	-- [start tarry tile/merry mile]
"merry"	"mile"	false	true	false	vc-merry-mile rule	vr-merry-mile rule	--
"bury"	"bile"	false	true	false	vc-bury-bile rule	vr-bury-bile rule	--
"big"	"bag"	true	true	false	vc-big-bag rule	vr-big-bag rule	-- [two any-time things]
"really"	"rolling"	true	false	false	vc-really-rolling rule	vr-really-rolling rule	--

[ this is stuff for beta commands below ]

in-test-loop is a truth state that varies.

section to-x stubs

to decide whether print-why-fail:
	if in-test-loop is true, no;
	if in-jerk-jump is true, no;
	yes;

to say seer-sez: say ". The Ceiling Seer seems to be watching down on you, saying you can't do that yet"

to loop-note (t - text):
	if in-test-loop is true, say "COMMAND: [t]...[paragraph break]";

to check-missing-necc:
	repeat through table of verb checks:
		if there is a core entry and core entry is true and idid entry is false:
			say "[one of]COMMANDS YOU SKIPPED DUE TO A BUG, SO PLEASE LET ME KNOW:[paragraph break][or][stopping]";
			say "[w1 entry] [w2 entry].";

to win-the-game:
	[rejig-status;]
	if wry-wall-found < 2 or wry-wall-found is number of rows in table of bad locs:
		choose row with final response activity of showdeathsing in the Table of Final Question Options;
		blank out the whole row;
	if score is maximum score:
		choose row with final response activity of showmissesing in the Table of Final Question Options;
		blank out the whole row; [don't let the player see MISSED if they got everything]
	clue-zap "BURY BILE";
	phbt Tarry Tile;
	say "Yes. You know what to do. As you bury the bile -- yours for others you have met in the game and in the past, the Very Vile Fairy File itself dissolves. The Merry Mile changes significantly. A puffed portal appears, and you give a chuffed chortle as you walk through. Your surroundings change.[paragraph break]You wind up back in the Fun Fen, where everyone you met (and didn't eat or lure to a gruesome end) in your adventure congratulates you, even the Bot Board! There's lots of 'I don't know what I was thinking! I'm glad you didn't let me stop you!' and 'I knew you could do it, sport,' and stuff, but with the Very Vile Fairy File recently vanquished, people let it slide. Someone even has the nerve to say that we all have to do small things every day to defeat the Very Vile Fairy File lodged in our own hearts and embedded in society without any magic, but the mood's so positive, people nod and prepare for the task ahead.";
	process the notify score changes rule;
	if in-beta is true or debug-state is true:
		check-missing-necc;
	end the story finally saying "DEAL'S DONE: FEELS FUN!";
	follow the shutdown rules;

to check-gored-clue:
	say "[line break]";
	if Hot Horde is in Airy Isle and Lot Lord is in Airy Isle:
		say "The Hot Horde greets the Lord enthusiastically, waiting for a battle cry or something to pump them up and really focus on killing the hated Bot Board.";
		if tried-yet of "GOT GORED", say "[line break]Maybe the 'GOT GORED' battle cry you tried earlier would work better, now, with a leader and followers to use it properly.";
	else if Hot Horde is in Airy Isle:
		say "The Hot Horde runs around a bit, leaderless. You're not quite up to it. But maybe someone else is.";
	else:
		say "The Lot Lord surveys the isle, as if looking for followers. He doesn't have any, yet. But maybe you could help him find some!"

this is the shone-yet rule:
	if shore-shine is false, say "Too whiny for that right now." instead;

to lean-and-mean:
	say "[line break]";
	if lean-lugged is true and mean-mugged is true:
		say "Dean Duggan applauds you. 'You have learned two profound lessons from me. You are ready to wear this way woke clay cloak.' But it doesn't seem to fit, quite. 'Hmm. Well, with my training, you're worthy to carry it, at least. I've helped you all I can. Oh, if you want to give a bit back, can you take care of that clumped cluster over there? No obligation, no reward, just...well, it'd be nice.' He vanishes.[paragraph break]Hmm. Maybe you will find the way to make the clay cloak wearable elsewhere. Also, with your mind clearer, you notice a wry wall you missed before.";
		now player has clay cloak;
		moot Dean Duggan;
		move clumped cluster to Been Buggin';
		phbt Been Buggin';
		wall-add Been Buggin';
	else:
		say "'Not bad, but you can still do a bit more,' says Dean Duggan. 'You need to both look and feel tough.'"

lul-clue is a truth state that varies.

this is the lul-cull rule:
	now lul-clue is whether or not word number 1 in the player's command is "lul";

this is the ashap rule:
	now bap-map-rap is 0;
	if word number 1 in the player's command is "bash", now bap-map-rap is 1;
	if word number 1 in the player's command is "rash", now bap-map-rap is 2;

this is the trimtramcmd rule:
	now skim-not-flim is whether or not word number 1 in the player's command is "skim";

every turn when player is in Lake Lea or player is in Lake Lap:
	if Jake G is not in location of player and player is not in Violent Vale:
		say "Jake G follows behind.";
		move Jake G to location of player;
	continue the action;

to vcp (t - text): [verb conditional print]
	if vc-dont-print is false, say "[t][line break]";

to vcal (t - text): [verb conditional print, flag already rhymed]
	now already-rhymed-this is true;
	if vc-dont-print is false, say "[t][line break]";

rolling-yet is a truth state that varies.

section vc vr rules [xxvcvr]

this is the vc-appealing-appear rule:
	if player is not in real rear, the rule fails;
	if appeal-appear is true:
		vcal "The peeling pier already looks better.";
		continue the action;
	the rule succeeds;

this is the vr-appealing-appear rule:
	say "A little tilt of the head, a little impromptu cleanup, and suddenly you can see that the peeling pier's was, in fact, made by APPEALING-APPEAR. Yes, it looks nicer now, and of course, it doesn't HAVE to look perfect in such a spiritual area.";
	now appeal-appear is true; [probably shouldn't zap this and replace with "peeling pier is optional" checks...]
	now peeling pier is not optional;
	if healed-here is false:
		now cht of peeling pier is partminus; [->heal here]
	else:
		phbt peeling pier;

this is the vc-backed-binder rule:
	if paper pile is not touchable or player has the backed binder, the rule fails;
	the rule succeeds;

this is the vr-backed-binder rule:
	say "The papers labeled FACT FINDER should be useful. You find a way to glue them all together. They contain objective documentation of the Crimes Crew Times Two's exploits. You've been at the receiving end of some of their psychological tricks, and though you appreciate proof you weren't being oversensitive, you still shudder.";
	now player has backed binder;
	moot paper pile;
	set the pronoun it to backed binder;

this is the vc-beaker-bustle rule:
	if reeker russell is not touchable, the rule fails;
	if beaker-yet is true:
		vcal "You already did that!";
		continue the action;
	the rule succeeds;

this is the vr-beaker-bustle rule:
	say "You have a vision of a much nerdier version of Reeker Russell going around and performing weird experiments. But you quickly snap back to reality. Still, it's good to be able to laugh at things.";
	now beaker-yet is true;
	adjust-russell;

this is the vc-beast-boss rule:
	if player is not in Creased Cross, the rule fails;
	if Bull Beast is not off-stage:
		vcal "You already did.";
		continue the action;
	if player does not have gold guard:
		vcp "You don't feel armed for that, yet.";
		clue-later "BEAST BOSS";
		continue the action;
	if gull-guard is false:
		vcp "You aren't very confident your mold-marred gold guard could hold up in any sort of fight. You need to buff it up somehow first.";
		clue-later "BEAST BOSS";
		continue the action;
	the rule succeeds;

this is the vr-beast-boss rule:
	say "A Bull Beast appears to answer your summons. You hope you have done the right thing, as it roughs you up a bit. You'll need to minimize the damage, here!";
	move Bull Beast to Creased Cross;
	now need-loss is true;
	clue-zap "BEAST BOSS";
	set the pronoun it to Bull Beast;

this is the vc-big-bag rule:
	if player has big bag:
		vcal "You already made the big bag.";
		continue the action;
	the rule succeeds;

this is the vr-big-bag rule:
	say "The zig-zag rig rag does a little wig-wag (I guess what you'd call it,) and it transforms into a much more useful big bag!";
	moot zig zag rig rag;
	now player has big bag;
	set the pronoun it to big bag;

this is the vc-boring-boat rule:
	if player is not in violent vale or flooring float is off-stage, the rule fails;
	if boring boat is moot:
		vcal "You don't need to bring the boring boat back.";
		continue the action;
	if boring boat is in violent vale:
		vcal "The boat is already boring and practical enough.";
		continue the action;
	the rule succeeds;

this is the vr-boring-boat rule:
	say "The flooring float sinks and tips over slightly. Some of its excess cargo falls into the water, never to return. It becomes much leaner and more practical--a boring boat!";
	moot flooring float;
	move boring boat to Violent Vale;
	clue-zap "BURY BILE";
	set the pronoun it to boring boat;

this is the vc-break-brie rule:
	if jake is not touchable, the rule fails;
	if jake-woke is false:
		say "This bonus point action won't work until Jake is conscious.";
		continue the action;
	if jake-brie is true:
		vcal "Hey! Don't get greedy, now.";
		continue the action;
	the rule succeeds;

this is the vr-break-brie rule:
	say "'Ooh, good one! I almost forgot I had it. I don't like it. Here, have it all.' This might not help in the end, but yay free food.";
	now jake-brie is true;

this is the vc-brightening-bridge rule:
	if frightening fridge is not touchable, the rule fails;
	the rule succeeds;

this is the vr-brightening-bridge rule:
	say "The fridge collapses and flattens and provides a secure passage to the east!";
	moot frightening fridge;

this is the vc-bumped-buster rule:
	if clumped cluster is touchable, the rule succeeds;
	the rule fails;

this is the vr-bumped-buster rule:
	say "You start pushing and kicking at the clumped cluster. Parts of it break off, but not very quickly until you start chanting 'Bumped, buster.' And what do you know? You find a dumped duster that makes your browsing through the clumped cluster easier. The rest of the cleanup is easy. Your only reward for your hard work is -- satisfaction of a job well done and that anyone who wrote the Very Vile Fairy File would be upset indeed to see someone doing nice stuff, just because. You hope Dean Duggan is happy.";
	moot clumped cluster;

this is the vc-bury-bile rule:
	if player is in Tarry Tile:
		if well worn hell horn is moot and merry-mile is true, the rule succeeds;
		if well worn hell horn is in Tarry Tile:
			vcp "The well worn hell horn makes a loud noise. It's intimidating, and yet, you could find a way to prep yourself to ignore or get rid of the horn, then take the file.";
			clue-later "BURY BILE";
			continue the action;
		if merry-mile is false:
			vcp "You want to, but you're still just barely forcing it. You need a way to cheer yourself up to get going.";
			clue-later "BURY BILE";
			continue the action;
	clue-later "BURY BILE";
	if mrlp is Worst Whew:
		vcp "You try, and it seems right, but it's not that easy. You have quite a journey before you, until you can do that. But when the time is right, it will be very effective.";
		continue the action;
	if mrlp is Piddling Pain or mrlp is Browsy Breaks:
		vcp "You can sort of deal with that right now. But you need to do better! You still have adventure to go!";
		continue the action;
	if player is in Airy Isle:
		vcp "You'd like to do that, but not here with so many distractions, during perhaps the big last fight.";
		continue the action;
	if mrlp is Vale Verminous:
		vcp "It must be about the right time. But you are not quite there, yet.";
		continue the action;
	the rule fails;

this is the vr-bury-bile rule:
	now bile-buried is true;
	win-the-game;

this is the vc-cast-cap rule:
	if player is not in gassed gap, the rule fails;
	if cool cap is moot:
		vcal "The cap has been cast.";
		continue the action;
	if extra-cool-cap is false:
		let N be my-hats;
		if N is 0:
			vcp "You don't have any caps to cast.";
		else if N is 1:
			vcp "The [random gaphat enclosed by the player] isn't enough on its own.";
		else if N is 2:
			vcp "The [list of gaphats enclosed by the player] aren't quite enough.";
		else if N is 3:
			vcp "Wow! Three hats! They would be great to cast! But if only there was a way to combine them into an extra-cool hat you could cast all at once!";
		clue-later "CAST CAP";
		continue the action;
	the rule succeeds;

this is the vr-cast-cap rule:
	say "You cast your cap, and the haze to the north disappears. You can see the way! But you can also see someone big and mean: you know it must be (W)re(a/e)ker Russell!";
	moot cool cap;
	move Reeker Russell to Gassed Gap;
	phbt Gassed Gap;
	clue-zap "CAST CAP";
	set the pronoun him to reeker russell;

this is the vc-cleared-clay rule:
	if player is not in Stark Store, the rule fails;
	if weird way is moot:
		vcal "The clay is cleared enough.";
		continue the action;
	the rule succeeds;

this is the vr-cleared-clay rule:
		say "You concentrate on the weird way, which is, uh, weirder than trying to clear it with actual hard physical work. But it's effective! The clay crumbles and sinks into the ground. You can go down now!";
	moot weird way;

this is the vc-co-capn rule:
	if player does not have toe tappin or snake-snap is true, the rule fails;
	if jake-cocapn is true:
		vcal "Jake already is[if jake is not touchable] and will be when you return to see him[end if].";
		continue the action;
	if jake is not touchable:
		vcp "It might be nice to have a cohort for a bit, but there's nobody worthy here.";
		clue-later "CO CAPN";
		continue the action;
	if jake-fee is false:
		vcp "You haven't (yet) bonded with Jake G. enough for that.";
		clue-later "CO CAPN";
		continue the action;
	the rule succeeds;

this is the vr-co-capn rule:
	say "Jake smiles as you pronounce him an equal partner in whatever you find.";
	now jake-cocapn is true;
	clue-zap "CO CAPN";
	process the check-sing-max rule;

this is the vc-cool-cap rule:
	if tool tap is not touchable, the rule fails;
	the rule succeeds;  [?? YOULL YAP / CRUEL CRAP !!!!!]

this is the vr-cool-cap rule:
	say "Whoah! A cool cap must REALLY have been stuck in the tool tap. Somehow, it squeezes through. It appears to be sturdy, with no obvious rips. The tool tap explodes and vaporizes from the effort of having squeezed out the cool cap.";
	now player has cool cap;
	moot tool tap;

this is the vc-couple-caps rule:
	if player does not have jerk gel, the rule fails;
	if my-hats < 3: [this seems a bit awkward, but I put it this way so vc.py can detect CONTINUE THE ACTION as appropriate]
		if my-hats is 2:
			vcp "You'd think if you're coupling, you'd only need two hats or caps, but after some fiddling, you realize you need one more. Bummer!";
		else if my-hats is 1:
			vcp "You need at least one more hat to couple the CAPS.";
		else:
			vcp "You have no caps to couple. Maybe one day, though.";
		clue-later "COUPLE CAPS";
		continue the action;
	the rule succeeds;

this is the vr-couple-caps rule:
	say "Surprisingly, you don't need instructions to combine the hard hat, cool cap and cake cap into, well, an extra-cool cap. It's--well, it's got to be good for something dramatic!";
	moot hard hat;
	moot cake cap;
	moot jerk gel;
	now printed name of cool cap is "extra cool cap";
	now extra-cool-cap is true;
	clue-zap "COUPLE CAPS";

this is the vc-cull-ceased rule:
	if bull beast is off-stage, the rule fails;
	process the lul-cull rule; [to determine which was the first word, LUL LEAST or CULL CEASED]
	if player is not in Creased Cross:
		clue-later "CULL CEASED";
		vcp "You need to go back to Creased Cross.";
		continue the action;
	if healed-here is false:
		clue-later "CULL CEASED";
		vcp "You need to find a way to restore your health.";
		continue the action;
	if bull beast is boring:
		vcal "Don't brag too much, now.";
		continue the action;
	the rule succeeds;

this is the vr-cull-ceased rule:
	say "Your battle cry, coupled with your new improved healed self, worries the Bull Beast. But what worries it even more is the Spiel Spear that flashes suddenly in your hand. Your faith in the Ceiling Seer is rewarded! Your words, which the spear translates into a few sharp slurps, groans and growls, cause the Bull Beast to run off in extreme psychological anguish before collapsing from something stress-related, I guess. Or maybe from being embarrassed about being so embarrassed by so little.[paragraph break]You give chase, and it traps and lashes out at you. Reflexively, you block with the spear and strike back. Your first swipe is lethal.[paragraph break]Perhaps you can do something constructive with the Bull Beast's dead body.";
	now cull-ceased is true;
	now bull beast is boring; [?? what if dead]
	now cht of bull beast is leteq; [bull beast->full feast]
	clue-zap "CULL CEASED";

this is the vc-dark-door rule:
	if player is not in stark store, the rule fails;
	if dark door is not off-stage:
		vcal "You already made the dark door appear[if dark door is moot] and disappear to create a passage[end if].";
		continue the action;
	the rule succeeds;

this is the vr-dark-door rule:
	say "Hey, wait a minute! You have a closer look and notice the outline of a dark door. Now you've seen it, you can't un-see it. There we go!";
	move dark door to Stark Store;
	set the pronoun it to dark door;

this is the vc-deal-dear rule:
	if player is not in Real Rear, the rule fails;
	if felt-fear is false:
		clue-later "DEAL DEAR";
		vcp "You haven't found anything you need to deal with[seer-sez].";
		continue the action;
	if cage key is not off-stage:
		vcal "Overdoing dealing with it is ... one way to show you might not be dealing with it.";
		continue the action;
	the rule succeeds;

this is the vr-deal-dear rule:
	say "You reflect and have faith in yourself. Help will come at a good time, when you do not feel too desperate. And wait! It's coming now! The Sage Sea calms and parts briefly to reveal a cage key. You step in, not worried it may engulf you, because you've practiced your serenity. You retrieve the key with no problems.";
	now player has cage key;
	phbt Real Rear;
	phbt steel steer;
	clue-zap "DEAL DEAR";

this is the vc-dear-dull rule:
	if player is not in here hull, the rule fails;
	if beer bull is moot:
		vcal "Yeah, easy to say with the beer bull gone for good.";
		continue the action;
	if in-bull-chase is true:
		vcal "You don't need to do any more taunting.";
		continue the action;
	the rule succeeds;

this is the vr-dear-dull rule:
	now zap-core-entry is true;
	say "The beer bull twitches[one of][or] again[stopping]. One thing it can't abide is being called dull! It's going to be chasing after you for a bit[if bull-null is false]. Watch out--it's super-charged. Maybe you can find some way to make it a little less terrifying[end if].";
	start-bull-chase;

this is the vc-dimd rule:
	if oi mo is not touchable, the rule fails;
	the rule succeeds;

this is the vr-dimd rule:
	say "The beats of [i]Oi, Mo[r] quiet down out of hearing. You're worried they may be replaced by some song like [i]Primp'r[r] or flip flop to [i]Tip Top Hip Hop[r], but it's your lucky day. It's calmer now--random songs have started playing, which you can LISTEN to if you want.";
	if gutta ganksta is in history hall, say "[line break]The Gutta Ganksta, upset at the change in music, petulantly lashes out 'Hey, hack! Way wack!'";
	moot oi mo;

this is the vc-dining-door rule:
	if player is not in Whining War, the rule fails; [?? big problem with what replaces Violent Vale]
	if war-sapped is false:
		clue-later "DINING DOOR";
		vcp "You can't make a dining door with all this whining going on!";
		continue the action;
	if shore-shine is false:
		vcp "You hear a rumbling, but it's still too dingy here for anything nice like a dining door.";
		clue-later "DINING DOOR";
		continue the action;
	if dine-door is true:
		vcal "You already did.";
		continue the action;
	the rule succeeds;

this is the vr-dining-door rule:
	say "Up from the ground, a dining door rumbles and appears. From behind, you hear a cheery song: 'Merry mood, fairy food, dairy dude.' You try to open it but fail. Perhaps it will open when the time is right, and things are taken care of.";
	now dine-door is true;
	move dining door to Whining War;
	clue-zap "DINING DOOR";
	phbt Whining War;
	set the pronoun it to dining door;

this is the vc-dive-deep rule:
	if hive heap is not touchable, the rule fails;
	the rule succeeds;

this is the vr-dive-deep rule:
	say "You look through the hive heap. You don't hear buzzing. You keep throwing hives over Cark Cliff or ripping them up until a vapor vial clatters out.";
	moot hive heap;
	bring-here vapor vial;
	set the pronoun it to vapor vial;

this is the vc-dreaming-dull rule:
	if screaming skull is not touchable, the rule fails;
	the rule succeeds;

this is the vr-dreaming-dull rule:
	moot screaming skull;
	say "The screaming skull stops screaming and starts alternatively snoring and mumbling about that time it wound up naked at Undead Orientation, or the time the ghost of its secret crush found proof of said crush, or its own groundhog day studying for an exam it still can't pass, dreaming of their job when home from work, or walking in as a skeleton at its own funeral, or how it wrote a brilliant poem but then woke up, or how its final judgment went a bit differently, for better or worse.[paragraph break]The whining outlasts your own empathy and interest, both real and (later) feigned. The skull, upset and exhausted from its harangue, rolls off through the worst wave. Unable to help yourself, you call out 'May you sleep in interesting dreams!'";

this is the vc-fake-fee rule:
	if jake is not touchable, the rule fails;
	if jake-woke is false:
		vcp "Maybe when Jake is awake.";
		clue-later "FAKE FEE";
		continue the action;
	if jake-tea is false:
		vcp "But Jake has given you nothing of value yet.";
		clue-later "FAKE FEE";
		continue the action;
	if jake-fee is true:
		vcal "That's over. Time to work with Jake!";
		the continue the action;
	the rule succeeds;

this is the vr-fake-fee rule:
	say "You and Jake have a laugh about how you'd like to pay, and he'd like payment, but that's not really what's important here. Jake is ready to work with you off to the east!";
	now jake-fee is true;
	now jake g is optional;
	now cht of jake g is letplus; [->break brie]
	clue-zap "FAKE FEE";

this is the vc-fall-free rule:
	if player is not in Fun Fen, the rule fails;
	if tree-down is true:
		vcal "The tree is already fallen. It's in a good place.";
		continue the action;
	the rule succeeds;

this is the vr-fall-free rule:
	say "The tree, already tipping over a bit, leans and ... falls over, creating safe passage to the north. Also, a hive heap falls from the tree and lands nearby. It seems worth a look.[paragraph break]You get greedy for a second wishing it was a teal tree so you could feel free, too, but this is good enough.";
	now tree-down is true;
	phbt tall tree;
	move hive heap to Fun Fen;
	set the pronoun it to hive heap;

this is the vc-feel-fear rule:
	if player is not in Real Rear, the rule fails;
	if knelt-yet is false:
		clue-later "FEEL FEAR";
		vcp "Fear isn't something you can, or want to, force[seer-sez].";
		continue the action;
	if felt-fear is true:
		vcal "No need to overdo feeling fear.";
		continue the action;
	the rule succeeds;

this is the vr-feel-fear rule:
	say "You let yourself feel fear, both of physical harm and of being unable to figure a way to any secret areas. Admitting to this fear helps a bit, but somehow, you have to put your fear aside.";
	now felt-fear is true;
	clue-zap "FEEL FEAR";

this is the vc-find-fault rule:
	if player is not in Vined Vault, the rule fails;
	if mean mass is in Vined Vault:
		if print-why-fail, vcal "You already did, and things got worse. You'll have to try something else.";
		continue the action;
	the rule succeeds;

this is the vr-find-fault rule:
	loop-note "FIND FAULT";
	say "It sure seems, at first glance, like the Vined Vault is inescapable. But you notice a few flaws. A loose tile, a crack in the wall ... you have all sorts of time, and there are no guards. And here you go ... if you do THIS, and THIS ...[wfak]";
	say "[line break]But of course something outside rushes into the fault you found in the vault. A mean mass roars in and mangles the packet of Mind Malt! It pulses threateningly, and while it hasn't attacked you, it now blocks your way out!";
	move mean mass to Vined Vault;
	moot mind malt;
	phbt Vined Vault;
	set the pronoun it to mean mass;

this is the vc-first-fave rule:
	if player is not in curst cave, the rule fails;
	if first-fave is true:
		vcal "The curst cave is already a cheerier place.";
		continue the action;
	if screaming skull is in Curst Cave:
		clue-later "FIRST FAVE";
		vcp "You can't like anything with that screaming skull around!";
		continue the action;
	the rule succeeds;

this is the vr-first-fave rule:
	say "Suddenly, the worst wave isn't very bad or evil at all. In fact, with a bit of time, it recedes to reveal a tool tap.";
	now first-fave is true;
	move tool tap to Curst Cave;
	moot worst wave;
	clue-zap "FIRST FAVE";
	set the pronoun it to tool tap;

this is the vc-fit-found rule:
	if player is not in pit pound, the rule fails;
	if found-fit is true:
		vcal "You already fit in.";
		continue the action;
	if hit hound is in pit pound:
		vcp "Maybe later, but you can't focus on that with the Hit Hound around.";
		clue-later "FIT FOUND";
		continue the action;
	the rule succeeds;

this is the vr-fit-found rule:
	say "You feel comfortable here now. Comfortable enough to enter and leave as you please. Woohoo!";
	now found-fit is true;
	clue-zap "FIT FOUND";
	phbt pit pound;

this is the vc-flim-flam rule:
	if player is not in trim tram, the rule fails;
	if me-minded is false:
		process the trimtramcmd rule;
		vcp "That's a good idea, but you don't have the confidence yet! You need to get your bearings a bit.";
		clue-later "FLIM FLAM";
		continue the action;
	the rule succeeds;

this is the vr-flim-flam rule:
	loop-note "FLIM FLAM/SKIM SCAM";
	say "That does it! The tram moves off to a more open place...";
	process the trimtramcmd rule;
	move the player to Fun Fen;
	clue-zap "FLIM FLAM";
	phbt Trim Tram;

this is the vc-full-feast rule:
	if Bull Beast is not in location of player, the rule fails;
	if Bull Beast is not boring:
		clue-later "FULL FEAST";
		vcp "That should work. It might work better if the Bull Beast were incapacitated.";
		continue the action;
	the rule succeeds;

this is the vr-full-feast rule:
	say "BOOM! You managed to make a full feast of the Bull Beast. But there's a lot of it. It'll be hard to move all at once.";
	moot Bull Beast;
	move full feast to location of player;
	clue-zap "FULL FEAST";
	set the pronoun it to full feast;

this is the vc-get-good rule:
	if player is not in wet wood:
		if print-why-fail, vcal "You already managed to GET GOOD.";
		continue the action;
	the rule succeeds;

this is the vr-get-good rule:
	loop-note "GET GOOD";
	say "You realize you can reason your way out of the Wet Wood. You feel so good about it, even musing 'good guy's wood wise!' But this brings up a question: if you need to work on rhymes, does it matter if they are spelled identically? Will that make things easier or harder in the long run?[paragraph break]So many questions! On leaving the wood, you find yourself blocked by water.";
	move player to Rift River;
	phbt Wet Wood;

this is the vc-gift-giver rule:
	if player is not in rift river, the rule fails;
	the rule succeeds;

this is the vr-gift-giver rule:
	loop-note "GIFT GIVER";
	say "Someone appears from the distance. 'Here! Take this. It will help you with a future puzzle or puzzles.' It's a packet of Mind Malt, whatever that is. And ... it's empty. You open your mouth to protest, but their hand goes up. 'The best sort of magic helps you help yourself.'[paragraph break]You stifle a hmph. 'Oh,' they continue, 'Also some Too-Totes-New Notes. They will tell you what your Leet Learner would've scanned for the puzzles you face at the start. Though you may wish to keep track of things by yourself. If you wish, you can DROP it to solve things the hard way.'[paragraph break]That's a bit better. They walk away. You grumble and putter around, wondering where you should go next. You put your hand on a tree, which has sick sap on it. You walk around, trying to get it off, and you fall into a ... TRICK TRAP.";
	now player has Too Totes New Notes;
	now player has Mind Malt;
	move player to Vined Vault;
	set the pronoun it to Mind Malt;
	set the pronoun them to Too Totes New Notes;
	phbt Rift River;

this is the vc-glean-glows rule:
	if player is not in history hall or mean moe's is not in history hall, the rule fails;
	if player does not have clay cloak:
		vcp "That would work, to find how to clean your clothes, but you don't have any clothes that need cleaning.";
		clue-later "GLEAN GLOWS";
		continue the action;
	the rule succeeds;

this is the vr-glean-glows rule:
	say "You figure how Mean Moe's Clean Clothes works. You lump the way woke clay cloak in, and after some beeping and coughing, out comes ... a clashing cloak! It's much less bulky than the way woke clay cloak, and it feels more versatile.";
	moot way woke clay cloak;
	now player has clashing cloak;
	moot Mean Moe's Clean Clothes;
	clue-zap "GLEAN GLOWS";
	set the pronoun it to clashing cloak;

this is the vc-glow-glad rule:
	if in-so-sad is false, the rule fails;
	the rule succeeds;

this is the vr-glow-glad rule:
	say "Okay! You're really ready to face things now. Someone comes into view, congratulates you on fighting off your inner demons, and introduces himself as Dean Duggan. 'I have a couple more things I can teach you, but you'll have to ask me specifically.'";
	now in-so-sad is false;
	now in-so-saded is true;
	phbt Kerry Kyle;
	move Dean Duggan to Been Buggin';

this is the vc-go-gappin rule:
	if player does not have Toe Tappin, the rule fails;
	if player is not in gassed gap:
		vcp "Hm! [Toe] could be tweaked like that to be useful in the right place[if gassed gap is visited], like the Gassed Gap[end if].";
		clue-later "GO GAPPIN";
		continue the action;
	if gap-go is true:
		vcal "The song already worked.";
		continue the action;
	the rule succeeds;

this is the vr-go-gappin rule:
	say "Man! Toe Tappin Row Rappin is pretty handy for all sorts of things. Now it gives you confidence you can make it through north[if cool cap is not moot] once you figure what to do[else if russell is not moot] once Russell is gone[end if].";
	now gap-go is true;
	clue-zap "GO GAPPIN";
	process the check-sing-max rule;

this is the vc-got-gored rule:
	if player is not in airy isle or bot board is moot, the rule fails;
	if lot lord is in airy isle and hot horde is in airy isle, the rule succeeds;
	clue-later "GOT GORED";
	if lot lord is off-stage and hot horde is off-stage:
		vcp "That sounds right, but it would just be your epitaph right now. With some organized help, though, it could be a potent rallying cry. You save the thought for later.";
		continue the action;
	if lot lord is off-stage:
		vcp "The Hot Horde needs more than a battle cry. It needs a leader.";
		continue the action;
	if hot horde is off-stage:
		vcp "The Lot Lord nods, but alas, one person using a battle cry against the Bot Board won't work.";
		continue the action;
	say "Uh oh. This is a BUG case. This should not have happened, but you can still win the game."; [oksay]
	continue the action;

this is the vr-got-gored rule:
	say "YES! That's the cheer the Hot Horde needs, even if there's no gore inside the Bot Board. No need for a ham-handed 'BAM! BANDED!' as they coalesce and organize under the Lot Lord's leadership.[paragraph break]As things calm down, you realize a wry wall points you three ways, and there is now a go gate ahead! You must be close now.";
	moot Hot Horde;
	moot Lot Lord;
	moot Bot Board;
	wall-add Airy Isle;
	move go gate to Airy Isle;
	clue-zap "GOT GORED";
	set the pronoun it to go gate;

this is the vc-green-grass rule:
	if mean mass is in vined vault, the rule succeeds;
	the rule fails;

this is the vr-green-grass rule:
	loop-note "GREEN GRASS";
	say "The mean mass collapses into much safer green grass. You walk by and arrive at...";
	move player to Po' Pit;
	moot mean mass;

this is the vc-grow-grit rule:
	if player is not in po' pit, the rule fails;
	if grit-grown is true:
		if print-why-fail, vcal "You already did that. Grit is internalized in you. If you try to be grittier, you may use up the grit you worked so hard to gain.";
		continue the action;
	the rule succeeds;

this is the vr-grow-grit rule:
	loop-note "GROW GRIT";
	say "'So, sit,' you say to yourself. You ponder a bit before saying 'Oh ... it ...'. You realize you have managed to grow grit![paragraph break]The trash trap looks less yucky now. Okay, it still looks pretty yucky, but it's almost bearable. You just have to make sure you don't trip anything horrible. You need a safe way through!";
	now grit-grown is true;
	phbt row writ;
	phbt Po' Pit;

this is the vc-hard-hat rule:
	if marred mat is not touchable, the rule fails;
	the rule succeeds;

this is the vr-hard-hat rule:
	say "Poof! The marred mat changes into a hard hat. But it's a bit small to wear. Maybe you could combine it with something else.";
	moot marred mat;
	now player has hard hat;
	set the pronoun it to hard hat;

this is the vc-heal-here rule:
	if player is not in Real Rear, the rule fails;
	if healed-here is true:
		vcal "No need to heal further.";
		continue the action;
	if least-loss is false:
		clue-later "HEAL HERE";
		vcp "You don't have anything to heal from, yet[seer-sez].";
		continue the action;
	if knelt-yet is false:
		clue-later "HEAL HERE";
		vcp "You have not shown the Ceiling Seer the proper respect, yet.";
		continue the action;
	the rule succeeds;

this is the vr-heal-here rule:
	say "You call on the Ceiling Seer once more. You worry you may hear 'Gee, Ill! Jeer,' but your faith is rewarded as you feel rejuvenated!";
	now healed-here is true;
	clue-zap "HEAL HERE";
	phbt ceiling seer;
	if appeal-appear is false, phbt peeling pier;

this is the vc-history-hall rule:
	if player is not in History Hall, the rule fails;
	if mistmall is false:
		vcal "You already [if ever-mall is true]flipped back to[else]are in[end if] History Hall.";
		continue the action;
	the rule succeeds;

this is the vr-history-hall rule:
	move-to-temp gutta ganksta;
	move-to-temp Mean Moe's Clean Clothes;
	now Vending Vibe is mapped west of History Hall;
	now History Hall is mapped east of Vending Vibe;
	move-from-temp Poor Ponder;
	move-to-temp gutta ganksta;
	move-to-temp Oi Mo;
	now mistmall is false;
	if ever-hall is false:
		say "Weird! The way west seems to change from a store to ... something else, still sort of a store, actually. Also, History Hall seems a little fuller. There's a book called [poor ponder].";
		set the pronoun it to Poor Ponder;
	bold-my-room;
	say "[description of history hall][line break]";
	now ever-hall is true;

this is the vc-ho-happen rule:
	if player does not have Toe Tappin, the rule fails;
	if hap-ho is true:
		vcal "You already said HO HAPPEN.";
		continue the action;
	the rule succeeds;

this is the vr-ho-happen rule:
	say "While nothing immediately happens, you feel more motivated to try new stuff--[Toe] may be more versatile than you think!";
	now hap-ho is true;

this is the vc-hot-horde rule:
	if player is not in airy isle, the rule fails;
	if Hot Horde is not off-stage:
		vcal "You already summoned the Hot Horde.";
		continue the action;
	the rule succeeds;

this is the vr-hot-horde rule:
	say "The legendary Hot Horde rumbles in from ... goodness, how'd they get here so fast? Especially since they're such a disorganized bunch!";
	move hot horde to airy isle;
	check-gored-clue;
	set the pronoun them to Hot Horde;

this is the vc-kneel-near rule:
	if player is not in real rear, the rule fails;
	if knelt-yet is true:
		vcal "No need to kneel twice.";
		continue the action;
	the rule succeeds;

this is the vr-kneel-near rule:
	say "You kneel at the pier, facing away from the Steel Steer to avoid any semblance of idolatry that might cause the Ceiling Seer to strike you down. You feel peace and acceptance and potential and ability wash over you. Perhaps you can be more open with your feelings now, and the Ceiling Seer will be more receptive.";
	now knelt-yet is true; [?? track difference]
	now cht of Real Rear is leteq; [->feel fear] [-> deal dear] [->heal here]
	now cht of steel steer is letminus; [steel steer->feel fear]

this is the vc-knives-niche rule:
	if player is not in dives ditch, the rule fails;
	if kni-ni is true:
		vcal "You already changed the dives ditch.";
		continue the action;
	the rule succeeds;

this is the vr-knives-niche rule:
	say "The dives ditch folds up, and now you see a trap on the wall where knives will be released on an unsuspecting interloper.";
	now kni-ni is true;
	process the drop-snare rule;

this is the vc-lean-luggin rule:
	if Dean Duggan is not touchable, the rule fails;
	if lean-lugged is true:
		vcal "You already learned lean luggin['].";
		continue the action;
	the rule succeeds;

this is the vr-lean-luggin rule:
	say "You ask Dean Duggan for help with carrying large awkward things.";
	now lean-lugged is true;
	lean-and-mean;

this is the vc-least-loss rule:
	if player is not in creased cross, the rule fails;
	if Bull Beast is off-stage:
		clue-later "LEAST LOSS";
		vcp "Not yet. You need to be in a fighting situation.";
		continue the action;
	if least-loss is true:
		vcal "You already minimized your losses. Time to be more aggressive.";
		continue the action;
	the rule succeeds;

this is the vr-least-loss rule:
	now need-loss is false;
	now least-loss is true;
	say "You spend a lot of time ducking and rolling around and hoping you exhaust the Beast Boss/Bull Beast. It seems to be getting tired and, upset it did less damage than expected, fails to finish the job. You're definitely hurt, but you can survive. As you stumble back to the familiar, safe Fun Fen, the Bull Beast skulks back to the shadows, ostensibly to plan a worse humiliation for later. Perhaps if you came back fully fit, you could demoralize it.";
	clue-zap "LEAST LOSS";
	phbt Creased Cross;
	bold-new-room Fun Fen;

this is the vc-lending-libe rule:
	if player is not in vending vibe, the rule fails;
	if trending tribe is moot:
		vcal "Yes, It's a library now.";
		continue the action;
	the rule succeeds;

this is the vr-lending-libe rule:
	moot trending tribe;
	say "The Trending Tribe is appalled by the possibility of people getting something for free. Even worthless books boring people claim to read for fun. They run away screaming. The Vending Vibe goes away, replaced by a Lending Libe. A book even falls out: [fussed folks].";
	now printed name of Vending Vibe is "Lending Libe";
	move lending libe to Vending Vibe;
	move fussed folks just jokes to Vending Vibe;
	process the card-and-libe rule;
	set the pronoun it to Fussed Folks;

this is the vc-lie-lol rule:
	if player is not in Got Gear Hot Here, the rule fails;
	if lie-lol is true:
		vcal "The shy shawl has taken enough abuse.";
		continue the action;
	the rule succeeds;

this is the vr-lie-lol rule:
	say "You snicker a bit at the message on the shy shawl. But not too much! You don't want to become like the Very Vile Fairy File writers you're trying to defeat!";
	now lie-lol is true;

this is the vc-loft-land rule:
	if player is not in soft sand, the rule fails;
	if loft-land is true:
		vcal "You're already on the Loft Land.";
		continue the action;
	the rule succeeds;

this is the vr-loft-land rule:
	say "Boom! The Soft Sand rises up and becomes the Loft Land[one of][or] again[stopping]. You can now reach [if curst cave is visited]the Curst Cave again[else]that new cave west that you couldn't in the Soft Sand[end if].";
	now zap-core-entry is true;
	if ever-loft is false:
		now ever-loft is true;
	now loft-land is true;
	now Curst Cave is mapped west of Soft Sand;
	now Soft Sand is mapped east of Curst Cave;

this is the vc-lot-lord rule:
	if player is not in airy isle, the rule fails;
	if Lot Lord is not off-stage:
		vcal "You already summoned the Lot Lord.";
		continue the action;
	the rule succeeds;

this is the vr-lot-lord rule:
	move lot lord to airy isle;
	say "A man whirls in from above and touches down, looking slightly stunned.[paragraph break]'Ah! There it is! The sought sword! Not useful in combat, but it has ancient powers and lineage and stuff. Good for leadership and all that.' The sword glows as he takes it.";
	moot sought sword;
	check-gored-clue;
	set the pronoun him to Lot Lord;

this is the vc-lots-lame rule:
	if gutta ganksta is not touchable, the rule fails;
	the rule succeeds;

this is the vr-lots-lame rule:
	say "Exposed, the [ganksta] turns red. It just can't face you any more and runs off for a massive mall to perhaps hassle some poor soul named Passive Paul.";
	moot gutta ganksta;
	if gan-wan is false, max-down; [can't WHATTA WANKSTA]

this is the vc-luck-lair rule:
	if player is not in blinding blaze or stuck stair is off-stage, the rule fails;
	if stuck stair is moot:
		vcal "You already got the snuck snare from the luck lair.";
		continue the action;
	the rule succeeds;

this is the vr-luck-lair rule:
	say "You try and make your own luck, and you do! The stuck stair flips down. Inside the luck lair there is nothing, except ... well, since you feel lucky, you find the snuck snare without it going off. You'll probably know where to put the snuck snare once you see it. Because, well, you still feel a bit lucky.[paragraph break]Your surroundings dim. You doubt there's much else exciting to do here.";
	moot stuck stair;
	now player has snuck snare;
	set the pronoun it to snuck snare;

this is the vc-make-map rule:
	if player is not in Lake Lap, the rule fails;
	if jake-map is true:
		vcal "You already made a map.";
		continue the action;
	the rule succeeds;

this is the vr-make-map rule:
	say "You make a map. As you do, you hear a hissing noise, as from a dangerous snake.";
	now jake-map is true;
	now cht of lake lap is letplus; [->snake snap]

this is the vc-mark-more rule:
	if player is not in stark store, the rule fails;
	if dark door is off-stage:
		clue-later "MARK MORE";
		vcp "That'd work, if there was something to mark. There isn't, yet.";
		continue the action;
	if dark door is moot:
		vcal "You already saw what you could.";
		continue the action;
	the rule succeeds;

this is the vr-mark-more rule:
	say "Yes, there's more to the stark store than the dark door. You notice things about it--as well as how to take it off its hinges! And what's more, you also uncover a weird way off to the side.";
	move weird way to Stark Store;
	moot dark door;
	phbt Stark Store;
	clue-zap "MARK MORE";

this is the vc-mash-map rule:
	if player is not in po' pit, the rule fails;
	process the ashap rule; [to determine what was the first word]
	if grit-grown is false:
		process the ashap rule;
		vcp "You aren't brave enough yet. Perhaps you can face down the po['] pit so you can be.";
		clue-later "MASH MAP";
		continue the action;
	the rule succeeds;

this is the vr-mash-map rule:
	loop-note "MASH MAP";
	say "The heck with this! You just don't trust the trash trap to tell you the way through. You maul what passes for a map on the cache cap--you realize parts of it don't make sense. And you make it past the gash gap... only to tumble into some sort of vehicle that seals shut.";
	process the ashap rule;
	move player to Trim Tram;
	clue-zap "MASH MAP";

this is the vc-mean-muggin rule:
	if Dean Duggan is not touchable, the rule fails;
	if mean-mugged is true:
		vcal "You already learned mean muggin['].";
		continue the action;
	the rule succeeds;

this is the vr-mean-muggin rule:
	say "You try some aggressive facial features. Dean Duggan helps you get things right.";
	now mean-mugged is true;
	lean-and-mean;

this is the vc-meeker-muscle rule:
	if reeker russell is not touchable, the rule fails;
	if meeker-yet is true:
		vcal "Russell's already meeker. Maybe disarm him?";
		continue the action;
	the rule succeeds;

this is the vr-meeker-muscle rule:
	now meeker-yet is true;
	say "Russell becomes noticeably less muscular.";
	check-russell-go; [nec]
	adjust-russell;

this is the vc-merry-mile rule:
	if mrlp is not Vale Verminous, the rule fails;
	if merry-mile is true:
		vcal "You already did. And forcing cheeriness tends to backfire.";
		continue the action;
	if player is in Airy Isle:
		vcp "[if bot board is moot]You're happy, but you can't force it any more. You haven't found the Very Vile Fairy File yet, and when you do, this may be a more appropriate name for wherever it is that is ahead[else]Hard to be happy with the Bot Board around[end if].";
		clue-later "MERRY MILE";
		continue the action;
	if well worn hell horn is not moot:
		vcp "Not with the well worn hell horn making those un-merry noises.";
		clue-later "MERRY MILE";
		continue the action;
	the rule succeeds;

this is the vr-merry-mile rule:
	say "You're much happier now! You are ready to deal with the Very Vile Fairy File fully, now.";
	now merry-mile is true;
	clue-zap "MERRY MILE";
	now cht of tarry tile is partminus; [tarry tile -> bury bile]

this is the vc-mind-me rule:
	if player is not in trim tram, the rule fails;
	if me-minded is true:
		if print-why-fail, vcal "You already minded yourself.";
		continue the action;
	the rule succeeds;

this is the vr-mind-me rule:
	loop-note "MIND ME";
	say "FIND FEE can't be right. There's nobody here to collect it. You have a bit more confidence in your ability to swindle someone, or something, else now. The FIND FEE plastered everywhere vanishes.";
	now me-minded is true;

this is the vc-mining-more rule:
	if player is not in Whining War, the rule fails;
	if full feast is not moot:
		vcp "You and the pining poor aren't ready to do any mining yet, not on an empty stomach, but maybe later.";
		clue-later "MINING MORE";
		continue the action;
	if pining poor are moot:
		vcal "Don't get greedy!";
		continue the action;
	the rule succeeds;

this is the vr-mining-more rule:
	now mine-more is true;
	moot dining door;
	say "You help the pining poor find a moor to mine more. You uncover great metal riches, and stuff. As a reward, they give you an alloy that smiths the gold guard into ... a HOLD HARD GOLD GUARD! They thank you for giving their lives purpose before drifting away."; [note: the player is assured of having the gold guard because they need it to beat the Beast Boss and make the Feast.]
	moot pining poor;
	clue-zap "MINING MORE";
	set the pronoun it to gold guard;

this is the vc-mo-mappin rule:
	if player does not have Toe Tappin Row Rappin and player is not in blinding blaze, the rule fails;
	if stuck stair is moot:
		vcp "You did all the mapping you needed to.";
		continue the action;
	if player is not in blinding blaze:
		vcp "Maybe some other place could use mapping, but not here.";
		clue-later "MO MAPPIN";
		continue the action;
	if blaze-ways is false:
		vcp "The blaze isn't mappable, but maybe something that replaces it is.";
		clue-later "MO MAPPIN";
		continue the action;
	if stuck stair is in blinding blaze:
		vcal "You're already in the mood to map. No need to overdo it.";
		continue the action;
	if player does not have Toe Tappin Row Rappin:
		vcp "You'd love to, but you need some sort of artistic, peppy way to make the mapping less tedious. Even fun.";
		clue-later "MO MAPPIN";
		continue the action;
	the rule succeeds;

this is the vr-mo-mappin rule:
	say "Having a catchy tune like Toe Tappin Row Rappin in your head certainly helps you with tiring, repetitive activities such as mapping. And once you see the way through the maze, you don't forget it. At the end of the maze, there is a stuck stair. As you approach it, the maze walls collapse, and ... you find yourself very near the entrance. Convenient!";
	move stuck stair to blinding blaze;
	now maze-mapped is true;
	clue-zap "MO MAPPIN";
	moot minding maze;
	process the check-sing-max rule;
	set the pronoun it to stuck stair;

this is the vc-moral-mage rule:
	if coral cage is not touchable, the rule fails;
	if player does not have cage key:
		clue-later "MORAL MAGE";
		vcp "That certainly feels right. But the coral cage is too dense to see through or destroy right now. Maybe if you had a key that let you unlock it.";
		continue the action;
	the rule succeeds;

this is the vr-moral-mage rule:
	say "The inner bars of the coral cage crumble, followed by the cage itself and the key with it. The moral mage thanks you and begins a lecture. You're worried it'll be a sermon, but it fills interesting details about the Very Vile Fairy File, its powers, the Crimes Crew Times Two, how and why they are effective, and how to deflect their worst attacks. You even relate their meanness to people in your past who had baited you, and you feel your resolve increase.[paragraph break]The moral mage nods and departs, leaving you with [here hip], a summary of the lecture. You realize that the knowledge passed on was a sort of magic in its own right, and you'd groan at this sort of revelation if it weren't so helpful.";
	moot coral cage;
	moot cage key;
	phbt Store All Stage;
	now player has Here Hip Queer Quip;
	clue-zap "MORAL MAGE";
	set the pronoun it to Here Hip Queer Quip;

this is the vc-mystery-mall rule:
	if player is not in History Hall, the rule fails;
	if mistmall is true:
		vcal "You've already flipped this area to the Mystery Mall.";
		continue the action;
	the rule succeeds;

this is the vr-mystery-mall rule:
	move-from-temp gutta ganksta;
	if Toe Tappin is not moot:
		move-from-temp Toe Tappin;
	else if Oi Mo is not moot:
		move-from-temp Oi Mo;
	move-from-temp Mean Moe's Clean Clothes;
	now Got Gear Hot Here is mapped west of History Hall;
	now mistmall is true;
	if ever-mall is false:
		say "A way opens up to the west as History Hall shudders into Mystery Mall! You suspect it would be easy to flip between the two in the future, as necessary.[paragraph break]Mystery Mall is certainly livelier. A Gutta Ganksta 'chills' here, Mean Moe's Clean Clothes is a small kiosk, and there's mall music to LISTEN to, as well.";
	else:
		bold-my-room;
		say "[description of history hall][line break]";
	now ever-mall is true;
	now zap-core-entry is true;

this is the vc-near-null rule:
	if beer bull is not touchable, the rule fails;
	if bull-null is true:
		vcal "You already reduced the bull's power!";
		continue the action;
	the rule succeeds;

this is the vr-near-null rule:
	now zap-core-entry is true;
	say "The beer bull writhes and roars. It's still plenty powerful, but it's not supercharged.";
	now bull-null is true;

this is the vc-no-nappin rule:
	if toe tappin row rappin is not touchable, the rule fails;
	if nap-no is true:
		vcal "You already changed Toe Tappin Row Rappin that way.";
		continue the action;
	the rule succeeds;

this is the vr-no-nappin rule:
	say "Sometimes you don't need a perfectly sensible way to keep alert. No Nappin does that for you. It will do that for you.";
	say "[line break][if boat-reject is true and lake lap is unvisited]Hey! I bet you could see about the boring boat, now[else]Whatever you need to make more interesting, your riff on Toe Tappin will see you through. You won't forget it[end if].";
	now nap-no is true;
	process the check-sing-max rule;

this is the vc-not-near rule:
	if player is not in got gear hot here, the rule fails;
	if trounce-track is true:
		vcal "You already teleported for a bonus point.";
		continue the action;
	the rule succeeds;

this is the vr-not-near rule:
	say "You feel pulled from the ground, and you pass through the walls without feeling anything. You are teleported to the TROUNCE TRACK, where you are set upon but what must be a Pounce Pack. You only have a few seconds to react, but with what you've done so far, you know to yell or think BOUNCE BACK. And you do.[paragraph break]Whew! You weren't cut out for the violent stuff. You're doing well enough here.";
	now trounce-track is true;

this is the vc-paper-pile rule:
	if vapor vial is not touchable, the rule fails;
	the rule succeeds;

this is the vr-paper-pile rule:
	say "The vile vapor in the vapor vial swirls around, and the paper cracks. The vapor spreads over the ground and changes into a whole paper pile.";
	moot vapor vial;
	bring-here paper pile;
	set the pronoun it to paper pile;

this is the vc-plain-pleasant rule:
	if pain peasant is not touchable, the rule fails;
	the rule succeeds;

this is the vr-plain-pleasant rule:
	say "How about that? A few nice words, and the Pain Peasant forgets what the matter was. Apparently, with the Very Vile Fairy File's influence, that happens a lot. People lash out at whomever, just because. A lesson learned!";
	moot pain peasant;

this is the vc-pull-pieced rule:
	if full feast is not in Creased Cross and bull beast is not in creased cross, the rule fails;
	if bull beast is in creased cross:
		vcp "[if cull-ceased is true]The bull beast could be pulled, but in its current form, it wouldn't be usefu[else]You'd have to defeat the bull beast first[end if].";
		clue-later "PULL PIECED";
		continue the action;
	if shore-shine is false:
		vcp "You're not sure where you could pull the full feast to, yet.";
		clue-later "PULL PIECED";
		continue the action;
	if dine-door is false:
		clue-later "PULL PIECED";
		vcp "The folks at the Shining Shore aren't quite ready for a feast, yet. Perhaps the Shining Shore needs a bit of adjustment.";
		continue the action;
	the rule succeeds;

this is the vr-pull-pieced rule:
	say "With the help of the pining poor, you pull the full feast that was the bull beast to the Shining Shore. There, the dining door swings open. 'DEED, DUDE: FEED FOOD!' You enter and have a very good feast. As it finishes, everyone chants in unison, 'Some say yum, yay!' The door dissolves.[paragraph break]The pining poor look ready for work, now they've been properly fed.";
	moot full feast;
	moot mild mead;
	if wild weed is off-stage, max-down;
	moot dining door;
	if player is not in Whining War, bold-new-room Whining War;
	clue-zap "PULL PIECED";

this is the vc-really-rolling rule:
	if rolling-yet is false, the rule succeeds;
	vcal "You already guessed the significance of my pen name.";
	continue the action;

this is the vr-really-rolling rule:
	say "Have a small bonus for figuring the significance of my pen name. Also, enjoy this trivia: looking back, I wish I'd been Parsin['] Pro Carson Crowe, instead. Eh, well!";
	now rolling-yet is true;

this is the vc-see-sign rule:
	if player does not have We Whine, the rule fails;
	if sign-seen is true:
		vcal "You've seen enough signs. Overkill might leave you demoralized or too analytical to just cut loose and adventure.";
		continue the action;
	the rule succeeds;

this is the vr-see-sign rule:
	say "A closer reading of [We Whine] reveals that you don't need to be a jerk to learn from it. Whether that was the authors['] intent is unclear, but you realize you can learn about the games jerks play and how to expect and deflect them even before they become obvious jerks. It seems like grappling with this sort of thing without fighting it would be useful for dealing with the Very Vile Fairy File, and you now feel more worthy and prepared to do so.";
	now sign-seen is true;

this is the vc-shining-shore rule:
	if player is not in Whining War, the rule fails; [?? big problem with what replaces Violent Vale]
	if shore-shine is true:
		vcal "You already got (t)here.";
		continue the action;
	if war-sapped is false:
		clue-later "SHINING SHORE";
		vcp "It could be that way. But you need to get rid of the whining first.";
		continue the action;
	the rule succeeds;

this is the vr-shining-shore rule:
	say "The Whining War dissipates, leaving a shining shore! It's not total paradise or anything, but it's much brighter here. You feel there may be something else to find here. The combatants turn into ... the pining poor.";
	now cht of Whining War is letminus; [shining shore -> dining door] [shining shore -> mining more]
	now shore-shine is true;
	move pining poor to whining war;
	clue-zap "SHINING SHORE";
	set the pronoun them to Poor Ponder;

this is the vc-show-shield rule:
	if player is not in foe field, the rule fails;
	if gold guard is off-stage:
		clue-later "SHOW SHIELD";
		vcp "That seems right, but you have nothing that would guard you effectively. Maybe later.";
		continue the action;
	if mine-more is false:
		clue-later "SHOW SHIELD";
		vcp "Ooh! The gold guard lasts a bit, but not quite long enough. It needs reinforcements[if gull-guard is true] even beyond what the gull guard gave[end if].";
		continue the action;
	if gold guard is moot:
		vcal "Your gold guard has done its duty.";
		continue the action;
	the rule succeeds;

this is the vr-show-shield rule:
	say "You flash your gold guard, and bam, the voice that says YO YIELD quiets down, and the YO YIELD vanishes. But not before the usual energy ray shows up and blasts your gold guard to pieces. Eh, it did its job. You can go north now.";
	now shield-shown is true;
	moot gold guard;
	clue-zap "SHOW SHIELD";
	phbt Foe Field So Sealed;

this is the vc-silent-sail rule:
	if player is not in violent vale, the rule fails;
	if flooring float is not off-stage:
		vcal "You already called up the flooring float[if boring boat is not off-stage] and boring boat[end if].";
		continue the action;
	the rule succeeds;

this is the vr-silent-sail rule:
	say "Suddenly from the watery depths, a flooring float bursts forth! It looks -- impractical for going anywhere, but man, is it aesthetic.";
	move flooring float to violent vale;
	now silent-sale is true;
	phbt violent vale;
	set the pronoun it to flooring float;

this is the vc-sit-sound rule:
	if player is not in pit pound, the rule fails;
	if hit hound is not touchable:
		vcal "You already sat sound[if found-fit is false]. But maybe there's a way to feel more comfortable[end if].";
		continue the action;
	the rule succeeds;

this is the vr-sit-sound rule:
	say "The Hit Hound can smell fear, but it can also smell a lack of fear. You manage to sit sound, and the Hit Hound gives up and goes away.";
	moot Hit Hound;

this is the vc-smashing-smoke rule:
	if player does not have clashing cloak, the rule fails;
	if beer bull is in location of player:
		vcp "That's not enough to distract the Beer Bull for good. The Beer Bull can smell you.";
		clue-later "SMASHING SMOKE";
		continue the action;
	if player is not in Y'Old Yard:
		vcp "Hmm, maybe that'd make a useful disturbance elsewhere, with someone to distract, but not here.";
		clue-later "SMASHING SMOKE";
		continue the action;
	the rule succeeds;

this is the vr-smashing-smoke rule:
	say "The Bold Bard tosses you a cold card quickly as thanks before making his way into the Shoaled Shard in the confusion! You hear shouting in there. The Bard has -- certainly made an impression. You hope it is a good one. Your clashing cloak went up in the smoke, but eh, it was sort of tacky anyway. As the smoke lifts, you notice a mold-marred gold guard. It could be useful, repaired. You take it.";
	moot bold bard;
	moot clashing cloak;
	now player has cold card;
	now player has gold guard;
	clue-zap "SMASHING SMOKE";
	set the pronoun it to gold guard;

this is the vc-snake-snap rule:
	if player is not in Lake Lap, the rule fails;
	if jake-cocapn is false:
		vcp "You don't know if you can take that snake by itself. Jake doesn't quite seem willing, yet, either.";
		clue-later "SNAKE SNAP";
		continue the action;
	if jake-map is false:
		vcp "There might be a snake here. But you'd have to find it, first.";
		clue-later "SNAKE SNAP";
		continue the action;
	the rule succeeds;

this is the vr-snake-snap rule:
	say "And that does it! You and Jake, with the help of the map, subdue the snake. One of you baits it, the other kills it. A take-tap pours out items on a small island. You find a cake cap, a flake flap and some rake wrap. You take the cap, and Jake takes the flap and wrap. It's a nice haul. You take your boring boat back to Violent Vale. It seems sturdy enough for another journey, if you want to go.";
	if jake-brie is false, max-down; [can't BREAK BRIE any more]
	now player has cake cap;
	now snake-snap is true;
	move boring boat to Violent Vale;
	bold-new-room Violent Vale;
	phbt Lake Lap;
	clue-zap "SNAKE SNAP";
	set the pronoun it to cake cap;

this is the vc-so-sappin rule: [?? we need to make sure this works okay]
	if player does not have Toe Tappin Row Rappin, the rule fails;
	if war-sapped is true:
		vcal "You already discouraged some whining. Bringing it up again might make you the whiny one.";
		continue the action;
	if player is not in whining war:
		vcp "That's an interesting riff, but it doesn't seem to work here.";
		clue-later "SO SAPPIN";
		continue the action;
	the rule succeeds;

this is the vr-so-sappin rule:
	say "Amazingly, as you filk [Toe], the whining grows less. People realize they're not being productive at all. It becomes much quieter here. Your passive-aggressiveness has trumped others[']! Hooray!";
	now war-sapped is true;
	clue-zap "SO SAPPIN";
	process the check-sing-max rule;

this is the vc-soft-sand rule:
	if player is not in soft sand or ever-loft is false, the rule fails;
	if loft-land is false:
		vcal "You're already on the Soft Sand.";
		continue the action;
	the rule succeeds;

this is the vr-soft-sand rule:
	say "The loft land reverts to the Soft Sand, revealing the old passage west[if shirk shell is visited] to the Shirk Shell[end if].";
	now loft-land is false;
	now Shirk Shell is mapped west of Soft Sand;

this is the vc-spark-spliff rule:
	if wild weed is moot:
		vcal "Whoah, dude. You already did.";
		continue the action;
	if player does not have wild weed and player is not in Fun Fen, the rule fails;
	if player is not in Fun Fen:
		vcp "Not here, dude! No source of flame!";
		continue the action;
	if player does not have wild weed:
		vcp "You have nothing to spark up, dude!";
		continue the action;
	the rule succeeds;

this is the vr-spark-spliff rule:
	say "Whoah, dude! You totally discover not only a hidden spliff but two pieces of flint ideal for creating a flame to light it. It only takes 15 minutes, and it is totally worth it, even without a bong bunch and long lunch.";
	moot wild weed;

this is the vc-stay-strong rule:
	if in-way-wrong is false, the rule fails;
	the rule succeeds;

this is the vr-stay-strong rule:
	say "That's ... well, it helps a little! You've overcome a bit, but you still feel so sad ... so sad.";
	now in-way-wrong is false;
	now in-way-wronged is true;
	now in-so-sad is true;
	now cht of the player is letplus; [so sad->glow glad]

this is the vc-strong-start rule:
	if player is not in Fun Fen, the rule fails;
	if started-strong is true:
		vcal "You already did. You wouldn't want a stale start or a pale part. Why, you might get sent to Male Mart. Or run over by a kale cart.";
		continue the action;
	the rule succeeds;

this is the vr-strong-start rule:
	now started-strong is true;
	say "Boom! Yes, you mangle and destroy the wrong art, both physically and mentally. Dunking on messed-up stuff too much may distract you from your goals, but in this case, you gain confidence you know what you are doing, and the exercise is nice, too. That is a way to get a strong start[if score > 11 and creased cross is visited], even if you aren't really starting any more[else if score > 30], because it's always good to start anew, or try to, to get a perspective on things[end if]. You throw the wrong art over Cark Cliff, now that you feel confident fully dismissing it.";
	moot wrong art;

this is the vc-take-tea rule:
	if jake is not touchable, the rule fails;
	if jake-woke is false:
		vcp "Maybe when Jake is awake.";
		clue-later "TAKE TEA";
		continue the action;
	if jake-tea is true:
		vcal "Don't get greedy. You have the sustenance needed to work with Jake G.";
		the continue the action;
	the rule succeeds;

this is the vr-take-tea rule:
	say "You and Jake have a brief snack. It helps bring you together. But he looks awkwardly at you. He guesses he should expect payment, but he doesn't really want it.";
	now jake-tea is true;
	clue-zap "TAKE TEA";

this is the vc-tell-torn rule:
	if well worn hell horn is not touchable, the rule fails;
	the rule succeeds;

this is the vr-tell-torn rule:
	say "The well worn hell horn rips apart and unwinds. Fortunately, as it does so, there is no bell born. It's more peaceful around, now. You can focus better and come to grips with your inner self, and all that sort of thing.";
	moot well worn hell horn;

this is the vc-tight-tunnel rule:
	if player is not in fight funnel, the rule fails;
	if funnel-to-tunnel is true:
		vcal "You already narrowed the funnel to a tunnel.";
		continue the action;
	the rule succeeds;

this is the vr-tight-tunnel rule:
	say "The fighting quiets down and moves off to the north. You can now go west!";
	now funnel-to-tunnel is true;
	phbt Fight Funnel;

this is the vc-wake-whee rule:
	if jake g is not touchable, the rule fails;
	if jake-woke is true:
		vcal "He's already awake, Blake.";
		continue the action;
	the rule succeeds;

this is the vr-wake-whee rule:
	say "Jake G. wakes up. 'Man! I'm hungry! You hungry too?'";
	now jake-woke is true;
	set the pronoun him to jake g;

this is the vc-whatta-wanksta rule:
	if gutta ganksta is not touchable, the rule fails;
	if gan-wan is true:
		vcal "That insult only works once.";
		continue the action;
	the rule succeeds;

this is the vr-whatta-wanksta rule:
	say "The Gutta Ganksta suddenly feels dissed. Not enough to move out of the way, because the Gutta Ganksta feels clever for knowing a word like 'wanksta' and affirming that it is a bit derivative of 'ganksta.'";
	now gan-wan is true;

this is the vc-whoa-wait rule:
	unless player is in airy isle and go gate is in airy isle, the rule fails;
	the rule succeeds;

this is the vr-whoa-wait rule:
	say "You decide not to run in right away. The grow grate inside the go grate crumbles. You take another peek to make sure there's nothing else. There isn't. You walk through.[wfak]";
	move player to Tarry Tile;
	set the pronoun it to well worn hell horn;

this is the vc-wild-weed rule:
	if mild mead is not touchable, the rule fails;
	if wild weed is not off-stage:
		vcal "Greedy, to try for more.";
		continue the action;
	the rule succeeds;

this is the vr-wild-weed rule:
	say "Bingo! Some of the mild mead tumbles off to the ground and becomes wild weed. Which is totally unnecessary for the game, but hey.";
	now player has wild weed;

this is the vc-winding-ways rule:
	if player is not in blinding blaze, the rule fails;
	if blaze-ways is true:
		vcal "You already did.";
		continue the action;
	the rule succeeds;

this is the vr-winding-ways rule:
	say "The blaze swirls but dies down. In its place are winding ways leading to a huge minding maze that will surely bust your brain and require a finding phase. And hey, that wry wall pops up too!";
	now blaze-ways is true;
	move minding maze to blinding blaze;
	phbt blinding blaze;
	wall-add Blinding Blaze;
	set the pronoun it to minding maze;

this is the vc-wood-one rule:
	if reeker russell is not touchable, the rule fails;
	if good gun is moot:
		vcal "Russell's already disarmed, but he's still too strong.";
		continue the action;
	the rule succeeds;

this is the vr-wood-one rule:
	say "The good gun turns into a wood one in Reeker Russell's hands! He throws it away in disgust.";
	moot good gun;
	check-russell-go; [nec]

this is the vc-work-well rule:
	if jerk gel is not touchable, the rule fails;
	if player has jerk gel:
		vcal "You already did.";
		continue the action;
	the rule succeeds;

this is the vr-work-well rule:
	say "You work to put all the jerk gel back in. You don't get it all in, but there's enough to use later.";
	now the player has the jerk gel;
	now cht of Shirk Shell is phbt;
	now cht of jerk gel is leteq; [supple saps->couple caps]

this is the vc-youre-yonder rule:
	if poor ponder is not touchable, the rule fails;
	the rule succeeds;

this is the vr-youre-yonder rule:
	say "You begin to make sense of [poor ponder]. Of course it should not be too obviously easy to enjoy, or the Crimes Crew Times Two would have suppressed it. Reading between the lines, you can see how they would give up on it without sorting out its nuances. And as you figure that out, you see clues to a passage going OUT. One you'd otherwise have missed. Leo Strauss would approve![paragraph break]The book itself, however, bursts into flames like any proper secret communication once you discover the secret passage.";
	moot poor ponder;
	now Y'Old Yard is mapped outside History Hall;
	now History Hall is mapped inside Y'Old Yard;

[zzvcvr]

volume beta testing - not for release

the force tester wherever rule is listed last in the when play begins rulebook.

when play begins (this is the force tester wherever rule):
	now debug-state is true;
	now in-beta is true;
	if currently transcripting:
		say "It looks like you restarted, and the transcript should still be running.";
	else if debug-state is false:
		say "Note: I like to make sure beta testers have a transcript working. It's a big help to me. So, after you press a key, you'll be asked to save a file.";
		wfak;
		try switching the story transcript on;
		say "Transcripts can be sent to blurglecruncheon@gmail.com. Any punctuation before the comment is okay, e.g. *TYPO or ;typo or :typo. Also, you can report issues in the repository.";
	if debug-state is false:
		say "Currently I'm just worried about what there is up until the Fun Fen and if it's hinted well enough, but if you want to poke around more, feel free to go ahead.";
		if fun fen is unvisited:
			say "[line break]You can [b]SLOW SIGH or BLOW BY or FLOW FLY[r] to jump to the nonlinear part and avoid the introduction.[paragraph break]You can [b]TRICK TRIP or SLICK SLIP[r] before reaching the main area, as well, to skip past the current puzzle. You'll know the main area, because it is non-linear.";
		if airy isle is unvisited:
			say "[line break]Also, you can [b]CLIMB CLEAR[r] to jump to the (relatively brief) endgame, and LLA leet-learns everything in sight.";
	continue the action;

this is the too-late-for-beta rule:
	if fun fen is visited or airy isle is visited, say "It's too late to use the TRICK TRIP/BLOW BY commands." instead;

chapter missesing

missesing is an action applying to nothing.

understand the command "misses" as something new.

understand "misses" as missesing.

carry out missesing:
	carry out the showmissesing activity;
	the rule succeeds.

chapter llaing

llaing is an action applying to nothing.

understand the command "lla" as something new.

understand "lla" as llaing.

definition: a thing (called th) is llable:
	if th is touchable, yes;
	no;

carry out llaing:
	try lling the location of the player;
	repeat with Q running through llable things:
		say "====Leet-learning [Q]:";
		try lling Q;
	the rule succeeds.

chapter blowbying

blowbying is an action applying to nothing.

understand the command "blowby" as something new.
understand the command "blow by" as something new.

understand "blowby" as blowbying.
understand "blow by" as blowbying.
understand "flow fie" as blowbying.
understand "slow sigh" as blowbying.

carry out blowbying:
	let cur-row be 1;
	abide by the too-late-for-beta rule;
	repeat through table of verb checks:
		if cur-row > 2: [we need to skip GLOW GLAD/STAY STRONG]
			now idid entry is true;
		if do-rule entry is vr-flim-flam rule, break;
		increment cur-row;
	process the any-warp rule;
	now core-score is whew-score + bag-point;
	now score is whew-score + cur-bonus + bag-point;
	move player to fun fen;
	moot mind malt;
	now player has too totes new notes;
	the rule succeeds.

prev-blowby-score is a number that varies.

chapter tricktriping

tricktriping is an action applying to nothing.

understand the command "slick slip" as something new.
understand the command "trick trip" as something new.

understand "slick slip" as tricktriping.
understand "trick trip" as tricktriping.

carry out tricktriping:
	abide by the too-late-for-beta rule;
	say "You utter a, uh, QUICK QUIP. You feel enlightened.";
	let prev-blowby-score be the score;
	now in-test-loop is true;
	repeat through table of verb checks:
		process the ver-rule entry;
		if the rule succeeded:
			process the do-rule entry;
			if there is a core entry and idid entry is false, up-which core entry;
			now idid entry is true;
			now in-test-loop is false;
			the rule succeeds;
	now in-test-loop is false;
	say "Uh oh. Something went wrong. No rules succeeded.";

chapter climbclearing

climbclearing is an action applying to nothing.

understand the command "climb clear" as something new.

understand "climb clear" as climbclearing.

any-beta-warp is a truth state that varies.

this is the any-warp rule:
	if any-beta-warp is true, say "You already used a Beta testing warp." instead;
	now any-beta-warp is true;

carry out climbclearing:
	if Airy Isle is visited, say "You're already in the endgame." instead;
	process the any-warp rule;
	say "You bolt ahead, booming 'I'm [']ere!'[paragraph break]Note that stuff like the score is likely hosed now. Your object is just to get through the rest of the game. You also should not be able to go back south in this testing environment.";
	now climb-clear is true;
	now in-way-wronged is true;
	now in-so-saded is true;
	move player to Airy Isle;
	repeat through table of verb checks:
		if there is a core entry and core entry is true, now idid entry is true;
		if do-rule entry is vr-couple-caps rule, break;
	now score is min-needed - isle-score;
	isle-max-score;
	the rule succeeds.

volume map index

index map with Trim Tram mapped east of Real Rear.
index map with Po' Pit mapped east of Trim Tram.
index map with Vined Vault mapped east of Po' Pit.
index map with Vined Vault mapped south of Wet Wood.

index map with Fight Funnel mapped north of History Hall.

section odd directions

index map with Y'Old Yard mapped south of Got Gear Hot Here.

section endrooms

index map with Tarry Tile mapped north of Airy Isle.

section altrooms

index map with Vending Vibe mapped south of Po' Pit.
index map with Curst Cave mapped south of Vined Vault.

section metarooms [these need to go somewhere]

index map with Gazy Gap mapped south of Trim Tram.
index map with Hidey House mapped west of Gazy Gap.

section side room to include - not for release

[include Very Vile Fairy File Fake Rooms by Andrew Schultz.]
