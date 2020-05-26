BlackMarketTweakData = BlackMarketTweakData or class()

require("lib/tweak_data/blackmarket/ColorsTweakData")
require("lib/tweak_data/blackmarket/MaterialsTweakData")
require("lib/tweak_data/blackmarket/TexturesTweakData")
require("lib/tweak_data/blackmarket/MasksTweakData")
require("lib/tweak_data/blackmarket/ProjectilesTweakData")
require("lib/tweak_data/blackmarket/MeleeWeaponsTweakData")
require("lib/tweak_data/blackmarket/WeaponSkinsTweakData")

local is_nextgen_console = SystemInfo:platform() == Idstring("PS4") or SystemInfo:platform() == Idstring("XB1") or SystemInfo:platform() == Idstring("NX64")

function BlackMarketTweakData:init(tweak_data)
	self:_init_colors(tweak_data)
	self:_init_materials(tweak_data)
	self:_init_textures(tweak_data)
	self:_init_masks(tweak_data)
	self:_init_characters(tweak_data)
	self:_init_cash()
	self:_init_xp()
	self:_init_armors()
	self:_init_deployables(tweak_data)
	self:_init_bullets(tweak_data)
	self:_init_projectiles(tweak_data)
	self:_init_melee_weapons(tweak_data)
	self:_init_weapon_skins()
	self:_init_weapon_mods(tweak_data)
end

function BlackMarketTweakData:print_missing_strings(skip_print_id)
end

function BlackMarketTweakData:_add_desc_from_name_macro(tweak_data)
	for id, data in pairs(tweak_data) do
		if data.name_id and not data.desc_id then
			data.desc_id = tostring(data.name_id) .. "_desc"
		end

		if not data.name_id then
			-- Nothing
		end
	end
end

function BlackMarketTweakData:_init_weapon_mods(tweak_data)
	if self.weapon_skins then
		tweak_data.weapon.factory:create_bonuses(tweak_data, self.weapon_skins)
	end

	self.weapon_mods = {}

	for id, data in pairs(tweak_data.weapon.factory.parts) do
		if is_nextgen_console then
			data.is_a_unlockable = nil
		end

		self.weapon_mods[id] = {
			max_in_inventory = data.is_a_unlockable and 1 or 2,
			pc = data.pc,
			pcs = data.pcs,
			dlc = data.dlc,
			dlcs = data.dlcs,
			name_id = data.name_id,
			desc_id = data.desc_id,
			infamous = data.infamous,
			value = data.stats and data.stats.value or 1,
			weight = data.weight,
			texture_bundle_folder = data.texture_bundle_folder,
			is_a_unlockable = data.is_a_unlockable,
			unatainable = data.unatainable,
			inaccessible = data.inaccessible
		}
	end

	self:_add_desc_from_name_macro(self.weapon_mods)
end

