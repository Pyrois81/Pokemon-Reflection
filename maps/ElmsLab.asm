	object_const_def
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3

ElmsLab_MapScripts:
	def_scene_scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_ELMSLAB_AIDE_GIVES_SUPPLIES
	scene_script .DummyScene4 ; SCENE_ELMSLAB_AIDE_GIVES_TM

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MoveElmCallback
	callback MAPCALLBACK_TILES, .OpenWindowCallback

.MeetElm:
	sdefer .WalkUpToElm
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.MoveElmCallback:
	checkscene
	iftrue .SkipMoveElm ; not SCENE_DEFAULT
	moveobject ELMSLAB_ELM, 5, 1
.SkipMoveElm:
	endcallback

.OpenWindowCallback:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .SkipOpenWindow
	changeblock 4, 0, $09
.SkipOpenWindow:
	endcallback

.WalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SAD, ELMSLAB_ELM, 25
	opentext
	writetext ElmText_StolenMon1
	waitbutton
	writetext ElmText_StolenMon2
	waitbutton
	closetext
	pause 5
	turnobject ELMSLAB_ELM, UP
	pause 10
	playsound SFX_MOVE_PUZZLE_PIECE
	changeblock 4, 0, $20
	reloadmappart
	pause 10
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_Intro
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext ElmText_Refused
	sjump .MustSayYes

.ElmGetsEmail:
	writetext ElmText_Accepted
	promptbutton
	writetext ElmText_WithYourAid
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	applymovement ELMSLAB_ELM, ElmsLab_ElmToComputerMovement
	turnobject PLAYER, LEFT
	opentext
	writetext ElmText_GotAnEmail
	waitbutton
	closetext
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckHat
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckHat:
	checkevent EVENT_SHOWED_TATTERED_HAT_TO_MR_POKEMON
	iffalse ElmCheckPokemon
	checkevent EVENT_GAVE_TATTERED_HAT_TO_ELM
	iffalse ElmGiveHatScript
ElmCheckPokemon:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

VulpixPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic VULPIX
	cry VULPIX
	waitbutton
	closepokepic
	opentext
	writetext TakeVulpixText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_VULPIX_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, VULPIX
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke VULPIX, 3, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterVulpixMovement
	sjump ElmDirectionsScript

PoliwagPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic POLIWAG
	cry POLIWAG
	waitbutton
	closepokepic
	opentext
	writetext TakePoliwagText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_POLIWAG_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, POLIWAG
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke POLIWAG, 3, BERRY
	closetext
	applymovement PLAYER, AfterPoliwagMovement
	sjump ElmDirectionsScript

OddishPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic ODDISH
	cry ODDISH
	waitbutton
	closepokepic
	opentext
	writetext TakeOddishText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_ODDISH_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, ODDISH
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke ODDISH, 3, BERRY
	closetext
	applymovement PLAYER, AfterOddishMovement
	sjump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_SUPPLIES
	setmapscene NEW_BARK_TOWN, SCENE_FINISHED
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmGiveHatScript:
	writetext ElmGiveHatText1
	waitbutton
	writetext ElmGiveHatText2
	promptbutton
	takeitem TATTERED_HAT
	scall ElmJumpBackScript1
	writetext ElmGiveHatText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmGiveHatText4
	promptbutton
	writetext ElmGiveHatText5
	promptbutton
	setevent EVENT_GAVE_TATTERED_HAT_TO_ELM
	setflag ENGINE_MAIN_MENU_MOBILE_CHOICES
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	clearevent EVENT_ROUTE_30_YOUNGSTER_MIKEY
	setevent EVENT_ROUTE_30_BATTLE
	setevent EVENT_ROUTE_46_OPEN
	writetext ElmGiveHatText6
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_AIDE_GIVES_TM
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkSupplies1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveSupplies
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkSupplies2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveSupplies
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveSupplies:
	opentext
	writetext AideText_GiveYouSupplies1
	promptbutton
	verbosegiveitem POTION
	writetext AideText_GiveYouSupplies2
	promptbutton
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 3
	waitbutton
	writetext AideText_ExplainBalls
	promptbutton
	itemnotify
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end
	
AideScript_WalkTM1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouTM
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkTM2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouTM
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouTM:
	opentext
	writetext AideText_GiveYouTM
	promptbutton
	verbosegiveitem TM_CUT
	setevent EVENT_ELMS_LAB_TM51_CUT
	writetext AideText_ExplainCut
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_TATTERED_HAT_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_SHOWED_TATTERED_HAT_TO_MR_POKEMON
	iftrue AideScript_HowWasMrPokemon
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_HowWasMrPokemon:
	writetext AideText_HowWasMrPokemon
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabBookshelf:
	jumpstd DifficultBookshelfScript

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step_end

