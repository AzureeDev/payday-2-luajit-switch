core:module("CoreMenuNodeGui")
core:import("CoreUnit")

NodeGui = NodeGui or class()

function NodeGui:init(node, layer, parameters)
	self.node = node
	self.name = node:parameters().name
	self.font = "core/fonts/diesel"
	self.font_size = 28
	self.topic_font_size = 48
	self.spacing = 0
	self.height_padding = 0
	self.width_padding = 0
	self.enable_tap_or_drag = node:parameters().enable_tap_or_drag
	local safe_rect_pixels = managers.viewport:get_safe_rect_pixels()
	self.ws = managers.gui_data:create_saferect_workspace()
	self._item_panel_parent = self.ws:panel():panel({
		name = "item_panel_parent"
	})
	self.item_panel = self._item_panel_parent:panel({
		name = "item_panel"
	})
	self.safe_rect_panel = self.ws:panel():panel({
		name = "safe_rect_panel"
	})
	self.corner_items = {}

	self.ws:show()

	self.layers = {
		first = layer,
		background = layer,
		marker = layer + 1,
		items = layer + 2
	}
	self.layers.last = self.layers.items
	self.localize_strings = true
	self.row_item_color = self.row_item_color or Color(1, 0.5529411764705883, 0.6901960784313725, 0.8274509803921568)
	self.row_item_hightlight_color = self.row_item_hightlight_color or Color(1, 0.5529411764705883, 0.6901960784313725, 0.8274509803921568)
	self.row_item_disabled_text_color = self.row_item_disabled_text_color or Color(1, 0.5, 0.5, 0.5)

	if parameters then
		for param_name, param_value in pairs(parameters) do
			self[param_name] = param_value
		end
	end

	if self.texture then
		self.texture.layer = self.layers.background
		self.texture = self.ws:panel():bitmap(self.texture)

		self.texture:set_visible(true)
	end

	self:_setup_panels(node)

	self.row_items = {}

	self:_setup_item_rows(node)
end

function NodeGui:item_panel_parent()
	return self._item_panel_parent
end

function NodeGui:_setup_panels(node)
end

function NodeGui:_setup_item_rows(node)
	local items = node:items()
	local i = 0

	if not managers.menu:is_pc_controller() then
		for i, a in ipairs(items) do
			for k, b in ipairs(items) do
				if i ~= k and a:parameters().controller_order_override ~= nil and b:parameters().controller_order_override ~= nil and a:parameters().controller_order_override < b:parameters().controller_order_override and k < i then
					local t = a
					items[i] = b
					items[k] = t
				end
			end
		end
	end

	for _, item in pairs(items) do
		if item:visible() then
			item:parameters().gui_node = self
			local item_name = item:parameters().name
			local item_text = "menu item missing 'text_id'"

			if item:parameters().no_text then
				item_text = nil
			end

			local help_text = nil
			local params = item:parameters()

			if params.text_id then
				if self.localize_strings and params.localize ~= false and params.localize ~= "false" then
					item_text = managers.localization:text(params.text_id)
				else
					item_text = params.text_id
				end
			end

			if params.help_id then
				if self.localize_strings and params.localize_help ~= false and params.localize_help ~= "false" then
					help_text = managers.localization:text(params.help_id)
				else
					help_text = params.help_id
				end
			end

			local row_item = {}

			table.insert(self.row_items, row_item)

			local font_size = params.font_size or self.font_size
			row_item.item = item
			row_item.node = node
			row_item.node_gui = self
			row_item.type = item._type
			row_item.name = item_name
			row_item.position = {
				x = 0,
				y = self.font_size * i + self.spacing * (i - 1)
			}
			row_item.color = params.color or self.row_item_color
			row_item.row_item_color = params.row_item_color
			row_item.hightlight_color = params.hightlight_color
			row_item.disabled_color = params.disabled_color or self.row_item_disabled_text_color
			row_item.marker_color = params.marker_color or self.marker_color
			row_item.marker_disabled_color = params.marker_disabled_color or self.marker_disabled_color
			row_item.font = params.font or self.font
			row_item.font_size = font_size
			row_item.text = item_text
			row_item.help_text = help_text
			row_item.align = params.align or self.align or "left"
			row_item.halign = params.halign or self.halign or "left"
			row_item.vertical = params.vertical or self.vertical or "center"
			row_item.to_upper = params.to_upper == nil and self.to_upper or params.to_upper or false
			row_item.color_ranges = params.color_ranges or self.color_ranges or nil

			if SystemInfo:platform() == Idstring("NX64") then
				if not params.dont_reset_colors then
					row_item.hightlight_color = Color.white
				end

				row_item.items_on_row = params.multi_item_row or nil
				row_item.item_number = params.multi_item_number or nil
				row_item.is_large_menu_button = params.is_large_menu_button or nil
				row_item.texture_scale_h = params.texture_scale_h or 1
				row_item.texture_scale_w = params.texture_scale_w or 1
				row_item.texture_x = params.texture_x or 0
				row_item.texture_y = params.texture_y or 0
				row_item.unselected_texture = params.unselected_texture or nil
				row_item.selected_texture = params.selected_texture or nil
				row_item.selection_color = params.selection_color or nil
				row_item.hide_highlight = params.hide_highlight or nil

				if row_item.is_large_menu_button then
					row_item.font_size = 32
					row_item.font = "fonts/font_large_mf"
					row_item.pan_texture = params.pan_texture or nil
					row_item.show_corner_deco = not params.hide_corner_deco and true

					if row_item.pan_texture ~= nil then
						row_item.pan_minu = params.pan_minu
						row_item.pan_minv = params.pan_minv
						row_item.pan_maxu = params.pan_maxu
						row_item.pan_maxv = params.pan_maxv
						row_item.pan_unselected_adjust = params.pan_unselected_adjust
					end
				end

				row_item.is_options_button = params.is_options_button or nil

				if row_item.is_options_button then
					row_item.font = "fonts/font_medium_mf"
				end

				row_item.is_play_menu_button = params.is_play_menu_button or nil
				row_item.is_short_mission_button = params.is_short_mission_button or nil

				if row_item.is_short_mission_button then
					row_item.show_corner_deco = true
				end

				row_item.subtext = params.subtext or nil
				row_item.wants_switch_arrows = params.wants_switch_arrows or nil
				row_item.offshore_payday = params.offshore_payday or nil
				row_item.crimenet_contract_gui = params.crimenet_contract_gui or nil
				row_item.is_kick_menu = params.is_kick_menu or nil
				row_item.is_payday_selection = params.is_payday_selection or nil
				row_item.is_crimenet_contacts = params.is_crimenet_contacts or nil
				row_item.jukebox_gui = params.jukebox_gui or nil
				row_item.colored_background = params.colored_background or nil
				row_item.is_contract_broker = params.is_contract_broker
				row_item.is_preplanning_button = params.is_preplanning_button or nil
				row_item.is_preplanning_divider = params.is_preplanning_divider or nil
				row_item.add_unique_panel = params.add_unique_panel or nil
				row_item.is_gage_button = params.is_gage_button or nil
				row_item.switch_reticle = params.switch_reticle or nil
				row_item.queue_action = params.queue_action or false
			end

			self:_create_menu_item(row_item)
			self:reload_item(item)

			if not row_item.items_on_row or row_item.items_on_row <= 1 or row_item.item_number - 1 >= row_item.items_on_row then
				i = i + 1
			end
		end
	end

	self:_setup_size()
	self:scroll_setup()
	self:_set_item_positions()

	self._highlighted_item = nil
