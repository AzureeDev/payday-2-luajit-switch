core:module("CoreRumbleManager")

RumbleManager = RumbleManager or class()
local is_nx64 = SystemInfo:platform() == Idstring("NX64")

function RumbleManager:init()
	self._last_played_ids = {}
	self._preset_rumbles = {}
	self._audio_preset_rumbles = {}
	self._rumbling_controller_types = {}

	self:initialize_controller_types()

	self._registered_controllers = {}
	self._registered_controller_count = {}
	self._registered_controller_pos_callback_list = {}
	self._enabled = true
end

function RumbleManager:add_preset_rumbles(name, data)
	self._preset_rumbles[name] = data
end

function RumbleManager:add_audio_preset_rumbles(name, data)
	self._audio_preset_rumbles[name] = data
end

function RumbleManager:audio_presets_contain(sound_name)
	if SystemInfo:platform() == Idstring("NX64") then
		if string.find(sound_name, "foley") then
			return false
		end

		for sound_name_sample, rumble_name in pairs(self._audio_preset_rumbles) do
			if string.find(sound_name, sound_name_sample) then
				return true, rumble_name
			end
		end
	end

	return false
end

function RumbleManager:initialize_controller_types()
	self._rumbling_controller_types.xbox360 = true
	self._rumbling_controller_types.ps3 = true
	self._rumbling_controller_types.ps4 = true
	self._rumbling_controller_types.nx64 = true
	self._rumbling_controller_types.xb1 = true
end

function RumbleManager:stop(rumble_id)
	if rumble_id then
		if rumble_id == "all" then
			for _, controller in pairs(self._registered_controllers) do
				if controller then
					controller:stop_rumble()
				end
			end
		else
			for _, controller in pairs(rumble_id.controllers) do
				controller:stop_rumble(rumble_id[1])

				if rumble_id[2] then
					controller:stop_rumble(rumble_id[2])
				end
			end
		end
	end
end

function RumbleManager:register_controller(controller, pos_callback)
	if self._rumbling_controller_types[controller.TYPE] then
		local ctrl = controller:get_controller()
		local key = ctrl:key()
		self._registered_controllers[key] = ctrl
		self._registered_controller_count[key] = (self._registered_controller_count[key] or 0) + 1
		self._registered_controller_pos_callback_list[key] = self._registered_controller_pos_callback_list[key] or {}
		self._registered_controller_pos_callback_list[key][pos_callback] = true

		return true
	end
end

function RumbleManager:unregister_controller(controller, pos_callback)
	local ctrl = controller:get_controller()
	local key = ctrl:key()

	ctrl:stop_rumble()

	self._registered_controller_count[key] = (self._registered_controller_count[key] or 0) - 1

	if self._registered_controller_count[key] <= 0 then
		self._registered_controllers[key] = nil
		self._registered_controller_count[key] = nil
	end

	if self._registered_controller_pos_callback_list[key] then
		self._registered_controller_pos_callback_list[key][pos_callback] = nil

		if not next(self._registered_controller_pos_callback_list[key]) then
			self._registered_controller_pos_callback_list[key] = nil
		end
	end
end

function RumbleManager:set_enabled(enabled)
	self._enabled = enabled

	if not enabled then
		self:stop("all")
	end
end

function RumbleManager:enabled()
	return self._enabled
end

function RumbleManager:play_file(file_path, engine, multiplier_data, controller_wrapper)
	if not self._enabled then
		return false
	end

	local rumble_controllers = nil

	if not controller_wrapper then
		rumble_controllers = self._registered_controllers
	elseif self._rumbling_controller_types[controller_wrapper.TYPE] then
		local ctrl = controller_wrapper:get_controller()
		rumble_controllers[ctrl:key()] = ctrl
	end

	local rumble_id = {
		controllers = rumble_controllers,
		name = file_path
	}
	local multiplier = multiplier_data or 1
	local multiplier_l = multiplier_data and multiplier_data[1] or multiplier
	local multiplier_r = multiplier_data and multiplier_data[2] or multiplier

	for _, controller in pairs(rumble_controllers) do
		rumble_id[1] = controller:rumble({
			engine = engine,
			path = file_path,
			strength_l = multiplier_l,
			strength_r = multiplier_r
		})
	end

	return rumble_id
end

