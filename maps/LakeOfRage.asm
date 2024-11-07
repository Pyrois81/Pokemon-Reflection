	object_const_def
	const LAKEOFRAGE_GRAMPS
	const LAKEOFRAGE_SUPER_NERD1
	const LAKEOFRAGE_COOLTRAINER_F1
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_COOLTRAINER_M
	const LAKEOFRAGE_COOLTRAINER_F2
	const LAKEOFRAGE_WESLEY
	const LAKEOFRAGE_ROCKET1
	const LAKEOFRAGE_ROCKET2
	const LAKEOFRAGE_PORYGON
	const LAKEOFRAGE_POKE_BALL1
	const LAKEOFRAGE_POKE_BALL2
	const LAKEOFRAGE_POKE_BALL3

LakeOfRage_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; unusable
	scene_script .DummyScene1 ; unusable

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback

LakeOfRageGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_LAKE_OF_RAGE
	iftrue .ClearedLakeOfRage
	writetext LakeOfRageGrampsText
	waitbutton
	closetext
	end

.ClearedLakeOfRage:
	writetext LakeOfRageGrampsText_MagikarpAreBack
	waitbutton
	closetext
	end

LakeOfRageSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_GOT_UPGRADE
	iftrue .GotUpgrade
	writetext LakeOfRageSuperNerdText
	waitbutton
	writetext LakeOfRageSuperNerdGiveUpgradeText
	promptbutton
	verbosegiveitem UP_GRADE
	iffalse .End
	setevent EVENT_LAKE_OF_RAGE_GOT_UPGRADE
	closetext
	end
	
.GotUpgrade:
	writetext LakeOfRageSuperNerdGotUpgradeText
	waitbutton
	closetext
	end
	
.End:
	closetext
	end

LakeOfRageCooltrainerFScript:
	jumptextfaceplayer LakeOfRageCooltrainerFText

TrainerFisherAndre:
	trainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAndreAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherRaymond:
	trainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRaymondAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLois:
	trainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, CooltrainerfLoisSeenText, CooltrainerfLoisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLoisAfterBattleText
	waitbutton
	closetext
	end

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyGotBlackbeltScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	promptbutton
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	promptbutton
	verbosegiveitem BLACKBELT_I
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyGotBlackbeltScript:
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end
	
LakeOfRageRocket1Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ROCKET_GRUNTM_1
	iffalse .GoInside
	checkevent EVENT_BEAT_ROCKET_GRUNTF_1
	iffalse .GoInside
	writetext LakeOfRageRocket1BeforeBattleText
	waitbutton
	closetext
	winlosstext LakeOfRageRocket1BeatenText, 0
	loadtrainer GRUNTM, GRUNTM_2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_GRUNTM_2
	opentext
	writetext LakeOfRageRocket1AfterBattleText
	applymovement LAKEOFRAGE_ROCKET1, LakeOfRageRocket1ExitMovement
	waitsfx SFX_RUN
	disappear LAKEOFRAGE_ROCKET1
	waitbutton
	closetext
	end
	
.GoInside:
	writetext LakeOfRageRocket1GoInsideText
	waitbutton
	closetext
	end
	
LakeOfRageRocket2Script:
	showemote EMOTE_QUESTION, LAKEOFRAGE_ROCKET2, 30
	faceplayer
	opentext
	writetext LakeOfRageRocket2BeforeBattleText
	waitbutton
	closetext
	winlosstext LakeOfRageRocket2BeatenText, 0
	loadtrainer GRUNTM, GRUNTM_3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_GRUNTM_3
	opentext
	writetext LakeOfRageRocket2AfterBattleText
	waitbutton
	closetext
	applymovement PLAYER, LakeOfRageRocketShovesYouMovement
	applymovement LAKEOFRAGE_ROCKET2, LakeOfRageRocket2ExitMovement
	disappear LAKEOFRAGE_ROCKET2
	appear LAKEOFRAGE_POKE_BALL3
	setevent EVENT_CLEARED_LAKE_OF_RAGE
	end
	
LakeOfRagePorygonScript:
	opentext
	writetext LakeOfRagePorygonCryText
	cry PORYGON
	waitsfx
	waitbutton	
	writetext LakeOfRageTakePorygonText
	yesorno
	iffalse .End
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext LakeOfRageReceivedPorygonText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	givepoke PORYGON, 10
	setevent EVENT_LAKE_OF_RAGE_GOT_PORYGON
	disappear LAKEOFRAGE_PORYGON
	
.End:
	closetext
	end

.NoRoom:
	writetext LakeOfRagePorygonNoRoomText
	waitbutton
	closetext
	end

LakeOfRageRocket1ExitMovement:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
LakeOfRageRocketShovesYouMovement:
	turn_head RIGHT
	fix_facing
	step LEFT
	remove_fixed_facing
	step_end
	
LakeOfRageRocket2ExitMovement:
	turn_head UP
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
LakeOfRageSign:
	jumptext LakeOfRageSignText

