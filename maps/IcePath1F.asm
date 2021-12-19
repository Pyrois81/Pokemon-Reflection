	object_const_def
	const ICEPATH1F_POKE_BALL1
	const ICEPATH1F_POKE_BALL2
	const ICEPATH1F_POKE_BALL3

IcePath1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .Blockade
	
.Blockade: ; map default = open path
	checkflag ENGINE_RISINGBADGE
	iftrue .IceBlock
	changeblock 36, 12, $19
	changeblock 36, 14, $16
	
.IceBlock: ; map default = room blocked
	checkevent EVENT_ICE_PATH_MELTED_ICE
	iffalse .End
	changeblock 34,  2, $02

.End:
	endcallback
	
IcePath1FIceBlock:
	conditional_event EVENT_ICE_PATH_MELTED_ICE, .CheckIce
	
.CheckIce:
	opentext
	writetext IcePath1FIceBlockText
	waitbutton
	checkitem MOLT_FEATHER
	iffalse .End
	writetext IcePath1FHoldUpFeatherText
	yesorno
	iffalse .End
	writetext IcePath1FUseFeatherText
	promptbutton
	setevent EVENT_ICE_PATH_MELTED_ICE
	takeitem MOLT_FEATHER
	playsound SFX_SWORDS_DANCE
	waitsfx
	playsound SFX_SWORDS_DANCE
	changeblock 34,  2, $02
	reloadmappart
	
.End:
	closetext
	end

IcePath1FHMWaterfall:
	itemball HM_WATERFALL

IcePath1FPPUp:
	itemball PP_UP

IcePath1FProtein:
	itemball PROTEIN
	
IcePath1FIceBlockText:
	text "It's a solid block"
	line "of crystal-clear"
	cont "ice."
	
	para "Somehow it seems"
	line "even colder than"
	cont "its surroundings."
	done
	
IcePath1FHoldUpFeatherText:
	text "Hold up the"
	line "MOLT.FEATHER to"
	cont "the ice?"
	done
	
IcePath1FUseFeatherText:
	text "The ice begins to"
	line "melt!"
	
	para "But it seems to be"
	line "drawing out the"
	cont "feather's heat."
	done

IcePath1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 25, ROUTE_44, 1
	warp_event 34, 31, BLACKTHORN_CITY, 7
	warp_event 35,  1, ICE_PATH_B1F, 1
	warp_event  5,  5, ICE_PATH_B1F, 7

	def_coord_events

	def_bg_events
	bg_event 35,  2, BGEVENT_IFNOTSET, IcePath1FIceBlock

	def_object_events
	object_event 24,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FHMWaterfall, EVENT_GOT_HM07_WATERFALL
	object_event 30, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FPPUp, EVENT_ICE_PATH_1F_PP_UP
	object_event 26, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FProtein, EVENT_ICE_PATH_1F_PROTEIN
