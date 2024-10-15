treemon_map: MACRO
	map_id \1
	db \2 ; treemon set
ENDM

	; TREEMON_SET_JOHTO_LOW
	; TREEMON_SET_JOHTO_MED
	; TREEMON_SET_JOHTO_HIGH
	; TREEMON_SET_TOWN_LOW
	; TREEMON_SET_TOWN_MED
	; TREEMON_SET_TOWN_HIGH
	; TREEMON_SET_CITY_LOW
	; TREEMON_SET_CITY_HIGH
	; TREEMON_SET_FOREST_LOW
	; TREEMON_SET_FOREST_HIGH
	; TREEMON_SET_MOUNTAIN_LOW
	; TREEMON_SET_MOUNTAIN_MED
	; TREEMON_SET_MOUNTAIN_HIGH
	; TREEMON_SET_LAKE_LOW
	; TREEMON_SET_LAKE_MED
	; TREEMON_SET_LAKE_HIGH
	; TREEMON_SET_BEACH
	; TREEMON_SET_KANTO_HIGH
	; TREEMON_SET_KANTO_VERYHIGH
	; TREEMON_SET_ROCK_CAVE_LOW
	; TREEMON_SET_ROCK_CAVE_HIGH
	; TREEMON_SET_ROCK_BEACH_LOW
	; TREEMON_SET_ROCK_BEACH_HIGH
	; TREEMON_SET_ROCK_MOUNTAIN_LOW
	; TREEMON_SET_ROCK_MOUNTAIN_HIGH
	
TreeMonMaps:
	treemon_map ROUTE_26,                  TREEMON_SET_JOHTO_HIGH
	treemon_map ROUTE_27,                  TREEMON_SET_JOHTO_HIGH
	treemon_map ROUTE_28,                  TREEMON_SET_KANTO_VERYHIGH
	treemon_map ROUTE_29,                  TREEMON_SET_JOHTO_LOW
	treemon_map ROUTE_30,                  TREEMON_SET_JOHTO_LOW
	treemon_map ROUTE_31,                  TREEMON_SET_JOHTO_LOW
	treemon_map ROUTE_32,                  TREEMON_SET_MOUNTAIN_MED
	treemon_map ROUTE_33,                  TREEMON_SET_MOUNTAIN_MED
	treemon_map ROUTE_34,                  TREEMON_SET_JOHTO_MED
	treemon_map ROUTE_35,                  TREEMON_SET_JOHTO_MED
	treemon_map ROUTE_36,                  TREEMON_SET_FOREST_LOW
	treemon_map ROUTE_37,                  TREEMON_SET_FOREST_LOW
	treemon_map ROUTE_38,                  TREEMON_SET_JOHTO_MED
	treemon_map ROUTE_39,                  TREEMON_SET_JOHTO_MED
	treemon_map ROUTE_40,                  TREEMON_SET_BEACH
	treemon_map ROUTE_41,                  TREEMON_SET_BEACH
	treemon_map ROUTE_42,                  TREEMON_SET_MOUNTAIN_LOW
	treemon_map ROUTE_43,                  TREEMON_SET_LAKE_LOW
	treemon_map ROUTE_44,                  TREEMON_SET_MOUNTAIN_LOW
	treemon_map ROUTE_45,                  TREEMON_SET_MOUNTAIN_LOW
	treemon_map ROUTE_46,                  TREEMON_SET_MOUNTAIN_LOW
	treemon_map NEW_BARK_TOWN,             TREEMON_SET_TOWN_LOW
	treemon_map CHERRYGROVE_CITY,          TREEMON_SET_TOWN_LOW
	treemon_map VIOLET_CITY,               TREEMON_SET_TOWN_HIGH
	treemon_map AZALEA_TOWN,               TREEMON_SET_LAKE_MED
	treemon_map CIANWOOD_CITY,             TREEMON_SET_BEACH
	treemon_map GOLDENROD_CITY,            TREEMON_SET_CITY_LOW
	treemon_map OLIVINE_CITY,              TREEMON_SET_BEACH
	treemon_map ECRUTEAK_CITY,             TREEMON_SET_TOWN_MED
	treemon_map MAHOGANY_TOWN,             TREEMON_SET_TOWN_MED
	treemon_map LAKE_OF_RAGE,              TREEMON_SET_LAKE_LOW
	treemon_map BLACKTHORN_CITY,           TREEMON_SET_TOWN_LOW
	treemon_map SILVER_CAVE_OUTSIDE,       TREEMON_SET_KANTO_VERYHIGH
	treemon_map ILEX_FOREST,               TREEMON_SET_FOREST_LOW
	db -1

RockMonMaps:
	treemon_map ROUTE_40,                  TREEMON_SET_ROCK_BEACH_LOW
	treemon_map ROUTE_41,                  TREEMON_SET_ROCK_BEACH_LOW
	treemon_map ROUTE_42,                  TREEMON_SET_ROCK_MOUNTAIN_LOW
	treemon_map ROUTE_43,                  TREEMON_SET_ROCK_MOUNTAIN_LOW
	treemon_map ROUTE_44,                  TREEMON_SET_ROCK_MOUNTAIN_LOW
	treemon_map ROUTE_45,                  TREEMON_SET_ROCK_MOUNTAIN_LOW
	treemon_map ROUTE_46,                  TREEMON_SET_ROCK_MOUNTAIN_LOW
	treemon_map CIANWOOD_CITY,             TREEMON_SET_ROCK_BEACH_LOW
	treemon_map DARK_CAVE_1F,			   TREEMON_SET_ROCK_CAVE_LOW
	treemon_map DARK_CAVE_B1F,			   TREEMON_SET_ROCK_CAVE_HIGH
	treemon_map SLOWPOKE_WELL_B1F,         TREEMON_SET_ROCK_CAVE_LOW
	db -1
