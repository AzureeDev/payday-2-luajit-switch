core:module("RumbleManager")
core:import("CoreRumbleManager")
core:import("CoreClass")

RumbleManager = RumbleManager or class(CoreRumbleManager.RumbleManager)

function RumbleManager:init()
	RumbleManager.super.init(self)
	_G.tweak_data:add_reload_callback(self, callback(self, self, "setup_preset_rumbles"))
	self:setup_preset_rumbles()

	if SystemInfo:platform() == Idstring("NX64") then
		_G.tweak_data:add_reload_callback(self, callback(self, self, "setup_audio_preset_rumbles"))
		self:setup_audio_preset_rumbles()
	end
end

function RumbleManager:setup_audio_preset_rumbles()
	if SystemInfo:platform() == Idstring("NX64") then
		self:add_audio_preset_rumbles("lever_pull", "lever_pull")
		self:add_audio_preset_rumbles("lever_release", "lever_release")
		self:add_audio_preset_rumbles("pull_lever", "lever_pull")
		self:add_audio_preset_rumbles("release_lever", "lever_release")
		self:add_audio_preset_rumbles("c96_pull", "lever_pull")
		self:add_audio_preset_rumbles("c96_release", "lever_release")
		self:add_audio_preset_rumbles("slide_in", "clip_in")
		self:add_audio_preset_rumbles("slide_out", "clip_out")
		self:add_audio_preset_rumbles("clip_in", "clip_in")
		self:add_audio_preset_rumbles("clip_out", "clip_out")
		self:add_audio_preset_rumbles("clip_grab", "generic_contact")
		self:add_audio_preset_rumbles("mag_slap", "generic_contact")
		self:add_audio_preset_rumbles("mag_jerk", "generic_contact")
		self:add_audio_preset_rumbles("mag_contact", "generic_contact")
		self:add_audio_preset_rumbles("mantel_back", "generic_contact")
		self:add_audio_preset_rumbles("first_slide", "clip_in")
		self:add_audio_preset_rumbles("second_slide", "clip_in")
		self:add_audio_preset_rumbles("reload_cock", "reload_cock")
		self:add_audio_preset_rumbles("shell_insert", "shell_insert")
		self:add_audio_preset_rumbles("insert_shell", "shell_insert")
		self:add_audio_preset_rumbles("load_shell", "shell_insert")
		self:add_audio_preset_rumbles("barrel_close", "barrel_close")
		self:add_audio_preset_rumbles("barrel_open", "barrel_open")
		self:add_audio_preset_rumbles("shell_out", "shell_out")
		self:add_audio_preset_rumbles("drum_open", "barrel_open")
		self:add_audio_preset_rumbles("drum_close", "barrel_close")
		self:add_audio_preset_rumbles("shells_in", "shell_insert")
		self:add_audio_preset_rumbles("shells_out", "shell_out")
		self:add_audio_preset_rumbles("grenade_contact", "generic_contact")
		self:add_audio_preset_rumbles("grenade_slide", "grenade_slide")
		self:add_audio_preset_rumbles("grenade_jerk", "grenade_jerk")
		self:add_audio_preset_rumbles("safety_click", "generic_click")
		self:add_audio_preset_rumbles("push_in", "clip_in")
		self:add_audio_preset_rumbles("drag_out", "clip_out")
		self:add_audio_preset_rumbles("rotate_mag", "rotate_mag")
		self:add_audio_preset_rumbles("close_mag", "close_mag")
		self:add_audio_preset_rumbles("pull_handle", "lever_pull")
		self:add_audio_preset_rumbles("push_handle", "lever_release")
		self:add_audio_preset_rumbles("pull_string", "pull_string")
		self:add_audio_preset_rumbles("string_locked", "string_locked")
		self:add_audio_preset_rumbles("new_arrow", "insert_arrow")
		self:add_audio_preset_rumbles("insert_arrow", "insert_arrow")
		self:add_audio_preset_rumbles("wind_up", "wind_up")
		self:add_audio_preset_rumbles("arrow_click", "insert_arrow")
		self:add_audio_preset_rumbles("blade_grab_throw", "generic_grab")
		self:add_audio_preset_rumbles("blade_load", "blade_load")
		self:add_audio_preset_rumbles("valve_close", "generic_click")
		self:add_audio_preset_rumbles("unlock_tank", "unlock_tank")
		self:add_audio_preset_rumbles("pull_out_tank", "pull_out_tank")
		self:add_audio_preset_rumbles("insert_tank", "insert_tank")
		self:add_audio_preset_rumbles("lock_tank", "lock_tank")
		self:add_audio_preset_rumbles("push_in_tank", "push_in_tank")
		self:add_audio_preset_rumbles("valve_open", "generic_click")
		self:add_audio_preset_rumbles("grab_belt", "generic_grab")
		self:add_audio_preset_rumbles("belt_in", "belt_in")
		self:add_audio_preset_rumbles("belt_out", "belt_out")
		self:add_audio_preset_rumbles("box_out", "clip_out")
		self:add_audio_preset_rumbles("box_in", "clip_in")
		self:add_audio_preset_rumbles("cover_up", "cover_up")
		self:add_audio_preset_rumbles("mag_out", "clip_out")
		self:add_audio_preset_rumbles("mag_in", "clip_in")
		self:add_audio_preset_rumbles("belt_to_feeder", "belt_to_feeder")
		self:add_audio_preset_rumbles("cover_down", "cover_down")
	end
