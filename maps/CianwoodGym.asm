	object_const_def
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_TOWER
	iftrue .ClearedRocketTower
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDoneNoTM
	writetext ChuckIntroText
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext ChuckMadText
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK, LEFT
	pause 15
	opentext
	writetext ChuckKiaiText
	waitbutton
	closetext
	playsound SFX_EGG_BOMB ; EXPLOSION
	earthquake 45
	disappear CIANWOODGYM_BOULDER1
	pause 30
	turnobject CIANWOODGYM_CHUCK, DOWN
	opentext
	writetext ChuckThatsBetterText
	promptbutton
	setflag ENGINE_STORMBADGE
	playsound SFX_GET_BADGE
	waitsfx
	writetext GetStormBadgeText
	promptbutton

.FightDoneNoTM:
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegiveitem TM_DYNAMICPUNCH
	iffalse .BagFull
	setevent EVENT_CIANWOOD_GYM_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	writetext ChuckWhatNextText
	waitbutton
	closetext
	applymovement CIANWOODGYM_CHUCK, ChuckJumpsOffMovement
	pause 5
	turnobject PLAYER, LEFT
	opentext
	writetext ChuckGotAnIdeaText
	waitbutton
	closetext
	applymovement CIANWOODGYM_CHUCK, ChuckLeavesGymMovement
	disappear CIANWOODGYM_CHUCK
	setmapscene CIANWOOD_CITY, SCENE_CIANWOOD_CITY_SUICUNE_AND_EUSINE
	clearevent EVENT_CIANWOOD_CITY_CHUCK_TOGGLE
	clearevent EVENT_CIANWOOD_CITY_EUSINE_TOGGLE
	clearevent EVENT_CIANWOOD_CITY_SUICUNE_TOGGLE
	end

.BagFull:
	closetext
	end

.ClearedRocketTower:
	writetext ChuckAfterRocketTowerText
	waitbutton
	closetext
	end

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

ChuckJumpsOffMovement:
	jump_step RIGHT
	step_sleep 4
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	turn_head RIGHT
	step_end	

ChuckLeavesGymMovement:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end
	
CianwoodGymBoulder:
	jumpstd StrengthBoulderScript

CianwoodGymHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_CIANWOOD_GYM_HIDDEN_MAX_POTION
	
CianwoodGymHiddenHPUp:
	hiddenitem HP_UP, EVENT_CIANWOOD_GYM_HIDDEN_HP_UP

ChuckIntroText:
	text "CHUCK: HAHAHA!"
	line "so you made it"
	cont "this far…"
	
	para "Outstanding!"
	
	para "You must really"
	line "have some guts,"
	cont "kid."
	
	para "But, as you know,"
	line "you gotta go"
	
	para "through me if you"
	line "wanna become the"
	
	para "CHAMPION, and I'm"
	line "not about to take"
	cont "it easy on ya."
	
	para "You see, I'm an"
	line "artist…"
	
	para "A performance"
	line "artist."
	
	para "My #MON are my"
	line "brush, and my"
	
	para "opponent is my"
	line "canvas…"
	
	para "And I never pass"
	line "up a chance to"
	
	para "make a master-"
	line "piece!"
	done

ChuckLossText:
	text "Huff… Puff…"
	line "I lost?"
	done

ChuckMadText:
	text "GAHHH! I hate"
	line "losing!"
	
	para "It just makes me"
	line "wanna…"
	done
	
ChuckKiaiText:
	text "KIAI!!"
	done

ChuckThatsBetterText:
	text "Phew… that's"
	line "better."
	
	para "Just had to let"
	line "some of the ol'"
	cont "stress out."
	
	para "It's handy havin'"
	line "all of these rocks"
	cont "lyin' about!"
	
	para "Sorry for losin'"
	line "my head."
	
	para "Ya beat me fair"
	line "and square, so you"
	cont "deserve this!"
	done

GetStormBadgeText:
	text "<PLAYER> received"
	line "STORMBADGE."
	done

ChuckExplainBadgeText:
	text "That BADGE is a"
	line "symbol of power."
	
	para "Anyone who sees it"
	line "will immediately"
	
	para "know how strong"
	line "you are!"

	para "Ooh, and you"
	line "oughta take this,"
	cont "too."
	done

