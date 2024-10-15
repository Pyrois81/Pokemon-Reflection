TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2, TreeMons
	dw TreeMonSet_Johto_Low
	dw TreeMonSet_Johto_Med
	dw TreeMonSet_Johto_High
	dw TreeMonSet_Town_Low
	dw TreeMonSet_Town_Med
	dw TreeMonSet_Town_High
	dw TreeMonSet_City_Low
	dw TreeMonSet_City_High
	dw TreeMonSet_Forest_Low
	dw TreeMonSet_Forest_High
	dw TreeMonSet_Mountain_Low
	dw TreeMonSet_Mountain_Med
	dw TreeMonSet_Mountain_High
	dw TreeMonSet_Lake_Low
	dw TreeMonSet_Lake_Med
	dw TreeMonSet_Lake_High
	dw TreeMonSet_Beach
	dw TreeMonSet_Kanto_High
	dw TreeMonSet_Kanto_VeryHigh
	dw TreeMonSet_Rock_Cave_Low
	dw TreeMonSet_Rock_Cave_High
	dw TreeMonSet_Rock_Beach_Low
	dw TreeMonSet_Rock_Beach_High
	dw TreeMonSet_Rock_Mountain_Low
	dw TreeMonSet_Rock_Mountain_High
	assert_table_length NUM_TREEMON_SETS

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_Johto_Low:
; common
	db 20, LEDYBA, 5
	db 20, SPINARAK, 5
	db 20, CATERPIE, 4
	db 20, WEEDLE, 4
	db 15, HOOTHOOT, 4
	db  5, SENTRET, 6
	db -1
; rare
	db 20, LEDYBA, 7
	db 20, SPINARAK, 7
	db 20, METAPOD, 6
	db 20, KAKUNA, 6
	db 15, EKANS, 5
	db  5, PIDGEY, 6
	db -1	
	
TreeMonSet_Johto_Med:
; common
	db 20, LEDIAN, 20
	db 20, ARIADOS, 20
	db 20, BUTTERFREE, 18
	db 20, BEEDRILL, 18
	db 15, NOCTOWL, 19
	db  5, FURRET, 21
	db -1
; rare
	db 20, AIPOM, 22
	db 20, ZUBAT, 20
	db 20, EKANS, 23
	db 15, DITTO, 21
	db 15, SCYTHER, 24
	db 15, PINSIR, 24
	db 10, HERACROSS, 25
	db -1
	
TreeMonSet_Johto_High:
; common
	db 20, HERACROSS, 42
	db 20, PIDGEOTTO, 40
	db 15, ZUBAT, 39
	db 15, SCYTHER, 41
	db 15, PINSIR, 41
	db 10, GASTLY, 43
	db  5, ARBOK, 45
	db -1
; rare
	db 20, HERACROSS, 46
	db 20, PIDGEOT, 45
	db 15, GOLBAT, 42
	db 15, SCYTHER, 44
	db 15, PINSIR, 44
	db 10, HAUNTER, 47
	db  5, GENGAR, 50
	db -1
	
TreeMonSet_Town_Low:
; common
	db 20, PIDGEY, 5
	db 20, SPEAROW, 4
	db 15, LEDYBA, 4
	db 15, SPINARAK, 4
	db 15, PINECO, 5
	db 15, MEOWTH, 5
	db -1
; rare
	db 20, PIDGEY, 7
	db 20, SPEAROW, 6
	db 15, LEDYBA, 6
	db 15, SPINARAK, 6
	db 15, PINECO, 6
	db 15, MEOWTH, 8
	db -1
	
TreeMonSet_Town_Med:
; common
	db 20, PIDGEY, 15
	db 20, SPEAROW, 14
	db 15, LEDIAN, 15
	db 15, ARIADOS, 16
	db 15, PINECO, 13
	db 10, MEOWTH, 15
	db  5, SUDOWOODO, 16
	db -1
; rare
	db 20, PIDGEOTTO, 18
	db 20, FEAROW, 17
	db 15, SUDOWOODO, 19
	db 15, MEOWTH, 17
	db 15, BUTTERFREE, 18
	db 10, BEEDRILL, 18
	db  5, MISDREAVUS, 17
	db -1
	
TreeMonSet_Town_High:
; common
	db 20, PIDGEOTTO, 42
	db 20, FEAROW, 41
	db 15, SUDOWOODO, 44
	db 15, PERSIAN, 43
	db 15, HERACROSS, 41
	db 15, MISDREAVUS, 44
	db -1
; rare
	db 20, PIDGEOT, 46
	db 20, FEAROW, 45
	db 15, SUDOWOODO, 48
	db 15, PERSIAN, 47
	db 15, HERACROSS, 45
	db 15, MISDREAVUS, 46
	db -1

