	object_const_def
	const BLACKTHORNCITY_SUPER_NERD1
	const BLACKTHORNCITY_SUPER_NERD2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_F1
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_COOLTRAINER_F2
	const BLACKTHORNCITY_OFFICER

BlackthornCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Santos

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	endcallback

.Santos:
	checkflag ENGINE_RISINGBADGE
	iftrue .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	endcallback

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	endcallback

BlackthornSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BeatClair
	checkevent EVENT_TALKED_TO_CLAIR_IN_DRAGON_SHRINE
	iftrue .ClairIsIn
	writetext Text_ClairIsOut
	waitbutton
	closetext
	end

.ClairIsIn:
	writetext Text_ClairIsIn
	waitbutton
	closetext
	end

.BeatClair:
	writetext Text_ClairIsBeaten
	waitbutton
	closetext
	end

BlackthornBlackBeltScript:
	jumptextfaceplayer BlackthornBlackBeltText

BlackthornCooltrainerF1Script:
	jumptextfaceplayer BlackthornCooltrainerF1Text

BlackthornYoungsterScript:
	jumptextfaceplayer BlackthornYoungsterText

BlackthornCooltrainerF2Script:
	jumptextfaceplayer BlackthornCooltrainerF2Text
	
BlackthornRangerScript:
	jumptextfaceplayer BlackthornRangerText

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG_FROM_SANTOS
	iftrue .GotCleanseTag
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	promptbutton
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	promptbutton
	verbosegiveitem CLEANSE_TAG
	iffalse .Done
	setevent EVENT_GOT_CLEANSE_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.GotCleanseTag:
	writetext SantosAfterText
	waitbutton
.Done:
	closetext
	end
	
BlackthornCityHiddenStardust:
	hiddenitem STARDUST, EVENT_BLACKTHORN_CITY_HIDDEN_STARDUST

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokecenterSign:
	jumpstd PokecenterSignScript

BlackthornCityMartSign:
	jumpstd MartSignScript

Text_ClairIsOut:
	text "Sorry, but our GYM"
	line "LEADER, CLAIR, is"
	cont "out at the moment."
	
	para "While the LEAGUE"
	line "was suspended, she"
	
	para "spent a lot of"
	line "time in the"
	
	para "DRAGON'S DEN to"
	line "the north."
	
	para "I'd bet you could"
	line "find her there."
	done

Text_ClairIsIn:
	text "CLAIR is waiting"
	cont "for you inside."

	para "Good luck. You're"
	line "gonna need it!"
	done

Text_ClairIsBeaten:
	text "You defeated"
	line "CLAIR?"

	para "That's amazing!"
	line "I look forward to"
	
	para "seeing how far"
	line "you'll make it!"
	done

BlackthornBlackBeltText:
	text "I love breathing"
	line "this cool mountain"
	cont "air."
	
	para "It's deliciously"
	line "invigorating!"
	done

BlackthornCooltrainerF1Text:
	text "Are you going to"
	line "make your #MON"
	cont "forget some moves?"
	
	para "The man in that"
	line "house has a knack"
	cont "for it!"
	done

BlackthornYoungsterText:
	text "Dragon #MON are"
	line "so cool……"
	
	para "CLAIR is so"
	line "dreamy……"
	
	para "…Huh?! I didn't"
	line "say anything!"
	done

MeetSantosText:
	text "SANTOS: Nice to"
	line "meet you!"
	
	para "I'm SANTOS. I'm"
	line "one of seven"
	cont "siblings!"
	
	para "I've been hanging"
	line "around this spot"
	cont "for a long time."
	
	para "I used to hand out"
	line "SPELL TAGs, but"
	
	para "I kept being"
	line "haunted by all"
	
	para "kinds of ghosts"
	line "and it really"
	
	para "started messing"
	line "with my head."
	done

SantosGivesGiftText:
	text "You can have this!"
	
	para "It really helped"
	line "me, and I hope"
	
	para "it'll help you,"
	line "too!"
	done

SantosGaveGiftText:
	text "SANTOS: It's a"
	line "CLEANSE TAG."
	
	para "If one of your"
	line "#MON holds it,"
	
	para "wild #MON won't"
	line "bother you as"
	cont "much."
	done

SantosAfterText:
	text "SANTOS: Hey, you"
	line "should meet my"
	
	para "sister TUSCANY on"
	line "ROUTE 29!"
	
	para "Well, all my"
	line "siblings, really!"
	done

BlackthornCooltrainerF2Text:
	text "The entrance to"
	line "ICE PATH is right"
	cont "over there."
	
	para "Hope you brought"
	line "a coat!"
	done
	
BlackthornRangerText:
	text "This is the"
	line "entrance to ICE"
	cont "PATH."
	
	para "You can go in, but"
	line "a few stalactites"
	
	para "have fallen and"
	line "are currently"
	
	para "blocking the way"
	line "through."
	
	para "We've called for a"
	line "crew to come clear"
	
	para "it out, but it'll"
	line "be a little while."
	
	para "Even when there"
	line "aren't huge"
	
	para "seismic events"
	line "happening, caves"
	
	para "can still be quite"
	line "dangerous."
	
	para "Stay safe!"
	done

BlackthornCitySignText:
	text "BLACKTHORN CITY"

	para "A Quiet Mountain"
	line "Retreat"
	done

BlackthornGymSignText:
	text "BLACKTHORN CITY"
	line "#MON GYM"
	cont "LEADER: CLAIR"

	para "The Blessed User"
	line "of Dragon #MON"
	done

MoveDeletersHouseSignText:
	text "MOVE DELETER'S"
	line "HOUSE"
	done

DragonDensSignText:
	text "DRAGON'S DEN"
	line "AHEAD"
	done

BlackthornCityTrainerTipsText:
	text "TRAINER TIPS"

	para "A #MON holding"
	line "a MYSTERYBERRY"

	para "will restore its"
	line "move's PP if it"
	cont "runs out."
	done

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18, 11, BLACKTHORN_GYM_1F, 1
	warp_event 13, 23, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 29, 23, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 29, BLACKTHORN_MART, 2
	warp_event 21, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event  5, 25, MOVE_DELETERS_HOUSE, 1
	warp_event 36,  9, ICE_PATH_1F, 2
	warp_event 18,  1, DRAGONS_DEN_1F, 1

	def_coord_events

	def_bg_events
	bg_event  9, 35, BGEVENT_READ, BlackthornCitySign
	bg_event 22, 10, BGEVENT_READ, BlackthornGymSign
	bg_event  3, 25, BGEVENT_READ, MoveDeletersHouseSign
	bg_event 22,  2, BGEVENT_READ, DragonDensSign
	bg_event 26, 28, BGEVENT_READ, BlackthornCityTrainerTips
	bg_event 16, 29, BGEVENT_READ, BlackthornCityMartSign
	bg_event 22, 29, BGEVENT_READ, BlackthornCityPokecenterSign
	bg_event 10, 17, BGEVENT_ITEM, BlackthornCityHiddenStardust

	def_object_events
	object_event 18, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 17, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 25, 30, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	object_event  5, 28, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	object_event 17, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 22, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 34, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
	object_event 37, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BlackthornRangerScript, EVENT_BEAT_CLAIR