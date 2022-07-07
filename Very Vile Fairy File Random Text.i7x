Version 1/220706 of Very Vile Fairy File Random Text by Andrew Schultz begins here.

"These are the random text tables for auxiliary amusing stuff in VVFF."

volume random table code

to decide which number is next-rand-row of (t - a table name):
	say "a.";
	choose row with tabnam of t in table of all randoms;
	let last-row be tabidx entry;
	let cur-row be tabidx entry;
	let this-max-row be number of rows in tabnam entry;
	let has-cycle be whether or not there is a cycle-note entry;
	increment cur-row;
	while cur-row is not last-row:
		say "b.";
		if cur-row > this-max-row:
			if debug-state is true, say "(Cycling) ";
			if has-cycle is true:
				decide on 0;
			else:
				now cur-row is 1;
		say "c.";
		if blue-bleah is false, decide on cur-row;
		choose row cur-row in t;
		if there is a prof entry and prof entry is true:
			increment cur-row;
			next;
		decide on cur-row;

to next-rand (t - a table name):
	let nr be next-rand-row of t;
	choose row with tabnam of t in table of all randoms;
	now tabidx entry is nr;
	let lb be whether or not lbrk entry is true;
	if nr is 0: [this means there is a cycle-note entry]
		say "[cycle-note entry][if lb is true][line break][else][no line break][end if]";
		continue the action;
	choose row nr in t;
	say "[randtxt entry][if lb is true][line break][else][no line break][end if]";

to say next-rand-txt of (t - a table name):
	next-rand t;

volume big meta table

table of all randoms
tabnam	tabidx	lbrk	thru-yet	desc	cycle-note
table of library books	0	false	0	"Books in the Lending Libe"	"The final book is [b]Pish-Posh Mish-Mosh[r] by Tish Tausch, which lives down to its title. That's enough text digested for one adventure."
table of mall shops	0	false	0	"Mystery Mall fake shops"	"Well Wail Sell Sale, from a store whose profits probably fell (FAIL)"
table of mall songs	0	false	0	"Songs after Tim T Sims"	"Oh man, this one's really good! [b]Tip Top Hip Hop[r]! You stay until you hear the playlist, um, flip flop."
table of miscellaneous people	0	false	0	"Assorted randos in [fussed]"	"Hazy Hairy Lazy Larry, who ends the list with a whimper."
table of motivational books	0	false	0	"Motivational books [we whine] negs"	"Go-Get-Low Lit[r], its predecessor in nasty advice."
table of poems	0	false	0	"Poems the Pain Peasant says"	"Done, dude. Run? RUDE!"
table of silly locations	0	false	0	"Assorted random locations around Y'Old Yard"	"clues you'll never make it to Worthwhile Birth-Bile Earth Isle."
table of vvff digs	0	false	0	"Insults in the VVFF"	"The final entry reads, simply, 'Stare-y style, chary chile[']![r]'[paragraph break]It's the last one. A vicious slam book, indeed. Yet you feel pulled to looking at it again, instead of dispelling it once and for all."

volume random tables

table of library books [xxbooks] [xxlibe] [xxlibrary]
randtxt	prof
"Hell, Heaven: Sell Seven[r], by Belle Bevin"	true
"Spot Spice, Not Nice Lot Lice[r], by Trot Trice"
"Stall STAT, Fall Flat[r], by Paul Platt"
"Bad Ban, Madman[r], by Chad Chan and Tad Tan"
"Dandy Dane's Candy Canes[r], by Mandy Maines"
"Queequeg's Key Kegs[r], by Lee Leggs"
"Rick Roll? Sick Soul[r], by Dick Dole"
"Fold, Fall, Bold Ball: Cold Call Sold Saul"
"Locksley Mocks Me"
"Feel Fright, Wheelwright"
"Mate Maury's Straight Stories"
"Glowing Glitter, Knowing Knitter"
"Say, Slummer, Pay Plumber"
"Less-Leet Chess Cheat"
"Sick, Say? Pick, Pay, Hick--Hey[r], by Rick Ray"
"Bane, Bones, Stain Stones[r], by Jane Jones"
"Bank Books, Crank Crooks[r], by Hank Hooks"
"Barge, Banned Large Land"
"Been Back: Men Mack When Wack, by Ren Rack and Len Lack"
"Born, Battered, Torn, Tattered, Shorn, Shattered"
"Briny Brims Tiny Tim's Whiny Whims"
"Bumpkin, Buy Pumpkin Pie"
"Car Curst Far First[r], by Gar Gerst"
"Cropping Crews['] Shopping Shoes"
"Dandy Dyin['] Sandy, Sighin[r], by Randy Ryan"
"Dare, Dream, Stare, Stream[r], by Bear Bream"
"Do Dance, Poo Pants[r], by Lou Lance and Stu Stantz"
"Do, Dare: Woo! Where"
"Duel Down, Cruel Crown"
"Dust Devils['] Lust Levels"
"Fall for Stall Store"
"Fat Farms['] Chat Charms at Arms"
"Find Fame, Mind, Maim"
"Fly Phat Spy Spat"
"Good Girl Would Whirl"
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
"Kill Car, Still Star"
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
"Nosy Nan, Dozy Dan[r], by Rosie Rann"
"[']Nuff Nerd Stuff Stirred"
"Numb Nude Dumb Dude"
"Oh, Trait So Straight"
"Oh, Uh, Lola[r], by Nona Sosa-Doda"
"One Wet Sunset"
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

