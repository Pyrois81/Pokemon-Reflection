	object_const_def
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3
	const ECRUTEAKCITY_MAGIKARP1
	const ECRUTEAKCITY_MAGIKARP2
	const ECRUTEAKCITY_MAGIKARP3
	const ECRUTEAKCITY_MAGIKARP4
	const ECRUTEAKCITY_POKE_BALL
	const ECRUTEAKCITY_SUDOWOODO1
	const ECRUTEAKCITY_SUDOWOODO2

EcruteakCity_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_ECRUTEAKCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_ECRUTEAKCITY_OLD_MAN_CUTS_TREE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .Trees

.DummyScene0:
	end

.DummyScene1:
	end
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

.Trees: ; map default = trees present
	checkflag EVENT_ECRUTEAK_CITY_CUT_TREES
	iffalse .HaventCut
	changeblock 16, 30, $60
	changeblock 18, 30, $62
	
.HaventCut:
	endcallback

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityGramps3Script:
	jumptextfaceplayer EcruteakCityGramps3Text

EcruteakCityLassScript:
	jumptextfaceplayer EcruteakCityLassText

EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_TOWER
	iftrue .ClearedRocketTower
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end

.ClearedRocketTower:
	checkevent EVENT_ECRUTEAK_CITY_FISHER_EXP_CANDY_M
	iftrue .GotCandy
	writetext EcruteakCityFisherText_ClearedRocketTower
	waitbutton
	checkpoke SKARMORY
	iftrue .ShowSkarmory
	closetext
	end

.ShowSkarmory:
	writetext EcruteakCityFisherText_ShowSkarmory
	waitbutton
	verbosegiveitem EXP_CANDY_M
	iffalse .End
	setevent EVENT_ECRUTEAK_CITY_FISHER_EXP_CANDY_M
	
.End:
	closetext
	end
	
.GotCandy:
	writetext EcruteakCityFisherText_GotCandy
	waitbutton
	closetext
	end
	
EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCityMagikarpScript:
	opentext
	cry MAGIKARP
	writetext EcruteakCityMagikarpText
	waitbutton
	closetext
	end

EcruteakCityOldManCutsTreeScript:
	moveobject ECRUTEAKCITY_GRAMPS1, 5, 29
	showemote PLAYER, EMOTE_QUESTION, 30
	applymovement ECRUTEAKCITY_GRAMPS1, EcruteakCityOldManMovesToTreesMovement1
	follow ECRUTEAKCITY_GRAMPS1, PLAYER
	applymovement ECRUTEAKCITY_GRAMPS1, EcruteakCityOldManMovesToTreesMovement2
	stopfollow
	opentext
	writetext EcruteakCityOldManTreeText1
	closetext
	pause 15
	changeblock 16, 30, $60
	changeblock 18, 30, $62
	reloadmappart
	appear ECRUTEAKCITY_SUDOWOODO1
	appear ECRUTEAKCITY_SUDOWOODO2
	turnobject PLAYER, DOWN
	showemote PLAYER, EMOTE_SHOCK, 10
	showemote ECRUTEAKCITY_GRAMPS1, EMOTE_SHOCK, 10
	playsound SFX_GRASS_RUSTLE
	applymovement ECRUTEAKCITY_SUDOWOODO2, EcruteakCitySudowoodoShakeMovement
	waitsfx
	playsound SFX_WATER_GUN
	applymovement ECRUTEAKCITY_SUDOWOODO2, EcruteakCitySudowoodo2Movement
	disappear ECRUTEAKCITY_SUDOWOODO2
	opentext
	writetext EcruteakCityOldManTreeText2
	waitbutton
	closetext
	applymovement ECRUTEAKCITY_GRAMPS1, EcruteakCityOldManLeavesMovement
	moveobject ECRUTEAKCITY_GRAMPS1, 21, 14
	setevent EVENT_ECRUTEAK_CITY_CUT_TREES
	setscene SCENE_ECRUTEAKCITY_NOTHING
	end

