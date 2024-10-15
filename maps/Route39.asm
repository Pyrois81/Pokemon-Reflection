ROUTE39_MOMO_MILK_PRICE EQU 200

	object_const_def
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_MILTANK1
	const ROUTE39_MILTANK2
	const ROUTE39_MILTANK3
	const ROUTE39_MILTANK4
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2
	const ROUTE39_ROCKET
	const ROUTE39_POKEBALL1

Route39_MapScripts:
	def_scene_scripts

	def_callbacks

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanMDerek:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanMDerekSeenText, PokefanMDerekBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanMDerekAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanFRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanFRuthSeenText, PokefanFRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanFRuthAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanFJamie:
	trainer POKEFANF, JAMIE, EVENT_BEAT_POKEFANF_JAMIE, PokefanFJamieSeenText, PokefanFJamieBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext PokefanFJamieAfterBattleText
	waitbutton
	closetext
	end

Route39RocketScript:
	faceplayer
	opentext
	checkevent EVENT_MET_MOMO_MILK_GUY
	iftrue .BuyMilk
	writetext Route39RocketMomoMilkText
	waitbutton
	setevent EVENT_MET_MOMO_MILK_GUY
.BuyMilk:
	writetext Route39RocketBuyMilkText
	special PlaceMoneyTopRight
	yesorno
	iffalse .NoSale
	checkmoney YOUR_MONEY, ROUTE39_MOMO_MILK_PRICE
	ifequal HAVE_LESS, .NoMoney
	giveitem MOMO_MILK
	iffalse .NoRoom
	takemoney YOUR_MONEY, ROUTE39_MOMO_MILK_PRICE
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext Route39RocketGotMilkText
	promptbutton
	itemnotify
	closetext
	end

.NoMoney
	writetext Route39RocketNoMoneyText
	waitbutton
	closetext
	end

.NoRoom
	writetext Route39RocketNoRoomText
	waitbutton
	closetext
	end

.NoSale
	writetext Route39RocketNoSaleText
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

Route39FruitTree:
	fruittree FRUITTREE_ROUTE_39

Route39Calcium:
	itemball CALCIUM

Route39HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route39MiltankText:
	text "MILTANK: Mooo!"
	done

SailorEugeneSeenText:
	text "Avast ye,"
	line "scallywag!"
	done

SailorEugeneBeatenText:
	text "Curses!"
	done

SailorEugeneAfterBattleText:
	text "I'm no pirate."
	
	para "I just think the"
	line "way they talk is"
	cont "cool."
	done

PokefanMDerekSeenText:
	text "Hey, you see that"
	line "BALL over there?"
	
	para "I've been trying"
	line "to get my PIKACHU"
	
	para "to squeeze through"
	line "these trees, but"
	
	para "it's not happen-"
	line "ing."
	done

PokefanMDerekBeatenText:
	text "Another disap-"
	line "pointment…"
	done

PokefanMDerekAfterBattleText:
	text "Maybe my PIKACHU"
	line "can't do every-"
	
	para "thing, and that's"
	line "okay!"
	done

PokefanFRuthSeenText:
	text "Oh, you're a"
	line "TRAINER?"
	
	para "Would you mind"
	line "showing me your"
	cont "#MON?"
	done

PokefanFRuthBeatenText:
	text "That's okay."
	done

PokefanFRuthAfterBattleText:
	text "Thanks for showing"
	line "me your babies."
	
	para "They're simply"
	line "charming!"
	done

PsychicNormanSeenText:
	text "I sense great"
	line "power from you."
	
	para "Allow me to test"
	line "your skills!"
	done

PsychicNormanBeatenText:
	text "Fascinating."
	done

PsychicNormanAfterBattleText:
	text "People and #MON"
	line "alike have differ-"
	cont "ing potentials."
	
	para "It seems like you"
	line "are destined for"
	cont "greatness."
	done

PokefanFJamieSeenText:
	text "Have you tried"
	line "MOOMOO MILK?"
	
	para "I just can't"
	line "get enough!"
	
	para "Say, you don't"
	line "have any on you,"
	cont "do you?"
	done

PokefanFJamieBeatenText:
	text "I don't know what"
	line "came over me."
	done

PokefanFJamieAfterBattleText:
	text "I bought so much"
	line "MOOMOO MILK that"
	
	para "they had to cut"
	line "me off."
	
	para "…Probably for the"
	line "best, now that I"
	cont "think about it."
	done

Route39RocketMomoMilkText:
	text "Hey, hey, glad to"
	line "make your acquain-"
	cont "tance."
	
	para "You ever heard of"
	line "MOOMOO MILK?"
	
	para "It's sooo tasty,"
	line "but who's got the"
	
	para "cash for that"
	line "hefty price tag,"
	cont "am I right?"

	para "Just between you"
	line "and me:"
	
	para "I've got somethin'"
	line "just as good for"
	cont "way cheaper."
	done
	
Route39RocketBuyMilkText:	
	text "Gen-u-ine MOMO"
	line "MILK, straight"
	
	para "from CROCKETT"
	line "FARMS, made with"
	
	para "only the finest"
	line "natural and arti-"
	cont "ficial flavorings."
	
	para "One bottle'll run"
	line "ya just ¥{d:ROUTE39_MOMO_MILK_PRICE}."
	
	para "We got a deal?"
	done
	
Route39RocketGotMilkText:
	text "Thanks kindly for"
	line "your business."
	
	para "Oh, and by the"
	line "way…"
	
	para "No refunds!"
	done
	
Route39RocketNoMoneyText:
	text "Hey, what gives?"
	
	para "This ain't a"
	line "charity!"
	done

Route39RocketNoRoomText:
	text "You don't have a"
	line "spot in your pack?"
	
	para "What are you,"
	line "an amateur?"
	done
	
Route39RocketNoSaleText:
	text "Don't come craw-"
	line "lin' back to me"
	
	para "when those hill-"
	line "billies charge ya"
	
	para "an arm and a leg"
	line "for the real"
	cont "thing!"
	done

Route39SignText:
	text "ROUTE 39"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done

MoomooFarmSignText:
	text "MOOMOO FARM"

	para "Enjoy Our Fresh"
	line "and Tasty Milk"
	done

Route39TrainerTipsText:
	text "TRAINER TIPS"

	para "Use HEADBUTT on"
	line "trees to shake"
	cont "#MON out."

	para "Different kinds of"
	line "#MON drop out"
	cont "of trees."

	para "Use HEADBUTT on"
	line "any tree you see!"
	done

Route39_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  5, ROUTE_39_BARN, 1
	warp_event  9,  5, ROUTE_39_FARMHOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 15, 11, BGEVENT_READ, Route39TrainerTips
	bg_event 11,  7, BGEVENT_READ, MoomooFarmSign
	bg_event  7, 31, BGEVENT_READ, Route39Sign
	bg_event  5, 13, BGEVENT_ITEM, Route39HiddenNugget

	def_object_events
	object_event 12, 31, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorEugene, -1
	object_event  4, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanMDerek, -1
	object_event 14, 14, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerPokefanFRuth, -1
	object_event  3, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  6, 11, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  4, 15, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  7, 14, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 10, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicNorman, -1
	object_event  7,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39FruitTree, -1
	object_event  7, 18, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPokefanFJamie, -1
	object_event 12,  9, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39RocketScript, EVENT_ROUTE_39_ROCKET_TOGGLE
	object_event  1, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route39Calcium, EVENT_ROUTE_39_CALCIUM
