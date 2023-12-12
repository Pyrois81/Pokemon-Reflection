	object_const_def
	const ROUTE43GATE_OFFICER
	const ROUTE43GATE_LASS

Route43Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route43GateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_LAKE_OF_RAGE
	iftrue .Cleared
	writetext Route43GateOfficerText_FishAreDisappearing
	promptbutton
	closetext
	end
	
.Cleared:
	writetext Route43GateOfficerText_Nature
	promptbutton
	closetext
	end

Route43GateLassScript:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_43_GATE_GOT_QUICK_CLAW
	iffalse .GiveQuickClaw
	writetext Route43GateLassBreatherText
	promptbutton
	closetext
	end
	
.GiveQuickClaw:
	writetext Route43GateLassQuickClawText
	promptbutton
	verbosegiveitem QUICK_CLAW
	iffalse .NoRoom
	setevent EVENT_ROUTE_43_GATE_GOT_QUICK_CLAW
	
.NoRoom:
	closetext
	end

Route43GateOfficerText_FishAreDisappearing:
	text "Normally I'd tell"
	line "you to enjoy"
	
	para "fishing in the"
	line "lake, but it seems"
	
	para "like our fish"
	line "numbers are"
	cont "dwindling lately."
	
	para "I sure hope"
	line "somebody can"
	
	para "figure out the"
	line "problem soon…"
	done
	
Route43GateOfficerText_Nature:
	text "Enjoy the beauty"
	line "of nature!"
	done
	
Route43GateLassBreatherText:
	text "I came in here to"
	line "take a breather."
	
	para "There are a lot of"
	line "wild #MON in"
	cont "this area!"
	done
	
Route43GateLassQuickClawText:
	text "It's dangerous"
	line "out there."
	
	para "Sometimes the"
	line "outcome of a"
	
	para "battle can be"
	line "decided in the"
	cont "blink of an eye."
	
	para "You should take"
	line "this."
	
	para "It might just save"
	line "your hide."
	done

Route43Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_43, 4
	warp_event  5,  0, ROUTE_43, 5
	warp_event  4,  7, ROUTE_43, 3
	warp_event  5,  7, ROUTE_43, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route43GateOfficerScript, -1
	object_event  5,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route43GateLassScript, -1
