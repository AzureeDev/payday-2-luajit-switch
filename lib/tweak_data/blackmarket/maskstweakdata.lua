local is_nextgen_console = SystemInfo:platform() == Idstring("PS4") or SystemInfo:platform() == Idstring("XB1") or SystemInfo:platform() == Idstring("NX64")
local allow_halloween_lootdrop = is_nextgen_console

function BlackMarketTweakData:_init_masks(tweak_data)
	self.masks = {
		character_locked = {}
	}
	self.masks.character_locked.name_id = "bm_msk_character_locked"
	self.masks.character_locked.inaccessible = true
	self.masks.character_locked.dallas = "dallas"
	self.masks.character_locked.wolf = "wolf"
	self.masks.character_locked.hoxton = "hoxton"
	self.masks.character_locked.chains = "chains"
	self.masks.character_locked.jowi = "jw_shades"
	self.masks.character_locked.old_hoxton = "old_hoxton"
	self.masks.character_locked.female_1 = "msk_grizel"
	self.masks.character_locked.dragan = "dragan"
	self.masks.character_locked.jacket = "richard_returns"
	self.masks.character_locked.bonnie = "bonnie"
	self.masks.character_locked.sokol = "sokol"
	self.masks.character_locked.dragon = "jiro"
	self.masks.character_locked.bodhi = "bodhi"
	self.masks.character_locked.jimmy = "jimmy_duct"
	self.masks.character_locked.sydney = "sydney"
	self.masks.character_locked.wild = "rust"
	self.masks.character_locked.joy = "joy"
	self.masks.skull = {
		unit = "units/payday2/masks/msk_skull/msk_skull",
		name_id = "bm_msk_skull",
		pcs = {
			10,
			20,
			30,
			40
		},
		dlc = "preorder",
		value = 1
	}
	self.masks.wolf_clean = {
		unit = "units/payday2/masks/msk_wolf_clean/msk_wolf_clean",
		name_id = "bm_msk_wolf_clean",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 9,
		qlvl = 0
	}
	self.masks.hoxton_clean = {
		unit = "units/payday2/masks/msk_hoxton_clean/msk_hoxton_clean",
		name_id = "bm_msk_hoxton_clean",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 9,
		qlvl = 0
	}
	self.masks.dallas_clean = {
		unit = "units/payday2/masks/msk_dallas_clean/msk_dallas_clean",
		name_id = "bm_msk_dallas_clean",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 10,
		qlvl = 0
	}
	self.masks.chains_clean = {
		unit = "units/payday2/masks/msk_chains_clean/msk_chains_clean",
		name_id = "bm_msk_chains_clean",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 9,
		qlvl = 0
	}
	self.masks.dallas = {
		unit = "units/payday2/masks/msk_dallas/msk_dallas",
		name_id = "bm_msk_dallas",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 7
	}
	self.masks.hoxton = {
		unit = "units/payday2/masks/msk_hoxton/msk_hoxton",
		name_id = "bm_msk_hoxton",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 7
	}
	self.masks.chains = {
		unit = "units/payday2/masks/msk_chains/msk_chains",
		name_id = "bm_msk_chains",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 7
	}
	self.masks.old_hoxton = {
		unit = "units/pd2_dlc_old_hoxton/masks/old_hoxton/msk_old_hoxton",
		name_id = "bm_msk_old_hoxton",
		pcs = {},
		value = 0,
		global_value = "infamous"
	}
	self.masks.wolf = {
		unit = "units/payday2/masks/msk_wolf/msk_wolf",
		name_id = "bm_msk_wolf",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 7
	}
	self.masks.dragan = {
		unit = "units/pd2_dlc_dragan/masks/dragan/msk_dragan",
		name_id = "bm_msk_dragan",
		pcs = {},
		value = 0,
		texture_bundle_folder = "character_pack_dragan",
		dlc = "character_pack_dragan"
	}
	self.masks.dragan_begins = {
		unit = "units/pd2_dlc_dragan/masks/dragan_begins/msk_dragan_begins",
		name_id = "bm_msk_dragan_begins",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		texture_bundle_folder = "character_pack_dragan",
		dlc = "character_pack_dragan"
	}
	self.masks.bonnie = {
		unit = "units/pd2_dlc_bonnie/masks/bonnie/msk_bonnie",
		name_id = "bm_msk_bonnie",
		pcs = {},
		value = 0,
		global_value = "infamous",
		texture_bundle_folder = "character_pack_bonnie"
	}
	self.masks.bonnie_begins = {
		unit = "units/pd2_dlc_bonnie/masks/bonnie_begins/msk_bonnie_begins",
		name_id = "bm_msk_bonnie_begins",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		global_value = "infamous",
		texture_bundle_folder = "character_pack_bonnie"
	}
	self.masks.cthulhu = {
		unit = "units/payday2/masks/msk_cthulhu/msk_cthulhu",
		name_id = "bm_msk_cthulhu",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 8,
		qlvl = 0
	}
	self.masks.grin = {
		unit = "units/payday2/masks/msk_grin/msk_grin",
		name_id = "bm_msk_grin",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 8,
		qlvl = 0
	}
	self.masks.anonymous = {
		unit = "units/payday2/masks/msk_anonymous/msk_anonymous",
		name_id = "bm_msk_anonymous",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 6,
		qlvl = 0
	}
	self.masks.dillinger_death_mask = {
		unit = "units/payday2/masks/msk_dillinger_death_mask/msk_dillinger_death_mask",
		name_id = "bm_msk_dillinger_death_mask",
		pcs = {
			10,
			20,
			30,
			40
		},
		infamous = true,
		value = 9,
		qlvl = 0
	}
	self.masks.alienware = {
		unit = "units/payday2/masks/msk_alienware/msk_alienware",
		name_id = "bm_msk_alienware",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.greek_tragedy = {
		unit = "units/payday2/masks/msk_greek_tragedy/msk_greek_tragedy",
		name_id = "bm_msk_greek_tragedy",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 7,
		qlvl = 0
	}
	self.masks.jaw = {
		unit = "units/payday2/masks/msk_jaw/msk_jaw",
		name_id = "bm_msk_jaw",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4
	}
	self.masks.hockey = {
		unit = "units/payday2/masks/msk_hockey_a/msk_hockey_a_mask",
		name_id = "bm_msk_hockey",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 5
	}
	self.masks.troll = {
		unit = "units/payday2/masks/msk_troll/msk_troll",
		name_id = "bm_msk_troll",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.gagball = {
		unit = "units/payday2/masks/msk_gagball/msk_gagball",
		name_id = "bm_msk_gagball",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4
	}
	self.masks.tounge = {
		unit = "units/payday2/masks/msk_tounge/msk_tounge",
		name_id = "bm_msk_tounge",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 2
	}
	self.masks.zipper = {
		unit = "units/payday2/masks/msk_zipper/msk_zipper",
		name_id = "bm_msk_zipper",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 5
	}
	self.masks.biglips = {
		unit = "units/payday2/masks/msk_biglips/msk_biglips",
		name_id = "bm_msk_biglips",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.clowncry = {
		unit = "units/payday2/masks/msk_clowncry/msk_clowncry",
		name_id = "bm_msk_clowncry",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4
	}
	self.masks.mr_sinister = {
		unit = "units/payday2/masks/msk_mr_sinister/msk_mr_sinister",
		name_id = "bm_msk_mr_sinister",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 5
	}
	self.masks.clown_56 = {
		unit = "units/payday2/masks/msk_clown_56/msk_clown_56",
		name_id = "bm_msk_clown_56",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.dripper = {
		unit = "units/payday2/masks/msk_dripper/msk_dripper",
		name_id = "bm_msk_dripper",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 8,
		qlvl = 0
	}
	self.masks.buha = {
		unit = "units/payday2/masks/msk_buha/msk_buha",
		name_id = "bm_msk_buha",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 5
	}
	self.masks.shogun = {
		unit = "units/payday2/masks/msk_shogun/msk_shogun",
		name_id = "bm_msk_shogun",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 6
	}
	self.masks.oni = {
		unit = "units/payday2/masks/msk_oni/msk_oni",
		name_id = "bm_msk_oni",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4
	}
	self.masks.monkeybiss = {
		unit = "units/payday2/masks/msk_monkeybiss/msk_monkeybiss",
		name_id = "bm_msk_monkeybiss",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 5
	}
	self.masks.babyrhino = {
		unit = "units/payday2/masks/msk_babyrhino/msk_babyrhino",
		name_id = "bm_msk_babyrhino",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.hog = {
		unit = "units/payday2/masks/msk_hog/msk_hog",
		name_id = "bm_msk_hog",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3,
		qlvl = 0
	}
	self.masks.outlandish_a = {
		unit = "units/payday2/masks/msk_outlandish_a/msk_outlandish_a",
		name_id = "bm_msk_outlandish_a",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 2
	}
	self.masks.outlandish_b = {
		unit = "units/payday2/masks/msk_outlandish_b/msk_outlandish_b",
		name_id = "bm_msk_outlandish_b",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.outlandish_c = {
		unit = "units/payday2/masks/msk_outlandish_c/msk_outlandish_c",
		name_id = "bm_msk_outlandish_c",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4
	}
	self.masks.bullet = {
		unit = "units/payday2/masks/msk_bullet/msk_bullet",
		name_id = "bm_msk_bullet",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.shrunken = {
		unit = "units/payday2/masks/msk_shrunken/msk_shrunken",
		name_id = "bm_msk_shrunken",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.brainiack = {
		unit = "units/payday2/masks/msk_brainiack/msk_brainiack",
		name_id = "bm_msk_brainiack",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 6
	}
	self.masks.zombie = {
		unit = "units/payday2/masks/msk_zombie/msk_zombie",
		name_id = "bm_msk_zombie",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.scarecrow = {
		unit = "units/payday2/masks/msk_scarecrow/msk_scarecrow",
		name_id = "bm_msk_scarecrow",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 7,
		qlvl = 0
	}
	self.masks.mummy = {
		unit = "units/payday2/masks/msk_mummy/msk_mummy",
		name_id = "bm_msk_mummy",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.vampire = {
		unit = "units/payday2/masks/msk_vampire/msk_vampire",
		name_id = "bm_msk_vampire",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 2
	}
	self.masks.day_of_the_dead = {
		unit = "units/payday2/masks/msk_day_of_the_dead/msk_day_of_the_dead",
		name_id = "bm_msk_day_of_the_dead",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3,
		qlvl = 0
	}
	self.masks.dawn_of_the_dead = {
		unit = "units/payday2/masks/msk_dawn_of_the_dead/msk_dawn_of_the_dead",
		name_id = "bm_msk_dawn_of_the_dead",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 2
	}
	self.masks.demon = {
		unit = "units/payday2/masks/msk_demon/msk_demon",
		name_id = "bm_msk_demon",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 10,
		qlvl = 0
	}
	self.masks.stonekisses = {
		unit = "units/payday2/masks/msk_stonekisses/msk_stonekisses",
		name_id = "bm_msk_stonekisses",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4
	}
	self.masks.demonictender = {
		unit = "units/payday2/masks/msk_demonictender/msk_demonictender",
		name_id = "bm_msk_demonictender",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.kawaii = {
		unit = "units/payday2/masks/msk_kawaii/msk_kawaii",
		name_id = "bm_msk_kawaii",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.irondoom = {
		unit = "units/payday2/masks/msk_irondoom/msk_irondoom",
		name_id = "bm_msk_irondoom",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.rubber_male = {
		unit = "units/payday2/masks/msk_rubber_male/msk_rubber_male",
		name_id = "bm_msk_rubber_male",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.rubber_female = {
		unit = "units/payday2/masks/msk_rubber_female/msk_rubber_female",
		name_id = "bm_msk_rubber_female",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3
	}
	self.masks.pumpkin_king = {
		unit = "units/payday2/masks/msk_pumpkin_king/msk_pumpkin_king",
		name_id = "bm_msk_pumpkin_king"
	}

	if allow_halloween_lootdrop then
		self.masks.pumpkin_king.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.masks.pumpkin_king.pcs = nil
		self.masks.pumpkin_king.weight = 1000
		self.masks.pumpkin_king.got_item_weight_mod = 0.001
	end

	self.masks.pumpkin_king.global_value = "halloween"
	self.masks.pumpkin_king.value = 0
	self.masks.pumpkin_king.qlvl = 0
	self.masks.pumpkin_king.sort_number = 1
	self.masks.witch = {
		unit = "units/payday2/masks/msk_witch/msk_witch",
		name_id = "bm_msk_witch"
	}

	if allow_halloween_lootdrop then
		self.masks.witch.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.masks.witch.pcs = nil
		self.masks.witch.weight = 1000
		self.masks.witch.got_item_weight_mod = 0.001
	end

	self.masks.witch.global_value = "halloween"
	self.masks.witch.value = 0
	self.masks.witch.qlvl = 0
	self.masks.witch.sort_number = 1
	self.masks.venomorph = {
		unit = "units/payday2/masks/msk_venomorph/msk_venomorph",
		name_id = "bm_msk_venomorph"
	}

	if allow_halloween_lootdrop then
		self.masks.venomorph.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.masks.venomorph.pcs = nil
		self.masks.venomorph.weight = 1000
		self.masks.venomorph.got_item_weight_mod = 0.001
	end

	self.masks.venomorph.global_value = "halloween"
	self.masks.venomorph.value = 0
	self.masks.venomorph.qlvl = 0
	self.masks.venomorph.sort_number = 1
	self.masks.frank = {
		unit = "units/payday2/masks/msk_frank/msk_frank",
		name_id = "bm_msk_frank"
	}

	if allow_halloween_lootdrop then
		self.masks.frank.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.masks.frank.pcs = nil
		self.masks.frank.weight = 1000
		self.masks.frank.got_item_weight_mod = 0.001
	end

	self.masks.frank.global_value = "halloween"
	self.masks.frank.value = 0
	self.masks.frank.qlvl = 0
	self.masks.frank.sort_number = 1
	self.masks.brazil_baby = {
		unit = "units/payday2/masks/msk_brazil_baby/msk_brazil_baby",
		name_id = "bm_msk_brazil_baby",
		global_value = "halloween",
		value = 0,
		qlvl = 0,
		sort_number = 2
	}
	self.masks.baby_angry = {
		unit = "units/payday2/masks/msk_baby_angry/msk_baby_angry",
		name_id = "bm_msk_baby_angry",
		global_value = "halloween",
		value = 0,
		qlvl = 0,
		sort_number = 2
	}
	self.masks.baby_cry = {
		unit = "units/payday2/masks/msk_baby_cry/msk_baby_cry",
		name_id = "bm_msk_baby_cry",
		global_value = "halloween",
		value = 0,
		qlvl = 0,
		sort_number = 2
	}
	self.masks.baby_happy = {
		unit = "units/payday2/masks/msk_baby_happy/msk_baby_happy",
		name_id = "bm_msk_baby_happy",
		global_value = "halloween",
		value = 0,
		qlvl = 0,
		sort_number = 2
	}
	self.masks.krampus = {
		unit = "units/pd2_dlc_pines/masks/krampus/msk_krampus",
		name_id = "bm_msk_krampus",
		pcs = {},
		value = 0,
		sort_number = 1,
		texture_bundle_folder = "pines"
	}
	self.masks.mrs_claus = {
		unit = "units/pd2_dlc_pines/masks/mrs_claus/msk_mrs_claus",
		name_id = "bm_msk_mrs_claus",
		pcs = {},
		value = 0,
		sort_number = 1,
		texture_bundle_folder = "pines"
	}
	self.masks.strinch = {
		unit = "units/pd2_dlc_pines/masks/strinch/msk_the_strinch",
		name_id = "bm_msk_the_strinch",
		pcs = {},
		type = "helmet",
		value = 0,
		sort_number = 1,
		texture_bundle_folder = "pines"
	}
	self.masks.almirs_beard = {
		unit = "units/pd2_dlc_pines/masks/almirs_beard/msk_almirs_beard",
		name_id = "bm_msk_almirs_beard",
		pcs = {},
		type = "beard",
		skip_mask_on_sequence = true,
		value = 0,
		sort_number = 1,
		texture_bundle_folder = "pines"
	}
	self.masks.robo_santa = {
		unit = "units/pd2_dlc_pines/masks/robo_santa/msk_robo_santa",
		name_id = "bm_msk_robo_santa",
		pcs = {},
		value = 0,
		sort_number = 1,
		texture_bundle_folder = "pines"
	}
	self.masks.heat = {
		unit = "units/pd2_dlc1/masks/msk_hockey_b/msk_hockey_b",
		name_id = "bm_msk_heat",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 6,
		dlc = "pd2_clan",
		sort_number = 2
	}
	self.masks.bear = {
		unit = "units/payday2/masks/msk_bear/msk_bear",
		name_id = "bm_msk_bear",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 3,
		qlvl = 0,
		dlc = "pd2_clan",
		sort_number = 1
	}
	self.masks.clinton = {
		unit = "units/pd2_dlc1/masks/msk_clinton/msk_clinton",
		name_id = "bm_msk_clinton",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 6,
		dlc = "armored_transport",
		texture_bundle_folder = "dlc1"
	}
	self.masks.bush = {
		unit = "units/pd2_dlc1/masks/msk_bush/msk_bush",
		name_id = "bm_msk_bush",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 6,
		dlc = "armored_transport",
		texture_bundle_folder = "dlc1"
	}
	self.masks.obama = {
		unit = "units/pd2_dlc1/masks/msk_obama/msk_obama",
		name_id = "bm_msk_obama",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 6,
		dlc = "armored_transport",
		texture_bundle_folder = "dlc1"
	}
	self.masks.nixon = {
		unit = "units/pd2_dlc1/masks/msk_nixon/msk_nixon",
		name_id = "bm_msk_nixon",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 6,
		dlc = "armored_transport",
		texture_bundle_folder = "dlc1"
	}
	self.masks.goat = {
		unit = "units/pd2_dlc_dec5/masks/msk_goat/msk_goat",
		name_id = "bm_msk_goat",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		texture_bundle_folder = "gage_pack",
		dlc = "gage_pack"
	}
	self.masks.panda = {
		unit = "units/pd2_dlc_dec5/masks/msk_panda/msk_panda",
		name_id = "bm_msk_panda",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		texture_bundle_folder = "gage_pack",
		dlc = "gage_pack"
	}
	self.masks.pitbull = {
		unit = "units/pd2_dlc_dec5/masks/msk_pitbull/msk_pitbull",
		name_id = "bm_msk_pitbull",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		texture_bundle_folder = "gage_pack",
		dlc = "gage_pack"
	}
	self.masks.eagle = {
		unit = "units/pd2_dlc_dec5/masks/msk_eagle/msk_eagle",
		name_id = "bm_msk_eagle",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		qlvl = 0,
		texture_bundle_folder = "gage_pack",
		dlc = "gage_pack"
	}
	self.masks.santa_happy = {
		unit = "units/pd2_dlc2/masks/msk_santa_happy/msk_santa_happy",
		name_id = "bm_msk_santa_happy",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		dlc = "pd2_clan",
		sort_number = 3
	}
	self.masks.santa_mad = {
		unit = "units/pd2_dlc_xmas/masks/msk_santa_mad/msk_santa_mad",
		name_id = "bm_msk_santa_mad",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		dlc = "xmas_soundtrack"
	}
	self.masks.santa_drunk = {
		unit = "units/pd2_dlc_xmas/masks/msk_santa_drunk/msk_santa_drunk",
		name_id = "bm_msk_santa_drunk",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		dlc = "xmas_soundtrack"
	}
	self.masks.santa_surprise = {
		unit = "units/pd2_dlc_xmas/masks/msk_santa_suprise/msk_santa_suprise",
		name_id = "bm_msk_santa_surprise",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		dlc = "xmas_soundtrack"
	}
	self.masks.aviator = {
		unit = "units/pd2_dlc_infamy/masks/msk_aviator/msk_aviator",
		name_id = "bm_msk_aviator",
		pcs = {},
		value = 0,
		type = "glasses",
		skip_mask_on_sequence = true,
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		infamy_lock = "infamy_root"
	}
	self.masks.ghost = {
		unit = "units/pd2_dlc_infamy/masks/msk_ghost/msk_ghost",
		name_id = "bm_msk_ghost",
		pcs = {},
		value = 0,
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		type = "helmet",
		infamy_lock = "infamy_ghost"
	}
	self.masks.welder = {
		unit = "units/pd2_dlc_infamy/masks/msk_welder/msk_welder",
		name_id = "bm_msk_welder",
		pcs = {},
		value = 0,
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		infamy_lock = "infamy_enforcer"
	}
	self.masks.plague = {
		unit = "units/pd2_dlc_infamy/masks/msk_plague/msk_plague",
		name_id = "bm_msk_plague",
		pcs = {},
		value = 0,
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		infamy_lock = "infamy_mastermind"
	}
	self.masks.smoker = {
		unit = "units/pd2_dlc_infamy/masks/msk_smoker/msk_smoker",
		name_id = "bm_msk_smoker",
		pcs = {},
		value = 0,
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		infamy_lock = "infamy_technician"
	}
	self.masks.cloth_commander = {
		unit = "units/pd2_dlc_gage_lmg/masks/cloth_commander/msk_cloth_commander",
		name_id = "bm_msk_cloth_commander",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		qlvl = 0,
		dlc = "gage_pack_lmg",
		texture_bundle_folder = "gage_pack_lmg"
	}
	self.masks.gage_blade = {
		unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_blade/msk_gage_blade",
		name_id = "bm_msk_gage_blade",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		qlvl = 0,
		texture_bundle_folder = "gage_pack_lmg",
		dlc = "gage_pack_lmg"
	}
	self.masks.gage_rambo = {
		unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_rambo/msk_gage_rambo",
		name_id = "bm_msk_rambo",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		qlvl = 0,
		texture_bundle_folder = "gage_pack_lmg",
		dlc = "gage_pack_lmg"
	}
	self.masks.gage_deltaforce = {
		unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_deltaforce/msk_gage_deltaforce",
		name_id = "bm_msk_deltaforce",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 4,
		qlvl = 0,
		texture_bundle_folder = "gage_pack_lmg",
		dlc = "gage_pack_lmg"
	}
	self.masks.robberfly = {
		unit = "units/pd2_dlc_gage_snp/masks/msk_robberfly/msk_robberfly",
		name_id = "bm_msk_robberfly",
		pcs = {},
		value = 0,
		qlvl = 0,
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp"
	}
	self.masks.spider = {
		unit = "units/pd2_dlc_gage_snp/masks/msk_spider/msk_spider",
		name_id = "bm_msk_spider",
		pcs = {},
		value = 0,
		qlvl = 0,
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp"
	}
	self.masks.mantis = {
		unit = "units/pd2_dlc_gage_snp/masks/msk_mantis/msk_mantis",
		name_id = "bm_msk_mantis",
		pcs = {},
		value = 0,
		qlvl = 0,
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp"
	}
	self.masks.wasp = {
		unit = "units/pd2_dlc_gage_snp/masks/msk_wasp/msk_wasp",
		name_id = "bm_msk_wasp",
		pcs = {},
		value = 0,
		qlvl = 0,
		texture_bundle_folder = "gage_pack_snp",
		dlc = "gage_pack_snp"
	}
	self.masks.skullhard = {
		unit = "units/payday2/masks/msk_skullhard/msk_skullhard",
		name_id = "bm_msk_skullhard",
		pcs = {},
		value = 0,
		qlvl = 0,
		infamous = true,
		sort_number = 30
	}
	self.masks.skullveryhard = {
		unit = "units/payday2/masks/msk_skullveryhard/msk_skullveryhard",
		name_id = "bm_msk_skullveryhard",
		pcs = {},
		value = 0,
		qlvl = 0,
		infamous = true,
		sort_number = 31
	}
	self.masks.skulloverkill = {
		unit = "units/payday2/masks/msk_skulloverkill/msk_skulloverkill",
		name_id = "bm_msk_skulloverkill",
		pcs = {},
		value = 0,
		qlvl = 0,
		infamous = true,
		sort_number = 32
	}
	self.masks.gitgud_e_wish = {
		unit = "units/pd2_dlc_gitgud/masks/e_wish/msk_gitgud_e_wish",
		name_id = "bm_e_wish",
		pcs = {},
		value = 0,
		qlvl = 0,
		infamous = true,
		texture_bundle_folder = "gitgud",
		sort_number = 33
	}
	self.masks.skulloverkillplus = {
		unit = "units/payday2/masks/msk_skulloverkillplus/msk_skulloverkillplus",
		name_id = "bm_msk_skulloverkillplus",
		pcs = {},
		value = 0,
		qlvl = 0,
		infamous = true,
		sort_number = 34
	}
	self.masks.gitgud_sm_wish = {
		unit = "units/pd2_dlc_gitgud/masks/sm_wish/msk_gitgud_sm_wish",
		name_id = "bm_sm_wish",
		pcs = {},
		value = 0,
		qlvl = 0,
		infamous = true,
		texture_bundle_folder = "gitgud",
		sort_number = 35
	}
	self.masks.metalhead = {
		unit = "units/pd2_poetry_winners/masks/veggie/msk_metalhead",
		name_id = "bm_msk_metalhead",
		pcs = {},
		value = 0,
		dlc = "poetry_soundtrack",
		global_value = "poetry_soundtrack"
	}
	self.masks.tcn = {
		unit = "units/pd2_poetry_winners/masks/tcn/msk_tcn",
		name_id = "bm_msk_tcn",
		pcs = {},
		value = 0,
		dlc = "poetry_soundtrack",
		global_value = "poetry_soundtrack"
	}
	self.masks.surprise = {
		unit = "units/pd2_poetry_winners/masks/shaegro/msk_surprise",
		name_id = "bm_msk_surprise",
		pcs = {},
		value = 0,
		dlc = "poetry_soundtrack",
		global_value = "poetry_soundtrack"
	}
	self.masks.optimist_prime = {
		unit = "units/pd2_poetry_winners/masks/optimist_prime/msk_optimist_prime",
		name_id = "bm_msk_optimist_prime",
		pcs = {},
		value = 0,
		dlc = "poetry_soundtrack",
		global_value = "poetry_soundtrack"
	}
	self.masks.samurai = {
		unit = "units/payday2/masks/msk_samurai/msk_samurai",
		name_id = "bm_msk_samurai",
		pcs = {},
		value = 0,
		qlvl = 0,
		infamous = true
	}
	self.masks.unicorn = {
		unit = "units/payday2/masks/msk_unicorn/msk_unicorn",
		name_id = "bm_msk_unicorn",
		pcs = {},
		value = 0,
		dlc = "pd2_clan",
		sort_number = 4
	}
	self.masks.franklin = {
		unit = "units/pd2_dlc_big/masks/msk_franklin/msk_franklin",
		name_id = "bm_msk_franklin",
		pcs = {},
		value = 0,
		qlvl = 0,
		dlc = "big_bank",
		texture_bundle_folder = "big_bank"
	}
	self.masks.lincoln = {
		unit = "units/pd2_dlc_big/masks/msk_lincoln/msk_lincoln",
		name_id = "bm_msk_lincoln",
		pcs = {},
		value = 0,
		qlvl = 0,
		dlc = "big_bank",
		texture_bundle_folder = "big_bank"
	}
	self.masks.grant = {
		unit = "units/pd2_dlc_big/masks/msk_grant/msk_grant",
		name_id = "bm_msk_grant",
		pcs = {},
		value = 0,
		qlvl = 0,
		dlc = "big_bank",
		texture_bundle_folder = "big_bank"
	}
	self.masks.washington = {
		unit = "units/pd2_dlc_big/masks/msk_washington/msk_washington",
		name_id = "bm_msk_washington",
		pcs = {},
		value = 0,
		qlvl = 0,
		dlc = "big_bank",
		texture_bundle_folder = "big_bank"
	}
	self.masks.silverback = {
		unit = "units/pd2_dlc_gage_shot/masks/silverback/msk_silverback",
		name_id = "bm_msk_silverback",
		pcs = {},
		value = 0,
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun"
	}
	self.masks.mandril = {
		unit = "units/pd2_dlc_gage_shot/masks/mandrill/msk_mandril",
		name_id = "bm_msk_mandril",
		pcs = {},
		value = 0,
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun"
	}
	self.masks.skullmonkey = {
		unit = "units/pd2_dlc_gage_shot/masks/skullmonkey/msk_skullmonkey",
		name_id = "bm_msk_skullmonkey",
		pcs = {},
		value = 0,
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun"
	}
	self.masks.orangutang = {
		unit = "units/pd2_dlc_gage_shot/masks/orangutang/msk_orangutang",
		name_id = "bm_msk_orangutang",
		pcs = {},
		value = 0,
		dlc = "gage_pack_shotgun",
		texture_bundle_folder = "gage_pack_shotgun"
	}
	self.masks.galax = {
		unit = "units/pd2_dlc_gage_assault/masks/msk_galax/msk_galax",
		name_id = "bm_msk_galax",
		pcs = {},
		value = 0,
		dlc = "gage_pack_assault",
		texture_bundle_folder = "gage_pack_assault"
	}
	self.masks.crowgoblin = {
		unit = "units/pd2_dlc_gage_assault/masks/msk_crowgoblin/msk_crowgoblin",
		name_id = "bm_msk_crowgoblin",
		pcs = {},
		value = 0,
		dlc = "gage_pack_assault",
		texture_bundle_folder = "gage_pack_assault"
	}
	self.masks.evil = {
		unit = "units/pd2_dlc_gage_assault/masks/msk_evil/msk_evil",
		name_id = "bm_msk_evil",
		pcs = {},
		value = 0,
		dlc = "gage_pack_assault",
		texture_bundle_folder = "gage_pack_assault"
	}
	self.masks.volt = {
		unit = "units/pd2_dlc_gage_assault/masks/msk_volt/msk_volt",
		name_id = "bm_msk_volt",
		pcs = {},
		value = 0,
		dlc = "gage_pack_assault",
		texture_bundle_folder = "gage_pack_assault"
	}
	self.masks.white_wolf = {
		unit = "units/pd2_dlc_miami/masks/msk_white_wolf/msk_white_wolf",
		name_id = "bm_msk_white_wolf",
		pcs = {},
		value = 0,
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami"
	}
	self.masks.owl = {
		unit = "units/pd2_dlc_miami/masks/msk_owl/msk_owl",
		name_id = "bm_msk_owl",
		pcs = {},
		value = 0,
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami"
	}
	self.masks.rabbit = {
		unit = "units/pd2_dlc_miami/masks/msk_rabbit/msk_rabbit",
		name_id = "bm_msk_rabbit",
		pcs = {},
		value = 0,
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami"
	}
	self.masks.pig = {
		unit = "units/pd2_dlc_miami/masks/msk_pig/msk_pig",
		name_id = "bm_msk_pig",
		pcs = {},
		value = 0,
		dlc = "hl_miami",
		texture_bundle_folder = "hl_miami"
	}
	self.masks.panther = {
		unit = "units/pd2_dlc_miami/masks/msk_panther/msk_panther",
		name_id = "bm_msk_panther",
		pcs = {},
		value = 0,
		dlc = "hlm_game",
		texture_bundle_folder = "hl_miami"
	}
	self.masks.rooster = {
		unit = "units/pd2_dlc_miami/masks/msk_rooster/msk_rooster",
		name_id = "bm_msk_rooster",
		pcs = {},
		value = 0,
		dlc = "hlm_game",
		texture_bundle_folder = "hl_miami"
	}
	self.masks.horse = {
		unit = "units/pd2_dlc_miami/masks/msk_horse/msk_horse",
		name_id = "bm_msk_horse",
		pcs = {},
		value = 0,
		dlc = "hlm_game",
		texture_bundle_folder = "hl_miami"
	}
	self.masks.tiger = {
		unit = "units/pd2_dlc_miami/masks/msk_tiger/msk_tiger",
		name_id = "bm_msk_tiger",
		pcs = {},
		value = 0,
		dlc = "hlm_game",
		texture_bundle_folder = "hl_miami"
	}
	self.masks.combusto = {
		unit = "units/pd2_crimefest_2014/oct19/masks/combusto/msk_combusto",
		name_id = "bm_msk_combusto",
		pcs = {},
		dlc = "pd2_clan",
		value = 0,
		sort_number = 5
	}
	self.masks.spackle = {
		unit = "units/pd2_crimefest_2014/oct19/masks/spackle/msk_spackle",
		name_id = "bm_msk_spackle",
		pcs = {},
		dlc = "pd2_clan",
		value = 0,
		sort_number = 5
	}
	self.masks.jw_shades = {
		unit = "units/pd2_crimefest_2014/oct22/masks/jw_shades/msk_jw_shades",
		name_id = "bm_msk_jw_shades",
		pcs = {},
		value = 0,
		type = "glasses",
		skip_mask_on_sequence = true,
		global_value = "infamous"
	}
	self.masks.stoneface = {
		unit = "units/pd2_crimefest_2014/oct22/masks/stoneface/msk_stoneface",
		name_id = "bm_msk_stoneface",
		pcs = {},
		value = 0,
		dlc = "pd2_clan",
		type = "glasses",
		skip_mask_on_sequence = true,
		sort_number = 7
	}
	self.masks.wayfarer = {
		unit = "units/pd2_crimefest_2014/oct22/masks/wayfarer/msk_wayfarer",
		name_id = "bm_msk_wayfarer",
		pcs = {},
		value = 0,
		dlc = "pd2_clan",
		type = "glasses",
		skip_mask_on_sequence = true,
		sort_number = 7
	}
	self.masks.smiley = {
		unit = "units/pd2_crimefest_2014/oct23/masks/smiley/msk_smiley",
		name_id = "bm_msk_smiley",
		pcs = {},
		dlc = "pd2_clan",
		value = 0,
		sort_number = 6
	}
	self.masks.gumbo = {
		unit = "units/pd2_crimefest_2014/oct23/masks/gumbo/msk_gumbo",
		name_id = "bm_msk_gumbo",
		pcs = {},
		dlc = "pd2_clan",
		value = 0,
		sort_number = 6
	}
	self.masks.crazy_lion = {
		unit = "units/pd2_crimefest_2014/oct26/masks/msk_crazy_lion/crazy_lion_mask",
		name_id = "bm_msk_crazy_lion",
		pcs = {},
		dlc = "pd2_clan",
		value = 0,
		sort_number = 8
	}
	self.masks.churchill = {
		unit = "units/pd2_dlc_gage_historical/masks/churchill/msk_churchill",
		name_id = "bm_msk_churchill",
		pcs = {},
		value = 0,
		dlc = "gage_pack_historical",
		texture_bundle_folder = "gage_pack_historical"
	}
	self.masks.red_hurricane = {
		unit = "units/pd2_dlc_gage_historical/masks/red_hurricane/msk_red_hurricane",
		name_id = "bm_msk_red_hurricane",
		pcs = {},
		value = 0,
		dlc = "gage_pack_historical",
		texture_bundle_folder = "gage_pack_historical"
	}
	self.masks.patton = {
		unit = "units/pd2_dlc_gage_historical/masks/patton/msk_patton",
		name_id = "bm_msk_patton",
		pcs = {},
		value = 0,
		dlc = "gage_pack_historical",
		texture_bundle_folder = "gage_pack_historical"
	}
	self.masks.de_gaulle = {
		unit = "units/pd2_dlc_gage_historical/masks/de_gaulle/msk_de_gaulle",
		name_id = "bm_msk_de_gaulle",
		pcs = {},
		value = 0,
		dlc = "gage_pack_historical",
		texture_bundle_folder = "gage_pack_historical"
	}
	self.masks.msk_grizel = {
		unit = "units/pd2_dlc_clover/masks/msk_grizel/msk_grizel",
		name_id = "bm_msk_msk_grizel",
		pcs = {},
		value = 0,
		dlc = "character_pack_clover",
		texture_bundle_folder = "character_pack_clover"
	}
	self.masks.grizel_clean = {
		unit = "units/pd2_dlc_clover/masks/msk_clover_begins/msk_clover_begins",
		name_id = "bm_msk_grizel_clean",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		dlc = "character_pack_clover",
		texture_bundle_folder = "character_pack_clover"
	}
	self.masks.medusa = {
		unit = "units/pd2_indiana/masks/medusa/msk_medusa",
		name_id = "bm_msk_medusa",
		pcs = {},
		value = 0,
		dlc = "hope_diamond",
		texture_bundle_folder = "character_pack_clover"
	}
	self.masks.anubis = {
		unit = "units/pd2_indiana/masks/anubis/msk_anubis",
		name_id = "bm_msk_anubis",
		type = "helmet",
		pcs = {},
		value = 0,
		dlc = "hope_diamond",
		texture_bundle_folder = "character_pack_clover"
	}
	self.masks.pazuzu = {
		unit = "units/pd2_indiana/masks/pazuzu/msk_pazuzu",
		name_id = "bm_msk_pazuzu",
		pcs = {},
		value = 0,
		dlc = "hope_diamond",
		texture_bundle_folder = "character_pack_clover"
	}
	self.masks.cursed_crown = {
		unit = "units/pd2_indiana/masks/msk_cursed_crown/msk_cursed_crown",
		name_id = "bm_msk_cursed_crown",
		pcs = {},
		value = 0,
		dlc = "hope_diamond",
		texture_bundle_folder = "character_pack_clover"
	}
	self.masks.butcher = {
		unit = "units/pd2_dlc_dragan/masks/butcher/msk_butcher",
		name_id = "bm_msk_butcher",
		pcs = {},
		value = 0,
		dlc = "the_bomb",
		texture_bundle_folder = "the_bomb"
	}
	self.masks.doctor = {
		unit = "units/pd2_dlc_cro/masks/msk_doctor/msk_doctor",
		name_id = "bm_msk_doctor",
		pcs = {},
		value = 0,
		dlc = "the_bomb",
		type = "helmet",
		texture_bundle_folder = "the_bomb",
		skip_mask_on_sequence = true
	}
	self.masks.tech_lion = {
		unit = "units/pd2_dlc_cro/masks/msk_tech_lion/msk_tech_lion",
		name_id = "bm_msk_tech_lion",
		pcs = {},
		value = 0,
		dlc = "the_bomb",
		texture_bundle_folder = "the_bomb"
	}
	self.masks.lady_butcher = {
		unit = "units/pd2_dlc_cro/masks/msk_butcher/msk_butcher",
		name_id = "bm_msk_lady_butcher",
		pcs = {},
		value = 0,
		dlc = "the_bomb",
		texture_bundle_folder = "the_bomb"
	}
	self.masks.nun_town = {
		unit = "units/pd2_dlc_goty/masks/nun_town/msk_nun_town",
		name_id = "bm_msk_nun_town",
		pcs = {},
		value = 0,
		dlc = "goty_heist_bundle_2014",
		dlc_list = {
			"armored_transport",
			"big_bank",
			"hl_miami",
			"hope_diamond"
		},
		texture_bundle_folder = "pd2_goty"
	}
	self.masks.robo_arnold = {
		unit = "units/pd2_dlc_goty/masks/robo_arnold/msk_robo_arnold",
		name_id = "bm_msk_robo_arnold",
		pcs = {},
		value = 0,
		dlc = "goty_weapon_bundle_2014",
		dlc_list = {
			"gage_pack",
			"gage_pack_lmg",
			"gage_pack_jobs",
			"gage_pack_snp",
			"gage_pack_shotgun",
			"gage_pack_assault",
			"gage_pack_historical"
		},
		texture_bundle_folder = "pd2_goty"
	}
	self.masks.arch_nemesis = {
		unit = "units/pd2_dlc_goty/masks/arch_nemesis/msk_arch_nemesis",
		name_id = "bm_msk_arch_nemesis",
		pcs = {},
		value = 0,
		type = "helmet",
		default_blueprint = {
			materials = "deep_bronze",
			textures = "no_color_full_material"
		},
		dlc = "goty_dlc_bundle_2014",
		dlc_list = {
			"character_pack_clover",
			"armored_transport",
			"big_bank",
			"hl_miami",
			"hope_diamond",
			"gage_pack",
			"gage_pack_lmg",
			"gage_pack_jobs",
			"gage_pack_snp",
			"gage_pack_shotgun",
			"gage_pack_assault",
			"gage_pack_historical"
		},
		texture_bundle_folder = "pd2_goty"
	}
	self.masks.carnotaurus = {
		unit = "units/pd2_dlc_akm4_modpack/masks/carnotaurus/msk_carnotaurus",
		name_id = "bm_msk_carnotaurus",
		pcs = {},
		value = 0,
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack"
	}
	self.masks.triceratops = {
		unit = "units/pd2_dlc_akm4_modpack/masks/triceratops/msk_triceratops",
		name_id = "bm_msk_triceratops",
		pcs = {},
		value = 0,
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack"
	}
	self.masks.pachy = {
		unit = "units/pd2_dlc_akm4_modpack/masks/pachy/msk_pachy",
		name_id = "bm_msk_pachy",
		pcs = {},
		value = 0,
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack"
	}
	self.masks.velociraptor = {
		unit = "units/pd2_dlc_akm4_modpack/masks/velociraptor/msk_velociraptor",
		name_id = "bm_msk_velociraptor",
		pcs = {},
		value = 0,
		texture_bundle_folder = "dlc_akm4",
		dlc = "akm4_pack"
	}
	self.masks.champion_dallas = {
		unit = "units/pd2_hw_boxing/masks/champion_dallas/msk_champion_dallas",
		name_id = "bm_msk_champion_dallas",
		pcs = {},
		value = 0,
		dlc = nil,
		texture_bundle_folder = "pd2_hw_boxing",
		sort_number = 10
	}

	if SystemInfo:distribution() == Idstring("STEAM") then
		self.masks.area51 = {
			unit = "units/pd2_dlc_alienware/masks/area51/msk_area51",
			name_id = "bm_msk_area51",
			texture_bundle_folder = "alienware_alpha",
			pcs = {},
			value = 0,
			dlc = "alienware_alpha",
			type = "helmet",
			sort_number = 5
		}
		self.masks.alien_helmet = {
			unit = "units/pd2_dlc_alienware/masks/alien_helmet/msk_alien_helmet",
			name_id = "bm_msk_alien_helmet",
			texture_bundle_folder = "alienware_alpha",
			pcs = {},
			value = 0,
			dlc = "alienware_alpha",
			type = "helmet",
			default_blueprint = {
				materials = "gunmetal",
				textures = "no_color_full_material"
			},
			sort_number = 5
		}
	end

	self.masks.infamy_lurker = {
		unit = "units/pd2_dlc_infamy/masks/msk_infamy_lurker/msk_infamy_lurker",
		name_id = "bm_msk_infamy_lurker",
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		pcs = {},
		value = 0,
		infamy_lock = "infamy_maskpack_lurker"
	}
	self.masks.infamy_hood = {
		unit = "units/pd2_dlc_infamy/masks/msk_infamy_hood/msk_infamy_hood",
		name_id = "bm_msk_infamy_hood",
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		pcs = {},
		value = 0,
		type = "helmet",
		infamy_lock = "infamy_maskpack_hood"
	}
	self.masks.ranger = {
		unit = "units/pd2_dlc_infamy/masks/ranger/msk_ranger",
		name_id = "bm_msk_ranger",
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		pcs = {},
		value = 0,
		type = "helmet",
		infamy_lock = "infamy_maskpack_ranger"
	}
	self.masks.punk = {
		unit = "units/pd2_dlc_infamy/masks/punk/msk_punk",
		name_id = "bm_msk_punk",
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		pcs = {},
		value = 0,
		infamy_lock = "infamy_maskpack_punk"
	}
	self.masks.daft = {
		unit = "units/pd2_dlc_infamy/masks/daft/msk_daft",
		name_id = "bm_msk_daft",
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		pcs = {},
		value = 0,
		infamy_lock = "infamy_maskpack_daft"
	}
	self.masks.pain = {
		unit = "units/pd2_dlc_infamy/masks/pain/msk_pain",
		name_id = "bm_msk_pain",
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		pcs = {},
		value = 0,
		type = "helmet",
		skip_mask_on_sequence = true,
		infamy_lock = "infamy_maskpack_pain"
	}
	self.masks.destroyer = {
		unit = "units/pd2_dlc_infamy/masks/destroyer/msk_destroyer",
		name_id = "bm_msk_destroyer",
		global_value = "infamy",
		texture_bundle_folder = "infamous",
		pcs = {},
		value = 0,
		infamy_lock = "infamy_maskpack_destroyer"
	}
	self.masks.balaclava_chains = {
		unit = "units/pd2_dlc_infamy/masks/msk_balaclava_chains/msk_balaclava_chains",
		name_id = "bm_msk_cheat_error",
		type = "helmet",
		inaccessible = true
	}
	self.masks.balaclava_wolf = {
		unit = "units/pd2_dlc_infamy/masks/msk_balaclava_wolf/msk_balaclava_wolf",
		name_id = "bm_msk_cheat_error",
		type = "helmet",
		inaccessible = true
	}
	self.masks.balaclava_clover = {
		unit = "units/pd2_dlc_infamy/masks/msk_balaclava_clover/msk_balaclava_clover",
		name_id = "bm_msk_cheat_error",
		type = "helmet",
		inaccessible = true
	}
	self.masks.balaclava_dallas = {
		unit = "units/pd2_dlc_infamy/masks/msk_balaclava_dallas/msk_balaclava_dallas",
		name_id = "bm_msk_cheat_error",
		type = "helmet",
		inaccessible = true
	}
	self.masks.balaclava_dragan = {
		unit = "units/pd2_dlc_infamy/masks/msk_balaclava_dragan/msk_balaclava_dragan",
		name_id = "bm_msk_cheat_error",
		type = "helmet",
		inaccessible = true
	}
	self.masks.balaclava_hoxton = {
		unit = "units/pd2_dlc_infamy/masks/msk_balaclava_hoxton/msk_balaclava_hoxton",
		name_id = "bm_msk_cheat_error",
		type = "helmet",
		inaccessible = true
	}
	self.masks.balaclava_john_wick = {
		unit = "units/pd2_dlc_infamy/masks/msk_balaclava_john_wick/msk_balaclava_john_wick",
		name_id = "bm_msk_cheat_error",
		type = "helmet",
		inaccessible = true
	}
	self.masks.balaclava_sokol = {
		unit = "units/pd2_dlc_character_sokol/masks/msk_balaclava_sokol/msk_balaclava_sokol",
		name_id = "bm_msk_cheat_error",
		type = "helmet",
		inaccessible = true
	}
	self.masks.balaclava_wild = {
		unit = "units/pd2_dlc_wild/masks/msk_balaclava_wild/msk_balaclava_wild",
		name_id = "bm_msk_cheat_error",
		type = "helmet",
		inaccessible = true
	}
	self.masks.balaclava = {
		name_id = "bm_msk_balaclava",
		global_value = "infamy",
		value = 0,
		pcs = {},
		type = "helmet",
		texture_bundle_folder = "infamous",
		infamy_lock = "infamy_maskpack_balaclava",
		characters = {
			dragan = "balaclava_dragan",
			hoxton = "balaclava_dragan",
			jowi = "balaclava_john_wick",
			bodhi = "balaclava_dallas",
			dragon = "balaclava_dallas",
			wolf = "balaclava_wolf",
			bonnie = "balaclava_dallas",
			sokol = "balaclava_sokol",
			old_hoxton = "balaclava_hoxton",
			female_1 = "balaclava_clover",
			jimmy = "balaclava_dallas",
			chains = "balaclava_chains",
			sydney = "balaclava_sokol",
			wild = "balaclava_wild",
			dallas = "balaclava_dallas",
			jacket = "balaclava_wolf"
		}
	}
	self.masks.the_overkill_mask = {
		unit = "units/pd2_dlc_overkill_pack/masks/msk_the_overkill_mask/msk_the_overkill_mask",
		name_id = "bm_msk_the_overkill_mask",
		pcs = {},
		value = 0,
		dlc = "overkill_pack",
		texture_bundle_folder = "dlc_pack_overkill",
		type = "glasses",
		offsets = {
			joy = {
				Vector3(0, 3.05867, -0.160978),
				Rotation(-0, -0, -0)
			}
		}
	}
	self.masks.jake = {
		unit = "units/pd2_dlc_hotline2/masks/jake/msk_jake",
		name_id = "bm_msk_jake",
		pcs = {},
		texture_bundle_folder = "hlm2",
		dlc = "hlm2",
		value = 0
	}
	self.masks.richter = {
		unit = "units/pd2_dlc_hotline2/masks/richter/msk_richter",
		name_id = "bm_msk_richter",
		pcs = {},
		texture_bundle_folder = "hlm2",
		dlc = "hlm2",
		value = 0
	}
	self.masks.biker = {
		unit = "units/pd2_dlc_hotline2/masks/biker/msk_biker",
		name_id = "bm_msk_biker",
		pcs = {},
		texture_bundle_folder = "hlm2",
		dlc = "hlm2",
		value = 0,
		type = "helmet"
	}
	self.masks.alex = {
		unit = "units/pd2_dlc_hotline2/masks/alex/msk_alex",
		name_id = "bm_msk_alex",
		pcs = {},
		texture_bundle_folder = "hlm2",
		dlc = "hlm2",
		value = 0
	}
	self.masks.corey = {
		unit = "units/pd2_dlc_hotline2/masks/corey/msk_corey",
		name_id = "bm_msk_corey",
		pcs = {},
		texture_bundle_folder = "hlm2",
		dlc = "hlm2",
		value = 0
	}
	self.masks.tonys_revenge = {
		unit = "units/pd2_dlc_hotline2/masks/tonys_revenge/msk_tonys_revenge",
		name_id = "bm_msk_tonys_revenge",
		pcs = {},
		texture_bundle_folder = "hlm2",
		dlc = "hlm2",
		value = 0
	}
	self.masks.richard_returns = {
		unit = "units/pd2_dlc_hotline2/masks/richard_returns/msk_richard_returns",
		name_id = "bm_msk_richard_returns",
		pcs = {},
		texture_bundle_folder = "hlm2",
		dlc = "hlm2_deluxe",
		value = 0,
		type = "helmet"
	}
	self.masks.richard_begins = {
		unit = "units/pd2_dlc_hotline2/masks/richard_begins/msk_richard_begins",
		name_id = "bm_msk_richard_begins",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture_bundle_folder = "hlm2",
		dlc = "hlm2_deluxe",
		value = 0,
		type = "helmet"
	}
	self.masks.simpson = {
		unit = "units/pd2_dlc_cage/masks/simpson/msk_simpson",
		name_id = "bm_msk_simpson",
		pcs = {},
		type = "helmet",
		value = 0
	}
	self.masks.hothead = {
		unit = "units/pd2_speedrunners/masks/hothead/msk_hothead",
		name_id = "bm_msk_hothead",
		pcs = {},
		texture_bundle_folder = "speedrunners",
		dlc = "speedrunners",
		value = 0
	}
	self.masks.falcon = {
		unit = "units/pd2_speedrunners/masks/falcon/msk_falcon",
		name_id = "bm_msk_falcon",
		pcs = {},
		type = "helmet",
		texture_bundle_folder = "speedrunners",
		dlc = "speedrunners",
		value = 0
	}
	self.masks.unic = {
		unit = "units/pd2_speedrunners/masks/unic/msk_unic",
		name_id = "bm_msk_unic",
		pcs = {},
		type = "helmet",
		texture_bundle_folder = "speedrunners",
		dlc = "speedrunners",
		value = 0
	}
	self.masks.speedrunner = {
		unit = "units/pd2_speedrunners/masks/speedrunner/msk_speedrunner",
		name_id = "bm_msk_speedrunner",
		pcs = {},
		type = "helmet",
		texture_bundle_folder = "speedrunners",
		dlc = "speedrunners",
		value = 0
	}
	self.masks.hectors_helmet = {
		unit = "units/pd2_mcmansion/masks/msk_hectors_helmet/msk_hectors_helmet",
		name_id = "bm_msk_hectors_helmet",
		type = "helmet",
		infamous = true,
		pcs = {},
		value = 0,
		texture_bundle_folder = "hoxton_revenge"
	}
	self.masks.old_hoxton_begins = {
		unit = "units/pd2_mcmansion/masks/old_hoxton_begins/msk_old_hoxton_begins",
		name_id = "bm_msk_old_hoxton_begins",
		pcs = {
			10,
			20,
			30,
			40
		},
		global_value = "infamous",
		value = 0,
		texture_bundle_folder = "hoxton_revenge"
	}
	self.masks.firedemon = {
		unit = "units/pd2_dlc_bbq/masks/msk_firedemon/msk_firedemon",
		name_id = "bm_msk_firedemon",
		pcs = {},
		value = 0,
		dlc = "bbq",
		texture_bundle_folder = "bbq"
	}
	self.masks.gasmask = {
		unit = "units/pd2_dlc_bbq/masks/msk_gasmask/msk_gasmask",
		name_id = "bm_msk_gasmask",
		pcs = {},
		value = 0,
		dlc = "bbq",
		texture_bundle_folder = "bbq"
	}
	self.masks.firemask = {
		unit = "units/pd2_dlc_bbq/masks/msk_firemask/msk_firemask",
		name_id = "bm_msk_firemask",
		pcs = {},
		value = 0,
		dlc = "bbq",
		texture_bundle_folder = "bbq"
	}
	self.masks.chef_hat = {
		unit = "units/pd2_dlc_bbq/masks/msk_chef_hat/msk_chef_hat",
		name_id = "bm_msk_chef_hat",
		pcs = {},
		value = 0,
		dlc = "bbq",
		texture_bundle_folder = "bbq",
		type = "helmet"
	}
	self.masks.bandit = {
		unit = "units/pd2_dlc_west/masks/msk_bandit/msk_bandit",
		name_id = "bm_msk_bandit",
		pcs = {},
		dlc = "west",
		texture_bundle_folder = "west",
		value = 0,
		type = "helmet"
	}
	self.masks.bullskull = {
		unit = "units/pd2_dlc_west/masks/msk_bullskull/msk_bullskull",
		name_id = "bm_msk_bullskull",
		pcs = {},
		dlc = "west",
		texture_bundle_folder = "west",
		value = 0
	}
	self.masks.kangee = {
		unit = "units/pd2_dlc_west/masks/msk_kangee/msk_kangee",
		name_id = "bm_msk_kangee",
		pcs = {},
		dlc = "west",
		texture_bundle_folder = "west",
		value = 0
	}
	self.masks.lone = {
		unit = "units/pd2_dlc_west/masks/msk_lone/msk_lone",
		name_id = "bm_msk_lone",
		pcs = {},
		dlc = "west",
		texture_bundle_folder = "west",
		value = 0,
		type = "helmet",
		skip_mask_on_sequence = true
	}
	self.masks.grendel = {
		unit = "units/pd2_dlc_shoutout_raid/masks/grendel/msk_grendel",
		name_id = "bm_msk_grendel",
		pcs = {},
		value = 0,
		global_value = "infamous"
	}
	self.masks.concert_male = {
		unit = "units/pd2_dlc_arena/masks/concert_male/msk_concert_male",
		name_id = "bm_msk_concert_male",
		pcs = {},
		value = 0,
		dlc = "arena",
		texture_bundle_folder = "dlc_arena"
	}
	self.masks.concert_female = {
		unit = "units/pd2_dlc_arena/masks/concert_female/msk_concert_female",
		name_id = "bm_msk_concert_female",
		pcs = {},
		value = 0,
		dlc = "arena",
		texture_bundle_folder = "dlc_arena"
	}
	self.masks.boombox = {
		unit = "units/pd2_dlc_arena/masks/boombox/msk_boombox",
		name_id = "bm_msk_boombox",
		pcs = {},
		value = 0,
		dlc = "arena",
		texture_bundle_folder = "dlc_arena"
	}
	self.masks.cantus = {
		unit = "units/pd2_dlc_arena/masks/cantus/msk_cantus",
		name_id = "bm_msk_cantus",
		pcs = {},
		value = 0,
		dlc = "arena",
		texture_bundle_folder = "dlc_arena"
	}
	self.masks.card_jack = {
		unit = "units/pd2_dlc_playingcards/masks/msk_card_jack/msk_card_jack",
		name_id = "bm_msk_card_jack",
		pcs = {},
		dlc = "e3_s15a",
		texture_bundle_folder = "humble_summer_2015",
		value = 0,
		sort_number = 8
	}
	self.masks.card_queen = {
		unit = "units/pd2_dlc_playingcards/masks/msk_card_queen/msk_card_queen",
		name_id = "bm_msk_card_queen",
		pcs = {},
		dlc = "e3_s15b",
		texture_bundle_folder = "humble_summer_2015",
		value = 0,
		sort_number = 8
	}
	self.masks.card_king = {
		unit = "units/pd2_dlc_playingcards/masks/msk_card_king/msk_card_king",
		name_id = "bm_msk_card_king",
		pcs = {},
		dlc = "e3_s15c",
		texture_bundle_folder = "humble_summer_2015",
		value = 0,
		sort_number = 8
	}
	self.masks.card_joker = {
		unit = "units/pd2_dlc_playingcards/masks/msk_card_joker/msk_card_joker",
		name_id = "bm_msk_card_joker",
		pcs = {},
		dlc = "e3_s15d",
		texture_bundle_folder = "humble_summer_2015",
		value = 0,
		sort_number = 8
	}
	self.masks.king_of_jesters = {
		unit = "units/pd2_dlc_paydaycon2015/masks/king_of_jesters/msk_king_of_jesters",
		name_id = "bm_msk_king_of_jesters",
		pcs = {},
		dlc = "pdcon_2015",
		value = 0,
		sort_number = 9
	}
	self.masks.card_jack.dlc = "bigscore"
	self.masks.card_jack.dlc_list = {
		"akm4_pack",
		"character_pack_sokol",
		"bbq",
		"west",
		"arena",
		"kenaz",
		"turtles",
		"dragon",
		"berry",
		"steel"
	}
	self.masks.card_queen.dlc = "bigscore"
	self.masks.card_queen.dlc_list = {
		"akm4_pack",
		"character_pack_sokol",
		"bbq",
		"west",
		"arena",
		"kenaz",
		"turtles",
		"dragon",
		"berry",
		"steel"
	}
	self.masks.card_king.dlc = "bigscore"
	self.masks.card_king.dlc_list = {
		"akm4_pack",
		"character_pack_sokol",
		"bbq",
		"west",
		"arena",
		"kenaz",
		"turtles",
		"dragon",
		"berry",
		"steel"
	}
	self.masks.card_joker.dlc = "bigscore"
	self.masks.card_joker.dlc_list = {
		"akm4_pack",
		"character_pack_sokol",
		"bbq",
		"west",
		"arena",
		"kenaz",
		"turtles",
		"dragon",
		"berry",
		"steel"
	}
	self.masks.king_of_jesters.dlc = "bigscore"
	self.masks.king_of_jesters.dlc_list = {
		"akm4_pack",
		"character_pack_sokol",
		"bbq",
		"west",
		"arena",
		"kenaz",
		"turtles",
		"dragon",
		"berry",
		"steel"
	}
	self.masks.sokol = {
		unit = "units/pd2_dlc_character_sokol/masks/sokol/msk_sokol",
		name_id = "bm_msk_sokol",
		pcs = {},
		value = 0,
		texture_bundle_folder = "character_pack_sokol",
		dlc = "character_pack_sokol"
	}
	self.masks.sokol_begins = {
		unit = "units/pd2_dlc_character_sokol/masks/sokol_begins/msk_sokol_begins",
		name_id = "bm_msk_sokol_begins",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		texture_bundle_folder = "character_pack_sokol",
		dlc = "character_pack_sokol"
	}
	self.masks.jiro = {
		unit = "units/pd2_dlc_dragon/masks/jiro/msk_jiro",
		name_id = "bm_msk_jiro",
		pcs = {},
		value = 0,
		texture_bundle_folder = "dragon",
		dlc = "dragon"
	}
	self.masks.jiro_begins = {
		unit = "units/pd2_dlc_dragon/masks/jiro_begins/msk_jiro_begins",
		name_id = "bm_msk_jiro_begins",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		texture_bundle_folder = "dragon",
		dlc = "dragon"
	}
	self.masks.croupier_hat = {
		unit = "units/pd2_dlc_casino/masks/msk_croupier_hat/msk_croupier_hat",
		name_id = "bm_msk_croupier_hat",
		pcs = {},
		value = 0,
		dlc = "kenaz",
		texture_bundle_folder = "kenaz",
		type = "glasses",
		offsets = {
			joy = {
				Vector3(0, 1.38922, -0.399471),
				Rotation(-0, -0, -0)
			}
		}
	}
	self.masks.gladiator_helmet = {
		unit = "units/pd2_dlc_casino/masks/msk_gladiator/msk_gladiator",
		name_id = "bm_msk_gladiator_helmet",
		pcs = {},
		value = 0,
		dlc = "kenaz",
		texture_bundle_folder = "kenaz",
		type = "helmet"
	}
	self.masks.the_king_mask = {
		unit = "units/pd2_dlc_casino/masks/msk_the_king/msk_the_king",
		name_id = "bm_msk_the_king_mask",
		pcs = {},
		value = 0,
		dlc = "kenaz",
		texture_bundle_folder = "kenaz",
		type = "helmet"
	}
	self.masks.sports_utility_mask = {
		unit = "units/pd2_dlc_casino/masks/msk_sports_utility/msk_sports_utility",
		name_id = "bm_msk_sports_utility_mask",
		pcs = {},
		value = 0,
		dlc = "kenaz",
		texture_bundle_folder = "kenaz"
	}
	self.masks.starvr = {
		unit = "units/pd2_dlc_humble_summer15/masks/starvr/msk_starvr",
		name_id = "bm_msk_starvr",
		pcs = {},
		value = 0,
		infamous = true,
		texture_bundle_folder = "humble_summer_2015",
		type = "helmet"
	}
	self.masks.slicer = {
		unit = "units/pd2_dlc_turtles/masks/slicer/msk_slicer",
		name_id = "bm_msk_slicer",
		pcs = {},
		value = 0,
		texture_bundle_folder = "turtles",
		dlc = "turtles"
	}
	self.masks.kage = {
		unit = "units/pd2_dlc_turtles/masks/kage/msk_kage",
		name_id = "bm_msk_kage",
		pcs = {},
		value = 0,
		texture_bundle_folder = "turtles",
		dlc = "turtles"
	}
	self.masks.ninja_hood = {
		unit = "units/pd2_dlc_turtles/masks/ninja_hood/msk_ninja_hood",
		name_id = "bm_msk_ninja_hood",
		pcs = {},
		value = 0,
		type = "helmet",
		texture_bundle_folder = "turtles",
		dlc = "turtles"
	}
	self.masks.shirai = {
		unit = "units/pd2_dlc_turtles/masks/shirai/msk_shirai",
		name_id = "bm_msk_shirai",
		pcs = {},
		value = 0,
		type = "helmet",
		skip_mask_on_sequence = true,
		texture_bundle_folder = "turtles",
		dlc = "turtles"
	}
	self.masks.mason_knight_veteran = {
		unit = "units/pd2_dlc_steel/masks/mason_knight_veteran/msk_mason_knight_veteran",
		name_id = "bm_msk_mason_knight_veteran",
		pcs = {},
		value = 0,
		dlc = "steel",
		texture_bundle_folder = "steel",
		type = "helmet"
	}
	self.masks.agatha_knight = {
		unit = "units/pd2_dlc_steel/masks/agatha_knight/msk_agatha_knight",
		name_id = "bm_msk_agatha_knight",
		pcs = {},
		value = 0,
		dlc = "steel",
		texture_bundle_folder = "steel",
		type = "helmet"
	}
	self.masks.agatha_vanguard_veteran = {
		unit = "units/pd2_dlc_steel/masks/agatha_vanguard_veteran/msk_agatha_vanguard_veteran",
		name_id = "bm_msk_agatha_vanguard_veteran",
		pcs = {},
		value = 0,
		dlc = "steel",
		texture_bundle_folder = "steel",
		type = "helmet"
	}
	self.masks.mason_vanguard_veteran = {
		unit = "units/pd2_dlc_steel/masks/mason_vanguard_veteran/msk_mason_vanguard_veteran",
		name_id = "bm_msk_mason_vanguard_veteran",
		pcs = {},
		value = 0,
		dlc = "steel",
		texture_bundle_folder = "steel",
		type = "helmet"
	}
	self.masks.rus_hat = {
		unit = "units/pd2_crimefest_2015/update_2/masks/rus_hat/msk_rus_hat",
		name_id = "bm_msk_rus_hat",
		pcs = {
			10,
			20,
			30,
			40
		},
		sort_number = 8,
		value = 0,
		type = "helmet"
	}
	self.masks.sputnik = {
		unit = "units/pd2_crimefest_2015/update_2/masks/sputnik/msk_sputnik",
		name_id = "bm_msk_sputnik",
		pcs = {
			10,
			20,
			30,
			40
		},
		sort_number = 8,
		value = 0,
		type = "helmet"
	}
	self.masks.tiara = {
		unit = "units/pd2_crimefest_2015/update_2/masks/tiara/msk_tiara",
		name_id = "bm_msk_tiara",
		pcs = {
			10,
			20,
			30,
			40
		},
		sort_number = 8,
		value = 0,
		type = "tiara",
		skip_mask_on_sequence = true,
		offsets = {
			joy = {
				Vector3(2.93943, 2.46244, -4.45385),
				Rotation(16.871, 22.0224, 0.558107)
			}
		}
	}
	self.masks.baba_yaga = {
		unit = "units/pd2_crimefest_2015/update_2/masks/baba_yaga/msk_baba_yaga",
		name_id = "bm_msk_baba_yaga",
		pcs = {
			10,
			20,
			30,
			40
		},
		sort_number = 8,
		value = 0
	}
	self.masks.vlad_armor = {
		unit = "units/pd2_crimefest_2015/update_2/masks/vlad_armor/msk_vlad_armor",
		name_id = "bm_msk_vlad_armor",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		sort_number = 8,
		type = "helmet"
	}
	self.masks.lcv = {
		unit = "units/pd2_dlc_rave/masks/msk_lcv",
		name_id = "bm_msk_lcv",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		sort_number = 9,
		texture_bundle_folder = "rave"
	}
	self.masks.pirate_skull = {
		unit = "units/pd2_crimefest_2015/update_8/masks/pirate_skull/msk_pirate_skull",
		name_id = "bm_msk_pirate_skull",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		sort_number = 10,
		type = "helmet"
	}
	self.masks.fatboy = {
		unit = "units/pd2_crimefest_2015/update_8/masks/msk_fatboy/msk_fatboy",
		name_id = "bm_msk_fatboy",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		sort_number = 10
	}
	self.masks.oliver = {
		unit = "units/pd2_crimefest_2015/update_8/masks/oliver/msk_oliver",
		name_id = "bm_msk_oliver",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		sort_number = 10,
		default_blueprint = {
			materials = "deep_bronze",
			textures = "no_color_full_material"
		}
	}
	self.masks.eggian = {
		unit = "units/pd2_crimefest_2015/update_8/masks/eggian/msk_eggian",
		name_id = "bm_msk_eggian",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		sort_number = 10
	}
	self.masks.groucho_glasses = {
		unit = "units/pd2_crimefest_2015/update_9/masks/msk_groucho_glasses/msk_groucho_glasses",
		name_id = "bm_msk_groucho",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		type = "glasses",
		sort_number = 11,
		skip_mask_on_sequence = true
	}
	self.masks.glasses_tinted_love = {
		unit = "units/pd2_crimefest_2015/update_9/masks/msk_tinted_love/msk_glasses_tinted_love",
		name_id = "bm_msk_tinted_love",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		type = "glasses",
		sort_number = 11,
		skip_mask_on_sequence = true
	}
	self.masks.baitface = {
		unit = "units/pd2_crimefest_2015/update_10/masks/baitface/msk_baitface",
		name_id = "bm_msk_baitface",
		pcs = {},
		value = 0,
		sort_number = 12
	}
	self.masks.nomegusta = {
		unit = "units/pd2_crimefest_2015/update_10/masks/nomegusta/msk_nomegusta",
		name_id = "bm_msk_nomegusta",
		pcs = {},
		value = 0,
		sort_number = 12
	}
	self.masks.rageface = {
		unit = "units/pd2_crimefest_2015/update_10/masks/rageface/msk_rageface",
		name_id = "bm_msk_rageface",
		pcs = {},
		value = 0,
		sort_number = 12
	}
	self.masks.dawg = {
		unit = "units/pd2_crimefest_2015/update_10/masks/msk_dawg/msk_dawg",
		name_id = "bm_msk_dawg",
		pcs = {},
		value = 0,
		sort_number = 12
	}
	self.masks.invader = {
		unit = "units/pd2_dlc_nails/masks/invader/msk_invader",
		name_id = "bm_msk_invader",
		global_value = "halloween",
		texture_bundle_folder = "nails",
		sort_number = 3,
		value = 0
	}
	self.masks.satan = {
		unit = "units/pd2_dlc_nails/masks/satan/msk_satan",
		name_id = "bm_msk_satan",
		global_value = "halloween",
		texture_bundle_folder = "nails",
		sort_number = 3,
		value = 0
	}
	self.masks.tormentor = {
		unit = "units/pd2_dlc_tormentor_mask/masks/tormentor/msk_tormentor",
		name_id = "bm_msk_tormentor",
		pcs = {},
		value = 0,
		sort_number = 12
	}
	self.masks.bodhi = {
		unit = "units/pd2_dlc_rip/masks/bodhi/msk_bodhi",
		name_id = "bm_msk_bodhi",
		pcs = {},
		value = 0,
		global_value = "infamous",
		texture_bundle_folder = "rip"
	}
	self.masks.bodhi_begins = {
		unit = "units/pd2_dlc_rip/masks/bodhi_begins/msk_bodhi_begins",
		name_id = "bm_msk_bodhi_begins",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		global_value = "infamous",
		texture_bundle_folder = "rip"
	}
	self.masks.water_spirit = {
		unit = "units/pd2_dlc_jerry/masks/msk_water_spirit/msk_water_spirit",
		name_id = "bm_msk_water_spirit",
		pcs = {},
		value = 0,
		dlc = "berry",
		texture_bundle_folder = "berry"
	}
	self.masks.tane = {
		unit = "units/pd2_dlc_jerry/masks/tane/msk_tane",
		name_id = "bm_msk_tane",
		pcs = {},
		value = 0,
		dlc = "berry",
		texture_bundle_folder = "berry"
	}
	self.masks.oro = {
		unit = "units/pd2_dlc_jerry/masks/oro/msk_oro",
		name_id = "bm_msk_oro",
		pcs = {},
		value = 0,
		dlc = "berry",
		texture_bundle_folder = "berry"
	}
	self.masks.maui = {
		unit = "units/pd2_dlc_jerry/masks/maui/msk_maui",
		name_id = "bm_msk_maui",
		pcs = {},
		value = 0,
		dlc = "berry",
		texture_bundle_folder = "berry"
	}
	self.masks.rudeolph = {
		unit = "units/pd2_dlc_cane/masks/rudeolph/msk_rudeolph",
		name_id = "bm_msk_rudeolph",
		type = "tiara",
		pcs = {},
		value = 0,
		sort_number = 13
	}
	self.masks.greedy_the_elf = {
		unit = "units/pd2_dlc_cane/masks/greedy_the_elf/msk_greedy_the_elf",
		name_id = "bm_msk_greedy_the_elf",
		type = "hat",
		pcs = {},
		value = 0,
		sort_number = 13
	}
	self.masks.tall_goat = {
		unit = "units/pd2_dlc_peta/masks/mask_tall_goat/msk_tall_goat",
		name_id = "bm_msk_tall_goat",
		pcs = {},
		value = 0,
		sort_number = 14,
		dlc = "peta",
		texture_bundle_folder = "peta"
	}
	self.masks.goat_goat = {
		unit = "units/pd2_dlc_peta/masks/mask_goat/msk_goat_goat",
		name_id = "bm_msk_goat_goat",
		pcs = {},
		value = 0,
		sort_number = 14,
		dlc = "peta",
		texture_bundle_folder = "peta"
	}
	self.masks.wet_goat = {
		unit = "units/pd2_dlc_peta/masks/mask_wet_goat/msk_wet_goat",
		name_id = "bm_msk_slimy_goat",
		pcs = {},
		value = 0,
		sort_number = 14,
		dlc = "peta",
		texture_bundle_folder = "peta"
	}
	self.masks.fancy_goat = {
		unit = "units/pd2_dlc_peta/masks/mask_fancy_goat/msk_fancy_goat",
		name_id = "bm_msk_fancy_goat",
		pcs = {},
		value = 0,
		sort_number = 14,
		dlc = "peta",
		texture_bundle_folder = "peta"
	}
	self.masks.horned_king = {
		unit = "units/pd2_dlc_lupus/masks/lupus_horned_king/msk_horned_king",
		name_id = "bm_msk_horned_king",
		type = "tiara",
		pcs = {},
		value = 0,
		dlc = "pal",
		texture_bundle_folder = "lupus",
		sort_number = 15,
		offsets = {
			joy = {
				Vector3(0, 1.15073, -0.518717),
				Rotation(-0, -0, -0)
			}
		}
	}
	self.masks.viking = {
		unit = "units/pd2_dlc_lupus/masks/lupus_viking/msk_viking",
		name_id = "bm_msk_viking",
		pcs = {},
		value = 0,
		dlc = "pal",
		texture_bundle_folder = "lupus",
		sort_number = 15
	}
	self.masks.nutcracker = {
		unit = "units/pd2_dlc_lupus/masks/lupus_nutcracker/msk_nutcracker",
		name_id = "bm_msk_nutcracker",
		pcs = {},
		value = 0,
		dlc = "pal",
		texture_bundle_folder = "lupus",
		sort_number = 15
	}
	self.masks.divided = {
		unit = "units/pd2_dlc_lupus/masks/lupus_divided/msk_divided",
		name_id = "bm_msk_divided",
		pcs = {},
		value = 0,
		dlc = "pal",
		texture_bundle_folder = "lupus",
		sort_number = 15
	}
	self.masks.jimmy = {
		unit = "units/pd2_dlc_coco/masks/jimmy/msk_jimmy",
		name_id = "bm_msk_jimmy",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		dlc = "coco",
		texture_bundle_folder = "coco",
		sort_number = 16
	}
	self.masks.jimmy_duct = {
		unit = "units/pd2_dlc_coco/masks/jimmy_duct/msk_jimmy_duct",
		name_id = "bm_msk_jimmy_duct",
		pcs = {},
		value = 0,
		dlc = "coco",
		texture_bundle_folder = "coco",
		sort_number = 16
	}
	self.masks.half_mask = {
		unit = "units/pd2_dlc_mad/masks/mad_halv_mask/msk_half_mask",
		name_id = "bm_msk_andromeda",
		pcs = {},
		value = 0,
		dlc = "mad",
		type = "helmet",
		texture_bundle_folder = "mad",
		sort_number = 17
	}
	self.masks.visor = {
		unit = "units/pd2_dlc_mad/masks/mad_helmet_mask/msk_visor",
		name_id = "bm_msk_visor",
		pcs = {},
		value = 0,
		dlc = "mad",
		type = "helmet",
		texture_bundle_folder = "mad",
		sort_number = 17
	}
	self.masks.mad_goggles = {
		unit = "units/pd2_dlc_mad/masks/mad_goggles/msk_mad_goggles",
		name_id = "bm_msk_goggles",
		pcs = {},
		value = 0,
		dlc = "mad",
		type = "helmet",
		texture_bundle_folder = "mad",
		sort_number = 17
	}
	self.masks.mad_mask = {
		unit = "units/pd2_dlc_mad/masks/mad_mask/msk_mad_mask",
		name_id = "bm_msk_mad_mask",
		pcs = {},
		value = 0,
		dlc = "mad",
		texture_bundle_folder = "mad",
		sort_number = 17
	}
	self.masks.sydney = {
		unit = "units/pd2_dlc_opera/masks/sydney/msk_sydney",
		name_id = "bm_msk_sydney",
		pcs = {},
		value = 0,
		dlc = "opera",
		texture_bundle_folder = "opera",
		sort_number = 19
	}
	self.masks.sydney_begins = {
		unit = "units/pd2_dlc_opera/masks/sydney_begins/msk_sydney_begins",
		name_id = "bm_msk_sydney_begins",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		dlc = "opera",
		texture_bundle_folder = "opera",
		sort_number = 19
	}
	self.masks.born_biker_01 = {
		unit = "units/pd2_dlc_born/masks/born_01/msk_born_biker_01",
		name_id = "bm_msk_biker_classic",
		pcs = {},
		value = 0,
		type = "helmet",
		texture_bundle_folder = "born",
		sort_number = 21,
		dlc = "born"
	}
	self.masks.born_biker_02 = {
		unit = "units/pd2_dlc_born/masks/born_02/msk_born_biker_02",
		name_id = "bm_msk_speed_demon",
		pcs = {},
		value = 0,
		texture_bundle_folder = "born",
		sort_number = 21,
		dlc = "born"
	}
	self.masks.born_biker_03 = {
		unit = "units/pd2_dlc_born/masks/born_03/msk_born_biker_03",
		name_id = "bm_msk_rage_demon",
		pcs = {},
		value = 0,
		type = "helmet",
		texture_bundle_folder = "born",
		sort_number = 21,
		dlc = "born"
	}
	self.masks.brutal = {
		unit = "units/pd2_dlc_born/masks/brutal/msk_brutal",
		name_id = "bm_msk_brutal",
		pcs = {},
		value = 0,
		texture_bundle_folder = "born",
		sort_number = 21,
		dlc = "born"
	}
	self.masks.rust = {
		unit = "units/pd2_dlc_wild/masks/rust/msk_rust",
		name_id = "bm_msk_rust",
		pcs = {},
		value = 0,
		texture_bundle_folder = "wild",
		sort_number = 22,
		dlc = "wild"
	}
	self.masks.rust_begins = {
		unit = "units/pd2_dlc_wild/masks/rust_begins/msk_rust_begins",
		name_id = "bm_msk_rust_begins",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		texture_bundle_folder = "wild",
		sort_number = 22,
		dlc = "wild"
	}
	self.masks.mig_death = {
		unit = "units/pd2_dlc_migg/masks/migg_death/msk_mig_death",
		name_id = "bm_msk_death_rider",
		pcs = {},
		value = 0,
		texture_bundle_folder = "migg",
		sort_number = 24,
		dlc = "pd2_clan"
	}
	self.masks.mig_war = {
		unit = "units/pd2_dlc_migg/masks/migg_war/msk_mig_war",
		name_id = "bm_msk_war",
		pcs = {},
		value = 0,
		type = "helmet",
		texture_bundle_folder = "migg",
		sort_number = 24,
		dlc = "pd2_clan"
	}
	self.masks.mig_conquest = {
		unit = "units/pd2_dlc_migg/masks/migg_conquest/msk_mig_conquest",
		name_id = "bm_msk_conquest",
		pcs = {},
		value = 0,
		texture_bundle_folder = "migg",
		sort_number = 24,
		dlc = "pd2_clan"
	}
	self.masks.mig_famine = {
		unit = "units/pd2_dlc_migg/masks/migg_famine/msk_mig_famine",
		name_id = "bm_msk_famine",
		pcs = {},
		value = 0,
		texture_bundle_folder = "migg",
		sort_number = 24,
		dlc = "pd2_clan"
	}
	self.masks.fib_fox = {
		unit = "units/pd2_dlc_fibb/masks/fib_fox_mask/msk_fib_fox",
		name_id = "bm_msk_fable_fox",
		pcs = {},
		value = 0,
		texture_bundle_folder = "fibb",
		sort_number = 25,
		dlc = "pd2_clan"
	}
	self.masks.fib_cat = {
		unit = "units/pd2_dlc_fibb/masks/fib_cat_mask/msk_fib_cat",
		name_id = "bm_msk_fable_cat",
		pcs = {},
		value = 0,
		texture_bundle_folder = "fibb",
		sort_number = 25,
		dlc = "pd2_clan"
	}
	self.masks.fib_mouse = {
		unit = "units/pd2_dlc_fibb/masks/fib_mouse_mask/msk_fib_mouse",
		name_id = "bm_msk_fable_mouse",
		pcs = {},
		value = 0,
		texture_bundle_folder = "fibb",
		sort_number = 25,
		dlc = "pd2_clan"
	}
	self.masks.fib_hare = {
		unit = "units/pd2_dlc_fibb/masks/fib_hare_mask/msk_fib_hare",
		name_id = "bm_msk_fable_hare",
		pcs = {},
		value = 0,
		texture_bundle_folder = "fibb",
		sort_number = 25,
		dlc = "pd2_clan"
	}
	self.masks.gti_al_capone = {
		unit = "units/pd2_dlc_gotti/masks/al_capone/msk_gti_al_capone",
		name_id = "bm_al_pacino",
		pcs = {},
		value = 0,
		texture_bundle_folder = "gotti",
		sort_number = 29
	}
	self.masks.gti_bugsy = {
		unit = "units/pd2_dlc_gotti/masks/bugsy/msk_gti_bugsy",
		name_id = "bm_bugsy",
		pcs = {},
		value = 0,
		texture_bundle_folder = "gotti",
		sort_number = 29
	}
	self.masks.gti_madame_st_claire = {
		unit = "units/pd2_dlc_gotti/masks/madame/msk_gti_madame_st_claire",
		name_id = "bm_madame_st_claire",
		pcs = {},
		value = 0,
		texture_bundle_folder = "gotti",
		sort_number = 29
	}
	self.masks.gti_lucky_luciano = {
		unit = "units/pd2_dlc_gotti/masks/lucky_luciano/msk_gti_lucky_luciano",
		name_id = "bm_lucky_luciano",
		pcs = {},
		value = 0,
		texture_bundle_folder = "gotti",
		sort_number = 29
	}
	self.masks.joy = {
		unit = "units/pd2_dlc_joy/masks/msk_joy",
		name_id = "bm_msk_joy",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		texture_bundle_folder = "joy",
		sort_number = 56,
		infamous = true,
		global_value = "infamous",
		offsets = {
			wild = {
				Vector3(0, -1.11495, 0),
				Rotation(-0, -0, -0)
			},
			chico = {
				Vector3(0, -1.47269, 0),
				Rotation(-0, -0, -0)
			}
		}
	}
	self.masks.joy_begins = {
		unit = "units/pd2_dlc_joy/masks/msk_joy_begins",
		name_id = "bm_msk_joy_begins",
		pcs = {
			10,
			20,
			30,
			40
		},
		value = 0,
		texture_bundle_folder = "joy",
		sort_number = 56,
		infamous = true,
		global_value = "infamous",
		offsets = {
			wild = {
				Vector3(0, -0.876456, 0),
				Rotation(-0, -0, -0)
			},
			chico = {
				Vector3(0, -1.11495, 0),
				Rotation(-0, -0, -0)
			}
		}
	}

	if SystemInfo:platform() == Idstring("PS3") then
		self.masks.sweettooth = {
			unit = "units/pd2_dlc_consoles/masks/msk_sweettooth/msk_sweettooth",
			name_id = "bm_msk_sweettooth",
			pcs = {
				10,
				20,
				30,
				40
			},
			dlc = "sweettooth",
			value = 1,
			texture_bundle_folder = "consoles"
		}
	elseif SystemInfo:platform() == Idstring("X360") then
		self.masks.thespian = {
			unit = "units/pd2_dlc_consoles/masks/pd2_thespian_mask/msk_thespian",
			name_id = "bm_msk_thespian",
			pcs = {},
			value = 0,
			type = "helmet",
			texture_bundle_folder = "consoles"
		}
	elseif SystemInfo:platform() == Idstring("PS4") then
		self.masks.finger = {
			unit = "units/pd2_nextgen/masks/finger/msk_finger",
			name_id = "bm_msk_finger",
			pcs = {
				10,
				20,
				30,
				40
			},
			dlc = "preorder",
			value = 7,
			texture_bundle_folder = "nextgen"
		}
		self.masks.unforsaken = {
			unit = "units/pd2_nextgen/masks/unforsaken/msk_unforsaken",
			name_id = "bm_msk_unforsaken",
			pcs = {},
			value = 0,
			infamous = true,
			texture_bundle_folder = "nextgen"
		}
	elseif SystemInfo:platform() == Idstring("XB1") then
		self.masks.instinct = {
			unit = "units/pd2_nextgen/masks/instinct/msk_instinct",
			name_id = "bm_msk_instinct",
			pcs = {
				10,
				20,
				30,
				40
			},
			dlc = "preorder",
			value = 7,
			texture_bundle_folder = "nextgen"
		}
		self.masks.unforsaken = {
			unit = "units/pd2_nextgen/masks/unforsaken/msk_unforsaken",
			name_id = "bm_msk_unforsaken",
			pcs = {},
			value = 0,
			infamous = true,
			texture_bundle_folder = "nextgen"
		}
	end

	self.masks.character_locked.installed = true
	self.masks.dallas.installed = true
	self.masks.dallas_clean.installed = true
	self.masks.wolf.installed = true
	self.masks.wolf_clean.installed = true
	self.masks.hoxton.installed = true
	self.masks.hoxton_clean.installed = true
	self.masks.chains.installed = true
	self.masks.chains_clean.installed = true
	self.masks.skull.installed = true
	self.masks.cthulhu.installed = true
	self.masks.grin.installed = true
	self.masks.anonymous.installed = true
	self.masks.dillinger_death_mask.installed = true
	self.masks.alienware.installed = true
	self.masks.greek_tragedy.installed = true
	self.masks.jaw.installed = true
	self.masks.hockey.installed = true
	self.masks.troll.installed = true
	self.masks.gagball.installed = true
	self.masks.tounge.installed = true
	self.masks.zipper.installed = true
	self.masks.biglips.installed = true
	self.masks.clowncry.installed = true
	self.masks.mr_sinister.installed = true
	self.masks.clown_56.installed = true
	self.masks.dripper.installed = true
	self.masks.buha.installed = true
	self.masks.shogun.installed = true
	self.masks.oni.installed = true
	self.masks.monkeybiss.installed = true
	self.masks.babyrhino.installed = true
	self.masks.hog.installed = true
	self.masks.outlandish_a.installed = true
	self.masks.outlandish_b.installed = true
	self.masks.outlandish_c.installed = true
	self.masks.bullet.installed = true
	self.masks.shrunken.installed = true
	self.masks.brainiack.installed = true
	self.masks.zombie.installed = true
	self.masks.scarecrow.installed = true
	self.masks.mummy.installed = true
	self.masks.vampire.installed = true
	self.masks.day_of_the_dead.installed = true
	self.masks.dawn_of_the_dead.installed = true
	self.masks.demon.installed = true
	self.masks.stonekisses.installed = true
	self.masks.demonictender.installed = true
	self.masks.kawaii.installed = true
	self.masks.irondoom.installed = true
	self.masks.rubber_male.installed = true
	self.masks.rubber_female.installed = true
	self.masks.heat.installed = true
	self.masks.bear.installed = true
	self.masks.santa_happy.installed = true
	local free_dlcs = tweak_data:free_dlc_list()

	for _, data in pairs(self.masks) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end

	self:_add_desc_from_name_macro(self.masks)
end
