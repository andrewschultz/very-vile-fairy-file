"Very Vile Fairy File" by Billy Boling

[??!!!!!! violent vale/silent sale/sail]

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
	abide by the bore-rule of noun;
	if skip-bore-text is true:
		now skip-bore-text is false;
		continue the action;
	if bore-text of noun is not empty, say "[bore-text of noun]" instead;
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
			say "[if ever-wry-wall is true]Well, that's another joke death trap visited[else]NOTE: The wry wall just leads to a bunch of joke deaths. You can avoid them or follow them as you please. You don't get any bonus for finding them all, but maybe you'll find them fun[end if]. Let's kick you back to where you were.";
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

part Vined Vault 3,-1

Vined Vault is a room in Worst Whew. "[if mean mass is in Vined Vault]You found fault in the Vined Vault, but you still can't leave.[else]You're stuck here! There looks to be no way out. It looks like a perfect trap, but...[end if]". noway-text is "You can't tell directions here, but then again, there's no actual unblocked way out. You need to use your head[if mean mass is in vined vault] again[end if].". cht of vined vault is partminus. [-> find fault]

chapter Mind Malt

a packet of Mind Malt is a thing in Vined Vault. description is "It looks like there used to be Mind Malt, or powder that could make Mind Malt, here. Pity. It could've helped you figure what to do!". cht of Mind Malt is partplus. [-> find fault]

check taking Mind Malt: say "Worthless. It's empty." instead;

chapter mean mass

The mean mass is a thing. "The mean mass continues to pulse and block the way out of the Vined Vault.". description is "The mean mass doesn't quite attack you, but it hangs menacingly, unnaturally, too dangerous to walk through.". cht of mean mass is letplus. [-> green grass]

part Po' Pit 2,-1

Po' Pit is a room in Worst Whew. "Just beyond a trash trap ... an obvious one, no less ... looks like freedom, of a sort. You've got to get by! There is a row writ, which may or may not be helpful, by an obvious trash trap that guards a long gash gap.". noway-text is "You can't go back, and directions don't seem to apply here. You need to think your way past the trash trap.". cht of po' pit is letplus. [-> grow grit]

the row writ is scenery in Po' Pit. "[if grit-grown is true]It doesn't seem to be helpful any more, but it got you started. Yay[else]It's obviously meant to be motivational, but it's the sort of motivation that says if you want to do better, you have to be better. Be more of a person and have more hustle or desire. Still, despite its lack of detail, perhaps it is in the Po['] Pit for a reason[end if].". cht of row writ is partplus. [-> grow grit]

the trash trap is boring scenery in Po' Pit. "It's pretty obvious that if you step on the trap, you'll plunge into a further pit.". cht of trash trap is letminus. bore-text of trash trap is "You want to NOT do anything with the trash trap. You don't know what could set it off.". [-> mash map]

the cache cap is a boring thing in Po' Pit. "A cap sits here, with half its bill under something. You're not going to pull it out. It's intricately designed. I guess you could call it a cache cap, since it is stuck.". description is "Oh, look here. The cache cap has a layout of the Po['] Pit, along with the gash gap and trash trap. Okay, maybe layout isn't quite the right word. But it seems to indicate there's no way through. [if grit-grown is false]You'd like to believe there is[else]With your new-found confidence, perhaps the right action could convince you otherwise[end if].". cht of cache cap is partminus. bore-text of cache cap is "The cache cap is only there to (sort of) help you figure how to get beyond the Po['] Pit.". bore-rule of cache cap is bore-cache-cap rule. [-> mash map]

the gash gap is boring scenery in Po' Pit. "It looks intimidating, but who knows? Maybe you can figure a way across.". cht of gash gap is leteq. bore-text of gash gap is "The gash gap is an obstacle you need to find a special way around.". [-> mash map]

understand "map" as trash trap when player is in Po' Pit.

this is the bore-cache-cap rule:
	if current action is taking, say "No, the cache cap is too tacky. Perhaps it can help you in other ways." instead;

bash-not-mash is a truth state that varies.

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

the backed binder is a thing.

chapter Cark Cliff

Cark Cliff is optional proper-named scenery in Fun Fen. "[if wild weed is moot]You don't feel so worried about Cark Cliff now[else]It's intimidating, but it would be neat if it weren't[end if].". cht of cark cliff is letplus. [-> spark spliff] [?? bark biff]

[the fame fighter is a thing ?? -- lame lighter / spark spliff]

tree-down is a truth state that varies.

part Real Rear 0,-1

Real Rear is south of Fun Fen. Real Rear is in Piddling Pain. "Yup. This feels about like the edge of where you can explore. You can really only go back north. A peeling pier leads out south to the Sage Sea, which expands on all sides. There's also a steel steer here, and you sense the presence of a Ceiling Seer as well. This seems like a place for reflection on your emotions.". noway-text is "The Sage Sea surrounds you all ways except back north[if cage key is not off-stage]. You already got the cage key from it, anyway[end if]. You also sense a Ceiling Seer above, judging what you do.". cht of real rear is partplus. [-> kneel near]

chapter ceiling seer

the ceiling seer is boring scenery in Real Rear. "The Ceiling Seer is all around. You can't do anything with it, [if healed-here is true]and it's given enough[else if knelt-yet is true]. though you may be able to gain more favors[else]though if you do the right thing, you may be worthy of a few favors[end if]."

chapter Sage Sea

the Sage Sea is scenery in Real Rear.

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

Creased Cross is north of Fun Fen. Creased Cross is in Piddling Pain. "This feels like a boring old intersection, but you sense it may need to be so much more, later. You can go in all four directions here.". cht of creased cross is letminus. [-> beast boss]

chapter Bull Beast

The Bull Beast is a person. talk-text is "'Tame? Tush! Maim! Mush!'". "[if cull-ceased is true]The Bull Beast lies dead here[else]The Bull Beast roars around here[end if].". bore-text of Bull Beast is "The Bull Beast is dead. No need to muck around.".

cull-ceased is a truth state that varies.

least-loss is a truth state that varies.

beast-boss-min is a number that varies. beast-boss-min is 32.

part Stark Store -1,1

Stark Store is west of Creased Cross. cht of stark store is letminus. Stark Store is in Piddling Pain. "[if dark door is in stark store]A dark door leads to the west. You have no idea how to open it[else if dark door is moot]There's a way west where the dark door was[else]Nothing's here! But perhaps you could find something[end if]."

check going west in Stark Store:
	if dark door is off-stage, try going north instead;
	if dark door is in Stark Store, say "You can't seem to get past the dark door." instead;

There is a thing called the dark door. It is scenery. "You can't seem to open the dark door. It's there, and it's forbidding.".

part History Hall -2,1

mistmall is a truth state that varies.

History Hall is west of Stark Store. cht of history hall is leteq. History Hall is in Piddling Pain. printed name of History Hall is "[if mistmall is true]Mystery Mall[else]History Hall[end if]". "You can go back east here. [if ever-mall is false]The wall to the west seems hollow[else if mistmall is true]History Hall's wist-eerie wall has disappeared, affording passage west[end if][if oi mo is in History Hall]. There's a horrible song providing atmosphere[else if toe tappin is in History Hall]. A mediocre song is in the air[end if].". [-> mystery mall]

Name Notes Tame Totes is scenery in History Hall. "You read about [next-rand-txt of table of miscellaneous people]."

the Gutta Ganksta is an optional person. description is "GOTS GAME is tattooed on the Gutta Ganksta.". talk-text is "'Chill, chap. Will WHAP!'". cht of gutta ganksta is partplus. [-> whatta wanksta]

GOTS GAME is part of the Gutta Ganksta. cht of gots game is leteq. [-> lots lame]

after lling gutta ganksta:
	if cht of gots game is leteq:
		say "But the GOTS GAME tattoo is worth scanning, too, so you do so.";
		try lling gots game;
	continue the action;

Toe Tappin Row Rappin is scenery. "You [one of]listen a bit. The song is Toe Tappin Row Rappin['], and it's actually pretty catchy and good and might help you in the future. It's stuck in your head now, and that's not all bad. It could almost be motivational in the right place[or]already have the song in your head. Perhaps it will be useful to see things differently[stopping]."

understand "song" as toe tappin row rappin when player is in History Hall and oi mo is in History Hall.

after examining Toe Tappin Row Rappin:
	if player does not have Row Rappin, now player has Row Rappin;
	continue the action;

Oi Mo by Tim T Sims Pimp is optional scenery. "It's a truly awful song. If you could find a way to turn it down...". cht of oi mo is leteq. [oimo -> dimd]

understand "song" as oi mo when player is in History Hall and oi mo is in History Hall.

check going west in History Hall:
	if mistmall is true, continue the action;
	say "[if ever-mall is true]You'll have to change back to History Hall[else]Thud! But a hollow thud. Maybe shifted around a bit, History Hall might afford passage west[end if]." instead;

