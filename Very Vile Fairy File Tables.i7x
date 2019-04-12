Version 1/181108 of Very Vile Fairy File Tables by Andrew Schultz begins here.

"This is divided into 3 volumes: the tables, the core code and the big meta table. It is roughly copied from Ailihphilia. Ctrl-end for meta table. The core code is about a page long, so you can go ctrl-end page-up for that."

volume core tables

[pest post / messed most / rest roast/ guest ghost / best boast]
table of bad locs
e1	e2	been-here	fake-name	death-trap
--	--	false	"Mo Main Low Lane"	"You walk along, feeling sure you will go gain so sane. But you are utterly surprised to find someone offering you ... cocaine. You just say no, but it is not heroic enough. When you aren't looking, you are enveloped by the horrid Bro Brain."
Airy Isle	down	false	"Happy Hall"	"Man! You could use some cheer right now. The hall is spacious at first until you ... need to start crawling. You realize what this means."
fun fen	west	false	"Bold [']n Brave"	"Boom! Golden Grave!" [?? this is a bad place to put it but I want to test a sign with 2 entries]
fun fen	east	false	"Fate Farm"	"Boom! Hate, harm!"
fun fen	south	false	"Faun Fen"	"Boy, the faun fen seems relaxing! Unfortunately, as you begin to waltz through, you suffer horrible tauntin['] and conkin[']." [?? another bad place]
Gassed Gap	east	false	"Done Dune"	"Blam! A gun goon appears out of nowhere and mows you down."
Soft Sand	up	false	"Hopping Hills"	"Boy! You could use some funky music right now. There is some, but there's also someone who offers you some drugs to enhance the music. You eventually find yourself forgetting about your mission and POPPING PILLS and, more speciously, drinking very bad alcohol from (brain) STOPPING STILLS."
Vending Vibe	west	false	"Fortune Funnel"	"Boy oh boy! It would be neat to have fortune, you think as you walk. But it's also a bit hot...well, very hot... and you realize you've run into the TORCHIN' TUNNEL."
Whining War	south	false	"Fast Foi'd"	"Apparently, you do not get to fast-foward. Well, you sort of do, but not to a good end. The last thing you see as you realize you can't breathe is a ... vast void."
Whining War	north	false	"Done Dune"	"It doesn't seem like a place you should shun soon ... until you run into a GUN GOON."

table of ranks
rank-max	rank-name
0	"cold cod"
7	"lol'd, lawd" [this is defined because I want to trigger a rank gain at the Fun Fen]
--	"FLOL'd, flawed" [false laugh out loud]
--	"old, awed"
--	"holed, hawed"
--	"bowled, bah'd"
--	"sold sod"
--	"old, odd"
--	"told, tawed" [tawed = when an animal hide is beaten]
--	"th'old thawed"
--	"polled, pawed"
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
mytxt (topic)	myloc	myexp
"get" or "good"	wet wood	"You almost felt like you were able to find your way around."
"wet" or "wood"	wet wood	"You need to do something like wet wood. But it can't be either."

volume random tables

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

table of vvff digs
randtxt
"Catcall: at ALL!"
"Gonna go off! Shun a show-off!"
"Look leading?! Book beating!"
"'My magic try: TRAGIC!'"
"Rotten role: gotten goal?"
"Want what? Taunt, tut!"

table of vvff books
randtxt
"Barge, Banned Large Land"
"Crew Came Grew Game"
"Fall For Stall Store"
"Fat Farms['] Chat Charms: at Arms"
"Find Fame, Mind, Maim"
"Grepping: Groan? STEPPING STONE"
"Hole Hound Bowl Bound"
"Lay Lorn, Way Worn May Morn, by Kay Korn" [pay porn?]
"Meet Me Leetly"
"Must Mean Just Gene"
"My Man? Fie, Fan"
"Nag? No: Brag, Bro"
"Near Null Fearful"
"One Wet Sunset"
"So Seek Crow Creek"
"Take Tess, Wake Wes, Make Mess"
"Why When My Men, by Ben"

table of wet wood clues
prof	randtxt
False	"You walk around a bit for the first time, and you wind up by a place called the HET HOOD. Homophobia and discrimination aren't cool, and you suspect they are part of the agenda of the Very Vile Fairy File. You wander off and make it back to the Wet Wood."
False	"You walk around some more and run into someone who calls out, 'Fret, frood...' Disheartened, you lose your way, but at least you make it back to the Wet Wood."
False	"You walk around and discover a cabin belonging to someone named Det. Dood, who offers to help you figure how to get out of the Wet Wood for a modest fee. You decline the offer and run back to where you came."
False	"You go and get lost again, but there are no more unique clues in any direction. You can probably wander around again to get the old clues, though."
True	"You walk around and notice a small puddle where a pet peed, then a small mound where ... a pet did something else."

volume hints for later

