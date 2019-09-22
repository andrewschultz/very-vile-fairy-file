Version 1/181108 of Very Vile Fairy File Tables by Andrew Schultz begins here.

"This is divided into 3 volumes: the tables, the core code and the big meta table. It is roughly copied from Ailihphilia. Ctrl-end for meta table. The core code is about a page long, so you can go ctrl-end page-up for that."

[dbh.py shortens to the debug version]

volume core tables

[pest post / messed most / rest roast/ guest ghost / best boast]
table of bad locs [xxloc] [xxbadloc]
e1	e2	been-here	fake-name	death-trap
Airy Isle	north	false	"Earning Ridges"	"You figure you've got a right to profit as you have gotten this far. Why, there're some bridges to cross ahead, even brighter than the brightening bridge you made back in the Violent Vale! Everything seems lit so clearly as you walk across them, but too late, you realize that is because they are BURNING BRIDGES."
Airy Isle	down	false	"Happy Hall"	"Man! You could use some cheer right now. The happy hall is spacious at first until you ... need to start crawling. You realize what this means."
Airy Isle	up	false	"Hippy Hill"	"You are sure the Hippy Hill will be full of peace and love and goodness and be an appropriate end to all this ... until you hear noises. A drippy drill. Then you are caught by a grippy grill! You suddenly realize you lack ... skippy skill."
Blinding Blaze	--	false	"Straight Street"	"Oh boy, a straight street is a lot better than a maze! You might even find a Great Greet, or at least a Mate Meet. It's getting a bit lonely. But of course, you run into a Bait Beat chock full of Hate Heat, where people cry 'Late! Leet?!' You wind up crushed by weight ... wheat. It's not the desired fate-feat."
Fight Funnel	north	false	"Fortune Funnel"	"Boy oh boy! Enough of these rhymes. It would be neat to have fortune, you think as you walk. But it's also a bit hot...well, very hot... and you realize you've run into the TORCHIN['] TUNNEL.[paragraph break]Given where you started, you probably should've seen this, but it was worth a try."
Fun Fen	west	false	"Bold [']n Brave"	"You feel like you can handle anything. Yes sir/ma'am! You are bold and brave! But shortly, you feel less warm. 'Cold ... and crave,' you think, slightly ungrammatically. Then an olden rave leaves you even more scared. You flee, until you tumble down and look up and realize you are trapped in a ...  golden grave!" [?? this is a bad place to put it but I want to test a sign with 2 entries]
Fun Fen	east	false	"Fate Farm"	"You figure, why not get to my fate sooner rather than later? A farm can't be that bad. You hear an innocuous 'Mate?! Marm?!' as you walk down a road, then a dismayed 'DISARM!' Yup, pretty nonviolent...[paragraph break]Until you are faced with mass chanting of 'Hate, harm!' The rest is unspeakable."
Gassed Gap	east	false	"Hopping Hills"	"Boy! You could use some funky music right now. There is some, but there's also someone who offers you some drugs to enhance the music. You eventually find yourself forgetting about your mission and POPPING PILLS you buy from SHOPPING SHILLS and, more speciously, drinking very bad alcohol from (brain) STOPPING STILLS."
Gassed Gap	west	false	"Rattlin['] Runs"	"Perhaps you expected to be battlin['] buns, which could not be too hard, but you really should not have been surprised to walk into a bunch of gatlin guns. People are tattlin['] tons at your obliviousness."
Lake Lap	east	false	"Hi! Here, Buy Beer"	"You don't have any cash, but so what? Maybe someone will recognize your adventuring exploits so far and give you some, free. You ignore that silly voice saying 'Fie! Fear!' It's probably from a sigh-seer or someone with a lie-leer, as it's to dry, drear. Passing shops called My Mere Guy Gear, Tie Teer and Pie Pier, you have a feeling something is nigh, near. The last words you and Jake hear are, of course, 'Die, dear' as you simultaneously feel an impact of a spy-spear and are run over by a sty-steer. And your last thought is 'Why? We're ...'"
Lake Lap	south	false	"Rad Route"	"Oh, it starts off okay. The lad lout is no problem. You walk cheerily by Stade Stout and Pad Pout, giving yourself a tad tout. But at the end, you run into people with clad clout, and it's a bad bout."
Lake Lap	north	false	"See Some... Gee, Gum"	"Maybe there's not just gum but you can say 'Me! Mum...' However, your thoughts are more 'Glee...GLUM' after you are ambushed by some ski scum."
Lake Lea	south	false	"Blest Bloom"	"Zest! Zoom! It smells nice at first as you walk along. But soon, it starts smelling like a rest room and then a smell of death. You hear a voice (and oh, what a best boom it is) intone 'DEST.: DOOM!' You realize you have wound up in ... a TEST TOMB."
Lake Lea	west	false	"Capped Cone"	"What could possibly be dangerous about a cone? Nothing, until you get beyond it to the ... ZAPPED ZONE."
Lake Lea	north	false	"Mo Main Low Lane"	"You walk along, feeling sure you will go gain so sane. But you are utterly surprised to find someone offering you ... cocaine. You just say no, but it is not heroic enough. When you aren't looking, you are enveloped by the horrid Bro Brain."
Whining War	east	false	"Done Dune"	"Despite a clearly-marked run rune, it doesn't seem like a place you should shun soon ... until you run into a GUN GOON."
Whining War	down	false	"Fast Foi'd"	"Apparently, you do not get to fast-foward. Well, you sort of do, but not to a good end. The last thing you see as you realize you can't breathe is a ... vast void."
Y'Old Yard	west	false	"Faun Fen"	"Boy, the faun fen seems relaxing! Unfortunately, as you begin to waltz through, you suffer horrible, and ultimately fatal, tauntin['] and conkin[']."
Y'Old Yard	south	false	"Lit Lawn"	"Boy! The lit lawn seems nice and bright! A fit faun is frolicking alone! You ignore the voice yelling 'get gone' and are unaware of a pit pawn that grabs you from behind, making you sit, sawn"

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
			if rank-max entry is -1, now rank-max entry is whew-score; [keep initial rank until you get to Fun Fen]
			now min-forced-score is rank-max entry;
			now last-forced-row is my-row;
			now last-points is rank-max entry + 1;
			next;
		if blank-rows is 0:
			now blank-rows is number of rows in table of ranks - my-row + 1;
		let temp be (my-row - last-forced-row) * ((core-max - 1) - min-forced-score);
		now rank-max entry is (temp / blank-rows) + min-forced-score;
[		if debug-state is true, say "Assigned rank: [b][rank-name entry][r] = [last-points] up to [rank-max entry].";]
		now last-points is rank-max entry + 1;
[	if debug-state is true:
		repeat through table of ranks:
			say "[rank-name entry] is <= [rank-max entry] points.";]
			[ the comment-out is because ranks aren't changing any more with the points set, and also I need to see more interesting and likely-to-change debug information at the start.]

to say your-rank:
	repeat through table of ranks:
		[ say "Comparing [core-score] <= [rank-max entry] for rank [rank-name entry]."; ]
		if core-score <= rank-max entry:
			say "[rank-name entry]";
			continue the action;
	if core-score is not the core-max:
		say "(bug)";
	else:
		say "gold god";

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
"Work-Will Kirk Kill"
"Would-Whirl Bud Burrell"

[the taunts below could be something from an enemy as well. I may wish to randomize them later.]
table of vvff digs [xxtaunts] [xxdigs] [xxmean]
randtxt
"Blue blood? Do? Dud! Boo, bud!"
"But, but?! Tut, tut!"
"Catcall: at ALL!"
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

table of vvff books [xxbooks]
randtxt
"Ache or Make More Lake Lore"
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
"Self Centered Elf Entered"
"So Seek Crow Creek"
"Take Tess, Wake Wes, Make Mess"
"Why When My Men, by Ben"
"Your Be-Yays: Derby Days[r], by Herbie Hayes"

to say not-leet of (x - a cheattype): say "You notice the Leet Learner turned [scancol of x]"

table of Wet Wood clues
prof	randtxt
False	"You walk around a bit[one of] for the first time[or][stopping], and you wind up [one of]by a place called[or]back by[stopping] the HET HOOD. Homophobia and discrimination aren't cool, and you suspect they are part of the agenda of the Very Vile Fairy File. [not-leet of leteq]."
False	"You walk around some more and run into someone who calls out, 'Fret, frood...' Disheartened, you lose your way, but at least you make it back to the Wet Wood.  [not-leet of letminus]."
False	"You walk around and discover a cabin belonging to someone named Det. Dood, who offers to help you sleuth how to get out of the Wet Wood for a modest fee. You decline the offer and run back to the Wet Wood. [not-leet of leteq]."
True	"You walk around and notice a small puddle where a pet peed, then a small mound where ... a pet did something slightly more distasteful.  [not-leet of leteq]." [pet pood]

[leetclue of xxx]
volume hints for later

table of forlaters [the CAN rules need to remain for the most part, because they are about if you can move around to do something.]
cmd-to-say	ready-to-hint	can-do-now	is-done	think-advice
"BEAST BOSS"	false	can-beast-boss rule	false	"You tried to summon the [b]BEAST BOSS[r] [here-in of Creased Cross] but need to try again [once-now of can-beast-boss rule] you can."
"BIG BAG"	false	vc-big-bag rule	false	"You tried to make a [b]BIG BAG[r] from the zig zag rig rag, but you can [once-now of vc-big-bag rule] it feels right."
"BURY BILE"	false	vc-bury-bile rule	false	"When you tried to [b]BURY BILE[r], it didn't feel like the right place. Maybe somewhere else[if Airy Isle is unvisited]. And maybe you need to find the Very Vile Fairy File first[end if]."
"CAST CAP"	false	can-cast-cap rule	false	"You can [b]CAST CAP[r] [once-now of can-cast-cap rule] rule you have a worthy one."
"CO CAPN"	false	can-co-capn rule	false	"You tried to find a [b]CO CAPN[r] but need to try again [once-now of can-co-capn rule] there's a worthy comrade."
"CULL CEASED"	false	can-cull-ceased rule	false	"You should be able to say [b][cul-lul][r] [once-now of can-cull-ceased rule] you're back to full strength."
"DEAL DEAR"	false	can-deal-dear rule	false	"You tried to say [b]DEAL DEAR[r] [here-in of Real Rear], which will work [once-now of can-deal-dear rule] you have something you need to deal with."
"DINING DOOR"	false	can-dining-door rule	false	"You should be able to make a [b]DINING DOOR[r] [once-now of can-dining-door rule] the Whining War has calmed down a bit."
"FEEL FEAR"	false	can-feel-fear rule	false	"You tried to [b]FEEL FEAR[r] [here-in of Real Rear], but [once-now of can-feel-fear rule] you have help from above, you could."
"FIRST FAVE"	false	can-first-fave rule	false	"You could say [b]FIRST FAVE[r] [once-now of can-first-fave rule] the screaming skull is gone."
"FIT FOUND"	false	can-fit-found rule	false	"You can declare a [b]FIT FOUND[r] [once-now of can-fit-found rule] you've gotten rid of the Hit Hound."
"FLIM FLAM"	false	vc-flim-flam rule	false	"You tried to [b][ski-fli][r], but you didn't have the confidence. You may feel more comfortable doing so [once-now of vc-flim-flam rule] you have focused inward and feel no need to FIND FEE."
"FULL FEAST"	false	can-full-feast rule	false	"You could make the Bull Beast a [b]FULL FEAST[r] once/now it's been vanquished."
"GLEAN GLOWS"	false	can-glean-glows rule	false	"You'll want to [b]GLEAN GLOWS[r] [once-now of can-glean-glows rule] you've found something Mean Moe's Clean Clothes can clean."
"GO GAPPIN"	false	can-go-gappin rule	false	"You'll want to [b]GO GAPPIN[r] [once-now of can-go-gappin rule] you've found a gap to go over."
"GOT GORED"	false	vc-got-gored rule	false	"The battle cry [b]GOT GORED[r] should work [once-now of vc-got-gored rule] you have a full army and its leader."
"HEAL HERE"	false	can-heal-here rule	false	"You tried to [b]HEAL HERE[r] [here-in of Real Rear], which will be handy [once-now of can-heal-here rule] you need to heal from something."
"LEAST LOSS"	false	can-least-loss rule	false	"You could say [b]LEAST LOSS[r] [once-now of can-least-loss rule] you have something to face [here-in of Creased Cross]."
"MARK MORE"	false	can-mark-more rule	false	"You'll want to [b]MARK MORE[r] [once-now of can-mark-more rule] you've found a dark door [here-in of Stark Store]."
"MASH MAP"	false	vc-mash-map rule	false	"You tried to [b][ash-ap][r], [if grit-grown is true]and maybe now you were able to [b]GROW GRIT[r], it will work[else]but sadly, you still believe it is the only thing that could help you through, and you don't have the guts[end if]."
"MERRY MILE"	false	can-merry-mile rule	false	"You can call for a [b]MERRY MILE[r] [once-now of can-merry-mile rule] things have calmed down."
"MINING MORE"	false	can-mining-more rule	false	"You should be able to perform [b]MINING MORE[r] [once-now of can-mining-more rule] the Fining Four are fully satisfied."
"MO MAPPIN"	false	can-mo-mappin rule	false	"You can try [b]MO MAPPIN[r] [once-now of can-mo-mappin rule] you've found a suitable place to map."
"MORAL MAGE"	false	can-moral-mage rule	false	"You tried to find the [b]MORAL MAGE[r], but you couldn't open the coral cage yet."
"PULL PIECED"	false	can-pull-pieced rule	false	"You can [b]PULL PIECED[r] the bull beast [once-now of can-pull-pieced rule] you have more people willing to help you."
"SHINING SHORE"	false	can-shining-shore rule	false	"You can make the [b]SHINING SHORE[r] [once-now of can-shining-shore rule] you dealt with the Whining War."
"SHOW SHIELD"	false	can-show-shield rule	false	"You'll want to [b]SHOW SHIELD[r] [once-now of can-show-shield rule] you've found something that can protect you in the Foe Field."
"SMASHING SMOKE"	false	can-smashing-smoke rule	false	"You can make [b]SMASHING SMOKE[r] [once-now of can-smashing-smoke rule] you've found someone or something that could use a suitable diversion."
"SNAKE SNAP"	false	can-snake-snap rule	false	"You can [b]SNAKE SNAP[r] [once-now of can-snake-snap rule] it's clear a snake is present."
"SO SAPPIN"	false	can-so-sappin rule	false	"You can make things [b]SO SAPPIN[r] [once-now of can-so-sappin rule] you can find where people are using their energy fruitlessly."

[?? see about collapsing the below into rules from the story file proper e.g. vc-can-cull-ceased rule]

[xx4l8r]

this is the can-beast-boss rule:
	if player has gold guard and gull-guard is true, the rule succeeds;
	the rule fails.

this is the can-cast-cap rule:
	if player has cool cap, the rule succeeds;
	the rule fails.

this is the can-co-capn rule:
	if jake-fee is true, the rule succeeds;
	the rule fails;

this is the can-cull-ceased rule:
	if healed-here is true, the rule succeeds;
	the rule fails;

this is the can-deal-dear rule:
	if felt-fear is true, the rule succeeds;
	the rule fails.

this is the can-dining-door rule:
	if war-sapped is true, the rule succeeds;
	the rule fails;

this is the can-feel-fear rule:
	if knelt-yet is true, the rule succeeds;
	the rule fails.

this is the can-first-fave rule:
	if screaming skull is moot, the rule succeeds;
	the rule fails.

this is the can-fit-found rule:
	if Hit Hound is moot, the rule succeeds;
	the rule fails.

this is the can-full-feast rule:
	if cull-ceased is true, the rule succeeds;
	the rule fails.

this is the can-glean-glows rule:
	if player has way woke clay cloak, the rule succeeds;
	the rule fails;

this is the can-go-gappin rule:
	if gassed gap is visited, the rule succeeds;
	the rule fails;

this is the can-heal-here rule:
	if least-loss is true, the rule succeeds;
	the rule fails.

this is the can-least-loss rule:
	if Bull Beast is in Creased Cross, the rule succeeds;
	the rule fails.

this is the can-mark-more rule:
	if dark door is in Stark Store, the rule succeeds;
	the rule fails;

this is the can-merry-mile rule:
	if well worn hell horn is moot, the rule succeeds;
	the rule fails.

this is the can-mining-more rule:
	if full feast is not moot, the rule fails;

this is the can-mo-mappin rule:
	if blaze-ways is true, the rule succeeds;
	the rule fails;

this is the can-moral-mage rule:
	if player has cage key, the rule succeeds;
	the rule fails.

this is the can-pull-pieced rule:
	if full feast is moot, the rule succeeds;
	the rule fails;

this is the can-shining-shore rule:
	if war-sapped is true, the rule succeeds;
	the rule fails.

this is the can-show-shield rule:
	if player has gold guard and mine-more is true, the rule succeeds;
	the rule fails.

this is the can-smashing-smoke rule:
	if y'old yard is visited, the rule succeeds;
	the rule fails;

this is the can-snake-snap rule:
	if jake-cocapn is true, the rule succeeds;
	the rule fails;

this is the can-so-sappin rule:
	if whining war is visited, the rule succeeds;
	the rule fails;

[zz4l8r]

this is the trivially false rule: the rule fails;
this is the trivially true rule: the rule succeeds;

to say rhyme-display:
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
		say "GET GOOD was just switching two letters from WET WOOD, but maybe you need to change a bit more here. While still rhyming.";
	else:
		say "WET WOOD. You've got that zig zag rig rag. Maybe there's alliterative rhyming, here. What rhymes with WET WOOD?";

volume the code

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
table of miscellaneous people	0	false	0	"Assorted randos"	--
table of vvff books	0	false	0	"Books in the Lending Libe"	"Wow! So much to read, so little time. You're up to digesting more text right now, but not quite like that."
table of vvff digs	0	true	0	"Insults in the VVFF"	"The final entry reads, simply, 'Stare-y style, chary chile[']!'[paragraph break]That's all. A vicious slam book, indeed. Yet you feel pulled to looking at it again, instead of dispelling it once and for all."

Very Vile Fairy File Tables ends here.

---- DOCUMENTATION ----
