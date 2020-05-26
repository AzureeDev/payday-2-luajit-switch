function BlackMarketTweakData:_init_bullets(tweak_data)
	self.bullets = {}
end

function BlackMarketTweakData:_init_projectiles(tweak_data)
	self.projectiles = {
		frag = {}
	}
	self.projectiles.frag.name_id = "bm_grenade_frag"
	self.projectiles.frag.unit = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade"
	self.projectiles.frag.unit_dummy = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade_husk"
	self.projectiles.frag.sprint_unit = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade_sprint"
	self.projectiles.frag.icon = "frag_grenade"
	self.projectiles.frag.dlc = "gage_pack"
	self.projectiles.frag.throwable = true
	self.projectiles.frag.max_amount = 3
	self.projectiles.frag.animation = "throw_grenade"
	self.projectiles.frag.anim_global_param = "projectile_frag"
	self.projectiles.frag.throw_allowed_expire_t = 0.1
	self.projectiles.frag.expire_t = 1.1
	self.projectiles.frag.repeat_expire_t = 1.5
	self.projectiles.frag.is_a_grenade = true
	self.projectiles.frag.installed = true
	self.projectiles.concussion = {
		name_id = "bm_concussion",
		unit = "units/pd2_crimefest_2016/fez1/weapons/wpn_fps_gre_pressure/wpn_third_gre_pressure",
		unit_dummy = "units/pd2_crimefest_2016/fez1/weapons/wpn_fps_gre_pressure/wpn_fps_gre_pressure_husk",
		sprint_unit = "units/pd2_crimefest_2016/fez1/weapons/wpn_fps_gre_pressure/wpn_third_gre_pressure_sprint",
		icon = "concussion_grenade",
		throwable = true,
		max_amount = 6,
		animation = "throw_concussion",
		anim_global_param = "projectile_frag",
		texture_bundle_folder = "fez1",
		throw_allowed_expire_t = 0.1,
		expire_t = 0.9,
		repeat_expire_t = 1.5,
		is_a_grenade = true
	}
	self.projectiles.molotov = {
		name_id = "bm_grenade_molotov",
		unit = "units/pd2_dlc_bbq/weapons/molotov_cocktail/wpn_molotov_third",
		unit_dummy = "units/pd2_dlc_bbq/weapons/molotov_cocktail/wpn_molotov_husk",
		icon = "molotov_grenade",
		dlc = "bbq",
		no_cheat_count = true,
		impact_detonation = true,
		time_cheat = 1,
		throwable = true,
		max_amount = 3,
		texture_bundle_folder = "bbq",
		physic_effect = Idstring("physic_effects/molotov_throw"),
		animation = "throw_molotov",
		anim_global_param = "projectile_molotov",
		throw_allowed_expire_t = 0.1,
		expire_t = 1.3,
		repeat_expire_t = 1.5,
		is_a_grenade = true
	}
	self.projectiles.dynamite = {
		name_id = "bm_dynamite",
		unit = "units/pd2_dlc_west/weapons/wpn_gre_dynamite/wpn_gre_dynamite",
		unit_dummy = "units/pd2_dlc_west/weapons/wpn_gre_dynamite/wpn_gre_dynamite_husk",
		icon = "dynamite_grenade",
		dlc = "west",
		texture_bundle_folder = "west",
		max_amount = 3,
		throwable = true,
		animation = "throw_dynamite",
		anim_global_param = "projectile_dynamite",
		throw_allowed_expire_t = 0.1,
		expire_t = 1.3,
		repeat_expire_t = 1.5,
		is_a_grenade = true
	}
	self.projectiles.wpn_prj_four = {
		name_id = "bm_wpn_prj_four",
		unit = "units/pd2_dlc_turtles/weapons/wpn_prj_four/wpn_prj_four",
		unit_dummy = "units/pd2_dlc_turtles/weapons/wpn_prj_four/wpn_prj_four_husk",
		local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_four/wpn_prj_four_local",
		icon = "four_projectile",
		throw_shout = true,
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true,
		add_trail_effect = true,
		throwable = true,
		texture_bundle_folder = "turtles",
		dlc = "turtles",
		max_amount = 10,
		anim_global_param = "projectile_four",
		throw_allowed_expire_t = 0.15,
		expire_t = 1.1,
		repeat_expire_t = 0.5
	}
	self.projectiles.wpn_prj_ace = {
		name_id = "bm_wpn_prj_ace",
		unit = "units/pd2_dlc_cake/weapons/wpn_prj_ace/wpn_prj_ace",
		unit_dummy = "units/pd2_dlc_cake/weapons/wpn_prj_ace/wpn_prj_ace_husk",
		local_unit = "units/pd2_dlc_cake/weapons/wpn_prj_ace/wpn_prj_ace_local",
		icon = "ace_projectile",
		throw_shout = true,
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true,
		add_trail_effect = true,
		throwable = true,
		dlc = "pd2_clan",
		max_amount = 21,
		anim_global_param = "projectile_four",
		throw_allowed_expire_t = 0.15,
		expire_t = 1.1,
		repeat_expire_t = 0.3
	}
	self.projectiles.launcher_frag = {
		name_id = "bm_launcher_frag",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_launcher_frag_grenade/wpn_launcher_frag_grenade",
		weapon_id = "gre_m79",
		no_cheat_count = true,
		impact_detonation = true,
		time_cheat = 1
	}
	self.projectiles.rocket_frag = {
		name_id = "bm_rocket_frag",
		unit = "units/pd2_dlc_overkill_pack/weapons/wpn_third_rpg7_fired_rocket/wpn_third_rpg7_fired_rocket",
		weapon_id = "rpg7",
		no_cheat_count = true,
		impact_detonation = true,
		time_cheat = 1,
		physic_effect = Idstring("physic_effects/anti_gravitate"),
		adjust_z = 0
	}
	self.projectiles.launcher_incendiary = {
		name_id = "bm_launcher_incendiary",
		unit = "units/pd2_dlc_bbq/weapons/wpn_launcher_incendiary_grenade/wpn_launcher_incendiary_grenade",
		weapon_id = "gre_m79",
		no_cheat_count = true,
		impact_detonation = true,
		time_cheat = 1
	}
	self.projectiles.launcher_frag_m32 = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.launcher_frag_m32.weapon_id = "m32"
	self.projectiles.launcher_incendiary_m32 = deep_clone(self.projectiles.launcher_incendiary)
	self.projectiles.launcher_incendiary_m32.weapon_id = "m32"
	self.projectiles.launcher_frag_china = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.launcher_frag_china.weapon_id = "china"
	self.projectiles.launcher_incendiary_china = deep_clone(self.projectiles.launcher_incendiary)
	self.projectiles.launcher_incendiary_china.weapon_id = "china"
	self.projectiles.west_arrow = {
		name_id = "bm_launcher_frag",
		unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow",
		local_unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow_local",
		weapon_id = "plainsrider",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.west_arrow_exp = {
		name_id = "bm_launcher_frag",
		unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow_exp",
		local_unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow_exp_local",
		weapon_id = "plainsrider",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.bow_poison_arrow = {
		unit = "units/pd2_dlc_turtles/weapons/wpn_prj_bow_poison_arrow/wpn_prj_bow_poison_arrow",
		local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_bow_poison_arrow/wpn_prj_bow_poison_arrow_local",
		weapon_id = "plainsrider",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.crossbow_arrow = {
		unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow/wpn_prj_crossbow_arrow",
		local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow/wpn_prj_crossbow_arrow_local",
		weapon_id = "hunter",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.crossbow_poison_arrow = {
		unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_poison_arrow/wpn_prj_crossbow_poison_arrow",
		local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_poison_arrow/wpn_prj_crossbow_poison_arrow_local",
		weapon_id = "hunter",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.crossbow_arrow_exp = {
		unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow_exp/wpn_prj_crossbow_arrow_exp",
		local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow_exp/wpn_prj_crossbow_arrow_exp_local",
		weapon_id = "hunter",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.wpn_prj_jav = {
		name_id = "bm_wpn_prj_jav",
		unit = "units/pd2_dlc_steel/weapons/wpn_prj_jav/wpn_prj_jav",
		unit_dummy = "units/pd2_dlc_steel/weapons/wpn_prj_jav/wpn_prj_jav_husk",
		local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_jav/wpn_prj_jav_local",
		icon = "jav_projectile",
		throw_shout = true,
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true,
		add_trail_effect = true,
		throwable = true,
		texture_bundle_folder = "steel",
		dlc = "steel",
		max_amount = 3,
		anim_global_param = "projectile_jav",
		throw_allowed_expire_t = 0.4,
		expire_t = 1.1,
		repeat_expire_t = 1
	}
	self.projectiles.arblast_arrow = {
		unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_arrow/wpn_prj_arblast_arrow",
		local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_arrow/wpn_prj_arblast_arrow_local",
		weapon_id = "arblast",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.arblast_poison_arrow = {
		unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_poison_arrow/wpn_prj_arblast_poison_arrow",
		local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_poison_arrow/wpn_prj_arblast_poison_arrow_local",
		weapon_id = "arblast",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.arblast_arrow_exp = {
		unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_arrow_exp/wpn_prj_arblast_arrow_exp",
		local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_arrow_exp/wpn_prj_arblast_arrow_exp_local",
		weapon_id = "arblast",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.frankish_arrow = {
		unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_arrow/wpn_prj_frankish_arrow",
		local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_arrow/wpn_prj_frankish_arrow_local",
		weapon_id = "frankish",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.frankish_poison_arrow = {
		unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_poison_arrow/wpn_prj_frankish_poison_arrow",
		local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_poison_arrow/wpn_prj_frankish_poison_arrow_local",
		weapon_id = "frankish",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.frankish_arrow_exp = {
		unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_arrow_exp/wpn_prj_frankish_arrow_exp",
		local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_arrow_exp/wpn_prj_frankish_arrow_exp_local",
		weapon_id = "frankish",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.long_arrow = {
		unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_arrow",
		local_unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_arrow_local",
		weapon_id = "long",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.long_poison_arrow = {
		unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_poison_arrow",
		local_unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_poison_arrow_local",
		weapon_id = "long",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.long_arrow_exp = {
		unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_arrow_exp",
		local_unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_arrow_exp_local",
		weapon_id = "long",
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true
	}
	self.projectiles.wpn_prj_hur = {
		name_id = "bm_wpn_prj_hur",
		unit = "units/pd2_dlc_born/weapons/wpn_fps_mel_hur/wpn_prj_hur",
		unit_dummy = "units/pd2_dlc_born/weapons/wpn_fps_mel_hur/wpn_prj_hur_husk",
		local_unit = "units/pd2_dlc_born/weapons/wpn_fps_mel_hur/wpn_prj_hur_local",
		icon = "throwing_axe",
		throw_shout = true,
		no_cheat_count = true,
		impact_detonation = true,
		client_authoritative = true,
		add_trail_effect = true,
		throwable = true,
		texture_bundle_folder = "born",
		dlc = "born",
		max_amount = 3,
		anim_global_param = "projectile_four",
		throw_allowed_expire_t = 0.15,
		expire_t = 1.1,
		repeat_expire_t = 0.5
	}
	self.projectiles.frag_com = {
		name_id = "bm_grenade_frag_com",
		desc_id = "bm_grenade_frag_com_desc",
		unit = "units/payday2/weapons/wpn_frag_grenade_com/wpn_frag_grenade_com",
		unit_dummy = "units/payday2/weapons/wpn_frag_grenade_com/wpn_frag_grenade_com_husk",
		sprint_unit = "units/payday2/weapons/wpn_frag_grenade_com/wpn_frag_grenade_com_sprint",
		icon = "frag_grenade",
		throwable = true,
		max_amount = 3,
		animation = "throw_grenade_com",
		anim_global_param = "projectile_frag_com",
		throw_allowed_expire_t = 0.1,
		expire_t = 1.1,
		repeat_expire_t = 1.5,
		is_a_grenade = true,
		dlc = "pd2_clan"
	}
	self.projectiles.pocket_ecm_jammer = {
		name_id = "bm_grenade_pocket_ecm_jammer",
		desc_id = "bm_grenade_pocket_ecm_jammer_desc",
		icon = "guis/dlcs/joy/textures/pd2/hud_pocket_ecm_jammer",
		texture_bundle_folder = "joy",
		ability = true,
		base_cooldown = 100,
		max_amount = 2,
		sounds = {
			cooldown = "perkdeck_cooldown_over"
		}
	}
	self._projectiles_index = {
		"frag",
		"launcher_frag",
		"rocket_frag",
		"molotov",
		"launcher_incendiary",
		"launcher_frag_m32",
		"west_arrow",
		"west_arrow_exp",
		"dynamite",
		"bow_poison_arrow",
		"crossbow_arrow",
		"crossbow_poison_arrow",
		"crossbow_arrow_exp",
		"wpn_prj_four",
		"wpn_prj_ace",
		"wpn_prj_jav",
		"arblast_arrow",
		"arblast_poison_arrow",
		"arblast_arrow_exp",
		"frankish_arrow",
		"frankish_poison_arrow",
		"frankish_arrow_exp",
		"long_arrow",
		"long_poison_arrow",
		"long_arrow_exp",
		"launcher_incendiary_m32",
		"launcher_frag_china",
		"launcher_incendiary_china",
		"wpn_prj_hur",
		"frag_com",
		"concussion",
		"pocket_ecm_jammer"
	}
	local free_dlcs = tweak_data:free_dlc_list()

	for _, data in pairs(self.projectiles) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end

	self:_add_desc_from_name_macro(self.projectiles)
end

function BlackMarketTweakData:get_projectiles_index()
	return self._projectiles_index
end

function BlackMarketTweakData:get_index_from_projectile_id(projectile_id)
	for index, entry_name in ipairs(self._projectiles_index) do
		if entry_name == projectile_id then
			return index
		end
	end

	return 0
end

function BlackMarketTweakData:get_projectile_name_from_index(index)
	return self._projectiles_index[index]
end
