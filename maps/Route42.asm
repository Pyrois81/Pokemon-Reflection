	object_const_def
	const ROUTE42_FISHER
	const ROUTE42_POKEFAN_M
	const ROUTE42_SUPER_NERD
	const ROUTE42_ROCKET1
	const ROUTE42_ROCKET2
	const ROUTE42_FRUIT_TREE1
	const ROUTE42_FRUIT_TREE2
	const ROUTE42_FRUIT_TREE3
	const ROUTE42_POKE_BALL1
	const ROUTE42_POKE_BALL2

Route42_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_ROUTE42_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE42_SUICUNE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .CheckRockets

.DummyScene0:
	end

.DummyScene1:
	end

.CheckRockets:
	checkevent EVENT_CLEARED_LAKE_OF_RAGE
	iffalse .RocketsStay
	checkflag ENGINE_GLACIERBADGE
	iffalse .RocketsStay
	disappear ROUTE42_ROCKET1
	disappear ROUTE42_ROCKET2

.RocketsStay:
	endcallback
	
TrainerFisherTully:
	trainer FISHER, TULLY1, EVENT_BEAT_FISHER_TULLY, FisherTullySeenText, FisherTullyBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_TULLY
	endifjustbattled
	opentext
	checkflag ENGINE_TULLY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .HasWaterStone
	checkcellnum PHONE_FISHER_TULLY
	iftrue .NumberAccepted
	checkevent EVENT_TULLY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext FisherTullyAfterBattleText
	promptbutton
	setevent EVENT_TULLY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_TULLY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, TULLY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext FisherTullyBeatenText, 0
	readmem wTullyFightCount
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, TULLY1
	startbattle
	reloadmapafterbattle
	loadmem wTullyFightCount, 1
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, TULLY2
	startbattle
	reloadmapafterbattle
	loadmem wTullyFightCount, 2
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, TULLY3
	startbattle
	reloadmapafterbattle
	loadmem wTullyFightCount, 3
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer FISHER, TULLY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TULLY_READY_FOR_REMATCH
	end

.HasWaterStone:
	scall .Gift
	verbosegiveitem WATER_STONE
	iffalse .NoRoom
	clearflag ENGINE_TULLY_HAS_WATER_STONE
	setevent EVENT_TULLY_GAVE_WATER_STONE
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

.Gift:
	jumpstd GiftMScript
	end

.PackFull:
	jumpstd PackFullMScript
	end

TrainerPokemaniacShane:
	trainer POKEMANIAC, SHANE, EVENT_BEAT_POKEMANIAC_SHANE, PokemaniacShaneSeenText, PokemaniacShaneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacShaneAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerBenjamin:
	trainer HIKER, BENJAMIN, EVENT_BEAT_HIKER_BENJAMIN, HikerBenjaminSeenText, HikerBenjaminBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBenjaminAfterBattleText
	waitbutton
	closetext
	end

Route42Rocket1Script:
	faceplayer
	opentext
	writetext Route42Rocket1Text
	waitbutton
	closetext
	end

Route42Rocket2Script:
	faceplayer
	opentext
	writetext Route42Rocket2Text
	waitbutton
	closetext
	end

Route42Sign1:
	jumptext Route42Sign1Text

Route42Sign2:
	jumptext Route42Sign2Text
	
MtMortarSign:
	jumptext MtMortarSignText

Route42UltraBall:
	itemball ULTRA_BALL

Route42SuperPotion:
	itemball SUPER_POTION

Route42FruitTree1:
	fruittree FRUITTREE_ROUTE_42_1

Route42FruitTree2:
	fruittree FRUITTREE_ROUTE_42_2

Route42FruitTree3:
	fruittree FRUITTREE_ROUTE_42_3

Route42HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_42_HIDDEN_NUGGET

FisherTullySeenText:
	text "I swear I saw a"
	line "blue blur whiz"
	
	para "right by here a"
	line "few days ago."
	
	para "Maybe I need to"
	line "get my eyes"
	cont "checked."
	done

