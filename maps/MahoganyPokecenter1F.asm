	object_const_def
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F

MahoganyPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

MahoganyPokecenter1FPokefanMScript:
	faceplayer
	opentext
	checkflag ENGINE_GLACIERBADGE
	iffalse .SusAmogus
	checkevent EVENT_CLEARED_LAKE_OF_RAGE
	iffalse .SusAmogus
	writetext MahoganyPokecenter1FPokefanMNinjaText
	waitbutton
	closetext
	end
	
.SusAmogus:
	writetext MahoganyPokecenter1FPokefanMSuspiciousText
	waitbutton
	closetext
	end

MahoganyPokecenter1FYoungsterScript:
	jumptextfaceplayer MahoganyPokecenter1FYoungsterText

MahoganyPokecenter1FCooltrainerFScript:
	jumptextfaceplayer MahoganyPokecenter1FCooltrainerFText

MahoganyPokecenter1FPokefanMSuspiciousText:
	text "AH!! TEAM ROCKET"
	line "are back!!"
	
	para "Oh, sorry… I'm"
	line "probably just"
	cont "being paranoid…"
	
	para "I saw some guys"
	line "hauling something"
	
	para "just outside of"
	line "town, and they"
	
	para "looked awfully"
	line "suspicious."
	done
	
MahoganyPokecenter1FPokefanMNinjaText:
	text "My granddad was a"
	line "cunning ninja."
	
	para "He'd take care of"
	line "TEAM ROCKET in a"
	
	para "flash if he were"
	line "still around."
	done

MahoganyPokecenter1FYoungsterText:
	text "I stop my #MON"
	line "from evolving too"
	cont "early."

	para "Well, I did, but"
	line "then I gave it an"
	
	para "EVERSTONE and now"
	line "I don't have to"
	cont "worry about it!"
	done

MahoganyPokecenter1FCooltrainerFText:
	text "#MON do become"
	line "stronger when they"

	para "evolve, but they"
	line "also learn moves"
	cont "more slowly."
	done

MahoganyPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, MAHOGANY_TOWN, 3
	warp_event  4,  7, MAHOGANY_TOWN, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FCooltrainerFScript, -1