end

function NodeGui:_insert_row_item(item, node, i)
	if item:visible() then
		item:parameters().gui_node = self
		local item_name = item:parameters().name
		local item_text = "menu item missing 'text_id'"
		local help_text = nil
		local params = item:parameters()

		if params.text_id then
			if self.localize_strings and params.localize ~= false and params.localize ~= "false" then
				item_text = managers.localization:text(params.text_id)
			else
				item_text = params.text_id
			end
		end

		if params.help_id then
			if self.localize_strings and params.localize_help ~= false and params.localize_help ~= "false" then
				help_text = managers.localization:text(params.help_id)
			else
				help_text = params.help_id
			end
		end

		local row_item = {}

		table.insert(self.row_items, i, row_item)

		row_item.item = item
		row_item.node = node
		row_item.type = item._type
		row_item.name = item_name
		row_item.position = {
			x = 0,
			y = self.font_size * i + self.spacing * (i - 1)
		}
		row_item.color = params.color or self.row_item_color
		row_item.row_item_color = params.row_item_color
		row_item.hightlight_color = params.hightlight_color
		row_item.disabled_color = params.disabled_color or self.row_item_disabled_text_color
		row_item.font = self.font
		row_item.text = item_text
		row_item.help_text = help_text
		row_item.align = params.align or self.align or "left"
		row_item.halign = params.halign or self.halign or "left"
		row_item.vertical = params.vertical or self.vertical or "center"
		row_item.to_upper = params.to_upper or false
		row_item.color_ranges = params.color_ranges or self.color_ranges or nil

		self:_create_menu_item(row_item)
		self:reload_item(item)
	end
end

function NodeGui:_delete_row_item(item)
	for i, row_item in ipairs(self.row_items) do
		if row_item.item == item then
			local delete_row_item = table.remove(self.row_items, i)

			if alive(row_item.gui_panel) then
				item:on_delete_row_item(row_item)
				self.item_panel:remove(row_item.gui_panel)
				self.item_panel:remove(row_item.menu_unselected)
				self.item_panel:remove(row_item.menu_selected)

				if row_item.pan_state ~= nil then
					row_item.pan_state:kill()

					row_item.pan_state = nil
				end

				if row_item.corner_deco ~= nil then
					row_item.corner_deco:kill()

					row_item.corner_deco = nil
				end

				self.item_panel:remove(row_item.pan_background)
			end

			return
		end
	end
end

function NodeGui:refresh_gui(node)
	self:_clear_gui()
	self:_setup_item_rows(node)
end

