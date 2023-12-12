	object_const_def
	const ICEPATH1F_BEAUTY
	const ICEPATH1F_YOUNGSTER
	const ICEPATH1F_LORELEI
	const ICEPATH1F_POKE_BALL1
	const ICEPATH1F_POKE_BALL2
	const ICEPATH1F_POKE_BALL3
	const ICEPATH1F_POKE_BALL4

IcePath1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .Blockade
	
.Blockade: ; map default = open path
	checkflag ENGINE_RISINGBADGE
	iftrue .IceBlock
	changeblock 36, 12, $19
	changeblock 36, 14, $16
	
.IceBlock: ; map default = room blocked
	checkevent EVENT_ICE_PATH_MELTED_ICE
	iffalse .End
	changeblock 34,  2, $02

.End:
	endcallback
	
IcePath1FIceBlock:
	conditional_event EVENT_ICE_PATH_MELTED_ICE, .CheckIce
	
.CheckIce:
	opentext
	writetext IcePath1FIceBlockText
	waitbutton
	checkitem MOLT_FEATHER
	iffalse .End
	writetext IcePath1FHoldUpFeatherText
	yesorno
	iffalse .End
	writetext IcePath1FUseFeatherText
	promptbutton
	setevent EVENT_ICE_PATH_MELTED_ICE
	takeitem MOLT_FEATHER
	playsound SFX_SWORDS_DANCE
	waitsfx
	playsound SFX_SWORDS_DANCE
	changeblock 34,  2, $02
	reloadmappart
	
.End:
	closetext
	end

TrainerSkierNatalie:	
	trainer SKIER, NATALIE, EVENT_BEAT_SKIER_NATALIE, SkierNatalieSeenText, SkierNatalieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierNatalieAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperNeil:	
	trainer CAMPER, NEIL, EVENT_BEAT_CAMPER_NEIL, CamperNeilSeenText, CamperNeilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperNeilAfterBattleText
	waitbutton
	closetext
	end
	
IcePath1FLoreleiScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_LORELEI
	iftrue .Talked
	writetext LoreleiIntroText
	setevent EVENT_TALKED_TO_LORELEI
	waitbutton
	closetext
	end
	
.Talked:
	writetext LoreleiPostText
	waitbutton
	closetext
	end

IcePath1FGreatBall:
	itemball GREAT_BALL

IcePath1FIron:
	itemball IRON

IcePath1FTMEndure:
	itemball TM_ENDURE
	
IcePath1FXAttack:
	itemball X_ATTACK
	
IcePath1FHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ICE_PATH_1F_HIDDEN_SUPER_POTION
	
IcePath1FHiddenStardust:
	hiddenitem STARDUST, EVENT_ICE_PATH_1F_HIDDEN_STARDUST
	
IcePath1FIceBlockText:
	text "It's a solid block"
	line "of crystal-clear"
	cont "ice."
	
	para "Somehow it seems"
	line "even colder than"
	cont "its surroundings."
	done
	
IcePath1FHoldUpFeatherText:
	text "Hold up the"
	line "MOLT.FEATHER to"
	cont "the ice?"
	done
	
IcePath1FUseFeatherText:
	text "The ice begins to"
	line "melt!"
	
	para "But it seems to be"
	line "drawing out the"
	cont "feather's heat."
	done
	
SkierNatalieSeenText:
	text "Hey! Doesn't my"
	line "outfit look cute"
	cont "and warm?"
	done
	
SkierNatalieBeatenText:
	text "Aww, that's okay."
	line "Good battle!"
	done
	
SkierNatalieAfterBattleText:
	text "Sometimes I wish I"
	line "could be a FURRET."
	
	para "They always look"
	line "so cute and warm"
	cont "in the snow!"
	done
	
CamperNeilSeenText:
	text "Yo, you know the"
	line "way outta here?"
	done
	
CamperNeilBeatenText:
	text "Geez, lay off!"
	done
	
CamperNeilAfterBattleText:
	text "I came in here"
	line "thinking it'd make"
	
	para "for a good camping"
	line "spot."
	
	para "I definitely"
	line "underestimated how"
	
	para "cold it'd be,"
	line "though!"
	done
	
LoreleiIntroText:
	text "Oh! You look to be"
	line "a young trainer."
	
	para "Maybe you can"
	line "assist me."
	
	para "I am LORELEI, icy"
	line "queen of the KANTO"
	cont "ELITE FOUR."
	
	para "We're on hiatus"
	line "while the LEAGUE"
	
	para "sorts things out,"
	line "so I've come to"
	
	para "JOHTO on a"
	line "personal mission."
	
	para "You see, the"
	line "legendary bird"
	
	para "ARTICUNO once made"
	line "its nest in the"
	cont "SEAFOAM ISLANDS."
	
	para "However, I've"
	line "spoken to citizens"
	
	para "in both CINNABAR"
	line "and PALLET TOWN"
	
	para "who state they saw"
	line "it flying toward"
	cont "the west."
	
	para "I believe this"
	line "cave is its most"
	
	para "likely hideout,"
	line "but I haven't been"
	
	para "able to narrow it"
	line "down more than"
	cont "that."
	
	para "I'll keep looking"
	line "for answers,"
	
	para "and you should"
	line "as well!"
	done
	
LoreleiPostText:
	text "Any new info on"
	line "ARTICUNO?"
	
	para "Good luck… to"
	line "both of us!"
	done

IcePath1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 25, ROUTE_44, 1
	warp_event 34, 31, BLACKTHORN_CITY, 7
	warp_event 35,  1, ICE_PATH_B1F, 3
	warp_event  5,  5, ICE_PATH_B1F, 1
	warp_event  3, 15, ICE_PATH_B1F, 2

	def_coord_events

	def_bg_events
	bg_event 35,  2, BGEVENT_IFNOTSET, IcePath1FIceBlock
	bg_event 10,  5, BGEVENT_ITEM, IcePath1FHiddenSuperPotion
	bg_event 18, 21, BGEVENT_ITEM, IcePath1FHiddenStardust

	def_object_events
	object_event 12,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TrainerSkierNatalie, -1
	object_event  9, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerCamperNeil, -1
	object_event 16, 23, SPRITE_LORELEI, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IcePath1FLoreleiScript, EVENT_FOUGHT_ARTICUNO
	object_event 24,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FGreatBall, EVENT_ICE_PATH_1F_GREAT_BALL
	object_event 30, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FIron, EVENT_ICE_PATH_1F_IRON
	object_event 10, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FTMEndure, EVENT_ICE_PATH_1F_TM20_ENDURE
	object_event 30, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FXAttack, EVENT_ICE_PATH_1F_X_ATTACK
