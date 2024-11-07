	object_const_def
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUIDE
	const CIANWOODPOKECENTER1F_SUPER_NERD

CianwoodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuideWinScript
	opentext
	writetext CianwoodGymGuideText
	waitbutton
	closetext
	end

.CianwoodGymGuideWinScript:
	opentext
	writetext CianwoodGymGuideWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText

CianwoodPokecenter1FLassText:
	text "There's a #-"
	line "MANIAC who lives"
	cont "in CIANWOOD."
	
	para "He used to be a"
	line "really helpful and"
	
	para "friendly guy --"
	line "kinda odd, of"
	cont "course --"
	
	para "but these days we"
	line "hardly see him,"
	
	para "and when we do,"
	line "he's jumpy and"
	cont "anxious."
	
	para "Wonder what hap-"
	line "pened to him…"
	done

CianwoodGymGuideText:
	text "Ooh, those muscle-"
	line "heads in the GYM"
	cont "make me so mad!"

	para "They laughed me"
	line "out of the place"
	
	para "after I couldn't"
	line "move one of their"
	
	para "stupid boulders"
	line "with one finger."
	
	para "Maybe you could"
	line "put 'em in their"
	cont "place!"
	
	para "Alright, here's"
	line "the scoop:"

	para "CHUCK uses the"
	line "fighting-type."

	para "You should either"
	line "bamboozle him with"
	
	para "psychic #MON or"
	line "come at him from"
	
	para "above with flying-"
	line "types."

	para "Fighting #MON"
	line "can deliver devas-"
	
	para "tating blows, but"
	line "their defenses"
	
	para "typically aren't"
	line "anything special."
	
	para "Now go show those"
	line "bullies who's boss"
	cont "of that GYM!"
	done

CianwoodGymGuideWinText:
	text "<PLAYER>! You won!"
	line "I can see it on"
	cont "your face!"
	
	para "That'll teach them"
	line "to mess with the"
	cont "little guy!"
	
	para "…Uh…"

	para "Meaning me, not"
	line "you, even though"
	cont "you're the kid…"
	
	para "Yeah!"
	done

CianwoodPokecenter1FSuperNerdText:
	text "The old PHOTO STU-"
	line "DIO shut down and"
	
	para "the owner moved"
	line "back to the main-"
	cont "land."
	
	para "Psh… I'm not"
	line "surprised!"
	
	para "Everybody's car-"
	line "rying around digi-"
	
	para "tal cameras these"
	line "days."
	
	para "I bet those things"
	line "will stick around"
	
	para "for 100 years or"
	line "more!"
	done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuideScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
