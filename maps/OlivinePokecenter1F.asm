	object_const_def
	const OLIVINEPOKECENTER1F_NURSE
	const OLIVINEPOKECENTER1F_FISHING_GURU
	const OLIVINEPOKECENTER1F_FISHER
	const OLIVINEPOKECENTER1F_TEACHER

OlivinePokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivinePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

OlivinePokecenter1FFishingGuruScript:
	jumptextfaceplayer OlivinePokecenter1FFishingGuruText

OlivinePokecenter1FFisherScript:
	jumptextfaceplayer OlivinePokecenter1FFisherText

OlivinePokecenter1FTeacherScript:
	jumptextfaceplayer OlivinePokecenter1FTeacherText

OlivinePlaytestEventInitializer:
	jumpstd PlaytestInitializeEvents
	opentext
	writetext OlivinePlaytestInitializeEventsText
	promptbutton
	closetext
	end
	
OlivinePlaytestInitializeEventsText:
	text "Beep boop…"
	
	para "Initialized"
	line "events!"
	done

OlivinePokecenter1FFishingGuruText:
	text "Hey kid, I'll sell"
	line "ya this MAGIKARP I"
	
	para "caught for just"
	line "¥500."
	
	para "<……>"
	
	para "HOHOHO, just"
	line "jokin' around!"
	
	para "Who'd be enough of"
	line "a scumbag to scam"
	cont "someone like that?"
	done

OlivinePokecenter1FFisherText:
	text "All kinds of peo-"
	line "ple come through"
	cont "OLIVINE."
	
	para "It is a major port"
	line "city, after all."
	done

OlivinePokecenter1FTeacherText:
	text "That CHUCK who"
	line "leads the CIANWOOD"
	cont "GYM…"
	
	para "He's so strong…"
	line "and that mustache…"
	
	para "They say he can"
	line "throw boulders"
	
	para "around like"
	line "they're made of"
	cont "paper!"
	done

OlivinePokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, OLIVINE_CITY, 1
	warp_event  4,  7, OLIVINE_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FFishingGuruScript, -1
	object_event  1,  5, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FFisherScript, -1
	object_event  7,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FTeacherScript, -1
	object_event  9,  7, SPRITE_VIRTUAL_BOY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePlaytestEventInitializer, -1
