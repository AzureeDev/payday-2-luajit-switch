core:import("CoreMenuItemToggle")

MenuItemToggleWithIcon = MenuItemToggleWithIcon or class(CoreMenuItemToggle.ItemToggle)

function MenuItemToggleWithIcon:init(data_node, parameters, ...)
	MenuItemToggleWithIcon.super.init(self, data_node, parameters, ...)

	self._icon_texture = parameters and parameters.icon
end

function MenuItemToggleWithIcon:setup_gui(node, row_item, ...)
	MenuItemToggleWithIcon.super.setup_gui(self, node, row_item, ...)

	if SystemInfo:platform() == Idstring("NX64") then
		self.has_icon = true
		self._icon = row_item.gui_panel:bitmap({
			name = "icon",
			h = 20,
			y = 6,
			w = 20,
			layer = 6,
			texture = self._icon_texture,
			blend_mode = node.row_item_blend_mode
		})
	else
		self._icon = row_item.gui_panel:bitmap({
			name = "icon",
			h = 16,
			y = 6,
			w = 16,
			layer = 0,
			texture = self._icon_texture,
			blend_mode = node.row_item_blend_mode
		})
	end

	self._icon:set_visible(false)

	return true
end

function MenuItemToggleWithIcon:reload(row_item, node, ...)
	MenuItemToggleWithIcon.super.reload(self, row_item, node, ...)

	if SystemInfo:platform() == Idstring("NX64") then
		self._icon:set_x(5)
		self._icon:set_color(Color(0, 0.69, 1))
		self._icon:set_center_y(row_item.gui_text:center_y())
		row_item.gui_text:set_x(self._icon:w() + row_item.font_size / 2)

		if row_item.gui_scrolling_text_panel then
			row_item.gui_scrolling_text:stop()
			row_item.gui_scrolling_text_panel:set_x(self._icon:w() + row_item.font_size / 2)
			row_item.gui_scrolling_text_panel:set_w(row_item.gui_icon:x() - (row_item.gui_text:x() + row_item.gui_icon:w() / 2))

			local text_x, text_y, text_w, text_h = row_item.gui_scrolling_text:text_rect()

			row_item.gui_scrolling_text:set_size(text_w, text_h)
			row_item.gui_scrolling_text:set_center_y(row_item.gui_scrolling_text_panel:h() / 2)

			self.scroll_limit = (text_w - (row_item.gui_icon:x() - (row_item.gui_text:x() + row_item.gui_icon:w() / 2))) * -1
		end
	else
		self._icon:set_right(row_item.gui_panel:w())
		row_item.gui_text:set_right(self._icon:x() - 8)
	end

	return true
end

function MenuItemToggleWithIcon:highlight_row_item(node, row_item, mouse_over, ...)
	MenuItemToggleWithIcon.super.highlight_row_item(self, node, row_item, mouse_over, ...)
	self._icon:set_color(row_item.color)

	return true
end

function MenuItemToggleWithIcon:fade_row_item(node, row_item, ...)
	MenuItemToggleWithIcon.super.fade_row_item(self, node, row_item, ...)
	self._icon:set_color(row_item.color)

	return true
end

function MenuItemToggleWithIcon:set_icon_visible(state)
	self._icon:set_visible(state)
end
