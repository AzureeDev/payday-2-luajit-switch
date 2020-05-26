core:module("SystemMenuManager")
require("lib/managers/dialogs/Dialog")

GenericDialog = GenericDialog or class(Dialog)
GenericDialog.PANEL_SCRIPT_CLASS = "TextBoxGui"
GenericDialog.FADE_IN_DURATION = 0.2
GenericDialog.FADE_OUT_DURATION = 0.2
GenericDialog.MOVE_AXIS_LIMIT = 0.4
GenericDialog.MOVE_AXIS_DELAY = 0.4

function GenericDialog:init(manager, data, is_title_outside)
	Dialog.init(self, manager, data)

	if not self._data.focus_button then
		if #self._button_text_list > 0 then
			self._data.focus_button = #self._button_text_list
		else
			self._data.focus_button = 1
		end
	end

	self.animated_button_pressed = false
	self._ws = self._data.ws or manager:_get_ws()
	self._panel_script = _G[self.PANEL_SCRIPT_CLASS]:new(self._ws, self._data.title or "", self._data.text or "", self._data, {
		no_close_legend = true,
		type = self._data.type or "system_menu",
		use_indicator = data.indicator or data.no_buttons,
		is_title_outside = is_title_outside
	})

	self._panel_script:add_background()
	self._panel_script:set_layer(_G.tweak_data.gui.DIALOG_LAYER)
	self._panel_script:set_centered()
	self._panel_script:set_fade(0)

	self._controller = self._data.controller or manager:_get_controller()
	self._confirm_func = callback(self, self, "button_pressed_callback")
	self._cancel_func = callback(self, self, "dialog_cancel_callback")
	self._resolution_changed_callback = callback(self, self, "resolution_changed_callback")

	managers.viewport:add_resolution_changed_func(self._resolution_changed_callback)

	if data.counter then
		self._counter = data.counter
		self._counter_time = self._counter[1]
	end
end

function GenericDialog:set_text(text, no_upper)
	self._panel_script:set_text(text, no_upper)
end

function GenericDialog:set_title(text, no_upper)
	self._panel_script:set_title(text, no_upper)
end

function GenericDialog:mouse_moved(o, x, y)
	if not self._panel_script or not alive(self._panel_script._text_box_buttons_panel) then
		return false, "arrow"
	end

	local used, pointer = self._panel_script:moved_scroll_bar(x, y)

	if used then
		return used, pointer
	end

	local x, y = managers.mouse_pointer:convert_1280_mouse_pos(x, y)

	for i, panel in ipairs(self._panel_script._text_box_buttons_panel:children()) do
		if panel.child and panel:inside(x, y) and panel:name() ~= "anim_panel" then
			self._panel_script:set_focus_button(i)
		end
	end

	if self.panning then
		local amount_panned = self.pan_y - y

		self._panel_script:pan(x, y, amount_panned)

		self.pan_y = y
	end

	return false, "arrow"
end

function GenericDialog:mouse_pressed(o, button, x, y)
	if not self.animated_button_pressed then
		if not self._panel_script or not alive(self._panel_script._text_box_buttons_panel) then
			return
		end

		if SystemInfo:platform() == Idstring("NX64") and (button == Idstring("0") or button == Idstring("1") or button == Idstring("pan_up") or button == Idstring("pan_down")) then
			local x, y = managers.mouse_pointer:convert_1280_mouse_pos(x, y)

			if self._panel_script:check_grab_scroll_bar(x, y) then
				return
			end
		end

		if button == Idstring("0") then
			local x, y = managers.mouse_pointer:convert_1280_mouse_pos(x, y)

			if SystemInfo:platform() ~= Idstring("NX64") and self._panel_script:check_grab_scroll_bar(x, y) then
				return
			end

			for i, panel in ipairs(self._panel_script._text_box_buttons_panel:children()) do
				if panel.child and panel:inside(x, y) then
					managers.menu:on_press_rumble()

					if SystemInfo:platform() == Idstring("NX64") then
						local anim_time = 0.1
						local anim_panel = nil

						if panel:parent():child("anim_panel") then
							anim_panel = panel:parent():child("anim_panel")

							anim_panel:set_width(panel:w())
							anim_panel:set_height(panel:h())
							anim_panel:set_x(panel:x())
							anim_panel:set_y(panel:y())
						else
							anim_panel = panel:parent():panel({
								name = "anim_panel",
								x = panel:x(),
								y = panel:y(),
								w = panel:w(),
								h = panel:h()
							})

							anim_panel:rect({
								name = "anim_box",
								valign = "grow",
								halign = "grow",
								alpha = 1,
								visible = false,
								layer = 500,
								color = Color(1, 1, 1)
							})
						end

						anim_panel:child("anim_box"):animate(callback(nil, _G, "highlight_animation_dialog"), anim_time, self)

						self.animated_button_pressed = true

						if managers.menu:active_menu() then
							managers.menu:active_menu().renderer:disable_input(anim_time * 1.5)
						end
					else
						self:button_pressed_callback()
					end

					return
				end
			end

			if self._panel_script.mouse_pressed ~= nil and self._panel_script.want_mouse_press_events and self._panel_script:mouse_pressed(button, x, y) then
				return true
			end

			if self._data.click_outside_to_cancel and self._panel_script.inside and not self._panel_script:inside(x, y) then
				self:dialog_cancel_callback()
			end
		elseif button == Idstring("mouse wheel down") then
			return self._panel_script:mouse_wheel_down(x, y)
		elseif button == Idstring("mouse wheel up") then
			return self._panel_script:mouse_wheel_up(x, y)
		elseif button == Idstring("swipe_down") then
			return self._panel_script:swipe_down(x, y)
		elseif button == Idstring("swipe_up") then
			return self._panel_script:swipe_up(x, y)
		elseif button == Idstring("pan_up") then
			self.panning = true
			self.pan_y = y
		elseif button == Idstring("pan_down") then
			self.panning = true
			self.pan_y = y
		end
	end
