require("lib/managers/menu/renderers/MenuNodeBaseGui")

MenuNodeSkillSwitchGui = MenuNodeSkillSwitchGui or class(MenuNodeBaseGui)
MenuNodeSkillSwitchGui.SKILL_POINTS_X = 0.35
MenuNodeSkillSwitchGui.STATUS_X = 0.75

function MenuNodeSkillSwitchGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_small_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.legends_font = tweak_data.menu.pd2_medium_font
	parameters.legends_font_size = tweak_data.menu.pd2_medium_font_size
	parameters.align = "left"
	parameters.row_item_blend_mode = "add"
	parameters.row_item_color = tweak_data.screen_colors.button_stage_3
	parameters.row_item_hightlight_color = tweak_data.screen_colors.button_stage_2
	parameters.marker_alpha = 1
	parameters.to_upper = true
	parameters._align_line_proportions = 0.4

	if SystemInfo:platform() == Idstring("NX64") then
		parameters.spacing = 6
		parameters.font_size = parameters.font_size * 1.29
		self.small_font_size = self.small_font_size * 1.29
		parameters._align_line_proportions = 0.25
		self.legends_scale = 1.45
		self.dont_move_item_panel_for_scroll_bar = true
		self.row_padding = 4
	end

	self.static_y = node:parameters().static_y

	MenuNodeSkillSwitchGui.super.init(self, node, layer, parameters)
end