TreeMonSet_City_Low:
; common
	db 20, GRIMER, 27
	db 20, KOFFING, 27
	db 20, VOLTORB, 29
	db 15, GASTLY, 25
	db 15, DITTO, 27
	db 10, MURKROW, 26
	db -1
; rare
	db 20, MUK, 30
	db 20, WEEZING, 30
	db 20, ELECTRODE, 31
	db 15, HAUNTER, 28
	db 15, DITTO, 32
	db 10, MURKROW, 29
	db -1
	
TreeMonSet_City_High:
; common
	db 20, MUK, 60
	db 20, WEEZING, 59
	db 20, ELECTRODE, 62
	db 15, HAUNTER, 58
	db 15, DITTO, 64
	db 10, MURKROW, 61
	db -1
; rare
	db 20, MUK, 65
	db 20, WEEZING, 66
	db 20, ELECTRODE, 69
	db 15, HAUNTER, 63
	db 10, GENGAR, 68
	db 10, MURKROW, 67
	db  5, PORYGON, 65
	db -1

TreeMonSet_Forest_Low:
; common
	db 20, PARAS, 29
	db 20, VENONAT, 30
	db 20, BELLSPROUT, 28
	db 15, PINECO, 31
	db 15, TEDDIURSA, 30
	db 10, TANGELA, 32
	db -1
; rare
	db 20, PARASECT, 34
	db 20, VENOMOTH, 35
	db 20, WEEPINBELL, 32
	db 20, TANGELA, 36
	db 10, URSARING, 34
	db 10, FORRETRESS, 33
	db -1
	
TreeMonSet_Forest_High:
; common
	db 20, PARASECT, 68
	db 20, VENOMOTH, 70
	db 20, WEEPINBELL, 66
	db 20, TANGELA, 69
	db 20, FARFETCH_D, 67
	db -1
; rare
	db 15, PIDGEOT, 72
	db 15, FEAROW, 73
	db 15, BUTTERFREE, 67
	db 15, BEEDRILL, 66
	db 15, CLEFAIRY, 68
	db 15, JIGGLYPUFF, 69
	db 10, ABRA, 65
	db -1

TreeMonSet_Mountain_Low:
; common
	db 20, NATU, 6
	db 20, MANKEY, 5
	db 20, SPEAROW, 5
	db 10, AIPOM, 6
	db 10, METAPOD, 7
	db 10, KAKUNA, 7
	db  5, SCYTHER, 8
	db  5, PINSIR, 8
	db -1
; rare
	db 30, NATU, 8
	db 30, MANKEY, 7
	db 15, METAPOD, 9
	db 15, KAKUNA, 9
	db  5, SCYTHER, 10
	db  5, PINSIR, 10
	db -1
	
TreeMonSet_Mountain_Med:
; common
	db 20, XATU, 33
	db 20, PRIMEAPE, 35
	db 20, AIPOM, 34
	db 15, GLIGAR, 32
	db 10, SCYTHER, 35
	db 10, PINSIR, 35
	db  5, SKARMORY, 33
	db -1
; rare
	db 25, XATU, 37
	db 25, PRIMEAPE, 40
	db 20, GLIGAR, 37
	db 15, TEDDIURSA, 35
	db 15, SKARMORY, 38
	db -1

TreeMonSet_Mountain_High:
; common
	db 20, SKARMORY, 66
	db 20, PRIMEAPE, 67
	db 20, FORRETRESS, 64
	db 15, PERSIAN, 65
	db 15, PIDGEOT, 66
	db 10, MURKROW, 68
	db -1	
; rare
	db 25, SKARMORY, 71
	db 20, PRIMEAPE, 72
	db 20, FORRETRESS, 68
	db 15, PERSIAN, 70
	db 10, PIDGEOT, 67
	db  5, AERODACTYL, 70
	db  5, DRAGONITE, 72
	db -1

TreeMonSet_Lake_Low:
; common
	db 25, HOPPIP, 7
	db 20, YANMA, 8
	db 15, CATERPIE, 6
	db 15, WEEDLE, 6
	db 15, ABRA, 6
	db 10, MURKROW, 8
	db -1
; rare
	db 25, HOPPIP, 9
	db 20, YANMA, 10
	db 15, METAPOD, 8
	db 15, KAKUNA, 8
	db 15, ABRA, 9
	db 10, MURKROW, 10
	db -1
	
TreeMonSet_Lake_Med:
; common
	db 20, HOPPIP, 26
	db 15, YANMA, 25
	db 15, SKIPLOOM, 27
	db 15, BUTTERFREE, 26
	db 15, BEEDRILL, 26
	db 10, ABRA, 25
	db 10, MURKROW, 28
	db -1
