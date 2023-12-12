	object_const_def
	const DANCETHEATRE_KIMONO_GIRL_HONOKO
	const DANCETHEATRE_KIMONO_GIRL_REIKO
	const DANCETHEATRE_KIMONO_GIRL_ANJU
	const DANCETHEATRE_KIMONO_GIRL_MINATO
	const DANCETHEATRE_KIMONO_GIRL_AZUMA
	const DANCETHEATRE_GENTLEMAN
	const DANCETHEATRE_RHYDON
	const DANCETHEATRE_COOLTRAINER_M
	const DANCETHEATRE_GRANNY
	const DANCETHEATRE_ROCK1
	const DANCETHEATRE_ROCK2
	const DANCETHEATRE_ROCK3
	const DANCETHEATRE_ROCK4

DanceTheatre_MapScripts:
	def_scene_scripts

	def_callbacks

KimonoGirlHonokoScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KIMONO_GIRLS
	iftrue .BeatKimonoGirls
	writetext KimonoGirlHonokoTakeChallengeText
	yesorno
	iffalse .End
	readvar VAR_FACING
	ifequal RIGHT, .FromLeft
	ifequal LEFT, .FromRight
	ifequal DOWN, .FromTop
	sjump KimonoGirlGauntlet
	
.FromLeft:
	closetext
	applymovement PLAYER, DanceTheatreMoveFromLeftMovement
	opentext
	sjump KimonoGirlGauntlet
	
.FromRight:
	closetext
	applymovement PLAYER, DanceTheatreMoveFromRightMovement
	opentext
	sjump KimonoGirlGauntlet
	
.FromTop:
	closetext
	applymovement PLAYER, DanceTheatreMoveFromTopMovement
	opentext
	sjump KimonoGirlGauntlet
	
.BeatKimonoGirls:
	writetext KimonoGirlHonokoAfterGauntletText
	waitbutton
	
.End:
	closetext
	end
	
KimonoGirlGauntlet:
	writetext KimonoGirlHonokoBeforeBattleText
	waitbutton
	closetext
	winlosstext KimonoGirlHonokoBeatenText, 0
	loadtrainer KIMONO_GIRL, HONOKO
	startbattle
	reloadmapafterbattle
	pause 20
	applymovement DANCETHEATRE_KIMONO_GIRL_MINATO, DanceTheatreMinatoMovement
	opentext
	writetext KimonoGirlMinatoBeforeBattleText
	waitbutton
	closetext
	winlosstext KimonoGirlMinatoBeatenText, 0
	loadtrainer KIMONO_GIRL, MINATO
	startbattle
	reloadmapafterbattle
	pause 20
	applymovement DANCETHEATRE_KIMONO_GIRL_AZUMA, DanceTheatreAzumaMovement
	opentext
	writetext KimonoGirlAzumaBeforeBattleText
	waitbutton
	closetext
	winlosstext KimonoGirlAzumaBeatenText, 0
	loadtrainer KIMONO_GIRL, AZUMA
	startbattle
	reloadmapafterbattle
	pause 20
	applymovement DANCETHEATRE_KIMONO_GIRL_REIKO, DanceTheatreReikoMovement
	opentext
	writetext KimonoGirlReikoBeforeBattleText
	waitbutton
	closetext
	winlosstext KimonoGirlReikoBeatenText, 0
	loadtrainer KIMONO_GIRL, REIKO
	startbattle
	reloadmapafterbattle
	pause 20
	applymovement DANCETHEATRE_KIMONO_GIRL_ANJU, DanceTheatreAnjuMovement
	opentext
	writetext KimonoGirlAnjuBeforeBattleText
	waitbutton
	closetext
	winlosstext KimonoGirlAnjuBeatenText, 0
	loadtrainer KIMONO_GIRL, ANJU
	startbattle
	reloadmapafterbattle
	pause 10
	opentext
	writetext KimonoGirlHonokoPrizeText
	waitbutton
	closetext
	setevent EVENT_BEAT_KIMONO_GIRLS
	appear DANCETHEATRE_ROCK1
	appear DANCETHEATRE_ROCK2
	appear DANCETHEATRE_ROCK3
	appear DANCETHEATRE_ROCK4
	end

KimonoGirlMinatoScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KIMONO_GIRLS
	iftrue .BeatKimonoGirls
	writetext KimonoGirlMinatoBeforeGauntletText
	waitbutton
	closetext
	end
	
.BeatKimonoGirls:
	writetext KimonoGirlMinatoAfterGauntletText
	waitbutton
	closetext
	end

KimonoGirlAzumaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KIMONO_GIRLS
	iftrue .BeatKimonoGirls
	writetext KimonoGirlAzumaBeforeGauntletText
	waitbutton
	closetext
	end
	
.BeatKimonoGirls:
	writetext KimonoGirlAzumaAfterGauntletText
	waitbutton
	closetext
	end
	
KimonoGirlReikoScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KIMONO_GIRLS
	iftrue .BeatKimonoGirls
	writetext KimonoGirlReikoBeforeGauntletText
	waitbutton
	closetext
	end
	
.BeatKimonoGirls:
	writetext KimonoGirlReikoAfterGauntletText
	waitbutton
	closetext
	end

KimonoGirlAnjuScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KIMONO_GIRLS
	iftrue .BeatKimonoGirls
	writetext KimonoGirlAnjuBeforeGauntletText
	waitbutton
	closetext
	end
	
.BeatKimonoGirls:
	writetext KimonoGirlAnjuAfterGauntletText
	waitbutton
	closetext
	end

DanceTheatreGentlemanScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KIMONO_GIRLS
	iftrue .BeatKimonoGirls
	writetext DanceTheatreGentlemanBeforeGauntletText
	waitbutton
	closetext
	end

.BeatKimonoGirls:
	writetext DanceTheatreGentlemanAfterGauntletText
	waitbutton
	closetext
	end

DanceTheatreRhydon:
	opentext
	cry RHYDON
	writetext RhydonText
	waitbutton
	closetext
	end

DanceTheatreCooltrainerMScript:
	jumptextfaceplayer DanceTheatreCooltrainerMText

DanceTheatreGrannyScript:
	jumptextfaceplayer DanceTheatreGrannyText

DanceTheatreFancyPanel:
	jumptext DanceTheatreFancyPanelText

DanceTheatreFireStoneScript:
	opentext
	writetext DanceTheatreFireStoneText
	waitbutton
	writetext DanceTheatreTakeOnlyOneText
	yesorno
	iffalse DanceTheatreStoneEnd
	verbosegiveitem FIRE_STONE
	iffalse DanceTheatreStoneEnd
	setevent EVENT_DANCE_THEATRE_GOT_STONE
	sjump DanceTheatreDisappearStones

DanceTheatreWaterStoneScript:
	opentext
	writetext DanceTheatreWaterStoneText
	waitbutton
	writetext DanceTheatreTakeOnlyOneText
	yesorno
	iffalse DanceTheatreStoneEnd
	verbosegiveitem WATER_STONE
	iffalse DanceTheatreStoneEnd
	setevent EVENT_DANCE_THEATRE_GOT_STONE
	sjump DanceTheatreDisappearStones

DanceTheatreLeafStoneScript:
	opentext
	writetext DanceTheatreLeafStoneText
	waitbutton
	writetext DanceTheatreTakeOnlyOneText
	yesorno
	iffalse DanceTheatreStoneEnd
	verbosegiveitem LEAF_STONE
	iffalse DanceTheatreStoneEnd
	setevent EVENT_DANCE_THEATRE_GOT_STONE
	sjump DanceTheatreDisappearStones

DanceTheatreSunStoneScript:
	opentext
	writetext DanceTheatreSunStoneText
	waitbutton
	writetext DanceTheatreTakeOnlyOneText
	yesorno
	iffalse DanceTheatreStoneEnd
	verbosegiveitem SUN_STONE
	iffalse DanceTheatreStoneEnd
	setevent EVENT_DANCE_THEATRE_GOT_STONE
	sjump DanceTheatreDisappearStones	

