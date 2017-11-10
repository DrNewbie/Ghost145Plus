Hooks:PostHook(GroupAIStateBase, "_upd_criminal_suspicion_progress", "Ghost145Plus_GroupAIStateBase__upd_criminal_suspicion_progress", function(self)
	if (Network:is_server() or Global.game_settings.single_player) and m_ghost._data.iidetect then
		local susp_data = self._suspicion_hud_data
		if not next(susp_data) or not self._ai_enabled then
			return
		end		
		for obs_key, obs_susp_data in pairs(susp_data) do
			if alive(obs_susp_data.u_observer) and obs_susp_data.u_observer:movement() and obs_susp_data.u_observer:movement():cool() then
				obs_susp_data.u_observer:movement():set_cool(false)
			end
		end
	end
end)