function BlackMarketTweakData:_init_characters(tweak_data)
	self.characters = {
		locked = {}
	}
	self.characters.locked.fps_unit = "units/payday2/characters/fps_mover/fps_mover"
	self.characters.locked.npc_unit = "units/payday2/characters/npc_criminals_suit_1/npc_criminals_suit_1"
	self.characters.locked.menu_unit = "units/payday2/characters/npc_criminals_suit_1/npc_criminals_suit_1_menu"
	self.characters.locked.sequence = "var_material_01"
	self.characters.locked.name_id = "bm_character_locked"
	self.characters.locked.dallas = {
		sequence = "var_mtr_dallas",
		installed = true
	}
	self.characters.locked.wolf = {
		sequence = "var_mtr_wolf",
		installed = true
	}
	self.characters.locked.hoxton = {
		sequence = "var_mtr_hoxton",
		installed = true
	}
	self.characters.locked.chains = {
		sequence = "var_mtr_chains",
		installed = true
	}
	self.characters.locked.jowi = {
		sequence = "var_mtr_john_wick",
		dlc = "pd2_clan"
	}
	self.characters.locked.old_hoxton = {
		sequence = "var_mtr_old_hoxton",
		dlc = "freed_old_hoxton",
		locks = {
			dlc = "pd2_clan",
			achievement = "bulldog_1"
		}
	}
	self.characters.locked.dragan = {
		dlc = "character_pack_dragan",
		texture_bundle_folder = "character_pack_dragan",
		sequence = "var_mtr_dragan"
	}
	self.characters.locked.jacket = {
		dlc = "hlm2_deluxe",
		texture_bundle_folder = "hlm2",
		sequence = "var_mtr_jacket"
	}
	self.characters.locked.sokol = {
		texture_bundle_folder = "character_pack_sokol",
		dlc = "character_pack_sokol",
		mask_on_sequence = "mask_on_sokol",
		mask_off_sequence = "mask_off_sokol",
		sequence = "var_mtr_sokol"
	}
	self.characters.locked.dragon = {
		dlc = "dragon",
		texture_bundle_folder = "dragon",
		sequence = "var_mtr_jiro"
	}
	self.characters.locked.bodhi = {
		sequence = "var_mtr_bodhi",
		texture_bundle_folder = "rip"
	}
	self.characters.locked.jimmy = {
		texture_bundle_folder = "coco",
		dlc = "coco",
		mask_on_sequence = "mask_on_jimmy",
		mask_off_sequence = "mask_off_jimmy",
		sequence = "var_mtr_jimmy"
	}
	self.characters.female_1 = {
		fps_unit = "units/payday2/characters/fps_mover/fps_female_1_mover",
		npc_unit = "units/payday2/characters/npc_criminal_female_1/npc_criminal_female_1",
		menu_unit = "units/payday2/characters/npc_criminal_female_1/npc_criminal_female_1_menu",
		texture_bundle_folder = "character_pack_clover",
		sequence = "var_mtr_fem1",
		mask_on_sequence = "mask_on",
		mask_off_sequence = "mask_off",
		dlc = "character_pack_clover"
	}
	self.characters.bonnie = {
		fps_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/fps_bonnie_mover",
		npc_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/npc_criminal_bonnie",
		menu_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/npc_criminal_bonnie_menu",
		texture_bundle_folder = "character_pack_bonnie",
		sequence = "var_mtr_bonnie",
		mask_on_sequence = "bonnie_mask_on",
		mask_off_sequence = "bonnie_mask_off",
		dlc = "pd2_clan"
	}
	self.characters.ai_hoxton = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/hoxton/npc_criminal_suit_hoxton",
		sequence = "var_mtr_hoxton"
	}
	self.characters.ai_chains = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/chains/npc_criminal_suit_chains",
		sequence = "var_mtr_chains"
	}
	self.characters.ai_dallas = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/dallas/npc_criminal_suit_dallas",
		sequence = "var_mtr_dallas"
	}
	self.characters.ai_wolf = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/wolf/npc_criminal_suit_wolf",
		sequence = "var_mtr_wolf"
	}
	self.characters.ai_jowi = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/jowi/npc_criminal_suit_jowi",
		sequence = "var_mtr_john_wick"
	}
	self.characters.ai_old_hoxton = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/old_hoxton/npc_criminal_suit_old_hoxton",
		sequence = "var_mtr_old_hoxton"
	}
	self.characters.ai_female_1 = {
		npc_unit = "units/payday2/characters/npc_criminal_female_1/fem1/npc_criminal_female_fem1",
		sequence = "var_mtr_fem1",
		mask_on_sequence = "mask_on",
		mask_off_sequence = "mask_off"
	}
	self.characters.ai_dragan = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/dragan/npc_criminal_suit_dragan",
		sequence = "var_mtr_dragan"
	}
	self.characters.ai_jacket = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/jacket/npc_criminal_suit_jacket",
		sequence = "var_mtr_jacket"
	}
	self.characters.ai_bonnie = {
		npc_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/fem1/npc_criminal_female_bonnie_1",
		sequence = "var_mtr_bonnie",
		mask_on_sequence = "bonnie_mask_on",
		mask_off_sequence = "bonnie_mask_off"
	}
	self.characters.ai_sokol = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/sokol/npc_criminal_suit_sokol",
		sequence = "var_mtr_sokol",
		mask_on_sequence = "mask_on_sokol",
		mask_off_sequence = "mask_off_sokol"
	}
	self.characters.ai_dragon = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/dragon/npc_criminal_suit_dragon",
		sequence = "var_mtr_jiro"
	}
	self.characters.ai_bodhi = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/bodhi/npc_criminal_suit_bodhi",
		sequence = "var_mtr_bodhi"
	}
	self.characters.ai_jimmy = {
		npc_unit = "units/payday2/characters/npc_criminals_suit_1/jimmy/npc_criminal_suit_jimmy",
		sequence = "var_mtr_jimmy"
	}
	self.characters.sydney = {
		fps_unit = "units/pd2_dlc_opera/characters/npc_criminals_fem_3/fps_sydney_mover",
		npc_unit = "units/pd2_dlc_opera/characters/npc_criminals_fem_3/npc_criminal_sydney",
		menu_unit = "units/pd2_dlc_opera/characters/npc_criminals_fem_3/npc_criminal_sydney_menu",
		texture_bundle_folder = "opera",
		sequence = "var_mtr_sydney",
		mask_on_sequence = "mask_on",
		mask_off_sequence = "mask_off",
		dlc = "opera"
	}
	self.characters.ai_sydney = {
		npc_unit = "units/pd2_dlc_opera/characters/npc_criminals_fem_3/fem3/npc_criminal_female_3",
		sequence = "var_mtr_sydney",
		mask_on_sequence = "mask_on",
		mask_off_sequence = "mask_off"
	}
	self.characters.wild = {
		fps_unit = "units/pd2_dlc_wild/characters/npc_criminals_wild_1/fps_wild_mover",
		npc_unit = "units/pd2_dlc_wild/characters/npc_criminals_wild_1/npc_criminal_wild_1",
		menu_unit = "units/pd2_dlc_wild/characters/npc_criminals_wild_1/npc_criminal_wild_1_menu",
		texture_bundle_folder = "wild",
		sequence = "var_mtr_wild",
		dlc = "wild"
	}
	self.characters.ai_wild = {
		npc_unit = "units/pd2_dlc_wild/characters/npc_criminals_wild_1/wild_1/npc_criminal_wild_1",
		sequence = "var_mtr_wild"
	}
	self.characters.joy = {
		fps_unit = "units/pd2_dlc_joy/characters/npc_criminals_joy_1/fps_joy_mover",
		npc_unit = "units/pd2_dlc_joy/characters/npc_criminals_joy_1/npc_criminal_joy_1",
		menu_unit = "units/pd2_dlc_joy/characters/npc_criminals_joy_1/npc_criminal_joy_1_menu",
		texture_bundle_folder = "joy",
		sequence = "var_mtr_joy",
		mask_on_sequence = "mask_on_joy",
		mask_off_sequence = "mask_off_joy"
	}
	self.characters.ai_joy = {
		npc_unit = "units/pd2_dlc_joy/characters/npc_criminals_joy_1/joy_1/npc_criminal_joy_1",
		sequence = "var_mtr_joy",
		mask_on_sequence = "mask_on_joy",
		mask_off_sequence = "mask_off_joy"
	}
	local free_dlcs = tweak_data:free_dlc_list()

	for _, data in pairs(self.characters) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end

	for _, data in pairs(self.characters.locked) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end