MagikarpHouseSignScript:
	jumptext MagikarpHouseSignText
	
LakeOfRageRocketSign1:
	jumptext LakeOfRageRocketSign1Text
	
LakeOfRageRocketSign2:
	jumptext LakeOfRageRocketSign2Text

LakeOfRageXSpeed:
	itemball X_SPEED

LakeOfRageTM71Whirlwind:
	itemball TM_WHIRLWIND
	
LakeOfRageThunderStone:
	itemball THUNDERSTONE

LakeOfRageHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_HEAL

LakeOfRageHiddenExpCandyM:
	hiddenitem EXP_CANDY_M, EVENT_LAKE_OF_RAGE_HIDDEN_EXP_CANDY_M

LakeOfRageHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION

LakeOfRageGrampsText:
	text "The fishin's worse"
	line "every day lately,"
	cont "it seems."
	
	para "Wish I knew where"
	line "all the MAGIKARP"
	
	para "were runnin'"
	line "off to."
	done

LakeOfRageGrampsText_MagikarpAreBack:
	text "Ohoho! The"
	line "MAGIKARP are back"
	cont "in full force!"
	done

LakeOfRageSuperNerdText:
	text "Sometimes I like"
	line "to come to this"
	
	para "spot to clear my"
	line "head."
	
	para "It's nice, don't"
	line "you agree?"
	done
	
LakeOfRageSuperNerdGiveUpgradeText:
	text "Hey, by the way,"
	line "when I got over"

	para "here today, I no-"
	line "ticed this thing"

	para "had washed up on"
	line "the island."
	
	para "I have no idea"
	line "what it is, but it"
	
	para "looks super"
	line "technological."
	
	para "Want it?"
	done

LakeOfRageSuperNerdGotUpgradeText:
	text "Didja ever figure"
	line "out what that doo-"
	cont "hickey was for?"
	
	para "What'd you call it"
	line "again?"
	
	para "U-P-G-R-A-Y-E-D-D"
	line "or somethin'?"
	done

LakeOfRageCooltrainerFText:
	text "Have you seen a"
	line "#MON that's a"
	
	para "different color"
	line "than normal?"
	
	para "That means it's"
	line "shiny and it'll"
	cont "be extra strong!"
	done

FisherAndreSeenText:
	text "Fishin's great!"
	
	para "I get to have a"
	line "few drinks and"
	
	para "catch #MON at"
	line "the same time!"
	done

FisherAndreBeatenText:
	text "Absolutely gutted"
	line "over that one."
	done

FisherAndreAfterBattleText:
	text "I keep thinkin' I"
	line "see somethin' on"
	
	para "that rock over"
	line "yonder."
	
	para "If I had a boat,"
	line "I'd go check it"
	cont "out."
	done

FisherRaymondSeenText:
	text "Keep it down!"
	line "You'll scare all"
	cont "the fish away!"
	done

FisherRaymondBeatenText:
	text "My line's all"
	line "tangled up…"
	done

FisherRaymondAfterBattleText:
	text "I love this spot."
	line "It's so nice and"
	cont "tranquil."
	done

CooltrainermAaronSeenText:
	text "If a trainer spots"
	line "another trainer,"

	para "he has to make a"
	line "challenge."

	para "That is our"
	line "destiny."
	done

CooltrainermAaronBeatenText:
	text "Whew…"
	line "Good battle."
	done

CooltrainermAaronAfterBattleText:
	text "Be careful out"
	line "there."
	
	para "I'll see you at"
	line "the top!"
	done

CooltrainerfLoisSeenText:
	text "What happened to"
	line "the red GYARADOS?"

	para "It's been gone"
	line "for five years?"

	para "Gah, I'm always"
	line "such a SLOWPOKE."
	
	para "Anyway… wanna"
	line "battle?"
	done

CooltrainerfLoisBeatenText:
	text "Good going!"
	done

CooltrainerfLoisAfterBattleText:
	text "Come to think of"
	line "it, I've seen a"
	cont "pink BUTTERFREE."
	done

MeetWesleyText:
	text "WESLEY: Well, how"
	line "do you do?"

	para "I'm WESLEY of"
	line "Wednesday."
	done

WesleyGivesGiftText:
	text "Pleased to make"
	line "your acquaintance!"
	
	para "Please, take this"
	line "as a souvenir for"
	
	para "coming all the way"
	line "out here."
	done

WesleyGaveGiftText:
	text "WESLEY: BLACKBELT"
	line "powers up fighting"
	cont "moves."
	
	para "Give 'em the one-"
	line "two punch!"
	done

WesleyWednesdayText:
	text "WESLEY: It is"
	line "Wednesday!"
	
	para "Oh, a most joyous"
	line "day indeed!"
	done

WesleyNotWednesdayText:
	text "WESLEY: Today's"
	line "not Wednesday."
	cont "That's too bad."
	done

