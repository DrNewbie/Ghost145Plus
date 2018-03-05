local Ghost145Plus_CopMovement_cool = CopMovement.cool
function CopMovement:cool()
	if m_ghost and m_ghost._data and m_ghost._data.oneshotkill then
		if self._damage_break_cool then
			self._damage_break_cool = nil
			return false
		end
	end
	return Ghost145Plus_CopMovement_cool(self)
end