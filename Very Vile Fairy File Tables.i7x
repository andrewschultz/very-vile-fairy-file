Version 1/181108 of Very Vile Fairy File Tables by Andrew Schultz begins here.

"This is divided into 3 volumes: the tables, the core code and the big meta table. It is roughly copied from Ailihphilia. Ctrl-end for meta table. The core code is about a page long, so you can go ctrl-end page-up for that."

[dbh.py shortens to the debug version]

[sct.py checks for a lot of things including the Table of Bad Locs]

volume core tables

chapter the verb check table

[verb check and verb run rules. This is in approximate game-solve order.]

table of verb checks [xxvc]
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	songy	best-room	ver-rule	do-rule	wfull (topic)	think-advice
"glow"	"glad"	--	--	false	true	true	false	false	Been Buggin	vc-glow-glad rule	vr-glow-glad rule	--	text	[start interlude-y]
"stay"	"strong"	--	--	false	false	true	false	false	Been Buggin	vc-stay-strong rule	vr-stay-strong rule	--	-- [must be at top for JJ]
"get"	"good"	"git"	vh-get-good rule	false	false	true	false	false	Wet Wood	vc-get-good rule	vr-get-good rule	--	-- [start Intro]
"gift"	"giver"	--	--	false	false	true	false	false	Rift River	vc-gift-giver rule	vr-gift-giver rule	--	--
"find"	"fault"	"fined"	vh-find-fault rule	false	true	true	false	false	Vined Vault	vc-find-fault rule	vr-find-fault rule	--	--
"green"	"grass"	--	--	false	false	true	false	false	Vined Vault	vc-green-grass rule	vr-green-grass rule	--	--
"grow|oh|so"	"grit|it|sit"	"owe"	vh-grow-grit rule	false	true	true	false	false	Po Pit	vc-grow-grit rule	vr-grow-grit rule	"grow grit" or "oh it" or "so sit"	--
"mash|bash|rash|slash"	"map|bap|rap|slap"	--	--	false	true	true	false	false	Po Pit	vc-mash-map rule	vr-mash-map rule	"mash map" or "bash bap" or "rash rap" or "slash slap"	"You should be able to [b]MASH MAP[r] [once-now of vc-mash-map rule] you feel mentally tougher."
"mind"	"me"	"mined"	vh-mind-me rule	false	false	true	false	false	Trim Tram	vc-mind-me rule	vr-mind-me rule	--	--
"flim|skim"	"flam|scam"	--	--	false	false	true	false	false	Trim Tram	vc-flim-flam rule	vr-flim-flam rule	"flim flam" or "flimflam" or "skim scam"	"You tried to [b][ski-fli][r], but you didn't have the confidence. You may feel more comfortable doing so [once-now of vc-flim-flam rule] you have focused inward and feel no need to FIND FEE."
"spark"	"spliff"	--	--	false	true	false	false	false	Fun Fen	vc-spark-spliff rule	vr-spark-spliff rule	--	"You can [b]SPARK SPLIFF[r] [once-now of vc-spark-spliff rule] you've brought something combustible [here-to of Fun Fen]." [start of Fun Fen]
"strong"	"start"	--	--	false	true	false	false	false	Fun Fen	vc-strong-start rule	vr-strong-start rule	--	--
"fall"	"free"	--	--	false	true	true	false	false	Fun Fen	vc-fall-free rule	vr-fall-free rule	--	--
"dive"	"deep"	--	--	false	true	true	false	false	Fun Fen	vc-dive-deep rule	vr-dive-deep rule	--	--
"paper"	"pile"	--	--	false	true	true	false	false	Fun Fen	vc-paper-pile rule	vr-paper-pile rule	--	--
"backed"	"binder"	--	--	false	false	true	false	false	Fun Fen	vc-backed-binder rule	vr-backed-binder rule	--	--
"appealing"	"appear"	--	--	false	true	false	false	false	Real Rear	vc-appealing-appear rule	vr-appealing-appear rule	--	-- [start of Real Rear]
"kneel|kneeling"	"near"	"neal"	vh-kneel-near rule	false	false	true	false	false	Real Rear	vc-kneel-near rule	vr-kneel-near rule	--	--
"feel|feeling"	"fear"	--	--	false	false	true	false	false	Real Rear	vc-feel-fear rule	vr-feel-fear rule	--	"You tried to [b]FEEL FEAR[r] [here-in of Real Rear], but [once-now of vc-feel-fear rule] you have help from above, it will work."
"deal|dealing"	"dear"	"deer"	vh-deal-dear rule	false	true	true	false	false	Real Rear	vc-deal-dear rule	vr-deal-dear rule	--	"You tried to say [b]DEAL DEAR[r] [here-in of Real Rear], which will work [once-now of vc-deal-dear rule] you have something you need to deal with."
"heal|healing"	"here"	"heel/hear"	vh-heal-here rule	false	true	true	false	false	Real Rear	vc-heal-here rule	vr-heal-here rule	--	"You tried to [b]HEAL HERE[r] [here-in of Real Rear], which will be handy [once-now of vc-heal-here rule] you need to heal from something."
"history"	"hall"	"haul"	vh-history-hall rule	false	false	--	false	false	--	vc-history-hall rule	vr-history-hall rule	--	--
"mystery"	"mall"	"maul"	vh-mystery-mall rule	false	false	true	false	false	History Hall	vc-mystery-mall rule	vr-mystery-mall rule	--	--
"dark"	"door"	--	--	false	false	true	false	false	Stark Store	vc-dark-door rule	vr-dark-door rule	--	-- [start Stark Store]
"mark"	"more"	"moor"	vh-mark-more rule	false	false	true	false	false	Stark Store	vc-mark-more rule	vr-mark-more rule	--	"You'll want to [b]MARK MORE[r] [once-now of vc-mark-more rule]you've found something to mark [here-in of Stark Store]."
"cleared"	"clay"	--	--	false	true	true	false	false	Stark Store	vc-cleared-clay rule	vr-cleared-clay rule	--	--
"bumped|dumped"	"buster|duster"	--	--	false	true	false	false	false	Been Buggin	vc-bumped-buster rule	vr-bumped-buster rule	"bumped buster" or "dumped duster"	--
"tight"	"tunnel"	--	--	false	false	true	false	false	Fight Funnel	vc-tight-tunnel rule	vr-tight-tunnel rule	--	-- [start fight funnel]
"knives"	"niche"	--	--	false	false	true	false	false	Dives Ditch	vc-knives-niche rule	vr-knives-niche rule	--	-- [start dives ditch]
"wild"	"weed"	--	--	false	true	false	false	false	--	vc-wild-weed rule	vr-wild-weed rule	--	--
"lots"	"lame"	--	--	false	false	true	false	false	History Hall	vc-lots-lame rule	vr-lots-lame rule	--	-- [start Mystery Mall]
"no|know"	"nappin|napping"	--	--	false	true	true	false	true	--	vc-no-nappin rule	vr-no-nappin rule	--	--
"ho"	"happen"	"hoe"	vh-ho-happen rule	false	true	false	false	true	--	vc-ho-happen rule	vr-ho-happen rule	--	--
"dimd"	--	--	--	false	false	false	false	false	History Hall	vc-dimd rule	vr-dimd rule	--	--
"whatta"	"wanksta"	--	--	false	true	false	false	false	History Hall	vc-whatta-wanksta rule	vr-whatta-wanksta rule	"what a wanksta" or "whatta wanksta"	--
"youre|your|yore"	"yonder"	--	--	false	false	true	false	false	History Hall	vc-youre-yonder rule	vr-youre-yonder rule	--	--
"glean"	"glows"	"gloze"	vh-glean-glows rule	false	false	true	false	false	History Hall	vc-glean-glows rule	vr-glean-glows rule	--	"You'll want to [b]GLEAN GLOWS[r] [once-now of vc-glean-glows rule] you've found something Mean Moe's Clean Clothes can clean."
"smashing"	"smoke"	--	--	false	false	true	false	false	Y'Old Yard	vc-smashing-smoke rule	vr-smashing-smoke rule	--	"You can make [b]SMASHING SMOKE[r] [once-now of vc-smashing-smoke rule] you've found someone or something that could use a suitable diversion." [start Y'Old Yard]
"lending"	"libe"	--	--	false	false	true	false	false	Vending Vibe	vc-lending-libe rule	vr-lending-libe rule	--	-- [start Vending Vibe]
"see"	"sign"	"sea/sine"	vh-see-sign rule	false	false	true	false	false	--	vc-see-sign rule	vr-see-sign rule	--	--
"hard"	"hat"	--	--	false	false	true	false	false	Got Gear Hot Here	vc-hard-hat rule	vr-hard-hat rule	--	-- [start Got Gear Hot Here]
"lie"	"lol"	"lye/loll"	vh-lie-lol rule	false	true	false	false	false	Got Gear Hot Here	vc-lie-lol rule	vr-lie-lol rule	--	--
"not"	"near"	"knot"	vh-not-near rule	false	true	false	false	false	Got Gear Hot Here	vc-not-near rule	vr-not-near rule	--	--
"beast"	"boss"	--	--	false	true	true	false	false	Creased Cross	vc-beast-boss rule	vr-beast-boss rule	--	"You tried to summon the [b]BEAST BOSS[r] [here-in of Creased Cross] but need to try again [once-now of vc-beast-boss rule] you're armed better."[start Creased Cross]
"cull|lul"	"ceased|least"	--	--	false	true	true	false	false	Creased Cross	vc-cull-ceased rule	vr-cull-ceased rule	"cull ceased" or "lul least"	"You should be able to say [b][cul-lul][r] [once-now of vc-cull-ceased rule] you're back to full strength."
"full"	"feast"	--	--	false	true	true	false	false	Creased Cross	vc-full-feast rule	vr-full-feast rule	--	"You could make the Bull Beast a [b]FULL FEAST[r] [once-now of vc-full-feast rule] it's been vanquished."
"least"	"loss"	--	--	false	true	true	false	false	Creased Cross	vc-least-loss rule	vr-least-loss rule	--	"You could say [b]LEAST LOSS[r] [once-now of vc-least-loss rule] you have something to face [here-in of Creased Cross]."
"loft"	"land"	--	--	false	false	true	false	false	Soft Sand	vc-loft-land rule	vr-loft-land rule	--	-- [start Soft Sand]
"soft"	"sand"	--	--	false	false	--	false	false	--	vc-soft-sand rule	vr-soft-sand rule	--	--
"plain"	"pleasant"	"plane"	vh-plain-pleasant rule	false	true	true	false	false	Foe Field So Sealed	vc-plain-pleasant rule	vr-plain-pleasant rule	--	-- [start Foe Field]
"show|sho"	"shield"	--	--	false	true	true	false	false	Foe Field So Sealed	vc-show-shield rule	vr-show-shield rule	--	"You'll want to [b]SHOW SHIELD[r] [once-now of vc-show-shield rule] you've found something that can protect you in the Foe Field."
"cool"	"cap"	--	--	false	true	true	false	false	Curst Cave	vc-cool-cap rule	vr-cool-cap rule	--	-- [start Curst Cave]
"dreaming"	"dull"	--	--	false	true	true	false	false	Curst Cave	vc-dreaming-dull rule	vr-dreaming-dull rule	--	--
"first"	"fave"	--	--	false	false	true	false	false	Curst Cave	vc-first-fave rule	vr-first-fave rule	--	"You could say [b]FIRST FAVE[r] [once-now of vc-first-fave rule] the screaming skull is gone."
"moral"	"mage"	"morel"	vh-moral-mage rule	false	false	true	false	false	Curst Cave	vc-moral-mage rule	vr-moral-mage rule	--	"You tried to find the [b]MORAL MAGE[r], but you couldn't open the coral cage yet."
"work"	"well"	--	--	false	true	true	false	false	--	vc-work-well rule	vr-work-well rule	--	-- [start Shirk Shell]
"dear"	"dull"	"deer"	vh-dear-dull rule	false	true	true	false	false	Here Hull	vc-dear-dull rule	vr-dear-dull rule	--	-- [start Here Hull]
"near"	"null"	--	--	false	true	true	false	false	Here Hull	vc-near-null rule	vr-near-null rule	--	--
"sit"	"sound"	--	--	false	false	true	false	false	Pit Pound	vc-sit-sound rule	vr-sit-sound rule	--	-- [start Pit Pound]
"fit"	"found"	--	--	false	true	true	false	false	Pit Pound	vc-fit-found rule	vr-fit-found rule	--	"You can declare a [b]FIT FOUND[r] [once-now of vc-fit-found rule] you've gotten rid of the Hit Hound."
"winding|minding|finding"	"ways|maze|phase|fays|feys"	--	--	false	false	true	false	false	Blinding Blaze	vc-winding-ways rule	vr-winding-ways rule	"winding ways" or "minding maze" or "finding phase/fays/feys"	-- [start Blinding Blaze]
"mo|mow"	"mappin|mapping"	--	--	false	true	true	false	true	Blinding Blaze	vc-mo-mappin rule	vr-mo-mappin rule	--	"You can try [b]MO MAPPIN[r] [once-now of vc-mo-mappin rule] you've found a suitable place to map."
"luck|snuck"	"lair|snare"	--	--	false	false	true	false	false	Blinding Blaze	vc-luck-lair rule	vr-luck-lair rule	"luck lair" or "snuck snare"	--
"brightening"	"bridge"	--	--	false	false	true	false	false	Violent Vale	vc-brightening-bridge rule	vr-brightening-bridge rule	--	-- [start Violent Vale]
"silent"	"sail|sale"	--	--	false	false	true	false	false	Violent Vale	vc-silent-sail rule	vr-silent-sail rule	--	--
"boring"	"boat"	--	--	false	false	true	false	false	Violent Vale	vc-boring-boat rule	vr-boring-boat rule	--	--
"wake"	"whee|wee"	"we"	vh-wake-whee rule	false	true	true	false	false	Lake Lea	vc-wake-whee rule	vr-wake-whee rule	--	-- [start Lake Lea]
"take"	"tea"	"t/tee"	vh-take-tea rule	false	false	true	false	false	Lake Lea	vc-take-tea rule	vr-take-tea rule	--	"You could [b]TAKE TEA[r] with Jake G. [once-now of vc-fake-fee rule] he's conscious."
"fake"	"fee"	--	--	false	false	true	false	false	Lake Lea	vc-fake-fee rule	vr-fake-fee rule	--	"You could give Jake G. a [b]FAKE FEE[r] [once-now of vc-fake-fee rule] Jake G. has given you something of value."
"break"	"brie"	"brake"	vh-break-brie rule	false	false	false	false	false	--	vc-break-brie rule	vr-break-brie rule	--	--
"make"	"map"	--	--	false	false	true	false	false	--	vc-make-map rule	vr-make-map rule	--	-- [start Lake Lap]
"co"	"capn"	"cappin"	vh-co-capn rule	false	false	true	false	true	--	vc-co-capn rule	vr-co-capn rule	--	"You tried to find a [b]CO CAPN[r] but need to try again [once-now of vc-co-capn rule] there's a worthy comrade."
"snake"	"snap"	--	--	false	true	true	false	false	--	vc-snake-snap rule	vr-snake-snap rule	--	"You can [b]SNAKE SNAP[r] [once-now of vc-snake-snap rule] it's clear a snake is present."
"lean"	"luggin|lugging"	"lien"	vh-lean-luggin rule	false	false	true	false	false	--	vc-lean-luggin rule	vr-lean-luggin rule	--	"You tried some [b]LEAN LUGGIN[r], which should be more doable [once-now of vc-lean-luggin rule] you've dealt with your temporary loss of faith." [start Been Buggin]
"mean"	"muggin|mugging"	"mien"	vh-mean-muggin rule	false	false	true	false	false	--	vc-mean-muggin rule	vr-mean-muggin rule	--	"You tried some [b]MEAN MUGGIN[r], which should be more doable [once-now of vc-mean-muggin rule] you've dealt with your temporary loss of faith."
"so"	"sappin|sapping"	"sew/sow"	vh-so-sappin rule	false	true	true	false	true	Whining War	vc-so-sappin rule	vr-so-sappin rule	--	"You can make things [b]SO SAPPIN[r] [once-now of vc-so-sappin rule] you can find where people are using their energy fruitlessly." [start Whining War]
"shining"	"shore"	--	--	false	false	true	false	false	Whining War	vc-shining-shore rule	vr-shining-shore rule	--	"You can make the [b]SHINING SHORE[r] [once-now of vc-shining-shore rule] you dealt with the Whining War."
"mining"	"more|moor"	--	--	false	true	true	false	false	Whining War	vc-mining-more rule	vr-mining-more rule	--	"You should be able to perform [b]MINING MORE[r] [once-now of vc-mining-more rule] the pining poor are fully satisfied."
"dining"	"door"	--	--	false	false	true	false	false	Whining War	vc-dining-door rule	vr-dining-door rule	--	"You should be able to make a [b]DINING DOOR[r] [once-now of vc-dining-door rule] the Whining War has calmed down a bit."
"pull"	"pieced"	--	--	false	true	true	false	false	Whining War	vc-pull-pieced rule	vr-pull-pieced rule	--	"You can [b]PULL PIECED[r] the Bull Beast [once-now of vc-pull-pieced rule] you have more people willing to help you."
"cast"	"cap"	"caste"	vh-cast-cap rule	false	false	true	false	false	Gassed Gap	vc-cast-cap rule	vr-cast-cap rule	--	"You can [b]CAST CAP[r] [once-now of vc-cast-cap rule] rule you have a worthy one." [start Gassed Gap]
"beaker"	"bustle"	--	--	false	true	false	false	false	Gassed Gap	vc-beaker-bustle rule	vr-beaker-bustle rule	--	--
"meeker"	"muscle"	"mussel"	vh-meeker-muscle rule	false	true	true	false	false	Gassed Gap	vc-meeker-muscle rule	vr-meeker-muscle rule	--	--
"wood"	"one"	"won/would"	vh-wood-one rule	false	false	true	false	false	Gassed Gap	vc-wood-one rule	vr-wood-one rule	--	--
"go"	"gappin|gapping"	--	--	false	false	true	false	true	Gassed Gap	vc-go-gappin rule	vr-go-gappin rule	--	"You'll want to [b]GO GAPPIN[r] [once-now of vc-go-gappin rule] you've found a gap to go over."
"couple"	"caps"	--	--	false	false	true	false	false	--	vc-couple-caps rule	vr-couple-caps rule	--	"You tried to [b]COUPLE CAPS[r] earlier, but that'll work [once-now of vc-couple-caps rule] you've got enough caps to couple."
"lot"	"lord"	--	--	false	false	true	false	false	Airy Isle	vc-lot-lord rule	vr-lot-lord rule	--	-- [start Airy Isle]
"hot"	"horde"	"hoard"	vh-hot-horde rule	false	false	true	false	false	Airy Isle	vc-hot-horde rule	vr-hot-horde rule	--	--
"got"	"gored"	"gourd"	vh-got-gored rule	false	false	true	false	false	Airy Isle	vc-got-gored rule	vr-got-gored rule	--	"The battle cry [b]GOT GORED[r] should work [once-now of vc-got-gored rule] you have a full army and its leader."
"whoa|whoah|woe"	"wait"	"weight"	vh-whoa-wait rule	false	true	true	false	false	Airy Isle	vc-whoa-wait rule	vr-whoa-wait rule	--	--
"tell"	"torn"	--	--	false	false	true	false	false	Tarry Tile	vc-tell-torn rule	vr-tell-torn rule	--	-- [start Tarry Tile/Merry Mile]
"merry"	"mile"	"marry"	vh-merry-mile rule	false	false	true	false	false	Tarry Tile	vc-merry-mile rule	vr-merry-mile rule	--	"You can call for a [b]MERRY MILE[r] [once-now of vc-merry-mile rule] things have calmed down."
"bury"	"bile"	"berry"	vh-bury-bile rule	false	false	true	false	false	Tarry Tile	vc-bury-bile rule	vr-bury-bile rule	--	"When you tried to [b]BURY BILE[r], it didn't feel like the right place. [if Airy Isle is unvisited]And maybe you need to find the Very Vile Fairy File first[else if well worn hell horn is touchable]But that Well Worn Hell Horn needs to go[else if sco-merry-mile is false]But you're not feeling cheery enough yet[else]The time and place are now[end if]."
"big"	"bag"	--	--	false	true	true	false	false	--	vc-big-bag rule	vr-big-bag rule	--	-- [two any-time things]
"really"	"rolling"	--	--	false	true	false	false	false	--	vc-really-rolling rule	vr-really-rolling rule	--	--