ElmsLab_ElmToComputerMovement:
	step LEFT
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterVulpixMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterPoliwagMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterOddishMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmText_StolenMon1:
	text "ELM: Urghhhh, when"
	line "will I ever learn?"
	done
	
ElmText_StolenMon2:
	text "Oh, hey there,"
	line "<PLAYER>."
	
	para "Nice of you to"
	line "stop by."
	
	para "It looks as though"
	line "one of my prized"
	
	para "#MON was"
	line "stolen…"
	
	para "…Again…"
	
	para "I miss the old"
	line "days when you"
	
	para "could leave the"
	line "windows open and"
	
	para "the doors unlocked"
	line "without worrying"
	
	para "about some hooli-"
	line "gan coming and"
	
	para "rifling through"
	line "your things."
	done

ElmText_Intro:
	text "Anyhow!"

	para "I needed to ask"
	line "you a favor."

	para "I'm conducting new"
	line "#MON research"

	para "right now. I was"
	line "wondering if you"

	para "could help me with"
	line "it, <PLAYER>."

	para "You see…"

	para "The collapse of"
	line "DARK CAVE five"
	
	para "years ago seems to"
	line "have caused many"
	
	para "wild #MON to"
	line "exhibit strange"

	para "behaviors in the"
	line "time since."
	
	para "Our best theory so"
	line "far is that the"
	
	para "cave was made"
	line "unstable by a"
	
	para "large number of"
	line "DUGTRIO digging"
	cont "under it."
	
	para "However, we still"
	line "haven't been able"
	cont "to prove anything."
	
	para "I'd like you to"
	line "take a #MON"

	para "that I recently"
	line "caught and go out"
	
	para "into the world to"
	line "collect more data."
	
	para "What do you say,"
	line "<PLAYER>?"
	done

ElmText_Accepted:
	text "Thanks, <PLAYER>!"

	para "You're a great"
	line "help!"
	done

ElmText_Refused:
	text "But… Please, I"
	line "need your help!"
	done

ElmText_WithYourAid:
	text "Hopefully with"
	line "your aid, we can"
	
	para "figure out what's"
	line "been causing our"
	
	para "native #MON to"
	line "act so strangely."
	done

ElmText_GotAnEmail:
	text "Oh, hey! I got an"
	line "e-mail!"

	para "<……><……><……>"
	line "Hm… Uh-huh…"

	para "Okay…"
	done

ElmText_MissionFromMrPokemon:
	text "Hey, listen."

	para "I have a colleague"
	line "named MR. #MON."

	para "He's been a great"
	line "resource in the"
	
	para "past, and he"
	line "was essential in"
	
	para "working out the"
	line "details of how"
	
	para "#MON reproduce"
	line "a few years back."
	
	para "He says he's found"
	line "something that"
	
	para "might point us"
	line "in the right"
	cont "direction."
	
	para "I'd go myself, but"
	line "I've experiments"
	
	para "to run and there"
	line "is research to be"
	
	para "done here, so I'm"
	line "afraid I can't"
	cont "leave the lab."

	para "Wait!"
	line "I know!"

	para "<PLAYER>, could you"
	line "go in my place?"
	done

ElmText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAYER>!"

	para "Go on. Pick one!"
	done

ElmText_LetYourMonBattleIt:
	text "If a wild #MON"
	line "appears, let your"
	cont "#MON battle it!"
	done

LabWhereGoingText:
	text "ELM: Wait! Where"
	line "are you going?"
	done

TakeVulpixText:
	text "ELM: You'll take"
	line "VULPIX, the"
	cont "fire #MON?"
	done

TakePoliwagText:
	text "ELM: Do you want"
	line "POLIWAG, the"
	cont "water #MON?"
	done

TakeOddishText:
	text "ELM: So, you like"
	line "ODDISH, the"
	cont "grass #MON?"
	done

DidntChooseStarterText:
	text "ELM: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarterText:
	text "ELM: I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "MR.#MON lives a"
	line "little bit beyond"

	para "CHERRYGROVE, the"
	line "next city over."

	para "His house is just"
	line "before you reach"
	cont "DARK CAVE."
	
	para "It's so close, in"
	line "fact, that he had"
	
	para "to rebuild it"
	line "after the cave-in!"
	
	para "It shouldn't be"
	line "too hard to find,"

	para "but just in case,"
	line "here's my phone"

	para "number. Call me if"
	line "anything comes up!"
	done

