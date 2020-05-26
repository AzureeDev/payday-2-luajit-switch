EnvEffectTweakData = EnvEffectTweakData or class()

function EnvEffectTweakData:init()
end

function EnvEffectTweakData:molotov_fire()
	local params = {
		sound_event = "molotov_impact",
		range = 75,
		curve_pow = 3,
		damage = 1,
		fire_alert_radius = 1500,
		alert_radius = 1500,
		sound_event_burning = "burn_loop_gen",
		is_molotov = true,
		player_damage = 2,
		sound_event_impact_duration = 4,
		burn_tick_period = 0.5,
		burn_duration = 15,
		effect_name = "effects/payday2/particles/explosions/molotov_grenade",
		fire_dot_data = {
			dot_trigger_chance = 35,
			dot_damage = 15,
			dot_length = 6,
			dot_trigger_max_distance = 3000,
			dot_tick_period = 0.5
		}
	}

	return params
end

function EnvEffectTweakData:trip_mine_fire()
	local params = {
		sound_event = "molotov_impact",
		range = 75,
		curve_pow = 3,
		damage = 1,
		fire_alert_radius = 15000,
		alert_radius = 15000,
		sound_event_burning = "burn_loop_gen",
		player_damage = 2,
		sound_event_impact_duration = 4,
		burn_tick_period = 0.5,
		burn_duration = 10,
		effect_name = "effects/payday2/particles/explosions/molotov_grenade",
		fire_dot_data = {
			dot_trigger_chance = 35,
			dot_damage = 15,
			dot_length = 6,
			dot_trigger_max_distance = 3000,
			dot_tick_period = 0.5
		}
	}

	return params
end

function EnvEffectTweakData:incendiary_fire()
	local params = {
		sound_event = "gl_explode",
		range = 75,
		curve_pow = 3,
		damage = 1,
		fire_alert_radius = 1500,
		alert_radius = 1500,
		sound_event_burning = "burn_loop_gen",
		player_damage = 2,
		sound_event_impact_duration = 6,
		burn_tick_period = 0.5,
		burn_duration = 10,
		effect_name = "effects/payday2/particles/explosions/molotov_grenade",
		fire_dot_data = {
			dot_trigger_chance = 35,
			dot_damage = 15,
			dot_length = 6,
			dot_trigger_max_distance = 3000,
			dot_tick_period = 0.5
		}
	}

	return params
end

function EnvEffectTweakData:incendiary_fire_arbiter()
	local params = {
		sound_event = "gl_explode",
		range = 75,
		curve_pow = 3,
		damage = 1,
		fire_alert_radius = 1500,
		alert_radius = 1500,
		sound_event_burning = "burn_loop_gen",
		player_damage = 2,
		sound_event_impact_duration = 6,
		burn_tick_period = 0.5,
		burn_duration = 3,
		effect_name = "effects/payday2/particles/explosions/molotov_grenade",
		fire_dot_data = {
			dot_trigger_chance = 35,
			dot_damage = 15,
			dot_length = 6,
			dot_trigger_max_distance = 3000,
			dot_tick_period = 0.5
		}
	}

	return params
end
