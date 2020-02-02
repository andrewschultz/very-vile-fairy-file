Version 1/181018 of Very Vile Fairy File Mistakes by Andrew Schultz begins here.

"List of good guesses that don't quite work for Very Vile Fairy File."

[the usual "understand X as a mistake (text)" was replaced by this once 1) mistakes took up verb space 2) I needed to track character/word length]

[use vmc.py to check for duplicates]
[use mch.py to check to make sure everything in the mistakes file is in the rbr file]
[use hgc.py for homonym guess checks--you may see <ok> at various places in the file. This tells HGC to ignore this line as homonyms would not make quite enough sense.]

[dbh.py shortens to the debug version]

[the magic numbers column deserves an explanation. Usually it will be (10*expected length of first word) + (expected length of second word). However, in some cases, this is variable. Then we have a magic number from -10 to 10. This is converted, via variable-scan-length, to a two-digit number as above, possibly negative.

The reason a number is negative is that whatever you rhymed is an optional point. For instance, -67 for guessing what the author's name means.]

[stuff I haven't sorted yet:
##############unsorted
##############po pit
###############sage sea
#################dive deep
#################???? maybe future
###################shy shawl
###################Po' Pit
##################clay cloak
##################toe tappin
##############gots game
#############marred mat
#############Here Hull
###############Loft Land
###################tall tree
##################Gassed Gap
##################Violent Vale
##################random i dunno
#################way wrong
################Real Rear
#######################Creased Cross
#########################Shining Shore
]

volume what you start with

[note that these are arranged alphabetically, not in order of play.]

[the mist-rule tells if the mist-txt should be printed out. The leet-rule tells if a leet-clue should be printed out. If there is no w1let or w2let, nothing is printed out, either.]

section generic table

table of no good guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
a topic	a rule	a truth state	a number	a rule	text

book guesses by room, alphabetical

table of Airy Isle guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"caught/cot cord"	trivially true rule	false	35	--	"The Bot Board never sleeps, so they're not likely to be fooled by a string attached to a cot." [start Airy Isle]
"pot poured"	trivially true rule	false	35	--	"There's no time for coffee here!"
"rot roared"	trivially true rule	false	35	--	"A decent battle cry, but you sense there could a more violent action."
"caught cord"	trivially true rule	false	35	--	"You might be able to trip one of the Bot Board with a cord, but not all of them."
"snot snored"	trivially true rule	false	35	--	"While snot and snoring may gross some people out, they won't scare armies away. You need something more visceral."
"fought ford"	trivially true rule	false	35	--	"The battle is ahead, not in the past."
"tryst tress"	trivially true rule	false	--	--	"The last thing you need now is a hair appointment."
"crow crate"	go-gate-vis rule	false	44	--	"No birds appear to fly you over the grate, nor does a box of crowbars materialize."
"foe fate"	go-gate-vis rule	false	44	--	"You are very near the end, but it's not that easy."
"know/no nate"	go-gate-vis rule	false	44	--	"Nobody named Nate appears to help you through the go gate."
"lo/low late"	go-gate-vis rule	false	44	--	"You feel you are on the right path to disabling the go gate."
"oh ate"	go-gate-vis rule	false	44	--	"Nothing takes a bite out of the go gate."
"slow slate"	go-gate-vis rule	false	44	--	"No blackboard appears telling you EXACTLY the right move."
"so sate"	go-gate-vis rule	false	44	--	"You aren't satisfied yet. Only finishing the job will fix that!"

table of Been Buggin guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"teen tuggin"	in-been-buggin rule	false	46	dean-duggan-near rule	"Dealing with the shame of having done, er, THAT is beyond the scope of this game." [?? lean-mean-left rule] [start Been Buggin]
"glean gluggin"	in-been-buggin rule	false	46	dean-duggan-near rule	"[if buggin-freeze]You don't need to drink, or have a drinking buddy[else if dean duggan is touchable]Dean is not a secret drinker[else]After all you've done, you don't need alcohol to help you get by[end if]."
"jay joke"	have-clay-cloak rule	false	--	--	"You recall some off-color drug humor from your younger days."
"stay stoke"	have-clay-cloak rule	false	--	--	"Wrong grammar is woke and all, but you don't need to act out or show anyone."
"ho had"	in-so-sad rule	false	44	--	"You're trying to feel less in the dumps, not more."
"mo mad"	in-so-sad rule	false	44	--	"Once the anger wore off, you might be even more lethargic."
"co cad"	in-so-sad rule	false	44	--	"Nobody appears to commiserate with you."
"grow grad"	in-so-sad rule	false	44	--	"You acquire no diploma."
"po pad"	in-so-sad rule	false	44	--	"You don't need a depressing place to live."
"lo lad"	in-so-sad rule	false	44	--	"Recalling a condescending adult's advice to you (or others) fails to help."
"go gad"	in-so-sad rule	false	44	--	"Trying to shock yourself into action fails."
"foe/fo fad"	in-so-sad rule	false	44	--	"You try to convince yourself it's a passing phase, but it doesn't work."
"doh dad"	in-so-sad rule	false	44	--	"Blaming your parents fails to help."
"pay prong"	in-way-wrong rule	false	44	--	"Buying things won't improve your lack of self-worth."
"trumped truster"	cluster-near rule	false	-76	--	"The Very Vile Fairy File has probably gotten more than a few people to vote against their self-interests." [?? minor point]
"lumped luster/lustre"	cluster-near rule	false	-76	--	"The cluster would still be in the way if it were shiny." [?? minor point]

table of Blinding Blaze guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"binding bays/baize"	in-blaze-ways rule	false	74	blaze-before-maze rule	"You need to find your way here, not get more tied up." [start Blinding Blaze]
"grinding grays"	before-grays rule	false	74	blaze-before-maze rule	"Even if it were duller, you'd still be left with a [if sco-winding-ways is false]hot blaze[else]tricky maze[end if]." [?? still when in Winding Ways]

table of Creased Cross guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"ceased sauce"	in-creased-cross rule	false	54	need-least-loss rule	"You'll need all the sauce you can get, literally or figuratively."
"fleeced floss"	in-creased-cross rule	false	55	need-least-loss rule	"Dental hygiene is a good idea in general, but here, it's unnecessary."
"greased gross"	in-creased-cross rule	false	55	need-least-loss rule	"The Creased Cross doesn't need to become ickier."
"teased toss"	in-creased-cross rule	false	55	need-least-loss rule	"[if sco-cull-ceased is true]You imagine yourself cleverly insulting the Crimes Crew Times Two[else]A bit of taunting might work here, but you might need to be a bit harsher[end if]."

table of Curst Cave guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"nursed nave/knave"	in-curst-cave rule	false	55	need-first-fave rule	"You don't need to nurse a bad guy or a religious place." [start Curst Cave]
"creaming cull"	skull-near rule	false	85	--	"Less violence, more letters."

table of dives ditch guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"fives fitch"	in-dives-ditch rule	false	65	--	"A polecat (or several) would maul you, too[dives-surprise of 1]."
"hives hitch"	in-dives-ditch rule	false	65	--	"Whether that means a hive of bees or hives on your skin, that would affect anyone entering[dives-surprise of 2]."
"lives lich/liche"	in-dives-ditch rule	false	65	--	"But the lich would surely wipe you out[dives-surprise of 3]."
"stives stitch"	in-dives-ditch rule	false	65	--	"We don't want a red-light-district sort of trap[dives-surprise of 4]."
"strives stritch"	in-dives-ditch rule	false	65	--	"A screeching owl would only be annoying[dives-surprise of 5]."
"wives witch"	in-dives-ditch rule	false	65	--	"The witch might be evil enough to wipe everyone out[dives-surprise of 6]."
"chives chich"	in-dives-ditch rule	false	65	--	"This is no time for frou-frou vegetables!"

table of fight funnel guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"right runnel"	in-fight-funnel rule	false	56	need-tight-tunnel rule	"No river appears. It might just make things even more crowded and messy, anyway."
"trite trunnel"	in-fight-funnel rule	false	56	need-tight-tunnel rule	"You don't need anything as obscure as a wooden peg."

table of Foe Field guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"know/no kneeled"	in-foe-field rule	false	66	shield-unshown rule	"That is the wrong defensive posture for here."
"stow steeled"	in-foe-field rule	false	58	shield-unshown rule	"You don't have anything steely to stow."
"woe/whoah/whoa wield"	in-foe-field rule	false	46	shield-unshown rule	"You [if gold guard is moot]didn't[else]don't[end if] need a weapon but rather armor to repel the Foe Field."
"crane crescent"	peasant-around rule	false	58	--	"No bird or complex machinery drops by to sweep the Pain Peasant away." [start Foe Field]
"fain pheasant"	peasant-around rule	false	58	--	"The Pain Peasant remains human."

table of Fun Fen guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"chive cheap"	hive-heap-near rule	false	44	--	"The hive heap, and this game, acquire no additional flavor." [start Fun Fen]
"live leap"	hive-heap-near rule	false	44	--	"The leap wouldn't be live for very long."
"jive jeep"	hive-heap-near rule	false	44	--	"No wacky form of transport drives by blaring noises you'd need an 80 year old lady to help translate."
"rive reap"	hive-heap-near rule	false	44	--	"Tearing apart the hive heap would get you stung before you found whatever's in there."
"ball brie"	in-fun-fen rule	false	44	need-fall-free rule	"This game is cheesy-making, not cheese-making."
"wall whee"	in-fun-fen rule	false	44	need-fall-free rule	"You want to have fewer things in your way, not more. Just spitballing here."
"call cree"	in-fun-fen rule	false	44	need-fall-free rule	"You need something simpler than an unusual language here."
"one wen"	in-fun-fen rule	false	--	--	"Your skin remains unblemished, despite you tempting fate."
"pun pen"	in-fun-fen rule	false	--	--	"You find no way to reach behind the fourth wall and grab my pun pen. Besides, it's not the pen that's magically clever. It's me."
"won when"	in-fun-fen rule	false	--	--	"Hey, now! The Fun Fen is too cheery for such 'Am I done yet' angst."
"bark biff"	in-fun-fen rule	false	-56	spliff-unsparked rule	"A cruel voice calls from the distance 'Hello, McFly? Hello!'" [?? this-faint]
"gaper guile"	vial-or-pile rule	false	54	vapor-vial-vis rule	"You stare a bit but get no insight[kind-of-paper]."
"taper/tapir tile"	vial-or-pile rule	false	54	vapor-vial-vis rule	"No tile appears, but on the bright side, neither does a charging tapir[kind-of-paper]."
"aper isle"	vial-or-pile rule	false	54	vapor-vial-vis rule	"You are not teleported to somewhere similar to the Fun Fen."

table of Gassed Gap guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"classed clap"	in-gassed-gap rule	false	43	cap-uncast rule	"You picture crowds applauding you at the adventure's end, then feel like a bit of a humbug." [start Gassed Gap]
"chaste chap"	in-gassed-gap rule	false	43	cap-uncast rule	"Yes, you've been a model of morality. Yay, you."
"fast fap"	in-gassed-gap rule	false	43	cap-uncast rule	"Stop that! While this is, uh, a solo adventure, this is not AIF. We're not THAT sort of juvenile, here."
"last lap"	in-gap-with-cap rule	false	43	cap-uncast rule	"It will be the last lap one day. But you need a different action to get to this finality."
"massed/mast map"	in-gap-with-cap rule	false	43	cap-uncast rule	"You don't need a map--the gap is pretty straightforward. You just need to make a challenge the right way and fight whatever guardian is here."
"passed/past pap"	in-gassed-gap rule	false	43	cap-uncast rule	"You don't need to look back on what a trashy adventure this has been. Well, not in front of me." [?? cap cast yet?]
"razzed rap"	in-gassed-gap rule	false	43	cap-uncast rule	"There's enough bad music in this game if you know where to look."[?? if-then for if cap is moot]
"sassed sap"	in-gassed-gap rule	false	43	cap-uncast rule	"You look for someone who has recently lost an argument, but nobody turns up."
"should shun"	good-gun-here rule	false	43	--	"Gentle rebukes won't work. You need to make the gun less dangerous."
"spud spun"	good-gun-here rule	false	43	--	"Alas, potato-guns are still a thing."
"stud stun"	good-gun-here rule	false	43	--	"Unfortunately, that has an equal chance of stunning Russell or making Russell stun you."
"bud bun"	good-gun-here rule	false	43	--	"You have no bread to share, and Russell would probably want meat, anyway."
"food fun"	good-gun-here rule	false	43	--	"Sorry, no replacing a real fight with a food fight."
"hood hun"	good-gun-here rule	false	43	--	"Brilliant! Two enemies instead of one?"
"stood stun"	good-gun-here rule	false	43	--	"If only he were good gunNED, that might be more effective. Wait, he'd probably be dead and not need to be stunned."

table of Got Gear Hot Here guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"blot blear"	got-gear-hot-here rule	false	-44	not-near-yet rule	"You don't need to make this store more dreary." [start Got Gear Hot Here]
"bought/bot beer"	got-gear-hot-here rule	false	-44	not-near-yet rule	"Alas, the mall has no license to buy or serve alcohol."
"fought fear"	got-gear-hot-here rule	false	-44	not-near-yet rule	"With nobody around to kibitz, you reflect on the barriers you've broken through to get this far."
"spot spear"	got-gear-hot-here rule	false	-44	not-near-yet rule	"You don't need a weapon."
"dot dear/deer"	got-gear-hot-here rule	false	-44	not-near-yet rule	"No Animaniacs appear to spout poetry. Probably a good thing."
"drought drear"	got-gear-hot-here rule	false	-44	not-near-yet rule	"You thirst for an effective rhyme."
"fraught freer"	got-gear-hot-here rule	false	-44	not-near-yet rule	"You wish Got Gear Hot Hear led somewere else."
"sought/sot seer"	got-gear-hot-here rule	false	-44	not-near-yet rule	"Nobody, sober or otherwise, appears to give you advice about the future."
"snot sneer"	got-gear-hot-here rule	false	-44	not-near-yet rule	"You turn up your nose at kids these days['] terrible fashions."
"pot pier/peer"	got-gear-hot-here rule	false	-44	not-near-yet rule	"You don't need ... cookware."
"try trawl"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"You put in effort, and stuff[shawl-lol]."
"buy/by/bye ball/bawl"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"You can only buy clothes, not sporting goods, here. Also, no whining[shawl-lol]."
"fie fall"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"The shawl remains motionless, but you feel smarter for your guess[shawl-lol]."
"die/dye doll"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"There are no dolls to manipulate in this game[shawl-lol]."
"scry scrawl"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"The design on the shawl almost becomes something legible. It's like one of those dotted pictures you were supposed to see something when you stared at, but nothing came up. Bummer[shawl-lol]."
"spry sprawl"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"The shy shawl fails to spread out all over the floor[shawl-lol]."
"sty stall"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"You denigrate the condition of Got Gear Hot Here[shawl-lol]."
"dry droll/drawl"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"You make fun of the shy shawl subtly[shawl-lol]."
"tie tall"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"You look for any way-too-long ties that might help you feel taller, or more 'Presidental,' or whatever. You find none, and you also receive no mispronounced title[shawl-lol]."
"sigh sol/saul"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"No sunlight appears[shawl-lol]."
"high hall"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"You imagine yourself in a much more spacious megastore[shawl-lol]."
"guy gall/gaul"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"You imagine yourself being an obnoxious customer, like Obelix in ... well, anywhere[shawl-lol]."
"pie paul/pall"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"You bemoan the lack of a food court in the mall[shawl-lol]."
"my mall/maul"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"You show suitable ambition and aggression for an adventurer[shawl-lol]."
"why wall"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"You complain to nobody in particular about the number of dead ends in the mall[shawl-lol]."
"cry crawl"	got-gear-hot-here rule	false	-33	shawl-unloled rule	"You feel overcome with emotion[shawl-lol]."

table of History Hall guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"butter/butta bankster/banksta"	ganksta-nearby rule	false	-67	no-wanksta rule	"The ganksta will never have such a good job. Perhaps you can make fun of something simpler the ganksta is proud of." [start History Hall]
"blots blame"	ganksta-nearby rule	false	44	--	"There's another way to insult the tattoo as bad art. You're very close."
"clots claim"	ganksta-nearby rule	false	44	--	"You're trying to chase, not impress the ganksta."
"cots came"	ganksta-nearby rule	false	44	--	"The Gutta Ganksta is unmoved by the prospect of a good night's sleep."
"dots dame"	ganksta-nearby rule	false	44	--	"The Gutta Ganksta's fashion sense tends away from polka dots."
"knots/nots name"	ganksta-nearby rule	false	44	--	"You fail to tie the ganksta up in knots with well-timed 'NOT's."
"shots shame"	ganksta-nearby rule	false	44	--	"The ganksta ignores your anti-violence message, as well as any possibility you might be threatening them with a gun."
"sots same"	ganksta-nearby rule	false	44	--	"The ganksta actually rates getting drunk too much as a feature, not a bug. You need a more unshakeable insult."
"tots tame"	ganksta-nearby rule	false	44	--	"The ganksta looks slightly upset but realizes it can't be childish to have a tattoo. You must be close to the right insult, though."
"frotz frame"	ganksta-nearby rule	false	44	--	"Anything as esoteric as text adventure vocabulary would go over the Gutta Ganksta's head. You need to be more brutal."
"gene/jean joes"	mean-moes-by rule	false	55	--	"You don't need to visit another clothing store."
"seen/scene sos/sews"	mean-moes-by rule	false	55	--	"That must be about right, but it's not specific enough. You need to see something specific, and not quite see..."
"sheen shows"	mean-moes-by rule	false	55	--	"That must be about right, but you need to do something to look and find a light, or lights."
"bean/been bows"	mean-moes-by rule	false	55	--	"No bows pop up to garnish your current clothes."
"green grows"	mean-moes-by rule	false	55	--	"There's no gardening shop in the mall, but there doesn't need to be."
"lean lows"	mean-moes-by rule	false	55	--	"You feel the blues for a second."
"teen toes"	mean-moes-by rule	false	55	--	"Not sure I want to know."
"wean woes"	mean-moes-by rule	false	55	--	"You take time to feel less awful about some horrid event in your past. The resulting inner peace cheers you even more than a Last Lousy Point would have!"
"war wander"	poor-ponder-near rule	false	46	--	"You don't need to visit anything that drastic."
"bore/boar bonder"	poor-ponder-near rule	false	46	--	"Something more archaic and interesting."

table of Lake Lap guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"cake cap"	lap-not-cap rule	false	43	--	"No edible headgear appears." [start Lake Lap] [?? how does this change?]
"crake crap"	in-lake-lap rule	false	43	--	"No bird droppings provide a trail."
"fake fap"	cap-or-lap rule	false	43	lap-not-cap rule	"You make a rude gesture, for whatever good it does."
"flake flap"	in-lake-lap rule	false	43	--	"Nobody starts blathering uselessly."
"rake wrap/rap"	in-lake-lap rule	false	43	--	"You probably don't want or need a rake to step on."
"sake sap"	in-lake-lap rule	false	43	--	"No! You want more purpose, not less."
"slake slap"	in-lake-lap rule	false	43	--	"You don't need to slap anyone here, hard or soft."
"wake whap"	in-lake-lap rule	false	43	--	"You already woke Jake much more nicely." [here is a definite problem with word lengths. It should be 4-3 to 5-3 once you made the map. ??]

table of Pit Pound guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"mit/mitt mound"	in-pit-pound rule	false	35	not-fit-yet rule	"[if hit hound is in Pit Pound]The hit hound won't need to go chasing after that[else]The Pit Pound doesn't need clutter like that[end if]." [start Pit Pound]
"grit ground"	pit-pound-unsolved rule	false	35	--	"You need to find some other way to [if hit hound is in Pit Pound]banish the hit hound and [end if]feel comfortable here. You already showed grit in the Po['] Pit, anyway."
"bit bound"	in-pit-pound rule	false	35	not-fit-yet rule	"Now you mention it, you [if sco-fit-found is false]do[else]did[end if] feel a bit restricted here. Expressing your feelings helps a bit! You think."
"wit/whit wound"	in-pit-pound rule	false	35	not-fit-yet rule	"No need for unnecessary tension."
"clit clowned"	in-pit-pound rule	false	35	not-fit-yet rule	"I mean, that WORKS, but geez."
"crit crowned"	in-pit-pound rule	false	35	not-fit-yet rule	"You acquire no increased aptitude for removing an opponent's hit points. Which would be a bummer if hit points existed in this game."

table of po pit guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"cash cap"	in-po-pit rule	true	43	--	"You need more than just a homonym here."
"clash clap"	in-po-pit rule	false	43	--	"Your vehement applause goes unheeded. But perhaps other violence might be more productive."
"crash crap"	in-po-pit rule	false	43	--	"Profanity isn't necessary, here. Even minor ones."
"gnash/nash nap"	in-po-pit rule	false	43	--	"You need something more active."
"sash sap"	in-po-pit rule	false	43	--	"You don't need to be dressed outlandishly to figure what to do."
"flash flap"	in-po-pit rule	false	43	--	"Perhaps more focused violence would work better."
"lash lap"	in-po-pit rule	false	43	--	"You bang your fists against your pockets. It sort of helps, you guess."
"co kit"	in-po-pit rule	false	44	if-grit-ungrown rule	"You receive no kit to help you throw, corporate or otherwise."
"snow snit"	in-po-pit rule	false	44	if-grit-ungrown rule	"No bad weather blows in to be complained about."
"crow crit"	in-po-pit rule	false	44	if-grit-ungrown rule	"You wait for a little bird to give advice, but nothing happens."
"flow flit"	in-po-pit rule	false	44	if-grit-ungrown rule	"You don't need your mind to wander further. You need to focus on a solution."
"foe fit"	in-po-pit rule	false	44	if-grit-ungrown rule	"Complaining and speculation about who or what put you there won't help."
"go get/git"	in-po-pit rule	false	44	if-grit-ungrown rule	"You have no-one to order around, not that it'd do any good."
"ho/hoe hit"	in-po-pit rule	false	44	if-grit-ungrown rule	"You half-heartedly consider violence, but you probably need thinking, instead."
"lo/low lit"	in-po-pit rule	false	44	if-grit-ungrown rule	"You wonder if the dark, or a racy novel, will help. Probably not."
"bo/bow bit"	in-po-pit rule	false	44	if-grit-ungrown rule	"There's no fiddly bit like a bow. You showed a bit of persistence there looking for it, though."
"slow slit"	in-po-pit rule	false	44	if-grit-ungrown rule	"You can't see where to make a cut, and you have nothing to make a cut with."
"bro brit/britt"	in-po-pit rule	false	44	if-grit-ungrown rule	"You don't need a sidekick. Well, right now, you don't. Hard to summon them, anyway."
"know/no knit/nit"	in-po-pit rule	false	44	if-grit-ungrown rule	"You look for details to understand, but you might want to go in for a bigger picture."
"show shit"	in-po-pit rule	false	44	if-grit-ungrown rule	"Profanity doesn't work here. But perhaps there is a similar phrase to help you feel tough enough!"
"mo/mow mitt"	in-po-pit rule	false	44	if-grit-ungrown rule	"Please proceed, adventurer."
"glow glit"	in-po-pit rule	false	44	if-grit-ungrown rule	"Glowing slimy matter is still silimy. Besides, you need to look inside YOU, here."
"woe/whoa/whoah wit"	in-po-pit rule	false	44	if-grit-ungrown rule	"Clever complaining will make you feel better but won't do anything."

table of Real Rear guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"wheel/wheeling weir"	in-real-rear rule	false	45	--	"The Sage Sea is enough of a boundary."
"eel ear/ere"	in-real-rear rule	false	--	--	"You don't need an eel, or a piece of one, to electrify things right now."
"peel pear"	in-real-rear rule	false	--	if-rear-undone rule	"You have no fruit. However, the Ceiling Seer seems to appreciate your attempts to eat healthy."
"steal steer"	in-real-rear rule	false	44	if-rear-undone rule	"Direct homonyms don't work here, and the steer would not fit in your bag."
"wheel where"	in-real-rear rule	false	--	if-rear-undone rule	"The Ceiling Seer does not direct you to any wheel or any form of transportation."

table of Rift River guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"lift liver"	in-rift-river rule	false	45	--	"You gain no nutritious meat nor uplifting advice. But you must be close[rift-need]." [start Rift River]
"sift siever"	in-rift-river rule	false	45	--	"That would be a good tool in a cooking simulation, but the Leet Learner is more useful[rift-need]."
"drift driver"	in-rift-river rule	false	45	--	"No vehicle comes to take you across the river. And that doesn't quite rhyme, anyway[rift-need]."
"shift shiver"	in-rift-river rule	false	45	--	"You try fearing things different ways, but nobody comes to comfort you."

table of Soft Sand guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"coughed canned"	in-soft-sand rule	false	44	need-loft-land rule	"You try to suppress a cough while avoiding any sudden downturn in fortune."
"scoffed scanned"	in-soft-sand rule	false	44	need-loft-land rule	"[Soft Sand] isn't much to look at, but it's not worth scorn."
"offed/oft and"	in-soft-sand rule	false	44	need-loft-land rule	"You try for an impressive anticipatory silence, but nobody is around to appreciate it."

table of Stark Store guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"lark lore"	in-stark-store rule	false	44	need-mark-more rule	"This is no time for jokes! Or bird-watching."
"arc ore/oar/or"	in-stark-store rule	false	44	need-mark-more rule	"The store remains rectangular-ish. Probably for the best."
"bark bore/boar"	in-stark-store rule	false	44	need-mark-more rule	"You don't need to make a tree or summon anything tiresome or porcine."
"hark whore"	in-stark-store rule	false	44	need-mark-more rule	"That's inappropriate. Logical, but inappropriate."
"park pore/poor"	in-stark-store rule	false	44	need-mark-more rule	"The store cannot become outdoorsy. Or a parking lot."
"shark shore"	in-stark-store rule	false	44	need-mark-more rule	"No, you don't need more danger here."
"snark snore"	in-stark-store rule	false	44	need-mark-more rule	"You pretend you've already done much harder things. It gives you confidence, or something close enough."
"spark spore"	in-stark-store rule	false	44	need-mark-more rule	"Biological warfare is probably dangerous."
"beard bay"	weird-way-near rule	false	74	--	"No, the store is landlocked."
"feared fay"	weird-way-near rule	false	74	--	"No, there is enough fearful magic."
"steered stay"	weird-way-near rule	false	74	--	"No, you'd like to move on through the Weird Way, somehow."

table of Store All Stage guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"oral age"	in-storeall-stage rule	false	54	coral-cage-around rule	"Someone here is really old-school. As if text adventures weren't retro enough!"
"sorel/sorrel sage"	in-storeall-stage rule	false	54	coral-cage-around rule	"Someone not just wise but ethical is behind the coral cage[if Real Rear is visited]. Besides, there's already the sage sea[end if]."
"immoral image"	in-storeall-stage rule	false	54	coral-cage-around rule	"You sort of need the opposite. I suspect you know this and are just trying to see what happens."

table of Tarry Tile guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"bright braced"	trivially true rule	false	--	--	"If you needed to get through the [spite spaced], that would work. But you don't. You need to defeat the [fairy file]."
"light laced"	trivially true rule	false	--	--	"Perhaps the [spite spaced] will become light-laced once you dispel the [fairy file]."
"tight taste/tased"	trivially true rule	false	--	--	"No, you don't want a taste of being tased."
"bell born"	hell-horn-near rule	false	44	--	"There's enough noise right now."
"shell shorn"	hell-horn-near rule	false	44	--	"You must be on the right track. But perhaps the shell that is shorn might make the [hell horn] more effective."
"swell sworn"	hell-horn-near rule	false	44	--	"That might augment the hell horn."

table of Trim Tram guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"bind be"	tram-first-puzzle rule	false	42	--	"Your incantation fails. Perhaps something more straightforward and inward-looking would work better." [start Trim Tram] [?? get rid of MIND ME so this doesn't pop up]
"bind bee"	tram-first-puzzle rule	false	42	--	"If there were a bee, it might distract you from being, well, you."
"wined/wind whee/we"	tram-first-puzzle rule	false	42	--	"Whether or not you are more or less tense, or more or less exciting, you need to focus on you the right way here."
"signed see/sea"	tram-first-puzzle rule	false	42	--	"There's nobody to see any forged signature. Look within."
"tined tee"	tram-first-puzzle rule	false	42	--	"You don't have time for silly games like golf now!"
"kind key"	tram-first-puzzle rule	false	42	--	"Oh, it won't be that easy. Someone won't drop a key for you. But you can do for yourself."
"whim wham"	in-trim-tram rule	false	44	--	"Hmm, you try to figure a poetic way through, but perhaps you need something more worldly."
"grim gram"	in-trim-tram rule	false	44	--	"No elder appears to upbraid you, which is all for the better."
"jim jam"	in-trim-tram rule	false	44	--	"No pajamas appear. It's much too early for rest, anyway."
"dim dam/damn"	in-trim-tram rule	false	44	--	"You need fewer blockages and/or minor curses, not more."
"swim swam"	in-trim-tram rule	false	44	--	"You don't need to fall in the water here."
"rim ram"	in-trim-tram rule	false	44	--	"Banging on the walls won't help."
"shim sham"	in-trim-tram rule	false	44	--	"Hmm. Interesting. But you might need to fake something besides a shim."
"him ham"	in-trim-tram rule	false	44	--	"Pigs, male or female, aren't allowed on public transport."
"prim pram"	in-trim-tram rule	false	44	--	"That worked in Trinity, but this game isn't Trinity. For better or, more likely, for worse."
"slim slam"	in-trim-tram rule	false	44	--	"That might be cool, to make the puzzle a slam dunk and lose the last few pounds, but it's not sneaky enough. You must be close, though."

table of Vined Vault guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"bean bass"	mass-near rule	false	55	--	"You could use a delicious meal, but perhaps there is something even simpler the mean mass can become."
"hind halt"	in-vined-vault rule	false	45	need-find-fault rule	"You do feel sort of paranoid here, but fortunately, nothing is behind you or needs to stop."
"signed salt"	in-vined-vault rule	false	45	need-find-fault rule	"Alas, the walls of the vault do not turn to salt. Perhaps they still have a structural deficiency, though."
"wined/wind walt"	in-vined-vault rule	false	45	need-find-fault rule	"A drinking buddy you can play practical jokes on won't be any help here."
"mind malt"	mass-near rule	true	--	--	"The mind malt is gone. You have to rely on yourself!"
"seen/scene sass"	mass-near rule	false	55	--	"You worry any sass you direct at the mean mass would be spun back at you. But there must be a way to change the mean mass!"
"clean class"	mass-near rule	false	55	--	"You can't help but feel the mean mass could be more wholesome, but that's not quite the right way to do things. It doesn't feel quite natural enough."
"glean glass"	mass-near rule	false	55	--	"No, there's no hidden window you overlooked."
"lean lass"	mass-near rule	false	55	--	"This isn't that sort of game."

table of Violent Vale guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"island ale/ail"	in-violent-vale rule	false	64	violent-not-silent rule	"No need to drink or get an island disease."

table of Wet Wood guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"stet stood"	in-wet-wood rule	false	34	--	"No comment on if and where proofreading is necessary, here."
"het hood"	in-wet-wood rule	false	34	--	"You consider the possibility of changing the Wet Wood to a Straight Pride parade, but decide against it, as you're worried you might get trampled by all of a dozen people."

table of Whining War guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"signing sore"	in-whining-war rule	false	75	need-dining-door rule	"You make a rude gesture, for whatever good it does." [?? this may need to be fixed shore/poor] [start Whining War]
"spining spore"	in-whining-war rule	false	75	need-dining-door rule	"Your foray into speculative biology goes nowhere."
"pining pore/poor"	war-no-poor rule	false	75	--	"They'll come along later, if you do something else."
"fining four"	in-whining-war rule	false	75	need-dining-door rule	"You don't need to summon people that may audit you."
"lining lor/lore"	in-whining-war rule	false	75	need-dining-door rule	"Alas, nobody falls into line to tell stories of how they got here."

table of yold yard guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"mold marred" or "gold guard" or "cold card" or "hold hard"	bold-bard-near rule	false	--	--	"You'll actually be getting that later!"

book guesses by item, alphabetized

table of Beer Bull guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"mere mull"	beer-bull-by rule	false	44	need-near-null rule	"The Beer Bull is not impressed by thoughtfulness." [start Here Hull]
"gear gull"	beer-bull-by rule	false	44	need-near-null rule	"Spoiler: once you get rid of the bull, a gear gull will appear."
"leer/lear lull/lul"	beer-bull-by rule	false	44	need-near-null rule	"The Beer Bull does not stop looking aggressively at you."
"peer/pier pull"	beer-bull-by rule	false	44	need-near-null rule	"No, you can't bring the bull down with peer pressure."

table of big bag zig zag rig rag guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"brig brag"	trivially true rule	false	33	mist-bag-hint rule	"Good guys don't brag about [if player is in Vined Vault]being[else if Vined Vault is visited]having been[else]if they were ever[end if] in jail!"
"swig swag"	trivially true rule	false	33	mist-bag-hint rule	"There's no time to be drinking here!"
"tig tag"	trivially true rule	false	33	mist-bag-hint rule	"But you already have one utterly childish game right in front of you. Do you really need any more?"
"wig wag"	trivially true rule	false	33	mist-bag-hint rule	"If you're wearing a hairpiece, I don't want to know."
"cig sag"	trivially true rule	false	33	mist-bag-hint rule	"You find no black market currency in the [bag-rag]."
"mig mag"	trivially true rule	false	33	mist-bag-hint rule	"Fighter plane ammunition will not help you."
"gig gag"	trivially true rule	false	33	mist-bag-hint rule	"There are enough gags in this adventure. I hope."
"jig jag"	trivially true rule	false	33	mist-bag-hint rule	"You aren't up for dancing." [this is referred to explicitly when you BIG BAG, so there is overlap.]

table of bold bard guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"polled pard"	bard-card-guard rule	false	--	--	"Nobody stops by with a clipboard, or the medieval equivalent, to ask how you are enjoying your experience so far." [start yold yard]
"lold lard"	bard-card-guard rule	false	--	--	"Fat jokes aren't funny, self-depreciating or otherwise."
"old ard"	bard-card-guard rule	false	--	--	"Nobody needs to feel like a grizzled veteran here."

table of boring boat flooring float guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"goring goat"	boat-or-float rule	false	64	float-present rule	"You don't need an aggressive animal sidekick." [start Violent Vale] [these should be upgraded to the table for the boat/float]
"storing stoat"	boat-or-float rule	false	64	float-present rule	"You can carry what you need. You don't need any Brian Jacques villains upsetting that."
"mooring moat/mote"	boat-or-float rule	false	64	float-present rule	"The [float-boat] seems to anchor itself okay here."
"touring tote"	boat-or-float rule	false	64	float-present rule	"[if player has big bag]The big bag is good enough[else]Good idea, but try that with something in your inventory[end if]."

table of cage key sage sea guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"cage key"	key-or-rear rule	false	--	--	"[if cage key is off-stage]You correctly guessed what's in the Sage Sea, but you need to be wise, not clever, to earn it. [cagekey-prog][else]You already got the key[end if]." [start Real Rear] [?? this seems bad, giving a lump point for something obvious]
"wage wee/whee/wii"	key-or-rear rule	false	--	--	"Hey, now! You're not in it for the money! Or a handheld game console!"
"phage fee"	key-or-rear rule	false	--	--	"Biological warfare is too expensive."
"mage me"	key-or-rear rule	false	--	--	"[if player is in Real Rear]One look at the Sage Sea and y[else]Y[end if]ou remember mastering real magic takes training and practice. You'll find enough silly magic to do."
"page pea/pee/p"	key-or-rear rule	false	45	--	"You don't need to skip around a book or summon anything."
"beige bee"	key-or-rear rule	false	45	--	"[if player is in Real Rear]This isn't a[else]This adventure has no[end if] nature retreat."

table of clashing cloak guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"mashing moke"	have-clashing-cloak rule	false	85	--	"You need subtlety, not violence."
"ashing oak"	have-clashing-cloak rule	false	85	--	"No genetically twisted tree appears."
"stashing stoke"	have-clashing-cloak rule	false	85	--	"You don't need to start a fire or win this game on a rainy Tuesday."

table of clay cloak guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"stay stoke"	have-clay-cloak rule	false	--	--	"You take a slightly ungrammatical approach to keeping your spirits up." [start Been Buggin]
"bray broke"	have-clay-cloak rule	false	--	--	"You try a poor-righteous-teacher approach with the clay cloak."
"k coke"	have-clay-cloak rule	false	--	--	"No fizzy beverage (or anything less healthy) appears."
"say soak"	have-clay-cloak rule	false	--	--	"Water might make the clay cloak even heavier and messier."
"yay yoke/yolk"	have-clay-cloak rule	false	--	--	"Some woke people like to self-immolate, but not you."
"pay poke"	have-clay-cloak rule	false	--	--	"The clay cloak was free. No need to pay anything."
"cray croak"	have-clay-cloak rule	false	--	--	"You make a weird noise. It doesn't help, but it doesn't hurt."
"fay folk"	have-clay-cloak rule	false	--	--	"There's not enough magic in this game? Aww, rats."

table of cool cap tool tap guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"cruel crap"	cap-or-tap rule	false	43	need-cool-cap rule	"But you got rid of the skull. Also, swearing is naughty." [start Curst Cave]
"youll yap"	cap-or-tap rule	false	43	need-cool-cap rule	"Don't give a computer carte blanche to talk endlessly. Infinite loops are too easy to make!"
"pool pap"	cap-or-tap rule	false	43	need-cool-cap rule	"You want something nice and useful to come out of the tap, not ... that."
"mule map"	cap-or-tap rule	false	43	need-cool-cap rule	"It's a bit of a stretch, and maps might be useful elsewhere here, but it was worth a try."
"rule rap/wrap"	cap-or-tap rule	false	43	need-cool-cap rule	"You need something more substantial to come out of the cool cap."

table of hard hat marred mat guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"barred/bard bat"	hat-or-mat rule	false	43	no-hardhat rule	"You don't need a pet or a weapon. Especially not a potentially evil one." [start Got Gear Hot Here]
"card cat"	hat-or-mat rule	false	43	no-hardhat rule	"A card catalog certainly repels some folks, but you [if player has hard hat]have[else]need[end if] something sturdier."
"charred chat"	hat-or-mat rule	false	43	no-hardhat rule	"No time for scorched-earth conversation, here."
"lard lat"	hat-or-mat rule	false	43	no-hardhat rule	"You poke at your abs. Nah, you're doing okay."
"pard pat"	hat-or-mat rule	false	43	no-hardhat rule	"You fail to enter a Western with a sidekick."
"starred stat"	hat-or-mat rule	false	43	no-hardhat rule	"Get ahold of yourself! There's no time for in-depth sabermetrics!"
"guard gat"	hat-or-mat rule	false	43	no-hardhat rule	"I'm not getting into issues like whether a powerful gun is actually for defense or not. There's something lightweight to change things to, though."

table of jake g guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"cake key"	in-lakes rule	false	100	fee-or-brie-still rule	"Ooh! That'd be nice and tasty. But you don't need that right now." [start Lake Lea] [?? what about multiple] [these are technically Jake G rules]
"shake she"	in-lakes rule	false	100	fee-or-brie-still rule	"Jake has no horrible ex to avoid."
"flake flee"	in-lakes rule	false	100	fee-or-brie-still rule	"Be nice! You need Jake."
"bake be/bee"	in-lakes rule	false	100	fee-or-brie-still rule	"This is not a cooking sim."

table of jerk gel guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"dirk dell"	gel-or-shell rule	false	44	need-work-well rule	"You don't need an olde tyme adventure with daggers and stuff." [start Shirk Shell]
"urkel"	gel-or-shell rule	false	--	--	"You hear an annoying laugh in the distance." [?? test this special case. What if there is a mistaken rule we don't need and there are no numbers?]
"urk/erk ell"	gel-or-shell rule	false	44	need-work-well rule	"The gel is messy, but odd interjections won't help you use it or put it back in the tube."
"smirk smell"	gel-or-shell rule	false	44	need-work-well rule	"No, you don't want that."
"turk tell"	gel-or-shell rule	false	44	need-work-well rule	"You wonder briefly how that automaton back in the 18th century played chess, anyway."

table of lurking lump guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"perking pump"	lump-known rule	false	--	--	"I don't want to know."

table of mild mead guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"dialed deed"	mead-or-weed rule	false	-44	weed-offstage rule	"You don't need chemical stimulants to be dialed in to what you need to do." [start Knives Niche]
"filed feed"	mead-or-weed rule	false	-44	weed-offstage rule	"Nope. Can't quite categorize that as food."
"siled seed"	mead-or-weed rule	false	-44	weed-offstage rule	"No time for farming."
"styled steed"	mead-or-weed rule	false	-44	weed-offstage rule	"Too hard to implement. I mean, too fancy for this game. Too fancy, that's it."
"riled reed/read"	mead-or-weed rule	false	-44	weed-offstage rule	"Any controlled substances found in the course of your adventure are for relaxation."
"tiled teed"	mead-or-weed rule	false	-44	weed-offstage rule	"That would make for an odd golf course."

table of snuck snare stuck stair guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"buck bear/bare"	stair-or-snare rule	false	44	no-snare-yet rule	"There are enough animals in this game that could maul you." [start Blinding Blaze]
"chuck chair"	stair-or-snare rule	false	44	no-snare-yet rule	"No time for a Bobby Knight impression! Plus there are no 20-year-olds nearby to choke, anyway." [note losing the h's is doable, but it's vile and vulgar enough, I can't find a funny response.]
"duck dare"	stair-or-snare rule	false	44	no-snare-yet rule	"Too late for that. You took Kit Cohen's dare, and you're on a quest, now."
"fuck fair/fare"	stair-or-snare rule	false	44	no-snare-yet rule	"There are other games for that."
"muck mare/mere/mayor"	stair-or-snare rule	false	44	no-snare-yet rule	"No, it's something much cleaner than that."
"puck pair/pare/pere/payer"	stair-or-snare rule	false	44	no-snare-yet rule	"No time for hockey! You also aren't really dressed for the cold."
"pluck player"	stair-or-snare rule	false	44	no-snare-yet rule	"Personal grooming can wait."
"struck strayer"	stair-or-snare rule	false	44	no-snare-yet rule	"This game does not need or want to end in tragedy."
"tuck tare"	stair-or-snare rule	false	44	no-snare-yet rule	"Alterations are not your Thing."
"truck trayer"	stair-or-snare rule	false	44	no-snare-yet rule	"Manual labor is not very adventurous."
"shuck share"	stair-or-snare rule	false	44	no-snare-yet rule	"You have no share to shuck."
"tuck tear"	stair-or-snare rule	false	44	no-snare-yet rule	"You see no way to refigure the [if stuck stair is touchable]stair[else]snare[end if]."

table of toe tappin row rappin guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"woe/whoa/whoah whappin"	have-toe-tappin rule	false	101	--	"You don't need an exhortation to violence." [start History Hall]
"crow crappin"	have-toe-tappin rule	false	101	--	"You plan out some filk called Bad Bird Had Heard, about Tad, but it has nothing on Poisoning Pigeons in the Park. Eh, [toe] is versatile enough."
"slow slappin"	have-toe-tappin rule	false	101	--	"That would be handy in a more violent adventure, but not this one."
"flow flappin"	have-toe-tappin rule	false	101	--	"That might be funky to some, but you need something more practical."
"low lappin"	have-toe-tappin rule	false	101	--	"You put your best-ever time for a mile run to [Toe], but you can't see how it will help here. Plus, [i]Chariots of Fire[r] works better, anyway."
"fo/foe fappin"	have-toe-tappin rule	false	101	--	"[Toe] may not be highbrow, but it's not that low-class."

table of we whine guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"bree brine"	we-whine-near rule	false	34	sign-unseen rule	"Less gross than what's in [we whine], but no." [start Trending Tribe]
"fee fine"	we-whine-near rule	false	34	sign-unseen rule	"No, there's no charge on [we whine]."
"flee flyin"	we-whine-near rule	false	34	sign-unseen rule	"[we whine] encourages thinking outside the box, but that's a bit far."
"key kine"	we-whine-near rule	false	34	sign-unseen rule	"[we whine] already provides a figurative key to things."
"knee nine"	we-whine-near rule	false	34	sign-unseen rule	"[we whine] is only about mental violence and nastiness to people 'beneath' you, not physical."
"lee/lea line"	we-whine-near rule	false	34	sign-unseen rule	"[we whine] only blows figurative wind."
"pee pine"	we-whine-near rule	false	34	sign-unseen rule	"There probably is a section in [we whine] about figuratively marking your territory, but it's probably [fairy file]-approved, so no."
"she shine"	we-whine-near rule	false	34	sign-unseen rule	"Why yes, pointless greed should not be limited to men only."
"tee tine"	we-whine-near rule	false	34	sign-unseen rule	"No golf tee provides a bookmark for [we whine]."

table of too totes new notes guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"flu/flew floats"	has-too-totes rule	false	--	--	"No flying craft appears, but on the bright side, you fail to feel sick."
"grew/grue groats"	has-too-totes rule	false	--	--	"No coins spring from the ground. A coin with a grue would be kind of creepy, anyway."
"goo goats"	has-too-totes rule	false	--	--	"Ugh! Regular goats are messy enough."
"coo coats"	has-too-totes rule	false	--	--	"No need for warmth."
"do dotes"	has-too-totes rule	false	--	--	"Wowzers! What a neat document [too totes] is. Golly gee!"
"rue rotes"	has-too-totes rule	false	--	--	"You fail to find yourself in a more straightforward adventure."
"glue gloats"	has-too-totes rule	false	--	--	"What kind of person boasts about stockpiling glue?"
"blew/blue bloats"	has-too-totes rule	false	--	--	"You thought you saw Violet Beauregarde roll by there for a minute."
"stew stoats"	has-too-totes rule	false	--	--	"Badger, Mole and Rat would agree that's going too far. Even Toad."
"shoo shoats"	has-too-totes rule	false	--	--	"There are no young pigs here to shoo."

book wallish guesses

table of wry wall guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"cry call"	wallish-loc rule	false	--	--	"You lash out meaninglessly at the wry wall." [start 2 wry wall mistakes]
"dry doll"	wallish-loc rule	false	--	--	"The wry wall relinquishes nothing. You're not sure what you'd do with a doll, anyway."
"fry fall"	wallish-loc rule	false	--	--	"The wry wall remains upright."
"pry pall"	wallish-loc rule	false	--	--	"There is no hidden tomb under the wry wall."
"try tall"	wallish-loc rule	false	--	--	"The wry wall does not grow."

book general guesses

table of general good guesses
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"trilly trolling"	trivially true rule	false	-67	not-rolled-yet rule	"The Very Vile Fairy File probably has information on that, yes."
"silly souling/soling"	trivially true rule	false	-67	not-rolled-yet rule	"Why yes, I'm sort of a silly soul. At least when I'm writing games."
"filly foaling"	trivially true rule	false	-67	not-rolled-yet rule	"Caring for young animals is a good thing but beyond this game's scope."
"dairy/darey dial"	trivially true rule	false	44	--	"No dial appears to give you more excitement or milk products. Rats."
"wary wile"	trivially true rule	false	44	--	"Yes, you [if score < 40]will need[else]have shown[end if] wary wile, and lots of it!"
"pairy pile"	trivially true rule	false	44	--	"Goodness, no, we don't need the [fairy file] splitting and reproducing."
"treat turner" or "conceit concerner" or "cheat churner" or "meet mourner" or "beat burner" or "eat earner"	trivially true rule	true	--	--	"Nothing happens. The words are just settings that can help you work out what the needle means[one of]. By the way, if you want to learn how the Leet Learner works, HINT LEET LEARNER[or][stopping]."
"tough toll"	trivially true rule	false	--	--	"You groan about how heavy your inventory is."
"drowsy drakes"	in-lousy-lakes rule	false	--	--	"No sleepy ducks walk by."

[this is for cases that may conflict with actual puzzles. Homonyms may apply as well.]

table of first check rhymes
mist-cmd(topic)	mist-rule	got-yet	magicnum	leet-rule	mist-txt
"mo mealed"	in-foe-field rule	false	46	shield-unshown rule	"Alas, no food magically appears. You [if gold guard is moot]did what you needed[else]need a more fighting stance[end if]." [start Foe Field]
"mo mate"	go-gate-vis rule	false	44	--	"You remain alone." [start Gassed Gap]

section texts and decides

to say dives-surprise of (x - a number):
	say ". You ";
	if sco-knives-niche is false:
		say "need some sort of general ambush";
		continue the action;
	say "already prepared the Knives Niche, anyway";
	choose row x in table of niche guesses;
	now nitry entry is true;

to say bag-rag: say "[if player has big bag]big bag[else]zig zag rig rag[end if]"

to say kind-of-paper: if vapor vial is moot, say ". Now you've organized the pile, maybe its details are more important to read or examine"

to say float-boat: say "[if flooring float is touchable]flooring float[else]boring boat[end if]"

to say shawl-lol: if sco-lie-lol is false, say ". The shawl seems worthless to your quest, but maybe it's good for [one of][or]further [stopping]practice"

to say rift-need: say ". You just feel you could use another person's help, here"

to say cagekey-prog:
	say "[if rear-progress is 0]Perhaps some humility would be in order[else if rear-progress is 1]You may need to be open about your worries[else]You may need to show you can handle your worries[end if]"

to decide what number is rear-progress:
	decide on boolval of sco-kneel-near + boolval of sco-felt-fear + boolval of whether or not steel steer is moot;

section mist-rules alphabetized

[xxmisrul]

this is the bard-card-guard rule: if bold bard is touchable or cold card is touchable or gold guard is touchable, the rule succeeds;

this is the beer-bull-by rule: if Beer Bull is touchable, the rule succeeds;

this is the before-grays rule: if player is in Blinding Blaze and stuck stair is not moot, the rule succeeds;

this is the boat-or-float rule: if flooring float is touchable or boring boat is touchable, the rule succeeds;

this is the bold-bard-near rule: if Bold Bard is touchable, the rule succeeds;

this is the bot-board-vis rule: if Bot Board is touchable, the rule succeeds;

this is the bull-beast-here rule: if Bull Beast is touchable, the rule succeeds;

this is the cage-key-offstage rule: if cage key is off-stage, the rule succeeds;

this is the cap-or-lap rule: if player has cake cap or player is in Lake Lap, the rule succeeds;

this is the cap-or-tap rule: if tool tap is touchable or cool cap is touchable, the rule succeeds;

this is the cluster-near rule: if clumped cluster is touchable, the rule succeeds;

this is the ganksta-nearby rule: if Gutta Ganksta is touchable, the rule succeeds;

this is the gel-or-shell rule: if player is in Shirk Shell or jerk gel is touchable, the rule succeeds;

this is the go-gate-vis rule: if go gate is touchable, the rule succeeds;

this is the good-gun-here rule: if good gun is touchable, the rule succeeds;

this is the got-gear-hot-here rule: if player is in Got Gear Hot Here, the rule succeeds;

this is the has-too-totes rule: if player has too totes new notes, the rule succeeds;

this is the hat-or-mat rule: if hard hat is touchable or marred mat is touchable, the rule succeeds;

this is the have-clashing-cloak rule: if player has clashing cloak, the rule succeeds;

this is the have-clay-cloak rule: if player has clay cloak, the rule succeeds;

this is the have-toe-tappin rule: if player has toe tappin row rappin, the rule succeeds;

this is the hell-horn-near rule:
	if hell horn is touchable, the rule succeeds;

this is the hive-heap-near rule: if hive heap is touchable, the rule succeeds;

this is the in-been-buggin rule: if player is in Been Buggin, the rule succeeds;

this is the in-blaze-ways rule: if player is in Blinding Blaze, the rule succeeds;

this is the in-creased-cross rule: if player is in Creased Cross, the rule succeeds;

this is the in-curst-cave rule: if player is in Curst Cave, the rule succeeds;

this is the in-dives-ditch rule: if player is in Dives Ditch, the rule succeeds;

this is the in-fight-funnel rule: if player is in fight funnel, the rule succeeds;

this is the in-foe-field rule: if player is in Foe Field, the rule succeeds;

this is the in-fun-fen rule: if player is in Fun Fen, the rule succeeds;

this is the in-gap-with-cap rule: if player is in Gassed Gap and cap is not moot, the rule succeeds;

this is the in-gassed-gap rule: if player is in Gassed Gap, the rule succeeds;

this is the in-lake-lap rule: if player is in Lake Lap, the rule succeeds;

this is the in-lakes rule: if player is in Lake Lap or player is in Lake Lea, the rule succeeds; [This means Jake G is hanging around Lake Lap or Lake Lea]

this is the in-lousy-lakes rule: if mrlp is Browsy Breaks, the rule succeeds;

this is the in-pit-pound rule: if player is in Pit Pound, the rule succeeds;

this is the in-po-pit rule: if player is in Po Pit, the rule succeeds;

this is the in-real-rear rule: if player is in Real Rear, the rule succeeds;

this is the in-rift-river rule: if player is in Rift River, the rule succeeds;

this is the in-so-sad rule: if in-so-sad, the rule succeeds;

this is the in-soft-sand rule: if player is in Soft Sand, the rule succeeds;

this is the in-stark-store rule: if player is in Stark Store, the rule succeeds;

this is the in-storeall-stage rule: if player is in Store All Stage, the rule succeeds;

this is the in-tarry-tile rule: if location of player is Tarry Tile, the rule succeeds;

this is the in-trim-tram rule: if player is in Trim Tram, the rule succeeds;

this is the in-vined-vault rule: if player is in Vined Vault, the rule succeeds;

this is the in-violent-vale rule: if player is in Violent Vale, the rule succeeds;

this is the in-way-wrong rule: if in-way-wrong, the rule succeeds;

this is the in-wet-wood rule: if player is in Wet Wood, the rule succeeds;

this is the in-whining-war rule: if player is in Whining War, the rule succeeds;

this is the in-yold-yard rule: if player is in Y'Old Yard, the rule succeeds;

this is the key-or-rear rule: if player is in Real Rear or player has cage key, the rule succeeds;

this is the lap-not-cap rule: if player is in Lake Lap, the rule succeeds;

this is the lump-known rule: if lurking lump is not off-stage, the rule succeeds;

this is the mass-near rule: if mean mass is touchable, the rule succeeds;

this is the mead-or-weed rule: if mild mead is touchable or wild weed is touchable, the rule succeeds;

this is the mean-moes-by rule: if mean moe's is touchable, the rule succeeds;

this is the meed-or-weed rule: if player carries mild mead or player carries wild weed, the rule succeeds;

this is the peasant-around rule: if Pain Peasant is touchable, the rule succeeds;

this is the pit-pound-unsolved rule: if player is in Pit Pound and sco-fit-found is false, the rule succeeds;

this is the poor-ponder-near rule: if poor ponder for fonder is touchable, the rule succeeds;

this is the skull-near rule: if screaming skull is touchable, the rule succeeds;

this is the stair-or-snare rule: if player has snuck snare or stuck stair is touchable, the rule succeeds;

this is the tool-tap-near rule: if tool tap is touchable, the rule succeeds;

this is the tram-first-puzzle rule: if player is in Trim Tram and sco-mind-me is false, the rule succeeds;

this is the vial-or-pile rule: if vapor vial is touchable or paper pile is touchable, the rule succeeds;

this is the wallish-loc rule: if location of player is wallish, the rule succeeds;

this is the war-no-poor rule: if player is in Whining War and pining poor are off-stage, the rule succeeds;

this is the we-whine-near rule: if player has we whine, the rule succeeds;

this is the weird-way-near rule: if weird way is touchable, the rule succeeds;

[zzmisrul]

section leet-rules alphabetized [note these may be more stringent than they strictly need to be. For instance, the shawl-unloled rule *probably* doesn't fire unless the shawl is already touchable, but we need to make sure.]

[xxleetrul]

this is the blaze-before-maze rule: if player is in Blinding Blaze and sco-winding-ways is false, the rule succeeds;

this is the cap-uncast rule: if cool cap is not moot, the rule succeeds;

this is the coral-cage-around rule: if coral cage is touchable, the rule succeeds;

this is the dean-duggan-near rule: if dean duggan is touchable, the rule succeeds;

this is the fee-or-brie-still rule: if sco-fake-fee is false or sco-break-brie is false, the rule succeeds;

this is the float-present rule: if flooring float is touchable, the rule succeeds;

this is the full-feast-here rule: if full feast is not moot, the rule succeeds;

this is the if-grit-ungrown rule: if player is in Po Pit and sco-grow-grit is false, the rule succeeds;

this is the if-rear-undone rule: if sco-heal-here is false, the rule succeeds;

this is the mist-bag-hint rule: if big bag is off-stage, the rule succeeds;

this is the need-cocapn rule: if sco-co-capn is false, the rule succeeds;

this is the need-cool-cap rule: if cool cap is off-stage, the rule succeeds; [e.g. you haven't gotten the cool cap yet]

this is the need-dining-door rule: if player is in Whining War and dining door is off-stage, the rule succeeds; [NOTE: you may need to say SHINING SHORE, too. But this checks for needing either. ]

this is the need-fall-free rule: if sco-fall-free is false, the rule succeeds;

this is the need-find-fault rule: if player is in Vined Vault and mind malt is not moot, the rule succeeds;

this is the need-first-fave rule: if worst wave is not moot, the rule succeeds;

this is the need-least-loss rule: if sco-least-loss is false, the rule succeeds;

this is the need-loft-land rule: if sco-loft-land is false, the rule succeeds;

this is the need-mark-more rule: if player is in Stark Store and dark door is not moot, the rule succeeds;

this is the need-near-null rule: if sco-near-null is false, the rule succeeds;

this is the need-tight-tunnel rule: if sco-tight-tunnel is false, the rule succeeds;

this is the need-work-well rule: if player does not have jerk gel and jerk gel is not moot, the rule succeeds; [?? if jerk gel is in Shirk Shell]

this is the no-hardhat rule: if player does not have hard hat, the rule succeeds;

this is the no-snare-yet rule: if snuck snare is off-stage, the rule succeeds;

this is the no-wanksta rule: if sco-whatta-wanksta is false, the rule succeeds;

this is the not-fit-yet rule: if sco-fit-found is false, the rule succeeds;

this is the not-near-yet rule: if sco-not-near is false, the rule succeeds;

this is the not-rolled-yet rule: if sco-really-rolling is false, the rule succeeds;

this is the shawl-unloled rule: if shy shawl is touchable and sco-lie-lol is false, the rule succeeds;

this is the shield-unshown rule: if player is in Foe Field and gold guard is not moot, the rule succeeds;

this is the sign-unseen rule: if sco-see-sign is false, the rule succeeds;

this is the spliff-unsparked rule: if wild weed is not moot, the rule succeeds;

this is the vapor-vial-vis rule: if vapor vial is touchable, the rule succeeds;

this is the violent-not-silent rule: if sco-silent-sail is false, the rule succeeds;

this is the weed-offstage rule: if wild weed is off-stage, the rule succeeds;

[zzleetrul]

section texts and decides

to decide whether know-1:
	if word number 1 in the player's command is "know", yes;
	no;

section rules sorted alphabetically

Very Vile Fairy File Mistakes ends here.

---- DOCUMENTATION ----
