Version 1/181108 of Very Vile Fairy File Tables by Andrew Schultz begins here.

"This is divided into 3 volumes: the tables, the core code and the big meta table. It is roughly copied from Ailihphilia. Ctrl-end for meta table. The core code is about a page long, so you can go ctrl-end page-up for that."

[dbh.py shortens to the debug version]

volume core tables

chapter the verb check table

[verb check and verb run rules. This is in approximate game-solve order.]

table of verb checks [xxvc]
w1 (text)	w2 (text)	think-cue	okflip	core	idid	ver-rule	do-rule	wfull (topic)	think-advice
"glow"	"glad"	false	true	true	false	vc-glow-glad rule	vr-glow-glad rule	--	text	[start interlude-y]
"stay"	"strong"	false	false	true	false	vc-stay-strong rule	vr-stay-strong rule	--	-- [must be at top for JJ]
"get"	"good"	false	false	true	false	vc-get-good rule	vr-get-good rule	--	-- [start Intro]
"gift"	"giver"	false	false	true	false	vc-gift-giver rule	vr-gift-giver rule	--	--
"find"	"fault"	false	true	true	false	vc-find-fault rule	vr-find-fault rule	--	--
"green"	"grass"	false	false	true	false	vc-green-grass rule	vr-green-grass rule	--	--
"grow|oh|so"	"grit|it|sit"	false	true	true	false	vc-grow-grit rule	vr-grow-grit rule	"grow grit" or "oh it" or "so sit"	--
"mash|bash|rash|slash"	"map|bap|rap|slap"	false	true	true	false	vc-mash-map rule	vr-mash-map rule	"mash map" or "bash bap" or "rash rap" or "slash slap"	"You tried to [b][ash-ap][r], [if grit-grown is true]and maybe now you were able to [b]GROW GRIT[r], it will work[else]but sadly, you still believe it is the only thing that could help you through, and you don't have the guts[end if]."
"mind"	"me"	false	false	true	false	vc-mind-me rule	vr-mind-me rule	--	--
"flim|skim"	"flam|scam"	false	false	true	false	vc-flim-flam rule	vr-flim-flam rule	"flim flam" or "flimflam" or "skim scam"	"You tried to [b][ski-fli][r], but you didn't have the confidence. You may feel more comfortable doing so [once-now of vc-flim-flam rule] you have focused inward and feel no need to FIND FEE."
"spark"	"spliff"	false	true	false	false	vc-spark-spliff rule	vr-spark-spliff rule	--	-- [start of Fun Fen]
"strong"	"start"	false	true	false	false	vc-strong-start rule	vr-strong-start rule	--	--
"fall"	"free"	false	true	true	false	vc-fall-free rule	vr-fall-free rule	--	--
"dive"	"deep"	false	true	true	false	vc-dive-deep rule	vr-dive-deep rule	--	--
"paper"	"pile"	false	true	true	false	vc-paper-pile rule	vr-paper-pile rule	--	--
"backed"	"binder"	false	false	true	false	vc-backed-binder rule	vr-backed-binder rule	--	--
"appealing"	"appear"	false	true	false	false	vc-appealing-appear rule	vr-appealing-appear rule	--	-- [start of Real Rear]
"kneel|kneeling"	"near"	false	false	true	false	vc-kneel-near rule	vr-kneel-near rule	--	--
"feel|feeling"	"fear"	false	false	true	false	vc-feel-fear rule	vr-feel-fear rule	--	"You tried to [b]FEEL FEAR[r] [here-in of Real Rear], but [once-now of vc-feel-fear rule] you have help from above, it will work."
"deal|dealing"	"dear"	false	true	true	false	vc-deal-dear rule	vr-deal-dear rule	--	"You tried to say [b]DEAL DEAR[r] [here-in of Real Rear], which will work [once-now of vc-deal-dear rule] you have something you need to deal with."
"heal|healing"	"here"	false	true	true	false	vc-heal-here rule	vr-heal-here rule	--	"You tried to [b]HEAL HERE[r] [here-in of Real Rear], which will be handy [once-now of vc-heal-here rule] you need to heal from something."
"history"	"hall"	false	false	--	false	vc-history-hall rule	vr-history-hall rule	--	--
"mystery"	"mall"	false	false	true	false	vc-mystery-mall rule	vr-mystery-mall rule	--	--
"dark"	"door"	false	false	true	false	vc-dark-door rule	vr-dark-door rule	--	-- [start Stark Store]
"mark"	"more"	false	false	true	false	vc-mark-more rule	vr-mark-more rule	--	"You'll want to [b]MARK MORE[r] [once-now of vc-mark-more rule]you've found something to mark [here-in of Stark Store]."
"cleared"	"clay"	false	true	true	false	vc-cleared-clay rule	vr-cleared-clay rule	--	--
"bumped|dumped"	"buster|duster"	false	true	false	false	vc-bumped-buster rule	vr-bumped-buster rule	"bumped buster" or "dumped duster"	--
"tight"	"tunnel"	false	false	true	false	vc-tight-tunnel rule	vr-tight-tunnel rule	--	-- [start fight funnel]
"knives"	"niche"	false	false	true	false	vc-knives-niche rule	vr-knives-niche rule	--	-- [start dives ditch]
"wild"	"weed"	false	true	false	false	vc-wild-weed rule	vr-wild-weed rule	--	--
"lots"	"lame"	false	false	true	false	vc-lots-lame rule	vr-lots-lame rule	--	-- [start Mystery Mall]
"no"	"nappin"	false	true	true	false	vc-no-nappin rule	vr-no-nappin rule	--	--
"ho"	"happen"	false	true	false	false	vc-ho-happen rule	vr-ho-happen rule	--	--
"dimd"	--	false	false	false	false	vc-dimd rule	vr-dimd rule	--	--
"whatta"	"wanksta"	false	true	false	false	vc-whatta-wanksta rule	vr-whatta-wanksta rule	"what a wanksta" or "whatta wanksta"	--
"youre|your|yore"	"yonder"	false	false	true	false	vc-youre-yonder rule	vr-youre-yonder rule	--	--
"glean"	"glows"	false	false	true	false	vc-glean-glows rule	vr-glean-glows rule	--	"You'll want to [b]GLEAN GLOWS[r] [once-now of vc-glean-glows rule] you've found something Mean Moe's Clean Clothes can clean."
"smashing"	"smoke"	false	false	true	false	vc-smashing-smoke rule	vr-smashing-smoke rule	--	"You can make [b]SMASHING SMOKE[r] [once-now of vc-smashing-smoke rule] you've found someone or something that could use a suitable diversion." [start Y'Old Yard]
"lending"	"libe"	false	false	true	false	vc-lending-libe rule	vr-lending-libe rule	--	-- [start Vending Vibe]
"see"	"sign"	false	false	true	false	vc-see-sign rule	vr-see-sign rule	--	--
"hard"	"hat"	false	false	true	false	vc-hard-hat rule	vr-hard-hat rule	--	-- [start Got Gear Hot Here]
"lie"	"lol"	false	true	false	false	vc-lie-lol rule	vr-lie-lol rule	--	--
"not"	"near"	false	true	false	false	vc-not-near rule	vr-not-near rule	--	--
"beast"	"boss"	false	true	true	false	vc-beast-boss rule	vr-beast-boss rule	--	"You tried to summon the [b]BEAST BOSS[r] [here-in of Creased Cross] but need to try again [once-now of vc-beast-boss rule] you're armed better."[start Creased Cross]
"cull|lul"	"ceased|least"	false	true	true	false	vc-cull-ceased rule	vr-cull-ceased rule	"cull ceased" or "lul least"	"You should be able to say [b][cul-lul][r] [once-now of vc-cull-ceased rule] you're back to full strength."
"full"	"feast"	false	true	true	false	vc-full-feast rule	vr-full-feast rule	--	"You could make the Bull Beast a [b]FULL FEAST[r] [once-now of vc-full-feast rule] it's been vanquished."
"least"	"loss"	false	true	true	false	vc-least-loss rule	vr-least-loss rule	--	"You could say [b]LEAST LOSS[r] [once-now of vc-least-loss rule] you have something to face [here-in of Creased Cross]."
"loft"	"land"	false	false	true	false	vc-loft-land rule	vr-loft-land rule	--	-- [start Soft Sand]
"soft"	"sand"	false	false	--	false	vc-soft-sand rule	vr-soft-sand rule	--	"You can make things [b]SO SAPPIN[r] [once-now of vc-so-sappin rule] you can find where people are using their energy fruitlessly."
"plain"	"pleasant"	false	true	true	false	vc-plain-pleasant rule	vr-plain-pleasant rule	--	-- [start Foe Field]
"show"	"shield"	false	true	true	false	vc-show-shield rule	vr-show-shield rule	--	"You'll want to [b]SHOW SHIELD[r] [once-now of vc-show-shield rule] you've found something that can protect you in the Foe Field."
"cool"	"cap"	false	true	true	false	vc-cool-cap rule	vr-cool-cap rule	--	-- [start Curst Cave]
"dreaming"	"dull"	false	true	true	false	vc-dreaming-dull rule	vr-dreaming-dull rule	--	--
"first"	"fave"	false	false	true	false	vc-first-fave rule	vr-first-fave rule	--	"You could say [b]FIRST FAVE[r] [once-now of vc-first-fave rule] the screaming skull is gone."
"moral"	"mage"	false	false	true	false	vc-moral-mage rule	vr-moral-mage rule	--	"You tried to find the [b]MORAL MAGE[r], but you couldn't open the coral cage yet."
"work"	"well"	false	true	true	false	vc-work-well rule	vr-work-well rule	--	-- [start Shirk Shell]
"dear"	"dull"	false	true	true	false	vc-dear-dull rule	vr-dear-dull rule	--	-- [start Here Hull]
"near"	"null"	false	true	true	false	vc-near-null rule	vr-near-null rule	--	--
"sit"	"sound"	false	false	true	false	vc-sit-sound rule	vr-sit-sound rule	--	-- [start Pit Pound]
"fit"	"found"	false	true	true	false	vc-fit-found rule	vr-fit-found rule	--	"You can declare a [b]FIT FOUND[r] [once-now of vc-fit-found rule] you've gotten rid of the Hit Hound."
"winding|minding|finding"	"ways|maze|phase|fays"	false	false	true	false	vc-winding-ways rule	vr-winding-ways rule	"winding ways" or "minding maze" or "finding phase/fays"	-- [start Blinding Blaze]
"mo"	"mappin"	false	true	true	false	vc-mo-mappin rule	vr-mo-mappin rule	--	"You can try [b]MO MAPPIN[r] [once-now of vc-mo-mappin rule] you've found a suitable place to map."
"luck|snuck"	"lair|snare"	false	false	true	false	vc-luck-lair rule	vr-luck-lair rule	"luck lair" or "snuck snare"	--
"brightening"	"bridge"	false	false	true	false	vc-brightening-bridge rule	vr-brightening-bridge rule	--	-- [start Violent Vale]
"silent"	"sail|sale"	false	false	true	false	vc-silent-sail rule	vr-silent-sail rule	--	--
"boring"	"boat"	false	false	true	false	vc-boring-boat rule	vr-boring-boat rule	--	--
"wake"	"whee|wee"	false	true	true	false	vc-wake-whee rule	vr-wake-whee rule	--	-- [start Lake Lea]
"take"	"tea"	false	false	true	false	vc-take-tea rule	vr-take-tea rule	--	"You could [b]TAKE TEA[r] with Jake G. [once-now of vc-fake-fee rule] he's conscious."
"fake"	"fee"	false	false	true	false	vc-fake-fee rule	vr-fake-fee rule	--	"You could give Jake G. a [b]FAKE FEE[r] [once-now of vc-fake-fee rule] Jake G. has given you something of value."
"break"	"brie"	false	false	false	false	vc-break-brie rule	vr-break-brie rule	--	--
"make"	"map"	false	false	true	false	vc-make-map rule	vr-make-map rule	--	-- [start Lake Lap]
"co"	"capn"	false	false	true	false	vc-co-capn rule	vr-co-capn rule	--	"You tried to find a [b]CO CAPN[r] but need to try again [once-now of vc-co-capn rule] there's a worthy comrade."
"snake"	"snap"	false	true	true	false	vc-snake-snap rule	vr-snake-snap rule	--	"You can [b]SNAKE SNAP[r] [once-now of vc-snake-snap rule] it's clear a snake is present."
"lean"	"luggin"	false	false	true	false	vc-lean-luggin rule	vr-lean-luggin rule	--	"You tried some [b]LEAN LUGGIN[r], which should be more doable [once-now of vc-lean-luggin rule] you've dealt with your temporary loss of faith." [start Been Buggin]
"mean"	"muggin"	false	false	true	false	vc-mean-muggin rule	vr-mean-muggin rule	--	"You tried some [b]MEAN MUGGIN[r], which should be more doable [once-now of vc-mean-muggin rule] you've dealt with your temporary loss of faith."
"so"	"sappin"	false	true	true	false	vc-so-sappin rule	vr-so-sappin rule	--	-- [start Whining War]
"shining"	"shore"	false	false	true	false	vc-shining-shore rule	vr-shining-shore rule	--	"You can make the [b]SHINING SHORE[r] [once-now of vc-shining-shore rule] you dealt with the Whining War."
"mining"	"more|moor"	false	true	true	false	vc-mining-more rule	vr-mining-more rule	--	"You should be able to perform [b]MINING MORE[r] [once-now of vc-mining-more rule] the pining poor are fully satisfied."
"dining"	"door"	false	false	true	false	vc-dining-door rule	vr-dining-door rule	--	"You should be able to make a [b]DINING DOOR[r] [once-now of vc-dining-door rule] the Whining War has calmed down a bit."
"pull"	"pieced"	false	true	true	false	vc-pull-pieced rule	vr-pull-pieced rule	--	"You can [b]PULL PIECED[r] the Bull Beast [once-now of vc-pull-pieced rule] you have more people willing to help you."
"cast"	"cap"	false	false	true	false	vc-cast-cap rule	vr-cast-cap rule	--	"You can [b]CAST CAP[r] [once-now of vc-cast-cap rule] rule you have a worthy one." [start Gassed Gap]
"beaker"	"bustle"	false	true	false	false	vc-beaker-bustle rule	vr-beaker-bustle rule	--	--
"meeker"	"muscle"	false	true	true	false	vc-meeker-muscle rule	vr-meeker-muscle rule	--	--
"wood"	"one"	false	false	true	false	vc-wood-one rule	vr-wood-one rule	--	--
"go"	"gappin"	false	false	true	false	vc-go-gappin rule	vr-go-gappin rule	--	"You'll want to [b]GO GAPPIN[r] [once-now of vc-go-gappin rule] you've found a gap to go over."
"couple"	"caps"	false	false	true	false	vc-couple-caps rule	vr-couple-caps rule	--	"You tried to [b]COUPLE CAPS[r] earlier, but that'll work [once-now of vc-couple-caps rule] you've got enough caps to couple."
"lot"	"lord"	false	false	true	false	vc-lot-lord rule	vr-lot-lord rule	--	-- [start Airy Isle]
"hot"	"horde"	false	false	true	false	vc-hot-horde rule	vr-hot-horde rule	--	--
"got"	"gored"	false	false	true	false	vc-got-gored rule	vr-got-gored rule	--	"The battle cry [b]GOT GORED[r] should work [once-now of vc-got-gored rule] you have a full army and its leader."
"whoa|whoah|woe"	"wait"	false	true	true	false	vc-whoa-wait rule	vr-whoa-wait rule	--	--
"tell"	"torn"	false	false	true	false	vc-tell-torn rule	vr-tell-torn rule	--	-- [start Tarry Tile/Merry Mile]
"merry"	"mile"	false	false	true	false	vc-merry-mile rule	vr-merry-mile rule	--	"You can call for a [b]MERRY MILE[r] [once-now of vc-merry-mile rule] things have calmed down."
"bury"	"bile"	false	false	true	false	vc-bury-bile rule	vr-bury-bile rule	--	"When you tried to [b]BURY BILE[r], it didn't feel like the right place. [if Airy Isle is unvisited]And maybe you need to find the Very Vile Fairy File first[else if well worn hell horn is touchable]But that Well Worn Hell Horn needs to go[else if merry-mile is false]But you're not feeling cheery enough yet[else]The time and place are now[end if]."
"big"	"bag"	false	true	true	false	vc-big-bag rule	vr-big-bag rule	--	-- [two any-time things]
"really"	"rolling"	false	true	false	false	vc-really-rolling rule	vr-really-rolling rule	--	--





chapter joke death ends

[run sct.py to verify deaths/thinks/alt good verbs file testing is up-to-date. Also, rbr-vvff-thru.txt / reg-vvff-thru-fake-deaths.txt / reg-vvff-thru-think.txt / reg-vvff-thru-alt.txt]

[pest post / messed most / rest roast/ guest ghost / best boast]
table of bad locs [xxloc] [xxbadloc]
e1	e2	avail	been-here	fake-name	death-trap
Airy Isle	north	false	false	"Earning Ridges"	"You figure you've got a right to profit as you have gotten this far. Why, there're some bridges to cross ahead, even brighter than the brightening bridge you made back in the Violent Vale! Everything seems lit so clearly as you walk across them, but too late, you realize that is because they are BURNING BRIDGES."
Airy Isle	down	false	false	"Happy Hall"	"Man! You could use some cheer right now. The happy hall is spacious at first until you ... need to start crawling. You realize what this means."
Airy Isle	up	false	false	"Hippy Hill"	"You are sure the Hippy Hill will be full of peace and love and goodness and be an appropriate end to all this ... until you hear noises. A drippy drill. Then you are caught by a grippy grill! You suddenly realize you lack ... skippy skill."
Been Buggin	north	false	false	"Fun-Filled Gun Guild"	"Boy, there just hasn't been enough violence so far. You need a change of pace. But since it's fun-filled, it obviously can't harm you! It might be just the thing to get (further) un-illed. But unfortunately, as you think 'I'm one willed...' the fun starts. Loud gunshots. You are stun-shilled, then spun, spilled and finally none, nilled. You should have shun-shilled!"
Been Buggin	south	false	false	"Leaf Lake"	"Ah, that's an easy one! You sure could use a brief break. You do your homework: Jefe Jake doesn't rhyme, and Chief Chake and Grief Grake make nonsense. You think you smell beef bake as you walk by what is a fief (fake) and hear a sheaf shake, but that's ha... 'TEEF?! TAKE!' booms a loud voice. You cover your mouth, but you're still pushed over. A giant grabs you and takes you to the sea as its servant. Your job? 'REEF! RAKE!'"
Been Buggin	west	false	false	"Trust Trail"	"You walk down the Trust Trail, shortly given a side quest. 'Must mail,' someone says, handing you a letter and pointing to Dust Dale. Everything goes well until a gust-gale sweeps you off your feet--you grasp at a rust rail which is torn from the ground--and deposits you in, well, just jail. With no way to bust bail! You mutter to yourself, fussed, 'FAIL.'"
Blinding Blaze	east	false	false	"Bold [']n Brave"	"You feel like you can handle anything. Yes sir/ma'am! You are bold and brave! But shortly, you feel less warm. 'Cold ... and crave,' you think, slightly ungrammatically. Then an olden rave leaves you even more scared. You flee, until you tumble down and look up and realize you are trapped in a ...  golden grave!"
Blinding Blaze	north	false	false	"Straight Street"	"Oh boy, a straight street is a lot better than a maze! You might even find a Great Greet, or at least a Mate Meet. It's getting a bit lonely. But of course, you run into a Bait Beat chock full of Hate Heat, where people cry 'Late! Leet?!' You wind up crushed by weight ... wheat. It's not the desired fate-feat."
Fight Funnel	north	true	false	"Fortune Funnel"	"Boy oh boy! Enough of these rhymes. It would be neat to have fortune, you think as you walk. But it's also a bit hot...well, very hot... and you realize you've run into the TORCHIN['] TUNNEL.[paragraph break]Given where you started, you probably should've seen this, but it was worth a try."
Fun Fen	west	true	false	"Fame Fort"	"Hey, why not give it a chance? The place right after the intro, maybe there's a quick way through. I mean, what can they throw at you? A tame tort? Call you a 'same-sort?' It doesn't seem too difficult, until you hear 'Maim! Mort!' and remember Mort means death. Before you pass out, you see someone standing over you saying 'Shame, short.'"
Fun Fen	east	true	false	"Fate Farm"	"You figure, why not get to my fate sooner rather than later? A farm can't be that bad. You hear an innocuous 'Mate?! Marm?!' as you walk down a road, then a dismayed 'DISARM!' Yup, pretty nonviolent...[paragraph break]Until you are faced with mass chanting of 'Hate, harm!' The rest is unspeakable."
Gassed Gap	east	true	false	"Hopping Hills"	"Boy! You could use some funky music right now. There is some, but there's also someone who offers you some drugs to enhance the music. You eventually find yourself forgetting about your mission and POPPING PILLS you buy from SHOPPING SHILLS and, more speciously, drinking very bad alcohol from (brain) STOPPING STILLS."
Gassed Gap	west	true	false	"Rattlin['] Runs"	"Perhaps you expected to be battlin['] buns, which could not be too hard, but you really should not have been surprised to walk into a bunch of gatlin guns. People are tattlin['] tons at your obliviousness."
Lake Lap	east	true	false	"Hi! Here, Buy Beer"	"You don't have any cash, but so what? Maybe someone will recognize your adventuring exploits so far and give you some, free. You ignore that silly voice saying 'Fie! Fear!' It's probably from a sigh-seer or someone with a lie-leer, as it's to dry, drear. Passing shops called My Mere Guy Gear, Tie Teer and Pie Pier, you have a feeling something is nigh, near. The last words you and Jake hear are, of course, 'Die, dear' as you simultaneously feel an impact of a spy-spear and are run over by a sty-steer. And your last thought is 'Why? We're ...'"
Lake Lap	south	true	false	"Rad Route"	"Oh, it starts off okay. The lad lout is no problem. You walk cheerily by Stade Stout and Pad Pout, giving yourself a tad tout. But at the end, you run into people with clad clout, and it's a bad bout."
Lake Lap	north	true	false	"See Some... Gee, Gum"	"Maybe there's not just gum but you can say 'Me! Mum...' However, your thoughts are more 'Glee...GLUM' after you are ambushed by some ski scum."
Lake Lea	south	true	false	"Blest Bloom"	"Zest! Zoom! It smells nice at first as you walk along. But soon, it starts smelling like a rest room and then a smell of death. You hear a voice (and oh, what a best boom it is) intone 'DEST.: DOOM!' You realize you have wound up in ... a TEST TOMB."
Lake Lea	west	true	false	"Capped Cone"	"What could possibly be dangerous about a cone? Nothing, until you get beyond it to the ... ZAPPED ZONE."
Lake Lea	north	true	false	"Mo Main Low Lane"	"You walk along, feeling sure you will go gain so sane. But you are utterly surprised to find someone offering you ... cocaine. You just say no, but it is not heroic enough. When you aren't looking, you are enveloped by the horrid Bro Brain."
Whining War	east	true	false	"Done Dune"	"Despite a clearly-marked run rune, it doesn't seem like a place you should shun soon ... until you run into a GUN GOON."
Whining War	down	true	false	"Fast Foi'd"	"Apparently, you do not get to fast-forward. Well, you sort of do, but not to a good end. The last thing you see as you realize you can't breathe is a ... vast void. To you, it is classed cloyed."
Y'Old Yard	west	true	false	"Faun Fen"	"Boy, the faun fen seems relaxing! You waltz easily past the pawn pen, an obvious trap. But soon you suffer horrible, and ultimately fatal, tauntin['] and conkin[']. Set to gongin[']. All a bit off-key, but effective."
Y'Old Yard	south	true	false	"Lit Lawn"	"Boy! The lit lawn seems nice and bright! A fit faun is frolicking alone! You ignore the voice yelling 'get gone' and are unaware of a pit pawn and spit-spawn that grab you from behind, making you sit, sawn. You curse them with your last though, wondering if one was named Sean."

