	object_const_def
	const ECRUTEAKTINTOWERENTRANCE_SAGE1
	const ECRUTEAKTINTOWERENTRANCE_SAGE2
	const ECRUTEAKTINTOWERENTRANCE_SAGE3
	const ECRUTEAKTINTOWERENTRANCE_GRAMPS

EcruteakTinTowerEntrance_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .CheckBeasts

.DummyScene0:
	end

.DummyScene1:
	end

.CheckBeasts:
	checkevent EVENT_FOUGHT_DOGS
	iffalse .Block
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE1, 18, 7
	turnobject ECRUTEAKTINTOWERENTRANCE_SAGE1, DOWN
	
.Block:
	endcallback

EcruteakTinTowerEntranceSage1Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	checkitem RAINBOW_WING
	iftrue .GoToTop
	checkevent EVENT_FOUGHT_DOGS
	iftrue .FoughtDogsMovedAlready
	checkevent EVENT_FOUGHT_SUICUNE
	iffalse .Default
	checkevent EVENT_FOUGHT_ENTEI
	iffalse .Default
	checkevent EVENT_FOUGHT_RAIKOU
	iffalse .Default
	setevent EVENT_FOUGHT_DOGS
	writetext EcruteakTinTowerEntranceSage1FoughtDogsText
	waitbutton
	closetext
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE1, EcruteakTinTowerEntranceSage1Movement
	end
	
.Default:
	writetext EcruteakTinTowerEntranceSage1LegendaryBeastsText
	sjump .WaitEnd

.FoughtDogsMovedAlready:
	writetext EcruteakTinTowerEntranceSage1FoughtDogsMovedAlreadyText
	sjump .WaitEnd

.GoToTop:
	writetext EcruteakTinTowerEntranceSage1GoToTopText
	sjump .WaitEnd
	
.FoughtHoOh:
	writetext EcruteakTinTowerEntranceSage1FoughtHoOhText

.WaitEnd:
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceSage1Movement:
	step UP
	turn_head DOWN
	step_end

EcruteakTinTowerEntranceSage2Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	writetext EcruteakTinTowerEntranceSage2Text
	waitbutton
	closetext
	end

.FoughtHoOh:
	writetext EcruteakTinTowerEntranceSage2FoughtHoOhText
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceSage3Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	writetext EcruteakTinTowerEntranceSage3Text
	waitbutton
	closetext
	end

.FoughtHoOh:
	writetext EcruteakTinTowerEntranceSage3FoughtHoOhText
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceGrampsScript:
	jumptextfaceplayer EcruteakTinTowerEntranceGrampsText

EcruteakTinTowerEntranceSage1LegendaryBeastsText:
	text "I cannot allow you"
	line "to pass, young"
	cont "one."
	
	para "Not only is the"
	line "tower a most holy"

	para "place, but its"
	line "constant swaying"
	
	para "makes it quite"
	line "dangerous."
	
	para "Traditionally, any"
	line "outsider who"
	
	para "wished to visit"
	line "the tower proper"
	
	para "was required to"
	line "receive the bless-"
	
	para "ings of the three"
	line "legendary beasts."
	done

EcruteakTinTowerEntranceSage1FoughtDogsText:
	text "You actually did"
	line "it, didn't you?"
	
	para "I can tell just"
	line "from the confi-"
	
	para "dence in your"
	line "stride."
	
	para "Nary a soul has"
	line "seen those dogs in"
	
	para "five years, but"
	line "you were able to"
	cont "seek them out."
	
	para "You may climb the"
	line "tower if you"
	
	para "desire, but know"
	line "that the great"
	
	para "HO-OH has not"
	line "roosted atop it"
	cont "in many moons."
	
	para "Perhaps if you"
	line "were able to find"
	
	para "a remnant of it,"
	line "however…"
	done

EcruteakTinTowerEntranceSage1FoughtDogsMovedAlreadyText:
	text "You may climb the"
	line "tower if you"
	
	para "desire, but know"
	line "that the great"
	
	para "HO-OH has not"
	line "roosted atop it"
	cont "in many moons."
	
	para "Perhaps if you"
	line "were able to find"
	
	para "a remnant of it,"
	line "however…"
	done

EcruteakTinTowerEntranceSage1GoToTopText:
	text "That… do you hold"
	line "the RAINBOW WING?"
	
	para "Behold how it"
	line "scatters the light"
	
	para "into hundreds of"
	line "colors!"
	
	para "This is a feather"
	line "fallen from HO-OH,"
	cont "no doubt!"
	
	para "Quickly, make your"
	line "way to the top of"
	cont "the tower!"
	done

EcruteakTinTowerEntranceSage1FoughtHoOhText:
	text "I saw your battle"
	line "from here."
	
	para "Simply marvelous!"
	
	para "I had not laid"
	line "eyes on that won-"
	
	para "drous creature in"
	line "quite some time."
	
	para "Thank you for"
	line "allowing the"
	
	para "people of ECRUTEAK"
	line "to witness such"
	cont "splendor again."
	done

EcruteakTinTowerEntranceSage2Text:
	text "This place has"
	line "much history that"
	
	para "must be safe-"
	line "guarded."
	
	para "This is our duty"
	line "as the WISE TRIO."
	done
	
EcruteakTinTowerEntranceSage2FoughtHoOhText:
	text "The long history"
	line "of this tower"
	cont "continues to grow!"
	done

EcruteakTinTowerEntranceSage3Text:
	text "One as young as"
	line "yourself should"
	
	para "not climb the"
	line "tower."
	
	para "You are likely to"
	line "be hurt…"
	cont "…or killed!"
	done
	
EcruteakTinTowerEntranceSage3FoughtHoOhText:
	text "You have"
	line "prevailed!"
	
	para "I apologize for"
	line "ever doubting your"
	cont "skill."
	done

EcruteakTinTowerEntranceGrampsText:
	text "Two towers…"
	line "Two #MON…"

	para "But when one"
	line "burned down, both"

	para "#MON flew away,"
	line "never to return."
	done

EcruteakTinTowerEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 3
	warp_event  5, 17, ECRUTEAK_CITY, 3
	warp_event 19,  8, ECRUTEAK_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 18,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSage1Script, -1
	object_event 17,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSage2Script, -1
	object_event 16,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSage3Script, -1
	object_event  4,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceGrampsScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
