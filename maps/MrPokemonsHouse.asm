	object_const_def
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	def_scene_scripts
	scene_script .MeetMrPokemon ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.MeetMrPokemon:
	sdefer .MrPokemonEvent
	end

.DummyScene:
	end

.MrPokemonEvent:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	promptbutton
	waitsfx
	giveitem TATTERED_HAT
	writetext MrPokemonsHouse_GotHatText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TATTERED_HAT_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_TATTERED_HAT_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText1
	promptbutton
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_FINISHED
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_POLIWAG_FROM_ELM
	iftrue .RivalTakesOddish
	checkevent EVENT_GOT_ODDISH_FROM_ELM
	iftrue .RivalTakesVulpix
	setevent EVENT_POLIWAG_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesOddish:
	setevent EVENT_ODDISH_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesVulpix:
	setevent EVENT_VULPIX_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText
	
MrPokemonsHouse_Copier:
	jumptext MrPokemonsHouse_CopierText

MrPokemonsHouse_Computer:
	jumptext MrPokemonsHouse_ComputerText

MrPokemonsHouse_DeskParts:
	jumptext MrPokemonsHouse_DeskPartsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step LEFT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step_sleep 2
	step_end

MrPokemonIntroText1:
	text "Hello, hello! You"
	line "must be <PLAY_G>."

	para "PROF.ELM said that"
	line "you would visit."
	done

MrPokemonIntroText2:
	text "This is what I"
	line "want PROF.ELM to"
	cont "examine."
	done

MrPokemonsHouse_GotHatText:
	text "<PLAYER> received"
	line "TATTERED HAT."
	done

MrPokemonIntroText3:
	text "I was doing some"
	line "investigating in"
	
	para "DARK CAVE a few"
	line "days back and"
	
	para "stumbled across a"
	line "passage I hadn't"
	cont "seen before."
	
	para "I wasn't able to"
	line "squeeze through,"
	
	para "but I did find"
	line "this old hat and"
	
	para "a bunch of crystal"
	line "shards, which I"
	
	para "believe were"
	line "fragments of"
	cont "evolution stones."
	done

MrPokemonIntroText4:
	text "I'm sure PROF.OAK"
	line "recognizes the"
	
	para "significance of"
	line "this hat."
	done

MrPokemonIntroText5:
	text "A black cap with a"
	line "large red 'R'"
	cont "embroidered on it…"
	
	para "It leads me to"
	line "believe that"
	
	para "TEAM ROCKET may"	
	line "have had something"
	
	para "to do with the"
	line "collapse."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "You should return"
	line "to the lab and"
	
	para "show PROF.ELM this"
	line "evidence."

	para "Here. Your #MON"
	line "should have some"
	cont "rest."
	done

MrPokemonText_ImDependingOnYou:
	text "I'm depending on"
	line "you!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "Life is delight-"
	line "ful! Always, new"

	para "discoveries to be"
	line "made!"
	done

MrPokemonsHouse_OakText1:
	text "OAK: Aha! So"
	line "you're <PLAY_G>!"

	para "I'm OAK! A #MON"
	line "researcher."

	para "I was just visit-"
	line "ing my old friend"
	cont "MR.#MON."
	
	para "I never expected"
	line "to land right in"
	
	para "the middle of a"
	line "mystery!"
	
	para "And one concerning"
	line "TEAM ROCKET,"
	cont "no less…"

	para "I heard you were"
	line "aiding PROF.ELM in"

	para "his research, so I"
	line "waited here."

	para "Oh! What's this?"
	line "A #MON!"

	para "Let's see…"

	para "Hm, I see!"

	para "I understand why"
	line "PROF.ELM gave you"

	para "a #MON for this"
	line "errand."

	para "To researchers"
	line "like PROF.ELM and"

	para "I, #MON are our"
	line "friends."

	para "He saw that you"
	line "would treat your"

	para "#MON with love"
	line "and care."

	para "You seem to be"
	line "dependable."

	para "How would you like"
	line "to help me out?"

	para "See? This is the"
	line "latest version of"
	cont "my #DEX."

	para "It automatically"
	line "records data on"

	para "#MON you've"
	line "seen or caught."

	para "It's a hi-tech"
	line "encyclopedia!"
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done

MrPokemonsHouse_OakText2:
	text "Go meet many kinds"
	line "of #MON and"

	para "complete that"
	line "#DEX!"

	para "Anyhow, I've"
	line "stayed too long."

	para "I have to get to"
	line "GOLDENROD for my"
	cont "usual radio show."

	para "<PLAY_G>, I'm"
	line "looking forward"
	
	para "to seeing what"
	line "you're capable of!"
	done

MrPokemonText_GimmeTheScale:
	text "Hm? That SCALE!"
	line "What's that?"
	cont "A red GYARADOS?"

	para "That's rare! "
	line "I, I want it…"

	para "<PLAY_G>, would you"
	line "care to trade it?"

	para "I can offer this"
	line "EXP.SHARE I got"
	cont "from PROF.OAK."
	done

MrPokemonText_Disappointed:
	text "That's disappoint-"
	line "ing. That happens"
	cont "to be very rare."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "It's packed with"
	line "foreign magazines."

	para "Can't even read"
	line "their titles…"
	done

MrPokemonsHouse_CopierText:
	text "It's a brand-new"
	line "photocopier!"
	
	para "……Looks like it"
	line "has a paper jam."
	done
	
MrPokemonsHouse_ComputerText:
	text "The computers are"
	line "making a gentle"
	cont "humming sound."

	para "Maybe it's not a"
	line "great idea to be"
	cont "standing here…"
	done

MrPokemonsHouse_DeskPartsText:
	text "There are various"
	line "pieces of wires"

	para "and disassembled"
	line "# BALLS strewn"
	cont "about the desk."
	done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_30, 2
	warp_event  5,  7, ROUTE_30, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_Copier
	bg_event  8,  1, BGEVENT_READ, MrPokemonsHouse_Computer
	bg_event  9,  1, BGEVENT_READ, MrPokemonsHouse_Computer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_DeskParts
	bg_event  7,  4, BGEVENT_READ, MrPokemonsHouse_DeskParts


	def_object_events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
