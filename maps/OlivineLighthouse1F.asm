	object_const_def
	const OLIVINELIGHTHOUSE1F_POKE_BALL1
	const OLIVINELIGHTHOUSE1F_POKE_BALL2

OlivineLighthouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouse1FEverstone:
	itemball EVERSTONE
	
OlivineLighthouse1FEscapeRope:
	itemball ESCAPE_ROPE
	
OlivineLighthouse1FHMSurf:
	itemball HM_SURF

OlivineLighthouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12, 21, OLIVINE_CITY, 9
	warp_event 13, 21, OLIVINE_CITY, 9
	warp_event  9, 19, OLIVINE_LIGHTHOUSE_2F, 1
	warp_event 13,  9, OLIVINE_LIGHTHOUSE_2F, 3
	warp_event 11, 15, OLIVINE_LIGHTHOUSE_2F, 4
	warp_event 20, 17, OLIVINE_LIGHTHOUSE_2F, 7
	warp_event 21, 17, OLIVINE_LIGHTHOUSE_2F, 8
	warp_event 13, 17, OLIVINE_LIGHTHOUSE_2F, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  16,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse1FEverstone, EVENT_OLIVINE_LIGHTHOUSE_1F_EVERSTONE
	object_event   6, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse1FEscapeRope, EVENT_OLIVINE_LIGHTHOUSE_1F_ESCAPE_ROPE
	object_event  11, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse1FHMSurf, EVENT_OLIVINE_LIGHTHOUSE_1F_HM02_SURF
