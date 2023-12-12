	object_const_def
	const TEAMROCKETBASEB1F_POKE_BALL1
	const TEAMROCKETBASEB1F_POKE_BALL2
	const TEAMROCKETBASEB1F_POKE_BALL3

TeamRocketBaseB1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_TEAMROCKETBASEB1F_MISDREAVUS
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB1F_NOTHING

	def_callbacks

.DummyScene0:
	end
	
.DummyScene1:
	end

MisdreavusBattle:
	special FadeOutMusic
	pause 15
	showemote EMOTE_SAD, PLAYER, 30
	playsound SFX_NIGHTMARE
	waitsfx
	turnobject PLAYER, RIGHT
	pause 10
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon MISDREAVUS, 20
	startbattle
	setscene SCENE_TEAMROCKETBASEB1F_NOTHING
	reloadmapafterbattle
	end	

TeamRocketBaseB1FBookshelf:
	jumpstd TeamRocketOathScript

TeamRocketBaseB1FSmokeBall:
	itemball SMOKE_BALL

TeamRocketBaseB1FSlowpokeTail:
	itemball SLOWPOKETAIL

TeamRocketBaseB1FSpellTag:
	itemball SPELL_TAG

TeamRocketBaseB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  2, MAHOGANY_MART_1F, 3

	def_coord_events
	coord_event 19, 2, SCENE_TEAMROCKETBASEB1F_MISDREAVUS, MisdreavusBattle

	def_bg_events
	bg_event 26, 1, BGEVENT_READ, TeamRocketBaseB1FBookshelf
	bg_event 27, 1, BGEVENT_READ, TeamRocketBaseB1FBookshelf

	def_object_events
	object_event 28,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FSmokeBall, EVENT_TEAM_ROCKET_BASE_B1F_SMOKE_BALL
	object_event 22,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FSlowpokeTail, EVENT_TEAM_ROCKET_BASE_B1F_SLOWPOKETAIL
	object_event 17,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FSpellTag, EVENT_TEAM_ROCKET_BASE_B1F_SPELL_TAG