end

function GenericDialog:mouse_released(o, button, x, y)
	self._panel_script:release_scroll_bar()

	self.panning = false
end

function GenericDialog:update(t, dt)
	if not self.animated_button_pressed then
		if self._fade_in_time then
			local alpha = math.clamp((t - self._fade_in_time) / self.FADE_IN_DURATION, 0, 1)

			self._panel_script:set_fade(alpha)

			if alpha == 1 and not self._data.delay_input then
				self:set_input_enabled(true)

				self._fade_in_time = nil
			end
		end

		if self._fade_out_time then
			local alpha = math.clamp(1 - (t - self._fade_out_time) / self.FADE_OUT_DURATION, 0, 1)

			self._panel_script:set_fade(alpha)

			if alpha == 0 then
				self._fade_out_time = nil

				self:close()
			end
		end

		if self._data.delay_input then
			self._data.delay_input = self._data.delay_input - dt

			if self._data.delay_input < 0 then
				self:set_input_enabled(true)

				self._data.delay_input = nil
			end
		end

		if self._input_enabled then
			self:update_input(t, dt)
		end

		self._panel_script:update_indicator(t, dt)

		if alive(self._panel_script.indicator) then
			self._panel_script.indicator:rotate(180 * dt)
		end

		if self._counter then
			self._counter_time = self._counter_time - dt

			if self._counter_time < 0 then
				self._counter_time = self._counter_time + self._counter[1]

				self._counter[2]()
			end
		end

		if managers.menu_component then
			local x, y = managers.menu_component:get_left_controller_axis()

			if y > 0 then
				self._panel_script:scroll_up(y * 4)
			elseif y < 0 then
				self._panel_script:scroll_down(math.abs(y) * 4)
			end
		end
	end

	if SystemInfo:platform() == Idstring("NX64") and self.button_anim_complete then
		self.animated_button_pressed = false
		self.button_anim_complete = false

		self:button_pressed_callback()
	end
end

function GenericDialog:update_input(t, dt)
	if self._data.no_buttons then
		return
	end

	local dir, move_time = nil
	local move = self._controller:get_input_axis("menu_move")

	if SystemInfo:platform() == Idstring("NX64") then
		if self._controller:get_input_bool("menu_right") or self.MOVE_AXIS_LIMIT < move.x then
			dir = 1
		elseif self._controller:get_input_bool("menu_left") or move.x < -self.MOVE_AXIS_LIMIT then
			dir = -1
		end
	elseif self._controller:get_input_bool("menu_down") or move.y < -self.MOVE_AXIS_LIMIT then
		dir = 1
	elseif self._controller:get_input_bool("menu_up") or self.MOVE_AXIS_LIMIT < move.y then
		dir = -1
	end

	if dir then
		if self._move_button_dir == dir and self._move_button_time and t < self._move_button_time + self.MOVE_AXIS_DELAY then
			move_time = self._move_button_time or t
		else
			self._panel_script:change_focus_button(dir)

			move_time = t
		end
	end

	self._move_button_dir = dir
	self._move_button_time = move_time