FisherTullyBeatenText:
	text "Could it be?"
	done

FisherTullyAfterBattleText:
	text "Come to think of"
	line "it, I have heard"
	
	para "legends of a"
	line "blue hedgehog that"
	cont "can run on water…"
	
	para "Maybe that's what"
	line "I saw!"
	done

HikerBenjaminSeenText:
	text "I'm just a rollin'"
	line "stone, seein' the"
	
	para "sights, smellin'"
	line "the smells, and"
	
	para "battlin' whoever"
	line "I come across!"
	done

HikerBenjaminBeatenText:
	text "Sometimes you"
	line "crash out."
	done

HikerBenjaminAfterBattleText:
	text "A rollin' stone"
	line "gathers no moss,"
	
	para "but ya do pick up"
	line "a few bruises"
	cont "along the way."
	done

PokemaniacShaneSeenText:
	text "Maaan, I just KNOW"
	line "there are all"
	
	para "kinds of rare"
	line "#MON in MT."
	cont "MORTAR over there."
	
	para "I dunno how I'm"
	line "supposed to get"
	
	para "over there,"
	line "though!"
	done

PokemaniacShaneBeatenText:
	text "Never lucky…"
	done

PokemaniacShaneAfterBattleText:
	text "I heard there's an"
	line "HM that lets you"
	
	para "ride on your #-"
	line "MON's back over"
	cont "the water."
	
	para "How'm I supposed"
	line "to find that??"
	done
	
Route42Rocket1Text:
	text "Yeah, I'm a ROCK…"
	line "o. Uh, yeah… my"
	cont "name is ROCKO."
	
	para "Sorry we're in the"
	line "way, but we've got"
	
	para "some very impor-"
	line "tant business to"
	cont "take care of."
	
	para "We'll be out of"
	line "here in no time."
	
	para "I'm sure you can"
	line "find something to"
	
	para "occupy yourself"
	line "with in the"
	cont "meantime."
	done

Route42Rocket2Text:
	text "Don't go sticking"
	line "your nose where"
	
	para "it doesn't belong,"
	line "kid."
	done
	
Route42Sign1Text:
	text "ROUTE 42"

	para "ECRUTEAK CITY -"
	line "MAHOGANY TOWN"
	done
	
Route42Sign2Text:
	text "ROUTE 42"

	para "MAHOGANY TOWN -"
	line "ECRUTEAK CITY"
	done
	
MtMortarSignText:
	text "MT.MORTAR"

	para "WATERFALL CAVE"
	line "INSIDE"
	done

Route42_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  8, ROUTE_42_ECRUTEAK_GATE, 3
	warp_event  0,  9, ROUTE_42_ECRUTEAK_GATE, 4
	warp_event 28,  3, MOUNT_MORTAR_1F, 1

	def_coord_events

	def_bg_events
	bg_event  7,  7, BGEVENT_READ, Route42Sign1
	bg_event 29,  5, BGEVENT_READ, MtMortarSign
	bg_event 52,  8, BGEVENT_READ, Route42Sign2
	bg_event 29,  4, BGEVENT_ITEM, Route42HiddenNugget

	def_object_events
	object_event 26, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherTully, -1
	object_event 49,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerBenjamin, -1
	object_event 11,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacShane, -1
	object_event 53,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route42Rocket1Script, EVENT_ROUTE_42_ROCKETS_GONE
	object_event 52,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route42Rocket2Script, EVENT_ROUTE_42_ROCKETS_GONE
	object_event 25, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree1, -1
	object_event 26, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree2, -1
	object_event 27, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route42FruitTree3, -1
	object_event 50, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route42UltraBall, EVENT_ROUTE_42_ULTRA_BALL
	object_event 20, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route42SuperPotion, EVENT_ROUTE_42_SUPER_POTION
