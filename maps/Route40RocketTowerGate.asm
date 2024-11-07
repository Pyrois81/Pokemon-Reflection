	object_const_def
	const ROUTE_40_ROCKET_TOWER_GATE_ROCKET1
	const ROUTE_40_ROCKET_TOWER_GATE_ROCKET2
	const ROUTE_40_ROCKET_TOWER_GATE_ROCKER

Route40RocketTowerGate_MapScripts:
	def_scene_scripts
	scene_script .Rockets ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks

.DummyScene1:
	end
	
.Rockets:
	sdefer .KickOut
	end
	
.KickOut:
	playmusic MUSIC_ROCKET_HIDEOUT
	applymovement ROUTE_40_ROCKET_TOWER_GATE_ROCKET1, Route40RocketTowerGateRocketApproachMovement
	opentext
	writetext Route40RocketTowerGateRocketGetOutText
	waitbutton
	closetext
	applymovement ROUTE_40_ROCKET_TOWER_GATE_ROCKET1, Route40RocketTowerGateRocketKicksYouOutMovement
	warp ROUTE_40, 9, 6
	playsound SFX_ENTER_DOOR
	end

Route40RocketTowerGateRockerScript:
	jumptextfaceplayer Route40RocketTowerGateRockerText

Route40RocketTowerGateRocketApproachMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

Route40RocketTowerGateRocketKicksYouOutMovement:
	fix_facing
	big_step DOWN
	big_step UP
	remove_fixed_facing
	step_end

Route40RocketTowerGateRocketGetOutText:
	text "Whoa-ho-ho, bub!"
	
	para "No entry! There's"
	line "important stuff"
	
	para "happenin' past"
	line "here that's above"
	
	para "yer pay grade, if"
	line "ya catch my drift."
	
	para "Come to think of"
	line "it, it's above my"
	cont "pay grade, too."
	
	para "<……><……>"
	
	para "Ah, whatever."
	line "Kick rocks!!"
	done

Route40RocketTowerGateRockerText:
	text "Geez, can you be-"
	line "lieve TEAM ROCKET"
	
	para "had taken over the"
	line "old tower?"
	
	para "Whoever took them"
	line "out must've been"
	cont "mega strong!"
	
	para "I bet they brought"
	line "in the ELITE FOUR"
	
	para "to take care of"
	line "it."
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
	object_event  7,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCKET_TOWER_ROCKETS_TOGGLE
	object_event  2,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCKET_TOWER_ROCKETS_TOGGLE
	object_event  4,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40RocketTowerGateRockerScript, EVENT_ROUTE_40_ROCKET_TOWER_GATE_ROCKER_TOGGLE
