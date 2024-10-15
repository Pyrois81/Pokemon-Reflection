	object_const_def
	const OLIVINEPORT_SAILOR1
	const OLIVINEPORT_SAILOR2
	const OLIVINEPORT_SAILOR3
	const OLIVINEPORT_FISHING_GURU1
	const OLIVINEPORT_FISHING_GURU2
	const OLIVINEPORT_YOUNGSTER
	const OLIVINEPORT_COOLTRAINER_F

OlivinePort_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_OLIVINEPORT_LEAVE_SHIP

	def_callbacks

.DummyScene0:
	end

.LeaveFastShip:
	sdefer .LeaveFastShipScript
	end

.LeaveFastShipScript:
	applymovement PLAYER, OlivinePortLeaveFastShipMovement
	appear OLIVINEPORT_SAILOR1
	setscene SCENE_DEFAULT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod OLIVINE_CITY
	end

OlivinePortSailorAtGangwayScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue OlivinePortAlreadyRodeScript
	writetext OlivinePortSailorGetOnBoardText
	waitbutton
	closetext
	turnobject OLIVINEPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear OLIVINEPORT_SAILOR1
	waitsfx
	applymovement PLAYER, OlivinePortEnterFastShipMovement
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	clearevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_COOLTRAINERM_SEAN
	clearevent EVENT_BEAT_COOLTRAINERF_CAROL
	clearevent EVENT_BEAT_GENTLEMAN_EDWARD
	clearevent EVENT_BEAT_BEAUTY_CASSIE
	clearevent EVENT_BEAT_PSYCHIC_RODNEY
	clearevent EVENT_BEAT_SUPER_NERD_SHAWN
	clearevent EVENT_BEAT_SAILOR_GARRETT
	clearevent EVENT_BEAT_FISHER_JONAH
	clearevent EVENT_BEAT_BLACKBELT_WAI
	clearevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	appear OLIVINEPORT_SAILOR1
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end

OlivinePortAlreadyRodeScript:
	writetext OlivinePortCantBoardText
	waitbutton
	closetext
	end

OlivinePortSailorAfterHOFScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue OlivinePortAlreadyRodeScript
	writetext OlivinePortAskBoardText
	yesorno
	iffalse OlivinePortNotRidingScript
	writetext OlivinePortAskTicketText
	promptbutton
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext OlivinePortFlashTicketText
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	readvar VAR_FACING
	ifequal DOWN, .Down
	applymovement PLAYER, OlivinePortApproachFastShipAfterHOFFromLeftMovement
	; fallthrough
.Down
	applymovement PLAYER, OlivinePortApproachFastShipAfterHOFMovement
	sjump OlivinePortSailorAtGangwayScript

.NoTicket:
	writetext OlivinePortNoTicketText
	waitbutton
	closetext
	end

OlivinePortWalkUpToShipScript:
	turnobject OLIVINEPORT_SAILOR3, RIGHT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .skip
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .skip
	turnobject PLAYER, LEFT
	opentext
	writetext OlivinePortAskBoardText
	yesorno
	iffalse OlivinePortNotRidingMoveAwayScript
	writetext OlivinePortAskTicketText
	promptbutton
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext OlivinePortFlashTicketText
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	applymovement PLAYER, OlivinePortApproachFastShipMovement
	sjump OlivinePortSailorAtGangwayScript

.NoTicket:
	writetext OlivinePortNoTicketText
	waitbutton
	closetext
	applymovement PLAYER, OlivinePortMoveFromCoordEventMovement
	; fallthrough
.skip:
	end

OlivinePortNotRidingScript:
	writetext OlivinePortNotRidingText
	waitbutton
	closetext
	end

OlivinePortNotRidingMoveAwayScript:
	writetext OlivinePortMoveFromCoordEventText
	waitbutton
	closetext
	applymovement PLAYER, OlivinePortMoveFromCoordEventMovement
	end

OlivinePortSailorBeforeHOFScript:
	jumptextfaceplayer OlivinePortSailorBeforeHOFText

OlivinePortFishingGuru1Script:
	faceplayer
	opentext
	writetext OlivinePortFishingGuru1Text
	waitbutton
	closetext
	turnobject OLIVINEPORT_FISHING_GURU1, UP
	end

OlivinePortFishingGuru2Script:
	faceplayer
	opentext
	writetext OlivinePortFishingGuru2Text
	waitbutton
	closetext
	turnobject OLIVINEPORT_FISHING_GURU2, UP
	end

