"Very Vile Fairy File" by Billy Boling

[?? run through all possible directions you can't go in various areas]

[note that arrows in comments are for the vvm.py script to detect that, yes, the clues indeed work right. So don't delete them, future me!]

the story headline is "Less Lame Guess Game: Double Dip Trouble Trip"

volume includes

the release number is 5.

release along with a website.

release along with an interpreter.

release along with cover art.

include Trivial Niceties by Andrew Schultz.

include Intro Restore Skip by Andrew Schultz.

include Basic Screen Effects by Emily Short.

[a lot of stuff is/was commented out here because I wanted to keep VVFF as a z-machine game for the comp release. Perhaps this was quixotic, but I 1) enjoyed the programming exercise and 2) wanted to speed up testing, as z-machine's parser seemed to work faster than glulx's.  Long story short: I had severely shortened versions of the Mistakes and Tables, and they allowed me to make a z8 build until I added too much new stuff. Then I figured what was slowing Glulx down, like, a day or two later.]

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

book i6 replacements

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

to say here-to of (rm - a room): say "[if rm is location of player]here[else]to [rm][end if]"

to say swh of (rm - a room): say "[if rm is unvisited]somewhere new[else][rm][end if]"

to say once-now of (ru - a rule):
	process ru;
	let rbo be the outcome of the rulebook;
	say "[if rbo is the ready outcome]now[else]once[end if]"

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

max-bonus is a number that varies. max-bonus is 14.

cur-bonus is a number that varies. cur-bonus is 0. [we could define min-needed as core-max + cur-bonus I guess.]

isle-score is a number that varies. isle-score is 7. [this is the number of points in the endgame. 4 in isle, 3 in tile]

core-score is a number that varies. core-score is 0.

max-overall is a number that varies.

max-poss is a number that varies.

to decide what number is isle-min: decide on core-max - isle-score. [the minimum score you need to reach the endgame]

to up-min:
	increment min-needed;
	increment the score;

to up-reg:
	increment core-score;
	increment the score;

to max-down: decrement max-poss;

to decide which number is max-main: decide on min-needed - isle-score;

book region definitions

Worst Whew is a region. [first few]

Piddling Pain is a region. [middling main]

Browsy Breaks is a region. [lousy lakes]

Poorly Penned is a region. [early end]

Vale Verminous is a region. [terminal tale]

there is a region called Get a Guess. [meta mess]

to decide whether in-middlegame:
	if mrlp is Browsy Breaks or mrlp is Piddling Pain, yes;
	no;

book properties

a room has text called noway-text.

a room has a table name called guess-table. the guess-table of a room is usually the Table of No Good Guesses.

a person has text called talk-text.

a rhymable is a kind of thing. a rhymable has a table name called guess-table. the guess-table of a rhymable is usually the Table of No Good Guesses.

a person has a table name called guess-table. the guess-table of a person is usually the Table of No Good Guesses.

a gaphat is a kind of rhymable.

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

after looking in a wallish room:
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
	if player is in Y'Old Yard, say "[b]RANDOM PLACES: east or north.[r]";
	say "[run paragraph on]";
	if got-wry is false, say " (NOTHING) -- that's a bug.";

definition: a room (called rm) is wallish:
	if rm is Airy Isle and Bot Board is in Airy Isle, no;
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
	if player is in History Hall and in-mystery-mall is true and d is outside, no;
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

the zig zag rig rag is a rhymable. cht of zig zag rig rag is leteq. The player carries the zig zag rig rag. description of zig zag rig rag is "It certainly looks snazzy, but maybe you can convert it to something more practical.". guess-table of zig zag rig rag is the table of big bag zig zag rig rag guesses. [-> big bag]

the big bag is a rhymable. description of big bag is "It's pretty nondescript, but it gets the job done. You can hold everything you want tn, now!". guess-table of big bag is the table of big bag zig zag rig rag guesses.

volume Worst Whew

part Wet Wood 3,0

Wet Wood is a room in Worst Whew. "You just don't feel competent enough to get out of here. You can't find any way to go. You need to become better ... [oh-simp]. You also think you can hear something.". noway-text is "[wood-noway][paragraph break][how-better].". cht of Wet Wood is leteq. guess-table of Wet Wood is table of Wet Wood guesses. [-> get good]

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

Rift River is a room in Worst Whew. "The Rift River blocks you, and you can't go back, and you don't know which direction to go in, anyway. You managed to GET GOOD to get out of the wood, and maybe you'll need to do something similar to get around the river. It's too wide to cross, and you don't want to go back. Maybe you could summon a guide.". cht of Rift River is leteq. noway-text of Rift River is "Directions don't seem to work here. You feel like a guide would be helpful.". guess-table of Rift River is table of Rift River guesses. [-> gift giver]

chapter Mind Malt

a packet of Mind Malt is a thing. description is "It looks like there used to be Mind Malt, or powder that could make Mind Malt, here. Pity. It could've helped you figure what to do!". cht of Mind Malt is partplus. [-> find fault]

Too Totes New Notes is a rhymable. description is "You read about your accomplishments and what the Leet Learner scanned, or would have scanned:[paragraph break][fixed letter spacing][my-notes][variable letter spacing][run paragraph on]". guess-table of too totes new notes is the table of too totes new notes guesses.

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

Vined Vault is a room in Worst Whew. "[if mean mass is in Vined Vault]You found fault in the Vined Vault, so there's a way out.[else]You're stuck here! There looks to be no way out. It looks like a perfect trap, but...[end if]". noway-text is "You can't tell directions here, but then again, there's no actual unblocked way out. You need to use your head[if mean mass is in Vined Vault] again[end if].". cht of Vined Vault is partminus. guess-table of Vined Vault is table of Vined Vault guesses. [-> find fault]

chapter mean mass

The mean mass is a thing. "The mean mass continues to pulse and block the way out of the Vined Vault.". description is "The mean mass doesn't quite attack you, but it hangs menacingly, unnaturally, too dangerous to walk through.". cht of mean mass is letplus. [-> green grass]

part Po' Pit 2,-1

Po Pit is a room in Worst Whew. "Just beyond a trash trap ... an obvious one, no less ... looks like freedom, of a sort. You've got to get by! There is a row writ, which may or may not be helpful, by an obvious trash trap that guards a long gash gap[if sco-grow-grit is false]. But right now you feel too immature and jumpy to have a revelation how to even start. You suspect there is more than one way, and that's frustrating[end if].". noway-text is "You can't go back, and directions don't seem to apply here. You need to think your way past the trash trap.". cht of Po Pit is letplus. guess-table of Po Pit is table of po pit guesses. printed name of Po Pit is "Po['] Pit". [-> grow grit]

the row writ is scenery in Po Pit. "[if sco-grow-grit is true]It doesn't seem to be helpful any more, but it got you started. Yay[else]It's obviously meant to be motivational, but it's the sort of motivation that says if you want to do better, you have to be better. Be more of a person and have more hustle or desire. Still, despite its lack of detail, perhaps it is in the Po['] Pit for a reason[end if].". cht of row writ is partplus. [-> grow grit]

the trash trap is boring scenery in Po Pit. "It's pretty obvious that if you step on the trap, you'll plunge into a further pit.". cht of trash trap is letminus. bore-text of trash trap is "You want to NOT do anything with the trash trap. You don't know what could set it off.". [-> mash map]

the cache cap is a boring thing in Po Pit. "A cap sits here, with half its bill under something. You're not going to pull it out. It's intricately designed. I guess you could call it a cache cap, since it is stuck.". description is "Oh, look here. The cache cap has a layout of the Po['] Pit, along with the gash gap and trash trap. Okay, maybe layout isn't quite the right word. But it seems to indicate there's no way through. [if sco-grow-grit is false]You'd like to believe there is[else]With your new-found confidence, perhaps the right action could convince you otherwise[end if].". cht of cache cap is partminus. bore-text of cache cap is "The cache cap is only there to (sort of) help you figure how to get beyond the Po['] Pit.". bore-rule of cache cap is bore-cache-cap rule. [-> mash map]

the gash gap is boring scenery in Po Pit. "It looks intimidating, but who knows? Maybe you can figure a way across.". cht of gash gap is leteq. bore-text of gash gap is "The gash gap is an obstacle you need to find a special way around.". [-> mash map]

bap-map-rap is a number that varies.

understand "map" as trash trap when player is in Po Pit.

this is the bore-cache-cap rule:
	if current action is taking, say "No, the cache cap is too tacky. Perhaps it can help you in other ways." instead;

sco-grow-grit is a truth state that varies.

part Trim Tram 1,-1

Trim Tram is a room in Worst Whew. "[if sco-mind-me is false]FIND FEE is plastered all over the Trim Tram, making you feel poor and worthless compared to other adventurers. [end if]There's got to be a way to pay here to get the Trim Tram going. You hope so. Because there's no easy way out.". noway-text is "You're on the tram. There's no way to get off, and it'd probably lead back to the Vined Vault. How can you fake your way to paying a fare?". cht of Trim Tram is leteq. guess-table of Trim Tram is table of Trim Tram guesses. [-> flim flam]

FIND FEE is scenery in Trim Tram. cht of FIND FEE is partminus. "FIND FEE is plastered everywhere. [if sco-mind-me is true]But you can shrug it off now[else]You wish you could find something a bit different to do[end if].". [-> mind me]

sco-mind-me is a truth state that varies.

chapter flimflaming

skim-not-flim is a truth state that varies;

volume Piddling Pain

part Fun Fen 0,0

Fun Fen is a room in Piddling Pain. "It's a bit nicer here than back in the Done Den [one of]you came from[or]back below[stopping]. You don't fear ambush by a hun hen. You can go south, and [if sco-fall-free is true]with the tall tree pushed over, you can go north[else]it looks like you could go north, but the way looks treacherous and murky. Maybe you could do something with the tall tree nearby[end if][if wrong art is in Fun Fen], and maybe that wrong art is worth poking at. Or not[end if].". noway-text is "You don't want to go back through the Done Den to the Wet Wood or Vined Vault. Or fall off Fun Fen.". guess-table of Fun Fen is table of Fun Fen guesses.

to decide whether need-healing:
	if sco-least-loss is true and sco-heal-here is false, yes;
	no;

check going in Fun Fen:
	if noun is north:
		if sco-fall-free is false, say "The [poke pest] whispers in your head: 'WORK WITH MURK? MYTH!' You need a way through the murky bit to the north. Well, a much safer one." instead;
		if need-healing, say "You're not ready to go back and confront the Bull Beast in your injured state yet." instead;
	if noun is down, say "Perhaps Cark Cliff has some use, but tumbling down it isn't one of them. 'Don't die.' / 'Won't! Why?'" instead;

section joke jest poke pest

the joke jest poke pest is a thing. description is "You can't see it, and it's probably not a good idea to dwell on it. The more you do, the less you'll focus on your quest."

sco-bloke-blessed is a truth state that varies.

section done den

the done den is scenery in Fun Fen. "It looks nice and cozy. You feel a sense of accomplishment having made it through the done den, but you don't want to go back."

check entering done den: say "As you start to enter, you imagine a weight falling on you. How much? A ton. Ten. Perhaps before, or after, you would be mauled by a wild hun hen.[paragraph break]You don't need to revisit your initial success." instead;

section wrong art

the wrong art is optional scenery in Fun Fen. "It just looks wrong here. But perhaps it is sort of right, because it may give you one more idea about how to do things. Like all art, it's strictly not necessary, and neither is viewing it the right way. The wrong art also has a prong part sticking out from it.". cht of wrong art is letplus. [-> strong start]

check taking wrong art: say "Not worth it at all." instead;

the prong part is part of the wrong art. The prong part is optional. description is "It's a particularly ugly part of the wrong art.". cht of prong part is letplus. [-> strong start]

sco-start-strong is a truth state that varies.

section tall tree

sco-fall-free is a truth state that varies.

The Tall Tree is boring scenery in Fun Fen. "[if sco-fall-free is false]The tall tree sits here, bending out over the gap to the north. It could make a bridge reaching the other side[else]You made the tall tree fall free to the north, giving passage to [swh of the room north of Fun Fen][end if].". cht of tall tree is leteq. bore-text of tall tree is "[if sco-fall-free is true]You'd better not do anything to the tree. It's your way across[else]You need to do something specific to the tree. Maybe a sort of order[end if].". [-> fall free]

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

Cark Cliff is optional proper-named scenery in Fun Fen. "[if wild weed is moot]You don't feel so worried about Cark Cliff now[else]It's intimidating, but it would be neat if it weren't[end if].". cht of Cark Cliff is letplus. [-> spark spliff]

part Real Rear 0,-1

Real Rear is south of Fun Fen. Real Rear is in Piddling Pain. "Yup. This feels about like the edge of where you can explore. You can really only go back north. A peeling pier leads out south to the Sage Sea, which expands on all sides. There's also a steel steer here, and you sense the presence of a Ceiling Seer as well. [seer-is].". noway-text is "The Sage Sea surrounds you all ways except back north[if cage key is not off-stage]. You already got the cage key from it, anyway[end if]. You also sense a Ceiling Seer above, judging what you do.". cht of Real Rear is partplus. guess-table of Real Rear is table of Real Rear guesses. [-> kneel near]

to say seer-is:
	say "[if sco-heal-here is true]You're glad it's there, even though you don't need it any more[else if sco-kneel-near is false]You don't feel it's paying attention to you, yet[else if sco-felt-fear is false]Perhaps you should confide, somehow[else if cage key is off-stage]You remember the fear you felt, and you just need to show you can do something for yourself, now[else]Perhaps the Seer can do a bit more for you, if you ask right[end if]";

chapter ceiling seer

the ceiling seer is boring scenery in Real Rear. "The Ceiling Seer is all around. You can't do anything with it, [if sco-heal-here is true]and it's given enough[else if sco-kneel-near is true]. though you may be able to gain more favors[else]though if you do the right thing, you may be worthy of something valuable[end if].". [the seer is redirected to the rear]

chapter Sage Sea

the Sage Sea is a rhymable in Real Rear. it is scenery. "[if cage key is off-stage]You feel as though the Sage Sea must hold something, if you can prove yourself worthy[else]You've proved yourself worthy enough. The Sage Sea may hold other mysteries, but they are beyond the bounds of this quest[end if].". guess-table of sage sea is the table of cage key sage sea guesses.

check inserting into the Sage Sea: say "The Sage Sea is not a place to dump stuff." instead;

chapter peeling pier

the peeling pier is optional scenery in Real Rear. "It's -- well, not in great shape, but it feels appropriate for a semi-spiritual area under the Ceiling Seer's surveillance. [if sco-appealing-appear is false]You can't quite read who constructed it, and it's not a necessary mystery, but maybe it's a fun one[else]In fact, you fully notice the wabi-sabi thing it's got going on. Not flashy, but appropriate and welcoming[end if].". cht of peeling pier is letplus. [->APPEALING APPEAR]

sco-appealing-appear is a truth state that varies.

chapter Steel Steer

the steel steer is scenery in Real Rear. description is "It's probably a good thing it's not a stealing steer, which would fit in fully with the pier, but all the same, it suggests things you might be able to do.". cht of steel steer is partminus. [-> kneel near]

check taking steel steer: say "It is way too heavy to STEAL STEER." instead;

chapter Cage Key

the cage key is a rhymable. description is "It looks important. It must open something. There can only be so many cages around.". guess-table of cage key is the table of cage key sage sea guesses.

sco-kneel-near is a truth state that varies.

sco-felt-fear is a truth state that varies.

sco-heal-here is a truth state that varies.

part Creased Cross 0,1

Creased Cross is north of Fun Fen. Creased Cross is in Piddling Pain. "This feels like a boring old intersection, but you [if Bull Beast is moot]defeated the Bull Beast here, which was exciting[else]sense it could be so much more, later[end if]. You can go in all four directions here[beast-clue].". cht of Creased Cross is letminus. guess-table of Creased Cross is table of Creased Cross guesses. [-> beast boss] [-> least loss]

check going in Creased Cross when sco-beast-boss is true and sco-least-loss is false: say "You are too weakened right now. You need to limit damages somehow." instead; [??]

after going from Creased Cross when sco-heal-here is true and sco-cull-ceased is false:
	say "Hmm. The Bull Beast didn't chase you as you left. Maybe you were better equipped to dispose of it than you think.";
	continue the action;

to say beast-clue:
	if Bull Beast is not moot:
		say "[if sco-heal-here is true]You get the feeling the right cry could bring the Bull Beast out[else if sco-least-loss is true]The Bull Beast must be waiting in the shadows[end if]";

to decide whether need-loss:
	if sco-beast-boss is true and sco-least-loss is false, yes;
	no;

sco-beast-boss is a truth state that varies.

instead of doing something when need-loss:
	if action is procedural, continue the action;
	if current action is attacking or current action is talktoing or current action is gotoing or current action is gotothinging, continue the action;
	if current action is going, say "You don't have the energy to flee. But the right words..." instead;
	say "You need to do something ... no chance of winning, but you can't be routed here.";

chapter Bull Beast

The Bull Beast is a person. talk-text is "If it could talk, it'd say 'Tame? Tush! Maim! Mush!'". "[if sco-cull-ceased is true]The Bull Beast lies dead here[else]The Bull Beast roars around here. Perhaps one phrase would dispel it--maybe a weird one, but it IS a beast boss, after all[end if].". bore-text of Bull Beast is "The Bull Beast is dead. No need to muck around.". description of Bull Beast is "[if sco-cull-ceased is true]Dead. Perhaps it can be remade into something nicer[else if sco-heal-here is true]Not quite as impressive and intimidating as when it mauled you at first. Maybe the right words can repel it[else]Too tough to beat now, but maybe you can avoid total defeat[end if].". cht of Bull Beast is partplus. [Bull Beast->cull ceased]

sco-cull-ceased is a truth state that varies.

sco-least-loss is a truth state that varies.

chapter full feast

The full feast is a thing. "A full feast lies here. You can't eat it all by yourself, and you have no way to move it on your own.". description is "It's what remains of the Bull Beast, and it's surprisingly tasty looking. Pre-cooked, too! Because you sure burned it with your magic words, there. Ahaha.". cht of full feast is partplus. [->pull pieced]

check taking the full feast: say "Too much at once." instead;

part Stark Store -1,1

Stark Store is west of Creased Cross. cht of Stark Store is letminus. Stark Store is in Piddling Pain. "[if dark door is in Stark Store]A dark door leads to the west. You have no idea how to open it[else if dark door is moot]There's a way west where the dark door was[else]It's far too empty here! You can't have hit a dead end so soon[end if][if weird way is in Stark Store]. There's also a (blocked) weird way down[else if weird way is moot]. You cleared a weird way down as well[end if]. You can go back east to Creased Cross, too.". noway-text of Stark Store is "It's pretty stark here. You can only go [if weird way is moot]down, [end if][if dark door is moot]west and [end if]east.". guess-table of Stark Store is table of Stark Store guesses. [-> dark door]

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

Fight Funnel is below Stark Store. It is in Piddling Pain. cht of Fight Funnel is leteq. printed name is "[if sco-tight-tunnel is true]Tight Tunnel[else]Fight Funnel[end if]". "This is a narrow east-west passage[if sco-tight-tunnel is false], but you're not going further west past the fight[else if player does not have big bag], but it tapers to the west and you won't be able to fit with all your possessions scattered about you. The Leet Learner alone is too unwieldy, and you don't want to let go of it. You might need some simple organization to go west[else if Beer Bull is moot]. You don't need to go west now you trapped the Beer Bull[else if snare is moot]. You set a trap west, so you probably don't want to go there unless you're trying to catch someone[else]. You can probably just fit west[end if].". guess-table of fight funnel is table of fight funnel guesses. [-> Tight Tunnel]

understand "tight/tunnel" and "tight tunnel" as fight funnel when sco-tight-tunnel is true.

sco-tight-tunnel is a truth state that varies.

this is the drop-snare rule:
	if player has snuck snare and sco-knives-niche is true:
		moot snuck snare;
		phbt dives ditch;
		if in-bull-chase is true:
			say "Oh no! You don't have the time to place the snare AND distract the Bull Beast at once! Sorry about that. On the bright side, you managed to place the snare, though, and the Bull Beast was so busy beating you up, it didn't notice you setting a trap. So it's probably no problem just to come back here, now.";
			reset-bull-chase;
		else:
			say "As you go [if player is in fight funnel]west[else]look around[end if], you realize the snuck snare would be quite nice for trapping someone unsuspecting, somewhere, somehow. So you place it and return.";
			move player to fight funnel;
		the rule succeeds;

