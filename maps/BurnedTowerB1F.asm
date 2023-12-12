	object_const_def
	const BURNEDTOWERB1F_POKE_BALL1
	const BURNEDTOWERB1F_POKE_BALL2
	const BURNEDTOWERB1F_POKE_BALL3

BurnedTowerB1F_MapScripts:
	def_scene_scripts

	def_callbacks

BurnedTowerB1FTM55AncientPower:
	itemball TM_ANCIENTPOWER

BurnedTowerB1FCharcoal:
	itemball CHARCOAL
	
BurnedTowerB1FCarbos:
	itemball CARBOS

BurnedTowerB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 13, BURNED_TOWER_1F, 3
	warp_event  3,  7, BURNED_TOWER_1F, 4
	warp_event 10,  7, BURNED_TOWER_1F, 5
	warp_event 16,  5, BURNED_TOWER_1F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTowerB1FTM55AncientPower, EVENT_BURNED_TOWER_B1F_TM55_ANCIENTPOWER
	object_event  1, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTowerB1FCharcoal, EVENT_BURNED_TOWER_B1F_CHARCOAL
	object_event 17,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTowerB1FCarbos, EVENT_BURNED_TOWER_B1F_CARBOS
