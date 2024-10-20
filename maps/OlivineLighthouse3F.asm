	object_const_def
	const OLIVINELIGHTHOUSE3F_POKE_BALL1
	const OLIVINELIGHTHOUSE3F_POKE_BALL2

OlivineLighthouse3F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouse3FEther:
	itemball ETHER

OlivineLighthouse3FStarPiece:
	itemball STAR_PIECE

OlivineLighthouse3FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_OLIVINE_LIGHTHOUSE_3F_HIDDEN_FULL_HEAL

OlivineLighthouse3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 15, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_4F, 1
	warp_event  5,  5, OLIVINE_LIGHTHOUSE_4F, 3
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_4F, 9
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_4F, 10
	warp_event 11,  9, OLIVINE_LIGHTHOUSE_4F, 11
	warp_event 16, 13, OLIVINE_LIGHTHOUSE_2F, 5
	warp_event 17, 13, OLIVINE_LIGHTHOUSE_2F, 6
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_2F, 10

	def_coord_events

	def_bg_events
	bg_event  8, 11, BGEVENT_ITEM, OlivineLighthouse3FHiddenFullHeal

	def_object_events
	object_event 14,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse3FEther, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER
	object_event  2,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse3FStarPiece, EVENT_OLIVINE_LIGHTHOUSE_3F_STAR_PIECE
