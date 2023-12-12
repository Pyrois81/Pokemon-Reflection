	object_const_def
	const BLACKTHORNGYM2F_COOLTRAINER_M
	const BLACKTHORNGYM2F_COOLTRAINER_F

BlackthornGym2F_MapScripts:
	def_scene_scripts

	def_callbacks

BlackthornGym2FButton1:
	opentext
	writetext BlackthornGymButtonText
	checkevent EVENT_BLACKTHORN_GYM_BUTTON_2
	iftrue .AlreadyPressed
	yesorno
	iffalse .End
	setevent EVENT_BLACKTHORN_GYM_BUTTON_2
	scall BlackthornGymButtonFX
	writetext BlackthornGym2FButtonPressText
	waitbutton
	
.End:
	closetext
	end
	
.AlreadyPressed:
	yesorno
	iffalse .End
	clearevent EVENT_BLACKTHORN_GYM_BUTTON_2
	scall BlackthornGymButtonFX
	writetext BlackthornGym2FButtonPressText
	waitbutton
	closetext
	end
	
BlackthornGym2FButton2:
	opentext
	writetext BlackthornGymButtonText
	checkevent EVENT_BLACKTHORN_GYM_BUTTON_3
	iftrue .AlreadyPressed
	yesorno
	iffalse .End
	setevent EVENT_BLACKTHORN_GYM_BUTTON_3
	scall BlackthornGymButtonFX
	writetext BlackthornGym2FButtonPressText
	waitbutton
	
.End:
	closetext
	end
	
.AlreadyPressed:
	yesorno
	iffalse .End
	clearevent EVENT_BLACKTHORN_GYM_BUTTON_3
	scall BlackthornGymButtonFX
	writetext BlackthornGym2FButtonPressText
	waitbutton
	closetext
	end

; already defined in BlackthornGym1F
;BlackthornGymButtonFX:
;	playsound SFX_PUSH_BUTTON
;	earthquake 30
;	end

TrainerCooltrainermCody:
	trainer COOLTRAINERM, CODY, EVENT_BEAT_COOLTRAINERM_CODY, CooltrainermCodySeenText, CooltrainermCodyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermCodyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfFran:
	trainer COOLTRAINERF, FRAN, EVENT_BEAT_COOLTRAINERF_FRAN, CooltrainerfFranSeenText, CooltrainerfFranBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfFranAfterBattleText
	waitbutton
	closetext
	end

CooltrainermCodySeenText:
	text "It's not as if we"
	line "all use dragon-"
	cont "type #MON."
	done

CooltrainermCodyBeatenText:
	text "Rats! If only I"
	line "had a dragon!"
	done

CooltrainermCodyAfterBattleText:
	text "Members of our"
	line "dragon-user clan"

	para "can use dragon"
	line "#MON only after"

	para "our MASTER deems"
	line "them worthy."
	done

CooltrainerfFranSeenText:
	text "I can't allow some"
	line "no-name trainer"
	cont "to get past me!"

	para "CLAIR would be"
	line "livid if I did!"
	done

CooltrainerfFranBeatenText:
	text "Awww… I lost…"
	done

CooltrainerfFranAfterBattleText:
	text "Uh-oh… CLAIR is"
	line "going to hate me…"
	done
	
; already defined in BlackthornGym1F
;BlackthornGymButtonText:
;	text "There's a button"
;	line "hidden inside this"
;	cont "dragon statue!"
;	
;	para "Press it?"
;	done
	
BlackthornGym2FButtonPressText:
	text "<PLAYER> pressed"
	line "the button!"
	
	para "Sounded like there"
	line "was a rumble"
	cont "downstairs."
	done

BlackthornGym2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  1, BLACKTHORN_GYM_1F, 4
	warp_event  5,  9, BLACKTHORN_GYM_1F, 3
	warp_event  7,  1, BLACKTHORN_GYM_1F, 6
	warp_event  2,  2, BLACKTHORN_GYM_1F, 6
	warp_event  4,  3, BLACKTHORN_GYM_1F, 6
	warp_event  6,  3, BLACKTHORN_GYM_1F, 6
	warp_event  7,  3, BLACKTHORN_GYM_1F, 6
	warp_event  3,  4, BLACKTHORN_GYM_1F, 5
	warp_event  0,  6, BLACKTHORN_GYM_1F, 5
	warp_event  3,  7, BLACKTHORN_GYM_1F, 5
	warp_event  1,  8, BLACKTHORN_GYM_1F, 5
	warp_event  2,  8, BLACKTHORN_GYM_1F, 5
	warp_event  7,  9, BLACKTHORN_GYM_1F, 5											

	def_coord_events

	def_bg_events
	bg_event  0,  4, BGEVENT_READ, BlackthornGym2FButton1
	bg_event  7,  4, BGEVENT_READ, BlackthornGym2FButton2

	def_object_events
	object_event  6,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermCody, -1
	object_event  3,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfFran, -1
