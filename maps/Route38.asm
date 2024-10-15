	object_const_def
	const ROUTE38_STANDING_YOUNGSTER1
	const ROUTE38_LASS
	const ROUTE38_STANDING_YOUNGSTER2
	const ROUTE38_BEAUTY1
	const ROUTE38_SAILOR
	const ROUTE38_FRUIT_TREE
	const ROUTE38_BEAUTY2
	const ROUTE38_POKEBALL1
	const ROUTE38_POKEBALL2

Route38_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperToby:
	trainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BirdKeeperTobyAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorHarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SailorHarryAfterBattleText
	waitbutton
	closetext
	end

TrainerLassDana:
	trainer LASS, DANA1, EVENT_BEAT_LASS_DANA, LassDanaSeenText, LassDanaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	checkevent EVENT_SAVED_MOOMOO_FARM
	iffalse .FarmText
	writetext LassDanaAfterBattleText
	waitbutton
	closetext
	end

.FarmText
	writetext LassDanaMoomooFarmText
	waitbutton
	closetext
	end

TrainerSchoolboyChad:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChadSeenText, SchoolboyChadBeatenText, 0, .Script

.Script
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_CHAD
	endifjustbattled
	opentext
	checkflag ENGINE_CHAD_READY_FOR_REMATCH
	iftrue .ChadRematch
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftrue .HaveChadsNumber
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftrue .SecondTimeAsking
	writetext SchoolboyChadAfterBattleText
	promptbutton
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumber1
	sjump .AskToRegisterNumber

.SecondTimeAsking:
	scall .AskPhoneNumber2
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .SaidNo
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	scall .RegisteredChad
	sjump .HaveChadsNumber

.ChadRematch:
	scall .Rematch
	winlosstext SchoolboyChadBeatenText, 0
	readmem wChadFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 1
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 2
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 3
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 4
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.AskPhoneNumber1:
	jumpstd AskNumber1MScript
	end

.AskPhoneNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredChad:
	jumpstd RegisteredNumberMScript
	end

.HaveChadsNumber:
	jumpstd NumberAcceptedMScript
	end

.SaidNo:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

TrainerBeautyValerie:
	trainer BEAUTY, VALERIE, EVENT_BEAT_BEAUTY_VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyValerieAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyOlivia:
	trainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyOliviaAfterBattleText
	waitbutton
	closetext
	end

Route38Sign:
	jumptext Route38SignText

Route38TrainerTips:
	jumptext Route38TrainerTipsText

Route38FruitTree:
	fruittree FRUITTREE_ROUTE_38

Route38SuperPotion:
	itemball SUPER_POTION

Route38TMRazorLeaf:
	itemball TM_RAZOR_LEAF
	
Route38HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_38_HIDDEN_ETHER

BirdKeeperTobySeenText:
	text "Ah, someone dares"
	line "to summit my"
	cont "mighty hill!"
	
	para "Well this is my"
	line "spot, so SCRAM!"
	done

BirdKeeperTobyBeatenText:
	text "Okay, okay, you"
	line "can stay up here."
	done

BirdKeeperTobyAfterBattleText:
	text "My #MON and I"
	line "like to be up"
	cont "high."
	
	para "Gives us a chance"
	line "to spread our"
	cont "wings!"
	done

SchoolboyChadSeenText:
	text "Gahhh, school is"
	line "so boring!"
	
	para "I much prefer"
	line "battling #MON!"
	done

SchoolboyChadBeatenText:
	text "I didn't study"
	line "enough, I guess."
	done

SchoolboyChadAfterBattleText:
	text "Dang, you're good."
	
	para "You must actually"
	line "pay attention in"
	cont "school."
	done

LassDanaSeenText:
	text "There's a weird"
	line "guy who hangs out"
	
	para "at the top of that"
	line "hill."
	
	para "He's always flap-"
	line "ping his arms like"
	cont "a chicken."
	done

LassDanaBeatenText:
	text "Nicely done!"
	done

LassDanaAfterBattleText:
	text "Have you had a"
	line "taste of MOOMOO"
	cont "MILK yet?"
	
	para "People and #MON"
	line "alike love it!"
	done

LassDanaMoomooFarmText:
	text "I've been hearing"
	line "a lot of mooing"
	
	para "coming from MOOMOO"
	line "FARM lately."
	
	para "I hope the MILTANK"
	line "are okay…"
	done

BeautyValerieSeenText:
	text "Aww, what a"
	line "little cutie!"
	
	para "Are you lost,"
	line "cutie?"
	done

BeautyValerieBeatenText:
	text "Whoa, you've got"
	line "places to be!"
	done

BeautyValerieAfterBattleText:
	text "Pretty #MON"
	line "make more of an"
	
	para "impact than"
	line "strong ones…"
	
	para "For me, at least."
	done

SailorHarrySeenText:
	text "Oh, hey kid…"
	
	para "I'm up here 'cause"
	line "I was told I'd"
	
	para "never be a suc-"
	line "cessful trainer"
	
	para "usin' only #MON"
	line "from the sea."
	done

SailorHarryBeatenText:
	text "My heart's just"
	line "not in it…"
	done

SailorHarryAfterBattleText:
	text "Ya know what? I"
	line "don't care if I'm"
	
	para "not an ace"
	line "trainer."
	
	para "I love the ocean"
	line "and its creatures,"
	
	para "and I'm stickin'"
	line "with 'em!"
	done

BeautyOliviaSeenText:
	text "Beauty is"
	line "paramount, don't"
	cont "you agree?"
	done

BeautyOliviaBeatenText:
	text "Your battle skill…"
	line "It's wonderful…"
	done

BeautyOliviaAfterBattleText:
	text "I try to see the"
	line "beauty in all"
	cont "things."
	
	para "Sometimes it's"
	line "hard, though."
	done

Route38SignText:
	text "ROUTE 38"

	para "ECRUTEAK CITY -"
	line "OLIVINE CITY"
	done

Route38TrainerTipsText:
	text "TRAINER TIPS"

	para "If a #MON is"
	line "trying to evolve,"
	cont "you can stop it."

	para "Press the B But-"
	line "ton during evolu-"
	cont "tion."

	para "That startles the"
	line "#MON and stops"
	cont "its evolution."
	done

Route38_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 35,  8, ROUTE_38_ECRUTEAK_GATE, 1
	warp_event 35,  9, ROUTE_38_ECRUTEAK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 31,  9, BGEVENT_READ, Route38Sign
	bg_event 10,  4, BGEVENT_READ, Route38TrainerTips
	bg_event  6,  9, BGEVENT_ITEM, Route38HiddenEther

	def_object_events
	object_event  7,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyChad, -1
	object_event 16, 16, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerLassDana, -1
	object_event 20,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperToby, -1
	object_event 21,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerBeautyValerie, -1
	object_event  8, 16, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerSailorHarry, -1
	object_event 10, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route38FruitTree, -1
	object_event 23,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyOlivia, -1
	object_event 27,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route38SuperPotion, EVENT_ROUTE_38_SUPER_POTION
	object_event 14,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route38TMRazorLeaf, EVENT_ROUTE_38_TM60_RAZOR_LEAF
