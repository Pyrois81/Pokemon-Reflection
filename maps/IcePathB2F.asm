	object_const_def
	const ICE_PATH_B2F_ARTICUNO

IcePathB2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Articuno

.Articuno:
	checkevent EVENT_FOUGHT_ARTICUNO
	iftrue .NoAppear
	
.Appear:
	appear ICE_PATH_B2F_ARTICUNO
	endcallback

.NoAppear:
	disappear ICE_PATH_B2F_ARTICUNO
	endcallback

Articuno:
	faceplayer
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	setevent EVENT_FOUGHT_ARTICUNO
	loadvar VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon ARTICUNO, 75
	startbattle
	disappear ICE_PATH_B2F_ARTICUNO
	reloadmapafterbattle
	end

ArticunoText:
	text "Kyaaa!"
	done

IcePathB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ICE_PATH_B1F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Articuno, EVENT_ICE_PATH_B2F_ARTICUNO
