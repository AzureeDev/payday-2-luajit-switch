core:import("CoreMenuInput")

TapOrDrag = TapOrDrag or class()
TapOrDrag._DIRECTION_DECIDER = 10
TapOrDrag._TAP_DECIDER = 10
TapOrDrag._TAP_MAX_TIME = 1

function TapOrDrag:init(startX, startY)
	self.startX = startX
	self.startY = startY
	self.prevX = startX
	self.prevY = startY
	self.currentX = startX
	self.currentY = startY
	self.timer = 0
	self.dx = 0
	self.dy = 0
	self.dt = 0
end

function TapOrDrag:has_something()
	return self.mode ~= "done" and (self.cb_hv_drag or self.cb_h_drag or self.cb_v_drag or self.cb_tap)
end

function TapOrDrag:start()
	self.mode = "drag"

	if self.cb_hv_drag then
		self.cb_h_drag = nil
		self.cb_v_drag = nil
		self.cb = self.cb_hv_drag
		self.dir = "hv"
	elseif self.cb_h_drag and self.cb_v_drag then
		self.dir = "?"
		self.mode = "decide_hv"
	elseif self.cb_h_drag then
		self.cb = self.cb_h_drag
		self.dir = "h"
	elseif self.cb_v_drag then
		self.cb = self.cb_v_drag
		self.dir = "v"
	else
		self.mode = "done"

		if self.cb_tap then
			self:cb_tap()

			return true
		else
			return false
		end
	end

	if self.cb_tap then
		self.mode = "tap_or_drag"
	elseif self.mode == "drag" and self:cb(0) then
		self:cancel()
	end

	return true
end

function TapOrDrag:tick(dt)
	local mode = self.mode

	if mode == "done" then
		return
	end

	if mode == "drag" then
		if self.dt ~= 0 then
			self.dx = 0
			self.dy = 0
			self.prevX = self.currentX
			self.prevY = self.currentY

			if self:cb(1) then
				self:cancel()

				return
			end
		end

		self.dt = dt
		self.timer = self.timer + dt

		return
	end

	if mode == "tap_or_drag" then
		self.timer = self.timer + dt

		if self.timer < TapOrDrag._TAP_MAX_TIME then
			return
		end

		if self.dir == "?" then
			self.mode = "decide_hv"
		else
			self.timer = 0
			self.mode = "drag"

			if self:cb(0) then
				self:cancel()
			end

			return
		end
	end
end

function TapOrDrag:moved(x, y)
	local mode = self.mode

	if mode == "done" then
		return
	end

	self.prevX = self.currentX
	self.prevY = self.currentY
	self.currentX = x
	self.currentY = y

	if mode == "drag" then
		if self.dir ~= "v" then
			self.dx = x - self.prevX
		end

		if self.dir ~= "h" then
			self.dy = y - self.prevY
		end

		if self.dx ~= 0 or self.dy ~= 0 or self.dt ~= 0 then
			if self:cb(1) then
				self:cancel()
			end

			self.dt = 0
		end

		return
	end

	local dx = x - self.startX
	local dy = y - self.startY
	local dist2 = dx * dx + dy * dy

	if mode == "tap_or_drag" then
		if dist2 < TapOrDrag._TAP_DECIDER * TapOrDrag._TAP_DECIDER then
			return
		end

		if self.dir == "?" then
			self.mode = "decide_hv"
		else
			self.timer = 0
			self.mode = "drag"

			if self:cb(0) then
				self:cancel()
			end

			return
		end
	end

	if self.mode == "decide_hv" and dist2 >= TapOrDrag._DIRECTION_DECIDER * TapOrDrag._DIRECTION_DECIDER then
		self.mode = "drag"

		if math.abs(dy) < math.abs(dx) then
			self.cb = self.cb_h_drag
			self.dir = "h"
		else
			self.cb = self.cb_v_drag
			self.dir = "v"
		end

		self.timer = 0

		if self:cb(0) then
			self:cancel()
		end
	end
end

function TapOrDrag:stop()
	if self.mode == "drag" then
		self.dx = 0
		self.dy = 0
		self.dt = 0
		self.prevX = self.currentX
		self.prevY = self.currentY

		self:cb(2)
	elseif self.mode == "tap_or_drag" then
		self:cb_tap()
	end

	self.mode = "done"
	self.cb = nil
end

function TapOrDrag:release(x, y, dt)
	if dt ~= 0 then
		self:tick(dt)
	end

	if x ~= self.currentX or y ~= self.currentY then
		self:moved(x, y)
	end

	self:stop()
end

function TapOrDrag:cancel()
	if self.mode == "drag" then
		self.dx = 0
		self.dy = 0
		self.dt = 0
		self.prevX = self.currentX
		self.prevY = self.currentY

		self:cb(3)
	end

	self.mode = "done"
	self.cb = nil
end

MenuInput = MenuInput or class(CoreMenuInput.MenuInput)
MenuInput._slider_behaviour = 1
MenuInput._slider_thumb_w = 20

function MenuInput:init(logic, ...)
	MenuInput.super.init(self, logic, ...)

	self._move_axis_limit = 0.5
	self._sound_source = SoundDevice:create_source("MenuInput")
	self._controller_mouse_active_counter = 0
	self._item_input_action_map[ItemColumn.TYPE] = callback(self, self, "input_item")
	self._item_input_action_map[ItemServerColumn.TYPE] = callback(self, self, "input_item")
	self._item_input_action_map[MenuItemLevel.TYPE] = callback(self, self, "input_item")
	self._item_input_action_map[MenuItemChallenge.TYPE] = callback(self, self, "input_item")
	self._item_input_action_map[MenuItemKitSlot.TYPE] = callback(self, self, "input_kitslot")
	self._item_input_action_map[MenuItemUpgrade.TYPE] = callback(self, self, "input_item")
	self._item_input_action_map[MenuItemMultiChoice.TYPE] = callback(self, self, "input_multi_choice")
	self._item_input_action_map[MenuItemChat.TYPE] = callback(self, self, "input_chat")
	self._item_input_action_map[MenuItemFriend.TYPE] = callback(self, self, "input_item")
	self._item_input_action_map[MenuItemCustomizeController.TYPE] = callback(self, self, "input_customize_controller")
	self._item_input_action_map[MenuItemExpand.TYPE] = callback(self, self, "input_expand")
	self._item_input_action_map[MenuItemDivider.TYPE] = callback(self, self, "input_item")
	self._item_input_action_map[MenuItemColoredDivider.TYPE] = callback(self, self, "input_item")
	self._item_input_action_map[MenuItemInput.TYPE] = callback(self, self, "input_item")
	self._item_input_action_map[MenuItemTextBox.TYPE] = callback(self, self, "input_item")
	self._item_input_action_map[MenuItemDummy.TYPE] = callback(self, self, "input_item")
	self._callback_map = {
		mouse_moved = {},
		mouse_pressed = {},
		mouse_released = {},
		mouse_clicked = {},
		mouse_double_click = {}
	}
end

function MenuInput:cancel_tod()
	if self._tap_or_drag then
		self._tap_or_drag:cancel()

		self._tap_or_drag = nil
	end
end

