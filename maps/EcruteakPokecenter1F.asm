	object_const_def
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUIDE
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script .MeetBill ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.MeetBill:
	sdefer EcruteakPokecenter1FBillIntro
	end

.DummyScene:
	end

EcruteakPokecenter1FBillIntro:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear ECRUTEAKPOKECENTER1F_BILL
	waitsfx
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement1
	applymovement PLAYER, EcruteakPokecenter1FPlayerMovement1
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 30
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 20
	turnobject ECRUTEAKPOKECENTER1F_BILL, DOWN
	pause 10
	setscene SCENE_FINISHED
	opentext
	writetext EcruteakPokecenter1F_BillText1
	waitbutton
	
EcruteakPokecenter1FBillGivesTM:
	writetext EcruteakPokecenter1F_BillText2
	promptbutton
	verbosegiveitem TM_FALSE_SWIPE
	iffalse EcruteakPokecenter1FBillNoRoom
	writetext EcruteakPokecenter1F_BillText3
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	readvar VAR_FACING
	ifnotequal UP, .FromSide
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	setevent EVENT_ECRUTEAK_POKECENTER_TM75_FALSE_SWIPE
	clearevent EVENT_MET_BILL
	waitsfx
	end

.FromSide:
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement3
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	waitsfx
	end

EcruteakPokecenter1FBillScript:
	faceplayer
	opentext
	sjump EcruteakPokecenter1FBillGivesTM

EcruteakPokecenter1FBillNoRoom:
	writetext EcruteakPokecenter1F_BillNoRoomText
	waitbutton
	closetext
	end

EcruteakPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

EcruteakPokecenter1FPokefanMScript:
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuideScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuideText

EcruteakPokecenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

EcruteakPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakPokecenter1FBillMovement3:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
EcruteakPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end
	
EcruteakPokecenter1F_BillText1:
	text "Heya! The name's"
	line "BILL. And who"
	cont "are you?"

	para "<PLAYER>, huh?"
	line "Nice to meetcha!"
	
	para "Hope you're enjoy-"
	line "ing using the"
	
	para "#MON Storage"
	line "System!"
	
	para "We try to keep"
	line "everything running"
	
	para "as smooth as"
	line "possible."
	done
	
EcruteakPokecenter1F_BillText2:
	text "Say, you're a"
	line "trainer…"
	
	para "Surely you've been"
	line "out trying to"
	
	para "catch all kinds"
	line "of #MON."
	
	para "I've got this old"
	line "TM just knockin'"
	
	para "around… I bet it'd"
	line "help you out!"
	done

EcruteakPokecenter1F_BillText3:
	text "Well it was nice"
	line "to meet you,"
	cont "<PLAYER>."
	
	para "I really should"
	line "head on back to"
	cont "GOLDENROD."
	
	para "'Til next time!"
	done

EcruteakPokecenter1F_BillNoRoomText:
	text "Ah, shoot. Looks"
	line "like you don't"
	cont "have room for it."
	
	para "I'll give you a"
	line "sec to clean out"
	cont "your bag."
	done

EcruteakPokecenter1FPokefanMText:
	text "There was a huge"
	line "tower west of"
	
	para "OLIVINE where"
	line "trainers used to"
	
	para "compete, but it"
	line "closed down a"
	cont "while ago."
	
	para "As far as I know,"
	line "it's sitting"
	cont "derelict now."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "MORTY, the GYM"
	line "LEADER, is soooo"
	cont "cool."

	para "I keep seeing him"
	line "hop on his MURKROW"
	
	para "and fly to the"
	line "east."
	
	para "If only I could go"
	line "with him…"
	done

EcruteakPokecenter1FGymGuideText:
	text "There are whispers"
	line "that the mystical"
	
	para "bird that once"
	line "roosted atop the"
	
	para "TIN TOWER may"
	line "return."
	
	para "Somebody pinch me!"
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuideScript, -1
	object_event  0,  7, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FBillScript, EVENT_ECRUTEAK_POKE_CENTER_BILL
