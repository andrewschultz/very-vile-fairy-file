"Very Vile Fairy File" by Billy Boling

[d'oh done fo' fun]

the story headline is "Less Lame Guess Game: Double Dip Trouble Trip"

[implement help toggling: HELP HOW/WELP WOW]

volume includes

the release number is 1.

include Trivial Niceties by Andrew Schultz.

include Intro Restore Skip by Andrew Schultz.

include Basic Screen Effects by Emily Short.

include Very Vile Fairy File Mistakes by Andrew Schultz.

include Very Vile Fairy File Tables by Andrew Schultz.

include undo output control by Erik Temple.

use authorial modesty.

use MAX_ACTIONS of 210.

section debug include values - not for release

use MAX_VERBS of 200

section establish debug - not for release

when play begins (this is the set debug state rule): now debug-state is true;

[Include this line after, as it may have some "when play begins" tests]

include Very Vile Fairy File Tests by Andrew Schultz.

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

to too-generic: if debug-state is true, say "TEXT BELOW IS TOO GENERIC. Fix."

to decide which region is mrlp:
	decide on map region of location of player;

to decide whether the action is procedural:
	if examining, yes;
	if reading, yes;
	if hintobjing, yes;
	if lling, yes;
	no;

definition: a thing (called th) is moot:
	if th is in Hidey House, yes;
	no;

definition: a thing (called th) is known-to-player:
	if th is in Hidey House, no;
	if th is off-stage, no;
	if th is not a backdrop and location of th is unvisited, yes;
	yes;

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

to say ll: say "[b]LL[r]"

section flags for testers

