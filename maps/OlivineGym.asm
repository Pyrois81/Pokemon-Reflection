	object_const_def
	const OLIVINEGYM_GYM_GUIDE
	const OLIVINEGYM_SUPER_NERD
	const OLIVINEGYM_BEAUTY
	const OLIVINEGYM_ROCKER
	const OLIVINEGYM_JASMINE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .OpenGate
	
.OpenGate:
	checkevent EVENT_BEAT_JASMINE
	iffalse .End
	changeblock 8, 10, $45
.End:
	endcallback

OlivineGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWonScript
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWonScript:
	writetext OlivineGymGuideWonText
	waitbutton
	closetext
	end

OlivineGymSuperNerdJacobScript:
	trainer SUPER_NERD, JACOB, EVENT_BEAT_SUPER_NERD_JACOB, SuperNerdJacobSeenText, SuperNerdJacobBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext SuperNerdJacobAfterBattleText
	waitbutton
	closetext
	end

OlivineGymBeautyMelissaScript:
	trainer BEAUTY, MELISSA, EVENT_BEAT_BEAUTY_MELISSA, BeautyMelissaSeenText, BeautyMelissaBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext BeautyMelissaAfterBattleText
	waitbutton
	closetext
	end

OlivineGymGuitaristRidleyScript:
	trainer GUITARIST, RIDLEY, EVENT_BEAT_GUITARIST_RIDLEY, GuitaristRidleySeenText, GuitaristRidleyBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext GuitaristRidleyAfterBattleText
	waitbutton
	closetext
	end

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	checkevent EVENT_SAVED_MOOMOO_FARM
	iffalse .FarmInDanger
	writetext OlivineGymJasmineIntroText
	waitbutton
	closetext
	winlosstext OlivineGymJasmineBeatenText, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext OlivineGymReceivedMineralBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE

.FightDone:
	checkevent EVENT_OLIVINE_GYM_TM47_STEEL_WING
	iftrue .GotSteelWing
	writetext OlivineGymJasmineBadgeText
	promptbutton
	verbosegiveitem TM_STEEL_WING
	iffalse .NoRoomForSteelWing
	setevent EVENT_OLIVINE_GYM_TM47_STEEL_WING
	writetext OlivineGymJasmineSteelWingText
	waitbutton
	writetext OlivineGymJasmineSurfText
	waitbutton
	pause 15
	turnobject OLIVINEGYM_JASMINE, DOWN
	writetext OlivineGymJasmineGateText
	waitbutton
	closetext
	pause 15
	applymovement OLIVINEGYM_ROCKER, OlivineGymRidleyWalksToGateMovement
	pause 15
	playsound SFX_WALL_OPEN
	waitsfx
	changeblock 8, 10, $45
	reloadmappart
	pause 15
	applymovement OLIVINEGYM_ROCKER, OlivineGymRidleyWalksBackMovement	
	setmapscene OLIVINE_CITY, SCENE_OLIVINECITY_RIVAL_FIGHT
	end

.GotSteelWing:
	checkevent EVENT_OLIVINE_LIGHTHOUSE_6F_HM02_SURF
	iffalse .GoToLighthouse
	writetext OlivineGymJasmineGoodLuckText
	waitbutton
.NoRoomForSteelWing:
	closetext
	end

.FarmInDanger:
	writetext OlivineGymJasmineMoomooFarmText
	waitbutton
	closetext
	end
	
.GoToLighthouse:
	writetext OlivineGymJasmineGoToLighthouseText
	waitbutton
	closetext
	end

OlivineGymRidleyWalksToGateMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end
	
OlivineGymRidleyWalksBackMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end
	
OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

OlivineGymGuideText:
	text "This GYM special-"
	line "izes in the pheno-"
	
	para "menal hardness of"
	line "the STEEL and ROCK"
	cont "types."
	
	para "FIGHTING and"
	line "GROUND-types will"

	para "help you to break"
	line "through their"
	cont "defenses."
	done

OlivineGymGuideWonText:
	text "I knew you could"
	line "do it!"
	
	para "With the right"
	line "strategy, even the"
	
	para "strongest defenses"
	line "are surmountable."
	done

SuperNerdJacobSeenText:
	text "Break yourself"
	line "upon my body!"
	done
	
SuperNerdJacobBeatenText:
	text "Ow… I'm the one"
	line "who's broken…"
	done
	
SuperNerdJacobAfterBattleText:
	text "STEEL and ROCK"
	line "types excel in the"
	
	para "defense depart-"
	line "ment."
	
	para "Here's a tip:"
	
	para "Try using SPECIAL"
	line "moves instead of"
	cont "PHYSICAL ones."
	done

