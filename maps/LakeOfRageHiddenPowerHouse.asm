	object_const_def
	const LAKEOFRAGEHIDDENPOWERHOUSE_ROCKET1
	const LAKEOFRAGEHIDDENPOWERHOUSE_ROCKET2

LakeOfRageHiddenPowerHouse_MapScripts:
	def_scene_scripts

	def_callbacks

HiddenPowerHouseRocket1Script:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, RocketGruntM1SeenText, RocketGruntM1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RocketGruntM1AfterBattleText
	waitbutton
	closetext
	end
	
HiddenPowerHouseRocket2Script:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, RocketGruntF1SeenText, RocketGruntF1BeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext RocketGruntF1AfterBattleText
	waitbutton
	closetext
	end
	
HiddenPowerHouseTM10Bookshelf:
	checkevent EVENT_LAKE_OF_RAGE_HIDDEN_POWER_HOUSE_TM10_HIDDEN_POWER
	iftrue HiddenPowerHouseBookshelf
	opentext
	writetext TM10BookshelfText
	promptbutton
	verbosegiveitem TM_HIDDEN_POWER
	iffalse .NoRoom
	setevent EVENT_LAKE_OF_RAGE_HIDDEN_POWER_HOUSE_TM10_HIDDEN_POWER
	
.NoRoom:
	closetext
	end	

HiddenPowerHouseBookshelf:
	jumpstd DifficultBookshelfScript

RocketGruntM1SeenText:
	text "There's somethin'"
	line "in this drawer."
	
	para "I can just tell."
	
	para "But I can't get"
	line "the dang thing"
	cont "open."
	
	para "Get outta my face"
	line "so I can concen-"
	cont "trate!"
	done
	
RocketGruntM1BeatenText:
	text "Gahh! Mind your"
	line "own business!"
	done
	
RocketGruntM1AfterBattleText:
	text "I'm gonna get"
	line "whatever's hidden"
	
	para "in here, and then"
	line "I'm gonna use it"
	
	para "to give you a"
	line "whoopin'!"
	done
	
RocketGruntF1SeenText:
	text "Ya know, there"
	line "used ta be a guy"
	
	para "who lived in this"
	line "house."
	
	para "Where's he at now?"
	
	para "Workin' the"
	line "kitchen in our HQ!"
	
	para "Nya ha ha!"
	done
	
RocketGruntF1BeatenText:
	text "Cooked…"
	done
	
RocketGruntF1AfterBattleText:
	text "Hey, kid, you'd"
	line "make a great"
	cont "ROCKET."
	
	para "Maybe you could"
	line "work the kitchen"
	
	para "too and climb up"
	line "the ladder…"
	cont "heh."
	done
	
TM10BookshelfText:
	text "There's a key"
	line "conspicuously"

	para "lying on the"
	line "shelf."
	
	para "Using it on the"
	line "drawer causes it"
	cont "to open!"
	done

LakeOfRageHiddenPowerHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 1
	warp_event  3,  7, LAKE_OF_RAGE, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, HiddenPowerHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HiddenPowerHouseTM10Bookshelf

	def_object_events
	object_event  1,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, HiddenPowerHouseRocket1Script, EVENT_CLEARED_LAKE_OF_RAGE
	object_event  5,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, HiddenPowerHouseRocket2Script, EVENT_CLEARED_LAKE_OF_RAGE	
