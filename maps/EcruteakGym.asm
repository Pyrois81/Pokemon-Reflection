	object_const_def
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_GRANNY1
	const ECRUTEAKGYM_GRANNY2
	const ECRUTEAKGYM_GYM_GUIDE

EcruteakGym_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	setmapscene ECRUTEAK_CITY, SCENE_ECRUTEAKCITY_OLD_MAN_CUTS_TREE

.FightDone:
	checkevent EVENT_ECRUTEAK_GYM_TM50_NIGHTMARE
	iftrue .GotNightmare
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	promptbutton
	verbosegiveitem TM_NIGHTMARE
	iffalse .NoRoomForTM
	setevent EVENT_ECRUTEAK_GYM_TM50_NIGHTMARE
	writetext MortyText_NightmareSpeech
	waitbutton
	closetext
	end

.GotNightmare:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForTM:
	closetext
	end

TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end

TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end

EcruteakGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuideWinScript
	writetext EcruteakGymGuideText
	waitbutton
	closetext
	end

.EcruteakGymGuideWinScript:
	writetext EcruteakGymGuideWinText
	waitbutton
	closetext
	end

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, MORTY, MORTY1
	jumpstd GymStatue2Script

MortyIntroText:
	text "Life…"
	
	para "…and death."
	
	para "We are here for so"
	line "precious little"
	
	para "time, and then we"
	line "pass, leaving our"
	cont "souls behind."
	
	para "Some wander; some"
	line "stay. Some reach"
	
	para "greener pastures,"
	line "while others"
	
	para "fester and become"
	line "malevolent."
	
	para "Can you feel them?"
	line "Perhaps even see"
	cont "them?"
	
	para "These souls re-"
	line "quire a shepherd"
	
	para "to guide them…"
	line "To soothe them."
	
	para "I am that"
	line "shepherd."
	
	para "Can you stand"
	line "before their"
	cont "wrath?"
	
	para "Show me!"
	done

MortyWinLossText:
	text "Astounding! You"
	line "faced the spirits"
	
	para "and came out"
	line "stronger than"
	cont "ever."

	para "This BADGE is"
	line "yours."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> received"
	line "FOGBADGE."
	done

MortyText_FogBadgeSpeech:
	text "By having the FOG-"
	line "BADGE, #MON up"

	para "to L50 will obey"
	line "you without"
	cont "question."

	para "You should also"
	line "take this."
	done

MortyText_NightmareSpeech:
	text "It's NIGHTMARE."
	line "It can only be"
	
	para "used against a"
	line "sleeping #MON,"
	
	para "but it will cause"
	line "them recurring"
	
	para "damage until they"
	line "wake up."
	done

MortyFightDoneText:
	text "The way you"
	line "battled…"
	
	para "You may have what"
	line "it takes to beckon"
	cont "forth HO-OH."
	
	para "There was a time"
	line "when that was my"
	
	para "obsession, but"
	line "I've come to"
	
	para "realize that it's"
	line "not something one"
	
	para "can achieve simply"
	line "by working hard."
	
	para "HO-OH responds to"
	line "a trainer with a"
	
	para "brilliant, burning"
	line "spirit, and I"
	
	para "believe I see that"
	line "spark in you,"
	cont "<PLAYER>."
	done

SageJeffreySeenText:
	text "Getting disori-"
	line "ented yet?"
	
	para "Be sure to keep"
	line "an eye on where"
	cont "you're going!"
	done

SageJeffreyBeatenText:
	text "I feel dizzy…"
	done

SageJeffreyAfterBattleText:
	text "To be honest, even"
	line "I forget how to"
	
	para "get around in here"
	line "sometimes."
	done

SagePingSeenText:
	text "Can you steel your"
	line "nerves against my"
	
	para "ghosts, or will"
	line "they make you"
	cont "faint as well?"
	done

SagePingBeatenText:
	text "You were cool"
	line "and collected."
	done

SagePingAfterBattleText:
	text "Most people run"
	line "away at the mere"
	
	para "sight of a ghost"
	line "#MON."
	done

MediumMarthaSeenText:
	text "Almost there…"
	line "or are you?"
	done

MediumMarthaBeatenText:
	text "Impressive!"
	done

