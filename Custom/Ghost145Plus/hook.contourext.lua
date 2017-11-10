if m_ghost._data.markduration == 2 then
	ContourExt._types.mark_enemy.fadeout_silent = 0
	ContourExt._types.mark_enemy_damage_bonus.fadeout_silent = 0
	ContourExt._types.mark_enemy_damage_bonus_distance.fadeout_silent = 0
elseif m_ghost._data.markduration == 3 then
	ContourExt._types.mark_enemy.fadeout_silent = 1
	ContourExt._types.mark_enemy_damage_bonus.fadeout_silent = 1
	ContourExt._types.mark_enemy_damage_bonus_distance.fadeout_silent = 1
elseif m_ghost._data.markduration == 4 then
	ContourExt._types.mark_enemy.fadeout_silent = 3
	ContourExt._types.mark_enemy_damage_bonus.fadeout_silent = 3
	ContourExt._types.mark_enemy_damage_bonus_distance.fadeout_silent = 3
elseif m_ghost._data.markduration == 5 then
	ContourExt._types.mark_enemy.fadeout_silent = 6
	ContourExt._types.mark_enemy_damage_bonus.fadeout_silent = 6
	ContourExt._types.mark_enemy_damage_bonus_distance.fadeout_silent = 6
end

local Ghost145Plus_ContourExt_add = ContourExt.add

function ContourExt:add(type, sync, multiplier)
	if type == 'mark_enemy' or type == 'mark_enemy_damage_bonus' or type == 'mark_enemy_damage_bonus_distance' then
		if m_ghost._data.markduration == 2 then
			self:remove(type, true)
			return
		end
		sync = true
	end
	return Ghost145Plus_ContourExt_add(self, type, sync, multiplier)
end