function MenuInput:back(...)
	self._slider_marker = nil

	if self._back_disabled then
		return
	end

	self:cancel_tod()

	local node_gui = managers.menu:active_menu().renderer:active_node_gui()

	if node_gui and node_gui._listening_to_input then
		return
	end

	if managers.system_menu and managers.system_menu:is_active() and not managers.system_menu:is_closing() then
		return
	end

	MenuInput.super.back(self, ...)
end

function MenuInput:set_back_enabled(enabled)
	self._back_disabled = not enabled
end

function MenuInput:activate_mouse(position, controller_activated)
	if not controller_activated and managers.controller:get_default_wrapper_type() ~= "pc" and managers.controller:get_default_wrapper_type() ~= "steam" and managers.controller:get_default_wrapper_type() ~= "nx64" then
		return
	end

	self._mouse_active = true
	local data = {
		mouse_move = callback(self, self, "mouse_moved"),
		mouse_press = callback(self, self, "mouse_pressed"),
		mouse_release = callback(self, self, "mouse_released"),
		mouse_click = callback(self, self, "mouse_clicked"),
		mouse_double_click = callback(self, self, "mouse_double_click"),
		id = self._menu_name
	}

	managers.mouse_pointer:use_mouse(data, position)
end

function MenuInput:activate_controller_mouse(position)
	self._controller_mouse_active_counter = self._controller_mouse_active_counter + 1

	Application:debug("MenuInput:activate_controller_mouse()", self._controller_mouse_active_counter)

	if self._controller_mouse_active_counter == 1 and managers.mouse_pointer:change_mouse_to_controller(self._controller:get_controller()) then
		self:activate_mouse(position, true)
	end
end

function MenuInput:deactivate_controller_mouse()
	self._controller_mouse_active_counter = self._controller_mouse_active_counter - 1

	Application:debug("MenuInput:deactivate_controller_mouse()", self._controller_mouse_active_counter)

	if self._controller_mouse_active_counter < 0 then
		-- Nothing
	end

	if self._controller_mouse_active_counter == 0 and managers.mouse_pointer:change_controller_to_mouse() then
		self:deactivate_mouse()
	end
end

function MenuInput:get_controller_class()
	return self._controller
end

function MenuInput:get_controller()
	return self._controller:get_controller()
end

function MenuInput:deactivate_mouse()
	if not self._mouse_active then
		return
	end

	self:cancel_tod()

	self._mouse_active = false

	managers.mouse_pointer:remove_mouse(self._menu_name)
end

function MenuInput:open(position, ...)
	MenuInput.super.open(self, ...)

	self._page_timer = 0
	self.AXIS_STATUS_UP = 0
	self.AXIS_STATUS_PRESSED = 1
	self.AXIS_STATUS_DOWN = 2
	self.AXIS_STATUS_RELEASED = 3
	self._axis_status = {
		x = self.AXIS_STATUS_UP,
		y = self.AXIS_STATUS_UP
	}

	self:activate_mouse(position)
	managers.controller:set_menu_mode_enabled(true)
end

function MenuInput:close(...)
	self:cancel_tod()
	MenuInput.super.close(self, ...)
	self:deactivate_mouse()
	managers.controller:set_menu_mode_enabled(false)
end

function MenuInput:set_page_timer(time)
	self._page_timer = time
end

function MenuInput:force_input()
	return self._force_input
end

function MenuInput:set_force_input(enabled)
	self._force_input = enabled
end

function MenuInput:accept_input(accept, ...)
	if managers.menu:active_menu() then
		managers.menu:active_menu().renderer:accept_input(accept)
	end

	MenuInput.super.accept_input(self, accept, ...)
end

function MenuInput:_modified_mouse_pos(x, y)
	return managers.mouse_pointer:convert_mouse_pos(x, y)
end

function MenuInput:mouse_moved(o, x, y, mouse_ws)
	if not managers.menu:active_menu() then
		return
	end

	self._keyboard_used = false
	self._mouse_moved = true
	x, y = self:_modified_mouse_pos(x, y)
	local node_gui = managers.menu:active_menu().renderer:active_node_gui()

	if node_gui and node_gui.enable_tap_or_drag and not self._tap_or_drag then
		self:mouse_moved_pass_on(o, x, y, mouse_ws)

		return
	end

	if self._tap_or_drag ~= nil then
		self._tap_or_drag:moved(x, y)

		return
	end

	if SystemInfo:platform() == Idstring("NX64") and node_gui and node_gui.mouse_moved and node_gui:mouse_moved(o, x, y) then
		return
	end

	if self._slider_marker then
		local row_item = self._slider_marker.row_item

		if alive(row_item.gui_slider) and row_item.gui_panel:inside(x, y) then
			local where = (x - row_item.gui_slider:world_left()) / (row_item.gui_slider:world_right() - row_item.gui_slider:world_left())
			local item = self._slider_marker.item

			if item:enabled() then
				item:set_value_by_percentage(where * 100)
				self._logic:trigger_item(true, item)

				if SystemInfo:platform() == Idstring("NX64") then
					managers.menu:update_slider_rumble(where, true)
				end
			end

			managers.mouse_pointer:set_pointer_image("grab")
		end

		return
	end

	local select_item, select_row_item = self:_find_selection(node_gui, x, y)

	if self:_apply_mouse_over(select_item, select_row_item, x, y) then
		return
	end

	self:mouse_moved_pass_on(o, x, y, mouse_ws)
end

function MenuInput:mouse_moved_pass_on(o, x, y, mouse_ws)
	local used, pointer = managers.menu:active_menu().renderer:mouse_moved(o, x, y)

	if used then
		managers.mouse_pointer:set_pointer_image(pointer)

		return
	end

	for i, clbk in pairs(self._callback_map.mouse_moved) do
		clbk(o, x, y, mouse_ws)
	end

	managers.mouse_pointer:set_pointer_image("arrow")
end

function MenuInput:_find_selection(node_gui, x, y)
	local select_item, select_row_item = nil

	if node_gui and managers.menu_component:input_focus() ~= true then
		local inside_item_panel_parent = node_gui:item_panel_parent():inside(x, y)

		for _, row_item in pairs(node_gui.row_items) do
			if row_item.item:parameters().pd2_corner then
				if row_item.gui_text:inside(x, y) and not self._logic:get_item(row_item.name).no_mouse_select then
					select_item = row_item.name
					select_row_item = row_item
				end
			elseif inside_item_panel_parent and row_item.gui_panel:inside(x, y) then
				local item = self._logic:get_item(row_item.name)

				if item and not item.no_mouse_select then
					select_item = row_item.name
					select_row_item = row_item
				elseif not item then
					Application:error("[MenuInput:mouse_moved] Item not found in Menu Logic", row_item.name)
				end
			end
		end
	end

	return select_item, select_row_item
end