function NodeGui:_clear_gui()
	local to = #self.row_items

	for i = 1, to do
		local row_item = self.row_items[i]

		if alive(row_item.gui_panel) then
			row_item.gui_panel:parent():remove(row_item.gui_panel)

			row_item.gui_panel = nil

			if alive(row_item.menu_unselected) then
				row_item.menu_unselected:parent():remove(row_item.menu_unselected)

				row_item.menu_unselected = nil
			end

			if alive(row_item.menu_selected) then
				row_item.menu_selected:parent():remove(row_item.menu_selected)

				row_item.menu_selected = nil
			end

			if alive(row_item.pan_background) then
				if row_item.pan_state ~= nil then
					row_item.pan_state:kill()

					row_item.pan_state = nil
				end

				row_item.pan_background:parent():remove(row_item.pan_background)

				row_item.pan_background = nil
			end

			if row_item.corner_deco ~= nil then
				row_item.corner_deco:kill()

				row_item.corner_deco = nil
			end
		end

		if alive(row_item.gui_info_panel) then
			self.safe_rect_panel:remove(row_item.gui_info_panel)
		end

		if SystemInfo:platform() == Idstring("NX64") and row_item.is_options_button and alive(row_item.gui_text) then
			row_item.gui_text:parent():remove(row_item.gui_text)

			row_item.gui_text = nil
		end

		if alive(row_item.icon) then
			row_item.icon:parent():remove(row_item.icon)
		end

		self.row_items[i] = nil
	end

	self.row_items = {}
end

function NodeGui:close()
	managers.gui_data:destroy_workspace(self.ws)

	self.ws = nil
end

function NodeGui:layer()
	return self.layers.last
end

function NodeGui:set_visible(visible)
	if visible then
		self.ws:show()
	else
		self.ws:hide()
	end
end

function NodeGui:reload_item(item)
	local type = item:type()

	if type == "" then
		self:_reload_item(item)
	end

	if type == "toggle" then
		-- Nothing
	end

	if type == "slider" then
		-- Nothing
	end
end

function NodeGui:_reload_item(item)
	local row_item = self:row_item(item)
	local params = item:parameters()

	if params.text_id then
		if self.localize_strings and params.localize ~= false and params.localize ~= "false" then
			item_text = managers.localization:text(params.text_id)
		else
			item_text = params.text_id
		end
	end

	if row_item then
		row_item.text = item_text

		if SystemInfo:platform() == Idstring("NX64") and row_item.is_options_button then
			if row_item.gui_text.set_text then
				row_item.gui_text:set_text(row_item.to_upper and utf8.to_upper(row_item.text) or row_item.text)
				row_item.gui_text:set_color(row_item.color)
			end
		elseif row_item.gui_panel.set_text then
			row_item.gui_panel:set_text(row_item.to_upper and utf8.to_upper(row_item.text) or row_item.text)
			row_item.gui_panel:set_color(row_item.color)
		end
	end
end

function NodeGui:_create_menu_item(row_item)
end

function NodeGui:_reposition_items(highlighted_row_item)
	local safe_rect = managers.viewport:get_safe_rect_pixels()
	local dy = 0

	if highlighted_row_item then
		if highlighted_row_item.item:parameters().back or highlighted_row_item.item:parameters().pd2_corner then
			return
		end

		if SystemInfo:platform() == Idstring("NX64") and highlighted_row_item.name == "contact_filter" then
			self:scroll_start(math.abs(self._item_panel_parent:world_top() - self.item_panel:world_top() - 75))

			return
		end

		local divider_top_height = 0
		local prev_item, first_item = nil
		local num_dividers_top = 0

		for i = 1, #self.row_items do
			first_item = self.row_items[i]

			if first_item.type ~= "divider" and not first_item.item:parameters().back and not first_item.item:parameters().pd2_corner then
				break
			elseif first_item.type == "divider" then
				num_dividers_top = num_dividers_top + 1
				divider_top_height = divider_top_height + first_item.gui_panel:h()
			end
		end

		local first = first_item.gui_panel == highlighted_row_item.gui_panel
		local last_item = nil
		local num_dividers_bottom = 0
		local divider_bottom_height = 0

		for i = #self.row_items, 1, -1 do
			last_item = self.row_items[i]

			if last_item.type ~= "divider" and not last_item.item:parameters().back and not last_item.item:parameters().pd2_corner then
				break
			elseif last_item.type == "divider" then
				num_dividers_bottom = num_dividers_bottom + 1
				divider_bottom_height = divider_bottom_height + last_item.gui_panel:h()
			end
		end

		local last = last_item.gui_panel == highlighted_row_item.gui_panel
		local prev_item, next_item = nil

		for i, row_item in ipairs(self.row_items) do
			if row_item.gui_panel == highlighted_row_item.gui_panel then
				if not first then
					for index = i - 1, 1, -1 do
						row_item = self.row_items[index]

						if row_item.type ~= "divider" and not row_item.item:parameters().back and not row_item.item:parameters().pd2_corner then
							prev_item = row_item

							break
						end
					end
				end

				if not last then
					for index = i + 1, #self.row_items do
						row_item = self.row_items[index]

						if row_item.type ~= "divider" and not row_item.item:parameters().back and not row_item.item:parameters().pd2_corner then
							next_item = row_item

							break
						end
					end
				end

				break
			end
		end

		local h = highlighted_row_item.item:get_h(highlighted_row_item, self) or highlighted_row_item.gui_panel:h()
		local offset = first and h * num_dividers_top or last and h * num_dividers_bottom or h

		if SystemInfo:platform() == Idstring("NX64") then
			offset = first and divider_top_height or last and divider_bottom_height or h
		end

		offset = offset + self.height_padding

		if self._item_panel_parent:world_y() > highlighted_row_item.gui_panel:world_y() - (offset + (prev_item and math.abs(prev_item.gui_panel:y() - highlighted_row_item.gui_panel:y()) - h or 0)) then
			if prev_item then
				offset = offset + math.abs(prev_item.gui_panel:y() - highlighted_row_item.gui_panel:y()) - h
			end

			dy = -(highlighted_row_item.gui_panel:world_y() - self._item_panel_parent:world_y() - offset)
		elseif self._item_panel_parent:world_y() + self._item_panel_parent:h() < highlighted_row_item.gui_panel:world_y() + highlighted_row_item.gui_panel:h() + offset + (next_item and math.abs(next_item.gui_panel:y() - highlighted_row_item.gui_panel:y()) - h or 0) then
			if next_item then
				offset = offset + math.abs(next_item.gui_panel:y() - highlighted_row_item.gui_panel:y()) - h
			end

			dy = -(highlighted_row_item.gui_panel:world_y() + highlighted_row_item.gui_panel:h() - (self._item_panel_parent:world_y() + self._item_panel_parent:h()) + offset)
		end

		local old_dy = self._scroll_data.dy_left
		local is_same_dir = math.abs(old_dy) > 0 and (math.sign(dy) == math.sign(old_dy) or dy == 0)

		if is_same_dir then
			local within_view = math.within(highlighted_row_item.gui_panel:world_y(), self._item_panel_parent:world_y(), self._item_panel_parent:world_y() + self._item_panel_parent:h())

			if within_view then
				dy = math.max(math.abs(old_dy), math.abs(dy)) * math.sign(old_dy)
			end
		end
	end

	self:scroll_start(dy)
