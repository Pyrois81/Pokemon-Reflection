	object_const_def
	const ROCKETTOWEROUTSIDE_STANDING_YOUNGSTER
	const ROCKETTOWEROUTSIDE_BEAUTY
	const ROCKETTOWEROUTSIDE_SAILOR
	const ROCKETTOWEROUTSIDE_LASS

RocketTowerOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .Callback1
	callback MAPCALLBACK_OBJECTS, .Callback2

.Callback1:
	endcallback

.Callback2:
	clearevent EVENT_ROCKET_TOWER_OUTSIDE_SAILOR
	endcallback

RocketTowerOutsideYoungsterScript:
	jumptextfaceplayer RocketTowerOutsideYoungsterText

RocketTowerOutsideBeautyScript:
	jumptextfaceplayer RocketTowerOutsideBeautyText

RocketTowerOutsideSailorScript:
	jumptextfaceplayer RocketTowerOutsideSailorText

RocketTowerOutsideSign:
	jumptext RocketTowerOutsideSignText

RocketTowerOutsideYoungsterText_NotYetOpen: ; unreferenced
	text "Wow, the BATTLE"
	line "TOWER is huge! My"

	para "neck is tired from"
	line "looking up at it."
	done

RocketTowerOutsideYoungsterText_Mobile: ; unreferenced
	text "Wow, the BATTLE"
	line "TOWER is huge!"

	para "Since there are a"
	line "whole bunch of"

	para "trainers inside,"
	line "there must also be"

	para "a wide variety of"
	line "#MON."
	done

RocketTowerOutsideYoungsterText:
	text "Wow, the BATTLE"
	line "TOWER is huge!"

	para "There must be many"
	line "kinds of #MON"
	cont "in there!"
	done

RocketTowerOutsideBeautyText_NotYetOpen: ; unreferenced
	text "What on earth do"
	line "they do here?"

	para "If the name says"
	line "anything, I guess"

	para "it must be for"
	line "#MON battles."
	done

RocketTowerOutsideBeautyText:
	text "You can use only"
	line "three #MON."

	para "It's so hard to"
	line "decide which three"

	para "should go into"
	line "battle…"
	done

RocketTowerOutsideSailorText_Mobile: ; unreferenced
	text "Ehehehe…"
	line "I sneaked out of"
	cont "work to come here."

	para "I'm never giving"
	line "up until I become"
	cont "a LEADER!"
	done

RocketTowerOutsideSailorText:
	text "Hehehe, I snuck"
	line "out from work."

	para "I can't bail out"
	line "until I've won!"

	para "I have to win it"
	line "all. That I must!"
	done

RocketTowerOutsideSignText_NotYetOpen: ; unreferenced
; originally shown when the Battle Tower was closed
	text "BATTLE TOWER"
	done

RocketTowerOutsideSignText:
	text "BATTLE TOWER"

	para "Take the Ultimate"
	line "Trainer Challenge!"
	done

RocketTowerOutsideText_DoorsClosed: ; unreferenced
; originally shown when the Battle Tower was closed
	text "The BATTLE TOWER's"
	line "doors are closed…"
	done

RocketTowerOutsideText_DoorsOpen: ; unreferenced
; originally shown after the Battle Tower opened
	text "It's open!"
	done

RocketTowerOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 21, ROUTE_40_ROCKET_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_ROCKET_TOWER_GATE, 4
	warp_event  8,  9, ROCKET_TOWER_1F, 1
	warp_event  9,  9, ROCKET_TOWER_1F, 2

	def_coord_events

	def_bg_events
	bg_event 10, 10, BGEVENT_READ, RocketTowerOutsideSign

	def_object_events
	object_event  6, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RocketTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RocketTowerOutsideBeautyScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketTowerOutsideSailorScript, EVENT_ROCKET_TOWER_OUTSIDE_SAILOR
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