BeautyMelissaSeenText:
	text "#MON can be"
	line "sturdy AND cute!"
	
	para "I'll show you!"
	done
	
BeautyMelissaBeatenText:
	text "Nice going!"
	done
	
BeautyMelissaAfterBattleText:
	text "I had a hard time"
	line "getting people to"
	
	para "take me seriously"
	line "as a trainer."
	
	para "That is, until I"
	line "met JASMINE!"
	
	para "She really shows"
	line "that you can't"
	
	para "judge a book by"
	line "its cover."
	done
	
GuitaristRidleySeenText:
	text "Yo, I'm pickin' up"
	line "some interference!"
	done
	
GuitaristRidleyBeatenText:
	text "Yeesh, that's some"
	line "serious feedback."
	done
	
GuitaristRidleyAfterBattleText:
	text "My MAGNETON can"
	line "detect electrical"
	
	para "anomalies from"
	line "super far away."
	
	para "It's amazing, but"
	line "it can get a bit"
	cont "tiresome."
	done

OlivineGymJasmineIntroText:
	text "I am JASMINE."
	
	para "I was one of the"
	line "pioneers of the"
	
	para "STEEL type, and I"
	line "have learned a lot"
	
	para "in the years since"
	line "it was discovered."
	
	para "My #MON are my"
	line "protectors and my"
	cont "best friends."
	
	para "Let me show you"
	line "the level of power"
	
	para "that comes from"
	line "that bond!"
	done

OlivineGymJasmineBeatenText:
	text "Impressive. You"
	line "were able to over-"
	
	para "come the quiet"
	line "tenacity of steel."

	para "In accordance with"
	line "LEAGUE rules, I"

	para "confer upon you"
	line "this BADGE."
	done

OlivineGymReceivedMineralBadgeText:
	text "<PLAYER> received"
	line "MINERALBADGE."
	done

OlivineGymJasmineBadgeText:
	text "MINERALBADGE"
	line "raises the defense"
	cont "of your #MON."

	para "In addition,"
	line "please take this."
	done

OlivineGymJasmineSteelWingText:
	text "STEEL WING has a"
	line "chance to boost"
	cont "defense."
	
	para "It's one of my"
	line "favorite moves!"
	done

OlivineGymJasmineSurfText:
	text "Oh! In order to"
	line "reach CIANWOOD and"
	
	para "face CHUCK, you'll"
	line "need a way to"
	cont "cross the ocean."
	
	para "I believe I remem-"
	line "ber a HIDDEN"
	
	para "MACHINE, or HM,"
	line "for SURF that used"
	
	para "to be stored in"
	line "our LIGHTHOUSE."
	
	para "Here - I'll give"
	line "you the key."
	
	para "After all, I took"
	line "over caretaker"
	
	para "duties after MR."
	line "QUAYE retired to"
	cont "FUCHSIA!"
	done

OlivineGymJasmineGateText:
	text "And RIDLEY, would"
	line "you mind opening"
	cont "that gate?"
	done

OlivineGymJasmineMoomooFarmText:
	text "Ah, <PLAYER>, well"
	line "done on making it"
	
	para "this far, but I'm"
	line "afraid I must ask"
	
	para "a favor of you"
	line "before we battle."
	
	para "MOOMOO FARM, to"
	line "the north of here,"
	
	para "has been dealing"
	line "with a BEEDRILL"
	
	para "infestation, and"
	line "word is it's got-"
	cont "ten much worse."
	
	para "I am unable to go"
	line "and help myself…"
	
	para "I was reprimanded"
	line "in the past for"
	
	para "abandoning my post"
	line "here in the GYM,"
	cont "you see."
	
	para "If you would lend"
	line "a hand to those"
	
	para "fine farmers, I"
	line "might even go easy"
	cont "on you."
	
	para "That was a joke…"
	
	para "Heehee!"
	done

OlivineGymJasmineGoToLighthouseText:
	text "Have you checked"
	line "out the LIGHTHOUSE"
	cont "yet?"
	done

OlivineGymJasmineGoodLuckText:
	text "Good luck on your"
	line "journey!"
	
	para "CIANWOOD CITY is"
	line "waiting for you"
	cont "across the sea."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
	object_event  1,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, OlivineGymSuperNerdJacobScript, -1
	object_event  8,  1, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, OlivineGymBeautyMelissaScript, -1
	object_event  3,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, OlivineGymGuitaristRidleyScript, -1
	object_event  5,  5, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, -1
