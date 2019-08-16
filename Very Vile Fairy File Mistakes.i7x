Version 1/181018 of Very Vile Fairy File Mistakes by Andrew Schultz begins here.

"List of good guesses that don't quite work for Very Vile Fairy File."

[malf.py alphabetizes each set of mistakes internally by room after the "general mistakes" volume.]

volume what you start with

[note that these are arranged alphabetically, not in order of play.]

table of mistake substitution
mist-cmd(topic)	mist-rule	leet-val	leet-rule	mist-txt
"brig brag"	trivially true rule	a cheattype	mist-bag-hint rule	"Good guys don't brag about [if player is in vined vault]being[else if vined vault is visited]having been[else]if they were ever[end if] in jail!" [start general mistakes]
"swig swag"	trivially true rule	--	mist-bag-hint rule	"There's no time to be drinking here!"
"cry call"	signable-loc rule	--	--	"You lash out meaninglessly at the wry wall." [start wry wall mistakes]
"dry doll"	signable-loc rule	--	--	"The wry wall relinquishes nothing. You're not sure what you'd do with a doll, anyway."
"fry fall"	signable-loc rule	--	--	"The wry wall remains upright."
"pry pall"	signable-loc rule	--	--	"There is no hidden tomb under the wry wall."
"try tall"	signable-loc rule	--	--	"The wry wall does not grow."
"bell born"	hell-horn-near rule	leteq	--	"There's enough noise right now." [start airy isle]
"swell sworn"	hell-horn-near rule	letminus	--	"That might augment the hell horn."
"nursed knave"	in-curst-cave rule	--	clue-worst-wave rule	"You don't need any more of that." [start curst cave]
"live leap"	hive-heap-near rule	leteq	--	"The leap wouldn't be live for very long." [start fun fen]
"one wen"	in-fun-fen rule	--	--	"Your skin remains unblemished, despite you tempting fate."
"pun pen"	in-fun-fen rule	--	--	"You find no way to reach behind the fourth wall and grab my pun pen. Besides, it's not the pen that's magically clever. It's me."
"won when"	in-fun-fen rule	--	--	"Hey, now! The Fun Fen is too cheery for such 'Am I done yet' angst."
"fast fap"	in-gassed-gap rule	leteq	--	"Stop that! While this is, uh, a solo adventure, this is not AIF. We're not THAT sort of juvenile, here." [start gassed gap]
"last lap"	in-gap-with-cap rule	leteq	--	"It will be the last lap one day. But you need a different action to get to this finality."
"passed/past pap"	in-gassed-gap rule	--	--	"You don't need to look back on what a trashy adventure this has been. Well, not in front of me.[if passed-1][leetclue of partminus][else][leetclue of leteq]"
"razzed rap"	in-gassed-gap rule	partminus	--	"There's enough bad music in this game if you know where to look."[?? if-then for if cap is moot]
"sassed sap"	in-gassed-gap rule	partminus	--	"You look for someone who has recently lost an argument, but nobody turns up."
"crash crap"	in-po-pit rule	letminus	--	"Profanity isn't necessary, here. Even minor ones." [start po' pit]
"crow crit"	in-po-pit rule	leteq	if-grit-ungrown rule	"You wait for a little bird to give advice, but nothing happens."
"foe fit"	in-po-pit rule	letplus	if-grit-ungrown rule	"Complaining and speculation about who or what put you there won't help."
"go get/git"	in-po-pit rule	letplus	if-grit-ungrown rule	"You have no-one to order around, not that it'd do any good."
"show shit"	in-po-pit rule	leteq	if-grit-ungrown rule	"Profanity doesn't work here."
"so sit"	in-po-pit rule	letplus	if-grit-ungrown rule	"You sit and pout. It doesn't help."
"woe wit"	in-po-pit rule	letplus	if-grit-ungrown rule	"Clever complaining will make you feel better but won't do anything."
"cage key"	key-or-rear rule	--	--	"[if cage key is off-stage]You can't just ask for it. It's in the Sage Sea, but you have to earn it[else]You already got the key[end if]." [start real rear]
"mage me"	key-or-rear rule	--	--	"[if player is in Real Rear]One look at the Sage Sea and y[else]Y[end if]ou remember mastering real magic takes training and practice. You'll find enough silly magic to do."
"peel pear"	in-real-rear rule	--	--	"You have no fruit."
"wheel where"	in-real-rear rule	--	--	"The Ceiling Seer does not direct you to any wheel or any form of transportation."
"bind be"	tram-first-puzzle rule	leteq	--	"Your incantation fails. Perhaps something more straightforward and inward-looking would work better." [start trim tram]
"bind bee"	tram-first-puzzle rule	partminus	--	"If there were a bee, it might distract you from being, well, you."
"kind key"	tram-first-puzzle rule	partminus	--	"Oh, it won't be that easy. Someone won't drop it for you. But you can do for YOU."
"prim pram"	in-trim-tram rule	leteq	--	"That worked in Trinity, but this game isn't Trinity. For better or, more likely, for worse."
"slim slam"	in-trim-tram rule	leteq	--	"That might be cool, to make the puzzle a slam dunk and lose the last few pounds, but it's not sneaky enough. You must be close, though."
"bean bass"	mass-near rule	letplus	--	"You could use a delicious meal, but perhaps there is something even simpler the mean mass can become." [start vined vault]
"clean class"	mass-near rule	leteq	--	"You can't help but feel the mean mass could be more wholesome, but that's not quite the right way to do things. It doesn't feel quite natural enough."
"glean glass"	mass-near rule	leteq	--	"No, there's no hidden window you overlooked."
"hind halt"	in-vined-vault rule	partplus	--	"You do feel sort of paranoid here, but fortunately, nothing is behind you or needs to stop."
"lean lass"	mass-near rule	letplus	--	"This isn't that sort of game."
"mind malt"	mass-near rule	--	--	"The mind malt is gone. You have to rely on yourself!"
"signed salt"	in-vined-vault rule	letboth	--	"No block of salt appears. What would you do with it, anyway?"
"wined walt"	in-vined-vault rule	letboth	--	"A drinking buddy won't help here."
"cake cap"	shore-shined rule	leteq	--	"No edible headgear appears." [start whining war]
"fake fap"	shore-shined rule	leteq	--	"You make a rude gesture, for whatever good it does."
"signing sore"	in-whining-war rule	partminus	--	"You make a rude gesture, for whatever good it does."

section texts and decides

to decide whether passed-1:
	if word number 1 in the player's command is "passed", yes;
	no;

section rules sorted alphabetically

this is the clue-worst-wave rule:
	if tool tap is off-stage, say "[leetclue of letminus]";

this is the hell-horn-near rule:
	if hell horn is touchable, the rule succeeds;

this is the hive-heap-near rule: if hive heap is touchable, the rule succeeds;

this is the if-grit-ungrown rule: if grit-grown is false, the rule succeeds;

this is the in-curst-cave rule:
	if player is in curst cave, the rule succeeds;

this is the in-fun-fen rule: if player is in Fun Fen, the rule succeeds;

this is the in-gap-with-cap rule: if player is in Gassed Gap and cap is not moot, the rule succeeds;

this is the in-gassed-gap rule: if player is in Gassed Gap, the rule succeeds;

this is the in-po-pit rule: if player is in Po' Pit, the rule succeeds;

this is the in-real-rear rule: if player is in Real Rear, the rule succeeds;

this is the in-trim-tram rule: if player is in trim tram, the rule succeeds;

this is the in-vined-vault rule: if player is in vined vault, the rule succeeds;

this is the in-whining-war rule: if player is in Whining War, the rule succeeds;

this is the key-or-rear rule: if player is in Real Rear or player has cage key, the rule succeeds;

this is the mass-near rule: if mean mass is touchable, the rule succeeds;

this is the mist-bag-hint rule:
	if big bag is off-stage, say "[leetclue of letminus]";
	the rule succeeds;

this is the shore-shined rule: if player is in Whining War and shore-shine is true, the rule succeeds;

this is the signable-loc rule:
	if location of player is signable, the rule succeeds;

this is the tram-first-puzzle rule: if player is in trim tram and me-minded is false, the rule succeeds;

book unsorted

table of mistake substitution (continued)
mist-cmd(topic)	mist-rule	leet-val	leet-rule	mist-txt
"crow crate"	go-gate-vis rule	--	--	"No birds appear to fly you over the grate, nor does a box of crowbars materialize[leetclue of partminus]."
"foe fate"	go-gate-vis rule	--	--	"You are nowhere near the end.[leetclue of partplus]"
"know/no nate"	go-gate-vis rule	--	--	"Nobody named Nate appears to help you through the go gate.[if know-1][leetclue of leteq][else][leetclue of partplus][end if]"
"lo late"	go-gate-vis rule	--	--	"You feel you are on the right path to disabling the go gate.[leetclue of partplus]"
"mo mate"	go-gate-vis rule	--	--	"You remain alone.[leetclue of partplus]"
"oh ate"	go-gate-vis rule	--	--	"Nothing takes a bit out of the go gate.[leetclue of letplus]"
"woe/whoa/whoah weight"	go-gate-vis rule	--	--	"You wouldn't want to be crushed by a weight. But you've got the right idea.[leetclue of partminus]"
"card cat"	hat-or-mat rule	leteq	no-hardhat rule	"Not very practical." [general unsorted]

this is the no-hardhat rule: if player does not have hard hat, the rule succeeds;

section texts and decides

to decide whether know-1:
	if word number 1 in the player's command is "know", yes;
	no;

section rules sorted alphabetically

this is the go-gate-vis rule: if go gate is touchable, the rule succeeds;

this is the hat-or-mat rule: if hard hat is touchable or marred mat is touchable, the rule succeeds;

Very Vile Fairy File Mistakes ends here.

---- DOCUMENTATION ----