section vc- and vr- rule definitions

the goodrhyme rules are a rulebook. the goodrhyme rules have outcomes unavailable, not-yet, already-done and ready.

section verb homonym rules rules [xxvhr]

this is the vh-co-capn rule: say "You need camaraderie, not firepower. [toe tappin] is not a stereotypical violent rap song, anyway." instead;

this is the vh-find-fault rule: say "Pretty close, but you don't need to make this a debtor's prison. You need to make it easier to get out of." instead;

this is the vh-get-good rule: say "You don't need source control, but you're close, here." instead;

this is the vh-grow-grit rule: say "Not quite OWE ... but you sense there are several ways to toughen up." instead;

this is the vh-mind-me rule: say "You need to take care of, not booby-trap, yourself." instead;

this is the vh-kneel-near rule: say "You don't need to call anyone by their first names. It would be disrespectful to try, with the Ceiling Seer." instead;

this is the vh-deal-dear rule: say "You don't need to populate this area with wildlife. It's the right amount of peaceful." instead;

this is the vh-heal-here rule:
	if the player's command includes "hear", say "There is no noise or distraction preventing hearing." instead;
	if the player's command includes "heel", say "The Ceiling Seer only helps the good guys." instead;

this is the vh-history-hall rule: say "You don't need THAT much stuff." instead;

this is the vh-mystery-mall rule: say "You don't need to destroy anything." instead;

this is the vh-mark-more rule: say "Close, but what would a moor be doing near a store?" instead;

this is the vh-ho-happen rule: say "Keep farming, you'll get the right homonym." instead;

this is the vh-got-gored rule: say "That worked in The Life of Brian, but ... well, you need something with more oomph. You're close." instead

this is the vh-glean-glows rule: say "You shouldn't be fishing for flattery." instead;

this is the vh-see-sign rule:
	if the player's command includes "sea", say "You remain landlocked. But perhaps you can find a better way to, umm, look at things." instead;
	if the player's command includes "sine", say "The sine of 15 degrees is square root of 6 - square root of 2 over 4. The sine of 18 degrees is square root of 5 - 1 over 4. TMYK! Though ... you may want to [i]discover[r] something more relevant." instead;

this is the vh-lie-lol rule:
	if the player's command includes "lye", say "Lye poisoning is a serious matter. Maybe there's a better way to deal with the shawl, but only if you want." instead;
	if the player's command includes "loll", say "Instead of lolling, why not have more fun? Maybe there's a better way to deal with the shawl, but only if you want." instead;

this is the vh-not-near rule: say "Homonyms will tie you up in knots in this game, especially homonyms of solutions to optional puzzles." instead;

this is the vh-plain-pleasant rule: say "The peasant acquires no magical transportation." instead;

this is the vh-moral-mage rule: say "You don't need a plantomancer." instead;

this is the vh-dear-dull rule: say "But the beer bull might maul the deer." instead;

this is the vh-wake-whee rule: say "You are already awake. You need to make Jake ache to be awake." instead;

this is the vh-take-tea rule: say "You need to, um, tee up something more positive." instead;

this is the vh-break-brie rule: say "You get the feeling you can, but don't have to, change things up just a bit." instead;

this is the vh-lean-luggin rule: say "Whoah! Close, but tax stuff is too complicated and bloated." instead;

this is the vh-mean-muggin rule: say "Something similar, but much tougher, if not tougher to spell, than mien." instead;

this is the vh-so-sappin rule:
	if player is in foe field so sealed and gold guard is not moot, continue the action; [?? tricky to test]
	say "Three letters is too much to twiddle [toe tappin]! You need to keep it simple." instead;

this is the vh-cast-cap rule: say "You don't have to show anyone you're better than they are. Well, maybe you can defeat them in a challenge, but that's different." instead;

this is the vh-meeker-muscle rule: say "Ooh! You're on the right track, but you don't quite need to turn Russell into seafood." instead;

this is the vh-wood-one rule: say "The good gun seems to bend a bit. You must be close to a concrete way to change it." instead;

this is the vh-hot-horde rule: say "Treasure isn't the goal, here. You[if lot lord is touchable] and the lot lord[end if] [if hot horde is touchable]already have[else]need[end if] allies." instead; [?? what about after in place]

this is the vh-whoa-wait rule: say "You wouldn't want to be crushed by a weight. But you've got the right idea." instead;

this is the vh-merry-mile rule: say "It's debatable whether marriage makes things happier or not. Tweak things for assurance." instead;

this is the vh-bury-bile rule: say "You need to do the opposite of eat something." instead;

[zzvhr]

section vc- and vr- rules [xxvcvr]

a goodrhyme rule (this is the vc-appealing-appear rule) :
	if player is not in Real Rear, unavailable;
	if sco-appealing-appear is true:
		vcal "The peeling pier already looks better.";
		already-done;
	ready;

