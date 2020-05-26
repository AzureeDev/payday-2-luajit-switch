DLCFlaggedUnit = DLCFlaggedUnit or class()

function DLCFlaggedUnit:init(unit, update_enabled)
	self._unit = unit
	local disable_unit = false

	if not disable_unit and not managers.dlc:is_dlc_unlocked(self.dlc) then
		disable_unit = true
	end

	if disable_unit then
		print("[DLCFlaggedUnit] Disabling unit:", self._unit)
		self._unit:set_visible(false)

		local interaction = self._unit:interaction()

		if interaction then
			interaction:set_disabled(true)
			interaction:set_active(false, true)
			interaction:destroy()
		end
	end
end
