	object_const_def
	const OLIVINELIGHTHOUSE6F_POKE_BALL

OlivineLighthouse6F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouse6FMaxElixir:
	itemball MAX_ELIXIR

OlivineLighthouse6FHiddenProtein:
	hiddenitem PROTEIN, EVENT_OLIVINE_LIGHTHOUSE_6F_HIDDEN_PROTEIN

OlivineLighthouse6FBookshelf1:
	jumptext OlivineLighthouseBookshelf1Text

OlivineLighthouse6FBookshelf2:
	jumptext OlivineLighthouseBookshelf2Text

OlivineLighthouse6FJournal:
	jumptext OlivineLighthouseJournalText
	
OlivineLighthouseBookshelf1Text:
	text "There are a bunch"
	line "of manuals ex-"
	
	para "plaining how to"
	line "operate various"
	
	para "equipment in the"
	line "lighthouse."
	
	para "They all look"
	line "pretty out of"
	cont "date."
	done

OlivineLighthouseBookshelf2Text:
	text "All kinds of books"
	line "about #MON:"
	
	para "Fauna of KANTO by"
	line "S. OAK, PhD.;"
	
	para "From AIPOM to"
	line "DROWZEE: A Compre-"
	
	para "hensive Guide to"
	line "#MON Reproduct-"
	cont "ion by ELM;"
	
	para "On Safari by"
	line "Baoba; among many"
	cont "others."
	done

OlivineLighthouseJournalText:
	text "Well, it seems as"
	line "though my tenure"
	
	para "here must come to"
	line "an end since they-"
	
	para "'re dead set on"
	line "automating every-"
	cont "thing."
	
	para "All the same -- I"
	line "was intending to"
	
	para "retire soon"
	line "anyway."
	
	para "Where to, though…?"
	
	para "Maybe I should"
	line "throw a dart at"
	
	para "the map and let"
	line "fate decide."
	
	para "Perhaps I'll pay a"
	line "visit to that"
	
	para "SAFARI ZONE across"
	line "the sea, first…"
	
	para "I've always wanted"
	line "to see it ter-"
	cont "ribly."
	done

OlivineLighthouse6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_5F, 4
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_5F, 5
	warp_event 11, 11, OLIVINE_LIGHTHOUSE_5F, 6

	def_coord_events

	def_bg_events
	bg_event  8,  7, BGEVENT_READ, OlivineLighthouse6FBookshelf1
	bg_event  9,  7, BGEVENT_READ, OlivineLighthouse6FBookshelf2
	bg_event  3,  5, BGEVENT_READ, OlivineLighthouse6FJournal
	bg_event  5,  4, BGEVENT_ITEM, OlivineLighthouse6FHiddenProtein

	def_object_events
	object_event  6, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse6FMaxElixir, EVENT_OLIVINE_LIGHTHOUSE_6F_MAX_ELIXIR
