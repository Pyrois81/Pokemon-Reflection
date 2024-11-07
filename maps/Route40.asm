	object_const_def
	const ROUTE40_SWIMMER_GUY1
	const ROUTE40_SWIMMER_GUY2
	const ROUTE40_SWIMMER_GIRL1
	const ROUTE40_SWIMMER_GIRL2
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_LASS1
	const ROUTE40_LASS2
	const ROUTE40_STANDING_YOUNGSTER
	const ROUTE40_ROCK1
	const ROUTE40_ROCK2
	const ROUTE40_ROCK3
	
Route40_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text
	
Route40Lass2Script:
	jumptextfaceplayer Route40Lass2Text
	
Route40PokefanMScript:
	jumptextfaceplayer Route40PokefanMText

Route40StandingYoungsterScript:
	jumptextfaceplayer Route40StandingYoungsterText

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .CheckDay
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.CheckDay:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Monday
	writetext MonicaNotMondayText
	waitbutton	
.done:
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd SmashRockScript

Route40HiddenIron:
	hiddenitem IRON, EVENT_ROUTE_40_HIDDEN_IRON
	
Route40HiddenMaxRepel:
	hiddenitem MAX_REPEL, EVENT_ROUTE_40_HIDDEN_MAX_REPEL

SwimmermSimonSeenText:
	text "Did you stretch"
	line "before getting in"
	cont "the water?"
	done

SwimmermSimonBeatenText:
	text "Oww! Cramp!!"
	done

SwimmermSimonAfterBattleText:
	text "CIANWOOD CITY is"
	line "pretty far."
	
	para "You gotta be in"
	line "good shape to make"
	cont "the trip."
	done

SwimmermRandallSeenText:
	text "Hah, you need your"
	line "#MON's help to"
	cont "cross the water?"
	
	para "Why don'tcha just"
	line "swim? Ya chicken?"
	done

SwimmermRandallBeatenText:
	text "My stamina…"
	done

SwimmermRandallAfterBattleText:
	text "Swimming is fun"
	line "and good for you,"
	
	para "but it does get"
	line "tiring sometimes."
	done

SwimmerfElaineSeenText:
	text "You think you're"
	line "gonna make it to"
	cont "CIANWOOD?"
	
	para "As if!"
	done

SwimmerfElaineBeatenText:
	text "Ooh, I take it"
	line "back!"
	done

SwimmerfElaineAfterBattleText:
	text "I'd still say I'm"
	line "a better swimmer"
	
	para "than you, and you"
	line "can't take that"
	cont "away from me!"
	done

SwimmerfPaulaSeenText:
	text "I'm not as hard-"
	line "core as some of"
	
	para "these other"
	line "swimmers."

	para "I'm hanging onto"
	line "a sea #MON!"
	done

SwimmerfPaulaBeatenText:
	text "Turbulent waters!"
	done

SwimmerfPaulaAfterBattleText:
	text "The ocean is usu-"
	line "ally peaceful this"
	cont "far out."	
	
	para "I can float like"
	line "this all day long."
	done

MeetMonicaText:
	text "MONICA: Well met."
	line "I am MONICA of"
	
	para "Monday, one of the"
	line "WEEK SIBLINGS of"
	
	para "which you have no"
	line "doubt heard."
	done

MonicaGivesGiftText:
	text "Now that we are"
	line "acquainted, I"	
	
	para "would be most"
	line "pleased if you"
	
	para "would accept this"
	line "as a token of our"
	cont "acquaintanceship."
	done

MonicaGaveGiftText:
	text "MONICA: That item"
	line "makes flying-type"
	
	para "moves more power-"
	line "ful."
	
	para "Birds are my best"
	line "friends."

	para "There are many"
	line "birds here at the"
	
	para "beach, and many"
	line "sea creatures for"
	cont "them to eat."
	
	para "I like to watch"
	line "them."
	
	para "Peck. Peck. Peck."
	done

MonicaMondayText:
	text "MONICA: I have"
	line "six siblings."
	
	para "Perhaps it would"
	line "be an enjoyable"
	
	para "diversion to try"
	line "to find them all."
	done

MonicaNotMondayText:
	text "MONICA: Today is"
	line "not Monday."
	
	para "It would be better"
	line "if it were."
	done

Route40PokefanMText:
	text "The old BATTLE"
	line "TOWER is up this"
	cont "way."
	
	para "They shut it down"
	line "a couple years"
	cont "back…"
	
	para "But I swear I hear"
	line "stuff happening"
	
	para "over there from"
	line "time to time."
	done
	
Route40Lass1Text:
	text "CIANWOOD is across"
	line "the sea."
	
	para "You can't quite"
	line "see it from here,"
	cont "though."
	done

Route40Lass2Text:
	text "I'm from SAFFRON,"
	line "but I took the"
	
	para "ship to OLIVINE to"
	line "see the sights and"

	para "soak up the"
	line "atmosphere."

	para "The sand, the"
	line "surf, the wild"
	cont "#MON…"
	
	para "It's a dream!"
	done

Route40StandingYoungsterText:
	text "Sigh…"
	
	para "I wish I could"
	line "take to the open"
	
	para "seas, but none of"
	line "my #MON know"
	
	para "SURF and I've got"
	line "these noodles"
	cont "for arms."
	
	para "Someday…"
	done

Route40SignText:
	text "ROUTE 40"

	para "OLIVINE CITY -"
	line "CIANWOOD CITY"
	
	para "WHIRL ISLANDS"
	line "EN ROUTE"
	done

Route40_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, ROUTE_40_ROCKET_TOWER_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 13,  9, BGEVENT_READ, Route40Sign
	bg_event  4,  8, BGEVENT_ITEM, Route40HiddenIron
	bg_event  2, 31, BGEVENT_ITEM, Route40HiddenMaxRepel

	def_object_events
	object_event 11, 19, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event  6, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermRandall, -1
	object_event  3, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerSwimmerfElaine, -1
	object_event 15, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfPaula, -1
	object_event 14,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MonicaScript, -1
	object_event 10,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 14, 11, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event  8,  9, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40Lass2Script, -1
	object_event  9, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40StandingYoungsterScript, -1
	object_event  7, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  4,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  5,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	