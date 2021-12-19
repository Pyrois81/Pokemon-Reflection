HappinessData_OlderHaircutBrother:
	db  20 percent,     2, HAPPINESS_OLDERCUT1 ; 20% chance
	db  40 percent,	    3, HAPPINESS_OLDERCUT2 ; 40% chance
	db 	    -1,     4, HAPPINESS_OLDERCUT3 ; 40% chance

HappinessData_YoungerHaircutBrother:
	db  30 percent,	    2, HAPPINESS_YOUNGCUT1 ; 30% chance
	db  40 percent,     3, HAPPINESS_YOUNGCUT2 ; 40% chance
	db 	    -1,     4, HAPPINESS_YOUNGCUT3 ; 30% chance

HappinessData_DaisysGrooming:
	db  50 percent,     2, HAPPINESS_GROOMING
	db          -1,	    2, HAPPINESS_GROOMING  ; 100% chance
