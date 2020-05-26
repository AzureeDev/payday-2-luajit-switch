LootDropTweakData = LootDropTweakData or class()

function LootDropTweakData:init(tweak_data)
	self.PC_STEP = 10
	self.no_drop = {
		BASE = 35,
		HUMAN_STEP_MODIFIER = 10
	}
	self.joker_chance = 0
	self.level_limit = 1
	self.risk_pc_multiplier = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.risk_infamous_multiplier = {
		1,
		2,
		3,
		5,
		7,
		9,
		11
	}
	self.PC_CHANCE = {
		0.7,
		0.7,
		0.7,
		0.7,
		0.9,
		0.91,
		0.92,
		0.93,
		0.94,
		0.95
	}
	self.STARS = {
		{
			pcs = {
				10,
				10
			}
		},
		{
			pcs = {
				20,
				20
			}
		},
		{
			pcs = {
				30,
				30
			}
		},
		{
			pcs = {
				40,
				40
			}
		},
		{
			pcs = {
				40,
				40
			}
		},
		{
			pcs = {
				40,
				40
			}
		},
		{
			pcs = {
				40,
				40
			}
		},
		{
			pcs = {
				40,
				40
			}
		},
		{
			pcs = {
				40,
				40
			}
		},
		{
			pcs = {
				40,
				40
			}
		}
	}
	self.STARS_CURVES = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1
	}
	self.WEIGHTED_TYPE_CHANCE = {}
	local min = 10
	local max = 100
	local range = {
		cash = {
			20,
			5
		},
		weapon_mods = {
			50,
			45
		},
		colors = {
			6,
			11
		},
		textures = {
			7,
			12
		},
		materials = {
			7,
			12
		},
		masks = {
			10,
			15
		},
		xp = {
			8,
			0
		}
	}

	for i = min, max, 10 do
		local cash = math.lerp(range.cash[1], range.cash[2], i / max)
		local weapon_mods = math.lerp(range.weapon_mods[1], range.weapon_mods[2], i / max)
		local colors = math.lerp(range.colors[1], range.colors[2], i / max)
		local textures = math.lerp(range.textures[1], range.textures[2], i / max)
		local materials = math.lerp(range.materials[1], range.materials[2], i / max)
		local masks = math.lerp(range.masks[1], range.masks[2], i / max)
		local xp = math.lerp(range.xp[1], range.xp[2], i / max)
		self.WEIGHTED_TYPE_CHANCE[i] = {
			cash = cash,
			weapon_mods = weapon_mods,
			colors = colors,
			textures = textures,
			materials = materials,
			masks = masks,
			xp = xp
		}
	end

	self.DEFAULT_WEIGHT = 1
	self.got_item_weight_mod = 0.5
	self.type_weight_mod_funcs = {
		weapon_mods = function (global_value, category, id)
			local weapons = managers.weapon_factory:get_weapons_uses_part(id) or {}
			local primaries = managers.blackmarket:get_crafted_category("primaries") or {}
			local secondaries = managers.blackmarket:get_crafted_category("secondaries") or {}
			local crafted_weapons = {}

			for _, weapon in pairs(primaries) do
				table.insert(crafted_weapons, weapon.factory_id)
			end

			for _, weapon in pairs(secondaries) do
				table.insert(crafted_weapons, weapon.factory_id)
			end

			table.list_union(crafted_weapons)

			for _, factory_id in pairs(weapons) do
				if table.contains(crafted_weapons, factory_id) then
					return 2
				end
			end

			return 1
		end
	}
	local color_dlc = Color(255, 255, 212, 0) / 255
	self.global_value_category = {
		normal = {}
	}
	self.global_value_category.normal.name_id = "bm_global_value_normal"
	self.global_value_category.normal.sort_number = 0
	self.global_value_category.dlc = {
		name_id = "bm_menu_dlc",
		sort_number = 10
	}
	self.global_value_category.global_event = {
		name_id = "bm_menu_global_event",
		sort_number = 20
	}
	self.global_value_category.infamous = {
		name_id = "bm_global_value_infamous",
		sort_number = 30
	}
	self.global_value_category.collaboration = {
		name_id = "bm_global_value_collaboration",
		sort_number = 25
	}
	self.global_values = {
		normal = {}
	}
	self.global_values.normal.name_id = "bm_global_value_normal"
	self.global_values.normal.desc_id = "menu_l_global_value_normal"
	self.global_values.normal.color = Color.white
	self.global_values.normal.dlc = false
	self.global_values.normal.chance = 0.84
	self.global_values.normal.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "normal")
	self.global_values.normal.durability_multiplier = 1
	self.global_values.normal.drops = true
	self.global_values.normal.track = false
	self.global_values.normal.sort_number = 0
	self.global_values.normal.category = "normal"
	self.global_values.superior = {
		name_id = "bm_global_value_superior",
		desc_id = "menu_l_global_value_superior",
		color = Color.blue,
		dlc = false,
		chance = 0.1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "superior"),
		durability_multiplier = 1.5,
		drops = false,
		track = false,
		sort_number = 25,
		category = nil
	}
	self.global_values.exceptional = {
		name_id = "bm_global_value_exceptional",
		desc_id = "menu_l_global_value_exceptional",
		color = Color.yellow,
		dlc = false,
		chance = 0.05,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "exceptional"),
		durability_multiplier = 2.25,
		drops = false,
		track = false,
		sort_number = 26,
		category = nil
	}
	self.global_values.infamous = {
		name_id = "bm_global_value_infamous",
		desc_id = "menu_l_global_value_infamous",
		color = Color(1, 0.1, 1),
		dlc = false,
		chance = 0.05,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "infamous"),
		durability_multiplier = 3,
		drops = true,
		track = false,
		sort_number = 30,
		category = "infamous"
	}
	self.global_values.infamy = {
		name_id = "bm_global_value_infamous",
		desc_id = "menu_l_global_value_infamous",
		color = Color(1, 0.1, 1),
		dlc = false,
		chance = 0.05,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "infamous"),
		durability_multiplier = 3,
		drops = false,
		track = false,
		sort_number = 35,
		hide_unavailable = true,
		category = "infamous"
	}
	self.global_values.preorder = {
		name_id = "bm_global_value_preorder",
		desc_id = "menu_l_global_value_preorder",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		category = "dlc",
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "preorder"),
		durability_multiplier = 1,
		drops = false,
		track = true,
		sort_number = -10,
		hide_unavailable = true
	}
	self.global_values.pd2_clan = {
		name_id = "bm_global_value_pd2_clan",
		desc_id = "menu_l_global_value_pd2_clan",
		unlock_id = "bm_global_value_pd2_clan_unlock",
		color = Color(255, 59, 174, 254) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "pd2_clan"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = -100,
		unique_lock_icon = "guis/textures/pd2/lock_community"
	}
	self.global_values.poetry_soundtrack = {
		name_id = "bm_global_value_poetry_soundtrack",
		desc_id = "menu_l_global_value_poetry_soundtrack",
		unlock_id = "bm_global_value_poetry_soundtrack_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		category = "dlc",
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "poetry_sountrack"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 40,
		hide_unavailable = false
	}
	self.global_values.halloween = {
		name_id = "bm_global_value_halloween",
		desc_id = "menu_l_global_value_halloween",
		color = Color(255, 255, 145, 0) / 255,
		dlc = false,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "halloween"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 50,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.xmas = {
		name_id = "bm_global_value_xmas",
		desc_id = "menu_l_global_value_xmas",
		color = Color(255, 247, 86, 105) / 255,
		dlc = false,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "xmas"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 60,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.twitch_pack = {
		name_id = "bm_global_value_twitch_pack",
		desc_id = "menu_l_global_value_twitch_pack",
		unlock_id = "bm_global_value_twitch_pack_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "twitch_pack"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 70,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.humble_pack2 = {
		name_id = "bm_global_value_humble_pack2",
		desc_id = "menu_l_global_value_humble_pack2",
		unlock_id = "bm_global_value_humble_pack2_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "humble_pack2"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 71,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.alienware_alpha = {
		name_id = "bm_global_value_alienware_alpha",
		desc_id = "menu_l_global_value_alienware_alpha",
		unlock_id = "bm_global_value_alienware_alpha_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "alienware_alpha"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 72,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.alienware_alpha_promo = {
		name_id = "bm_global_value_alienware_alpha_promo",
		desc_id = "menu_l_global_value_alienware_alpha_promo",
		unlock_id = "bm_global_value_alienware_alpha_promo_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "alienware_alpha_promo"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 73,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.humble_pack3 = {
		name_id = "bm_global_value_humble_pack3",
		desc_id = "menu_l_global_value_humble_pack3",
		unlock_id = "bm_global_value_humble_pack3_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "humble_pack3"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 74,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.humble_pack4 = {
		name_id = "bm_global_value_humble_pack4",
		desc_id = "menu_l_global_value_humble_pack4",
		unlock_id = "bm_global_value_humble_pack4_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "humble_pack4"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 75,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.e3_s15a = {
		name_id = "bm_global_value_e3_s15a",
		desc_id = "menu_l_global_value_e3_s15a",
		unlock_id = "bm_global_value_e3_s15a_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "e3_s15a"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 76,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.e3_s15b = {
		name_id = "bm_global_value_e3_s15b",
		desc_id = "menu_l_global_value_e3_s15b",
		unlock_id = "bm_global_value_e3_s15b_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "e3_s15b"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 77,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.e3_s15c = {
		name_id = "bm_global_value_e3_s15c",
		desc_id = "menu_l_global_value_e3_s15c",
		unlock_id = "bm_global_value_e3_s15c_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "e3_s15c"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 78,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.e3_s15d = {
		name_id = "bm_global_value_e3_s15d",
		desc_id = "menu_l_global_value_e3_s15d",
		unlock_id = "bm_global_value_e3_s15d_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "e3_s15d"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 79,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.bobblehead = {
		name_id = "bm_global_value_bobblehead",
		desc_id = "menu_l_global_value_bobblehead",
		unlock_id = "bm_global_value_bobblehead_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "bobblehead"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 80,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.pdcon_2015 = {
		name_id = "bm_global_value_pdcon_2015",
		desc_id = "menu_l_global_value_pdcon_2015",
		unlock_id = "bm_global_value_pdcon_2015_unlock",
		color = Color(255, 255, 145, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "pdcon_2015"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 81,
		hide_unavailable = true,
		category = "global_event"
	}
	self.global_values.xmas_soundtrack = {
		name_id = "bm_global_value_xmas_soundtrack",
		desc_id = "menu_l_global_value_xmas_soundtrack",
		unlock_id = "bm_global_value_xmas_soundtrack_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "xmas_soundtrack"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 60,
		hide_unavailable = false,
		category = "dlc"
	}
	self.global_values.armored_transport = {
		name_id = "bm_global_value_armored_transport",
		desc_id = "menu_l_global_value_armored_transport",
		unlock_id = "bm_global_value_armored_transport_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "armored_transport"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 70,
		category = "dlc"
	}
	self.global_values.gage_pack = {
		name_id = "bm_global_value_gage_pack",
		desc_id = "menu_l_global_value_gage_pack",
		unlock_id = "bm_global_value_gage_pack_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 80,
		category = "dlc"
	}
	self.global_values.gage_pack_lmg = {
		name_id = "bm_global_value_gage_pack_lmg",
		desc_id = "menu_l_global_value_gage_pack_lmg",
		unlock_id = "bm_global_value_gage_pack_lmg_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_lmg"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 81,
		category = "dlc"
	}
	self.global_values.gage_pack_jobs = {
		name_id = "bm_global_value_gage_pack_jobs",
		desc_id = "menu_l_global_value_gage_pack_jobs",
		unlock_id = "bm_global_value_gage_pack_jobs_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_jobs"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 82,
		category = "dlc"
	}
	self.global_values.gage_pack_snp = {
		name_id = "bm_global_value_gage_pack_snp",
		desc_id = "menu_l_global_value_gage_pack_snp",
		unlock_id = "bm_global_value_gage_pack_snp_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_snp"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 83,
		category = "dlc"
	}
	self.global_values.big_bank = {
		name_id = "bm_global_value_big_bank_snp",
		desc_id = "menu_l_global_value_big_bank_snp",
		unlock_id = "bm_global_value_big_bank_snp_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "big_bank"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 84,
		category = "dlc"
	}
	self.global_values.gage_pack_shotgun = {
		name_id = "bm_global_value_gage_pack_shotgun",
		desc_id = "menu_l_global_value_gage_pack_shotgun",
		unlock_id = "bm_global_value_gage_pack_shotgun_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_shotgun"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 85,
		category = "dlc"
	}
	self.global_values.gage_pack_assault = {
		name_id = "bm_global_value_gage_pack_assault",
		desc_id = "menu_l_global_value_gage_pack_assault",
		unlock_id = "bm_global_value_gage_pack_assault_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_assault"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 86,
		category = "dlc"
	}
	self.global_values.hl_miami = {
		name_id = "bm_global_value_hl_miami",
		desc_id = "menu_l_global_value_hl_miami",
		unlock_id = "bm_global_value_hl_miami_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hl_miami"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 87,
		category = "dlc"
	}
	self.global_values.hlm_game = {
		name_id = "bm_global_value_hlm_game",
		desc_id = "menu_l_global_value_hlm_game",
		unlock_id = "bm_global_value_hlm_game_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hlm_game"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 88,
		unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock",
		category = "collaboration"
	}
	self.global_values.hlm2 = {
		name_id = "bm_global_value_hlm2",
		desc_id = "menu_l_global_value_hlm2",
		unlock_id = "bm_global_value_hlm2_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hlm2"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 89,
		unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock",
		category = "collaboration"
	}
	self.global_values.hlm2_deluxe = {
		name_id = "bm_global_value_hlm2_deluxe",
		desc_id = "menu_l_global_value_hlm2_deluxe",
		unlock_id = "bm_global_value_hlm2_deluxe_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hlm2_deluxe"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 90,
		unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock",
		category = "collaboration"
	}
	self.global_values.speedrunners = {
		name_id = "bm_global_value_speedrunners",
		desc_id = "menu_l_global_value_speedrunners",
		unlock_id = "bm_global_value_speedrunners_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "speedrunners"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 91,
		unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock",
		category = "collaboration"
	}
	self.global_values.gage_pack_historical = {
		name_id = "bm_global_value_gage_pack_historical",
		desc_id = "menu_l_global_value_gage_pack_historical",
		unlock_id = "bm_global_value_gage_pack_historical_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_historical"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 89,
		category = "dlc"
	}
	self.global_values.character_pack_clover = {
		name_id = "bm_global_value_character_pack_clover",
		desc_id = "menu_l_global_value_character_pack_clover",
		unlock_id = "bm_global_value_character_pack_clover_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "character_pack_clover"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 90,
		category = "dlc"
	}
	self.global_values.hope_diamond = {
		name_id = "bm_global_value_hope_diamond",
		desc_id = "menu_l_global_value_hope_diamond",
		unlock_id = "bm_global_value_hope_diamond_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hope_diamond"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 91,
		category = "dlc"
	}
	self.global_values.goty_weapon_bundle_2014 = {
		name_id = "bm_global_value_goty_weapon_bundle_2014",
		desc_id = "menu_l_global_value_goty_weapon_bundle_2014",
		unlock_id = "bm_global_value_goty_weapon_bundle_2014_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "goty_weapon_bundle_2014"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 92,
		category = "dlc"
	}
	self.global_values.goty_heist_bundle_2014 = {
		name_id = "bm_global_value_goty_heist_bundle_2014",
		desc_id = "menu_l_global_value_goty_heist_bundle_2014",
		unlock_id = "bm_global_value_goty_heist_bundle_2014_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "goty_heist_bundle_2014"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 93,
		category = "dlc"
	}
	self.global_values.goty_dlc_bundle_2014 = {
		name_id = "bm_global_value_goty_dlc_bundle_2014",
		desc_id = "menu_l_global_value_goty_dlc_bundle_2014",
		unlock_id = "bm_global_value_goty_dlc_bundle_2014_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "goty_dlc_bundle_2014"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 94,
		category = "dlc"
	}
	self.global_values.character_pack_dragan = {
		name_id = "bm_global_value_character_pack_dragan",
		desc_id = "menu_l_global_value_character_pack_dragan",
		unlock_id = "bm_global_value_character_pack_dragan_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "character_pack_dragan"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 95,
		category = "dlc"
	}
	self.global_values.the_bomb = {
		name_id = "bm_global_value_the_bomb",
		desc_id = "menu_l_global_value_the_bomb",
		unlock_id = "bm_global_value_the_bomb_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "the_bomb"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 96,
		category = "dlc"
	}
	self.global_values.akm4_pack = {
		name_id = "bm_global_value_akm4_pack",
		desc_id = "menu_l_global_value_akm4_pack",
		unlock_id = "bm_global_value_akm4_pack_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "akm4_pack"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 97,
		category = "dlc"
	}
	self.global_values.overkill_pack = {
		name_id = "bm_global_value_overkill_pack",
		desc_id = "menu_l_global_value_overkill_pack",
		unlock_id = "bm_global_value_overkill_pack_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "overkill_pack"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 98,
		category = "dlc"
	}
	self.global_values.complete_overkill_pack = {
		name_id = "bm_global_value_complete_overkill_pack",
		desc_id = "menu_l_global_value_complete_overkill_pack",
		unlock_id = "bm_global_value_complete_overkill_pack_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "complete_overkill_pack"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 99,
		category = "dlc"
	}
	self.global_values.butch_pack_free = {
		name_id = "bm_global_value_butch_pack_free",
		desc_id = "menu_l_global_value_butch_pack_free",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "butch_pack_free"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 100,
		category = "dlc"
	}
	self.global_values.bbq = {
		name_id = "bm_global_value_bbq",
		desc_id = "menu_l_global_value_bbq",
		unlock_id = "bm_global_value_bbq_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "bbq"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 101,
		category = "dlc"
	}
	self.global_values.west = {
		name_id = "bm_global_value_west",
		desc_id = "menu_l_global_value_west",
		unlock_id = "bm_global_value_west_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "west"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 102,
		category = "dlc"
	}
	self.global_values.arena = {
		name_id = "bm_global_value_arena",
		desc_id = "menu_l_global_value_arena",
		unlock_id = "bm_global_value_arena_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "arena"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 103,
		category = "dlc"
	}
	self.global_values.character_pack_sokol = {
		name_id = "bm_global_value_character_pack_sokol",
		desc_id = "menu_l_global_value_character_pack_sokol",
		unlock_id = "bm_global_value_character_pack_sokol_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "character_pack_sokol"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 104,
		category = "dlc"
	}
	self.global_values.kenaz = {
		name_id = "bm_global_value_kenaz",
		desc_id = "menu_l_global_value_kenaz",
		unlock_id = "bm_global_value_kenaz_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "kenaz"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 105,
		category = "dlc"
	}
	self.global_values.turtles = {
		name_id = "bm_global_value_turtles",
		desc_id = "menu_l_global_value_turtles",
		unlock_id = "bm_global_value_turtles_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "turtles"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 106,
		category = "dlc"
	}
	self.global_values.dragon = {
		name_id = "bm_global_value_dragon",
		desc_id = "menu_l_global_value_dragon",
		unlock_id = "bm_global_value_dragon_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "dragon"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 107,
		category = "dlc"
	}
	self.global_values.steel = {
		name_id = "bm_global_value_steel",
		desc_id = "menu_l_global_value_steel",
		unlock_id = "bm_global_value_steel_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "steel"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 108,
		category = "dlc"
	}
	self.global_values.berry = {
		name_id = "bm_global_value_berry",
		desc_id = "menu_l_global_value_berry",
		unlock_id = "bm_global_value_berry_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "berry"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 109,
		category = "dlc"
	}
	self.global_values.peta = {
		name_id = "bm_global_value_peta",
		desc_id = "menu_l_global_value_peta",
		unlock_id = "bm_global_value_peta_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "peta"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 110,
		category = "dlc"
	}
	self.global_values.pal = {
		name_id = "bm_global_value_pal",
		desc_id = "menu_l_global_value_pal",
		unlock_id = "bm_global_value_pal_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "pal"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 111,
		category = "dlc"
	}
	self.global_values.coco = {
		unlock_id = "bm_global_value_coco_unlock",
		name_id = "bm_global_value_coco",
		desc_id = "menu_l_global_value_coco",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		category = "dlc",
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "coco"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 113
	}
	self.global_values.mad = {
		name_id = "bm_global_value_mad",
		desc_id = "menu_l_global_value_mad",
		unlock_id = "bm_global_value_mad_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = 1,
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 114,
		category = "dlc"
	}
	self.global_values.opera = {
		name_id = "bm_global_value_opera",
		desc_id = "menu_l_global_value_opera",
		unlock_id = "bm_global_value_opera_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = 1,
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 116,
		category = "dlc"
	}
	self.global_values.wild = {
		name_id = "bm_global_value_wild",
		desc_id = "menu_l_global_value_wild",
		unlock_id = "bm_global_value_wild_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = 1,
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 117,
		category = "dlc"
	}
	self.global_values.born = {
		name_id = "bm_global_value_born",
		desc_id = "menu_l_global_value_born",
		unlock_id = "bm_global_value_born_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = 1,
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 118,
		category = "dlc"
	}
	self.global_values.legendary = {
		name_id = "bm_global_value_legendary",
		desc_id = "menu_l_global_value_legendary",
		color = Color(255, 0, 255, 212) / 255,
		dlc = false,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "legendary"),
		durability_multiplier = 1,
		drops = false,
		track = false,
		sort_number = 201,
		category = nil
	}
	self.global_values.bigscore = {
		name_id = "bm_global_value_bigscore",
		desc_id = "menu_l_global_value_bigscore",
		unlock_id = "bm_global_value_bigscore_unlock",
		color = Color(255, 255, 212, 0) / 255,
		dlc = true,
		chance = 1,
		value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "bigscore"),
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 300,
		category = "dlc"
	}
	self.global_values.joy = {
		name_id = "bm_global_value_joy",
		desc_id = "menu_l_global_value_joy",
		unlock_id = "bm_global_value_joy_unlock",
		color = color_dlc,
		dlc = true,
		category = "dlc",
		chance = 1,
		value_multiplier = 1,
		durability_multiplier = 1,
		drops = true,
		track = true,
		sort_number = 300
	}

	if SystemInfo:platform() == Idstring("PS3") then
		self.global_values.sweettooth = {
			name_id = "bm_global_value_sweettooth",
			desc_id = "menu_l_global_value_sweettooth",
			unlock_id = "bm_global_value_sweettooth_unlock",
			color = Color(255, 59, 174, 254) / 255,
			dlc = true,
			chance = 1,
			value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "sweettooth"),
			durability_multiplier = 1,
			drops = true,
			track = true,
			sort_number = 200,
			category = nil
		}
	end

	self.global_value_list_index = {
		"normal",
		"infamous",
		"preorder",
		"pd2_clan",
		"halloween",
		"xmas",
		"armored_transport",
		"gage_pack",
		"gage_pack_lmg",
		"gage_pack_jobs",
		"gage_pack_snp",
		"poetry_soundtrack",
		"big_bank",
		"gage_pack_shotgun",
		"gage_pack_assault",
		"hl_miami",
		"hlm_game",
		"gage_pack_historical",
		"character_pack_clover",
		"character_pack_dragan",
		"hlm2_deluxe",
		"butch_pack_free",
		"bbq",
		"west",
		"arena",
		"character_pack_sokol",
		"kenaz",
		"turtles",
		"dragon",
		"steel",
		"berry",
		"peta",
		"pal",
		"coco",
		"opera",
		"wild",
		"born",
		"joy"
	}

	self:_create_global_value_list_map()
end

function LootDropTweakData:_create_global_value_list_map()
	self.global_value_list_map = {}

	for i, d in ipairs(self.global_value_list_index) do
		self.global_value_list_map[d] = i
	end
end