function MenuInput:_apply_mouse_over(select_item, select_row_item, x, y)
	if select_item then
		local selected_item = managers.menu:active_menu().logic:selected_item()

		if not selected_item or select_item ~= selected_item:name() then
			managers.menu:active_menu().logic:mouse_over_select_item(select_item, false)
		elseif selected_item.TYPE == "slider" then
			managers.mouse_pointer:set_pointer_image("hand")
		elseif selected_item.TYPE == "multi_choice" then
			if select_row_item.arrow_right:visible() and select_row_item.arrow_right:inside(x, y) or select_row_item.arrow_left:visible() and select_row_item.arrow_left:inside(x, y) or select_row_item.arrow_right:visible() and select_row_item.arrow_left:visible() and select_row_item.gui_text:inside(x, y) then
				managers.mouse_pointer:set_pointer_image("link")
			else
				managers.mouse_pointer:set_pointer_image("arrow")
			end
		else
			managers.mouse_pointer:set_pointer_image("link")
		end

		return true
	end

	return false
end

function MenuInput:input_kitslot(item, controller, mouse_click)
	local slider_delay_down = 0.1
	local slider_delay_pressed = 0.2

	if self:menu_right_input_bool() then
		if item:next() then
			self:post_event("selection_next")
		end

		self._logic:trigger_item(true, item)
		self:set_axis_x_timer(slider_delay_down)

		if self:menu_right_pressed() then
			self:set_axis_x_timer(slider_delay_pressed)
		end
	elseif self:menu_left_input_bool() then
		if item:previous() then
			self:post_event("selection_previous")
		end

		self._logic:trigger_item(true, item)
		self:set_axis_x_timer(slider_delay_down)

		if self:menu_left_pressed() then
			self:set_axis_x_timer(slider_delay_pressed)
		end
	end

	if controller:get_input_pressed("confirm") or mouse_click then
		if item:next() then
			self:post_event("selection_next")
		end

		self._logic:trigger_item(true, item)
	end
end

function MenuInput:input_multi_choice(item, controller, mouse_click)
	local slider_delay_down = 0.1
	local slider_delay_pressed = 0.2
	local node_gui = managers.menu:active_menu().renderer:active_node_gui()

	if node_gui and node_gui._listening_to_input then
		return
	end

	if self:menu_right_input_bool() then
		if item:next() then
			self:post_event("selection_next")
			self._logic:trigger_item(true, item)

			if SystemInfo:platform() == Idstring("NX64") then
				managers.menu:on_move_rumble()
			end
		end

		self:set_axis_x_timer(slider_delay_down)

		if self:menu_right_pressed() then
			self:set_axis_x_timer(slider_delay_pressed)
		end
	elseif self:menu_left_input_bool() then
		if item:previous() then
			self:post_event("selection_previous")
			self._logic:trigger_item(true, item)

			if SystemInfo:platform() == Idstring("NX64") then
				managers.menu:on_move_rumble()
			end
		end

		self:set_axis_x_timer(slider_delay_down)

		if self:menu_left_pressed() then
			self:set_axis_x_timer(slider_delay_pressed)
		end
	end

	if (controller:get_input_pressed("confirm") or mouse_click) and item:next() then
		self:post_event("selection_next")
		self._logic:trigger_item(true, item)

		if SystemInfo:platform() == Idstring("NX64") then
			managers.menu:on_press_rumble()
		end
	end
end

function MenuInput:input_expand(item, controller, mouse_click)
	if controller:get_input_pressed("confirm") or mouse_click then
		item:toggle()
		self._logic:trigger_item(true, item)
	end
end

function MenuInput:input_chat(item, controller, mouse_click)
	if not controller:get_input_pressed("confirm") and mouse_click then
		-- Nothing
	end
end

function MenuInput:input_customize_controller(item, controller, mouse_click)
	if controller:get_input_pressed("confirm") or mouse_click then
		local node_gui = managers.menu:active_menu().renderer:active_node_gui()

		if node_gui and node_gui._listening_to_input then
			return
		end

		local node_gui = managers.menu:active_menu().renderer:active_node_gui()

		node_gui:activate_customize_controller(item)
	end
end

function MenuInput:get_accept_input()
	return self._accept_input and true or false
end

function MenuInput:register_callback(input, name, callback)
	if not self._callback_map[input] then
		Application:error("MenuInput:register_callback", "Failed to register callback", "input: " .. input, "name: " .. name)

		return
	end

	self._callback_map[input][name] = callback
end

function MenuInput:unregister_callback(input, name)
	if not self._callback_map[input] then
		Application:error("MenuInput:register_callback", "Failed to unregister callback", "input: " .. input, "name: " .. name)

		return
	end

	self._callback_map[input][name] = nil
end

function MenuInput:can_toggle_chat()
	local item = self._logic:selected_item()

	if item and item.TYPE == "input" then
		return not item:focus()
	end

	return true
end

function MenuInput:_init_tap_or_drag(node_gui, button, x, y, need_mod)
	if node_gui.enable_tap_or_drag then
		if button ~= Idstring("press") then
			return 2
		end

		if self._tap_or_drag then
			self._tap_or_drag:cancel()

			self._tap_or_drag = nil
		end

		if need_mod then
			x, y = managers.mouse_pointer:convert_mouse_pos(x, y)
		end

		local tod = TapOrDrag:new(x, y)
		self._tap_or_drag = tod

		if tod == nil then
			return 2
		end

		tod.menu_input = self
		tod.node_gui = node_gui
		tod.enabled = true
		local claimed = node_gui.suppress_touch or false

		if node_gui.populate_tap_or_drag then
			claimed = claimed or node_gui:populate_tap_or_drag(tod, 1, x, y)
		end

		if managers.menu_component:input_focus() ~= true and not claimed then
			self:_handle_taps(x, y, tod)
		end

		return tod:start() and 1 or 2
	end

	return false
end

function MenuInput:process_button_press(item, button, x, y)
	local node_gui = managers.menu:active_menu().renderer:active_node_gui()

	self._item_input_action_map[item.TYPE](item, self._controller, true)
	self._logic:accept_input(true)

	return node_gui.mouse_pressed and node_gui:mouse_pressed(button, x, y)
end

function MenuInput:nav_back()
	self._logic:accept_input(true)
	self:back()
end

function highlight_animation(panel, time_to_animate, input_obj)
	local total_time = time_to_animate
	local total_time_to_sin_wave_scale = 180 / total_time
	local time_elapsed = 0

	panel:set_visible(true)
	panel:set_alpha(0)

	while time_elapsed < time_to_animate do
		local dt = coroutine.yield()

		if dt == 0 then
			dt = 0.033
		end

		local scale_factor = math.sin(time_elapsed * total_time_to_sin_wave_scale)

		if scale_factor > 0.6 then
			scale_factor = 0.6
		elseif scale_factor < 0.1 then
			scale_factor = 0.1
		end

		panel:set_alpha(scale_factor)

		time_elapsed = time_elapsed + dt
	end

	panel:set_visible(false)

	if input_obj then
		input_obj.button_anim_complete = true
	end
end

function highlight_animation_dialog(panel, time_to_animate, dialog)
	local total_time = time_to_animate
	local total_time_to_sin_wave_scale = 180 / total_time
	local time_elapsed = 0

	panel:set_visible(true)
	panel:set_alpha(0)

	while time_elapsed < time_to_animate do
		local dt = coroutine.yield()

		if dt == 0 then
			dt = 0.033
		end

		local scale_factor = math.sin(time_elapsed * total_time_to_sin_wave_scale)

		if scale_factor > 0.8 then
			scale_factor = 0.8
		elseif scale_factor < 0.1 then
			scale_factor = 0.1
		end

		panel:set_alpha(scale_factor)

		time_elapsed = time_elapsed + dt
	end

	dialog.button_anim_complete = true

	panel:set_visible(false)