Mean Moe's Clean Clothes is scenery. "It's some sort of machine you could use to clean something that needed it."

chapter mysterymalling

ever-mall is a truth state that varies.

ever-hall is a truth state that varies.

lots-lame is a truth state that varies.

floor-yet is a truth state that varies.

part Erst Lore -2,0

Erst Lore is a room in Piddling Pain.

part Y'Old Yard -2,-1

Y'Old Yard is south of Erst Lore. It is in Piddling Pain.

The Bold Bard is a person in Y'Old Yard. talk-text of bold bard is "'Scold-scarred. Mold-marred.'".

Hold Hard is scenery in Y'Old Yard.

the gold guard is a thing.

part Vending Vibe -2,1 a

Vending Vibe is a room in Piddling Pain. "You can only go back east here."

The Trending Tribe are plural-named people in Vending Vibe. cht of trending tribe is letminus. talk-text is "'Bam, burning! Am earning!'". [-> lending libe]

the Lending Libe is scenery. "Looking in, you see one book labeled [i][next-rand-txt of table of vvff books][r]. This locational libe has no vocational vibe.";

part Got Gear Hot Here -2,1 b

Got Gear Hot Here is a room in Piddling Pain. It is west of History Hall.

chapter hardhating

the marred mat is a thing in Got Gear Hot Here. description is "What is a marred mat doing in a clothing store? Either it's misplaced, or ... it's more appropriate in another form. It has a message, of course.". "You can't imagine what a marred mat is doing in a clothing store, but here it is.".

check taking marred mat: say "It can't be useful in that form." instead;

the hard hat is a thing.

check taking off hard hat: say "No. Something will come out of nowhere to conk you on the head, and then you'd be sorry. If you were conscious enough to be sorry." instead;

part Violent Vale 1,1

Violent Vale is east of Creased Cross. It is in Piddling Pain. cht of Violent Vale is partminus. "Creased Cross is back west, and it's sort of watery to the north or south. [if fridge is in Vale]A frightening fridge towers over you to the east. Boy, it's scary here. Maybe getting rid of the fridge would help[else if silent-sale is true]It's not really violent here at all any more[else]There's just the memory of how violent it was, but maybe you can change that[end if]."

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

this is the boat-drift rule:
	if beer bull is moot and jake g is moot:
		say "[line break]After a moment, the boring boat floats off, its job likely done.";
		moot boring boat;
	the rule succeeds;

check entering boring boat:
	if player is in Been Buggin':
		if player does not have clay cloak, say "You have not properly passed all the tests you need to return and defeat the Beer Bull." instead;
		say "With your clay cloak in hand, you return to [Violent Vale]. There, with your newfound mental and physical strength, you defeat the Beer Bull!";
		moot Beer Bull;
		move player to violent vale;
		abide by the boat-drift rule;
		the rule succeeds;
	if player is in lake lea:
		say "You take the boring boat back to [Violent Vale].";
		move boring boat to violent vale;
		move player to violent vale;
		the rule succeeds;
	if jake g is moot, say "You already did all you could in Lake Lea." instead;
	if beer bull is in Violent Vale:
		say "You take the boring boat but temporarily lose all sense of direction. You go somewhere new, somewhere interesting... but when you get there, well, it feels like a tough new challenge.";
		move boring boat to Been Buggin';
		move player to Been Buggin';
	say "You take the boring boat [if lake lea is unvisited]somewhere new[else]back to Lake Lea[end if].";
	move boring boat to Lake Lea;
	move player to Lake Lea;
	the rule succeeds;

part Lake Lea 3,2

Lake Lea is a room. It is in Piddling Pain. "You're on the Lake Lea, which borders on Lake Lap to the east.".

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

Whining War is east of Violent Vale. It is in Piddling Pain. "You can't get a close enough view.". cht of whining war is partplus. [-> shining shore]

[??mining more / dining door]

Ache App is a thing.

mine-more is a truth state that varies.

dine-door is a truth state that varies.

shore-shine is a truth state that varies.

part Lake Lap ??,??

Lake Lap is east of Lake Lea. It is in Piddling Pain.

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

part Been Buggin'

Been Buggin' is a room in Piddling Pain. cht of Been Buggin' is leteq.

Dean Duggan is a person in Been Buggin'.

mean-mugged is a truth state that varies.

lean-lugged is a truth state that varies.

to decide whether dean-done:
	if mean-mugged is true and lean-lugged is true, yes;
	no;

part Soft Sand 0,2

Soft Sand is a room in Piddling Pain. Soft Sand is north of Creased Cross. cht of soft sand is leteq. "You can go all four directions here.". [-> loft land]

ever-loft is a truth state that varies.

loft-land is a truth state that varies.

check going west in Soft Sand:
	if loft-land is false and jerk gel is not in Shirk Shell, say "The smirk smell is too repulsive. You can't go back." instead;

part Here Hull 1,2

Here Hull is a room in Piddling Pain. It is east of Soft Sand.

The Beer Bull is a person in Here Hull. cht of beer bull is partminus. talk-text is "It can't speak, but its look says 'Real rude? Deal, dude!'". [->fear ful]

to decide whether hull-bull:
	if player is in Here Hull or beer bull is in location of player, yes;
	no;

to reset-bull:
	move beer bull to Here Hull;
	now cht of beer bull is partminus; [beer bull->fear ful]

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

Shirk Shell is a room in Piddling Pain. It is west of Soft Sand.

the jerk gel is a thing in Shirk Shell.

understand "glowing/globs" and "glowing globs" as jerk gel when player has jerk gel.

check taking jerk gel when jerk gel is in Shirk Shell:
	say "The jerk gel has spilled out a bit." instead;

part Curst Cave -1,2 b

Curst Cave is a room in Piddling Pain. "You can only go back east[tap-in-cave]."

the worst wave is scenery in Curst Cave.

the screaming skull is a thing in Curst Cave.

check taking screaming skull: say "You need to 'take' it figuratively." instead;

to say tap-in-cave:
	if tool tap is in Curst Cave, say ". A tool tap sits where the worst wave used to be[if cool cap is not off-stage], but you already got something from it[else], and you haven't gotten anything interesting from it yet[end if]."

the tool tap is scenery.

the cool cap is a thing.

chapter firstfaveing

firstfaveing is an action applying to nothing.

understand the command "firstfave" as something new.
understand the command "first fave" as something new.

understand "firstfave" as firstfaveing when player is in Curst Cave.
understand "first fave" as firstfaveing.

first-fave is a truth state that varies.

part Foe Field So Sealed 0,3

Foe Field So Sealed is a room in Piddling Pain. It is north of Soft Sand. printed name is "Foe Field[if shield-shown is false] So Sealed[end if]". "[if shield-shown is false]You detect a presence blocking you from going north, but[else]You removed the impediment west, and[end if] you can still go west to a quieter, darker area."

check going west in Foe Field So Sealed: if shield-shown is false, say "A booming voice calls 'YO! YIELD!' You need to find a way to protect yourself from it." instead;

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

the Bot Board are plural-named people in Airy Isle. "[one of]A Bot Board stands here, impassive, emotionless, not looking for a fight but looking extremely hard to budge[or]The Bot Board stands here, unrattled[if lot lord is in airy isle or hot horde is in airy isle] despite your having summoned help[end if][stopping].". talk-text is "Meep, mate! Heap hate! Weep, wait!"

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
	if player is in History Hall:
		if Toe Tappin Row Rappin is in History Hall, try examining Row Rappin instead;
		if Oi Mo is in History Hall, say "Tim T. Sims, Pimp, still sings [i]Oi, Mo[r]. The chorus mentions double duty, which, eww. Maybe there's a way to quiet it down." instead;
		say "A random song plays briefly: [next-rand-txt of table of miscellaneous people]." instead;
	say "Nothing special."

chapter thinking

thought-any is a truth state that varies.

to say tat: now thought-any is true;

ever-thought is a truth state that varies.

the block thinking rule is not listed in any rulebook.

check thinking:
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
			if ready-to-hint entry is true, say "(re-checking) ";
			now ready-to-hint entry is true;
			continue the action;
	say "Oops. I tried to hint something for later, but failed. This is a bug I need to know about. Text = [ct].";

first-think-clue-flag is a truth state that varies.
ever-think-flag is a truth state that varies.

every turn when first-think-clue-flag is true and ever-think-flag is false (this is the note first think rule):
	if ever-think-flag is false, say "[line break]NOTE: this is the first time you guessed a command right but aren't ready to use it, yet. These commands will be tracked under THINK, with clues as to when they work.";
	now ever-think-flag is true;
	continue the action;

chapter score