ChuckExplainTMText:
	text "That's DYNAMIC-"
	line "PUNCH."

	para "It's a full-force"
	line "haymaker, so it"
	
	para "isn't all that ac-"
	line "curate, but when"
	
	para "it does hit, it's"
	line "guaranteed to make"
	
	para "your opponent see"
	line "stars!"
	done

ChuckWhatNextText:
	text "WAHAHAHAH! You"
	line "really threw me"
	cont "for a loop!"

	para "What's your next"
	line "move, kid?"

	para "Back to the main-"
	line "land?"
	
	para "Relax on the"
	line "beach?"
	
	para "<……><……>"
	
	para "TEAM ROCKET?!"
	
	para "In OLIVINE?!?!"
	done
	
ChuckGotAnIdeaText:
	text "I had no idea!"
	
	para "I'm with you --"
	line "they need to be"
	
	para "rooted out, and"
	line "there's no way I'm"
	
	para "sittin' on my rear"
	line "out here while a"
	
	para "kid goes to take"
	line "'em on alone."
	
	para "<……><……>"
	
	para "I've got an idea!"
	
	para "Meet me at the"
	line "northern end of"
	
	para "the shore when"
	line "you're ready."
	done

ChuckAfterRocketTowerText:
	text "Thanks again for"
	line "all your help,"
	cont "<PLAYER>."
	
	para "It took a lotta"
	line "courage to take"
	
	para "TEAM ROCKET head-"
	line "on."
	done

BlackbeltYoshiSeenText:
	text "There's no bond"
	line "stronger than that"
	
	para "formed during ex-"
	line "tensive training."
	
	para "Let me show you!"
	done

BlackbeltYoshiBeatenText:
	text "Ah, I see you've"
	line "trained as well."
	done

BlackbeltYoshiAfterText:
	text "You've got to"
	line "crawl through this"
	
	para "spooky cave to"
	line "have any chance of"
	cont "getting to CHUCK."
	
	para "Watch for falling"
	line "GEODUDE!"
	done

BlackbeltLaoSeenText:
	text "It's clobberin'"
	line "time!"
	done

BlackbeltLaoBeatenText:
	text "KO'd…"
	done

BlackbeltLaoAfterText:
	text "CHUCK and the rest"
	line "of us trainers"
	
	para "carved this GYM"
	line "out of the moun-"
	
	para "tain with our bare"
	line "hands."
	done

BlackbeltNobSeenText:
	text "Hey, you,"
	line "chump!"
	
	para "Don't look at me"
	line "like that!"
	
	para "You think I'm"
	line "dumb, don'tcha?"
	done

BlackbeltNobBeatenText:
	text "Oof. Gut punch!"
	done

BlackbeltNobAfterText:
	text "Could a dumb guy"
	line "smash bricks with"
	cont "his forehead?"
	
	para "Didn't think so!"
	done

BlackbeltLungSeenText:
	text "You wanna take on"
	line "CHUCK?"
	
	para "Hah, fat chance!"
	done

BlackbeltLungBeatenText:
	text "Owowow, cramp!"
	done

BlackbeltLungAfterText:
	text "If you're strong"
	line "like us, you can"
	
	para "pick these boul-"
	line "ders up over your"
	
	para "head and toss 'em"
	line "aside."
	
	para "A shrimp like you"
	line "might wanna get a"
	
	para "#MON to take"
	line "care of it for"
	
	para "ya, though,"
	line "OHOHO!"
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 15, CIANWOOD_CITY, 2
	warp_event  9, 11, CIANWOOD_GYM, 3
	warp_event  9,  3, CIANWOOD_GYM, 2

	def_coord_events

	def_bg_events
	bg_event  9,  1, BGEVENT_ITEM, CianwoodGymHiddenMaxPotion
	bg_event 10,  8, BGEVENT_ITEM, CianwoodGymHiddenHPUp

	def_object_events
	object_event  4,  2, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, EVENT_CIANWOOD_GYM_CHUCK_TOGGLE
	object_event 10, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltYoshi, -1
	object_event  1, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltLao, -1
	object_event 10,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltNob, -1
	object_event  5,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltLung, -1
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  9,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  9,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  1, 15, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
