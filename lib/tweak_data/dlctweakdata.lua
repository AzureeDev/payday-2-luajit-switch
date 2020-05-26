DLCTweakData = DLCTweakData or class()

function DLCTweakData:init(tweak_data)
	if managers.dlc:is_installing() then
		tweak_data.BUNDLED_DLC_PACKAGES = {}
	else
		tweak_data.BUNDLED_DLC_PACKAGES = {
			steel = true,
			washington_reveal = true,
			gage_pack_shotgun = true,
			dlc_pack_overkill = true,
			peta = true,
			dlc_akm4 = 1,
			coco = true,
			character_pack_clover = true,
			west = true,
			pd2_goty = 1,
			opera = true,
			joy = true,
			born = true,
			gage_pack_historical = true,
			wild = true,
			fez1 = true,
			big_bank = true,
			character_pack_dragan = true,
			dos = true,
			butcher_pack_mods = true,
			pd2_hw_boxing = true,
			the_bomb = true,
			rip = true,
			kenaz = true,
			hlm2 = true,
			gage_pack_lmg = true,
			dlc_arena = true,
			dragon = true,
			speedrunners = 1,
			alienware_alpha = true,
			gage_pack = true,
			humble_summer_2015 = 1,
			pal = true,
			hoxton_revenge = 1,
			favorite = true,
			hl_miami = true,
			mad = true,
			cash = true,
			bbq = true,
			turtles = true,
			gage_pack_jobs = false,
			season_pass = true,
			gage_pack_snp = true,
			dlc1 = true,
			pd2_million = true,
			character_pack_bonnie = true,
			animal = true,
			gage_pack_assault = true,
			character_pack_sokol = true,
			infamous = 1,
			pines = true,
			twitch_pack = 1
		}
	end

	self.starvr_free = {
		free = true,
		content = {}
	}
	self.starvr_free.content.loot_global_value = "infamous"
	self.starvr_free.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "starvr",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "starvr",
			amount = 1
		}
	}
	self.starter_kit = {
		free = true,
		content = {}
	}
	self.starter_kit.content.loot_global_value = "normal"
	self.starter_kit.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ns_pis_medium",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_m4_uupg_m_std",
			amount = 1
		}
	}
	self.starter_kit.content.upgrades = {
		"fists",
		"molotov",
		"frag",
		"dynamite"
	}
	local all_normal_masks = {
		"alienware",
		"babyrhino",
		"mr_sinister",
		"day_of_the_dead",
		"irondoom",
		"greek_tragedy",
		"hockey",
		"kawaii",
		"demonictender",
		"monkeybiss",
		"rubber_male",
		"scarecrow",
		"tounge",
		"rubber_female",
		"oni",
		"biglips",
		"brainiack",
		"bullet",
		"outlandish_a",
		"clowncry",
		"dripper",
		"gagball",
		"hog",
		"demon",
		"jaw",
		"mummy",
		"outlandish_b",
		"outlandish_c",
		"stonekisses",
		"buha",
		"shogun",
		"shrunken",
		"clown_56",
		"troll",
		"dawn_of_the_dead",
		"vampire",
		"zipper",
		"zombie"
	}
	local lootdrops = {}

	for i, mask_id in ipairs(all_normal_masks) do
		table.insert(lootdrops, {
			type_items = "masks",
			amount = 1,
			item_entry = mask_id
		})
	end

	self.starter_kit_mask = {
		free = true,
		content = {}
	}
	self.starter_kit_mask.content.loot_global_value = "normal"
	self.starter_kit_mask.content.loot_drops = {
		lootdrops
	}
	self.pd2_clan = {
		content = {}
	}
	self.pd2_clan.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "bear",
			amount = 1
		}
	}
	self.pd2_clan2 = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan2.content.loot_global_value = "pd2_clan"
	self.pd2_clan2.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_fl_pis_tlr1",
			amount = 1
		}
	}
	self.pd2_clan2.content.upgrades = {
		"usp"
	}
	self.pd2_clan3 = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan3.content.loot_global_value = "pd2_clan"
	self.pd2_clan3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "heat",
			amount = 1
		}
	}
	self.pd2_clan4 = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan4.content.loot_global_value = "pd2_clan"
	self.pd2_clan4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "santa_happy",
			amount = 1
		}
	}
	self.pd2_clan5 = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan5.content.loot_global_value = "pd2_clan"
	self.pd2_clan5.content.loot_drops = {}
	self.pd2_clan5.content.upgrades = {
		"brass_knuckles"
	}
	self.pd2_clan6 = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan6.content.loot_global_value = "pd2_clan"
	self.pd2_clan6.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "unicorn",
			amount = 1
		}
	}
	self.pd2_clan_crimefest_oct19 = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan_crimefest_oct19.content.loot_global_value = "pd2_clan"
	self.pd2_clan_crimefest_oct19.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "combusto",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "spackle",
			amount = 1
		}
	}
	self.pd2_clan_johnwick = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan_johnwick.content.loot_global_value = "pd2_clan"
	self.pd2_clan_johnwick.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_g26_b_custom",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_g26_body_custom",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_g26_m_contour",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_g26_g_gripforce",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_fl_pis_crimson",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ns_pis_ipsccomp",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ns_pis_medium_gem",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "stoneface",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "wayfarer",
			amount = 1
		}
	}
	self.pd2_clan_johnwick.content.upgrades = {
		"kabartanto"
	}
	self.pd2_clan_crimefest_oct23 = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan_crimefest_oct23.content.loot_global_value = "pd2_clan"
	self.pd2_clan_crimefest_oct23.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "smiley",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "gumbo",
			amount = 1
		}
	}
	self.pd2_clan_lgl = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan_lgl.content.loot_global_value = "pd2_clan"
	self.pd2_clan_lgl.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "crazy_lion",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_s_spas12_folded",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_s_spas12_nostock",
			amount = 1
		}
	}
	self.pd2_clan_lgl.content.upgrades = {
		"spas12"
	}
	self.pd2_clan_hoxton = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan_hoxton.content.loot_global_value = "pd2_clan"
	self.pd2_clan_hoxton.content.loot_drops = {}
	self.ach_bulldog_1 = {
		dlc = "has_achievement",
		achievement_id = "bulldog_1",
		content = {}
	}
	self.ach_bulldog_1.content.loot_global_value = "infamous"
	self.ach_bulldog_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "old_hoxton",
			amount = 1
		}
	}
	self.freed_old_hoxton = {
		dlc = "has_freed_old_hoxton",
		achievement_id = "bulldog_1",
		content = {}
	}
	self.freed_old_hoxton.content.loot_global_value = "pd2_clan"
	self.freed_old_hoxton.content.loot_drops = {}
	self.freed_old_hoxton.content.upgrades = {
		"toothbrush"
	}
	self.crimefest2_u2 = {
		content = {},
		free = true
	}
	self.crimefest2_u2.content.loot_global_value = "normal"
	self.crimefest2_u2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "rus_hat",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "sputnik",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "tiara",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "baba_yaga",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "vlad_armor",
			amount = 1
		}
	}
	self.crimefest2_par = {
		content = {},
		free = true
	}
	self.crimefest2_par.content.loot_global_value = "normal"
	self.crimefest2_par.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_bp_lmg_lionbipod",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_par_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_par_s_plastic",
			amount = 1
		}
	}
	self.crimefest2_rave = {
		content = {},
		free = true
	}
	self.crimefest2_rave.content.loot_global_value = "normal"
	self.crimefest2_rave.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "lcv",
			amount = 1
		}
	}
	self.crimefest2_u8 = {
		content = {},
		free = true
	}
	self.crimefest2_u8.content.loot_global_value = "normal"
	self.crimefest2_u8.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "pirate_skull",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "fatboy",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "oliver",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "eggian",
			amount = 1
		}
	}
	self.crimefest2_u9 = {
		content = {},
		free = true
	}
	self.crimefest2_u9.content.loot_global_value = "normal"
	self.crimefest2_u9.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "groucho_glasses",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "glasses_tinted_love",
			amount = 1
		}
	}
	self.ach_brooklyn_1 = {
		dlc = "has_achievement",
		achievement_id = "brooklyn_1",
		content = {}
	}
	self.ach_brooklyn_1.content.loot_global_value = "normal"
	self.ach_brooklyn_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "baitface",
			amount = 1
		}
	}
	self.ach_brooklyn_2 = {
		dlc = "has_achievement",
		achievement_id = "brooklyn_2",
		content = {}
	}
	self.ach_brooklyn_2.content.loot_global_value = "normal"
	self.ach_brooklyn_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "nomegusta",
			amount = 1
		}
	}
	self.ach_brooklyn_3 = {
		dlc = "has_achievement",
		achievement_id = "brooklyn_3",
		content = {}
	}
	self.ach_brooklyn_3.content.loot_global_value = "normal"
	self.ach_brooklyn_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "rageface",
			amount = 1
		}
	}
	self.ach_brooklyn_4 = {
		dlc = "has_achievement",
		achievement_id = "brooklyn_4",
		content = {}
	}
	self.ach_brooklyn_4.content.loot_global_value = "normal"
	self.ach_brooklyn_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "dawg",
			amount = 1
		}
	}
	self.pd2_clan_bonnie = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan_bonnie.content.loot_global_value = "infamous"
	self.pd2_clan_bonnie.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "bonnie",
			amount = 1
		}
	}
	self.preorder = {
		content = {},
		content_on_consoles = true
	}
	self.preorder.content.loot_drops = {
		{
			type_items = "colors",
			item_entry = "red_black",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "fan",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "skull",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_aimpoint_2",
			amount = 1
		},
		{
			type_items = "cash",
			item_entry = "cash_preorder",
			amount = 1
		}
	}
	self.preorder.content.upgrades = {
		"player_crime_net_deal"
	}

	if SystemInfo:platform() == Idstring("PS4") then
		table.insert(self.preorder.content.loot_drops, {
			type_items = "masks",
			item_entry = "finger",
			amount = 1
		})
	elseif SystemInfo:platform() == Idstring("XB1") then
		table.insert(self.preorder.content.loot_drops, {
			type_items = "masks",
			item_entry = "instinct",
			amount = 1
		})
	end

	self.cce = {
		content = {}
	}
	self.cce.content.loot_drops = {}
	self.cce.content.upgrades = {
		"player_crime_net_deal_2"
	}
	self.soundtrack = {
		content = {}
	}
	self.soundtrack.content.loot_drops = {}
	self.poetry_soundtrack = {
		dlc = "has_soundtrack_or_cce",
		content = {}
	}
	self.poetry_soundtrack.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "metalhead",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "tcn",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "surprise",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "optimist_prime",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "blackmetal",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "carbongrid",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "cosmoline",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "electronic",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "deathcube",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "tcn",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "tribalstroke",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "kraken",
			amount = 1
		}
	}
	self.ach_lab_1 = {
		dlc = "has_achievement",
		achievement_id = "lab_1",
		content = {}
	}
	self.ach_lab_1.content.loot_global_value = "halloween"
	self.ach_lab_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "invader",
			amount = 1
		}
	}
	self.ach_lab_2 = {
		dlc = "has_achievement",
		achievement_id = "lab_2",
		content = {}
	}
	self.ach_lab_2.content.loot_global_value = "halloween"
	self.ach_lab_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "satan",
			amount = 1
		}
	}
	self.armored_transport = {
		content = {}
	}
	self.armored_transport.content.loot_drops = {
		{
			{
				type_items = "masks",
				item_entry = "clinton",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "bush",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "obama",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "nixon",
				amount = 1
			}
		},
		{
			{
				type_items = "materials",
				item_entry = "cash",
				amount = 1
			},
			{
				type_items = "materials",
				item_entry = "jade",
				amount = 1
			},
			{
				type_items = "materials",
				item_entry = "redwhiteblue",
				amount = 1
			},
			{
				type_items = "materials",
				item_entry = "marble",
				amount = 1
			}
		},
		{
			{
				type_items = "textures",
				item_entry = "racestripes",
				amount = 1
			},
			{
				type_items = "textures",
				item_entry = "americaneagle",
				amount = 1
			},
			{
				type_items = "textures",
				item_entry = "stars",
				amount = 1
			},
			{
				type_items = "textures",
				item_entry = "forestcamo",
				amount = 1
			}
		}
	}
	self.armored_transport.content.upgrades = {
		"m45",
		"s552",
		"ppk"
	}
	self.armored_transport_intel = {
		dlc = "has_armored_transport_and_intel",
		achievement_id = "armored_2",
		content = {}
	}
	self.armored_transport_intel.content.loot_drops = {}
	self.gage_pack = {
		content = {}
	}
	self.gage_pack.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_i_singlefire",
			amount = 5
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_i_autofire",
			amount = 5
		},
		{
			{
				type_items = "masks",
				item_entry = "goat",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "panda",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "pitbull",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "eagle",
				amount = 1
			}
		},
		{
			{
				type_items = "materials",
				item_entry = "fur",
				amount = 1
			},
			{
				type_items = "materials",
				item_entry = "galvanized",
				amount = 1
			},
			{
				type_items = "materials",
				item_entry = "heavymetal",
				amount = 1
			},
			{
				type_items = "materials",
				item_entry = "oilmetal",
				amount = 1
			}
		},
		{
			{
				type_items = "textures",
				item_entry = "army",
				amount = 1
			},
			{
				type_items = "textures",
				item_entry = "commando",
				amount = 1
			},
			{
				type_items = "textures",
				item_entry = "hunter",
				amount = 1
			},
			{
				type_items = "textures",
				item_entry = "digitalcamo",
				amount = 1
			}
		}
	}
	self.gage_pack.content.upgrades = {
		"mp7",
		"scar",
		"p226"
	}

	if SystemInfo:distribution() == Idstring("STEAM") then
		self.gage_pack_shotgun_free = {
			free = true,
			content = {}
		}
		self.gage_pack_shotgun_free.content.loot_global_value = "normal"
		self.gage_pack_shotgun_free.content.loot_drops = {
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_a_custom_free",
				amount = 2
			}
		}
	end

	self.gage_pack_shotgun = {
		content = {}
	}
	self.gage_pack_shotgun.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_slug",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_custom",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_explosive",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_piercing",
			amount = 1
		}
	}
	self.ach_gage4_2 = {
		dlc = "has_achievement",
		achievement_id = "gage4_2",
		content = {}
	}
	self.ach_gage4_2.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_2.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_mbus_rear",
			amount = 1
		}
	}
	self.ach_gage4_4 = {
		dlc = "has_achievement",
		achievement_id = "gage4_4",
		content = {}
	}
	self.ach_gage4_4.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "mandril",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "explosive",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "terror",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ben_b_short",
			amount = 1
		}
	}
	self.ach_gage4_5 = {
		dlc = "has_achievement",
		achievement_id = "gage4_5",
		content = {}
	}
	self.ach_gage4_5.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_5.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ben_b_long",
			amount = 1
		}
	}
	self.ach_gage4_6 = {
		dlc = "has_achievement",
		achievement_id = "gage4_6",
		content = {}
	}
	self.ach_gage4_6.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_6.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ben_s_collapsed",
			amount = 1
		}
	}
	self.ach_gage4_7 = {
		dlc = "has_achievement",
		achievement_id = "gage4_7",
		content = {}
	}
	self.ach_gage4_7.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_7.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ksg_b_short",
			amount = 1
		}
	}
	self.ach_gage4_8 = {
		dlc = "has_achievement",
		achievement_id = "gage4_8",
		content = {}
	}
	self.ach_gage4_8.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_8.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "skullmonkey",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "leaf",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "monkeyskull",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ksg_b_long",
			amount = 1
		}
	}
	self.ach_gage4_9 = {
		dlc = "has_achievement",
		achievement_id = "gage4_9",
		content = {}
	}
	self.ach_gage4_9.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_9.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ben_s_solid",
			amount = 1
		}
	}
	self.ach_gage4_10 = {
		dlc = "has_achievement",
		achievement_id = "gage4_10",
		content = {}
	}
	self.ach_gage4_10.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_10.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "silverback",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "sparks",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "chief",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_striker_b_long",
			amount = 1
		}
	}
	self.ach_gage4_11 = {
		dlc = "has_achievement",
		achievement_id = "gage4_11",
		content = {}
	}
	self.ach_gage4_11.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_11.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "orangutang",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "bananapeel",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "banana",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_striker_b_suppressed",
			amount = 1
		}
	}
	self.gage_pack_assault = {
		content = {}
	}
	self.gage_pack_assault.content.loot_drops = {}
	self.ach_gage5_1 = {
		dlc = "has_achievement",
		achievement_id = "gage5_1",
		content = {}
	}
	self.ach_gage5_1.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "evil",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_b_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_fg_psg",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_g_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_s_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_fg_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_g_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_famas_b_sniper",
			amount = 1
		}
	}
	self.ach_gage5_2 = {
		dlc = "has_achievement",
		achievement_id = "gage5_2",
		content = {}
	}
	self.ach_gage5_2.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "crowgoblin",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_gre_m79_stock_short",
			amount = 1
		}
	}
	self.ach_gage5_3 = {
		dlc = "has_achievement",
		achievement_id = "gage5_3",
		content = {}
	}
	self.ach_gage5_3.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_3.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_fg_mar",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_plastic",
			amount = 1
		}
	}
	self.ach_gage5_4 = {
		dlc = "has_achievement",
		achievement_id = "gage5_4",
		content = {}
	}
	self.ach_gage5_4.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_4.content.loot_drops = {
		{
			type_items = "materials",
			item_entry = "evil",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "vicious",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_fg_retro_plastic",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_light",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_famas_b_short",
			amount = 1
		}
	}
	self.ach_gage5_5 = {
		dlc = "has_achievement",
		achievement_id = "gage5_5",
		content = {}
	}
	self.ach_gage5_5.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_5.content.loot_drops = {
		{
			type_items = "materials",
			item_entry = "bone",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "muerte",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_gre_m79_barrel_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_wood",
			amount = 1
		}
	}
	self.ach_gage5_6 = {
		dlc = "has_achievement",
		achievement_id = "gage5_6",
		content = {}
	}
	self.ach_gage5_6.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_6.content.loot_drops = {
		{
			type_items = "materials",
			item_entry = "void",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "death",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_famas_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_fg_railed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_fg_sar",
			amount = 1
		}
	}
	self.ach_gage5_7 = {
		dlc = "has_achievement",
		achievement_id = "gage5_7",
		content = {}
	}
	self.ach_gage5_7.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_7.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_fg_retro",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_g_retro",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_s_wood",
			amount = 1
		}
	}
	self.ach_gage5_8 = {
		dlc = "has_achievement",
		achievement_id = "gage5_8",
		content = {}
	}
	self.ach_gage5_8.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_8.content.loot_drops = {
		{
			type_items = "materials",
			item_entry = "frost",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "emperor",
			amount = 1
		}
	}
	self.ach_gage5_9 = {
		dlc = "has_achievement",
		achievement_id = "gage5_9",
		content = {}
	}
	self.ach_gage5_9.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_9.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "volt",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_fg_fab",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_fab",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_skeletal",
			amount = 1
		}
	}
	self.ach_gage5_10 = {
		dlc = "has_achievement",
		achievement_id = "gage5_10",
		content = {}
	}
	self.ach_gage5_10.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_10.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "galax",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_famas_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_famas_g_retro",
			amount = 1
		}
	}
	self.gage_pack_lmg = {
		content = {}
	}
	self.gage_pack_lmg.content.loot_drops = {
		{
			{
				type_items = "masks",
				item_entry = "cloth_commander",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "gage_blade",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "gage_rambo",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "gage_deltaforce",
				amount = 1
			}
		},
		{
			{
				type_items = "materials",
				item_entry = "gunmetal",
				amount = 1
			},
			{
				type_items = "materials",
				item_entry = "mud",
				amount = 1
			},
			{
				type_items = "materials",
				item_entry = "splinter",
				amount = 1
			},
			{
				type_items = "materials",
				item_entry = "erdl",
				amount = 1
			}
		},
		{
			{
				type_items = "textures",
				item_entry = "styx",
				amount = 1
			},
			{
				type_items = "textures",
				item_entry = "fingerpaint",
				amount = 1
			},
			{
				type_items = "textures",
				item_entry = "fighter",
				amount = 1
			},
			{
				type_items = "textures",
				item_entry = "warrior",
				amount = 1
			}
		}
	}
	self.gage_pack_lmg.content.upgrades = {
		"rpk",
		"kabar"
	}
	self.gage_pack_snp = {
		content = {}
	}
	self.gage_pack_snp.content.loot_drops = {}
	self.gage_pack_snp.content.upgrades = {}
	self.ach_gage3_3 = {
		dlc = "has_achievement",
		achievement_id = "gage3_3",
		content = {}
	}
	self.ach_gage3_3.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "robberfly",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "carapace",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "bugger",
			amount = 1
		}
	}
	self.ach_gage3_4 = {
		dlc = "has_achievement",
		achievement_id = "gage3_4",
		content = {}
	}
	self.ach_gage3_4.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "spider",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "insectoid",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "spidereyes",
			amount = 1
		}
	}
	self.ach_gage3_5 = {
		dlc = "has_achievement",
		achievement_id = "gage3_5",
		content = {}
	}
	self.ach_gage3_5.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_5.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "wasp",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "bugshell",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "venomous",
			amount = 1
		}
	}
	self.ach_gage3_6 = {
		dlc = "has_achievement",
		achievement_id = "gage3_6",
		content = {}
	}
	self.ach_gage3_6.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_6.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "mantis",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "hardshell",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "wingsofdeath",
			amount = 1
		}
	}
	self.ach_gage3_7 = {
		dlc = "has_achievement",
		achievement_id = "gage3_7",
		content = {}
	}
	self.ach_gage3_7.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_7.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_m95_barrel_long",
			amount = 1
		}
	}
	self.ach_gage3_8 = {
		dlc = "has_achievement",
		achievement_id = "gage3_8",
		content = {}
	}
	self.ach_gage3_8.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_8.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_r93_b_suppressed",
			amount = 1
		}
	}
	self.ach_gage3_9 = {
		dlc = "has_achievement",
		achievement_id = "gage3_9",
		content = {}
	}
	self.ach_gage3_9.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_9.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_45iron",
			amount = 1
		}
	}
	self.ach_gage3_10 = {
		dlc = "has_achievement",
		achievement_id = "gage3_10",
		content = {}
	}
	self.ach_gage3_10.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_10.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_r93_b_short",
			amount = 1
		}
	}
	self.ach_gage3_11 = {
		dlc = "has_achievement",
		achievement_id = "gage3_11",
		content = {}
	}
	self.ach_gage3_11.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_11.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_m95_barrel_suppressed",
			amount = 1
		}
	}
	self.ach_gage3_12 = {
		dlc = "has_achievement",
		achievement_id = "gage3_12",
		content = {}
	}
	self.ach_gage3_12.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_12.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_m95_barrel_short",
			amount = 1
		}
	}
	self.ach_gage3_13 = {
		dlc = "has_achievement",
		achievement_id = "gage3_13",
		content = {}
	}
	self.ach_gage3_13.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_13.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_leupold",
			amount = 1
		}
	}
	self.ach_gage3_14 = {
		dlc = "has_achievement",
		achievement_id = "gage3_14",
		content = {}
	}
	self.ach_gage3_14.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_14.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_msr_body_msr",
			amount = 1
		}
	}
	self.ach_gage3_15 = {
		dlc = "has_achievement",
		achievement_id = "gage3_15",
		content = {}
	}
	self.ach_gage3_15.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_15.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_r93_body_wood",
			amount = 1
		}
	}
	self.ach_gage3_16 = {
		dlc = "has_achievement",
		achievement_id = "gage3_16",
		content = {}
	}
	self.ach_gage3_16.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_16.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_msr_ns_suppressor",
			amount = 1
		}
	}
	self.ach_gage3_17 = {
		dlc = "has_achievement",
		achievement_id = "gage3_17",
		content = {}
	}
	self.ach_gage3_17.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_17.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_msr_b_long",
			amount = 1
		}
	}
	self.big_bank = {
		content = {}
	}
	self.big_bank.content.loot_drops = {}
	self.ach_bigbank_1 = {
		dlc = "has_achievement",
		achievement_id = "bigbank_1",
		content = {}
	}
	self.ach_bigbank_1.content.loot_global_value = "big_bank"
	self.ach_bigbank_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "franklin",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "parchment",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "roman",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_g_01",
			amount = 1
		}
	}
	self.ach_bigbank_2 = {
		dlc = "has_achievement",
		achievement_id = "bigbank_2",
		content = {}
	}
	self.ach_bigbank_2.content.loot_global_value = "big_bank"
	self.ach_bigbank_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "washington",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "old",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "ruler",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_m_01",
			amount = 1
		}
	}
	self.ach_bigbank_3 = {
		dlc = "has_achievement",
		achievement_id = "bigbank_3",
		content = {}
	}
	self.ach_bigbank_3.content.loot_global_value = "big_bank"
	self.ach_bigbank_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "lincoln",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "clay",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "spartan",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_fg_04",
			amount = 1
		}
	}
	self.ach_bigbank_4 = {
		dlc = "has_achievement",
		achievement_id = "bigbank_4",
		content = {}
	}
	self.ach_bigbank_4.content.loot_global_value = "big_bank"
	self.ach_bigbank_4.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_fg_wood",
			amount = 1
		}
	}
	self.ach_bigbank_5 = {
		dlc = "has_achievement",
		achievement_id = "bigbank_5",
		content = {}
	}
	self.ach_bigbank_5.content.loot_global_value = "big_bank"
	self.ach_bigbank_5.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_s_01",
			amount = 1
		}
	}
	self.ach_bigbank_6 = {
		dlc = "has_achievement",
		achievement_id = "bigbank_6",
		content = {}
	}
	self.ach_bigbank_6.content.loot_global_value = "big_bank"
	self.ach_bigbank_6.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "grant",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "gemstone",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "wargod",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_s_wood",
			amount = 1
		}
	}
	self.ach_bigbank_7 = {
		dlc = "has_achievement",
		achievement_id = "bigbank_7",
		content = {}
	}
	self.ach_bigbank_7.content.loot_global_value = "big_bank"
	self.ach_bigbank_7.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_fg_01",
			amount = 1
		}
	}
	self.ach_bigbank_8 = {
		dlc = "has_achievement",
		achievement_id = "bigbank_8",
		content = {}
	}
	self.ach_bigbank_8.content.loot_global_value = "big_bank"
	self.ach_bigbank_8.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_fg_03",
			amount = 1
		}
	}
	self.ach_bigbank_10 = {
		dlc = "has_achievement",
		achievement_id = "bigbank_10",
		content = {}
	}
	self.ach_bigbank_10.content.loot_global_value = "big_bank"
	self.ach_bigbank_10.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_s_03",
			amount = 1
		}
	}
	self.skull_mask_1 = {
		dlc = "has_achievement",
		achievement_id = "death_27",
		content = {}
	}
	self.skull_mask_1.content.loot_global_value = "infamous"
	self.skull_mask_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "skullhard",
			amount = 1
		}
	}
	self.skull_mask_2 = {
		dlc = "has_achievement",
		achievement_id = "death_28",
		content = {}
	}
	self.skull_mask_2.content.loot_global_value = "infamous"
	self.skull_mask_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "skullveryhard",
			amount = 1
		}
	}
	self.skull_mask_3 = {
		dlc = "has_achievement",
		achievement_id = "death_29",
		content = {}
	}
	self.skull_mask_3.content.loot_global_value = "infamous"
	self.skull_mask_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "skulloverkill",
			amount = 1
		}
	}
	self.skull_mask_31 = {
		dlc = "has_achievement",
		achievement_id = "pick_66",
		content = {}
	}
	self.skull_mask_31.content.loot_global_value = "infamous"
	self.skull_mask_31.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "gitgud_e_wish",
			amount = 1
		}
	}
	self.skull_mask_4 = {
		dlc = "has_achievement",
		achievement_id = "death_30",
		content = {}
	}
	self.skull_mask_4.content.loot_global_value = "infamous"
	self.skull_mask_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "skulloverkillplus",
			amount = 1
		}
	}
	self.skull_mask_41 = {
		dlc = "has_achievement",
		achievement_id = "axe_66",
		content = {}
	}
	self.skull_mask_41.content.loot_global_value = "infamous"
	self.skull_mask_41.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "gitgud_sm_wish",
			amount = 1
		}
	}
	self.charliesierra = {
		content = {},
		free = true
	}
	self.charliesierra.content.loot_global_value = "normal"
	self.charliesierra.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_acog",
			amount = 1
		}
	}
	self.xmas_soundtrack = {
		content = {}
	}
	self.xmas_soundtrack.content.loot_drops = {
		{
			{
				type_items = "masks",
				item_entry = "santa_mad",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "santa_drunk",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "santa_surprise",
				amount = 1
			}
		}
	}
	self.gage_pack_jobs = {}
	self.gage_pack_jobs = {
		content = {}
	}
	self.gage_pack_jobs.content.loot_drops = {}
	self.kosugi_4 = {
		dlc = "has_achievement",
		achievement_id = "kosugi_4",
		content = {}
	}
	self.kosugi_4.content.loot_global_value = "infamous"
	self.kosugi_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "samurai",
			amount = 1
		}
	}
	self.twitch_pack = {
		content = {}
	}
	self.twitch_pack.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "twitch_orc",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "ancient",
			amount = 1
		}
	}
	self.twitch_pack2 = {
		content = {},
		dlc = "has_twitch_pack"
	}
	self.twitch_pack2.content.loot_global_value = "twitch_pack"
	self.twitch_pack2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "twitch_orc",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "ancient",
			amount = 1
		}
	}
	self.humble_pack2 = {
		content = {}
	}
	self.humble_pack2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "the_one_below",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "lycan",
			amount = 1
		}
	}
	self.humble_pack3 = {
		content = {}
	}
	self.humble_pack3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "titan",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "pokachu",
			amount = 1
		}
	}
	self.humble_pack4 = {
		content = {}
	}
	self.humble_pack4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "moon",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "borsuk",
			amount = 1
		}
	}
	self.e3_s15a = {
		content = {}
	}
	self.e3_s15a.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "card_jack",
			amount = 1
		}
	}
	self.e3_s15b = {
		content = {}
	}
	self.e3_s15b.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "card_queen",
			amount = 1
		}
	}
	self.e3_s15c = {
		content = {}
	}
	self.e3_s15c.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "card_king",
			amount = 1
		}
	}
	self.e3_s15d = {
		content = {}
	}
	self.e3_s15d.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "card_joker",
			amount = 1
		}
	}
	self.sweettooth = {
		content = {}
	}
	self.sweettooth.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "sweettooth",
			amount = 1
		}
	}
	self.hl_miami = {
		content = {}
	}
	self.hl_miami.content.loot_drops = {}
	self.hlm_game = {
		content = {}
	}
	self.hlm_game.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "rooster",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "tiger",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "panther",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "horse",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "neon",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "hatred",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "cushion",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "rug",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "uglyrug",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "hotline",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "leopard",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "shutupandbleed",
			amount = 1
		}
	}
	self.hlm_game.content.upgrades = {
		"briefcase"
	}
	self.ach_miami_2 = {
		dlc = "has_achievement",
		achievement_id = "pig_2",
		content = {}
	}
	self.ach_miami_2.content.loot_global_value = "hl_miami"
	self.ach_miami_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "owl",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "chromescape",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "palmtrees",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_uzi_fg_rail",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_uzi_s_leather",
			amount = 1
		}
	}
	self.ach_miami_3 = {
		dlc = "has_achievement",
		achievement_id = "pig_3",
		content = {}
	}
	self.ach_miami_3.content.loot_global_value = "hl_miami"
	self.ach_miami_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "white_wolf",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "rubber",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "hiptobepolygon",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_uzi_s_solid",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_g_wood",
			amount = 1
		}
	}
	self.ach_miami_4 = {
		dlc = "has_achievement",
		achievement_id = "pig_4",
		content = {}
	}
	self.ach_miami_4.content.loot_global_value = "hl_miami"
	self.ach_miami_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "rabbit",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "error",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "bsomebody",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_tec9_ns_ext",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_tec9_m_extended",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_tec9_s_unfolded",
			amount = 1
		}
	}
	self.ach_miami_5 = {
		dlc = "has_achievement",
		achievement_id = "pig_5",
		content = {}
	}
	self.ach_miami_5.content.loot_global_value = "hl_miami"
	self.ach_miami_5.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_uzi_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_uzi_s_standard",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_s_nostock",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_tec9_b_standard",
			amount = 1
		}
	}
	self.ach_miami_7 = {
		dlc = "has_achievement",
		achievement_id = "pig_7",
		content = {}
	}
	self.ach_miami_7.content.loot_global_value = "hl_miami"
	self.ach_miami_7.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "pig",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "sunset",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "doodles",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_g_ergo",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_m_extended",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_s_unfolded",
			amount = 1
		}
	}
	self.ach_eagle_1 = {
		dlc = "has_achievement",
		achievement_id = "eagle_1",
		content = {}
	}
	self.ach_eagle_1.content.loot_global_value = "gage_pack_historical"
	self.ach_eagle_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "de_gaulle",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "gunsmoke",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "dazzle",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_b_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_b_standard",
			amount = 1
		}
	}
	self.ach_eagle_2 = {
		dlc = "has_achievement",
		achievement_id = "eagle_2",
		content = {}
	}
	self.ach_eagle_2.content.loot_global_value = "gage_pack_historical"
	self.ach_eagle_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "red_hurricane",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "redsun",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "deathdealer",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_b_e11",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_c96_nozzle",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_c96_sight",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_m_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_s_folded",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_s_nostock",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_s_solid",
			amount = 1
		}
	}
	self.ach_eagle_3 = {
		dlc = "has_achievement",
		achievement_id = "eagle_3",
		content = {}
	}
	self.ach_eagle_3.content.loot_global_value = "gage_pack_historical"
	self.ach_eagle_3.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_body_black",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_c96_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_m_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_mg42_b_vg38",
			amount = 1
		}
	}
	self.ach_eagle_4 = {
		dlc = "has_achievement",
		achievement_id = "eagle_4",
		content = {}
	}
	self.ach_eagle_4.content.loot_global_value = "gage_pack_historical"
	self.ach_eagle_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "churchill",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "armygreen",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "filthythirteen",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_c96_m_extended",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_c96_s_solid",
			amount = 1
		}
	}
	self.ach_eagle_5 = {
		dlc = "has_achievement",
		achievement_id = "eagle_5",
		content = {}
	}
	self.ach_eagle_5.content.loot_global_value = "gage_pack_historical"
	self.ach_eagle_5.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "patton",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "patriot",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "captainwar",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_mg42_b_mg34",
			amount = 1
		}
	}
	self.gage_pack_historical = {
		content = {}
	}
	self.gage_pack_historical.content.loot_global_value = "gage_pack_historical"
	self.gage_pack_historical.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_ns_bayonet",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_iron_sight",
			amount = 1
		}
	}
	self.gage_pack_historical.content.upgrades = {
		"swagger"
	}

	if SystemInfo:distribution() == Idstring("STEAM") then
		self.alienware_alpha = {
			content = {}
		}
		self.alienware_alpha.content.loot_drops = {
			{
				type_items = "masks",
				item_entry = "area51",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "alien_helmet",
				amount = 1
			}
		}
		self.alienware_alpha_promo = {
			content = {}
		}
		self.alienware_alpha_promo.content.loot_drops = {}
		self.alienware_alpha_promo.content.upgrades = {
			"alien_maul"
		}
	end

	self.goty_weapon_bundle_2014 = {
		dlc = "has_goty_weapon_bundle_2014",
		content = {}
	}
	self.goty_weapon_bundle_2014.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "robo_arnold",
			amount = 1
		}
	}
	self.goty_heist_bundle_2014 = {
		dlc = "has_goty_heist_bundle_2014",
		content = {}
	}
	self.goty_heist_bundle_2014.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "nun_town",
			amount = 1
		}
	}
	self.goty_dlc_bundle_2014 = {
		dlc = "has_goty_all_dlc_bundle_2014",
		content = {}
	}
	self.goty_dlc_bundle_2014.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "arch_nemesis",
			amount = 1
		}
	}
	self.ach_deer_1 = {
		dlc = "has_achievement",
		achievement_id = "deer_1",
		content = {}
	}
	self.ach_deer_1.content.loot_global_value = "normal"
	self.ach_deer_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "mrs_claus",
			amount = 1
		}
	}
	self.ach_deer_2 = {
		dlc = "has_achievement",
		achievement_id = "deer_2",
		content = {}
	}
	self.ach_deer_2.content.loot_global_value = "normal"
	self.ach_deer_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "strinch",
			amount = 1
		}
	}
	self.ach_deer_3 = {
		dlc = "has_achievement",
		achievement_id = "deer_3",
		content = {}
	}
	self.ach_deer_3.content.loot_global_value = "normal"
	self.ach_deer_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "krampus",
			amount = 1
		}
	}
	self.ach_deer_4 = {
		dlc = "has_achievement",
		achievement_id = "deer_4",
		content = {}
	}
	self.ach_deer_4.content.loot_global_value = "normal"
	self.ach_deer_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "robo_santa",
			amount = 1
		}
	}
	self.ach_deer_6 = {
		dlc = "has_achievement",
		achievement_id = "deer_6",
		content = {}
	}
	self.ach_deer_6.content.loot_global_value = "normal"
	self.ach_deer_6.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "almirs_beard",
			amount = 1
		}
	}
	self.character_pack_clover = {
		content = {}
	}
	self.character_pack_clover.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "msk_grizel",
			amount = 1
		},
		{
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_ass_l85a2_m_emag",
				amount = 1
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_ass_l85a2_fg_short",
				amount = 1
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_ass_l85a2_g_worn",
				amount = 1
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_ass_l85a2_b_long",
				amount = 1
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_ass_l85a2_b_short",
				amount = 1
			}
		}
	}
	self.hope_diamond = {
		content = {}
	}
	self.hope_diamond.content.loot_drops = {}
	self.ach_bat_2 = {
		dlc = "has_achievement",
		achievement_id = "bat_2",
		content = {}
	}
	self.ach_bat_2.content.loot_global_value = "hope_diamond"
	self.ach_bat_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "cursed_crown",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "sand",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "hieroglyphs",
			amount = 1
		}
	}
	self.ach_bat_3 = {
		dlc = "has_achievement",
		achievement_id = "bat_3",
		content = {}
	}
	self.ach_bat_3.content.loot_global_value = "hope_diamond"
	self.ach_bat_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "medusa",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "rust",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "runes",
			amount = 1
		}
	}
	self.ach_bat_4 = {
		dlc = "has_achievement",
		achievement_id = "bat_4",
		content = {}
	}
	self.ach_bat_4.content.loot_global_value = "hope_diamond"
	self.ach_bat_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "pazuzu",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "diamond",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "horus",
			amount = 1
		}
	}
	self.ach_bat_6 = {
		dlc = "has_achievement",
		achievement_id = "bat_6",
		content = {}
	}
	self.ach_bat_6.content.loot_global_value = "hope_diamond"
	self.ach_bat_6.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "anubis",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "bandages",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "hawkhelm",
			amount = 1
		}
	}
	self.the_bomb = {
		content = {}
	}
	self.the_bomb.content.loot_drops = {}
	self.ach_cow_3 = {
		dlc = "has_achievement",
		achievement_id = "cow_3",
		content = {}
	}
	self.ach_cow_3.content.loot_global_value = "the_bomb"
	self.ach_cow_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "butcher",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "meat",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "cro_pattern_4",
			amount = 1
		}
	}
	self.ach_cow_4 = {
		dlc = "has_achievement",
		achievement_id = "cow_4",
		content = {}
	}
	self.ach_cow_4.content.loot_global_value = "the_bomb"
	self.ach_cow_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "tech_lion",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "rock_marble",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "cro_pattern_3",
			amount = 1
		}
	}
	self.ach_cow_5 = {
		dlc = "has_achievement",
		achievement_id = "cow_5",
		content = {}
	}
	self.ach_cow_5.content.loot_global_value = "the_bomb"
	self.ach_cow_5.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "doctor",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "plywood",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "cro_pattern_1",
			amount = 1
		}
	}
	self.ach_cow_8 = {
		dlc = "has_achievement",
		achievement_id = "cow_8",
		content = {}
	}
	self.ach_cow_8.content.loot_global_value = "the_bomb"
	self.ach_cow_8.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "lady_butcher",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "rhino_skin",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "cro_pattern_2",
			amount = 1
		}
	}
	self.ach_cow_9 = {
		dlc = "has_achievement",
		achievement_id = "cow_9",
		content = {}
	}
	self.ach_cow_9.content.loot_global_value = "the_bomb"
	self.ach_cow_9.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_hs2000_m_extended",
			amount = 1
		}
	}
	self.ach_cow_10 = {
		dlc = "has_achievement",
		achievement_id = "cow_10",
		content = {}
	}
	self.ach_cow_10.content.loot_global_value = "the_bomb"
	self.ach_cow_10.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_hs2000_sl_long",
			amount = 1
		}
	}
	self.ach_cow_11 = {
		dlc = "has_achievement",
		achievement_id = "cow_11",
		content = {}
	}
	self.ach_cow_11.content.loot_global_value = "the_bomb"
	self.ach_cow_11.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_hs2000_sl_custom",
			amount = 1
		}
	}
	self.akm4_pack = {
		content = {}
	}
	self.akm4_pack.content.loot_drops = {}
	self.ach_ameno_1 = {
		dlc = "has_achievement",
		achievement_id = "ameno_1",
		content = {}
	}
	self.ach_ameno_1.content.loot_global_value = "akm4_pack"
	self.ach_ameno_1.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_m4_upper_reciever_core",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_m4_lower_reciever_core",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_m16_fg_stag",
			amount = 1
		}
	}
	self.ach_ameno_2 = {
		dlc = "has_achievement",
		achievement_id = "ameno_2",
		content = {}
	}
	self.ach_ameno_2.content.loot_global_value = "akm4_pack"
	self.ach_ameno_2.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_g_rk3",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_fg_zenit",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_m4_upper_reciever_ballos",
			amount = 1
		}
	}
	self.ach_ameno_3 = {
		dlc = "has_achievement",
		achievement_id = "ameno_3",
		content = {}
	}
	self.ach_ameno_3.content.loot_global_value = "akm4_pack"
	self.ach_ameno_3.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_ak_scopemount",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ns_ass_pbs1",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "carnotaurus",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "dawn",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "dinoskull",
			amount = 1
		}
	}
	self.ach_ameno_4 = {
		dlc = "has_achievement",
		achievement_id = "ameno_4",
		content = {}
	}
	self.ach_ameno_4.content.loot_global_value = "akm4_pack"
	self.ach_ameno_4.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_ak_b_zastava",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_m_uspalm",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "triceratops",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "prehistoric",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "dinostripes",
			amount = 1
		}
	}
	self.ach_ameno_5 = {
		dlc = "has_achievement",
		achievement_id = "ameno_5",
		content = {}
	}
	self.ach_ameno_5.content.loot_global_value = "akm4_pack"
	self.ach_ameno_5.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_m4_fg_moe",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_smg_olympic_fg_lr300",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_m4_fg_lvoa",
			amount = 1
		}
	}
	self.ach_ameno_6 = {
		dlc = "has_achievement",
		achievement_id = "ameno_6",
		content = {}
	}
	self.ach_ameno_6.content.loot_global_value = "akm4_pack"
	self.ach_ameno_6.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_s_solidstock",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_m4_s_ubr",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "pachy",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "fossil",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "predator",
			amount = 1
		}
	}
	self.ach_ameno_7 = {
		dlc = "has_achievement",
		achievement_id = "ameno_7",
		content = {}
	}
	self.ach_ameno_7.content.loot_global_value = "akm4_pack"
	self.ach_ameno_7.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_m4_b_beowulf",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_m4_m_l5",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "velociraptor",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "feathers",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "dinoscars",
			amount = 1
		}
	}
	self.ach_ameno_8 = {
		dlc = "has_achievement",
		achievement_id = "ameno_8",
		content = {}
	}
	self.ach_ameno_8.content.loot_global_value = "akm4_pack"
	self.ach_ameno_8.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_fg_trax",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_fg_krebs",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_b_ak105",
			amount = 1
		}
	}
	self.butch_pack_free = {
		free = true,
		content = {}
	}
	self.butch_pack_free.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_saw_body_silent",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_saw_body_speed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_saw_m_blade_durable",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_saw_m_blade_sharp",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_aug_body_f90",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_ak5_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_mp5_m_straight",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_mp9_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_p90_b_civilian",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_p90_b_ninja",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_m14_scopemount",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_1911_g_engraved",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_beretta_g_engraved",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_fl_ass_utg",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_fl_pis_m3x",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_ns_battle",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ns_ass_filter",
			amount = 5
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ns_pis_jungle",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ns_sho_salvo_large",
			amount = 1
		}
	}
	self.character_pack_dragan = {
		content = {}
	}
	self.character_pack_dragan.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "dragan",
			amount = 1
		}
	}
	self.ach_gorilla_1 = {
		dlc = "has_achievement",
		achievement_id = "gorilla_1",
		content = {}
	}
	self.ach_gorilla_1.content.loot_global_value = "normal"
	self.ach_gorilla_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "champion_dallas",
			amount = 1
		}
	}
	self.overkill_pack = {
		content = {}
	}
	self.overkill_pack.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "the_overkill_mask",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_m134_barrel_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_m134_barrel_extreme",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_m134_body_upper_light",
			amount = 1
		}
	}
	self.hlm2 = {
		dlc = "has_hlm2",
		content = {}
	}
	self.hlm2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "jake",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "richter",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "biker",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "alex",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "corey",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "tonys_revenge",
			amount = 1
		}
	}
	self.hlm2_deluxe = {
		dlc = "has_hlm2_deluxe",
		content = {}
	}
	self.hlm2_deluxe.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "richard_returns",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_cobray_body_upper_jacket",
			amount = 1
		}
	}
	self.ach_fort_4 = {
		dlc = "has_achievement",
		achievement_id = "fort_4",
		content = {}
	}
	self.ach_fort_4.content.loot_global_value = "normal"
	self.ach_fort_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "simpson",
			amount = 1
		}
	}
	self.speedrunners = {
		content = {}
	}
	self.speedrunners.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "hothead",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "falcon",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "unic",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "speedrunner",
			amount = 1
		}
	}
	self.ach_payback_3 = {
		dlc = "has_achievement",
		achievement_id = "payback_3",
		content = {}
	}
	self.ach_payback_3.content.loot_global_value = "infamous"
	self.ach_payback_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "hectors_helmet",
			amount = 1
		}
	}
	self.bbq = {
		content = {}
	}
	self.bbq.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_gre_m32_no_stock",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_gre_m32_barrel_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_aa12_barrel_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_aa12_barrel_silenced",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_aa12_mag_drum",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_dragons_breath",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_grenade_launcher_incendiary",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_fla_mk2_mag_rare",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_fla_mk2_mag_welldone",
			amount = 1
		}
	}
	self.ach_bbq_1 = {
		dlc = "has_achievement",
		achievement_id = "grill_1",
		content = {}
	}
	self.ach_bbq_1.content.loot_global_value = "bbq"
	self.ach_bbq_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "firedemon",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "coal",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "fireborn",
			amount = 1
		}
	}
	self.ach_bbq_2 = {
		dlc = "has_achievement",
		achievement_id = "grill_2",
		content = {}
	}
	self.ach_bbq_2.content.loot_global_value = "bbq"
	self.ach_bbq_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "gasmask",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "candlelight",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "flammable",
			amount = 1
		}
	}
	self.ach_bbq_3 = {
		dlc = "has_achievement",
		achievement_id = "grill_3",
		content = {}
	}
	self.ach_bbq_3.content.loot_global_value = "bbq"
	self.ach_bbq_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "firemask",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "burn",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "flamer",
			amount = 1
		}
	}
	self.ach_bbq_4 = {
		dlc = "has_achievement",
		achievement_id = "grill_4",
		content = {}
	}
	self.ach_bbq_4.content.loot_global_value = "bbq"
	self.ach_bbq_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "chef_hat",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "toast",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "hotflames",
			amount = 1
		}
	}
	self.west = {
		content = {}
	}
	self.west.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_bow_explosion",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_winchester_o_classic",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_winchester_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_winchester_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_peacemaker_s_skeletal",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_peacemaker_g_bling",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_peacemaker_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_peacemaker_b_long",
			amount = 1
		}
	}
	self.ach_west_1 = {
		dlc = "has_achievement",
		achievement_id = "scorpion_1",
		content = {}
	}
	self.ach_west_1.content.loot_global_value = "west"
	self.ach_west_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "bullskull",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "westernsunset",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "pattern",
			amount = 1
		}
	}
	self.ach_west_2 = {
		dlc = "has_achievement",
		achievement_id = "scorpion_2",
		content = {}
	}
	self.ach_west_2.content.loot_global_value = "west"
	self.ach_west_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "bandit",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "cactus",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "coyote",
			amount = 1
		}
	}
	self.ach_west_3 = {
		dlc = "has_achievement",
		achievement_id = "scorpion_3",
		content = {}
	}
	self.ach_west_3.content.loot_global_value = "west"
	self.ach_west_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "lone",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "scorpion",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "totem",
			amount = 1
		}
	}
	self.ach_west_4 = {
		dlc = "has_achievement",
		achievement_id = "scorpion_4",
		content = {}
	}
	self.ach_west_4.content.loot_global_value = "west"
	self.ach_west_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "kangee",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "goldfever",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "native",
			amount = 1
		}
	}
	self.ach_melt_3 = {
		dlc = "has_achievement",
		achievement_id = "melt_3",
		content = {}
	}
	self.ach_melt_3.content.loot_global_value = "infamous"
	self.ach_melt_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "grendel",
			amount = 1
		}
	}
	self.arena = {
		content = {}
	}
	self.arena.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_2006m_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_2006m_b_medium",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_2006m_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_2006m_g_bling",
			amount = 1
		}
	}
	self.ach_arena_2 = {
		dlc = "has_achievement",
		achievement_id = "live_2",
		content = {}
	}
	self.ach_arena_2.content.loot_global_value = "arena"
	self.ach_arena_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "boombox",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "enlightment",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "arena_logo",
			amount = 1
		}
	}
	self.ach_arena_3 = {
		dlc = "has_achievement",
		achievement_id = "live_3",
		content = {}
	}
	self.ach_arena_3.content.loot_global_value = "arena"
	self.ach_arena_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "cantus",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "bionic",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "circle_raster",
			amount = 1
		}
	}
	self.ach_arena_4 = {
		dlc = "has_achievement",
		achievement_id = "live_4",
		content = {}
	}
	self.ach_arena_4.content.loot_global_value = "arena"
	self.ach_arena_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "concert_female",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "stained_glass",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "soundwave",
			amount = 1
		}
	}
	self.ach_arena_5 = {
		dlc = "has_achievement",
		achievement_id = "live_5",
		content = {}
	}
	self.ach_arena_5.content.loot_global_value = "arena"
	self.ach_arena_5.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "concert_male",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "dimblue",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "smoke",
			amount = 1
		}
	}
	self.character_pack_sokol = {
		content = {}
	}
	self.character_pack_sokol.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "sokol",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_asval_b_proto",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_asval_s_solid",
			amount = 1
		}
	}
	self.kenaz = {
		content = {}
	}
	self.kenaz.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_sub2000_fg_gen2",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_sub2000_fg_railed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_sub2000_fg_suppressed",
			amount = 1
		}
	}
	self.ach_kenaz_2 = {
		dlc = "has_achievement",
		achievement_id = "kenaz_2",
		content = {}
	}
	self.ach_kenaz_2.content.loot_global_value = "kenaz"
	self.ach_kenaz_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "croupier_hat",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "stars",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "chips",
			amount = 1
		}
	}
	self.ach_kenaz_3 = {
		dlc = "has_achievement",
		achievement_id = "kenaz_3",
		content = {}
	}
	self.ach_kenaz_3.content.loot_global_value = "kenaz"
	self.ach_kenaz_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "gladiator_helmet",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "casino",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "royale",
			amount = 1
		}
	}
	self.ach_kenaz_4 = {
		dlc = "has_achievement",
		achievement_id = "kenaz_4",
		content = {}
	}
	self.ach_kenaz_4.content.loot_global_value = "kenaz"
	self.ach_kenaz_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "the_king_mask",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "plush",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "cards",
			amount = 1
		}
	}
	self.ach_kenaz_5 = {
		dlc = "has_achievement",
		achievement_id = "kenaz_5",
		content = {}
	}
	self.ach_kenaz_5.content.loot_global_value = "kenaz"
	self.ach_kenaz_5.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "sports_utility_mask",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "carpet",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "dices",
			amount = 1
		}
	}
	self.turtles = {
		content = {}
	}
	self.turtles.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_bow_hunter_b_carbon",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_bow_hunter_b_skeletal",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_bow_hunter_g_camo",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_bow_hunter_g_walnut",
			amount = 1
		}
	}
	self.turtles_mods_fix = {
		dlc = "has_turtles",
		content = {}
	}
	self.turtles_mods_fix.content.loot_global_value = "turtles"
	self.turtles_mods_fix.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_wa2000_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_wa2000_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_wa2000_g_light",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_wa2000_g_stealth",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_wa2000_g_walnut",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_polymer_barrel_precision",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_polymer_ns_silencer",
			amount = 1
		}
	}
	self.turtles_free = {
		free = true,
		content = {}
	}
	self.turtles_free.content.loot_global_value = "normal"
	self.turtles_free.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_bow_poison",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_crossbow_poison",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_crossbow_explosion",
			amount = 1
		}
	}
	self.ach_turtles_1 = {
		dlc = "has_achievement",
		achievement_id = "turtles_1",
		content = {}
	}
	self.ach_turtles_1.content.loot_global_value = "turtles"
	self.ach_turtles_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "slicer",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "still_waters",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "youkai",
			amount = 1
		}
	}
	self.ach_turtles_2 = {
		dlc = "has_achievement",
		achievement_id = "turtles_2",
		content = {}
	}
	self.ach_turtles_2.content.loot_global_value = "turtles"
	self.ach_turtles_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "kage",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "sakura",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "oni",
			amount = 1
		}
	}
	self.ach_turtles_3 = {
		dlc = "has_achievement",
		achievement_id = "turtles_3",
		content = {}
	}
	self.ach_turtles_3.content.loot_global_value = "turtles"
	self.ach_turtles_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "ninja_hood",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "bamboo",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "koi",
			amount = 1
		}
	}
	self.ach_turtles_4 = {
		dlc = "has_achievement",
		achievement_id = "turtles_4",
		content = {}
	}
	self.ach_turtles_4.content.loot_global_value = "turtles"
	self.ach_turtles_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "shirai",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "origami",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "origami",
			amount = 1
		}
	}
	self.dragon = {
		content = {}
	}
	self.dragon.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_baka_b_comp",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_baka_b_longsupp",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_baka_b_midsupp",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_baka_b_smallsupp",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_baka_s_standard",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_baka_s_unfolded",
			amount = 1
		}
	}
	self.dragon_maskfix = {
		dlc = "has_dragon",
		content = {}
	}
	self.dragon_maskfix.content.loot_global_value = "dragon"
	self.dragon_maskfix.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "jiro",
			amount = 1
		}
	}
	self.steel_free = {
		free = true,
		content = {}
	}
	self.steel_free.content.loot_global_value = "normal"
	self.steel_free.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_bow_arblast_m_poison",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_bow_arblast_m_explosive",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_bow_frankish_m_poison",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_bow_frankish_m_explosive",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_bow_long_m_explosive",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_bow_long_m_poison",
			amount = 1
		}
	}
	self.ach_steel_1 = {
		dlc = "has_achievement",
		achievement_id = "steel_1",
		content = {}
	}
	self.ach_steel_1.content.loot_global_value = "steel"
	self.ach_steel_1.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "agatha_knight",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "blooded",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "agatha",
			amount = 1
		}
	}
	self.ach_steel_2 = {
		dlc = "has_achievement",
		achievement_id = "steel_2",
		content = {}
	}
	self.ach_steel_2.content.loot_global_value = "steel"
	self.ach_steel_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "agatha_vanguard_veteran",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "chain_armor",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "med_pat",
			amount = 1
		}
	}
	self.ach_steel_3 = {
		dlc = "has_achievement",
		achievement_id = "steel_3",
		content = {}
	}
	self.ach_steel_3.content.loot_global_value = "steel"
	self.ach_steel_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "mason_knight_veteran",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "scale_armor",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "mason",
			amount = 1
		}
	}
	self.ach_steel_4 = {
		dlc = "has_achievement",
		achievement_id = "steel_4",
		content = {}
	}
	self.ach_steel_4.content.loot_global_value = "steel"
	self.ach_steel_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "mason_vanguard_veteran",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "forged",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "checkered_out",
			amount = 1
		}
	}
	self.rip_free = {
		content = {},
		free = true
	}
	self.rip_free.content.loot_global_value = "infamous"
	self.rip_free.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "bodhi",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			global_value = "normal",
			item_entry = "wpn_fps_snp_model70_iron_sight",
			amount = 1
		}
	}
	self.ach_berry_2 = {
		dlc = "has_achievement",
		achievement_id = "berry_2",
		content = {}
	}
	self.ach_berry_2.content.loot_global_value = "berry"
	self.ach_berry_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "water_spirit",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "flow",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "sunavatar",
			amount = 1
		}
	}
	self.ach_berry_5 = {
		dlc = "has_achievement",
		achievement_id = "berry_5",
		content = {}
	}
	self.ach_berry_5.content.loot_global_value = "berry"
	self.ach_berry_5.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "tane",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "sancti",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "tribalface",
			amount = 1
		}
	}
	self.ach_jerry_3 = {
		dlc = "has_achievement",
		achievement_id = "jerry_3",
		content = {}
	}
	self.ach_jerry_3.content.loot_global_value = "berry"
	self.ach_jerry_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "oro",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "glade",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "tribalwave",
			amount = 1
		}
	}
	self.ach_jerry_4 = {
		dlc = "has_achievement",
		achievement_id = "jerry_4",
		content = {}
	}
	self.ach_jerry_4.content.loot_global_value = "berry"
	self.ach_jerry_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "maui",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "wade",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "ornamentalcrown",
			amount = 1
		}
	}
	self.tormentor_mask = {
		free = true,
		content = {}
	}
	self.tormentor_mask.content.loot_global_value = "normal"
	self.tormentor_mask.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "tormentor",
			amount = 1
		}
	}
	self.ach_cane_3 = {
		dlc = "has_achievement",
		achievement_id = "cane_3",
		content = {}
	}
	self.ach_cane_3.content.loot_global_value = "normal"
	self.ach_cane_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "rudeolph",
			amount = 1
		}
	}
	self.ach_cane_4 = {
		dlc = "has_achievement",
		achievement_id = "cane_4",
		content = {}
	}
	self.ach_cane_4.content.loot_global_value = "normal"
	self.ach_cane_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "greedy_the_elf",
			amount = 1
		}
	}
	self.ach_peta_2 = {
		dlc = "has_achievement",
		achievement_id = "peta_2",
		content = {}
	}
	self.ach_peta_2.content.loot_global_value = "peta"
	self.ach_peta_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "tall_goat",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "goateye",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "giraffe",
			amount = 1
		}
	}
	self.ach_peta_3 = {
		dlc = "has_achievement",
		achievement_id = "peta_3",
		content = {}
	}
	self.ach_peta_3.content.loot_global_value = "peta"
	self.ach_peta_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "goat_goat",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "flamingoeye",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "illumigoati",
			amount = 1
		}
	}
	self.ach_peta_4 = {
		dlc = "has_achievement",
		achievement_id = "peta_4",
		content = {}
	}
	self.ach_peta_4.content.loot_global_value = "peta"
	self.ach_peta_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "wet_goat",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "hay",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "goatface",
			amount = 1
		}
	}
	self.ach_peta_5 = {
		dlc = "has_achievement",
		achievement_id = "peta_5",
		content = {}
	}
	self.ach_peta_5.content.loot_global_value = "peta"
	self.ach_peta_5.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "fancy_goat",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "tongue",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "fur",
			amount = 1
		}
	}
	self.ach_pal_2 = {
		dlc = "has_achievement",
		achievement_id = "pal_2",
		content = {}
	}
	self.ach_pal_2.content.loot_global_value = "pal"
	self.ach_pal_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "horned_king",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "houndstooth",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "fenris",
			amount = 1
		}
	}
	self.ach_pal_3 = {
		dlc = "has_achievement",
		achievement_id = "pal_3",
		content = {}
	}
	self.ach_pal_3.content.loot_global_value = "pal"
	self.ach_pal_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "viking",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "day",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "kurbits",
			amount = 1
		}
	}
	self.ach_man_3 = {
		dlc = "has_achievement",
		achievement_id = "man_3",
		content = {}
	}
	self.ach_man_3.content.loot_global_value = "pal"
	self.ach_man_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "nutcracker",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "redwhite",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "luse",
			amount = 1
		}
	}
	self.ach_man_4 = {
		dlc = "has_achievement",
		achievement_id = "man_4",
		content = {}
	}
	self.ach_man_4.content.loot_global_value = "pal"
	self.ach_man_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "divided",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "mushroom_cloud",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "split",
			amount = 1
		}
	}
	self.coco = {
		content = {}
	}
	self.coco.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "jimmy_duct",
			amount = 1
		}
	}
	self.coco.free = false
	self.coco.content.loot_global_value = "coco"
	self.mad = {
		content = {},
		free = false
	}
	self.mad.content.loot_drops = {
		{
			type_items = "weapon_mods",
			global_value = "normal",
			item_entry = "wpn_fps_pis_pl14_b_comp",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			global_value = "normal",
			item_entry = "wpn_fps_pis_pl14_m_extended",
			amount = 1
		}
	}
	self.ach_mad_2 = {
		dlc = "has_achievement",
		achievement_id = "mad_2",
		content = {}
	}
	self.ach_mad_2.content.loot_global_value = "normal"
	self.ach_mad_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "mad_mask",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "nebula",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "hexagons",
			amount = 1
		}
	}
	self.ach_mad_3 = {
		dlc = "has_achievement",
		achievement_id = "mad_3",
		content = {}
	}
	self.ach_mad_3.content.loot_global_value = "normal"
	self.ach_mad_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "visor",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "planet",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "jimmy_phoenix",
			amount = 1
		}
	}
	self.ach_dark_2 = {
		dlc = "has_achievement",
		achievement_id = "dark_2",
		content = {}
	}
	self.ach_dark_2.content.loot_global_value = "normal"
	self.ach_dark_2.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "mad_goggles",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "rusty",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "rebel",
			amount = 1
		}
	}
	self.ach_dark_3 = {
		dlc = "has_achievement",
		achievement_id = "dark_3",
		content = {}
	}
	self.ach_dark_3.content.loot_global_value = "normal"
	self.ach_dark_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "half_mask",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "spaceship",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "squares",
			amount = 1
		}
	}
	self.opera = {
		content = {}
	}
	self.opera.content.loot_global_value = "opera"
	self.opera.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "sydney",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_tecci_ns_special",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_tecci_b_long",
			amount = 1
		}
	}
	self.dos = {
		free = true,
		content = {}
	}
	self.dos.content.loot_global_value = "normal"
	self.dos.content.loot_drops = {}
	self.dos.content.upgrades = {}
	self.pdcon_2015 = {
		content = {}
	}
	self.pdcon_2015.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "king_of_jesters",
			amount = 1
		}
	}
	self.bobblehead = {
		content = {}
	}
	self.bobblehead.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "bobblehead_dozer",
			amount = 1
		}
	}
	self.free_jwshades = {
		free = true,
		content = {}
	}
	self.free_jwshades.content.loot_global_value = "infamous"
	self.free_jwshades.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "jw_shades",
			amount = 1
		}
	}
	self.wild = {
		content = {}
	}
	self.wild.content.loot_global_value = "wild"
	self.wild.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "rust",
			amount = 1
		}
	}
	self.born = {
		content = {}
	}
	self.born.content.loot_drops = {}
	self.ach_born_3 = {
		dlc = "has_achievement",
		achievement_id = "born_3",
		content = {}
	}
	self.ach_born_3.content.loot_global_value = "born"
	self.ach_born_3.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "born_biker_01",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "hotrod_red",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "skull_engine",
			amount = 1
		}
	}
	self.ach_born_4 = {
		dlc = "has_achievement",
		achievement_id = "born_4",
		content = {}
	}
	self.ach_born_4.content.loot_global_value = "born"
	self.ach_born_4.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "born_biker_03",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "shiny_and_chrome",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "tire_fire",
			amount = 1
		}
	}
	self.ach_born_5 = {
		dlc = "has_achievement",
		achievement_id = "born_5",
		content = {}
	}
	self.ach_born_5.content.loot_global_value = "born"
	self.ach_born_5.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "born_biker_02",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "devil_eye",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "skull_wing",
			amount = 1
		}
	}
	self.ach_born_6 = {
		dlc = "has_achievement",
		achievement_id = "born_6",
		content = {}
	}
	self.ach_born_6.content.loot_global_value = "born"
	self.ach_born_6.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "brutal",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "chromey",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "biker_face",
			amount = 1
		}
	}
	self.pd2_clan_migg = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan_migg.content.loot_global_value = "pd2_clan"
	self.pd2_clan_migg.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "mig_death",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "mig_war",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "mig_conquest",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "mig_famine",
			amount = 1
		}
	}
	self.pd2_clan_fibb = {
		content = {},
		dlc = "has_pd2_clan"
	}
	self.pd2_clan_fibb.content.loot_global_value = "pd2_clan"
	self.pd2_clan_fibb.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "fib_fox",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "fib_cat",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "fib_mouse",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "fib_hare",
			amount = 1
		}
	}
	self.bigscore = {
		content_on_consoles = true,
		dlc = "has_bigscore",
		content = {}
	}
	self.bigscore.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "card_jack",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "card_queen",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "card_king",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "card_joker",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "king_of_jesters",
			amount = 1
		}
	}
	self.gotti_bundle = {
		content = {}
	}
	self.gotti_bundle.content.loot_global_value = "normal"
	self.gotti_bundle.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "gti_al_capone",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "gti_bugsy",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "gti_madame_st_claire",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "gti_lucky_luciano",
			amount = 1
		}
	}
	self.xone_bonus = {
		free = true,
		content = {},
		content_on_consoles = true
	}
	self.xone_bonus.content.loot_global_value = "infamous"
	self.xone_bonus.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "unforsaken",
			amount = 1
		}
	}
	self.console_kenaz = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "kenaz",
		content = {}
	}
	self.console_kenaz.content.loot_global_value = "kenaz"
	self.console_kenaz.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "croupier_hat",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "gladiator_helmet",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "the_king_mask",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "sports_utility_mask",
			amount = 1
		}
	}
	self.console_akm4_pack = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "akm4_pack",
		content = {}
	}
	self.console_akm4_pack.content.loot_global_value = "akm4_pack"
	self.console_akm4_pack.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "carnotaurus",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "triceratops",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "pachy",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "velociraptor",
			amount = 1
		}
	}
	self.console_bbq = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "bbq",
		content = {}
	}
	self.console_bbq.content.loot_global_value = "bbq"
	self.console_bbq.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "firedemon",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "gasmask",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "firemask",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "chef_hat",
			amount = 1
		}
	}
	self.console_west = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "west",
		content = {}
	}
	self.console_west.content.loot_global_value = "west"
	self.console_west.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "bandit",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "bullskull",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "kangee",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "lone",
			amount = 1
		}
	}
	self.console_arena = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "arena",
		content = {}
	}
	self.console_arena.content.loot_global_value = "arena"
	self.console_arena.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "concert_male",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "concert_female",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "boombox",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "cantus",
			amount = 1
		}
	}
	self.console_turtles = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "turtles",
		content = {}
	}
	self.console_turtles.content.loot_global_value = "turtles"
	self.console_turtles.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "slicer",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "kage",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "ninja_hood",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "shirai",
			amount = 1
		}
	}
	self.console_berry = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "berry",
		content = {}
	}
	self.console_berry.content.loot_global_value = "berry"
	self.console_berry.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "water_spirit",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "tane",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "oro",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "maui",
			amount = 1
		}
	}
	self.console_steel = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "steel",
		content = {}
	}
	self.console_steel.content.loot_global_value = "steel"
	self.console_steel.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "mason_knight_veteran",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "agatha_knight",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "agatha_vanguard_veteran",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "mason_vanguard_veteran",
			amount = 1
		}
	}
	self.console_sokol = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "character_pack_sokol",
		content = {}
	}
	self.console_sokol.content.loot_global_value = "character_pack_sokol"
	self.console_sokol.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "sokol",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "sokol_begins",
			amount = 1
		}
	}
	self.console_dragon = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "dragon",
		content = {}
	}
	self.console_dragon.content.loot_global_value = "dragon"
	self.console_dragon.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "jiro",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "jiro_begins",
			amount = 1
		}
	}
	self.console_hlm2_deluxe = {
		content_on_consoles = true,
		free = true,
		content = {}
	}
	self.console_hlm2_deluxe.content.loot_global_value = "normal"
	self.console_hlm2_deluxe.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "richard_returns",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "richard_begins",
			amount = 1
		}
	}
	self.console_bonnie = {
		content_on_consoles = true,
		free = true,
		content = {}
	}
	self.console_bonnie.content.loot_global_value = "infamous"
	self.console_bonnie.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "bonnie",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "bonnie_begins",
			amount = 1
		}
	}
	self.console_rip = {
		content_on_consoles = true,
		free = true,
		content = {}
	}
	self.console_rip.content.loot_global_value = "infamous"
	self.console_rip.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "bodhi",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "bodhi_begins",
			amount = 1
		}
	}
	self.console_crimewave = {
		content_on_consoles = true,
		dlc = "has_crimewave_edition",
		content = {}
	}
	self.console_crimewave.content.loot_global_value = "normal"
	self.console_crimewave.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "clinton",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "bush",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "obama",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "nixon",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_m45_m_extended",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_m45_g_bling",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_s552_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_s552_fg_railed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_m45_b_small",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_ppk_g_laser",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_s552_g_standard_green",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_ppk_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_m45_g_ergo",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_s552_body_standard_black",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_cmore",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_s552_s_standard_green",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_m45_b_green",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_m45_body_green",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_s552_fg_standard_green",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_m45_s_folded",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "goat",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "panda",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "pitbull",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "eagle",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_m4_g_mgrip",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_i_singlefire",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_p226_co_comp_1",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_scar_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_scar_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_scar_s_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_m4_g_hgrip",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_i_autofire",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_scar_fg_railext",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_p226_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_p226_co_comp_2",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_mp7_m_extended",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_mp7_s_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_p226_b_equinox",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_mp7_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_p226_g_ergo",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_p226_m_extended",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "cloth_commander",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "gage_blade",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "gage_rambo",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "gage_deltaforce",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_m249_fg_mk46",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_hk21_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_m249_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_rpk_s_standard",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_rpk_fg_standard",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_m249_s_solid",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_hk21_g_ergo",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_hk21_fg_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_g_hgrip",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_rage_extra",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_fg_midwest",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_fg_jp",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_m4_s_mk46",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_eotech_xps",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_reflex",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_fg_tapco",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_deagle_extra",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_fg_smr",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_cs",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_pis_ns_flash",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_g_wgrip",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_rx30",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_g_pgrip",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_shot_ns_king",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_ns_surefire",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_b_draco",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_fl_ass_laser",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_rx01",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_fl_ass_peq15",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_m4_m_quad",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ak_m_quad",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ns_pis_medium_slim",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_ns_linear",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_rmr",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ass_ns_jprifles",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_m4_s_crane",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "robberfly",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "spider",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "mantis",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "wasp",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_msr_body_msr",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_r93_body_wood",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_r93_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_leupold",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_45iron",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_m95_barrel_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_msr_ns_suppressor",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_r93_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_m95_barrel_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_m95_barrel_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_msr_b_long",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "silverback",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "mandril",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "skullmonkey",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "orangutang",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_striker_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_o_mbus_rear",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ben_s_collapsed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_piercing",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ksg_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ksg_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ben_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_explosive",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_custom",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_striker_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ben_s_solid",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_sho_ben_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_a_slug",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "galax",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "crowgoblin",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "evil",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "volt",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_fg_sar",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_s_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_g_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_fg_fab",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_famas_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_g_retro",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_fab",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_g_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_fg_railed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_s_wood",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_skeletal",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_fg_retro_plastic",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_famas_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_famas_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_famas_b_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_gre_m79_barrel_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_fg_psg",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_famas_g_retro",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_gre_m79_stock_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_light",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_fg_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_wood",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_s_plastic",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_fg_retro",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_galil_fg_mar",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_g3_b_sniper",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "churchill",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "red_hurricane",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "patton",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "de_gaulle",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_c96_m_extended",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_m_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_s_nostock",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_iron_sight",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_b_standard",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_mg42_b_mg34",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_s_solid",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_b_sniper",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_m_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_c96_s_solid",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_lmg_mg42_b_vg38",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_c96_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_body_black",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_c96_nozzle",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_s_folded",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_c96_sight",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_sterling_b_e11",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_snp_mosin_ns_bayonet",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "franklin",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "lincoln",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "grant",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "washington",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_g_01",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_fg_04",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_s_01",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_fg_wood",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_fg_03",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_s_03",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_s_wood",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_m_01",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_fal_fg_01",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "white_wolf",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "owl",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "rabbit",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "pig",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "panther",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "rooster",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "horse",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "tiger",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_s_nostock",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_m_extended",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_s_unfolded",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_uzi_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_tec9_b_standard",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_uzi_fg_rail",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_tec9_s_unfolded",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_uzi_s_solid",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_uzi_s_standard",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_b_suppressed",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_tec9_m_extended",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_g_wood",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_tec9_ns_ext",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_uzi_s_leather",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_scorpion_g_ergo",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "medusa",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "anubis",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "pazuzu",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "cursed_crown",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "msk_grizel",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "grizel_clean",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_l85a2_b_long",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_l85a2_g_worn",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_l85a2_m_emag",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_l85a2_fg_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_l85a2_b_short",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "dragan",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "dragan_begins",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_vhs_b_short",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_vhs_b_silenced",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_ass_vhs_b_sniper",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "butcher",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "doctor",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "tech_lion",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "lady_butcher",
			amount = 2
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_hs2000_sl_custom",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_hs2000_m_extended",
			amount = 1
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_pis_hs2000_sl_long",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "santa_mad",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "santa_drunk",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "santa_surprise",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "metalhead",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "tcn",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "surprise",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "optimist_prime",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "nun_town",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "robo_arnold",
			amount = 2
		},
		{
			type_items = "masks",
			item_entry = "arch_nemesis",
			amount = 2
		}
	}
	self.console_mad = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "mad",
		content = {}
	}
	self.console_mad.content.loot_global_value = "mad"
	self.console_mad.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "mad_mask",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "half_mask",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "mad_goggles",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "visor",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "nebula",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "planet",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "rusty",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "spaceship",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "hexagons",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "jimmy_phoenix",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "rebel",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "squares",
			amount = 1
		}
	}
	self.console_coco = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "coco",
		content = {}
	}
	self.console_coco.content.loot_global_value = "coco"
	self.console_coco.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "jimmy",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "jimmy_duct",
			amount = 1
		}
	}
	self.console_pal = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "pal",
		content = {}
	}
	self.console_pal.content.loot_global_value = "pal"
	self.console_pal.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "divided",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "viking",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "nutcracker",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "horned_king",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "houndstooth",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "day",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "redwhite",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "mushroom_cloud",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "fenris",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "kurbits",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "luse",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "split",
			amount = 1
		}
	}
	self.console_peta = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "peta",
		content = {}
	}
	self.console_peta.content.loot_global_value = "peta"
	self.console_peta.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "goat_goat",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "fancy_goat",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "tall_goat",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "wet_goat",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "goateye",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "flamingoeye",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "hay",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "tongue",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "giraffe",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "illumigoati",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "goatface",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "fur",
			amount = 1
		}
	}
	self.console_opera = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "opera",
		content = {}
	}
	self.console_opera.content.loot_global_value = "opera"
	self.console_opera.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "sydney",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "sydney_begins",
			amount = 1
		}
	}
	self.console_born = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "born",
		content = {}
	}
	self.console_born.content.loot_global_value = "born"
	self.console_born.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "born_biker_01",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "born_biker_02",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "born_biker_03",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "brutal",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "chromey",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "devil_eye",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "hotrod_red",
			amount = 1
		},
		{
			type_items = "materials",
			item_entry = "shiny_and_chrome",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "biker_face",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "skull_engine",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "skull_wing",
			amount = 1
		},
		{
			type_items = "textures",
			item_entry = "tire_fire",
			amount = 1
		}
	}
	self.console_wild = {
		content_on_consoles = true,
		dlc = "has_parent_dlc",
		parent_dlc = "wild",
		content = {}
	}
	self.console_wild.content.loot_global_value = "wild"
	self.console_wild.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "rust",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "rust_begins",
			amount = 1
		}
	}
	self.console_clan_migg = {
		content_on_consoles = true,
		free = true,
		content = {}
	}
	self.console_clan_migg.content.loot_global_value = "normal"
	self.console_clan_migg.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "mig_death",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "mig_war",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "mig_conquest",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "mig_famine",
			amount = 1
		}
	}
	self.console_clan_fibb = {
		content_on_consoles = true,
		free = true,
		content = {}
	}
	self.console_clan_fibb.content.loot_global_value = "normal"
	self.console_clan_fibb.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "fib_fox",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "fib_cat",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "fib_mouse",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "fib_hare",
			amount = 1
		}
	}
	self.console_gotti_bundle = {
		content_on_consoles = true,
		free = true,
		content = {}
	}
	self.console_gotti_bundle.content.loot_global_value = "normal"
	self.console_gotti_bundle.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "gti_al_capone",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "gti_bugsy",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "gti_madame_st_claire",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "gti_lucky_luciano",
			amount = 1
		}
	}
end