table of ranks [xxranks]
rank-max	rank-name
0	"cold cod"
-1	"lol'd, lawd" [this is defined explicitly as -1 because 1. I want to trigger a rank gain at the Fun Fen and 2. the introductory score may change]
--	"FLOL'd, flawed" [false laugh out loud]
--	"mold-mawed"
--	"holed, hawed"
--	"bowled, bah'd"
--	"sold sod"
--	"old, odd"
--	"told, tawed" [tawed = when an animal hide is beaten]
--	"th'old thawed"
--	"polled, pawed"
--	"shoaled, shod"
--	"scrolled scrod"
--	"trolled, trod"
--	"mold-mod"
--	"bold bod"
--	"rolled, rah'd"

to seed-score-list:
	let my-row be 0;
	let blank-rows be 0;
	let min-forced-score be -1;
	let Q be 0;
	let last-forced-row be 0;
	let last-points be 0;
	repeat through table of ranks:
		increment my-row;
		if there is a rank-max entry:
			if rank-max entry is -1, now rank-max entry is whew-score + 1; [keep initial rank until you get to Fun Fen. The +1 is because you can flip the big bag at any time.]
			now min-forced-score is rank-max entry;
			now last-forced-row is my-row;
			now last-points is rank-max entry + 1;
			next;
		if blank-rows is 0:
			now blank-rows is number of rows in table of ranks - my-row + 1;
		let temp be (my-row - last-forced-row) * ((core-max - 2) - min-forced-score);
		now rank-max entry is (temp / blank-rows) + min-forced-score;
