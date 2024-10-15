LoadBattleScreenTypeIconGFX:
	; first, copy the type icons into vTiles1
	ld a, [wBattleMonType1]
	call .icon_index
	ld hl, vTiles1 tile $3c
	call .copy_icon
	ld a, [wBattleMonType2]
	call .icon_index
	ld hl, vTiles1 tile $3d
	call .copy_icon
	ld a, [wEnemyMonType1]
	call .icon_index
	ld hl, vTiles1 tile $3e
	call .copy_icon
	ld a, [wEnemyMonType2]
	call .icon_index
	ld hl, vTiles1 tile $3f
	call .copy_icon
	ret

.icon_index
	ld bc, LEN_2BPP_TILE
	ld hl, .type_icons
	call AddNTimes
	ld d, h
	ld e, l
	ret
	
.copy_icon
	lb bc, BANK(LoadBattleScreenTypeIconGFX), 1 ; 1 tile at a time
	call Get2bppViaHDMA
	ret

.type_icons
	INCBIN "gfx/types/type_icons.2bpp"
	
/*	; didn't realize OBJ 2-7 were used for battle anims and refreshed constantly

	; then, update palettes OBJ 4-7 respectively
	ld a, [wBattleMonType1]
	call .pal_index
	ld de, wOBPals1 + 4 palettes ; OBJ 4
	call .copy_palette
	ld a, [wBattleMonType2]
	call .pal_index
	ld de, wOBPals1 + 5 palettes ; OBJ 5
	call .copy_palette
	ld a, [wEnemyMonType1]
	call .pal_index
	ld de, wOBPals1 + 6 palettes ; OBJ 6
	call .copy_palette
	ld a, [wEnemyMonType2]
	call .pal_index
	ld de, wOBPals1 + 7 palettes ; OBJ 7
	call .copy_palette	
	ret
	
.copy_palette
	ld bc, 1 palettes ; 1 at a time
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ret

*/
	
PlaceBattleScreenTypeIcons:
	; OAM struct: YCoord, XCoord, TileID, Attributes
	; Begin by placing player mon's type 2 icon in bottom position ~(19,11)
	; If mon is single-type, wBattleMonType1 and 2 will be the same
	ld hl, wVirtualOAMSprite37
	ld a, 12 * TILE_WIDTH + 7
	ld [hli], a
	ld a, 20 * TILE_WIDTH - 1
	ld [hli], a
	ld a, $bd
	ld [hli], a
	ld a, [wBattleMonType2]
	push hl
	call GetTypeIconPalette
	pop hl
	ld [hl], a
	
	ld a, [wBattleMonType2]
	ld c, a
	ld a, [wBattleMonType1]
	cp c
	jr nz, .player_type1
	xor a ; clear any previous type 1 icon data
	ld hl, wVirtualOAMSprite36
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	jr .enemy_type2
	
.player_type1
	; place type 1 icon above it
	ld hl, wVirtualOAMSprite36
	ld a, 11 * TILE_WIDTH + 5
	ld [hli], a
	ld a, 20 * TILE_WIDTH - 1
	ld [hli], a
	ld a, $bc
	ld [hli], a
	ld a, [wBattleMonType1]
	push hl
	call GetTypeIconPalette
	pop hl
	ld [hl], a	
	; fallthrough
	
.enemy_type2
	; Place enemy's second type in the bottom position ~(0,3)
	ld hl, wVirtualOAMSprite39
	ld a, 4 * TILE_WIDTH + 7
	ld [hli], a
	ld a, 1 * TILE_WIDTH + 1
	ld [hli], a
	ld a, $bf
	ld [hli], a
	ld a, [wEnemyMonType2]
	push hl
	call GetTypeIconPalette
	pop hl
	ld [hl], a	
	
	ld a, [wEnemyMonType2]
	ld c, a
	ld a, [wEnemyMonType1]
	cp c
	jr nz, .enemy_type1
	xor a ; clear any previous type 1 icon data
	ld hl, wVirtualOAMSprite38
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret
	
.enemy_type1
	; place type 1 icon above it
	ld hl, wVirtualOAMSprite38
	ld a, 3 * TILE_WIDTH + 5
	ld [hli], a
	ld a, 1 * TILE_WIDTH + 1
	ld [hli], a
	ld a, $be
	ld [hli], a
	ld a, [wEnemyMonType1]
	push hl
	call GetTypeIconPalette
	pop hl
	ld [hl], a	
	ret

GetTypeIconPalette:
	ld d, 0
	ld e, a
	ld hl, TypeIconPalettes
.loop
	ld a, [hli]
	inc hl
	cp -1
	jr z, .not_found
	cp e
	jr nz, .loop
	
	dec hl
	ld a, [hl]
	ret

.not_found
	ld a, 1 ; player mon palette
	ret
	