OlivinePortYoungsterScript:
	faceplayer
	opentext
	writetext OlivinePortYoungsterText
	waitbutton
	closetext
	turnobject OLIVINEPORT_YOUNGSTER, DOWN
	end

OlivinePortCooltrainerFScript:
	faceplayer
	opentext
	writetext OlivinePortCooltrainerFText
	waitbutton
	closetext
	turnobject OLIVINEPORT_COOLTRAINER_F, DOWN
	end

OlivinePortHiddenProtein:
	hiddenitem PROTEIN, EVENT_OLIVINE_PORT_HIDDEN_PROTEIN

OlivinePortEnterFastShipMovement:
	step DOWN
	step_end

OlivinePortLeaveFastShipMovement:
	step UP
	step_end

OlivinePortMoveFromCoordEventMovement:
	step RIGHT
	turn_head LEFT
	step_end

OlivinePortApproachFastShipMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

OlivinePortApproachFastShipAfterHOFFromLeftMovement:
	step UP
	step RIGHT
	step_end
	
OlivinePortApproachFastShipAfterHOFMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

OlivinePortSailorGetOnBoardText:
	text "We're departing"
	line "soon. Please get"
	cont "on board."
	done

OlivinePortCantBoardText:
	text "Ship's not settin'"
	line "sail again for a"
	cont "while."
	
	para "Go enjoy JOHTO!"
	done

OlivinePortAskBoardText:
	text "Welcome to FAST"
	line "SHIP S.S.AQUA!"

	para "Will you be board-"
	line "ing today?"
	done

OlivinePortAskTicketText:
	text "May I see your"
	line "S.S.TICKET?"
	done

OlivinePortNotRidingText:
	text "No? No worries!"
	
	para "We hope to see you"
	line "again soon!"
	done

OlivinePortFlashTicketText:
	text "<PLAYER> flashed"
	line "the S.S.TICKET."

	para "That'll do it."
	line "Thank you very"
	cont "much!"
	done

OlivinePortNoTicketText:
	text "Hmm… looks as"
	line "though you don't"
	cont "have a ticket."

	para "We'll be here when"
	line "you get one!"
	done

OlivinePortMoveFromCoordEventText:
	text "Very well. I will"
	line "ask that you clear"
	
	para "the gangway,"
	line "though."
	done

OlivinePortMondayShipText:
	text "The FAST SHIP will"
	line "sail next Monday."
	done

OlivinePortFridayShipText:
	text "The FAST SHIP will"
	line "sail next Friday."
	done

OlivinePortFishingGuru1Text:
	text "These here're"
	line "ocean waters."
	
	para "That means you c'n"
	line "find all sorts 'a"
	
	para "sea critters in"
	line "'em."
	done

OlivinePortFishingGuru2Text:
	text "Different RODS are"
	line "better at catching"
	
	para "different #MON,"
	line "and different"

	para "#MON are found"
	line "in different"
	cont "climates."
	
	para "Over time one"
	line "gains a sort of"
	
	para "intuition about"
	line "it all."
	done

OlivinePortYoungsterText:
	text "S.S.AQUA uses jets"
	line "to skim over the"
	cont "waves!"
	
	para "It's a real smooth"
	line "ride."
	done

OlivinePortCooltrainerFText:
	text "I've heard the"
	line "#MON in KANTO are"
	cont "super strong."

	para "Part of me wants"
	line "to go see, but"
	
	para "the rest of me is"
	line "scared stiff!"
	done

OlivinePortSailorBeforeHOFText:
	text "Careful, kid."
	
	para "You're fine on the"
	line "pier, but you're"
	
	para "not authorized to"
	line "be on the gangway."
	done

OlivinePort_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  7, OLIVINE_PORT_PASSAGE, 5
	warp_event  7, 23, FAST_SHIP_1F, 1

	def_coord_events
	coord_event  7, 16, SCENE_DEFAULT, OlivinePortWalkUpToShipScript

	def_bg_events
	bg_event  1, 18, BGEVENT_ITEM, OlivinePortHiddenProtein

	def_object_events
	object_event  7, 23, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortSailorAtGangwayScript, EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY
	object_event  7, 16, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortSailorBeforeHOFScript, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  6, 16, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortSailorAfterHOFScript, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event  4, 14, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortFishingGuru1Script, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 13, 14, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortFishingGuru2Script, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  3, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortYoungsterScript, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event 15, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortCooltrainerFScript, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