function MenuNodeSkillSwitchGui:_create_menu_item(row_item)
	if SystemInfo:platform() == Idstring("NX64") then
		row_item.show_menu_selected = true
		row_item.item.hide_highlight = true
		row_item.texture_x = 46
		row_item.texture_y = 31
		row_item.texture_scale_w = 420
		row_item.texture_scale_h = 66
		row_item.row_padding = self.row_padding
	end

	MenuNodeSkillSwitchGui.super._create_menu_item(self, row_item)

	if row_item.type == "divider" and row_item.name == "divider_title" then
		local w = row_item.gui_panel:w()
		row_item.skill_points_gui = self.item_panel:text({
			name = "skill_points",
			layer = 52,
			text = managers.localization:to_upper_text("menu_st_skill_switch_title_skills"),
			font = self.small_font,
			font_size = self.small_font_size
		})

		row_item.skill_points_gui:set_shape(row_item.gui_panel:shape())
		row_item.skill_points_gui:grow(-row_item.skill_points_gui:w() * self.SKILL_POINTS_X, 0)
		row_item.skill_points_gui:hide()

		row_item.status_gui = self.item_panel:text({
			name = "status",
			layer = 52,
			text = managers.localization:to_upper_text("menu_st_skill_switch_title_status"),
			font = self.small_font,
			font_size = self.small_font_size
		})

		row_item.status_gui:set_shape(row_item.gui_panel:shape())
		row_item.status_gui:grow(-row_item.status_gui:w() * self.STATUS_X, 0)
	elseif row_item.type ~= "divider" and row_item.name ~= "back" then
		local w = row_item.gui_panel:w()
		local skill_switch = row_item.name
		local td = tweak_data.skilltree.skill_switches[skill_switch]
		local gd = Global.skilltree_manager.skill_switches[skill_switch]
		local distribution_text = ""
		local status_text = ""
		local unlocked = gd.unlocked
		local can_unlock, reasons = managers.skilltree:can_unlock_skill_switch(skill_switch)
		local distribution_after_text = false

		if unlocked then
			local points = managers.skilltree:points(gd)
			distribution_text = distribution_text .. managers.localization:to_upper_text(points > 0 and "menu_st_points_unspent_skill_switch" or "menu_st_points_all_spent_skill_switch", {
				points = string.format("%.3d", points)
			})

			if managers.skilltree:get_selected_skill_switch() == skill_switch then
				status_text = managers.localization:to_upper_text("menu_st_active_skill_switch")
			else
				status_text = managers.localization:to_upper_text("menu_st_make_active_skill_switch")
			end
		elseif can_unlock then
			distribution_text = self:get_unlock_cost_text(skill_switch, true)
			status_text = managers.localization:to_upper_text("menu_st_unlock_skill_switch")
			distribution_after_text = true
		else
			local reasons_text = nil

			for _, reason in ipairs(reasons) do
				reasons_text = not reasons_text and "" or reasons_text .. " + "

				if reason == "money" then
					reasons_text = reasons_text .. self:get_unlock_cost_text(skill_switch, false)
				elseif reason == "level" then
					reasons_text = reasons_text .. managers.localization:to_upper_text("menu_st_req_level_skill_switch", {
						level = td.locks.level
					})
				elseif reason == "achievement" then
					reasons_text = reasons_text .. managers.localization:to_upper_text("menu_st_req_achievement_skill_switch", {
						achievement = managers.localization:text("menu_st_achievement_" .. td.locks.achievement)
					})
				end
			end

			distribution_text = managers.localization:to_upper_text("menu_st_requires_skill_switch", {
				reasons = reasons_text
			})
			distribution_after_text = true
		end

		if SystemInfo:platform() == Idstring("NX64") then
			row_item.skill_points_gui = row_item.gui_panel:parent():text({
				name = "skill_points",
				blend_mode = "add",
				layer = 52,
				text = distribution_text,
				font = self.small_font,
				font_size = self.small_font_size,
				alpha = distribution_after_text and 0.9 or 1
			})
		else
			row_item.skill_points_gui = row_item.gui_panel:parent():text({
				name = "skill_points",
				blend_mode = "add",
				rotation = 360,
				layer = 52,
				text = distribution_text,
				font = self.small_font,
				font_size = self.small_font_size,
				alpha = distribution_after_text and 0.9 or 1
			})
		end

		row_item.skill_points_gui:set_shape(row_item.gui_panel:shape())
		row_item.skill_points_gui:grow(-row_item.skill_points_gui:w() * self.SKILL_POINTS_X, 0)

		row_item.status_gui = self.item_panel:text({
			name = "status",
			blend_mode = "add",
			layer = 52,
			text = status_text,
			font = self.small_font,
			font_size = self.small_font_size
		})

		row_item.status_gui:set_shape(row_item.gui_panel:shape())
		row_item.status_gui:grow(-row_item.status_gui:w() * self.STATUS_X, 0)

		if row_item.row_padding ~= nil then
			row_item.skill_points_gui:set_y(row_item.skill_points_gui:y() + row_item.row_padding)
			row_item.skill_points_gui:set_h(row_item.skill_points_gui:h() - row_item.row_padding * 2)
			row_item.status_gui:set_y(row_item.status_gui:y() + row_item.row_padding)
			row_item.status_gui:set_h(row_item.status_gui:h() - row_item.row_padding * 2)
		end

		row_item.distribution_after_text = distribution_after_text
	end
end

function MenuNodeSkillSwitchGui:get_unlock_cost_text(skill_switch, include_free)
	local spending_cost = managers.money:get_unlock_skill_switch_spending_cost(skill_switch)
	local offshore_cost = managers.money:get_unlock_skill_switch_offshore_cost(skill_switch)

	if spending_cost ~= 0 and offshore_cost ~= 0 then
		return managers.localization:to_upper_text("menu_st_req_spending_offshore_skill_switch", {
			spending = managers.experience:cash_string(spending_cost),
			offshore = managers.experience:cash_string(offshore_cost)
		})
	elseif spending_cost ~= 0 then
		return managers.localization:to_upper_text("menu_st_req_spending_skill_switch", {
			spending = managers.experience:cash_string(spending_cost)
		})
	elseif offshore_cost ~= 0 then
		return managers.localization:to_upper_text("menu_st_req_offshore_skill_switch", {
			offshore = managers.experience:cash_string(offshore_cost)
		})
	elseif include_free then
		return managers.localization:to_upper_text("menu_st_req_free_cost_skill_switch")
	end
end

