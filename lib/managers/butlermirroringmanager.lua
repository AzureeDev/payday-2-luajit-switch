local _max_priority = 100000
local __max_priority = _max_priority - 1

local function _pick_random_snd_event(snd_events)
	local count = #snd_events
	local rnd_idx = math.random(1, count)
	local snd_event = snd_events[rnd_idx]

	return snd_event
end

local function _increase_priority(snd_event, inc, max)
	snd_event.priority = math.min(snd_event.priority * inc, max)
end

ButlerMirroringManager = ButlerMirroringManager or class()

function ButlerMirroringManager:init()
	self:_setup()
end

function ButlerMirroringManager:_setup()
	if not Global.butler_mirroring then
		Global.butler_mirroring = {
			_queue = {},
			_current_sound_event = nil
		}
	end

	self._global = Global.butler_mirroring

	managers.mission:add_global_event_listener("butler_mirroring_heist_complete", {
		Message.OnHeistComplete
	}, callback(self, self, "_on_heist_complete"))
	managers.mission:add_global_event_listener("butler_mirroring_achievement", {
		Message.OnAchievement
	}, callback(self, self, "_on_achievement"))
end

function ButlerMirroringManager:has_sound_event()
	return table.size(self._global._queue) > 0
end

function ButlerMirroringManager:get_sound_event()
	local snd_events = nil
	local priority = 0
	local debug = nil

	for _, snd in pairs(self._global._queue) do
		if priority < snd.priority then
			snd_events = snd.snd_events
			priority = snd.priority
			debug = snd.debug
		end
	end

	local snd_event = _pick_random_snd_event(snd_events)
	self._global._queue = {}

	return snd_event, debug
end

function ButlerMirroringManager:load(data, version)
	if data.butler_mirroring then
		self._global._has_entered_safehouse = data.butler_mirroring._has_entered_safehouse
		self._global._queue = deep_clone(data.butler_mirroring._queue)
	end
end

function ButlerMirroringManager:save(data)
	local save_data = deep_clone(self._global)
	data.butler_mirroring = save_data
end

function ButlerMirroringManager:_on_heist_complete(level_id, difficulty_id)
	local sound_event = nil

	if not sound_event then
		return
	end

	local inc = 1.1

	if self._global._queue[Message.OnHeistComplete] then
		self._global._queue[Message.OnHeistComplete].snd_events = {
			sound_event
		}

		_increase_priority(self._global._queue[Message.OnHeistComplete], inc, __max_priority)
	else
		self._global._queue[Message.OnHeistComplete] = {
			priority = 5.8,
			debug = "On heist complete VO",
			snd_events = {
				sound_event
			}
		}
	end
end

function ButlerMirroringManager:_on_achievement(id)
	local l = {
		the_wire = "Play_btl_ach_08",
		halloween_nightmare_5 = "Play_btl_ach_12",
		gage_8 = "Play_btl_ach_02",
		gage2_8 = "Play_btl_ach_06",
		kosugi_4 = "Play_btl_ach_09",
		frog_1 = "Play_btl_ach_10",
		deer_7 = "Play_btl_ach_04",
		farm_6 = "Play_btl_ach_01",
		short_fuse = "Play_btl_ach_13",
		gage3_9 = "Play_btl_ach_05",
		sinus_1 = "Play_btl_ach_15",
		gorilla_1 = "Play_btl_ach_03",
		gage2_10 = "Play_btl_ach_07",
		death_29 = "Play_btl_ach_11",
		death_30 = "Play_btl_ach_14"
	}
	local snd_event = l[id]

	if snd_event then
		local inc = 100.1

		if self._global._queue[Message.OnAchievement] then
			_increase_priority(self._global._queue[Message.OnAchievement], inc, __max_priority)
		else
			self._global._queue[Message.OnAchievement] = {
				priority = 200.8,
				debug = "On achievement VO",
				snd_events = {
					snd_event
				}
			}
		end
	end
end

function ButlerMirroringManager:_on_level_up()
	local rnd = math.random()

	if rnd > 0.4 then
		local inc = 100.1

		if self._global._queue[Message.OnLevelUp] then
			_increase_priority(self._global._queue[Message.OnLevelUp], inc, __max_priority)
		else
			self._global._queue[Message.OnLevelUp] = {
				priority = 20.8,
				debug = "On level up VO",
				snd_events = {
					"Play_btl_lvl"
				}
			}
		end
	end
end