check requesting the score:
	say "You have scored a total of [score] out of [maximum score] points in [turn count] moves. You have found [min-gotten] optional points so far and need [min-needed] to win.";
	say "[line break]Your current[one of] (utterly meaningless but hopefully amusing)[or][stopping] rank is [your-rank].";
	let dh be doable-hinted;
	let fh be future-hinted;
	if dh + fh > 0, say "[line break]You also have [dh + fh in words] task[plur of dh + fh] you performed when you weren't quite ready. [if dh is 0][fh in words] still need[plur of fh] to wait[else if fh is 0][dh in words] can be done now[else][dh in words] can be done now, but [fh in words] can't, yet[end if]. You can see more detailed information with THINK.";
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
leet learner	"Some multi-colored text on the leet learner (itself written in yellow) seems to function as examples.[paragraph break][table-of-color-hints][run paragraph on]"
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
	say "[2da]You can use the general directions, but you often have to figure out what to do, here. It's a guess the verb situation, but not really.";
	say "[2da][b]HELP HOW[r] and [b]WELP WOW[r] toggle the [b]HINT[r] command on and off, respectively. Currently they are [on-off of help-how].";
	say "[2da]The Leet Learner can help you determine what needs to be changed. [ll] or [b]CC[r] is the shorthand for scanning a location, and [ll] or [b]CC[r] (any thing) scans it.";
	say "[2da][llon-cmd] turn the Leet Learner on while [lloff-cmd] turn it off. Currently it is [on-off of shut-scan]. You can also use it to tweak other clues with [b]TWO TOO[r]/[b]DO DUE[r] or [b]HA HALF[r]/[b]NAH NAFF[r].";
	say "[2da][b]EXITS[r] lists exits available.";
	the rule succeeds.

chapter creditsing

creditsing is an action out of world.

understand the command "credits" as something new.

understand "credits" as creditsing.

carry out creditsing:
	say "Thanks to Wade Clarke for testing.";
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
	if noun is leet learner, say "It's great as it is. You don't want to change it." instead;
	if cht of noun is phbt, say "The leet learner turns up nothing." instead;
	if noun is peeling pier and healed-here is false, say "It seems like the leet learner is registering something everywhere except on the peeling pier, here." instead;
	say "The leet learner light turns [if noun is optional]faint[else]solid[end if]ly [scancol of cht of noun] as you [if noun is a room]wave it around[else]focus it on[end if][if the noun is not a room] [the noun][end if].";
	if ever-opt-scan is false:
		say "[line break]The faint light must mean something. The learner is usually lit solidly or not at all.";
		now ever-opt-scan is true;
	if noun is two-too, say "[line break]The 'two too' light on the Leet Learner also appears[two-too-yet].";
	the rule succeeds.

to say two-too-yet:
	if ever-two-too is false, say ". Hmm. You have a good idea what that means";
	now ever-two-too is true;

to say leetclue of (x - a cheattype): if shut-scan is false, say "[line break]As you say/think this, the Leet Learner momentarily turns [scancol of x].[line break]"

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
room-hint-rule of Pit Pound is pit-pound-hint rule.
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
the thing-hint-rule of hit hound is hit-hound-hint rule.
the thing-hint-rule of hive heap is hive-heap-hint rule.
the thing-hint-rule of Hold Hard is hold-hard-hint rule.
the thing-hint-rule of Hot Horde is bot-board-hint rule.
the thing-hint-rule of jerk gel is jerk-gel-hint rule.
the thing-hint-rule of Kerry Kyle is kerry-kyle-hint rule.
the thing-hint-rule of leet learner is leet-learner-hint rule.
the thing-hint-rule of Lending Libe is lending-libe-hint rule.
the thing-hint-rule of Lot Lord is bot-board-hint rule.
the thing-hint-rule of mind malt is mind-malt-hint rule.
the thing-hint-rule of marred mat is marred-mat-hint rule.
the thing-hint-rule of mean mass is mean-mass-hint rule.
the thing-hint-rule of mild mead is mild-mead-hint rule.
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
the thing-hint-rule of ha half nah naff is ha-half-nah-naff-hint rule.
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

this is the ha-half-nah-naff-hint rule:
	say "HA HALF will tell you if one of your words is right. NAH NAFF hides that.";

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

this is the hit-hound-hint rule:
	say "[one of]The hit hound can smell fear. You can't really run or lash out at it.[or]You need to stand your ground or, figuratively...[or]You can SIT SOUND.[stopping]"

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

this is the mind-malt-hint rule:
	say "The mind malt is just there to give another clue about weaknesses in the Vined Vault."

this is the two-too-hint rule:
	say "The two too button indicates that there may be an alternate homonym/spelling solution to a puzzle."

this is the leet-learner-hint rule:
	say "[one of]First, note the leet learner may give different readings if you scan an area or an item. If it gives a reading when you scan an area, you can do something with the room.[or]So the big thing is, probably, what do the colors on the leet learner mean? Read it again, if you haven't.[or]LEET LEARNER and MEET MOURNER both are in yellow, suggesting that spelling may be an unimportant variable.[or]What do MOURNER and LEARNER have in common?[or]MOURNER and LEARNER both have seven letters. LEET and MEET also each have four letters.[or]The color the leet learner gives when you scan is related to how many letters are in the solution.[or]CONCEIT CONCERNER adds letters to each word, and it is blue.[or]CHEAT CHURNER adds a letter only to LEET, and it is green. Note the mnemonic that green is blue plus yellow.[or]EAT EARNER takes one letter each from LEET LEARNER. It is red. So red is subtraction.[or]BEAT BURNER is in orange. It only takes one letter from one word.[or]So orange, a combination of yellow and red, means you need to drop a letter or letters from one word.[or]Finally, TREAT TURNER adds a letter and subtracts another. What's up with that?[or]In this case, brown is a small muddle of colors. I suppose it could be purple, too, but that might give people a false rainbow hint.[or]There's one more thing: some items may cause the leet learner to blink. You may be able to guess what this means.[or]Items that make the learner blink are optional.[or]So, in conclusion: for the leet learner, blue means add letters, red means subtract, yellow means keep letters. Blue or red mixed with yellow means add letters to only one word. Blinking means the target is optional.[stopping]";
	the rule succeeds;

this is the lending-libe-hint rule:
	say "Now that you have the Lending Libe, you can take whatever books you need."

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
	if debug-state is false, ask-screenread;
	anonymously abide by the check-skip-intro rule;
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

section when play begins - not for release

volume meta

book region and rooms

Gazy Gap is a room in Get a Guess. [crazy crap]

