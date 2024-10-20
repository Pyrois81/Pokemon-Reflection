	object_const_def
	const OLIVINELIGHTHOUSE4F_POKE_BALL

OlivineLighthouse4F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouse4FSuperRepel:
	itemball SUPER_REPEL

OlivineLighthouse4FHiddenRevive:
	hiddenitem REVIVE, EVENT_OLIVINE_LIGHTHOUSE_4F_HIDDEN_REVIVE

OlivineLighthouse4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 15, OLIVINE_LIGHTHOUSE_3F, 2
	warp_event 15,  5, OLIVINE_LIGHTHOUSE_5F, 1
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event  3,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_5F, 7
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_5F, 8
	warp_event  8, 10, OLIVINE_LIGHTHOUSE_5F, 10
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_5F, 9
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_3F, 4
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_3F, 5
	warp_event 11,  9, OLIVINE_LIGHTHOUSE_3F, 6


	def_coord_events

	def_bg_events
	bg_event  4,  6, BGEVENT_ITEM, OlivineLighthouse4FHiddenRevive

	def_object_events
	object_event 17,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse4FSuperRepel, EVENT_OLIVINE_LIGHTHOUSE_4F_SUPER_REPEL
