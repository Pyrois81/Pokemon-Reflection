	object_const_def
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU
	const LAKEOFRAGEMAGIKARPHOUSE_MAGIKARP

LakeOfRageMagikarpHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	writetext MagikarpLengthRaterText_BiggestMagikarp
	waitbutton
	checkevent EVENT_GOT_OLD_ROD
	iffalse .GiveOldRod	
	sjump .End

.GiveOldRod:
	writetext MagikarpLengthRaterText_GiveOldRod
	promptbutton
	verbosegiveitem OLD_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_OLD_ROD
	sjump .End
	
.NoRoom:
	writetext MagikarpLengthRaterText_NoRoom
	waitbutton
	
.End:
	closetext
	end
	
MagikarpStatueScript:
	opentext
	writetext MagikarpStatueText
	waitbutton
	closetext
	end

MagikarpHouseBookshelf:
	jumpstd DifficultBookshelfScript

MagikarpLengthRaterText_BiggestMagikarp:
	text "My life's goal was"
	line "to see the biggest"
	
	para "MAGIKARP in the"
	line "entire world."
	
	para "Then, one day a"
	line "number of years"
	
	para "ago, a fishing"
	line "prodigy around"
	
	para "your age made that"
	line "goal a reality."
	
	para "I was so amazed by"
	line "the fish that I"
	
	para "had it taxidermied"
	line "so I could look at"
	
	para "it whenever I"
	line "wished."
	
	para "That's it on the"
	line "table there!"
	done

MagikarpLengthRaterText_GiveOldRod:
	text "Say, have you ever"
	line "given fishing a"
	cont "try?"
	
	para "I doubt there's"
	line "any chance you"
	
	para "or anybody else"
	line "could catch one"
	
	para "that big, but"
	line "there's nothing"
	
	para "more relaxing on a"
	line "day like today"
	
	para "than throwing out"
	line "a line and seeing"
	cont "what bites."
	
	para "You should take"
	line "this ROD!"
	done

MagikarpLengthRaterText_NoRoom:
	text "Oh, it looks like"
	line "you don't have any"
	cont "room for it."
	
	para "Come back anytime."
	line "I'll be here!"
	done

MagikarpStatueText:
	text "ETHAN'S MAGIKARP:"
	line "7 ft. 9 in."
	
	para "It's the biggest"
	line "MAGIKARP that you"
	cont "have ever seen."
	
	para "It might be the"
	line "biggest MAGIKARP"
	
	para "that has ever"
	line "existed."
	done

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
	object_event  4,  3, SPRITE_MAGIKARP, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MagikarpStatueScript, -1