function MenuNodeSkillSwitchGui:_clear_gui()
	for i, row_item in ipairs(self.row_items) do
		if alive(row_item.skill_points_gui) then
			row_item.gui_panel:parent():remove(row_item.skill_points_gui)
		end

		if alive(row_item.status_gui) then
			row_item.gui_panel:parent():remove(row_item.status_gui)
		end
	end

	MenuNodeSkillSwitchGui.super._clear_gui(self)
end

function MenuNodeSkillSwitchGui:_highlight_row_item(row_item, mouse_over)
	MenuNodeSkillSwitchGui.super._highlight_row_item(self, row_item, mouse_over)

	if alive(row_item.skill_points_gui) then
		row_item.skill_points_gui:set_color(row_item.color)
	end

	if alive(row_item.status_gui) then
		row_item.status_gui:set_color(row_item.color)
	end
end

function MenuNodeSkillSwitchGui:_fade_row_item(row_item)
	MenuNodeSkillSwitchGui.super._fade_row_item(self, row_item)

	if alive(row_item.skill_points_gui) then
		row_item.skill_points_gui:set_color(row_item.color)
	end

	if alive(row_item.status_gui) then
		row_item.status_gui:set_color(row_item.color)
	end
end

function MenuNodeSkillSwitchGui:_set_item_positions()
	MenuNodeSkillSwitchGui.super._set_item_positions(self)

	local x, y, w, h = nil

	for i, row_item in ipairs(self.row_items) do
		if alive(row_item.skill_points_gui) then
			row_item.skill_points_gui:set_y(row_item.gui_panel:y() + (row_item.row_padding or 0))

			if row_item.distribution_after_text then
				x, y, w, h = row_item.gui_panel:text_rect()

				row_item.skill_points_gui:set_x(row_item.gui_panel:x() + w + 10)
			else
				row_item.skill_points_gui:set_x(self.item_panel:w() * self.SKILL_POINTS_X)
			end
		end

		if alive(row_item.status_gui) then
			row_item.status_gui:set_y(row_item.gui_panel:y() + (row_item.row_padding or 0))
			row_item.status_gui:set_x(self.item_panel:w() * self.STATUS_X)
		end
	end
end

function MenuNodeSkillSwitchGui:reload_item(item)
	MenuNodeSkillSwitchGui.super.reload_item(self, item)

	local row_item = self:row_item(item)
	local x, y, w, h = nil

	if row_item and alive(row_item.gui_panel) then
		row_item.gui_panel:set_halign("right")
		row_item.gui_panel:set_right(self.item_panel:w())

		if alive(row_item.skill_points_gui) then
			row_item.skill_points_gui:set_y(row_item.gui_panel:y() + (row_item.row_padding or 0))

			if row_item.distribution_after_text then
				x, y, w, h = row_item.gui_panel:text_rect()

				row_item.skill_points_gui:set_x(row_item.gui_panel:x() + w + 10)
			else
				row_item.skill_points_gui:set_x(self.item_panel:w() * self.SKILL_POINTS_X)
			end
		end

		if alive(row_item.status_gui) then
			row_item.status_gui:set_y(row_item.gui_panel:y() + (row_item.row_padding or 0))
			row_item.status_gui:set_x(self.item_panel:w() * self.STATUS_X)
		end
	end
end

function MenuNodeSkillSwitchGui:_reload_item(item)
	MenuNodeSkillSwitchGui.super._reload_item(self, item)

	local row_item = self:row_item(item)

	if alive(row_item.skill_points_gui) then
		row_item.skill_points_gui:set_color(row_item.color)
	end

	if alive(row_item.status_gui) then
		row_item.status_gui:set_color(row_item.color)
	end
end

function MenuNodeSkillSwitchGui:_align_marker(row_item)
	MenuNodeSkillSwitchGui.super._align_marker(self, row_item)

	if self.marker_color then
		self._marker_data.gradient:set_color(row_item.item:enabled() and self.marker_color or self.marker_disabled_color or row_item.disabled_color)
	end

	self._marker_data.marker:set_world_right(self.item_panel:world_right())

	if row_item.item:parameters().previous_node then
		local right = self._marker_data.marker:right()

		self._marker_data.marker:set_w(self._marker_data.marker:w() / 4)
		self._marker_data.marker:set_right(right)

		return
	end
