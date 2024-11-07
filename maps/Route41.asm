	object_const_def
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5
	const ROUTE41_SWIMMER_GUY1
	const ROUTE41_SWIMMER_GUY2
	const ROUTE41_SWIMMER_GUY3
	const ROUTE41_SWIMMER_GUY4
	const ROUTE41_SWIMMER_GUY5
	const ROUTE41_POKE_BALL1
	const ROUTE41_POKE_BALL2
	const ROUTE41_POKE_BALL3
	const ROUTE41_ROCK1
	const ROUTE41_ROCK2
	const ROUTE41_ROCK3
	
Route41_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMatthew:
	trainer SWIMMERM, MATTHEW, EVENT_BEAT_SWIMMERM_MATTHEW, SwimmermMatthewSeenText, SwimmermMatthewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMatthewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock:
	jumpstd SmashRockScript

Route41TMRainDance:
	itemball TM_RAIN_DANCE

Route41BigPearl:
	itemball BIG_PEARL
	
Route41HeavyBall:
	itemball HEAVY_BALL

Route41HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_41_HIDDEN_FULL_RESTORE
	
Route41HiddenWaterStone:
	hiddenitem WATER_STONE, EVENT_ROUTE_41_HIDDEN_WATER_STONE

SwimmermCharlieSeenText:
	text "Hey, you!"
	
	para "You messed up my"
	line "zen state!"
	done

SwimmermCharlieBeatenText:
	text "My apologies…"
	done

SwimmermCharlieAfterBattleText:
	text "I'm training"
	line "treading water for"
	cont "as long as I can."
	
	para "My record is 7"
	line "hours straight!"
	done

SwimmermGeorgeSeenText:
	text "I was taking a"
	line "breather."
	
	para "I'm always game"
	line "for a battle,"
	cont "though!"
	done

SwimmermGeorgeBeatenText:
	text "Pant, pant…"
	done

SwimmermGeorgeAfterBattleText:
	text "I think I'll just"
	line "hang out by this"
	
	para "rock for a little"
	line "while."
	done

SwimmermBerkeSeenText:
	text "Splash fight!!"
	done

SwimmermBerkeBeatenText:
	text "I've got salt"
	line "water in my eyes!"
	done

SwimmermBerkeAfterBattleText:
	text "I can see the"
	line "CIANWOOD shore"
	cont "from here!"
	done

SwimmermKirkSeenText:
	text "I'm swimming laps."
	
	para "Maybe I could"
	line "count a battle as"
	cont "a lap!"
	done

SwimmermKirkBeatenText:
	text "Outpaced!"
	done

SwimmermKirkAfterBattleText:
	text "The scenery here"
	line "makes for a great"
	
	para "swimming spot, but"
	line "sometimes I hear"
	
	para "some spooky sounds"
	line "coming from the"
	cont "caves."
	done

SwimmermMatthewSeenText:
	text "Wanna race?"
	
	para "First one to"
	line "CIANWOOD wins!"
	done

SwimmermMatthewBeatenText:
	text "I got beat before"
	line "I could even"
	cont "begin…"
	done

SwimmermMatthewAfterBattleText:
	text "We're pretty far"
	line "from land, but I"
	cont "like it that way."
	
	para "It's peaceful out"
	line "here."
	done

SwimmerfKayleeSeenText:
	text "Don't wanna"
	line "battle? Too bad!"
	
	para "That's the name of"
	line "the game!"
	done

SwimmerfKayleeBeatenText:
	text "Too cocky…"
	done

SwimmerfKayleeAfterBattleText:
	text "They say there's a"
	line "huge #MON deep"
	
	para "beneath the"
	line "WHIRL ISLANDS."

	para "I wonder what it"
	line "could be?"
	done

SwimmerfSusieSeenText:
	text "Your #MON looks"
	line "to be struggling"
	cont "to carry you."
	
	para "Maybe you should"
	line "give it a break."
	done

SwimmerfSusieBeatenText:
	text "I didn't mean it!"
	done

SwimmerfSusieAfterBattleText:
	text "Sorry, I'm just"
	line "jealous."
	
	para "I wish my #MON"
	line "knew SURF…"
	done

SwimmerfDeniseSeenText:
	text "I can stay out all"
	line "day and not get a"
	cont "sunburn!"
	done

SwimmerfDeniseBeatenText:
	text "Whoa, I got"
	line "toasted!"
	done

SwimmerfDeniseAfterBattleText:
	text "What's my secret?"
	
	para "Ecruteak Essen-"
	line "tials makes this"
	
	para "eco-friendly sun-"
	line "block out of"
	
	para "APRICORNS that you"
	line "have just GOT to"
	cont "try!"
	done

SwimmerfKaraSeenText:
	text "Are you here to"
	line "explore the caves"
	cont "too?"
	done

SwimmerfKaraBeatenText:
	text "You're not an ord-"
	line "inary trainer."
	done

SwimmerfKaraAfterBattleText:
	text "These islands are"
	line "no joke."
	
	para "You apparently"
	line "need a TM to get"
	
	para "rid of those"
	line "whirlpools in"
	
	para "order to even get"
	line "close."
	done

SwimmerfWendySeenText:
	text "STARYU and STARMIE"
	line "float at the"
	
	para "water's surface"
	line "in the twilight"
	
	para "and glow with"
	line "dazzling colors."
	done

SwimmerfWendyBeatenText:
	text "Ah, well…"
	done

SwimmerfWendyAfterBattleText:
	text "STARYU shines with"
	line "yellow light and"
	cont "STARMIE with pink."
	
	para "I bet they could"
	line "light up the in-"
	
	para "sides of the"
	line "caves…"
	
	para "I've heard it's"
	line "pitch black in"
	cont "there!"
	done

Route41_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 15, WHIRL_ISLAND_NW, 1
	warp_event 46, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 43, WHIRL_ISLAND_SW, 1
	warp_event 48, 39, WHIRL_ISLAND_SE, 1

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_ITEM, Route41HiddenFullRestore
	bg_event 38, 25, BGEVENT_ITEM, Route41HiddenWaterStone

	def_object_events
	object_event 49,  5, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfKaylee, -1
	object_event 31, 18, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfSusie, -1
	object_event 11, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 36, 30, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKara, -1
	object_event 27, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfWendy, -1
	object_event 25, 42, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 56, 29, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSwimmermGeorge, -1
	object_event  6, 35, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerSwimmermBerke, -1
	object_event 22,  2, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmermKirk, -1
	object_event 56, 51, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSwimmermMatthew, -1
	object_event 28, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route41TMRainDance, EVENT_ROUTE_41_TM18_RAIN_DANCE
	object_event  9, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route41BigPearl, EVENT_ROUTE_41_BIG_PEARL
	object_event 42, 42, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route41HeavyBall, EVENT_ROUTE_41_HEAVY_BALL
	object_event 10,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route41Rock, -1
	object_event 19, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route41Rock, -1
	