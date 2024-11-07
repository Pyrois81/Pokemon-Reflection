	object_const_def
	const CIANWOODLUGIASPEECHHOUSE_TEACHER
	const CIANWOODLUGIASPEECHHOUSE_LASS
	const CIANWOODLUGIASPEECHHOUSE_TWIN

CianwoodLugiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodLugiaSpeechHouseTeacherScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTeacherText

CianwoodLugiaSpeechHouseLassScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseLassText

CianwoodLugiaSpeechHouseTwinScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTwinText

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

CianwoodLugiaSpeechHouseTeacherText:
	text "Oh, you came from"
	line "OLIVINE?"

	para "Those islands"
	line "along the way"

	para "are mentioned in"
	line "a lot of JOHTO"
	cont "legends, you know."
	
	para "It's said there's"
	line "a mythical #MON"
	
	para "that lives deep"
	line "within."
	done

CianwoodLugiaSpeechHouseLassText:
	text "Those caves hav-"
	line "en't been explored"
	
	para "very thoroughly,"
	line "mostly because"
	
	para "it's hard to get"
	line "to them."
	
	para "There's no getting"
	line "around those"
	
	para "whirlpools unless"
	line "your #MON knows"
	
	para "a specialized"
	line "move."
	done

CianwoodLugiaSpeechHouseTwinText:
	text "Dangerous whirl-"
	line "pools?"
	
	para "Huge, scary"
	line "#MON?"
	
	para "No thanks. I'm"
	line "perfectly happy"
	
	para "just going to the"
	line "beach."
	done

CianwoodLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 6
	warp_event  3,  7, CIANWOOD_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTeacherScript, -1
	object_event  6,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseLassScript, -1
	object_event  0,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTwinScript, -1