check going west in Fight Funnel:
	if sco-tight-tunnel is false, say "You're not getting past the fight." instead;
	if big bag is off-stage:
		say "You don't have enough space. You need to organize your possessions first. Maybe your inventory can be simplified--perhaps one item, changed, could hold the others, for convenience." instead;
	if snuck snare is moot and Beer Bull is not in location of player, say "Not now. You've prepared the trap. Let someone, or something, else walk into it." instead;
	process the drop-snare rule;
	if Beer Bull is in location of player:
		if snuck snare is moot:
			say "You crawl through the Fight Funnel and roll off to the side. The Beer Bull, not knowing better, springs the snare! Aigh! In its death throes, the Beer Bull speaks its first--and last--words: 'TRICK! TRAP! SICK SAP!' before it explodes, most of it tumbling into the remains of the Dives Ditch. But something's left behind: a flagon (or firkin or whatever) of mild mead, far less potent than whatever horrible alcohol the Beer Bull advertised.[paragraph break]You walk back to Here Hull, where a Gear Gull waits. 'Thank you for freeing me from the Beer Bull. I would like to do you a favor in return.' The Gear Gull inspects you.";
			solve-bull-chase;
			the rule succeeds;
		say "You lead the Beer Bull into [the room west of Fight Funnel], where it pauses a bit before cornering you. Perhaps next time, with a bit more preparation, you could take the Beer Bull down.";
		reset-bull-chase;
		the rule succeeds;
	if Beer Bull is moot, say "You don't need to set or trigger the Knives Niche again." instead;

to solve-bull-chase:
	if player has gold guard:
		buff-gold-guard;
	else:
		say "[line break]'I see no armor I could help improve. Come back when you find it. But for now, I need time to reorganize my domain.'";
	up-reg; [+beat Beer Bull]
	now in-bull-chase is false;
	moot Beer Bull;
	now player has mild mead;
	say "[line break]Man! I guess you could say you had ... one wound run-round.";
	bold-new-room Soft Sand;

part Dives Ditch -3,2

Dives Ditch is west of Fight Funnel. cht of Dives Ditch is partplus. Dives Ditch is in Piddling Pain. printed name is "[if sco-knives-niche is true]Knives Niche[else]Dives Ditch[end if]". "[if sco-knives-niche is true]You've set a trap, but for whom?[else]The dives ditch seems to recount many people lured, somehow, to their death. Perhaps you could construct a sneakier trap[traps-so-far].[end if]". guess-table of dives ditch is table of dives ditch guesses. [-> Knives Niche]

to decide which number is niche-guesses:
	let temp be 0;
	repeat through table of niche guesses:
		if nitry entry is true, increment temp;
	decide on temp;

table of niche guesses
nitxt	nitry
"fives fitch"	false
"hives hitch"	false
"lives lich"	false
"stives stitch"	false
"strives strich"	false
"wives witch"	false

to say traps-so-far:
	let ng be niche-guesses;
	if ng is 0, continue the action;
	say ". You had [if niche-guesses is 1]a good guess[else]some good guesses[end if]: ";
	let cur-niche be 0;
	repeat through table of niche guesses:
		if nitry entry is false, next;
		increment cur-niche;
		if cur-niche is ng and cur-niche > 1:
			say " and ";
		else if cur-niche > 1:
			say ", ";
		say "[nitxt entry]"

sco-knives-niche is a truth state that varies.

chapter mild mead and wild weed

the mild mead is a rhymable. the indefinite article of mild mead is "some". description is "It probably tastes gross and is not very psychoactive, either. But perhaps it will do, for a nice quiet victory celebration.". cht of mild mead is leteq. guess-table of mild mead is the table of mild mead guesses. [->wild weed]

the wild weed is a rhymable. the indefinite article of wild weed is "some". description is "You can't tell how potent it is by looking at it. It could be very weak, paralleling the mild mead, or very strong, because that's where all the Beer Bull's vitality went, instead of into the mead.". guess-table of wild weed is the table of mild mead guesses.

part History Hall -2,1

History Hall is west of Stark Store. cht of History Hall is leteq. History Hall is in Piddling Pain. printed name of History Hall is "[mist-hist of true]". "[if in-mystery-mall is true][mystdesc][else][histdesc][end if].[paragraph break]You [if ever-hall is false]see a misty passage up[else]could waste a bit of time wandering above[end if], and you can go back east[if the room outside of History Hall is Y'Old Yard], or you can go outside[end if][if sco-mystery-mall is true], and there's a store west[end if][if sco-mystery-mall is true]. Or you could just shift back to [mist-hist of false][end if].". guess-table of History Hall is table of History Hall guesses. [-> Mystery Mall] [Mystery Mall->History Hall]

check going up in history hall:
	if ever-hall is false, say "It feels like there could be something up there. Maybe not very important, but it's there. You just feel as though History Hall isn't defined enough, yet." instead;
	say "[if in-mystery-mall is true]You go up and browse Mystery Mall for a while. One store that clearly has nothing you want is[else]You don't have the time to study history, even though it might be more useful than a store like[end if] [next-rand-txt of table of mall shops]." instead;

check going outside in History Hall:
	if in-mystery-mall is true and poor ponder is moot, say "You'd have to switch back to History Hall to try that." instead;

to say mist-hist of (ts - a truth state): say "[if in-mystery-mall is ts]Mystery Mall[else]History Hall[end if]"

to say mystdesc:
	say "[if sco-mystery-mall is false]The wall to the west seems hollow[else if in-mystery-mall is true]History Hall's wist-eerie wall has disappeared, affording passage west[end if]. [if oi mo is in History Hall]There's a horrible song providing atmosphere[else if toe tappin is in History Hall]There's mall music in the air you can LISTEN to[else]You can LISTEN to random music if you want, too[end if][if mean moe's is in History Hall]. There's also something called Mean Moe's Clean Clothes, a small booth where you could tidy up, if you figured how to use it[end if]"

to say histdesc:
	say "[if poor ponder is in History Hall][Poor Ponder] lies here seeming, or trying to seem, more important[else if sco-mystery-mall is false]It's pretty empty in here. Perhaps it could become something more modern. Or less ancient[else]History Hall is empty once again[end if]"

check going west in History Hall: [Gutta Ganksta blocks you]
	if sco-mystery-mall is true:
		if Gutta Ganksta is in History Hall, say "The Gutta Ganksta pushes you back. Maybe you can win a quick diss war to, well, displace the ganksta." instead;
		continue the action;
	say "[if sco-mystery-mall is true]You'll have to change back to History Hall[else]Thud! But a hollow thud. Maybe shifted around a bit, [location of player] might afford passage west[end if]." instead;

section truth states for puzzles/map

in-mystery-mall is a truth state that varies. [are we in the mall or the hall?]

sco-mystery-mall is a truth state that varies. [have we ever flipped to the mall?]

ever-hall is a truth state that varies. [have we ever flipped to the hall?]

sco-whatta-wanksta is a truth state that varies. [have we called the ganksta a rude name?]

chapter Gutta Ganksta (M)

the Gutta Ganksta is an optional person. "A Gutta Ganksta with a tattoo chills (unconvincingly) here.". description is "GOTS GAME is tattooed on the Gutta Ganksta.". talk-text is "'Chill, chap. Will WHAP!'". cht of Gutta Ganksta is partplus. [-> whatta wanksta]

understand "tattoo" as GOTS GAME when Gutta Ganksta is quicknear.

GOTS GAME is part of the Gutta Ganksta. cht of gots game is leteq. description is "It's pretty bad, as tattoos go. It has so much wrong with it. Perhaps you could point it out, without being too hurtful.". [-> lots lame]

after lling Gutta Ganksta:
	if cht of gots game is leteq:
		say "But the GOTS GAME tattoo is worth scanning, too, so you do so.";
		try lling gots game;
	continue the action;

chapter Toe Tappin Row Rappin (M)

Toe Tappin Row Rappin is rhymable. Toe Tappin Row Rappin is scenery. printed name is "[i]Toe Tappin['] Row Rappin['][r]". "You [one of]listen a bit. The song is [Toe], and it's actually pretty catchy and good even a bit self-conscious with the 'Yo, Yappin' start. It might help you in the future, in the right place or places. Lateral thinking and all that. It's stuck in your head now, and that's not all bad, because what replaced it is even worse.[paragraph break]Now that [Toe] is in your head, it may help you in places where the usual rhymes don't work. Use [b]SAVE SONG[r] and [b]RAVE WRONG[r] to toggle this help, which is on by default[or]already have the song in your head. The 'Yo, Yappin[']' bit at the start suggests it is flexible and may help you do or see things another way[stopping].". cht of Toe Tappin Row Rappin is partminus. guess-table of toe tappin row rappin is the table of toe tappin row rappin guesses. [-> no nappin] [-> ho happen] [?? LL TOE needs to break down into specific cases]

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
	if tried-yet of vc-glean-glows rule, yes;
	no;

check entering Mean Moe's: say "It is too small to do anything to accept clothes." instead;

check inserting into Mean Moe's:
	say "You need to [if can-glean]GLEAN GLOWS[else]find the right command to get Mean Moe's to work[end if]." instead;

chapter clashing cloak (M)

the clashing cloak is a rhymable. description is "It seems suited for more than just fashionable conflict, if you knew what to do.". cht of clashing cloak is leteq. guess-table of clashing cloak is the table of clashing cloak guesses. [-> smashing smoke]

part Y'Old Yard -2,-1

Y'Old Yard is a room in Piddling Pain. "This is a very wide-open place. While you can try (and fail) to go INSIDE to the Shoaled Shard, all sorts of random places lie in every direction. [if Bold Bard is not moot]It probably won't respond to any direct rhyming. It's that imposing. [end if]You can go back INSIDE to the History Hall[if Bold Bard is moot], and with the Bold Bard gone, there's really nothing else to do[end if].". printed name of Y'Old Yard is "Y'Old(e) Yard(e)". guess-table of Y'Old Yard is table of Yold Yard guesses.

The Bold Bard is a person in Y'Old Yard. description is "The Bold Bard looks longingly at the Shoaled Shard. There must be some way in!". "[one of]'Hi! I'm a Bold Bard, and I'd love to get into the Shoaled Shard to perform and show how great I am. But the guards won't let me in. Maybe you could help? Some sort of distraction?'[or]The Bold Bard continues to pace back and forth here, looking for a way in the Shoaled Shard. Probably the obvious local ones didn't work.[stopping]". guess-table of Bold Bard is the table of Bold Bard guesses.

talk-text of Bold Bard is "'Scold-scarred. Told. Tarred.' The Bold Bard clearly wants to get into the Shoaled Shard but probably got thrown out by now-watchful guards. You both decide some sort of sneak attack or diversion would be best. If rhyming had worked, the Bold Bard would've found one that went old-ard.".

chapter gold guard

the mold marred gold guard is a rhymable. description is "[if Beer Bull is not moot]Very flimsy indeed, but maybe it could be repaired[else if sco-mining-more is false]Could sturdier be sturdier, actually. The gear gull said something about finding other materials[else]Super sturdy now you got the boost from the Shining Shore[end if].". printed name is "[if gull-guard is false]mold-marred [else if sco-mining-more is true]hold-hard [end if]gold guard". guess-table of gold guard is the table of Bold Bard guesses. noway-text of Y'Old Yard is "You wander around for a while before discovering [next-rand-txt of table of silly locations]. An interesting detour, but not useful."

understand "hold hard gold/guard" and "hold hard gold guard" and "hold/hard gold/guard" and "hold/hard gold guard" and "hold/hard" and "hold" as gold guard when sco-mining-more is true. [ugh! This is terrible, but I checked, and it covers all the possibilities.]

chapter shoaled shard

the Shoaled Shard is scenery in Y'Old Yard. "It's intimidating and obviously well-guarded, but it could be breached with the right distraction.".

check entering Shoaled Shard: say "You have no business there. [if bold bard is in y'old yard]But the Bold Bard might, with your help[else]You helped the Bold Bard get in[end if]." instead;

the cold card is a boring rhymable. description is "It's useful for one very useless boring ... hmm. It's blurred. You can't see.". guess-table of cold card is the table of Bold Bard guesses. bore-text of cold card is "You guess you'll know what to do with the cold card when the time comes. You hope."

part Vending Vibe -2,1 a

Vending Vibe is a room in Piddling Pain. "This isn't a very big place[if Lending Libe is off-stage]. And the 'vibe' here is a bit slangy[else if fussed folks is in Vending Vibe]. A book called [fussed folks] lies here you [may-already] to check out something more substantial[end if]. You can only go back east."

to say may-already:
	say "[if we whine is off-stage]may wish[else]managed[end if]"

The Trending Tribe are plural-named people in Vending Vibe. cht of Trending Tribe is letminus. talk-text is "'Bam, burning! Am earning!'". "A Trending Tribe stands here, just waiting to sell you something you can't afford, because there is no money in this game.". description is "They look greedy enough. They'd overcharge you to BORROW. Perhaps they can be vacated for something different, if a bit slangy". [-> Lending Libe]

the Lending Libe is scenery. "Looking in, you see one book labeled [i][next-rand-txt of table of library books][r][one of]. This locational libe has no vocational vibe[or][stopping].";

after going to Vending Vibe:
	process the card-and-libe rule;
	continue the action;

this is the card-and-libe rule:
	if Trending Tribe is moot and player has cold card:
		say "[line break]You look at your cold card for a minute. You realize that it's actually a library card! In fact, it has a book on hold! Unfortunately, the book is [We Whine], about how to be a jerk for profit and excitement. And you don't need that, being a hero. Still, you take it.";
		now player has We Whine ME MINE;
		moot cold card;
	continue the action;

We Whine ME MINE is a rhymable. cht of We Whine is letboth. description is "It's about how to be an extremely effective jerk and to get what you want, far better than the mere [i][next-rand-txt of table of motivational books][r]. [if sco-see-sign is true]This isn't something you would want to know, but it explains how and why certain people behaved that way in the past, and now[else]Why would you want to know that? Maybe a careful reading would turn something up[end if].". guess-table of we whine is the table of we whine guesses. [-> see sign]

understand "book" as We Whine Me Mine when We Whine Me Mine is touchable.

the printed name of We Whine is "[i]We Whine: ME, MINE[r]".

sco-see-sign is a truth state that varies.

chapter fussed folks

Fussed Folks Just Jokes is scenery. "You read about [next-rand-txt of table of miscellaneous people].". printed name of Fussed Folks Just Jokes is "[i]Fussed Folks Just Jokes[r]".

understand "book" as Fussed Folks when Fussed Folks is touchable.

check taking Fussed Folks: say "It's pretty obviously got nothing concrete to help you. It's just for entertainment." instead;

part Got Gear Hot Here -2,1 b

Got Gear Hot Here is a room in Piddling Pain. It is west of History Hall. "A dilapidated store. The only obvious exit is back east[if sco-not-near is false], but there may be another useless silly way to leave[end if].". guess-table of Got Gear Hot Here is table of Got Gear Hot Here guesses.

sco-not-near is a truth state that varies.

chapter hard hat

the marred mat is a rhymable in Got Gear Hot Here. description is "What is a marred mat doing in a clothing store? Either it's misplaced, or ... it's more appropriate in another form. It has a message, of course.". "You can't imagine what a marred mat is doing in a clothing store, but here it is.". cht of marred mat is partminus. guess-table of marred mat is the table of hard hat marred mat guesses. [->hard hat]

check taking marred mat: say "It can't be useful in that form." instead;

the hard hat is a gaphat. description is "The hard hat looks like it can protect you well enough, but it doesn't have a lot of flair, and it's not terribly lightweight.". guess-table of hard hat is the table of hard hat marred mat guesses.

check taking off hard hat: say "No. Something will come out of nowhere to conk you on the head, and then you'd be sorry. If you were conscious enough to be sorry." instead;

chapter shy shawl

the shy shawl is an optional thing in Got Gear Hot Here. "A shy shawl lies here. It can't possibly be directly useful.". cht of shy shawl is partminus. description is "Its weird and amorphous. The design is weird and abstract and, well, let's be charitable--open to possibilities. Maybe finding them would be good practice[if lurking lump is not off-stage] or help build the lump back up[else], but the shawl can't actually be useful[end if].". [-> lie lol]

check taking the shy shawl: say "It is not suitable apparel for a hero. But you can practice your rhyming on it. Anyway, being shy, it somehow scootches out of your reach." instead;

sco-lie-lol is a truth state that varies.

part Violent Vale 1,1

Violent Vale is east of Creased Cross. It is in Piddling Pain. cht of Violent Vale is partminus. "Creased Cross is back west, and it's sort of watery to the north or south. [if sco-silent-sail is false]It's scary here--there must be some way to get rid of the oppression! [end if][if fridge is in Vale]A frightening fridge towers over you to the east[duz-help][else]The way east is clear with the frightening fridge gone[end if][if boring boat is moot]. There's just a faint memory of how violent it was[else if sco-silent-sail is true]. It's not really violent here at all any more[end if].". guess-table of Violent Vale is table of Violent Vale guesses. [-> Silent Sail]

sco-silent-sail is a truth state that varies.

to say duz-help: if sco-silent-sail is false, say ", and getting rid of it might help things, a bit"

printed name of Violent Vale is "[if sco-silent-sail is false]Violent Vale[else]Silent Sail[end if]"

understand "silent sale/sail" and "sale/sail" and "silent" as Violent Vale when sco-silent-sail is true.

check going east in Violent Vale: if frightening fridge is not moot, say "Not with the frightening fridge blocking the way!" instead;

chapter frightening fridge

the frightening fridge is scenery in Violent Vale. cht of frightening fridge is leteq. "It's really scary, darkening everything around by virtue of being fifteen feet tall. It's probably packed with spoiled and/or 'seriously, kid, it'll help you grow' food, too.". [-> brightening bridge]

chapter flooring float

the flooring float is a fakeenter rhymable. cht of flooring float is letminus. "A flooring float bobs here.". description is "The flooring float is too impractical to ride or sail anywhere you might need. But it's impressive and gaudy!". guess-table of flooring float is the table of boring boat flooring float guesses. [-> boring boat]

check taking flooring float: say "It's too heavy, and you can't take it anywhere. Maybe some other watercraft, though." instead;

check entering flooring float: say "It's there for decoration, not transport. But something like it might let you go somewhere new..." instead;

chapter boring boat

the boring boat is a fakeenter rhymable. "[if buggin-freeze]That boring boat is here, but you don't have the energy to operate it[else][bore-boat-desc][end if].". guess-table of boring boat is the table of boring boat flooring float guesses.

to say bore-boat-desc:
	say "[if lake lea is visited]Your[else]A[end if] boring boat is docked here. Perhaps you could ENTER it to [if player is in Violent Vale]see somewhere new[else]return to [Violent Vale][end if].". description is "Just the sight of the boring boat leaves you yawning[if sco-snake-snap is true], but it seems sturdy enough for more adventure[else if sco-no-nappin is true] a bit even though you think NO NAPPIN, NO NAPPIN[else]. It's not going to make itself more exciting, but maybe you can break its sleep-spell so you can board and ride it[end if]"

does the player mean entering boring boat: it is very likely;

check taking boring boat: try entering boring boat instead;

check going inside when boring boat is touchable: try entering boring boat instead;
check going inside when flooring float is touchable: try entering flooring float instead;

sco-no-nappin is a truth state that varies.

sco-ho-happen is a truth state that varies.

boat-reject is a truth state that varies.

check entering boring boat:
	if in-bull-chase is true:
		say "Oh no! The boring boat shuts itself up as the bull beast gets close. I guess the boat can't take the beast's exciting-ness. The beast seems offended enough to take it out a bit extra on you.";
		reset-bull-chase;
		the rule succeeds;
	if sco-no-nappin is false:
		say "You try to enter the boat, but it seems so ... boring. If only you could get a jaunty tune stuck in your head to keep you alert!";
		now boat-reject is true;
		the rule succeeds;
	if player is in Been Buggin:
		if Dean Duggan is off-stage, say "Nah ... you're too bummed even to double back." instead;
		if player does not have way woke clay cloak, say "Dean Duggan stops you. You have not properly passed [if sco-lean-luggin is false and sco-mean-muggin is false]any[else]both[end if] of the tests you need yet. You need to face things now. Perhaps there is some slang involved, but sometimes you need to brute-force your way through problems." instead;
		say "With your way woke clay cloak in hand, you return to [Violent Vale]. After a moment, the boring boat floats off, perhaps to refuel from all the excitement.";
		moot boring boat;
		if clumped cluster is not moot, max-down;
		move player to Violent Vale;
		the rule succeeds;
	if player is in Lake Lea:
		say "You take the boring boat back to [Violent Vale].";
		move boring boat to Violent Vale;
		move player to Violent Vale;
		the rule succeeds;
	if player has clay cloak, say "The boat shouldn't be here, but you don't need it any more." instead;
	if cake cap is not off-stage:
		say "The boring boat takes a markedly different path this time. On the way, you are mentally drained by moans of 'Bold bum's doldrums' and 'Cold crumb's doldrums.' You are too tired even to kick yourself for trusting a boring boat, of all things, to take you somewhere interesting. Well, immediately interesting, at any rate.";
		move boring boat to Been Buggin;
		move player to Been Buggin;
		the rule succeeds;
	say "You take the boring boat [if Lake Lea is unvisited]somewhere new[else]back to Lake Lea[end if].";
	move boring boat to Lake Lea;
	move player to Lake Lea;
	the rule succeeds;

part Lake Lea 3,2

