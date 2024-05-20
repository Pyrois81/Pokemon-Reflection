	object_const_def
	const ETHANSHOUSE2F_CONSOLE
	const ETHANSHOUSE2F_DOLL_1
	const ETHANSHOUSE2F_DOLL_2
	const ETHANSHOUSE2F_BIG_DOLL

EthansHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

EthansHouseEthanScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .AlreadyTalked
	writetext EthansHouseEthanText1
	waitbutton
	
.AlreadyTalked
	writetext EthansHouseEthanText2
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

EthansHouseDoll1Script:
	opentext
	writetext EthansHouseDoll1Text
	waitbutton
	closetext
	end

EthansHouseDoll2Script:
	opentext
	writetext EthansHouseDoll2Text
	waitbutton
	closetext
	end
	
EthansHouseBigDollScript:
	opentext
	writetext EthansHouseBigDollText
	waitbutton
	closetext
	end
	
EthansHouseGameConsoleScript:
	opentext
	writetext EthansHouseGameConsoleText
	waitbutton
	closetext
	end
	
EthansHousePosterScript:
	opentext
	writetext EthansHousePosterText
	waitbutton
	closetext
	end

EthansHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext EthansRadioText1
	pause 45
	writetext EthansRadioText2
	pause 45
	writetext EthansRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext EthansRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext EthansRadioText4
	pause 45
	closetext
	end

EthansHouseBookshelfScript:
	jumpstd PictureBookshelfScript

EthansHousePCScript:
	opentext
	writetext EthansHousePCText
	waitbutton
	closetext
	end

EthansHouseEthanText1:
	text "That was a great"
	line "battle, but I'm"
	
	para "glad somebody fin-"
	line "ally came and"
	cont "beat me."
	
	para "The view from the"
	line "top of MT. SILVER"
	
	para "is beautiful, but"
	line "it gets pretty"
	
	para "boring after a"
	line "while."
	done

EthansHouseEthanText2:
	text "<……><……>"
	
	para "Wanna hang out"
	line "sometime?"
	done
	
EthansRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

EthansRadioText2:
	text "#MON CHANNEL!"
	done

EthansRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

EthansRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

EthansHouseDoll1Text:
	text "It's an UNOWN"
	line "doll."
	
	para "Just looking at it"
	line "fills you with a"
	cont "sense of unease."
	done
	
EthansHouseDoll2Text:
	text "The engraving on"
	line "the trophy reads:"
	
	para "ETHAN"
	
	para "#MON LEAGUE"
	line "CHAMPION"
	done
	
EthansHouseBigDollText:
	text "It's a huge, plush"
	line "ONIX doll."
	
	para "Looks comfy!"
	done
	
EthansHouseGameConsoleText:
	text "A Nintendo 64 with"
	line "tons of games!"
	
	para "It looks like it"
	line "hasn't been"
	
	para "touched in a"
	line "while."
	done
	
EthansHousePosterText:
	text "A cute CLEFAIRY"
	line "poster."
	
	para "It's comforting,"
	line "somehow."
	done

EthansHousePCText:
	text "A somewhat dated"
	line "computer."
	
	para "…It's password-"
	line "protected."
	
	para "No snooping!"
	done

EthansHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, ETHANS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_UP, EthansHousePCScript
	bg_event  3,  1, BGEVENT_READ, EthansHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, EthansHouseBookshelfScript
	bg_event  6,  0, BGEVENT_READ, EthansHousePosterScript

	def_object_events
	object_event  4,  2, SPRITE_N64, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EthansHouseGameConsoleScript, -1
	object_event  4,  4, SPRITE_UNOWN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, EthansHouseDoll1Script, -1
	object_event  5,  4, SPRITE_GOLD_TROPHY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EthansHouseDoll2Script, -1
	object_event  0,  1, SPRITE_BIG_ONIX, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EthansHouseBigDollScript, -1
	object_event  2,  2, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EthansHouseEthanScript, EVENT_ETHAN_IN_NEW_BARK
