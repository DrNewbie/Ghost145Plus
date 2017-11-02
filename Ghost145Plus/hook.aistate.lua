if m_ghost:mode() >= 3 then
	tweak_data.player.alarm_pager.bluff_success_chance = {0}
	tweak_data.player.alarm_pager.bluff_success_chance_w_skill = {0}
elseif m_ghost:mode() == 2 then
	tweak_data.player.alarm_pager.bluff_success_chance = {1, 1, 1, 0}
	tweak_data.player.alarm_pager.bluff_success_chance_w_skill = {1, 1, 1, 0}
end

function GroupAIStateBase:get_nr_successful_alarm_pager_bluffs()
	local bluffs = self._nr_successful_alarm_pager_bluffs
	if (Network:is_server() or Global.game_settings.single_player) then
		if m_ghost:mode() == 2 then
				bluffs = bluffs + 1
		elseif m_ghost:mode() >= 3 then
				bluffs = bluffs + 4
		end
	end
	return bluffs
end

local Ghost145Plus_GroupAIStateBase_register_ecm_jammer = GroupAIStateBase.register_ecm_jammer

function GroupAIStateBase:register_ecm_jammer(unit, jam_settings)
	if (Network:is_server() or Global.game_settings.single_player) and jam_settings then
		jam_settings.call = jam_settings.call and m_ghost:mode() < 3
		jam_settings.pager = jam_settings.pager and m_ghost:mode() < 3
	end
	return Ghost145Plus_GroupAIStateBase_register_ecm_jammer(self, unit, jam_settings)
end