end

function BlackMarketTweakData:_init_cash()
	self.cash = {
		cash10 = {}
	}
	self.cash.cash10.name_id = "bm_csh_cash10"
	self.cash.cash10.value_id = "cash10"
	self.cash.cash10.multiplier = 1
	self.cash.cash10.pcs = {
		10,
		40
	}
	self.cash.cash20 = {
		name_id = "bm_csh_cash20",
		value_id = "cash20",
		multiplier = 1,
		pcs = {
			20,
			40
		}
	}
	self.cash.cash30 = {
		name_id = "bm_csh_cash30",
		multiplier = 1,
		value_id = "cash30",
		pcs = {
			30,
			40
		}
	}
	self.cash.cash40 = {
		name_id = "bm_csh_cash40",
		multiplier = 1,
		value_id = "cash40",
		pcs = {
			20,
			30,
			40
		}
	}
	self.cash.cash50 = {
		name_id = "bm_csh_cash50",
		multiplier = 1,
		value_id = "cash50",
		pcs = {
			30,
			40,
			50
		}
	}
	self.cash.cash60 = {
		name_id = "bm_csh_cash60",
		value_id = "cash60",
		multiplier = 1,
		pcs = {
			40,
			50,
			60
		}
	}
	self.cash.cash70 = {
		name_id = "bm_csh_cash70",
		value_id = "cash70",
		multiplier = 1,
		pcs = {
			50,
			60,
			70
		}
	}
	self.cash.cash80 = {
		name_id = "bm_csh_cash80",
		value_id = "cash80",
		multiplier = 1,
		pcs = {
			60,
			70,
			80
		}
	}
	self.cash.cash90 = {
		name_id = "bm_csh_cash90",
		value_id = "cash90",
		multiplier = 1,
		pcs = {
			70,
			80,
			90
		}
	}
	self.cash.cash100 = {
		name_id = "bm_csh_cash100",
		value_id = "cash100",
		multiplier = 1,
		pcs = {
			80,
			90,
			100
		}
	}
	self.cash.cash_preorder = {
		name_id = "bm_csh_cash_preorder",
		value_id = "cash_preorder",
		multiplier = 1.2,
		dlc = "preorder"
	}

	if is_nextgen_console then
		self.cash.xone_bonus = {
			name_id = "bm_csh_cash_xone",
			value_id = "xone_bonus",
			multiplier = 1
		}
	end
end

function BlackMarketTweakData:_init_xp()
	self.xp = {
		xp10 = {}
	}
	self.xp.xp10.name_id = "bm_exp_xp10"
	self.xp.xp10.value_id = "xp10"
	self.xp.xp10.multiplier = 1
	self.xp.xp10.pcs = {
		10,
		40
	}
	self.xp.xp20 = {
		name_id = "bm_exp_xp20",
		value_id = "xp20",
		multiplier = 1,
		pcs = {
			20,
			40
		}
	}
	self.xp.xp30 = {
		name_id = "bm_exp_xp30",
		multiplier = 1,
		value_id = "xp30",
		pcs = {
			30,
			40
		}
	}
	self.xp.xp40 = {
		name_id = "bm_exp_xp40",
		multiplier = 1,
		value_id = "xp40",
		pcs = {
			20,
			30,
			40
		}
	}
	self.xp.xp50 = {
		name_id = "bm_exp_xp50",
		multiplier = 1,
		value_id = "xp50",
		pcs = {
			30,
			40,
			50
		}
	}
	self.xp.xp60 = {
		name_id = "bm_exp_xp60",
		value_id = "xp60",
		multiplier = 1,
		pcs = {
			40,
			50,
			60
		}
	}
	self.xp.xp70 = {
		name_id = "bm_exp_xp70",
		value_id = "xp70",
		multiplier = 1,
		pcs = {
			50,
			60,
			70
		}
	}
	self.xp.xp80 = {
		name_id = "bm_exp_xp80",
		value_id = "xp80",
		multiplier = 1,
		pcs = {
			60,
			70,
			80
		}
	}
	self.xp.xp90 = {
		name_id = "bm_exp_xp90",
		value_id = "xp90",
		multiplier = 1,
		pcs = {
			70,
			80,
			90
		}
	}
	self.xp.xp100 = {
		name_id = "bm_exp_xp100",
		value_id = "xp100",
		multiplier = 1,
		pcs = {
			80,
			90,
			100
		}
	}
end

function BlackMarketTweakData:_init_armors()
	self.armors = {
		level_1 = {}
	}
	self.armors.level_1.name_id = "bm_armor_level_1"
	self.armors.level_1.sequence = "var_model_01"
	self.armors.level_1.upgrade_level = 1
	self.armors.level_2 = {
		name_id = "bm_armor_level_2",
		sequence = "var_model_02",
		upgrade_level = 2
	}
	self.armors.level_3 = {
		name_id = "bm_armor_level_3",
		sequence = "var_model_03",
		upgrade_level = 3
	}
	self.armors.level_4 = {
		name_id = "bm_armor_level_4",
		sequence = "var_model_04",
		upgrade_level = 4
	}
	self.armors.level_5 = {
		name_id = "bm_armor_level_5",
		sequence = "var_model_05",
		upgrade_level = 5
	}
	self.armors.level_6 = {
		name_id = "bm_armor_level_6",
		sequence = "var_model_06",
		upgrade_level = 6
	}
	self.armors.level_7 = {
		name_id = "bm_armor_level_7",
		sequence = "var_model_07",
		upgrade_level = 7
	}

	self:_add_desc_from_name_macro(self.armors)
end

function BlackMarketTweakData:_init_deployables(tweak_data)
	self.deployables = {
		doctor_bag = {}
	}
	self.deployables.doctor_bag.name_id = "bm_equipment_doctor_bag"
	self.deployables.ammo_bag = {
		name_id = "bm_equipment_ammo_bag"
	}
	self.deployables.ecm_jammer = {
		name_id = "bm_equipment_ecm_jammer"
	}
	self.deployables.sentry_gun = {
		name_id = "bm_equipment_sentry_gun"
	}
	self.deployables.sentry_gun_silent = {
		name_id = "bm_equipment_sentry_gun_silent"
	}
	self.deployables.trip_mine = {
		name_id = "bm_equipment_trip_mine"
	}
	self.deployables.armor_kit = {
		name_id = "bm_equipment_armor_kit"
	}
	self.deployables.first_aid_kit = {
		name_id = "bm_equipment_first_aid_kit"
	}
	self.deployables.bodybags_bag = {
		name_id = "bm_equipment_bodybags_bag"
	}

	self:_add_desc_from_name_macro(self.deployables)
end