LakeOfRageRocket1BeforeBattleText:
	text "Y--you--"
	
	para "You beat the two"
	line "of them inside?!"
	
	para "N-no--no problem…"
	
	para "I'll have to take"
	line "you on myself!"
	done
	
LakeOfRageRocket1BeatenText:
	text "I knew it!"
	line "I'm no good!"
	done
	
LakeOfRageRocket1AfterBattleText:
	text "Waaahhhh!"
	done
	
LakeOfRageRocket1GoInsideText:
	text "Who're you, kid?"
	
	para "This is a danger-"
	line "ous area."
	
	para "Perhaps my col-"
	line "leagues inside the"
	
	para "house could call"
	line "your mommy to come"
	
	para "pick you up,"
	line "heh heh."
	done
	
LakeOfRageRocket2BeforeBattleText:
	text "Wha-?"
	
	para "Hey, who let you"
	line "back here?"
	
	para "Ah, whatever. You"
	line "were surely drawn"
	
	para "to our immense"
	line "level of genius."
	
	para "You see, when an"
	line "electric current"
	
	para "is applied to"
	line "PORYGON here, its"
	
	para "resonant frequen-"
	line "cies attract the"
	
	para "MAGIKARP in the"
	line "lake like crazy!"
	
	para "Then we just scoop"
	line "'em up in a big"
	
	para "net and make a"
	line "boatload of money"
	cont "sellin' 'em!"
	
	para "What? That's"
	line "'unsportsmanlike?'"
	
	para "I'll show you"
	line "unsportsmanlike!"
	done
	
LakeOfRageRocket2BeatenText:
	text "What a little"
	line "brat!"
	done
	
LakeOfRageRocket2AfterBattleText:
	text "Dang it! Every"
	line "time TEAM ROCKET"
	
	para "gets something"
	line "good going, some"
	
	para "twerp has to come"
	line "and butt in!"
	
	para "Outta my way, kid,"
	line "I gotta tell the"
	
	para "boys in OLIVINE"
	line "why their next"
	
	para "shipment's gonna"
	line "be late!"
	done
	
LakeOfRagePorygonCryText:
	text "PORYGON: Gon?"
	done
	
LakeOfRageTakePorygonText:
	text "This PORYGON was"
	line "abandoned here by"
	cont "TEAM ROCKET."
	
	para "Would you like to"
	line "give it a new"
	cont "home?"
	done
	
LakeOfRageReceivedPorygonText:
	text "<PLAYER> received"
	line "PORYGON."
	done

LakeOfRagePorygonNoRoomText:
	text "You don't have"
	line "room for PORYGON!"
	done
	
LakeOfRageSignText:
	text "LAKE OF RAGE,"
	line "also known as"
	cont "GYARADOS LAKE."
	done

MagikarpHouseSignText:
	text "FISHING GURU'S"
	line "HOUSE"
	done
	
LakeOfRageRocketSign1Text:
	text "DANGER:"
	line "LAND SLIDEZ"
	
	para "KEEP OUT"
	done
	
LakeOfRageRocketSign2Text:
	text "I MEAN IT!"
	
	para "YOU BETTER TURN"
	line "AROND!!!"
	done

LakeOfRage_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 21, 33, BGEVENT_READ, LakeOfRageSign
	bg_event 25, 31, BGEVENT_READ, MagikarpHouseSignScript
	bg_event 13, 13, BGEVENT_READ, LakeOfRageRocketSign1
	bg_event  9, 11, BGEVENT_READ, LakeOfRageRocketSign2
	bg_event  1, 30, BGEVENT_ITEM, LakeOfRageHiddenFullHeal
	bg_event 13,  6, BGEVENT_ITEM, LakeOfRageHiddenExpCandyM
	bg_event 19, 23, BGEVENT_ITEM, LakeOfRageHiddenMaxPotion

	def_object_events
	object_event 24, 30, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 25, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageSuperNerdScript, -1
	object_event 31, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageCooltrainerFScript, -1
	object_event 21, 28, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerFisherAndre, -1
	object_event  5, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerFisherRaymond, -1
	object_event  6, 21, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, -1
	object_event 30, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLois, -1
	object_event 19, 31, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, -1
	object_event 13,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageRocket1Script, EVENT_BEAT_ROCKET_GRUNTM_2
	object_event 23,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageRocket2Script, EVENT_BEAT_ROCKET_GRUNTM_3
	object_event 23,  9, SPRITE_PORYGON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LakeOfRagePorygonScript, EVENT_LAKE_OF_RAGE_GOT_PORYGON
	object_event 29,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageXSpeed, EVENT_LAKE_OF_RAGE_X_SPEED
	object_event 35,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageTM71Whirlwind, EVENT_LAKE_OF_RAGE_TM71_WHIRLWIND
	object_event 13,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageThunderStone, EVENT_LAKE_OF_RAGE_THUNDERSTONE
