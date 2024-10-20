	object_const_def
	const OLIVINELIGHTHOUSE5F_POKE_BALL1
	const OLIVINELIGHTHOUSE5F_POKE_BALL2

OlivineLighthouse5F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouse5FEXPCandyM:
	itemball EXP_CANDY_M

OlivineLighthouse5FTMDoubleTeam:
	itemball TM_DOUBLE_TEAM

OlivineLighthouse5FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_OLIVINE_LIGHTHOUSE_5F_HIDDEN_HYPER_POTION

OlivineLighthouse5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 15, OLIVINE_LIGHTHOUSE_4F, 2
	warp_event 11,  7, OLIVINE_LIGHTHOUSE_6F, 1
	warp_event  3,  7, OLIVINE_LIGHTHOUSE_4F, 4
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_6F, 2
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_6F, 3
	warp_event 11, 11, OLIVINE_LIGHTHOUSE_6F, 4
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_4F, 5
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_4F, 6
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_4F, 8
	warp_event  8, 10, OLIVINE_LIGHTHOUSE_4F, 7


	def_coord_events

	def_bg_events
	bg_event 12,  6, BGEVENT_ITEM, OlivineLighthouse5FHiddenHyperPotion

	def_object_events
	object_event 16, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FEXPCandyM, EVENT_OLIVINE_LIGHTHOUSE_5F_EXP_CANDY_M
	object_event  7,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FTMDoubleTeam, EVENT_OLIVINE_LIGHTHOUSE_5F_TM32_DOUBLE_TEAM
