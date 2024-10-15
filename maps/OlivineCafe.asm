	object_const_def
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_SAILOR2
	const OLIVINECAFE_FISHER
	const OLIVINECAFE_GRAMPS
	const OLIVINECAFE_GRANNY

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeOwnerScript:
	jumptextfaceplayer OlivineCafeOwnerText

OlivineCafeSailor1Script:
	jumptextfaceplayer OlivineCafeSailor1Text
	
OlivineCafeSailor2Script:
	jumptextfaceplayer OlivineCafeSailor2Text

OlivineCafeFisherScript:
	jumptextfaceplayer OlivineCafeFisherText
	
OlivineCafeGrampsScript:
	jumptextfaceplayer OlivineCafeGrampsText
	
OlivineCafeGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_OLIVINE_CAFE_GOT_FULL_HEAL
	iftrue .GotFullHeal
	writetext OlivineCafeGrannyFullHealText
	waitbutton
	verbosegiveitem FULL_HEAL
	iffalse .NoRoom
	setevent EVENT_OLIVINE_CAFE_GOT_FULL_HEAL
	closetext
	end
	
.GotFullHeal:
	writetext OlivineCafeGrannyAfterText
	waitbutton
	closetext
	end
	
.NoRoom:
	writetext OlivineCafeGrannyNoRoomText
	waitbutton
	closetext
	end

OlivineCafeTrashCanScript:
	opentext
	checkevent EVENT_OLIVINE_CAFE_LEFTOVERS
	iftrue .OnlyTrash
	writetext OlivineCafeLeftoversText
	waitbutton
	verbosegiveitem LEFTOVERS
	iffalse .NoRoom
	setevent EVENT_OLIVINE_CAFE_LEFTOVERS
	closetext
	end
	
.OnlyTrash:
	writetext OlivineCafeOnlyTrashText
	waitbutton
	closetext
	end
	
.NoRoom:
	writetext OlivineCafeTrashCanNoRoomText
	waitbutton
	closetext
	end

OlivineCafePosterScript:
	jumptext OlivineCafePosterText

OlivineCafeOwnerText:
	text "Thanks to a few"
	line "good years and the"
	
	para "patronage of our"
	line "loyal customers,"
	
	para "we were able to"
	line "expand this joint."

	para "Ya eat our food"
	line "and you'll grow up"
	
	para "to be big and"
	line "strong!"
	done

OlivineCafeSailor1Text:
	text "Hah! Yer #MON"
	line "sure look like"
	cont "lightweights!"

	para "Me older brother"
	line "has just the trick"
	
	para "fer that, but he's"
	line "out trainin' at"
	cont "the CIANWOOD GYM!"
	done

OlivineCafeSailor2Text:
	text "This place has got"
	line "the most delicious"
	
	para "seafood this side"
	line "of MT. SILVER."
	
	para "The GOLDENROD"
	line "GROUPER's finger-"
	cont "lickin' good!"
	done

OlivineCafeFisherText:
	text "I supply the CAFE"
	line "with its seafood."
	
	para "You'd be shocked"
	line "at how much fish"
	
	para "a place like this"
	line "can go through!"
	done
	
OlivineCafeGrampsText:
	text "We love this"
	line "restaurant."
	
	para "The prices are"
	line "good and the owner"
	cont "is a friendly lad."
	done
	
OlivineCafeGrannyFullHealText:
	text "You must be on"
	line "quite the mission!"
	
	para "My granddaughter"
	line "is a rather accom-"
	
	para "plished trainer,"
	line "so I can tell you"
	
	para "are too by the"
	line "look in your eye."
	
	para "Why don't you take"
	line "this?"
	done
	
OlivineCafeGrannyNoRoomText:
	text "No space? If you"
	line "make some, come on"
	cont "back!"
	done
	
OlivineCafeGrannyAfterText:
	text "I wasn't too hun-"
	line "gry, so I just got"
	
	para "an OLIVINE"
	line "ONIGIRI."
	
	para "It's so fresh!"
	done

OlivineCafeLeftoversText:
	text "Hey, what's this"
	line "sitting on top of"
	cont "the trash?"
	done
	
OlivineCafeOnlyTrashText:
	text "There's nothing"
	line "but trash here."
	done
	
OlivineCafeTrashCanNoRoomText:
	text "<PLAYER> can't"
	line "carry any more"
	cont "items!"
	done

OlivineCafePosterText:
	text "Looks like a post-"
	line "er for a local"
	cont "heavy metal band."
	
	para "After a moment"
	line "of squinting, you"
	
	para "can make out the"
	line "words:"
	
	para "STEELIX STAINED"
	line "SCARLET"
	
	para "…Sounds intense."
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events
	bg_event 5, 7, BGEVENT_READ, OlivineCafeTrashCanScript
	bg_event 1, 0, BGEVENT_READ, OlivineCafePosterScript

	def_object_events
	object_event  8,  2, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCafeOwnerScript, -1
	object_event  2,  1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailor1Script, -1
	object_event  5,  1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailor2Script, -1
	object_event 10,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlivineCafeFisherScript, -1
	object_event  7,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineCafeGrampsScript, -1
	object_event  7,  7, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, OlivineCafeGrannyScript, -1
