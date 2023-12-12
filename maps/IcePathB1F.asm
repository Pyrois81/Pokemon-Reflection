	object_const_def
	const ICEPATHB1F_BLACK_BELT
	const ICEPATHB1F_HIKER
	const ICEPATHB1F_POKE_BALL1
	const ICEPATHB1F_POKE_BALL2

IcePathB1F_MapScripts:
	def_scene_scripts

	def_callbacks

IcePathB1FBlackBeltScript:
	opentext
	writetext IcePathB1FBlackBeltText
	waitbutton
	closetext
	end
	
TrainerFirebreatherFrank:
	trainer FIREBREATHER, FRANK, EVENT_BEAT_FIREBREATHER_FRANK, FirebreatherFrankSeenText, FirebreatherFrankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherFrankAfterBattleText
	waitbutton
	closetext
	end

IcePathB1FIceHeal:
	itemball ICE_HEAL
	
IcePathB1FEther:
	itemball ETHER
	
IcePathB1FHiddenExpCandyS:
	hiddenitem EXP_CANDY_S, EVENT_ICE_PATH_B1F_HIDDEN_EXP_CANDY_S

IcePathB1FBlackBeltText:
	text "I'm here doing"
	line "some endurance"
	cont "training."
	
	para "My sensei says I"
	line "have to stay down"
	
	para "here for 3 days"
	line "straight before"
	
	para "I'll be tough"
	line "enough!"
	done

FirebreatherFrankSeenText:
	text "Are ya cold?"
	
	para "A battle'll warm"
	line "ya right up!"
	done

FirebreatherFrankBeatenText:
	text "You're brimming"
	line "with heat now!"
	done

FirebreatherFrankAfterBattleText:
	text "I love hangin' out"
	line "down here with my"
	cont "#MON."
	
	para "We tend to get too"
	line "hot outdoors."
	done
	
IcePathB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, ICE_PATH_1F, 4
	warp_event  3, 15, ICE_PATH_1F, 5
	warp_event 32, 17, ICE_PATH_1F, 3
	warp_event 33,  3, ICE_PATH_B2F, 1

	def_coord_events

	def_bg_events
	bg_event 27, 12, BGEVENT_ITEM, IcePathB1FHiddenExpCandyS

	def_object_events
	object_event 26,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IcePathB1FBlackBeltScript, -1
	object_event  8, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerFirebreatherFrank, -1 
	object_event 12,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB1FIceHeal, EVENT_ICE_PATH_B1F_ICE_HEAL
	object_event 28, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB1FEther, EVENT_ICE_PATH_B1F_ETHER
