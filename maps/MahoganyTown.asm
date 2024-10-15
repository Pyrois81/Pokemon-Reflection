	object_const_def
	const MAHOGANYTOWN_GRAMPS
	const MAHOGANYTOWN_LASS
	const MAHOGANYTOWN_POKEBALL

MahoganyTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	endcallback

MahoganyTownGrampsScript:
	jumptextfaceplayer MahoganyTownGrampsText

MahoganyTownLassScript:
	jumptextfaceplayer MahoganyTownLassText

MahoganyTownSign:
	jumptext MahoganyTownSignText

MahoganyGymSign:
	jumptext MahoganyGymSignText

MahoganyTownPokecenterSign:
	jumpstd PokecenterSignScript
	
MahoganyTownMartSign:
	jumpstd MartSignScript

MahoganyTownGrampsText:
	text "That earthquake"
	line "really did a"
	
	para "number on this"
	line "town."
	
	para "It took years for"
	line "things to feel"
	cont "normal again."
	done

MahoganyTownLassText:
	text "The lake to the"
	line "north of here is"
	
	para "beautiful this"
	line "time of year."
	
	para "You should go"
	line "visit!"
	done

MahoganyTownSignText:
	text "MAHOGANY TOWN"

	para "Welcome to the"
	line "Home of the Ninja"
	done

MahoganyGymSignText:
	text "MAHOGANY TOWN"
	line "#MON GYM"
	cont "LEADER: PRYCE"

	para "The Teacher of"
	line "Winter's Harshness"
	done

MahoganyTownPlaytestMonsBall:
	opentext
	readvar VAR_PARTYCOUNT
	ifgreater 1, .NoRoom
	givepoke PICHU, 18
	givepoke RHYHORN, 18
	givepoke HOUNDOUR, 18
	givepoke CLEFFA, 18
	givepoke HOPPIP, 18
	verbosegiveitem HONEY_DROP, 4
	closetext
	disappear MAHOGANYTOWN_POKEBALL
	end
	
.NoRoom:
	writetext PutUpMonsText
	waitbutton
	closetext
	end
	
PutUpMonsText:
	text "go put up all but"
	line "1 of ur mons ya"
	cont "turkey !!!"
	done

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 16,  5, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 10, 10, BGEVENT_READ, MahoganyTownSign
	bg_event 18,  6, BGEVENT_READ, MahoganyGymSign
	bg_event 16, 13, BGEVENT_READ, MahoganyTownPokecenterSign
	bg_event 12,  7, BGEVENT_READ, MahoganyTownMartSign

	def_object_events
	object_event  7, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event 11, 14, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLassScript, -1
	object_event 13, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownPlaytestMonsBall, EVENT_PLAYTEST_MONS