DanceTheatreStoneEnd:
	closetext
	end

DanceTheatreDisappearStones:
	disappear DANCETHEATRE_ROCK1
	disappear DANCETHEATRE_ROCK2
	disappear DANCETHEATRE_ROCK3
	disappear DANCETHEATRE_ROCK4	
	closetext
	end
	
DanceTheatreMoveFromLeftMovement:
	step DOWN
	step RIGHT
	turn_head UP
	step_end
	
DanceTheatreMoveFromRightMovement:
	step DOWN
	step LEFT
	turn_head UP
	step_end
	
DanceTheatreMoveFromTopMovement:
	step LEFT
	step DOWN
	step DOWN
	step RIGHT
	turn_head UP
	step_end
	
DanceTheatreMinatoMovement:
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end
	
DanceTheatreAzumaMovement:
	step DOWN
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end
	
DanceTheatreReikoMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step_end
	
DanceTheatreAnjuMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step RIGHT
	step_end	

KimonoGirlHonokoTakeChallengeText:
	text "Ahh, you look to"
	line "be an up-and-"
	cont "coming trainer!"
	
	para "How about a little"
	line "challenge?"
	
	para "We will bestow"
	line "upon you an evo-"
	cont "lutionary stone,"
	
	para "but only if you"
	line "can best the five"
	
	para "of us with no"
	line "rest between."
	
	para "What do you say?"
	
	para "Would you like to"
	line "test your mettle?"
	done
	
KimonoGirlMinatoBeforeGauntletText:
	text "I try to embody"
	line "the movement of"
	
	para "water in my"
	line "dancing."
	done
	
KimonoGirlAzumaBeforeGauntletText:
	text "I live for"
	line "the thunderous"
	
	para "applause of a rapt"
	line "audience."
	done
	
KimonoGirlReikoBeforeGauntletText:
	text "I always know just"
	line "what the audience"
	
	para "members want to"
	line "see."
	done
	
KimonoGirlAnjuBeforeGauntletText:
	text "I like to take a"
	line "more somber"
	
	para "approach to per-"
	line "formative dance."
	done
	
KimonoGirlHonokoBeforeBattleText:
	text "Very well."
	
	para "I am HONOKO, the"
	line "eldest and leader"
	cont "of our troupe."
	
	para "Good luck to you!"
	done

KimonoGirlHonokoBeatenText:
	text "Oh, you have a"
	line "fiery spirit."
	done

KimonoGirlMinatoBeforeBattleText:
	text "I am MINATO."
	
	para "Show me your"
	line "skill!"
	done

KimonoGirlMinatoBeatenText:
	text "You are wise"
	line "beyond your years."
	done

KimonoGirlAzumaBeforeBattleText:
	text "I am the third,"
	line "AZUMA."
	
	para "Let's get this"
	line "over with!"
	done

KimonoGirlAzumaBeatenText:
	text "What a shocking"
	line "outcome!"
	done
	
KimonoGirlReikoBeforeBattleText:
	text "I can sense that"
	line "you're wearing"
	cont "down."
	
	para "I am REIKO, and I"
	line "won't go easy"
	cont "on you!"
	done
	
KimonoGirlReikoBeatenText:
	text "A spirited"
	line "performance."
	done
	
KimonoGirlAnjuBeforeBattleText:
	text "You're almost"
	line "there."
	
	para "But remember, the"
	line "night is darkest"
	
	para "just before the"
	line "dawn!"
	done

KimonoGirlAnjuBeatenText:
	text "I couldn't handle"
	line "the spotlight!"
	done

KimonoGirlHonokoPrizeText:
	text "You beat us all"
	line "with aplomb."
	
	para "As promised, you"
	line "may take your"
	
	para "choice of one of"
	line "our stones."
	
	para "They have been"
	line "laid out in the"
	
	para "center of the room"
	line "for your perusal."
	done

