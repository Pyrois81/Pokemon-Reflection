	object_const_def
	const CIANWOOD_CITY_STANDING_YOUNGSTER
	const CIANWOOD_CITY_POKEFAN_M
	const CIANWOOD_CITY_LASS
	const CIANWOOD_CITY_POKEFAN_F
	const CIANWOOD_CITY_EUSINE
	const CIANWOOD_CITY_SUICUNE
	const CIANWOOD_CITY_CHUCK
	const CIANWOOD_CITY_LAPRAS
	const CIANWOOD_CITY_ROCK1
	const CIANWOOD_CITY_ROCK2
	const CIANWOOD_CITY_ROCK3
	const CIANWOOD_CITY_ROCK4
	const CIANWOOD_CITY_ROCK5
	
CianwoodCity_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_CIANWOOD_CITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CIANWOOD_CITY_SUICUNE_AND_EUSINE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_CIANWOOD
	endcallback

CianwoodCitySuicuneAndEusine:
	special FadeOutMusic
	pause 5
	opentext
	writetext CianwoodCityEusineBeCarefulText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, PLAYER, 20
	applymovement PLAYER, CianwoodCityApproachEusineMovement
	opentext
	writetext CianwoodCityEusineThereItIsText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, CIANWOOD_CITY_SUICUNE, 20
	applymovement CIANWOOD_CITY_EUSINE, CianwoodCityEusineApproachSuicuneMovement
	showemote EMOTE_SHOCK, CIANWOOD_CITY_SUICUNE, 15
	applymovement CIANWOOD_CITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOOD_CITY_SUICUNE
	pause 30
	musicfadeout MUSIC_MYSTICALMAN_ENCOUNTER, 5
	applymovement CIANWOOD_CITY_EUSINE, CianwoodCityEusineWalksBackMovement
	turnobject PLAYER, RIGHT
	pause 5
	opentext
	writetext CianwoodCityEusineThisTimeIsDifferentText
	waitbutton
	closetext
	winlosstext CianwoodCityEusineWinText, CianwoodCityEusineLossText
	setlasttalked CIANWOOD_CITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	readvar VAR_BATTLERESULT
	iftrue .AfterYourDefeat
	; fallthrough
.AfterVictorious:
	writetext CianwoodCityEusineYouWonText
	waitbutton
	sjump .FinishEusine

.AfterYourDefeat:
	writetext CianwoodCityEusineYouLostText
	waitbutton
	; fallthrough
.FinishEusine:
	writetext CianwoodCityEusineAfterText
	waitbutton
	closetext
	pause 15
	applymovement CIANWOOD_CITY_EUSINE, CianwoodCityEusineLeavesMovement1
	turnobject PLAYER, DOWN
	applymovement CIANWOOD_CITY_EUSINE, CianwoodCityEusineLeavesMovement2
	disappear CIANWOOD_CITY_EUSINE
	setscene SCENE_CIANWOOD_CITY_NOTHING
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD
	special HealParty
	special FadeOutMusic
	musicfadeout MUSIC_ECRUTEAK_CITY, 10
	end

CianwoodCityChucksWife:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .BeatChuck
	writetext ChucksWifeEasierToFlyText
	waitbutton
	closetext
	end

.BeatChuck:
	writetext ChucksWifeChuckText
	waitbutton
	closetext
	end

CianwoodCityChuckScript:
	faceplayer
	opentext
	checkevent EVENT_HEARD_CHUCKS_PLAN
	iftrue .ReadyToGo
	writetext CianwoodCityChuckThatWasSomethingText
	promptbutton
	writetext CianwoodCityChuckPlanText
	waitbutton
	setevent EVENT_HEARD_CHUCKS_PLAN
.ReadyToGo
	writetext CianwoodCityChuckReadyToGoText
	yesorno
	iffalse .NotReady
	closetext
	pause 5
	turnobject CIANWOOD_CITY_CHUCK, RIGHT
	pause 15
	playsound SFX_THROW_BALL
	waitsfx
	pause 15
	playsound SFX_BALL_POOF
	appear CIANWOOD_CITY_LAPRAS
	wait 8
	faceplayer
	wait 3
	opentext
	writetext CianwoodCityChuckHopOnText
	; move player to lapras etc
	waitbutton
	closetext
	end
	
