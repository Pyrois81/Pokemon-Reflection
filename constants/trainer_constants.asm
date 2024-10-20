__trainer_class__ = 0

trainerclass: MACRO
\1 EQU __trainer_class__
__trainer_class__ = __trainer_class__ + 1
	const_def 1
ENDM

; trainer class ids
; `trainerclass` indexes are for:
; - TrainerClassNames (see data/trainers/class_names.asm)
; - TrainerClassAttributes (see data/trainers/attributes.asm)
; - TrainerClassDVs (see data/trainers/dvs.asm)
; - TrainerGroups (see data/trainers/party_pointers.asm)
; - TrainerEncounterMusic (see data/trainers/encounter_music.asm)
; - TrainerPicPointers (see data/trainers/pic_pointers.asm)
; - TrainerPalettes (see data/trainers/palettes.asm)
; - BTTrainerClassSprites (see data/trainers/sprites.asm)
; - BTTrainerClassGenders (see data/trainers/genders.asm)
; trainer constants are Trainers indexes, for the sub-tables of TrainerGroups (see data/trainers/parties.asm)
CHRIS EQU __trainer_class__
	trainerclass TRAINER_NONE ; 0
	const PHONECONTACT_MOM
	const PHONECONTACT_BIKESHOP
	const PHONECONTACT_BILL
	const PHONECONTACT_ELM
	const PHONECONTACT_BUENA
NUM_NONTRAINER_PHONECONTACTS EQU const_value - 1

