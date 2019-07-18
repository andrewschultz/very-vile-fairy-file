Version 1/181108 of Very Vile Fairy File Tables by Andrew Schultz begins here.

"This is divided into 3 volumes: the tables, the core code and the big meta table. It is roughly copied from Ailihphilia. Ctrl-end for meta table. The core code is about a page long, so you can go ctrl-end page-up for that."

volume core tables

[pest post / messed most / rest roast/ guest ghost / best boast]
table of bad locs
e1	e2	been-here	fake-name	death-trap
--	--	false	"See Some... Gee, Gum"	"Maybe there's not just gum but you can say 'Me! Mum...' However, your thoughts are more 'Glee...GLUM' after you are ambushed by some ski scum."
--	--	false	"Mo Main Low Lane"	"You walk along, feeling sure you will go gain so sane. But you are utterly surprised to find someone offering you ... cocaine. You just say no, but it is not heroic enough. When you aren't looking, you are enveloped by the horrid Bro Brain."
--	--	false	"Rattlin['] Runs"	"Perhaps you expected to be battlin['] buns, which could not be too hard, but you really should not have been surprised to walk into a bunch of gatlin guns. People are tattlin['] tons at your obliviousness."
--	--	false	"Faun Fen"	"Boy, the faun fen seems relaxing! Unfortunately, as you begin to waltz through, you suffer horrible, and ultimately fatal, tauntin['] and conkin[']."
--	--	false	"Blest Bloom"	"It smells nice at first as you walk along. But soon, it starts smelling like a rest room and then a smell of death. You hear a voice (and oh, what a best boom it is) intone 'DEST.: DOOM!' You realize you have wound up in ... a TEST TOMB."
Airy Isle	west	false	"Happy Hall"	"Man! You could use some cheer right now. The hall is spacious at first until you ... need to start crawling. You realize what this means."
Airy Isle	east	false	"Hippy Hill"	"You are sure the Hippy Hill will be full of peace and love and goodness and be an appropriate end to all this ... until you hear noises. A drippy drill. Then you are caught by a grippy grill! You suddenly realize you lack ... skippy skill."
Fun Fen	west	false	"Bold [']n Brave"	"Boom! Golden Grave!" [?? this is a bad place to put it but I want to test a sign with 2 entries]
Fun Fen	east	false	"Fate Farm"	"Boom! Hate, harm!"
Gassed Gap	east	false	"Done Dune"	"Blam! A gun goon appears out of nowhere and mows you down."
Soft Sand	up	false	"Hopping Hills"	"Boy! You could use some funky music right now. There is some, but there's also someone who offers you some drugs to enhance the music. You eventually find yourself forgetting about your mission and POPPING PILLS and, more speciously, drinking very bad alcohol from (brain) STOPPING STILLS."
Vending Vibe	west	false	"Fortune Funnel"	"Boy oh boy! It would be neat to have fortune, you think as you walk. But it's also a bit hot...well, very hot... and you realize you've run into the TORCHIN['] TUNNEL."
Whining War	south	false	"Fast Foi'd"	"Apparently, you do not get to fast-foward. Well, you sort of do, but not to a good end. The last thing you see as you realize you can't breathe is a ... vast void."
Whining War	north	false	"Done Dune"	"It doesn't seem like a place you should shun soon ... until you run into a GUN GOON."

table of ranks
rank-max	rank-name
0	"cold cod"
7	"lol'd, lawd" [this is defined because I want to trigger a rank gain at the Fun Fen]
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
	now core-max is min-needed;
	let my-row be 0;
	let blank-rows be 0;
	let min-forced-score be -1;
	let Q be 0;
	let last-forced-row be 0;
	let last-points be 0;
	repeat through table of ranks:
		increment my-row;
		if there is a rank-max entry:
			now min-forced-score is rank-max entry;
			now last-forced-row is my-row;
			now last-points is rank-max entry + 1;
			next;
		if blank-rows is 0:
			now blank-rows is number of rows in table of ranks - my-row + 1;
		let temp be (my-row - last-forced-row) * ((core-max - 1) - min-forced-score);
		now rank-max entry is (temp / blank-rows) + min-forced-score;
		if debug-state is true, say "Assigned rank: [b][rank-name entry][r] = [last-points] up to [rank-max entry].";
		now last-points is rank-max entry + 1;
	if debug-state is true:
		repeat through table of ranks:
			say "[rank-name entry] is <= [rank-max entry] points.";

