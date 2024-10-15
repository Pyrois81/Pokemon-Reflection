InitCrystalData:
	ld a, $1
	ld [wd474], a
	xor a
	ld [wd473], a
	ld [wPlayerGender], a
	ld [wd475], a
	ld [wd476], a
	ld [wd477], a
	ld [wd478], a
	ld [wd002], a
	ld [wd003], a
	ld a, [wd479]
	res 0, a ; ???
	ld [wd479], a
	ld a, [wd479]
	res 1, a ; ???
	ld [wd479], a
	ret

INCLUDE "mobile/mobile_12.asm"

InitGenderChooseBattleMode:
	call InitGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetPalettes
	ld hl, AreYouABoyOrAreYouAGirlText
	call PrintText
	ld hl, .GenderMenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	ld [wPlayerGender], a
	ld c, 10
	call DelayFrames
	
	ld hl, DefaultBattleModeText
	call PrintText
	ld hl, .BattleModeMenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	xor 1
	ld hl, wOptions
	jr z, .ShiftMode ; 0 = SHIFT, 1 = SET
	set BATTLE_SHIFT, [hl]
	jr .done
	
.ShiftMode
	res BATTLE_SHIFT, [hl]
	; fallthrough
.done
	ld c, 10
	call DelayFrames
	ret

.GenderMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 4, 13, 9
	dw .GenderMenuData
	db 1 ; default option

.GenderMenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	db 2 ; items
	db "Boy@"
	db "Girl@"

.BattleModeMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 4, 18, 9
	dw .BattleModeMenuData
	db 1 ; default option

.BattleModeMenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	db 2 ; items
	db "Keep it on SET@"
	db "Back to SHIFT@"

AreYouABoyOrAreYouAGirlText:
	text_far _AreYouABoyOrAreYouAGirlText
	text_end

DefaultBattleModeText:
	text_far _DefaultBattleModeText
	text_end

InitGenderScreen:
	ld a, $10
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld c, 8
	call DelayFrames
	call ClearBGPalettes
	call InitCrystalData
	call LoadFontsExtra
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $0
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ret

LoadGenderScreenPal:
	ld hl, .Palette
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	ret

.Palette:
INCLUDE "gfx/new_game/gender_screen.pal"

LoadGenderScreenLightBlueTile:
	ld de, .LightBlueTile
	ld hl, vTiles2 tile $00
	lb bc, BANK(.LightBlueTile), 1
	call Get2bpp
	ret

.LightBlueTile:
INCBIN "gfx/new_game/gender_screen.2bpp"