end

function NodeGui:abort_scroll()
	if self._scroll_data then
		self._scroll_data.dy_left = 0
	end
end

function NodeGui:scroll_setup()
	self._scroll_data = {
		max_scroll_duration = 0.5,
		scroll_speed = (self.font_size + self.spacing * 2) / 0.1,
		dy_total = 0,
		dy_left = 0
	}
end

function NodeGui:move_scrollbar_thumb(new_y)
	if self.scroll_bar and self.scroll_bar_bg and SystemInfo:platform() == Idstring("NX64") then
		local limit = -(self.item_panel:h() - self._item_panel_parent:h())
		local gap_size = self.scroll_bar_bg:h() - self.scroll_bar:h()
		local min_y = self.scroll_bar_bg:top()
		local max_y = self.scroll_bar_bg:bottom() - self.scroll_bar:h()

		if new_y < min_y then
			new_y = min_y
		elseif max_y < new_y then
			new_y = max_y
		end

		self.item_panel:set_y((new_y - self.scroll_bar_bg:y()) * limit / gap_size)
		self.scroll_bar:set_y(new_y)
	end
end

function NodeGui:_clamp_scroll_y(new_panel_y)
	if self.item_panel and self._item_panel_parent then
		local minus_offscreen = self._item_panel_parent:h() - self.item_panel:h()

		if new_panel_y < minus_offscreen then
			new_panel_y = minus_offscreen
		end

		if new_panel_y > 0 then
			new_panel_y = 0
		end

		return new_panel_y
	else
		return 0
	end
end

function NodeGui:touch_scroll(dy)
	local current_y = self.item_panel:y()
	local new_y = self:_clamp_scroll_y(current_y + dy)
	dy = new_y - current_y

	if self._item_panel_y and self._item_panel_y.target then
		self._item_panel_y.target = self._item_panel_y.target + dy
	end

	self.item_panel:set_y(new_y)
	self:refresh_scrollbar()

	if self.scroll_bar and self.scroll_bar_bg and SystemInfo:platform() ~= Idstring("NX64") then
		local scroll_bar_move_y = -(dy / self.item_panel:h()) * self.scroll_bar_bg:h()

		self.scroll_bar:set_y(self.scroll_bar:y() + scroll_bar_move_y)
	end
end

function NodeGui:scroll_start(dy)
	local speed = self._scroll_data.scroll_speed

	if speed > 0 and self._scroll_data.max_scroll_duration < math.abs(dy / speed) then
		speed = math.abs(dy) / self._scroll_data.max_scroll_duration
	end

	self._scroll_data.speed = speed
	self._scroll_data.dy_total = dy
	self._scroll_data.dy_left = dy

	self:scroll_update(TimerManager:main():delta_time())
end

function NodeGui:scroll_update(dt)
	if self.prevent_scroll_to_view then
		self._scroll_data.dy_left = 0
	end

	local dy_left = self._scroll_data.dy_left

	if dy_left ~= 0 then
		local speed = self._scroll_data.speed
		local dy = nil

		if speed <= 0 then
			dy = dy_left
		else
			dy = math.lerp(0, dy_left, math.clamp(math.sign(dy_left) * speed * dt / dy_left, 0, 1))
		end

		self._scroll_data.dy_left = self._scroll_data.dy_left - dy
		local new_y = self:_clamp_scroll_y(self.item_panel:y() + dy)

		if self._item_panel_y and self._item_panel_y.target then
			self._item_panel_y.target = self._item_panel_y.target + dy
		end

		self.item_panel:set_y(new_y)
		self:refresh_scrollbar()

		return true
	end
