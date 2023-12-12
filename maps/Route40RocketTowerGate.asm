	object_const_def
	const ROUTE40ROCKETTOWERGATE_ROCKER
	const ROUTE40ROCKETTOWERGATE_TWIN

Route40RocketTowerGate_MapScripts:
	def_scene_scripts

	def_callbacks


Route40RocketTowerGateRockerScript:
	jumptextfaceplayer Route40RocketTowerGateRockerText

Route40RocketTowerGateTwinScript:
	jumptextfaceplayer Route40RocketTowerGateTwinText

Route40RocketTowerGateUnusedText1: ; unreferenced
	text "Did you come to"
	line "see the BATTLE"
	cont "TOWER too?"

	para "But I guess you"
	line "can't go in yet."
	done

Route40RocketTowerGateUnusedText2: ; unreferenced
	text "BATTLE TOWER has"
	line "opened."

	para "I want to go, but"
	line "I haven't thought"

	para "up a cool line for"
	line "when I win."
	done

Route40RocketTowerGateRockerText:
	text "Are you going to"
	line "the BATTLE TOWER?"

	para "This is a secret,"
	line "but if you win a"

	para "whole lot, you can"
	line "win special gifts."
	done

Route40RocketTowerGateUnusedText3: ; unreferenced
	text "I'm going to train"
	line "my #MON so I'll"

	para "be all ready for"
	line "the BATTLE TOWER."
	done

Route40RocketTowerGateTwinText:
	text "The levels of the"
	line "#MON I want to"

	para "use are all"
	line "different."

	para "I have to go train"
	line "them now!"
	done

Route40RocketTowerGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, ROCKET_TOWER_OUTSIDE, 1
	warp_event  5,  0, ROCKET_TOWER_OUTSIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40RocketTowerGateRockerScript, EVENT_ROCKET_TOWER_OUTSIDE_SAILOR
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40RocketTowerGateTwinScript, -1
