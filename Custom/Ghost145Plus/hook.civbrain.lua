Hooks:PostHook(CivilianBrain, "on_intimidated", "Ghost145Plus_CivilianBrain_on_intimidated", function(self, amount, aggressor_unit)
	if (Network:is_server() or Global.game_settings.single_player) and m_ghost._data.shoutingnoise > 1 then
		local LN = {0, 300, 600, 1000, 99999999999}
		managers.groupai:state():propagate_alert({
			"vo_distress",
			aggressor_unit:movement():m_head_pos(),
			(LN[m_ghost._data.shoutingnoise] or 600),
			managers.groupai:state():get_unit_type_filter("civilians_enemies"),
			aggressor_unit
		})
	end
end)