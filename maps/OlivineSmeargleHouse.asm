	object_const_def
	const OLIVINESMEARGLEHOUSE_ROCKER
	const OLIVINESMEARGLEHOUSE_SMEARGLE

OlivineSmeargleHouse_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineSmeargleHouseRockerScript:
	faceplayer
	opentext
	checkevent EVENT_OLIVINE_SMEARGLE_HOUSE_GOT_SMEARGLE
	iftrue .GotSmeargle
	writetext OlivineSmeargleHouseRockerIntroText
	yesorno
	iffalse .Declined
	checkitem MAX_ELIXIR
	iffalse .DontHave
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	takeitem MAX_ELIXIR
	writetext OlivineSmeargleHouseReceivedSmeargleText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	givepoke SMEARGLE, 20
	setevent EVENT_OLIVINE_SMEARGLE_HOUSE_GOT_SMEARGLE
	disappear OLIVINESMEARGLEHOUSE_SMEARGLE
	closetext
	end
	
.GotSmeargle:
	writetext OlivineSmeargleHouseHowsSmeargleText
	waitbutton
	closetext
	end

.Declined:
	writetext OlivineSmeargleHouseDeclinedText
	waitbutton
	closetext
	end
	
.NoRoom:
	writetext OlivineSmeargleHouseNoRoomText
	waitbutton
	closetext
	end

.DontHave:
	writetext OlivineSmeargleHouseDontHaveText
 	waitbutton
	closetext
	end

OlivineSmeargleHouseSmeargleScript:
	opentext
	writetext OlivineSmeargleHouseSmeargleText
	cry SMEARGLE
	waitbutton
	closetext
	end

OlivineSmeargleHouseBookshelf1:
	jumpstd PictureBookshelfScript

OlivineSmeargleHouseBookshelf2:
	jumpstd MagazineBookshelfScript

OlivineSmeargleHouseRockerIntroText:
	text "I caught this"
	line "SMEARGLE, but I'm"
	
	para "havin' a real hard"
	line "time fittin' it"
	
	para "in with the rest"
	line "of my team."
	
	para "Tell ya what:"
	
	para "If you can find me"
	line "a MAX ELIXIR,"
	cont "they're all yours."
	
	para "Whaddya say?"
	done

OlivineSmeargleHouseDeclinedText:
	text "Ah, well."
	
	para "Come back if ya"
	line "change your mind!"
	done
	
OlivineSmeargleHouseNoRoomText:
	text "Hmm, looks like ya"
	line "don't have any"
	cont "room."
	done
	
OlivineSmeargleHouseDontHaveText:
	text "Appreciate the"
	line "enthusiasm, but ya"
	cont "don't have one!"
	done
	
OlivineSmeargleHouseHowsSmeargleText:
	text "How's that SMEAR-"
	line "GLE treatin' ya?"
	
	para "You havin' more"
	line "luck with it than"
	cont "I was?"
	done

OlivineSmeargleHouseReceivedSmeargleText:
	text "<PLAYER> received"
	line "SMEARGLE!"
	done
	
OlivineSmeargleHouseSmeargleText:
	text "SMEARGLE: 'Gle!"
	done

OlivineSmeargleHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 4
	warp_event  3,  7, OLIVINE_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, OlivineSmeargleHouseBookshelf1
	bg_event  1,  1, BGEVENT_READ, OlivineSmeargleHouseBookshelf2

	def_object_events
	object_event  2,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineSmeargleHouseRockerScript, -1
	object_event  6,  4, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineSmeargleHouseSmeargleScript, EVENT_OLIVINE_SMEARGLE_HOUSE_SMEARGLE_TOGGLE
