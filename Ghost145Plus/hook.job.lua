function JobManager:_set_ghost_bonus(ghost_bonus, digest)
	ghost_bonus = Application:digest_value(ghost_bonus, false)
	ghost_bonus = ghost_bonus or 0
	Application:debug("[JobManager:_set_ghost_bonus]", "ghost_bonus", ghost_bonus, "digest", digest)
	if m_ghost:mode() >= 3 then
		ghost_bonus = ghost_bonus * 3
	elseif m_ghost:mode() == 2 then
		ghost_bonus = ghost_bonus * 2
	end	
	ghost_bonus = Application:digest_value(ghost_bonus, true)
	self._global.saved_ghost_bonus = digest and Application:digest_value(ghost_bonus, true) or ghost_bonus
	self._global.accumulated_ghost_bonus = nil
end