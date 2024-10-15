	object_const_def
	const ROUTE39BARN_MOOMOO
	const ROUTE39BARN_MILTANK2
	const ROUTE39BARN_BEEDRILL1
	const ROUTE39BARN_BEEDRILL2
	const ROUTE39BARN_BEEDRILL3
	const ROUTE39BARN_BEEDRILL4
	const ROUTE39BARN_BEEDRILL5
	const ROUTE39BARN_HIVE
	const ROUTE39BARN_POKEBALL

Route39Barn_MapScripts:
	def_scene_scripts
	scene_script .DummyScene1 ; SCENE_ROUTE_39_BARN_NOTHING
	scene_script .BeesMusic ; SCENE_ROUTE_39_BARN_BEES

	def_callbacks

.DummyScene1
	end

.BeesMusic
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .End
	playmusic MUSIC_ROCKET_BATTLE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
.End
	end

Route39BarnMoomooScript:
	opentext
	writetext Route39BarnMoomooText1
	cry MILTANK
	waitbutton
	writetext Route39BarnMoomooText2
	waitbutton
	closetext
	end

Route39BarnMiltankScript:
	opentext
	writetext Route39BarnMiltankText
	cry MILTANK
	waitbutton
	closetext
	end
	
Route39BarnGenericBeedrillScript:
	opentext
	writetext Route39BarnBeedrillText
	cry BEEDRILL
	waitbutton
	closetext
	end
	
Route39BarnBeedrill1Script:
	opentext
	writetext Route39BarnRedBeedrillCryText
	cry BEEDRILL
	waitbutton
	writetext Route39BarnRedBeedrillFightText
	waitbutton
	closetext
	loadwildmon BEEDRILL, 15
	startbattle
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	disappear ROUTE39BARN_BEEDRILL1
	reloadmapafterbattle
	end	

Route39BarnBeedrill2Script:
	opentext
	writetext Route39BarnRedBeedrillCryText
	cry BEEDRILL
	waitbutton
	writetext Route39BarnRedBeedrillFightText
	waitbutton
	closetext
	loadwildmon BEEDRILL, 20
	startbattle
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	disappear ROUTE39BARN_BEEDRILL2
	reloadmapafterbattle
	end	

Route39BarnBeedrill3Script:
	opentext
	writetext Route39BarnRedBeedrillCryText
	cry BEEDRILL
	waitbutton
	writetext Route39BarnRedBeedrillFightText
	waitbutton
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	loadwildmon BEEDRILL, 25
	startbattle
	disappear ROUTE39BARN_BEEDRILL3
	setscene SCENE_ROUTE_39_BARN_NOTHING
	reloadmapafterbattle
	end	

Route39BarnHiveScript:
	opentext
	writetext Route39BarnHiveText
	waitbutton
	closetext
	end

Route39BarnPoisonBarb:
	itemball POISON_BARB

Route39BarnMoomooText1:
	text "MILTANK: Moo…moo…"
	done
	
Route39BarnMoomooText2:
	text "This old MILTANK"
	line "is weak and frail,"
	
	para "but she still"
	line "seems happy to"
	cont "see you."
	done

Route39BarnMiltankText:
	text "MILTANK: Mooo!"
	done

Route39BarnBeedrillText:
	text "BEEDRILL: Bzzzz…"
	done
	
Route39BarnRedBeedrillCryText:
	text "BEEDRILL: BZZZZ!"
	done
	
Route39BarnRedBeedrillFightText:
	text "The BEEDRILL be-"
	line "comes aggressive"
	
	para "as you move closer"
	line "toward its hive."
	
	para "<……>"
	
	para "It wants to fight!"
	done

Route39BarnHiveText:
	text "With the defeat of"
	line "their leader, much"
	
	para "of the colony is"
	line "already leaving."
	
	para "Someone experi-"
	line "enced could"
	
	para "probably remove"
	line "this hive now."
	done

Route39Barn_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_39, 1
	warp_event  4,  7, ROUTE_39, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  6, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnMoomooScript, -1
	object_event  2,  2, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnMiltankScript, -1
	object_event  3,  3, SPRITE_PARAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route39BarnBeedrill1Script, EVENT_ROUTE_39_BARN_BEEDRILL1_TOGGLE
	object_event  0,  2, SPRITE_PARAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route39BarnBeedrill2Script, EVENT_ROUTE_39_BARN_BEEDRILL2_TOGGLE
	object_event  2,  1, SPRITE_PARAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route39BarnBeedrill3Script, EVENT_ROUTE_39_BARN_BEEDRILL3_TOGGLE
	object_event  3,  2, SPRITE_PARAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route39BarnGenericBeedrillScript, EVENT_ROUTE_39_BEES_TOGGLE
	object_event  1,  2, SPRITE_PARAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route39BarnGenericBeedrillScript, EVENT_ROUTE_39_BEES_TOGGLE
	object_event  2,  0, SPRITE_HIVE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnHiveScript, EVENT_ROUTE_39_BEES_TOGGLE
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route39BarnPoisonBarb, EVENT_ROUTE_39_BARN_POISON_BARB
	