Lake Lea is a room. It is in Browsy Breaks. "You're on the Lake Lea, which borders on Lake Lap to the east.".

check going east in Lake Lea when Jake G is touchable:
	if sco-wake-whee is false, say "You have a feeling you may need Jake G.[']s guidance.";
	if sco-fake-fee is false, say "You haven't fully negotiated with Jake G. yet." instead;

Jake G is a person in Lake Lea. "[one of]You come on someone with JAKE G tattooed on him. It's the guy the boring boat told you to see. But he's sleeping right now[or]Jake G [if sco-wake-whee is false]dozes here[else if sco-take-tea is false]seems to be waiting to give you hospitality[else if sco-fake-fee is false]seems to want payment, but not really[else if sco-co-capn is false]looks at you longingly, as if for more equal companionship, maybe a song[else]paces back and forth here[end if][stopping].". talk-text of Jake G is "[if sco-wake-whee is false]Sleep/slumber, deep/dumber(?)[else]'Achy! Make me!'[end if]". cht of Jake G is partplus. guess-table of jake g is the table of jake g guesses. [-> wake whee] [-> fake fee] [-> take tea]

description of Jake G is "[if sco-wake-whee is false]He's sleeping. You need a personalized, cheery greeting[else if sco-take-tea is false]Jake seems to be fiddling with utensils and snack packs[else if sco-fake-fee is false]Jake rubs the fingers of one hand together but waves it off with the other[else if sco-make-map is false]Jake looks a little lost[else if sco-co-capn is false]Jake looks a little down here, as if he wants to feel equal to you, or he could use a song[else]Jake seems eager for battle[end if]."

sco-wake-whee is a truth state that varies.
sco-take-tea is a truth state that varies.
sco-fake-fee is a truth state that varies.
sco-break-brie is a truth state that varies.

part Whining War 2,1

Whining War is east of Violent Vale. It is in Piddling Pain. "[if sco-so-sappin is false]You can't get a close enough view of the war, but you can sure hear it. Maybe there's a way to make people tired of fighting, with a song or something.[else if sco-shining-shore is false]It's less whiny here, but it's still a bit too dull.[else]It's quieter and brighter here now than when you started. Yay![end if][if dining door is in Whining War][paragraph break]Also, the dining door you summoned is still here. How can you provide a banquet to celebrate the war's end?[else if dining door is off-stage] But it's too barren. Maybe there's some scenery that's appropriate here?[else if pining poor are moot] With the dining door and pining poor gone, you feel there's little more to do here.[end if]". cht of Whining War is partplus. guess-table of Whining War is table of Whining War guesses. printed name of Whining War is "[if sco-shining-shore is true]Shining Shore[else]Whining War[end if]". [-> Shining Shore]

