	object_const_def
	const BURNEDTOWER1F_SAGE
	const BURNEDTOWER1F_POKE_BALL1
	const BURNEDTOWER1F_POKE_BALL2

BurnedTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

BurnedTower1FSageScript:
	jumptextfaceplayer BurnedTower1FSageText

BurnedTower1FGreatBall:
	itemball GREAT_BALL
	
BurnedTower1FGoldBerry:
	itemball GOLD_BERRY

BurnedTower1FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_BURNED_TOWER_1F_HIDDEN_HYPER_POTION

BurnedTower1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_BURNED_TOWER_1F_HIDDEN_ULTRA_BALL
	
BurnedTower1FSageText:
	text "We could have re-"
	line "built this tower"
	
	para "long ago, but the"
	line "community decided"
	
	para "against it so it"
	line "could serve as a"

	para "shrine to those we"
	line "lost, and as a"
	
	para "reminder of the"
	line "terrible power of"
	cont "HO-OH."
	done

BurnedTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, ECRUTEAK_CITY, 13
	warp_event 10, 15, ECRUTEAK_CITY, 13
	warp_event  9, 13, BURNED_TOWER_B1F, 1
	warp_event  3,  7, BURNED_TOWER_B1F, 2
	warp_event 10,  7, BURNED_TOWER_B1F, 3
	warp_event 16,  5, BURNED_TOWER_B1F, 4

	def_coord_events

	def_bg_events
	bg_event 17,  1, BGEVENT_ITEM, BurnedTower1FHiddenHyperPotion
	bg_event  8,  7, BGEVENT_ITEM, BurnedTower1FHiddenUltraBall

	def_object_events
	object_event 11, 13, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTower1FSageScript, -1
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTower1FGreatBall, EVENT_BURNED_TOWER_1F_GREAT_BALL
	object_event 15, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTower1FGoldBerry, EVENT_BURNED_TOWER_1F_GOLD_BERRY