function RumbleManager:play(name, controller_wrapper, multiplier_data, custom_data, delay, is_menu)
	if not self._enabled then
		return false
	end

	local rumble_controllers = nil

	if not controller_wrapper then
		rumble_controllers = self._registered_controllers
	elseif self._rumbling_controller_types[controller_wrapper.TYPE] then
		local ctrl = controller_wrapper:get_controller()
		rumble_controllers[ctrl:key()] = ctrl
	end

	local effect = self._preset_rumbles[name]

	if effect then
		local rumble_id = {
			controllers = rumble_controllers,
			name = name
		}
		local custom_peak = custom_data and custom_data.peak
		local custom_attack = custom_data and custom_data.attack
		local custom_sustain = custom_data and custom_data.sustain
		local custom_release = custom_data and custom_data.release
		local rumble_delay = delay or 0

		for _, controller in pairs(rumble_controllers) do
			if self._last_played_ids[controller:key()] then
				local redundant_rumble = self._last_played_ids[controller:key()][name]

				if redundant_rumble and (controller:is_rumble_playing(redundant_rumble[1]) or controller:is_rumble_playing(redundant_rumble[2])) then
					self:stop(redundant_rumble)
				end
			end

			local multiplier = multiplier_data or 1
			local multiplier_l = custom_data and custom_data.multiplier_data_l or multiplier
			local multiplier_r = custom_data and custom_data.multiplier_data_r or multiplier
			local timer = effect.timer or TimerManager:game()

			if multiplier_data and type(multiplier_data) == "table" and multiplier_data.func then
				multiplier = multiplier_data.func(self._registered_controller_pos_callback_list[controller:key()], multiplier_data.params) or 1
			end

			if multiplier_data and type(multiplier_data) == "table" and multiplier_data.multiplier then
				multiplier = multiplier_data.multiplier

				if multiplier_data.multiplier_l then
					multiplier_l = multiplier_data.multiplier_l
				end

				if multiplier_data.multiplier_r then
					multiplier_r = multiplier_data.multiplier_r
				end
			end

			if is_nx64 then
				if effect.engine == "hybrid" then
					local amplitudes_l = type(effect.amplitudes) == "table" and effect.amplitudes.l or 0
					local time_points_l = type(effect.time_points) == "table" and effect.time_points.l or 0
					local frequencies_l = type(effect.frequencies) == "table" and effect.frequencies.l or 0

					table.insert(rumble_id, 1, controller:rumble({
						engine = "left",
						amplitudes = amplitudes_l,
						time_points = time_points_l,
						frequencies = frequencies_l,
						loop = effect.loop,
						loop_start_time = effect.loop_start_time,
						priority = effect.priority,
						strength_l = multiplier_l,
						delay = rumble_delay,
						menu_rumble = is_menu or false
					}))

					local amplitudes_r = type(effect.amplitudes) == "table" and effect.amplitudes.r or 0
					local time_points_r = type(effect.time_points) == "table" and effect.time_points.r or 0
					local frequencies_r = type(effect.frequencies) == "table" and effect.frequencies.r or 0

					table.insert(rumble_id, 2, controller:rumble({
						engine = "right",
						amplitudes = amplitudes_r,
						time_points = time_points_r,
						frequencies = frequencies_r,
						loop = effect.loop,
						loop_start_time = effect.loop_start_time,
						priority = effect.priority,
						strength_r = multiplier_r,
						delay = rumble_delay,
						menu_rumble = is_menu or false
					}))
				else
					rumble_id[1] = controller:rumble({
						engine = effect.engine,
						amplitudes = effect.amplitudes,
						time_points = effect.time_points,
						frequencies = effect.frequencies,
						loop = effect.loop,
						loop_start_time = effect.loop_start_time,
						priority = effect.priority,
						strength_l = multiplier_l,
						strength_r = multiplier_r,
						delay = rumble_delay,
						menu_rumble = is_menu or false
					})
				end
			elseif effect.engine == "hybrid" then
				table.insert(rumble_id, 1, controller:rumble({
					engine = "left",
					timer = timer,
					peak = (effect.peak.l or 1) * multiplier,
					attack = effect.attack.l,
					sustain = effect.sustain.l,
					release = effect.release.l
				}))
				table.insert(rumble_id, 2, controller:rumble({
					engine = "right",
					timer = timer,
					peak = (effect.peak.r or 1) * multiplier,
					attack = effect.attack.r,
					sustain = effect.sustain.r,
					release = effect.release.r
				}))
			else
				rumble_id[1] = controller:rumble({
					engine = effect.engine,
					timer = timer,
					peak = (custom_peak or effect.peak or 1) * multiplier,
					attack = custom_attack or effect.attack,
					sustain = custom_sustain or effect.sustain,
					release = custom_release or effect.release
				})
			end

			if not effect.cumulative then
				self._last_played_ids[controller:key()] = self._last_played_ids[controller:key()] or {}
				self._last_played_ids[controller:key()][name] = rumble_id
			end
		end

		return rumble_id
	else
		Application:error("RumbleManager:: Effect ", name, " not found.")
	end