[Lining, Lor'! Fining Four: well, it's a weird name, but if you whined about it, that might cause another Whining War.]
[mild mead from Bull Beast will help them do something. The Bull Beast's carcass as well. Once you have the big party, it is all over.]

[??mining more / dining door]

sco-so-sappin is a truth state that varies.

sco-mining-more is a truth state that varies.

sco-dining-door is a truth state that varies.

sco-shining-shore is a truth state that varies.

chapter pining poor

the pining poor are plural-named people. talk-text of pining poor is "'Rich row niche? No! ... Which woe?'". description of pining poor is "They look [if full feast is not moot]hungry and exhausted[else]idle, waiting for work[end if].". "The pining poor, relics of the Whining War, stand here, looking needy.". cht of pining poor is leteq. [->dining door]

chapter dining door

the dining door is fakeenter scenery. "The dining door is just there to invite people to eat, once there's a proper meal. It's not intrinsically useful."

check entering dining door: say "It doesn't seem to budge. Perhaps you need to prepare a meal somehow first." instead;

part Lake Lap 4,2

Lake Lap is east of Lake Lea. It is in Browsy Breaks. "You could go back west to Lake Lea, but you have a feeling that, whatever you need to do with Jake G., it's here[if sco-make-map is true]. You hear a hissing noise[end if].". cht of Lake Lap is leteq. guess-table of Lake Lap is table of Lake Lap guesses. [->make map]

sco-co-capn is a truth state that varies.
sco-make-map is a truth state that varies.
sco-snake-snap is a truth state that varies. [equivalent to "if cake cap is off-stage"]

The cake cap is a gaphat. description is "The cake cap looks tasty and yet still incomplete and not quite wearable on its own.". guess-table of cake cap is table of lake lap guesses.

part Been Buggin'

Been Buggin is a room in Browsy Breaks. cht of Been Buggin is leteq. "An isolated island too small to explore[if clumped cluster is in Been Buggin]. A clumped cluster lies in the corner. It doesn't need to be cleaned up, but it might be fun or therapeutic to[end if].". guess-table is table of Been Buggin guesses. [->mean muggin]

printed name of Been Buggin is "Been Buggin[']".

Dean Duggan is a person. "[one of]'Hi! I'm Dean Duggan. Congratulations on making it here. Well, sort of. If you have, you -- well, you've done well, but you still need help with life skills and stuff.'[or]Dean Duggan smiles here, ready to help you with whatever you need to ask about[bug-so-far].[stopping]". description of Dean Duggan is "Dean Duggan nods patiently. Though he mumbles motivational slang to himself, he's ready to help you, but you need to know what to ask for[bug-so-far].". talk-text is "'Teach tons, reach runs!' You don't need beach buns, but you probably need a specific phrase suitable to him, or this place. His lax demeanor suggests a bit of slang.". cht of Dean Duggan is leteq. [-> lean luggin]

to say bug-so-far:
	if sco-mean-muggin is true:
		say ". So far, you've managed to look tougher";
	else if sco-lean-luggin is true:
		say ". So far, you've found new ways to be and feel stronger";
	else:
		say ". You'd love to be able to be stronger and tougher, mentally and physically";

sco-mean-muggin is a truth state that varies.

sco-lean-luggin is a truth state that varies.

to decide whether dean-done:
	if sco-mean-muggin is true and sco-lean-luggin is true, yes;
	no;

the way woke clay cloak is a rhymable. description is "It's unwearable in its current state and may just bog you down.". guess-table of clay cloak is the table of clay cloak guesses.

chapter staystronging

to decide whether in-way-wrong:
	if player is in Been Buggin and sco-glow-glad is false and sco-stay-strong is false, yes;
	no;

sco-stay-strong is a truth state that varies.

after looking in Been Buggin for the first time:
	say "Everything feels pointless. You're sick of these silly rhymes. They feel way wrong, way wrong.";
	now cht of the player is letplus; [way wrong->stay strong]
	continue the action;

every turn when in-way-wrong:
	say "Way wrong ... way wrong ... you feel so depressed and upset. Maybe there's an easy way out of this, but you wouldn't feel accomplished. And if there's a hard way out of this, it's too hard.";

instead of doing something when in-way-wrong and player was in Been Buggin:
	if action is procedural, continue the action;
	if current action is entering boring boat or current action is gotoing or current action is gotothinging, continue the action;
	say "You can't. Everything feels ... way wrong. You feel so weak!";

chapter glowglading

to decide whether in-so-sad:
	if player is in Been Buggin and sco-glow-glad is false and sco-stay-strong is true, yes;
	no;

sco-glow-glad is a truth state that varies.

every turn when in-so-sad:
	say "So sad ... so sad ... you feel so depressed and upset. Maybe there's an easy way out of this, but you wouldn't feel accomplished. And if there's a hard way out of this, it's too hard.";

instead of doing something when in-so-sad:
	if action is procedural, continue the action;
	say "You can't. You just feel ... so sad. Mo['] mad.";

part Soft Sand 0,2

Soft Sand is a room in Piddling Pain. Soft Sand is north of Creased Cross. cht of Soft Sand is leteq. "You can go all four directions here[check-hull][if sco-loft-land is true]. Or you can change back to [soft-loft of false][else]. But ... well, it also feels a bit low. It seems like there's something way high above to the west[end if].". guess-table of Soft Sand is table of Soft Sand guesses. [-> Loft Land] [Loft Land->Soft Sand]

to say check-hull:
	if gull-guard is true:
		say ", though you're done to the east";
	else if Beer Bull is moot:
		say ", and you remember the Gear Gull waits east in Here Hull to help with [if player has gold guard]your gold guard[else]any armor you find[end if]"

to say soft-loft of (ts - a truth state): say "[if in-loft-land is ts]Loft Land[else]Soft Sand[end if]".

printed name of Soft Sand is "[soft-loft of true]".

to say soft-or-loft:
	if in-loft-land is false:
		say "[if sco-loft-land is false]The sand feels unstable, not like it's going to swallow you up, but like it could become something else. There's also something to the west you can't reach by flying. It's just--up there[else]Or you could bring back the Loft Land[end if]";
	else:
		say "The cave you couldn't reach in the Soft Sand is now easily accessible to the west"

sco-loft-land is a truth state that varies.

in-loft-land is a truth state that varies.

check going west in Soft Sand:
	if in-loft-land is false and jerk gel is not in Shirk Shell, say "The smirk smell is too repulsive. You can't go back. But you got the jerk gel, and that's enough." instead;

check going east in Soft Sand:
	if gull-guard is true, say "You already got what you wanted from Here Hull and the Gear Gull. You must confront things more ... fearful." instead;
	if Beer Bull is moot:
		if player has gold guard:
			say "As you go east, the Gear Gull inspects your mold-marred gold guard. 'I can do something now.'";
			buff-gold-guard;
		else:
			say "You don't have anything for the Gear Gull to buff.";
		the rule succeeds;

section booleans for location appearance

loft-land is a truth state that varies.

part Here Hull 1,2

Here Hull is east of Soft Sand. It is in Piddling Pain. "The only exit here is back west to [Soft Sand].".

gull-guard is a truth state that varies.

to buff-gold-guard:
	say "[line break]The Gear Gull breaks out some polish. It doesn't just remove the mold but thickens the gold guard without making it heavier. You smile, but the Gear Gull says, 'I can only make the gold guard so strong. There are materials that can do more. You must find them to be able to reach your goal. You are done here--no need to come back.'[wfak]";
	if tried-yet of vc-beast-boss rule, say "[line break]You also feel more ready to face the beast boss, now.";
	now gull-guard is true;

check going west in Here Hull:
	if sco-near-null is false and in-bull-chase is true:
		say "The bull is too fast and strong. It tears you up. Maybe there was some way to weaken it. At least it slinks back to where it was, maybe saving another beating for later.[paragraph break]";
		reset-bull-chase;
		the rule succeeds;

The Beer Bull is a person in Here Hull. cht of Beer Bull is leteq. talk-text is "It can't speak, but its look says 'Real rude? Deal, dude!'". "[if in-bull-chase is false][bull-standby][else]The Beer Bull looks quite upset, ready to chase you wherever you may go. While it's too quick for you to double back on, it could be goaded somewhere dangerous[end if].". description of Beer Bull is "It has FEAR FULL tattooed on its chest, because that's how beer advertising is--but maybe you should've expected it, since BULL and HULL don't quite rhyme, anyway. [if in-bull-chase is true]And boy, you annoyed it. Better try to keep running while you can[else]It looks formidable, and yet -- you'd love to outsmart it, somehow[end if].". guess-table of Beer Bull is the table of Beer Bull guesses. [->dear dull] [->near null]

check taking Beer Bull: say "You need to worry about the Beer Bull taking you." instead;

to say bull-standby:
	say "[if ever-bull-chase is false]A Beer Bull stands motionless here. There may be a way to wake it up, and it looks like there's something behind it[else]You saw something behind the Beer Bull before you made it chase you by saying DEAR DULL. If only you could dispose of the bull, you could see what it is[end if]"

sco-near-null is a truth state that varies.

in-bull-chase is a truth state that varies.
ever-bull-chase is a truth state that varies.

to decide whether hull-bull:
	if player is in Here Hull or Beer Bull is in location of player, yes;
	no;

to reset-bull-chase:
	if player is in Fight Funnel:
		say "[line break]Whoah! The Beer Bull seemed to run out of [fight funnel] quickly. Perhaps you could lure it further. What [if dives ditch is visited]can you do[else]could be[end if] to the west?";
		say "[line break]";
	say "You limp [if player is in Creased Cross]around[else]back to[end if] Creased Cross.";
	move Beer Bull to Here Hull;
	move player to Creased Cross;
	now in-bull-chase is false;
	now bull-from is Here Hull;

bull-from is a room that varies. bull-from is Here Hull.

check going when in-bull-chase is true:
	if the room noun of location of player is bull-from:
		say "The Beer Bull catches you doubling back! What follows is ... not pretty.[paragraph break]";
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
	if Beer Bull is in location of player:
		say "The Beer Bull catches up to you! It charges and kicks you around for a while. Some part of it realizes if it does too much damage, it won't have a chance to kick you around again, so it retreats [if player is in Here Hull]into its corner[else]back to Here Hull[end if].[paragraph break]";
		reset-bull-chase;
		the rule succeeds;
	if Beer Bull is not in location of player:
		if player is in real rear:
			say "The Beer Bull roars at the relative peacefulness of the Real Rear and turns back. While you haven't actually defeated the Beer Bull, you managed to escape a mauling. Perhaps this place will help with an even tougher opponent in the future.";
			move Beer Bull to Here Hull;
			now in-bull-chase is false;
			the rule succeeds;
		say "The Beer Bull thunders just behind. ";
		if player is in History Hall:
			say "The Bull seems out of place here, but it's not particularly bothered by that.";
		else if player is in Violent Vale and frightening fridge is in Violent Vale:
			say "Oh no! Between the Beer Bull and the fridge, you feel trapped[if flooring float is touchable], and the float won't help you escape[else if boring boat is touchable], and you'd get caught boarding the boat[end if].";
		else if player is in Blinding Blaze:
			say "[if sco-winding-ways is true]Bringing a half-bull to a maze is a bad idea without a ball of string. You have none in this game[else]Uh oh. You've trapped yourself with no easy visible way out[end if].";
		else if player is in Whining War:
			say "There's nowhere to go from here. The [if sco-shining-shore is true]ex-whiners tremble in fear, not whining, but unable to bring themselves to help you[else]whiners aren't going to help you[end if].";
		else:
			say "You need to keep moving, or it will catch you.";
		now bull-from is location of Beer Bull;
		move Beer Bull to location of player;

to start-bull-chase:
	now ever-bull-chase is true;
	now in-bull-chase is true;

part Shirk Shell -1,2 a

Shirk Shell is west of Soft Sand. IT is a room in Piddling Pain. "You feel like there's not a lot to do here in the Shirk Shell. Nothing to do except go back east, in fact.". cht of Shirk Shell is letminus. [->work well]

check going east in Shirk Shell: if player has jerk gel, say "A smirk smell erupts in Shirk Shell. You don't want or need to go back.";

after printing the name of jerk gel while taking inventory: say " (brand name: SUPPLE SAPS)";

the tube of jerk gel is a rhymable in Shirk Shell. "A slightly leaky tube of Jerk Gel lies here. It doesn't seem trivial to take, but maybe it will come in handy.". description is "It seems to be a powerful glue, the sort jerks use for pranks, hence jerk gel. You figure you'll know what to do with it when the time comes[if player does not have jerk gel], but right now, you'll want to figure how to pick it up carefully[else]. A closer look indicates its ingredients include SUPPLE SAPS[end if].". cht of jerk gel is partplus. guess-table of jerk gel is the table of jerk gel guesses. [-> work well]

understand "supple/saps" and "supple saps" as jerk gel.

check taking jerk gel when jerk gel is in Shirk Shell:
	say "The jerk gel has spilled out a bit, and it's too icky to take as-is. You'll need to show diligence putting it back in." instead;

part Curst Cave -1,2 b

Curst Cave is a room in Piddling Pain. "You can only go back east[tap-in-cave][if worst wave is in Curst Cave]. A worst wave rushes about, leaving you feeling terrible[end if].". guess-table of Curst Cave is table of Curst Cave guesses.

the worst wave is scenery in Curst Cave. cht of worst wave is leteq. "Whoah! It's not terribly friendly or welcoming. Perhaps you can make it more likable.". [->first fave]

the screaming skull is a thing in Curst Cave. description is "The skull opens and closes its mouth, but the volume of its screaming remains constant.". "A screaming skull bobs up and down here, well, just screaming. It's not threatening, but it's really disruptive.". cht of screaming skull is letminus. [->dreaming dull]

check taking screaming skull: say "You need to 'take' it figuratively." instead;

to say tap-in-cave:
	if tool tap is in Curst Cave, say ". A tool tap sits where the worst wave used to be[if cool cap is not off-stage], but you already got something from it[else], and you haven't gotten anything interesting from it yet[end if]"

the tool tap is a boring rhymable. it is scenery. "It looks stiff and unresponsive, but with the right word, something will come out. Something must come out of it. But what?". cht of tool tap is leteq. guess-table of tool tap is table of cool cap tool tap guesses. [->cool cap]

bore-text of tool tap is "You can't see any way to operate the tool tap, not even the usual you'd expect for, well, a tap.".

the cool cap is a gaphat. description is "The cool cap looks great[if jerk gel is moot], and boy, it feels great now you glued the other hats to it[else], but it doesn't seem functional, yet[end if].". guess-table of cool cap is table of cool cap tool tap guesses.

sco-first-fave is a truth state that varies.

part Foe Field So Sealed 0,3

Foe Field So Sealed is a room in Piddling Pain. It is north of Soft Sand. printed name is "Foe Field[if Pain Peasant is in Foe Field] So Sealed[else if sco-show-shield is true]: Ho, HEALED[end if]". "Passages lead all four directions[if sco-show-shield is false]. However, the words YO YIELD to the north suggest you'll be blocked if you go that way[end if].". cht of Foe Field So Sealed is partplus. guess-table of foe field so sealed is table of Foe Field guesses. [->show shield]

check going south in Foe Field So Sealed:
	if Pain Peasant is in Foe Field, say "As you leave, the Pain Peasant whines 'My, me, fly, flee!' Perhaps you gave up too quickly, and there's a simple way by. Eh, later.";

check going north in Foe Field So Sealed: if sco-show-shield is false and Pain Peasant is moot, say "A booming call of 'YO! YIELD!' echoes. There's something more than the [poke pest]'s taunting, there. You need to find a way to protect yourself from it." instead;

chapter showshielding

sco-show-shield is a truth state that varies.

chapter Pain Peasant

the Pain Peasant is a person in Foe Field. description is "Pretty simple looking, really. But clearly Upset about Stuff enough to push you back out of spite.". "A Pain Peasant paces back and forth, looking nervously east and west.". cht of Pain Peasant is letplus. [-> plain pleasant]

check going in Foe Field So Sealed when Pain Peasant is in Foe Field:
	say "The Pain Peasant blocks you, saying 'Which way? Hitch! Hey!' Whether the peasant is trying to save you from pain or trying to be a pain is unclear. But you're not getting by unless you get the Pain Peasant to leave." instead; [?? fain pheasant]

part Store All Stage -1,3

Store All Stage is a room in Piddling Pain. It is west of Foe Field. "'All' probably refers more to potential than anything else. Lots could fit here, but [if coral cage is in Store All Stage]there's only a coral cage[else]even the coral cage is gone now[end if].[paragraph break]You can really only go back east.". guess-table of store all stage is table of Store All Stage guesses.

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

Pit Pound is east of Foe Field. It is in Piddling Pain. cht of Pit Pound is leteq. printed name of Pit Pound is "[if sco-fit-found is false]Pit Pound[else]Grit Ground[end if]". description of Pit Pound is "[if sco-fit-found is false]You feel like you don't belong here, yet[else]You finally feel comfortable here[end if]. [if sco-winding-ways is false]There's a blaze to the east that may be trickier to visit, though[else if stuck stair is moot]There's not much left east[else]Why, you could even deal with the maze to the east[end if]. You can also go back west.". guess-table of Pit Pound is table of Pit Pound guesses. [->fit found]

A hit hound is a person in Pit Pound. cht of hit hound is leteq. "A hit hound paces menacingly back and forth here.". description is "The hit hound seems attuned to your slightest moves. It doesn't strike, but it certainly leaves you fidgeting!". talk-text is "Yowl. Yip. Growl. Grip?". [->sit sound]

check going east in Pit Pound:
	if hit hound is in Pit Pound, say "Not with the hit hound guarding you, you aren't." instead;
	if sco-fit-found is false, say "It's weird. You don't feel like you belong in the Pit Pound enough to go further east beyond it. Maybe you need a little more mental preparation, more than just to sit sound." instead;

sco-fit-found is a truth state that varies.

part Blinding Blaze 2,3

Blinding Blaze is east of Pit Pound. It is in Piddling Pain. cht of Blinding Blaze is letminus. printed name of Blinding Blaze is "[if stuck stair is moot]Grinding Grays[else if sco-winding-ways is true]Winding Ways[else]Blinding Blaze[end if]". description is "[if sco-winding-ways is false]This is such a terrible blaze. Unless you can make it into something else, you can only go back west[else if sco-mo-mappin is false]There's a maze to the south and east. You'll want to plan out fully how to deal with it. It feels like you'll need something to lighten the mood of brute-forcing through[else if stuck stair is touchable]A stuck stair leads down, but to where?[else]You've probably dealt with everything you can, here.[end if] [if sco-winding-ways is true][can-nothing] can also just go back west[end if].". noway-text is "[blazno].". guess-table is table of Blinding Blaze guesses. [-> Minding Maze]

to say can-nothing: say "[if snuck snare is off-stage]You can also[else]Nothing to do except[end if]"

to say blazno:
	if sco-winding-ways is false:
		say "You can't see any way other than back west";
	else if stuck stair is off-stage:
		say "You explore the Minding Maze a bit, but you get frustrated quickly. You need some emotional support, support from inside you and not related to this location, to negate the drudgery of working through all the dead ends and to make it through smoothly and happily";
	else:
		say "You found a way through the maze[if stuck stair is not moot], but you now need to figure how to operate the stuck stair[end if]. No directions except exiting back west were, or are, needed";

sco-winding-ways is a truth state that varies.

sco-mo-mappin is a truth state that varies.

check going down in Blinding Blaze when stuck stair is in Blinding Blaze: say "It's not that easy. The stair's stuck. Maybe if you knew where to go or what you wanted to do, it'd be easier." instead;

chapter Minding Maze

the Minding Maze is fakeenter scenery. "The Minding Maze looks complicated. Perhaps you could find a way to make exploring it a little more whimsical. Some art, or something. Or a variation on said art."

check entering Minding Maze: try going east instead;

chapter stuck stair

the stuck stair is a fakeenter rhymable. it is scenery. "It looks like you may have to figure where the stair might go to use it.". cht of stuck stair is letminus. guess-table of stuck stair is the table of snuck snare stuck stair guesses. [-> luck lair]

chapter snuck snare

a snuck snare is a rhymable. description is "You feel lucky enough that you'll know where to put the snuck snare when the time is right.". guess-table of snuck snare is the table of snuck snare stuck stair guesses.

[?? burned bower/turned tower]

volume Vale Verminous

part Gassed Gap 0,4

Gassed Gap is a room in Vale Verminous. "[if Reeker Russell is off-stage]It looks like there should be a way to the north, but it's too hazy. You may need to do something to break things up[else]There's a way to the north, now that you cast your cap[end if]. [if evidence-pieces < 3]However, it's still too intimidating[else]You feel confident you can make it through[end if].". cht of Gassed Gap is partminus. [-> cast cap]

Gassed Gap is north of Foe Field. cht of Gassed Gap is partminus. guess-table of Gassed Gap is table of Gassed Gap guesses. [-> Last Lap]

check going in Gassed Gap when Reeker Russell is in Gassed Gap:
	say "'Go, gassed foe, fast!' Reeker Russell taunts you. That makes you mad enough to stay and deal. He's about all that's left in your way. Somehow, you";
	if russell-progress is 0:
		say "ll have to diminish him and his gun.";
	else:
		say " still have to diminish [if good gun is moot]him[else]his gun[end if].";
	the rule succeeds;

printed name of Gassed Gap is "[if cap-cast is true]Last Lap[else]Gassed Gap[end if]".

cap-cast is a truth state that varies.

sco-go-gappin is a truth state that varies.

check going north in Gassed Gap:
	if Reeker Russell is off-stage, say "Oh, it's much too intimidating[if sco-go-gappin is true], even though you have a courageous song in your head[end if]. You just fear there's someone blocking your way, someone to summon and defeat." instead;
	if Reeker Russell is in Gassed Gap, say "Not with Reeker Russell around." instead;
	if sco-go-gappin is false, say "You whistle in fear. You need some sort of motivation. One last song, maybe" instead;
	unless evidence-pieces is 3, say "You aren't armed with enough evidence to take down the Very Vile Fairy File." instead;
	say "You review the evidence you have and take a deep breath. The backed binder, revealing the worst of the VVFF's ideas. [We Whine] and its examples of how such meanness affects everyday people. The lessons from the Moral Mage. You understand the VVFF. You can resist. You're not going to give up in this last bit. The way north and up crumbles after you take it. When you turn back to look, somehow, you're on an island.";
	isle-adjust-score-think;

to decide what number is bag-point: decide on boolval of whether or not player has big bag;

to isle-adjust-score-think:
	repeat through table of verb checks:
		if think-cue entry is true, now think-cue entry is false; [SPARK SPLIFF, for instance, can no longer be done, along with other LLPs(?) ]
	say "rolling [boolval of sco-really-rolling].";
	say "blessed c[boolval of sco-bloke-blessed].";
	now max-poss is isle-score + score + 2 - (boolval of sco-really-rolling + boolval of sco-bloke-blessed);

to decide which number is evidence-pieces:
	decide on boolval of sco-see-sign + boolval of (whether or not player has backed binder) + boolval of (whether or not coral cage is moot);

[?? trusty tap / crusty cap]

sco-couple-caps is a truth state that varies.

chapter Reeker Russell

Reeker Russell is a person. Reeker Russell carries the good gun. "Reeker Russell blocks the way north[if good gun is not moot], and he's armed with a good gun![else].[end if]". talk-text is "'My mood: DIE, dude!'". description of Reeker Russell is "He looks [if sco-meeker-muscle is true]meeker than at first[else]pretty strong[end if]. He is also [if good gun is moot]unarmed[else]holding a good gun[end if].". cht of Reeker Russell is partminus. [-> meeker muscle] [-> beaker bustle]

description of good gun is "It's made up of an obviously sleek and superior metal. A lesser material, and it might fall apart and be useless.". cht of good gun is leteq. [->wood one]

to decide which number is russell-progress:
	decide on boolval of sco-meeker-muscle + boolval of whether or not good gun is moot;

to check-russell-go:
	say "[line break]";
	if russell-progress is 2:
		say "Ashamed of how effortlessly and nonviolently you disarmed him, Russell flees! 'Cold cad rolled, rad,' you think to yourself.";
		moot Reeker Russell;
		if sco-beaker-bustle is false, max-down;
	else:
		say "Russell looks confused! One more setback, and he's had it.";

to adjust-russell:
	if sco-beaker-bustle is false and sco-meeker-muscle is true:
		phbt Reeker Russell;
		now Reeker Russell is not optional;
	else if sco-beaker-bustle is false:
		now Reeker Russell is optional;

sco-beaker-bustle is a truth state that varies.

sco-meeker-muscle is a truth state that varies.

part Airy Isle 0,5

Airy Isle is north of Gassed Gap. It is in Vale Verminous. "You hear laughter here, but it's all wrong. You could back out to the south, but you sense you must be very close to the Very Vile Fairy File now[if sought sword is in Airy Isle].[paragraph break]A sought sword (I mean, it just LOOKS important) lies unused here. Yet it's not for you[end if].". noway-text is "[if Lot Lord is touchable]You need to figure how to win a battle, not run away[else]You need to move a bit differently to advance[end if].". guess-table is table of Airy Isle guesses.

check going south in Airy Isle: say "There is no way back. Your destiny awaits." instead;

for printing a locale paragraph about a person (called per) in Airy Isle:
	now per is mentioned;
	if per is not Bot Board, continue the action;
	say "[one of]A Bot Board stands here, impassive, emotionless, not looking for a fight but looking extremely hard to budge[or]The Bot Board stands here, unrattled[if Lot Lord is in Airy Isle or Hot Horde is in Airy Isle] despite your having summoned help[end if][stopping].";
	if Lot Lord is off-stage and Hot Horde is off-stage, continue the action;
	say "[line break]";
	if Lot Lord is off-stage:
		say "A Hot Horde rambles around aimlessly here. Maybe they could take down the Bot Board, but they need discipline and leadership and order.";
	else if Hot Horde is off-stage:
		say "A powerful-looking Lot Lord stands here, pacing around as if waiting for an army to help him out.";
	else:
		say "The Lot Lord and Hot Horde mumble amongst themselves. The right battle cry, and they will be fully jazzed to take down the Bot Board!";

the Bot Board are plural-named people in Airy Isle. talk-text is "'Meep, mate! Heap hate! Weep, wait!'". description is "They stand impassively, likely programmed by the Very Vile Fairy File to strike down anyone with a creative or potentially subversive thought, yet thankfully unable to attack on their own. NOT [']NORED is etched on each of their chests.". cht of Bot Board is leteq. [->got gored] [-> Hot Horde]

the sought sword is scenery in Airy Isle. "It looks important, much better than a sot sword, shot sword, or swat sword, but it's intimidating. It says PROPERTY OF ... Man, maybe if you figured out who owned it, they might be able to help you.". cht of sought sword is letminus. [-> Lot Lord]

check taking the sought sword: say "You can't get near it. It must be someone else's. But who?" instead;

the Lot Lord is a person. talk-text is "'Eeg, not ig-nored.' Ugh?". description is "The Lot Lord's authority as a battle leader is unquestionable. Yet he needs [if Hot Horde is off-stage]followers[else]a battle cry for his followers--he doesn't seem much of a poet[end if].". cht of Lot Lord is partplus. [->got gored]

the Hot Horde are plural-named people. talk-text is "Lots of rot roared right now.". description is "The Hot Horde are all over the place. [if Lot Lord is off-stage]Even with the Lot Lord's leadership, they need something like a battle cry to unify them fully[else]They need a leader, and you're not tough enough. No offense[end if].". cht of Hot Horde is leteq. [-> got gored]

section go gate

there is a thing called the go gate. it is fakeenter. "A go gate stands here. You can just walk through it ... or can you?". description is "The go gate isn't just one piece. On further inspection, you see a grow grate.". cht of go gate is partplus. [->whoa wait]

check taking go gate: try entering go gate instead.

check entering go gate:
	say "Too fast. Boom! The grow grate pops up and crushes you. 'Lo, late! Foe, fate!' the [poke pest] whispers, and your last thought is, 'Ho, hate!'[paragraph  break]Today is definitely a ... d'oh date.[paragraph break]Maybe you should have expected that. Perhaps you need to be more circumspect.";
	end the story;

the grow grate is part of the go gate. description is "The grow grate looks like it could spring up at any time.". cht of grow grate is partminus. [->whoa wait]

section listless mist mess

the listless mist mess is scenery in Airy Isle. "It's very thick. You don't know what's behind there, other than the hints the wry wall gives you. [if go gate is off-stage]There must be another way forward[else]The go gate seems more worth exploring[end if]."

part Tarry Tile 1,5

Tarry Tile is a room in Vale Verminous. "Spite-spaced white waste surrounds you on all sides. Running away would do no good.". printed name is "[if sco-merry-mile is true]Merry Mile[else]Tarry Tile[end if]". noway-text of Tarry Tile is "No way through the listless mist mess.". cht of Tarry Tile is leteq. guess-table of Tarry Tile is table of Tarry Tile guesses. [->Merry Mile]

understand "merry/mile" and "merry mile" as tarry tile when sco-merry-mile is true.

section spite spaced white waste

the spite spaced white waste is scenery in Tarry Tile. "It stretches out endlessly, or at least long enough to crush your endurance."

chapter well worn hell horn

the well worn hell horn is a boring thing in Tarry Tile. cht of well worn hell horn is leteq. "A well worn hell horn balefully drones out dirgeful noises that makes you wonder why you should even bother.". description is "The well worn hell horn looks old, but still in good shape. At least with a cursory glance. But maybe there is a flaw.". bore-text of well worn hell horn is "It ... well, it looks used, but it still hasn't fallen apart.".[-> tell torn]

chapter Very Vile Fairy File

the Very Vile Fairy File is a boring thing in Tarry Tile. "The Very Vile Fairy File sort of repels you and attracts you at the same time. You know there must be a way to neutralize it. It is co-written by, unsurprisingly, Harry Hile, Larry Lyle, Perry Pyle and Sherry Shiel[one of]. They must be the Crimes Crew Times Two that Kit Cohen talked about! There's an even number of them, so that part works out[or][stopping]. You may or may not be up to READing it[ever-tried of table of vvff digs].". cht of Very Vile Fairy File is partminus. bore-text of Very Vile Fairy File is "[ff-no].". bore-rule of Very Vile Fairy File is bore-vvff rule. [-> bury bile]

this is the bore-vvff rule:
	if current action is talktoing, say "'THUMP THAT CHUMP-CHAT!' booms from inside the [fairy file]." instead;
	if current action is closing or current action is opening or current action is taking or current action is attacking, now skip-bore-text is true;

check opening very vile fairy file: try closing very vile fairy file instead;

check closing very vile fairy file: say "You will need to close the book on the [fairy file] with what you've been doing all game." instead;

check taking very vile fairy file: say "From the [fairy file]: 'Oh, ick! So sick!' You should've expected that, really." instead;

understand "vv/ff" and "vvff" as Very Vile Fairy File.

ever-read-vvff is a truth state that varies.

description of Very Vile Fairy File is "You regard the Very Vile Fairy File nervously. You are pretty sure you have all you need to deal with it, and yet at the same time, you feel as if you must either follow it or be beaten down by its ways, and there is no third way to render it irrelevant and powerless. You may or may not wish to READ it[if ever-read-vvff is true] again[end if]."

to say ever-tried of (t - a table name):
	repeat through table of all randoms:
		if tabnam entry is t and tabidx entry > 0, say " some more"

vvff-row is a number that varies.

instead of doing anything when second noun is Fairy File:
	if action is procedural, continue the action;
	say "[ff-no].";

to say ff-no: say "You can't do anything directly with or to the Fairy File. There must be some overarching action"

sco-merry-mile is a truth state that varies.

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
	if player is in Violent Vale and boring boat is in Violent Vale and sco-no-nappin is false, yes; [now cht of toe tappin is partminus] [->no nappin]
	if player is in Gassed Gap and sco-go-gappin is false, yes; [now cht of toe tappin is partminus] [now cht of toe tappin is partminus] [->go gappin]
	if Jake G is touchable and sco-fake-fee is true and sco-co-capn is false, yes; [now cht of toe tappin is letminus] [->co capn]
	if sco-mo-mappin is false and player is in Blinding Blaze and sco-winding-ways is true, yes; [now cht of toe tappin is partminus] [->mo mappin]
	if player is in Whining War and sco-so-sappin is false, yes; [now cht of toe tappin is partminus] [->so sappin]
	no;

sing-clues is a number that varies.
sing-max is a number that varies. sing-max is 5.

this is the check-sing-max rule:
	increment sing-clues;
	if sing-clues is sing-max:
		say "[line break]Suddenly, [Toe] feels played out. You'll enjoy it later, but not now. It's done its job, and it's out of your mind, for the moment.";
		if sco-ho-happen is false, max-down; [can't HO HAPPEN]
		moot Toe Tappin Row Rappin;
	else:
		say "[line break]You feel clever now, and you bet you could do [one of][or]even [or]yet [or]still [stopping]more with [Toe] when the time is right."

chapter dropping

instead of dropping when number of entries in multiple object list > 1 (this is the don't allow dropping all rule):
	alter the multiple object list to { };
	add noun to multiple object list;
	continue the action;

instead of dropping:
	if noun is poke pest, say "You can't quite drop it, literally or metaphorically." instead;
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

check waiting: say "[one of]Whoah, wait? Mo['], mate![or]Hi ho! Lie low![or]D'oh! Deed? No need.[or]Woo! Will stew, still![cycling]" instead;

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

after printing the name of We Whine while taking inventory: if sco-see-sign is true, say " (in which you can SEE SIGN)"

to decide which number is my-hats: decide on number of gaphats carried by player;

definition: a thing (called th) is evidencey:
  if th is Here Hip Queer Quip, yes;
  if th is We Whine and sco-see-sign is true, yes;
  if th is backed binder, yes;

check taking inventory:
	if player has big bag, say "Boy! You can carry all you need with your big bag![paragraph break]";
	now all things enclosed by the player are marked for listing;
	now toe tappin is unmarked for listing;
	now lurking lump is unmarked for listing;
	now joke jest poke pest is unmarked for listing;
	now all gaphats are unmarked for listing;
	now all evidencey things are unmarked for listing;
	now big bag is unmarked for listing;
	say "Stuff stole (rough role):[line break]";
	list the contents of the player, with newlines, indented, including contents, giving inventory information, with extra indentation, listing marked items only;
	if player has joke jest poke pest, say "The joke jest poke pest is buzzing around, but [if sco-bloke-blessed is true]it's not so distracting any more[else]maybe there's a way to tame it[end if].";
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

to check-injury: if need-healing, say "[line break]You're injured and should do something about that before re-facing the Bull Beast.";

to decide which number is toe-clued:
	let temp be 0;
	if tried-yet of vc-so-sappin rule, increment temp;
	if tried-yet of vc-co-capn rule, increment temp;
	if tried-yet of vc-go-gappin rule, increment temp;
	if tried-yet of vc-mo-mappin rule, increment temp;
	decide on temp;

to say toe-poss:
	now vc-dont-print is true;
	let tc be toe-clued;
	say "[if sing-clues is 0]The title just seems so fungible[else if sing-clues is 1]Yes, beyond what you found to start[else if sing-clues is 2]Even more than what you've seen[else if sing-clues is 4]Well, maybe just one more[end if]";
	if toe-clued > 0, say ". You also found [if toe-clued > 1]some riffs[else]a riff[end if] that will be useful later";
	now vc-dont-print is false;

to decide which number is carried-fungible:
	let temp be number of things enclosed by player;
	if the player carries Toe Tappin Row Rappin, decrement temp;
	decide on temp;

check taking when player does not have big bag (this is the need bag for lots of items rule):
	if carried-fungible > 3:
		say "You can't carry so much at once! Maybe you can finagle, or create, a container that'll let you hold as much as you want." instead;

the need bag for lots of items rule is listed last in the check taking rulebook.

chapter undoing

to say pest-sneer: say "You [if poke pest is touchable]hear the [poke pest] whisper[else]imagine someone sneering[end if]"

before undoing an action:
	if save undo state is false:
		say "[pest-sneer] 'Take two? Fake, foo[']!'[paragraph break]The lurking lump still [if lurking lump is moot]rematerializes[else]grows bigger[end if], though. Hopefully your time-bending and potential double-dipping didn't make it radioactive or something.";
		enable saving of undo state;
	else:
		say "Wiping one's typing ... TONS!";
	the rule succeeds;

chapter trivial pointless but amusing verbs

the block attacking rule is not listed in any rulebook.

check attacking:
	if noun is very vile fairy file, say "[pest-sneer] 'Big boom! Dig doom!' You step back and, err, rig room." instead;
	if noun is poke pest, say "'Lash like trash, tyke!' the [poke pest] whispers." instead;
	if noun is Kerry Kyle, say "Maim-me aim? Eeee..." instead;
	if noun is go gate, say "Ho! Hate!" instead;
	if noun is Reeker Russell, say "But he'd become Rager Russell. With major muscle." instead;
	if noun is Bot Board, say "The Bot Board intones 'Pif-paf? Riff-raff!' That's about as close to a joke as they'll get." instead;
	if noun is Bull Beast or noun is Beer Bull, say "You'd get a triple-tough cripple-cuff in return. You must fight with words." instead;
	say "[if noun is a person]Gauge gore: wage war! Rage! Roar[else]Very vandal-ous? Scary! Scandalous[end if]! [one of](NOTE: you don't need to attack anything. Well, not with the ATTACK command.)[or][line break][stopping]"

the block saying no rule is not listed in any rulebook.

check saying no: say "Hi-ho! Why woe? [yn-tell]" instead;

the block saying yes rule is not listed in any rulebook.

check saying yes: say "Yay! Yep! Hey, hep! [yn-tell]" instead;

to say yn-tell: say "[one of](you never need to answer yes/no questions unless specifically prompted.)[or][stopping][paragraph break]"

the block swearing obscenely rule is not listed in any rulebook.

check swearing obscenely:
	if player is in Tarry Tile, say "A howl from the [fairy file]: 'You yell to tell WHO?!?!' Dang! Implied profanity can be a real smackdown.";
	say "[one of]Dang, dude rang RUDE![or]Gee, gad! Be bad! 'Me, mad!'[in random order]" instead;

the block swearing mildly rule is not listed in any rulebook.

check swearing mildly: try swearing obscenely instead;

chapter smelling

the block smelling rule is not listed in any rulebook.

check smelling:
	if noun is Reeker Russell, say "Stench-stained, drench-drained." instead;
	if noun is Gassed Gap and Reeker Russell is in Gassed Gap:
		say "(Russell... his smell is overpowering)[paragraph break]";
		try smelling Reeker Russell instead;
	say "[one of]'Scent so went. Whoah!'[paragraph break][or][stopping]You don't need to SMELL anything." instead;

chapter listening

the block listening rule is not listed in any rulebook.

check listening:
	if player is in Wet Wood, say "'Bet, bud! Met mud!' That sounds a bit off, but ... perhaps it can help you in some odd way beyond just going in random directions." instead;
	if player is in Whining War, say "[if sco-so-sappin is false]It's more 'HEAD, HURT' than 'DEAD DIRT', but it's draining. Reason alone won't dispel it. Maybe some artiness might help, here[else]It's quieted down now. You can think and plan more things to do[end if]." instead;
	if player is in History Hall and in-mystery-mall is true:
		if Toe is in History Hall, try examining Toe Tappin instead;
		if Oi Mo is in History Hall, say "Tim T. Sims, Pimp, still 'sings' [i]Oi, Mo[r]. The chorus mentions double duty, which, eww. Maybe there's a way to quiet it down." instead;
		say "A random song plays briefly: [next-rand-txt of table of mall songs]." instead;
	if player is in Lake Lap and sco-make-map is true, say "The hissing noise continues." instead;
	say "You hear nothing worth focusing on." instead;

chapter thinking

ever-thought is a truth state that varies.

the block thinking rule is not listed in any rulebook.

a which-think is a kind of value. the which-thinks are no-details, doable-now, undoable-now. [ we could use 2 booleans for read-laters below, but that is awkward magic number stuff]

to read-laters (wt - a which-think):
	let thought-any be false;
	repeat through table of verb checks:
		if think-cue entry is true:
			if idid entry is true:
				say "DEBUG note--I forgot to clear [b][first-of-ors of w1 entry in upper case][if there is a w2 entry] [first-of-ors of w2 entry in upper case][r][end if] somehow. It would be nice to know how and when this happened.";
				now think-cue entry is false;
				next;
			process the ver-rule entry;
			let rb-out be the outcome of the rulebook;
			let pre-bug be whether or not ver-rule entry is vc-mean-muggin rule or ver-rule entry is vc-lean-luggin rule;
			if wt is no-details:
				if there is a think-advice entry and not too-distracted, next;
				if pre-bug is true, next;
				if thought-any is false, say "[line break]";
				now thought-any is true;
				let desired-command be indexed text;
				now desired-command is "[first-of-ors of w1 entry in upper case][if there is a w2 entry] [first-of-ors of w2 entry in upper case][end if]";
				if too-distracted:
					say "You tried to [b][desired-command][r], which should've worked, but you were and still are too distracted.";
				else:
					say "Now you're not too distracted, [b][desired-command][r] will probably work[if there is a best-room entry] [here-in of best-room entry][end if].";
				next;
			if there is no think-advice entry or too-distracted:
				unless pre-bug is true, next;
			if wt is doable-now and rb-out is not the ready outcome, next;
			if wt is undoable-now and rb-out is the ready outcome, next;
			if thought-any is false, say "[line break]";
			if there is a core entry and core entry is false, say "([b]OPTIONAL[r]) ";
			if rb-out is the ready outcome, say "([b]CAN DO NOW[r]) ";
			now thought-any is true;
			say "[think-advice entry][line break]";

to check-reversible-rooms:
	if player is in Soft Sand and sco-loft-land is true, say "[line break]You can switch between LOFT LAND and SOFT SAND freely.";
	if player is in History Hall and sco-mystery-mall is true, say "[line break]You can switch between MYSTERY MALL and HISTORY HALL freely.";

check thinking:
	say "You think about more specific challenges you've encountered and not solved, and what you've done and tried, and what you can do[if player has too totes new notes]. Perhaps [too totes] would refresh details[end if].";
	if all-hinted is 0:
		say "[line break]But you don't have leads for any puzzles right now." instead;
	now vc-dont-print is true;
	check-reversible-rooms;
	read-laters no-details;
	read-laters doable-now;
	read-laters undoable-now;
	if ever-thought is false:
		now ever-thought is true;
		say "[line break][b]NOTE[r]: The game will indicate when one command you found early will be applicable. An asterisk or (+) will also appear in the score in the upper right. Until then, you can [b]THINK[r] to see things you figured but aren't quite ready to do yet.";
	if boat-reject is true and sco-no-nappin is true and Lake Lea is unvisited, say "[line break]You also feel up to going back to the boring boat.";
	if number of optional-noted things > 0:
		say "You also know several things that are optional to figure out: [list of optional-noted things].";
	check-injury;
	now vc-dont-print is false;
	the rule succeeds;

to decide whether tried-yet of (vc - a rule):
	let tried-any be false;
	repeat through table of verb checks:
		if vc is ver-rule entry:
			now tried-any is true;
			if think-cue entry is true and idid entry is false, decide yes;
	if tried-any is false, say "I tried to check if [vc] was hinted in the THINK command but it wasn't in the help table[not-crit-but].";
	decide no;

to say not-crit-but: say ". This is not a critical bug, but I'd like to know about it"

chapter score

to say it-they of (n - a number): say "[if n is 1]it[else]they[end if]";

total-good-guesses is a number that varies.

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
		say "[line break]You have also used the lurking lump [lump-uses] time[plur of lump-uses] and are [gguess] of [next-lump-level] good-guess rhymes away from it re[if lurking lump is moot]turn[else]charg[end if]ing. You have made a total of [total-good-guesses] good guesses, as well.";
	now vc-dont-print is false;
	the rule succeeds;

the score and thinking changes rule is listed instead of the notify score changes rule in the turn sequence rulebook.

llp-notify is a truth state that varies.

this is the score and thinking changes rule:
	process the notify score changes rule;
	repeat through table of verb checks:
		if think-cue entry is true and idid entry is true, now think-cue entry is false;
	if buggin-freeze, continue the action;
	if narr-on is false, continue the action;
	if this-beta-warp is true, say "[line break](skipping narratives, which you can see at game's end anyway)[line break]";
	repeat through table of narratives:
		if done-yet entry is false and core-score >= rank-num entry:
			now done-yet entry is true;
			if this-beta-warp is false, say "[line break][rank-txt entry][line break]";
	now this-beta-warp is false;
	if llp-notify is false and min-needed > core-max:
		say "[line break]A stun-steed zooms by, bellowing 'None-need-done deed!' You feel guilty for losing focus instead of for your extra rigor, but eh, you deal by imagining a bin-bare-min mare showed up to insult you for not finding something extra.";
		now llp-notify is true;

to decide which number is can-do-hint of (ts - a truth state):
	let temp be 0;
	now vc-dont-print is true;
	repeat through the table of verb checks:
		if think-cue entry is true:
			process the ver-rule entry;
			let rb-out be the outcome of the rulebook;
			if ts is true:
				if rb-out is the ready outcome or there is no think-advice entry, increment temp; [the reason for "no think-advice entry" is because we also want to track when the beer bull distracts us. If there is no think-advice entry, there are no normal barriers to a certain command.]
			else if rb-out is the not-yet outcome:
				increment temp;
	now vc-dont-print is false;
	decide on temp;

to decide which number is doable-hinted:
	decide on can-do-hint of true;

to decide which number is future-hinted:
	decide on can-do-hint of false;

to decide which number is all-hinted:
	let temp be 0;
	repeat through table of verb checks:
		if think-cue entry is true, increment temp;
	decide on temp;

[see header file for table of ranks]

chapter narrnoing

narrnoing is an action applying to nothing.

understand the command "narr no" as something new.
understand the command "no narr" as something new.

understand "narr no" as narrnoing.
understand "no narr" as narrnoing.

carry out narrnoing:
	now ever-toggle-narr is true;
	say "Point scoring narratives are [if narr-on is false]already[else]now[end if] inactive[one of]. NOTE: toggling the option back on later may cause a backlog of narratives[or][stopping].";
	the rule succeeds.

chapter wherewhoaing

wherewhoaing is an action applying to nothing.

understand the command "where whoa" as something new.
understand the command "where whoah" as something new.
understand the command "whoah where" as something new.
understand the command "whoa where" as something new.

understand "where whoa" as wherewhoaing.
understand "where whoah" as wherewhoaing.
understand "whoah where" as wherewhoaing.
understand "whoa where" as wherewhoaing.

carry out wherewhoaing:
	now ever-toggle-narr is true;
	say "Point scoring narratives are [if narr-on is true]already[else]now[end if] active[if narr-on is false][narrative-backlog][end if].";
	the rule succeeds.

ever-toggle-narr is a truth state that varies.

definite-backlog-warned is a truth state that varies. [?? haven't got a definitive case. I need more rows in the table.]

to say narrative-backlog:
	let temp be 0;
	if definite-backlog-warned is false:
		repeat through table of narratives:
			if done-yet entry is false and rank-num entry < core-score, increment temp;
		if temp > 1:
			now definite-backlog-warned is true;
			say ". NOTE: you'll be seeing more frequent narratives for a bit, since there is a backlog from when you previously switched this option";
	if narrative-overload, say ". You also might not see all the entries in-game, but once you win, you can see all the ranks"

to decide whether narrative-overload:
	if airy isle is unvisited:
		if isle-min - core-score < narratives-left, yes;
	else if fun fen is unvisited:
		if core-max - core-score < narratives-left, yes;
	no;

to decide which number is narratives-left:
	let temp be 0;
	repeat through table of narratives:
		if mrlp is worst whew and rank-num entry > whew-score, next;
		if in-middlegame and rank-num entry <= whew-score and rank-num entry > isle-min, next;
		if mrlp is vale verminous and rank-num entry <= isle-min, next;
		if done-yet entry is false, increment temp;
	decide on temp;

book nonstandard but general verbs

chapter reading

reading is an action applying to one thing.

understand the command "r" as something new.
understand the command "read" as something new.

understand "r [thing]" as reading.
understand "read [thing]" as reading.

definition: a thing (called th) is readable:
	if th is a read-thing listed in the table of readables, yes;
	no;

does the player mean reading a readable thing: it is very likely.
does the player mean reading the leet learner: it is likely.

read-exam-note is a truth state that varies.

carry out reading:
	if noun is evidencey, say "Yes, [the noun]'s details are important, but you've gotten enough." instead;
	repeat through table of readables:
		if read-thing entry is noun, say "[read-txt entry][line break]" instead;
	if read-exam-note is false, say "NOTE: READ and X/EXAMINE are functionally equivalent for all items except those giving general advice. Items you can [b]READ[r] usually say so when you examine them.";
	now read-exam-note is true;
	try examining the noun instead;

to say read-vvff: now ever-read-vvff is true;

table of readables
read-thing	read-txt
Very Vile Fairy File	"[read-vvff]The [fairy file] contains advice and catch-phrases to seem like an alpha male or demoralize others you feel you need to demoralize. One is [i][next-rand-txt of table of vvff digs][r]"
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
	say "[b]HINT[r] with no object tells you if you need to do anything with the room, while [b]HINT[r] (object) looks at specific objects.";
	say "[2da][b]ABOUT[r] and [b]CREDITS[r] give general information.";
	say "[2da][b]EXITS[r] lists exits available.";
	say "[2da]The Leet Learner can help you determine what needs to be changed. [ll] or [b]CC[r] is the shorthand for scanning a location, and [ll] or [b]CC[r] (any thing) scans it.";
	if lurking lump is not off-stage, say "[2da]You can [jjj] to use the Lurking Lump spoiler item[if lurking lump is moot] once you get it back[end if].";
	if core-score > 1, say "[2da]You can also see a list of [b]SOUND(S)[r] if you want to brute-force things.";
	say "Finally, [2da]OPTS lists various options to toggle. The default settings are to make the game less difficult or add narrative depth, but if you want, you can switch them.";
	check-reversible-rooms;
	the rule succeeds.

to say jjj: say "[b]JJ[r] or [r]JERKING JUMP[r]"

chapter optsing

optsing is an action applying to nothing.

understand the command "opts" as something new.

understand "opts" as optsing.

carry out optsing:
	say "[2da][b]HELP HOW[r] and [b]WELP WOW[r] toggle the [b]HINT[r] command on and off, respectively. Currently they are [on-off of help-how].";
	if vined vault is not visited:
		say "The Leet Learner has options to toggle, but it would spoil things to list them now.";
	else:
		say "[2da][llon-cmd] turn the Leet Learner on while [lloff-cmd] turn it off. Currently it is [off-on of shut-scan]. You can also use it to see or hide if you're half-right with [b]HA HALF[r]/[b]NAH NAFF[r]. [b]TWO TOO[r] and [b]DO DUE/DUE DO[r] set homonym detection on and off.";
	if player has Toe Tappin, say "[2da]You can also [b]SAVE SONG[r] or [b]RAVE WRONG[r] to toggle hints whether [Toe] could help you, or [b]LL TOE[r] for further hints. Help on when to use [Toe] is currently [on-off of sing-clue].";
	if core-score >= 1, say "[2da]Y[narr-toggle]. Extra point-scoring narrative is currently [on-off of narr-on].";
	the rule succeeds.

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
	say "[line break]Thanks to GitHub for hosting private repositories that helped keep VVFF hidden and let me organize it fully. I'm also a fan of BitBucket, but GitHub's daily commit tracker helps so much with big and small goals.";
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
	say "[line break]Release 1 was at the end of September 2019.";
	say "Release 2 was November 22, 2019. It featured bug fixes, LLPs, and general player conveniences.";
	say "Release 3 was December 12, 2019. It featured code speedup, a small narrative based on point scores, and checking for homonyms, along with other small improvements.";
	say "[line break]And finally, if you enjoyed VVFF, Quite Queer Night Near is on itch.io at https://andrewschultz.itch.io/quite-queer-night-near. VVFF is at https://andrewschultz.itch.io/very-vile-fairy-file.";
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

the leet learner is a thing. description is "It says [b]LEET LEARNER/CHEAT CHURNER[r]. You can probably [b]READ[r] it more in depth, because, well, there's more.[paragraph break]It has two main settings: [b]HUT! CAN![r] (on) and [b]SHUT SCAN[r] (off). It's currently [off-on of shut-scan]. [ll]/[b]CC ON[r]/[b]OFF[r] can turn it on or off.[paragraph break]Also, to use it, [ll] (something). [ll] with no argument scans the current location.[paragraph break]It also has a toggle between [b]HA HALF[r] (on) and [b]NAH NAFF[r] (off) to note when you are half right. It's currently [on-off of ha-half]. There's another toggle between [b]TWO TOO[r] (on) and [b]DO DUE[r] (off)[if core-score > 1] for homonym detection[end if]."

the needle is part of the leet learner. it is boring. description is "The needle will move (or not) whenever you SCAN something.". bore-text of needle is "You can't really operate the needle, and you don't need to.".

understand "cheat/churner" and "cheat churner" as leet learner.

after printing the name of leet learner while taking inventory: say " ([off-on of shut-scan])";

understand "ll" and "cc" as leet learner.

to say will-wont of (ts - a truth state):
	say "[if ts is true]will[else]won't[end if]"

ll-flip-warn is a truth state that varies.

this is the wait-after-intro rule:
	if player is in wet wood, say "I want to make sure you have some basic familiarity with the game mechanic before fiddling with Leet Learner options. So I'm going to make you wait [if player is in wet wood]a couple rooms[else]until you get to the next room[end if]." instead;
	if fun fen is not visited and ll-flip-warn is false:
		now ll-flip-warn is true;
		say "It's recommended you wait until finishing the introduction before shutting off the Leet Learner. Do you still wish to toggle a feature?";
		if the player yes-consents, continue the action;
		say "OK. This nag won't appear again.";

chapter two too functionality

two-too is a truth state that varies.

section twotooing

twotooing is an action applying to nothing.

understand the command "two too" as something new.

understand "two too" as twotooing.

carry out twotooing:
	say "[if two-too is true]Homonym detection is already set[else]You set homonym detection[end if] to on.";
	now two-too is true;
	the rule succeeds.

chapter dueing

dueing is an action applying to nothing.

understand the command "do due" as something new.
understand the command "due do" as something new.

understand "due do" as dueing.
understand "do due" as dueing.

carry out dueing:
	abide by the wait-after-intro rule;
	say "[if two-too is false]Homonym detection is already set[else]You set homonym detection[end if] to off.";
	now two-too is false;
	the rule succeeds.

chapter ha half functionality

section ha half button

ha-half is a truth state that varies.

the ha half nah naff button is part of the leet learner. description is "It is set [on-off of ha-half], meaning if you get a guess half-right, the Leet Learner [will-wont of ha-half] alert you."

section halfing

halfing is an action applying to nothing.

understand the command "ha half" as something new.

understand "ha half" as halfing.
understand "half" as halfing.
understand "hh" as halfing.

carry out halfing:
	say "[if ha-half is true]The Leet Learner is already set[else]You set the Leet Learner[end if] to Ha Half.";
	now ha-half is true;
	the rule succeeds.

section nahnaffing

nahnaffing is an action applying to nothing.

understand the command "nah naff" as something new.

understand "nah naff" as nahnaffing.
understand "naff" as nahnaffing.
understand "nn" as nahnaffing.

carry out nahnaffing:
	abide by the wait-after-intro rule;
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
	if th is Toe and Jake G is touchable and sco-fake-fee is true and sco-co-capn is false:
		say "[scancol of partminus]";
	else:
		say "[scancol of cht of th]"

carry out lling:
	if player does not have the leet learner, say "Regular hints aren't available." instead; [this should not happen]
	if noun is leet learner, say "The leet learner is great as it is. You don't want to change it." instead;
	if shut-scan is true, say "You turned the Leet Learner off, so nothing shows up." instead;
	if noun is Here Hull:
		say "Only the Beer Bull picks anything up.";
		try lling Beer Bull instead;
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
	if noun is We Whine and sco-see-sign is false, say "[line break]Well, it's alternately in the center and waving around, actually.";

ever-leet-clue is a truth state that varies.

to say leetclue of (x - a cheattype) and (isopt - a truth state):
	if shut-scan is true, continue the action;
	say "[line break]As you say/think this, the Leet Learner[if isopt is true] dims a bit, and the[end if] needle [scancol of x]";
	if Fun Fen is visited and ever-leet-clue is true, continue the action;
	now ever-leet-clue is true;
	if leetcool is 0:
		say ". Once you do something that makes progress, you may wish to remember how the words you saw or read combined with the Leet Learner reading";
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
	abide by the wait-after-intro rule;
	say "[if shut-scan is true]The Leet Learner is already[else]You turn the Leet Learner[end if] off. You can turn it on with [llon-cmd].";
	now shut-scan is true;
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
	say "[if shut-scan is false]The Leet Learner is already[else]You turn the Leet Learner[end if] on. You can turn it on with [llon-cmd].";
	now shut-scan is false;
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
		if player does not have snuck snare, say "You don't have what you need to neutralize the Beer Bull yet[sorry-bull]." instead;
		if dives ditch is unvisited, say "You haven't found the place to take the Beer Bull too, yet. Sorry. But you can try as often as you need[sorry-bull].";
		if snuck snare is not moot, say "[one of]You won't have time to place the snuck snare AND sucker the Bull Beast this chase, but you will be able to place the snare. HINT again to see where to put the snare[or]You will automatically put the snare in [dives ditch] once you get there[if sco-knives-niche is false], though you need to change the name, first[end if][stopping]." instead;
		say "You need to lure the Beer Bull to [dives ditch] now you've placed the snare." instead;
	process room-hint-rule of location of player;
	if the rule failed, say "There doesn't seem to be anything more to do with [location of player] in general, but you can still hint specific things in [location of player] with HINT (object).";
	the rule succeeds.

section auxiliary functions

to decide which number is buggin-score:
	decide on (boolval of sco-mean-muggin) + (boolval of sco-lean-luggin);

to decide whether should-mug-first:
	if sco-mean-muggin is true, no;
	if mugged-first is true, yes;
	no;

section hint room rule definitions

a room has a rule called room-hint-rule. room-hint-rule of a room is usually trivially false rule. [postalf]

room-hint-rule of Airy Isle is airy-isle-hint rule.
room-hint-rule of Been Buggin is been-buggin-hint rule.
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
room-hint-rule of Po Pit is po-pit-hint rule.
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
		say "[one of]You need to look a bit tougher, since you've Been Buggin['][or]You need to change your facial expression[or]Change your facial expression with [b]MEAN MUGGIN[r][stopping].";
	else:
		say "[one of]You need to be able to carry more weight.[or]You need to be stronger and, not quite thinner, but ...[or]...leaner.[or]LEAN LUGGIN.[stopping]";
	the rule succeeds;

this is the blinding-blaze-hint rule:
	if sco-winding-ways is true, the rule fails;
	say "[one of]The Blinding Blaze can become more navigable[or]Something more solid, yet still annoying[or]It can become WINDING WAYS. There are actually three acceptable answers here[or]WINDING WAYS, MINDING MAZE or FINDING PHASE[stopping].";
	the rule succeeds;

this is the creased-cross-hint rule:
	if Bull Beast is moot, the rule fails;
	if Bull Beast is off-stage:
		say "There's not much to do now in Creased Cross.";
	else:
		say "Dispose of the Bull Beast.";
	the rule succeeds.

this is the curst-cave-hint rule:
	if sco-first-fave is true, the rule fails;
	say "[one of]You need to show optimism.[or]FIRST FAVE.[stopping]";
	the rule succeeds.

this is the dives-ditch-hint rule:
	if sco-knives-niche is true, the rule fails;
	say "[one of]Set up a subtler trap.[or]KNIVES NICHE.[stopping]";

this is the fight-funnel-hint rule:
	if sco-tight-tunnel is true, the rule fails;
	say "[one of]You need to get rid of the fighters[or]Maybe make it more awkward to fight[or]TIGHT TUNNEL[stopping].";

this is the foe-field-so-sealed-hint rule:
	if sco-show-shield is true, the rule fails;
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
	if Beer Bull is moot, the rule fails;
	say "You need to dispose of the Beer Bull, here. There are hints for it, if you need them.";

this is the history-hall-hint rule:
	if mean moe's is moot and Gutta Ganksta is moot and poor ponder is moot, the rule fails;
	if sco-mystery-mall is true:
		say "You can pretty much twiddle the Mystery Mall and History Hall as you want. There are plenty of things to hint in each of them.";
	else:
		say "[one of]The History Hall can become something a bit less profound.[or]A place of commerce, not of study.[or]MYSTERY MALL.[stopping]";

this is the lake-lap-hint rule:
	say "Later..."; [??]
	the rule succeeds;

this is the lake-lea-hint rule:
	the rule fails.

this is the pit-pound-hint rule:
	if hit hound is in Pit Pound:
		say "The hit hound has your full attention here.";
		try hintobjing hit hound instead;
	say "[one of]The Pit Pound still leaves you uncomfortable[or]Like you don't belong here[or]FIT FOUND[stopping]."

this is the po-pit-hint rule:
	if sco-grow-grit is false:
		say "[one of]You have to deal with the Po['] Pit itself before dealing with the trash trap. You can find the right verb for the trash trap, but you can't use it until you deal with the Po['] Pit.[or]The learner needle swinging left indicates you need two longer words.[or]The learner needle going center-left indicates that either row or writ is the right number of letters.[or]You need to get a lot tougher. Become a bigger person.[or]GROW GRIT.[stopping]";
	else:
		say "[one of]The trash trap has a way through...sort of.[or]The row writ has been drawn on so that there is no way through. Even though you've grown grit, you can't see a way through it.[or]The gash gap is treacherous, and the cache cap is stupid, but they both keep the learner needle in the center.[or]Looking at the cache cap, it's got a rendering of the trap and gap. Which seems all wrong.[or]MASH MAP.[stopping]"; [??bash bap]

this is the real-rear-hint rule:
	if sco-heal-here is true, the rule fails;
	say "You need to do 3 things here rhyming with REAL REAR.";
	if sco-kneel-near is false:
		say "SPOILER need to KNEEL NEAR.";
	else if sco-felt-fear is false:
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
	if sco-loft-land is false:
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
		say "You can do something with this location [once-now of vc-merry-mile rule] the well worn hell horn is dealt with.";
	else if sco-merry-mile is false:
		say "[one of]The Tarry Tile can become cheerier.[or]It's a rather long tile, and it can become...[or]...a MERRY MILE.[stopping]";
	else:
		consider the very-vile-fairy-file-hint rule;
	the rule fails.

this is the trim-tram-hint rule:
	if sco-mind-me is true:
		say "[one of]You need to find a way to sucker the Trim Tram into thinking you paid.[or]There are two ways.[or]FLIM FLAM, or SKIM SCAM.[stopping]";
	else:
		say "[one of]You can't get FIND FEE out of your head. It distracts you from thinking of you.[or]Wait, 'you' is the wrong pronoun from your perspective.[or]What can you do to ME?[or]MIND ME.[stopping]";

this is the vending-vibe-hint rule:
	if Trending Tribe is moot, the rule fails;
	say "You can deal with the Trending Tribe here.";
	process the trending-tribe-hint rule;

this is the vined-vault-hint rule:
	if mean mass is off-stage:
		say "[one of]You need to deal with the Vined Vault. Another room, another rhyme[or]In this case, it isn't a quick letter replacement. You may wish to consult the leet learner. It's pointing center-right, which is different from the center of the Wet Wood and Rift River[or]You also need to discover some weakness in the Vined Vault[or]Again, you can go through the 25 other letters, and this time, there will be a homonym that makes sense[or]You need to FIND FAULT[stopping].";
	else:
		say "[one of]The mean mass is a bit trickier. The leet learner swings to the left[or]If you've been observant, you may notice VINED VAULT and MIND MALT swung center-right and center-left, respectively, for FIND FAULT. This may help you guess what swinging left could mean[or]Try and think of a word or two that rhyme with mean or mass that are harmless, then pull that new beginning sound to the other word[or]GREEN GRASS will dispose of the mean mass[stopping].";
	the rule succeeds;

this is the violent-vale-hint rule:
	if boring boat is moot:
		say "You've done all you need to here.";
		the rule fails;
	if float is off-stage:
		say "[one of]You need to make the Violent Vale less violent[or]Quieter, perhaps[or]SILENT SAIL (or SALE)[stopping].";
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
	if sco-shining-shore is true, the rule fails;
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

the thing-hint-rule of Beer Bull is beer-bull-hint rule.
the thing-hint-rule of Bold Bard is bold-bard-hint rule.
the thing-hint-rule of Bot Board is bot-board-hint rule.
the thing-hint-rule of Bull Beast is the bull-beast-hint rule.
the thing-hint-rule of Cark Cliff is cark-cliff-hint rule.
the thing-hint-rule of Dean Duggan is dean-duggan-hint rule.
the thing-hint-rule of FIND FEE is find-fee-hint rule.
the thing-hint-rule of Fussed Folks Just Jokes is fussed-folks-just-jokes-hint rule.
the thing-hint-rule of GOTS GAME is gots-game-hint rule.
the thing-hint-rule of Gutta Ganksta is gutta-ganksta-hint rule.
the thing-hint-rule of Here Hip Queer Quip is the here-hip-queer-quip-hint rule.
the thing-hint-rule of Hot Horde is bot-board-hint rule.
the thing-hint-rule of Jake G is the jake-g-hint rule.
the thing-hint-rule of Kerry Kyle is kerry-kyle-hint rule.
the thing-hint-rule of Lending Libe is lending-libe-hint rule.
the thing-hint-rule of Lot Lord is bot-board-hint rule.
the thing-hint-rule of Mean Moe's Clean Clothes is the mean-moes-clean-clothes-hint rule.
the thing-hint-rule of Minding Maze is minding-maze-hint rule.
the thing-hint-rule of Oi Mo by Tim T Sims Pimp is oi-mo-hint rule.
the thing-hint-rule of Pain Peasant is pain-peasant-hint rule.
the thing-hint-rule of Reeker Russell is reeker-russell-hint rule.
the thing-hint-rule of Sage Sea is sage-sea-hint rule.
the thing-hint-rule of Shoaled Shard is the shoaled-shard-hint rule.
the thing-hint-rule of Toe Tappin Row Rappin is toe-tappin-row-rappin-hint rule.
the thing-hint-rule of Too Totes New Notes is the too-totes-new-notes-hint rule.
the thing-hint-rule of Trending Tribe is trending-tribe-hint rule.
the thing-hint-rule of Very Vile Fairy File is very-vile-fairy-file-hint rule.
the thing-hint-rule of We Whine ME MINE is the we-whine-me-mine-hint rule.
the thing-hint-rule of Weird Way is the weird-way-hint rule.
the thing-hint-rule of backed binder is backed-binder-hint rule.
the thing-hint-rule of big bag is big-bag-hint rule.
the thing-hint-rule of boring boat is the boring-boat-hint rule.
the thing-hint-rule of cache cap is cache-cap-hint rule.
the thing-hint-rule of cage key is cage-key-hint rule.
the thing-hint-rule of cake cap is all-caps-hint rule.
the thing-hint-rule of ceiling seer is ceiling-seer-hint rule.
the thing-hint-rule of clashing cloak is the clashing-cloak-hint rule.
the thing-hint-rule of clumped cluster is the clumped-cluster-hint rule.
the thing-hint-rule of cold card is the cold-card-hint rule.
the thing-hint-rule of cool cap is all-caps-hint rule.
the thing-hint-rule of coral cage is coral-cage-hint rule.
the thing-hint-rule of dark door is the dark-door-hint rule.
the thing-hint-rule of dining door is dining-door-hint rule.
the thing-hint-rule of done den is done-den-hint rule.
the thing-hint-rule of flooring float is the flooring-float-hint rule.
the thing-hint-rule of frightening fridge is frightening-fridge-hint rule.
the thing-hint-rule of full feast is the full-feast-hint rule.
the thing-hint-rule of gash gap is cache-cap-hint rule.
the thing-hint-rule of go gate is go-gate-hint rule.
the thing-hint-rule of gold guard is gold-guard-hint rule.
the thing-hint-rule of good gun is good-gun-hint rule.
the thing-hint-rule of grow grate is grow-grate-hint rule.
the thing-hint-rule of ha half nah naff is ha-half-nah-naff-hint rule.
the thing-hint-rule of hard hat is all-caps-hint rule.
the thing-hint-rule of hit hound is hit-hound-hint rule.
the thing-hint-rule of hive heap is hive-heap-hint rule.
the thing-hint-rule of jerk gel is jerk-gel-hint rule.
the thing-hint-rule of leet learner is leet-learner-hint rule.
the thing-hint-rule of listless mist mess is the listless-mist-mess-hint rule.
the thing-hint-rule of lurking lump is lurking-lump-hint rule.
the thing-hint-rule of marred mat is marred-mat-hint rule.
the thing-hint-rule of mean mass is mean-mass-hint rule.
the thing-hint-rule of mild mead is mild-mead-hint rule.
the thing-hint-rule of mind malt is mind-malt-hint rule.
the thing-hint-rule of needle is leet-learner-hint rule.
the thing-hint-rule of paper pile is paper-pile-hint rule.
the thing-hint-rule of peeling pier is peeling-pier-hint rule.
the thing-hint-rule of pining poor is dining-door-hint rule. [pining poor and dining door both map to mining more]
the thing-hint-rule of poor ponder for fonder is poor-ponder-for-fonder rule.
the thing-hint-rule of prong part is prong-part-hint rule.
the thing-hint-rule of row writ is row-writ-hint rule.
the thing-hint-rule of screaming skull is screaming-skull-hint rule.
the thing-hint-rule of shy shawl is the shy-shawl-hint rule.
the thing-hint-rule of snuck snare is the snuck-snare-hint rule.
the thing-hint-rule of sought sword is sought-sword-hint rule.
the thing-hint-rule of steel steer is steel-steer-hint rule.
the thing-hint-rule of stuck stair is the stuck-stair-hint rule.
the thing-hint-rule of tall tree is tall-tree-hint rule.
the thing-hint-rule of tool tap is tool-tap-hint rule.
the thing-hint-rule of trash trap is cache-cap-hint rule.
the thing-hint-rule of vapor vial is vapor-vial-hint rule.
the thing-hint-rule of way woke clay cloak is the way-woke-clay-cloak-hint rule.
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
	say "You don't need to do anything with [the x]. It [if Airy Isle is visited]got you to the final area[else if Gassed Gap is visited]will get you past the gap[else]will help automatically unlock a passage later[end if]."

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
	if sco-near-null is false:
		say "[one of]The Beer Bull is too powerful in its present form! You have to lessen its power a bit. A pretty simple rhyme will work[or]NEAR NULL[stopping]." instead;
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
	if sco-no-nappin is true, say "You can just board the boat.";
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
	if need-loss:
		if tried-yet of vc-least-loss rule, say "Now is the time to go in for LEAST LOSS." instead;
		say "[one of]The Beast Boss/Bull Beast is going to hurt you, no question. But you want to minimize the damage[or]LEAST LOSS[stopping]." instead;
	if tried-yet of vc-cull-ceased rule, say "You already tried to say CULL CEASED. Now, it will work!" instead; [?? what if LUL LEAST??]
	say "[one of]You need to say or do something that will put the Bull Beast down[or]There are two ways to nail the Bull Beast[or][one of]CULL CEASED tells the Bull Beast its rampaging days are over[or]LUL LEAST is a put-down that leaves the beast in shame[stopping][stopping].";

this is the cache-cap-hint rule:
	say "[one of]As you may have guessed, the cache cap, trash trap and gash gap are linked. One of them gives clues about the other two[or][if sco-grow-grit is false]You need to deal with the row writ and Po['] Pit, first[else][one of]The cache cap seems to offer a way through the trash trap or gash gap, but not really[or]You need to find a way to put the cache cap out of its misery[or]BASH BAP or MASH MAP both work to get out of Po['] Pit for good[stopping][end if][stopping].";
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
	if tried-yet of vc-smashing-smoke rule:
		say "You know what to do with the cloak, but the question is, where?";
		if poor ponder is not moot:
			say "You haven't unlocked the room, yet. You need to look at [poor ponder] [here-in of History Hall].";
		else if Y'Old Yard is unvisited:
			say "You haven't visited beyond [poor ponder].";
		else:
			say "Using the cloak in Y'Old Yard will help the Bold Bard.";
		the rule succeeds;
	say "[one of]The clashing cloak can transform into another sort of distraction[or]SMASHING SMOKE[stopping].";
	if poor ponder is not moot, say "You can't use the clashing cloak yet."

this is the clumped-cluster-hint rule:
	say "[one of]The clumped cluster can be moved two ways. Either is equivalent[or]You can use an order to move the cluster or find an item[or][one of]BUMPED BUSTER is one way[or]DUMPED DUSTER is one way[cycling] to clear the clumped cluster[stopping].";

this is the cold-card-hint rule:
	say "You need to bring the cold card somewhere as a voucher[one of]. Hint again to see where[or]. [if the room east of Vending Vibe is nowhere]You will need to change Mystery Mall back, first[else if Vending Vibe is unvisited]You need to visit west of Mystery Mall[else if Trending Tribe is moot]The Lending Libe[else]The Vending Vibe, but first you must deal with the Trending Tribe[end if][stopping]."

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
	if tried-yet of vc-pull-pieced rule:
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
	say "[one of]This is a tricky one. The Gutta Ganksta's tattoo is/was more important.[or]Calling the Gutta Ganksta a name gets you an optional point, but it's only esoteric name calling.[or]WHATTA (or WHAT A) WANKSTA.[stopping]";

this is the ha-half-nah-naff-hint rule:
	say "HA HALF will tell you if one of your words is right. NAH NAFF hides that.";

this is the here-hip-queer-quip-hint rule:
	say "[part-ev of queer quip]."

this is the hit-hound-hint rule:
	say "[one of]The hit hound can smell fear. You can't really run or lash out at it.[or]You need to stand your ground or, figuratively...[or]You can SIT SOUND.[stopping]"

this is the hive-heap-hint rule:
	say "[one of]The hive heap has nothing on the surface, but maybe if you dig in...[or]Look way down into the hive heap...[or]DIVE DEEP.[stopping]"

this is the jake-g-hint rule:
	if sco-wake-whee is false, say "[one of]Jake needs to be roused from his sleep gently and cheerily[or]Maybe you can rouse him with enthusiasm[or]WAKE WHEE[stopping]." instead;
	if sco-take-tea is false, say "[one of]Time to eat and drink with Jake[or]A standard Inform verb does nicely here[or]TAKE TEA[stopping]." instead;
	if sco-fake-fee is false, say "[one of]Jake wants payment, but not really[or]You've sort of done this back at the Trim Tram, but it's a bit different[or]FAKE FEE[stopping]." instead;
	if sco-co-capn is false, say "[one of]Jake wants to feel like an equal[or]You may or may not hear [Toe Tappin] again[or]A riff on [Toe Tappin] will make Jake happy[or]You can say CO CAPN[stopping]." instead;
	if sco-make-map is false, say "[one of]You and Jake G are lost. You're in Lake Lap, so you may do things a bit differently[or]I'm pretty sure you know an item that helps you not get lost[or]MAKE MAP[stopping]." instead;
	if sco-snake-snap is false, say "[one of]Now you and Jake must deal with that hissing noise[or]I think you know what sort of animal makes a hissing noise[or]SNAKE SNAP[stopping]" instead;
	say "Oops. It's a bug you got this far, but it's not a fatal one."

this is the jerk-gel-hint rule:
	if player does not have jerk gel:
		say "[one of]There's something hidden in the Shirk Shell, if you just expend the energy.[or]The Jerk Gel is there, but you can't just take it.[or]You won't find the Jerk Gel if you're lazy.[or]WORK WELL.[stopping]";
	else:
		say "You need to find whom to use the jerk gel on.";

this is the kerry-kyle-hint rule:
	if in-so-sad:
		say "[one of]You need to make yourself happier, from being so sad.[or]Become shiny and happy.[or]GLOW GLAD.[stopping]";
	else if in-way-wrong:
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
	say "[one of]You need to think outside the box, or the maze, for the Minding Maze.[or]If you have Toe Tappin in your head, well, you may have a clue you need to use it.[or]What do you need to do to get through a maze?[or]You need to MAP it. A lot.[or]You can only map a bit if you just use your head.[or]MO MAPPIN will make mapping the maze go faster.[stopping]";

this is the oi-mo-hint rule:
	say "[one of]Oi Mo['] is a bad song, but there may be a way to tune it out.[or]This is a bit tricky, because it relies on something different than the usual mechanic. That's why it's an optional point.[or]Everything is in the XimX format.[or]DIMD will turn the volume down.[stopping]"

this is the pain-peasant-hint rule:
	say "[one of]There needs to be a way to calm the peasant down and make it nicer.[or]PLAIN PLEASANT.[stopping]"

this is the paper-pile-hint rule:
	say "[one of]It's not what the paper pile is, but that it's a rather messy FACT FINDER. You need to organize it.[or]You can organize the paper pile/fact finder into a BACKED BINDER.[stopping]"

this is the peeling-pier-hint rule:
	if sco-heal-here is true, the rule fails;
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
	if sco-grow-grit is true, the rule fails;
	say "[one of]The row writ and Po['] Pit may have you stumped.[or]The leet learner on both will give you a clue of the number of letters.[or]You need to toughen up.[or]GROW GRIT.[stopping]"

this is the sage-sea-hint rule:
	say "You don't need to do anything specifically with the Sage Sea. It just blocks you from elsewhere, [if cage key is off-stage]but it holds something you need, if you deal with Real Rear correctly[else]and you already got the cage key from it[end if].";
	the rule succeeds;

this is the screaming-skull-hint rule: say "[one of]If there only were a way to make the screaming skull less imposing![or]Maybe there is a way the skull can make less noise as well.[or]DREAMING DULL.[stopping]"

this is the shoaled-shard-hint rule:
	say "The Shoaled Shard is just the place the Bold Bard need[if Bold Bard is moot]s[else]ed[end if] to get to. It's irrelevant on its own."

this is the shy-shawl-hint rule:
	say "[one of]The shy shawl isn't necessary, but it allows a lot of good guesses that may give you a spoiler [if lump is not off-stage]with the lump[else]item[end if] later[or]The shawl looks silly and stupid and wrong. There's a right way to make light of this, spoiled if you HINT again[or]LIE LOL[stopping]."

this is the snuck-snare-hint rule:
	if ssh-yet is false:
		now ssh-yet is true;
		say "You need to find the right place to drop the snuck snare. You'll do so automatically." instead;
	if weird way is not moot, say "You can get past the Weird Way." instead;
	if fight funnel is not visited, say "Go down in Stark Store." instead;
	if sco-tight-tunnel is false, say "You can get past the Fight Funnel." instead;
	if Dives Ditch is unvisited, say "Go west in Fight Funnel." instead;
	if sco-knives-niche is false, say "You should see about changing Dives Ditch." instead;
	say "You will need to place the snare in [Dives Ditch] before leading someone on a chase. Then, run back there to spring the trap.";

this is the sought-sword-hint rule:
	say "[one of]The sought sword belongs to someone. It just looks important[or]Who might the owner be? Someone with a noble title[or]Call the LOT LORD[stopping].";

this is the steel-steer-hint rule:
	if sco-heal-here is true, the rule fails;
	say "The steel steer is just here to bring home that there's a lot to do in the Real Rear.";
	process the real-rear-hint rule;

this is the stuck-stair-hint rule:
	say "[one of]The stuck stair holds a place as well as an item. Guessing either one works, but the place has fewer letters[or]The stair may lead to good fortune[or]Or luck[or][one of]The place is LUCK LAIR[or]The item is a SNUCK SNARE[cycling][stopping]."

this is the tall-tree-hint rule:
	if sco-fall-free is true, the rule fails;
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
	say "[one of]The Trending Tribe seems very focused on money.[or]What is something that would be free that might disappoint the Trending Tribe?[or]LENDING LIBE.[stopping]"

this is the vapor-vial-hint rule:
	say "[one of]It would be nice if the vapor vial became something more useful or at least less toxic.[or]It can become a PAPER PILE.[stopping]"

this is the very-vile-fairy-file-hint rule:
	if sco-merry-mile is false:
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

understand "go to [any visited room]" as gotoing.
understand "goto [any visited room]" as gotoing.
understand "gt [any visited room]" as gotoing.
understand "gr [any visited room]" as gotoing.
understand "go [any visited room]" as gotoing.

does the player mean gotoing a room:
	if noun is visited, it is very likely;
	if noun is available-from-here, it is likely;

to decide whether goto-available:
	yes.

definition: a room (called rm) is available-from-here:
	if rm is location of player, yes;
	if rm is unvisited, no;
	let mrrm be map region of rm;
	if player is in Tarry Tile, no;
	if rm is Here Hull and Beer Bull is moot, no;
	if mrrm is Worst Whew, no;
	if mrrm is Browsy Breaks, no;
	if rm is Shirk Shell and jerk gel is not in Shirk Shell, no;
	yes;

does the player mean gotoing location of player: it is unlikely.

to decide which room is fliproom of (rm - a room):
	if in-mystery-mall is true:
		if rm is Y'Old Yard or rm is Vending Vibe, decide on History Hall;
	else:
		if rm is Got Gear Hot Here, decide on History Hall;
	if in-loft-land is true:
		if rm is Shirk Shell, decide on Soft Sand;
	else:
		if rm is Curst Cave, decide on Soft Sand;
	decide on Fun Fen;

this is the flag bad goto from rule:
	let rm be location of player;
	if noun is rm, say "Already there! Er, here." instead;
	if player is in Airy Isle, say "There's no way back. You are so close to the end." instead;
	if player is in Tarry Tile, say "You cannot flee from your fears and your destiny. You are at the final confrontation. Besides, the Very Vile Fairy File would emit a huge, mean laugh." instead;
	if noun is in Worst Whew, say "You don't need to go back[if mrlp is not Worst Whew]. The introductory bit is over[end if]." instead; [okay, maybe this should be in the other rule if we go by names. But it's a big case we want to have up front.]
	if in-bull-chase is true, say "[chase-pass]Sorry, GO TO is disabled during the Beer Bull chase." instead;
	if player is in Creased Cross and Bull Beast is in Creased Cross, say "You could run off, but you need to deal with the Bull Beast. You can deal with the Bull Beast." instead;
	if player is in Been Buggin, say "[if dean duggan is off-stage]You're too bummed to make big trips.[else if dean duggan is in been buggin]Don't ditch Dean! He has valuable training. You can brute-force your way through it, if need be[else]Sorry, but GO TO is disabled until you take the boring boat back. You can just ENTER it now[end if]." instead;
	if mrlp is Browsy Breaks, say "Sorry, but GO TO is disabled here in the lakes." instead;
	if need-healing, say "You can't zoom around in your weakened state. The Bull Beast will push you back. But with so few places to go, maybe what you need is close by." instead;

this is the flag bad goto to rule:
	if noun is shirk shell and jerk gel is not in shirk shell, say "You got the jerk gel already." instead;
	if noun is here hull and Beer Bull is moot, say "You don't need to go back to Here Hull." instead;
	if noun is Been Buggin, say "You don't need or want to revisit that." instead;
	if noun is Lake Lea or noun is Lake Lap:
		if sco-snake-snap is true, say "You already did that." instead;
		say "You'll need to take the boring boat [here-in of Violent Vale] to get back there." instead;

to decide whether need-to-flip of (rm - a room):
	if rm is Vending Vibe or rm is Y'Old Yard:
		if in-mystery-mall is true, yes;
	if rm is Got Gear Hot Here and in-mystery-mall is false, yes;
	if rm is Curst Cave and in-loft-land is false, yes;
	if rm is Shirk Shell and in-loft-land is true, yes;
	no;

carry out gotoing:
	abide by the flag bad goto from rule;
	abide by the flag bad goto to rule;
	if noun is available-from-here:
		let N be fliproom of noun;
		if N is not Fun Fen, say "[line break][name-twiddle of N].";
		move player to noun;
	else:
		say "You can't walk to [noun] from here.";
	the rule succeeds;

to say name-twiddle of (rm - a room):
	say "You flip [rm] back to ";
	twiddle-my-room rm;
	say "[rm] as you go";

to twiddle-my-room (rm - a room):
	if rm is History Hall, now in-mystery-mall is whether or not in-mystery-mall is false;
	if rm is Soft Sand, now in-loft-land is whether or not in-loft-land is false;

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
	if player is in Fun Fen and di is north and sco-fall-free is false, yes;
	no;

volume when play begins

when play begins (this is the backdrop and score seeding rule):
	seed-score-list; [this is in the table file]
	seed-narratives; [so is this]
	wall-refresh;

when play begins (this is the randomize all the things rule):
	if a random chance of 1 in 2 succeeds, now mugged-first is true;
	repeat through table of all randoms:
		sort tabnam entry in random order;

when play begins (this is the opening text rule):
	now ha-half is true;
	now two-too is true;
	now the left hand status line is "West Wall";
	force-status;
	process the check-skip-intro rule;
	let skip-stuff be whether or not the rule succeeded;
	if debug-state is false, ask-screenread;
	if skip-stuff is true, continue the action;
	say "[paragraph break]You wouldn't have gone to Fall Fest if you hadn't gotten a free ticket. But of course, the ticket was the only thing that was free. Inside, super high food prices. Lots of noise. And, well, the sun always seeming to get in your eyes. But you still feel you might as well see everything.[paragraph break]And you do. Then off on the west edge, there's a wall. A wall west, if you will. 'Oh, man,' you think. 'Why did I bother?' Well, at least you didn't waste all afternoon watching football games you didn't care about. But you're still mumbling to yourself about how there must be something, anything interesting here. Then you feel a tap on your shoulder.[paragraph break][wfak]";
	say "'Hey! Don't head to the Sit-So Inn! Get Goin[']! I can help. I'm Kit Cohen.' You're just not in the mood for motivational nonsense right now, so you brush Kit off. Or try to.[wfak]";
	say "[line break]'No! Seriously! You managed to bawl best--well, the best of anyone I've seen today--so you get a chance at a tall test!'[paragraph break]'What sort of test?'[paragraph break]'The PALL PEST of CRAWL CREST!'[wfak]";
	say "[line break]And it's a big one. You look to Kit for help, but Kit shrugs.[wfak]";
	say "[line break]It approaches. It's about to touch you ...and reflexively you boom, 'GALL, guest!'[paragraph break]The pall pest stumbles back into the west wall, which crumbles. Kit Cohen applauds. 'Well done! You did it! I think you are the one ... the one to recover the Very Vile Fairy File from ... from ...'[wfak]";
	say "[line break]It takes a second for Kit Cohen to regain composure. 'The CRIMES CREW TIMES TWO.' Are you ready?[wfak]";
	say "[line break]You accept. You might as well. Kit guides you across the remains of the wall, before going off to the Set-So Inn with Rhett Rowan. You are left in ...";

when play begins (this is the score and status tweak rule):
	now the maximum score is min-needed + max-bonus;
	now max-poss is the maximum score;
	now the right hand status line is "[score][if doable-hinted > 0](+[doable-hinted])[end if]/[min-needed][if score is min-needed][else if min-needed is max-poss]*[else]-[max-poss][end if]";
	force-status;
	now the left hand status line is "[location of the player] ([mrlp])";
	now the turn count is 0;

to wall-refresh: move the wry wall backdrop to all wallish rooms;

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

check saving the game for the first time: say "[pest-sneer] 'Some save? Dumb, Dave!' That must be the Very Vile Fairy File, trying to get in your head. And it almost works. For a moment you wonder if someone named Dave should be on this quest instead, but it passes.";

check quitting the game: say "You say to yourself, not fully convinced, 'Best bit? Quest quit!'";

volume Ending activities and tables

[a Capped Cone is a scenery.] [?? where? It leads to the Zapped Zone]

chapter final questions table

[this is a sort of fake region. There are fake rooms you can't visit.]

[a capped cone is a scenery.] [?? where? It leads to the Zapped Zone]

volume Ending activities and tables

Table of Final Question Options (continued)
final question wording	only if victorious	topic		final response rule		final response activity
"see the points you [b]MISSED[r]"	true	"missed"	--	showmissesing
"see other [b]DEATH TRAPS[r]"	true	"death/traps/trap" or "death traps/trap"	--	showdeathsing
"see [b]ALT[r]ernate point scoring verbs"	true	"alt/alternate"	--	showaltverbsing
"see the point-based [b]RANK[r]s"	true	"rank/ranks"	--	showranksing
"see lists of random text ([b]RAND 0[r] for list, [b]RAND 1-[number of rows in table of all randoms][r] for a specific table, [b]RN[r] for next table)"	true	"RAND [number]"	--	rling
"see [b]MISC[r]ellaneous [b]RHYME[r]s in response to verbs"	true	"misc/rhyme/rhymes"	--	amuselisting
--	true	"RN"	--	rlning
--	true	"RAND"	--	rl0ing
"see [b]NARR[r]atives for [narr-end-opts]"	true	"narr a/b/e/m/be/bm/em/eb/me/mb" or "narr"	--	narring

to say narr-end-opts: say "([b]B[r])eginning, ([b]M[r])iddle, ([b]E[r])nd, or some combination, or ([b]A[r])ll"

section narr checking

The modified respond to final question rule is listed instead of the standard respond to final question rule in for handling the final question.

This is the modified respond to final question rule:
	repeat through the Table of Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if the player's command matches the topic entry:
					if there is a final response rule entry, abide by final response rule entry;
					otherwise carry out the final response activity entry activity;
					rule succeeds;
	if the player's command includes "narr":
		say "Valid specifications for NARR are [narr-end-opts]. No argument lists all the narratives.";
		the rule succeeds;
	issue miscellaneous library message number 8.

chapter amuselisting

amuselisting is an activity.

rule for amuselisting:
	say "Have you tried:[paragraph break]";
	say "[2da]DRINKing the worst wave or Sage Sea?";
	say "[2da]TALKing to anyone, including the [fairy file]?";
	say "[2da]EATing the wild weed?";
	say "[2da]ATTACKING people, especially the Bot Board and [fairy file]?";
	say "[2da]Cussing around the [fairy file]?";
	say "[2da]Saying yes or no, waiting or giving an empty command, or sleeping?";

chapter narring

narring is an activity.

rule for narring:
	let see-beginning be false;
	let see-middle be false;
	let see-end be false;
	if number of words in the player's command is 1:
		now see-beginning is true;
		now see-middle is true;
		now see-end is true;
	else:
		let Q be indexed text;
		now Q is "[word number 2 in the player's command]";
		if Q matches the text "a":
			now see-beginning is true;
			now see-middle is true;
			now see-end is true;
		else:
			if Q matches the text "b":
				now see-beginning is true;
			if Q matches the text "e":
				now see-end is true;
			if Q matches the text "m":
				now see-middle is true;
	let see-all be false;
	if see-beginning is true and see-end is true and see-middle is true:
		now see-all is true;
	if see-beginning is false and see-end is false and see-middle is false:
		say "You need to choose [narr-end-opts].";
	else:
		if see-beginning is true:
			repeat through table of narratives:
				if rank-num entry > whew-score, break;
				say "[if see-all is true][relreg of rank-num entry] [end if][rank-num entry]. [rank-txt entry][line break]";
		if see-middle is true:
			if see-beginning is true, say "[wfak]";
			repeat through table of narratives:
				if rank-num entry <= whew-score, next;
				if rank-num entry > max-main, break;
				say "[if see-all is true][relreg of rank-num entry] [end if][rank-num entry]. [rank-txt entry][line break]";
		if see-end is true:
			if see-beginning is true or see-middle is true, say "[wfak]";
			repeat through table of narratives:
				if rank-num entry <= max-main, next;
				say "[if see-all is true][relreg of rank-num entry] [end if][rank-num entry]. [rank-txt entry][line break]";

section narrbading

narrbading is an activity.

rule for narrbading:
	say "You need to specify [narr-end-opts].";

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
		if debug-state is false and the remainder after dividing count by 20 is 0, wfak;
	choose row number understood in table of all randoms;
	if there is a cycle-note entry:
		say "Fixed last entry before looping: [cycle-note entry].[line break]";
	else:
		say "There is no fixed last entry before looping.";

chapter showranksing

showranksing is an activity.

rule for showranksing:
	let low-bound-score be 0;
	repeat through table of ranks:
		say "[rank-name entry] is [if rank-max entry > 0][low-bound-score] to [end if][rank-max entry] points.";
		now low-bound-score is rank-max entry + 1;
	say "[line break]Gold God is [core-max - 1] to [core-max] points. Yes, you get it before you get the last point, but if you UNDO, you'll see an (almost) to hedge things.";

chapter shownarring

shownarring is an activity

to say relreg of (x - a number):
	say "([if x <= whew-score]INTRO[else if x <= isle-min]MIDDLEGAME[else]ENDGAME[end if])";

rule for shownarring:
	repeat through table of narratives:
		say "[relreg of rank-num entry] [rank-num entry] narrative: [rank-txt entry][line break]";

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
	if sco-really-rolling is false, say "At any time, you could've guessed my pen name was a riff on [b]REALLY ROLLING[r].";
	if sco-start-strong is false, say "In the Fun Fen, you could've used the wrong art for a [b]STRONG START[r].";
	if sco-start-strong is false, say "After visiting the Fun Fen, you could've brushed off the [poke pest] with [b]BLOKE BLESSED[r], or [b]BLEST[r].";
	if sco-appealing-appear is false, say "You could've figured the Peeling Pier's brand name as [b]APPEALING APPEAR[r].";
	if sco-whatta-wanksta is false, say "You could've said [b]WHAT A or WHATTA WANKSTA[r] to the Gutta Ganksta before saying LOTS LAME in the mall.";
	if sco-ho-happen is false, say "You could've said [b]HO HAPPEN[r] while listening to [Toe].";
	unless oi mo is moot, say "You could have [b]DIMD[r] (dim'd) the horrible song Oi Mo in Mystery Mall.";
	if sco-lie-lol is false, say "You could've said [b]LIE LOL[r] to the shy shawl in Got Here Hot Here.";
	if sco-not-near is false, say "You could've gone [b]NOT NEAR[r] in Got Gear Hot Here.";
	if sco-break-brie is false, say "You could've tried to [b]BREAK BRIE[r] with Jake G. after taking tea.";
	if clumped cluster is not moot, say "You could've cleared up the clumped cluster in Been Buggin['] with [b]BUMPED BUSTER[r] or [b]DUMPED DUSTER[r].";
	if wild weed is off-stage, say "You could've made the mild mead into [b]WILD WEED[r].";
	if wild weed is not moot, say "You could've tried to [b]SPARK SPLIFF[r] by Cark Cliff [if player has wild weed]with[else]once you had[end if] [if wild weed is off-stage]something worth lighting, from the mild mead[else]the wild weed[end if].";
	if sco-beaker-bustle is false, say "You could've given Reeker Russell [b]BEAKER BUSTLE[r] in the Gassed Gap/Last Lap.";

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

say-warn is a truth state that varies.

no-punc-flag is a truth state that varies.

after reading a command:
	if the player's command matches the regular expression "^ *<\*;>":
		if currently transcripting:
			say "Noted.";
			reject the player's command;
	let XX be indexed text;
	if the player's command matches the regular expression "<A-Z>":
		let XX be the player's command;
		change the text of the player's command to "[XX in lower case]";
		if debug-state is true, say "(LOWERCASING) [XX][line break]";
	if the player's command matches the regular expression "^say ":
		if player has way woke clay cloak and the player's command includes "say soak": [this is a hack to allow "say soak" as a clue-rhyme]
			do nothing;
		else:
			if say-warn is false:
				now say-warn is true;
				say "NOTE: you never need to SAY anything. Just type it in. In other words, WHOAH is the same as SAY WHOAH. [fairy file] will cut SAY off of the start of all commands.";
			let XX be the player's command;
			replace the regular expression "^say " in XX with "";
			change the text of the player's command to XX;
	if the player's command matches the regular expression "<^-\.a-z 0-9>":
		if no-punc-flag is false:
			say "(NOTE: you don't need to use anything but letters to get through the game. Even commas for addressing NPCs aren't necessary. The parser simply strips out non-alphabetic characters.)[paragraph break]";
			now no-punc-flag is true;
		let XX be the player's command;
		replace the regular expression "-" in XX with " ";
		replace the regular expression "<^a-z0-9\.>" in XX with "";
		change the text of the player's command to XX;
		if debug-state is true, say "(PUNCTUATION REMOVAL) Changed to: [XX][line break]";

book parser errors

to decide whether buggin-freeze:
	if player is in Been Buggin and sco-glow-glad is false, yes;
	no;

to decide whether too-distracted:
	if buggin-freeze, yes;
	if in-bull-chase is true, yes;
	no;

the rhymeguess rules are a table name based rulebook.

Rule for printing a parser error:
	if the latest parser error is the only understood as far as error:
		say "The first word was okay, but what came after didn't quite work. You may wish to type in only the first word, or use the up arrow and delete.";
		the rule succeeds;
	continue the action;

Rule for printing a parser error (this is the clue half right words rule):
	abide by the rhyme-guess-checker rule for the table of first check rhymes;
	if location of player is wallish, abide by the rhyme-guess-checker rule for the table of wry wall guesses;
	unless guess-table of location of player is table of no good guesses:
		[if debug-state is true, say "DEBUG location guesses: [location of player], [guess-table of location of player].";]
		abide by the rhyme-guess-checker rule for guess-table of location of player;
	let table-list be a list of table names;
	repeat with tou running through touchable rhymables:
		let gtt be guess-table of tou;
		if gtt is table of no good guesses or gtt is listed in table-list, next;
		add gtt to table-list;
	repeat with tou running through touchable people:
		let gtt be guess-table of tou;
		if gtt is table of no good guesses or gtt is listed in table-list, next;
		add gtt to table-list;
	repeat with cur-guess-table running through table-list:
		abide by the rhyme-guess-checker rule for cur-guess-table;
	abide by the verb-checker rule;
	abide by the rhyme-guess-checker rule for table of general good guesses;
	if buggin-freeze:
		say "You can't do much, but that doesn't seem like it. You sort of have to break out of being and feeling [if in-so-sad]so sad[else]way wrong[end if].";
		the rule succeeds;
	continue the action;

zap-weird-break is a truth state that varies.

to say not-quite-homonyms: say "You feel ... something. But not enough. Homonyms must not quite be the way to go, here. Something similar, but not quite that similar"

Rule for printing a parser error (this is the check for room name and homonyms in player command rule):
	repeat through table of room homonyms:
		if location of player is loc entry:
			if there is a hom-rule entry:
				process the hom-rule entry;
				if the rule failed, break;
				if the rule succeeded, the rule succeeds;
				if there is no myhom entry, next;
			if the player's command includes myhom entry:
				if there is a custom-msg entry:
					say "[custom-msg entry][line break]";
				else:
					say "[not-quite-homonyms].";
				the rule succeeds;
			break;
	repeat through table of thing homonyms: [these look very similar, but I'd like to save a bit of time with breaking on loc entry for room homonyms, so I can't quite combine the code.]
		if mything entry is touchable:
			if there is a hom-rule entry:
				process the hom-rule entry;
				if the rule failed, next;
				if the rule succeeded, the rule succeeds;
				if there is no myhom entry, next;
			if the player's command includes myhom entry:
				if there is a custom-msg entry:
					say "[custom-msg entry][line break]";
				else:
					say "[not-quite-homonyms].";
				the rule succeeds;
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
			say "You often need to riff on the room name, but you never need to use the room name directly.";
			the rule succeeds;
	if debug-state is true, say "DEBUG: [the latest parser error].";
	continue the action;

Rule for printing a parser error when the latest parser error is the can't see any such thing error:
	let wn1 be word number 1 in the player's command;
	if player is in Lake Lea and sco-take-tea is false and word number 1 in the player's command is "take", continue the action;
	if player is in Wet Wood and word number 1 in the player's command is "get", continue the action;
	if wn1 is "pull":
		if full feast is moot, say "You don't need to pull anything other than the full feast." instead;
		if beer bull is touchable, say "You don't need to pull the Beer Bull for it to follow you." instead;
		if full feast is touchable or bull beast is touchable, continue the action;
	say "You can't see any objects like that here.";

Rule for printing a parser error when the latest parser error is the i beg your pardon error:
	say "[one of]Blank blather? Rank! Rather![or]Weak will! Speak, spill![in random order]"

Rule for printing a parser error when the latest parser error is the noun did not make sense in that context error:
	say "The action was okay, but I couldn't recognize the object."

the check for room name and homonyms in player command rule is listed first in the for printing a parser error rulebook.

the clue half right words rule is listed before the check for room name and homonyms in player command rule in the for printing a parser error rulebook.

oopsies is a number that varies.

Rule for printing a parser error when the latest parser error is the didn't understand error or the latest parser error is the not a verb I recognise error:
[	if debug-state is true, say "[the latest parser error].";]
	if player is in Wet Wood:
		increment oopsies;
		say "[if oopsies < 2]You have to do something special to get out of here, you sense. Something simple. Perhaps going random directions can give you a clue. Clues will also get more explicit if you try things that don't work, at least in the Wet Wood. But there is one action that works here and only here. Eventually, I'll spoil it, if you can't find what to guess[else if oopsies < 4]Hmm. You don't need anything fancy. You need to improve your wood-exploring skills[else if oopsies < 6]There seems to be some reason, or rhyme, to the places around the Wet Wood, and how you were recruited, but you haven't figured it out yet[else if oopsies < 8]You wish there were some wet weeds, all of a sudden. They'd let leads become apparent[else if oopsies < 10]'Wet wonder, set [']sunder,' you think to yourself. No, you need to be more positive[else if oopsies < 12]Perhaps it's a mirage! Your efforts are getting nowhere, but see some wet wheat by a set seat. You think you hear 'Met, meet.' Perhaps there is something special about the Wet Wood[else if oopsies < 14]A noise through the trees moans 'Woe! Wet Wood! Go! ... ' How would this end, you wonder[else]You need to GET GOOD to get out of here[end if].";
	else if player is in Rift River:
		say "Hmm. You managed to GET GOOD out of the Wet Wood, but you just need to meet someone now.";
	else if player is in Vined Vault:
		say "[if mean mass is off-stage]That's not it. Maybe there's a small wrinkle with what you need to rhyme--and it goes beyond starting with g's[else]You had to lose a letter from Vined to find fault. Maybe this time you need to add a letter to mean, or mass, or both[end if].";
	else:
		say "Your rhyming attempts bring up nothing. Or, if you tried a standard verb--well, this game tries to keep it simple, so you can focus on the puzzle verbs. But [b]VERBS[r] will show what you can use.";

ha-half is a truth state that varies.

zap-core-entry is a truth state that varies.

to up-which (ts - a truth state):
	if ts is true:
		up-reg;
	else:
		up-min;
		increment cur-bonus

to say first-of-ors of (x - indexed text):
	replace the regular expression "\|.*" in x with "";
	say "[x]";

[these have to be defined as globals as otherwise inform throws a "too many local variables" error]

this is the verb-checker rule:
	let local-ha-half be false;
	let local-post-hom be false;
	let brightness be false;
	let new-point-to-get be false;
	let is-song be false;
	let global-row-check be 0;
	let hom-row be 0;
	let my-count be 0;
	repeat through the table of verb checks:
		increment global-row-check;
		now my-count is 0;
		now vc-dont-print is true;
		process the ver-rule entry;
		let rb-out be the outcome of the rulebook;
		if rb-out is the unavailable outcome, next;
		now vc-dont-print is false;
		[say "[ver-rule entry].";]
		if there is a wfull entry and the player's command matches the wfull entry:
			now my-count is 4; [ 4 = topic match, 3 = mix up alt solutions, 2 = 2 word match (or DIMD). This is a magic number to get rid of a boolean, so we can have all non global variables inside one rule, because Inform only allows 15 local variables. ]
		else:
			if the player's command matches the regular expression "(^|\W)([w1 entry])($|\W)", increment my-count;
			if there is a w2 entry:
				if the player's command matches the regular expression "(^|\W)([w2 entry])($|\W)", increment my-count;
			else if my-count > 0:
				increment my-count;
			if there is a wfull entry and my-count is 2:
				increment my-count;
		if my-count >= 2:
[			if debug-state is true, say "DEBUG: processing [ver-rule entry], outcome [if rb-out is unavailable outcome]UA[else if rb-out is not-yet outcome]NOT YET[else if rb-out is already-done outcome]already done[else]rady[end if].";]
			process the ver-rule entry;
			if rb-out is the already-done outcome, the rule succeeds;
			if rb-out is the not-yet outcome:
				let exact-cmd be whether or not the player's command matches the text "[first-of-ors of w1 entry][if there is a w2 entry] [first-of-ors of w2 entry][end if]", case insensitively;
				if think-cue entry is false:
					say "[line break][one of][b]NOTE[r]: this command[if exact-cmd is false] (well, an equivalent, as there were alternate solutions)[end if] will be useful later, but you aren't ready to use it, yet. You can track commands like this by typing [b]THINK[r], which will also clue you if they now work.[or](useful command[if exact-cmd is false] (or a functionally equivalent alternate solution)[end if] again saved to [b]THINK[r] for later reference.)[stopping]";
					now think-cue entry is true;
				else:
					say "[line break]Hmm, that [if exact-cmd is false](or a functionally equivalent alternate solution) [end if]still doesn't quite work here and now. But it will, somewhere, some time.";
				the rule succeeds;
			if okflip entry is false:
				unless my-count is 4 or there is no w2 entry or the player's command matches the regular expression "^([w1 entry])\W": [using only w1 is  is for the DIM'D test case... and "my-count is 4" is a hack for FLIMFLAM]
					say "You've got it backwards! Just flip things around, and it'll be okay.";
					the rule succeeds;
			if my-count is 3:
				say "Ooh! You're close. You've probably juggled two valid solutions.";
				the rule succeeds;
			if buggin-freeze:
				if ver-rule entry is not vc-glow-glad rule and ver-rule entry is not vc-stay-strong rule:
					say "Ugh! That should work, but you don't feel up to it. Maybe once your head is clearer, you'll figure where and why.";
					now think-cue entry is true;
					the rule succeeds;
			if beer bull is touchable and do-rule entry is not vr-near-null rule and do-rule entry is not vr-dear-dull rule:
				now think-cue entry is true;
				if debug-state is true, say "[ver-rule entry] set to true.";
				say "The beer bull roars as you attempt the simple rhyme! Little surprise it hates any sort of poetry. While you're distracted, it slaps you around a bit.[paragraph break]Such a shame ... you should probably come back ASAP and do things without the bull chasing you.[paragraph break]";
				let oldloc be location of player;
				reset-bull-chase;
				the rule succeeds;
			if there is a core entry and idid entry is false:
				if core entry is true and number of words in the player's command > 2:
					say "You may have used too many words. Any necessary command just needs two words, no more, no less. I put this in to make sure you can't just spam guesses. It's a bit strict, but ... I wanted some cursory protection, as well as simple guidance to narrow down what you should guess.";
					the rule fails;
				up-which core entry;
				if core entry is false:
					increase lump-count by 1;
			now idid entry is true;
			now think-cue entry is false;
			process the do-rule entry;
			if zap-core-entry is true: [must be after "process the do-rule entry" or next LLP may not register]
				blank out the core entry;
				now zap-core-entry is false;
			process the score and thinking changes rule;
			if there is a core entry and core entry is false, check-lump-progress;
			the rule succeeds;
		if shut-scan is true, next;
		if two-too is true:
			if there is a posthom entry:
				if ver-rule entry is vc-history-hall rule and in-mystery-mall is false:
					do nothing;
				else if ver-rule entry is vc-mystery-mall rule and in-mystery-mall is true:
					do nothing;
				else if ver-rule entry is vc-loft-land rule and in-loft-land is true:
					do nothing;
				else if ver-rule entry is vc-soft-sand rule and in-loft-land is false:
					do nothing;
				else if the player's command includes the posthom entry:
					now local-post-hom is true;
					if there is a hom-txt-rule entry, now hom-row is global-row-check;
		if ha-half is true and my-count is 1:
			now vc-dont-print is true;
			now already-rhymed-this is false;
			process the ver-rule entry;
			if the rule failed:
				now vc-dont-print is false;
				next;
			now vc-dont-print is false;
			if already-rhymed-this is true, break;
			now local-ha-half is true;
			if sing-clue is true, now is-song is whether or not songy entry is true;
			if debug-state is true, say "DEBUG: [ver-rule entry] tipped off the HA HALF button.";
			if there is a core entry:
				now new-point-to-get is true;
				if core entry is true, now brightness is true;
			next;
	if local-ha-half is true:
		say "The HA HALF button lights up on your Leet Learner[if new-point-to-get is false]--wait, you're just switching back to a rhyme you knew before. You must've mis-thought a word[else if brightness is false], but dimly--perhaps this is a rhyme you don't strictly need to figure to win[else if local-post-hom is true], and its brightness suggests your rhyme must be very close, indeed[end if][if is-song is true]. The Leet Learner emits a tune as well[end if].";
		the rule succeeds;
	if local-post-hom is true:
		if hom-row > 0:
			choose row hom-row in table of verb checks;
			abide by the hom-txt-rule entry;
		say "The Leet Learner shakes back and forth. Something you said sounded right, but maybe you didn't THINK it right.";
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

a lurking lump is a boring rhymable. description is "The lurking lump shines dully. It looks to have [lump-charges in words] charge[plur of lump-charges] for you to make a JERKING JUMP (JJ) if anything is baffling you.". bore-text of lurking lump is "You can only JERKING JUMP (JJ) with the lurking lump.". guess-table of lurking lump is the table of lurking lump guesses.

to decide which number is variable-scan-length of (mynum - a number):
	if mynum is 100: [Jake G]
		if sco-wake-whee is false, decide on 44; [WAKE WHEE]
		if sco-take-tea is false, decide on 43; [TAKE TEA]
		if sco-fake-fee is false, decide on 43; [FAKE FEE]
		if sco-break-brie is false, decide on -54; [BREAK BRIE, optional]
		decide on 0;
	else if mynum is 101: [Toe Tappin' Row Rappin]
		if player is in whining war and sco-so-sappin is false, decide on 26; [so sappin]
		if player is in violent vale and boring boat is touchable and sco-no-nappin is false, decide on 26; [no nappin]
		if player is in gassed gap and sco-go-gappin is false, decide on 26; [go gappin]
		if player is in blinding blaze and sco-mo-mappin is false and sco-winding-ways is true, decide on 26; [mo mappin]
		if player is in lake lap and sco-co-capn is false, decide on 24; [co capn]
		if sco-ho-happen is false, decide on -26;
		decide on 0;
	say "BUG: no variable-scan-length for [mynum]. Please let me know what you typed.";
	decide on 44;

a rhymeguess rule for a table name (called tn) (this is the rhyme-guess-checker rule):
	repeat through tn:
		if the player's command matches mist-cmd entry:
			if there is a mist-rule entry:
				process the mist-rule entry;
				unless the rule succeeded, continue the action;
			say "[mist-txt entry][line break]";
			let see-leet-read be true;
			let is-opt be false;
			if there is a leet-rule entry:
				process the leet-rule entry;
				unless the rule succeeded, now see-leet-read is false;
			if see-leet-read is true and there is a magicnum entry: [see mistakes file for explanations of magic numbers]
				let Q be magicnum entry;
				if Q >= 100: [Just to make sure we start with a number that's out of bounds]
					now Q is variable-scan-length of Q;
					if debug-state is true, say "DEBUG: dynamic magic number directed us to [Q / 10] / [the remainder after dividing Q by 10].";
				if Q < 0:
					now is-opt is true;
					now Q is 0 - Q;
				if Q is not 0:
					let d1 be Q / 10;
					let d2 be the remainder after dividing Q by 10;
					decrease d1 by number of characters in word number 1 in the player's command;
					decrease d2 by number of characters in word number 2 in the player's command;
					let cc be cluecheat of d1 and d2;
					say "[leetclue of cc and is-opt].";
			if got-yet entry is false:
				increment total-good-guesses;
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
	say "[line break]The lurking lump shrivels[if lump-charges is 0] and vanishes. Maybe more good guesses will bring it back[one of][or] again[stopping][else], but it still looks functional[end if].";
	if lump-charges is 0, moot lurking lump;
	now in-jerk-jump is false;
	increment lump-uses;
	process the score and thinking changes rule;

carry out jerkingjumping:
	if debug-state is false:
		if lurking lump is off-stage, say "You have nothing that would help you do that." instead;
		if lurking lump is moot, say "You used up all the lump's charges, but maybe you can get more." instead;
	else:
		say "DEBUG: ignoring the charges in the lump, currently at [lump-charges].";
	now in-jerk-jump is true;
	if in-bull-chase is true and sco-near-null is true:
		if snuck snare is not moot, say "The lurking lump remains immovable. Perhaps you can't quite outrun or outsmart the Beer Bull, yet, and you'll have to take your lumps. Which is a hint in its own way, I guess." instead;
		say "The lurking lump bounces down and around all the way to the Knives Niche. Where you trick the Beer Bull into running into the trap you set. You head back to the Gear Gull in Here Hull.";
		solve-bull-chase;
		lump-minus;
		the rule succeeds;
	if doable-hinted > 0:
		say "The lump glistens weirdly. Perhaps you've forgotten something you tried, which didn't work then, but it does, now. (THINK should give details.) Use it anyway?";
		unless the player yes-consents:
			say "OK. Again, THINKing should show what you can do now." instead;
	now vc-dont-print is true;
	repeat through table of verb checks:
		unless there is a core entry, next;
		if core entry is false, next;
		if idid entry is true, next;
		process the ver-rule entry;
		let vr be the outcome of the rulebook;
		if vr is the ready outcome:
			say "After some thought, you consider the right way forward: [firstor of w1 entry] [firstor of w2 entry]...";
			now idid entry is true; [this is so BURY BILE gets processed. We already checked IDID above.]
			up-which core entry; [?? I really need to clean this code up. I want just to increment the score in one place. If a rule can keep track of the current row, that would be nifty.]
			process the do-rule entry;
			if zap-core-entry is true:
				blank out the core entry;
				now zap-core-entry is false;
			skip upcoming rulebook break;
			lump-minus;
			now think-cue entry is false;
			now vc-dont-print is false;
			disable saving of undo state;
			the rule succeeds;
	now vc-dont-print is false;
	say "The lurking lump remains immovable. I guess you've done all you need, here.";
	the rule succeeds.

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
	phbt Tarry Tile;
	say "Yes. You know what to do. And after your journey, you are ready. As you bury the bile -- yours for others you have met in the game and in the past, and even for your own faults -- you toss the [fairy file] a sad, pitying smile, and it begins to dissolve. Final futile protests of 'Flame? Flee Lamely!' and a final 'Same! SEE!' fail, before it winks out with a cryptic 'Dame Dee, shame she...'.[paragraph break]The Merry Mile changes significantly. A puffed portal appears, which you can't enter until you give a chuffed chortle--you've earned it! Your surroundings change.[paragraph break]You wind up back in the Fun Fen, where everyone you met (and didn't eat or lure to a gruesome end) in your adventure congratulates you, even the Bot Board, now reformed as the more benign Plot-Planned Bot Band![paragraph break]There's lots of 'I don't know what I was thinking! I'm glad you didn't let me stop you!' and 'I knew you could do it, sport,' and stuff, but with the Very Vile Fairy File recently vanquished, people let it slide. Someone even has the nerve to say that we all have to do small things every day to defeat the Very Vile Fairy File lodged in our own hearts and embedded in society without any magic, but the mood's so positive, people nod and prepare for the task ahead.[wfak]";
	say "But they need to do it without you. It's time to leave--you recognize what can only be an In/Out Spin Spout. It must be what teleported you here. You step in. Soon you're back home. Fall Fest's last booths are being dismantled. You sort of wish you could have a memento of your trip. Then you see it. A t-shirt in the grass, forgotten. It's been left a while. A tortoise and porpoise smile next to each other on it. The tag on the back of the neck says 'FUN FAIR WON WEAR.' There's a bracelet, too, perhaps a bit too optimistic: LIFE LONG STRIFE-STRONG. Good enough.";
	process the score and thinking changes rule;
	if in-beta is true or debug-state is true:
		check-missing-necc;
	end the story finally saying "DEAL'S DONE: FEELS FUN!";
	follow the shutdown rules;

to check-gored-clue:
	say "[line break]";
	if Hot Horde is in Airy Isle and Lot Lord is in Airy Isle:
		say "The Hot Horde greets the Lord enthusiastically, waiting for a battle cry or something to pump them up and really focus on killing the hated Bot Board.";
		if tried-yet of vc-got-gored rule, say "[line break]Maybe the 'GOT GORED' battle cry you tried earlier would work better, now, with a leader and followers to use it properly.";
	else if Hot Horde is in Airy Isle:
		say "The Hot Horde runs around a bit, leaderless. You're not quite up to it. But maybe someone else is.";
	else:
		say "The Lot Lord surveys the isle, as if looking for followers. He doesn't have any, yet. But maybe you could help him find some!"

this is the shone-yet rule:
	if sco-shining-shore is false, say "Too whiny for that right now." instead;

to lean-and-mean:
	say "[line break]";
	if sco-lean-luggin is true and sco-mean-muggin is true:
		say "Dean Duggan applauds you. 'You have learned two profound lessons from me. You are ready to wear this way woke clay cloak.' But it doesn't seem to fit, quite. 'Hmm. Well, with my training, you're worthy to carry it, at least. I've helped you all I can. Oh, if you want to give a bit back, can you take care of that clumped cluster over there? No obligation, no reward, just...well, it'd be nice.' He vanishes.[paragraph break]Hmm. Maybe you will find the way to make the clay cloak wearable elsewhere. Also, with your mind clearer, you notice a wry wall you missed before.";
		now player has clay cloak;
		moot Dean Duggan;
		move clumped cluster to Been Buggin;
		phbt Been Buggin;
		wall-add Been Buggin;
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

to vcpforce (t - text): [this is for the -very- special case of when you are in Been Buggin and haven't coped yet]
	if vc-dont-print is false, say "[t][line break]";

to vcp (t - text): [verb conditional print]
	if vc-dont-print is false:
		if buggin-freeze:
			say "That's got to be right somewhere, but you can't focus now. When your mind's less scrambled, you'll figure it out.";
		else:
			say "[t][line break]";

to vcal (t - text): [verb conditional print, flag already rhymed]
	now already-rhymed-this is true;
	if vc-dont-print is false, say "[t][line break]";

sco-really-rolling is a truth state that varies.

to start-middlegame:
	move the player to Fun Fen;
	say "After looking around, you are taunted by 'Hot hero? Zot! Zero!' It's much more convincing audibly than as bad MSPaint cover art. What could it be? You remember, now, some things the Gift Giver said. Your eyes glazed over at the mention of [the poke pest]. But apparently you don't need to DO anything to or with it, just not let it get in your way.";
	now player has the joke jest poke pest;
	repeat with X running through rooms in worst whew:
		phbt X;

volume warp commands

warp-warn-yet is a truth state that varies.

this is the warp-warn rule:
	if warp-warn-yet is false:
		now warp-warn-yet is true;
		say "You've typed a warp command that is only referred to on the release sheet. This nag will only appear once, but I want to check to make sure this is what you want.";
		if the player yes-consents, continue the action;
		say "Okay. You can warp later if you like, unless of course you get too far along in the game.";

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
	abide by the warp-warn rule;
	repeat through table of verb checks:
		if cur-row > 2: [we need to skip GLOW GLAD/STAY STRONG]
			now idid entry is true;
		if do-rule entry is vr-flim-flam rule, break;
		increment cur-row;
	process the any-warp rule;
	now core-score is whew-score + bag-point;
	now score is whew-score + cur-bonus + bag-point;
	start-middlegame;
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
	abide by the warp-warn rule;
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

this-beta-warp is a truth state that varies.

this is the any-warp rule:
	if any-beta-warp is true, say "You already used a Beta testing warp." instead;
	now any-beta-warp is true;
	now this-beta-warp is true;

carry out climbclearing:
	if Airy Isle is visited, say "You're already in the endgame." instead;
	process the any-warp rule;
	say "You bolt ahead, booming 'I'm [']ere!'[paragraph break]Note that stuff like the score is likely hosed now. Your object is just to get through the rest of the game. You also should not be able to go back south in this testing environment.";
	now fun fen is visited; [this is a small hack for cases when we jump from the beginning but still need the appearance that the player worked through the game]
	now climb-clear is true;
	now sco-stay-strong is true;
	move player to Airy Isle;
	repeat through table of verb checks:
		if there is a core entry and core entry is true, now idid entry is true;
		if do-rule entry is vr-couple-caps rule, break;
	now score is min-needed - isle-score;
	isle-adjust-score-think;
	the rule succeeds.

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
		if Fun Fen is unvisited:
			say "[line break]You can [b]SLOW SIGH or BLOW BY or FLOW FLY[r] to jump to the nonlinear part and avoid the introduction.[paragraph break]You can [b]TRICK TRIP or SLICK SLIP[r] before reaching the main area, as well, to skip past the current puzzle. You'll know the main area, because it is non-linear.";
		if Airy Isle is unvisited:
			say "[line break]Also, you can [b]CLIMB CLEAR[r] to jump to the (relatively brief) endgame, and LLA leet-learns everything in sight.";
	continue the action;

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

volume map index

index map with Trim Tram mapped east of Real Rear.
index map with Po Pit mapped east of Trim Tram.
index map with Vined Vault mapped east of Po Pit.
index map with Vined Vault mapped south of Wet Wood.

index map with Fight Funnel mapped north of History Hall.

section odd directions

index map with Y'Old Yard mapped south of Got Gear Hot Here.

section endrooms

index map with Tarry Tile mapped north of Airy Isle.

section altrooms

index map with Vending Vibe mapped south of Po Pit.
index map with Curst Cave mapped south of Vined Vault.

section metarooms [these need to go somewhere]

index map with Gazy Gap mapped south of Trim Tram.
index map with Hidey House mapped west of Gazy Gap.

section side room to include - not for release

[include Very Vile Fairy File Fake Rooms by Andrew Schultz.]
