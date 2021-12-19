time_group EQUS "0," ; use the nth TimeFishGroups entry

fishgroup: MACRO
; chance, old rod, good rod, super rod
	db \1
	dw \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	table_width FISHGROUP_DATA_LENGTH, FishGroups
	fishgroup 50 percent, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	fishgroup 50 percent, .Pond_Old,             .Pond_Good,             .Pond_Super
	fishgroup 50 percent, .Cave_Old,			 .Cave_Good,			 .Cave_Super
	fishgroup 50 percent, .Dungeon_Old,			 .Dungeon_Good,			 .Dungeon_Super
	fishgroup 50 percent, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super
	fishgroup 50 percent, .Qwilfish_Swarm_Old,   .Qwilfish_Swarm_Good,   .Qwilfish_Swarm_Super
	assert_table_length NUM_FISHGROUPS

.Ocean_Old:
	db  35 percent,		KRABBY,     15
	db  65 percent, 	CHINCHOU,   15
	db 100 percent,     TENTACOOL,  15
.Ocean_Good:
	db  35 percent,     STARYU,	    25
	db  70 percent,     SHELLDER,	25
	db 100 percent, 	HORSEA,  	25
.Ocean_Super:
	db  25 percent,     KINGLER,    40
	db  50 percent,     SEADRA, 	40
	db  80 percent,		TENTACRUEL, 40
	db 100 percent,     LANTURN,    40

.Pond_Old:
	db  40 percent,		MAGIKARP,   15
	db  70 percent, 	GOLDEEN,    15
	db 100 percent,     SLOWPOKE,   15
.Pond_Good:
	db  35 percent,     GOLDEEN,    25
	db  70 percent,     POLIWAG,    25
	db 100 percent,		SLOWPOKE,   25
.Pond_Super:
	db  30 percent,     SEAKING,    40
	db  60 percent,     POLIWAG,    40
	db  90 percent,     SLOWBRO,    40
	db 100 percent,		DRATINI,    30
	
.Cave_Old:
	db  40 percent,		MAGIKARP,   15
	db  80 percent,		GOLDEEN,    15
	db 100 percent,     SLOWPOKE,   15
.Cave_Good:
	db  30 percent,     REMORAID,   25
	db  65 percent,     SLOWPOKE,   25
	db 100 percent,		POLIWAG,    25
.Cave_Super:
	db  20 percent,     LANTURN,    40
	db  50 percent,     SEAKING,	40
	db  70 percent,		SEADRA, 	40
	db  95 percent,     SLOWBRO,    40
	db 100 percent,		DRATINI,	30
	
.Dungeon_Old:
	db  40 percent,		MAGIKARP,   20
	db  70 percent,		HORSEA,		20
	db 100 percent,     SLOWPOKE,   20
.Dungeon_Good:
	db  20 percent,     REMORAID,   30
	db  50 percent,     SHELLDER,   30
	db 100 percent, 	GOLDEEN,    30
.Dungeon_Super:
	db  30 percent,     SLOWBRO,    50
	db  60 percent,     OCTILLERY,  50
	db  85 percent, 	GYARADOS,   50
	db  95 percent,     DRATINI,    45
	db 100 percent,		DRAGONAIR,	50

.Qwilfish_Old:
	db  40 percent,		MAGIKARP,   15
	db  70 percent, 	GOLDEEN,    15
	db 100 percent,     SLOWPOKE,   15
.Qwilfish_Good:
	db  35 percent,     POLIWAG,    25
	db  70 percent,     GOLDEEN,    25
	db  90 percent,	 	SLOWPOKE,   25
	db 100 percent,     QWILFISH,   25
.Qwilfish_Super:
	db  40 percent,     SEAKING,    40
	db  60 percent,     QWILFISH,   40
	db  90 percent,     SLOWBRO,    40
	db 100 percent,		DRATINI,    30
	
.Qwilfish_Swarm_Old:
	db  25 percent,		MAGIKARP,   15
	db  50 percent, 	GOLDEEN,    15
	db  75 percent,     SLOWPOKE,   15
	db 100 percent,		QWILFISH,	15
.Qwilfish_Swarm_Good:
	db  20 percent,     POLIWAG,    25
	db  40 percent,     GOLDEEN,    25
	db  60 percent,	 	SLOWPOKE,   25
	db 100 percent,     QWILFISH,   25
.Qwilfish_Swarm_Super:
	db  20 percent,     SEAKING,    40
	db  80 percent,     QWILFISH,   40
	db  95 percent,     SLOWBRO,    40
	db 100 percent,		DRATINI,    30

TimeFishGroups:
	;  day              nite
	db CORSOLA,    20,  STARYU,     20 ; 0
	db CORSOLA,    40,  STARYU,     40 ; 1
	db SHELLDER,   20,  SHELLDER,   20 ; 2
	db SHELLDER,   40,  SHELLDER,   40 ; 3
	db GOLDEEN,    20,  GOLDEEN,    20 ; 4
	db GOLDEEN,    40,  GOLDEEN,    40 ; 5
	db POLIWAG,    20,  POLIWAG,    20 ; 6
	db POLIWAG,    40,  POLIWAG,    40 ; 7
	db DRATINI,    20,  DRATINI,    20 ; 8
	db DRATINI,    40,  DRATINI,    40 ; 9
	db QWILFISH,   20,  QWILFISH,   20 ; 10
	db QWILFISH,   40,  QWILFISH,   40 ; 11
	db REMORAID,   20,  REMORAID,   20 ; 12
	db REMORAID,   40,  REMORAID,   40 ; 13
	db GYARADOS,   20,  GYARADOS,   20 ; 14
	db GYARADOS,   40,  GYARADOS,   40 ; 15
	db DRATINI,    10,  DRATINI,    10 ; 16
	db DRATINI,    10,  DRATINI,    10 ; 17
	db HORSEA,     20,  HORSEA,     20 ; 18
	db HORSEA,     40,  HORSEA,     40 ; 19
	db TENTACOOL,  20,  TENTACOOL,  20 ; 20
	db TENTACOOL,  40,  TENTACOOL,  40 ; 21
