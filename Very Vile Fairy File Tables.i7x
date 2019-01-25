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

table of ranks
rank-max	rank-name
--	"bold bod"
12	"sold sod"
16	"mold-mod"
20	"trolled, trod"
24	"cold cod"
28	"old, odd"
32	"rolled, rah'd"
4	"lol'd, lawd"
8	"told, taw'd"

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