[		if debug-state is true, say "Assigned rank: [b][rank-name entry][r] = [last-points] up to [rank-max entry].";]
		now last-points is rank-max entry + 1;
	if debug-state is true, carry out the showranksing activity;

to say your-rank:
	repeat through table of ranks:
		[ say "Comparing [core-score] <= [rank-max entry] for rank [rank-name entry]."; ]
		if core-score <= rank-max entry:
			say "[rank-name entry]";
			continue the action;
	if core-score < core-max - 1:
		say "(bug)";
	else:
		say "gold god[if core-score < core-max] (almost)[end if]";

volume random tables

table of mall songs [xxmall] [xxsongs]
randtxt
"Be Bop: See, Sop"
"Blue Blood Crew? Crud"
"Boy Boss Toy Toss[r], by Soy Sauce Roy Ross"
"Fit Fo['] Wit, Whoah" [show]
"Get Got, Net Naught"
"Good Gang? Dud, Dang"
"Hata['] Heft Data, Deft"
"Lo Love Show Shove"
"Mercy Me, Jersey G[r], by Versy V & Percy P"
"Pay, Pow, Hey, How"
"Stern Stable Turn Table"
"War Whistles, More Missiles"
"You'll Yell Woo Well"

table of miscellaneous people [xxpeople]
randtxt
"Blue Blood Stu, Stud"
"Bo, Better Go-Getter"
"Broken-Brain Jokin['] Jane"
"Fart Face Mart Mayes"
"Hefty Hata['] Lefty Leda"
"Hunter Hoke, Blunter Bloke"
"Hurt-Hell Burt Bell"
"Lair Level Daredevil Bear Bevell"
"Madman Chad Chan"
"Madman Tad Tan"
"Not Noble Scott Scoble"
"Pill-Perk Bill Burke"
"Quite Quick Knight Nick"
"Rude Rave Dude Dave"
"Sure-Shank Burbank"
"Trot Trice, Not-Nice Lot Lice"
"Wig Wearin['] Big Baron"
"Will-Work Bill Burke"
"Work-Will Kirk Kill"
"Would-Whirl Bud Burrell"