to say your-rank:
	repeat through table of ranks:
		if core-score <= rank-max entry:
			say "[rank-name entry]";
			continue the action;
	if score is not the core-max:
		say "(bug)";
	else:
		say "gold god";

table of understands
mytxt (topic)	myloc	myrule	myexp
"big" or "bag"	--	got-rig-rag rule	"Yes, the zig zag rig rag could be something else."
"find" or "fault"	--	vault-no-mass rule	"Hmm! That is interesting."
"get" or "good"	Wet Wood	a rule	"You almost felt like you were able to find your way around."
"vine" or "vines"	Vined Vault	--	"Any vines aren't particularly important, here. You need to pay attention to the [if mean mass is in vined vault]mean mass[else]whole vault[end if]."
"wet" or "wood"	Wet Wood	--	"You need to do something like Wet Wood. But it can't be either."

this is the vault-no-mass rule:
	if player is in vined vault and mean mass is off-stage, the rule succeeds;
	the rule fails;

this is the got-rig-rag rule:
	if player has zig zag rig rag, the rule succeeds;
	the rule fails;

volume random tables

table of mall songs
randtxt
"Boy Boss Toy Toss[r], by Soy Sauce Roy Ross"
"Good Gang? Dud, Dang"
"Lo Love Show Shove"
"Mercy Me, Jersey G[r], by Versy V & Percy P"

table of miscellaneous people
randtxt
"Bo, Better Go-Getter"
"Broken-Brain Jokin['] Jane"
"Fart Face Mart Mayes"
"Hunter Hoke, Blunter Bloke"
"Lair Level Daredevil Bear Bevell"
"Madman Chad Chan"
"Madman Tad Tan"
"Not Noble Scott Scoble"
"Pill-Perk Bill Burke"
"Rude Rave Dude Dave"
"Work-Will Kirk Kill"
"Would-Whirl Bud Burrell"

[the taunts below could be something from an enemy as well. I may wish to randomize them later.]
table of vvff digs
randtxt
"Blue blood? Do? Dud! Boo, bud!"
"Catcall: at ALL!"
"Fie! Face my mace!"
"Gonna go off! Shun a show-off!"
"Look leading?! Book beating!"
"'My magic try: TRAGIC!'"
"Rotten role: gotten goal?"
"Try to Fry, Foo[']! Die, do!"
"Want what? Taunt, tut!"
"Whoah! Words? No, nerds!"

table of vvff books
randtxt
"Bank Books, Crank Crooks[r], by Hank Hooks"
"Barge, Banned Large Land"
"Crew Came Grew Game"
"Do, Dare: Woo! Where"
"Fall For Stall Store"
"Fat Farms['] Chat Charms: at Arms"
"Find Fame, Mind, Maim"
"Good Girl Would Whirl"
"Grepping: Groan? STEPPING STONE"
"Hole Hound Bowl Bound"
"Lay Lorn, Way Worn May Morn[r], by Kay Korn" [pay porn?]
"Meet Me Leetly"
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

table of Wet Wood clues
prof	randtxt
False	"You walk around a bit for the first time, and you wind up by a place called the HET HOOD. Homophobia and discrimination aren't cool, and you suspect they are part of the agenda of the Very Vile Fairy File. You wander off and make it back to the Wet Wood."
False	"You walk around some more and run into someone who calls out, 'Fret, frood...' Disheartened, you lose your way, but at least you make it back to the Wet Wood."
False	"You walk around and discover a cabin belonging to someone named Det. Dood, who offers to help you figure how to get out of the Wet Wood for a modest fee. You decline the offer and run back to where you came."
False	"You go and get lost again, but there are no more unique clues in any direction. You can probably wander around again to get the old clues, though."
True	"You walk around and notice a small puddle where a pet peed, then a small mound where ... a pet did something else."

