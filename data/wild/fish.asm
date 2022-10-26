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
	db  20 percent,     STARYU,     30
	db  40 percent,     SHELLDER,   30
	db  55 percent,     KINGLER,    40
	db  70 percent,     HORSEA, 	35
	db  85 percent,		TENTACRUEL, 40
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
	db  20 percent,		REMORAID,	30
	db  40 percent,     LANTURN,    40
	db  55 percent,     SEAKING,	40
	db  70 percent,		SEADRA, 	40
	db  85 percent,     SLOWBRO,    40
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
	db  20 percent,     SHELLDER,   40
	db  40 percent,     SLOWBRO,    50
	db  60 percent,     OCTILLERY,  50
	db  80 percent, 	GYARADOS,   50
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
	db MAGIKARP, 1,  MAGIKARP, 1 ; 0