Hidey House is a room in Get a Guess. [mighty mouse: stuff that's only temporarily gone]

book meta verbs

check quitting the game: say "You say to yourself, not fully convinced, 'Best bit? Quest quit!'";

volume unsorted

The silly sign is scenery. "The silly sign reads 'One of many by Willie Wines and Tillie Tines.'[line break][sign-dir]"

the clay cloak is a thing. description is "It's unwearable in its current state and may just bog you down."

the clashing cloak is a thing. description is "It seems suited for more than just fashionable conflict, if you knew what to do."

chapter glowglading

glowglading is an action applying to nothing.

understand the command "glow glad" as something new.

understand "glow glad" as glowglading when in-so-sad is true.

in-so-sad is a truth state that varies.
in-so-saded is a truth state that varies.

the get-sad rule is listed after the notify score changes rule in the turn sequence rulebook.

this is the get-sad rule:
	if in-so-saded is false and in-so-sad is false and score >= 30:
		now in-so-sad is true;
		say "Everything feels pointless. You're sick of these silly rhymes. You feel so sad, mo['] mad.";
		now cht of the player is letplus; [so sad->glow glad]
	the rule succeeds;

every turn when in-so-sad is true:
	say "So sad ... so sad ... you feel so depressed and upset. Maybe there's an easy way out of this, but you wouldn't feel accomplished. And if there's a hard way out of this, it's too hard.";

instead of doing something when in-so-sad is true:
	if action is procedural, continue the action;
	if current action is glowglading, continue the action;
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
	the rule succeeds;

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

part Pit Pound

Pit Pound is a room in Piddling Pain. it is east of Foe Field. cht of Pit Pound is leteq. printed name of Pit Pound is "[if found-fit is true]Pit Pound[else]Grit Ground[end if]". [->sit sound]

The Hit Hound is a person in Pit Pound. cht of Hit Hound is leteq. [->sit sound]

found-fit is a truth state that varies.

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
	if lots-lame is false, say "You could've said the Gutta Ganksta's Gots Game tattoo was LOTS LAME in Mystery Mall.";
	if ganksta is not moot, say "You could've said WHATTA WANKSTA or WHAT A WANKSTA to the Gutta Ganksta for a further insult.";
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

Rule for printing a parser error when the latest parser error is the i beg your pardon error:
	say "Blank blather? Rank! Rather!"

the clue half right words rule is listed first in the for printing a parser error rulebook.

Rule for printing a parser error (this is the clue half right words rule):
	abide by the verb-checker rule;
	abide by the mistake-checker rule;
	continue the action;

Rule for printing a parser error when the latest parser error is the didn't understand error or the latest parser error is the not a verb I recognise error:
	say "You may have used an unrecognized verb, or a verb in the wrong context. Or maybe you just guessed the wrong action to solve a puzzle, and it wasn't close enough that I could offer a hint--if you feel I should add something, write to [email]. Or perhaps you poked at some scenery I neglected to implement or describe as unimportant to progress.[paragraph break][b]VERBS[r] can show you a list used in this game. More obscure verbs from old-school parser games have been disabled, to help you focus on the puzzles.";

ha-half is a truth state that varies.

zap-core-entry is a truth state that varies.

this is the verb-checker rule:
	repeat through the table of verb checks:
		let my-count be 0;
		if the player's command matches the regular expression "\b([w1 entry])\b", increment my-count;
		if there is no w2 entry:
			increment my-count;
		else:
			if the player's command matches the regular expression "\b([w2 entry])\b", increment my-count;
		let wfull-fail be false;
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
				if okflip entry is false:
					unless the player's command matches the regular expression "^([w1 entry])\b": [this is for the DIM'D test case]
						say "You've got it backwards! Just flip things around, and it'll be okay.";
						the rule succeeds;
				if wfull-fail is true:
					say "Ooh! You're close, but you juggled things up, somehow.";
					the rule succeeds;
				if there is a core entry: [I am cheating here to get a 3-way choice. Having something empty means you don't get a point, true means it's regular, false means it's optional]
					if core entry is true:
						up-reg;
					else:
						up-min;
				process the do-rule entry;
				if zap-core-entry is true:
					blank out the core entry;
					now zap-core-entry is false;
				process the notify score changes rule;
			process the note first think rule;
			the rule succeeds;
		if ha-half is true and my-count is 1:
			process the ver-rule entry;
			if the rule failed, next;
			say "The HA HALF button lights up on your Leet Learner.";
			the rule succeeds;

this is the mistake-checker rule:
	repeat through table of mistake substitution:
		if the player's command matches mist-cmd entry:
			process the mist-rule entry;
			if the rule succeeded:
				say "[mist-txt entry][line break]";
				if there is a leet-rule entry:
					process the leet-rule entry;
					unless the rule succeeded, the rule succeeds;
				if there is a leet-val entry:
					say "[leetclue of leet-val entry][line break]";
				else if there is a leet-rule entry:
					say "Oops. There should be a clue here, but there isn't. A BUG but not a game breaker.";
				the rule succeeds;

section verb check table

[verb check and verb run rules. This is in approximate game-solve order.]

table of verb checks [xxvc]
w1 (text)	w2 (text)	okflip	core	ver-rule	do-rule	wfull (topic)
"get"	"good"	false	true	vc-get-good rule	vr-get-good rule	-- [start Intro]
"find"	"fault"	true	true	vc-find-fault rule	vr-find-fault rule	--
"green"	"grass"	false	true	vc-green-grass rule	vr-green-grass rule	--
"grow"	"grit"	true	true	vc-grow-grit rule	vr-grow-grit rule	--
"bash|mash"	"bap|map"	true	true	vc-mash-map rule	vr-mash-map rule	"bash bap" or "mash map"
"mind"	"me"	false	true	vc-mind-me rule	vr-mind-me rule	--
"flim|skim"	"flam|scam"	false	true	vc-flim-flam rule	vr-flim-flam rule	"flimflam" or "flim flam" or "skim scam"
"big"	"bag"	true	true	vc-big-bag rule	vr-big-bag rule	-- [start of Fun Fen]
"spark"	"spliff"	true	false	vc-spark-spliff rule	vr-spark-spliff rule	--
"strong"	"start"	true	false	vc-strong-start rule	vr-strong-start rule	--
"fall"	"free"	true	true	vc-fall-free rule	vr-fall-free rule	--
"dive"	"deep"	true	true	vc-dive-deep rule	vr-dive-deep rule	--
"paper"	"pile"	false	true	vc-paper-pile rule	vr-paper-pile rule	--
"backed"	"binder"	false	true	vc-backed-binder rule	vr-backed-binder rule	--
"kneel"	"near"	false	true	vc-kneel-near rule	vr-kneel-near rule	-- [start of Real Rear]
"feel"	"fear"	false	true	vc-feel-fear rule	vr-feel-fear rule	--
"deal"	"dear"	true	true	vc-deal-dear rule	vr-deal-dear rule	--
"heal"	"here"	true	true	vc-heal-here rule	vr-heal-here rule	--
"history"	"hall"	false	--	vc-history-hall rule	vr-history-hall rule	--
"mystery"	"mall"	false	true	vc-mystery-mall rule	vr-mystery-mall rule	--
"dark"	"door"	false	true	vc-dark-door rule	vr-dark-door rule	-- [start stark store]
"mark"	"more"	false	true	vc-mark-more rule	vr-mark-more rule	--
"lots"	"lame"	false	false	vc-lots-lame rule	vr-lots-lame rule	-- [start Mystery Mall]
"so"	"sappin"	false	true	vc-so-sappin rule	vr-so-sappin rule	--
"dimd"	--	false	false	vc-dimd rule	vr-dimd rule
"whatta"	"wanksta"	false	true	vc-whatta-wanksta rule	vr-whatta-wanksta rule	"what a wanksta" [?? this will create problems if we do it this way. It would be nice to say, if there is no | in w1 or w2, it's okay ]
"first"	"floor"	false	true	vc-first-floor rule	vr-first-floor rule	--
"lending"	"libe"	false	true	vc-lending-libe rule	vr-lending-libe rule	-- [start trending tribe]
"hard"	"hat"	false	true	vc-hard-hat rule	vr-hard-hat rule	-- [start got gear hot here]
"beast"	"boss"	true	true	vc-beast-boss rule	vr-beast-boss rule	-- [start Creased Cross]
"cull|lul"	"ceased|least"	true	true	vc-cull-ceased rule	vr-cull-ceased rule	-- [?? maybe put something on the previous line, if you get a match, then wait for the next actual rule]
"full"	"feast"	true	true	vc-full-feast rule	vr-full-feast rule	--
"least"	"loss"	true	true	vc-least-loss rule	vr-least-loss rule	--
"dear"	"dull"	true	true	vc-dear-dull rule	vr-dear-dull rule	--
"loft"	"land"	false	true	vc-loft-land rule	vr-loft-land rule	-- [start soft sand]
"soft"	"sand"	false	--	vc-soft-sand rule	vr-soft-sand rule	--
"show"	"shield"	true	true	vc-show-shield rule	vr-show-shield rule	-- [start foe field]
"cool"	"cap"	true	true	vc-cool-cap rule	vr-cool-cap rule	-- [start curst cave]
"dreaming"	"dull"	true	true	vc-dreaming-dull rule	vr-dreaming-dull rule	--
"first"	"fave"	false	true	vc-first-fave rule	vr-first-fave rule	--
"moral"	"mage"	false	true	vc-moral-mage rule	vr-moral-mage rule	--
"brightening"	"bridge"	false	true	vc-brightening-bridge rule	vr-brightening-bridge rule	-- [start Violent Vale]
"silent"	"sail|sale"	false	true	vc-silent-sail rule	vr-silent-sail rule	--
"boring"	"boat"	false	true	vc-boring-boat rule	vr-boring-boat rule	--
"shining"	"shore"	false	true	vc-shining-shore rule	vr-shining-shore rule	-- [start whining war]
"mining"	"more"	true	true	vc-mining-more rule	vr-mining-more rule	--
"dining"	"door"	false	true	vc-dining-door rule	vr-dining-door rule	--
"cast"	"cap"	false	true	vc-cast-cap rule	vr-cast-cap rule	-- [start gassed gap]
"beaker"	"bustle"	true	false	vc-beaker-bustle rule	vr-beaker-bustle rule	--
"meeker"	"muscle"	true	true	vc-meeker-muscle rule	vr-meeker-muscle rule	--
"wood"	"one"	false	true	vc-wood-one rule	vr-wood-one rule	--
"lot"	"lord"	false	true	vc-lot-lord rule	vr-lot-lord rule	-- [start airy isle]
"hot"	"horde"	false	true	vc-hot-horde rule	vr-hot-horde rule	--
"got"	"gored"	false	true	vc-got-gored rule	vr-got-gored rule	--
"whoa"	"wait"	true	true	vc-whoa-wait rule	vr-whoa-wait rule	--
"tell"	"torn"	false	true	vc-tell-torn rule	vr-tell-torn rule	-- [start tarry tile/merry mile]
"merry"	"mile"	false	true	vc-merrymile rule	vr-merrymile rule	--
"bury"	"bile"	false	true	vc-bury-bile rule	vr-bury-bile rule	--
"wild"	"weed"	true	false	vc-wild-weed rule	vr-wild-weed rule	-- [start of undefined]
"sit"	"sound"	false	true	vc-sit-sound rule	vr-sit-sound rule	--
"fit"	"found"	true	true	vc-fit-found rule	vr-fit-found rule	--
"bumped"	"buster"	true	true	vc-bumped-buster rule	vr-bumped-buster rule	--
"glow"	"glad"	true	true	vc-glow-glad rule	vr-glow-glad rule	-- [start interlude-y]
"stay"	"strong"	false	true	vc-stay-strong rule	vr-stay-strong rule	--
"cold"	"card"	false	true	vc-cold-card rule	vr-cold-card rule	-- [start unsorted]
"work"	"well"	true	true	vc-work-well rule	vr-work-well rule	--

[ this is stuff for beta commands below ]

in-test-loop is a truth state that varies.

section to-x stubs

to say seer-sez: say ". The Ceiling Seer seems to be watching down on you, saying you can't do that yet"

to loop-note (t - text):
	if in-test-loop is true, say "COMMAND: [t]...[paragraph break]";

to win-the-game:
	[rejig-status;]
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

section vc vr rules

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

this is the vc-silent-sail rule:
	if player is not in violent vale, the rule fails;
	if flooring float is not off-stage, say "You already called up the flooring float[if boring boat is not off-stage] and boring boat[end if]." instead;
	the rule succeeds;

this is the vr-silent-sail rule:
	say "Suddenly fom the watery depths, a flooring float pops up! It looks -- impractical for going anywhere, but man, is it aesthetic!";
	move flooring float to violent vale;
	the rule succeeds;

this is the vc-dark-door rule:
	if player is not in stark store, the rule fails;
	if dark door is not off-stage, say "You already made the dark door appear[if dark door is moot] and disappear to create a passage[end if]." instead;
	the rule succeeds;

this is the vr-dark-door rule:
	say "A dark door appears to the west!";
	move dark door to Stark Store;

this is the vc-mark-more rule:
	if player is not in stark store, the rule fails;
	if dark door is off-stage:
		clue-later "MARK MORE";
		say "That'd work, if there was something to mark." instead;
	if dark door is moot, say "You saw what you could." instead;
	the rule succeeds;

this is the vr-mark-more rule:
	say "Yes, there's more to the stark store than the dark door. You notice things about it--as well as how to take it off its hinges!";
	moot dark door;

this is the vc-lot-lord rule:
	if player is not in airy isle, the rule fails;
	if Lot Lord is not off-stage, say "You already summoned the Hot Horde." instead;
	the rule succeeds;

this is the vr-lot-lord rule:
	move lot lord to airy isle;
	say "The Lot Lord whirls in from above, only looking slightly stunned.";
	check-gored-clue;
	the rule succeeds;

this is the vc-hot-horde rule:
	if player is not in airy isle, the rule fails;
	if Hot Horde is not off-stage, say "You already summoned the Hot Horde." instead;
	the rule succeeds;

this is the vr-hot-horde rule:
	say "The legendary Hot Horde rumbles in from ... goodness, how'd they get here so fast? Especially since they're such a disorganized bunch!";
	move hot horde to airy isle;
	check-gored-clue;
	the rule succeeds.

this is the vc-got-gored rule:
	if player is not in airy isle or bot board is moot, the rule fails;
	if lot lord is in airy isle and hot horde is in airy isle, the rule succeeds;
	clue-later "GOT GORED";
	if lot lord is off-stage and hot horde is off-stage, say "That would just be your epitaph right now. But with some help--a lot--it could be a potent rallying cry." instead;
	if lot lord is off-stage, say "The Hot Horde needs more than a battle cry. It needs a leader." instead;
	if hot horde is off-stage, say "The Lot Lord nods, but alas, one person using a battle cry against the Bot Board won't work." instead;
	say "Uh oh. This is a BUG case. This should not have happened." instead;

this is the vr-got-gored rule:
	say "YES! That's the cheer they need. The bot board is routed.[paragraph break]As things calm down, you realize a wry wall points you two ways, and there is now a go gate ahead! You must be close now.";
	moot Hot Horde;
	moot Lot Lord;
	moot Bot Board;
	wall-refresh;
	move go gate to Airy Isle;

this is the vc-whoa-wait rule:
	unless player is in airy isle and go gate is in airy isle, the rule fails;
	the rule succeeds;

this is the vr-whoa-wait rule:
	say "You decide not to run in right away. The grow grate inside the go grate crumbles. You take another peek to make sure there's nothing else. There isn't. You walk through.";
	wfak;
	move player to Tarry Tile;
	now min-needed is score + 3;
	now maximum score is score + 3;
	the rule succeeds.

this is the vc-work-well rule:
	if jerk gel is not touchable, the rule fails;
	the rule succeeds;

this is the vr-work-well rule:
	say "You work to put all the jerk gel back in. It becomes glowing globs.";
	now the player has the jerk gel;
	the rule succeeds.

this is the vc-shining-shore rule:
	if player is not in Whining War, the rule fails; [?? big problem with what replaces Violent Vale]
	if shore-shine is true, say "You already got (t)here." instead;
	if beer bull is not moot:
		clue-later "SHINING SHORE";
		say "It could be that way. But you need to get rid of the whining first." instead;
	the rule succeeds;

this is the vr-shining-shore rule:
	say "The Whining War dissipates, leaving the shining shore of ... Lake Lap! It's much brighter here. You feel there may be something else to find here.";
	phbt Whining War;
	move lake lap to Whining War; [??fake fap]
	now shore-shine is true;

this is the vc-mining-more rule:
	if player is not in Whining War, the rule fails; [?? big problem with what replaces Violent Vale]
	abide by the shone-yet rule;
	the rule succeeds;

this is the vr-mining-more rule:
	now mine-more is true;
	say "You mine more, more, more.";
	the rule succeeds.

this is the vc-dining-door rule:
	if player is not in Whining War, the rule fails; [?? big problem with what replaces Violent Vale]
	abide by the shone-yet rule;
	the rule succeeds;

this is the vr-dining-door rule:
	say "The dining door appears.";
	now dine-door is true;
	the rule succeeds.

this is the vc-brightening-bridge rule:
	if frightening fridge is not touchable, the rule fails;
	the rule succeeds;

this is the vr-brightening-bridge rule:
	say "Boom! There goes the fridge! You can go east now!";
	moot frightening fridge;
	the rule succeeds.

this is the vc-soft-sand rule:
	if player is not in soft sand, the rule fails;
	if loft-land is false, say "You're already on the Soft Sand." instead;
	the rule succeeds;

this is the vr-soft-sand rule:
	say "The loft land reverts to the Soft Sand.";
	now loft-land is false;
	now Shirk Shell is mapped west of Soft Sand;
	the rule succeeds;

this is the vc-loft-land rule:
	if player is not in soft sand, the rule fails;
	if loft-land is true, say "You're already on the loft land." instead;
	the rule succeeds;

this is the vr-loft-land rule:
	say "Boom! The Soft Sand rises up and becomes the Loft Land[one of][or] again[stopping].";
	now zap-core-entry is true;
	if ever-loft is false:
		now ever-loft is true;
		now loft-land is false;
	now Curst Cave is mapped west of Soft Sand;
	now Soft Sand is mapped west of Curst Cave;
	the rule succeeds;

this is the vc-first-fave rule:
	if player is not in curst cave, the rule fails;
	if first-fave is true, say "You already did." instead;
	if screaming skull is in Curst Cave:
		clue-later "FIRST FAVE";
		say "You can't like anything with that screaming skull around!" instead;
	the rule succeeds;

this is the vr-first-fave rule:
	say "Suddenly, the worst wave isn't very bad or evil at all.";
	now first-fave is true;
	move tool tap to Curst Cave;
	the rule succeeds;

this is the vc-stay-strong rule:
	if in-way-wronged is true, say "You already did." instead;
	if in-way-wrong is false, the rule fails;
	the rule succeeds;

this is the vr-stay-strong rule:
	say "That's it! You feel much more comfortable now.";
	now in-way-wrong is false;
	now in-way-wronged is true;
	phbt Kerry Kyle;
	the rule succeeds.

this is the vc-glow-glad rule:
	if in-so-saded is true, say "You already did." instead;
	if in-so-sad is false, the rule fails;
	the rule succeeds;

this is the vr-glow-glad rule:
	say "That's it! You feel much more comfortable now.";
	now in-so-sad is false;
	now in-so-saded is true;
	phbt Kerry Kyle;
	the rule succeeds.

this is the vc-moral-mage rule:
	if coral cage is not touchable, the rule fails;
	if player does not have cage key:
		clue-later "MORAL MAGE";
		say "The coral cage is too dense to see through or destroy right now. Maybe if you were able to get into it." instead;
	the rule succeeds;

this is the vr-moral-mage rule:
	say "The inner bars of the coral cage crumble. The moral mage thanks you.";
	moot coral cage;
	the rule succeeds.

this is the vc-dreaming-dull rule:
	if screaming skull is not touchable, the rule fails;
	the rule succeeds;

this is the vr-dreaming-dull rule:
	moot screaming skull;
	say "The screaming skull stops screaming and starts alternatively snoring and mumbling about that time it wound up naked at Undead Orientation, or the time the ghost of its secret crush found proof of said crush, or its own groundhog day studying for an exam it still can't pass, dreaming of their job when home from work, or walking in as a skeleton at its own funeral, or how it wrote a brilliant poem but then woke up, or how its final judgment went a bit differently, for better or worse. You try to show empathy and interest, but it's hopeless. The skull, upset and exhausted from its harangue, rolls off through the worst wave. Unable to help yourself, you call out 'May you sleep in interesting dreams!'";

this is the vc-show-shield rule:
	if player is not in foe field, the rule fails;
	if player does not have gold guard:
		clue-later "SHOW SHIELD";
		say "That seems right, but you have nothing that would guard you effectively. Maybe later." instead;
	the rule succeeds;

this is the vr-show-shield rule:
	say "You flash your gold guard, and bam, the voice that says YO YIELD quiets down. But not bfore the usual energy ray shwos up and blasts your gold guard to pieces. Eh, it did its job. You can go west now.";
	now shield-shown is true;
	moot gold guard;

this is the vc-cool-cap rule:  [?? YOULL YAP / CRUEL CRAP !!!!!]
	if tool tap is not touchable, the rule fails;
	the rule succeeds;

this is the vr-cool-cap rule:
	say "What do you know? A cool cap DOES come out.";
	now player has cool cap;
	the rule succeeds.

this is the vc-dear-dull rule:
	if beer bull is not touchable, the rule fails;
	if fearful-on is false, say "No. The beer bull is too dull." instead;
	if player is not in Whining War, say "This isn't the right place to calm the beer bull down." instead;

this is the vr-dear-dull rule:
	say "The beer bull settles down. Both sides of the Whining War cautiously approach. It's not very good beer, but it doesn't matter. They all get drunk. Once each side has had their fill, the bull wanders off." instead;
	moot beer bull;
	the rule succeeds.

this is the vc-tell-torn rule:
	if well worn hell horn is not touchable, the rule fails;
	the rule succeeds;

this is the vr-tell-torn rule:
	say "The well worn hell horn rips apart and unwinds. Fortunately, as it does so, there is no bell born. It's more peaceful around, now. You can focus better and come to grips with your inner self, and all that sort of thing.";
	moot well worn hell horn;

this is the vc-hard-hat rule:
	if marred mat is not touchable, the rule fails;
	the rule succeeds;

this is the vr-hard-hat rule:
	say "Poof! The marred mat changes into a hard hat. A nice lightweight one. Light enough to wear, so you do.";
	moot marred mat;
	now player wears hard hat;

this is the vc-lending-libe rule:
	if player is not in trending tribe, the rule fails;
	if trending tribe is moot, say "Yes. This is the place's new name. You already disposed of the trending tribe." instead;
	the rule succeeds;

this is the vr-lending-libe rule:
	moot trending tribe;
	say "The Trending Tribe is appalled by the possibility of people getting something for free. Even books that don't help you profit.";
	now printed name of Vending Vibe is "Lending Libe";
	move lending libe to Vending Vibe;
	the rule succeeds.

this is the vc-cast-cap rule:
	if player is not in gassed gap, the rule fails;
	if cool cap is moot, say "You already did." instead;
	if player does not have cool cap:
		clue-later "CAST CAP";
		say "You need a cap to cast!" instead;
	the rule succeeds;

this is the vr-cast-cap rule:
	say "You cast your cap, and the haze to the north disappears. You can see the way! But you can also see someone big and mean: you know it must be (W)re(a/e)ker Russell!";
	moot cool cap;
	move Reeker Russell to Gassed Gap;
	phbt Gassed Gap;

this is the vc-meeker-muscle rule:
	if reeker russell is not touchable, the rule fails;
	if meeker-yet is true, say "You already did that!" instead;
	the rule succeeds;

this is the vr-meeker-muscle rule:
	now meeker-yet is true;
	say "Russell becomes noticeably less muscular.";
	check-russell-go; [nec]

this is the vc-wood-one rule:
	if reeker russell is not touchable, the rule fails;
	if good gun is moot, say "You already got rid of the good gun." instead;
	the rule succeeds;

this is the vr-wood-one rule:
	say "The good gun turns into a wood one in Reeker Russell's hands! He throws it away in disgust.";
	moot good gun;
	check-russell-go; [nec]
	the rule succeeds;

this is the vc-cold-card rule:
	if player is not in Y'Old Yard, the rule fails;
	if bold bard is moot, say "You already helped the Bold Bard." instead;
	the rule succeeds;

this is the vr-cold-card rule:
	say "'Now that's a swap!' The Bold Bard hands you some armor he won't need. At least, you hope his music is good enough, he won't need it.";
	moot Bold Bard;
	now player has gold guard;
	the rule succeeds.

this is the vc-first-floor rule:
	if player is not in history hall or mistmall is true, the rule fails;
	the rule succeeds;

this is the vr-first-floor rule:
	if floor-yet is true, say "You already did." instead;
	say "Erst Lore, up on the ceiling, comes [one of][or]back [stopping]down. You can go IN, now.";
	now Erst Lore is mapped inside History Hall;
	now History Hall is mapped outside Erst Lore;
	the rule succeeds.

this is the vc-so-sappin rule:
	if toe tappin is touchable, the rule succeeds;
	the rule fails;

this is the vr-so-sappin rule:
	say "Man! The tune in your head, the one you feel you have to whistle and sing, flows freely. But it's not exciting like it was. It's all slowed down. It feels generic, yet full of possibilities.[paragraph break]In its place a much worse song springs up. Just a minor nuisance, though. Not something you have to deal with.";
	moot toe tappin row rappin;
	move oi mo to History Hall;
	the rule succeeds.

this is the vc-history-hall rule:
	if player is not in History Hall, the rule fails;
	if mistmall is false, say "You're already in History Hall." instead;
	the rule succeeds;

this is the vr-history-hall rule:
	move-to-temp gutta ganksta;
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

this is the vc-mystery-mall rule:
	if player is not in History Hall, the rule fails;
	if mistmall is true, say "You're already in the Mystery Mall." instead;
	the rule succeeds;

this is the vr-mystery-mall rule:
	move-to-temp Name Notes Tame Totes;
	move-from-temp gutta ganksta;
	if Toe Tappin is not moot:
		move-from-temp Toe Tappin;
	else if Oi Mo is not moot:
		move-from-temp Oi Mo;
	now Got Gear Hot Here is mapped west of History Hall;
	now mistmall is true;
	bold-my-room;
	if ever-mall is false, say "A way opens up to the west as History Hall shudders into Mystery Mall! You suspect it would be easy to flip back to History Hall, if you needed or wanted to.";
	now ever-mall is true;
	now zap-core-entry is true;
	the rule succeeds;

this is the vc-beast-boss rule:
	if player is not in Creased Cross, the rule fails;
	if Bull Beast is not off-stage, say "You already did." instead;
	the rule succeeds;

this is the vr-beast-boss rule:
	if score < beast-boss-min:
		clue-later "BEAST BOSS";
		say "You don't have the experience yet." instead;
	say "A Bull Beast appears to answer your summons. You hope you have done the right thing.";
	move Bull Beast to Creased Cross;
	the rule succeeds.

this is the vc-cull-ceased rule:
	if Bull Beast is not touchable, the rule fails;
	if player is not in Creased Cross:
		clue-later "CULL CEASED";
		say "You need to go back to Creased Cross." instead;
	if healed-here is false:
		clue-later "CULL CEASED";
		say "You need to find a way to restore your health." instead;
	the rule succeeds;

this is the vr-cull-ceased rule:
	say "YOU KILLED THE BULL BEAST.";
	now cull-ceased is true;
	now bull beast is boring;
	the rule succeeds.

this is the vc-full-feast rule:
	if Bull Beast is not in location of player, the rule fails;
	if Bull Beast is not boring:
		clue-later "FULL FEAST";
		say "That should work. It might work better if the Bull Beast were incapacitated." instead;

this is the vr-full-feast rule:
	say "BOOM! You managed to make a full feast of the Bull Beast. Everyone loves it. It tastes good. Nothing is left.";
	moot Bull Beast;
	the rule succeeds.

this is the vc-least-loss rule:
	if player is not in creased cross, the rule fails;
	if Bull Beast is off-stage:
		clue-later "LEAST LOSS";
		say "Not yet. You need to be in a fighting situation." instead;
	if least-loss is true, say "But then it wouldn't be the least loss any more." instead;

this is the vr-least-loss rule:
	now least-loss is true;
	say "BOOM! The Bull Beast, upset it did less damage than expected, fails to finish the job. You're definitely hurt, but you can survive.";
	the rule succeeds.

this is the vc-wild-weed rule:
	if mild mead is not touchable, the rule fails;
	the rule succeeds;

this is the vr-wild-weed rule:
	say "Bingo! The mild mead becomes wild weed.";

this is the vc-beaker-bustle rule:
	if reeker russell is not touchable, the rule fails;
	if beaker-yet is true, say "You already did that!" instead;
	the rule succeeds;

this is the vr-beaker-bustle rule:
	say "You have a vision of a much nerdier version of Reeker Russell going around and performing weird experiments. But you quickly snap back to reality. Still, it's good to be able to laugh at things.";
	now beaker-yet is true;
	the rule succeeds;

this is the vc-lots-lame rule:
	if gutta ganksta is not touchable, the rule fails;
	if lots-lame is true, say "You already pinged the Gutta Ganksta like that." instead;
	the rule succeeds;

this is the vr-lots-lame rule:
	say "The Gutta Ganksta suddenly feels dissed. Not enough to move out of the way, but enough to make you feel clever.";
	now lots-lame is true;
	the rule succeeds.

this is the vc-dimd rule:
	if oi mo is not touchable, the rule fails;
	the rule succeeds;

this is the vr-dimd rule:
	say "The beats of [i]Oi, Mo[r] quiet down out of hearing. You're worried they may be replaced by some song like 'Primp'r' or flip flop to Tip Top Hip Hop, but it's your lucky day. Blissful silence.";
	moot oi mo;
	the rule succeeds.

this is the vc-whatta-wanksta rule:
	if gutta ganksta is not touchable, the rule fails;
	the rule succeeds;

this is the vr-whatta-wanksta rule:
	say "Exposed, the [ganksta] turns red. It just can't face you any more and runs off for another mall to look cool in.";
	moot ganksta;
	the rule succeeds;

this is the vc-kneel-near rule:
	if player is not in real rear, the rule fails;
	if knelt-yet is true, say "You already did!" instead;
	the rule succeeds;

this is the vr-kneel-near rule:
	say "You kneel at the pier, facing away from the Steel Steer to avoid any semblance of idolatry that might cause the Ceiling Seer to strike you down. You feel peace and acceptance and potential and ability wash over you.";
	now knelt-yet is true; [?? track difference]
	now cht of Real Rear is leteq; [real rear->feel fear]
	now cht of steel steer is letminus; [steel steer->feel fear]
	the rule succeeds.

this is the vc-big-bag rule:
	if player has big bag, say "You already made the big bag." instead;
	if Fun Fen is unvisited:
		clue-later "BIG BAG";
		say "That would be a good idea, once you had possessions to carry around. But right now, you don't have enough that would need a big bag." instead;

this is the vr-big-bag rule:
	say "The zig-zag rig rag does a little wig-wag (I guess what you'd call it,) and it transforms into a much more useful big bag!";
	moot zig zag rig rag;
	now player has big bag;
	now bag-hint is false;

this is the vc-spark-spliff rule:
	if wild weed is moot, say "Whoah, dude. You already did." instead;
	if player does not have wild weed, the rule fails;
	if player is not in Fun Fen, say "Not here, dude! No source of flame!" instead;

this is the vr-spark-spliff rule:
	say "Whoah, dude! You totally discover not only a hidden spliff but two pieces of flint ideal for creating a flame to light it. It only takes 15 minutes, and it is totally worth it, even without munchies.";
	moot wild weed;
	the rule succeeds;

this is the vc-dive-deep rule:
	if hive heap is not touchable, the rule fails;
	the rule succeeds;

this is the vr-dive-deep rule:
	say "You look through the hive heap. You don't hear buzzing. You keep throwing hives over until ... well, a vapor, vile, is released.";
	moot hive heap;
	bring-here vapor vile;

this is the vc-paper-pile rule:
	if paper pile is not touchable, the rule fails;
	the rule succeeds;

this is the vr-paper-pile rule:
	say "The vapor vile changes to a paper pile.";
	moot vapor vile;
	bring-here paper pile;

this is the vc-backed-binder rule:
	if paper pile is not touchable, the rule fails;
	the rule succeeds;

this is the vr-backed-binder rule:
	say "The papers labeled FACT FINDER should be useful. But you find a way to glue them all together. Go, you!"; [?? list out the clues a bit better]
	now player has backed binder;
	now player has paper pile;
	now paper pile is part of the backed binder;
	phbt paper pile;

this is the vc-fall-free rule:
	if tree-down is true, say "You don't need the tree to fall any further." instead;
	if player is not in Fun Fen or Tall Tree is moot, the rule fails;
	the rule succeeds;

this is the vr-fall-free rule:
	say "The tree, already tipping over a bit, leans and ... falls over, creating safe passage to the north. Also, a hive heap falls from the tree and lands nearby. It seems worth a look.[paragraph break]You get greedy for a second wishing it was a teal tree so you could feel free, too, but this is good enough.";
	now tree-down is true;
	phbt tall tree;
	move hive heap to Fun Fen;
	the rule succeeds;

this is the vc-get-good rule:
	if player is not in wet wood:
		if in-test-loop is false, say "You already managed to GET GOOD.";
		do nothing instead;
	the rule succeeds;

this is the vr-get-good rule:
	loop-note "GET GOOD";
	say "You realize you can reason your way out of the Wet Wood. You feel so good about it, even musing 'good guy's wood wise!' But this brings up a question: if you need to work on rhymes, does it matter if they are spelled identically? Will that make things easier or harder in the long run?[paragraph break]While doing so, you overlook a trap that you fall into just as you see the way out...[wfak]";
	move player to Vined Vault instead;

this is the vc-find-fault rule:
	if mean mass is in Vined Vault:
		if in-test-loop is false, say "You already did, and things got worse. You'll have to try something else.";
		do nothing instead;
	if player is in Vined Vault, the rule succeeds;

this is the vr-find-fault rule:
	loop-note "FIND FAULT";
	say "It sure seems, at first glance, like the Vined Vault is inescapable. But you notice a few flaws. A loose tile, a crack in the wall ... you have all sorts of time, and there are no guards. And here you go ... if you do THIS, and THIS ...[wfak]";
	say "[line break]But of course something outside rushes into the fault you found in the vault. A mean mass roars in and mangles the packet of Mind Malt! It pulses threateningly, and while it hasn't attacked you, it now blocks your way out!";
	move mean mass to Vined Vault;
	phbt Vined Vault;

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
	if player is in po' pit and grit-grown is false, the rule succeeds;
	if grit-grown is true:
		if in-test-loop is false, say "You already did that. Grit is internalized in you. If you try to be grittier, you may use up the grit you worked so hard to gain.";
		do nothing instead;

this is the vr-grow-grit rule:
	loop-note "GROW GRIT";
	say "The trash trap looks less yucky now. Okay, it still looks pretty yucky, but it's almost bearable. You just have to make sure you don't trip anything horrible. You need a safe way through!";
	now grit-grown is true;
	phbt row writ;
	phbt Po' Pit;
	the rule succeeds.

this is the vc-mash-map rule:
	if player is not in po' pit, the rule fails;
	if the player's command matches "mash bap" or the player's command matches "bash map":
		say "Ooh! Just tweak one letter in either word." instead;
	if grit-grown is false:
		now bash-not-mash is whether or not word number 1 in the player's command is "bash";
		say "You aren't brave enough yet. Perhaps you can face down the po['] pit so you can be.";
		clue-later-w "MASH MAP";
		do nothing instead;
	the rule succeeds;

this is the vr-mash-map rule:
	loop-note "MASH MAP";
	say "The heck with this! You just don't trust the trash trap to tell you the way through. You maul what passes for a map on the cache cap--you realize parts of it don't make sense. And you make it past the gash gap... only to tumble into some sort of vehicle that seals shut.";
	move player to Trim Tram;
	the rule succeeds;

this is the vc-mind-me rule:
	if me-minded is true:
		if in-test-loop is false, say "You already minded yourself.";
		do nothing instead;
	if player is in trim tram and me-minded is false, the rule succeeds;

this is the vr-mind-me rule:
	loop-note "MIND ME";
	say "FIND FEE can't be right. There's nobody here to collect it. You have a bit more confidence in your ability to swindle someone, or something, else now. The FIND FEE plastered everywhere vanishes.";
	now me-minded is true;

this is the vc-flim-flam rule:
	if player is not in trim tram, the rule fails;
	if me-minded is false:
		now skim-not-flim is whether or not word number 1 in the player's command is "skim";
		say "That's a good idea, but you don't have the confidence yet! You need to get your bearings a bit.";
		clue-later-w "FLIM FLAM";
		do nothing instead;
	the rule succeeds;

this is the vr-flim-flam rule:
	loop-note "FLIM FLAM/SKIM SCAM";
	say "That does it! The tram moves off to a more open place...";
	move the player to Fun Fen;

this is the vc-strong-start rule:
	if player is not in Fun Fen, the rule fails;
	if started-strong is true, say "You already did. You wouldn't want a stale start. Why, you might get sent to Male Mart. Or run over by a kale cart." instead;
	the rule succeeds;

this is the vr-strong-start rule:
	now started-strong is true;
	say "Boom! Yes, you mangle and destroy the wrong art, both physically and mentally. You can't dunk on wrong stuff too much, but in this case, you gain confidence you know what you are doing, and the exercise is nice, too. That is a way to get a strong start[if score > 11 and creased cross is visited], even if you aren't really starting any more[else if score > 30], because it's always good to start anew, or try to, to get a perspective on things[end if]. You throw the wrong art over Cark Cliff, now that you feel confident fully dismissing it.";
	moot wrong art;
	the rule succeeds.

this is the vc-bumped-buster rule:
	if clumped cluster is touchable, the rule succeeds;
	the rule fails;

this is the vr-bumped-buster rule:
	say "The clumped cluster no longer blocks your way. It starts pulsing further until it runs out of energy and collapses.";
	moot clumped cluster;
	the rule succeeds.

this is the vc-sit-sound rule:
	if hit hound is not touchable:
		if player is in pit pound, say "You already did." instead;
		the rule fails;
	the rule succeeds;

this is the vr-sit-sound rule:
	say "The Hit Hound can smell fear, but it can also smell a lack of fear. You manage to sit sound, and the Hit Hound gives up and goes away.";
	moot Hit Hound;
	phbt pit pound;
	the rule succeeds.

this is the vc-fit-found rule:
	if player is not in pit pound, the rule fails;
	if found-fit is true, say "You already did." instead;
	if hit hound is in pit pound:
		say "You can't do much with the Hit Hound around.";
		clue-later-w "FIT FOUND";
		do nothing instead;

this is the vr-fit-found rule:
	say "You feel comfortable here now. Wahoo!";
	now found-fit is true;
	the rule succeeds.

this is the vc-merrymile rule:
	if merry-mile is true, say "You already did. And if you force things, it might undo the good you did." instead;
	if mrlp is not Vale Verminous, the rule fails;
	clue-later "MERRY MILE";
	if player is not in Tarry Tile, say "This doesn't seem to be the place to rename the Merry Mile. Maybe somewhere else, though." instead;
	if player is in Airy Isle:
		if bot board is moot, say "You're happy, but you can't force it any more. You haven't found the Very Vile Fairy File yet, and when you do, this may be a more appropriate name for wherever it is that is ahead." instead;
		say "Hard to be happy with the Bot Board around." instead;
	if player is in Tarry Tile:
		if well worn hell horn is in Tarry Tile:
			say "Not with the well worn hell horn making those un-merry noises.";
			clue-later "MERRY MILE";
			do nothing instead;

this is the vr-merrymile rule:
	say "You're much happier now! You are ready to deal with the Very Vile Fairy File fully, now.";
	now merry-mile is true;

this is the vc-bury-bile rule:
	if player is in Tarry Tile:
		if well worn hell horn is moot and merry-mile is true, the rule succeeds;
		if well worn hell horn is in Tarry Tile:
			say "The well worn hell horn makes a loud noise. It's intimidating, and yet, you could find a way to prep yourself to ignore or get rid of the horn, then take the file.";
			clue-later "BURY BILE";
			do nothing instead;
		if merry-mile is false:
			say "You want to, but you're still just barely forcing it. You need a way to cheer yourself up to get going.";
			clue-later "BURY BILE";
			do nothing instead;
	clue-later "BURY BILE";
	if mrlp is Worst Whew, say "You try, and it seems right, but it's not that easy. You have quite a journey before you, until you can do that. But when the time is right, it will be very effective." instead;
	if mrlp is Piddling Pain, say "You can sort of deal with that right now. But you need to do better! You still have adventure to go!" instead;
	if player is in Airy Isle, say "You'd like to do that, but not here with so many distractions, during perhaps the big last fight." instead;
	if mrlp is Vale Verminous:
		too-generic;
		say "It must be about the right time. But you are not quite there, yet." instead;
	say "This is a BUG that should not happen.";

this is the vr-bury-bile rule:
	now bile-buried is true;
	win-the-game;
	say "Yes. You know what to do. As you bury the bile -- yours for others you have met in the game and in the past, the Very Vile Fairy File itself dissolves. The Merry Mile changes significantly. You are on your way back.";
	the rule succeeds;

this is the vc-feel-fear rule:
	if player is not in Real Rear, the rule fails;
	if knelt-yet is false:
		clue-later "FEEL FEAR";
		say "Fear isn't something you can try to feel[seer-sez]." instead;
	the rule succeeds;

this is the vr-feel-fear rule:
	say "You let yourself feel fear, with the Ceiling Seer overlooking. No matter how much you feel, you have faith you can cope. Admitting you're fearful helps a bit.";
	now felt-fear is true;
	the rule succeeds.

this is the vc-deal-dear rule:
	if player is not in Real Rear, the rule fails;
	if felt-fear is false:
		clue-later "DEAL DEAR";
		say "You haven't found anything you need to deal with[seer-sez]." instead;
	the rule succeeds;

this is the vr-deal-dear rule:
	say "The Sage Sea calms and parts briefly to reveal a cage key. You step in, slightly worried it may engulf you, but you've practiced your serenity.";
	now player has cage key;
	phbt Real Rear;
	phbt steel steer;
	the rule succeeds.

this is the vc-heal-here rule:
	if player is not in Real Rear, the rule fails;
	if healed-here is true, say "You already did." instead;
	if 1 > 0:
		clue-later "HEAL HERE";
		say "You don't have anything to heal from, yet[seer-sez]." instead;
	the rule succeeds;

this is the vr-heal-here rule:
	say "You call on the Ceiling Seer once more. You ask for your wounds to heal ... and they do!";
	now healed-here is true;
	the rule succeeds.

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
		say "Currently I'm just worried about what there is up until the Fun Fen and if it's hinted well enough, but if you want to poke around more, feel free to go ahead.[paragraph break]You can TRICK TRIP or SLICK SLIP to jump to the nonlinear part and avoid the introduction.[paragraph break]You can SLOW SIGH or BLOW BY or FLOW FLY before reaching the main area, as well, to skip past the current puzzle. You'll know the main area, because it is non-linear.[paragraph break]Also, you can CLIMB CLEAR to jump to the (relatively brief) endgame.";
	continue the action;

chapter blowbying

blowbying is an action applying to nothing.

understand the command "blowby" as something new.
understand the command "blow by" as something new.

understand "blowby" as blowbying.
understand "blow by" as blowbying.
understand "flow fie" as blowbying.
understand "slow sigh" as blowbying.

carry out blowbying:
	if fun fen is visited, say "Too late to blow by." instead;
	let prev-blowby-score be the score;
	now in-test-loop is true;
	repeat through table of verb checks:
		process the ver-rule entry;
		if the rule succeeded:
			process the do-rule entry;
			up-reg;
			now in-test-loop is false;
			the rule succeeds;
	now in-test-loop is false;
	say "Uh oh. Something went wrong. No rules succeeded.";

prev-blowby-score is a number that varies.

chapter tricktriping

tricktriping is an action applying to nothing.

understand the command "slick slip" as something new.
understand the command "trick trip" as something new.

understand "slick slip" as tricktriping.
understand "trick trip" as tricktriping.

carry out tricktriping:
	if fun fen is visited or airy isle is visited, say "You're already past the intro." instead;
	process the any-warp rule;
	say "You utter a, uh, QUICK QUIP. Your surroundings change.";
	now score is 7;
	now core-score is 7;
	move player to fun fen;
	the rule succeeds.

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
	now score is min-needed - 7 + min-gotten;
	now core-score is score;
	now maximum score is min-needed;
	the rule succeeds.

volume map index

index map with Trim Tram mapped east of Real Rear.
index map with Po' Pit mapped east of Trim Tram.
index map with Vined Vault mapped east of Po' Pit.
index map with Vined Vault mapped south of Wet Wood.

section odd directions

index map with Erst Lore mapped south of Got Gear Hot Here.

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
