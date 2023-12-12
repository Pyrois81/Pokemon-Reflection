	object_const_def
	const MOUNTMORTAR2F_POKE_BALL1
	const MOUNTMORTAR2F_POKE_BALL2
	const MOUNTMORTAR2F_POKE_BALL3
	const MOUNTMORTAR2F_POKE_BALL4
	const MOUNTMORTAR2F_POKE_BALL5
	const MOUNTMORTAR2F_POKE_BALL6
	const MOUNTMORTAR2F_SUPER_NERD

MountMortar2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSupernerdHugh:
	trainer SUPER_NERD, HUGH, EVENT_BEAT_SUPER_NERD_HUGH, SupernerdHughSeenText, SupernerdHughBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdHughAfterBattleText
	waitbutton
	closetext
	end

MountMortar2FMaxPotion:
	itemball MAX_POTION

MountMortar2FRareCandy:
	itemball RARE_CANDY

MountMortar2FTMDefenseCurl:
	itemball TM_DEFENSE_CURL

MountMortar2FDragonScale:
	itemball DRAGON_SCALE

MountMortar2FElixir:
	itemball ELIXIR

MountMortar2FEscapeRope:
	itemball ESCAPE_ROPE

MountMortar2FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_MOUNT_MORTAR_2F_HIDDEN_FULL_RESTORE

SupernerdHughSeenText:
	text "Yo! MARKUS!"
	done

SupernerdHughBeatenText:
	text "Sorry, my mistake."
	done

SupernerdHughAfterBattleText:
	text "I'm investigating"
	line "MT.MORTAR, but my"
	cont "pal's gone AWOL."

	para "Have you seen a"
	line "trainer who has a"

	para "SLOWPOKE that can"
	line "use STRENGTH?"
	done

MountMortar2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events


	def_coord_events

	def_bg_events
	bg_event 24,  8, BGEVENT_ITEM, MountMortar2FHiddenFullRestore

	def_object_events
	object_event 28, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FMaxPotion, EVENT_MOUNT_MORTAR_2F_MAX_POTION
	object_event  2, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FRareCandy, EVENT_MOUNT_MORTAR_2F_RARE_CANDY
	object_event 19, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FTMDefenseCurl, EVENT_MOUNT_MORTAR_2F_TM_DEFENSE_CURL
	object_event 16,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FDragonScale, EVENT_MOUNT_MORTAR_2F_DRAGON_SCALE
	object_event  9, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FElixir, EVENT_MOUNT_MORTAR_2F_ELIXIR
	object_event 28,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FEscapeRope, EVENT_MOUNT_MORTAR_2F_ESCAPE_ROPE
	object_event 13, 26, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdHugh, -1