end

function RumbleManager:is_playing(rumble_id)
	if not self._enabled or not rumble_id then
		return false
	end

	for _, controller in pairs(rumble_id.controllers) do
		if controller:is_rumble_playing(rumble_id[1]) or controller:is_rumble_playing(rumble_id[2]) then
			return true
		end
	end

	return false
end

function RumbleManager:set_multiplier(rumble_id, multiplier)
	if not self._enabled or not rumble_id or not multiplier then
		return false
	end

	local effect = self._preset_rumbles[rumble_id.name]

	for _, controller in pairs(rumble_id.controllers) do
		if rumble_id[2] then
			if is_nx64 then
				controller:set_rumble_strength(multiplier, rumble_id[1])
				controller:set_rumble_strength(multiplier, rumble_id[2])
			else
				controller:set_rumble_peak(rumble_id[1], (effect.peak.l or 1) * multiplier)
				controller:set_rumble_peak(rumble_id[2], (effect.peak.r or 1) * multiplier)
			end
		elseif is_nx64 then
			controller:set_rumble_strength(multiplier, rumble_id[1])
		else
			controller:set_rumble_peak(rumble_id[1], (effect.peak or 1) * multiplier)
		end
	end
end

function RumbleManager:_calc_stereo_multiplier(source, range)
	local attenuation_inverse = 500
	local assymetry_factor = 0.25
	local player = managers.player:player_unit()
	local player_position = player:position()
	player_position = player_position:with_z(0)
	source = source:with_z(0)
	local player_forward = player:rotation():x()
	local player_forward_x = player:camera():camera_unit():rotation():x()
	local player_forward_y = player:camera():camera_unit():rotation():y()
	local player_forward_z = player:camera():camera_unit():rotation():z()
	player_forward_y = player_forward_y:with_z(0)
	player_forward_y = player_forward_y / player_forward_y:length()
	local direction = player:position() - source
	local distance = direction:length()
	local direction_normalized = direction / distance
	local even_better_angle = math.atan2(player_forward_y.y, player_forward_y.x) - math.atan2(direction_normalized.y, direction_normalized.x)
	local x = source.x - player:position().x
	local y = source.y - player:position().y
	local z = source.z - player:position().z
	local mag_sqr = x * x + y * y + z * z
	local mag_sqr_normalized = mag_sqr / (range * 2)
	local sin_angle = math.sin(even_better_angle)
	local left_val = attenuation_inverse * (1 + assymetry_factor + sin_angle * (1 - assymetry_factor)) / (2 * (mag_sqr_normalized + attenuation_inverse))
	local right_val = attenuation_inverse * (1 + assymetry_factor - sin_angle * (1 - assymetry_factor)) / (2 * (mag_sqr_normalized + attenuation_inverse))

	return left_val, right_val
end

function RumbleManager:mult_distance_lerp(pos_func_list, params)
	if pos_func_list then
		local closest_pos = nil

		for pos_func in pairs(pos_func_list) do
			local next_closest_pos = pos_func(params)

			if not closest_pos or (next_closest_pos - source):lenght() < (closest_pos - source):length() then
				closest_pos = next_closest_pos
			end
		end

		if closest_pos then
			local full_dis = params.full_dis or 0
			local zero_dis = params.zero_dis or 1000 - full_dis
			local mult = params.multiplier or 1
			local source = params.source
			mult = mult * (zero_dis - math.clamp((source - closest_pos):length() - full_dis, 0, zero_dis)) / zero_dis

			return mult
		end
	end

	return 0
end

function RumbleManager:pause_rumbles(pause, mute)
	if is_nx64 then
		for _, controller in pairs(self._registered_controllers) do
			controller:pause_rumbles(pause, mute)
		end
	end
end

function RumbleManager:set_rumble_time(rumble_id, time)
	if is_nx64 then
		for _, controller in pairs(self._registered_controllers) do
			controller:set_rumble_time(rumble_id[1], time)

			if rumble_id[2] then
				controller:set_rumble_time(rumble_id[2], time)
			end
		end
	end
end
