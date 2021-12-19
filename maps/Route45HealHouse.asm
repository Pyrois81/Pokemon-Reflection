	object_const_def
	const ROUTE45HEALHOUSE_GRANNY

Route45HealHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route45HealHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_MET_ROUTE_45_HEAL_HOUSE_GRANNY
	iftrue .DoHeal
	writetext Route45HealHouseGrannyIntroText
	waitbutton
	setevent EVENT_MET_ROUTE_45_HEAL_HOUSE_GRANNY
	
.DoHeal
	writetext Route45HealHouseBeforeHealText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext Route45HealHouseAfterHealText
	waitbutton
	closetext
	end

Route45HealHouseMagazines:
	jumpstd MagazineBookshelfScript
	
Route45HealHouseDrawers:
	jumptext DrawersText
	
Route45HealHouseGrannyIntroText:
	text "I had this house"
	line "built so that I"
	
	para "could spend my old"
	line "age somewhere"
	cont "beautiful."
	
	para "Oh, you're a young"
	line "trainer, are you?"
	
	para "The road up to"
	line "BLACKTHORN is"
	cont "quite long."
	
	para "If you don't mind"
	line "keeping an old"
	
	para "granny company,"
	line "I'd be happy to"
	
	para "let you recover"
	line "here for a bit."
	done
	
Route45HealHouseBeforeHealText:
	text "Why don'tcha rest"
	line "up for a minute,"
	cont "young'un?"
	done

Route45HealHouseAfterHealText:
	text "There!"
	line "Hale and hearty!"

	para "Come back anytime,"
	line "child."
	done
	
DrawersText:
	text "It's an ornately"
	line "decorated chest"
	cont "of drawers."
	
	para "You probably"
	line "shouldn't open it."
	done

Route45HealHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_45, 2
	warp_event  4,  7, ROUTE_45, 2

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_UP, Route45HealHouseMagazines
	bg_event  7,  1, BGEVENT_UP, Route45HealHouseDrawers

	def_object_events
	object_event  5,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route45HealHouseGrannyScript, -1
