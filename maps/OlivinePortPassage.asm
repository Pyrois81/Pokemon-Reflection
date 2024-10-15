	object_const_def
	const OLIVINEPORTPASSAGE_POKEFAN_M

OlivinePortPassage_MapScripts:
	def_scene_scripts

	def_callbacks

OlivinePortPassagePokefanMScript:
	jumptextfaceplayer OlivinePortPassagePokefanMText

OlivinePortPassageHiddenRageCandyBar:
	hiddenitem RAGECANDYBAR, EVENT_OLIVINE_PORT_PASSAGE_HIDDEN_RAGECANDYBAR

OlivinePortPassagePokefanMText:
	text "The FAST SHIP"
	line "S.S.AQUA sails"
	
	para "from OLIVINE to"
	line "VERMILION in"
	cont "KANTO."

	para "It's a luxurious"
	line "way to travel!"
	done

OlivinePortPassage_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  0, OLIVINE_CITY, 10
	warp_event 16,  0, OLIVINE_CITY, 11
	warp_event 15,  4, OLIVINE_PORT_PASSAGE, 4
	warp_event  3,  2, OLIVINE_PORT_PASSAGE, 3
	warp_event  3, 14, OLIVINE_PORT, 1

	def_coord_events

	def_bg_events
	bg_event 14, 3, BGEVENT_ITEM, OlivinePortPassageHiddenRageCandyBar

	def_object_events
	object_event 17,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortPassagePokefanMScript, -1