end

function MenuNodeSkillSwitchGui:_setup_item_panel(safe_rect, res)
	MenuNodeSkillSwitchGui.super._setup_item_panel(self, safe_rect, res)

	local max_layer = 10000
	local min_layer = 0
	local child_layer = 0

	for _, child in ipairs(self.item_panel:children()) do
		child:set_halign("right")

		child_layer = child:layer()

		if child_layer > 0 then
			min_layer = math.min(min_layer, child_layer)
		end

		max_layer = math.max(max_layer, child_layer)
	end

	slot8 = self.item_panel
	local child = slot8

	for _, child in ipairs(slot8.children(child)) do
		-- Nothing
	end

	self.item_panel:set_w(safe_rect.width * (1 - self._align_line_proportions))

	if SystemInfo:platform() == Idstring("NX64") then
		self.item_panel:set_x(0)
		self.item_panel:set_y(0)
	else
		self.item_panel:set_center(self.item_panel:parent():w() / 2, self.item_panel:parent():h() / 2)
	end

	local static_y = self.static_y and safe_rect.height * self.static_y

	if static_y and static_y < self.item_panel:y() then
		self.item_panel:set_y(static_y)
	end

	self.rec_round_object(self.item_panel)
	self.item_panel:set_position(self.item_panel:x(), self.item_panel:y())

	local box_sibling = nil
	local space_above = 0
	local space_below = 0

	if SystemInfo:platform() == Idstring("NX64") then
		box_sibling = self._item_panel_parent
		space_above = 26
		space_below = 62
	else
		box_sibling = self.item_panel
	end

	if alive(self.heading_panel) and alive(self.box_panel) then
		self.box_panel:remove(self.heading_panel)

		self.heading_panel = nil
	end

	if alive(self.box_panel) then
		box_sibling:parent():remove(self.box_panel)

		self.box_panel = nil
	end

	self.box_panel = box_sibling:parent():panel()

	self.box_panel:set_x(box_sibling:x())
	self.box_panel:set_w(box_sibling:w())

	if self._align_data.panel:h() < box_sibling:h() then
		self.box_panel:set_y(0)
		self.box_panel:set_h(box_sibling:parent():h())
	else
		self.box_panel:set_y(box_sibling:top())
		self.box_panel:set_h(box_sibling:h())
	end

	self.box_panel:grow(20, 20 + space_above + space_below)
	self.box_panel:move(-10, -10 - space_above)
	self.box_panel:set_layer(51)

	self.boxgui = BoxGuiObject:new(self.box_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})

	self.boxgui:set_clipping(false)
	self.boxgui:set_layer(1000)
	self.box_panel:rect({
		alpha = 0.6,
		rotation = 360,
		color = Color.black
	})

	if alive(self.title_text) then
		self.box_panel:parent():remove(self.title_text)

		self.title_text = nil
	end

	local title_size = self.medium_font_size

	if SystemInfo:platform() == Idstring("NX64") then
		title_size = title_size * 1.83
	end

	self.title_text = self.box_panel:parent():text({
		name = "title_text",
		layer = 52,
		text = managers.localization:to_upper_text("menu_st_skill_switch_title"),
		font = self.medium_font,
		font_size = title_size
	})

	self.make_fine_text(self.title_text)
	self.title_text:set_left(self.box_panel:left())
	self.title_text:set_bottom(self.box_panel:top())
	self._align_data.panel:set_left(self.box_panel:left())
	self._list_arrows.up:set_world_left(self._align_data.panel:world_left())
	self._list_arrows.up:set_world_top(self._align_data.panel:world_top() - 10)
	self._list_arrows.up:set_width(self.box_panel:width())
	self._list_arrows.up:set_rotation(360)
	self._list_arrows.up:set_layer(1050)
	self._list_arrows.down:set_world_left(self._align_data.panel:world_left())
	self._list_arrows.down:set_world_bottom(self._align_data.panel:world_bottom() + 10)
	self._list_arrows.down:set_width(self.box_panel:width())
	self._list_arrows.down:set_rotation(360)
	self._list_arrows.down:set_layer(1050)
	self:_set_topic_position()

	if SystemInfo:platform() == Idstring("NX64") then
		self:_layout_legends_nx()
	else
		self:_layout_legends()
	end

	if SystemInfo:platform() == Idstring("NX64") then
		local world_x, world_y, w, h = self.item_panel:world_shape()
		local heading_h = space_above + 3
		self.heading_panel = self.box_panel:panel({})

		self.heading_panel:set_world_shape(world_x, world_y - heading_h, w, heading_h)

		self.heading1 = self.heading_panel:text({
			name = "title",
			layer = 52,
			text = managers.localization:to_upper_text("menu_st_skill_switch_title_name"),
			font = self.small_font,
			font_size = self.small_font_size
		})

		self.heading1:set_shape(0, 0, w, heading_h)

		self.heading2 = self.heading_panel:text({
			name = "skill_points",
			layer = 52,
			text = managers.localization:to_upper_text("menu_st_skill_switch_title_skills"),
			font = self.small_font,
			font_size = self.small_font_size
		})

		self.heading2:set_shape(w * self.SKILL_POINTS_X, 0, w, heading_h)
		self.heading2:hide()

		self.heading3 = self.heading_panel:text({
			name = "status",
			layer = 52,
			text = managers.localization:to_upper_text("menu_st_skill_switch_title_status"),
			font = self.small_font,
			font_size = self.small_font_size
		})

		self.heading3:set_shape(w * self.STATUS_X, 0, w, heading_h)
	end

	self:refresh_scrollbar()
