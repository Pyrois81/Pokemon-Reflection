	object_const_def
	const OLIVINECITY_STANDING_YOUNGSTER
	const OLIVINECITY_SAILOR1
	const OLIVINECITY_SAILOR2
	const OLIVINECITY_RIVAL
	const OLIVINECITY_POKEBALL
	const OLIVINECITY_ROCK1
	const OLIVINECITY_ROCK2

OlivineCity_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_OLIVINECITY_NOTHING
	scene_script .DummyScene1 ; SCENE_OLIVINECITY_RIVAL_FIGHT

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .LighthouseDoor

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_OLIVINE
	endcallback

.LighthouseDoor: ; map default = locked door
	checkevent EVENT_OPENED_OLIVINE_LIGHTHOUSE
	iffalse .End
	changeblock 28, 26, $1A ; brick building door
.End
	endcallback

OlivineCityStandingYoungsterScript:
	faceplayer
	opentext
	random 2
	ifequal 0, .FiftyFifty
	writetext OlivineCityStandingYoungsterPokegearText
	waitbutton
	closetext
	end

.FiftyFifty:
	writetext OlivineCityStandingYoungsterPokedexText
	waitbutton
	closetext
	end

OlivineCityRivalSceneRight:
	moveobject OLIVINECITY_RIVAL, 27, 23
	; fallthrough
OlivineCityRivalSceneLeft:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear OLIVINECITY_RIVAL
	applymovement OLIVINECITY_RIVAL, OlivineCityRivalApproachesMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext OlivineCityRivalBeforeFightText
	waitbutton
	closetext
	winlosstext OlivineCityRivalWinText, OlivineCityRivalLossText
	setlasttalked OLIVINECITY_RIVAL
	loadtrainer RIVAL1, RIVAL1_OLIVINE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	readvar VAR_BATTLERESULT
	iftrue .AfterYourDefeat
	; fallthrough
.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext OlivineCityRivalText_YouWon
	waitbutton
	sjump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext OlivineCityRivalText_YouLost
	waitbutton
	; fallthrough
.FinishRival:
	closetext
	pause 20
	playsound SFX_TACKLE
	applymovement PLAYER, OlivineCityPlayerKickedBackMovement
	applymovement OLIVINECITY_RIVAL, OlivineCityRivalLeavesMovement1
	turnobject PLAYER, LEFT
	applymovement OLIVINECITY_RIVAL, OlivineCityRivalLeavesMovement2
	setscene SCENE_OLIVINECITY_NOTHING
	disappear OLIVINECITY_RIVAL
	special HealParty
	playmapmusic
	end

OlivineCitySailor1Script:
	faceplayer
	opentext
	checkevent EVENT_OPENED_OLIVINE_LIGHTHOUSE
	iftrue .Opened
	writetext OlivineCitySailor1LighthouseLockedText
	waitbutton
	closetext
	end
	
.Opened:
	writetext OlivineCitySailor1LighthouseOpenText
	waitbutton
	closetext
	end

OlivineCitySailor2Script:
	jumptextfaceplayer OlivineCitySailor2Text

OlivineCitySign:
	jumptext OlivineCitySignText

OlivineCityPortSign:
	jumptext OlivineCityPortSignText

OlivineGymSign:
	jumptext OlivineGymSignText

OlivineLighthouseSign:
	jumptext OlivineLighthouseSignText

OlivineCityPokecenterSign:
	jumpstd PokecenterSignScript

OlivineCityMartSign:
	jumpstd MartSignScript

OlivineCityLighthouseLockedDoor:
	conditional_event EVENT_OPENED_OLIVINE_LIGHTHOUSE, .DoorScript

.DoorScript:
	opentext
	checkflag ENGINE_MINERALBADGE
	iffalse .DoorIsLocked
	writetext OlivineCityLighthouseOpenDoorText
	waitbutton
	closetext
	playsound SFX_WALL_OPEN
	changeblock 28, 26, $1A ; brick building door
	reloadmappart
	setevent EVENT_OPENED_OLIVINE_LIGHTHOUSE
	waitsfx
	end
	
.DoorIsLocked:
	writetext OlivineCityLighthouseLockedDoorText
	waitbutton
	closetext
	end
	
OlivineCityHardStone:
	itemball HARD_STONE
	
OlivineCityHiddenPPUp:
	hiddenitem PP_UP, EVENT_OLIVINE_CITY_HIDDEN_PP_UP

OlivineCityRock:
	jumpstd SmashRockScript

OlivineCityRivalApproachesMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

OlivineCityRivalLeavesMovement1:
	step UP
	step UP
	step LEFT
	step LEFT
	step_end

OlivineCityRivalLeavesMovement2:
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step_end

OlivineCityPlayerKickedBackMovement:
	fix_facing
	jump_step UP
	remove_fixed_facing
	step_end

OlivineCityStandingYoungsterPokegearText:
	text "Whoa, is that a"
	line "#GEAR? Awesome!"
	
	para "I've always wanted"
	line "to make and re-"
	
	para "ceive phone calls"
	line "on the go!"
	done

OlivineCityStandingYoungsterPokedexText:
	text "You have a #-"
	line "DEX?! Cool!!"

	para "How many #MON"
	line "have you seen??"
	done

OlivineCitySailor1LighthouseLockedText:
	text "Our LIGHTHOUSE has"
	line "been guiding ships"
	cont "for decades."
	
	para "Luckily, it's all"
	line "automated now, so"
	
	para "no one has to sit"
	line "up there and man"
	
	para "it, but that means"
	line "they usually keep"
	
	para "it locked up these"
	line "days."
	done