end

function NodeGui:wheel_scroll_start(dy)
	local speed = 30

	if dy > 0 then
		local dist = self.item_panel:world_y() - self._item_panel_parent:world_y()

		if math.round(self.item_panel:world_y()) - self._item_panel_parent:world_y() >= 0 then
			return self._item_panel_parent:h() < self.item_panel:h()
		end

		speed = math.min(speed, math.abs(dist))
	else
		local dist = self.item_panel:world_bottom() - self._item_panel_parent:world_bottom()

		if math.round(self.item_panel:world_bottom()) - self._item_panel_parent:world_bottom() < 4 then
			return self._item_panel_parent:h() < self.item_panel:h()
		end

		speed = math.min(speed, math.abs(dist))
	end

	self:scroll_start(speed * dy)
	self:refresh_scrollbar()

	return true
end

function NodeGui:refresh_scrollbar()
	if SystemInfo:platform() == Idstring("NX64") and self.scroll_bar and self.scroll_bar_bg then
		local limit = -(self.item_panel:h() - self._item_panel_parent:h())

		self.scroll_bar:set_y(self.scroll_bar_bg:y() + self.item_panel:y() / limit * (self.scroll_bar_bg:h() - self.scroll_bar:h()))
	end
end

function NodeGui:highlight_item(item, mouse_over)
	if not item then
		return
	end

	local item_name = item:parameters().name
	local row_item = self:row_item(item)

	self:_highlight_row_item(row_item, mouse_over)
	self:_reposition_items(row_item)

	self._highlighted_item = item
end

function NodeGui:_highlight_row_item(row_item, mouse_over)
	if row_item then
		row_item.highlighted = true
		row_item.color = row_item.item:enabled() and (row_item.hightlight_color or self.row_item_hightlight_color) or row_item.disabled_color

		if SystemInfo:platform() == Idstring("NX64") and row_item.is_options_button then
			row_item.gui_text:set_color(row_item.color)
		elseif SystemInfo:platform() == Idstring("NX64") and row_item.is_preplanning_button then
			row_item.gui_panel:set_color(Color.white)
		else
			row_item.gui_panel:set_color(row_item.color)
		end
	end
end

function NodeGui:fade_item(item)
	local item_name = item:parameters().name
	local row_item = self:row_item(item)

	self:_fade_row_item(row_item)
end

function NodeGui:_fade_row_item(row_item)
	if row_item then
		row_item.highlighted = false
		row_item.color = row_item.item:enabled() and (row_item.row_item_color or self.row_item_color) or row_item.disabled_color

		if SystemInfo:platform() == Idstring("NX64") and row_item.is_options_button then
			row_item.gui_text:set_color(row_item.color)
		else
			row_item.gui_panel:set_color(row_item.color)
		end
	end
end

function NodeGui:row_item(item)
	local item_name = item:parameters().name

	for _, row_item in ipairs(self.row_items) do
		if row_item.name == item_name then
			return row_item
		end
	end

	return nil
end

function NodeGui:row_item_by_name(item_name)
	for _, row_item in ipairs(self.row_items) do
		if row_item.name == item_name then
			return row_item
		end
	end

	return nil
end

function NodeGui:update(t, dt)
	local scrolled = self:scroll_update(dt)

	if self.swiped and self.swipe_speed >= 0 then
		self:touch_scroll(self.swipe_speed * self.swipe_dir)

		self.swipe_speed = self.swipe_speed - 40 * dt

		if self.swipe_speed <= 0 then
			self.swiped = false
			self.swipe_speed = 0
		end
	end

	if self._item_panel_y and not scrolled then
		if self._item_panel_y.target and self.item_panel:center_y() ~= self._item_panel_y.target then
			self._item_panel_y.current = math.lerp(self.item_panel:center_y(), self._item_panel_y.target, dt * 10)

			self.item_panel:set_center_y(self._item_panel_y.current)
			self:refresh_scrollbar()
			self:_set_topic_position()
		end
	elseif scrolled then
		if self._item_panel_y and self._item_panel_y.target and self.item_panel:center_y() ~= self._item_panel_y.target then
			self._item_panel_y.current = math.lerp(self.item_panel:center_y(), self._item_panel_y.target, dt * 10)
		end

		self:_set_topic_position()
	end
end

function NodeGui:_set_topic_position()
end

function NodeGui:_item_panel_height()
	local height = self.height_padding * 2

	for _, row_item in pairs(self.row_items) do
		if not row_item.item:parameters().back and not row_item.item:parameters().pd2_corner and (not row_item.items_on_row or row_item.item_number >= row_item.items_on_row - 1) then
			local x, y, w, h = row_item.gui_panel:shape()
			height = height + h + self.spacing
		end
	end

	return height
end