ElmDirectionsText2:
	text "If your #MON is"
	line "hurt, you should"

	para "heal it with this"
	line "machine."

	para "Feel free to use"
	line "it anytime."
	done

ElmDirectionsText3:
	text "<PLAYER>, I'm"
	line "counting on you!"
	done

GotElmsNumberText:
	text "<PLAYER> got ELM's"
	line "phone number."
	done

ElmDescribesMrPokemonText:
	text "MR.#MON takes"
	line "a much less…"
	
	para "scientific"
	line "approach to"
	cont "studying #MON."
	
	para "Nevertheless, I'm"
	line "still grateful for"
	cont "his assistance."
	done

ElmPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.ELM."
	
	para "Don't touch!"
	done

ElmsLabHealingMachineText1:
	text "I wonder what this"
	line "machine does?"
	done

ElmsLabHealingMachineText2:
	text "Would you like to"
	line "heal your #MON?"
	done

ElmGiveHatText1:
	text "ELM: You ran into"
	line "the troublemaker"
	
	para "who pilfered my"
	line "#MON?!"
	
	para "Ooh, I hope you"
	line "showed him"
	cont "what-for!"
	
	para "Oh, yes, what was"
	line "MR. #MON's big"
	cont "discovery?"
	done

ElmGiveHatText2:
	text "<PLAYER> handed"
	line "the TATTERED HAT"
	cont "to PROF.ELM."
	done

ElmGiveHatText3:
	text "ELM: This?"
	done

ElmGiveHatText4:
	text "You say you found"
	line "this inside"
	cont "DARK CAVE?"
	
	para "This rabbit hole"
	line "may go much deeper"
	
	para "than I initially"
	line "thought, <PLAYER>."
	done

ElmGiveHatText5:
	text "What?!?"

	para "PROF.OAK was"
	line "visiting"
	cont "MR.#MON?"
	
	para "…and he gave you"
	line "a #DEX?!"

	para "<PLAYER>, that's"
	line "simply incredible!"

	para "He is superb at"
	line "seeing the"
	
	para "potential of"
	line "people as"
	cont "#MON trainers."

	para "Wow, <PLAYER>. You"
	line "may have what it"

	para "takes to become"
	line "the CHAMPION."

	para "You seem to be"
	line "getting on great"
	cont "with #MON too!"

	para "You should take"
	line "the #MON GYM"
	cont "challenge."

	para "After DARK CAVE"
	line "collapsed, the"
	
	para "#MON LEAGUE had"
	line "to shut down for"
	cont "a while."
	
	para "However, they just"
	line "recently announced"
	
	para "that operations"
	line "have resumed!"
	
	para "As the road to"
	line "VIOLET CITY is"
	
	para "still impassable,"	
	line "you'll have to"
	
	para "take ROUTE 46"	
	line "north towards"
	cont "BLACKTHORN CITY."
	
	para "The LEAGUE has"
	line "undergone some"
	
	para "restructuring to"
	line "allow trainers to"
	
	para "take this new"
	line "path!"	
	done

ElmGiveHatText6:
	text "…<PLAYER>, the"
	line "road to the"

	para "championship will"
	line "be a long one."
	
	para "Be careful."
	
	para "The journey is"
	line "tough enough even"
	
	para "without the threat"	
	line "of TEAM ROCKET on"
	cont "the horizon."
	
	para "Keep training and"
	line "forming bonds with"
	
	para "your #MON and"
	line "they will protect"
	
	para "you with all their"
	line "might."

	para "Oh, and before you"
	line "leave, make sure"

	para "that you pay your"
	line "mother a visit!"
	done

ElmAideHasEggText:
	text "ELM: <PLAYER>?"
	line "Didn't you meet my"
	cont "assistant?"

	para "He should have met"
	line "you with the EGG"

	para "at VIOLET CITY's"
	line "#MON CENTER."

	para "You must have just"
	line "missed him. Try to"
	cont "catch him there."
	done

ElmWaitingEggHatchText:
	text "ELM: Hey, has that"
	line "EGG changed any?"
	done

ElmThoughtEggHatchedText:
	text "<PLAYER>? I thought"
	line "the EGG hatched."

	para "Where is the"
	line "#MON?"
	done

ShowElmTogepiText1:
	text "ELM: <PLAYER>, you"
	line "look great!"
	done

