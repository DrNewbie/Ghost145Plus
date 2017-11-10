if m_ghost._data.pager == 2 then
	tweak_data.player.alarm_pager.bluff_success_chance = {1, 1, 1, 0}
	tweak_data.player.alarm_pager.bluff_success_chance_w_skill = {1, 1, 1, 0}
elseif m_ghost._data.pager == 3 then
	tweak_data.player.alarm_pager.bluff_success_chance = {1, 1, 0}
	tweak_data.player.alarm_pager.bluff_success_chance_w_skill = {1, 1, 0}
elseif m_ghost._data.pager == 4 then
	tweak_data.player.alarm_pager.bluff_success_chance = {1, 0}
	tweak_data.player.alarm_pager.bluff_success_chance_w_skill = {1, 0}
elseif m_ghost._data.pager == 5 then
	tweak_data.player.alarm_pager.bluff_success_chance = {0}
	tweak_data.player.alarm_pager.bluff_success_chance_w_skill = {0}
end

function GroupAIStateBase:get_nr_successful_alarm_pager_bluffs()
	local bluffs = self._nr_successful_alarm_pager_bluffs
	if (Network:is_server() or Global.game_settings.single_player) then
		if m_ghost._data.pager > 1 then
			bluffs = bluffs + 1 - m_ghost._data.pager
		end
	end
	return bluffs
end

local Ghost145Plus_GroupAIStateBase_register_ecm_jammer = GroupAIStateBase.register_ecm_jammer

function GroupAIStateBase:register_ecm_jammer(unit, jam_settings)
	if (Network:is_server() or Global.game_settings.single_player) and jam_settings then
		if m_ghost._data.ecmcam then
			jam_settings.camera = false
		end
		if m_ghost._data.ecmphone then
			jam_settings.call = false
		end
		if m_ghost._data.ecmpager then
			jam_settings.pager = false
		end
	end
	return Ghost145Plus_GroupAIStateBase_register_ecm_jammer(self, unit, jam_settings)
end