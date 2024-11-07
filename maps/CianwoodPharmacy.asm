	object_const_def
	const CIANWOODPHARMACY_PHARMACIST

CianwoodPharmacy_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

CianwoodPharmacist:
	faceplayer
	opentext
	checkevent EVENT_MET_PHARMACIST
	iftrue .Mart
	writetext PharmacistIntroText
	waitbutton
	setevent EVENT_MET_PHARMACIST
	closetext
	opentext

.Mart:
	pokemart MARTTYPE_PHARMACY, MART_CIANWOOD
	closetext
	end

CianwoodPharmacyBookshelf:
	jumpstd DifficultBookshelfScript

CianwoodPharmacyItemRack:
	jumptext CianwoodPharmacyItemRackText

PharmacistIntroText:
	text "Welcome in! This"
	line "pharmacy's been"
	
	para "operated by my"
	line "family for over"
	
	para "500 years and"
	line "hopefully it'll be"
	cont "here for 500 more!"
	
	para "We carry all your"
	line "standard #MON"
	
	para "needs, plus some"
	line "custom-made medi-"
	
	para "cines for the"
	line "strongest train-"
	cont "ers."
	
	para "…No, what am I"
	line "saying…"
	
	para "You couldn't"
	line "handle my SECRET-"
	cont "POTION, traveler."
	
	para "My SECRETPOTION"
	line "would kill a"
	
	para "DRAGONITE, let"
	line "alone a MANKEY."
	
	para "So anyway…"
	done

CianwoodPharmacyItemRackText:
	text "The rack contains"
	line "all the usual"
	
	para "items: POTIONS,"
	line "# BALLS, REPEL,"
	
	para "but also some"
	line "dodgy-looking"
	
	para "vitamins and sup-"
	line "plements that may"
	
	para "or may not be gov-"
	line "ernment regulated."
	done

CianwoodPharmacy_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 4
	warp_event  4,  7, CIANWOOD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, CianwoodPharmacyBookshelf
	bg_event  7,  1, BGEVENT_READ, CianwoodPharmacyBookshelf
	bg_event  0,  5, BGEVENT_READ, CianwoodPharmacyItemRack
	bg_event  1,  5, BGEVENT_READ, CianwoodPharmacyItemRack
	bg_event  2,  5, BGEVENT_READ, CianwoodPharmacyItemRack
	bg_event  3,  5, BGEVENT_READ, CianwoodPharmacyItemRack
	bg_event  6,  5, BGEVENT_READ, CianwoodPharmacyItemRack
	bg_event  7,  5, BGEVENT_READ, CianwoodPharmacyItemRack

	def_object_events
	object_event  1,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacist, -1