volume hints for later

table of forlaters [SHORTCUT REMINDER: tru.bat makes did-%1 and can-%1 rules]
cmd-to-say	ready-to-hint	can-do-now	is-done	think-advice
"BURY BILE"	false	can-bury-bile rule	did-bury-bile rule	"When you tried to BURY BILE, it didn't feel like the right place. Maybe somewhere else[if Airy Isle is unvisited]. And maybe you need to find the Very Vile Fairy File first[end if]."
"BIG BAG"	false	can-big-bag rule	did-big-bag rule	"You tried to make a BIG BAG from the zig zag rig rag, but it didn't feel right at the time[if Fun Fen is visited]. Maybe it will, now[end if]."
"BEAST BOSS"	false	can-beast-boss rule	did-beast-boss rule	"You tried to summon the Beast Boss [here-in of Creased Cross] but need to try again [once-now of can-beast-boss rule] you can."
"FLIM FLAM"	false	can-flim-flam rule	did-flim-flam rule	"You tried to [if skim-not-flim is true]SKIM SCAM[else]FLIM FLAM[end if], but you didn't have the confidence. [if me-minded is true]Now you managed to MIND ME, that may change[else]Part of you still believes you need to FIND FEE, or find a way around finding it[end if]."
"MASH MAP"	false	can-mash-map rule	did-mash-map rule	"You tried to [if bash-not-mash is true]BASH BAP[else]MASH MAP[end if], [if grit-grown is true]and maybe now you were able to GROW GRIT, it will work[else]but sadly, you still believe it is the only thing that could help you through, and you don't have the guts[end if]."
"FEEL FEAR"	false	can-feel-fear rule	did-feel-fear rule	"You tried to FEEL FEAR [here-in of Real Rear], but [once-now of can-feel-fear rule] you have help from above, you could."
"DEAL DEAR"	false	can-deal-dear rule	did-deal-dear rule	"You tried to say DEAL DEAR [here-in of Real Rear], which will work [once-now of can-deal-dear rule] you have something you need to deal with."
"SHOW SHIELD"	false	can-show-shield rule	did-show-shield rule	"You'll want to SHOW SHIELD [once-now of can-show-shield rule] you've found something that can protect you in the Foe Field."
"MORAL MAGE"	false	can-moral-mage rule	did-moral-mage rule	"You tried to find the MORAL MAGE, but you couldn't open the coral cage yet."
"FIRST FAVE"	false	can-first-fave rule	did-first-fave rule	"You could say FIRST FAVE once/now the screaming skull is gone."
"SHINING SHORE"	false	can-shining-shore rule	did-shining-shore rule	"You can make the SHINING SHORE once/now you dealt with the Whining War."
"FIT FOUND"	false	can-fit-found rule	did-fit-found rule	"You can declare a FIT FOUND [once-now of can-fit-found rule] you've gotten rid of the Hit Hound."
"LEAST LOSS"	false	can-least-loss rule	did-least-loss rule	"You could say LEAST LOSS once/now you have something to face ..." [heres of Creased Cross ??]
"HEAL HERE"	false	can-heal-here rule	did-heal-here rule	"You tried to HEAL HERE [here-in of Real Rear], which will be handy [once-now of can-deal-dear rule] you need to heal from something."
"FULL FEAST"	false	can-full-feast rule	did-full-feast rule	"You could make the Bull Beast a full feast once/now it's been vanquished."
"GOT GORED"	false	can-got-gored rule	did-got-gored rule	"The battle cry GOT GORED [once-now of can-got-gored rule] you have a full army and its leader."
"MERRY MILE"	false	can-merry-mile rule	did-merry-mile rule	"You can call for a MERRY MILE [once-now of can-merry-mile rule] things have calmed down."
"CAST CAP"	false	can-cast-cap rule	did-cast-cap rule	"You can CAST CAP once you find one."

