ROUTE39FARMHOUSE_MILK_PRICE EQU 999

	object_const_def
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F
	const ROUTE39FARMHOUSE_TWIN1
	const ROUTE39FARMHOUSE_TWIN2
	
Route39Farmhouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route39FarmhouseFarmerScript:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_39_BEES_TOGGLE
	iftrue .DidBees
	checkevent EVENT_ROUTE_39_BARN_BEEDRILL3_TOGGLE
	iftrue .IllCheck
	writetext Route39FarmhouseFarmerBeesText
	waitbutton
	closetext
	end

.IllCheck
	writetext Route39FarmhouseFarmerIllCheckText
	waitbutton
	setevent EVENT_ROUTE_39_BEES_TOGGLE
	setevent EVENT_ROUTE_39_ROCKET_TOGGLE
	closetext
	readvar VAR_FACING
	ifequal UP, .WalkAround
	applymovement ROUTE39FARMHOUSE_POKEFAN_M, Route39FarmhouseFarmerLeaveMovement
.LeaveAndComeBack
	playsound SFX_EXIT_BUILDING
	disappear ROUTE39FARMHOUSE_POKEFAN_M
	pause 120
	playsound SFX_EXIT_BUILDING
	moveobject ROUTE39FARMHOUSE_POKEFAN_M, 2, 7
	appear ROUTE39FARMHOUSE_POKEFAN_M
	pause 5
	turnobject PLAYER, DOWN
	applymovement ROUTE39FARMHOUSE_POKEFAN_M, Route39FarmhouseFarmerReturnMovement
	pause 10
	opentext
.GiveMoomooMilk
	writetext Route39FarmhouseFarmerYouDidItText
	waitbutton
	setevent EVENT_SAVED_MOOMOO_FARM
	verbosegiveitem MOOMOO_MILK
	iffalse .NoRoom
	setevent EVENT_GOT_MOOMOO_MILK_REWARD
	closetext
	end

.WalkAround
	applymovement ROUTE39FARMHOUSE_POKEFAN_M, Route39FarmhouseFarmerWalkAroundMovement
	sjump .LeaveAndComeBack

.DidBees
	checkevent EVENT_GOT_MOOMOO_MILK_REWARD
	iffalse .GiveMoomooMilk	
	writetext Route39FarmhouseFarmerBuyMilkText
	special PlaceMoneyTopRight
	yesorno
	iffalse .NoSale
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequal HAVE_LESS, .NoMoney
	giveitem MOOMOO_MILK
	iffalse .NoRoom
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext Route39FarmhouseFarmerGotMilkText
	promptbutton
	itemnotify
	closetext
	end

.NoMoney
	writetext Route39FarmhouseFarmerNoMoneyText
	waitbutton
	closetext
	end

.NoRoom
	writetext Route39FarmhouseFarmerNoRoomText
	waitbutton
	closetext
	end

.NoSale
	writetext Route39FarmhouseFarmerNoSaleText
	waitbutton
	closetext
	end

Route39FarmhouseFarmerLeaveMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_sleep 2
	step_end
	
Route39FarmhouseFarmerWalkAroundMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step_sleep 2
	step_end

Route39FarmhouseFarmerReturnMovement:
	step UP
	step UP
	step_end

Route39FarmhouseWifeScript:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_39_FARMHOUSE_TM04_ROLLOUT
	iftrue FarmerFScript_GotTM
	checkevent EVENT_SAVED_MOOMOO_FARM
	iftrue FarmerFScript_GiveTM
	writetext Route39FarmhouseWifeInTroubleText
	waitbutton
	closetext
	end

FarmerFScript_GiveTM:
	writetext Route39FarmhouseWifeSavedFarmText
	promptbutton
	verbosegiveitem TM_ROLLOUT
	iffalse FarmerFScript_NoRoomForTM
	setevent EVENT_ROUTE_39_FARMHOUSE_TM04_ROLLOUT
FarmerFScript_GotTM:
	writetext Route39FarmhouseWifeRolloutText
	waitbutton
FarmerFScript_NoRoomForTM:
	closetext
	end

Route39FarmhouseTwin1Script:
	jumptextfaceplayer Route39FarmhouseTwin1Text

Route39FarmhouseTwin2Script:
	jumptextfaceplayer Route39FarmhouseTwin2Text

FarmhouseBookshelf:
	jumpstd PictureBookshelfScript