[the taunts below could be something from an enemy as well. I may wish to randomize them later.]
table of vvff digs [xxtaunts] [xxdigs] [xxmean]
randtxt
"Blue blood? Do? Dud! Boo, bud!"
"But, but?! Tut, tut!"
"Catcall: at ALL!"
"Dark day! Hark, hey!"
"Fie! Face my mace!"
"Gonna go off! Shun a show-off!"
"Look leading?! Book beating!"
"Mock me? Sock, SEE?!"
"'My magic try: TRAGIC!'"
"Rotten role: gotten goal?"
"Try to Fry, Foo[']! Die, do!"
"Want what? Taunt, tut!"
"Whoah! Words? No, nerds!"
"Yale? You'll fail, fool!"
"Zork?! Zero! Dork, Dear-oh!"

table of vvff books [xxbooks]
randtxt
"Ache or Make More Lake Lore"
"Bane, Bones, Stain Stones[r], by Jane Jones"
"Bank Books, Crank Crooks[r], by Hank Hooks"
"Barge, Banned Large Land"
"Been Back: Men Mack When Wack, by Ren Rack and Len Lack"
"Crew Came Grew Game"
"Dandy Dyin['] Sandy, Sighin[r], by Randy Ryan"
"Do Dance, Poo Pants[r], by Lou Lance and Stu Stantz"
"Do, Dare: Woo! Where"
"Duel Down, Cruel Crown"
"Dust Devils['] Lust Levels"
"Fall For Stall Store"
"Fat Farms['] Chat Charms: at Arms"
"Find Fame, Mind, Maim"
"Good Girl Would Whirl"
"Greater Gravel Traitor Travel"
"Grepping: Groan? STEPPING STONE"
"Him, Her, Dim, Durr[r], by Kim Kerr"
"Hole Hound Bowl Bound"
"Lay Lorn, Way Worn May Morn[r], by Kay Korn" [pay porn?]
"Meet Me Leetly"
"Men, Messed, Been Best, by Ren Rest"
"Must Mean Just Gene"
"My Man? Fie, Fan"
"Nag? No: Brag, Bro"
"Near Null Fearful"
"Oh, Trait So Straight"
"One Wet Sunset"
"Sane Sorts['] Pain Ports[r], by Wayne Wortz and Cain Kortz"
"Self Centered Elf Entered"
"Silly Signs[r], by Willy Wines and Tillie Tines"
"So Seek Crow Creek"
"Take Tess, Wake Wes, Make Mess"
"Why When My Men, by Ben"
"Your Be-Yays: Derby Days[r], by Herbie Hayes"

