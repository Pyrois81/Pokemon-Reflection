HappinessChanges:
; entries correspond to HAPPINESS_* constants
	table_width 3, HappinessChanges
	; change if happiness < 100, change if happiness < 200, change otherwise
	db  +10,  +6,  +4 ; Gained a level
	db  +10,  +6,  +4 ; Vitamin
	db   +2,  +2,  +1 ; X Item
	db   +6,  +4,  +2 ; Battled a Gym Leader
	db   +2,  +2,  +1 ; Learned a move
	db   -1,  -1,  -1 ; Lost to an enemy
	db   -3,  -3,  -5 ; Fainted due to poison
	db   -3,  -3,  -5 ; Lost to a much stronger enemy
	db   +2,  +2,  +2 ; Haircut (older brother) 1
	db   +6,  +6,  +2 ; Haircut (older brother) 2
	db  +10, +10,  +4 ; Haircut (older brother) 3
	db   +2,  +2,  +2 ; Haircut (younger brother) 1
	db   +6,  +6,  +2 ; Haircut (younger brother) 2
	db  +20, +20,  +8 ; Haircut (younger brother) 3
	db   -3,  -3,  -5 ; Used Heal Powder or Energypowder (bitter)
	db   -5,  -5,  -8 ; Used Energy Root (bitter)
	db   -8,  -8, -10 ; Used Revival Herb (bitter)
	db   +6,  +6,  +2 ; Grooming
	db  +20, +12,  +8 ; Gained a level in the place where it was caught
	assert_table_length NUM_HAPPINESS_CHANGES