function NodeGui:_set_item_positions()
	local total_height = self:_item_panel_height()
	local current_y = self.height_padding
	local current_item_height = 0
	local scaled_size = managers.gui_data:scaled_size()

	for _, row_item in pairs(self.row_items) do
		if not row_item.item:parameters().back then
			row_item.position.y = current_y

			row_item.gui_panel:set_y(row_item.position.y)

			if SystemInfo:platform() == Idstring("NX64") and row_item.is_options_button and row_item.type ~= "multi_choice" and row_item.type ~= "toggle" and row_item.gui_text then
				row_item.gui_text:set_world_center_y(row_item.gui_panel:world_center_y() + 1)
			elseif SystemInfo:platform() == Idstring("NX64") and row_item.type == "divider" and row_item.is_contract_broker then
				row_item.gui_panel:set_y(155)
			end

			if SystemInfo:platform() == Idstring("NX64") and row_item.is_preplanning_divider then
				row_item.gui_panel:set_left(0)
			end

			if row_item.is_large_menu_button or row_item.is_short_mission_button or row_item.is_preplanning_button or row_item.show_menu_selected or row_item.switch_reticle then
				row_item.menu_unselected:set_h(row_item.gui_panel:h())
				row_item.menu_unselected:set_center_y(row_item.gui_panel:center_y())
				row_item.menu_unselected:set_w(row_item.gui_panel:w())
				row_item.menu_unselected:set_center_x(row_item.gui_panel:center_x())
				row_item.menu_selected:set_h(row_item.gui_panel:h())
				row_item.menu_selected:set_center_y(row_item.gui_panel:center_y())
				row_item.menu_selected:set_w(row_item.gui_panel:w())
				row_item.menu_selected:set_center_x(row_item.gui_panel:center_x())

				if row_item.is_payday_selection then
					self:refresh_scrollbar()
				end

				if row_item.pan_state ~= nil then
					row_item.pan_background:set_h(row_item.gui_panel:h())
					row_item.pan_background:set_center_y(row_item.gui_panel:center_y())
					row_item.pan_background:set_w(row_item.gui_panel:w())
					row_item.pan_background:set_center_x(row_item.gui_panel:center_x())
					row_item.pan_background:set_visible(true)
					row_item.pan_state:resize()
					row_item.menu_selected:set_visible(false)
					row_item.menu_unselected:set_visible(false)
				end

				if row_item.corner_deco ~= nil then
					if row_item.menu_unselected then
						row_item.corner_deco:resize(row_item.menu_unselected)
					else
						row_item.corner_deco:resize(row_item.gui_panel)
					end
				end

				if row_item.is_short_mission_button then
					local x, y, w, h = row_item.gui_panel:text_rect()

					row_item.gui_panel:set_world_x(row_item.gui_panel:world_x() + self.font_size / 2)
					row_item.menu_selected:set_world_x(row_item.gui_panel:world_x() - self.font_size / 2)
					row_item.menu_selected:set_world_y(row_item.gui_panel:world_y())
					row_item.menu_unselected:set_world_x(row_item.gui_panel:world_x() - self.font_size / 2)
					row_item.menu_unselected:set_world_y(row_item.gui_panel:world_y())

					row_item.subtext_panel = self.item_panel:text({
						font_size = self.font_size,
						x = row_item.gui_panel:x(),
						y = row_item.gui_panel:y() + row_item.gui_panel:h() - h,
						font = row_item.font,
						color = Color.white,
						layer = self.layers.items,
						blend_mode = self.row_item_blend_mode or "normal",
						text = row_item.to_upper and utf8.to_upper(row_item.subtext) or row_item.subtext,
						render_template = Idstring("VertexColorTextured")
					})
					local _, _, wt, ht = row_item.subtext_panel:text_rect()

					row_item.subtext_panel:set_h(ht)
					row_item.subtext_panel:set_w(wt)

					local color_ranges = row_item.color_ranges

					if color_ranges then
						for _, color_range in ipairs(color_ranges) do
							new_text:set_range_color(color_range.start, color_range.stop, color_range.color)
						end
					end
				end

				if row_item.is_preplanning_button then
					local icon_offset = 25

					row_item.gui_panel:set_w(self.item_panel:w())
					row_item.gui_panel:set_world_left(self.item_panel:world_left() + icon_offset)
					row_item.menu_unselected:set_h(row_item.gui_panel:h() * 0.9)
					row_item.menu_unselected:set_w(self.item_panel:w())
					row_item.menu_unselected:set_center_y(row_item.gui_panel:center_y() - 1)
					row_item.menu_unselected:set_center_x(row_item.gui_panel:center_x() - icon_offset)
					row_item.menu_selected:set_h(row_item.gui_panel:h() * 0.9)
					row_item.menu_selected:set_w(self.item_panel:w())
					row_item.menu_selected:set_center_y(row_item.gui_panel:center_y() - 1)
					row_item.menu_selected:set_center_x(row_item.gui_panel:center_x() - icon_offset)
				end

				if row_item.is_contract_broker then
					row_item.gui_panel:set_x(row_item.gui_panel:x() + row_item.gui_panel:font_size() / 2)
				end

				if row_item.switch_reticle then
					local padding = 15
					local x_padding = 20
					local items_on_row = row_item.items_on_row and row_item.items_on_row or 1
					local button_w = row_item.gui_panel:parent():w() / items_on_row - items_on_row * padding
					local item_number = row_item.item_number and row_item.item_number or 1

					row_item.gui_panel:set_width(button_w)
					row_item.gui_panel:set_x(x_padding + button_w * item_number + padding * item_number)
					row_item.menu_unselected:set_shape(row_item.gui_panel:shape())
					row_item.menu_selected:set_shape(row_item.gui_panel:shape())
				end
			else
				row_item.menu_unselected:set_left(self:_mid_align() + (row_item.item:parameters().expand_value or 0))
				row_item.menu_unselected:set_h(64 * row_item.gui_panel:h() / 32)
				row_item.menu_unselected:set_center_y(row_item.gui_panel:center_y())
				row_item.menu_unselected:set_w(scaled_size.width - row_item.menu_unselected:x())
			end

			if row_item.current_of_total then
				row_item.current_of_total:set_w(200)
				row_item.current_of_total:set_center_y(row_item.menu_unselected:center_y())
				row_item.current_of_total:set_right(row_item.menu_unselected:right() - self._align_line_padding)
			end

			row_item.item:on_item_position(row_item, self)

			if row_item.icon then
				if SystemInfo:platform() == Idstring("NX64") then
					row_item.icon:set_right(row_item.gui_panel:right())
					row_item.icon:set_center_y(row_item.gui_panel:center_y())

					if row_item.is_gage_button then
						row_item.icon:set_w(2)
						row_item.icon:set_h(32)
						row_item.icon:set_left(1)
					else
						row_item.icon:set_w(32)
						row_item.icon:set_h(32)
					end

					if row_item.gui_panel.set_text then
						row_item.icon:set_color(row_item.gui_panel:color())
					else
						row_item.icon:set_color(row_item.gui_text:color())
					end
				else
					row_item.icon:set_left(row_item.gui_panel:right())
					row_item.icon:set_center_y(row_item.gui_panel:center_y())
					row_item.icon:set_color(row_item.gui_panel:color())
				end
			end

			local x, y, w, h = row_item.gui_panel:shape()
			current_item_height = h + self.spacing

			if not row_item.items_on_row or row_item.items_on_row <= 1 or row_item.item_number + 1 >= row_item.items_on_row then
				current_y = current_y + current_item_height
			end
		end
	end

	for _, row_item in pairs(self.row_items) do
		if not row_item.item:parameters().back and not row_item.item:parameters().pd2_corner then
			row_item.item:on_item_positions_done(row_item, self)
		end
	end
