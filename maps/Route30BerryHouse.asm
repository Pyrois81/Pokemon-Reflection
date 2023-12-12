	object_const_def
	const ROUTE30BERRYHOUSE_POKEFAN_M

Route30BerryHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route30BerryHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_30_BERRY_HOUSE_TM05_ROAR
	iftrue .GotTM
	writetext Route30BerrySpeechHouseBerriesAreGoneText
	promptbutton
	verbosegiveitem TM_ROAR
	iffalse .End
	setevent EVENT_ROUTE_30_BERRY_HOUSE_TM05_ROAR
.GotTM:
	writetext Route30BerrySpeechHouseRoarText
	waitbutton
.End
	closetext
	end

Route30BerryHouseBookshelf:
	jumpstd MagazineBookshelfScript

Route30BerrySpeechHouseBerriesAreGoneText:
	text "I used to be"
	line "rolling in"
	cont "berries."
	
	para "But those pesky"
	line "PIDGEY have been"
	
	para "eating them all"
	line "up lately!"
	
	para "Here, if your"
	line "#MON knew this"
	
	para "move, maybe you"
	line "could scare them"
	cont "off for me."
	done

Route30BerrySpeechHouseRoarText:
	text "ROAR will cause"
	line "#MON to run"
	cont "away."
	done

Route30BerryHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_30, 1
	warp_event  3,  7, ROUTE_30, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, Route30BerryHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route30BerryHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route30BerryHousePokefanMScript, -1