end

function MenuInput:cycle_item_multichoice(item, direction)
	self:post_event(direction)
	self._logic:trigger_item(true, item)
end

function MenuInput:mouse_pressed(o, button, x, y)
	if not self._accept_input then
		return
	end

	if managers.blackmarket and managers.blackmarket:is_preloading_weapons() then
		return
	end

	if not managers.menu:active_menu() then
		return
	end

	self._keyboard_used = false
	x, y = self:_modified_mouse_pos(x, y)
	local select_item, select_row_item = nil
	local node_gui = managers.menu:active_menu().renderer:active_node_gui()

	if not node_gui or node_gui._listening_to_input then
		return
	end

	local doing_tod = self:_init_tap_or_drag(node_gui, button, x, y, false)

	if doing_tod then
		if doing_tod == 2 then
			self:mouse_pressed_pass_on(o, button, x, y)
		end

		return
	end

	if SystemInfo:platform() == Idstring("NX64") then
		if self._slider_marker and not self._slider_marker.row_item.gui_panel:inside(x, y) then
			self:post_event("slider_release")
			managers.menu:stop_slider_rumble(true)

			self._slider_marker = nil
		end

		if node_gui.mouse_pressed and node_gui:mouse_pressed(button, x, y) then
			return
		end
	end

	if node_gui and button == Idstring("0") and managers.menu_component:input_focus() ~= true then
		local tod = {
			menu_input = self,
			node_gui = node_gui,
			startX = x,
			startY = y
		}
		local claimed = self:_handle_taps(x, y, tod)

		if tod.cb_tap ~= nil then
			tod:cb_tap()
		end

		if claimed then
			return
		end
	end

	self:mouse_pressed_pass_on(o, button, x, y)
end

function MenuInput:mouse_pressed_pass_on(o, button, x, y)
	if managers.menu:active_menu().renderer:mouse_pressed(o, button, x, y) then
		return
	end

	for i, clbk in pairs(self._callback_map.mouse_pressed) do
		clbk(o, button, x, y)
	end
end

function MenuInput.enlarged_inside_test(obj, x, y, pad_left, pad_top, pad_right, pad_bottom)
	pad_left = pad_left or 0
	pad_top = pad_top or pad_left
	pad_right = pad_right or pad_left
	pad_bottom = pad_bottom or pad_top

	return x >= obj:world_left() - pad_left and x <= obj:world_right() + pad_right and y >= obj:world_top() - pad_top and y <= obj:world_bottom() + pad_bottom
end

