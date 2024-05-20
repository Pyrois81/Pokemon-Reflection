	object_const_def
	const ETHANSHOUSE1F_MOM

EthansHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

EthansHouse1FMomScript:
	faceplayer
	opentext
	checkevent EVENT_ETHAN_IN_MT_SILVER
	iftrue .EthanIsHome
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BeatE4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .AlreadyTalkedDefault
	writetext EthansHouse1FMomDefaultText1
	waitbutton
.AlreadyTalkedDefault
	writetext EthansHouse1FMomDefaultText2
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

.BeatE4
	writetext EthansHouse1FMomBeatE4Text
	waitbutton
	closetext
	end
	
.EthanIsHome
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .AlreadyTalkedHome
	writetext EthansHouse1FMomEthanIsHomeText1
	waitbutton
.AlreadyTalkedHome
	writetext EthansHouse1FMomEthanIsHomeText2
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	end

EthansHouse1FTVScript:
	jumptext EthansHouse1FTVText

EthansHouse1FStoveScript:
	jumptext EthansHouse1FStoveText

EthansHouse1FSinkScript:
	jumptext EthansHouse1FSinkText

EthansHouse1FFridgeScript:
	jumptext EthansHouse1FFridgeText

EthansHouse1FMomDefaultText1:
	text "Oh, <PLAYER>! It's"
	line "good to see you!"
	
	para "How's your MOM"
	line "been?"
	
	para "I've been meaning"
	line "to whip up a batch"
	
	para "of my famous"
	line "LAVENDER LICORICE"
	
	para "and bring you two"
	line "some, but things"
	
	para "have been pretty"
	line "busy around here."
	done

EthansHouse1FMomDefaultText2:
	text "No, ETHAN's still"
	line "out on his grand"
	
	para "adventure, I'm"
	line "afraid."
	
	para "You're more than"
	line "welcome to check"
	
	para "out his room,"
	line "though!"
	done

EthansHouse1FMomBeatE4Text:
	text "<PLAYER>, I heard"
	line "the great news!"
	
	para "Congratulations on"
	line "becoming the"
	cont "LEAGUE CHAMPION!"
	
	para "…You know, you"
	line "remind me a lot of"
	cont "my son…"
	
	para "If you happen to"
	line "come across him"
	
	para "out there, could"
	line "you wish him well"
	cont "for me?"
	done

EthansHouse1FMomEthanIsHomeText1:
	text "Oh, <PLAYER>, I"
	line "can't thank you"
	cont "enough!"
	
	para "My little boy is"
	line "back home."
	
	para "He told me you two"
	line "met on top of"
	cont "MT. SILVER."
	
	para "I don't condone"
	line "that kind of reck-"
	cont "less behavior…"
	
	para "But I guess both"
	line "of you are growing"
	cont "up fast."
	
EthansHouse1FMomEthanIsHomeText2:
	text "He's upstairs if"
	line "you'd like to talk"
	cont "to him!"
	done

EthansHouse1FStoveText:
	text "Some delicious-"
	line "looking CIANWOOD"
	cont "SLIDERS!"
	
	para "She must've made"
	line "too many."
	done

EthansHouse1FSinkText:
	text "There are some"
	line "glasses and dishes"
	cont "in the basin."
	done

EthansHouse1FFridgeText:
	text "The fridge is"
	line "stocked up with"
	
	para "plenty of meat,"
	line "veggies, and a"
	
	para "few bottles of"
	line "MOOMOO MILK!"
	done

EthansHouse1FTVText:
	text "It's a question-"
	line "able show about"
	cont "the paranormal."
	
	para "Ghosts aren't"
	line "real, after all…"
	
	para "…Right?"
	done

EthansHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, NEW_BARK_TOWN, 5
	warp_event  7,  7, NEW_BARK_TOWN, 5
	warp_event  9,  0, ETHANS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, EthansHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, EthansHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, EthansHouse1FFridgeScript
	bg_event  4,  1, BGEVENT_READ, EthansHouse1FTVScript

	def_object_events
	object_event  4,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, EthansHouse1FMomScript, -1
