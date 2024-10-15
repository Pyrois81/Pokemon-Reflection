	object_const_def
	const OLIVINEISLANDSSPEECHHOUSE_POKEFAN_M
	const OLIVINEISLANDSSPEECHHOUSE_TWIN

OlivineIslandsSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineIslandsSpeechHouseDad:
	jumptextfaceplayer OlivineIslandsSpeechHouseDadText

OlivineIslandsSpeechHouseDaughter:
	jumptextfaceplayer OlivineIslandsSpeechHouseDaughterText

OlivineIslandsSpeechHouseBookshelf2:
	jumpstd PictureBookshelfScript

OlivineIslandsSpeechHouseBookshelf1:
	jumpstd MagazineBookshelfScript

OlivineIslandsSpeechHouseDadText:
	text "To the southwest,"
	line "in the middle of"
	
	para "the sea, there is"
	line "a group of is-"
	cont "lands."
	
	para "People say a terr-"
	line "ifying #MON"
	
	para "makes its home"
	line "there, but that"
	
	para "sounds like a"
	line "bunch of hooey"
	cont "to me."
	done

OlivineIslandsSpeechHouseDaughterText:
	text "If you meet the"
	line "island #MON,"
	
	para "tell it 'hi'"
	line "from me!"
	done

OlivineIslandsSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 5
	warp_event  3,  7, OLIVINE_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, OlivineIslandsSpeechHouseBookshelf1
	bg_event  1,  1, BGEVENT_READ, OlivineIslandsSpeechHouseBookshelf2

	def_object_events
	object_event  2,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineIslandsSpeechHouseDad, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineIslandsSpeechHouseDaughter, -1
