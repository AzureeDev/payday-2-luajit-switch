EconomyTweakData = EconomyTweakData or class()

function EconomyTweakData:init()
	self.safes = {}
	self.drills = {}
	self.gameplay = {}
	self.contents = {}
	self.bundles = {}
	self.rarities = {}
	self.qualities = {}
	self.rarities.common = {
		index = 1,
		fake_chance = 75,
		open_safe_sequence = "anim_open_01",
		color = Color("2360D8"),
		header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_common",
		bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_common",
		name_id = "bm_menu_rarity_common"
	}
	self.rarities.uncommon = {
		index = 2,
		fake_chance = 20,
		open_safe_sequence = "anim_open_02",
		color = Color("9900FF"),
		header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_uncommon",
		bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_uncommon",
		name_id = "bm_menu_rarity_uncommon"
	}
	self.rarities.rare = {
		index = 3,
		fake_chance = 4,
		open_safe_sequence = "anim_open_03",
		color = Color("FF00FF"),
		header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_rare",
		bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_rare",
		name_id = "bm_menu_rarity_rare"
	}
	self.rarities.epic = {
		index = 4,
		fake_chance = 1,
		open_safe_sequence = "anim_open_04",
		color = Color("FF0000"),
		header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_epic",
		bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_epic",
		name_id = "bm_menu_rarity_epic"
	}
	self.rarities.legendary = {
		index = 5,
		fake_chance = 0,
		open_safe_sequence = "anim_open_05",
		color = Color("FFAA00"),
		header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_legendary",
		bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_legendary",
		name_id = "bm_menu_rarity_legendary"
	}
	self.qualities.poor = {
		index = 1,
		wear_tear_value = 0.3,
		name_id = "bm_menu_quality_poor"
	}
	self.qualities.fair = {
		index = 2,
		wear_tear_value = 0.45,
		name_id = "bm_menu_quality_fair"
	}
	self.qualities.good = {
		index = 3,
		wear_tear_value = 0.6,
		name_id = "bm_menu_quality_good"
	}
	self.qualities.fine = {
		index = 4,
		wear_tear_value = 0.8,
		name_id = "bm_menu_quality_fine"
	}
	self.qualities.mint = {
		index = 5,
		wear_tear_value = 1,
		name_id = "bm_menu_quality_mint"
	}
	self.contents.legendary = {
		def_id = 10000,
		contains = {
			weapon_skins = {
				"ak74_rodina"
			}
		},
		rarity = "legendary"
	}
	self.contents.overkill_01 = {
		def_id = 10001,
		contains = {
			weapon_skins = {
				"new_m4_skullimov",
				"deagle_skullimov",
				"p90_skullimov",
				"plainsrider_skullimov",
				"m95_bombmatta",
				"huntsman_bloodsplat",
				"r93_wooh",
				"judge_wooh",
				"b92fs_bloodsplat",
				"mg42_bloodsplat",
				"m134_bloodsplat",
				"flamethrower_mk2_bloodsplat",
				"rpg7_bloodsplat",
				"g36_bloodsplat",
				"serbu_stunner",
				"new_m14_bloodsplat",
				"new_raging_bull_bloodsplat",
				"famas_bloodsplat",
				"r93_bloodsplat",
				"ak74_bloodsplat",
				"ppk_bloodsplat",
				"b92fs_wooh"
			},
			contents = {
				"overkill_01_legendary"
			}
		}
	}
	self.contents.overkill_01_legendary = {
		def_id = 10002,
		contains = {
			weapon_skins = {
				"flamethrower_mk2_fire",
				"rpg7_boom",
				"m134_bulletstorm"
			}
		},
		rarity = "legendary"
	}
	self.contents.event_01 = {
		def_id = 10003,
		contains = {
			weapon_skins = {
				"m95_forest",
				"famas_forest",
				"huntsman_forest",
				"r93_forest",
				"b92fs_forest",
				"m134_forest",
				"serbu_camohex",
				"new_m14_camohex",
				"judge_camohex",
				"mg42_camohex",
				"p90_luxury",
				"ak74_luxury",
				"ppk_luxury",
				"plainsrider_linked",
				"new_m4_payday"
			},
			contents = {
				"event_01_legendary"
			}
		}
	}
	self.contents.event_01_legendary = {
		def_id = 10004,
		contains = {
			weapon_skins = {
				"deagle_bling"
			}
		},
		rarity = "legendary"
	}
	self.contents.weapon_01 = {
		def_id = 10005,
		contains = {
			weapon_skins = {
				"serbu_woodland",
				"p90_woodland",
				"plainsrider_woodland",
				"rpg7_woodland",
				"ppk_woodland",
				"judge_woodland",
				"new_m4_goldstripes",
				"new_raging_bull_goldstripes",
				"flamethrower_mk2_goldstripes",
				"g36_goldstripes",
				"new_m14_luxury",
				"m95_luxury",
				"b92fs_luxury",
				"famas_hypno",
				"huntsman_hypno"
			},
			contents = {
				"legendary"
			}
		}
	}
	self.contents.event_red = {
		def_id = 10006,
		contains = {
			weapon_skins = {
				"p90_golddigger",
				"m95_golddigger",
				"serbu_golddigger",
				"huntsman_golddigger",
				"r93_golddigger",
				"ak74_golddigger",
				"m134_golddigger",
				"famas_golddigger",
				"new_m14_golddigger",
				"ppk_golddigger"
			},
			contents = {
				"event_01_legendary"
			}
		},
		type = "limited"
	}
	self.contents.event_dinner = {
		def_id = 10007,
		contains = {
			weapon_skins = {
				"judge_bloodbath",
				"b92fs_bloodbath",
				"new_raging_bull_bloodbath",
				"mg42_bloodbath",
				"plainsrider_bloodbath",
				"new_m4_bloodbath",
				"g36_bloodbath",
				"flamethrower_mk2_bloodbath",
				"deagle_bloodbath",
				"rpg7_bloodbath"
			},
			contents = {
				"legendary"
			}
		},
		type = "limited"
	}
	self.contents.dallas_01 = {
		def_id = 10008,
		contains = {
			weapon_skins = {
				"new_raging_bull_dallas",
				"mg42_dallas",
				"famas_dallas",
				"flamethrower_mk2_dallas",
				"huntsman_dallas",
				"r93_dallas",
				"ak74_dallas",
				"ppk_dallas",
				"deagle_dallas",
				"new_m14_dallas",
				"judge_dallas",
				"b92fs_dallas",
				"serbu_dallas",
				"g36_dallas",
				"m95_dallas"
			},
			contents = {
				"dallas_01_legendary"
			}
		}
	}
	self.contents.dallas_01_legendary = {
		def_id = 10009,
		contains = {
			weapon_skins = {
				"p90_dallas_sallad"
			}
		},
		rarity = "legendary"
	}
	self.safes.overkill_01 = {
		def_id = 50000,
		promo = true,
		drill = "overkill_01",
		content = "overkill_01",
		unit_name = "units/payday2_cash/safes/eco_safe_overkill_01/eco_safe_overkill_01",
		name_id = "bm_menu_safe_overkill_01",
		texture_bundle_folder = "cash/safes/cop",
		dlc = "complete_overkill_pack"
	}
	self.safes.event_01 = {
		drill = "event_01",
		content = "event_01",
		unit_name = "units/payday2_cash/safes/eco_safe_event_01/eco_safe_event_01",
		name_id = "bm_menu_safe_event_01",
		texture_bundle_folder = "cash/safes/cf15",
		market_link = "https://steamcommunity.com/market/listings/218620/Crimefest%202%20Safe"
	}
	self.safes.weapon_01 = {
		drill = "weapon_01",
		content = "weapon_01",
		unit_name = "units/payday2_cash/safes/eco_safe_weapon_01/eco_safe_weapon_01",
		name_id = "bm_menu_safe_weapon_01",
		texture_bundle_folder = "cash/safes/sputnik",
		market_link = "https://steamcommunity.com/market/listings/218620/Sputnik%20Safe"
	}
	self.safes.event_red = {
		def_id = 50003,
		free = true,
		drill = "event_red",
		content = "event_red",
		unit_name = "units/payday2_cash/safes/red/safe/eco_safe_event_red",
		name_id = "bm_menu_safe_event_red",
		texture_bundle_folder = "cash/safes/red",
		achievement = "green_7",
		market_link = "http://steamcommunity.com/market/listings/218620/First%20World%20Safe"
	}
	self.safes.event_dinner = {
		def_id = 50004,
		free = true,
		drill = "event_dinner",
		content = "event_dinner",
		unit_name = "units/payday2_cash/safes/dinner/safe/eco_safe_event_dinner",
		name_id = "bm_menu_safe_event_dinner",
		texture_bundle_folder = "cash/safes/dinner",
		achievement = "farm_6",
		market_link = "http://steamcommunity.com/market/listings/218620/Slaughter%20Safe"
	}
	self.safes.dallas_01 = {
		drill = "dallas_01",
		content = "dallas_01",
		name_id = "bm_menu_safe_dallas_01",
		unit_name = "units/payday2_cash/safes/dallas/safe/eco_safe_dallas",
		texture_bundle_folder = "cash/safes/dallas",
		market_link = "https://steamcommunity.com/market/listings/218620/Dallas%20Safe"
	}
	self.drills.overkill_01 = {
		safe = "overkill_01",
		def_id = 70000,
		promo = true,
		unit_name = "units/payday2_cash/drills/eco_drill_overkill_01/eco_drill_overkill_01",
		name_id = "bm_menu_drill_overkill_01",
		desc_id = "bm_menu_drill_overkill_01_desc",
		texture_bundle_folder = "cash/safes/cop",
		dlc = "complete_overkill_pack"
	}
	self.drills.event_01 = {
		safe = "event_01",
		def_id = 70001,
		price = "2.49",
		unit_name = "units/payday2_cash/drills/eco_drill_event_01/eco_drill_event_01",
		name_id = "bm_menu_drill_event_01",
		desc_id = "bm_menu_drill_event_01_desc",
		texture_bundle_folder = "cash/safes/cf15"
	}
	self.drills.weapon_01 = {
		safe = "weapon_01",
		def_id = 70002,
		price = "2.49",
		unit_name = "units/payday2_cash/drills/eco_drill_weapon_01/eco_drill_weapon_01",
		name_id = "bm_menu_drill_weapon_01",
		desc_id = "bm_menu_drill_weapon_01_desc",
		texture_bundle_folder = "cash/safes/sputnik"
	}
	self.drills.event_red = {
		safe = "event_red",
		def_id = 70003,
		force_include = true,
		unit_name = "units/payday2_cash/safes/red/drill/eco_drill_event_red",
		name_id = "bm_menu_drill_event_red",
		desc_id = "bm_menu_drill_event_red_desc",
		texture_bundle_folder = "cash/safes/red",
		achievement = "green_7"
	}
	self.drills.event_dinner = {
		def_id = 70004,
		safe = "event_dinner",
		force_include = true,
		unit_name = "units/payday2_cash/safes/dinner/drill/eco_drill_event_dinner",
		name_id = "bm_menu_drill_event_dinner",
		desc_id = "bm_menu_drill_event_dinner_desc",
		texture_bundle_folder = "cash/safes/dinner",
		achievement = "farm_6"
	}
	self.drills.dallas_01 = {
		safe = "dallas_01",
		def_id = 70005,
		price = "2.49",
		name_id = "bm_menu_drill_dallas_01",
		desc_id = "bm_menu_drill_dallas_01_desc",
		unit_name = "units/payday2_cash/safes/dallas/drill/eco_drill_dallas",
		texture_bundle_folder = "cash/safes/dallas"
	}
	self.bonuses = {
		concealment_p1 = {}
	}
	self.bonuses.concealment_p1.name_id = "bm_menu_bonus_concealment"
	self.bonuses.concealment_p1.stats = {
		concealment = 1
	}
	self.bonuses.concealment_p2 = {
		name_id = "bm_menu_bonus_concealment",
		stats = {
			concealment = 2
		}
	}
	self.bonuses.concealment_p3 = {
		name_id = "bm_menu_bonus_concealment",
		stats = {
			concealment = 3
		}
	}
	self.bonuses.spread_p1 = {
		name_id = "bm_menu_bonus_spread",
		stats = {
			spread = 1
		}
	}
	self.bonuses.spread_n1 = {
		name_id = "bm_menu_bonus_spread",
		stats = {
			spread = -1
		}
	}
	self.bonuses.recoil_p1 = {
		name_id = "bm_menu_bonus_recoil",
		stats = {
			recoil = 1
		}
	}
	self.bonuses.recoil_p2 = {
		name_id = "bm_menu_bonus_recoil",
		stats = {
			recoil = 2
		}
	}
	self.bonuses.damage_p1 = {
		name_id = "bm_menu_bonus_damage",
		stats = {
			damage = 1
		}
	}
	self.bonuses.damage_p2 = {
		name_id = "bm_menu_bonus_damage",
		stats = {
			damage = 2
		}
	}
	self.bonuses.total_ammo_p1 = {
		name_id = "bm_menu_bonus_total_ammo",
		stats = {
			total_ammo_mod = 1
		}
	}
	self.bonuses.total_ammo_p3 = {
		name_id = "bm_menu_bonus_total_ammo",
		stats = {
			total_ammo_mod = 3
		}
	}
	self.bonuses.concealment_p1_tem_p1 = {
		name_id = "bm_menu_bonus_concealment_tem",
		stats = {
			concealment = 1
		},
		exp_multiplier = 1.01,
		money_multiplier = 1.01
	}
	self.bonuses.concealment_p2_tem_p1 = {
		name_id = "bm_menu_bonus_concealment_tem",
		stats = {
			concealment = 2
		},
		exp_multiplier = 1.01,
		money_multiplier = 1.01
	}
	self.bonuses.concealment_p3_tem_p1 = {
		name_id = "bm_menu_bonus_concealment_tem",
		stats = {
			concealment = 3
		},
		exp_multiplier = 1.01,
		money_multiplier = 1.01
	}
	self.bonuses.spread_p1_tem_p1 = {
		name_id = "bm_menu_bonus_spread_tem",
		stats = {
			spread = 1
		},
		exp_multiplier = 1.01,
		money_multiplier = 1.01
	}
	self.bonuses.spread_n1_tem_p1 = {
		name_id = "bm_menu_bonus_spread_tem",
		stats = {
			spread = -1
		},
		exp_multiplier = 1.01,
		money_multiplier = 1.01
	}
	self.bonuses.recoil_p1_tem_p1 = {
		name_id = "bm_menu_bonus_recoil_tem",
		stats = {
			recoil = 1
		},
		exp_multiplier = 1.01,
		money_multiplier = 1.01
	}
	self.bonuses.recoil_p2_tem_p1 = {
		name_id = "bm_menu_bonus_recoil_tem",
		stats = {
			recoil = 2
		},
		exp_multiplier = 1.01,
		money_multiplier = 1.01
	}
	self.bonuses.damage_p1_tem_p1 = {
		name_id = "bm_menu_bonus_damage_tem",
		stats = {
			damage = 1
		},
		exp_multiplier = 1.01,
		money_multiplier = 1.01
	}
	self.bonuses.damage_p2_tem_p1 = {
		name_id = "bm_menu_bonus_damage_tem",
		stats = {
			damage = 2
		},
		exp_multiplier = 1.01,
		money_multiplier = 1.01
	}
	self.bonuses.total_ammo_p1_tem_p1 = {
		name_id = "bm_menu_bonus_total_ammo_tem",
		stats = {
			total_ammo_mod = 1
		},
		exp_multiplier = 1.01,
		money_multiplier = 1.01
	}
	self.bonuses.total_ammo_p3_tem_p1 = {
		name_id = "bm_menu_bonus_total_ammo_tem",
		stats = {
			total_ammo_mod = 3
		},
		exp_multiplier = 1.01,
		money_multiplier = 1.01
	}
	self.bonuses.team_exp_money_p3 = {
		name_id = "bm_menu_bonus_team_exp_money",
		exp_multiplier = 1.03,
		money_multiplier = 1.03
	}
end

function EconomyTweakData:get_entry_from_index(category, index)
	for entry, data in pairs(self[category] or {}) do
		if not data.index then
			break
		end

		if data.index == index then
			return entry
		end
	end
end

function EconomyTweakData:get_index_from_entry(category, entry)
	return self[category] and self[category][entry] and self[category][entry].index
end

function EconomyTweakData:get_bonus_icons(entry)
	local bonus_data = self.bonuses[entry]
	local bonuses = {}

	if bonus_data then
		if bonus_data.stats then
			table.insert(bonuses, "guis/dlcs/cash/textures/pd2/safe_raffle/statboost_icon")
		end

		if bonus_data.exp_multiplier or bonus_data.money_multiplier then
			table.insert(bonuses, "guis/dlcs/cash/textures/pd2/safe_raffle/teamboost_icon")
		end
	end

	return bonuses
end

function EconomyTweakData:create_weapon_skin_market_search_url(weapon_id, cosmetic_id)
	local cosmetic_name = tweak_data.blackmarket.weapon_skins[cosmetic_id] and managers.localization:text(tweak_data.blackmarket.weapon_skins[cosmetic_id].name_id)
	local weapon_name = managers.weapon_factory:get_weapon_name_by_weapon_id(weapon_id)

	if cosmetic_name and weapon_name then
		cosmetic_name = string.gsub(cosmetic_name, " ", "+")
		weapon_name = string.gsub(weapon_name, " ", "+")

		return string.gsub("http://steamcommunity.com/market/search?appid=218620&q=" .. cosmetic_name .. "+" .. weapon_name, "++", "+")
	end

	return nil
end

function EconomyTweakData:create_market_link_url(category, entry)
	return self[category] and self[category][entry] and self[category][entry].market_link
end

function EconomyTweakData:create_buy_tradable_url(def_id, quantity)
	return "https://store.steampowered.com/buyitem/218620/" .. tostring(def_id) .. "/"
end

function EconomyTweakData:create_sell_tradable_url(steam_id, instance_id)
	return "https://steamcommunity.com/profiles/" .. tostring(steam_id) .. "/inventory/?sellOnLoad=1#218620_2_" .. tostring(instance_id)
end

function EconomyTweakData:get_bonuses_by_safe(safe)
	local safe_tweak = self.contents[safe]
	local ids = deep_clone(safe_tweak.contains.weapon_skins)

	if safe_tweak.contains.contents then
		for _, content in ipairs(safe_tweak.contains.contents) do
			local legendary_tweak = self.contents[content]

			for _, new_id in ipairs(legendary_tweak.contains.weapon_skins) do
				table.insert(ids, new_id)
			end
		end
	end

	local bonuses = {}

	for _, wid in ipairs(ids) do
		local bonus = "none"
		local item = tweak_data.blackmarket.weapon_skins[wid]

		if item.bonus then
			local bonus_data = self.bonuses[item.bonus]

			if bonus_data.stats and (bonus_data.exp_multiplier or bonus_data.money_multiplier) then
				bonus = "both"
			elseif bonus_data.stats then
				bonus = "single"
			else
				bonus = "team"
			end
		end

		bonuses[wid] = bonus
	end

	return bonuses
end