OlivineCitySailor1LighthouseOpenText:
	text "Yer kiddin'!"
	
	para "JASMINE gave you"
	line "the key to the"
	cont "LIGHTHOUSE, huh?"
	
	para "Well, don't get"
	line "yourself hurt in"
	cont "there."
	done

OlivineCitySailor2Text:
	text "Feel the misty"
	line "breeze on your"
	cont "skin!"
	
	para "Listen to the"
	line "waves crash on"
	cont "the shore!"
	
	para "No place I'd rath-"
	line "er be, I tell ya."
	done

OlivineCityRivalBeforeFightText:
	text "Tch…"
	
	para "You again? Are you"
	line "following me?"
	
	para "Whatever."
	
	para "I heard there's a"
	line "SURF HM in the"
	
	para "LIGHTHOUSE, but"
	line "the door won't"
	cont "budge."
	
	para "I'd like to see"
	line "you try to do"
	
	para "something about"
	line "it."
	
	para "I met some guys in"
	line "all black off to"
	
	para "the west who had"
	line "some good ideas."
	
	para "Maybe I'll see if"
	line "they've got what"
	cont "I want."
	
	para "Before I do that,"
	line "though, battle me."
	
	para "My #MON could"
	line "use some free EXP!"
	done

OlivineCityRivalWinText:
	text "Just get out of"
	line "my way!"
	done

OlivineCityRivalLossText:
	text "Heh. Are you"
	line "even trying?"
	done

OlivineCityRivalText_YouWon:
	text "Psh, you're so"
	line "annoying."
	
	para "Quit wasting my"
	line "time - I've got"
	cont "things to do."
	
	para "Oh, and stop"
	line "following me!"
	done
	
OlivineCityRivalText_YouLost:
	text "You've got to be"
	line "joking."
	
	para "You're telling me"
	line "you've come all"
	
	para "this way and you"
	line "aren't any"
	
	para "stronger than"
	line "THAT?"
	
	para "It's funny,"
	line "honestly."
	
	para "Anyway…"
	line "later, dork!"
	done
	
OlivineCitySignText:
	text "OLIVINE CITY"

	para "JOHTO's Largest"
	line "Seaport"
	done

OlivineCityPortSignText:
	text "OLIVINE PORT"
	line "FAST SHIP PIER"
	done

OlivineGymSignText:
	text "OLIVINE CITY"
	line "#MON GYM"
	cont "LEADER: JASMINE"

	para "The Immovable"
	line "Iron Wall"
	done

OlivineLighthouseSignText:
	text "OLIVINE LIGHTHOUSE"
	
	para "The Sailor's"
	line "North Star"
	done

OlivineCityLighthouseLockedDoorText:
	text "The door is locked"
	line "tight."
	done

OlivineCityLighthouseOpenDoorText:
	text "You have to yank"
	line "on it, but the"
	cont "door opens."
	
	para "Seems like no one"
	line "has been in the"
	
	para "LIGHTHOUSE for"
	line "quite some time."
	done

OlivineCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 11, OLIVINE_POKECENTER_1F, 1
	warp_event 10, 11, OLIVINE_GYM, 1
	warp_event 25, 11, OLIVINE_TIMS_HOUSE, 1
	warp_event 15, 21, OLIVINE_SMEARGLE_HOUSE, 1
	warp_event 29, 11, OLIVINE_ISLANDS_SPEECH_HOUSE, 1
	warp_event 13, 15, OLIVINE_GOOD_ROD_HOUSE, 1
	warp_event 10, 21, OLIVINE_CAFE, 1
	warp_event 19, 17, OLIVINE_MART, 2
	warp_event 29, 27, OLIVINE_LIGHTHOUSE_1F, 1
	warp_event 19, 25, OLIVINE_PORT_PASSAGE, 1
	warp_event 20, 25, OLIVINE_PORT_PASSAGE, 2

	def_coord_events
	coord_event 26, 18, SCENE_OLIVINECITY_RIVAL_FIGHT, OlivineCityRivalSceneLeft
	coord_event 27, 18, SCENE_OLIVINECITY_RIVAL_FIGHT, OlivineCityRivalSceneRight

	def_bg_events
	bg_event 21,  9, BGEVENT_READ, OlivineCitySign
	bg_event 21, 23, BGEVENT_READ, OlivineCityPortSign
	bg_event  8, 12, BGEVENT_READ, OlivineGymSign
	bg_event 30, 28, BGEVENT_READ, OlivineLighthouseSign
	bg_event 16, 11, BGEVENT_READ, OlivineCityPokecenterSign
	bg_event 20, 17, BGEVENT_READ, OlivineCityMartSign
	bg_event 29, 27, BGEVENT_IFNOTSET, OlivineCityLighthouseLockedDoor
	bg_event 31,  8, BGEVENT_ITEM, OlivineCityHiddenPPUp

	def_object_events
	object_event 20, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCityStandingYoungsterScript, -1
	object_event 27, 29, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor1Script, -1
	object_event 13, 24, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySailor2Script, -1
	object_event 26, 23, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY_TOGGLE
	object_event 35, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineCityHardStone, EVENT_OLIVINE_CITY_HARD_STONE
	object_event 34, 26, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCityRock, -1
	object_event 35, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCityRock, -1
