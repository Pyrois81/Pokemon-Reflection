PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_types.asm)
	table_width POKEDEX_TYPE_STRING_LENGTH, PokedexTypeSearchStrings
	db "  ----  @"
	db " NORMAL @"
	db "FIGHTING@"
	db " FLYING @"
	db " POISON @"
	db " GROUND @"
	db "  ROCK  @"
	db "  BUG   @"
	db " GHOST  @"
	db " STEEL  @"
	db "  FIRE  @"
	db " WATER  @"
	db " GRASS  @"
	db "ELECTRIC@"
	db "PSYCHIC @"
	db "  ICE   @"
	db " DRAGON @"
	db "  DARK  @"
	assert_table_length NUM_TYPES + 1
