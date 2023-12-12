	object_const_def
	const MOUNTMORTARB2F_POKE_BALL1
	const MOUNTMORTARB2F_POKE_BALL2

MountMortarB2F_MapScripts:
	def_scene_scripts

	def_callbacks

MountMortarB2FEther:
	itemball ETHER

MountMortarB2FRevive:
	itemball REVIVE

MountMortarB2FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_MOUNT_MORTAR_B2F_HIDDEN_HYPER_POTION

MountMortarB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 33, ROUTE_42, 3
	warp_event 17, 33, ROUTE_42, 4
	warp_event 37, 33, ROUTE_42, 5


	def_coord_events

	def_bg_events
	bg_event 25, 22, BGEVENT_ITEM, MountMortarB2FHiddenHyperPotion

	def_object_events
	object_event 13, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB2FEther, EVENT_MOUNT_MORTAR_B2F_ETHER
	object_event 31, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB2FRevive, EVENT_MOUNT_MORTAR_B2F_REVIVE