table of forlaters
cmd-to-say	ready-to-hint	can-do-now	is-done	think-advice
"BURY BILE"	false	can-bury-bile rule	did-bury-bile rule	"When you tried to BURY BILE, it didn't feel like the right place. Maybe somewhere else[if airy isle is unvisited]. And maybe you need to find the Very Vile Fairy File first[end if]."
"BIG BAG"	false	can-big-bag rule	did-big-bag rule	"You tried to make a BIG BAG from the zig zag rig rag, but it didn't feel right at the time[if Fun Fen is visited]. Maybe it will, now[end if]."
"FLIM FLAM"	false	can-flim-flam rule	did-flim-flam rule	"You tried to FLIM FLAM, but you didn't have the confidence. [if me-minded is true]Now you managed to MIND ME, that may change[else]Part of you still believes you need to FIND FEE[end if]."
"MASH MAP"	false	can-mash-map rule	did-mash-map rule	"You tried to MASH MAP, [if grit-grown is true]and maybe now you were able to GROW GRIT, it will work[else]but sadly, you still believe it is the only thing that could help you through, and you don't have the guts[end if]."
"FEEL FEAR"	false	can-feel-fear rule	did-feel-fear rule	"You try to feel fear, but you can't think of a reason to, and even if you could, you might be overwhelmed without help from above."
"DEAL DEAR"	false	can-deal-dear rule	did-deal-dear rule	"You don't have anything you need to deal with, yet."
"HEAL HERE"	false	can-heal-here rule	did-heal-here rule	"You don't have anything you need to heal from, yet." [?? (heres of r-a room) ]
"SHOW SHIELD"	false	can-show-shield rule	did-show-shield rule	"You'll want to SHOW SHIELD once you find something that can protect you in the Foe Field."
"MORAL MAGE"	false	can-moral-mage rule	did-moral-mage rule	"You tried to find the MORAL MAGE, but you couldn't open the coral cage yet."
"FIRST FAVE"	false	can-first-fave rule	did-first-fave rule	"You could say FIRST FAVE once/now the screaming skull is gone."
"SHINING SHORE"	false	can-shining-shore rule	did-shining-shore rule	"You can make the SHINING SHORE once/now you dealt with the Whining War."
"FULL FEAST"	false	can-full-feast rule	did-full-feast rule	"You could make the bull beast a full feast once/now it's been vanquished."
"CAST CAP"	false	can-cast-cap rule	did-cast-cap rule	"You can CAST CAP once you find one."

this is the can-bury-bile rule:
	if well worn hell horn is moot, the rule succeeds;
	the rule fails.

this is the did-bury-bile rule: the rule fails. [this probably won't change, but just for posterity...]

this is the can-big-bag rule:
	if fun fen is visited, the rule succeeds;
	the rule fails.

this is the did-big-bag rule:
	if player has big bag, the rule succeeds;
	the rule fails.

this is the can-flim-flam rule:
	if me-minded is true, the rule succeeds;
	the rule fails.

this is the did-flim-flam rule:
	if fun fen is visited, the rule succeeds;
	the rule fails.

this is the can-mash-map rule:
	if grit-grown is true, the rule succeeds;
	the rule fails.

this is the did-mash-map rule:
	if Trim Tram is visited, the rule succeeds;
	the rule fails.

this is the can-feel-fear rule:
	if knelt-yet is true, the rule succeeds;
	the rule fails.

this is the did-feel-fear rule:
	if felt-fear is true, the rule succeeds;
	the rule fails.

this is the can-deal-dear rule:
	if felt-fear is true, the rule succeeds;
	the rule fails.

this is the did-deal-dear rule:
	if cage's key is not off-stage, the rule succeeds;
	the rule fails.

this is the can-heal-here rule: [?? obviously needs to be fleshed out]
	the rule fails.

this is the did-heal-here rule:
	if healed-here is true, the rule succeeds;
	the rule fails.

this is the can-show-shield rule:
	if player has gold guard, the rule succeeds;
	the rule fails.

this is the did-show-shield rule:
	if shield-shown is true, the rule succeeds;
	the rule fails.

this is the did-moral-mage rule:
	if coral cage is moot, the rule succeeds;
	the rule fails.

this is the can-moral-mage rule:
	if player has cage's key, the rule succeeds;
	the rule fails.

this is the did-first-fave rule:
	if worst wave is moot, the rule succeeds;
	the rule fails.

this is the can-first-fave rule:
	if screaming skull is moot, the rule succeeds;
	the rule fails.

this is the can-shining-shore rule:
	if beer bull is moot, the rule succeeds;
	the rule fails.

this is the did-shining-shore rule:
	if shore-shine is true, the rule succeeds;
	the rule fails.

this is the did-full-feast rule:
	if bull beast is moot, the rule succeeds;
	the rule fails.

this is the can-full-feast rule:
	if least-loss is true, the rule succeeds;
	the rule fails.

this is the can-cast-cap rule:
	if player has cool cap, the rule succeeds;
	the rule fails.

this is the did-cast-cap rule:
	if cool cap is moot, the rule succeeds;
	the rule fails.

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
	else if mean mass is in vined vault:
		say "FIND FAULT wasn't spelled quite the same as VINED VAULT. In fact, FIND had fewer letters than VINED. So maybe you just need to change a different number of letters again.";
	else if player is in vined vault:
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
table of miscellaneous people	0	false	0	"Assorted randos"	--
table of vvff books	0	false	0	"Books in the Lending Libe"	"Wow! So much to read, so little time. You're up to digesting more text right now, but not quite like that."
table of vvff digs	0	true	0	"Insults in the VVFF"	"The final entry reads, simply, 'Stare-y style, chary chile[']!'[paragraph break]That's all. A vicious slam book, indeed. Yet you feel pulled to looking at it again, instead of dispelling it once and for all."

Very Vile Fairy File Tables ends here.

---- DOCUMENTATION ----