KRIS EQU __trainer_class__
	trainerclass FALKNER ; 1
	const FALKNER1

	trainerclass WHITNEY ; 2
	const WHITNEY1

	trainerclass BUGSY ; 3
	const BUGSY1

	trainerclass MORTY ; 4
	const MORTY1

	trainerclass PRYCE ; 5
	const PRYCE1

	trainerclass JASMINE ; 6
	const JASMINE1

	trainerclass CHUCK ; 7
	const CHUCK1

	trainerclass CLAIR ; 8
	const CLAIR1

	trainerclass RIVAL1 ; 9
	const RIVAL1_CHERRYGROVE ; Cherrygrove City
	const RIVAL1_OLIVINE ; Olivine City
	const RIVAL1_3_ODDISH
	const RIVAL1_3_VULPIX
	const RIVAL1_3_POLIWAG
	const RIVAL1_4_ODDISH
	const RIVAL1_4_VULPIX
	const RIVAL1_4_POLIWAG
	const RIVAL1_5_ODDISH
	const RIVAL1_5_VULPIX
	const RIVAL1_5_POLIWAG

	trainerclass POKEMON_PROF ; a

	trainerclass WILL ; b
	const WILL1

	trainerclass CAL ; c
	const CAL1
	const CAL2
	const CAL3

	trainerclass BRUNO ; d
	const BRUNO1

	trainerclass KAREN ; e
	const KAREN1

	trainerclass KOGA ; f
	const KOGA1

	trainerclass CHAMPION ; 10
	const LANCE

	trainerclass BROCK ; 11
	const BROCK1

	trainerclass MISTY ; 12
	const MISTY1

	trainerclass LT_SURGE ; 13
	const LT_SURGE1

	trainerclass SCIENTIST ; 14
	const ROSS
	const MITCH
	const JED
	const MARC
	const RICH

	trainerclass ERIKA ; 15
	const ERIKA1

	trainerclass YOUNGSTER ; 16
	const JOEY1 ; Route 30
	const MIKEY ; Route 30
	const ALBERT
	const GORDON
	const SAMUEL
	const IAN
	const JOEY2
	const JOEY3
	const WARREN
	const JIMMY
	const OWEN
	const JASON
	const JOEY4
	const JOEY5

	trainerclass SCHOOLBOY ; 17
	const JACK1
	const KIPP
	const ALAN1
	const JOHNNY
	const DANNY
	const TOMMY
	const DUDLEY
	const JOE
	const BILLY
	const CHAD1 ; Route 38 (1st battle)
	const NATE
	const RICKY
	const JACK2
	const JACK3
	const ALAN2
	const ALAN3
	const CHAD2 ; Route 38 (2nd battle)
	const CHAD3 ; Route 38 (3rd battle)
	const JACK4
	const JACK5
	const ALAN4
	const ALAN5
	const CHAD4 ; Route 38 (4th battle)
	const CHAD5 ; Route 38 (5th battle)

	trainerclass BIRD_KEEPER ; 18
	const ROD
	const ABE
	const BRYAN
	const THEO ; Unreferenced
	const TOBY ; Route 38
	const DENIS ; Unreferenced
	const VANCE ; Route 44
	const HANK
	const ROY
	const BORIS
	const BOB
	const JOSE1
	const PETER
	const JOSE2
	const PERRY
	const BRET
	const JOSE3

	trainerclass LASS ; 19
	const CARRIE
	const BRIDGET
	const ALICE
	const KRISE
	const CONNIE ; Unreferenced
	const LINDA
	const LAURA
	const SHANNON
	const MICHELLE
	const DANA1 ; Route 38 (1st battle)
	const ELLEN
	const DANA2 ; Route 38 (2nd battle)
	const DANA3 ; Route 38 (3rd battle)
	const DANA4 ; Route 38 (4th battle)
	const DANA5 ; Route 38 (5th battle)

	trainerclass JANINE ; 1a
	const JANINE1

	trainerclass COOLTRAINERM ; 1b
	const NICK
	const AARON ; Lake of Rage
	const PAUL ; Blackthorn Gym 1F
	const CODY ; Blackthorn Gym 2F
	const GAVEN1
	const GAVEN2
	const RYAN ; Route 45
	const JAKE
	const GAVEN3
	const BLAKE
	const BRIAN
	const ERICK
	const ANDY
	const TYLER
	const SEAN
	const KEVIN
	const STEVE
	const ALLEN ; Route 44
	const DARIN ; Dragon's Den

	trainerclass COOLTRAINERF ; 1c
	const GWEN
	const LOIS ; Lake of Rage
	const FRAN ; Blackthorn Gym 2F
	const LOLA ; Blackthorn Gym 1F
	const KATE
	const IRENE
	const KELLY ; Route 45
	const JOYCE
	const BETH1
	const REENA1
	const MEGAN
	const BETH2
	const CAROL
	const QUINN
	const EMMA
	const CYBIL ; Route 44
	const JENN
	const BETH3
	const REENA2
	const REENA3
	const CARA ; Dragon's Den

	trainerclass BEAUTY ; 1d
	const VICTORIA
	const SAMANTHA
	const JULIE
	const JACLYN
	const BRENDA
	const CASSIE
	const CAROLINE
	const CARLENE
	const JESSICA
	const RACHAEL
	const ANGELICA
	const KENDRA
	const VERONICA
	const JULIA
	const THERESA
	const VALERIE ; Route 38
	const OLIVIA ; Route 38
	const MELISSA ; Olivine Gym

	trainerclass POKEMANIAC ; 1e
	const LARRY
	const ANDREW
	const CALVIN
	const SHANE ; Route 42
	const BEN ; Route 43
	const BRENT1 ; Route 43
	const RON ; Route 43
	const ETHAN
	const BRENT2
	const BRENT3
	const ISAAC
	const DONALD
	const ZACH ; Route 44
	const BRENT4
	const MILLER

	trainerclass GRUNTM ; 1f
	const GRUNTM_1 ; Lake of Rage Hidden Power House
	const GRUNTM_2 ; Lake of Rage
	const GRUNTM_3 ; Lake of Rage
	const GRUNTM_4
	const GRUNTM_5
	const GRUNTM_6
	const GRUNTM_7
	const GRUNTM_8
	const GRUNTM_9
	const GRUNTM_10
	const GRUNTM_11
	const GRUNTM_12_UNUSED
	const GRUNTM_13
	const GRUNTM_14
	const GRUNTM_15
	const GRUNTM_16
	const GRUNTM_17
	const GRUNTM_18
	const GRUNTM_19
	const GRUNTM_20
	const GRUNTM_21
	const GRUNTM_22_UNUSED
	const GRUNTM_23_UNUSED
	const GRUNTM_24
	const GRUNTM_25
	const GRUNTM_26_UNUSED
	const GRUNTM_27_UNUSED
	const GRUNTM_28
	const GRUNTM_29
	const GRUNTM_30_UNUSED
	const GRUNTM_31

	trainerclass GENTLEMAN ; 20
	const PRESTON ; Unreferenced
	const EDWARD
	const GREGORY
	const VIRGIL
	const ALFRED ; Unreferenced

	trainerclass SKIER ; 21
	const ROXANNE ; Mahogany Gym
	const CLARISSA ; Mahogany Gym
	const NATALIE ; Ice Path 1F

	trainerclass TEACHER ; 22
	const COLETTE
	const HILLARY
	const SHIRLEY

	trainerclass SABRINA ; 23
	const SABRINA1

	trainerclass BUG_CATCHER ; 24
	const DON ; Route 30
	const ROB
	const ED
	const WADE1
	const BUG_CATCHER_BENNY
	const AL
	const JOSH
	const ARNIE1
	const KEN
	const WADE2
	const WADE3
	const DOUG
	const ARNIE2
	const ARNIE3
	const WADE4
	const WADE5
	const ARNIE4
	const ARNIE5
	const WAYNE

	trainerclass FISHER ; 25
	const JUSTIN
	const RALPH1
	const ARNOLD
	const KYLE
	const HENRY
	const MARVIN ; Route 43
	const TULLY1 ; Route 42 (1st battle)
	const ANDRE ; Lake of Rage
	const RAYMOND ; Lake of Rage
	const WILTON ; Route 44
	const EDGAR ; Route 44
	const JONAH
	const MARTIN
	const STEPHEN
	const BARNEY
	const RALPH2
	const RALPH3
	const TULLY2 ; Route 42 (2nd battle)
	const TULLY3 ; Route 42 (3rd battle)
	const SCOTT
	const RALPH4
	const RALPH5
	const TULLY4 ; Route 42 (4th battle)

	trainerclass SWIMMERM ; 26
	const HAROLD
	const SIMON
	const RANDALL
	const CHARLIE
	const GEORGE
	const BERKE
	const KIRK
	const MATHEW
	const HAL
	const PATON
	const DARYL
	const WALTER
	const TONY
	const JEROME
	const TUCKER
	const RICK
	const CAMERON
	const SETH
	const JAMES
	const LEWIS
	const PARKER

	trainerclass SWIMMERF ; 27
	const ELAINE
	const PAULA
	const KAYLEE
	const SUSIE
	const DENISE
	const KARA
	const WENDY
	const LISA
	const JILL
	const MARY
	const KATIE
	const DAWN
	const TARA
	const NICOLE
	const LORI
	const JODY
	const NIKKI
	const DIANA
	const BRIANA

	trainerclass SAILOR ; 28
	const EUGENE ; Route 39
	const HUEY ; Unreferenced
	const TERRELL ; Unreferenced
	const KENT ; Unreferenced
	const ERNEST ; Unreferenced
	const JEFF
	const GARRETT
	const KENNETH
	const STANLY
	const HARRY ; Route 38

	trainerclass SUPER_NERD ; 29
	const STAN
	const ERIC
	const GREGG
	const JAY
	const DAVE
	const SAM
	const TOM
	const PAT
	const SHAWN
	const TERU
	const RUSS
	const NORTON
	const HUGH
	const MARKUS
	const JACOB ; Olivine Gym

	trainerclass RIVAL2 ; 2a
	const RIVAL2_1_ODDISH
	const RIVAL2_1_VULPIX
	const RIVAL2_1_POLIWAG
	const RIVAL2_2_ODDISH
	const RIVAL2_2_VULPIX
	const RIVAL2_2_POLIWAG

	trainerclass GUITARIST ; 2b
	const CLYDE
	const VINCENT
	const RIDLEY ; Olivine Gym

	trainerclass HIKER ; 2c
	const ANTHONY1
	const RUSSELL
	const PHILLIP
	const LEONARD
	const ANTHONY2
	const BENJAMIN ; Route 42
	const ERIK ; Route 45
	const MICHAEL ; Route 45
	const PARRY1 ; Route 45 (2nd battle)
	const TIMOTHY ; Route 45
	const BAILEY ; Route 46
	const ANTHONY3
	const TIM
	const NOLAND
	const SIDNEY
	const KENNY
	const JIM
	const DANIEL
	const PARRY2 ; Route 45 (3rd battle)
	const PARRY3 ; Route 45 (1st battle)
	const ANTHONY4
	const ANTHONY5

	trainerclass BIKER ; 2d
	const BIKER_BENNY
	const KAZU
	const DWAYNE
	const HARRIS
	const ZEKE
	const CHARLES
	const RILEY
	const JOEL
	const GLENN

	trainerclass BLAINE ; 2e
	const BLAINE1

	trainerclass BURGLAR ; 2f
	const DUNCAN
	const EDDIE
	const COREY

	trainerclass FIREBREATHER ; 30
	const OTIS
	const DICK
	const NED
	const BURT
	const BILL
	const WALT
	const RAY
	const LYLE
	const FRANK ; Ice Path B1F

	trainerclass JUGGLER ; 31
	const IRWIN1
	const FRITZ
	const HORTON
	const IRWIN2
	const IRWIN3
	const IRWIN4

	trainerclass BLACKBELT_T ; 32
	const KENJI ; Route 45
	const YOSHI
	const LAO
	const NOB
	const KIYO
	const LUNG
	const WAI

	trainerclass EXECUTIVEM ; 33
	const EXECUTIVEM_1
	const EXECUTIVEM_2
	const EXECUTIVEM_3
	const EXECUTIVEM_4

	trainerclass PSYCHIC_T ; 34
	const NATHAN
	const FRANKLIN
	const HERMAN
	const FIDEL
	const GREG
	const NORMAN ; Route 39
	const MARK
	const PHIL ; Route 44
	const RICHARD
	const GILBERT
	const JARED
	const RODNEY

	trainerclass PICNICKER ; 35
	const LIZ1
	const GINA1
	const BROOKE
	const KIM
	const CINDY
	const HOPE
	const SHARON
	const DEBRA
	const GINA2
	const ERIN1 ; Route 46
	const LIZ2
	const LIZ3
	const HEIDI
	const EDNA
	const GINA3
	const TIFFANY1 ; Route 43 (2nd battle)
	const TIFFANY2 ; Route 43 (3rd battle)
	const ERIN2
	const TANYA
	const TIFFANY3 ; Route 43 (1st battle)
	const ERIN3
	const LIZ4
	const LIZ5
	const GINA4
	const GINA5
	const TIFFANY4

	trainerclass CAMPER ; 36
	const ROLAND
	const TODD1
	const IVAN
	const ELLIOT
	const BARRY
	const LLOYD
	const DEAN
	const SID
	const HARVEY
	const DALE
	const TED ; Route 46
	const TODD2
	const TODD3
	const THOMAS
	const LEROY
	const DAVID
	const JOHN
	const JERRY
	const SPENCER ; Route 43
	const TODD4
	const TODD5
	const NEIL ; Ice Path 1F

	trainerclass EXECUTIVEF ; 37
	const EXECUTIVEF_1
	const EXECUTIVEF_2

	trainerclass SAGE ; 38
	const CHOW
	const NICO
	const JIN
	const TROY
	const JEFFREY ; Ecruteak Gym
	const PING ; Ecruteak Gym
	const EDMOND
	const NEAL
	const LI
	const GAKU
	const MASA
	const KOJI

	trainerclass MEDIUM ; 39
	const MARTHA ; Ecruteak Gym
	const GRACE ; Ecruteak Gym
	const BETHANY
	const MARGRET
	const ETHEL
	const REBECCA
	const DORIS

	trainerclass BOARDER ; 3a
	const RONALD ; Mahogany Gym
	const BRAD ; Mahogany Gym
	const DOUGLAS ; Mahogany Gym

	trainerclass POKEFANM ; 3b
	const WILLIAM
	const DEREK1 ; Route 39
	const ROBERT
	const JOSHUA
	const CARTER
	const TREVOR
	const BRANDON
	const JEREMY
	const COLIN
	const DEREK2
	const DEREK3
	const ALEX
	const REX
	const ALLAN

	trainerclass KIMONO_GIRL ; 3c
	const HONOKO ; Dance Theatre
	const REIKO ; Dance Theatre
	const ANJU ; Dance Theatre
	const MINATO ; Dance Theatre
	const AZUMA ; Dance Theatre

	trainerclass TWINS ; 3d
	const AMYANDMAY1
	const ANNANDANNE1
	const ANNANDANNE2
	const AMYANDMAY2
	const JOANDZOE1
	const JOANDZOE2
	const MEGANDPEG1
	const MEGANDPEG2
	const LEAANDPIA1 ; Dragon's Den
	const LEAANDPIA2 ; Dragon's Den

	trainerclass POKEFANF ; 3e
	const BEVERLY1
	const RUTH ; Route 39
	const BEVERLY2
	const BEVERLY3
	const GEORGIA
	const JAMIE ; Route 39

	trainerclass RED ; 3f
	const RED1

	trainerclass BLUE ; 40
	const BLUE1

	trainerclass OFFICER ; 41
	const KEITH
	const DIRK

	trainerclass GRUNTF ; 42
	const GRUNTF_1 ; Lake of Rage Hidden Power House
	const GRUNTF_2
	const GRUNTF_3
	const GRUNTF_4
	const GRUNTF_5

	trainerclass MYSTICALMAN ; 43
	const EUSINE

NUM_TRAINER_CLASSES EQU __trainer_class__ - 1