.NotReady
	writetext CianwoodCityChuckHurryText
	waitbutton
	closetext
	end

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLass:
	jumptextfaceplayer CianwoodCityLassText

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokecenterSign:
	jumpstd PokecenterSignScript

CianwoodCityRock:
	jumpstd SmashRockScript

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

CianwoodCityApproachEusineMovement:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_end
	
CianwoodCityEusineApproachSuicuneMovement:
	slow_step UP
	step_end
	
CianwoodCitySuicuneDepartMovement:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCityEusineWalksBackMovement:
	step DOWN
	turn_head LEFT
	step_end

CianwoodCityEusineLeavesMovement1:
	step DOWN
	step DOWN
	step_end

CianwoodCityEusineLeavesMovement2:
	step LEFT
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end

ChucksWifeEasierToFlyText:
	text "I believe everyone"
	line "should ride on the"
	
	para "open sea at least"
	line "once, but it isn't"
	
	para "the fastest or"
	line "easiest way to"
	
	para "cross long dis-"
	line "tances."
	
	para "If your #MON"
	line "could FLY, you"
	
	para "could cross JOHTO"
	line "in a flash."
	done

ChucksWifeChuckText:
	text "CHUCK is my hus-"
	line "band, believe it"
	cont "or not."
	
	para "He's not used to"
	line "losing very often."
	
	para "He may act all"
	line "steamed up, but"
	
	para "since you beat"
	line "him, he definite-"
	
	para "ly holds you in"
	line "high regard."
	done

CianwoodCityYoungsterText:
	text "I hear all sorts"
	line "of noises coming"
	cont "from the GYM."
	
	para "Bings, bangs,"
	line "booms… you name"
	cont "it!"
	
	para "I dunno what goes"
	line "on in there, but"
	
	para "CHUCK and his"
	line "students often"
	
	para "come out covered"
	line "in sweat and boul-"
	cont "der dust."
	done

CianwoodCityPokefanMText:
	text "Have ya seen those"
	line "big boulders lyin'"
	cont "around?"
	
	para "A #MON can"
	line "break 'em if they"
	
	para "know a certain"
	line "move."
	
	para "I've heard of peo-"
	line "ple findin' all"
	
	para "kinds of good"
	line "stuff in those"
	cont "rocks."
	done

CianwoodCityLassText:
	text "You SURFed all the"
	line "way here atop a"
	cont "#MON?"
	
	para "Not many people do"
	line "that these days."
	done

CianwoodCityEusineBeCarefulText:
	text "EUSINE: Shhh!"
	
	para "<PLAYER>, be as"
	line "quiet as you can"
	cont "and walk slowly."
	done

CianwoodCityEusineThereItIsText:
	text "There it is…"
	
	para "SUICUNE!"
	
	para "I thought I'd"
	line "never lay eyes on"
	cont "it again."
	
	para "It's so magnifi-"
	line "cent!"
	
	para "I wonder if I"
	line "could just get a"
	cont "little closer…"
	done

CianwoodCityEusineThisTimeIsDifferentText:
	text "Darn it!"
	
	para "Oh well… At least"
	line "now I know SUICUNE"
	
	para "is alive and seem-"
	line "ingly healthy."
	
	para "My burning desire"
	line "to catch SUICUNE"
	
	para "for myself is long"
	line "past, <PLAYER>."
	
	para "That said…"
	
	para "I can see that"
	line "glint in your eye."
	
	para "You have now wit-"
	line "nessed its brill-"
	
	para "iance, and I won't"
	line "try to fight you"
	cont "for it."
	
	para "I do not, however,"
	line "want a repeat of"
	cont "the past."
	
	para "Allow me to battle"
	line "you so that I may"
	
	para "understand what"
	line "type of trainer"
	
	para "you are, and whe-"
	line "ther you are"
	
	para "worthy of such a"
	line "noble creature!"
	done

CianwoodCityEusineWinText:
	text "My mind is made"
	line "up."
	done
	
CianwoodCityEusineLossText:
	text "Hmmm… I see…"
	done

CianwoodCityEusineYouWonText:
	text "What a wonderful"
	line "display of both"
	
	para "skill and gentle-"
	line "ness!"
	
	para "No wonder you've"
	line "made it this far."
	done

CianwoodCityEusineYouLostText:
	text "You may have lost,"
	line "but the way you"
	
	para "battled lets me"
	line "know that you"
	
	para "truly care for"
	line "your #MON."
	done

