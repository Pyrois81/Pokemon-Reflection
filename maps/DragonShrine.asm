	object_const_def
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_ELDER2
	const DRAGONSHRINE_ELDER3
	const DRAGONSHRINE_CLAIR
	const DRAGONSHRINE_DRAGONAIR

DragonShrine_MapScripts:
	def_scene_scripts

	def_callbacks

DragonShrineElder1Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .CheckDay
	
.NormalSpeech:
	writetext DragonShrineElder1Text
	waitbutton
	closetext
	end

.CheckDay:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SilverHere
	ifequal THURSDAY, .SilverHere
	sjump .NormalSpeech

.SilverHere:
	writetext DragonShrineSilverIsInTrainingText
	waitbutton
	closetext
	end

DragonShrineElder2Script:
	faceplayer
	opentext
	writetext DragonShrineElder2Text
	waitbutton
	closetext
	end

DragonShrineElder3Script:
	faceplayer
	opentext
	writetext DragonShrineElder3Text
	waitbutton
	closetext
	end
	
DragonShrineClairScript:
	faceplayer
	opentext
	writetext DragonShrineClairText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkOutMovement
	disappear DRAGONSHRINE_CLAIR
	turnobject DRAGONSHRINE_DRAGONAIR, LEFT
	showemote EMOTE_QUESTION, DRAGONSHRINE_DRAGONAIR, 30
	showemote EMOTE_SHOCK, DRAGONSHRINE_DRAGONAIR, 15
	applymovement DRAGONSHRINE_DRAGONAIR, DragonShrineDragonairWalkOutMovement
	disappear DRAGONSHRINE_DRAGONAIR
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	setevent EVENT_TALKED_TO_CLAIR_IN_DRAGON_SHRINE
	end
	
DragonShrineDragonairScript:
	opentext
	writetext DragonShrineDragonairText
	cry DRAGONAIR
	waitbutton
	closetext
	end

DragonShrineClairWalkOutMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
DragonShrineDragonairWalkOutMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DragonShrineElder1Text:
	text "This shrine was"
	line "built both as a"
	
	para "place to train and"
	line "as a show of"
	
	para "reverence toward"
	line "dragon #MON."
	done

DragonShrineSilverIsInTrainingText:
	text "A boy close to"
	line "your age is in"
	cont "training here."

	para "He is strong, but"
	line "it is obvious that"
	
	para "he must clear his"
	line "mind if he is ever"
	cont "to be truly great."
	done

DragonShrineElder2Text:
	text "Dragon #MON are"
	line "both resilient"
	
	para "and terrifyingly"
	line "powerful."
	
	para "They are truly"
	line "marvelous beings."
	done

DragonShrineElder3Text:
	text "The earth quaking"
	line "and cracking"
	
	para "caused a massive"
	line "whirlpool to"
	
	para "appear in our"
	line "cavern."
	
	para "It is concerning,"
	line "but it seems to be"
	
	para "stable at the"
	line "present time."
	done
	
DragonShrineClairText:
	text "Oh, another"
	line "trainer!"
	
	para "And so soon after"
	line "the last one!"
	
	para "The LEAGUE must"
	line "really be back in"
	cont "full force…"
	
	para "Anyway! Sorry for"
	line "stepping away from"
	cont "the GYM for a bit."
	
	para "While no trainers"
	line "were able to take"
	
	para "the LEAGUE"
	line "challenge, I began"
	
	para "spending more and"
	line "more time down"
	
	para "here, and I"
	line "haven't broken the"
	cont "habit yet."
	
	para "Meet me back at"
	line "the GYM and we'll"
	
	para "see what you're"
	line "made of!"
	done
	
DragonShrineDragonairText:
	para "DRAGONAIR: Nair!"
	done

DragonShrine_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, DRAGONS_DEN_B1F, 2
	warp_event  5,  9, DRAGONS_DEN_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, -1
	object_event  2,  5, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder2Script, -1
	object_event  7,  5, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder3Script, -1
	object_event  4,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonShrineClairScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event  5,  3, SPRITE_EKANS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonShrineDragonairScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
