	object_const_def
	const OLIVINELIGHTHOUSE2F_POKE_BALL

OlivineLighthouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouse2FUltraBall:
	itemball ULTRA_BALL
	
OlivineLighthouse2FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_OLIVINE_LIGHTHOUSE_2F_HIDDEN_HYPER_POTION

OlivineLighthouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 17, OLIVINE_LIGHTHOUSE_1F, 3
	warp_event  5, 17, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event 13,  9, OLIVINE_LIGHTHOUSE_1F, 4
	warp_event 11, 15, OLIVINE_LIGHTHOUSE_1F, 5
	warp_event 18, 15, OLIVINE_LIGHTHOUSE_3F, 7
	warp_event 19, 15, OLIVINE_LIGHTHOUSE_3F, 8
	warp_event 20, 17, OLIVINE_LIGHTHOUSE_1F, 6
	warp_event 21, 17, OLIVINE_LIGHTHOUSE_1F, 7
	warp_event 13, 17, OLIVINE_LIGHTHOUSE_1F, 8
	warp_event 10,  8, OLIVINE_LIGHTHOUSE_3F, 9

	def_coord_events

	def_bg_events
	bg_event 15, 19, BGEVENT_ITEM, OlivineLighthouse2FHiddenHyperPotion

	def_object_events
	object_event  12,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse2FUltraBall, EVENT_OLIVINE_LIGHTHOUSE_2F_ULTRA_BALL