[ this won't appear in the release version, but since these flags crop up in a lot of actions to help with playtesting, we can't put them in a debug version. debug-state is another such variable, but it's included in Trivial Niceties. ]

in-beta is a truth state that varies. [general beta flag]

climb-clear is a truth state that varies. [ did the beta tester jump ahead until the end? ]

section scoring stuff

to say hc: say "ch"

to say email: say "blurglecrun[hc]eon@gmail.com"

to say gh: say "https://github.com/andrews[hc]ultz/very-vile-fairy-file (currently private)"

the maximum score is 64.

whew-score is a number that varies. whew-score is 8.

min-needed is a number that varies. min-needed is 56.

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

a gaphat is a kind of thing.

cheattype is a kind of value. the cheattypes are phbt, letplus, letminus, partplus, partminus, leteq, letboth.

to phbt (x - a thing):
	now cht of x is phbt;
	now x is not optional-noted;

to phbt (x - a room): now cht of x is phbt;

a room has a cheattype called cht. cht of a room is usually phbt.

a thing has a cheattype called cht. cht of a thing is usually phbt.

a thing can be optional. a thing is usually not optional.

a thing can be optional-noted. A thing is usually not optional-noted.

a thing can be two-too. a thing is usually not two-too.

a thing can be boring. a thing is usually not boring.

a thing has text called bore-text.

a thing has a rule called bore-rule. bore-rule of a thing is usually the bore-nothing rule.

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

the wry wall is a boring backdrop. "The wry wall reads:[line break][sign-dir]". bore-text of wry wall is "The wry wall is just there for atmosphere.".

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
		if there is an e1 entry and e1 entry is location of player:
			now got-wry is true;
			say "[b][fake-name entry][r]: [e2 entry].";
	if got-wry is false, say " (NOTHING) -- that's a bug.";

definition: a room (called rm) is signable:
	if rm is airy isle and bot board is in airy isle, no;
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
			if been-here entry is true, say "You already went [noun] to the joke death-trap [fake-name entry]." instead;
			say "[death-trap entry][paragraph break]";
			now been-here entry is true;
			increment wry-wall-found;
			if wry-wall-found is number of rows in table of bad locs, say "Incidentally, you've found everything." instead;
			say "[if ever-wry-wall is false]NOTE: The wry wall just leads to a bunch of joke deaths. You can avoid them or follow them as you please. You don't get any bonus for finding them all, but maybe you'll find them fun. You'll always be kicked back to where you were, with no harm done[else]Well, that's another joke death trap visitedLet's kick you back to where you were[end if].";
			now ever-wry-wall is true;
			say "[line break][b][location of player][r][paragraph break]";
			the rule succeeds;
	unless noway-text of location of player is empty, say "[noway-text of location of player][line break]" instead;
	carry out the exitlisting activity;
	the rule succeeds;

definition: a direction (called d) is viable:
	if the room d of location of the player is nowhere, no;
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

the zig zag rig rag is a thing. cht of zig zag rig rag is leteq. The player carries the zig zag rig rag. description of zig zag rig rag is "It certainly looks snazzy but impractical[if bag-hint is true]. Maybe if it were more basic and simpler, it could help you more in your quest[end if].". [-> big bag]

after examining zig zag rig rag when bag-hint is true:
	say "[if Fun Fen is visited]You can probably change it to a BIG BAG, now[else]You don't feel this is the place to change it to a BIG BAG, yet[end if].";
	continue the action;

the big bag is a thing. description of big bag is "It's pretty nondescript, but it gets the job done. You can hold everything you want tn, now!"

bag-hint is a truth state that varies. [ this seems like duplicating the THINK command, but it's used for the bag description and makes for easier code. ]

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

Rift River is a room in Worst Whew. "The rift river blocks you, and you can't go back, and you don't know which direction to go in, anyway. Though you managed to GET GOOD to get out of the wood, you'll need a different sort of boost to get around the river. It's too wide to cross, and you don't want to go back."

chapter Mind Malt

a packet of Mind Malt is a thing. description is "It looks like there used to be Mind Malt, or powder that could make Mind Malt, here. Pity. It could've helped you figure what to do!". cht of Mind Malt is partplus. [-> find fault]

check eating Mind Malt: say "Worthless. It's empty." instead;

Too Totes New Notes is a thing. description is "You read about your accomplishments and what the Leet Learner scanned, or would have scanned:[paragraph break][fixed letter spacing][my-notes][variable letter spacing]"

to say my-notes:
	repeat through table of newnotes:
		if there is a score-needed entry and score < score-needed entry, continue the action;
		say "[note-to-give entry][line break]";

table of newnotes
score-needed	note-to-give
1	"   GET GOOD to WET WOOD    = yellow."
2	" RIFT RIVER to GIFT GIVER  = yellow."
3	"VINED VAULT to FIND FAULT  = orange."
--	"  MIND MALT to FIND FAULT  = green."
4	"  MEAN MASS to GREEN GRASS = blue."
5	"     PO PIT to GROW GRIT   = blue."
--	"   ROW WRIT to GROW GRIT   = green."
6	" TRASH TRAP to [ash-ap]    = red."
--	"   GASH GAP to [ash-ap]    = yellow."
--	"  CACHE CAP to [ash-ap]    = orange."
7	"   FIND FEE to MIND ME     = orange."
8	"  TRIM TRAM to [ski-fli]   = green."

to say ski-fli: say "[if skim-not-flim is true]SKIM SCAM[else]FLIM FLAM[end if]"

to say ash-ap: say "[if bap-map-rap is 1]BASH BAP[else if bap-map-rap is 2]RASH RAP[else]MASH MAP[end if]"

part Vined Vault 3,-1

Vined Vault is a room in Worst Whew. "[if mean mass is in Vined Vault]You found fault in the Vined Vault, but you still can't leave.[else]You're stuck here! There looks to be no way out. It looks like a perfect trap, but...[end if]". noway-text is "You can't tell directions here, but then again, there's no actual unblocked way out. You need to use your head[if mean mass is in vined vault] again[end if].". cht of vined vault is partminus. [-> find fault]

chapter mean mass

The mean mass is a thing. "The mean mass continues to pulse and block the way out of the Vined Vault.". description is "The mean mass doesn't quite attack you, but it hangs menacingly, unnaturally, too dangerous to walk through.". cht of mean mass is letplus. [-> green grass]

part Po' Pit 2,-1

Po' Pit is a room in Worst Whew. "Just beyond a trash trap ... an obvious one, no less ... looks like freedom, of a sort. You've got to get by! There is a row writ, which may or may not be helpful, by an obvious trash trap that guards a long gash gap.". noway-text is "You can't go back, and directions don't seem to apply here. You need to think your way past the trash trap.". cht of po' pit is letplus. [-> grow grit]

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

FIND FEE is scenery in Trim Tram. cht of FIND FEE is partminus. [-> mind me]

me-minded is a truth state that varies.

chapter flimflaming

skim-not-flim is a truth state that varies;

volume Piddling Pain

part Fun Fen 0,0

Fun Fen is a room in Piddling Pain. "It's a bit nicer here than back in the Done Den. You don't fear ambush by a hun hen. There's also a wry wall here. The Done Den [if tree-down is false]you just left [end if]is also around. You can go south, and [if tall tree is moot]with the tall tree pushed over, you can go north[else]it looks like you could go north, but the way looks treacherous and murky. Maybe you can do something with the tall tree nearby[end if].". noway-text is "You don't want to go back through the Done Den to the Wet Wood or Vined Vault. Or fall off Fun Fen.". [?? different description than in cross]

check going in Fun Fen:
	if noun is north and tree-down is false, say "You need a way through the murky bit to the north. Well, a much safer one." instead;
	if noun is down, say "'Don't die.' / 'Won't! Why?'" instead;

section done den

the done den is scenery in Fun Fen. "It looks nice and cozy. You feel a sense of accomplishment having made it through the done den, but you don't want to go back."

check entering done den: say "As you start to enter, you imagine a weight falling on you. How much? A ton. Ten.[paragraph break]You don't need to revisit your initial success." instead;

section wrong art

the wrong art is optional scenery in Fun Fen. "It just looks wrong here. But perhaps it is sort of right, because it may give you one more idea about how to do things. Like all art, it's strictly not necessary, and neither is viewing it the right way. The wrong art also has a prong part sticking out from it.". cht of wrong art is letplus. [-> strong start]

the prong part is part of the wrong art. The prong part is optional. "It's a particularly ugly part of the wrong art.". cht of prong part is letplus. [-> strong start]

started-strong is a truth state that varies.

section tall tree

tree-down is a truth state that varies.

The Tall Tree is boring scenery in Fun Fen. "[if tree-down is false]The tall tree sits here, bending out over the gap to the north. It could make a bridge reaching the other side[else]You made the tall tree fall free to the north, giving passage to [swh of the room north of Fun Fen][end if].". cht of tall tree is leteq. bore-text of tall tree is "[if tree-down is true]You'd better not do anything to the tree. It's your way across[else]You need to do something specific to the tree. Maybe give it an order[end if].". [-> fall free]

section hive heap

the hive heap is a thing. cht of hive heap is leteq. "The hive heap that was released with the tall tree fell is here. There's got to be a way to look through it.". description is "The hive heap seems like it may be hiding something below the surface, but how best to attack it?". [-> dive deep]

check taking hive heap: say "You might not get stung, but it's too unwieldy to carry[if player has big bag], even with your big bag[end if]." instead;

section vapor vile

the vapor vile is a thing. cht of vapor vile is leteq. "A vapor vile has sprouted from the hive heap. Perhaps there is something inside it.". description is "The vapor vile is noxious, so you can't get too near it. But perhaps if it condensed into a solid, you could deal with it more easily.". [-> paper pile]

check taking vapor vile: say "It's too ethereal to take." instead;

section paper pile

the paper pile is a thing. "A paper pile lies here. You'd like it to be a bit more firmly bound together before you take it.". description is "It is a bit loose. Every single paper is labeled FACT FINDER.". cht of paper pile is partplus. [fact finder -> backed binder]

check taking paper pile: say "There's got to be a way to put the paper pile together a bit better first." instead;

understand "fact/finder" and "fact finder" as backed binder.

section backed binder

the backed binder is a thing. description is "The backed binder holds critical, but obscure, information on the Crimes Crew Times Two and how they made the Very Vile Fairy File. It's pretty high level stuff. The ideas sound grand, but they're not backed up by evidence."

chapter Cark Cliff

Cark Cliff is optional proper-named scenery in Fun Fen. "[if wild weed is moot]You don't feel so worried about Cark Cliff now[else]It's intimidating, but it would be neat if it weren't[end if].". cht of cark cliff is letplus. [-> spark spliff] [?? bark biff]

[the fame fighter is a thing ?? -- lame lighter / spark spliff]

tree-down is a truth state that varies.

part Real Rear 0,-1

Real Rear is south of Fun Fen. Real Rear is in Piddling Pain. "Yup. This feels about like the edge of where you can explore. You can really only go back north. A peeling pier leads out south to the Sage Sea, which expands on all sides. There's also a steel steer here, and you sense the presence of a Ceiling Seer as well. This seems like a place for reflection on your emotions.". noway-text is "The Sage Sea surrounds you all ways except back north[if cage key is not off-stage]. You already got the cage key from it, anyway[end if]. You also sense a Ceiling Seer above, judging what you do.". cht of real rear is partplus. [-> kneel near]

chapter ceiling seer

the ceiling seer is boring scenery in Real Rear. "The Ceiling Seer is all around. You can't do anything with it, [if healed-here is true]and it's given enough[else if knelt-yet is true]. though you may be able to gain more favors[else]though if you do the right thing, you may be worthy of a few favors[end if]."

chapter Sage Sea

the Sage Sea is scenery in Real Rear. "[if cage key is off-stage]You feel as though the Sage Sea must hold something, if you can prove yourself worthy[else]You've proved yourself worthy enough. The Sage Sea may hold other mysteries, but they are beyond the bounds of this quest[end if]."

chapter Steel Steer

the steel steer is scenery in Real Rear. description is "It's probably a good thing it's not a stealing steer, which would fit in fully with the pier, but all the same, it suggests things you might be able to do.". cht of steel steer is partminus. [-> kneel near]

the peeling pier is scenery in Real Rear.

check taking steel steer: say "It is way too heavy to STEAL STEER." instead;

chapter Cage Key

the cage key is a thing.

knelt-yet is a truth state that varies.

felt-fear is a truth state that varies.

healed-here is a truth state that varies.

part Creased Cross 0,1

Creased Cross is north of Fun Fen. Creased Cross is in Piddling Pain. "This feels like a boring old intersection, but you [if bull beast is moot]defeated the bull beast here, which was exciting[else]sense it may need to be so much more, later[end if]. You can go in all four directions here[beast-clue].". cht of creased cross is letminus. [-> beast boss]

to say beast-clue:
	if bull beast is not moot:
		say "[if healed-here is true]You get the feeling the right cry could bring the bull beast out[else if least-loss is true]The bull beast must be waiting in the shadows[end if]";

need-loss is a truth state that varies.

instead of doing something when need-loss is true:
	if action is procedural, continue the action;
	say "You need to do something ... no chance of winning, but you can't be routed here.";

chapter Bull Beast

The Bull Beast is a person. talk-text is "'Tame? Tush! Maim! Mush!'". "[if cull-ceased is true]The Bull Beast lies dead here[else]The Bull Beast roars around here[end if].". bore-text of Bull Beast is "The Bull Beast is dead. No need to muck around.".

cull-ceased is a truth state that varies.

least-loss is a truth state that varies.

beast-boss-min is a number that varies. beast-boss-min is 32.

chapter full feast

The full feast is a thing. "A full feast lies here. You can't eat it all by yourself, and you have no way to move it on your own.". description is "It's what remains of the bull beast, and it's surprisingly tasty looking. Pre-cooked, too! Because you sure burned it with your magic words, there. Ahaha."

part Stark Store -1,1

Stark Store is west of Creased Cross. cht of stark store is letminus. Stark Store is in Piddling Pain. "[if dark door is in stark store]A dark door leads to the west. You have no idea how to open it[else if dark door is moot]There's a way west where the dark door was[else]Nothing's here, but there should be something[end if][if weird way is in stark store]. There's also a (blocked) weird way down[else if weird way is moot]You cleared a weird way down as well[end if]. You can go back east to Creased Cross."

check going west in Stark Store:
	if dark door is off-stage, try going north instead;
	if dark door is in Stark Store, say "You can't seem to get past the dark door." instead;

check going down in Stark Store:
	if weird way is off-stage, try going north instead;
	if weird way is in Stark Store, say "You can't seem to get past the weird way." instead;

chapter dark door

There is a thing called the dark door. It is scenery. "You can't seem to open the dark door. It's there, and it's forbidding.".

chapter weird way

the Weird Way is boring scenery. cht of Weird Way is letplus. "You can't see a way past, but there has to be one.". bore-text of Weird Way is "You must be able to do something with it, somehow. Something a bit unorthodox."

part Fight Funnel -2,2

Fight Funnel is below Stark Store. cht of Fight Funnel is leteq. printed name is "[if funnel-to-tunnel is true]Tight Tunnel[else]Fight Funnel[end if]". "This is a narrow east-west passage[if funnel-to-tunnel is false], but you're not going further west past the fight[else if player does not have big bag], but it tapers to the west and you won't be able to fit with all your possessions scattered about you. The Leet Learner alone is too unwieldy, and you don't want to let go of it. You might need some simple organization to go west[else if beer bull is moot]. You don't need to go west now you trapped the beer bull[else if snare is moot]. You set a trap west, so you probably don't want to go there unless you're trying to catch someone[else]. You can probably just fit west[end if]."

funnel-to-tunnel is a truth state that varies.

this is the drop-snare rule:
	if player has snuck snare and kni-ni is true:
		moot snuck snare;
		say "As you go [if player is in fight funnel]west[else]look around[end if], you realize the snuck snare would be quite nice for trapping someone unsuspecting, somewhere, somehow. So you place it and return.";
		move player to fight funnel;
		the rule succeeds;

check going west in Fight Funnel:
	if funnel-to-tunnel is false, say "You're not getting past the fight." instead;
	if big bag is off-stage, say "You need to organize your possessions first. Maybe your inventory can be simplified." instead;
	if snuck snare is moot and beer bull is not in location of player, say "You need a very good reason not to set off the Knives Niche trap." instead;
	process the drop-snare rule;
	if beer bull is in location of player:
		if snuck snare is moot:
			say "You crawl through the Fight Funnel and roll off to the side. The beer bull, not knowing better, springs the snare! Aigh! It tumbles into the remains of the Dives Ditch. You walk back to Here Hull, where a Gear Gull rests. 'Thank you for freeing me from the Beer Bull. I would like to do you a favor in return.' The Gear Gull inspects you.";
			if player has gold guard:
				buff-gold-guard;
			else:
				say "[line break]'I see no armor I could help improve. Come back when you find it. But for now, I need time to reorganize my domain.'";
			up-reg;
			now in-bull-chase is false;
			moot beer bull;
			move player to Soft Sand, without printing a room description;
			the rule succeeds;
		say "You lead the beast bull into [the room west of Fight Funnel] but it corners you. Yet--you must be close!";
		reset-bull-chase;
		the rule succeeds;
	if beer bull is moot, say "You don't need to set or trigger the Knives Niche again." instead;

part Dives Ditch -3,2

Dives Ditch is west of Fight Funnel. cht of Dives Ditch is letplus. printed name is "[if kni-ni is true]Knives Niche[else]Dives Ditch[end if]". "[if kni-ni is true]You've set a trap, but for whom?[else]The dives ditch seems to recount many people lured, somehow, to their death. Perhaps you could construct a sneakier trap[end if]."

kni-ni is a truth state that varies.

part History Hall -2,1

mistmall is a truth state that varies.

History Hall is west of Stark Store. cht of history hall is leteq. History Hall is in Piddling Pain. printed name of History Hall is "[if mistmall is true]Mystery Mall[else]History Hall[end if]". "You can go back east here. [if ever-mall is false]The wall to the west seems hollow[else if mistmall is true]History Hall's wist-eerie wall has disappeared, affording passage west[end if][if oi mo is in History Hall]. There's a horrible song providing atmosphere[else if toe tappin is in History Hall]. A mediocre song is in the air[end if][if mean moe's is in history hall]. There's also something called Mean Moe's Clean Clothes, a small booth where you could tidy up, if you figured how to use it[end if].". [-> mystery mall]

Name Notes Tame Totes is scenery in History Hall. "You read about [next-rand-txt of table of miscellaneous people]."

the Gutta Ganksta is an optional person. description is "GOTS GAME is tattooed on the Gutta Ganksta.". talk-text is "'Chill, chap. Will WHAP!'". cht of gutta ganksta is partplus. [-> whatta wanksta]

GOTS GAME is part of the Gutta Ganksta. cht of gots game is leteq. [-> lots lame]

after lling gutta ganksta:
	if cht of gots game is leteq:
		say "But the GOTS GAME tattoo is worth scanning, too, so you do so.";
		try lling gots game;
	continue the action;

Toe Tappin Row Rappin is scenery. "You [one of]listen a bit. The song is Toe Tappin Row Rappin['], and it's actually pretty catchy and good and might help you in the future. It's stuck in your head now, and that's not all bad, because what replced it is even worse. It could almost be motivational in the right place[or]already have the song in your head. Perhaps it will be useful to see things differently[stopping]."

understand "song" as toe tappin row rappin when player is in History Hall and oi mo is in History Hall.

after examining Toe Tappin Row Rappin:
	if player does not have Row Rappin:
		now player has Row Rappin;
		move Oi Mo to History Hall;
	continue the action;

Oi Mo by Tim T Sims Pimp is optional scenery. "It's a truly awful song. If you could find a way to turn it down...". cht of oi mo is leteq. [oimo -> dimd]

understand "song" as oi mo when player is in History Hall and oi mo is in History Hall.

check going west in History Hall:
	if ever-mall is true:
		if gutta ganksta is in history hall, say "The gutta ganksta pushes you back. Maybe you can win a quick diss war to, well, displace the ganksta." instead;
		continue the action;
	say "[if ever-mall is true]You'll have to change back to History Hall[else]Thud! But a hollow thud. Maybe shifted around a bit, History Hall might afford passage west[end if]." instead;

Mean Moe's Clean Clothes is scenery. "It's some sort of machine you could use to clean something that needed it. But it's not that easy. You probably need to navigate the lights and bells and whistles."

chapter mysterymalling

ever-mall is a truth state that varies.

ever-hall is a truth state that varies.

gan-wan is a truth state that varies.

floor-yet is a truth state that varies.

part Y'Old Yard -2,-1

Y'Old Yard is a room in Piddling Pain. "The Shoaled Shard, a forbidding fortress indeed, surrounds you on all sides. You can go back INSIDE to the History Hall[if bold bard is moot], and with the Bold Bard gone, there's nothing else to do[end if]."

The Bold Bard is a person in Y'Old Yard. description is "The Bold Bard looks longingly at the Shoaled Shard. There must be some way in!". "[one of]'Hi! I'm a bold bard, and I'd love to get into the Shoaled Shard to perform and show how great I am. But the guards won't let me in. Maybe you could help? Some sort of distraction?'[or]The Bold Bard continues to pace back and forth here, looking for a way in the Shoaled Shard.[stopping]"

talk-text of bold bard is "'Scold-scarred. Told. Tarred.' The bold bard clearly wants to get into the Shoaled Shard but probably got thrown out by now-watchful guards. You both decide some sort of sneak attack or diversion would be best.".

chapter gold guard

the mold marred gold guard is a thing. description is "[if mine-more is false]Could be sturdier, actually[else]Super sturdy now you got the boost from the Whining War[end if].". printed name is "[if gull-guard is false]mold-marred [else if mine-more is true]hold-hard [end if]gold guard"

understand "hold hard gold/guard" and "hold hard gold guard" and "hold/hard gold/guard" and "hold/hard gold guard" and "hold/hard" and "hold" as gold guard when mine-more is true. [ugh! This is terrible, but I checked, and it covers all the possibilities.]

chapter shoaled shard

the Shoaled Shard is scenery in Y'Old Yard. "It's intimidating and obviously well-guarded, but it could be breached with the right distraction."

the cold card is a thing. description is "It's useful for one very useless boring ... hmm. It's blurred. You can't see.".

part Vending Vibe -2,1 a

Vending Vibe is a room in Piddling Pain. "You can only go back east here."

The Trending Tribe are plural-named people in Vending Vibe. cht of trending tribe is letminus. talk-text is "'Bam, burning! Am earning!'". "A Trending Tribe stands here, just waiting to sell you something you can't afford, because there is no money in this game.". description is "They look greedy enough. They'd overcharge you to BORROW.". [-> lending libe]

the Lending Libe is scenery. "Looking in, you see one book labeled [i][next-rand-txt of table of vvff books][r]. This locational libe has no vocational vibe.";

after going to Vending Vibe:
	process the card-and-libe rule;
	continue the action;

this is the card-and-libe rule:
	if trending tribe is moot and player has cold card:
		say "You look at your cold card for a minute. You realize that it's actually a library card! In fact, it has a book on hold! Unfortunately, the book is [We Whine], about how to be a jerk for profitand excitement. And you don't need that, being a hero. Still, you take it.";
		now player has We Whine ME MINE;
		moot cold card;
	continue the action;

We Whine ME MINE is a thing. cht of We Whine is letboth. description is "It's about how to be an extremely effective jerk and to get what you want. [if sign-seen is true]This isn't something you would want to know, but it explains how and why certain people behaved that way in the past, and now.[else]Why would you want to know that? Maybe a creful reading would turn something up.[end if]".

the printed name of We Whine is "[i]We Whine: ME, MINE[r]".

sign-seen is a truth state that varies.

part Got Gear Hot Here -2,1 b

Got Gear Hot Here is a room in Piddling Pain. It is west of History Hall. "A dilapidated store. You can go back east here."

chapter hard hat

the marred mat is a thing in Got Gear Hot Here. description is "What is a marred mat doing in a clothing store? Either it's misplaced, or ... it's more appropriate in another form. It has a message, of course.". "You can't imagine what a marred mat is doing in a clothing store, but here it is.".

check taking marred mat: say "It can't be useful in that form." instead;

the hard hat is a gaphat.

check taking off hard hat: say "No. Something will come out of nowhere to conk you on the head, and then you'd be sorry. If you were conscious enough to be sorry." instead;

chapter shy shawl

the shy shawl is a thing in Got Gear Hot Here. "A shy shawl lies here. It really can't be the sort of thing a hero wears, but maybe you can get some practice with it.". cht of shy shawl is leteq. description is "It is terribly plain, but [if trawl-try is true]you did[else]maybe you could[end if] get motivation from it."

trawl-try is a truth state that varies.

[?? mistakes]

part Violent Vale 1,1

Violent Vale is east of Creased Cross. It is in Piddling Pain. cht of Violent Vale is partminus. "Creased Cross is back west, and it's sort of watery to the north or south. [if fridge is in Vale]A frightening fridge towers over you to the east. Boy, it's scary here. Maybe getting rid of the fridge would help[else]The way east is clear with the frightening fridge gone[end if][if boring boat is moot]. There's just the memory of how violent it was, but maybe you can change that[else if silent-sale is true]. It's not really violent here at all any more[end if]."

silent-sale is a truth state that varies.

check going east in Violent Vale: if frightening fridge is not moot, say "Not with the frightening fridge blocking the way!" instead;

chapter frightening fridge

the frightening fridge is scenery in Violent Vale. cht of frightening fridge is leteq. "It's really scary, darkening everything around by virtue of being fifteen feet tall. It's probably packed with spoiled and/or 'seriously, kid, it'll help you grow' food, too."

check opening frightening fridge: say "You're scared to. There must be a better way to get rid of the fridge." instead;

chapter flooring float

the flooring float is a thing. cht of flooring float is letminus. "A flooring float bobs here.".

check taking flooring float: say "It's too heavy, and you can't take it anywhere. Maybe some other watercraft, though." instead;

chapter boring boat

the boring boat is a thing. "A boring boat is docked here. Perhaps you could ENTER it to see a new place.".

check taking boring boat: try entering boring boat instead;

check going inside when player is in violent vale:
	if boring boat is touchable, try entering boring boat instead;
	if flooring float is touchable, try entering flooring float instead;

this is the boat-drift rule:
	if beer bull is moot and jake g is moot:
		say "[line break]After a moment, the boring boat floats off, its job likely done.";
		moot boring boat;
	the rule succeeds;

nap-no is a truth state that varies.

boat-reject is a truth state that varies.

check entering boring boat:
	if nap-no is false:
		say "You try to enter the boat, but it seems so ... boring. Perhaps if you had some jaunty nautical tune stuck in your head to whistle, that'd be better.";
		now boat-reject is true;
		the rule succeeds;
	if player is in Been Buggin':
		if player does not have way woke clay cloak, say "You have not properly passed all the tests you need to return and defeat the Beer Bull." instead;
		say "With your way woke clay cloak in hand, you return to [Violent Vale]. The boring boat floats off, its job likely done.";
		moot boring boat;
		move player to violent vale;
		abide by the boat-drift rule;
		the rule succeeds;
	if player is in lake lea:
		say "You take the boring boat back to [Violent Vale].";
		move boring boat to violent vale;
		move player to violent vale;
		the rule succeeds;
	if player has clay cloak, say "The boat shouldn't be here, but you don't need it any more." instead;
	if player has cake cap:
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
	if jake-woke is false, say "You have a feeling you may need Jake G.'s guidance.";
	if jake-fee is false, say "You haven't fully negotiated with Jake G. yet." instead;

Jake G is a person in Lake Lea. "Jake G [if jake-woke is false]dozes here[else if jake-tea is false]seems to be waiting to give you hospitality[else if jake-fee is false]seems to want payment, but not really[else]paces back and forth here[end if].". talk-text of Jake G is "Achy! Make me!'"

jake-woke is a truth state that varies.
jake-tea is a truth state that varies.
jake-fee is a truth state that varies.
jake-brie is a truth state that varies.

part Whining War 2,1

Whining War is east of Violent Vale. It is in Piddling Pain. "[if shore-shine is false]You can't get a close enough view of the war, but you can sure hear it.[else]It's quieter and brighter here now than when you started. Yay![end if]". cht of whining war is partplus. [-> shining shore]

[?? SO SAPPIN here to get rid of people]
[?? mining more to reveal riches people might be happy with]
[shining shore, oh, it is a nice place now!]
[Lining, Lor'! Fining Four: well, it's a weird name, but if you whined about it, that might cause another whining war.]
[mild mead from Bull Beast will help them do something. The Bull Beast's carcass as well. Once you have the big party, it is all over.]

[??mining more / dining door]

war-sapped is a truth state that varies.

mine-more is a truth state that varies.

dine-door is a truth state that varies.

shore-shine is a truth state that varies.

part Lake Lap ??,??

Lake Lap is east of Lake Lea. It is in Piddling Pain.

jake-cocapn is a truth state that varies.
jake-snap is a truth state that varies.
jake-map is a truth state that varies.

part Been Buggin'

Been Buggin' is a room in Piddling Pain. cht of Been Buggin' is leteq.

Dean Duggan is a person in Been Buggin'.

mean-mugged is a truth state that varies.

lean-lugged is a truth state that varies.

to decide whether dean-done:
	if mean-mugged is true and lean-lugged is true, yes;
	no;

part Soft Sand 0,2

Soft Sand is a room in Piddling Pain. Soft Sand is north of Creased Cross. cht of soft sand is leteq. "You can go all four directions here. [soft-or-loft].". [-> loft land]

printed name of Soft Sand is "[if loft-land is true]Loft Land[else]Soft Sand[end if]".

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
	if player has gold guard and beer bull is moot:
		say "As you go east, the Gear Gull inspects your mold-marred gold guard. 'I can do something now.'";
		buff-gold-guard;
		the rule succeeds;

part Here Hull 1,2

Here Hull is east of Soft Sand. It is in Piddling Pain. "You can go back east to Soft Sand here."

gull-guard is a truth state that varies.

to buff-gold-guard:
	say "[line break]The Gear Gull breaks out some polish. It doesn't just remove the mold but thickens the gold guard without making it heavier. You smile, but the Gear Gull says, 'I can only make the gold guard so strong. There are materials that can do more. You must find them to be able to reach your goal.[wfak]";
	now gull-guard is true;
	move player to Soft Sand;

check going west in here hull:
	if bull-null is false and in-bull-chase is true:
		say "The bull is too fast and strong. It tears you up. Maybe there was some way to weaken it. At least it slinks back to where it was, maybe saving another beating for later.[paragraph break]";
		reset-bull-chase;
		the rule succeeds;

The Beer Bull is a person in Here Hull. cht of beer bull is partminus. talk-text is "It can't speak, but its look says 'Real rude? Deal, dude!'". [->fear ful]

bull-null is a truth state that varies.

in-bull-chase is a truth state that varies.

to decide whether hull-bull:
	if player is in Here Hull or beer bull is in location of player, yes;
	no;

to reset-bull-chase:
	say "You limp [if player is in creased cross]around[else]back to[end if] Creased Cross.";
	move player to Creased Cross;
	move beer bull to here hull;
	now in-bull-chase is false;
	now bull-from is Here Hull;

bull-from is a room that varies. bull-from is Here Hull.

every turn when in-bull-chase is true:
	if beer bull is not in location of player:
		if location of player is bull-from:
			say "The beer bull catches you doubling back!";
			reset-bull-chase;
			the rule succeeds;
		say "The beer bull follows you.";
		now bull-from is location of beer bull;
		move beer bull to location of player;

to start-bull-chase:
	now in-bull-chase is true;

chapter fearfuling

fearfuling is an action applying to nothing.

understand the command "fearful" as something new.

understand "fearful" as fearfuling when hull-bull.

fearful-ever is a truth state that varies.

carry out fearfuling:
	if fearful-ever is false:
		now fearful-ever is true;
		up-reg;
	now cht of beer bull is leteq; [beer bull->dear dull]
	say "The beer bull snorts and begins to follow you.";
	now fearful-on is true;
	the rule succeeds.

fearful-on is a truth state that varies.

part Shirk Shell -1,2 a

Shirk Shell is west of Soft Sand. IT is a room in Piddling Pain. "You feel like there's not a lot to do here in the Shirk Shell. Nothing to do except go back east, in fact."

check going east in shirk shell: if player has jerk gel, say "A smirk smell erupts in Shirk Shell. You don't want or need to go back.";

the tube of jerk gel is a thing in Shirk Shell. "A slightly leaky tube of Jerk Gel lies here. It doesn't seem trivial to take, but maybe it will come in handy."

understand "glowing/globs" and "glowing globs" as jerk gel when player has jerk gel.

check taking jerk gel when jerk gel is in Shirk Shell:
	say "The jerk gel has spilled out a bit." instead;

part Curst Cave -1,2 b

Curst Cave is a room in Piddling Pain. "You can only go back east[tap-in-cave][if worst wave is in curst cave]. A worst wave rushes about, leaving you feeling terrible[end if]."

the worst wave is scenery in Curst Cave.

the screaming skull is a thing in Curst Cave.

check taking screaming skull: say "You need to 'take' it figuratively." instead;

to say tap-in-cave:
	if tool tap is in Curst Cave, say ". A tool tap sits where the worst wave used to be[if cool cap is not off-stage], but you already got something from it[else], and you haven't gotten anything interesting from it yet[end if]"

the tool tap is scenery.

the cool cap is a gaphat.

first-fave is a truth state that varies.

part Foe Field So Sealed 0,3

Foe Field So Sealed is a room in Piddling Pain. It is north of Soft Sand. printed name is "Foe Field[if shield-shown is false] So Sealed[end if]". "[if shield-shown is false]You detect a presence blocking you from going north, but[else]You removed the impediment north, and[end if] you can still go west to a quieter, darker area, or back south. You could even try your luck east."

check going north in Foe Field So Sealed: if shield-shown is false, say "A booming voice calls 'YO! YIELD!' You need to find a way to protect yourself from it." instead;

chapter showshielding

shield-shown is a truth state that varies.

part Store All Stage -1,3

Store All Stage is a room in Piddling Pain. It is west of Foe Field.

the coral cage is a thing in Store All Stage.

volume Vale Verminous

part Gassed Gap 0,4

Gassed Gap is a room in Vale Verminous. "[if Reeker Russell is off-stage]It looks like there should be a way to the north, but it's too hazy. You may need to do something to break things up[else]There's a way to the north, now that you cast your cap[end if]."

Gassed Gap is north of Foe Field. cht of gassed gap is partminus. [-> last lap]

printed name of Gassed Gap is "[if cap-cast is true]Last Lap[else]Gassed Gap[end if]".

cap-cast is a truth state that varies.

gap-go is a truth state that varies.

check going north in Gassed Gap:
	if Reeker Russell is off-stage, say "Oh, it's much too intimidating[if gap-go is true], even though you have a courageous song in your head[end if]." instead;
	if Reeker Russell is in Gassed Gap, say "Not with Reeker Russell around." instead;
	if gap-go is false, say "You whistle in fear. You need some sort of motivation." instead;
	unless evidence-pieces is 3, say "You aren't armed with enough evidence to take down the Very Vile Fairy File." instead;
	say "You review the evidence you have and take a deep breath. The backed binder, revealing the worst of the VVFF's ideas. [We Whine] and its examples of how such meanness affects everyday people. The lessons from the Moral Mage. You understand the VVFF. You can resist. You're not going to give up in this last bit.";

to decide which number is evidence-pieces:
	if debug-state is true, say "Binder: [whether or not player has binder] Hata: [sign-seen] Mage: [whether or not coral cage is moot].";
	decide on boolval of sign-seen + boolval of (whether or not player has backed binder) + boolval of (whether or not coral cage is moot);

[?? trusty tap / crusty cap]

extra-cool-cap is a truth state that varies.

chapter Reeker Russell

Reeker Russell is a person. Reeker Russell carries the good gun. "Reeker Russell is blocking the way north.". talk-text is "'My mood: DIE, dude!'".

to decide which number is russell-progress:
	decide on boolval of meeker-yet + boolval of whether or not good gun is moot;

to check-russell-go:
	if russell-progress is 2:
		say "Russell flees!";
		moot Reeker Russell;
		if beaker-yet is false, max-down;
	else:
		say "Russell looks confused! One more setback, and he's had it.";

beaker-yet is a truth state that varies.

meeker-yet is a truth state that varies.

part Airy Isle 0,5

Airy Isle is north of Gassed Gap. It is in Vale Verminous. "You hear laughter here, but it's all wrong. You could back out to the south, but you sense you must be very close to the Very Vile Fairy File now.". noway-text is "The Fairy File's presence makes you bump into walls figuratively. Let's not to so literally."

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

the Bot Board are plural-named people in Airy Isle. . talk-text is "Meep, mate! Heap hate! Weep, wait!"

the Lot Lord is a person. talk-text is "'Eeg, not ig-nored.' Ugh?".

the Hot Horde are plural-named people. talk-text is "Lots of rot roared right now.".

book go gate

there is a thing called the go gate. "A go gate stands here. You can just walk through it ... or can you?". description is "The go gate isn't just one piece. On further inspection, you see a grow grate.". the go gate is two-too. cht of go gate is partplus. [->whoa wait]

check taking go gate: try entering go gate instead.

check entering go gate:
	say "Too fast. Boom! The grow grate pops up and crushes you. 'Lo, late! Foe, fate!' a voice says, and your last thought is, 'Ho, hate!'[paragraph  break]Today is definitely a ... d'oh date.[paragraph break]Maybe you should have expected that. Perhaps you need to be more circumspect.";
	end the story;

the grow grate is part of the go gate. description is "The grow grate looks like it could spring up at any time.". cht of grow grate is partminus. [->whoa wait] [?? what if there are homonyms: two too?]

part Tarry Tile 1,5

Tarry Tile is a room in Vale Verminous. printed name is "[if merry-mile is true]Merry Mile[else]Tarry Tile[end if]". noway-text is "No. Your destiny is here. You must deal with the Very Vile Fairy File, once and for all."

chapter well worn hell horn

the well worn hell horn is a boring thing in Tarry Tile. cht of well worn hell horn is leteq. "A well worn hell horn balefully drones out dirgeful noises that makes you wonder why you should even bother.". description is "The well worn hell horn looks old, but still in good shape. At least with a cursory glance. But maybe there is a flaw.". bore-text of well worn hell horn is "It ... well, it looks used, but it still hasn't fallen apart.".[-> tell torn]

chapter Very Vile Fairy File

the Very Vile Fairy File is a boring thing in Tarry Tile. "The Very Vile Fairy File sort of repels you and attracts you at the same time. You know there must be a way to neutralize it. It is co-written by, unsurprisingly, Harry Hile, Larry Lyle, Perry Pyle and Sherry Shiel[one of]. They must be the Crimes Crew Times Two that Kit Cohen talked about! There's an even number of them, so that part works out[or][stopping]. You may or may not be up to READing it[ever-tried of table of vvff digs].". cht of very vile fairy file is partminus. bore-text of Very Vile Fairy File is "[ff-no].". [-> bury bile]

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

chapter wearing

check wearing a gaphat: say "Somehow, [the noun] isn't quite right to WEAR around. You will probably reflexively slip it on for the right occasion." instead;

chapter singing

the block singing rule is not listed in any rulebook.

check singing:
	if toe tappin is moot, say "You have fond memories of the tunes [Toe] opened to you. It and the others are worth writing down when you get home, when you're not quite as tired of it. But you've done enough." instead;
	if player does not have Toe Tappin, say "Nothing comes to mind. But perhaps the right song, if found, might help you in many ways." instead;
	if nap-no is false, say "[Toe] bounces in your head, making you feel a little more awake. But maybe you can do better!" instead;
	if gap-go is false and player is in Gassed Gap, say "You sing a song, internally, about passing the gap to the north." instead;
	if jake-fee is true and jake-cocapn is false, say "You conjure up a song about you and Jake being cemented as equals." instead;
	if maze-mapped is false and player is in blinding blaze and blaze-maze is true, say "You whistle a tune about going through the maze. It makes the usual boring methods seem more interesting." instead;
	if player is in whining war and war-sapped is false, say "You whistle a tune about not wanting to complain any more, because it's too exhausting." instead;
	say "[Toe] bounces around in your head but offers no new possibilities." instead;

sing-clues is a number that varies.
sing-max is a number that varies. sing-max is 5.

this is the check-sing-max rule:
	increment sing-clues;
	if sing-clues is sing-max:
		say "Suddenly, [Toe] feels played out. You'll enjoy it later, but not now. It's done its job, and it's out of your mind, for the moment.";
		moot Toe Tappin Row Rappin;

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

after printing the name of jerk gel while taking inventory: say " (glowing globs)";

after printing the name of We Whine while taking inventory: if sign-seen is true, say " (in which you can SEE SIGN)"

check taking inventory:
	if player has big bag, say "Boy! You can carry all you need with your big bag![paragraph break]";
	now all things enclosed by the player are marked for listing;
	now toe tappin is unmarked for listing;
	now all gaphats are unmarked for listing;
	now big bag is unmarked for listing;
	say "Stuff stole (rough role):[line break]";
	list the contents of the player, with newlines, indented, including contents, giving inventory information, with extra indentation, listing marked items only;
	if number of gaphats carried by player > 0, say "You are also carrying a [if number of carried gaphats < 3]budding[else]complete[end if] hat collection: [list of gaphats carried by player].";
	if player has toe tappin, say "Toe Tappin Row Rappin['], that catchy song, is in your head. It has ... possibilities. [toe-poss].";
	if coral cage is moot, say "You also carry within you lessons of the Very Vile Fairy File from the moral mage.";
	the rule succeeds;

to say toe-poss:
	say "[if sing-clues is 0]The title just seems so fungible[else if sing-clues is 1]Yes, beyond what you found to start[else if sing-clues is 2]Even more than what you've seen[else if sing-clues is 4]Well, maybe just one more[end if]"

check taking when player does not have big bag:
	if number of things enclosed by the player > 3:
		say "You can't carry so much at once! ";
		if tried-yet of "BIG BAG":
			say "Perhaps now is a good time to change the zig zag rig rag to a big bag, as you tried before." instead;
		say "Maybe you can finagle, or create, a container that'll let you hold as much as you want." instead;

chapter undoing

report undoing an action:
	say "Woo! Wiping one's typing!";
	the rule succeeds;

chapter trivial pointless but amusing verbs

the block attacking rule is not listed in any rulebook.

check attacking:
	if noun is go gate, say "Ho! Hate!" instead;
	if noun is Reeker Russell, say "But he'd become Rager Russell. With major muscle." instead;
	say "Gauge gore: wage war! Rage! Roar![one of] (NOTE: you don't need to attack anything. Well, not with the ATTACK command.)[or][stopping]"

the block saying no rule is not listed in any rulebook.

check saying no: say "No-no? Hoho, dodo! [yn-tell]" instead;

the block saying yes rule is not listed in any rulebook.

check saying yes: say "Yay! Yep! Hey, hep! [yn-tell]" instead;

to say yn-tell: say "[one of](you never need to answer yes/no questions unless specifically prompted.)[or][stopping][paragraph break]"

the block swearing obscenely rule is not listed in any rulebook.

check swearing obscenely: say "Gee, gad! Be bad! 'Me, mad!'" instead;

the block swearing mildly rule is not listed in any rulebook.

check swearing mildly: try swearing obscenely instead;

chapter listening

the block listening rule is not listed in any rulebook.

check listening:
	if player is in Wet Wood, say "'Bet, bud! Met mud!' That sounds a bit off, but ... perhaps it can help you in some odd way beyond just going in random directions." instead;
	if player is in History Hall and mistmall is true:
		if Toe Tappin Row Rappin is in History Hall, try examining Row Rappin instead;
		if Oi Mo is in History Hall, say "Tim T. Sims, Pimp, still 'sings' [i]Oi, Mo[r]. The chorus mentions double duty, which, eww. Maybe there's a way to quiet it down." instead;
		say "A random song plays briefly: [next-rand-txt of table of mall songs]." instead;
	say "Nothing special."

chapter thinking

ever-thought is a truth state that varies.

the block thinking rule is not listed in any rulebook.

check thinking:
	let thought-any be false;
	say "Here's general information you know from your experience so far: [rhyme-display][line break]You think about more specific challenges you've encounterd and not solved, and what you've done and tried, and what you can do.";
	repeat through table of forlaters:
		if ready-to-hint entry is true:
			process the is-done entry;
			if the rule succeeded:
				now ready-to-hint entry is false;
				next; [ this may be duplicate code in score and thinking changes rules but I'm a bit nervous about it at the moment, and this shuts the door 100%. Test later with this gone if I have time. ]
			now thought-any is true;
			consider the can-do-now entry;
			if the rule succeeded, say "(CAN DO NOW) ";
			say "[think-advice entry][line break]";
	if thought-any is false, say "[line break]But you don't have leads for any puzzles right now." instead;
	if ever-thought is false:
		now ever-thought is true;
		say "[line break]NOTE: The game will indicate when one command you found early will be applicable. An asterisk or (+) will also appear in the score in the upper right. Until then, you can THINK or type SCORE to see things you figured but aren't quite ready to do yet.";
	if boat-reject is true and nap-no is true and lake lea is unvisited, say "[line break]You also feel up to going back to the boring boat.";
	if number of optional-noted things > 0:
		say "You also know several things that are optional to figure out: [list of optional-noted things].";

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

to clue-later-w (ct - text):
	clue-later ct;
	process the note first think rule;

to clue-later (ct - text):
	now first-think-clue-flag is true;
	repeat through table of forlaters:
		if ct is cmd-to-say entry:
			if debug-state is true and ready-to-hint entry is true, say "(re-checking)[line break]";
			now ready-to-hint entry is true;
			continue the action;
	say "Oops. I tried to save something in the THINK command for later, but failed. This is a bug I need to know about. Text = [ct].";

first-think-clue-flag is a truth state that varies.
ever-think-flag is a truth state that varies.

every turn when first-think-clue-flag is true and ever-think-flag is false (this is the note first think rule):
	if ever-think-flag is false, say "[line break][b]NOTE[r]: this is the first time you guessed a command right but aren't ready to use it, yet. These commands will be tracked under [b]THINK[r], with clues as to when they work.";
	now ever-think-flag is true;
	continue the action;

chapter score

check requesting the score:
	say "You have scored a total of [score] out of [maximum score] points in [turn count] moves. You have found [min-gotten] optional points so far and need [min-needed] to win.";
	say "[line break]Your current[one of] (utterly meaningless but hopefully amusing)[or][stopping] rank is [your-rank].";
	let dh be doable-hinted;
	let fh be future-hinted;
	if dh + fh > 0, say "[line break]You also have [dh + fh in words] task[plur of dh + fh] you performed when you weren't quite ready. [if dh is 0][fh in words] still need[plur of fh] to wait[else if fh is 0][dh in words] can be done now[else][dh in words] can be done now, but [fh in words] can't, yet[end if]. You can see more detailed information with THINK.";
	if lurking lump is not off-stage:
		let gguess be next-lump-level - lump-count;
		say "[line break]You have also used the lurking lump [lump-uses] time[plur of lump-uses] and are [gguess] of [next-lump-level] good-guess rhyme[plur of gguess] way from it re[if lurking lump is moot]turn[else]charg[end if]ing.";
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
	repeat through table of readables:
		if read-thing entry is noun, say "[read-txt entry][line break]" instead;
	if read-exam-note is false, say "NOTE: READ and X/EXAMINE are functionally equivalent for most items. Items you can [b]READ[r] usually say so when you examine them.";
	now read-exam-note is true;
	try examining the noun instead;

table of readables
read-thing	read-txt
Very Vile Fairy File	"You note one book is [i][next-rand-txt of table of vvff digs][r]."
leet learner	"Some multi-colored text on the leet learner (itself written in yellow) seems to function as examples. Some seem like a bit of a stretch, but they're probably there to help.[paragraph break][table-of-color-hints][run paragraph on]"
marred mat	"SCARRED? SCAT.[paragraph break]Hmm. Not very welcoming. In another form, it might repel other things more usefully."

to say table-of-color-hints:
	repeat through table of color clues:
		say "[fixed letter spacing][my-text entry][variable letter spacing] is inscribed in [my-color entry]."

table of color clues
my-text	my-color
"   LEET LEARNER  "	"white"
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
	say "[one of]NOTE: More obscure verbs from old-school parser games have been disabled, to help you focus on the puzzles.[paragraph break][or][stopping]";
	say "[2da]You can use the general directions, but you often have to figure out what to do, here. It's a guess the verb situation, but not really.";
	say "[2da][b]HELP HOW[r] and [b]WELP WOW[r] toggle the [b]HINT[r] command on and off, respectively. Currently they are [on-off of help-how]. [b]HINT[r] with no object tells you if you need to do anything with the room, while [b]HINT[r] (object) looks at specific objects.";
	say "[2da]The Leet Learner can help you determine what needs to be changed. [ll] or [b]CC[r] is the shorthand for scanning a location, and [ll] or [b]CC[r] (any thing) scans it.";
	say "[2da][llon-cmd] turn the Leet Learner on while [lloff-cmd] turn it off. Currently it is [on-off of shut-scan]. You can also use it to tweak other clues with [b]TWO TOO[r]/[b]DO DUE[r] or [b]HA HALF[r]/[b]NAH NAFF[r].";
	if player has Toe Tappin, say "[2da]You can also [b]SING[r] [Toe Tappin] to see if it might be useful, as a small clue.";
	if lurking lump is not off-stage, say "[2da]You can [jjj] to use the Lurking Lump spoiler item[if lurking lump is moot] once you get it back[end if].";
	say "[2da][b]EXITS[r] lists exits available.";
	the rule succeeds.

to say jjj: say "[b]JJ[r] or [r]JERKING JUMP[r]"

chapter creditsing

creditsing is an action out of world.

understand the command "credits" as something new.

understand "credits" as creditsing.

carry out creditsing:
	say "First, thanks to Wade Clarke and Arthur DiBianca for testing. The help you get in this game is largely due to their requests, prodding and awesome tries and plowing on in the face of some pretty obvious bugs. Testers always see things I would not have, and though sometimes it means extra work, well--my bugs caused them extra work, and it's quite absorbing and rewarding and helps me grow as a programmer and game designer. It helps writing be an adventure.";
	say "Thanks to github for hosting private repositories that helped keep VVFF hidden.";
	say "Thanks to the IFComp crew past and present for giving me motivation to write all kinds of odd things.";
	say "Thanks to https://www.thoughtco.com/sounds-in-english-language-3111166 for giving me a list of sounds to cycle through.";
	the rule succeeds;

chapter abouting

abouting is an action out of world.

understand the command "about" as something new.

understand "about" as abouting.

carry out abouting:
	say "Very Vile Fairy File came about after I noticed alliterative rhymes and thought, neat, how many are there? As someone who pokes around with spoonerisms, I was looking for a variant, and I think I found it after unintentionally scrambling 'Very Fine Fairy Vine.' No progress without deviation, as Frank Zappa said.[paragraph break]It seemed like VVFF would, at first, make a nice short EctoComp game at first until I dug deeper. I don't know when I first had the idea, but once I had the name, things picked up. My daily notes suggest it started gaining momentum in June of 2018.[paragraph break]I wanted a reasonably intuitive game mechanic that still made use of the parser, though I recognize the spelling for some of the commands may be tricky. I hope the alliterative rhymes are interesting and amusing.[paragraph break]OTHERS will list games that used this concept first. But I hope this is something new and does not abuse the concept. Well, not TOO much.";
	say "[line break]VVFF is overall meant to be family friendly, although there is one bonus point for using a minor pejorative, and if you deliberately look for crude non-solutions, some are implemented. (And if I haven't, let me know.) VVFF is also meant to be polite on the Zarfian cruelty scale.";
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

the leet learner is a thing. description is "It says [b]CHEAT CHURNER[r] in green letters. You can probably [b]READ[r] it more in depth, because, well, there's more.[paragraph break]It has two main settings: [b]HUT! CAN![r] (on) and [b]SHUT SCAN[r] (off). It's currently [off-on of shut-scan]. [ll]/[b]CC ON[r]/[b]OFF[r] can turn it on or off.[paragraph break]Also, to use it, [ll] (something). [ll] with no argument scans the current location.[paragraph break]Other minor settings include two toggles, between [b]TWO TOO[r] (on) and [b]DO DUE[r], and another between [b]HA HALF[r] (on) and [b]NAH NAFF[r]. [b]TWO TOO[r] is currently set to [on-off of too-two]. [b]HA HALF[r] is currently set to [on-off of ha-half]."

understand "cheat/churner" and "cheat churner" as leet learner.

after printing the name of leet learner while taking inventory: say " ([off-on of shut-scan])";

understand "ll" and "cc" as leet learner.

too-two is a truth state that varies.

ha-half is a truth state that varies.

when play begins: [?? put this somewhere better]
	now too-two is true;
	now ha-half is true;

chapter tootwoing

tootwoing is an action applying to nothing.

understand the command "too two" as something new.

understand "too two" as tootwoing.
understand "two too" as tootwoing.
understand "tt" as tootwoing.

carry out tootwoing:
	say "[if too-two is true]The Leet Learner is already set[else]You set the Leet Learner[end if] to Too-Two.";
	now too-two is true instead;

chapter dodueing

dodueing is an action applying to nothing.

understand the command "do due" as something new.

understand "do due" as dodueing.
understand "due do" as dodueing.
understand "dd" as dodueing.

carry out dodueing:
	say "[if too-two is false]The Leet Learner is already set[else]You set the Leet Learner[end if] to Do Due.";
	now too-two is false instead;

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

ever-two-too is a truth state that varies.

carry out lling:
	if player does not have the leet learner, say "Regular hints aren't available." instead; [this should not happen]
	if noun is leet learner, say "The leet learner is great as it is. You don't want to change it." instead;
	if cht of noun is phbt, say "The leet learner turns up nothing scanning [the noun]." instead;
	if noun is ceiling seer:
		say "You don't know where the ceiling seer is, exactly, so you just scan the whole [location of the player].";
		try lling location of player instead;
	if noun is peeling pier and healed-here is false, say "It seems like the leet learner is registering something everywhere except on the peeling pier, here." instead;
	say "The leet learner light turns [if noun is optional]faint[else]solid[end if]ly [scancol of cht of noun] as you [if noun is a room]wave it around[else]focus it on[end if] [the noun].";
	if noun is optional and ever-opt-scan is false:
		say "[line break]The faint light must mean something. The learner is usually lit solidly or not at all.";
		now ever-opt-scan is true;
	if noun is two-too, say "[line break]The 'two too' light on the Leet Learner also appears[two-too-yet].";
	the rule succeeds.

report lling:
	if noun is We Whine and sign-seen is false, say "[line break]Well, it's a bit of a yellowish-brown, actually.";

to say two-too-yet:
	if ever-two-too is false, say ". Hmm. You have a good idea what that means";
	now ever-two-too is true;

to say leetclue of (x - a cheattype): if shut-scan is false, say "[line break]As you say/think this, the Leet Learner momentarily turns [scancol of x]."

to say scancol of (x - a cheattype): say "[if x is letplus]blue[else if x is partplus]green[else if x is leteq]yellow[else if x is partminus]orange[else if x is letminus]red[else if x is letboth]brown[else if x is phbt]undefined[else]BUG[end if]"

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

carry out hinting:
	abide by the welp-wow-check rule;
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
		say "[one of]You need to look a bit tougher, since you've been buggin['].[or]You need to change your facial expression.[or]Change your facial expression with [b]MEAN MUGGIN[r].[stopping]";
	else:
		say "[one of]You need to be able to carry more weight.[or]You need to be stronger and, not quite thinner, but ...[or]...leaner.[or]LEAN LUGGIN.[stopping]";
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
	say "The Fun Fen is a busy place, but there's nothing you need to do to it in general.";
	the rule succeeds.

this is the gassed-gap-hint rule:
	if cool cap is moot, the rule fails;
	if player does not have cool cap:
		say "You don't have what you need yet to change the Gassed Gap.";
	else:
		say "[one of]You need to put forth a challenge.[or]You don't have a gauntlet to throw down, but you have something else.[or]You have a cap.[or]CAST CAP.[stopping]";

this is the got-gear-hot-here-hint rule:
	say "?? fill in.";
	the rule fails. [??not near]

this is the here-hull-hint rule:
	if beer bull is moot, the rule fails;
	say "You can do something with the beer bull, so HINT BEER BULL for that.";

this is the history-hall-hint rule:
	if ever-mall is true:
		say "You can pretty much twiddle the Mystery Mall and History Hall as you want.";
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

section debug check - not for release

when play begins:
	let hint-idx be 0;
	repeat with Q running through rooms:
		if map region of Q is poorly penned or map region of Q is Get a Guess, continue the action;
		if room-hint-rule of Q is trivially false rule:
			increment hint-idx;
			say "[hint-idx]. You need to specify room-hint-rule for [Q].";
	say "[if hint-idx > 0][hint-idx] room hint[plur of hint-idx] to implement[else]All room hints implemented[end if].";

chapter hinting an object verb

hintobjing is an action applying to one thing.

understand "hint [thing]" as hintobjing.
understand "help [thing]" as hintobjing.

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
the thing-hint-rule of Bot Board is bot-board-hint rule.
the thing-hint-rule of cache cap is cache-cap-hint rule.
the thing-hint-rule of cage key is cage-key-hint rule.
the thing-hint-rule of Cark Cliff is cark-cliff-hint rule.
the thing-hint-rule of cool cap is cool-cap-hint rule.
the thing-hint-rule of coral cage is coral-cage-hint rule.
the thing-hint-rule of Dean Duggan is dean-duggan-hint rule.
the thing-hint-rule of done den is done-den-hint rule.
the thing-hint-rule of FIND FEE is find-fee-hint rule.
the thing-hint-rule of frightening fridge is frightening-fridge-hint rule.
the thing-hint-rule of gash gap is cache-cap-hint rule.
the thing-hint-rule of go gate is go-gate-hint rule.
the thing-hint-rule of gold guard is gold-guard-hint rule.
the thing-hint-rule of good gun is good-gun-hint rule.
the thing-hint-rule of GOTS GAME is gots-game-hint rule.
the thing-hint-rule of grow grate is grow-grate-hint rule.
the thing-hint-rule of Gutta Ganksta is gutta-ganksta-hint rule.
the thing-hint-rule of ha half nah naff is ha-half-nah-naff-hint rule.
the thing-hint-rule of hit hound is hit-hound-hint rule.
the thing-hint-rule of hive heap is hive-heap-hint rule.
the thing-hint-rule of Hot Horde is bot-board-hint rule.
the thing-hint-rule of jerk gel is jerk-gel-hint rule.
the thing-hint-rule of Kerry Kyle is kerry-kyle-hint rule.
the thing-hint-rule of leet learner is leet-learner-hint rule.
the thing-hint-rule of Lending Libe is lending-libe-hint rule.
the thing-hint-rule of Lot Lord is bot-board-hint rule.
the thing-hint-rule of lurking lump is lurking-lump-hint rule.
the thing-hint-rule of marred mat is marred-mat-hint rule.
the thing-hint-rule of mean mass is mean-mass-hint rule.
the thing-hint-rule of mild mead is mild-mead-hint rule.
the thing-hint-rule of mind malt is mind-malt-hint rule.
the thing-hint-rule of Name Notes Tame Totes is name-notes-tame-totes-hint rule.
the thing-hint-rule of Oi Mo by Tim T Sims Pimp is oi-mo-hint rule.
the thing-hint-rule of Pain Peasant is pain-peasant-hint rule.
the thing-hint-rule of paper pile is paper-pile-hint rule.
the thing-hint-rule of peeling pier is peeling-pier-hint rule.
the thing-hint-rule of prong part is prong-part-hint rule.
the thing-hint-rule of Reeker Russell is reeker-russell-hint rule.
the thing-hint-rule of row writ is row-writ-hint rule.
the thing-hint-rule of Sage Sea is sage-sea-hint rule.
the thing-hint-rule of screaming skull is screaming-skull-hint rule.
the thing-hint-rule of steel steer is steel-steer-hint rule.
the thing-hint-rule of tall tree is tall-tree-hint rule.
the thing-hint-rule of Toe Tappin Row Rappin is toe-tappin-row-rappin-hint rule.
the thing-hint-rule of tool tap is tool-tap-hint rule.
the thing-hint-rule of trash trap is cache-cap-hint rule.
the thing-hint-rule of trending tribe is trending-tribe-hint rule.
the thing-hint-rule of two too button is two-too-hint rule.
the thing-hint-rule of vapor vile is vapor-vile-hint rule.
the thing-hint-rule of Very Vile Fairy File is very-vile-fairy-file-hint rule.
the thing-hint-rule of well worn hell horn is well-worn-hell-horn-hint rule.
the thing-hint-rule of wild weed is wild-weed-hint rule.
the thing-hint-rule of worst wave is worst-wave-hint rule.
the thing-hint-rule of wrong art is wrong-art-hint rule.
the thing-hint-rule of wry wall is wry-wall-hint rule.
the thing-hint-rule of zig zag rig rag is zig-zag-rig-rag-hint rule.

[
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
]

[??styled steed]

section thing hint rules [xxthr] [??general problems with what if you already know a certain command and the hints may not know this]

this is the backed-binder-hint rule:
	say "[one of]The backed binder is not useful immediately. But it can gain evidence.[or]It will accumulate evidence as you walk through. Once you have enough, you can deal with more major bosses.[stopping]" [?? too general]

this is the beer-bull-hint rule:
	say "Say FEARFUL to get the beer bull going, then DEAR DULL after it chases you to the whining war."

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

this is the cool-cap-hint rule:
	say "[one of]The cool cap is useful in one specific place[or]You need to throw down the gauntlet, or something like it, somewhere[or]There is one place that rhymes with cap[or]You can do something with the cap[here-in of Gassed Gap][or]CAST CAP [here-in of Gassed Gap][stopping]."

this is the coral-cage-hint rule:
	if player does not have cage key:
		say "You don't have the key you need yet. Look for something that rhymes with key.";
	else:
		say "[one of]You need to call out the denizen of the coral cage.[or]What sort of person could be in there?[or]*ORAL *AGE is likely, according to the Leet Learner.[or]MORAL MAGE.[stopping]";

this is the dean-duggan-hint rule:
	say "[one of]Dean Duggan is an integral part of Been Buggin[']. So hints about him are hints about Been Buggin['].[or][stopping]";
	process the been-buggin-hint rule;

this is the done-den-hint rule:
	say "You don't need to go back through the done den. There are not even any extra points."

this is the find-fee-hint rule:
	say "[one of]The FIND FEE makes you feel as though you need to pay, but you need to pay attention to yourself.[or]The leet learner scans orange, but the first word has to be *IND. So the second word must be very short indeed.[or]MIND ME.[stopping]"

this is the frightening-fridge-hint rule:
	say "[one of]The frightening fridge could be more cheery, and it could stop blocking your way.[or]BRIGHTENING BRIDGE.[stopping]"

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

this is the hit-hound-hint rule:
	say "[one of]The hit hound can smell fear. You can't really run or lash out at it.[or]You need to stand your ground or, figuratively...[or]You can SIT SOUND.[stopping]"

this is the hive-heap-hint rule:
	say "[one of]The hive heap has nothing on the surface, but maybe if you dig in...[or]Look way down into the hive heap...[or]DIVE DEEP.[stopping]"

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

this is the lending-libe-hint rule:
	say "Now that you have the Lending Libe, you can take whatever books you need."

this is the lurking-lump-hint rule:
	say "The lurking lump can be used to bypass any available local puzzle with [jjj]."

this is the marred-mat-hint rule:
	say "[one of]The marred mat is in Got Gear Hot Here, suggesting maybe it can become something you can wear.[or]What can you wear that rhymes with mat?[or]HARD HAT.[stopping]"

this is the mean-mass-hint rule:
	say "[one of]You need to make the mean mass into something much less harmful. Wholesome, even.[or]Maybe the mean mass can be changed to something you're missing on the outside. Something from nature.[or]The mean mass can become GREEN GRASS.[stopping]"

this is the mild-mead-hint rule:
	say "[one of]You can make the mild mead have a bit more kick, but you don't need to.[or]The mild mead can become a slightly harder drug.[or]WILD WEED.[stopping]";

this is the mind-malt-hint rule:
	say "The mind malt is just there to give another clue about weaknesses in the Vined Vault."

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

this is the prong-part-hint rule:
	say "[one of]The prong part is part of the wrong art, so future clues will refer you there.[or][stopping]";
	process the wrong-art-hint rule;

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

this is the two-too-hint rule:
	say "The two too button indicates that there may be an alternate homonym/spelling solution to a puzzle."

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

this is the wild-weed-hint rule:
	say "[one of]The point for the wild weed is truly optional and recreational and slang-based[or]There's one place that makes you feel nervous, but you can relax[or]The wild weed may help at Cark Cliff[or]You can SPARK SPLIFF[stopping]."

this is the worst-wave-hint rule:
	say "[one of]What is a rhyming opposite of worst?[or]In this case, the rhyming opposite of worst also changes 'wave' more favorably.[or]FIRST FAVE.[stopping]"

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
	if map region of rm is Worst Whew, no;
	if player is in Tarry Tile, no;
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

does the player mean gotothinging a thing carried by the player: it is unlikely.
does the player mean gotothinging a thing in location of the player: it is unlikely.

understand "go to [any known-to-player thing]" as gotothinging.
understand "goto [any known-to-player thing]" as gotothinging.
understand "gt [any known-to-player thing]" as gotothinging.
understand "gi [any known-to-player thing]" as gotothinging.
understand "go [any known-to-player thing]" as gotothinging.

carry out gotothinging:
	let Q be location of noun;
	if Q is Hidey House, say "Right now [the noun] is temporarily unavailable." instead;
	if noun is moot, say "Unfortunately, you tried to go to something that has been dealt with. Okay, it's fortunate you dealt with [the noun], but GT doesn't know where to go." instead;
	if noun is off-stage, say "Unfortunately, you tried to go to something that wasn't introduced to the game world yet." instead;
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

when play begins (this is the opening text rule):
	now the left hand status line is "West Wall";
	force-status;
	anonymously abide by the check-skip-intro rule;
	if debug-state is false, ask-screenread;
	say "You wouldn't have gone to Fall Fest if you hadn't gotten a free ticket. But of course, the ticket was the only thing that was free. Inside, super high food prices. Lots of noise. And, well, the sun always seeming to get in your eyes. But you still feel you might as well see everything.[paragraph break]And you do. Then off on the west edge, there's a wall. A wall west, if you will. 'Oh, man,' you think. 'Why did I bother?' Well, at least you didn't waste all afternoon watching football games you didn't care about. But you're still mumbling to yourself about how there must be something, anything interesting here. Then you feel a tap on your shoulder.[wfak]";
	say "[line break]'So, you want to get goin[']? Well, I might be able to help. I'm Kit Cohen.' You're just not in the mood for motivational nonsense right now, so you brush Kit off. Or try to.[wfak]";
	say "[line break]'No! Seriously! You managed to bawl best--well, the best of anyone I've seen today--so you get a chance at a tall test!'[paragraph break]'What sort of test?'[paragraph break]'The PALL PEST of CRAWL CREST!'[wfak]";
	say "[line break]And it's a big one. You look to Kit for help, but Kit shrugs.[wfak]";
	say "[line break]It approaches. It's about to touch you ...and reflexively you boom, 'GALL, guest!'[paragraph break]The pall pest stumbles back into the west wall, which crumbles. Kit Cohen applauds. 'Well done! You did it! I think you are the one ... the one to recover the Very Vile Fairy File from ... from ...'[wfak]";
	say "[line break]It takes a second for Kit Cohen to regain composure. 'The CRIMES CREW TIMES TWO.' Are you ready?[wfak]";
	say "[line break]You accept. You might as well. Kit guides you across the remains of the wall, before going off to the Set-So Inn with Rhett Rowan. You are left in ...";

when play begins (this is the score and status tweak rule):
	now max-poss is the maximum score;
	now the right hand status line is "[score][if doable-hinted > 0](+[doable-hinted])[end if]/[min-needed]-[max-poss]";
	now the left hand status line is "[location of the player]";
	now the turn count is 0;

when play begins (this is the backdrop and score seeding rule):
	seed-score-list; [this is in the table file]
	wall-refresh;

to wall-refresh: move the wry wall backdrop to all signable rooms;

mugged-first is a truth state that varies.

when play begins (this is the randomize all the things rule):
	if a random chance of 1 in 2 succeeds, now mugged-first is true;
	repeat through table of all randoms:
		sort tabnam entry in random order;

section when play begins - not for release

volume meta

book region and rooms

Gazy Gap is a room in Get a Guess. [crazy crap]

Hidey House is a room in Get a Guess. [mighty mouse: stuff that's only temporarily gone]

book meta verbs

check quitting the game: say "You say to yourself, not fully convinced, 'Best bit? Quest quit!'";

volume unsorted

The cake cap is a gaphat.

The silly sign is scenery. "The silly sign reads 'One of many by Willie Wines and Tillie Tines.'[line break][sign-dir]"

the way woke clay cloak is a thing. description is "It's unwearable in its current state and may just bog you down."

the clashing cloak is a thing. description is "It seems suited for more than just fashionable conflict, if you knew what to do."

chapter glowglading

in-so-sad is a truth state that varies.
in-so-saded is a truth state that varies.

the get-sad rule is listed after the notify score changes rule in the turn sequence rulebook.

this is the get-sad rule:
	if in-so-saded is false and in-so-sad is false and score >= 30:
		now in-so-sad is true;
		say "Suddenly, a terrible feeling comes over you. Everything feels pointless. You're sick of these silly rhymes. You feel so sad, mo['] mad.";
		now cht of the player is letplus; [so sad->glow glad]
	continue the action;

every turn when in-so-sad is true:
	say "So sad ... so sad ... you feel so depressed and upset. Maybe there's an easy way out of this, but you wouldn't feel accomplished. And if there's a hard way out of this, it's too hard.";

instead of doing something when in-so-sad is true:
	if action is procedural, continue the action;
	say "You can't. You just feel ... so sad. Mo['] mad.";

chapter staystronging

in-way-wrong is a truth state that varies.
in-way-wronged is a truth state that varies.

the get-wrong rule is listed after the notify score changes rule in the turn sequence rulebook.

this is the get-wrong rule:
	if in-way-wronged is false and in-way-wrong is false and score >= 20:
		now in-way-wrong is true;
		say "Everything feels pointless. You're sick of these silly rhymes. They feel way wrong, way wrong.";
		now cht of the player is letplus; [way wrong->stay strong]
	continue the action;

every turn when in-way-wrong is true:
	say "Way wrong ... way wrong ... you feel so depressed and upset. Maybe there's an easy way out of this, but you wouldn't feel accomplished. And if there's a hard way out of this, it's too hard.";

instead of doing something when in-way-wrong is true:
	if action is procedural, continue the action;
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

part Pit Pound 1,3

Pit Pound is east of Foe Field. It is in Piddling Pain. cht of Pit Pound is leteq. printed name of Pit Pound is "[if found-fit is false]Pit Pound[else]Grit Ground[end if]". description of Pit Pound is "[if found-fit is false]You feel like you don't belong here, yet[else]You finally feel comfortable here[end if]. [if blaze-maze is false]There's a blaze to the east that may be trickier to visit, though[else]Why, you could even deal with the maze to the east[end if]." [->sit sound]

A Hit Hound is a person in Pit Pound. cht of Hit Hound is leteq. "A hit hound paces menachingly back and forth here.". [->sit sound]

check going east in Pit Pound:
	if hit hound is in pit pound, say "Not with the hit hound guarding you, you aren't." instead;
	if found-fit is false, say "It's weird. You don't feel like you belong in the pit pound enough to go further east beyond it. Maybe you need a little more mental preparation, more than just to sit sound." instead;

found-fit is a truth state that varies.

part Blinding Blaze 2,3

Blinding Blaze is east of Pit Pound. cht of Blinding Blaze is letminus. printed name of Blinding Blaze is "[if blaze-maze is true]Minding Maze[else]Blinding Blaze[end if]". description is "[if blaze-maze is false]This is such a terrible blaze. You'll have to put it out, or you can only go back west[else if maze-mapped is false]There's a maze ahead. You'll want to plan out fully how to deal with it[else if stuck stair is touchable]A stuck stair leads down, but to where?[else]You've probably dealt with eveyrthing you can, here[end if][if blaze-maze is true]. You can also just go back west[end if]."

blaze-maze is a truth state that varies.

maze-mapped is a truth state that varies.

check going down in Blinding Blaze when stuck stair is in blinding blaze: say "It's not that easy. The stair's stuck. Maybe if you knew where to go or what you wanted to do, it'd be easier." instead;

chapter stuck stair

the stuck stair is scenery. "It looks like you may have to figure where the stair might go to use it."

chapter snuck snare

the snuck snare is a thing. "You feel lucky enough that you'll know where to put the snuck snare when the time is right.";

book clumped cluster

the clumped cluster is scenery. cht of clumped cluster is letminus. "The clumped cluster won't let you by!".

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
	if started-strong is false, say "In the Fun Fen, you could've used the wrong art for a STRONG START.";
	if wild weed is off-stage, say "You could've made the mild mead into WILD WEED.";
	if wild weed is not moot, say "You could've tried to SPARK SPLIFF by Cark Cliff [if player has wild weed]with[else]once you had[end if] [if wild weed is off-stage]something worth lighting[else]the wild weed[end if].";
	if gan-wan is false, say "You could've said WHATTA WANKSTA or WHAT A WANKSTA to the Gutta Ganksta for a further insult.";
	unless oi mo is moot, say "You could have DIMD (dim'd) the horrible song Oi Mo in Mystery Mall.";
	if beaker-yet is false, say "You could've given Reeker Russell BEAKER BUSTLE in the Gassed Gap/Last Lap.";

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

Rule for printing a parser error when the latest parser error is the can't see any such thing error:
	if player is in lake lea and jake-tea is false and word number 1 in the player's command is "take", continue the action;
	say "There's nothing here like that. You never need to refer directly to a room name, either."

Rule for printing a parser error when the latest parser error is the i beg your pardon error:
	say "Blank blather? Rank! Rather!"

the clue half right words rule is listed first in the for printing a parser error rulebook.

Rule for printing a parser error (this is the clue half right words rule):
	if in-so-sad is true or in-way-wrong is true:
		say "You can't do much, but that doesn't seem like it. You sort of have to break out of being and feeling [if in-so-sad is true]so sad[else]way wrong[end if].";
	abide by the verb-checker rule;
	abide by the mistake-checker rule;
	continue the action;

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

this is the verb-checker rule:
	repeat through the table of verb checks:
		let my-count be 0;
		if the player's command matches the regular expression "(^|\W)([w1 entry])\W", increment my-count;
		if there is a w2 entry:
			if the player's command matches the regular expression "\W([w2 entry])($|\W)", increment my-count;
		else if my-count > 0:
			increment my-count;
		let wfull-fail be false;
		[say "[ver-rule entry].";]
		if there is a wfull entry:
			if the player's command matches the wfull entry:
				now my-count is 2;
			else if my-count is 2:
				now wfull-fail is true;
		if my-count is 2:
			process the ver-rule entry;
			if the rule failed:
				continue the action;
			else if the rule succeeded:
				if in-so-sad is true and do-rule entry is not vr-glow-glad rule, say "Maybe later, when you're not feeling so sad ... so sad ..." instead;
				if in-way-wrong is true and do-rule entry is not vr-stay-strong rule, say "Maybe later, when you're not feeling way wrong ... way wrong ..." instead;
				if okflip entry is false:
					unless the player's command matches the regular expression "^([w1 entry])\b": [this is for the DIM'D test case]
						say "You've got it backwards! Just flip things around, and it'll be okay.";
						the rule succeeds;
				if wfull-fail is true:
					say "Ooh! You're close, but you juggled things up, somehow.";
					the rule succeeds;
				if there is a core entry and idid entry is false, up-which core entry;
				if zap-core-entry is true:
					blank out the core entry;
					now zap-core-entry is false;
				now idid entry is true;
				process the do-rule entry;
				process the notify score changes rule;
				process the get-sad rule;
				process the get-wrong rule;
				follow the every turn rules;
			process the note first think rule;
			the rule succeeds;
		if ha-half is true and my-count is 1:
			process the ver-rule entry;
			if the rule failed, next;
			if debug-state is true, say "[ver-rule entry] tipped off the HA HALF button.";
			say "The HA HALF button lights up on your Leet Learner.";
			the rule succeeds;
	if debug-state is true, say "OOPS if we're not in a test.";

next-lump-level is a number that varies. next-lump-level is 5.
next-lump-delta is a number that varies. next-lump-delta is 4.
lump-count is a number that varies. lump-count is 0.
lump-charges is a number that varies. lump-charges is 0.
lump-uses is a number that varies. lump-uses is 0.

to check-lump-progress:
	increment lump-count;
	if lump-count is next-lump-level:
		if player does not have lurking lump:
			say "[line break][if lurking lump is off-stage]Thwup! You hear a sound...and notice a lurking lump has fallen. It's dull and grey, but looking at it, with your experience, you realize it could help you move ahead on a tricky rhyme, at the right place at the right time, with [jjj][else if lurking lump]Thwup!
			A lurking lump appears again. You take it[else]The lurking lump pulses and grows. All your guesses have paid off[end if].";
			now player has lurking lump;
		increment lump-charges;
		increase next-lump-level by next-lump-delta;
		now lump-count is 0;

the lurking lump is a thing. description is "The lurking lump shines dully. It looks to have [lump-charges in words] charge[plur of lump-charges] for you to make a JERKING JUMP if anything is baffling you."

this is the mistake-checker rule:
	repeat through table of mistake substitutions:
		if the player's command matches mist-cmd entry:
			process the mist-rule entry;
			if the rule succeeded:
				say "[mist-txt entry][line break]";
				if there is a leet-rule entry:
					process the leet-rule entry;
					unless the rule succeeded, the rule succeeds;
				if got-yet entry is false:
					check-lump-progress;
				now got-yet entry is true;
				let d1 be -10;
				let d2 be -10;
				if there is a w1let entry:
					now d1 is w1let entry - number of characters in word number 1 in the player's command;
					if there is a w2let entry:
						now d2 is w2let entry - number of characters in word number 2 in the player's command;
					if d2 is -10, now d2 is d1;
					say "[leetclue of cluecheat of d1 and d2]";
				the rule succeeds;

to decide which cheattype is the cluecheat of (n1 - a number) and (n2 - a number):
	if n2 > n1, decide on cluecheat of n2 and n1;
	if n1 is 0 and n2 is 0, decide on leteq; [yellow = 0]
	if n1 > 0 and n2 is 0, decide on partplus; [blue + yellow = green]
	if n1 > 0 and n2 > 0, decide on letplus; [blue]
	if n1 is 0 and n2 < 0, decide on partminus; [yellow + red = orange]
	if n1 < 0 and n2 < 0, decide on letminus; [red]
	decide on letboth; [brown]

section jerkingjumping

jerkingjumping is an action applying to nothing.

understand the command "jerking jump" as something new.
understand the command "jj" as something new.

understand "jerking jump" as jerkingjumping.
understand "jj" as jerkingjumping.

in-jerk-jump is a truth state that varies.

carry out jerkingjumping:
	if debug-state is false:
		if lurking lump is off-stage, say "You have nothing that would help you do that." instead;
		if lurking lump is moot, say "You used up all the lump's charges, but maybe you can get more." instead;
	now in-jerk-jump is true;
	repeat through table of verb checks:
		say "Processing [ver-rule entry].";
		process the ver-rule entry;
		if the rule succeeded:
			say "[do-rule entry], bam.";
			process the do-rule entry;
			up-which core entry; [?? I really need to clean this code up. I want just to increment the score in one place. If a rule can keep track of the current row, that would be nifty.]
			if zap-core-entry is true:
				blank out the core entry;
				now zap-core-entry is false;
			now idid entry is true;
			decrement lump-charges;
			say "[line break]The lurking lump shrivels [if lump-charges is 0]and vanishes. Maybe more good guesses will bring it back[one of][or] again[stopping][else], but it still looks functional[end if].";
			if lump-charges is 0, moot lurking lump;
			now in-jerk-jump is false;
			increment lump-uses;
			process the notify score changes rule;
			process the get-sad rule;
			process the get-wrong rule;
			the rule succeeds;
	say "The lurking lump remains immovable. I guess you've done all you need, here.";
	the rule succeeds.

section verb check table

[verb check and verb run rules. This is in approximate game-solve order.]

table of verb checks [xxvc]
w1 (text)	w2 (text)	okflip	core	idid	ver-rule	do-rule	wfull (topic)
"get"	"good"	false	true	false	vc-get-good rule	vr-get-good rule	-- [start Intro]
"gift"	"giver"	false	true	false	vc-gift-giver rule	vr-gift-giver rule	--
"find"	"fault"	true	true	false	vc-find-fault rule	vr-find-fault rule	--
"green"	"grass"	false	true	false	vc-green-grass rule	vr-green-grass rule	--
"grow"	"grit"	true	true	false	vc-grow-grit rule	vr-grow-grit rule	--
"bash|mash|rash"	"bap|map|rap"	true	true	false	vc-mash-map rule	vr-mash-map rule	"bash bap" or "mash map" or "rash rap"
"mind"	"me"	false	true	false	vc-mind-me rule	vr-mind-me rule	--
"flim|skim"	"flam|scam"	false	true	false	vc-flim-flam rule	vr-flim-flam rule	"flimflam" or "flim flam" or "skim scam"
"big"	"bag"	true	true	false	vc-big-bag rule	vr-big-bag rule	-- [start of Fun Fen]
"spark"	"spliff"	true	false	false	vc-spark-spliff rule	vr-spark-spliff rule	--
"strong"	"start"	true	false	false	vc-strong-start rule	vr-strong-start rule	--
"fall"	"free"	true	true	false	vc-fall-free rule	vr-fall-free rule	--
"dive"	"deep"	true	true	false	vc-dive-deep rule	vr-dive-deep rule	--
"paper"	"pile"	false	true	false	vc-paper-pile rule	vr-paper-pile rule	--
"backed"	"binder"	false	true	false	vc-backed-binder rule	vr-backed-binder rule	--
"kneel"	"near"	false	true	false	vc-kneel-near rule	vr-kneel-near rule	-- [start of Real Rear]
"feel|feeling"	"fear"	false	true	false	vc-feel-fear rule	vr-feel-fear rule	--
"deal|dealing"	"dear"	true	true	false	vc-deal-dear rule	vr-deal-dear rule	--
"heal|healing"	"here"	true	true	false	vc-heal-here rule	vr-heal-here rule	--
"history"	"hall"	false	--	false	vc-history-hall rule	vr-history-hall rule	--
"mystery"	"mall"	false	true	false	vc-mystery-mall rule	vr-mystery-mall rule	--
"dark"	"door"	false	true	false	vc-dark-door rule	vr-dark-door rule	-- [start stark store]
"mark"	"more"	false	true	false	vc-mark-more rule	vr-mark-more rule	--
"cleared"	"clay"	true	true	false	vc-cleared-clay rule	vr-cleared-clay rule	--
"tight"	"tunnel"	false	true	false	vc-tight-tunnel rule	vr-tight-tunnel rule	-- [start fight funnel]
"knives"	"niche"	false	true	false	vc-knives-niche rule	vr-knives-niche rule	--
"lots"	"lame"	false	false	false	vc-lots-lame rule	vr-lots-lame rule	-- [start Mystery Mall]
"no"	"nappin"	true	true	false	vc-no-nappin rule	vr-no-nappin rule	--
"dimd"	--	false	false	false	vc-dimd rule	vr-dimd rule
"whatta"	"wanksta"	true	false	false	vc-whatta-wanksta rule	vr-whatta-wanksta rule	"what a wanksta" or "whatta wanksta"
"first"	"floor"	false	true	false	vc-first-floor rule	vr-first-floor rule	--
"glean"	"glows"	false	true	false	vc-glean-glows rule	vr-glean-glows rule	--
"smashing"	"smoke"	false	true	false	vc-smashing-smoke rule	vr-smashing-smoke rule	-- [start Y'Old Yard]
"lending"	"libe"	false	true	false	vc-lending-libe rule	vr-lending-libe rule	-- [start vending vibe]
"see"	"sign"	false	true	false	vc-see-sign rule	vr-see-sign rule	--
"hard"	"hat"	false	true	false	vc-hard-hat rule	vr-hard-hat rule	-- [start got gear hot here]
"try"	"trawl"	true	false	false	vc-try-trawl rule	vr-try-trawl rule	--
"beast"	"boss"	true	true	false	vc-beast-boss rule	vr-beast-boss rule	-- [start Creased Cross]
"cull|lul"	"ceased|least"	true	true	false	vc-cull-ceased rule	vr-cull-ceased rule	-- [?? maybe put something on the previous line, if you get a match, then wait for the next actual rule]
"full"	"feast"	true	true	false	vc-full-feast rule	vr-full-feast rule	--
"least"	"loss"	true	true	false	vc-least-loss rule	vr-least-loss rule	--
"loft"	"land"	false	true	false	vc-loft-land rule	vr-loft-land rule	-- [start soft sand]
"soft"	"sand"	false	--	false	vc-soft-sand rule	vr-soft-sand rule	--
"show"	"shield"	true	true	false	vc-show-shield rule	vr-show-shield rule	-- [start foe field]
"cool"	"cap"	true	true	false	vc-cool-cap rule	vr-cool-cap rule	-- [start curst cave]
"dreaming"	"dull"	true	true	false	vc-dreaming-dull rule	vr-dreaming-dull rule	--
"first"	"fave"	false	true	false	vc-first-fave rule	vr-first-fave rule	--
"moral"	"mage"	false	true	false	vc-moral-mage rule	vr-moral-mage rule	--
"work"	"well"	true	true	false	vc-work-well rule	vr-work-well rule	-- [start shirk shell]
"dear"	"dull"	true	true	false	vc-dear-dull rule	vr-dear-dull rule	-- [start here hull]
"near"	"null"	true	true	false	vc-near-null rule	vr-near-null rule	--
"sit"	"sound"	false	true	false	vc-sit-sound rule	vr-sit-sound rule	-- [start pit pound]
"fit"	"found"	true	true	false	vc-found-fit rule	vr-found-fit rule	--
"minding"	"maze"	false	true	false	vc-minding-maze rule	vr-minding-maze rule	-- [start blinding blaze]
"mo"	"mappin"	true	true	false	vc-mo-mappin rule	vr-mo-mappin rule	--
"luck|snuck"	"lair|snare"	false	true	false	vc-luck-lair rule	vr-luck-lair rule	"luck lair" or "snuck snare"
"brightening"	"bridge"	false	true	false	vc-brightening-bridge rule	vr-brightening-bridge rule	-- [start Violent Vale]
"silent"	"sail|sale"	false	true	false	vc-silent-sail rule	vr-silent-sail rule	--
"boring"	"boat"	false	true	false	vc-boring-boat rule	vr-boring-boat rule	--
"wake"	"whee"	true	true	false	vc-wake-whee rule	vr-wake-whee rule	-- [start Lake Lea]
"fake"	"fee"	false	true	false	vc-fake-fee rule	vr-fake-fee rule	--
"take"	"tea"	false	true	false	vc-take-tea rule	vr-take-tea rule	--
"break"	"brie"	false	false	false	vc-break-brie rule	vr-break-brie rule	--
"make"	"map"	false	true	false	vc-make-map rule	vr-make-map rule	-- [start Lake Lap]
"snake"	"snap"	true	true	false	vc-snake-snap rule	vr-snake-snap rule	--
"co"	"capn"	false	true	false	vc-co-capn rule	vr-co-capn rule	--
"so"	"sappin"	true	true	false	vc-so-sappin rule	vr-so-sappin rule	-- [start whining war]
"shining"	"shore"	false	true	false	vc-shining-shore rule	vr-shining-shore rule	--
"mining"	"more"	true	true	false	vc-mining-more rule	vr-mining-more rule	--
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
"whoa|woe|whoah"	"wait"	true	true	false	vc-whoa-wait rule	vr-whoa-wait rule	--
"tell"	"torn"	false	true	false	vc-tell-torn rule	vr-tell-torn rule	-- [start tarry tile/merry mile]
"merry"	"mile"	false	true	false	vc-merrymile rule	vr-merrymile rule	--
"bury"	"bile"	false	true	false	vc-bury-bile rule	vr-bury-bile rule	--
"glow"	"glad"	true	true	false	vc-glow-glad rule	vr-glow-glad rule	-- [start interlude-y]
"stay"	"strong"	false	true	false	vc-stay-strong rule	vr-stay-strong rule	--
"wild"	"weed"	true	false	false	vc-wild-weed rule	vr-wild-weed rule	-- [start of unplaced]
"bumped"	"buster"	true	true	false	vc-bumped-buster rule	vr-bumped-buster rule	--

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
	if in-beta is true or debug-state is true:
		check-missing-necc;
	if wry-wall-found < 2 or wry-wall-found is number of rows in table of bad locs:
		choose row with final response activity of showdeathsing in the Table of Final Question Options;
		blank out the whole row;
	if score is maximum score:
		choose row with final response activity of showmissesing in the Table of Final Question Options;
		blank out the whole row; [don't let the player see MISSED if they got everything]
	end the story finally saying "DEALS DONE: FEELS FUN!";

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
	if lean-lugged is true and mean-mugged is true:
		say "Dean Duggan applauds you. 'You have learned two profound lessons from me. You are ready to wear this way woke clay cloak.' But it doesn't seem to fit, quite. 'Okay, you're worthy to carry it, and that's something, I guess. Well, I've helped you all I can.'[paragraph break]Maybe you will find the way to make the clay cloak wearable elsewhere.";
		now player has clay cloak;
		moot Dean Duggan;
	else:
		say "'Not bad, but you can stll do a bit more,' says Dean Duggan. 'You need to both look and feel tough.'"

this is the ashap rule:
	if word number 1 in the player's command is "mash", now bap-map-rap is 0;
	if word number 1 in the player's command is "bash", now bap-map-rap is 1;
	if word number 1 in the player's command is "rash", now bap-map-rap is 2;

this is the trimtramcmd rule:
	now skim-not-flim is whether or not word number 1 in the player's command is "skim";

every turn when player is in Lake Lea or player is in Lake Lap:
	if Jake G is not in location of player and player is not in Violent Vale:
		say "Jake G follows behind.";
		move Jake G to location of player;
	continue the action;

section vc vr rules [xxvcvr]

this is the vc-backed-binder rule:
	if paper pile is not touchable, the rule fails;
	the rule succeeds;

this is the vr-backed-binder rule:
	say "The papers labeled FACT FINDER should be useful. But you find a way to glue them all together. Go, you!"; [?? list out the clues a bit better]
	now player has backed binder;
	now player has paper pile;
	now paper pile is part of the backed binder;
	phbt paper pile;

this is the vc-beaker-bustle rule:
	if reeker russell is not touchable, the rule fails;
	if beaker-yet is true:
		say "You already did that!";
		continue the action;
	the rule succeeds;

this is the vr-beaker-bustle rule:
	say "You have a vision of a much nerdier version of Reeker Russell going around and performing weird experiments. But you quickly snap back to reality. Still, it's good to be able to laugh at things.";
	now beaker-yet is true;
	the rule succeeds;

this is the vc-beast-boss rule:
	if player is not in Creased Cross, the rule fails;
	if Bull Beast is not off-stage:
		say "You already did.";
		continue the action;
	if player does not have gold guard:
		say "You don't feel armed for that, yet.";
		clue-later "BEAST BOSS";
		continue the action;
	if gull-guard is false:
		say "You aren't very confident your mold-marred gold guard could hold up in any sort of fight. You need to buff it up somehow first.";
		clue-later "BEAST BOSS";
		continue the action;
	the rule succeeds;

this is the vr-beast-boss rule:
	if score < beast-boss-min:
		clue-later "BEAST BOSS";
		say "You don't have the experience yet.";
		continue the action;
	say "A Bull Beast appears to answer your summons. You hope you have done the right thing.";
	move Bull Beast to Creased Cross;
	now need-loss is true;
	the rule succeeds.

this is the vc-big-bag rule:
	if player has big bag:
		say "You already made the big bag.";
		continue the action;
	if Fun Fen is unvisited:
		clue-later "BIG BAG";
		say "That would be a good idea, once you had possessions to carry around. But right now, you don't have enough that would need a big bag.";
		continue the action;
	the rule succeeds;

this is the vr-big-bag rule:
	say "The zig-zag rig rag does a little wig-wag (I guess what you'd call it,) and it transforms into a much more useful big bag!";
	moot zig zag rig rag;
	now player has big bag;
	now bag-hint is false;

this is the vc-boring-boat rule:
	if player is not in violent vale or flooring float is off-stage, the rule fails;
	if boring boat is moot:
		say "You don't need to bring the boring boat back.";
		continue the action;
	if boring boat is in violent vale:
		say "The boat is already boring and practical enough.";
		continue the action;
	the rule succeeds;

this is the vr-boring-boat rule:
	say "The flooring float sinks and tips over slightly. Some of its excess cargo falls into the water, never to return. It becomes much leaner and more practical--a boring boat!";
	moot flooring float;
	move boring boat to Violent Vale;

this is the vc-break-brie rule:
	if jake is not touchable, the rule succeeds;
	if jake-brie is true:
		say "You already did.";
		the continue the action;
	the rule succeeds;

this is the vr-break-brie rule:
	say "'Ooh, good one! I almost forgot I had it. I don't like it. Here, have it all.' This might not help in the end, but yay free food."

this is the vc-brightening-bridge rule:
	if frightening fridge is not touchable, the rule fails;
	the rule succeeds;

this is the vr-brightening-bridge rule:
	say "Boom! There goes the fridge! You can go east now!";
	moot frightening fridge;
	the rule succeeds.

this is the vc-bumped-buster rule:
	if clumped cluster is touchable, the rule succeeds;
	the rule fails;

this is the vr-bumped-buster rule:
	say "The clumped cluster no longer blocks your way. It starts pulsing further until it runs out of energy and collapses.";
	moot clumped cluster;
	the rule succeeds.

this is the vc-bury-bile rule:
	if player is in Tarry Tile:
		if well worn hell horn is moot and merry-mile is true, the rule succeeds;
		if well worn hell horn is in Tarry Tile:
			say "The well worn hell horn makes a loud noise. It's intimidating, and yet, you could find a way to prep yourself to ignore or get rid of the horn, then take the file.";
			clue-later "BURY BILE";
			continue the action;
		if merry-mile is false:
			say "You want to, but you're still just barely forcing it. You need a way to cheer yourself up to get going.";
			clue-later "BURY BILE";
			continue the action;
	clue-later "BURY BILE";
	if mrlp is Worst Whew:
		say "You try, and it seems right, but it's not that easy. You have quite a journey before you, until you can do that. But when the time is right, it will be very effective.";
		continue the action;
	if mrlp is Piddling Pain:
		say "You can sort of deal with that right now. But you need to do better! You still have adventure to go!";
		continue the action;
	if player is in Airy Isle:
		say "You'd like to do that, but not here with so many distractions, during perhaps the big last fight.";
		continue the action;
	if mrlp is Vale Verminous:
		too-generic;
		say "It must be about the right time. But you are not quite there, yet.";
		continue the action;
	the rule fails;

this is the vr-bury-bile rule:
	now bile-buried is true;
	win-the-game;
	say "Yes. You know what to do. As you bury the bile -- yours for others you have met in the game and in the past, the Very Vile Fairy File itself dissolves. The Merry Mile changes significantly. You are on your way back.";
	end the game in victory;
	follow the shutdown rules;
	the rule succeeds;

this is the vc-cast-cap rule:
	if player is not in gassed gap, the rule fails;
	if cool cap is moot:
		say "You already did.";
		continue the action;
	if extra-cool-cap is true, the rule succeeds;
	let N be the number of gaphats enclosed by the player;
	clue-later "CAST CAP";
	if N is 0:
		say "You don't have any caps to cast.";
	else if N is 1:
		say "The [random gaphat enclosed by the player] isn't enough on its own.";
	else if N is 2:
		say "The [list of gaphats enclosed by the player] aren't quite enough.";
	else if N is 3:
		say "Wow! Three hats! If only there was a way to combine them into an extra-cool hat!";
	continue the action;

this is the vr-cast-cap rule:
	say "You cast your cap, and the haze to the north disappears. You can see the way! But you can also see someone big and mean: you know it must be (W)re(a/e)ker Russell!";
	moot cool cap;
	move Reeker Russell to Gassed Gap;
	phbt Gassed Gap;

this is the vc-cleared-clay rule:
	if player is not in Stark Store, the rule fails;
	if weird way is moot:
		say "You already cleared the clay.";
		continue the action;
	the rule succeeds;

this is the vr-cleared-clay rule:
	say "You concentrate on the weird way, which is, uh, weirder than trying to stat o clear it. But what do you know? It turns to clay that crumbles and goes away. You can go down now!";
	moot weird way;

this is the vc-co-capn rule:
	if jake g is not touchable, the rule fails;
	if jake-fee is false:
		say "Maybe once you established a bond with Jake, he could be a co-captain. But not yet.";
		clue-later "CO CAPN";
		continue the action;
	if jake-cocapn is true:
		say "You already did.";
		continue the action;
	the rule succeeds;

this is the vr-co-capn rule:
	say "Jake smiles as you pronounce him an equal partner in whatever you find.";
	now jake-cocapn is true;
	process the check-sing-max rule;

this is the vc-cool-cap rule:
	if tool tap is not touchable, the rule fails;
	the rule succeeds;  [?? YOULL YAP / CRUEL CRAP !!!!!]

this is the vr-cool-cap rule:
	say "What do you know? A cool cap DOES come out.";
	now player has cool cap;
	the rule succeeds.

this is the vc-couple-caps rule:
	if player does not have jerk gel, the rule fails;
	let N be number of gaphats enclosed by the player;
	if N is 3, the rule succeeds;
	if N is 2:
		say "Hmm. You may need one more cap, or hat.";
	else if N is 1:
		say "You need at least one more hat to couple the CAPS.";
	else if N is 0:
		say "You have no caps to couple. Maybe one day, though...";
	continue the action;

this is the vr-couple-caps rule:
	say "Surprisingly, you don't need instructions to combine the hard hat, cool cap and cake cap into, well, an extra-cool cap. It's--well, it's got to be good for something dramatic!";
	now extra-cool-cap is true;

this is the vc-cull-ceased rule:
	if Bull Beast is not touchable, the rule fails;
	if player is not in Creased Cross:
		clue-later "CULL CEASED";
		say "You need to go back to Creased Cross.";
		continue the action;
	if healed-here is false:
		clue-later "CULL CEASED";
		say "You need to find a way to restore your health.";
		continue the action;
	the rule succeeds;

this is the vr-cull-ceased rule:
	say "YOU KILLED THE BULL BEAST.";
	now cull-ceased is true;
	now bull beast is boring;
	the rule succeeds.

this is the vc-dark-door rule:
	if player is not in stark store, the rule fails;
	if dark door is not off-stage:
		say "You already made the dark door appear[if dark door is moot] and disappear to create a passage[end if].";
		continue the action;
	the rule succeeds;

this is the vr-dark-door rule:
	say "A dark door appears to the west!";
	move dark door to Stark Store;

this is the vc-deal-dear rule:
	if player is not in Real Rear, the rule fails;
	if felt-fear is false:
		clue-later "DEAL DEAR";
		say "You haven't found anything you need to deal with[seer-sez].";
		continue the action;
	the rule succeeds;

this is the vr-deal-dear rule:
	say "The Sage Sea calms and parts briefly to reveal a cage key. You step in, slightly worried it may engulf you, but you've practiced your serenity.";
	now player has cage key;
	phbt Real Rear;
	phbt steel steer;
	the rule succeeds.

this is the vc-dear-dull rule:
	if player is not in here hull, the rule fails;
	if beer bull is moot:
		say "Yeah, easy to say with the beer bull gone for good.";
		continue the action;
	if in-bull-chase is true:
		say "You don't need to do any more taunting.";
		continue the action;
	the rule succeeds;

this is the vr-dear-dull rule:
	now zap-core-entry is true;
	say "The beer bull twitches[one of][or] again[stopping]. One thing it can't abide is being called dull! It's going to be chasing after you for a bit[if bull-null is false]. Watch out--it's super-charged. Maybe you can find some way to make it a little less terrifying[end if].";
	now in-bull-chase is true.

this is the vc-dimd rule:
	if oi mo is not touchable, the rule fails;
	the rule succeeds;

this is the vr-dimd rule:
	say "The beats of [i]Oi, Mo[r] quiet down out of hearing. You're worried they may be replaced by some song like 'Primp'r' or flip flop to Tip Top Hip Hop, but it's your lucky day. It's calmer now--random songs have started playing, which you can LISTEN to if you want.";
	if gutta ganksta is in history hall, say "[line break]The Gutta Ganksta, upset at the change in music, petulantly lashes out 'Hey, hack! Way wack!'";
	moot oi mo;
	the rule succeeds.

this is the vc-dining-door rule:
	if player is not in Whining War, the rule fails; [?? big problem with what replaces Violent Vale]
	abide by the shone-yet rule;
	the rule succeeds;

this is the vr-dining-door rule:
	say "The dining door appears.";
	now dine-door is true;
	the rule succeeds.

this is the vc-dive-deep rule:
	if hive heap is not touchable, the rule fails;
	the rule succeeds;

this is the vr-dive-deep rule:
	say "You look through the hive heap. You don't hear buzzing. You keep throwing hives over until ... well, a vapor, vile, is released.";
	moot hive heap;
	bring-here vapor vile;

this is the vc-dreaming-dull rule:
	if screaming skull is not touchable, the rule fails;
	the rule succeeds;

this is the vr-dreaming-dull rule:
	moot screaming skull;
	say "The screaming skull stops screaming and starts alternatively snoring and mumbling about that time it wound up naked at Undead Orientation, or the time the ghost of its secret crush found proof of said crush, or its own groundhog day studying for an exam it still can't pass, dreaming of their job when home from work, or walking in as a skeleton at its own funeral, or how it wrote a brilliant poem but then woke up, or how its final judgment went a bit differently, for better or worse. You try to show empathy and interest, but it's hopeless. The skull, upset and exhausted from its harangue, rolls off through the worst wave. Unable to help yourself, you call out 'May you sleep in interesting dreams!'";

this is the vc-fake-fee rule:
	if jake is not touchable, the rule succeeds;
	if jake-fee is true:
		say "You already did.";
		the continue the action;
	the rule succeeds;

this is the vr-fake-fee rule:
	say "You and Jake have a laugh about how you'd like to pay, and he'd like payment, but that's not really what's important here. Jake is ready to work with you off to the east!";
	now jake-fee is true;

this is the vc-fall-free rule:
	if tree-down is true:
		say "You don't need the tree to fall any further.";
		continue the action;
	if player is not in Fun Fen or Tall Tree is moot, the rule fails;
	the rule succeeds;

this is the vr-fall-free rule:
	say "The tree, already tipping over a bit, leans and ... falls over, creating safe passage to the north. Also, a hive heap falls from the tree and lands nearby. It seems worth a look.[paragraph break]You get greedy for a second wishing it was a teal tree so you could feel free, too, but this is good enough.";
	now tree-down is true;
	phbt tall tree;
	move hive heap to Fun Fen;
	the rule succeeds;

this is the vc-feel-fear rule:
	if player is not in Real Rear, the rule fails;
	if knelt-yet is false:
		clue-later "FEEL FEAR";
		say "Fear isn't something you can try to feel[seer-sez].";
		continue the action;
	the rule succeeds;

this is the vr-feel-fear rule:
	say "You let yourself feel fear, with the Ceiling Seer overlooking. No matter how much you feel, you have faith you can cope. Admitting you're fearful helps a bit.";
	now felt-fear is true;
	the rule succeeds.

this is the vc-find-fault rule:
	if player is not in Vined Vault, the rule fails;
	if mean mass is in Vined Vault:
		if print-why-fail, say "You already did, and things got worse. You'll have to try something else.";
		continue the action;
	the rule succeeds;

this is the vr-find-fault rule:
	loop-note "FIND FAULT";
	say "It sure seems, at first glance, like the Vined Vault is inescapable. But you notice a few flaws. A loose tile, a crack in the wall ... you have all sorts of time, and there are no guards. And here you go ... if you do THIS, and THIS ...[wfak]";
	say "[line break]But of course something outside rushes into the fault you found in the vault. A mean mass roars in and mangles the packet of Mind Malt! It pulses threateningly, and while it hasn't attacked you, it now blocks your way out!";
	move mean mass to Vined Vault;
	phbt Vined Vault;

this is the vc-first-fave rule:
	if player is not in curst cave, the rule fails;
	if first-fave is true:
		say "You already did.";
		continue the action;
	if screaming skull is in Curst Cave:
		clue-later "FIRST FAVE";
		say "You can't like anything with that screaming skull around!";
		continue the action;
	the rule succeeds;

this is the vr-first-fave rule:
	say "Suddenly, the worst wave isn't very bad or evil at all. In fact, with a bit of time, it recedes to reveal a tool tap.";
	now first-fave is true;
	move tool tap to Curst Cave;
	moot worst wave;
	the rule succeeds;

this is the vc-first-floor rule:
	if player is not in history hall or mistmall is true, the rule fails;
	if floor-yet is true:
		say "You already did.";
		continue the action;
	the rule succeeds;

this is the vr-first-floor rule:
	say "Erst Lore, up on the ceiling, comes [one of][or]back [stopping]down. You can go IN, now.";
	now Y'Old Yard is mapped inside History Hall;
	now History Hall is mapped outside Y'Old Yard;
	the rule succeeds.

this is the vc-flim-flam rule:
	if player is not in trim tram, the rule fails;
	if me-minded is false:
		process the trimtramcmd rule;
		say "That's a good idea, but you don't have the confidence yet! You need to get your bearings a bit.";
		clue-later-w "FLIM FLAM";
		continue the action;
	the rule succeeds;

this is the vr-flim-flam rule:
	loop-note "FLIM FLAM/SKIM SCAM";
	say "That does it! The tram moves off to a more open place...";
	process the trimtramcmd rule;
	move the player to Fun Fen;

this is the vc-found-fit rule:
	if player is not in pit pound, the rule fails;
	if found-fit is true:
		say "You already did.";
		continue the action;
	if hit hound is in pit pound:
		say "You can't do much with the Hit Hound around.";
		clue-later-w "FIT FOUND";
		continue the action;
	the rule succeeds;

this is the vr-found-fit rule:
	say "You feel comfortable here now. Wahoo!";
	now found-fit is true;
	the rule succeeds.

this is the vc-full-feast rule:
	if Bull Beast is not in location of player, the rule fails;
	if Bull Beast is not boring:
		clue-later "FULL FEAST";
		say "That should work. It might work better if the Bull Beast were incapacitated.";
		continue the action;
	the rule succeeds;

this is the vr-full-feast rule:
	say "BOOM! You managed to make a full feast of the Bull Beast. But there's a lot of it. It'll be hard to move all at once.";
	moot Bull Beast;
	move full feast to location of player;
	the rule succeeds.

this is the vc-get-good rule:
	if player is not in wet wood:
		if print-why-fail, say "You already managed to GET GOOD.";
		continue the action;
	the rule succeeds;

this is the vr-get-good rule:
	loop-note "GET GOOD";
	say "You realize you can reason your way out of the Wet Wood. You feel so good about it, even musing 'good guy's wood wise!' But this brings up a question: if you need to work on rhymes, does it matter if they are spelled identically? Will that make things easier or harder in the long run?[paragraph break]So many questions! On leaving the wood, you find yourself blocked by water.";
	move player to Rift River;

this is the vc-gift-giver rule:
	if player is not in rift river, the rule fails;
	the rule succeeds;

this is the vr-gift-giver rule:
	loop-note "GIFT GIVER";
	say "Someone appears from the distance. 'Here! Take this. It will help you with a future puzzle or puzzles.' It's a packet of Mind Malt, whatever that is. And ... it's empty. You open your mouth to protest, but their hand goes up. 'The best sort of magic helps you help yourself.'[paragraph break]You stifle a hmph. 'Oh,' they continue, 'Also some Too-Totes-New Notes. They will tell you what your Leet Learner would've scanned for the puzzles you face at the start. Though you may wish to keep track of things by yourself. If you wish, you can DROP it to solve things the hard way.'[paragraph break]That's a bit better. They walk away. You grumble and putter around, wondering where you should go next. You put your hand on a tree, which has sick sap on it. You walk around, trying to get it off, and you fall into a ... TRICK TRAP.";
	now player has Too Totes New Notes;
	now player has Mind Malt;
	move player to Vined Vault;

this is the vc-glean-glows rule:
	if player is not in history hall or mean moe's is not in history hall, the rule fails;
	if player does not have clay cloak:
		say "That would work, to find how to clean your clothes, but you don't have any clothes that need cleaning.";
		clue-later "GLEAN GLOWS";
		continue the action;
	the rule succeeds;

this is the vr-glean-glows rule:
	say "You figure how Mean Moe's Clean Clothes works. You lump the way woke clay cloak in, and after some beeping and coughing, out comes ... a clashing cloak! It's much less bulky than the way woke clay cloak, and it feels more versatile.";
	moot way woke clay cloak;
	now player has clashing cloak;
	moot Mean Moe's Clean Clothes;

this is the vc-glow-glad rule:
	if in-so-sad is false, the rule fails;
	if in-so-saded is true:
		say "You already did.";
		continue the action;
	the rule succeeds;

this is the vr-glow-glad rule:
	say "That's it! You feel much more comfortable now.";
	now in-so-sad is false;
	now in-so-saded is true;
	phbt Kerry Kyle;
	the rule succeeds.

this is the vc-go-gappin rule:
	if player is not in gassed gap, the rule fails;
	if gap-go is true:
		say "You already did.";
		continue the action;
	the rule succeeds;

this is the vr-go-gappin rule:
	say "Man! Toe Tappin Row Rappin is pretty handy for all sorts of things.";
	now gap-go is true;
	process the check-sing-max rule;

this is the vc-got-gored rule:
	if player is not in airy isle or bot board is moot, the rule fails;
	if lot lord is in airy isle and hot horde is in airy isle, the rule succeeds;
	clue-later "GOT GORED";
	if lot lord is off-stage and hot horde is off-stage:
		say "That would just be your epitaph right now. But with some help--a lot--it could be a potent rallying cry.";
		continue the action;
	if lot lord is off-stage:
		say "The Hot Horde needs more than a battle cry. It needs a leader.";
		continue the action;
	if hot horde is off-stage:
		say "The Lot Lord nods, but alas, one person using a battle cry against the Bot Board won't work.";
		continue the action;
	say "Uh oh. This is a BUG case. This should not have happened.";
	continue the action;

this is the vr-got-gored rule:
	say "YES! That's the cheer they need. The bot board is routed.[paragraph break]As things calm down, you realize a wry wall points you two ways, and there is now a go gate ahead! You must be close now.";
	moot Hot Horde;
	moot Lot Lord;
	moot Bot Board;
	wall-refresh;
	move go gate to Airy Isle;

this is the vc-green-grass rule:
	if mean mass is in vined vault, the rule succeeds;
	the rule fails;

this is the vr-green-grass rule:
	loop-note "GREEN GRASS";
	say "The mean mass collapses into much safer green grass. You walk by and arrive at...";
	move player to Po' Pit;
	moot mean mass;
	the rule succeeds;

this is the vc-grow-grit rule:
	if player is not in po' pit, the rule fails;
	if grit-grown is true:
		if print-why-fail, say "You already did that. Grit is internalized in you. If you try to be grittier, you may use up the grit you worked so hard to gain.";
		continue the action;
	the rule succeeds;

this is the vr-grow-grit rule:
	loop-note "GROW GRIT";
	say "The trash trap looks less yucky now. Okay, it still looks pretty yucky, but it's almost bearable. You just have to make sure you don't trip anything horrible. You need a safe way through!";
	now grit-grown is true;
	phbt row writ;
	phbt Po' Pit;
	the rule succeeds.

this is the vc-hard-hat rule:
	if marred mat is not touchable, the rule fails;
	the rule succeeds;

this is the vr-hard-hat rule:
	say "Poof! The marred mat changes into a hard hat. A nice lightweight one. Light enough to wear, so you do.";
	moot marred mat;
	now player has hard hat;

this is the vc-heal-here rule:
	if player is not in Real Rear, the rule fails;
	if healed-here is true:
		say "You already did.";
		continue the action;
	if least-loss is false:
		clue-later "HEAL HERE";
		say "You don't have anything to heal from, yet[seer-sez].";
		continue the action;
	the rule succeeds;

this is the vr-heal-here rule:
	say "You call on the Ceiling Seer once more. You ask for your wounds to heal ... and they do!";
	now healed-here is true;
	the rule succeeds.

this is the vc-history-hall rule:
	if player is not in History Hall, the rule fails;
	if mistmall is false:
		say "You're already in History Hall.";
		continue the action;
	the rule succeeds;

this is the vr-history-hall rule:
	move-to-temp gutta ganksta;
	move-to-temp Mean Moe's Clean Clothes;
	move-from-temp Name Notes Tame Totes;
	now Vending Vibe is mapped west of History Hall;
	now History Hall is mapped east of Vending Vibe;
[	move-from-temp Erst Lore;?? should have scenery defining this]
	move-to-temp gutta ganksta;
	move-to-temp Oi Mo;
	now mistmall is false;
	bold-my-room;
	if ever-hall is false, say "Weird! The way west seems to change from a store to ... something else, still sort of a store, actually.";
	now ever-hall is true;
	the rule succeeds;

this is the vc-hot-horde rule:
	if player is not in airy isle, the rule fails;
	if Hot Horde is not off-stage:
		say "You already summoned the Hot Horde.";
		continue the action;
	the rule succeeds;

this is the vr-hot-horde rule:
	say "The legendary Hot Horde rumbles in from ... goodness, how'd they get here so fast? Especially since they're such a disorganized bunch!";
	move hot horde to airy isle;
	check-gored-clue;
	the rule succeeds.

this is the vc-kneel-near rule:
	if player is not in real rear, the rule fails;
	if knelt-yet is true:
		say "You already did!";
		continue the action;
	the rule succeeds;

this is the vr-kneel-near rule:
	say "You kneel at the pier, facing away from the Steel Steer to avoid any semblance of idolatry that might cause the Ceiling Seer to strike you down. You feel peace and acceptance and potential and ability wash over you.";
	now knelt-yet is true; [?? track difference]
	now cht of Real Rear is leteq; [real rear->feel fear]
	now cht of steel steer is letminus; [steel steer->feel fear]
	the rule succeeds.

this is the vc-knives-niche rule:
	if player is not in dives ditch, the rule fails;
	if kni-ni is true:
		say "You already changed the dives ditch.";
		continue the action;
	the rule succeeds;

this is the vr-knives-niche rule:
	say "The dives ditch folds up, and now you see a trap on the wall where knives will be released on an unsuspecting interloper.";
	now kni-ni is true;
	process the drop-snare rule;

this is the vc-lean-luggin rule:
	if player is not in Been Buggin', the rule fails;
	if lean-lugged is true:
		say "You already did.";
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
		say "Not yet. You need to be in a fighting situation.";
		continue the action;
	if least-loss is true:
		say "You already minimized your losses. Time to be more aggressive.";
		continue the action;
	the rule succeeds;

this is the vr-least-loss rule:
	now need-loss is false;
	now least-loss is true;
	say "BOOM! The Bull Beast, upset it did less damage than expected, fails to finish the job. You're definitely hurt, but you can survive. You take a bruising, but you'll live. The bull beast skulks back to the shadows.";

this is the vc-lending-libe rule:
	if player is not in vending vibe, the rule fails;
	if trending tribe is moot:
		say "Yes. This is the place's new name. You already disposed of the trending tribe.";
		continue the action;
	the rule succeeds;

this is the vr-lending-libe rule:
	moot trending tribe;
	say "The Trending Tribe is appalled by the possibility of people getting something for free. Even books that don't help you profit.";
	now printed name of Vending Vibe is "Lending Libe";
	move lending libe to Vending Vibe;
	process the card-and-libe rule;
	the rule succeeds.

this is the vc-loft-land rule:
	if player is not in soft sand, the rule fails;
	if loft-land is true:
		say "You're already on the loft land.";
		continue the action;
	the rule succeeds;

this is the vr-loft-land rule:
	say "Boom! The Soft Sand rises up and becomes the Loft Land[one of][or] again[stopping].";
	now zap-core-entry is true;
	if ever-loft is false:
		now ever-loft is true;
		now loft-land is true;
	now Curst Cave is mapped west of Soft Sand;
	now Soft Sand is mapped east of Curst Cave;
	the rule succeeds;

this is the vc-lot-lord rule:
	if player is not in airy isle, the rule fails;
	if Lot Lord is not off-stage:
		say "You already summoned the Hot Horde.";
		continue the action;
	the rule succeeds;

this is the vr-lot-lord rule:
	move lot lord to airy isle;
	say "The Lot Lord whirls in from above, only looking slightly stunned.";
	check-gored-clue;
	the rule succeeds;

this is the vc-lots-lame rule:
	if gutta ganksta is not touchable, the rule fails;
	the rule succeeds;

this is the vr-lots-lame rule:
	say "Exposed, the [ganksta] turns red. It just can't face you any more and runs off for another mall to look cool in.";
	moot ganksta;
	the rule succeeds;

this is the vc-luck-lair rule:
	if player is not in blinding blaze or stuck stair is off-stage, the rule fails;
	if stuck stair is moot:
		say "You already got to luck lair.";
		continue the action;
	the rule succeeds;

this is the vr-luck-lair rule:
	say "You try and make your own luck, and you do! The stuck stair flips down. Inside the luck lair there is nothing, except ... well, since you feel lucky, you find the snuck snare without it going off. You'll probably know where to put the snuck snare once you see it. Because, well, you still feel a bit lucky.";
	moot stuck stair;
	now player has snuck snare;

this is the vc-make-map rule:
	if player is not in Lake Lap, the rule fails;
	if jake-map is true:
		say "You already did.";
		continue the action;
	the rule succeeds;

this is the vr-make-map rule:
	say "You make a map. As you do, you hear a hissing noise, as from a dangerous snake.";
	now jake-map is true;

this is the vc-mark-more rule:
	if player is not in stark store, the rule fails;
	if dark door is off-stage:
		clue-later "MARK MORE";
		say "That'd work, if there was something to mark.";
		continue the action;
	if dark door is moot:
		say "You saw what you could.";
		continue the action;
	the rule succeeds;

this is the vr-mark-more rule:
	say "Yes, there's more to the stark store than the dark door. You notice things about it--as well as how to take it off its hinges! And what's more, you also uncover a weird way off to the side.";
	move weird way to Stark Store;
	moot dark door;

this is the vc-mash-map rule:
	if player is not in po' pit, the rule fails;
	if grit-grown is false:
		process the ashap rule;
		if debug-state is true, say "[word number 1 in the player's command] [bap-map-rap].";
		say "You aren't brave enough yet. Perhaps you can face down the po['] pit so you can be.";
		clue-later-w "MASH MAP";
		continue the action;
	the rule succeeds;

this is the vr-mash-map rule:
	loop-note "MASH MAP";
	say "The heck with this! You just don't trust the trash trap to tell you the way through. You maul what passes for a map on the cache cap--you realize parts of it don't make sense. And you make it past the gash gap... only to tumble into some sort of vehicle that seals shut.";
	process the ashap rule;
	move player to Trim Tram;
	the rule succeeds;

this is the vc-mean-muggin rule:
	if player is not in Been Buggin', the rule fails;
	if mean-mugged is true:
		say "You already did.";
		continue the action;
	the rule succeeds;

this is the vr-mean-muggin rule:
	say "You try some aggressive facial features. Dean Duggan helps you get things right.";
	now mean-mugged is true;
	lean-and-mean;

this is the vc-meeker-muscle rule:
	if reeker russell is not touchable, the rule fails;
	if meeker-yet is true:
		say "You already did that!";
		continue the action;
	the rule succeeds;

this is the vr-meeker-muscle rule:
	now meeker-yet is true;
	say "Russell becomes noticeably less muscular.";
	check-russell-go; [nec]

this is the vc-merrymile rule:
	if merry-mile is true:
		say "You already did. And if you force things, it might undo the good you did.";
		continue the action;
	if mrlp is not Vale Verminous, the rule fails;
	clue-later "MERRY MILE";
	if player is not in Tarry Tile:
		say "This doesn't seem to be the place to rename the Merry Mile. Maybe somewhere else, though.";
		continue the action;
	if player is in Airy Isle:
		if bot board is moot:
			say "You're happy, but you can't force it any more. You haven't found the Very Vile Fairy File yet, and when you do, this may be a more appropriate name for wherever it is that is ahead.";
			continue the action;
		say "Hard to be happy with the Bot Board around.";
		continue the action;
	if player is in Tarry Tile and well worn hell horn is in Tarry Tile:
		say "Not with the well worn hell horn making those un-merry noises.";
		clue-later "MERRY MILE";
		continue the action;
	the rule succeeds;

this is the vr-merrymile rule:
	say "You're much happier now! You are ready to deal with the Very Vile Fairy File fully, now.";
	now merry-mile is true;

this is the vc-mind-me rule:
	if player is not in trim tram, the rule fails;
	if me-minded is true:
		if print-why-fail, say "You already minded yourself.";
		continue the action;
	the rule succeeds;

this is the vr-mind-me rule:
	loop-note "MIND ME";
	say "FIND FEE can't be right. There's nobody here to collect it. You have a bit more confidence in your ability to swindle someone, or something, else now. The FIND FEE plastered everywhere vanishes.";
	now me-minded is true;

this is the vc-minding-maze rule:
	if player is not in blinding blaze, the rule fails;
	if blaze-maze is true:
		say "You already converted the blaze to a maze.";
		continue the action;
	the rule succeeds;

this is the vr-minding-maze rule:
	say "The blaze swirls but dies down. In its place is a huge minding maze.";
	now blaze-maze is true;

this is the vc-mining-more rule:
	if player is not in Whining War, the rule fails; [?? big problem with what replaces Violent Vale]
	abide by the shone-yet rule;
	the rule succeeds;

this is the vr-mining-more rule:
	now mine-more is true;
	say "You help the Fining Four mine more, more, more. As a reward, they give you an alloy that smiths the gold guard into ... a HOLD HARD GOLD GUARD!"; [note: the player is assured of having the gold guard because they need it to beat the Beast Boss and make the Feast.]
	the rule succeeds. [pining poor]

this is the vc-mo-mappin rule:
	if player is not in blinding blaze, the rule fails;
	if player does not have Toe Tappin Row Rappin:
		clue-later "MO MAPPIN";
		say "You'd love to, but you need some sort of artistic, peppy way to make the mapping less tedious. Even fun.";
	if blaze-maze is false:
		clue-later "MO MAPPIN";
		say "The blaze isn't mappable, but maybe something that replaces it is.";
		continue the action;
	if stuck stair is in blinding blaze:
		say "You already did.";
		continue the action;
	the rule succeeds;

this is the vr-mo-mappin rule:
	say "Having a catchy tune like Toe Tappin Row Rappin in your head certainly helps you with mapping. And once you see the way through the maze, you don't forget it. At the end of the maze, there is a stuck stair. As you approach it, the maze walls collapse, and ... you find yourself very near the entrance. Convenient!";
	move stuck stair to blinding blaze;
	now maze-mapped is true;
	process the check-sing-max rule;

this is the vc-moral-mage rule:
	if coral cage is not touchable, the rule fails;
	if player does not have cage key:
		clue-later "MORAL MAGE";
		say "The coral cage is too dense to see through or destroy right now. Maybe if you were able to get into it.";
		continue the action;
	the rule succeeds;

this is the vr-moral-mage rule:
	say "The inner bars of the coral cage crumble. The moral mage thanks you and explains to you some interesting details about the Very Vile Fairy File, its powers, and the people behind it. You feel your resolve increase.";
	moot coral cage;
	the rule succeeds.

this is the vc-mystery-mall rule:
	if player is not in History Hall, the rule fails;
	if mistmall is true:
		say "You're already in the Mystery Mall.";
		continue the action;
	the rule succeeds;

this is the vr-mystery-mall rule:
	move-to-temp Name Notes Tame Totes;
	move-from-temp gutta ganksta;
	if Toe Tappin is not moot:
		move-from-temp Toe Tappin;
	else if Oi Mo is not moot:
		move-from-temp Oi Mo;
	move-from-temp Mean Moe's Clean Clothes;
	now Got Gear Hot Here is mapped west of History Hall;
	now mistmall is true;
	bold-my-room;
	if ever-mall is false, say "A way opens up to the west as History Hall shudders into Mystery Mall! You suspect it would be easy to flip back to History Hall, if you needed or wanted to.";
	now ever-mall is true;
	now zap-core-entry is true;
	the rule succeeds;

this is the vc-near-null rule:
	if beer bull is not touchable, the rule succeeds;
	if bull-null is true:
		say "You already reduced the bull's power!";
		continue the action;
	the rule succeeds;

this is the vr-near-null rule:
	now zap-core-entry is true;
	say "The beer bull writhes and roars. It's still plenty powerful, but it's not supercharged.";
	now bull-null is true;

this is the vc-no-nappin rule:
	if toe tappin row rappin is not touchable, the rule fails;
	if nap-no is true:
		say "You already changed Toe Tappin Row Rappin that way.";
		continue the action;
	the rule succeeds;

this is the vr-no-nappin rule:
	say "Sometimes you don't need a perfectly sensible way to keep alert. No Nappin does that for you. It will do that for you.";
	say "[line break][if boat-reject is true and lake lap is unvisited]Hey! I bet you could see about the boring boat, now[else]Whatever you need to make more interesting, your riff on Toe Tappin will see you through. You won't forget it[end if].";
	now nap-no is true;
	process the check-sing-max rule;

this is the vc-paper-pile rule:
	if vapor vile is not touchable, the rule fails;
	the rule succeeds;

this is the vr-paper-pile rule:
	say "The vapor vile changes to a paper pile.";
	moot vapor vile;
	bring-here paper pile;

this is the vc-pull-pieced rule:
	if full feast is not in Creased Cross, the rule fails;
	if shore-shine is false:
		say "You're not sure where you could pull the full feast to, yet.";
		clue-later "PULL PIECED";
		continue the action;
	if dine-door is false:
		clue-later "PULL PIECED";
		say "The folks at the Shining Shore aren't quite ready for a feast, yet. Perhaps the Shining Shore needs a bit of adjustment.";
		continue the action;
	the rule succeeds;

this is the vr-pull-pieced rule:
	say "With the help of the Fining Four, you pull the full feast that was the bull beast to the Shining Shore. There, you have a very good feast. They're happy. They are quite ready to help you now.";
	moot full feast;
	move player to Whining War, without printing a room description;

this is the vc-see-sign rule:
	if player does not have We Whine, the rule fails;
	if sign-seen is true:
		say "You've seen enough signs. Overkill might leave you demoralized.";
		continue the action;
	the rule succeeds;

this is the vr-see-sign rule:
	say "A closer reading of [We Whine] reveals that you don't need to be a jerk to learn from it. Whether that was the authors['] intent is unclear, but you realize You can learn about the games jerks play and how to expect and deflect them even before they become obvious jurks. It seems like grappling with this sort of thing without fighting it would be useful for dealing with the Very Vile Fairy File, and you now feel more worthy and prepared to do so.";
	now sign-seen is true;

this is the vc-shining-shore rule:
	if player is not in Whining War, the rule fails; [?? big problem with what replaces Violent Vale]
	if shore-shine is true:
		say "You already got (t)here.";
		continue the action;
	if war-sapped is false:
		clue-later "SHINING SHORE";
		say "It could be that way. But you need to get rid of the whining first.";
		continue the action;
	the rule succeeds;

this is the vr-shining-shore rule:
	say "The Whining War dissipates, leaving the shining shore of ... Lake Lap! It's much brighter here. You feel there may be something else to find here.";
	phbt Whining War;
	now shore-shine is true; [?? fake fap]

this is the vc-show-shield rule:
	if player is not in foe field, the rule fails;
	if player does not have gold guard:
		clue-later "SHOW SHIELD";
		say "That seems right, but you have nothing that would guard you effectively. Maybe later.";
		continue the action;
	if mine-more is false:
		clue-later "SHOW SHIELD";
		say "Ooh! The gold guard lasts a bit, but not quite long enough. It needs reinforcements.";
		continue the action;
	the rule succeeds;

this is the vr-show-shield rule:
	say "You flash your gold guard, and bam, the voice that says YO YIELD quiets down. But not before the usual energy ray shows up and blasts your gold guard to pieces. Eh, it did its job. You can go west now.";
	now shield-shown is true;
	moot gold guard;

this is the vc-silent-sail rule:
	if player is not in violent vale, the rule fails;
	if flooring float is not off-stage:
		say "You already called up the flooring float[if boring boat is not off-stage] and boring boat[end if].";
		continue the action;
	the rule succeeds;

this is the vr-silent-sail rule:
	say "Suddenly fom the watery depths, a flooring float pops up! It looks -- impractical for going anywhere, but man, is it aesthetic!";
	move flooring float to violent vale;
	the rule succeeds;

this is the vc-sit-sound rule:
	if hit hound is not touchable:
		if player is in pit pound:
			say "You already did.";
			continue the action;
		the rule fails;
	the rule succeeds;

this is the vr-sit-sound rule:
	say "The Hit Hound can smell fear, but it can also smell a lack of fear. You manage to sit sound, and the Hit Hound gives up and goes away.";
	moot Hit Hound;
	phbt pit pound;
	the rule succeeds.

this is the vc-smashing-smoke rule:
	if player does not have clashing cloak, the rule fails;
	if beer bull is in location of player:
		say "That's not enough to distract the Beer Bull for good.";
		clue-later "SMASHING SMOKE";
		continue the action;
	if player is not in Y'Old Yard:
		say "You don't seem to need to make a disturbance here.";
		clue-later "SMASHING SMOKE";
		continue the action;
	the rule succeeds;

this is the vr-smashing-smoke rule:
	say "The Bold Bard tosses you a cold card quickly as thanks before makes his way into the Shoaled Shard in the confusion! You hear shouting in there. The Bard has -- certanly made an impression. You hope it is a good one. Your clashing cloak went up in the smoke, but eh, it was sort of tacky anyway.";
	moot bold bard;
	now player has cold card;
	now player has gold guard;

this is the vc-snake-snap rule:
	if player is not in Lake Lap, the rule fails;
	if jake-cocapn is false:
		say "You don't know if you can take that snake by itself. Jake doesn't quite seem willing, yet, either.";
		clue-later "SNAKE SNAP";
		continue the action;
	the rule succeeds;

this is the vr-snake-snap rule:
	say "And that does it! You and Jake, with the help of the map, subdue the snake. One of you baits it, the other kills it. A take-tap pours out items on a small island. You find a cake cap, a flake flap and some rake wrap. You take the cap, and Jake takes the flap and wrap. It's a nice haul. You take your boring boat back to Violent Vale.";
	now player has cake cap;
	move boring boat to Violent Vale;
	move player to Violent Vale, without printing a room description;

this is the vc-so-sappin rule: [?? we need to make sure this works okay]
	if war-sapped is true:
		say "You already did.";
		continue the action;
	if player is not in whining war:
		say "That's an interesting riff, but it doesn't seem to work here.";
		clue-later "SO SAPPIN";
	the rule succeeds;

this is the vr-so-sappin rule:
	say "It's not much, but it's a start. The whining grows steadily less.";
	now war-sapped is true;
	process the check-sing-max rule;

this is the vc-soft-sand rule:
	if player is not in soft sand, the rule fails;
	if loft-land is false:
		say "You're already on the Soft Sand.";
		continue the action;
	the rule succeeds;

this is the vr-soft-sand rule:
	say "The loft land reverts to the Soft Sand.";
	now loft-land is false;
	now Shirk Shell is mapped west of Soft Sand;
	the rule succeeds;

this is the vc-spark-spliff rule:
	if wild weed is moot:
		say "Whoah, dude. You already did.";
		continue the action;
	if player does not have wild weed, the rule fails;
	if player is not in Fun Fen:
		say "Not here, dude! No source of flame!";
		continue the action;
	the rule succeeds;

this is the vr-spark-spliff rule:
	say "Whoah, dude! You totally discover not only a hidden spliff but two pieces of flint ideal for creating a flame to light it. It only takes 15 minutes, and it is totally worth it, even without munchies.";
	moot wild weed;
	the rule succeeds;

this is the vc-stay-strong rule:
	if in-way-wronged is true:
		say "You already did.";
		continue the action;
	if in-way-wrong is false, the rule fails;
	the rule succeeds;

this is the vr-stay-strong rule:
	say "That's it! You feel much more comfortable now.";
	now in-way-wrong is false;
	now in-way-wronged is true;
	phbt Kerry Kyle;
	the rule succeeds.

this is the vc-strong-start rule:
	if player is not in Fun Fen, the rule fails;
	if started-strong is true:
		say "You already did. You wouldn't want a stale start. Why, you might get sent to Male Mart. Or run over by a kale cart.";
		continue the action;
	the rule succeeds;

this is the vr-strong-start rule:
	now started-strong is true;
	say "Boom! Yes, you mangle and destroy the wrong art, both physically and mentally. You can't dunk on wrong stuff too much, but in this case, you gain confidence you know what you are doing, and the exercise is nice, too. That is a way to get a strong start[if score > 11 and creased cross is visited], even if you aren't really starting any more[else if score > 30], because it's always good to start anew, or try to, to get a perspective on things[end if]. You throw the wrong art over Cark Cliff, now that you feel confident fully dismissing it.";
	moot wrong art;
	the rule succeeds.

this is the vc-take-tea rule:
	if jake is not touchable, the rule succeeds;
	if jake-tea is true:
		say "You already did.";
		the continue the action;
	the rule succeeds;

this is the vr-take-tea rule:
	say "You and Jake have a brief snack. It helps bring you together. But he looks awkwardly at you. He guesses he should expect payment, but he doesn't really want it.";
	now jake-tea is true;

this is the vc-tell-torn rule:
	if well worn hell horn is not touchable, the rule fails;
	the rule succeeds;

this is the vr-tell-torn rule:
	say "The well worn hell horn rips apart and unwinds. Fortunately, as it does so, there is no bell born. It's more peaceful around, now. You can focus better and come to grips with your inner self, and all that sort of thing.";
	moot well worn hell horn;

this is the vc-tight-tunnel rule:
	if player is not in fight funnel, the rule fails;
	if funnel-to-tunnel is true:
		say "You already got rid of the fight funnel.";
		continue the action;
	the rule succeeds;

this is the vr-tight-tunnel rule:
	say "The fighting quiets down and moves off to the north. You can now go west!";
	now funnel-to-tunnel is true;

this is the vc-try-trawl rule:
	if player is not in Got Gear Hot Here, the rule fails;
	if trawl-try is true:
		say "Trying isn't about trying the same thing over and over again. It's about trying in different, creative ways!";
		continue the action;
	the rule succeeds;

this is the vr-try-trawl rule:
	say "Yes, you want to try to deserve more than the shy shawl.";
	now trawl-try is true;

this is the vc-wake-whee rule:
	if jake g is not touchable, the rule fails;
	if jake-woke is true:
		say "You already did.";
		continue the action;
	the rule succeeds;

this is the vr-wake-whee rule:
	say "Jake G. wakes up.";
	now jake-woke is true;

this is the vc-whatta-wanksta rule:
	if gutta ganksta is not touchable, the rule fails;
	if gan-wan is true:
		say "You already pinged the Gutta Ganksta like that.";
		continue the action;
	the rule succeeds;

this is the vr-whatta-wanksta rule:
	say "The Gutta Ganksta suddenly feels dissed. Not enough to move out of the way, but enough to make you feel clever. After all, the Gutta Ganksta feels clever for knowing a word like 'wanksta' and affirming that it is a bit derivative of 'ganksta.'";
	now gan-wan is true;
	the rule succeeds.

this is the vc-whoa-wait rule:
	unless player is in airy isle and go gate is in airy isle, the rule fails;
	the rule succeeds;

this is the vr-whoa-wait rule:
	say "You decide not to run in right away. The grow grate inside the go grate crumbles. You take another peek to make sure there's nothing else. There isn't. You walk through.[wfak]";
	move player to Tarry Tile;
	now min-needed is score + 3;
	now maximum score is score + 3;
	the rule succeeds.

this is the vc-wild-weed rule:
	if mild mead is not touchable, the rule fails;
	the rule succeeds;

this is the vr-wild-weed rule:
	say "Bingo! The mild mead becomes wild weed.";

this is the vc-wood-one rule:
	if reeker russell is not touchable, the rule fails;
	if good gun is moot:
		say "You already got rid of the good gun.";
		continue the action;
	the rule succeeds;

this is the vr-wood-one rule:
	say "The good gun turns into a wood one in Reeker Russell's hands! He throws it away in disgust.";
	moot good gun;
	check-russell-go; [nec]
	the rule succeeds;

this is the vc-work-well rule:
	if jerk gel is not touchable, the rule fails;
	the rule succeeds;

this is the vr-work-well rule:
	say "You work to put all the jerk gel back in. It becomes glowing globs.";
	now the player has the jerk gel;
	the rule succeeds.

[zzvcvr]

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
		say "Currently I'm just worried about what there is up until the Fun Fen and if it's hinted well enough, but if you want to poke around more, feel free to go ahead.";
		if fun fen is unvisited:
			say "[line break]You can SLOW SIGH or BLOW BY or FLOW FLY to jump to the nonlinear part and avoid the introduction.[paragraph break]You can [b]TRICK TRIP or SLICK SLIP before reaching the main area, as well, to skip past the current puzzle. You'll know the main area, because it is non-linear.";
		if airy isle is unvisited:
			say "[line break]Also, you can [b]CLIMB CLEAR[r] to jump to the (relatively brief) endgame, and LLA leet-learns everything in sight.";
	continue the action;

this is the too-late-for-beta rule:
	if fun fen is visited or airy isle is visited, say "It's too late to use the TRICK TRIP/BLOW BY commands." instead;

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
	repeat through table of verb checks:
		now idid entry is true;
		if cur-row is whew-score, break;
		increment cur-row;
	abide by the too-late-for-beta rule;
	process the any-warp rule;
	now score is whew-score;
	now core-score is whew-score;
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
	now score is min-needed - whew-score + min-gotten;
	now core-score is score;
	now maximum score is min-needed;
	the rule succeeds.

volume map index

index map with Trim Tram mapped east of Real Rear.
index map with Po' Pit mapped east of Trim Tram.
index map with Vined Vault mapped east of Po' Pit.
index map with Vined Vault mapped south of Wet Wood.

section odd directions

index map with Y'Old Yard mapped south of Got Gear Hot Here.

section endrooms

index map with Tarry Tile mapped north of Airy Isle.

section altrooms

index map with Vending Vibe mapped south of Po' Pit.
index map with Curst Cave mapped south of Vined Vault.

section metarooms [these are need to go somewhere]

index map with Gazy Gap mapped south of Trim Tram.
index map with Hidey House mapped west of Gazy Gap.

section side room to include

include Very Vile Fairy File Fake Rooms by Andrew Schultz.