Route39FarmhouseFarmerBeesText:
	text "Feels like sumpin'"
	line "goes wrong 'round"
	
	para "here dern near"
	line "every day."
	
	para "There's a whole"
	line "wrath a' bees been"
	
	para "botherin' my"
	line "livestock."
	
	para "Don't nobody know"
	line "where they sprung"
	
	para "up from, an' I"
	line "can't get nowhere"
	
	para "close to that hive"
	line "out 'n the barn on"
	
	para "account a' them"
	line "angry BEEDRILL."
	
	para "Reckon I could"
	line "tear it down if I"
	
	para "could just get"
	line "near to the dang"
	cont "thing…"
	done

Route39FarmhouseFarmerIllCheckText:
	text "Whassat? Yer"
	line "tellin' me ya"
	
	para "done cleared out"
	line "all 'em angry BEE-"
	cont "DRILL?"
	
	para "I can't say I be-"
	line "lieve ya, but I"
	
	para "may as well go 'n"
	line "take a look."
	done

Route39FarmhouseFarmerYouDidItText:
	text "Well I'll be!"
	line "Ye actually did"
	cont "it!"
	
	para "I's able ta knock"
	line "down that hive now"
	
	para "that all 'ose"
	line "hateful things 'r"
	cont "gone."
	
	para "We sure are in"
	line "debt to ya."
	
	para "You oughta take a"
	line "bottle 'a MOOMOO"
	cont "MILK."
	done

Route39FarmhouseFarmerBuyMilkText:
	text "How'd ya like to"
	line "pick up a bottle"
	
	para "of our genuine"
	line "MOOMOO MILK?"

	para "We been makin' it"
	line "for quite some"
	
	para "time, 'n people"
	line "swear it makes"
	
	para "'eir #MON happy"
	line "ta drink it."

	para "One bottle's jus'"
	line "¥{d:ROUTE39FARMHOUSE_MILK_PRICE}."
	done

Route39FarmhouseFarmerGotMilkText:
	text "One bottle, comin'"
	line "right up!"
	done

Route39FarmhouseFarmerNoMoneyText:
	text "Sorry, littl'un."
	line "No cash, no sale!"
	done

Route39FarmhouseFarmerNoRoomText:
	text "I reckon yer"
	line "PACK's full."
	done

Route39FarmhouseFarmerNoSaleText:
	text "No milk?"
	line "Ain't no skin"
	cont "off my back."
	done

Route39FarmhouseWifeInTroubleText:
	text "I jus' feel so bad"
	line "fer our MILTANK"
	cont "out in the barn."
	
	para "I know they's"
	line "scads a' BEEDRILL"

	para "out 'ere spookin'"
	line "'em, but we cain't"

	para "hardly do nothin'"
	line "about it."
	done

Route39FarmhouseWifeSavedFarmText:
	text "I cain't thank ye"
	line "enough fer takin'"
	
	para "care 'f our"
	line "problem, sweetie."
	
	para "I'd love fer ya ta"
	line "have this."
	done

Route39FarmhouseWifeRolloutText:
	text "Our MILTANK love"
	line "ta roll around in"
	cont "the grass."
	
	para "Ever' now 'n then"
	line "they'll get ta"
	
	para "goin' so quick"
	line "'at they careen"
	
	para "off inta the fence"
	line "and pack quite a"
	cont "wallop."
	
	para "With ROLLOUT, yer"
	line "#MON can do"
	cont "much the same!"
	done

Route39FarmhouseTwin1Text:
	text "Daddy wants me ta"
	line "take over the fam-"
	cont "ily business."
	
	para "That'd make me"
	line "right happy!"
	
	para "I love 'ose MIL-"
	line "TANK, 'n their"
	
	para "milk is jus'"
	line "too yummy!"
	done
	
Route39FarmhouseTwin2Text:
	text "Mama wants me ta"
	line "take over the fam-"
	cont "ily business."
	
	para "I dunno 'bout all"
	line "that…"
	
	para "I'd rather be a"
	line "cool TRAINER like"
	
	para "you 'n explore"
	line "the world!"
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route39FarmhouseFarmerScript, ROUTE_39_FARMHOUSE_FARMER_TOGGLE
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route39FarmhouseWifeScript, -1
	object_event  4,  6, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route39FarmhouseTwin1Script, -1
	object_event  5,  6, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route39FarmhouseTwin2Script, -1
	