EcruteakCitySudowoodo1Script:
	playsound SFX_SANDSTORM
	waitsfx
	applymovement ECRUTEAKCITY_SUDOWOODO1, EcruteakCitySudowoodoShakeMovement
	opentext
	writetext EcruteakCitySudowoodoAttackedText
	waitbutton
	closetext
	loadwildmon SUDOWOODO, 30
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	ifequal DRAW, .DidntCatch
	disappear ECRUTEAKCITY_SUDOWOODO1
	reloadmapafterbattle
	end

.DidntCatch:
	reloadmapafterbattle
	applymovement ECRUTEAKCITY_SUDOWOODO1, EcruteakCitySudowoodo1FleeMovement
	disappear ECRUTEAKCITY_SUDOWOODO1
	special RefreshSprites
	end

EcruteakCityKingsRock:
	itemball KINGS_ROCK
	
EcruteakCitySign:
	jumptext EcruteakCitySignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd PokecenterSignScript

EcruteakCityMartSign:
	jumpstd MartSignScript

EcruteakCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ECRUTEAK_CITY_HIDDEN_MAX_ETHER

EcruteakCityOldManMovesToTreesMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
EcruteakCityOldManMovesToTreesMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

EcruteakCitySudowoodo2Movement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakCityOldManLeavesMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

EcruteakCitySudowoodoShakeMovement:
	tree_shake
	step_end

EcruteakCitySudowoodo1FleeMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakCityGramps1Text:
	text "Aren't the MAGI-"
	line "KARP just"
	cont "beautiful?"
	
	para "All the different"
	line "colors…"
	
	para "They're dazzling!"
	done

EcruteakCityGramps2Text:
	text "Seeing the KIMONO"
	line "GIRLS dance is"
	
	para "something every"
	line "visitor to ECRU-"
	cont "TEAK should do!"
	
	para "But they're not"
	line "just graceful"
	cont "dancers!"
	
	para "They are all"
	line "experienced #-"
	cont "MON trainers, too."
	done

EcruteakCityLassText:
	text "I love practicing"
	line "at the DANCE"
	cont "THEATER."

	para "All the girls"
	line "there use evolved"
	cont "#MON."
	
	para "They're so"
	line "impressive!"
	done

EcruteakCityFisherText:
	text "I heard a rumor"
	line "that TEAM ROCKET"
	
	para "has a base in"
	line "OLIVINE."
	
	para "…You don't think"
	line "that could be"
	cont "true, do you?"
	done

EcruteakCityFisherText_ClearedRocketTower:
	text "You say there WAS"
	line "a ROCKET base at"
	cont "OLIVINE?"
	
	para "And that YOU took"
	line "care of them?"
	
	para "Yeah, right. Next"
	line "you'll tell me"
	
	para "there are metal"
	line "birds flyin'"
	cont "around!"
	done

EcruteakCityFisherText_ShowSkarmory:
	text "What…? What's that"
	line "#MON?"
	
	para "SKARMORY?"
	
	para "I guess you're the"
	line "real deal, kid."
	
	para "Sorry I ever"
	line "doubted you."
	
	para "Here, take this!"
	done

EcruteakCityFisherText_GotCandy:
	text "Go show TEAM"
	line "ROCKET who's boss!"
	done
	
EcruteakCityYoungsterText:
	text "I heard that the"
	line "guardian of ILEX"
	
	para "FOREST has become"
	line "agitated due to"
	
	para "the natural"
	line "disaster."
	
	para "It's impossible to"
	line "know for sure,"
	cont "though."
	
	para "There has never"
	line "been a confirmed"
	cont "sighting of it."
	done

EcruteakCityGramps3Text:
	text "Three dogs of"
	line "legend,"
	
	para "RAIKOU, ENTEI,"
	line "and SUICUNE,"
	
	para "once died and were"
	line "reborn here."
	
	para "No one has seen"
	line "them since…"
	
	para "Some believe they"
	line "were caught by a"
	
	para "particularly"
	line "strong trainer,"
	
	para "while others think"
	line "they have been"
	
	para "living out their"
	line "lives in the wild."
	done