this is the vr-appealing-appear rule:
	say "A little tilt of the head, a little impromptu cleanup, and suddenly you can see that the peeling pier's was, in fact, made by APPEALING-APPEAR. Yes, it looks nicer now, and of course, it doesn't HAVE to look perfect in such a spiritual area.";
	now sco-appealing-appear is true; [probably shouldn't zap this and replace with "peeling pier is optional" checks...]
	now peeling pier is not optional;
	if sco-heal-here is false:
		now cht of peeling pier is partminus; [->heal here]
	else:
		phbt peeling pier;

a goodrhyme rule (this is the vc-backed-binder rule) :
	if paper pile is not touchable or player has the backed binder, unavailable;
	ready;

this is the vr-backed-binder rule:
	say "The papers labeled FACT FINDER should be useful. You find a way to glue them all together. They contain objective documentation of the Crimes Crew Times Two's exploits. You've been at the receiving end of some of their psychological tricks, and though you appreciate proof you weren't being oversensitive, you still shudder.";
	now player has backed binder;
	moot paper pile;
	set the pronoun it to backed binder;

a goodrhyme rule (this is the vc-beaker-bustle rule) :
	if Reeker Russell is not touchable, unavailable;
	if sco-beaker-bustle is true:
		vcal "Russell's moment of interest in the sciences has passed.";
		already-done;
	ready;

this is the vr-beaker-bustle rule:
	say "You have a vision of a much nerdier version of Reeker Russell going around and performing weird experiments. But you quickly snap back to reality. Still, it's good to be able to laugh at things.";
	now sco-beaker-bustle is true;
	adjust-russell;

a goodrhyme rule (this is the vc-beast-boss rule) :
	if player is not in Creased Cross, unavailable;
	if Bull Beast is not off-stage:
		vcal "You already summoned the Bull Beast.";
		already-done;
	if player does not have gold guard:
		vcp "You don't feel armed for that, yet.";
		not-yet;
	if gull-guard is false:
		vcp "You aren't very confident your mold-marred gold guard could hold up in any sort of fight. You need to buff it up somehow first.";
		not-yet;
	ready;

this is the vr-beast-boss rule:
	say "A Bull Beast appears to answer your summons. You hope you have done the right thing, as it roughs you up a bit. You'll need to minimize the damage, here!";
	move Bull Beast to Creased Cross;
	now sco-beast-boss is true;
	set the pronoun it to Bull Beast;

a goodrhyme rule (this is the vc-big-bag rule) :
	if player has big bag:
		vcal "You already made the big bag.";
		already-done;
	ready;

this is the vr-big-bag rule:
	say "The zig-zag rig rag does a little wig-wag (I guess what you'd call it,) and it transforms into a much more useful big bag!";
	moot zig zag rig rag;
	now player has big bag;
	set the pronoun it to big bag;
	if mrlp is worst whew:
		repeat through table of narratives:
			if rank-num entry <= whew-score:
				increment rank-num entry;
			else:
				break;

a goodrhyme rule (this is the vc-boring-boat rule) :
	if player is not in Violent Vale or flooring float is off-stage, unavailable;
	if boring boat is moot:
		vcal "You don't need to bring the boring boat back.";
		already-done;
	if boring boat is in Violent Vale:
		vcal "The boat is already boring and practical enough.";
		already-done;
	ready;

this is the vr-boring-boat rule:
	say "The flooring float sinks and tips over slightly. Some of its excess cargo falls into the water, never to return. It becomes much leaner and more practical--a boring boat!";
	moot flooring float;
	move boring boat to Violent Vale;
	set the pronoun it to boring boat;

a goodrhyme rule (this is the vc-break-brie rule) :
	if jake is not touchable, unavailable;
	if sco-wake-whee is false:
		vcp "This bonus point action won't work until Jake is conscious.";
		not-yet;
	if sco-break-brie is true:
		vcal "Hey! Don't get greedy, now.";
		already-done;
	ready;

this is the vr-break-brie rule:
	say "'Ooh, good one! I almost forgot I had it. I don't like it. Here, have it all.' This might not help in the end, but yay free food.";
	now sco-break-brie is true;

a goodrhyme rule (this is the vc-brightening-bridge rule) :
	if frightening fridge is not touchable, unavailable;
	ready;

this is the vr-brightening-bridge rule:
	say "The fridge collapses and flattens and provides a secure passage to the east!";
	moot frightening fridge;

a goodrhyme rule (this is the vc-bumped-buster rule) :
	if clumped cluster is touchable, ready;
	unavailable;

this is the vr-bumped-buster rule:
	say "You start pushing and kicking at the clumped cluster. Parts of it break off, but not very quickly until you start chanting 'Bumped, buster.' And what do you know? You find a dumped duster that makes your browsing through the clumped cluster easier. The rest of the cleanup is easy. Your only reward for your hard work is -- satisfaction of a job well done and that anyone who wrote the Very Vile Fairy File would be upset indeed to see someone doing nice stuff, just because. You hope Dean Duggan is happy.";
	moot clumped cluster;

a goodrhyme rule (this is the vc-bury-bile rule) :
	if player is in Tarry Tile:
		if well worn hell horn is moot and sco-merry-mile is true, ready;
		if well worn hell horn is in Tarry Tile:
			vcp "The well worn hell horn makes a loud noise. It's intimidating, and yet, you could find a way to prep yourself to ignore or get rid of the horn, then take the file.";
			not-yet;
		if sco-merry-mile is false:
			vcp "You want to, but you're still just barely forcing it. You need a way to cheer yourself up to get going.";
			not-yet;
	if mrlp is Worst Whew:
		vcp "You try, and it seems right, but it's not that easy. You have quite a journey before you, until you can do that. But when the time is right, it will be very effective.";
		not-yet;
	if mrlp is Piddling Pain or mrlp is Browsy Breaks:
		vcp "You can sort of deal with that right now. But you need to do better! You still have adventure to go!";
		not-yet;
	if player is in Airy Isle:
		vcp "You'd like to do that, but not here with so many distractions, during perhaps the big last fight.";
		not-yet;
	if mrlp is Vale Verminous:
		vcp "It must be about the right time. But you are not quite there, yet.";
		not-yet;
	unavailable;

this is the vr-bury-bile rule:
	win-the-game;

a goodrhyme rule (this is the vc-cast-cap rule) :
	if player is not in Gassed Gap, unavailable;
	if cool cap is moot:
		vcal "The cap has been cast.";
		already-done;
	if sco-couple-caps is false:
		let N be my-hats;
		if N is 0:
			vcp "You don't have any caps to cast.";
		else if N is 1:
			vcp "The [random gaphat enclosed by the player] isn't enough on its own.";
		else if N is 2:
			vcp "The [list of gaphats enclosed by the player] aren't quite enough.";
		else if N is 3:
			vcp "Wow! Three hats! They would be great to cast! But if only there was a way to combine them into an extra-cool hat you could cast all at once!";
		not-yet;
	ready;

this is the vr-cast-cap rule:
	say "You cast your cap, and the haze to the north disappears. You can see the way! But you can also see someone big and mean: you know it must be (W)re(a/e)ker Russell!";
	moot cool cap;
	move Reeker Russell to Gassed Gap;
	phbt Gassed Gap;
	set the pronoun him to Reeker Russell;

a goodrhyme rule (this is the vc-cleared-clay rule) :
	if player is not in Stark Store, unavailable;
	if weird way is moot:
		vcal "The clay is cleared enough.";
		already-done;
	ready;

this is the vr-cleared-clay rule:
		say "You concentrate on the weird way, which is, uh, weirder than trying to clear it with actual hard physical work. But it's effective! The clay crumbles and sinks into the ground. You can go down now!";
	moot weird way;

a goodrhyme rule (this is the vc-co-capn rule) :
	if player does not have toe tappin or sco-snake-snap is true, unavailable;
	if sco-co-capn is true:
		vcal "Jake already is[if jake is not touchable] and will be when you return to see him[end if].";
		already-done;
	if jake is not touchable:
		vcp "It might be nice to have a cohort for a bit, but there's nobody worthy here.";
		not-yet;
	if sco-fake-fee is false:
		vcp "You haven't (yet) bonded with Jake G. enough for that.";
		not-yet;
	ready;

this is the vr-co-capn rule:
	say "Jake smiles as you pronounce him an equal partner in whatever you find.";
	now sco-co-capn is true;
	process the check-sing-max rule;

a goodrhyme rule (this is the vc-cool-cap rule) :
	if tool tap is not touchable, unavailable;
	ready;  [?? YOULL YAP / CRUEL CRAP !!!!!]

this is the vr-cool-cap rule:
	say "Whoah! A cool cap must REALLY have been stuck in the tool tap. Somehow, it squeezes through. It appears to be sturdy, with no obvious rips. The tool tap explodes and vaporizes from the effort of having squeezed out the cool cap.";
	now player has cool cap;
	moot tool tap;

a goodrhyme rule (this is the vc-couple-caps rule) :
	if player does not have jerk gel, unavailable;
	if my-hats < 3: [this seems a bit awkward, but I put it this way so vc.py can detect CONTINUE THE ACTION as appropriate]
		if my-hats is 2:
			vcp "You'd think if you're coupling, you'd only need two hats or caps, but after some fiddling, you realize you need one more. Bummer!";
		else if my-hats is 1:
			vcp "You need at least one more hat to couple the CAPS.";
		else:
			vcp "You have no caps to couple. Maybe one day, though.";
		not-yet;
	ready;

this is the vr-couple-caps rule:
	say "Surprisingly, you don't need instructions to combine the hard hat, cool cap and cake cap into, well, an extra-cool cap. It's--well, it's got to be good for something dramatic!";
	moot hard hat;
	moot cake cap;
	moot jerk gel;
	now printed name of cool cap is "extra cool cap";
	now sco-couple-caps is true;

a goodrhyme rule (this is the vc-cull-ceased rule) :
	if Bull Beast is off-stage, unavailable;
	process the lul-cull rule; [to determine which was the first word, LUL LEAST or CULL CEASED]
	if player is not in Creased Cross:
		vcp "You need to go back to Creased Cross.";
		not-yet;
	if sco-heal-here is false:
		vcp "You need to find a way to restore your health.";
		not-yet;
	if Bull Beast is boring:
		vcal "Don't brag too much, now.";
		already-done;
	ready;

this is the vr-cull-ceased rule:
	say "Your battle cry, coupled with your new improved healed self, worries the Bull Beast. But what worries it even more is the Spiel Spear that flashes suddenly in your hand. Your faith in the Ceiling Seer is rewarded! Your words, which the spear translates into a few sharp slurps, groans and growls, cause the Bull Beast to run off in extreme psychological anguish before collapsing from something stress-related, I guess. Or maybe from being embarrassed about being so embarrassed by so little.[paragraph break]You give chase, and it traps and lashes out at you. Reflexively, you block with the spear and strike back. Your first swipe is lethal.[paragraph break]Perhaps you can do something constructive with the Bull Beast's dead body.";
	now sco-cull-ceased is true;
	now Bull Beast is boring; [?? what if dead]
	now cht of Bull Beast is leteq; [Bull Beast->full feast]

a goodrhyme rule (this is the vc-dark-door rule) :
	if player is not in Stark Store, unavailable;
	if dark door is not off-stage:
		vcal "You already made the dark door appear[if dark door is moot] and disappear to create a passage[end if].";
		already-done;
	ready;

this is the vr-dark-door rule:
	say "Hey, wait a minute! You have a closer look and notice the outline of a dark door. Now you've seen it, you can't un-see it. There we go!";
	move dark door to Stark Store;
	set the pronoun it to dark door;

a goodrhyme rule (this is the vc-deal-dear rule) :
	if player is not in Real Rear, unavailable;
	if sco-felt-fear is false:
		vcp "You haven't found anything you need to deal with[seer-sez].";
		not-yet;
	if cage key is not off-stage:
		vcal "Overdoing dealing with it is ... one way to show you might not be dealing with it.";
		already-done;
	ready;

this is the vr-deal-dear rule:
	say "You reflect and have faith in yourself. Help will come at a good time, when you do not feel too desperate. And wait! It's coming now! The Sage Sea calms and parts briefly to reveal a cage key. You step in, not worried it may engulf you, because you've practiced your serenity. You retrieve the key with no problems.";
	now player has cage key;
	phbt Real Rear;
	phbt steel steer;

a goodrhyme rule (this is the vc-dear-dull rule) :
	if player is not in Here Hull, unavailable;
	if Beer Bull is moot:
		vcal "Yeah, easy to say with the Beer Bull gone for good.";
		already-done;
	if in-bull-chase is true:
		vcal "You don't need to do any more taunting.";
		already-done;
	ready;

this is the vr-dear-dull rule:
	now zap-core-entry is true;
	say "The Beer Bull twitches[one of][or] again[stopping]. One thing it can't abide is being called dull! It's going to be chasing after you for a bit[if sco-near-null is false]. Watch out--it's super-charged. Maybe you can find some way to make it a little less terrifying[end if].";
	start-bull-chase;

a goodrhyme rule (this is the vc-dimd rule) :
	if oi mo is not touchable, unavailable;
	ready;

this is the vr-dimd rule:
	say "The beats of [i]Oi, Mo[r] quiet down out of hearing. You're worried they may be replaced by some song like [i]Primp'r[r] or the crushingly simplistic duet [b]Hey Hey Bay-Bay[r] by Jay-Jay and Neneh, but it's your lucky day. It's calmer now--random songs have started playing, which you can LISTEN to if you want.";
	if Gutta Ganksta is in History Hall, say "[line break]The Gutta Ganksta, upset at the change in music, petulantly lashes out 'Hey, hack! Way wack!'";
	moot oi mo;

a goodrhyme rule (this is the vc-dining-door rule) :
	if player is not in Whining War, unavailable; [?? big problem with what replaces Violent Vale]
	if sco-so-sappin is false:
		vcp "You can't make a dining door with all this whining going on!";
		not-yet;
	if sco-shining-shore is false:
		vcp "You hear a rumbling, but it's still too dingy here for anything nice like a dining door.";
		not-yet;
	if sco-dining-door is true:
		vcal "The dining door is already here.";
		already-done;
	ready;

this is the vr-dining-door rule:
	say "Up from the ground, a dining door rumbles and appears. From behind, you hear a cheery song: 'Merry mood, fairy food, dairy dude.' You try to open it but fail. Perhaps it will open when the time is right, and things are taken care of.";
	now sco-dining-door is true;
	move dining door to Whining War;
	phbt Whining War;
	set the pronoun it to dining door;

a goodrhyme rule (this is the vc-dive-deep rule) :
	if hive heap is not touchable, unavailable;
	ready;

this is the vr-dive-deep rule:
	say "You look through the hive heap. You don't hear buzzing. You keep throwing hives over Cark Cliff or ripping them up until a vapor vial clatters out.";
	moot hive heap;
	bring-here vapor vial;
	set the pronoun it to vapor vial;

a goodrhyme rule (this is the vc-dreaming-dull rule) :
	if screaming skull is not touchable, unavailable;
	ready;

this is the vr-dreaming-dull rule:
	moot screaming skull;
	say "The screaming skull stops screaming and starts alternatively snoring and mumbling about that time it wound up naked at Undead Orientation, or the time the ghost of its secret crush found proof of said crush, or its own groundhog day studying for an exam it still can't pass, dreaming of their job when home from work, or walking in as a skeleton at its own funeral, or how it wrote a brilliant poem but then woke up, or how its final judgment went a bit differently, for better or worse.[paragraph break]The whining outlasts your own empathy and interest, both real and (later) feigned. The skull, upset and exhausted from its harangue, rolls off through the worst wave. Unable to help yourself, you call out 'May you sleep in interesting dreams!'";

a goodrhyme rule (this is the vc-fake-fee rule) :
	if jake is not touchable, unavailable;
	if sco-wake-whee is false:
		vcp "Maybe when Jake is awake.";
		not-yet;
	if sco-take-tea is false:
		vcp "But Jake has given you nothing of value yet.";
		not-yet;
	if sco-fake-fee is true:
		vcal "That's over. Time to work with Jake!";
		already-done;
	ready;

this is the vr-fake-fee rule:
	say "You and Jake have a laugh about how you'd like to pay, and he'd like payment, but that's not really what's important here. Jake is ready to work with you off to the east!";
	now sco-fake-fee is true;
	now Jake G is optional;
	now cht of Jake G is letplus; [->break brie]

a goodrhyme rule (this is the vc-fall-free rule) :
	if player is not in Fun Fen, unavailable;
	if sco-fall-free is true:
		vcal "The tree is already fallen. It's in a good place.";
		already-done;
	ready;

this is the vr-fall-free rule:
	say "The tree, already tipping over a bit, leans and ... falls over, creating safe passage to the north. Also, a hive heap falls from the tree and lands nearby. It seems worth a look.[paragraph break]You get greedy for a second wishing it was a teal tree so you could feel free, too, but you think 'Me, monk,' and plea-plunk 'See sunk tree trunk' so you don't trip over the trunk later.";
	now sco-fall-free is true;
	phbt tall tree;
	move hive heap to Fun Fen;
	set the pronoun it to hive heap;

a goodrhyme rule (this is the vc-feel-fear rule) :
	if player is not in Real Rear, unavailable;
	if sco-kneel-near is false:
		vcp "Fear isn't something you can, or want to, force[seer-sez].";
		not-yet;
	if sco-felt-fear is true:
		vcal "No need to overdo feeling fear.";
		already-done;
	ready;

this is the vr-feel-fear rule:
	say "You let yourself feel fear, both of physical harm and of being unable to figure a way to any secret areas. Admitting to this fear helps a bit, but somehow, you have to put your fear aside.";
	now sco-felt-fear is true;

a goodrhyme rule (this is the vc-find-fault rule) :
	if player is not in Vined Vault, unavailable;
	if mean mass is in Vined Vault:
		if print-why-fail, vcal "You already did, and things got worse. You'll have to try something else.";
		already-done;
	ready;

this is the vr-find-fault rule:
	loop-note "FIND FAULT";
	say "It sure seems, at first glance, like the Vined Vault is inescapable. But you notice a few flaws. A loose tile, a crack in the wall ... you have all sorts of time, and there are no guards. And here you go ... if you do THIS, and THIS ...[wfak]";
	say "[line break]But of course something outside rushes into the fault you found in the vault. A mean mass roars in and mangles the packet of Mind Malt! It pulses threateningly, and while it hasn't attacked you, it now blocks your way out!";
	move mean mass to Vined Vault;
	moot mind malt;
	phbt Vined Vault;
	set the pronoun it to mean mass;

a goodrhyme rule (this is the vc-first-fave rule) :
	if player is not in Curst Cave, unavailable;
	if sco-first-fave is true:
		vcal "The Curst Cave is already a cheerier place.";
		already-done;
	if screaming skull is in Curst Cave:
		vcp "You can't like anything with that screaming skull around!";
		not-yet;
	ready;

this is the vr-first-fave rule:
	say "Suddenly, the worst wave isn't very bad or evil at all. In fact, with a bit of time, it recedes to reveal a tool tap.";
	now sco-first-fave is true;
	move tool tap to Curst Cave;
	moot worst wave;
	set the pronoun it to tool tap;

a goodrhyme rule (this is the vc-fit-found rule) :
	if player is not in Pit Pound, unavailable;
	if sco-fit-found is true:
		vcal "You already fit in.";
		already-done;
	if hit hound is in Pit Pound:
		vcp "Maybe later, but you can't focus on that with the hit hound around.";
		not-yet;
	ready;

this is the vr-fit-found rule:
	say "You feel comfortable here now. Comfortable enough to enter and leave as you please. Woohoo!";
	now sco-fit-found is true;
	phbt Pit Pound;

a goodrhyme rule (this is the vc-flim-flam rule) :
	if player is not in Trim Tram, unavailable;
	if sco-mind-me is false:
		process the trimtramcmd rule;
		vcp "That's a good idea, but you don't have the confidence yet! You need to get your bearings a bit.";
		not-yet;
	ready;

this is the vr-flim-flam rule:
	loop-note "FLIM FLAM/SKIM SCAM";
	say "That does it! The tram moves off to a more open place...";
	process the trimtramcmd rule;
	move the player to Fun Fen;
	phbt Trim Tram;

a goodrhyme rule (this is the vc-full-feast rule) :
	if Bull Beast is not in location of player, unavailable;
	if Bull Beast is not boring:
		vcp "That should work. It might work better if the Bull Beast were incapacitated.";
		not-yet;
	ready;

this is the vr-full-feast rule:
	say "BOOM! You managed to make a full feast of the Bull Beast. But there's a lot of it. It'll be hard to move all at once.";
	moot Bull Beast;
	move full feast to location of player;
	set the pronoun it to full feast;

a goodrhyme rule (this is the vc-get-good rule) :
	if player is not in Wet Wood:
		if print-why-fail, vcal "You already managed to GET GOOD.";
		already-done;
	ready;

this is the vr-get-good rule:
	loop-note "GET GOOD";
	say "You realize you can reason your way out of the Wet Wood. You feel so good about it, even musing 'good guy's wood wise!' But this brings up a question: if you need to work on rhymes, does it matter if they are spelled identically? Will that make things easier or harder in the long run?[paragraph break]So many questions! On leaving the wood, you find yourself blocked by water.";
	move player to Rift River;
	phbt Wet Wood;

a goodrhyme rule (this is the vc-gift-giver rule) :
	if player is not in Rift River, unavailable;
	ready;

this is the vr-gift-giver rule:
	loop-note "GIFT GIVER";
	say "Someone appears from the distance. 'Here! Take this. It will help you with a future puzzle or puzzles.' It's a packet of Mind Malt, whatever that is. And ... it's empty. You open your mouth to protest, but their hand goes up. 'The best sort of magic helps you help yourself.'[paragraph break]You stifle a hmph. 'Oh,' they continue, 'Also some Too-Totes-New Notes. They will tell you what your Leet Learner would've scanned for the puzzles you face at the start. Though you may wish to keep track of things by yourself. If you wish, you can DROP it to solve things the hard way.'[paragraph break]That's a bit better. They walk away. You grumble and putter around, wondering where you should go next. You put your hand on a tree, which has sick sap on it. You walk around, trying to get it off, and you fall into a ... TRICK TRAP.";
	now player has Too Totes New Notes;
	now player has Mind Malt;
	move player to Vined Vault;
	set the pronoun it to Mind Malt;
	set the pronoun them to Too Totes New Notes;
	phbt Rift River;

a goodrhyme rule (this is the vc-glean-glows rule) :
	if player is not in History Hall or mean moe's is not in History Hall, unavailable;
	if player does not have clay cloak:
		vcp "That would work, to find how to clean your clothes, but you don't have any clothes that need cleaning.";
		not-yet;
	ready;

this is the vr-glean-glows rule:
	say "You figure how Mean Moe's Clean Clothes works. You lump the way woke clay cloak in, and after some beeping and coughing, out comes ... a clashing cloak! It's much less bulky than the way woke clay cloak, and it feels more versatile.";
	moot way woke clay cloak;
	now player has clashing cloak;
	moot Mean Moe's Clean Clothes;
	set the pronoun it to clashing cloak;

a goodrhyme rule (this is the vc-glow-glad rule) :
	unless in-so-sad, unavailable;
	ready;

this is the vr-glow-glad rule:
	say "Okay! You're really ready to face things now. Someone comes into view, congratulates you on fighting off your inner demons, and introduces himself as Dean Duggan. 'I have a couple more things I can teach you, but you'll have to ask me specifically.'";
	now sco-glow-glad is true;
	phbt Kerry Kyle;
	move Dean Duggan to Been Buggin;

a goodrhyme rule (this is the vc-go-gappin rule) :
	if player does not have Toe Tappin, unavailable;
	if player is not in Gassed Gap:
		vcp "Hm! [Toe] could be tweaked like that to be useful in the right place[if Gassed Gap is visited], like the Gassed Gap[end if].";
		not-yet;
	if sco-go-gappin is true:
		if debug-state is true, say "Booyah.";
		vcal "The song already worked.";
		already-done;
	ready;

this is the vr-go-gappin rule:
	say "Man! Toe Tappin['] Row Rappin['] is pretty handy for all sorts of things. Now it gives you confidence you can make it through north[if cool cap is not moot] once you figure what to do[else if russell is not moot] once Russell is gone[end if].";
	now sco-go-gappin is true;
	process the check-sing-max rule;

a goodrhyme rule (this is the vc-got-gored rule) :
	if player is not in Airy Isle or Bot Board is moot, unavailable;
	if Lot Lord is in Airy Isle and Hot Horde is in Airy Isle, ready;
	if Lot Lord is off-stage and Hot Horde is off-stage:
		vcp "That sounds right, but it would just be your epitaph right now. With some organized help, though, it could be a potent rallying cry. You save the thought for later.";
		not-yet;
	if Lot Lord is off-stage:
		vcp "The Hot Horde needs more than a battle cry. It needs a leader.";
		not-yet;
	if Hot Horde is off-stage:
		vcp "The Lot Lord nods, but alas, one person using a battle cry against the Bot Board won't work.";
		not-yet;
	say "Uh oh. This is a BUG case. This should not have happened, but you can still win the game."; [oksay]
	ready;

this is the vr-got-gored rule:
	say "YES! That's the cheer the Hot Horde needs, even if there's no gore inside the Bot Board. No need for a ham-handed 'BAM! BANDED!' as they coalesce and organize under the Lot Lord's leadership.[paragraph break]As things calm down, you realize a wry wall points you three ways, and there is now a go gate ahead! You must be close now.";
	moot Hot Horde;
	moot Lot Lord;
	moot Bot Board;
	wall-add Airy Isle;
	move go gate to Airy Isle;
	set the pronoun it to go gate;

a goodrhyme rule (this is the vc-green-grass rule) :
	if mean mass is in Vined Vault, ready;
	unavailable;

this is the vr-green-grass rule:
	loop-note "GREEN GRASS";
	say "The mean mass collapses into much safer green grass. You walk by and arrive at...";
	move player to Po Pit;
	moot mean mass;

a goodrhyme rule (this is the vc-grow-grit rule) :
	if player is not in Po Pit, unavailable;
	if sco-grow-grit is true:
		if print-why-fail, vcal "You already did that. Grit is internalized in you. If you try to be grittier, you may use up the grit you worked so hard to gain.";
		already-done;
	ready;

this is the vr-grow-grit rule:
	loop-note "GROW GRIT";
	say "'So, sit,' you say to yourself. You ponder a bit before saying 'Oh ... it ...'. You realize you have managed to grow grit![paragraph break]The trash trap looks less yucky now. Okay, it still looks pretty yucky, but it's almost bearable. You just have to make sure you don't trip anything horrible. You need a safe way through!";
	now sco-grow-grit is true;
	phbt row writ;
	phbt Po Pit;

a goodrhyme rule (this is the vc-hard-hat rule) :
	if marred mat is not touchable, unavailable;
	ready;

this is the vr-hard-hat rule:
	say "Poof! The marred mat changes into a hard hat. But it's a bit small to wear. Maybe you could combine it with something else.";
	moot marred mat;
	now player has hard hat;
	set the pronoun it to hard hat;

a goodrhyme rule (this is the vc-heal-here rule) :
	if player is not in Real Rear, unavailable;
	if sco-heal-here is true:
		vcal "No need to heal further.";
		already-done;
	if sco-least-loss is false:
		vcp "You don't have anything to heal from, yet[seer-sez].";
		not-yet;
	if sco-kneel-near is false:
		vcp "You have not shown the Ceiling Seer the proper respect, yet.";
		not-yet;
	ready;

this is the vr-heal-here rule:
	say "You call on the Ceiling Seer once more. You worry you may hear 'Gee, Ill! Jeer,' but your faith is rewarded as you feel rejuvenated!";
	now sco-heal-here is true;
	phbt ceiling seer;
	if sco-appealing-appear is false, phbt peeling pier;

a goodrhyme rule (this is the vc-history-hall rule) :
	if player is not in History Hall, unavailable;
	if in-mystery-mall is false:
		vcal "You already [if sco-mystery-mall is true]flipped back to[else]are in[end if] History Hall.";
		already-done;
	ready;

this is the vr-history-hall rule:
	move-to-temp Gutta Ganksta;
	move-to-temp Mean Moe's Clean Clothes;
	now Vending Vibe is mapped west of History Hall;
	now History Hall is mapped east of Vending Vibe;
	move-from-temp Poor Ponder;
	move-to-temp Gutta Ganksta;
	move-to-temp Oi Mo;
	now in-mystery-mall is false;
	if ever-hall is false:
		say "Weird! The way west seems to change from a store to ... something else, still sort of a store, actually. Also, History Hall seems a little fuller. There's a book called [poor ponder].";
		set the pronoun it to Poor Ponder;
	bold-my-room;
	say "[description of History Hall][line break]";
	now ever-hall is true;

a goodrhyme rule (this is the vc-ho-happen rule) :
	if player does not have Toe Tappin, unavailable;
	if sco-ho-happen is true:
		vcal "You already said HO HAPPEN. Now you have to make things happen!";
		already-done;
	ready;

this is the vr-ho-happen rule:
	say "While nothing immediately happens, you feel more motivated to try new stuff--[Toe] may be more versatile than you think!";
	now sco-ho-happen is true;

a goodrhyme rule (this is the vc-hot-horde rule) :
	if player is not in Airy Isle, unavailable;
	if Hot Horde is not off-stage:
		vcal "You already summoned the Hot Horde.";
		already-done;
	ready;

this is the vr-hot-horde rule:
	say "The legendary Hot Horde rumbles in from ... goodness, how'd they get here so fast? Especially since they're such a disorganized bunch!";
	move Hot Horde to Airy Isle;
	check-gored-clue;
	set the pronoun them to Hot Horde;

a goodrhyme rule (this is the vc-kneel-near rule) :
	if player is not in Real Rear, unavailable;
	if sco-kneel-near is true:
		vcal "No need to kneel twice.";
		already-done;
	ready;

this is the vr-kneel-near rule:
	say "You kneel at the pier, facing away from the Steel Steer to avoid any semblance of idolatry that might cause the Ceiling Seer to strike you down. You feel peace and acceptance and potential and ability wash over you. Perhaps you can be more open with your feelings now, and the Ceiling Seer will be more receptive.";
	now sco-kneel-near is true; [?? track difference]
	now cht of Real Rear is leteq; [->feel fear] [-> deal dear] [->heal here]
	now cht of steel steer is letminus; [steel steer->feel fear]

a goodrhyme rule (this is the vc-knives-niche rule) :
	if player is not in dives ditch, unavailable;
	if sco-knives-niche is true:
		vcal "You already changed the dives ditch.";
		already-done;
	ready;

this is the vr-knives-niche rule:
	say "The dives ditch folds up, and now you see a trap on the wall where knives will be released on an unsuspecting interloper.";
	now sco-knives-niche is true;
	process the drop-snare rule;

a goodrhyme rule (this is the vc-lean-luggin rule) :
	if player is not in Been Buggin, unavailable;
	if sco-lean-luggin is true:
		vcal "You already learned lean luggin['].";
		already-done;
	if Dean Duggan is not touchable:
		vcpforce "You're not well-adjusted enough yet to learn anything so emotionally complex. Especially not on your own.";
		not-yet;
	ready;

this is the vr-lean-luggin rule:
	say "You ask Dean Duggan for help with carrying large awkward things.";
	now sco-lean-luggin is true;
	lean-and-mean;

a goodrhyme rule (this is the vc-least-loss rule) :
	if player is not in Creased Cross, unavailable;
	if Bull Beast is off-stage:
		vcp "Not yet. You need to be in a fighting situation.";
		not-yet;
	if sco-least-loss is true:
		vcal "You already minimized your losses. Time to be more aggressive.";
		already-done;
	ready;

this is the vr-least-loss rule:
	now sco-beast-boss is false;
	now sco-least-loss is true;
	say "You spend a lot of time ducking and rolling around and hoping you exhaust the Beast Boss/Bull Beast. It seems to be getting tired and, upset it did less damage than expected, fails to finish the job. You're definitely hurt, but you can survive. As you stumble back to the familiar, safe Fun Fen, the Bull Beast skulks back to the shadows, ostensibly to plan a worse humiliation for later. Perhaps if you came back fully fit, you could demoralize it.";
	phbt Creased Cross;
	bold-new-room Fun Fen;

a goodrhyme rule (this is the vc-lending-libe rule) :
	if player is not in Vending Vibe, unavailable;
	if Trending Tribe is moot:
		vcal "Yes, It's a library now.";
		already-done;
	ready;

this is the vr-lending-libe rule:
	moot Trending Tribe;
	say "The Trending Tribe is appalled by the possibility of people getting something for free. Even worthless books boring people claim to read for fun. They run away screaming. The Vending Vibe goes away, replaced by a Lending Libe. A book even falls out: [fussed folks].";
	now printed name of Vending Vibe is "Lending Libe";
	move Lending Libe to Vending Vibe;
	move fussed folks just jokes to Vending Vibe;
	process the card-and-libe rule;
	set the pronoun it to Fussed Folks;

a goodrhyme rule (this is the vc-lie-lol rule) :
	if player is not in Got Gear Hot Here, unavailable;
	if sco-lie-lol is true:
		vcal "The shy shawl has taken enough abuse.";
		already-done;
	ready;

this is the vr-lie-lol rule:
	say "You snicker a bit at the message on the shy shawl. But not too much! You don't want to become like the Very Vile Fairy File writers you're trying to defeat!";
	now sco-lie-lol is true;

a goodrhyme rule (this is the vc-loft-land rule) :
	if player is not in Soft Sand, unavailable;
	if in-loft-land is true:
		vcal "You're already on the Loft Land.";
		already-done;
	ready;

this is the vr-loft-land rule:
	say "Boom! The Soft Sand rises up and becomes the Loft Land[one of][or] again[stopping]. You can now reach [if Curst Cave is visited]the Curst Cave again[else]that new cave west that you couldn't in the Soft Sand[end if].";
	now zap-core-entry is true;
	if sco-loft-land is false:
		now sco-loft-land is true;
	now in-loft-land is true;
	now Curst Cave is mapped west of Soft Sand;
	now Soft Sand is mapped east of Curst Cave;

a goodrhyme rule (this is the vc-lot-lord rule) :
	if player is not in Airy Isle, unavailable;
	if Lot Lord is not off-stage:
		vcal "You already summoned the Lot Lord.";
		already-done;
	ready;

this is the vr-lot-lord rule:
	move Lot Lord to Airy Isle;
	say "A man whirls in from above and touches down, looking slightly stunned.[paragraph break]'Ah! There it is! The sought sword! Not useful in combat, but it has ancient powers and lineage and stuff. Good for leadership and all that.' The sword glows as he takes it.";
	moot sought sword;
	check-gored-clue;
	set the pronoun him to Lot Lord;

a goodrhyme rule (this is the vc-lots-lame rule) :
	if Gutta Ganksta is not touchable, unavailable;
	ready;

this is the vr-lots-lame rule:
	say "Exposed, the [ganksta] turns red. It just can't face you any more and runs off for a massive mall to perhaps hassle some poor soul named Passive Paul.";
	moot Gutta Ganksta;
	if sco-whatta-wanksta is false, max-down; [can't WHATTA WANKSTA with the Ganksta gone]

a goodrhyme rule (this is the vc-luck-lair rule) :
	if player is not in Blinding Blaze or stuck stair is off-stage, unavailable;
	if stuck stair is moot:
		vcal "You already got the snuck snare from the luck lair.";
		already-done;
	ready;

this is the vr-luck-lair rule:
	say "You try and make your own luck, and you do! The stuck stair flips down. Inside the luck lair there is nothing, except ... well, since you feel lucky, you find the snuck snare without it going off. You'll probably know where to put the snuck snare once you see it. Because, well, you still feel a bit lucky.[paragraph break]Your surroundings dim. You doubt there's much else exciting to do here.";
	moot stuck stair;
	now player has snuck snare;
	set the pronoun it to snuck snare;

a goodrhyme rule (this is the vc-make-map rule) :
	if player is not in Lake Lap, unavailable;
	if sco-make-map is true:
		vcal "You already made a map.";
		already-done;
	ready;

this is the vr-make-map rule:
	say "You make a map. As you do, you hear a hissing noise, as from a dangerous snake.";
	now sco-make-map is true;
	now cht of Lake Lap is letplus; [->snake snap]

a goodrhyme rule (this is the vc-mark-more rule) :
	if player is not in Stark Store, unavailable;
	if dark door is off-stage:
		vcp "That'd work, if there was something to mark. There isn't, yet.";
		not-yet;
	if dark door is moot:
		vcal "You already saw what you could.";
		already-done;
	ready;

this is the vr-mark-more rule:
	say "Yes, there's more to the Stark Store than the dark door. You notice things about it--as well as how to take it off its hinges! And what's more, you also uncover a weird way off to the side.";
	move weird way to Stark Store;
	moot dark door;
	phbt Stark Store;

a goodrhyme rule (this is the vc-mash-map rule) :
	if player is not in Po Pit, unavailable;
	process the ashap rule; [to determine what was the first word]
	if sco-grow-grit is false:
		process the ashap rule;
		vcp "You aren't brave enough yet. Perhaps you can face down the [po pit] so you can be.";
		not-yet;
	ready;

this is the vr-mash-map rule:
	loop-note "MASH MAP";
	say "The heck with this! You just don't trust the trash trap to tell you the way through. You maul what passes for a map on the cache cap--you realize parts of it don't make sense. And you make it past the gash gap... only to tumble into some sort of vehicle that seals shut.";
	process the ashap rule;
	move player to Trim Tram;

a goodrhyme rule (this is the vc-mean-muggin rule) :
	if player is not in Been Buggin, unavailable;
	if sco-mean-muggin is true:
		vcal "You already learned mean muggin['].";
		already-done;
	if Dean Duggan is not touchable:
		vcpforce "You're not well-adjusted enough yet to learn anything so emotionally complex. Especially not on your own.";
		not-yet;
	ready;

this is the vr-mean-muggin rule:
	say "You try some aggressive facial features. Dean Duggan helps you get things right.";
	now sco-mean-muggin is true;
	lean-and-mean;

a goodrhyme rule (this is the vc-meeker-muscle rule) :
	if Reeker Russell is not touchable, unavailable;
	if sco-meeker-muscle is true:
		vcal "Russell's already meeker. Maybe disarm him?";
		already-done;
	ready;

this is the vr-meeker-muscle rule:
	now sco-meeker-muscle is true;
	say "Russell becomes noticeably less muscular.";
	check-russell-go; [nec]
	adjust-russell;

a goodrhyme rule (this is the vc-merry-mile rule) :
	if mrlp is not Vale Verminous, unavailable;
	if sco-merry-mile is true:
		vcal "You already did. And forcing cheeriness tends to backfire.";
		already-done;
	if player is in Airy Isle:
		vcp "[if Bot Board is moot]You're happy, but you can't force it any more. You haven't found the Very Vile Fairy File yet, and when you do, this may be a more appropriate name for wherever it is that is ahead[else]Hard to be happy with the Bot Board around[end if].";
		not-yet;
	if well worn hell horn is not moot:
		vcp "Not with the well worn hell horn making those un-merry noises.";
		not-yet;
	ready;

this is the vr-merry-mile rule:
	say "You're much happier now! You are ready to deal with the Very Vile Fairy File fully, now.";
	now sco-merry-mile is true;
	now cht of Tarry Tile is partminus; [Tarry Tile -> bury bile]

a goodrhyme rule (this is the vc-mind-me rule) :
	if player is not in Trim Tram, unavailable;
	if sco-mind-me is true:
		if print-why-fail, vcal "You already minded yourself.";
		already-done;
	ready;

this is the vr-mind-me rule:
	loop-note "MIND ME";
	say "FIND FEE can't be right. There's nobody here to collect it. You have a bit more confidence in your ability to swindle someone, or something, else now. The FIND FEE plastered everywhere vanishes.";
	now sco-mind-me is true;

a goodrhyme rule (this is the vc-mining-more rule) :
	if player is not in Whining War, unavailable;
	if full feast is not moot:
		vcp "You and the pining poor aren't ready to do any mining yet, not on an empty stomach, but maybe later.";
		not-yet;
	if pining poor are moot:
		vcal "You've gotten all the mined materials you need. Wasting them might cause another whining war.";
		already-done;
	ready;

this is the vr-mining-more rule:
	now sco-mining-more is true;
	moot dining door;
	say "You help the pining poor find a moor to mine more. You uncover great metal riches, and stuff. As a reward, they give you an alloy that smiths the gold guard into ... a HOLD HARD GOLD GUARD! They thank you for giving their lives purpose before drifting away."; [note: the player is assured of having the gold guard because they need it to beat the Beast Boss and make the Feast.]
	moot pining poor;
	set the pronoun it to gold guard;

a goodrhyme rule (this is the vc-mo-mappin rule) :
	if player does not have Toe Tappin Row Rappin and player is not in Blinding Blaze, unavailable;
	if stuck stair is moot:
		vcp "You did all the mapping you needed to.";
		not-yet;
	if player is not in Blinding Blaze:
		vcp "Maybe some other place could use mapping, but not here.";
		not-yet;
	if sco-winding-ways is false:
		vcp "The blaze isn't mappable, but maybe something that replaces it is.";
		not-yet;
	if stuck stair is in Blinding Blaze:
		vcal "You're already in the mood to map. No need to overdo it.";
		already-done;
	if player does not have Toe Tappin Row Rappin:
		vcp "You'd love to, but you need some sort of artistic, peppy way to make the mapping less tedious. Even fun.";
		not-yet;
	ready;

this is the vr-mo-mappin rule:
	say "Having a catchy tune like Toe Tappin Row Rappin in your head certainly helps you with tiring, repetitive activities such as mapping. And once you see the way through the maze, you don't forget it. At the end of the maze, there is a stuck stair. As you approach it, the maze walls collapse, and ... you find yourself very near the entrance. Convenient!";
	move stuck stair to Blinding Blaze;
	now sco-mo-mappin is true;
	moot Minding Maze;
	process the check-sing-max rule;
	set the pronoun it to stuck stair;

a goodrhyme rule (this is the vc-moral-mage rule) :
	if coral cage is not touchable, unavailable;
	if player does not have cage key:
		vcp "That certainly feels right. But the coral cage is too dense to see through or destroy right now. Maybe if you had a key that let you unlock it.";
		not-yet;
	ready;

this is the vr-moral-mage rule:
	say "The inner bars of the coral cage crumble, followed by the cage itself and the key with it. The moral mage thanks you and begins a lecture. You're worried it'll be a sermon, but it fills interesting details about the Very Vile Fairy File, its powers, the Crimes Crew Times Two, how and why they are effective, and how to deflect their worst attacks. You even relate their meanness to people in your past who had baited you, and you feel your resolve increase.[paragraph break]The moral mage nods and departs, leaving you with [here hip], a summary of the lecture. You realize that the knowledge passed on was a sort of magic in its own right, and you'd groan at this sort of revelation if it weren't so helpful.";
	moot coral cage;
	moot cage key;
	phbt Store All Stage;
	now player has Here Hip Queer Quip;
	set the pronoun it to Here Hip Queer Quip;

a goodrhyme rule (this is the vc-mystery-mall rule) :
	if player is not in History Hall, unavailable;
	if in-mystery-mall is true:
		vcal "You've already flipped this area to the Mystery Mall.";
		already-done;
	ready;

this is the vr-mystery-mall rule:
	move-from-temp Gutta Ganksta;
	if Toe Tappin is not moot:
		move-from-temp Toe Tappin;
	else if Oi Mo is not moot:
		move-from-temp Oi Mo;
	move-from-temp Mean Moe's Clean Clothes;
	now Got Gear Hot Here is mapped west of History Hall;
	now in-mystery-mall is true;
	if sco-mystery-mall is false:
		say "A way opens up to the west as History Hall shudders into Mystery Mall! You suspect it would be easy to flip between the two in the future, as necessary.[paragraph break]Mystery Mall is certainly livelier. A Gutta Ganksta 'chills' here, Mean Moe's Clean Clothes is a small kiosk, and there's mall music to LISTEN to, as well.";
	else:
		bold-my-room;
		say "[description of History Hall][line break]";
	now sco-mystery-mall is true;
	now zap-core-entry is true;
	now ever-hall is true;

a goodrhyme rule (this is the vc-near-null rule) :
	if Beer Bull is not touchable, unavailable;
	if sco-near-null is true:
		vcal "You already reduced the bull's power!";
		already-done;
	ready;

this is the vr-near-null rule:
	now zap-core-entry is true;
	say "The Beer Bull writhes and roars. It's still plenty powerful, but it's not supercharged.";
	now sco-near-null is true;

a goodrhyme rule (this is the vc-no-nappin rule) :
	if toe tappin row rappin is not touchable, unavailable;
	if sco-no-nappin is true:
		vcal "You already changed Toe Tappin Row Rappin that way.";
		already-done;
	ready;

this is the vr-no-nappin rule:
	say "Sometimes you don't need a perfectly sensible way to keep alert. No Nappin does that for you. It will do that for you.";
	say "[line break][if boat-reject is true and Lake Lap is unvisited]Hey! I bet you could see about the boring boat, now[else]Whatever you need to make more interesting, your riff on Toe Tappin will see you through. You won't forget it[end if].";
	now sco-no-nappin is true;
	process the check-sing-max rule;

a goodrhyme rule (this is the vc-not-near rule) :
	if player is not in Got Gear Hot Here, unavailable;
	if sco-not-near is true:
		vcal "You already teleported for a bonus point.";
		already-done;
	ready;

this is the vr-not-near rule:
	say "You feel pulled from the ground, and you zoom through the walls without feeling anything. After the Too Top Shoe Shop flew ... flop. You black out and wake up at a TROUNCE TRACK.[paragraph break]There you are set upon by what must be a Pounce Pack. You only have a few seconds to react, but with what you've done so far, you know to yell or think BOUNCE BACK. And you do.[paragraph break]Whew! You weren't cut out for the violent stuff. This adventure's enough.";
	now sco-not-near is true;

a goodrhyme rule (this is the vc-paper-pile rule) :
	if vapor vial is not touchable, unavailable;
	ready;

this is the vr-paper-pile rule:
	say "The vile vapor in the vapor vial swirls around, and the paper cracks. The vapor spreads over the ground and changes into a whole paper pile.";
	moot vapor vial;
	bring-here paper pile;
	set the pronoun it to paper pile;

a goodrhyme rule (this is the vc-plain-pleasant rule) :
	if Pain Peasant is not touchable, unavailable;
	ready;

this is the vr-plain-pleasant rule:
	say "How about that? A few nice words, and the Pain Peasant forgets what the matter was. Apparently, with the Very Vile Fairy File's influence, that happens a lot. People lash out at whomever, just because. A lesson learned!";
	moot Pain Peasant;

a goodrhyme rule (this is the vc-pull-pieced rule) :
	if full feast is not in Creased Cross and Bull Beast is not in Creased Cross, unavailable;
	if Bull Beast is in Creased Cross:
		vcp "[if sco-cull-ceased is true]The Bull Beast could be pulled, but in its current form, it wouldn't be useful[else]You'd have to defeat the Bull Beast first[end if].";
		not-yet;
	if sco-shining-shore is false:
		vcp "You're not sure where you could pull the full feast to, yet.";
		not-yet;
	if sco-dining-door is false:
		vcp "The folks at the Shining Shore aren't quite ready for a feast, yet. Perhaps the Shining Shore needs a bit of adjustment.";
		not-yet;
	ready;

this is the vr-pull-pieced rule:
	say "With the help of the pining poor, you pull the full feast that was the Bull Beast to the Shining Shore. There, the dining door swings open. 'DEED, DUDE: FEED FOOD!' You enter and have a very good feast. As it finishes, everyone chants in unison, 'Some say yum, yay!' The door dissolves.[paragraph break]The pining poor look ready for work, now they've been properly fed.";
	moot full feast;
	moot mild mead;
	if wild weed is off-stage, max-down;
	moot dining door;
	if player is not in Whining War, bold-new-room Whining War;

a goodrhyme rule (this is the vc-really-rolling rule) :
	if sco-really-rolling is false, ready;
	vcal "You already guessed the significance of my pen name.";
	already-done;

this is the vr-really-rolling rule:
	say "Have a small bonus for figuring the significance of my pen name. Also, enjoy this trivia: looking back, I wish I'd been Parsin['] Pro Carson Crowe, instead. Eh, well!";
	now sco-really-rolling is true;

a goodrhyme rule (this is the vc-see-sign rule) :
	if player does not have We Whine, unavailable;
	if sco-see-sign is true:
		vcal "You've seen enough signs. Overkill might leave you demoralized or too analytical to just cut loose and adventure.";
		already-done;
	ready;

this is the vr-see-sign rule:
	say "A closer reading of [We Whine] reveals that you don't need to be a jerk to learn from it. Whether that was the authors['] intent is unclear, but you realize you can learn about the games jerks play and how to expect and deflect them even before they become obvious jerks. It seems like grappling with this sort of thing without fighting it would be useful for dealing with the Very Vile Fairy File, and you now feel more worthy and prepared to do so.";
	now sco-see-sign is true;

a goodrhyme rule (this is the vc-shining-shore rule) :
	if player is not in Whining War, unavailable; [?? big problem with what replaces Violent Vale]
	if sco-shining-shore is true:
		vcal "You already got (t)here.";
		already-done;
	if sco-so-sappin is false:
		vcp "It could be that way. But you need to get rid of the whining first.";
		not-yet;
	ready;

this is the vr-shining-shore rule:
	say "The Whining War dissipates, leaving a Shining Shore! It's not total paradise or anything, but it's much brighter here. You feel there may be something else to find here. The combatants turn into ... the pining poor.";
	now cht of Whining War is letminus; [Shining Shore -> dining door] [Shining Shore -> mining more]
	now sco-shining-shore is true;
	move pining poor to Whining War;
	set the pronoun them to Poor Ponder;

a goodrhyme rule (this is the vc-show-shield rule) :
	if player is not in Foe Field, unavailable;
	if gold guard is off-stage:
		vcp "That seems right, but you have nothing that would guard you effectively. Maybe later.";
		not-yet;
	if sco-mining-more is false:
		vcp "Ooh! The gold guard lasts a bit, but not quite long enough. It needs reinforcements[if gull-guard is true] even beyond what the gull guard gave[end if].";
		not-yet;
	if gold guard is moot:
		vcal "Your gold guard has done its duty.";
		already-done;
	ready;

this is the vr-show-shield rule:
	say "You flash your gold guard, and bam, the voice that says YO YIELD quiets down, and the YO YIELD vanishes. But not before the usual energy ray shows up and blasts your gold guard to pieces. Eh, it did its job. You can go north now.";
	now sco-show-shield is true;
	moot gold guard;
	phbt Foe Field So Sealed;

a goodrhyme rule (this is the vc-silent-sail rule) :
	if player is not in Violent Vale, unavailable;
	if flooring float is not off-stage:
		vcal "You already called up the flooring float[if boring boat is not off-stage] and boring boat[end if].";
		already-done;
	ready;

this is the vr-silent-sail rule:
	say "Suddenly from the watery depths, a flooring float bursts forth! It looks -- impractical for going anywhere, but man, is it aesthetic.";
	move flooring float to Violent Vale;
	now sco-silent-sail is true;
	phbt Violent Vale;
	set the pronoun it to flooring float;

a goodrhyme rule (this is the vc-sit-sound rule) :
	if player is not in Pit Pound, unavailable;
	if hit hound is not touchable:
		vcal "You already sat sound[if sco-fit-found is false]. But maybe there's a way to feel more comfortable[end if].";
		already-done;
	ready;

this is the vr-sit-sound rule:
	say "The hit hound can smell fear, but it can also smell a lack of fear. You manage to sit sound, and the hit hound gives up and goes away.";
	moot hit hound;

a goodrhyme rule (this is the vc-smashing-smoke rule) :
	if player does not have clashing cloak, unavailable;
	if Beer Bull is in location of player:
		vcp "That's not enough to distract the Beer Bull for good. The Beer Bull can smell you.";
		not-yet;
	if player is not in Y'Old Yard:
		vcp "Hmm, maybe that'd make a useful disturbance elsewhere, with someone to distract, but not here.";
		not-yet;
	ready;

this is the vr-smashing-smoke rule:
	say "The Bold Bard tosses you a cold card quickly as thanks before making his way into the Shoaled Shard in the confusion! You hear shouting in there. The Bard has -- certainly made an impression. You hope it is a good one. Your clashing cloak went up in the smoke, but eh, it was sort of tacky anyway. As the smoke lifts, you notice a mold-marred gold guard. It could be useful, repaired. You take it.";
	moot Bold Bard;
	moot clashing cloak;
	now player has cold card;
	now player has gold guard;
	set the pronoun it to gold guard;

a goodrhyme rule (this is the vc-snake-snap rule) :
	if player is not in Lake Lap, unavailable;
	if sco-co-capn is false:
		vcp "You don't know if you can take that snake by itself. Jake doesn't quite seem willing, yet, either.";
		not-yet;
	if sco-make-map is false:
		vcp "There might be a snake here. But you'd have to find it, first.";
		not-yet;
	ready;

this is the vr-snake-snap rule:
	say "And that does it! You and Jake, with the help of the map, subdue the snake. One of you baits it, the other kills it. A take-tap pours out items on a small island. You find a cake cap, a flake flap and some rake wrap. You take the cap, and Jake takes the flap and wrap. It's a nice haul. You take your boring boat back to Violent Vale. It seems sturdy enough for another journey, if you want to go.";
	if sco-break-brie is false, max-down; [can't BREAK BRIE any more]
	now player has cake cap;
	now sco-snake-snap is true;
	move boring boat to Violent Vale;
	bold-new-room Violent Vale;
	phbt Lake Lap;
	set the pronoun it to cake cap;

a goodrhyme rule (this is the vc-so-sappin rule) : [?? we need to make sure this works okay]
	if player does not have Toe Tappin Row Rappin, unavailable;
	if sco-so-sappin is true:
		vcal "You already discouraged some whining. Bringing it up again might make you the whiny one.";
		already-done;
	if beer bull is touchable:
		vcp "That might work on people who understand songs and poetry. The Beer Bull does not. You need a stronger way to kill it off.";
		not-yet;
	if player is not in Whining War:
		vcp "That's an interesting riff, but it doesn't seem to work here.";
		not-yet;
	ready;

this is the vr-so-sappin rule:
	say "Amazingly, as you filk [Toe], the whining grows less. People realize they're not being productive at all. It becomes much quieter here. Your passive-aggressiveness has trumped others[']! Hooray!";
	now sco-so-sappin is true;
	process the check-sing-max rule;

a goodrhyme rule (this is the vc-soft-sand rule) :
	if player is not in Soft Sand or sco-loft-land is false, unavailable;
	if in-loft-land is false:
		vcal "You're already on the Soft Sand.";
		already-done;
	ready;

this is the vr-soft-sand rule:
	say "The Loft Land reverts to the Soft Sand, revealing the old passage west[if Shirk Shell is visited] to the Shirk Shell[end if].";
	now in-loft-land is false;
	now Shirk Shell is mapped west of Soft Sand;

a goodrhyme rule (this is the vc-spark-spliff rule) :
	if wild weed is moot:
		vcal "Whoah, dude! Jonesing for more already?";
		already-done;
	if player does not have wild weed and player is not in Fun Fen, unavailable;
	if player is not in Fun Fen:
		vcp "Not here, dude! No source of flame!";
		not-yet;
	if player does not have wild weed:
		vcp "You have nothing to spark up, dude!";
		not-yet;
	ready;

this is the vr-spark-spliff rule:
	say "Whoah, dude! You totally discover not only some discarded rolling papers but also two pieces of flint ideal for creating a flame to light it. It only takes 15 minutes, and it is totally worth it, even without a bong bunch and long lunch. Fun Fen really is fun for the next few hours!";
	moot wild weed;

a goodrhyme rule (this is the vc-stay-strong rule) :
	unless in-way-wrong, unavailable;
	ready;

this is the vr-stay-strong rule:
	say "That's ... well, it helps a little! You've overcome a bit, but you still feel so sad ... so sad.";
	now sco-stay-strong is true;
	now cht of the player is letplus; [so sad->glow glad]

a goodrhyme rule (this is the vc-strong-start rule) :
	if player is not in Fun Fen, unavailable;
	if sco-start-strong is true:
		vcal "You already did. You wouldn't want a stale start or a pale part. Why, you might get sent to Male Mart. Or run over by a kale cart.";
		already-done;
	ready;

this is the vr-strong-start rule:
	now sco-start-strong is true;
	say "Boom! Yes, you mangle and destroy the wrong art, both physically and mentally. Dunking on messed-up stuff too much may distract you from your goals, but in this case, you gain confidence you know what you are doing, and the exercise is nice, too. That is a way to get a strong start[if score > 11 and Creased Cross is visited], even if you aren't really starting any more[else if score > 30], because it's always good to start anew, or try to, to get a perspective on things[end if]. You throw the wrong art over Cark Cliff, now that you feel confident fully dismissing it.";
	moot wrong art;

a goodrhyme rule (this is the vc-take-tea rule) :
	if jake is not touchable, unavailable;
	if sco-wake-whee is false:
		vcp "Maybe when Jake is awake.";
		not-yet;
	if sco-take-tea is true:
		vcal "Don't get greedy. You have the sustenance needed to work with Jake G.";
		already-done;
	ready;

this is the vr-take-tea rule:
	say "You and Jake have a brief snack. It helps bring you together. But he looks awkwardly at you. He guesses he should expect payment, but he doesn't really want it.";
	now sco-take-tea is true;

a goodrhyme rule (this is the vc-tell-torn rule) :
	if well worn hell horn is not touchable, unavailable;
	ready;

this is the vr-tell-torn rule:
	say "The well worn hell horn rips apart and unwinds. Fortunately, as it does so, there is no bell born. It's more peaceful around, now. You can focus better and come to grips with your inner self, and all that sort of thing.";
	moot well worn hell horn;

a goodrhyme rule (this is the vc-tight-tunnel rule) :
	if player is not in fight funnel, unavailable;
	if sco-tight-tunnel is true:
		vcal "You already narrowed the funnel to a tunnel.";
		already-done;
	ready;

this is the vr-tight-tunnel rule:
	say "The fighting quiets down and moves off to the north. You can now go west!";
	now sco-tight-tunnel is true;
	phbt Fight Funnel;

a goodrhyme rule (this is the vc-wake-whee rule) :
	if Jake G is not touchable, unavailable;
	if sco-wake-whee is true:
		vcal "He's already awake, Blake.";
		already-done;
	ready;

this is the vr-wake-whee rule:
	say "Jake G. wakes up. 'Man! I'm hungry! You hungry too?'";
	now sco-wake-whee is true;
	set the pronoun him to Jake G;

a goodrhyme rule (this is the vc-whatta-wanksta rule) :
	if Gutta Ganksta is not touchable, unavailable;
	if sco-whatta-wanksta is true:
		vcal "That insult only works once.";
		already-done;
	ready;

this is the vr-whatta-wanksta rule:
	say "The Gutta Ganksta suddenly feels dissed. Not enough to move out of the way, because the Gutta Ganksta feels clever for knowing a word like 'wanksta' and affirming that it is a bit derivative of 'ganksta.'";
	now sco-whatta-wanksta is true;

a goodrhyme rule (this is the vc-whoa-wait rule) :
	unless player is in Airy Isle and go gate is in Airy Isle, unavailable;
	ready;

this is the vr-whoa-wait rule:
	say "You decide not to run in right away. The grow grate inside the go grate crumbles. You take another peek to make sure there's nothing else. There isn't. You walk through.[wfak]";
	move player to Tarry Tile;
	set the pronoun it to well worn hell horn;

a goodrhyme rule (this is the vc-wild-weed rule) :
	if mild mead is not touchable, unavailable;
	if wild weed is not off-stage:
		vcal "Greedy, to try for more.";
		already-done;
	ready;

this is the vr-wild-weed rule:
	say "Bingo! Some of the mild mead tumbles off to the ground and becomes wild weed. Which is totally unnecessary for the game, but hey.";
	now player has wild weed;

a goodrhyme rule (this is the vc-winding-ways rule) :
	if player is not in Blinding Blaze, unavailable;
	if sco-winding-ways is true:
		vcal "You already made it out of the Blinding Blaze.";
		already-done;
	ready;

this is the vr-winding-ways rule:
	say "The blaze swirls but dies down. In its place are Winding Ways leading to a huge Minding Maze that will surely bust your brain and require a finding phase. And hey, that wry wall pops up too!";
	now sco-winding-ways is true;
	move Minding Maze to Blinding Blaze;
	phbt Blinding Blaze;
	wall-add Blinding Blaze;
	set the pronoun it to Minding Maze;

a goodrhyme rule (this is the vc-wood-one rule) :
	if Reeker Russell is not touchable, unavailable;
	if good gun is moot:
		vcal "Russell's already disarmed, but he's still too strong.";
		already-done;
	ready;

this is the vr-wood-one rule:
	say "The good gun turns into a wood one in Reeker Russell's hands! He throws it away in disgust.";
	moot good gun;
	check-russell-go; [nec]

a goodrhyme rule (this is the vc-work-well rule) :
	if jerk gel is not touchable, unavailable;
	if player has jerk gel:
		vcal "Any further futzing might undo your previous good work.";
		already-done;
	ready;

this is the vr-work-well rule:
	say "You work to put all the jerk gel back in. You don't get it all in, but there's enough to use later.";
	now the player has the jerk gel;
	now cht of Shirk Shell is phbt;
	now cht of jerk gel is leteq; [supple saps->couple caps]

a goodrhyme rule (this is the vc-youre-yonder rule) :
	if poor ponder is not touchable, unavailable;
	ready;

this is the vr-youre-yonder rule:
	say "You begin to make sense of [poor ponder]. Of course it should not be too obviously easy to enjoy, or the Crimes Crew Times Two would have suppressed it. Reading between the lines, you can see how they would give up on it without sorting out its nuances. And as you figure that out, you see clues to a passage going OUT. One you'd otherwise have missed. Leo Strauss would approve![paragraph break]The book itself, however, bursts into flames like any proper secret communication now you've discovered the secret passage.";
	moot poor ponder;
	now Y'Old Yard is mapped outside History Hall;
	now History Hall is mapped inside Y'Old Yard;

[zzvcvr]

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
Lake Lap	down	true	false	"Lake Light"	"Oh hey! Another lake to visit! What's the worst that could happen? A fake fight? Things do seem to break bright at first. Until you hear a voice: 'WAKE, WIGHT!' You try to run, but it-s a ... flake flight. You wind up in Bake Bight."
Lake Lap	south	true	false	"Rad Route"	"Oh, it starts off okay. The lad lout is no problem. You walk cheerily by Stade Stout and Pad Pout, giving yourself a tad tout. But at the end, you run into people with clad clout, and it's a bad bout."
Lake Lap	north	true	false	"See Some... Gee, Gum"	"Maybe there's not just gum but you can say 'Me! Mum...' However, your thoughts are more 'Glee...GLUM' after you are ambushed by some ski scum."
Lake Lea	south	true	false	"Blest Bloom"	"Zest! Zoom! It smells nice at first as you walk along. But soon, it starts smelling like a rest room and then a smell of death. You hear a voice (and oh, what a best boom it is) intone 'DEST.: DOOM!' You realize you have wound up in ... a TEST TOMB."
Lake Lea	west	true	false	"Bore Bay"	"Since you took the boring boat to get here, it's only logical that you need to explore Bore Bay. Perhaps it leads to the important and secret Core Cay or Lore Lay. You just need to watch out for War Way or a passing drawer dray, presumably, but that'll be easy to see in advance. As you discover a handy can of Spore-Spay, you realize how long you've been walking. Soon, you see Four fay hovering over a Store Stay (the 'Shore Chez') and inviting you to relax a while. So you do.[paragraph break]After a night in the Store Stay, you try to leave. But a sore-say voice booms 'POOR?! PAY!' You can't. 'NOR? ... NAY!' To avoid a floor-flay, you run out back ... to not just War Way, but (Gore-Gay) More May War Way. You lose consciousness before finding who wins or, for that matter, what the sides are and what they're fighting over. Your last thought is, someone named Jorge probably thumped you."
Lake Lea	north	true	false	"Mo Main Low Lane"	"You walk along, feeling sure you will go gain so sane. But you are utterly surprised to find someone offering you ... cocaine. You just say no, but it is not heroic enough. When you aren't looking, you are enveloped by the horrid Bro Brain."
Lake Lea	up	true	false	"Top Tower"	"Anyone with ambition should want to visit the Top Tower! And along the way, there's no glop (glower,) but there's a run through the Shop Shower reminds you of running through sprinklers as a kid, and you stop to sniff a lovely flop-flower. You've even prepared to run 'Cop, COWER' at a rogue policeman, but you never get the chance. Unfortunately, the top tower isn't a very welcoming place. Everyone's trying to prove they're not a sop. Sour. 'Pop! Power!' they yell as they fight. You are pulled into the Op-Hour competition and meet your doom in your first contest, at the bop-bower. The last you hear is 'Plop! Plow [']er!' before you are fed to ... the chop-chower."
Whining War	east	true	false	"Done Dune"	"Despite a clearly-marked run rune, it doesn't seem like a place you should shun soon ... until you run into a GUN GOON."
Whining War	down	true	false	"Fast Foi'd"	"Apparently, you do not get to fast-forward. Well, you sort of do, but not to a good end. The last thing you see as you realize you can't breathe is a ... vast void. To you, it is classed cloyed."
Y'Old Yard	west	true	false	"Faun Fen"	"Boy, the faun fen seems relaxing! You waltz easily past the pawn pen, an obvious trap. But soon you suffer horrible, and ultimately fatal, tauntin['] and conkin[']. Set to gongin[']. All a bit off-key, but effective."
Y'Old Yard	south	true	false	"Lit Lawn"	"Boy! The lit lawn seems nice and bright! A fit faun is frolicking alone! You ignore the voice yelling 'get gone' and are unaware of a pit pawn and spit-spawn that grab you from behind, making you sit, sawn. You curse them with your last though, wondering if one was named Sean."

volume rank stuff

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

range-bottom is a number that varies. range-bottom is 0.
range-top is a number that varies. range-top is 0.

to seed-narratives:
	let any-blank-yet be false;
	let my-row be 0;
	let total-blank-rows be 0;
	repeat through table of narratives:
		if there is no rank-num entry, increment total-blank-rows;
		if any-blank-yet is false:
			if there is a rank-num entry:
				now range-bottom is rank-num entry + 1;
			else:
				now any-blank-yet is true;
		else if there is a rank-num entry and range-top is 0:
			now range-top is rank-num entry - 1;
			if range-top < 0, increase range-top by core-max;
	let current-blank-rows be 0;
	if debug-state is true, say "DEBUG: range = [range-bottom] to [range-top].";
	repeat through table of narratives:
		if there is a rank-num entry:
			if rank-num entry < 0, increase rank-num entry by core-max;
			next;
		increment current-blank-rows;
		now rank-num entry is (((range-top - range-bottom) * current-blank-rows) / total-blank-rows) + range-bottom;
		if debug-state is true, say "DEBUG: new narrative when you score [range-top - range-bottom] * [current-blank-rows] / [total-blank-rows] + [range-bottom] = [rank-num entry] points.";

narr-on is a truth state that varies. narr-on is true.

to say narr-toggle: say "ou can turn off post-point-scoring narratives with [b]NO NARR[r] or turn them back on with [b]WHOA(H) WHERE[r]"

table of narratives [xxton]
rank-num	done-yet	rank-txt
1	false	"A vision! Some tough-looking people sit sneering around an empty book. They are quickly revealed as the Plight Plotter, the Spite Spotter, the Fright Frotteur, and the Right Rotter. They are seeking to formalize the knowledge they have gained from picking on, well, fight fodder. Such as the Trite Trotter and the Night Nodder. You watch them each write parts of a book at ultra-speed before they walk out to by some white water and call out 'Bright! Broader!'[paragraph break]The book's cover slowly becomes colored in. It is the [very vile]."
2	false	"The plotters from your previous vision remark how it is not just a guide to manipulation, but something that can affect people from afar. Its one weakness: if someone gets too close and is legitimately happy and forgiving around it, its spell will break.[paragraph break]They leave it by the Real Rot/Feel Fought Spiel Spot, because they have other evil to delegate, elsewhere. Small relief--facing them would've been too much[if ever-toggle-narr is false and the story has not ended finally].[paragraph break]NOTE: y[narr-toggle][end if]."
3	false	"Another vision![wfak][paragraph break]A bunch of seedy looking hoodlums approach the shrine where the [very vile] was left. You know they must be the Crimes Crew Times Two Kit Cohen told you about. While the general consensus is 'What an unusually stupid looking book,' they nonetheless play rock-paper-scissors to decide the poor sap who has to read it."
4	false	"The loser of the rock paper scissors game's eyes open wide as they realize the [very vile] doesn't just have lame poetry. It has advice on important things like pushing people around and getting in their head! In the end, there's a fight over the book, but nobody manages to tear it apart. There's more fast-forwarding, and once everyone is done re-reading it, they leave it somewhere distant. Maybe for the next person, or their underlings, to read.[paragraph break]You can already feel the [very vile] working on you, reminding you of things you'd rather forget. These brief flashes may pop up for the remainder of your adventure."
5	false	"You recall harsh words from an alleged friend, Chum Chilly Bum Billy: 'Some silly? Dumb, dilly.'"
6	false	"You remember a depressing holiday season. 'Blear, Blue? Near New Year, You! We're ... WOO!' But you're having more fun now. You hope."
7	false	"A voice says 'Sigh. Say hi, hey?' But you ignore it. Ply, play, you think. Gotta focus."
8	false	"You see the Crimes Crew Times Two snickering. They're looking at a vision of ... you, stumbling through the Wet Wood. 'Done?! Do?! Ton to one, woo!' they laugh. 'Fun, phew!' And yet ... they walk away from the [fairy file], as if they can't get too close to it."
--	false	"'Seek so-chic-show? Geek, go! Meek, mo['] weak, woe!' A bleak blow! Looking back at the insulter, it's not even a person but ... a saucy Creek Crow. You involuntarily touch your head, hoping you have not grown a Freak [']Fro."
--	false	"'Surly? Soften early, often!' a random voice booms. Probably some burly boffin. The [fairy file]'s bait is smart."
--	false	"'Fame fast? Lame, last!' a voice calls. You ... you were just looking for a way out. You think. But nobody thinks they're too proud. Right?"
--	false	"You remember saying 'War, why?' with the response: 'BORE, BYE!'"
--	false	"You are quasi-catcalled as 'Some super-dumb duper.' You immediately wonder if you're too dumb to remember HOW you tried to dupe anyone, but after a moment's thought, you brush the insult off with 'Um, oop, err...'"
--	false	"You picture yourself in a sales job. 'Cold call? Fold, fall.' You fail and are exiled to the Hold Hall."
--	false	"A memory from the past, well, sort of: 'Falling for calling? Cor! Bawling bore!' It must be the [very vile] doing its work on you.[paragraph break]You find yourself worried this silly adventure may be boringly linear--or, equally, that it may branch out into something too complex to solve. Perhaps the [very vile] is warping your memories to make them traumatic?"
--	false	"'Blue blood? Boo, bud!' Standard demoralizing fare. You feel a slight flu-flood."
--	false	"A disembodied voice that can only be from the [very vile] booms: 'High hope nigh? Nope!' You sigh, but no soap turns up. All this discouragement and despair can add up, even if it isn't sensible."
--	false	"That disembodied voice again: 'Raking rhyme?! Making mime!' You feel discouraged, knowing if you slow up, a voice will boom 'Taking times?'[paragraph break]The [very vile]'s reach is wide indeed. If it can mix up these taunts on you, what can it do to others?"
--	false	"Despite your success, a memory: 'Rad? Wrong! Gad! Gong! Bad! BBOONNGG!' You remember all the times you felt guilty getting things right for the wrong reason, as well as the times you were mocked for knowing things too well."
--	false	"Blare blame! Share shame!"
--	false	"'Wet willy set? Silly! Bet, Billy!' A reminder of tormentors from your past."
--	false	"'Sing-song ding-dong!' a voice calls out, as if the double-rhyme puzzles you solved were your fault. It does slightly ... ring wrong. But at least you are not trampled by King Kong or beaten badly at Ping Pong." [?? if postmortem 4, expound on this. It was an original double rhyme before VVFF.]
--	false	"You almost started feeling good about things, but a voice whispers 'Smart smack. Heart? Hack!' Oh, [very vile], you so manipulative!"
--	false	"Sick, Sought Thick Thought."
--	false	"'Wonder-weary? Blunder-bleary!' you think to yourself. No. Keep positive. Things must be ending soon."
--	false	"'So seedy! Grow greedy! No, needy!' a voice calls. And it's sort of true. The more you've done, the more you want and need to see what's next, and you'd hate to give up. On the other hand, greedy people never admit they've gotten greedy... no, no, stop it! That can't be right!"
--	false	"'Hi, hi! Why, why? My, my! Sigh, sigh!' There was a time when you thought you didn't even deserve complex insults. But here--surely the [very vile] is running out of steam? There's only one way to find out. Keep going!"
-7	false	"Something in you snaps. You've made it this far. The [fairy file] must be close, but you hear yourself blurting 'Mock me, Jock? gee!'"
-6	false	"'How hot NOW?! Not!' booms the voice. Yet, you sense desperation. It's relied more and more on telling you you aren't as great as you think, instead of that you're just awful. That's ... progress, huge progress."
-5	false	"You hear a voice boom, 'Blast[']er blind, master mind!' The [fairy file]'s power must be cracking. And you must be very close."
-4	false	"An exceptionally loud howl from the [very vile fairy file]: 'Quit, quick! Sit sick!' You must be close."
-3	false	"Another howl from the [fairy file]: 'Gonna go off! Shun a show-off!'"
-1	false	"'More make war! Wake!' booms a voice from the [very vile]. It's still scary and all, but ... nobody shows up."

volume random tables

table of books [xxbooks]
randtxt
"Ache or Make More Lake Lore"
"Bane, Bones, Stain Stones[r], by Jane Jones"
"Bank Books, Crank Crooks[r], by Hank Hooks"
"Barge, Banned Large Land"
"Been Back: Men Mack When Wack, by Ren Rack and Len Lack"
"Born, Battered, Torn, Tattered, Shorn, Shattered"
"Briny Brims Tiny Tim's Whiny Whims"
"Bumpkin, Buy Pumpkin Pie"
"Car Curst Far First[r], by Gar Gerst"
"Crew Came Grew Game"
"Cropping Crews['] Shopping Shoes"
"Dandy Dyin['] Sandy, Sighin[r], by Randy Ryan"
"Dare, Dream, Stare, Stream[r], by Bear Bream"
"Do Dance, Poo Pants[r], by Lou Lance and Stu Stantz"
"Do, Dare: Woo! Where"
"Duel Down, Cruel Crown"
"Dust Devils['] Lust Levels"
"Fall For Stall Store"
"Fat Farms['] Chat Charms: at Arms"
"Find Fame, Mind, Maim"
"Fly Phat Spy Spat"
"Gain Goals, Sane Souls"
"Good Girl Would Whirl"
"Good Guys Would: Wise"
"Gray Grill, Stay Still[r], by Jay-Jill Hayhill"
"Greater Gravel Traitor Travel"
"Grepping: Groan? STEPPING STONE"
"Grin, Gritty Sin City[r], by Lyn Litty"
"Hale Hen, Mailmen"
"Heave, Hogs, Leave Logs[r], by Maeve Moggs"
"Him, Her, Dim, Durr[r], by Kim Kerr"
"Hole Hound Bowl Bound"
"How High? Wow, Why"
"Jail Jen, Bail Ben"
"Lay [']Lone, May Mone[r], by Ray Rhone"
"Lay Lorn, Way Worn May Morn[r], by Kay Korn" [pay porn?]
"Meet Me Leetly"
"Meet Meg, Pete, Peg"
"Men, Messed, Been Best, by Ren Rest"
"Mind, Mull: Find Full"
"Must Mean Just Gene"
"My Man? Fie, Fan"
"My Mod Guy God"
"Nag? No: Brag, Bro"
"Nail [']Nuff: Bail, Buff"
"Near Null Fearful"
"Nosy Nan, Dozy Dan[r], by Rosie Rann"
"[']Nuff Nerd Stuff Stirred"
"Numb Nude Dumb Dude"
"Oh, Trait So Straight"
"Oh, Uh, Lola[r], by Nona Sosa-Doda"
"One Wet Sunset"
"One Wise Son Sighs: RUN, RISE"
"Page Punk Stage Stunk, Mage Monk"
"Pan, Pot, Plan, Plot[r], by Stan Stott"
"Quick Quest: Pick Pest[r], by Rick Rest"
"Rude Right Food Fight/Nude Night"
"Sane Sorts['] Pain Ports[r], by Wayne Wortz and Cain Kortz"
"See Sauce, Be Boss[r], by Dee Doss"
"Self Centered Elf Entered"
"Silly Signs[r], by Willy Wines and Tillie Tines"
"Skull Skit Pulpit"
"So Seek Crow Creek"
"Stark Steeds['] Dark Deeds[r], by Mark Meeds"
"Still Stay? Will, Way[r], by Jill Jay"
"Take Tess, Wake Wes, Make Mess"
"Tale: Tough Stale Stuff[r], by Dale Duff"
"Talk, Tell, Walk Well"
"Wail When, Pale Pen"
"Warm Wit: Form, Fit[r], by Storm Stitt"
"Wayne, One Sane Son[r], by Dane Dunn"
"Wearing Work: Caring Kirk, Daring Dirk"
"Why When My Men, by Ben"
"Yo, Yet Go Get Mo['] Met[r], by Joe Jett"
"Your Be-Yays: Derby Days[r], by Herbie Hayes"

table of mall shops [xxshops]
randtxt
"Bold Bud's Doled Duds"
"Cold Crude Bold Brewed"
"Musty Mike's Trusty Trikes"
"There-They-Wear Way"
"Trench Tries French Fries"

table of mall songs [xxmall] [xxsongs]
randtxt
"Be Bop: See, Sop"
"Beatbox Fleet Flocks"
"Big Bang Gig Gang[r], by Sig Sang"
"Blue Blood Crew? Crud"
"Boy Boss Toy Toss[r], by Soy Sauce Roy Ross"
"Clear Classed Beer Blast Mo['] Massed"
"Deal Dope?! Heal! Hope!"
"Doom Doc's Boom-Box Room Rocks"
"Eh, Un-Gay Gun"
"Fit Fo['] Wit, Whoah" [show]
"Fly Phat Lie-At"
"Fo['] Flow So Slow"
"Get Got, Net Naught"
"Gloom Gang: Bloom, Bang (Flume, Fang)"
"Good Gang? Dud, Dang"
"Guy Gets High Hits"
"Hata['] Heft Data, Deft"
"Hey, Hang, Gay Gang"
"Lo Love Show Shove"
"Mercy Me, Jersey G[r], by Versy V & Percy P"
"My, Mo['] Sly, Slow"
"Old, Rude, Cold, Crude"
"Pay, Pow, Hey, How"
"Start, Stay, Heart, Hey"
"Stern Stable Turn Table"
"War Whistles, More Missiles"
"Will Woo [']Til Two"
"You'll Yell Woo Well"

table of miscellaneous people [xxpeople]
randtxt
"All Anger Bawl Banger Saul Sanger"
"Be-Bought Lee Lott"
"Big Baddy Pig Paddy"
"Blue Blood Stu, Stud"
"Bo, Better Go-Getter"
"Brief-Bray-Grief Gray"
"Broken-Brain Jokin['] Jane"
"Cold Carin['] Bold Baron"
"Dozy Doofus Rosy Rufus"
"Fart Face Mart Mayes"
"Faye Feared-Way-Weird"
"Form Fixin['] Norm Nixon"
"Ham-Hand Sam Sand"
"Hefty Hata['] Lefty Leda"
"Hex-Hone Rex Roan"
"Hey-His-Way Wiz"
"Hunter Hoke, Blunter Bloke"
"Hurt-Hell Burt Bell"
"Lair Level Daredevil Bear Bevell"
"Madman Chad Chan"
"Madman Tad Tan"
"Naughty/Nice Toddy Tice"
"Not Noble Scott Scoble"
"Pale Penman Dale Denman"
"Peevin['] Putz Steven Stutz"
"Phat Fly Brat Bri"
"Pill-Perk Bill Burke"
"Po['] Punk Joe Junk"
"Quite Quick Knight Nick"
"Rat Race Fat Face Pat Pace"
"Ray Really-Say-Silly"
"Rougher Rolled Duffer Dold"
"Rude Rave Dude Dave"
"Sick Sad Thick Thad"
"Still-Starin['] Bill Barron"
"Sure-Shank Burbank"
"Sweet-Sour Pete Power"
"Tart Tyke Mart-Mike"
"Ted-Talk Sed Salk"
"Trot Trice, Not-Nice Lot Lice"
"Wes Well-Yes-Yell"
"Whew-Worst-Cue-Curst Hugh Hurst"
"Wig Wearin['] Big Baron"
"Will-Work Bill Burke"
"Work-Will Kirk Kill"
"Would-Whirl Bud Burrell"

table of silly locations
randtxt
"Bad Beef Fad Fief"
"Bad Beef Rad Reef"
"Fighty Foals['] Hidey Holes"
"Final-Fail Vinyl Vale"
"Fivefold Hive Hold"
"Great Grouse Hate House"
"Low Key Louse Hokey House"
"Mighty Mole's Hidey Holes"
"Numb Gnomes['] Dumb Domes"
"Whee-Will-He Hill"

[the taunts below could be something from an enemy as well. I may wish to randomize them later.]
table of vvff digs [xxtaunts] [xxdigs] [xxmean]
randtxt
"Bad bid, cad kid!"
"Blue blood? Do? Dud! Boo, bud!"
"Bud, bug? Dud, dig!"
"But, but?! Tut, tut!"
"Catcall: at ALL!"
"Dark day! Hark, hey!"
"Fie! Face my mace!"
"Fry, freak-guy(?)-geek!"
"Gosh, go wash, whoa!"
"Lard! Left hard heft!"
"Look leading?! Book beating!"
"Mock me? Sock, SEE?!"
"My magic try: TRAGIC!"
"No-no! Ho-ho, dodo!"
"Rotten role: gotten goal?"
"Slum slave crumb. Crave? Come, CAVE!"
"Sly, sleek? Shy, chic? Why, weak!"
"Stout stud? Doubt, dud!"
"Town tip: down, dip!"
"Try to Fry, Foo[']! Die, do!"
"Want what? Taunt, tut!"
"War wish? Poor, pish!"
"Weep, wild cheap child!"
"Whoah! Words? No, nerds!"
"Wild? Weak! Mild! Meek!"
"Yale? You'll fail, fool!"
"You yearn: oo, earn? Boo, burn!"
"Zork?! Zero! Dork, Dear-oh!"

to say not-leet of (x - a cheattype): say "You notice the Leet Learner turned [scancol of x]"

table of Wet Wood clues
prof	randtxt
False	"You walk around a bit[one of] for the first time[or][stopping], and you wind up [one of]by a place called[or]back by[stopping] the HET HOOD. Homophobia and discrimination aren't cool, and you suspect they are part of the agenda of the Very Vile Fairy File. [not-leet of leteq]."
False	"You walk around some more and run into someone who calls out, 'Fret, frood...' Disheartened, you lose your way, but at least you make it back to the Wet Wood. [not-leet of letminus]."
False	"You walk around and discover a cabin belonging to someone named Det. Dood, who offers to help you sleuth how to get out of the Wet Wood for a modest fee. You decline the offer and run back to the Wet Wood. [not-leet of leteq]."
True	"You walk around and notice a distasteful small puddle where a pet peed, then a slightly more distasteful small mound where ... eegh. [not-leet of leteq]." [pet pood]

[leetclue of xxx]

volume homonym rejections

chapter thing homonyms

[this should not be alphabetized as otherwise Inform will assume from the first entry, the Bot Board, that everything is a person.]
[how to fix this?]

table of thing homonyms
mything	hom-rule (a rule)	myhom (topic)	custom-msg (text)
vapor vial	--	"vaper/vile"	"You need to change the vial into something more pleasant and constructive."
bold bard	hom-bold-bard-to-bowled-barred rule	--
bot board	hom-bot-board-to-bought-bored rule	--
coral cage	--	"choral"	"You don't need the cage to sing. You need to figure who's in there."
grow grate	--	"great"	"But you want to lessen the grate/gate's influence."
jake g	hom-toe-tappin-to-co-capn rule	"cappin"
mind malt	--	"mined"	"Rhyming's moved you ahead so far. Maybe try it again. Mind malt, vined vault..."
mist mess	--	"missed"	"You can miss the mess more productively by figuring your way through Airy Isle."
pain peasant	--	"pane"	"Broken person, broken window, eh?"
peeling pier	--	"peer"	"You could just L or X or LOOK for that. The pier is more flexible than that--rhymes will give more than homonyms here."
poor ponder	--	"pore"	"You don't need to pore over [poor ponder]. You need it to come alive!"
reeker russell	--	"wreaker"	"This game doesn't want homonyms, and that's probably one homonym you REALLY don't want to put into action."
sought sword	--	"sot"	"No, it wasn't lost by some drunk."
steel steer	--	"steal"	"The ceiling seer would not approve!"
stuck stair	--	"stare"	"You need to figure what the stair would hold. Staring may help, or it may not."
toe tappin	hom-toe-tappin-to-roe-tow rule	"roe/tow"	--
way woke	--	"whey"	"It's woke to eat whey, probably, but you can transform the cloak better with something else."
we whine	hom-we-whine-to-whee-wine rule	"whee/wine"
weird way	--	"whey"	"Yes, whey is weird to eat. But it would still be a sticky barrier."
well worn hell horn	--	"warn"	"The well worn hell horn is already giving a false warning."
white waste	--	"waist"	"It's sort of a waist, too, but let's concentrate on finishing the quest, here."
worst wave	--	"wurst"	"You're not hungry. Besides, the wave can become something better, nicer."
wry wall	--	"rye"	"The wall remains inorganic. You can't really do anything to it."

[usurped by the main verb checker rules but kept just in case
hot horde	--	"hoard"	"The horde is after victories, not treasure."]

section thing homonym rules [xxthr]

this is the hom-toe-tappin-to-co-capn rule:
	unless jake g is touchable and toe tappin row rappin is touchable, the rule fails;
	if sco-co-capn is true, the rule fails;

this is the hom-bold-bard-to-bowled-barred rule:
	if the player's command includes "bowled":
		say "Cricket isn't cricket right now, old chap!";
		the rule succeeds;
	if the player's command includes "barred":
		say "The bold bard sort of is, already, and you're trying to fix that.";
		the rule succeeds;

this is the hom-bot-board-to-bought-bored rule:
	if the player's command includes "bored":
		say "Sadly, the bot board is unable to feel bored of sitting around and being repressive.";
		the rule succeeds;
	if the player's command includes "bought":
		say "Perhaps their soulless corporate overlords would be interested in a quick buck, but the Bot Board isn't.";
		the rule succeeds;

this is the hom-toe-tappin-to-roe-tow rule:
	if the player's command includes "roe":
		say "You don't need fish or homonyms.";
		the rule succeeds;
	if the player's command includes "tow":
		say "You don't need a tow truck or homonyms.";
		the rule succeeds;

this is the hom-we-whine-to-whee-wine rule:
	if the player's command includes "whee":
		say "That'd be a heel turn, actually liking [we whine].";
		the rule succeeds;
	if the player's command includes "wine":
		say "[we whine] may drive moral people to drink, but you don't need that. Or homonyms.";
		the rule succeeds;


[zzthr]

chapter room homonyms

[the room homonyms work as follows: if we have a rule with multiple room states/possibilities and no topic, then we skip the topic. If we have a rule and a topic, we print the custom-msg if the rule and topic match. Otherwise, we print the custom-msg for a generic error if the topic matches. So that is why the topic or rule can be blank.]

to say hom-not: say ". Homonyms aren't quite the way to go, here"

table of room homonyms
loc	hom-rule (a rule)	myhom (topic)	custom-msg (text)
airy isle	--	"aerie/erry/aisle"	"The Airy Isle can't really be changed."
been buggin	--	"bin"	"You do sort of need to bin your shortcomings."
blinding blaze	hom-blinding-blaze-to-wheys-grace-graze rule	--	--
creased cross	--	"craws"
foe field	--	"sew/sow"	"The field is not for manual labor."
fun fen	--	"phen"	"Organic chemistry is much too complex, here."
got gear hot here	--	"hear"
here hull	--	"hear"	"You can just listen, if you need to."
history hall	hom-history-hall-to-haul-maul rule	--	--
lake lea	--	"lee"
po pit	--	"poe"	"You don't need a pendulum about to cut you."
real rear	--	"reel"	"The Sage Sea is not for fishing."
rift river	a rule	"riffed"	"You need to have riffed, but with rhyming, as you did in the Wet Wood."
store all stage	--	"awl"
tarry tile	tarry-not-marry rule	"terry"	"Nobody named Terry appears, nor does any terry cloth." [ALTRULE hom-tarry-tile-to-terry rule]
violent vale	fail-silent-sail rule	"veil"	"You need to get rid of the violence, not put a veil over it." [ALTRULE hom-violent-vale-to-veil rule]
wet wood	--	"whet/would"	"You need something a little more than homonyms to leave the Wet Wood. It feels like it should be simple, but not TOO simple. Homonyms ... don't quite change enough."
whining war	hom-whining-war-to-wining-wore rule	--

to say basic-homonym-reject: say "Homonyms aren't the way to go, here."

section room homonym pre-rules

[in the main rule, if these rule fail, we move to the next rule. If they succeed, the rule succeeds. If no action, then we say the custom message.]

this is the fail-silent-sail rule: if sco-silent-sail is true, the rule fails;

this is the tarry-not-marry rule: if sco-merry-mile is true, the rule fails;

section room homonym rules [xxrhr]

this is the hom-history-hall-to-haul-maul rule:
	if in-mystery-mall is true and the player's command includes "maul":
		say "[basic-homonym-reject]";
		the rule succeeds;
	if in-mystery-mall is false and the player's command includes "haul":
		say "[basic-homonym-reject]";
		the rule succeeds;

this is the hom-blinding-blaze-to-wheys-grace-graze rule:
	if sco-winding-ways is true and stuck stair is not moot:
		if the player's command includes "wheys":
			say "[basic-homonym-reject]";
			the rule succeeds;
	if stuck stair is moot:
		if the player's command includes "graze" or the player's command includes "grace":
			say "[basic-homonym-reject]";
			the rule succeeds;

this is the hom-whining-war-to-wining-wore rule:
	if sco-shining-shore is false:
		if the player's command includes "wining" or the player's command includes "wore":
			say "Homonyms aren't quite the way to change the whining war.";
			the rule succeeds;

[zzrhr]

volume miscellaneous hints and rules

this is the trivially false rule: the rule fails;
this is the trivially true rule: the rule succeeds;

to say rhyme-display: [pok]
	if Fun Fen is visited:
		say "you realize that you can change the first two letters to one, or vice versa, or change the first two letters completely. And it can be anything that rhymes.";
	else if sco-mind-me is true:
		say "You managed to MIND ME, but now you need to evade the trash trap.";
	else if player is in Trim Tram:
		say "you've been able to collapse the first two letters to one (Trash Trap to Mash Map, which is an action, too) and vice versa (Mean Mass to Green Grass) but maybe there's something else to do.";
	else if player is in Po Pit:
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
	let lb be lbrk entry;
	if tabidx entry > number of rows in tabnam entry:
		if debug-state is true, say "(Cycling) ";
		if thru-yet entry is 0:
			now thru-yet entry is 1;
		if there is a cycle-note entry:
			say "[cycle-note entry][if lb is true][line break][else][no line break][end if]";
			now tabidx entry is 0;
			continue the action;
		now tabidx entry is 1;
	if thru-yet entry is 1 and tabidx entry is 1, now rand-cycle is true;
	let Q be tabidx entry;
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
			if thru-yet entry is 1 and tabidx entry is 1:
				now thru-yet entry is 2;
				increment tables-found;
				if debug-state is true, say "DEBUG NOTE: [tabnam entry].";
				if tables-found is 1:
					say "Whoah... that seems familiar! Fourth wall note: you've circled to the start of [one of]a random table after going through it. Thanks for being interested enough to look through it! There are commands at the game's end to see other tables[or]another random table[stopping].";
				else if tables-found is 2:
					say "[line break]This is a further note to say you've cycled a random table more than once this turn, which is an impressive bit of timing, even if it doesn't get you any points.";
		if tables-found is 0 and debug-state is true, say "This is a BUG--you should have been notified of random cycling in a table, but you weren't.";
		the rule succeeds;

volume big meta table

table of all randoms
tabnam	tabidx	lbrk	thru-yet	desc	cycle-note
table of books	0	false	0	"Books in the Lending Libe"	"The final book is Tish Tausch's [b]Pish Posh Mish Mosh[r], which lives down to its title. That's enough text digested for one adventure"
table of mall shops	0	false	0	"Mystery Mall fake shops"	"Well Wail Sell Sale, the final one"
table of mall songs	0	false	0	"Songs after Tim T Sims"	"Oh man, this one's really good! [b]Tip Top Hip Hop[r]! You stay until you hear the playlist, um, flip flop."
table of miscellaneous people	0	false	0	"Assorted randos in [fussed]"	"Hazy Hairy Lazy Larry, who ends the list with a whimper"
table of silly locations	0	false	0	"Assorted random locations around Y'Old Yard"	"clues you'll never make it to Worthwhile Birth-Bile Earth Isle"
table of vvff digs	0	false	0	"Insults in the VVFF"	"The final entry reads, simply, 'Stare-y style, chary chile[']![r]'[paragraph break]It's the last one. A vicious slam book, indeed. Yet you feel pulled to looking at it again, instead of dispelling it once and for all"

Very Vile Fairy File Tables ends here.

---- DOCUMENTATION ----
