	object_const_def
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUIDE

BlackthornGym1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .Tiles

.Tiles:
	checkflag ENGINE_RISINGBADGE
	iffalse .Check1
	changeblock  2,  4, $2d
	setevent EVENT_BLACKTHORN_GYM_BUTTON_1
	setevent EVENT_BLACKTHORN_GYM_BUTTON_2
	setevent EVENT_BLACKTHORN_GYM_BUTTON_3
.Check1:
	checkevent EVENT_BLACKTHORN_GYM_BUTTON_1 ; downstairs button
	iffalse .Check2
	changeblock  2,  6, $2d
.Check2:
	checkevent EVENT_BLACKTHORN_GYM_BUTTON_2 ; upstairs button 1
	iffalse .Check3
	changeblock  4,  8, $20
	changeblock  6,  8, $2d
	changeblock  8,  8, $2d
.Check3:
	checkevent EVENT_BLACKTHORN_GYM_BUTTON_3 ; upstairs button 2
	iffalse .End
	changeblock  6,  2, $2d
	changeblock  6,  4, $18
.End:
	endcallback

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	setevent EVENT_BLACKTHORN_GYM_BUTTON_1
	setevent EVENT_BLACKTHORN_GYM_BUTTON_2
	setevent EVENT_BLACKTHORN_GYM_BUTTON_3
	opentext
	writetext ClairAfterBattleText
	waitbutton
	setflag ENGINE_RISINGBADGE
	playsound SFX_GET_BADGE
	waitsfx
	writetext ReceivedRisingBadgeText
	promptbutton
	writetext RisingBadgeExplanationText
	waitbutton
	scall FX
	changeblock  2,  4, $2d
	reloadmappart
	
.GiveTM24:
	writetext GiveTM24Text
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	promptbutton

.GotTM24:
	writetext BlackthornGymClairFinalText
	waitbutton
	closetext
	end
	
.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iffalse .GiveTM24
	sjump .GotTM24
	
.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuideWinScript
	writetext BlackthornGymGuideText
	waitbutton
	closetext
	end

.BlackthornGymGuideWinScript:
	writetext BlackthornGymGuideWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	jumpstd GymStatue2Script
	
BlackthornGym1FButton:
	opentext
	writetext BlackthornGymButtonText
	checkevent EVENT_BLACKTHORN_GYM_BUTTON_1
	iftrue .AlreadyPressed
	yesorno
	iffalse .End
	setevent EVENT_BLACKTHORN_GYM_BUTTON_1
	scall FX
	changeblock  2,  6, $2d
	reloadmappart
	writetext BlackthornGym1FButtonPressText
	waitbutton
	
.End:
	closetext
	end
	
.AlreadyPressed:
	yesorno
	iffalse .End
	clearevent EVENT_BLACKTHORN_GYM_BUTTON_1
	scall FX
	changeblock  2,  6, $18
	reloadmappart
	writetext BlackthornGym1FButtonPressText
	waitbutton
	closetext
	end
	
FX:
	playsound SFX_PUSH_BUTTON
	earthquake 30
	end

ClairIntroText:
	text "I am CLAIR."

	para "Dragon #MON bow"
	line "before my will."
	
	para "Dare you to"
	line "confront such"
	cont "power?"
	
	para "Such majesty?"

	para "Do you understand"
	line "what you're"
	
	para "getting yourself"
	line "into, child?"

	para "…Very well."
	line "Let's do it!"

	para "As a GYM LEADER,"
	line "I will use my full"

	para "power against any"
	line "opponent!"
	done

ClairWinText:
	text "I lost?!"
	line "You're something"
	cont "special."
	done

ClairAfterBattleText:
	text "I'm simply not"
	line "used to these"
	
	para "restrictions the"
	line "LEAGUE put on me."
	
	para "I used to be the"
	line "strongest GYM"
	
	para "LEADER in JOHTO,"
	line "but now I'm being"
	
	para "made to stifle my"
	line "power."
	
	para "…Nevertheless, you"
	line "defeated me."
	
	para "The reason why is"
	line "irrelevant."
	
	para "Because you won,"
	line "you deserve this:"
	cont "the RISINGBADGE!"
	done
	
