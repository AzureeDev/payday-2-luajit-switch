core:module("CoreMenuItemToggle")
core:import("CoreMenuItem")
core:import("CoreMenuItemOption")

ItemToggle = ItemToggle or class(CoreMenuItem.Item)
ItemToggle.TYPE = "toggle"

function ItemToggle:init(data_node, parameters)
	CoreMenuItem.Item.init(self, data_node, parameters)

	self._type = "toggle"
	local params = self._parameters
	self.options = {}
	self.selected = 1

	if data_node then
		for _, c in ipairs(data_node) do
			local type = c._meta

			if type == "option" then
				local option = CoreMenuItemOption.ItemOption:new(c)

				self:add_option(option)
			end
		end
	end
end

function ItemToggle:add_option(option)
	table.insert(self.options, option)
end

function ItemToggle:toggle()
	if not self._enabled then
		return
	end

	self.selected = self.selected + 1

	if self.selected > #self.options then
		self.selected = 1
	end

	self:dirty()
end

function ItemToggle:toggle_back()
	if not self._enabled then
		return
	end

	self.selected = self.selected - 1

	if self.selected <= 0 then
		self.selected = #self.options
	end

	self:dirty()
end

function ItemToggle:selected_option()
	return self.options[self.selected]
end

function ItemToggle:value()
	local value = ""
	local selected_option = self:selected_option()

	if selected_option then
		value = selected_option:parameters().value
	end

	return value
end

function ItemToggle:set_value(value)
	for i, option in ipairs(self.options) do
		if option:parameters().value == value then
			self.selected = i

			break
		end
	end

	self:dirty()
end

function ItemToggle:setup_gui(node, row_item)
	row_item.gui_panel = node.item_panel:panel({
		w = node.item_panel:w()
	})
	self.node = node

	if SystemInfo:platform() == Idstring("NX64") and row_item.is_large_menu_button then
		row_item.gui_text = node:_text_item_part(row_item, row_item.gui_panel, node:_left_align())

		row_item.gui_panel:set_height(row_item.font_size * 2)
	else
		row_item.gui_text = node:_text_item_part(row_item, row_item.gui_panel, node:_right_align())
	end

	row_item.gui_text:set_text(row_item.to_upper and utf8.to_upper(row_item.text) or row_item.text)

	local safe_rect = managers.gui_data:scaled_size()

	if SystemInfo:platform() == Idstring("NX64") and row_item.is_large_menu_button then
		row_item.gui_panel:set_height(_G.tweak_data.menu.options_button_height)
	end

	if self:parameter("title_id") then
		if SystemInfo:platform() == Idstring("NX64") then
			row_item.gui_title = node:_text_item_part(row_item, row_item.gui_panel, node:_right_align(), "left")
		else
			row_item.gui_title = node:_text_item_part(row_item, row_item.gui_panel, node:_right_align(), "right")
		end

		row_item.gui_title:set_text(managers.localization:text(self:parameter("title_id")))
	end

	if not self:enabled() then
		row_item.color = row_item.disabled_color

		row_item.gui_text:set_color(row_item.color)
		row_item.gui_text:set_alpha(0.75)
	else
		row_item.gui_text:set_alpha(1)
	end

	if self:selected_option():parameters().text_id then
		row_item.gui_option = node:_text_item_part(row_item, row_item.gui_panel, node:_left_align())

		row_item.gui_option:set_align(row_item.align)
	end

	if self:selected_option():parameters().icon then
		row_item.gui_icon = row_item.gui_panel:bitmap({
			y = 0,
			x = 0,
			layer = node.layers.items,
			texture_rect = {
				0,
				0,
				24,
				24
			},
			texture = self:selected_option():parameters().icon,
			blend_mode = node.row_item_blend_mode
		})

		row_item.gui_icon:set_color(row_item.disabled_color)
	end

	if row_item.colored_background then
		row_item.background = row_item.gui_panel:bitmap({
			texture = "guis/textures/switch/large_unselected_hud",
			valign = "grow",
			visible = true,
			halign = "grow",
			texture_rect = {
				46,
				31,
				420,
				66
			},
			layer = node.layers.items + 1
		})

		row_item.background:set_size(row_item.gui_panel:size())
	end

	if row_item.help_text then
		-- Nothing
	end

	if self:info_panel() == "lobby_campaign" then
		node:_set_lobby_campaign(row_item)
	end

	return true