to say not-leet of (x - a cheattype): say "You notice the Leet Learner turned [scancol of x]"

table of Wet Wood clues
prof	randtxt
False	"You walk around a bit[one of] for the first time[or][stopping], and you wind up [one of]by a place called[or]back by[stopping] the HET HOOD. Homophobia and discrimination aren't cool, and you suspect they are part of the agenda of the Very Vile Fairy File. [not-leet of leteq]."
False	"You walk around some more and run into someone who calls out, 'Fret, frood...' Disheartened, you lose your way, but at least you make it back to the Wet Wood. [not-leet of letminus]."
False	"You walk around and discover a cabin belonging to someone named Det. Dood, who offers to help you sleuth how to get out of the Wet Wood for a modest fee. You decline the offer and run back to the Wet Wood. [not-leet of leteq]."
True	"You walk around and notice a distasteful small puddle where a pet peed, then a slightly more distasteful small mound where ... eegh. [not-leet of leteq]." [pet pood]

[leetclue of xxx]

volume miscellaneous hints and rules

this is the trivially false rule: the rule fails;
this is the trivially true rule: the rule succeeds;

to say rhyme-display: [pok]
	if Fun Fen is visited:
		say "you realize that you can change the first two letters to one, or vice versa, or change the first two letters completely. And it can be anything that rhymes.";
	else if me-minded is true:
		say "You managed to MIND ME, but now you need to evade the trash trap.";
	else if player is in Trim Tram:
		say "you've been able to collapse the first two letters to one (Trash Trap to Mash Map, which is an action, too) and vice versa (Mean Mass to Green Grass) but maybe there's something else to do.";
	else if player is in Po' Pit:
		say "you've been able to change the mean mass to green grass, meaning the number of letters doesn't have to be constant. You're not likely to find a fee, but maybe you can do something else.";
	else if mean mass is in Vined Vault:
		say "FIND FAULT wasn't spelled quite the same as VINED VAULT. In fact, FIND had fewer letters than VINED. So maybe you just need to change a different number of letters again.";
	else if player is in Vined Vault:
		say "GET GOOD and GIFT GIVER just switched two letters from WET WOOD and RIFT RIVER, but maybe you need to change a bit more here. While still rhyming.";
	else if player is in Rift River:
		say "GET GOOD worked to leave the WET WOOD. Perhaps something similar will work here.";
	else:
		say "WET WOOD. You've got that zig zag rig rag. Maybe there's alliterative rhyming, here. What rhymes with WET WOOD?";