ReceivedRisingBadgeText:
	text "<PLAYER> received"
	line "RISINGBADGE."
	done
	
RisingBadgeExplanationText:
	text "RISINGBADGE will"
	line "cause #MON up"
	
	para "to L30 to obey"
	line "you, even if they"
	cont "were traded."
	done
	
GiveTM24Text:
	text "Oh, also, you've"
	line "earned this."
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "You've kept me"
	line "waiting!"

	para "Here! Take this!"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> received"
	line "TM24 DRAGONBREATH."
	done

BlackthornGymClairText_DescribeTM24:
	text "That contains"
	line "DRAGONBREATH."

	para "No, it doesn't"
	line "have anything to"
	cont "do with my breath."

	para "If you don't want"
	line "it, you don't have"
	cont "to take it."
	done

BlackthornGymClairText_BagFull:
	text "What is this? You"
	line "don't have room?"
	done

BlackthornGymClairFinalText:
	text "Congratulations on"
	line "winning a BADGE,"
	
	para "but your journey"
	line "has only just"
	cont "begun."
	
	para "From here, travel"
	line "through the ICE"
	
	para "PATH and make your"
	line "way to MAHOGANY."
	
	para "I wish you luck,"
	line "<PLAYER>."
	done

CooltrainermPaulSeenText:
	text "Let me show you"
	line "the true power of"
	cont "dragon #MON!"
	done

CooltrainermPaulBeatenText:
	text "My dragon #MON"
	line "lost?"
	done

CooltrainermPaulAfterBattleText:
	text "You're good, but"
	line "there's no way"
	
	para "you'll be able to"
	line "beat CLAIR!"
	done

CooltrainerfLolaSeenText:
	text "Dragons are sacred"
	line "#MON."

	para "They are full of"
	line "life energy."

	para "If you're not"
	line "serious, you won't"

	para "be able to beat"
	line "them."
	done

CooltrainerfLolaBeatenText:
	text "Way to go!"
	done

CooltrainerfLolaAfterBattleText:
	text "I'll let you in on"
	line "a secret."
	
	para "Dragons are weak"
	line "to dragon-type"
	cont "moves."
	done

BlackthornGymGuideText:
	text "Yo! CHAMP in"
	line "making!"

	para "Welcome to your"
	line "first GYM!"

	para "CLAIR uses the"
	line "mythical and"
	
	para "sacred dragon-type"
	line "#MON."

	para "They resist your"
	line "tried-and-true"
	
	para "types, like fire,"
	line "water, grass, and"
	cont "electric."

	para "But you know,"
	line "they're supposed"

	para "to be weak against"
	line "ice-type moves."
	done

BlackthornGymGuideWinText:
	text "You were great in"
	line "your battle"
	cont "against CLAIR!"

	para "Now that you have"
	line "your first BADGE,"
	
	para "it's time to go"
	line "win more."

	para "You're on the way"
	line "to becoming the"
	cont "#MON CHAMPION!"
	done
	
BlackthornGymButtonText:
	text "There's a button"
	line "hidden inside this"
	cont "dragon statue!"
	
	para "Press it?"
	done
	
BlackthornGym1FButtonPressText:
	text "<PLAYER> pressed"
	line "the button!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 15, BLACKTHORN_CITY, 1
	warp_event  7, 15, BLACKTHORN_CITY, 1
	warp_event  7,  7, BLACKTHORN_GYM_2F, 2
	warp_event  9,  3, BLACKTHORN_GYM_2F, 1
	warp_event  8,  7, BLACKTHORN_GYM_2F, 3
	warp_event 10,  3, BLACKTHORN_GYM_2F, 4

	def_coord_events

	def_bg_events
	bg_event  5, 13, BGEVENT_READ, BlackthornGymStatue
	bg_event  8, 13, BGEVENT_READ, BlackthornGymStatue
	bg_event  2,  8, BGEVENT_READ, BlackthornGym1FButton

	def_object_events
	object_event  4,  2, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermPaul, -1
	object_event 11,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfLola, -1
	object_event  9, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuideScript, -1