MediumMarthaAfterBattleText:
	text "Hmm, you may"
	line "have a chance"
	cont "after all."
	done

MediumGraceSeenText:
	text "There are many"
	line "tricks in this"
	
	para "place, but I'll"
	line "tell give you a"
	cont "hint if you win."
	done

MediumGraceBeatenText:
	text "Losing, winning…"
	line "They're both part"
	cont "of life."
	done

MediumGraceAfterBattleText:
	text "As long as you"
	line "stay within line"
	
	para "of sight, you"
	line "can't go wrong."
	done

EcruteakGymGuideMortyNotInText:
	text "Welcome to the"
	line "ECRUTEAK GYM!"
	
	para "Unfortunately --"
	line "or maybe fortu-"
	cont "nately for you,"
	
	para "the gym leader,"
	line "MORTY, isn't in."
	
	para "Feel free to take"
	line "a look around,"
	
	para "but be sure to"
	line "watch your step…"
	done

EcruteakGymGuideText:
	text "The ECRUTEAK GYM"
	line "is a den of the"
	cont "paranormal."
	
	para "You'll find pri-"
	line "marily ghost-type"
	
	para "#MON here, so"
	line "you might want to"
	
	para "bring some dark-"
	line "types or even some"
	
	para "ghosts of your"
	line "own."
	
	para "Just keep in mind,"
	line "normal- and"
	
	para "fighting-type"
	line "moves won't get"
	cont "you very far."
	done

EcruteakGymGuideWinText:
	text "Whew, <PLAYER>,"
	line "that was scary!"

	para "I was shaking in"
	line "my boots!"
	done

EcruteakGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 13, ECRUTEAK_GYM,   6 ; Checkpoint 1
	warp_event  0,  1, ECRUTEAK_GYM,  15 ; Checkpoint 2
	warp_event  8,  8, ECRUTEAK_GYM,  23 ; Checkpoint 3
	
	; Lead to CP1
	warp_event  0, 12, ECRUTEAK_GYM, 3 ; 6
	warp_event  0, 13, ECRUTEAK_GYM, 3
	warp_event  3, 10, ECRUTEAK_GYM, 3
	warp_event  3, 11, ECRUTEAK_GYM, 3
	warp_event  6, 10, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  8, 10, ECRUTEAK_GYM, 3
	warp_event  9, 12, ECRUTEAK_GYM, 3
	warp_event  9, 13, ECRUTEAK_GYM, 3
	
	; Lead to CP2
	warp_event  0,  6, ECRUTEAK_GYM, 4 ; 15
	warp_event  0,  7, ECRUTEAK_GYM, 4
	warp_event  4,  0, ECRUTEAK_GYM, 4
	warp_event  4,  3, ECRUTEAK_GYM, 4
	warp_event  4,  8, ECRUTEAK_GYM, 4
	warp_event  4,  9, ECRUTEAK_GYM, 4
	warp_event  7,  6, ECRUTEAK_GYM, 4
	warp_event  7,  7, ECRUTEAK_GYM, 4
	
	; Lead to CP3
	warp_event  4,  1, ECRUTEAK_GYM, 5 ; 23
	warp_event  4,  2, ECRUTEAK_GYM, 5
	warp_event  8,  6, ECRUTEAK_GYM, 5
	warp_event  8,  7, ECRUTEAK_GYM, 5
	warp_event  9,  2, ECRUTEAK_GYM, 5
	warp_event  9,  3, ECRUTEAK_GYM, 5
	warp_event  9, 10, ECRUTEAK_GYM, 5
	
	; Stairs
	warp_event  0, 10, ECRUTEAK_GYM, 31 ; 30
	warp_event  0,  0, ECRUTEAK_GYM, 30
	warp_event  5,  7, ECRUTEAK_GYM, 33
	warp_event  9,  9, ECRUTEAK_GYM, 32
	
	def_coord_events

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, EcruteakGymStatue
	bg_event  8, 15, BGEVENT_READ, EcruteakGymStatue

	def_object_events
	object_event  5,  0, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, EVENT_MORTY_IN_MT_MORTAR
	object_event  1,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, -1
	object_event  1, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSagePing, -1
	object_event  9,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumMartha, -1
	object_event  9, 11, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumGrace, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuideScript, -1