ShowElmTogepiText2:
	text "What?"
	line "That #MON!?!"
	done

ShowElmTogepiText3:
	text "The EGG hatched!"
	line "So, #MON are"
	cont "born from EGGS…"

	para "No, perhaps not"
	line "all #MON are."

	para "Wow, there's still"
	line "a lot of research"
	cont "to be done."
	done

ElmGiveEverstoneText1:
	text "Thanks, <PLAYER>!"
	line "You're helping"

	para "unravel #MON"
	line "mysteries for us!"

	para "I want you to have"
	line "this as a token of"
	cont "our appreciation."
	done

ElmGiveEverstoneText2:
	text "That's an"
	line "EVERSTONE."

	para "Some species of"
	line "#MON evolve"

	para "when they grow to"
	line "certain levels."

	para "A #MON holding"
	line "the EVERSTONE"
	cont "won't evolve."

	para "Give it to a #-"
	line "MON you don't want"
	cont "to evolve."
	done

ElmText_CallYou:
	text "ELM: <PLAYER>, I'll"
	line "call you if any-"
	cont "thing comes up."
	done

ElmGiveMasterBallText1:
	text "ELM: Hi, <PLAYER>!"
	line "Thanks to you, my"

	para "research is going"
	line "great!"

	para "Take this as a"
	line "token of my"
	cont "appreciation."
	done

ElmGiveMasterBallText2:
	text "The MASTER BALL is"
	line "the best!"

	para "It's the ultimate"
	line "BALL! It'll catch"

	para "any #MON with-"
	line "out fail."

	para "It's given only to"
	line "recognized #MON"
	cont "researchers."

	para "I think you can"
	line "make much better"

	para "use of it than I"
	line "can, <PLAYER>!"
	done

ElmGiveTicketText1:
	text "ELM: <PLAYER>!"
	line "There you are!"

	para "I called because I"
	line "have something for"
	cont "you."

	para "See? It's an"
	line "S.S.TICKET."

	para "Now you can catch"
	line "#MON in KANTO."
	done

ElmGiveTicketText2:
	text "The ship departs"
	line "from OLIVINE CITY."

	para "But you knew that"
	line "already, <PLAYER>."

	para "After all, you've"
	line "traveled all over"
	cont "with your #MON."

	para "Give my regards to"
	line "PROF.OAK in KANTO!"
	done

AideText_GiveYouSupplies1:
	text "<PLAYER>, I want"
	line "you to have this"
	cont "for your errand."
	done

AideText_GiveYouSupplies2:
	text "And you may as"
	line "well take these,"
	cont "too."
	done

AideText_ExplainBalls:
	text "Throw # BALLS"
	line "at wild #MON"
	
	para "to try to catch"
	line "them!"
	done

AideText_AlwaysBusy:
	text "There are only two"
	line "of us, so we're"
	cont "always busy."
	done

AideText_HowWasMrPokemon:
	text "How was MR."
	line "#MON?"
	
	para "It's been some"
	line "time since he"
	
	para "last stopped by"
	line "the LAB."
	done

AideText_GiveYouTM:
	text "Before you head"
	line "out, we'd like you"
	
	para "to have this"
	line "TECHNICAL MACHINE."
	done
	
AideText_ExplainCut:
	text "CUT is a simple"
	line "move - a staple"
	
	para "in any trainer's"
	line "toolkit."
	
	para "It used to be very"
	line "important for"
	
	para "trainers to have,"
	line "but the JOHTO"
	
	para "Park Service has"
	line "made a concerted"
	
	para "effort to remove"
	line "all those pesky"
	
	para "trees from the"
	line "main roads."
	
	para "It may still come"
	line "in handy off the"
	
	para "beaten path,"
	line "though."
	
	para "Oh, and don't for-"
	line "get, you can use"
	
	para "a TM as many times"
	line "as you want!"
	done
	
ElmsLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

ElmsLabPCText:
	text "OBSERVATIONS ON"
	line "#MON EVOLUTION"

	para "…It says on the"
	line "screen…"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_SUPPLIES, AideScript_WalkSupplies1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_SUPPLIES, AideScript_WalkSupplies2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_TM, AideScript_WalkTM1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_TM, AideScript_WalkTM2

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, -1
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VulpixPokeBallScript, EVENT_VULPIX_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PoliwagPokeBallScript, EVENT_POLIWAG_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OddishPokeBallScript, EVENT_ODDISH_POKEBALL_IN_ELMS_LAB