KimonoGirlHonokoAfterGauntletText:
	text "Your spirit burns"
	line "bright."
	
	para "Come back to see"
	line "us anytime."
	done

KimonoGirlMinatoAfterGauntletText:
	text "The waves can wash"
	line "away any hardship"
	cont "you may endure."
	
	para "Remember that."
	done

KimonoGirlAzumaAfterGauntletText:
	text "You came in here"
	line "like a lightning"
	cont "bolt."
	
	para "I expect great"
	line "things from you."
	done
	
KimonoGirlReikoAfterGauntletText:
	text "I could sense that"
	line "we were to be"
	
	para "visited by a great"
	line "trainer."
	
	para "I can also sense"
	line "that you will go"
	cont "far!"
	done

KimonoGirlAnjuAfterGauntletText:
	text "Sticking to the"
	line "shadows is com-"
	cont "fortable, but"
	
	para "sometimes you have"
	line "to push yourself!"
	done

DanceTheatreGentlemanBeforeGauntletText:
	text "I never get tired"
	line "of watching any of"
	
	para "these girls doing"
	line "their dances, but"
	
	para "especially not"
	line "REIKO."
	
	para "Her face, her"
	line "grace, her style,"
	cont "her smile…"
	done

DanceTheatreGentlemanAfterGauntletText:
	text "The way you bat-"
	line "tled, it was like"
	cont "watching a dance."

	para "It was a rare"
	line "treat to see!"
	done

RhydonText:
	text "RHYDON: Doooon!"
	done

DanceTheatreCooltrainerMText:
	text "That guy up front"
	line "has been coming"
	
	para "here with his"
	line "RHYDON for years."
	
	para "He used to be a"
	line "bit of a creep,"
	
	para "but I think they"
	line "gave him a"
	
	para "talking-to because"
	line "he mostly minds"
	cont "his business now."
	done

DanceTheatreGrannyText:
	text "You know, I used"
	line "to be a KIMONO"
	
	para "GIRL back in my"
	line "youth."
	
	para "It was tough work,"
	line "but the adoration"
	
	para "of my fans made it"
	line "all worth it…"
	
	para "Well, that and the"
	line "gifts, hehe."
	done

DanceTheatreFancyPanelText:
	text "It's a fancy panel"
	line "that's decorated"
	cont "with flowers."
	done

DanceTheatreFireStoneText:
	text "It's a FIRE"
	line "STONE."
	done
	
DanceTheatreWaterStoneText:
	text "It's a WATER"
	line "STONE."
	done
	
DanceTheatreLeafStoneText:
	text "It's a LEAF"
	line "STONE."
	done
	
DanceTheatreSunStoneText:
	text "It's a SUN"
	line "STONE."
	done

DanceTheatreTakeOnlyOneText:
	text "Would you like it?"
	
	para "You may take"
	line "only one!"
	done
	
DanceTheatre_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_UP, DanceTheatreFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheatreFancyPanel

	def_object_events
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KimonoGirlHonokoScript, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, KimonoGirlReikoScript, -1
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KimonoGirlAnjuScript, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KimonoGirlMinatoScript, -1
	object_event  3,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KimonoGirlAzumaScript, -1
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheatreGentlemanScript, -1
	object_event 10,  6, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheatreRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheatreCooltrainerMScript, -1
	object_event  1,  8, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheatreGrannyScript, -1
	object_event  4,  8, SPRITE_ROCK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheatreFireStoneScript, EVENT_DANCE_THEATRE_GOT_STONE
	object_event  5,  8, SPRITE_ROCK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheatreWaterStoneScript, EVENT_DANCE_THEATRE_GOT_STONE
	object_event  6,  8, SPRITE_ROCK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DanceTheatreLeafStoneScript, EVENT_DANCE_THEATRE_GOT_STONE
	object_event  7,  8, SPRITE_ROCK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DanceTheatreSunStoneScript, EVENT_DANCE_THEATRE_GOT_STONE