CianwoodCityEusineAfterText:
	text "You're amazing,"
	line "<PLAYER>!"

	para "I can tell that"
	line "you're not just"
	
	para "some ruthless"
	line "collector."
	
	para "I won't stand in"
	line "your way."
	
	para "Who knows when or"
	line "where SUICUNE will"
	
	para "next make an"
	line "appearance…"
	
	para "But if anyone's"
	line "got a shot at"
	
	para "catching it, my"
	line "money's on you!"
	
	para "I'm rooting for"
	line "you, <PLAYER>."
	done

CianwoodCityChuckThatWasSomethingText:
	text "WHOA-HO-HO!"
	
	para "Now THAT was"
	line "something!"
	
	para "We haven't seen"
	line "SUICUNE around"
	cont "in some time!"
	
	para "Unfortunately,"
	line "that'll have to"
	cont "wait."
	done
	
CianwoodCityChuckPlanText:
	text "Alright, so here's"
	line "the plan:"
	
	para "You said that the"
	line "ROCKETS are sell-"
	
	para "ing off MAGIKARP"
	line "by the hundreds?"
	
	para "They must have a"
	line "lot of shipments"
	
	para "coming in and out"
	line "nonstop, right?"
	
	para "What if we packed"
	line "ourselves in a"
	
	para "crate and had my"
	line "wife's trusty"
	
	para "LAPRAS smuggle"
	line "us into their"
	cont "warehouse?"
	
	para "That way we could"
	line "deal with the"
	
	para "problem from the"
	line "inside!"
	
	para "Believe me - those"
	line "chuckleheads won't"
	
	para "be smart enough to"
	line "notice anything"
	cont "fishy… HOHO!"
	done

CianwoodCityChuckReadyToGoText:
	text "Whaddya say?"
	line "Are you in?"
	done

CianwoodCityChuckHopOnText:
	text "LMAO did u rly"
	line "think sum10 wuz"
	cont "gonna happen ?"
	
	para "LOLZ got een xD"
	done
	
CianwoodCityChuckHurryText:
	text "Take care of what-"
	line "ever business you"
	
	para "need to before we"
	line "set off…"
	
	para "But hurry! The"
	line "sooner we take"
	
	para "care of this, the"
	line "better."
	done

CianwoodCitySignText:
	text "CIANWOOD CITY"

	para "A Port Surrounded"
	line "by Rough Seas"
	done

CianwoodGymSignText:
	text "CIANWOOD CITY"
	line "#MON GYM"

	para "LEADER: CHUCK"

	para "His Roaring Fists"
	line "Do the Talking"
	done

CianwoodPharmacySignText:
	text "500 Years of"
	line "Tradition"

	para "CIANWOOD CITY"
	line "PHARMACY"
	done

CianwoodPokeSeerSignText:
	text "THE ALL-KNOWING"
	line "# SEER"
	done

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 21, MANIAS_HOUSE, 1
	warp_event  6, 41, CIANWOOD_GYM, 1
	warp_event 13, 31, CIANWOOD_POKECENTER_1F, 1
	warp_event 13, 45, CIANWOOD_PHARMACY, 1
	warp_event  5, 29, EUSINES_HOUSE, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 15, POKE_SEERS_HOUSE, 1

	def_coord_events
	coord_event  9, 12, SCENE_CIANWOOD_CITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine

	def_bg_events
	bg_event 11, 35, BGEVENT_READ, CianwoodCitySign
	bg_event  8, 42, BGEVENT_READ, CianwoodGymSign
	bg_event 14, 31, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 14, 46, BGEVENT_READ, CianwoodPharmacySign
	bg_event  4, 16, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event  8, 36, BGEVENT_ITEM, CianwoodCityHiddenRevive
	bg_event  8,  8, BGEVENT_ITEM, CianwoodCityHiddenMaxEther

	def_object_events
	object_event 14, 40, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event  6, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 11, 24, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodCityLass, -1
	object_event  8, 31, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event 11,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE_TOGGLE
	object_event 11,  4, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_SUICUNE_TOGGLE
	object_event 11, 11, SPRITE_CHUCK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodCityChuckScript, EVENT_CIANWOOD_CITY_CHUCK_TOGGLE
	object_event 12, 10, SPRITE_LAPRAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_LAPRAS_TOGGLE
	object_event  4, 43, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  6, 33, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  8, 35, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  6, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  8,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	