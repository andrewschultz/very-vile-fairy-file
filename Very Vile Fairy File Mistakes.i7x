Version 1/181018 of Very Vile Fairy File Mistakes by Andrew Schultz begins here.

"List of good guesses that don't quite work for Very Vile Fairy File."

[malf.py alphabetizes each set of mistakes internally by room after the "general mistakes" volume.]

volume what you start with

chapter general mistakes

understand "swig swag" as a mistake ("There's no time to be drinking here![if player does not have big bag][leetclue of letminus][end if]").

volume mistakes by room

[note that these are arranged alphabetically, not in order of play.]

chapter --- wry wall room mistakes

understand "cry call" as a mistake ("You lash out meaninglessly at the wry wall.") when location of player is signable.

understand "dry doll" as a mistake ("The wry wall relinquishes nothing. You're not sure what you'd do with a doll, anyway.") when location of player is signable.

understand "fry fall" as a mistake ("The wry wall remains upright.") when location of player is signable.

understand "my mall" as a mistake ("There's already a mall in this game.") when location of player is signable.

understand "pry pall" as a mistake ("There is no hidden tomb under the wry wall.") when location of player is signable.

understand "try tall" as a mistake ("The wry wall does not grow.") when location of player is signable.

chapter Airy Isle mistakes

understand "bell born" as a mistake ("There's enough noise right now.[leetclue of leteq]") when well worn hell horn is quicknear.

understand "swell sworn" as a mistake ("That might augment the hell horn.[leetclue of letminus]") when well worn hell horn is quicknear.

chapter Creased Cross mistakes

chapter Curst Cave mistakes

understand "nursed knave" as a mistake ("You don't need any more of that.[if tool tap is off-stage][leetclue of letminus][end if]") when player is in Curst Cave.

chapter Fun Fen mistakes

understand "live leap" as a mistake ("The leap wouldn't be live for very long.[leetclue of leteq]") when hive heap is quicknear.

understand "one wen" as a mistake("Your skin remains unblemished, despite you tempting fate.") when player is in Fun Fen.

understand "pun pen" as a mistake ("You find no way to reach behind the fourth wall and grab my pun pen. Besides, it's not the pen that's magically clever. It's me.") when player is in Fun Fen.

understand "won when" as a mistake("Hey, now! The Fun Fen is too cheery for such 'Am I done yet' angst.") when player is in Fun Fen.

chapter Gassed Gap mistakes

to decide whether passed-1:
	if word number 1 in the player's command is "passed", yes;
	no;

understand "fast fap" as a mistake ("Stop that! While this is, uh, a solo adventure, this is not AIF. We're not THAT sort of juvenile, here.[leetclue of leteq]") when player is in Gassed Gap.

understand "last lap" as a mstake ("It will be the last lap one day. But you need a different action to get to this finality.[leetclue of leteq]") when player is in Gassed Gap and cap is not moot.

understand "passed pap" and "past pap" as a mistake ("You don't need to look back on what a trashy adventure this has been. Well, not in front of me.[if passed-1][leetclue of partminus][else][leetclue of leteq]") when player is in Gassed Gap.

understand "razzed rap" as a mistake ("There's enough bad music in this game if you know where to look.[leetclue of partminus]") when player is in Gassed Gap. [?? if-then for if cap is moot]

understand "sassed sap" as a mistake ("You look for someone who has recently lost an argument, but nobody turns up.[leetclue of partminus]") when player is in Gassed Gap.

chapter Po' Pit mistakes

understand "crash crap" as a mistake ("Profanity isn't necessary, here. Even minor ones.[leetclue of letminus]") when player is in Po' Pit.

understand "crow crit" as a mistake ("You wait for a little bird to give advice, but nothing happens.[if grit-grown is true][leetclue of leteq][end if]") when player is in Po' Pit.

understand "foe fit" as a mistake ("Complaining and speculation about who or what put you there won't help.[if grit-grown is true][leetclue of letplus][end if]") when player is in Po' Pit.

understand "go get" and "go git" as a mistake ("You have no-one to order around, not that it'd do any good.[if grit-grown is true][leetclue of letplus][end if]") when player is in Po' Pit.

understand "show shit" as a mistake ("Profanity doesn't work here.[if grit-grown is true][leetclue of leteq][end if]") when player is in Po' Pit.

understand "so sit" as a mistake ("You sit and pout. It doesn't help.[if grit-grown is true][leetclue of letplus][end if]") when player is in Po' Pit.

understand "woe wit" as a mistake ("Clever complaining will make you feel better but won't do anything.[if grit-grown is true][leetclue of letplus][end if]") when player is in Po' Pit.

chapter Real Rear mistakes