end

function GenericDialog:set_extra_triggers(enabled)
end

function GenericDialog:set_input_enabled(enabled)
	if not self._input_enabled ~= not enabled then
		if enabled then
			self._controller:add_trigger("confirm", self._confirm_func)
			self:set_extra_triggers(enabled)

			local wrapper_type = managers.controller:get_default_wrapper_type()

			if wrapper_type == "pc" or wrapper_type == "steam" or wrapper_type == "nx64" then
				self._controller:add_trigger("toggle_menu", self._cancel_func)

				if self._data.add_cancel_trigger then
					self._controller:add_trigger("cancel", self._cancel_func)
				end

				self._mouse_id = managers.mouse_pointer:get_id()
				self._removed_mouse = false
				local data = {
					mouse_move = callback(self, self, "mouse_moved"),
					mouse_press = callback(self, self, "mouse_pressed"),
					mouse_release = callback(self, self, "mouse_released"),
					id = self._mouse_id
				}

				managers.mouse_pointer:use_mouse(data)
			else
				self._removed_mouse = false

				self._controller:add_trigger("cancel", self._cancel_func)
				managers.mouse_pointer:disable()
			end
		else
			self._panel_script:release_scroll_bar()
			self._controller:remove_trigger("confirm", self._confirm_func)
			self:set_extra_triggers(enabled)

			local wrapper_type = managers.controller:get_default_wrapper_type()

			if wrapper_type == "pc" or wrapper_type == "steam" or wrapper_type == "nx64" then
				self._controller:remove_trigger("toggle_menu", self._cancel_func)

				if self._data.add_cancel_trigger then
					self._controller:remove_trigger("cancel", self._cancel_func)
				end
			else
				self._controller:remove_trigger("cancel", self._cancel_func)
			end

			self:remove_mouse()
		end

		self._input_enabled = enabled

		managers.controller:set_menu_mode_enabled(enabled)
	end
end

function GenericDialog:fade_in()
	self._fade_in_time = TimerManager:main():time()
end

function GenericDialog:fade_out_close()
	managers.menu:post_event("prompt_exit")
	self:fade_out()
end

function GenericDialog:fade_out()
	self._fade_out_time = TimerManager:main():time()

	if managers.menu:active_menu() then
		managers.menu:active_menu().renderer:disable_input(0.2)
	end

	self:set_input_enabled(false)
end

function GenericDialog:is_closing()
	return self._fade_out_time ~= nil
end

function GenericDialog:show()
	managers.menu:post_event("prompt_enter")
	self._manager:event_dialog_shown(self)

	return true
end

function GenericDialog:hide()
	self:set_input_enabled(false)

	self._fade_in_time = nil

	self._panel_script:set_fade(0)
	self._manager:event_dialog_hidden(self)
end

function GenericDialog:_close_generic()
	self:set_input_enabled(false)
	self._panel_script:close()
	managers.viewport:remove_resolution_changed_func(self._resolution_changed_callback)
end

function GenericDialog:close()
	self:_close_generic()
	Dialog.close(self)
end

function GenericDialog:force_close()
	self:_close_generic()
	Dialog.force_close(self)
end

function GenericDialog:dialog_cancel_callback()
	if self._data.cancel_is_button_zero then
		self:remove_mouse()
		self:button_pressed(0)

		return
	end

	if SystemInfo:platform() ~= Idstring("WIN32") then
		return
	end

	if self._data.no_buttons then
		return
	end

	if #self._data.button_list == 1 then
		self:remove_mouse()
		self:button_pressed(1)
	end

	for i, btn in ipairs(self._data.button_list) do
		if btn.cancel_button then
			self:remove_mouse()
			self:button_pressed(i)

			return
		end
	end
end

function GenericDialog:button_pressed_callback()
	if self._data.no_buttons then
		return
	end

	self:remove_mouse()
	self:button_pressed(self._panel_script:get_focus_button())

	if SystemInfo:platform() == Idstring("NX64") then
		managers.menu:on_press_rumble()
	end
end

function GenericDialog:remove_mouse()
	if not self._removed_mouse then
		self._removed_mouse = true
		local wrapper_type = managers.controller:get_default_wrapper_type()

		if wrapper_type == "pc" or wrapper_type == "steam" or wrapper_type == "nx64" then
			managers.mouse_pointer:remove_mouse(self._mouse_id)
		else
			managers.mouse_pointer:enable()
		end

		self._mouse_id = nil
	end
end

function GenericDialog:resolution_changed_callback()
end