end

local xl_pad = 64

function ItemToggle:reload(row_item, node)
	if not row_item then
		return
	end

	local safe_rect = managers.gui_data:scaled_size()

	row_item.gui_text:set_color(row_item.color)

	if SystemInfo:platform() == Idstring("NX64") and row_item.is_large_menu_button then
		row_item.gui_text:set_font_size(_G.tweak_data.menu.options_font_size)

		local x, y, w, h = row_item.gui_text:text_rect()
	else
		row_item.gui_text:set_font_size(row_item.font_size or node.font_size)
	end

	local x, y, w, h = row_item.gui_text:text_rect()

	if SystemInfo:platform() == Idstring("NX64") and row_item.is_large_menu_button then
		if row_item.crimenet_contract_gui then
			local width = 900
			local height = 580
			local text_w = width - 356
			local contact_w = width - (text_w + 20) - 10

			row_item.gui_panel:set_height(_G.tweak_data.menu.crimenet_contract_buttons_height)
			row_item.gui_panel:set_w(contact_w / (row_item.items_on_row or 1))
			row_item.gui_text:set_w(contact_w / (row_item.items_on_row or 1))
			row_item.gui_text:set_height(row_item.gui_panel:h())
			row_item.gui_panel:set_right(safe_rect.width)
		else
			if row_item.jukebox_gui then
				row_item.gui_panel:set_height(_G.tweak_data.menu.crimenet_contract_buttons_height)
				row_item.gui_panel:set_width(safe_rect.width - node:_mid_align())
				row_item.gui_panel:set_x(node:_mid_align())
			else
				row_item.gui_panel:set_height(_G.tweak_data.menu.options_button_height)

				if row_item.has_scroll_bar then
					row_item.gui_panel:set_w(_G.tweak_data.menu.main_menu_width / (row_item.items_on_row or 1) - (_G.tweak_data.menu.main_menu_padding + _G.tweak_data.menu.scroll_bar_width))
					row_item.gui_panel:set_right(row_item.gui_panel:parent():w() - (_G.tweak_data.menu.main_menu_padding + _G.tweak_data.menu.scroll_bar_width))
				else
					row_item.gui_panel:set_w(_G.tweak_data.menu.main_menu_width / (row_item.items_on_row or 1))
					row_item.gui_panel:set_right(row_item.gui_panel:parent():w())
				end
			end

			local x, y, text_wt, text_ht = row_item.gui_text:text_rect()

			row_item.gui_text:set_height(text_ht)
			row_item.gui_text:set_width(text_wt)
			row_item.gui_text:set_center_y(row_item.gui_panel:h() / 2 + 1)
		end

		h = row_item.gui_panel:h() - 10

		row_item.gui_text:set_align("left")
		row_item.gui_text:set_x(row_item.font_size / 2)
	else
		row_item.gui_text:set_height(h)
		row_item.gui_panel:set_height(h)
		row_item.gui_panel:set_width(safe_rect.width - node:_mid_align())

		if SystemInfo:platform() == Idstring("NX64") and row_item.offshore_payday then
			local x_pos = row_item.gui_panel:parent():w() - 125
			local width = 400

			row_item.gui_panel:set_right(x_pos)
			row_item.gui_panel:set_width(width)
			row_item.gui_panel:set_height(h * 1.2)

			if row_item.gui_text then
				row_item.gui_text:set_world_left(row_item.gui_panel:world_left() + 10)
				row_item.gui_text:set_width(width)
				row_item.gui_text:set_height(row_item.gui_panel:h())
			end
		else
			row_item.gui_panel:set_x(node:_mid_align())
		end
	end

	if row_item.gui_option then
		row_item.gui_option:set_font_size(row_item.font_size or node.font_size)
		row_item.gui_option:set_width(node:_left_align() - row_item.gui_panel:x())
		row_item.gui_option:set_right(node:_left_align() - row_item.gui_panel:x())
		row_item.gui_option:set_height(h)
	end

	if not row_item.is_large_menu_button and not row_item.offshore_payday then
		row_item.gui_text:set_width(safe_rect.width / 2)

		if row_item.align == "right" then
			row_item.gui_text:set_right(row_item.gui_panel:w())
		else
			row_item.gui_text:set_left(node:_right_align() - row_item.gui_panel:x() + (self:parameters().expand_value or 0))
		end
	end

	if row_item.gui_icon then
		local padding = _G.tweak_data.menu.checkbox_padding

		if SystemInfo:platform() == Idstring("NX64") then
			row_item.gui_icon:set_h(row_item.gui_panel:h() - padding * 2)
			row_item.gui_icon:set_w(row_item.gui_icon:h())
			row_item.gui_icon:set_right(row_item.gui_panel:w() - padding)
			row_item.gui_icon:set_center_y(row_item.gui_panel:h() / 2)
		else
			row_item.gui_icon:set_w(h)
			row_item.gui_icon:set_h(h)
		end

		if SystemInfo:platform() == Idstring("NX64") and row_item.is_large_menu_button then
			-- Nothing
		elseif self:parameters().icon_by_text then
			if row_item.align == "right" then
				row_item.gui_icon:set_right(row_item.gui_panel:w())
				row_item.gui_text:set_right(row_item.gui_icon:left())
			else
				row_item.gui_icon:set_left(node:_right_align() - row_item.gui_panel:x() + (self:parameters().expand_value or 0))
				row_item.gui_text:set_left(row_item.gui_icon:right())
			end
		elseif row_item.align_icon then
			if row_item.align_icon == "right" then
				row_item.gui_icon:set_right(row_item.gui_panel:w())
			else
				row_item.gui_icon:set_left(0)
			end
		elseif row_item.offshore_payday then
			if row_item.align == "right" then
				row_item.gui_icon:set_left(node:_right_align() - row_item.gui_panel:x() + (self:parameters().expand_value or 0) + padding)
			else
				row_item.gui_icon:set_right(row_item.gui_panel:w() - padding)
			end
		elseif row_item.align == "right" then
			row_item.gui_icon:set_left(node:_right_align() - row_item.gui_panel:x() + (self:parameters().expand_value or 0))
		else
			row_item.gui_icon:set_right(row_item.gui_panel:w())
		end
	end

	if row_item.gui_title then
		row_item.gui_title:set_font_size(row_item.font_size or node.font_size)
		row_item.gui_title:set_height(h)

		if row_item.gui_icon then
			row_item.gui_title:set_right(row_item.gui_icon:left() - node._align_line_padding * 2)
		else
			row_item.gui_title:set_right(node:_left_align())
		end
	end

	if row_item.gui_info_panel then
		if self:info_panel() == "lobby_campaign" then
			node:_align_lobby_campaign(row_item)
		else
			node:_align_info_panel(row_item)
		end
	end

	if row_item.gui_option then
		if node.localize_strings and self:selected_option():parameters().localize ~= false then
			row_item.option_text = managers.localization:text(self:selected_option():parameters().text_id)
		else
			row_item.option_text = self:selected_option():parameters().text_id
		end

		row_item.gui_option:set_text(row_item.option_text)
	end

	self:_set_toggle_item_image(row_item)

	if self:info_panel() == "lobby_campaign" then
		node:_reload_lobby_campaign(row_item)
	end

	if SystemInfo:platform() == Idstring("NX64") then
		local x, y, w, h = row_item.gui_text:text_rect()

		if w > row_item.gui_icon:x() - (row_item.gui_text:x() + row_item.gui_icon:w() / 2) then
			local text = row_item.gui_text:text()

			row_item.gui_text:set_text("")

			row_item.gui_scrolling_text_panel = row_item.gui_panel:panel({
				x = row_item.gui_text:x(),
				w = row_item.gui_icon:x() - (row_item.gui_text:x() + row_item.gui_icon:w() / 2)
			})

			row_item.gui_scrolling_text_panel:set_h(row_item.gui_panel:h())

			row_item.gui_scrolling_text = self.node._text_item_part(self.node, row_item, row_item.gui_scrolling_text_panel, self.node._left_align(self.node))

			row_item.gui_scrolling_text:set_font_size(_G.tweak_data.menu.options_font_size)
			row_item.gui_scrolling_text:set_text(text)
			row_item.gui_scrolling_text:set_x(0)

			local text_x, text_y, text_w, text_h = row_item.gui_scrolling_text:text_rect()

			row_item.gui_scrolling_text:set_size(text_w, text_h)
			row_item.gui_scrolling_text_panel:set_center_y(row_item.gui_panel:h() / 2 + 1)
			row_item.gui_scrolling_text:set_center_y(row_item.gui_scrolling_text_panel:h() / 2)

			self.scroll_limit = (text_w - (row_item.gui_icon:x() - (row_item.gui_text:x() + row_item.gui_icon:w() / 2))) * -1
		end
	end

	return true