understand "cage key" as a mistake ("[if cage key is off-stage]You can't just ask for it. It's in the Sage Sea, but you have to earn it[else]You already got the key[end if].") when player has cage key or player is in Real Rear.

understand "mage me" as a mistake ("[if player is in Real Rear]One look at the Sage Sea and y[else]Y[end if]ou remember mastering real magic takes training and practice. You'll find enough silly magic to do.") when player has cage key or player is in Real Rear.

understand "peel pear" as a mistake ("You have no fruit.") when player is in Real Rear

understand "wheel where" as a mistake ("The Ceiling Seer does not direct you to any wheel or any form of transportation.") when player is in Real Rear.

chapter Trim Tram mistakes

understand "bind be" as a mistake ("Your incantation fails. Perhaps something more straightforward and inward-looking would work better.[leetclue of leteq]") when player is in Trim Tram and me-minded is false.

understand "bind bee" as a mistake ("If there were a bee, it might distract you from being, well, you.[leetclue of partminus]") when player is in Trim Tram and me-minded is false.

understand "kind key" as a mistake ("Oh, it won't be that easy. Someone won't drop it for you. But you can do for YOU.[leetclue of partminus]") when player is in Trim Tram and me-minded is false.

understand "prim pram" as a mistake ("That worked in Trinity, but this game isn't Trinity. For better or, more likely, for worse.[leetclue of leteq]") when player is in Trim Tram.

understand "slim slam" as a mistake ("That might be cool, to make the puzzle a slam dunk and lose the last few pounds, but it's not sneaky enough. You must be close, though.[leetclue of leteq]") when player is in Trim Tram.

chapter Vined Vault mistakes

understand "bean bass" as a mistake ("You could use a delicious meal, but perhaps there is something even simpler the mean mass can become.[leetclue of letplus]") when mean mass is quicknear.

understand "clean class" as a mistake ("You can't help but feel the mean mass could be more wholesome, but that's not quite the right way to do things. It doesn't feel quite natural enough.[leetclue of leteq]") when mean mass is quicknear.

understand "glean glass" as a mistake ("No, there's no hidden window you overlooked.[leetclue of leteq]") when mean mass is quicknear.

understand "hind halt" as a mistake ("You do feel sort of paranoid here, but fortunately, nothing is behind you or needs to stop.[leetclue of partplus]") when player is in Vined Vault.

understand "lean lass" as a mistake ("This isn't that sort of game.[leetclue of letplus]") when mean mass is quicknear.

understand "mind malt" as a mistake ("The mind malt is gone. You have to rely on yourself![leetclue of partplus]") when mean mass is quicknear.

understand "signed salt" as a mistake ("No block of salt appears. What would you do with it, anyway?[leetclue of letboth]") when player is in Vined Vault.

understand "wined walt" as a mistake ("A drinking buddy won't help here.[leetclue of letboth]") when player is in Vined Vault.

chapter Whining War mistakes

understand "cake cap" as a mistake ("No edible headgear appears.[leetclue of leteq]") when player is in Whining War and shore-shine is true.

understand "fake fap" as a mistake ("You make a rude gesture, for whatever good it does.[leetclue of leteq]") when player is in Whining War and shore-shine is true.

understand "signing sore" as a mistake ("You make a rude gesture, for whatever good it does.[leetclue of partminus]") when player is in Whining War.

volume unsorted

understand "card cat" as a mistake ("Not very practical.[if player does not have hard hat][leetclue of leteq][end if]") when hard hat is quicknear or marred mat is quicknear.

chapter go gate mistakes

to decide whether know-1:
	if word number 1 in the player's command is "know", yes;
	no;

understand "crow crate" as a mistake ("No birds appear to fly you over the grate, nor does a box of crowbars materialize[leetclue of partminus].") when go gate is quicknear.

understand "foe fate" as a mistake ("You are nowhere near the end.[leetclue of partplus]") when go gate is quicknear.

understand "know nate" and "no nate" as a mistake ("Nobody named Nate appears to help you through the go gate.[if know-1][leetclue of leteq][else][leetclue of partplus][end if]") when go gate is quicknear.

understand "lo late" as a mistake ("You feel you are on the right path to disabling the go gate.[leetclue of partplus]") when go gate is quicknear.

understand "mo mate" as a mistake ("You remain alone.[leetclue of partplus]") when go gate is quicknear.

understand "oh ate" as a mistake ("Nothing takes a bit out of the go gate.[leetclue of letplus]") when go gate is quicknear.

understand "woe weight" and "whoa weight" and "whoah weight" as a mistake ("You wouldn't want to be crushed by a weight. But you've got the right idea.[leetclue of partminus]") when go gate is quicknear.

Very Vile Fairy File Mistakes ends here.

---- DOCUMENTATION ----