[xx4l8r]

this is the did-beast-boss rule:
	if Bull Beast is not off-stage, the rule succeeds;
	the rule fails.

this is the can-beast-boss rule:
	if score > 32, the rule succeeds; [?? very bad]
	the rule fails.

this is the can-big-bag rule:
	if Fun Fen is visited, the rule succeeds;
	the rule fails.

this is the did-big-bag rule:
	if player has big bag, the rule succeeds;
	the rule fails.

this is the can-bury-bile rule:
	if well worn hell horn is moot, the rule succeeds;
	the rule fails.

this is the did-bury-bile rule:
	if bile-buried is true, the rule succeeds;
	the rule fails. [this isn't needed for gameplay, but if it's absent, a +1 will remain at game's end if you BURY BILE earlier]

this is the did-cast-cap rule:
	if cool cap is moot, the rule succeeds;
	the rule fails.

this is the can-cast-cap rule:
	if player has cool cap, the rule succeeds;
	the rule fails.

this is the did-deal-dear rule:
	if cage key is not off-stage, the rule succeeds;
	the rule fails.

this is the can-deal-dear rule:
	if felt-fear is true, the rule succeeds;
	the rule fails.

this is the did-feel-fear rule:
	if felt-fear is true, the rule succeeds;
	the rule fails.

this is the can-feel-fear rule:
	if knelt-yet is true, the rule succeeds;
	the rule fails.

this is the can-first-fave rule:
	if screaming skull is moot, the rule succeeds;
	the rule fails.

this is the did-first-fave rule:
	if worst wave is moot, the rule succeeds;
	the rule fails.

this is the can-fit-found rule:
	if Hit Hound is moot, the rule succeeds;
	the rule fails.

this is the did-fit-found rule:
	if found-fit is true, the rule succeeds;
	the rule fails.

this is the did-flim-flam rule:
	if Fun Fen is visited, the rule succeeds;
	the rule fails.

this is the can-flim-flam rule:
	if me-minded is true, the rule succeeds;
	the rule fails.

this is the did-full-feast rule:
	if Bull Beast is moot, the rule succeeds;
	the rule fails.

this is the can-full-feast rule:
	if cull-ceased is true, the rule succeeds;
	the rule fails.

this is the did-got-gored rule:
	if Bot Board is moot, the rule succeeds;
	the rule fails.

this is the can-got-gored rule:
	if Lot Lord is in Airy Isle and Hot Horde is in Airy Isle, the rule succeeds;
	the rule fails.

this is the did-heal-here rule:
	if healed-here is true, the rule succeeds;
	the rule fails.

this is the can-heal-here rule:
	if least-loss is true, the rule succeeds;
	the rule fails.

this is the can-least-loss rule:
	if Bull Beast is in Creased Cross, the rule succeeds;
	the rule fails.

this is the did-least-loss rule:
	if least-loss is true, the rule succeeds;
	the rule fails.

this is the did-mash-map rule:
	if Trim Tram is visited, the rule succeeds;
	the rule fails.

this is the can-mash-map rule:
	if grit-grown is true, the rule succeeds;
	the rule fails.

this is the can-merry-mile rule:
	if well worn hell horn is moot, the rule succeeds;
	the rule fails.

this is the did-merry-mile rule:
	if merry-mile is true, the rule succeeds;
	the rule fails.

this is the did-moral-mage rule:
	if coral cage is moot, the rule succeeds;
	the rule fails.

this is the can-moral-mage rule:
	if player has cage key, the rule succeeds;
	the rule fails.

this is the can-shining-shore rule:
	if beer bull is moot, the rule succeeds;
	the rule fails.

this is the did-shining-shore rule:
	if shore-shine is true, the rule succeeds;
	the rule fails.

this is the can-show-shield rule:
	if player has gold guard, the rule succeeds;
	the rule fails.

this is the did-show-shield rule:
	if shield-shown is true, the rule succeeds;
	the rule fails.

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
