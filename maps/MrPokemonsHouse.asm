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
	waitbutton
	writetext MrPokemonHealText1
	promptbutton
	closetext
	scall MrPokemonsHouse_Heal
	opentext
	writetext MrPokemonImDependingOnYouText
	waitbutton
	closetext
	setevent EVENT_MET_MR_POKEMON
	setscene SCENE_FINISHED
	end
	
MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_SHOWED_TATTERED_HAT_TO_MR_POKEMON
	iftrue .AlwaysNewDiscoveries
	checkitem TATTERED_HAT
	iffalse .GetToIt
	writetext MrPokemonReturnedText
	promptbutton
	writetext MrPokemonShowHatText
	waitbutton
	setevent EVENT_SHOWED_TATTERED_HAT_TO_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonRocketText1
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonRocketText2
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	closetext
	sjump MrPokemonsHouse_OakScene

.GetToIt:
	writetext MrPokemonGetToItText
	waitbutton
	closetext
	scall MrPokemonsHouse_Heal
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
	jumptextfaceplayer MrPokemonsHouse_OakText1

MrPokemonsHouse_OakScene:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText2
	promptbutton
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText3
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
	writetext MrPokemonRocketText3
	waitbutton
	closetext
	scall MrPokemonsHouse_Heal
	opentext
	writetext MrPokemonGoodLuckText
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	end

MrPokemonsHouse_Heal:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
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
	line "must be <PLAYER>."

	para "PROF.ELM said that"
	line "you would visit."
	done

MrPokemonIntroText2:
	text "The last time I"
	line "was poking around"
	
	para "in DARK CAVE, I"
	line "came across a few"
	
	para "crystal shards of"
	line "various colors."
	
	para "Now, I've been"
	line "around long enough"
	
	para "to recognize them"
	line "as sheared-off"
	
	para "slivers of evolu-"
	line "tion stones."
	
	para "If you'd be so"
	line "kind, I'd ask you"
	
	para "to check out DARK"
	line "CAVE and see if"
	
	para "you can find any"
	line "more clues as to"
	cont "what's going on."
	done

MrPokemonHealText1:
	text "Oh, and before you"
	line "go, allow me to"
	cont "heal your #MON."
	done
	
MrPokemonImDependingOnYouText:
	text "I'm depending on"
	line "you, <PLAYER>!"
	done

MrPokemonGetToItText:
	text "I've got a bad"
	line "feeling that"
	cont "trouble is afoot…"
	
	para "Please, investi-"
	line "gate the cave!"
	
	para "Ah, and let me"
	line "heal your #MON"
	cont "while you're here."
	done

MrPokemonReturnedText:
	text "Yes, <PLAYER>?"
	
	para "What did you find?"
	done

MrPokemonShowHatText:
	text "<PLAYER> showed"
	line "the TATTERED HAT"
	cont "to MR.#MON."
	done
	
MrPokemonRocketText1:
	text "Oh, my…"
	
	para "I recognize this"
	line "hat, and I'm sure"
	cont "PROF.OAK does too."
	done

MrPokemonRocketText2:
	text "A black cap with a"
	line "large red 'R'"
	cont "embroidered on it…"
	
	para "I'm beginning to"
	line "wonder whether"
	
	para "TEAM ROCKET may"	
	line "have had something"
	
	para "to do with the"
	line "collapse."
	done

MrPokemonRocketText3:
	text "You should return"
	line "to the lab and"
	
	para "show PROF.ELM this"
	line "evidence."

	para "Here. Your #MON"
	line "should have some"
	cont "rest."
	done

MrPokemonGoodLuckText:
	text "Good luck out"
	line "there, <PLAYER>."
	
	para "This may turn out"
	line "to be much bigger"
	
	para "than any of us"
	line "could have"
	cont "anticipated."
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "Life is delight-"
	line "ful! Always, new"

	para "discoveries to be"
	line "made!"
	done

MrPokemonsHouse_OakText1:
	text "OAK: Aha! So"
	line "you're <PLAYER>!"

	para "I'm OAK! A #MON"
	line "researcher."

	para "I was just visit-"
	line "ing my old friend"
	cont "MR.#MON."
	done
	
MrPokemonsHouse_OakText2:	
	text "Wow! I never ex-"
	line "pected to land"

	para "right in the mid-"
	line "dle of a mystery!"
	
	para "And one concerning"
	line "TEAM ROCKET,"
	cont "no less…"

	para "Oh! What's this?"
	line "A #MON!"

	para "Let's take a look…"

	para "Ahh, I see!"

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

	para "Behold! This is"
	line "the latest version"
	cont "of my #DEX."

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

MrPokemonsHouse_OakText3:
	text "Go meet many kinds"
	line "of #MON and"

	para "complete that"
	line "#DEX!"

	para "Anyhow, I've"
	line "stayed too long."

	para "I have to get to"
	line "GOLDENROD for my"
	cont "usual radio show."

	para "<PLAYER>, I'm"
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

	para "<PLAYER>, would you"
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
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_OakScript, EVENT_MR_POKEMONS_HOUSE_OAK_TOGGLE
