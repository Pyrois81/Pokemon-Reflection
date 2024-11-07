	object_const_def
	const MANIASHOUSE_ROCKER

ManiasHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_METAL_COAT_FROM_MANIA
	iftrue .GotCoat
	checkevent EVENT_MET_MANIA
	iftrue .AlreadyMet
	writetext ManiaText_Intro
	waitbutton
	setevent EVENT_MET_MANIA
.AlreadyMet
	writetext ManiaText_GiveMetalCoat
	promptbutton
	verbosegiveitem METAL_COAT
	iffalse .End
	setevent EVENT_GOT_METAL_COAT_FROM_MANIA
.End
	closetext
	end

.GotCoat
	writetext ManiaText_MetalCoatEvolve
	waitbutton
	closetext
	end

ManiaText_Intro:
	text "AHH!!!"
	
	para "Oh, haha… It's"
	line "just a visitor…"
	
	para "I had some kid"
	line "bust in my door"
	
	para "and steal one of"
	line "my #MON some"
	cont "time ago."
	
	para "And then some"
	line "other kid showed"

	para "up, borrowed my"
	line "darling SHUCKIE,"
	
	para "and never gave him"
	line "back."
	
	para "…I'm still not to-"
	line "tally over it, I"
	cont "guess."

	para "You, on the other"
	line "hand…"
	
	para "You've got kinder"
	line "eyes than either"
	cont "of them did."
	
	para "You exude a quiet"
	line "confidence."
	done

ManiaText_GiveMetalCoat:	
	text "Look, I found this"
	line "weird piece of"
	
	para "metal washed up on"
	line "the beach and it"
	
	para "always makes me"
	line "feel stronger when"
	cont "I hold it."
	
	para "Maybe you and your"
	line "#MON could act-"
	
	para "ually get some use"	
	line "out of it, though."
	
	para "I'd like for you"
	line "to have it!"
	done

ManiaText_MetalCoatEvolve:
	text "The old lady #"
	line "SEER told me that"
	
	para "metal piece can"
	line "make certain #-"
	cont "MON evolve."
	
	para "I've got no idea"
	line "which ones though,"
	cont "sorry…"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