; rare
	db 25, SKIPLOOM, 30
	db 20, YANMA, 29
	db 15, BUTTERFREE, 31
	db 15, BEEDRILL, 31
	db 10, ABRA, 28
	db 10, MURKROW, 32
	db  5, JUMPLUFF, 33
	db -1

TreeMonSet_Lake_High:
; common
	db 20, JUMPLUFF, 67
	db 20, YANMA, 68
	db 20, ARBOK, 70
	db 20, MURKROW, 71
	db 20, ABRA, 62
	db -1
; rare
	db 25, JUMPLUFF, 70
	db 25, YANMA, 71
	db 25, ARBOK, 68
	db 15, MURKROW, 72
	db 10, DRAGONAIR, 67
	db -1

TreeMonSet_Beach:
; common
	db 20, LEDYBA, 16
	db 20, SPINARAK, 16
	db 20, EXEGGCUTE, 14
	db 15, DITTO, 13
	db 15, PIDGEY, 15
	db 10, HOOTHOOT, 14
	db -1
; rare
	db 20, LEDYBA, 19
	db 20, SPINARAK, 18
	db 20, EXEGGCUTE, 17
	db 15, DITTO, 15
	db 10, PIDGEOTTO, 18
	db 10, HOOTHOOT, 17
	db  5, DRATINI, 11
	db -1

TreeMonSet_Kanto_High:
; common
	db 20, FARFETCH_D, 51
	db 20, EXEGGCUTE, 52
	db 10, GOLBAT, 50
	db 10, MEOWTH, 49
	db 10, ABRA, 48
	db 10, CLEFAIRY, 52
	db 10, JIGGLYPUFF, 50
	db 10, VENOMOTH, 54
	db -1
; rare
	db 20, FARFETCH_D, 55
	db 20, EXEGGCUTE, 54
	db 10, GOLBAT, 56
	db 10, MEOWTH, 53
	db 10, ABRA, 50
	db 10, CLEFAIRY, 54
	db 10, JIGGLYPUFF, 54
	db 10, VENOMOTH, 57
	db -1
	
TreeMonSet_Kanto_VeryHigh:
; common
	db 15, GOLBAT, 67
	db 15, CLEFAIRY, 65
	db 15, JIGGLYPUFF, 65
	db 15, PERSIAN, 64
	db 15, PRIMEAPE, 66
	db 15, HAUNTER, 63
	db 10, DRAGONAIR, 60
	db -1
; rare
	db 15, GOLBAT, 71
	db 15, CLEFAIRY, 68
	db 15, JIGGLYPUFF, 69
	db 15, PERSIAN, 68
	db 15, PRIMEAPE, 70
	db 15, HAUNTER, 66
	db 10, DRAGONITE, 70
	db -1

TreeMonSet_Rock_Cave_Low:
	db 20, SANDSHREW, 5
	db 20, GEODUDE, 4
	db 15, DIGLETT, 5
	db 15, MAGNEMITE, 4
	db 10, CUBONE, 4
	db 10, DUNSPARCE, 5
	db 10, ONIX, 6
	db -1

TreeMonSet_Rock_Cave_High:
	db 20, SANDSLASH, 25
	db 20, GRAVELER, 24
	db 15, DUGTRIO, 23
	db 15, MAGNETON, 27
	db 10, MAROWAK, 26
	db 10, ONIX, 26
	db 10, GOLEM, 29
	db -1
	
TreeMonSet_Rock_Beach_Low:
	db 20, KRABBY, 14
	db 20, SHELLDER, 13
	db 20, STARYU, 12
	db 15, CORSOLA, 13
	db 15, SHUCKLE, 12
	db  5, OMANYTE, 10
	db  5, KABUTO, 10
	db -1

TreeMonSet_Rock_Beach_High:
	db 20, STARYU, 48
	db 20, SHELLDER, 49
	db 15, KRABBY, 47
	db 15, KINGLER, 50
	db 10, CORSOLA, 51
	db 10, SHUCKLE, 46
	db  5, OMASTAR, 52
	db  5, KABUTOPS, 52
	db -1

TreeMonSet_Rock_Mountain_Low:
	db 20, SLUGMA, 7
	db 20, PHANPY, 6
	db 20, GEODUDE, 6
	db 15, ONIX, 6
	db 10, MAGNEMITE, 6
	db 10, TYROGUE, 7
	db  5, RHYHORN, 7
	db -1

TreeMonSet_Rock_Mountain_High:
	db 20, MAGCARGO, 34
	db 20, DONPHAN, 32
	db 20, RHYDON, 33
	db 15, GRAVELER, 31
	db 15, FORRETRESS, 30
	db  5, GOLEM, 35
	db  4, LARVITAR, 29
	db  1, PUPITAR, 32
	db -1
