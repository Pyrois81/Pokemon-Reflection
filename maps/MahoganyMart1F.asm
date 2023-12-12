	object_const_def
	const MAHOGANYMART1F_GRANNY

MahoganyMart1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_MAHOGANY_MART_1F_BASEMENT_CLOSED
	scene_script .DummyScene1 ; SCENE_MAHOGANY_MART_1F_NOTHING

	def_callbacks
	callback MAPCALLBACK_TILES, ShowStairs
	
.DummyScene0:
	end
.DummyScene1:
	end

ShowStairs:
	checkscene
	iffalse .End
	changeblock 6, 2, $1e ; stairs
.End:
	endcallback
	
RevealStairs:
	showemote EMOTE_SHOCK, PLAYER, 10
	turnobject PLAYER, LEFT
	applymovement MAHOGANYMART1F_GRANNY, GrannyMovesToButtonMovement
	turnobject PLAYER, UP
	opentext
	writetext MahoganyMart1FGrannyBasementText1
	promptbutton
	playsound SFX_PUSH_BUTTON
	pause 30
	playsound SFX_WALL_OPEN
	changeblock 6, 2, $1e ; stairs
	reloadmappart
	pause 15
	writetext MahoganyMart1FGrannyBasementText2
	waitbutton
	closetext
	applymovement MAHOGANYMART1F_GRANNY, GrannyMovesBackMovement
	setscene SCENE_MAHOGANY_MART_1F_NOTHING
	end	

MahoganyMart1FGrannyScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY
	closetext
	end

GrannyMovesToButtonMovement:
	big_step UP
	big_step UP
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end
	
GrannyMovesBackMovement:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	big_step DOWN
	big_step DOWN
	turn_head RIGHT
	step_end
	
MahoganyMart1FGrannyBasementText1:
	text "Oh, sweetie,"
	line "be careful!"
	
	para "There's a trapdoor"
	line "to the basement"
	cont "in that corner."
	
	para "TEAM ROCKET once"
	line "had a whole secret"
	
	para "base down there,"
	line "but these days we"
	
	para "just use it as"
	line "a storeroom."
	done
	
MahoganyMart1FGrannyBasementText2:
	text "Feel free to take"
	line "anything you find"
	cont "down there."
	
	para "It's mostly stuff"
	line "we couldn't sell,"
	cont "anyway."
	done

MahoganyMart1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, MAHOGANY_TOWN, 1
	warp_event  4,  7, MAHOGANY_TOWN, 1
	warp_event  7,  3, TEAM_ROCKET_BASE_B1F, 1

	def_coord_events
	coord_event 6,  2, SCENE_MAHOGANY_MART_1F_BASEMENT_CLOSED, RevealStairs
	coord_event 6,  3, SCENE_MAHOGANY_MART_1F_BASEMENT_CLOSED, RevealStairs

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMart1FGrannyScript, -1