table of mall shops [xxshops] [xxmalls] [xxstores]
randtxt
"Bold Bud's Doled Duds"
"Cold Crude Bold Brewed"
"Musty Mike's Trusty Trikes"
"Pork Pie Stork Sty"
"There-They-Wear Way"
"Trench Tries French Fries"

table of mall songs [xxsongs]
randtxt	prof
"Pole Perching, Soul Searching"
"Tasked: Ten Masked Men"
"Drooler Drew's Crueler Crews"
"Heigh-Ho, I Owe"
"Swift Sweep Lift Leap"
"Mesh, Mend, Fresh Friend"
"Be Bop: See, Sop"
"Beatbox Fleet Flocks"
"Big Bang Gig Gang[r], by Sig Sang"
"Blue Blood Crew? Crud"
"Boy Boss Toy Toss[r], by Soy Sauce Roy Ross"
"Clear Classed Beer Blast"
"Deal Dope?! Heal! Hope!" [puncok]
"Doom Doc's Boom-Box Room Rocks"
"Eh, Un-Gay Gun"	true
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
"Mercy Me, Jersey G[r], by Versy V & Percy P" [capsok]
"My, Mo['] Sly, Slow"
"Old, Rude, Cold, Crude"
"Pay, Pow, Hey, How"
"Start, Stay, Heart, Hey"
"Stern Stable Turn Table"
"War Whistles, More Missiles"
"Will Woo [']Til Two"
"You'll Yell Woo Well"

table of miscellaneous people [xxpeople] [xxbadguy]
randtxt
"Tweet-Too-Sweet Sue"
"Toll Taxin['] Joel Jackson"
"Bad-Back Mad Mack"
"Whole Haxin['] Joel Jackson"
"Seek-So-Meek Moe"
"Guy Guess-My-Mess"
"Lich Liker Rich Riker"
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

table of motivational books [xxmotivational]
randtxt
"hark honey: mark money"
"Ache or Make More: Lake Lore"
"Crew Came Grew Game"
"Gain Goals, Sane Souls"
"Good Guys Would: Wise"
"Lad Lit: Bad Bit Had Hit"
"Near Null Fearful"
"One Wise Son Sighs: RUN, RISE"
"Sell So Well, Whoah"

table of poems
randtxt
"Grow grace, bro! Brace!"
"Oft, Ol['] Soft Soul."
"You, your show, sure!"

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
"Nice-Nail Vice Vale"
"Numb Gnomes['] Dumb Domes"
"Terse Tale Verse Vale"
"Whee-Will-He Hill"
"Fight-for-Flight Floor"
"Hill Here-Still-Steer"

[the taunts below could be something from an enemy as well. I may wish to randomize them later.]
table of vvff digs [xxtaunts] [xxdigs] [xxmean]
randtxt	prof
"Mend, my friend? FRY!"
"Bad bid, cad kid!"
"Blue blood? Do? Dud! Boo, bud!"
"Bud, bug? Dud, dig!"
"But, but?! Tut, tut!"
"Catcall: at ALL!"
"Dark day! Hark, hey!"
"Fie! Face my mace!"
"Fry, freak-guy(?)-geek!"	true
"Geek, get weak wit!"
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

Very Vile Fairy File Random Text ends here.

---- DOCUMENTATION ----