end

function ItemToggle:_set_toggle_item_image(row_item)
	if self:selected_option():parameters().icon then
		if row_item.highlighted and self:selected_option():parameters().s_icon then
			local x = self:selected_option():parameters().s_x
			local y = self:selected_option():parameters().s_y
			local w = self:selected_option():parameters().s_w
			local h = self:selected_option():parameters().s_h

			row_item.gui_icon:set_image(self:selected_option():parameters().s_icon, x, y, w, h)
		else
			local x = self:selected_option():parameters().x
			local y = self:selected_option():parameters().y
			local w = self:selected_option():parameters().w
			local h = self:selected_option():parameters().h

			row_item.gui_icon:set_image(self:selected_option():parameters().icon, x, y, w, h)
		end

		if self:enabled() then
			row_item.gui_icon:set_color(row_item.color or Color.white)
			row_item.gui_icon:set_alpha(1)
		else
			row_item.gui_icon:set_color(row_item.disabled_color)
			row_item.gui_icon:set_alpha(0.75)
		end
	end
end

function ItemToggle:highlight_row_item(node, row_item, mouse_over)
	row_item.gui_text:set_color(row_item.color)

	if row_item.gui_scrolling_text then
		row_item.gui_scrolling_text:set_color(row_item.color)
		row_item.gui_scrolling_text:animate(callback(nil, _G, "animation_scroll_text_horizontal"), self.scroll_limit)
	end

	if not SystemInfo:platform() == Idstring("NX64") then
		row_item.gui_text:set_font(row_item.font and Idstring(row_item.font) or _G.tweak_data.menu.default_font_no_outline_id)
	end

	row_item.highlighted = true

	self:_set_toggle_item_image(row_item)

	if row_item.gui_option then
		row_item.gui_option:set_color(row_item.color)
	end

	if row_item.gui_info_panel then
		row_item.gui_info_panel:set_visible(true)
	end

	if self:info_panel() == "lobby_campaign" then
		node:_highlight_lobby_campaign(row_item)
	end

	return true
end

function ItemToggle:fade_row_item(node, row_item)
	row_item.gui_text:set_color(row_item.color)
	row_item.gui_text:set_font(row_item.font and Idstring(row_item.font) or _G.tweak_data.menu.default_font_id)

	if row_item.gui_scrolling_text then
		row_item.gui_scrolling_text:stop()
		row_item.gui_scrolling_text:set_x(0)
		row_item.gui_scrolling_text:set_color(row_item.color)
	end

	row_item.highlighted = nil

	self:_set_toggle_item_image(row_item)

	if row_item.gui_option then
		row_item.gui_option:set_color(row_item.color)
	end

	if row_item.gui_info_panel then
		row_item.gui_info_panel:set_visible(false)
	end

	if self:info_panel() == "lobby_campaign" then
		node:_fade_lobby_campaign(row_item)
	end

	return true
end
