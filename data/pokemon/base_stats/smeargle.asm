	db SMEARGLE ; 235

	db  55,  20,  35,  75,  20,  45
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 75 ; catch rate
	db 106 ; base exp
	db MIRACLEBERRY, PP_UP ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/smeargle/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm
	; end