volume random table code

to next-rand (t - a table name):
	choose row with tabnam of t in table of all randoms;
	increment tabidx entry;
	if tabidx entry > number of rows in tabnam entry:
		if debug-state is true, say "(Cycling) ";
		now tabidx entry is 1;
		if thru-yet entry is 0:
			now thru-yet entry is 1;
			now rand-cycle is true;
	let Q be tabidx entry;
	let lb be lbrk entry;
	choose row Q in tabnam entry;
	say "[randtxt entry][if lb is true][line break][else][no line break][end if]";

to say next-rand-txt of (t - a table name):
	next-rand t;

rand-cycle is a truth state that varies.

every turn (this is the notify cycling rule):
	if rand-cycle is true:
		let tn be a table-name;
		let tables-found be 0;
		now rand-cycle is false;
		repeat through table of all randoms:
			if thru-yet entry is 1:
				now thru-yet entry is 2;
				increment tables-found;
				if debug-state is true, say "DEBUG NOTE: [tabnam entry].";
				if tables-found is 1:
					say "[line break][if there is a cycle-note entry][cycle-note entry][line break][else]Whoah...that sounds familiar. You suspect the dialogue will loop again.[end if]";
				else if tables-found is 2:
					say "This is a further note to say you've done so more than once this turn, which is an impressive bit of timing, even if it doesn't get you any points.";
		if tables-found is 0 and debug-state is true, say "This is a BUG--you should have been notified of random cycling in a table, but you weren't.";
		the rule succeeds;

volume big meta table

table of all randoms
tabnam	tabidx	lbrk	thru-yet	desc	cycle-note
table of mall songs	0	false	0	"Songs after Tim T Sims"	--
table of miscellaneous people	0	false	0	"Assorted randos in [fussed]"	--
table of vvff books	0	false	0	"Books in the Lending Libe"	"The final book is Tish Tausch's [b]Pish Posh Mish Mosh[r], which lives down to its title. That's enough text digested for one adventure."
table of vvff digs	0	true	0	"Insults in the VVFF"	"The final entry reads, simply, 'Stare-y style, chary chile[']!'[paragraph break]That's all. A vicious slam book, indeed. Yet you feel pulled to looking at it again, instead of dispelling it once and for all."

Very Vile Fairy File Tables ends here.

---- DOCUMENTATION ----
