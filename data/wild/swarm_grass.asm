; Pokémon swarms in grass

SwarmGrassWildMons:

; Dunsparce swarm
	map_id DARK_CAVE_1F
	db 4 percent ; encounter rate
	; In order, 30/30/20/10/5/4/1%:
	db 3, GEODUDE
	db 3, DUNSPARCE
	db 2, ZUBAT
	db 2, GEODUDE
	db 2, DUNSPARCE
	db 4, DUNSPARCE
	db 4, DUNSPARCE

; Yanma swarm
	map_id ROUTE_35
	db 10 percent
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, YANMA
	db 14, YANMA
	db 14, PIDGEY
	db 10, DITTO
	db 10, DITTO

	db -1 ; end
