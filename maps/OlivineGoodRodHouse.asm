	object_const_def
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkflag ENGINE_MINERALBADGE
	iffalse .NoBadge
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotRod
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	promptbutton
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.NoBadge:
	writetext GoodRodGetBadgeText
	waitbutton
	closetext
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotRod:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

OlivineGoodRodHouseBookshelf:
	jumpstd PictureBookshelfScript

GoodRodGetBadgeText:
	text "I'm always lookin'"
	line "for anyone worthy"
	
	para "of carryin' on"
	line "the fine art of"
	cont "anglin'."
	
	para "If you can beat"
	line "our GYM LEADER,"
	cont "JASMINE,"
	
	para "come on back and"
	line "I'll getcha some"
	
	para "nice new equip-"
	line "ment."
	done

OfferGoodRodText:
	text "Ya know, a better"
	line "fishin' ROD can"
	
	para "catch better #-"
	line "MON."
	
	para "I've accumulated a"
	line "bunch of 'em over"
	cont "the years…"
	
	para "How'd you like to"
	line "take one 'a mine"
	cont "as an upgrade?"
	done

GiveGoodRodText:
	text "Hahaha, that's the"
	line "spirit!"
	done

GaveGoodRodText:
	text "Fish can be found"
	line "anywhere there's"
	cont "water."
	
	para "Sometimes ya gotta"
	line "hunt for the ones"
	
	para "ya want, but"
	line "that's part of the"
	cont "fun of angling!"
	done

DontWantGoodRodText:
	text "Sigh…"
	
	para "Seems like the"
	line "younger generation"
	
	para "doesn't share the"
	line "same passion for"
	cont "fishin'…"
	done

HaveGoodRodText:
	text "Catch any big ones"
	line "lately?"
	done

OlivineGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, OlivineGoodRodHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, OlivineGoodRodHouseBookshelf

	def_object_events
	object_event  3,  2, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
