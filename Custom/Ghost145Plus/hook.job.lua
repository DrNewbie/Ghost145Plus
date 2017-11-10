function JobManager:_set_ghost_bonus(ghost_bonus, digest)
	ghost_bonus = Application:digest_value(ghost_bonus, false)
	ghost_bonus = ghost_bonus or 0
	if m_ghost._data.iidetect == 2 then
		ghost_bonus = ghost_bonus + 99
	end
	if not m_ghost._data.ecmcam then
		ghost_bonus = ghost_bonus + 3
	end
	if not m_ghost._data.ecmphone then
		ghost_bonus = ghost_bonus + 3
	end
	if not m_ghost._data.ecmpager then
		ghost_bonus = ghost_bonus + 3
	end
	if m_ghost._data.nocivkill then
		ghost_bonus = ghost_bonus + 7
	end
	if m_ghost._data.pager == 2 then
		ghost_bonus = ghost_bonus + 1
	elseif m_ghost._data.pager == 3 then
		ghost_bonus = ghost_bonus + 3
	elseif m_ghost._data.pager == 4 then
		ghost_bonus = ghost_bonus + 7
	elseif m_ghost._data.pager == 5 then
		ghost_bonus = ghost_bonus + 15
	end
	if m_ghost._data.markduration == 2 then
		ghost_bonus = ghost_bonus + 7
	elseif m_ghost._data.markduration == 3 then
		ghost_bonus = ghost_bonus + 5
	elseif m_ghost._data.markduration == 4 then
		ghost_bonus = ghost_bonus + 3
	elseif m_ghost._data.markduration == 5 then
		ghost_bonus = ghost_bonus + 1
	end
	if m_ghost._data.shoutingnoise == 2 then
		ghost_bonus = ghost_bonus + 1
	elseif m_ghost._data.shoutingnoise == 3 then
		ghost_bonus = ghost_bonus + 5
	elseif m_ghost._data.shoutingnoise == 4 then
		ghost_bonus = ghost_bonus + 7
	elseif m_ghost._data.shoutingnoise == 5 then
		ghost_bonus = ghost_bonus + 15
	end
	ghost_bonus = Application:digest_value(ghost_bonus, true)
	self._global.saved_ghost_bonus = digest and Application:digest_value(ghost_bonus, true) or ghost_bonus
	self._global.accumulated_ghost_bonus = nil
end