end

function MenuNodeSkillSwitchGui:_setup_item_panel_parent(safe_rect, shape)
	shape = shape or {}
	shape.x = shape.x or safe_rect.x
	shape.y = shape.y or safe_rect.y + 0
	shape.w = shape.w or safe_rect.width
	shape.h = shape.h or safe_rect.height - 0

	if SystemInfo:platform() == Idstring("NX64") then
		shape.force_apply = true
		shape.w = safe_rect.width * (1 - self._align_line_proportions) + 31
		shape.x = (safe_rect.width - shape.w) * 0.5
		shape.h = 0.59 * safe_rect.height + self.legends_font_size
		shape.y = 0.2 * safe_rect.height
	end

	MenuNodeSkillSwitchGui.super._setup_item_panel_parent(self, safe_rect, shape)
end

function MenuNodeSkillSwitchGui:setup()
	MenuNodeSkillSwitchGui.super.setup(self)
	managers.menu_component:disable_skilltree_gui()
end

function MenuNodeSkillSwitchGui:_layout_legends(...)
	MenuNodeSkillSwitchGui.super._layout_legends(self, ...)

	if alive(self.box_panel) then
		self._legends_panel:set_top(self.box_panel:bottom() + 4)
		self._legends_panel:set_right(self.box_panel:right())
	end
end

function MenuNodeSkillSwitchGui:_layout_legends_nx(...)
	MenuNodeSkillSwitchGui.super._layout_legends_nx(self, ...)

	if alive(self.box_panel) then
		self._legends_panel:set_bottom(self.box_panel:bottom() - 10)
		self._legends_panel:set_right(self.box_panel:right() - 10)
	end
end

function MenuNodeSkillSwitchGui:close()
	managers.menu_component:enable_skilltree_gui()
	MenuNodeSkillSwitchGui.super.close(self)
end

function MenuNodeSkillSwitchGui:mouse_moved(o, x, y)
	local used, icon = MenuNodeSkillSwitchGui.super.mouse_moved(self, o, x, y)

	if not used then
		-- Nothing
	end

	return used, icon
end
