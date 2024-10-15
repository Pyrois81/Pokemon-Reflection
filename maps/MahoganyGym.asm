	object_const_def
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BEAUTY1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BEAUTY2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUIDE

MahoganyGym_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Win, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE

.FightDone:
	checkevent EVENT_MAHOGANY_GYM_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	setmapscene ROUTE_39_BARN, SCENE_ROUTE_39_BARN_BEES
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_MAHOGANY_GYM_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
	
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuideWinScript
	writetext MahoganyGymGuideText
	waitbutton
	closetext
	end

.MahoganyGymGuideWinScript:
	writetext MahoganyGymGuideWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd GymStatue2Script

PryceText_Intro:
	text "#MON have many"
	line "experiences in"

	para "their lives, just "
	line "like we do. "

	para "I, too, have seen"
	line "and suffered much"
	cont "in my life."

	para "I have battled"
	line "alongside my"
	
	para "#MON since well"
	line "before you were"
	cont "born!"
	
	para "We share a bond"
	line "that is not easily"
	cont "overcome."
	
	para "So try your luck,"
	line "child, and I will"
	
	para "show you just how"
	line "unmerciful the"
	cont "winter truly is!"
	done

PryceText_Win:
	text "O-ho! You may be"
	line "young, but your"
	
	para "resolve burns"
	line "bright!"
	
	para "You have displayed"
	line "an unwillingness"
	
	para "to be overcome by"
	line "the biting cold,"

	para "and so I deem you"
	line "worthy of this"
	cont "BADGE!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> received"
	line "GLACIERBADGE."
	done

PryceText_GlacierBadgeSpeech:
	text "That BADGE is a"
	line "symbol of winter's"
	cont "harshness."
	
	para "May you wear it"
	line "and be reminded"
	
	para "of what you have"
	line "overcome."

	para "And this… This is"
	line "a gift from me!"
	done

PryceText_IcyWindSpeech:
	text "That TM contains"
	line "ICY WIND."

	para "It inflicts damage"
	line "and lowers speed."

	para "It demonstrates"
	line "the uncaring"
	cont "nature of winter."
	done

PryceText_CherishYourPokemon:
	text "When the ice and"
	line "snow melt, spring"
	cont "arrives."

	para "You are sure to"
	line "spend many seasons"
	
	para "with your #MON"
	line "by your side."

	para "Cherish your time"
	line "together!"
	done

BoarderRonaldSeenText:
	text "I'll freeze your"
	line "#MON, so you"
	cont "can't do a thing!"
	done

BoarderRonaldBeatenText:
	text "Brr… A chill went"
	line "down my spine!"
	done

BoarderRonaldAfterBattleText:
	text "I've heard there's"
	line "a move a #MON"

	para "can use while it's"
	line "frozen."
	done

BoarderBradSeenText:
	text "Whoa, champ!"
	line "Watch where"
	cont "you're goin'!"
	done

BoarderBradBeatenText:
	text "Looks like I'm the"
	line "one who slid out…"
	done

BoarderBradAfterBattleText:
	text "This GYM is great."
	line "I love boarding"
	cont "with my #MON!"
	done

BoarderDouglasSeenText:
	text "I know why PRYCE"
	line "is so unshakable."
	done

BoarderDouglasBeatenText:
	text "OK. I'll tell you"
	line "PRYCE's secret."
	done

BoarderDouglasAfterBattleText:
	text "When it snows,"
	line "and everyone is"
	
	para "all bundled up,"
	line "PRYCE will sit in"
	
	para "the mountains with"
	line "his #MON for"
	
	para "hours and hours,"
	line "training his"
	cont "discipline."
	done

SkierRoxanneSeenText:
	text "To get to PRYCE,"
	line "our GYM LEADER,"

	para "you need to think"
	line "before you skate."
	done

SkierRoxanneBeatenText:
	text "I wouldn't lose to"
	line "you in skiing!"
	done

SkierRoxanneAfterBattleText:
	text "If you don't skate"
	line "with precision,"

	para "you won't get far"
	line "in this GYM."
	done

SkierClarissaSeenText:
	text "Sliding around on"
	line "the ice is really"
	
	para "quite fun once you"
	line "get used to it."
	done

SkierClarissaBeatenText:
	text "No! You made me"
	line "wipe out!"
	done

SkierClarissaAfterBattleText:
	text "You fall down, you"
	line "get back up again."
	done

MahoganyGymGuideText:
	text "PRYCE is a veteran"
	line "who has trained"

	para "#MON for nearly"
	line "60 years."

	para "He's a master of"
	line "the ice type, and"
	
	para "weathers his"
	line "opponents down"
	
	para "in wars of"
	line "attrition."
	
	para "Fire, fighting,"
	line "and rock-type"
	
	para "moves will be your"
	line "best bets if you"
	
	para "want to come out"
	line "victorious!"
	done

MahoganyGymGuideWinText:
	text "That was amazing,"
	line "<PLAYER>!"
	
	para "Watching that"
	line "battle chilled me"
	cont "to my very core!"
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 2
	warp_event  5, 17, MAHOGANY_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  5, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  0, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  4,  9, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	object_event  3,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  6, 13, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuideScript, -1