end

function NodeGui:resolution_changed()
	self:_setup_size()
	self:_set_item_positions()
	self:highlight_item(self._highlighted_item)
end

function NodeGui:_setup_item_panel_parent(safe_rect)
	self._item_panel_parent:set_shape(safe_rect.x, safe_rect.y, safe_rect.width, safe_rect.height)
end

function NodeGui:_set_width_and_height(safe_rect)
	self.width = safe_rect.width
	self.height = safe_rect.height
end

function NodeGui:_setup_item_panel(safe_rect, res)
	local item_panel_offset = safe_rect.height * 0.5 - #self.row_items * 0.5 * (self.font_size + self.spacing)

	if item_panel_offset < 0 then
		item_panel_offset = 0
	end

	self.item_panel:set_shape(0, 0 + item_panel_offset, safe_rect.width, self:_item_panel_height())
	self.item_panel:set_w(safe_rect.width)
	self:refresh_scrollbar()
end

function NodeGui:_scaled_size()
	return managers.gui_data:scaled_size()
end

function NodeGui:_setup_size()
	local safe_rect = managers.viewport:get_safe_rect_pixels()
	local scaled_size = managers.gui_data:scaled_size()
	local res = RenderSettings.resolution

	managers.gui_data:layout_workspace(self.ws)
	self:_setup_item_panel_parent(scaled_size)
	self:_set_width_and_height(scaled_size)
	self:_setup_item_panel(scaled_size, res)

	if self.texture then
		self.texture:set_width(res.x)
		self.texture:set_height(res.x / 2)
		self.texture:set_center_x(safe_rect.x + safe_rect.width / 2)
		self.texture:set_center_y(safe_rect.y + safe_rect.height / 2)
	end

	self.safe_rect_panel:set_shape(scaled_size.x, scaled_size.y, scaled_size.width, scaled_size.height)

	for _, row_item in pairs(self.row_items) do
		if row_item.item:parameters().back then
			row_item.gui_panel:set_w(24)
			row_item.gui_panel:set_h(24)
			row_item.gui_panel:set_right(self:_mid_align())
			row_item.unselected:set_h(64 * row_item.gui_panel:h() / 32)
			row_item.unselected:set_center_y(row_item.gui_panel:h() / 2)
			row_item.selected:set_shape(row_item.unselected:shape())
			row_item.shadow:set_w(row_item.gui_panel:w())
			row_item.shadow_bottom:set_bottom(row_item.gui_panel:h())
			row_item.shadow_bottom:set_w(row_item.gui_panel:w())
			row_item.arrow_selected:set_size(row_item.gui_panel:w(), row_item.gui_panel:h())
			row_item.arrow_unselected:set_size(row_item.gui_panel:w(), row_item.gui_panel:h())

			break
		end

		self:_setup_item_size(row_item)
	end
end

function NodeGui:_setup_item_size(row_item)
end

