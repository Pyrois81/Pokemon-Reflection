	object_const_def
	const DARKCAVEB1F_PHARMACIST
	const DARKCAVEB1F_POKE_BALL1
	const DARKCAVEB1F_POKE_BALL2

DarkCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

DarkCaveB1FPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	iftrue .GotBlackglasses
	writetext DarkCaveB1FPharmacistText1
	promptbutton
	verbosegiveitem BLACKGLASSES
	iffalse .PackFull
	setevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
.GotBlackglasses:
	writetext DarkCaveB1FPharmacistText2
	waitbutton
.PackFull:
	closetext
	end

DarkCaveB1FRevive:
	itemball REVIVE

DarkCaveB1FTMSnore:
	itemball TM_SNORE

DarkCaveB1FPharmacistText1:
	text "Whoa! You startled"
	line "me there!"

	para "I had my BLACK-"
	line "GLASSES on, so I"

	para "didn't notice you"
	line "at all."

	para "What am I doing"
	line "here?"

	para "Hey, don't you"
	line "worry about it."

	para "I'll give you a"
	line "pair of BLACK-"
	cont "GLASSES, so forget"
	cont "you saw me, OK?"
	done

DarkCaveB1FPharmacistText2:
	text "BLACKGLASSES ups"
	line "the power of dark-"
	cont "type moves."
	done

DarkCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 25, DARK_CAVE_1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveB1FPharmacistScript, -1
	object_event 21, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveB1FRevive, EVENT_DARK_CAVE_B1F_REVIVE
	object_event  7, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveB1FTMSnore, EVENT_DARK_CAVE_B1F_TM_SNORE
