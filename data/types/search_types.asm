PokedexTypeSearchConversionTable:
; entries correspond with PokedexTypeSearchStrings (see data/types/search_strings.asm)
	table_width 1, PokedexTypeSearchConversionTable
	db NORMAL
	db FIGHTING
	db FLYING
	db POISON
	db GROUND
	db ROCK
	db BUG
	db GHOST
	db STEEL
	db FIRE
	db WATER
	db GRASS
	db ELECTRIC
	db PSYCHIC_TYPE
	db ICE
	db DRAGON
	db DARK
	assert_table_length NUM_TYPES