function NodeGui:mouse_moved(o, x, y)
	if self.panning then
		local amount_panned = self.pan_y - y

		self:touch_scroll(-amount_panned)

		self.pan_y = y

		return true
	elseif self.scrolling_bar then
		local amount_panned = self.pan_y - y
		local bar_to_panel_ratio = self.item_panel:h() / self.scroll_bar_bg:h()
		amount_panned = amount_panned * bar_to_panel_ratio

		self:touch_scroll(amount_panned)

		self.pan_y = y

		return true
	elseif self.scroll_bar_bg and self.scroll_bar_bg:inside(x, y) and self.scroll_bar_bg:visible() or self.scroll_bar and self.scroll_bar:inside(x, y) and self.scroll_bar:visible() then
		local target_scroll_pct = (y - self.scroll_bar_bg:y()) / self.scroll_bar_bg:h()
		local current_scroll_pct = (self.scroll_bar:center_y() - self.scroll_bar_bg:y()) / self.scroll_bar_bg:h()
		local scroll_amount = (target_scroll_pct - current_scroll_pct) * self.item_panel:h() - self._item_panel_parent:h() * 0.5

		self:touch_scroll(-scroll_amount)

		return true
	end

	return false
end

function NodeGui:mouse_released(button, x, y)
	self.panning = false
	self.scrolling_bar = false
end

function NodeGui:populate_tap_or_drag(tod, pass, x, y)
	local scrollable = self._item_panel_parent:h() < self.item_panel:h()
	local done = false

	if self.scroll_bar_bg and self.scroll_bar_bg:visible() or self.scroll_bar and self.scroll_bar:visible() then
		local pad_left = 0
		local pad_right = 0

		if SystemInfo:platform() == Idstring("NX64") then
			pad_left = 12
			pad_right = 32
		end

		if self.scroll_bar and tod.menu_input.enlarged_inside_test(self.scroll_bar, x, y, pad_left, 0, pad_right, 0) and self.scroll_bar:visible() then
			done = true

			if scrollable then
				tod.cb_tap = nil

				function tod.cb_v_drag(tod, state)
					local self = tod.node_gui

					if state == 0 then
						self.panning = true
						self.swiped = false
						tod._adjust_y = self.scroll_bar:y() - tod.startY
					elseif state == 1 then
						self:move_scrollbar_thumb(tod.currentY + tod._adjust_y)
					else
						self.panning = false
					end
				end
			end
		elseif self.scroll_bar_bg and self.scroll_bar_bg:inside(adjust_x, y) and self.scroll_bar_bg:visible() then
			done = true

			if scrollable then
				function tod.cb_tap(tod)
					local self = tod.node_gui
					self.panning = true
					self.swiped = false
					local jump = self.scroll_bar:h()

					if y <= self.scroll_bar:world_top() then
						jump = -jump
					elseif y <= self.scroll_bar:world_bottom() then
						jump = 0
					end

					if jump ~= 0 then
						self:move_scrollbar_thumb(self.scroll_bar:y() + jump)
					end

					self.panning = false
				end
			end
		end
	end

	if not done and self.item_panel:inside(x, y) and scrollable then
		function tod.cb_v_drag(tod, state)
			local self = tod.node_gui

			if state == 0 then
				self.panning = true
				self.swiped = false
				tod._adjust_y = self.item_panel:y() - tod.startY
			elseif state == 1 then
				self:touch_scroll(tod.currentY + tod._adjust_y - self.item_panel:y())
			else
				self.panning = false
			end
		end
	end

	return done
end

function NodeGui:mouse_pressed(button, x, y)
	x, y = managers.mouse_pointer:modified_mouse_pos(x, y)

	if SystemInfo:platform() == Idstring("NX64") then
		local adjust_x = nil

		if Idstring("press") or Idstring("0") then
			self.swiped = false
			self.swipe_speed = 0
		end

		if self.scroll_bar_bg then
			if self.scroll_bar_bg:center_x() - x > 0 then
				adjust_x = x + self.scroll_bar_bg:w() * 0.5
			else
				adjust_x = x - self.scroll_bar_bg:w() * 0.5
			end
		end

		if self._item_panel_parent:h() < self.item_panel:h() then
			if self.scroll_bar_bg and self.scroll_bar_bg:inside(adjust_x, y) and self.scroll_bar_bg:visible() or self.scroll_bar and self.scroll_bar:inside(adjust_x, y) and self.scroll_bar:visible() then
				if Idstring("0") then
					local target_scroll_pct = (y - self.scroll_bar_bg:y()) / self.scroll_bar_bg:h()
					local current_scroll_pct = (self.scroll_bar:center_y() - self.scroll_bar_bg:y()) / self.scroll_bar_bg:h()
					local scroll_amount = (target_scroll_pct - current_scroll_pct) * self.item_panel:h() - self._item_panel_parent:h() * 0.5

					self:touch_scroll(-scroll_amount)

					return true
				elseif button == Idstring("pan_down") or button == Idstring("pan_up") then
					self.pan_y = y
					self.scrolling_bar = true

					return true
				end
			elseif self.item_panel:inside(x, y) then
				if button == Idstring("pan_down") or button == Idstring("pan_up") then
					self.pan_y = y
					self.panning = true

					return true
				elseif button == Idstring("swipe_down") then
					self.swipe_speed = 60
					self.swiped = true
					self.swipe_dir = 1

					return true
				elseif button == Idstring("swipe_up") then
					self.swipe_speed = 60
					self.swiped = true
					self.swipe_dir = -1

					return true
				end
			end
		end
	end
end
