	object_const_def
	const EUSINES_HOUSE_EUSINE

EusinesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EusinesHouseEusineScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .FoughtSuicune
	checkevent EVENT_SAW_SUICUNE_AT_CIANWOOD
	iftrue .SawSuicune
	checkevent EVENT_MET_EUSINE
	iftrue .MetEusine
	writetext EusinesHouseEusineText_Intro
	waitbutton
.MetEusine
	writetext EusinesHouseEusineText_ItsHopeless
	waitbutton
	closetext
	setevent EVENT_MET_EUSINE
	end

.SawSuicune
	writetext EusinesHouseEusineText_SawSuicune
	waitbutton
	closetext
	end

.FoughtSuicune
	writetext EusinesHouseEusineText_FoughtSuicune
	waitbutton
	closetext
	end

EusinesHouseEusineText_Intro:
	text "EUSINE: Ah, an un-"
	line "familiar face!"

	para "You must be a"
	line "trainer on a jour-"
	
	para "ney if you've come"
	line "all the way out to"
	cont "CIANWOOD."
	
	para "Have you heard of"
	line "SUICUNE, the water"
	cont "guardian #MON?"
	
	para "It's incredible…"
	
	para "I bought a house"
	line "out here thinking"
	
	para "I might run into"
	line "it one day."
	
	para "…Well, run into it"
	line "again, I should"
	cont "say."
	
	para "It made an appear-"
	line "ance in this very"
	
	para "town five years"
	line "ago, and I tried"
	
	para "with all my might"
	line "to track it and"
	
	para "understand it"
	line "better."
	
	para "However, that"
	line "child…"
	done
	
EusinesHouseEusineText_ItsHopeless:
	text "He hunted SUICUNE"
	line "to all corners of"
	cont "JOHTO."
	
	para "No one knows for"
	line "sure whether he"
	
	para "killed it or sim-"
	line "ply scared it off"
	
	para "for good, but it"
	line "hasn't been seen"
	cont "since."
	
	para "Don't get your"
	line "hopes up, kid."
	
	para "I've resigned my-"
	line "self to never wit-"
	
	para "nessing its"
	line "majesty again."
	done

EusinesHouseEusineText_SawSuicune:
	text "EUSINE: I still"
	line "can't believe it!"
	
	para "SUICUNE lives!"
	
	para "It can't be a co-"
	line "incidence that it"
	
	para "came back as soon"
	line "as you showed up."
	
	para "I truly think you"
	line "have what it takes"
	
	para "to tame that"
	line "beast!"
	done
	
EusinesHouseEusineText_FoughtSuicune:
	text "EUSINE: Thank you"
	line "for making my"
	
	para "dream come true,"
	line "<PLAYER>."
	
	para "I got to see SUI-"
	line "CUNE up close, got"
	
	para "to study its mark-"
	line "ings, to stroke"
	cont "its mane…"
	
	para "I'll cherish these"
	line "memories forever."
	
	para "I'll tell your"
	line "story to my chil-"
	
	para "dren and then to"
	line "my grandchildren,"
	
	para "and the name"
	line "<PLAYER> shall"
	cont "become legend!"
	done

EusinesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 5
	warp_event  3,  7, CIANWOOD_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EusinesHouseEusineScript, EVENT_EUSINES_HOUSE_EUSINE_TOGGLE