end

function RumbleManager:setup_preset_rumbles()
	if SystemInfo:platform() == Idstring("NX64") then
		self:add_preset_rumbles("weapon_fire", {
			priority = 5,
			loop = false,
			engine = "hybrid",
			amplitudes = {
				l = {
					0.6,
					0.6,
					0.6,
					0.6,
					0.6
				},
				r = {
					0.8,
					0.8,
					0.8,
					0.8
				}
			},
			frequencies = {
				l = {
					160,
					150,
					130,
					100,
					100
				},
				r = {
					320,
					310,
					290,
					260
				}
			},
			time_points = {
				l = {
					0,
					0.04,
					0.08,
					0.12,
					0.3
				},
				r = {
					0,
					0.04,
					0.08,
					0.12
				}
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				150,
				150,
				150,
				150,
				150,
				150,
				150
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol_s", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				130,
				135,
				145,
				130,
				140,
				130,
				130
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.15
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol_auto", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				150,
				150,
				150,
				150,
				150,
				150,
				150
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol_s_auto", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				130,
				135,
				145,
				130,
				140,
				130,
				130
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.15
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				150,
				150,
				150,
				150,
				150,
				150,
				150
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol_s_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				130,
				135,
				145,
				130,
				140,
				130,
				130
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.15
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol_auto_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				150,
				150,
				150,
				150,
				150,
				150,
				150
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol_s_auto_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				130,
				135,
				145,
				130,
				140,
				130,
				130
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.15
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol_r", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				150,
				150,
				150,
				150,
				150,
				150,
				150
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol_s_r", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				130,
				135,
				145,
				130,
				140,
				130,
				130
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.15
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol_auto_r", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				150,
				150,
				150,
				150,
				150,
				150,
				150
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_pistol_s_auto_r", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.6,
				0.2,
				0.48,
				0.2,
				0.2
			},
			frequencies = {
				130,
				135,
				145,
				130,
				140,
				130,
				130
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.06,
				0.07,
				0.15
			}
		})
		self:add_preset_rumbles("weapon_fire_shotgun", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.4,
				0.7,
				0.03,
				0.7,
				0.09,
				0.7,
				0.26,
				0.5,
				0.4,
				0.4
			},
			frequencies = {
				190,
				190,
				190,
				190,
				190,
				190,
				190,
				190,
				190,
				190
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08,
				0.25
			}
		})
		self:add_preset_rumbles("weapon_fire_shotgun_s", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.4,
				0.7,
				0.03,
				0.7,
				0.09,
				0.7,
				0.26,
				0.5,
				0.4,
				0.4
			},
			frequencies = {
				120,
				150,
				110,
				150,
				115,
				150,
				120,
				130,
				125,
				125
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08,
				0.25
			}
		})
		self:add_preset_rumbles("weapon_fire_shotgun_auto", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.4,
				0.7,
				0.03,
				0.7,
				0.09,
				0.7,
				0.26,
				0.5,
				0.4,
				0.4
			},
			frequencies = {
				190,
				190,
				190,
				190,
				190,
				190,
				190,
				190,
				190,
				190
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08,
				0.25
			}
		})
		self:add_preset_rumbles("weapon_fire_shotgun_s_auto", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.4,
				0.7,
				0.03,
				0.7,
				0.09,
				0.7,
				0.26,
				0.5,
				0.4,
				0.4
			},
			frequencies = {
				120,
				150,
				110,
				150,
				115,
				150,
				120,
				130,
				125,
				125
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08,
				0.25
			}
		})
		self:add_preset_rumbles("weapon_fire_assault_rifle_s", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0.4,
				0.55,
				0.1,
				0.55,
				0.1,
				0.1
			},
			frequencies = {
				150,
				280,
				100,
				260,
				120,
				120
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_assault_rifle_s_auto", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0.4,
				0.55,
				0.1,
				0.55,
				0.1,
				0.1
			},
			frequencies = {
				150,
				280,
				100,
				260,
				120,
				120
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_assault_rifle", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.7,
				0.05,
				0.6,
				0.1,
				0.1
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_assault_rifle_auto", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.7,
				0.05,
				0.6,
				0.1,
				0.1
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_lmg_s_auto", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.4,
				0.1,
				0.6,
				0.1,
				0.5,
				0.1,
				0.4
			},
			frequencies = {
				125,
				140,
				130,
				145,
				130,
				143,
				130,
				135
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08
			}
		})
		self:add_preset_rumbles("weapon_fire_lmg_auto", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.4,
				0.1,
				0.6,
				0.1,
				0.5,
				0.1,
				0.4
			},
			frequencies = {
				140,
				150,
				140,
				150,
				140,
				150,
				140,
				150
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08
			}
		})
		self:add_preset_rumbles("weapon_fire_smg", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				160,
				160,
				120,
				160,
				120,
				160,
				160
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_smg_auto", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				160,
				160,
				120,
				160,
				120,
				160,
				160
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_smg_s", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				100,
				160,
				120,
				140,
				120,
				130,
				90
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_smg_s_auto", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				100,
				160,
				120,
				140,
				120,
				130,
				90
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_smg_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				160,
				160,
				120,
				160,
				120,
				160,
				160
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_smg_auto_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				160,
				160,
				120,
				160,
				120,
				160,
				160
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_smg_s_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				100,
				160,
				120,
				140,
				120,
				130,
				90
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_smg_s_auto_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				100,
				160,
				120,
				140,
				120,
				130,
				90
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_smg_r", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				160,
				160,
				120,
				160,
				120,
				160,
				160
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_smg_auto_r", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				160,
				160,
				120,
				160,
				120,
				160,
				160
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_smg_s_R", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				100,
				160,
				120,
				140,
				120,
				130,
				90
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_smg_s_auto_r", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.5,
				0.1,
				0.4,
				0.1,
				0.3,
				0
			},
			frequencies = {
				100,
				160,
				120,
				140,
				120,
				130,
				90
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.1
			}
		})
		self:add_preset_rumbles("weapon_fire_snp", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0,
				0.9,
				0.09,
				0.9,
				0.09,
				0.8,
				0.09,
				0.8,
				0.09,
				0.5,
				0.06,
				0.06,
				0.04,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.06,
				0.07,
				0.09,
				0.1,
				0.12,
				0.13,
				0.17,
				0.3,
				0.4
			}
		})
		self:add_preset_rumbles("weapon_fire_snp_s", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0,
				0.9,
				0.09,
				0.9,
				0.09,
				0.8,
				0.09,
				0.8,
				0.09,
				0.5,
				0.06,
				0.06,
				0.04,
				0
			},
			frequencies = {
				120,
				280,
				150,
				280,
				150,
				250,
				150,
				250,
				150,
				200,
				130,
				130,
				125,
				120
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.06,
				0.07,
				0.09,
				0.1,
				0.12,
				0.13,
				0.17,
				0.3,
				0.4
			}
		})
		self:add_preset_rumbles("weapon_fire_grenade_launcher", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0,
				0,
				0.8,
				0.2,
				0,
				0
			},
			frequencies = {
				160,
				160,
				250,
				250,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.2,
				0.4,
				0.5
			}
		})
		self:add_preset_rumbles("weapon_fire_rocket_launcher", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.7,
				0.4,
				0.3,
				0.2,
				0.1,
				0.05
			},
			frequencies = {
				200,
				190,
				180,
				170,
				160,
				160,
				160,
				150,
				150,
				150,
				150,
				150,
				150
			},
			time_points = {
				0,
				0.07,
				0.12,
				0.14,
				0.17,
				0.21,
				0.23,
				0.26,
				0.27,
				0.55,
				0.71,
				0.83,
				0.98
			}
		})
		self:add_preset_rumbles("weapon_fire_bow", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.2,
				0.2,
				0.8,
				0.8
			},
			frequencies = {
				100,
				100,
				100,
				150
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.05
			}
		})
		self:add_preset_rumbles("weapon_bow_draw", {
			priority = 4,
			loop = true,
			engine = "both",
			loop_start_time = 0.8,
			amplitudes = {
				0.05,
				0.1,
				0.25,
				0.4,
				0.55,
				0.55
			},
			frequencies = {
				100,
				103,
				106,
				110,
				120,
				120
			},
			time_points = {
				0,
				0.23,
				0.44,
				0.6,
				0.8,
				0.99
			}
		})
		self:add_preset_rumbles("weapon_fire_minigun_auto", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0.1,
				0.1,
				0.6,
				0.1
			},
			frequencies = {
				195,
				195,
				195,
				195
			},
			time_points = {
				0,
				0.02,
				0.04,
				0.06
			}
		})
		self:add_preset_rumbles("weapon_fire_flamethrower", {
			priority = 5,
			loop = true,
			engine = "both",
			loop_start_time = 1,
			amplitudes = {
				0,
				0.08,
				0.16,
				0.32,
				0.48,
				0.6,
				0.6,
				0.6,
				0.6,
				0.6,
				0.6,
				0.6,
				0.6
			},
			frequencies = {
				100,
				110,
				120,
				130,
				140,
				150,
				130,
				150,
				130,
				150,
				130,
				150,
				130
			},
			time_points = {
				0,
				0.19,
				0.4,
				0.58,
				0.73,
				0.87,
				1,
				1.08,
				1.15,
				1.2,
				1.3,
				1.4,
				1.5
			}
		})
		self:add_preset_rumbles("weapon_fire_crossbow", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0,
				0.9,
				0
			},
			frequencies = {
				100,
				250,
				100
			},
			time_points = {
				0,
				0.05,
				0.06
			}
		})
		self:add_preset_rumbles("weapon_fire_saw", {
			priority = 5,
			loop = true,
			engine = "both",
			loop_start_time = 0,
			amplitudes = {
				0,
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.8
			},
			frequencies = {
				200,
				200,
				200,
				200,
				200,
				200,
				200,
				200,
				200,
				200,
				200,
				200,
				200,
				200,
				200
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08,
				0.09,
				0.1,
				0.11,
				0.12,
				0.13,
				0.14
			}
		})
		self:add_preset_rumbles("weapon_idle_saw", {
			priority = 5,
			loop = true,
			engine = "both",
			loop_start_time = 0.1,
			amplitudes = {
				0,
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.8,
				0.2,
				0.8
			},
			frequencies = {
				200,
				200,
				202,
				205,
				208,
				211,
				214,
				217,
				221,
				225,
				235,
				245,
				250,
				250,
				250
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08,
				0.09,
				0.1,
				0.11,
				0.12,
				0.13,
				0.14
			}
		})
		self:add_preset_rumbles("weapon_fire_joy", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0,
				0
			},
			frequencies = {
				140,
				150,
				140,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.05,
				0.32
			}
		})
		self:add_preset_rumbles("weapon_fire_joy_s", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0,
				0
			},
			frequencies = {
				140,
				130,
				120,
				140,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.05,
				0.32
			}
		})
		self:add_preset_rumbles("weapon_fire_joy_auto", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0
			},
			frequencies = {
				140,
				150,
				140,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04
			}
		})
		self:add_preset_rumbles("weapon_fire_joy_s_auto", {
			priority = 5,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0
			},
			frequencies = {
				140,
				130,
				120,
				140,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.05
			}
		})
		self:add_preset_rumbles("weapon_fire_joy_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0,
				0
			},
			frequencies = {
				140,
				150,
				140,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.05,
				0.32
			}
		})
		self:add_preset_rumbles("weapon_fire_joy_s_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0,
				0
			},
			frequencies = {
				140,
				130,
				120,
				140,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.05,
				0.32
			}
		})
		self:add_preset_rumbles("weapon_fire_joy_auto_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0
			},
			frequencies = {
				140,
				150,
				140,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04
			}
		})
		self:add_preset_rumbles("weapon_fire_joy_s_auto_l", {
			priority = 5,
			cumulative = true,
			engine = "left",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0
			},
			frequencies = {
				140,
				130,
				120,
				140,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.05
			}
		})
		self:add_preset_rumbles("weapon_fire_joy_r", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0,
				0
			},
			frequencies = {
				140,
				150,
				140,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.05,
				0.32
			}
		})
		self:add_preset_rumbles("weapon_fire_joy_s_r", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0,
				0
			},
			frequencies = {
				140,
				130,
				120,
				140,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.05,
				0.32
			}
		})
		self:add_preset_rumbles("weapon_fire_joy_auto_r", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0
			},
			frequencies = {
				140,
				150,
				140,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04
			}
		})
		self:add_preset_rumbles("weapon_fire_joy_s_auto_r", {
			priority = 5,
			cumulative = true,
			engine = "right",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.05,
				0.4,
				0
			},
			frequencies = {
				140,
				130,
				120,
				140,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.05
			}
		})
		self:add_preset_rumbles("land", {
			priority = 3,
			loop = false,
			engine = "hybrid",
			amplitudes = {
				l = {
					0,
					0,
					0.2,
					0.3
				},
				r = {
					0.4,
					0.3
				}
			},
			frequencies = {
				l = {
					0,
					0,
					170,
					270
				},
				r = {
					170,
					270
				}
			},
			time_points = {
				l = {
					0,
					0.1,
					0.11,
					0.3
				},
				r = {
					0,
					0.2
				}
			}
		})
		self:add_preset_rumbles("hard_land", {
			priority = 3,
			loop = false,
			engine = "hybrid",
			amplitudes = {
				l = {
					0,
					0,
					0.8,
					1,
					1
				},
				r = {
					1,
					0.8,
					0.8
				}
			},
			frequencies = {
				l = {
					0,
					0,
					150,
					250,
					250
				},
				r = {
					150,
					250,
					250
				}
			},
			time_points = {
				l = {
					0,
					0.1,
					0.11,
					0.3,
					0.35
				},
				r = {
					0,
					0.2,
					0.35
				}
			}
		})
		self:add_preset_rumbles("electrified", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.3,
				0.3
			},
			frequencies = {
				200,
				200
			},
			time_points = {
				0,
				0.1
			}
		})
		self:add_preset_rumbles("electric_shock", {
			priority = 5,
			loop = true,
			engine = "both",
			loop_start_time = 0,
			amplitudes = {
				0.5,
				0.5,
				0.5
			},
			frequencies = {
				120,
				320,
				120
			},
			time_points = {
				0,
				0.04,
				0.08
			}
		})
		self:add_preset_rumbles("incapacitated_shock", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.3,
				0.3
			},
			frequencies = {
				200,
				200
			},
			time_points = {
				0,
				0.1
			}
		})
		self:add_preset_rumbles("damage_bullet", {
			priority = 2,
			loop = false,
			engine = "both",
			amplitudes = {
				0,
				0.2,
				0.4,
				0.8,
				0.2
			},
			frequencies = {
				200,
				200,
				200,
				200,
				200
			},
			time_points = {
				0,
				0.01,
				0.017,
				0.03,
				0.05
			}
		})
		self:add_preset_rumbles("damage_melee", {
			priority = 2,
			loop = false,
			engine = "both",
			amplitudes = {
				0.4,
				0.4,
				0.27,
				0.3
			},
			frequencies = {
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.07,
				0.12,
				0.2
			}
		})
		self:add_preset_rumbles("bullet_whizby", {
			priority = 2,
			loop = false,
			engine = "both",
			amplitudes = {
				0.3,
				0.3
			},
			frequencies = {
				200,
				200
			},
			time_points = {
				0,
				0.1
			}
		})
		self:add_preset_rumbles("melee_hit", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.3,
				0.3
			},
			frequencies = {
				200,
				200
			},
			time_points = {
				0,
				0.1
			}
		})
		self:add_preset_rumbles("melee_charge", {
			priority = 5,
			loop = true,
			engine = "both",
			loop_start_time = 0.9,
			amplitudes = {
				0,
				0.03,
				0.05,
				0.08,
				0.13,
				0.2,
				0.3,
				0.1
			},
			frequencies = {
				80,
				85,
				90,
				95,
				100,
				105,
				110,
				110
			},
			time_points = {
				0,
				0.1,
				0.2,
				0.3,
				0.4,
				0.5,
				0.9,
				1
			}
		})
		self:add_preset_rumbles("melee_pop", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.3,
				0.1,
				0.05,
				0.03,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				320
			},
			time_points = {
				0,
				0.01,
				0.03,
				0.05,
				0.25
			}
		})
		self:add_preset_rumbles("smash_glass", {
			priority = 2,
			loop = false,
			engine = "both",
			amplitudes = {
				0,
				0.9,
				0.12,
				0.9,
				0.2,
				0.9,
				0.22,
				0.8,
				0.25,
				1
			},
			frequencies = {
				160,
				300,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				320
			},
			time_points = {
				0,
				0.03,
				0.05,
				0.06,
				0.07,
				0.08,
				0.09,
				0.1,
				0.12,
				0.15
			}
		})
		self:add_preset_rumbles("lock_picking", {
			priority = 2,
			loop = true,
			engine = "both",
			loop_start_time = 0,
			amplitudes = {
				0.05,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05
			},
			frequencies = {
				160,
				180,
				160,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08,
				0.09,
				0.1,
				0.11,
				0.12,
				0.13,
				0.14,
				0.15,
				0.16,
				0.17,
				0.18,
				0.19,
				0.2
			}
		})
		self:add_preset_rumbles("lock_picking_true", {
			priority = 2,
			loop = false,
			engine = "both",
			amplitudes = {
				0.05,
				0.03,
				0.05,
				0.03,
				0.2,
				0.03,
				0.05,
				0.03,
				0.6,
				0.03,
				0.05,
				0.03,
				0.7,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05
			},
			frequencies = {
				160,
				180,
				160,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08,
				0.09,
				0.1,
				0.11,
				0.12,
				0.13,
				0.14,
				0.15,
				0.16,
				0.17,
				0.18,
				0.19,
				0.2
			}
		})
		self:add_preset_rumbles("lock_picking_false", {
			priority = 2,
			loop = true,
			engine = "both",
			loop_start_time = 0,
			amplitudes = {
				0.05,
				0.03,
				0.05,
				0.03,
				0.19,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.4,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05,
				0.03,
				0.05
			},
			frequencies = {
				160,
				180,
				160,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180,
				160,
				180
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08,
				0.09,
				0.1,
				0.11,
				0.12,
				0.13,
				0.14,
				0.15,
				0.16,
				0.17,
				0.18,
				0.19,
				0.2
			}
		})
		self:add_preset_rumbles("heartbeat", {
			priority = 2,
			loop = true,
			engine = "both",
			loop_start_time = 0,
			amplitudes = {
				0,
				0.4,
				0.1,
				0.6,
				0.1,
				0.1,
				0.1,
				0.4,
				0.1,
				0.7,
				0.1,
				0.1,
				0.1
			},
			frequencies = {
				0,
				140,
				100,
				180,
				100,
				100,
				100,
				140,
				100,
				180,
				100,
				100,
				100
			},
			time_points = {
				0,
				0.03,
				0.06,
				0.1,
				0.16,
				0.21,
				0.3,
				0.35,
				0.38,
				0.43,
				0.48,
				0.64,
				0.8
			}
		})
		self:add_preset_rumbles("hammer_planks", {
			priority = 2,
			loop = true,
			engine = "both",
			loop_start_time = 0,
			amplitudes = {
				0,
				0.05,
				0,
				0,
				0.1,
				0,
				0,
				0.15,
				0,
				0,
				0.2,
				0,
				0,
				0.25,
				0,
				0,
				0.3,
				0,
				0,
				0.3,
				0,
				0,
				0.3,
				0,
				0,
				0.3,
				0,
				0,
				0.3,
				0,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.025,
				0.35,
				1.85,
				1.9,
				1.95,
				2.25,
				2.3,
				2.35,
				2.65,
				2.7,
				2.75,
				3,
				3.05,
				3.1,
				3.3,
				3.35,
				3.4,
				3.6,
				3.65,
				3.7,
				3.9,
				3.95,
				4,
				4.25,
				4.3,
				4.35,
				4.6,
				4.65,
				4.7,
				5.1
			}
		})
		self:add_preset_rumbles("mission_triggered", {
			priority = 2,
			loop = false,
			engine = "both",
			amplitudes = {
				0.1,
				0.75,
				0.66,
				0.75,
				0.66,
				0.69,
				0.66,
				0.7,
				0.67,
				0.29,
				0.2,
				0.1,
				0
			},
			frequencies = {
				151,
				157,
				152,
				156,
				154,
				157,
				151,
				155,
				152,
				156,
				153,
				154,
				152
			},
			time_points = {
				0,
				0.09,
				0.12,
				0.2,
				0.25,
				0.32,
				0.4,
				0.44,
				0.54,
				0.67,
				0.77,
				0.91,
				1
			}
		})
		self:add_preset_rumbles("place_drill", {
			priority = 1,
			loop = true,
			engine = "both",
			loop_start_time = 0,
			amplitudes = {
				0.03,
				0.01,
				0.08,
				0.01,
				0.02,
				0.01,
				0.05,
				0.01,
				0.15,
				0.01,
				0
			},
			frequencies = {
				120,
				120,
				150,
				120,
				130,
				120,
				120,
				120,
				200,
				120,
				120
			},
			time_points = {
				0,
				0.5,
				0.6,
				0.7,
				1.1,
				1.5,
				1.7,
				2,
				2.22,
				2.49,
				3
			}
		})
		self:add_preset_rumbles("drill_activate", {
			priority = 2,
			loop = false,
			engine = "both",
			amplitudes = {
				0.03,
				0.09,
				0.2,
				0.35,
				0.5,
				0.7,
				0.21,
				0.37,
				0.04,
				0.22,
				0.01
			},
			frequencies = {
				140,
				150,
				160,
				170,
				180,
				190,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.03,
				0.06,
				0.07,
				0.09,
				0.12,
				0.14,
				0.16,
				0.16,
				0.18,
				0.19
			}
		})
		self:add_preset_rumbles("bad_gas", {
			priority = 3,
			loop = true,
			engine = "both",
			loop_start_time = 0,
			amplitudes = {
				0.05,
				0.08,
				0.24,
				0.05,
				0.05,
				0.05
			},
			frequencies = {
				160,
				165,
				175,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.22,
				0.47,
				0.69,
				1.5,
				2
			}
		})
		self:add_preset_rumbles("generic_contact", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.2,
				0,
				0,
				0.11,
				0,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				170
			},
			time_points = {
				0,
				0.01,
				0.07,
				0.11,
				0.15,
				0.18,
				0.22
			}
		})
		self:add_preset_rumbles("generic_click", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0,
				0.15,
				0,
				0,
				0.25,
				0,
				0
			},
			frequencies = {
				140,
				140,
				150,
				140,
				140,
				160,
				140,
				140
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.07,
				0.12,
				0.13,
				0.15,
				0.29
			}
		})
		self:add_preset_rumbles("generic_grab", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0,
				0.17,
				0.01,
				0
			},
			frequencies = {
				160,
				160,
				200,
				170,
				170
			},
			time_points = {
				0,
				0.06,
				0.1,
				0.17,
				0.5
			}
		})
		self:add_preset_rumbles("lever_pull", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0,
				0.01,
				0.03,
				0.4,
				0.01,
				0.5
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				320
			},
			time_points = {
				0,
				0.01,
				0.035,
				0.06,
				0.08,
				0.1,
				0.21
			}
		})
		self:add_preset_rumbles("lever_release", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0,
				0.02,
				0.04,
				0.4,
				0.01,
				0.01,
				0.01
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				258,
				160
			},
			time_points = {
				0,
				0.01,
				0.035,
				0.06,
				0.08,
				0.1,
				0.15,
				0.2
			}
		})
		self:add_preset_rumbles("clip_in", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.01,
				0.07,
				0.22,
				0.05,
				0.33,
				0.02,
				0.16,
				0.03,
				0,
				0.13,
				0.01,
				0,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.02,
				0.04,
				0.05,
				0.06,
				0.07,
				0.1,
				0.12,
				0.14,
				0.24,
				0.26,
				0.27,
				0.35,
				0.4
			}
		})
		self:add_preset_rumbles("clip_out", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.01,
				0.22,
				0.05,
				0.25,
				0.02,
				0.16,
				0,
				0,
				0,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.02,
				0.05,
				0.06,
				0.07,
				0.1,
				0.12,
				0.14,
				0.24,
				0.3,
				0.35
			}
		})
		self:add_preset_rumbles("reload_cock", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0.1,
				0.1,
				0.4,
				0.8,
				0.4,
				0.1,
				0.1,
				0.4,
				0.8,
				0.4,
				0.1,
				0.1
			},
			frequencies = {
				120,
				120,
				150,
				180,
				150,
				120,
				120,
				150,
				180,
				150,
				120,
				120
			},
			time_points = {
				0,
				0.06,
				0.09,
				0.1,
				0.11,
				0.14,
				0.22,
				0.24,
				0.25,
				0.26,
				0.28,
				0.3
			}
		})
		self:add_preset_rumbles("shell_insert", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.2,
				0.06,
				0.21,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				320
			},
			time_points = {
				0,
				0.03,
				0.05,
				0.08,
				0.14
			}
		})
		self:add_preset_rumbles("barrel_open", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0.01,
				0.01,
				0.09,
				0.01,
				0.2,
				0.01,
				0.09,
				0,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.05,
				0.06,
				0.07,
				0.09,
				0.1,
				0.11,
				0.12,
				0.43
			}
		})
		self:add_preset_rumbles("barrel_close", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.01,
				0.01,
				0.1,
				0.01,
				0.01,
				0.2,
				0.02,
				0.01,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08,
				0.09,
				0.15,
				0.36
			}
		})
		self:add_preset_rumbles("shell_out", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0,
				0.08,
				0.06,
				0.04,
				0.02,
				0
			},
			frequencies = {
				160,
				160,
				170,
				165,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.03,
				0.04,
				0.06,
				0.08,
				0.11,
				0.28
			}
		})
		self:add_preset_rumbles("grenade_slide", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.04,
				0.25,
				0.04,
				0.03,
				0.14,
				0.04,
				0.05,
				0.06,
				0.07,
				0.08,
				0.09,
				0.1
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				320
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04,
				0.07,
				0.1,
				0.18,
				0.23,
				0.29,
				0.35,
				0.38,
				0.42
			}
		})
		self:add_preset_rumbles("grenade_jerk", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0.01,
				0.2,
				0.03,
				0.03
			},
			frequencies = {
				160,
				160,
				160,
				180
			},
			time_points = {
				0,
				0.04,
				0.045,
				0.12
			}
		})
		self:add_preset_rumbles("rotate_mag", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0,
				0,
				0.3,
				0,
				0,
				0,
				0.15,
				0,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.04,
				0.15,
				0.19,
				0.2,
				0.22,
				0.24,
				0.26,
				0.29,
				0.42
			}
		})
		self:add_preset_rumbles("close_mag", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.03,
				0.03,
				0.07,
				0.04,
				0.12,
				0.03,
				0.3,
				0.02,
				0.18,
				0.09,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.15,
				0.22,
				0.25,
				0.42,
				0.45,
				0.49,
				0.52,
				0.54,
				0.6,
				0.85
			}
		})
		self:add_preset_rumbles("pull_string", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.03,
				0.05,
				0.07,
				0.09,
				0.11,
				0.13,
				0.17
			},
			frequencies = {
				170,
				175,
				180,
				190,
				200,
				205,
				210,
				215
			},
			time_points = {
				0,
				0.06,
				0.12,
				0.16,
				0.22,
				0.29,
				0.35,
				0.41
			}
		})
		self:add_preset_rumbles("string_locked", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0,
				0.5,
				0,
				0
			},
			frequencies = {
				160,
				160,
				200,
				160,
				160
			},
			time_points = {
				0,
				0.03,
				0.04,
				0.05,
				0.2
			}
		})
		self:add_preset_rumbles("insert_arrow", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0,
				0.15,
				0,
				0,
				0.2,
				0,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.025,
				0.03,
				0.035,
				0.08,
				0.09,
				0.1,
				0.19
			}
		})
		self:add_preset_rumbles("wind_up", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.01,
				0.03,
				0.06,
				0
			},
			frequencies = {
				120,
				140,
				160,
				165,
				150
			},
			time_points = {
				0,
				0.1,
				0.17,
				0.23,
				0.34
			}
		})
		self:add_preset_rumbles("blade_load", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.3,
				0.3,
				0.2,
				0.4,
				0.45,
				0.4,
				0.3,
				0.1,
				0
			},
			frequencies = {
				120,
				125,
				125,
				120,
				130,
				135,
				120,
				125,
				120,
				120
			},
			time_points = {
				0,
				0.08,
				0.1,
				0.15,
				0.2,
				0.22,
				0.25,
				0.37,
				0.45,
				0.5
			}
		})
		self:add_preset_rumbles("unlock_tank", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.1,
				0.02,
				0,
				0.11,
				0.01,
				0.14,
				0.08,
				0.02,
				0.03,
				0.04,
				0.06,
				0.07,
				0.18,
				0.25,
				0
			},
			frequencies = {
				120,
				160,
				160,
				120,
				120,
				165,
				170,
				165,
				120,
				130,
				135,
				140,
				145,
				150,
				180,
				160
			},
			time_points = {
				0,
				0.02,
				0.08,
				0.1,
				0.12,
				0.15,
				0.26,
				0.3,
				0.35,
				0.4,
				0.44,
				0.5,
				0.52,
				0.53,
				0.58,
				0.65
			}
		})
		self:add_preset_rumbles("pull_out_tank", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0.4,
				0.4,
				0.4,
				0.4,
				0.4
			},
			frequencies = {
				150,
				150,
				150,
				150,
				150
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.04,
				0.05
			}
		})
		self:add_preset_rumbles("insert_tank", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.4,
				0,
				0,
				0.4,
				0,
				0,
				0.6,
				0,
				0
			},
			frequencies = {
				160,
				200,
				160,
				160,
				200,
				160,
				160,
				200,
				160,
				160
			},
			time_points = {
				0,
				0.018,
				0.03,
				0.13,
				0.14,
				0.18,
				0.29,
				0.31,
				0.34,
				0.41
			}
		})
		self:add_preset_rumbles("lock_tank", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.2,
				0,
				0,
				0.35,
				0,
				0,
				0.4,
				0,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.04,
				0.06,
				0.13,
				0.14,
				0.16,
				0.2,
				0.21,
				0.24,
				0.37
			}
		})
		self:add_preset_rumbles("push_in_tank", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0.1,
				0.1,
				0.3,
				0.1,
				0.1,
				0.4,
				0,
				0
			},
			frequencies = {
				150,
				150,
				185,
				185,
				150,
				185,
				160,
				160
			},
			time_points = {
				0,
				0.17,
				0.18,
				0.19,
				0.21,
				0.22,
				0.23,
				0.31
			}
		})
		self:add_preset_rumbles("belt_in_short", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0,
				0.2,
				0.03,
				0.03,
				0.1,
				0,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.09,
				0.17,
				0.18,
				0.19,
				0.25
			}
		})
		self:add_preset_rumbles("belt_in_long", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0,
				0.05,
				0,
				0.3,
				0,
				0,
				0.3,
				0,
				0,
				0.15,
				0,
				0
			},
			frequencies = {
				160,
				160,
				165,
				160,
				175,
				160,
				160,
				175,
				160,
				160,
				165,
				160,
				160
			},
			time_points = {
				0,
				0.02,
				0.03,
				0.08,
				0.1,
				0.11,
				0.24,
				0.25,
				0.27,
				0.79,
				0.8,
				0.82,
				1.08
			}
		})
		self:add_preset_rumbles("belt_out", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.03,
				0.03,
				0.2,
				0.03,
				0.03,
				0.08,
				0.03,
				0.03
			},
			frequencies = {
				140,
				140,
				140,
				160,
				140,
				140,
				160,
				140,
				140
			},
			time_points = {
				0,
				0.02,
				0.07,
				0.08,
				0.14,
				0.18,
				0.19,
				0.21,
				0.4
			}
		})
		self:add_preset_rumbles("cover_up", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.04,
				0,
				0,
				0.07,
				0,
				0.15,
				0,
				0,
				0.06,
				0,
				0
			},
			frequencies = {
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160,
				160
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.15,
				0.16,
				0.17,
				0.2,
				0.22,
				0.32,
				0.33,
				0.34,
				0.45
			}
		})
		self:add_preset_rumbles("belt_to_feeder", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0,
				0.1,
				0,
				0,
				0.05,
				0,
				0
			},
			frequencies = {
				160,
				150,
				170,
				160,
				160,
				150,
				160,
				160
			},
			time_points = {
				0,
				0.15,
				0.17,
				0.18,
				0.2,
				0.21,
				0.22,
				0.4
			}
		})
		self:add_preset_rumbles("cover_down", {
			priority = 1,
			cumulative = true,
			engine = "both",
			loop = false,
			amplitudes = {
				0,
				0.01,
				0.02,
				0.03,
				0.25,
				0,
				0
			},
			frequencies = {
				150,
				150,
				150,
				150,
				180,
				150,
				150
			},
			time_points = {
				0,
				0.05,
				0.13,
				0.24,
				0.25,
				0.26,
				0.55
			}
		})
		self:add_preset_rumbles("menu_click", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.1,
				0.1,
				0.6
			},
			frequencies = {
				200,
				200,
				200
			},
			time_points = {
				0,
				0.01,
				0.02
			}
		})
		self:add_preset_rumbles("menu_slider", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0,
				0.1,
				0.11,
				0.12,
				0.13,
				0.14,
				0.15,
				0.16,
				0.17,
				0.18,
				0.19
			},
			frequencies = {
				90,
				90,
				95,
				100,
				105,
				110,
				115,
				120,
				125,
				130,
				135
			},
			time_points = {
				0,
				0.1,
				0.2,
				0.3,
				0.4,
				0.5,
				0.6,
				0.7,
				0.8,
				0.9,
				1
			}
		})
		self:add_preset_rumbles("menu_move", {
			priority = 5,
			loop = false,
			engine = "both",
			amplitudes = {
				0.1,
				0.1,
				0.2
			},
			frequencies = {
				120,
				130,
				130
			},
			time_points = {
				0,
				0.01,
				0.02
			}
		})
		self:add_preset_rumbles("start_l", {
			priority = 5,
			loop = false,
			engine = "left",
			amplitudes = {
				0.1,
				0.1,
				0.5,
				0.1,
				0.1
			},
			frequencies = {
				150,
				150,
				200,
				200,
				150
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04
			}
		})
		self:add_preset_rumbles("start_r", {
			priority = 5,
			loop = false,
			engine = "right",
			amplitudes = {
				0.1,
				0.1,
				0.5,
				0.1,
				0.1
			},
			frequencies = {
				150,
				150,
				200,
				200,
				150
			},
			time_points = {
				0,
				0.01,
				0.02,
				0.03,
				0.04
			}
		})
	else
		self:add_preset_rumbles("weapon_fire", {
			sustain = 0.1,
			peak = 0.5,
			release = 0.05,
			cumulative = false,
			engine = "both"
		})
		self:add_preset_rumbles("land", {
			sustain = 0.1,
			peak = 0.5,
			release = 0.1,
			cumulative = false,
			engine = "both"
		})
		self:add_preset_rumbles("hard_land", {
			sustain = 0.3,
			peak = 1,
			release = 0.1,
			cumulative = false,
			engine = "both"
		})
		self:add_preset_rumbles("electrified", {
			peak = 0.5,
			engine = "both",
			release = 0.05,
			cumulative = false
		})
		self:add_preset_rumbles("electric_shock", {
			sustain = 0.2,
			peak = 1,
			release = 0.1,
			cumulative = true,
			engine = "both"
		})
		self:add_preset_rumbles("incapacitated_shock", {
			sustain = 0.2,
			peak = 0.75,
			release = 0.1,
			cumulative = true,
			engine = "both"
		})
		self:add_preset_rumbles("damage_bullet", {
			sustain = 0.2,
			peak = 1,
			release = 0,
			cumulative = true,
			engine = "both"
		})
		self:add_preset_rumbles("bullet_whizby", {
			sustain = 0.075,
			peak = 1,
			release = 0,
			cumulative = true,
			engine = "both"
		})
		self:add_preset_rumbles("melee_hit", {
			sustain = 0.15,
			peak = 1,
			release = 0,
			cumulative = true,
			engine = "both"
		})
		self:add_preset_rumbles("mission_triggered", {
			sustain = 0.3,
			engine = "both",
			release = 2.1,
			cumulative = true,
			attack = 0.1,
			peak = 1
		})
	end
end

CoreClass.override_class(CoreRumbleManager.RumbleManager, RumbleManager)
