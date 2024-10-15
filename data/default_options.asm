DefaultOptions:
; wOptions: fast text speed, Set battle mode
	db TEXT_DELAY_FAST | 1 << BATTLE_SHIFT
; wSaveFileExists: no
	db FALSE
; wTextboxFrame: frame 1
	db FRAME_3
; wTextboxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wGBPrinterBrightness: normal
	db GBPRINTER_NORMAL
; wOptions2: menu account on
	db 1 << MENU_ACCOUNT

	db $00
	db $00
.End
	assert DefaultOptions.End - DefaultOptions == wOptionsEnd - wOptions