EcruteakCityMagikarpText:
	text "MAGIKARP: Karp!"
	done

EcruteakCityOldManTreeText1:
	text "These darn trees"
	line "sprouted up dang"
	
	para "near overnight,"
	line "and nobody's come"
	
	para "to clear the path"
	line "yet."
	
	para "Figured it was"
	line "about time to take"
	
	para "matters into my"
	line "own hands, so I"
	
	para "went 'n grabbed my"
	line "trusty saw."
	
	para "Time to give these"
	line "scraggly trees"
	cont "what-for!"
	done

EcruteakCityOldManTreeText2:
	text "Oh my stars, they"
	line "were #MON all"
	cont "along!"
	
	para "You can take care"
	line "of this other one,"
	cont "can'tcha?"
	
	para "I need to go sit"
	line "down…"
	done

EcruteakCitySudowoodoAttackedText:
	text "The wiggly tree"
	line "attacked!"
	done

EcruteakCitySignText:
	text "ECRUTEAK CITY"
	line "A Historical City"

	para "Where the Past"
	line "Meets the Present"
	done

EcruteakGymSignText:
	text "ECRUTEAK CITY"
	line "#MON GYM"
	cont "LEADER: MORTY"

	para "The Mystic Seer of"
	line "the Future"
	done

EcruteakDanceTheaterSignText:
	text "ECRUTEAK DANCE"
	line "THEATER"
	done

BurnedTowerSignText:
	text "BURNED TOWER"

	para "It was destroyed"
	line "by a mysterious"
	cont "fire."

	para "Feel free to come"
	line "inside to pay"
	cont "your respects."
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 22,  3, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 26,  2, ECRUTEAK_TIN_TOWER_ENTRANCE, 3
	warp_event 26,  3, ECRUTEAK_TIN_TOWER_ENTRANCE, 3
	warp_event 21, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event 13, 17, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 21, 19, DANCE_THEATRE, 1
	warp_event 25, 27, ECRUTEAK_MART, 2
	warp_event 10, 27, ECRUTEAK_GYM, 1
	warp_event  9, 21, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event 37,  5, TIN_TOWER_1F, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4

	def_coord_events
	coord_event 10, 28, SCENE_ECRUTEAKCITY_OLD_MAN_CUTS_TREE, EcruteakCityOldManCutsTreeScript

	def_bg_events
	bg_event 31, 27, BGEVENT_READ, EcruteakCitySign
	bg_event 12, 28, BGEVENT_READ, EcruteakGymSign
	bg_event 19, 19, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  4,  8, BGEVENT_READ, BurnedTowerSign
	bg_event 22, 27, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 26, 27, BGEVENT_READ, EcruteakCityMartSign
	bg_event  1, 11, BGEVENT_ITEM, EcruteakCityHiddenMaxEther

	def_object_events
	object_event 21, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 23, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 17, 25, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLassScript, -1
	object_event 14, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
	object_event  6, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps3Script, EVENT_ECRUTEAK_CITY_GRAMPS
	object_event 18,  9, SPRITE_MAGIKARP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityMagikarpScript, -1
	object_event 25, 10, SPRITE_MAGIKARP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityMagikarpScript, -1
	object_event 28, 12, SPRITE_MAGIKARP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, EcruteakCityMagikarpScript, -1
	object_event 10, 10, SPRITE_MAGIKARP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityMagikarpScript, -1
	object_event 10,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EcruteakCityKingsRock, EVENT_ECRUTEAK_CITY_KINGS_ROCK
	object_event 17, 30, SPRITE_SUDOWOODO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCitySudowoodo1Script, EVENT_ECRUTEAK_CITY_SUDOWOODO1
	object_event 18, 30, SPRITE_SUDOWOODO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_CITY_SUDOWOODO2