function MenuInput:_handle_taps(x, y, tod)
	local node_gui = tod.node_gui
	local done = false
	local cb_tap_base = nil

	if SystemInfo:platform() == Idstring("NX64") then
		if node_gui._legends_panel then
			local num_legends = node_gui._legends_panel:num_children()

			for i = 0, num_legends - 1 do
				local legend_item = node_gui._legends_panel:child(num_legends - 1 - i)

				if legend_item:inside(x, y) and legend_item:name() == "menu_legend_back" then
					tod.item = legend_item

					function tod.cb_tap(tod)
						local legend_item = tod.item
						local self = tod.menu_input

						managers.menu:on_press_rumble()

						local anim_time = 0.1
						local anim_panel = nil

						if legend_item:parent():child("anim_panel") then
							anim_panel = legend_item:parent():child("anim_panel")

							anim_panel:set_width(legend_item:w())
							anim_panel:set_height(legend_item:h())
							anim_panel:set_x(legend_item:x())
							anim_panel:set_y(legend_item:y())
						else
							anim_panel = legend_item:parent():panel({
								name = "anim_panel",
								x = legend_item:x(),
								y = legend_item:y(),
								w = legend_item:w(),
								h = legend_item:h()
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

						anim_panel:child("anim_box"):animate(callback(nil, _G, "highlight_animation"), anim_time, self)

						self.button_anim_callback = callback(self, self, "nav_back")

						if managers.menu:active_menu() then
							managers.menu:active_menu().renderer:disable_input(anim_time * 1.5)
						end
					end

					return true
				end
			end
		end

		local select_item, select_row_item = self:_find_selection(node_gui, x, y)
		tod.over_item = select_item
		tod.over_row = select_row_item

		function cb_tap_base(tod)
			tod.menu_input:_apply_mouse_over(tod.over_item, tod.over_row, tod.startX, tod.startY)
		end
	end

	for _, row_item in pairs(node_gui.row_items) do
		if row_item.item:parameters().pd2_corner then
			if row_item.gui_text:inside(x, y) then
				local item = self._logic:selected_item()

				if item then
					tod.row_item = row_item

					function tod.cb_tap(tod)
						local item = tod.menu_input._logic:selected_item()

						if item then
							tod.menu_input._item_input_action_map[item.TYPE](item, tod.menu_input._controller, true)

							if tod.node_gui.mouse_pressed then
								tod.node_gui:mouse_pressed(Idstring("0"), tod.startX, tod.startY)
							end
						end
					end

					done = true

					break
				end
			end
		elseif row_item.is_short_mission_button and row_item.menu_unselected:inside(x, y) or not row_item.is_short_mission_button and row_item.gui_panel:inside(x, y) then
			local on_different_panel = row_item.gui_panel:parent() ~= node_gui.item_panel
			local inside_panel_parent = node_gui._item_panel_parent:inside(x, y)

			if SystemInfo:platform() == Idstring("NX64") and on_different_panel or inside_panel_parent then
				if row_item.no_mouse_select then
					-- Nothing
				elseif row_item.type == "slider" then
					if tod.enabled and SystemInfo:platform() == Idstring("NX64") then
						local grow_h = 200

						if row_item.item:enabled() and self.enlarged_inside_test(row_item.gui_slider, x, y, 0, grow_h) then
							tod.slider_behaviour = MenuInput._slider_behaviour
							tod.slider_adjust = 0
							local slider_pos = row_item.gui_slider:world_left() + row_item.item:percentage() / 100 * (row_item.gui_slider:world_right() - row_item.gui_slider:world_left())
							tod.row_item = row_item

							function tod.cb_tap(tod)
								local row_item = tod.row_item
								local self = tod.menu_input
								local item = row_item.item

								if item then
									self:post_event("slider_grab")

									local where = (tod.startX + tod.slider_adjust - row_item.gui_slider:world_left()) / (row_item.gui_slider:world_right() - row_item.gui_slider:world_left())

									if where < 0 then
										where = 0
									elseif where > 1 then
										where = 1
									end

									item:set_value_by_percentage(where * 100)
									managers.menu:update_slider_rumble(where, true)
									self._logic:trigger_item(true, item)
									self:post_event("slider_release")
									managers.menu:stop_slider_rumble(true)
								end
							end

							tod.h_drag_arg1 = cb_tap_base

							function tod.cb_h_drag(tod, state)
								local row_item = tod.row_item
								local self = tod.menu_input
								local item = row_item.item
								local result = nil

								if not item:enabled() or not alive(row_item.gui_slider) then
									result = 99
								else
									if state == 0 then
										if tod.node_gui.abort_scroll then
											tod.node_gui:abort_scroll()
										end

										tod.node_gui.prevent_scroll_to_view = true

										if tod.h_drag_arg1 ~= nil then
											tod:h_drag_arg1()
										end

										self:post_event("slider_grab")
									end

									if state ~= 3 then
										local where = (tod.currentX + tod.slider_adjust - row_item.gui_slider:world_left()) / (row_item.gui_slider:world_right() - row_item.gui_slider:world_left())

										if where < 0 then
											where = 0
										elseif where > 1 then
											where = 1
										end

										item:set_value_by_percentage(where * 100)

										if state < 2 and SystemInfo:platform() == Idstring("NX64") then
											managers.menu:update_slider_rumble(where, true)
										else
											tod.node_gui.prevent_scroll_to_view = nil
										end

										self._logic:trigger_item(true, item)
									end
								end

								if state >= 2 then
									tod.node_gui.prevent_scroll_to_view = nil

									self:post_event("slider_release")
									managers.menu:stop_slider_rumble(true)
								end

								return result
							end

							if tod.slider_behaviour == 2 then
								tod.cb_tap = nil
								tod.cb_v_drag = nil
								cb_tap_base = nil
							elseif tod.slider_behaviour == 3 then
								tod.cb_tap = nil
								tod.slider_adjust = slider_pos - tod.startX
							elseif tod.slider_behaviour == 4 then
								local nearness = math.abs(tod.startX - slider_pos)
								local thumb_w = MenuInput._slider_thumb_w

								if nearness <= thumb_w then
									tod.cb_tap = nil
									tod.slider_adjust = slider_pos - tod.startX
								else
									tod.cb_h_drag = nil
								end
							end

							done = true

							break
						end
					elseif SystemInfo:platform() ~= Idstring("NX64") then
						tod.row_item = row_item

						function tod.cb_tap(tod)
							local row_item = tod.row_item
							local self = tod.menu_input
							local button = Idstring("0")

							self:post_event("slider_grab")

							if row_item.gui_slider_marker:inside(tod.startX, tod.startY) then
								self._slider_marker = {
									button = button,
									item = row_item.item,
									row_item = row_item
								}
							elseif row_item.gui_slider:inside(tod.startX, tod.startY) then
								local where = (tod.startX - row_item.gui_slider:world_left()) / (row_item.gui_slider:world_right() - row_item.gui_slider:world_left())
								local item = row_item.item

								if item:enabled() then
									item:set_value_by_percentage(where * 100)
									self._logic:trigger_item(true, item)

									self._slider_marker = {
										button = button,
										item = row_item.item,
										row_item = row_item
									}
								end
							end
						end
					else
						tod.row_item = row_item

						function tod.cb_tap(tod)
							local row_item = tod.row_item
							local self = tod.menu_input

							self:post_event("slider_grab")

							if row_item.gui_slider:inside(tod.startX, tod.startY) then
								local where = (tod.startX - row_item.gui_slider:world_left()) / (row_item.gui_slider:world_right() - row_item.gui_slider:world_left())

								managers.menu:update_slider_rumble(where, true)
							end
						end
					end
				elseif row_item.type == "kitslot" then
					local item = self._logic:selected_item()

					if row_item.arrow_right:inside(x, y) then
						tod.row_item = row_item

						function tod.cb_tap(tod)
							local item = tod.menu_input._logic:selected_item()

							item:next()
							tod.menu_input._logic:trigger_item(true, item)

							if tod.row_item.arrow_right:visible() then
								tod.menu_input:post_event("selection_next")
							end
						end
					elseif row_item.arrow_left:inside(x, y) then
						tod.row_item = row_item

						function tod.cb_tap(tod)
							local item = tod.menu_input._logic:selected_item()

							item:previous()
							tod.menu_input._logic:trigger_item(true, item)

							if tod.row_item.arrow_left:visible() then
								tod.menu_input:post_event("selection_previous")
							end
						end
					elseif not row_item.choice_panel:inside(x, y) then
						tod.row_item = row_item

						function tod.cb_tap(tod)
							local item = tod.menu_input._logic:selected_item()

							tod.menu_input._item_input_action_map[item.TYPE](item, tod.menu_input._controller, true)

							if tod.node_gui.mouse_pressed then
								tod.node_gui:mouse_pressed(Idstring("0"), tod.startX, tod.startY)
							end
						end

						done = true

						break
					end
				elseif row_item.type == "multi_choice" then
					local item = row_item.item

					if row_item.arrow_right:inside(x, y) then
						tod.row_item = row_item

						function tod.cb_tap(tod)
							local row_item = tod.row_item
							local item = row_item.item

							if item:next() then
								if SystemInfo:platform() == Idstring("NX64") then
									local anim_time = 0.15
									local anim_panel = nil

									if row_item.arrow_right:parent():child("anim_panel") then
										anim_panel = row_item.arrow_right:parent():child("anim_panel")

										anim_panel:set_width(row_item.arrow_right:w())
										anim_panel:set_height(row_item.arrow_right:h())
										anim_panel:set_x(row_item.arrow_right:x())
										anim_panel:set_y(row_item.arrow_right:y())
									else
										anim_panel = row_item.arrow_right:parent():panel({
											name = "anim_panel",
											x = row_item.arrow_right:x(),
											y = row_item.arrow_right:y(),
											w = row_item.arrow_right:w(),
											h = row_item.arrow_right:h()
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

									anim_panel:child("anim_box"):animate(callback(nil, _G, "highlight_animation"), anim_time)
									tod.menu_input:cycle_item_multichoice(item, "selection_next")
								else
									tod.menu_input:cycle_item_multichoice(item, "selection_next")
								end

								managers.menu:on_press_rumble()
							end
						end
					elseif row_item.arrow_left:inside(x, y) then
						tod.row_item = row_item

						function tod.cb_tap(tod)
							local row_item = tod.row_item
							local item = row_item.item

							if item:previous() then
								if SystemInfo:platform() == Idstring("NX64") then
									local anim_time = 0.15
									local anim_panel = nil

									if row_item.arrow_left:parent():child("anim_panel") then
										anim_panel = row_item.arrow_left:parent():child("anim_panel")

										anim_panel:set_width(row_item.arrow_left:w())
										anim_panel:set_height(row_item.arrow_left:h())
										anim_panel:set_x(row_item.arrow_left:x())
										anim_panel:set_y(row_item.arrow_left:y())
									else
										anim_panel = row_item.arrow_left:parent():panel({
											name = "anim_panel",
											x = row_item.arrow_left:x(),
											y = row_item.arrow_left:y(),
											w = row_item.arrow_left:w(),
											h = row_item.arrow_left:h()
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

									anim_panel:child("anim_box"):animate(callback(nil, _G, "highlight_animation"), anim_time)
									tod.menu_input:cycle_item_multichoice(item, "selection_previous")
								else
									tod.menu_input:cycle_item_multichoice(item, "selection_previous")
								end

								managers.menu:on_press_rumble()
							end
						end
					elseif row_item.gui_text:inside(x, y) then
						tod.row_item = row_item

						function tod.cb_tap(tod)
							local row_item = tod.row_item
							local item = row_item.item

							if SystemInfo:platform() ~= Idstring("NX64") then
								if row_item.align == "left" then
									if item:previous() then
										tod.menu_input:post_event("selection_previous")
										tod.menu_input._logic:trigger_item(true, item)
										managers.menu:on_press_rumble()
									end
								elseif item:next() then
									tod.menu_input:post_event("selection_next")
									tod.menu_input._logic:trigger_item(true, item)
									managers.menu:on_press_rumble()
								end
							end
						end
					end
				elseif row_item.type == "chat" then
					local item = self._logic:selected_item()

					if row_item.chat_input:inside(x, y) then
						tod.row_item = row_item

						function tod.cb_tap(tod)
							tod.row_item.chat_input:script().set_focus(true)
						end
					end
				elseif SystemInfo:platform() == Idstring("NX64") and row_item.is_preplanning_button then
					if row_item.selected then
						local item = self._logic:selected_item()

						if item then
							tod.row_item = row_item

							function tod.cb_tap(tod)
								local row_item = tod.row_item
								local self = tod.menu_input

								if row_item.selected then
									local item = self._logic:selected_item()

									if item then
										managers.menu:on_press_rumble()
										self._item_input_action_map[item.TYPE](item, self._controller, true)

										if node_gui.mouse_pressed then
											node_gui:mouse_pressed(Idstring("0"), tod.startX, tod.startY)
										end
									end
								end
							end

							done = true

							break
						end
					else
						row_item.selected = true
					end
				else
					local item = self._logic:selected_item()

					if SystemInfo:platform() == Idstring("NX64") then
						item = row_item.item
					end

					if item and row_item.type ~= "divider" then
						tod.row_item = row_item

						function tod.cb_tap(tod)
							local row_item = tod.row_item
							local self = tod.menu_input
							local button = Idstring("0")
							local item = self._logic:selected_item()

							if SystemInfo:platform() == Idstring("NX64") then
								item = row_item.item
							end

							managers.menu:on_press_rumble()

							if SystemInfo:platform() == Idstring("NX64") then
								local anim_time = 0.1
								local anim_panel = nil

								if row_item.show_corner_deco then
									if row_item.menu_selected:parent():child("anim_panel") then
										anim_panel = row_item.menu_selected:parent():child("anim_panel")

										anim_panel:set_width(row_item.menu_selected:w())
										anim_panel:set_height(row_item.menu_selected:h())
										anim_panel:set_x(row_item.menu_selected:x())
										anim_panel:set_y(row_item.menu_selected:y())
									else
										anim_panel = row_item.menu_selected:parent():panel({
											name = "anim_panel",
											x = row_item.menu_selected:x(),
											y = row_item.menu_selected:y(),
											w = row_item.menu_selected:w(),
											h = row_item.menu_selected:h()
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
								elseif row_item.gui_panel:parent():child("anim_panel") then
									anim_panel = row_item.gui_panel:parent():child("anim_panel")

									anim_panel:set_width(row_item.gui_panel:w())
									anim_panel:set_height(row_item.gui_panel:h())
									anim_panel:set_x(row_item.gui_panel:x())
									anim_panel:set_y(row_item.gui_panel:y())
								else
									anim_panel = row_item.gui_panel:parent():panel({
										name = "anim_panel",
										x = row_item.gui_panel:x(),
										y = row_item.gui_panel:y(),
										w = row_item.gui_panel:w(),
										h = row_item.gui_panel:h()
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

								anim_panel:child("anim_box"):animate(callback(nil, _G, "highlight_animation"), anim_time, self)

								self.button_anim_callback = callback(self, self, "process_button_press", row_item.item, button, tod.startX, tod.startY)

								if managers.menu:active_menu() then
									managers.menu:active_menu().renderer:disable_input(anim_time * 1.5)
								end
							else
								self._item_input_action_map[item.TYPE](item, self._controller, true)

								if node_gui.mouse_pressed then
									node_gui:mouse_pressed(button, tod.startX, tod.startY)
								end
							end
						end

						done = true

						break
					end
				end
			end
		elseif SystemInfo:platform() == Idstring("NX64") and row_item.is_preplanning_button and row_item.selected then
			row_item.selected = false
		end
	end

	if cb_tap_base then
		if tod.cb_tap then
			tod.cb_tap1 = cb_tap_base
			tod.cb_tap2 = tod.cb_tap

			function tod.cb_tap(tod)
				tod:cb_tap1()
				tod:cb_tap2()
			end
		else
			tod.cb_tap = cb_tap_base
		end
	end

	return done
end

function MenuInput:mouse_released(o, button, x, y)
	local suppress = false

	if self._tap_or_drag then
		if button ~= Idstring("press") then
			suppress = 2
		else
			local fx, fy = nil
			fx, fy = self:_modified_mouse_pos(x, y)

			self._tap_or_drag:release(fx, fy, 0)

			self._tap_or_drag = nil
			suppress = true
		end
	end

	self.panning_left = false
	self.panning_right = false

	if not self._accept_input then
		return
	end

	if managers.blackmarket and managers.blackmarket:is_preloading_weapons() then
		return
	end

	if not managers.menu:active_menu() then
		return
	end

	if suppress == 2 then
		return
	end

	x, y = self:_modified_mouse_pos(x, y)

	if SystemInfo:platform() ~= Idstring("NX64") then
		if self._slider_marker then
			self:post_event("slider_release")
		end

		self._slider_marker = nil
	end

	if SystemInfo:platform() == Idstring("NX64") then
		managers.menu:stop_slider_rumble(true)
	end

	if suppress or managers.menu:active_menu().renderer:mouse_released(o, button, x, y) then
		return
	end

	for i, clbk in pairs(self._callback_map.mouse_released) do
		clbk(o, button, x, y)
	end
end

function MenuInput:mouse_clicked(o, button, x, y)
	if not self._accept_input then
		return
	end

	if managers.blackmarket and managers.blackmarket:is_preloading_weapons() then
		return
	end

	if not managers.menu:active_menu() then
		return
	end

	if self._tap_or_drag then
		return
	end

	x, y = self:_modified_mouse_pos(x, y)

	for i, clbk in pairs(self._callback_map.mouse_clicked) do
		clbk(o, button, x, y)
	end

	if not managers.menu:active_menu().renderer.mouse_clicked then
		return
	end

	return managers.menu:active_menu().renderer:mouse_clicked(o, button, x, y)
end

function MenuInput:mouse_double_click(o, button, x, y)
	if not self._accept_input then
		return
	end

	if managers.blackmarket and managers.blackmarket:is_preloading_weapons() then
		return
	end

	if not managers.menu:active_menu() then
		return
	end

	x, y = self:_modified_mouse_pos(x, y)

	if self._tap_or_drag then
		return
	end

	for i, clbk in pairs(self._callback_map.mouse_double_click) do
		clbk(o, button, x, y)
	end

	if not managers.menu:active_menu().renderer.mouse_double_click then
		return
	end

	return managers.menu:active_menu().renderer:mouse_double_click(o, button, x, y)
end

function MenuInput:update(t, dt)
	if self._tap_or_drag then
		self._tap_or_drag:tick(dt)
	end

	if self.button_anim_complete then
		if self.button_anim_callback then
			self:button_anim_callback()
		end

		self.button_anim_callback = nil
		self.button_anim_complete = false
	end

	if self._menu_plane then
		self._menu_plane:set_rotation(Rotation(math.sin(t * 60) * 40, math.sin(t * 50) * 30, 0))
	end

	self:_update_axis_status()

	if managers.blackmarket and managers.blackmarket:is_preloading_weapons() then
		return
	end

	if managers.system_menu and managers.system_menu:is_active() and not managers.system_menu:is_closing() then
		self:cancel_tod()

		return
	end

	if self._tap_or_drag then
		return
	end

	if self._page_timer > 0 then
		self:set_page_timer(self._page_timer - dt)
	end

	if not MenuInput.super.update(self, t, dt) and self._accept_input or self:force_input() then
		local axis_timer = self:axis_timer()

		if axis_timer.y <= 0 then
			if self:menu_up_input_bool() then
				local has_moved = managers.menu:active_menu().renderer:move_up()

				self:set_axis_y_timer(0.12)

				if self:menu_up_pressed() then
					self:set_axis_y_timer(0.3)

					if SystemInfo:platform() == Idstring("NX64") and has_moved then
						managers.menu:on_move_rumble()
					end
				end
			elseif self:menu_down_input_bool() then
				local has_moved = managers.menu:active_menu().renderer:move_down()

				self:set_axis_y_timer(0.12)

				if self:menu_down_pressed() then
					self:set_axis_y_timer(0.3)

					if SystemInfo:platform() == Idstring("NX64") and has_moved then
						managers.menu:on_move_rumble()
					end
				end
			end
		end

		if axis_timer.x <= 0 then
			if self:menu_left_input_bool() then
				local has_moved = managers.menu:active_menu().renderer:move_left()

				self:set_axis_x_timer(0.12)

				if self:menu_left_pressed() then
					self:set_axis_x_timer(0.3)

					if SystemInfo:platform() == Idstring("NX64") and has_moved then
						managers.menu:on_move_rumble()
					end
				end
			elseif self:menu_right_input_bool() then
				local has_moved = managers.menu:active_menu().renderer:move_right()

				self:set_axis_x_timer(0.12)

				if self:menu_right_pressed() then
					self:set_axis_x_timer(0.3)

					if SystemInfo:platform() == Idstring("NX64") and has_moved then
						managers.menu:on_move_rumble()
					end
				end
			end
		end

		if self._page_timer <= 0 then
			if self:menu_previous_page_input_bool() then
				managers.menu:active_menu().renderer:previous_page()
				self:set_page_timer(0.12)

				if self:menu_previous_page_pressed() then
					self:set_page_timer(0.3)
				end
			elseif self:menu_next_page_input_bool() then
				managers.menu:active_menu().renderer:next_page()
				self:set_page_timer(0.12)

				if self:menu_next_page_pressed() then
					self:set_page_timer(0.3)
				end
			end

			if self._accept_input and self._controller and self._controller:get_input_pressed("confirm") and managers.menu:active_menu().renderer:confirm_pressed() then
				managers.menu:active_menu().renderer:disable_input(0.2)

				if SystemInfo:platform() == Idstring("NX64") then
					managers.menu:on_press_rumble()
				end
			end

			if self._accept_input and self._controller and self._controller:get_input_pressed("back") and managers.menu:active_menu().renderer:back_pressed() then
				managers.menu:active_menu().renderer:disable_input(0.2)
			end

			if self._accept_input and self._controller and self._controller:get_input_pressed("cancel") and managers.menu:active_menu().renderer:back_pressed() then
				managers.menu:active_menu().renderer:disable_input(0.2)
			end

			if self._controller then
				local special_btns = {
					"menu_remove_skill",
					"menu_toggle_voice_message",
					"menu_respec_tree",
					"menu_respec_tree_all",
					"menu_switch_skillset",
					"menu_modify_item",
					"menu_preview_item",
					"menu_remove_item",
					"menu_preview_item_alt",
					"menu_toggle_legends",
					"menu_toggle_filters",
					"menu_toggle_ready",
					"toggle_chat",
					"menu_toggle_pp_drawboard",
					"menu_toggle_pp_breakdown",
					"trigger_left",
					"trigger_right",
					"menu_challenge_claim",
					"menu_edit_skin",
					"menu_change_profile_right",
					"menu_change_profile_left",
					"drop_in_accept",
					"drop_in_return",
					"drop_in_kick"
				}

				for _, button in ipairs(special_btns) do
					if self._accept_input and self._controller then
						if self._controller:get_input_pressed(button) then
							if managers.menu:active_menu().renderer:special_btn_pressed(Idstring(button)) then
								managers.menu:active_menu().renderer:disable_input(0.2)

								break
							end
						elseif self._controller:get_input_released(button) and managers.menu:active_menu().renderer:special_btn_released(Idstring(button)) then
							managers.menu:active_menu().renderer:disable_input(0.2)

							break
						end
					end
				end
			end
		end
	else
		if self._controller and not managers.menu:active_menu().renderer.special_btn_released then
			Application:error("Menu is missing special_btn_released function! Prepare for crashing!")
		end

		if self._controller and managers.menu:active_menu().renderer.special_btn_pressed then
			if self._controller:get_input_pressed("menu_toggle_voice_message") then
				managers.menu:active_menu().renderer:special_btn_pressed(Idstring("voice_message"))
			elseif self._controller:get_input_released("menu_toggle_voice_message") then
				managers.menu:active_menu().renderer:special_btn_released(Idstring("voice_message"))
			end

			if self._controller:get_input_pressed("menu_modify_item") then
				managers.menu:active_menu().renderer:special_btn_pressed(Idstring("menu_modify_item"))
			elseif self._controller:get_input_released("menu_modify_item") then
				managers.menu:active_menu().renderer:special_btn_released(Idstring("menu_modify_item"))
			end

			if self._controller:get_input_pressed("menu_casino_bet") then
				managers.menu:active_menu().renderer:special_btn_pressed(Idstring("start_bet"))
			elseif self._controller:get_input_released("menu_casino_bet") then
				managers.menu:active_menu().renderer:special_btn_released(Idstring("start_bet"))
			end

			if self._controller:get_input_pressed("menu_challenge_claim") then
				managers.menu:active_menu().renderer:special_btn_pressed(Idstring("menu_challenge_claim"))
			elseif self._controller:get_input_released("menu_challenge_claim") then
				managers.menu:active_menu().renderer:special_btn_released(Idstring("menu_challenge_claim"))
			end

			if self._controller:get_input_pressed("toggle_chat") then
				managers.menu:active_menu().renderer:special_btn_pressed(Idstring("toggle_chat"))
			elseif self._controller:get_input_released("toggle_chat") then
				managers.menu:active_menu().renderer:special_btn_released(Idstring("toggle_chat"))
			end

			if self._controller:get_input_pressed("menu_toggle_pp_drawboard") then
				managers.menu:active_menu().renderer:special_btn_pressed(Idstring("menu_toggle_pp_drawboard"))
			elseif self._controller:get_input_released("menu_toggle_pp_drawboard") then
				managers.menu:active_menu().renderer:special_btn_released(Idstring("menu_toggle_pp_drawboard"))
			end

			if self._controller:get_input_pressed("menu_toggle_pp_breakdown") then
				managers.menu:active_menu().renderer:special_btn_pressed(Idstring("menu_toggle_pp_breakdown"))
			elseif self._controller:get_input_released("menu_toggle_pp_breakdown") then
				managers.menu:active_menu().renderer:special_btn_released(Idstring("menu_toggle_pp_breakdown"))
			end
		end
	end

	if not self._keyboard_used and self._mouse_active and not managers.menu:is_switch_controller() and self._accept_input and not self._mouse_moved then
		self:mouse_moved(managers.mouse_pointer:mouse(), managers.mouse_pointer:world_position())
	end

	self._mouse_moved = nil
end

function MenuInput:menu_axis_move()
	local axis_moved = {
		x = 0,
		y = 0
	}

	if self._controller then
		local move = self._controller:get_input_axis("menu_move")

		if move then
			axis_moved = move
		end
	end

	return axis_moved
end

function MenuInput:post_event(event)
	self._sound_source:post_event(event)
end

function MenuInput:menu_up_input_bool()
	return MenuInput.super.menu_up_input_bool(self) or self._move_axis_limit < self:menu_axis_move().y
end

function MenuInput:menu_up_pressed()
	return MenuInput.super.menu_up_pressed(self) or self._axis_status.y == self.AXIS_STATUS_PRESSED and self:menu_axis_move().y > 0
end

function MenuInput:menu_up_released()
	return MenuInput.super.menu_up_released(self) or self._axis_status.y == self.AXIS_STATUS_RELEASED
end

function MenuInput:menu_down_input_bool()
	return MenuInput.super.menu_down_input_bool(self) or self:menu_axis_move().y < -self._move_axis_limit
end

function MenuInput:menu_down_pressed()
	return MenuInput.super.menu_down_pressed(self) or self._axis_status.y == self.AXIS_STATUS_PRESSED and self:menu_axis_move().y < 0
end

function MenuInput:menu_down_released()
	return MenuInput.super.menu_down_released(self) or self._axis_status.y == self.AXIS_STATUS_RELEASED
end

function MenuInput:menu_left_input_bool()
	return MenuInput.super.menu_left_input_bool(self) or self:menu_axis_move().x < -self._move_axis_limit
end

function MenuInput:menu_left_pressed()
	return MenuInput.super.menu_left_pressed(self) or self._axis_status.x == self.AXIS_STATUS_PRESSED and self:menu_axis_move().x < 0
end

function MenuInput:menu_left_released()
	return MenuInput.super.menu_left_released(self) or self._axis_status.x == self.AXIS_STATUS_RELEASED
end

function MenuInput:menu_right_input_bool()
	return MenuInput.super.menu_right_input_bool(self) or self._move_axis_limit < self:menu_axis_move().x
end

function MenuInput:menu_right_pressed()
	return MenuInput.super.menu_right_pressed(self) or self._axis_status.x == self.AXIS_STATUS_PRESSED and self:menu_axis_move().x > 0
end

function MenuInput:menu_right_released()
	return MenuInput.super.menu_right_released(self) or self._axis_status.x == self.AXIS_STATUS_RELEASED
end

function MenuInput:menu_next_page_input_bool()
	if self._controller then
		return self._controller:get_input_bool("next_page")
	end

	return false
end

function MenuInput:menu_next_page_pressed()
	if self._controller then
		return self._controller:get_input_pressed("next_page")
	end

	return false
end

function MenuInput:menu_next_page_released()
	if self._controller then
		return self._controller:get_input_released("next_page")
	end

	return false
end

function MenuInput:menu_previous_page_input_bool()
	if self._controller then
		return self._controller:get_input_bool("previous_page")
	end

	return false
end

function MenuInput:menu_previous_page_pressed()
	if self._controller then
		return self._controller:get_input_pressed("previous_page")
	end

	return false
end

function MenuInput:menu_previous_page_released()
	if self._controller then
		return self._controller:get_input_released("previous_page")
	end

	return false
end

function MenuInput:_update_axis_status()
	local axis_moved = self:menu_axis_move()

	if self._axis_status.x == self.AXIS_STATUS_UP and math.abs(axis_moved.x) - self._move_axis_limit > 0 then
		self._axis_status.x = self.AXIS_STATUS_PRESSED
	elseif math.abs(axis_moved.x) - self._move_axis_limit > 0 then
		self._axis_status.x = self.AXIS_STATUS_DOWN
	elseif self._axis_status.x == self.AXIS_STATUS_PRESSED or self._axis_status.x == self.AXIS_STATUS_DOWN then
		self._axis_status.x = self.AXIS_STATUS_RELEASED
	else
		self._axis_status.x = self.AXIS_STATUS_UP
	end

	if self._axis_status.y == self.AXIS_STATUS_UP and math.abs(axis_moved.y) - self._move_axis_limit > 0 then
		self._axis_status.y = self.AXIS_STATUS_PRESSED
	elseif math.abs(axis_moved.y) - self._move_axis_limit > 0 then
		self._axis_status.y = self.AXIS_STATUS_DOWN
	elseif self._axis_status.y == self.AXIS_STATUS_PRESSED or self._axis_status.y == self.AXIS_STATUS_DOWN then
		self._axis_status.y = self.AXIS_STATUS_RELEASED
	else
		self._axis_status.y = self.AXIS_STATUS_UP
	end
end

function MenuInput:_update_axis_scroll_status()
	local axis_scrolled = self:menu_axis_scroll()

	if self._axis_status.x == self.AXIS_STATUS_UP and math.abs(axis_scrolled.x) - self._move_axis_limit > 0 then
		self._axis_status.x = self.AXIS_STATUS_PRESSED
	elseif math.abs(axis_scrolled.x) - self._move_axis_limit > 0 then
		self._axis_status.x = self.AXIS_STATUS_DOWN
	elseif self._axis_status.x == self.AXIS_STATUS_PRESSED or self._axis_status.x == self.AXIS_STATUS_DOWN then
		self._axis_status.x = self.AXIS_STATUS_RELEASED
	else
		self._axis_status.x = self.AXIS_STATUS_UP
	end

	if self._axis_status.y == self.AXIS_STATUS_UP and math.abs(axis_scrolled.y) - self._move_axis_limit > 0 then
		self._axis_status.y = self.AXIS_STATUS_PRESSED
	elseif math.abs(axis_scrolled.y) - self._move_axis_limit > 0 then
		self._axis_status.y = self.AXIS_STATUS_DOWN
	elseif self._axis_status.y == self.AXIS_STATUS_PRESSED or self._axis_status.y == self.AXIS_STATUS_DOWN then
		self._axis_status.y = self.AXIS_STATUS_RELEASED
	else
		self._axis_status.y = self.AXIS_STATUS_UP
	end
end
