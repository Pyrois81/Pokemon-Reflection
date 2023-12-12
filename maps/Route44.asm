	object_const_def
	const ROUTE44_FISHER1
	const ROUTE44_FISHER2
	const ROUTE44_YOUNGSTER1
	const ROUTE44_SUPER_NERD
	const ROUTE44_YOUNGSTER2
	const ROUTE44_COOLTRAINER_M
	const ROUTE44_COOLTRAINER_F
	const ROUTE44_FRUIT_TREE
	const ROUTE44_POKE_BALL1
	const ROUTE44_POKE_BALL2
	const ROUTE44_POKE_BALL3

Route44_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperVance:
	trainer BIRD_KEEPER, VANCE, EVENT_BEAT_BIRD_KEEPER_VANCE, BirdKeeperVanceSeenText, BirdKeeperVanceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperVanceLegendaryBirdsText
	waitbutton
	closetext
	end

TrainerPsychicPhil:
	trainer PSYCHIC_T, PHIL, EVENT_BEAT_PSYCHIC_PHIL, PsychicPhilSeenText, PsychicPhilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicPhilAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherWilton:
	trainer FISHER, WILTON, EVENT_BEAT_FISHER_WILTON, FisherWiltonSeenText, FisherWiltonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherWiltonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherEdgar:
	trainer FISHER, EDGAR, EVENT_BEAT_FISHER_EDGAR, FisherEdgarSeenText, FisherEdgarBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherEdgarAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerFCybil:
	trainer COOLTRAINERF, CYBIL, EVENT_BEAT_COOLTRAINERF_CYBIL, CooltrainerFCybilSeenText, CooltrainerFCybilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFCybilAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacZach:
	trainer POKEMANIAC, ZACH, EVENT_BEAT_POKEMANIAC_ZACH, PokemaniacZachSeenText, PokemaniacZachBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacZachAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerMAllen:
	trainer COOLTRAINERM, ALLEN, EVENT_BEAT_COOLTRAINERM_ALLEN, CooltrainerMAllenSeenText, CooltrainerMAllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerMAllenAfterBattleText
	waitbutton
	closetext
	end

Route44Sign1:
	jumptext Route44Sign1Text

Route44Sign2:
	jumptext Route44Sign2Text

Route44FruitTree:
	fruittree FRUITTREE_ROUTE_44

Route44EnergyPowder:
	itemball ENERGYPOWDER

Route44NeverMeltIce:
	itemball NEVERMELTICE

Route44GreatBall:
	itemball GREAT_BALL

Route44HiddenElixir:
	hiddenitem ELIXIR, EVENT_ROUTE_44_HIDDEN_ELIXIR

FisherWiltonSeenText:
	text "You came through"
	line "that cave?"

	para "You must be pretty"
	line "tough, kid."
	done

FisherWiltonBeatenText:
	text "Pretty tough,"
	line "indeed!"
	done

FisherWiltonAfterBattleText:
	text "There's mighty"
	line "good fishin' in"
	cont "this pond."
	
	para "You oughta give it"
	line "a try if you've"
	cont "got a ROD!"
	done

FisherEdgarSeenText:
	text "Hey, kid!"
	
	para "Don't disturb me"
	line "while I'm anglin'!"
	done

FisherEdgarBeatenText:
	text "I wasn't ready for"
	line "a battle!"
	done

FisherEdgarAfterBattleText:
	text "I like fishin'"
	line "more than battlin'"
	
	para "to be honest with"
	line "you."
	done

BirdKeeperVanceSeenText:
	text "Do you know about"
	line "the legendary bird"
	cont "#MON?"
	done

BirdKeeperVanceBeatenText:
	text "Whew! You're hot"
	line "stuff."
	done

BirdKeeperVanceLegendaryBirdsText:
	text "ARTICUNO, ZAPDOS"
	line "and MOLTRES are"

	para "the three legend-"
	line "ary bird #MON."

	para "I heard there are"
	line "other legendary"
	cont "birds, though."
	done

PsychicPhilSeenText:
	text "I foresaw that you"
	line "would come for"
	cont "this item!"
	done

PsychicPhilBeatenText:
	text "I predicted you"
	line "would win, too!"
	done

PsychicPhilAfterBattleText:
	text "My psychic powers"
	line "never cease"
	cont "to amaze."
	done

PokemaniacZachSeenText:
	text "I'll do anything"
	line "to get my hands on"
	cont "rare #MON!"
	done

PokemaniacZachBeatenText:
	text "Oooh, your #MON"
	line "are so appealing."
	done

PokemaniacZachAfterBattleText:
	text "There are #MON"
	line "out there with"
	
	para "different colors"
	line "than usual."
	
	para "I've heard they're"
	line "rare, though."
	done

CooltrainerMAllenSeenText:
	text "Hey, you!"
	
	para "You look like"
	line "you're strong."
	
	para "Let's battle!"
	done

CooltrainerMAllenBeatenText:
	text "How invigorating!"
	done

CooltrainerMAllenAfterBattleText:
	text "It's not too often"
	line "that someone"
	cont "beats me."
	
	para "There's always"
	line "room to improve!"
	done

CooltrainerFCybilSeenText:
	text "You think you can"
	line "just waltz across"
	cont "MY bridge?"
	done

CooltrainerFCybilBeatenText:
	text "Gah! Why couldn't"
	line "I beat you?"
	done

CooltrainerFCybilAfterBattleText:
	text "Sorry. I've been"
	line "a little worked"
	cont "up recently."
	
	para "My brother just"
	line "got his third"
	
	para "BADGE, and I've"
	line "been training like"
	
	para "crazy to try to"
	line "catch up to him!"
	done

Route44Sign1Text:
	text "ICE PATH AHEAD"
	line "WATCH YOUR STEP!"
	done

Route44Sign2Text:
	text "ROUTE 44"

	para "MAHOGANY TOWN -"
	line "BLACKTHORN CITY"
	done

Route44_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 54,  3, ICE_PATH_1F, 1

	def_coord_events

	def_bg_events
	bg_event 50, 10, BGEVENT_READ, Route44Sign1
	bg_event  9,  7, BGEVENT_READ, Route44Sign2
	bg_event 49,  3, BGEVENT_ITEM, Route44HiddenElixir

	def_object_events
	object_event 43,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherWilton, -1
	object_event 27,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherEdgar, -1
	object_event 22, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicPhil, -1
	object_event 28,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacZach, -1
	object_event 21,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperVance, -1
	object_event 34, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerMAllen, -1
	object_event 24,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerFCybil, -1
	object_event 12,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route44FruitTree, -1
	object_event 33,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44EnergyPowder, EVENT_ROUTE_44_ENERGYPOWDER
	object_event 57, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44NeverMeltIce, EVENT_ROUTE_44_NEVERMELTICE
	object_event 23, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44GreatBall, EVENT_ROUTE_44_GREAT_BALL
