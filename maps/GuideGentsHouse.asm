	object_const_def
	const GUIDEGENTSHOUSE_GRAMPS

GuideGentsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GuideGentsHouseGuideGent:
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMap
	writetext GuideGentIntroText
	yesorno
	iffalse .No
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	promptbutton
	writetext GuideGentPokegearText
	waitbutton
	closetext
	end

.HaveMap:
	writetext GuideGentsHouseGuideGentText
	waitbutton
	closetext
	end
	
.No:
	writetext GuideGentNoText
	waitbutton
	closetext
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAP CARD@"

GuideGentsHouseBookshelf:
	jumpstd MagazineBookshelfScript

GuideGentIntroText:
	text "I used to give"
	line "young trainers"
	
	para "like yourself"
	line "tours of the town."
	
	para "These old bones"
	line "are just too weak"
	cont "now, though."
	
	para "That said, I'd be"
	line "happy to attach a"
	
	para "MAP CARD to your"
	line "#GEAR if you"
	cont "like."
	done

GuideGentsHouseGuideGentText:
	text "When I was a wee"
	line "lad, I was a hot-"
	cont "shot trainer!"

	para "Here's a word of"
	line "advice: Catch lots"
	cont "of #MON!"

	para "Treat them all"
	line "with kindness!"
	done
	
GotMapCardText:
	text "<PLAYER>'s #GEAR"
	line "now has a MAP!"
	done

GuideGentPokegearText:
	text "#GEAR becomes"
	line "more useful as you"
	cont "add CARDS."

	para "I wish you luck on"
	line "your journey!"
	done
	
GuideGentNoText:
	text "Suit yourself."
	
	para "A MAP might come"
	line "in handy, though…"
	done

GuideGentsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 4
	warp_event  3,  7, CHERRYGROVE_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, GuideGentsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, GuideGentsHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GuideGentsHouseGuideGent, -1
