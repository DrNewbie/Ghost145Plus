if CopDamage then
	Hooks:PreHook(CopDamage, "damage_bullet", "Ghost145Plus_CopDamage_damage_bullet", function(self, attack_data)
		if self._unit:movement():cool() and attack_data and attack_data.damage then
			self._unit:movement()._damage_break_cool = true
		end
	end)

	Hooks:PreHook(CopDamage, "damage_melee", "Ghost145Plus_CopDamage_damage_melee", function(self, attack_data)
		if self._unit:movement():cool() and attack_data and attack_data.damage then
			self._unit:movement()._damage_break_cool = true
		end
	end)
end

if MedicDamage then
	Hooks:PreHook(MedicDamage, "damage_bullet", "Ghost145Plus_MedicDamage_damage_bullet", function(self, attack_data)
		if self._unit:movement():cool() and attack_data and attack_data.damage then
			self._unit:movement()._damage_break_cool = true
		end
	end)

	Hooks:PreHook(MedicDamage, "damage_melee", "Ghost145Plus_MedicDamage_damage_melee", function(self, attack_data)
		if self._unit:movement():cool() and attack_data and attack_data.damage then
			self._unit:movement()._damage_break_cool = true
		end
	end)
end

if TankCopDamage then
	Hooks:PreHook(TankCopDamage, "damage_bullet", "Ghost145Plus_TankCopDamage_damage_bullet", function(self, attack_data)
		if self._unit:movement():cool() and attack_data and attack_data.damage then
			self._unit:movement()._damage_break_cool = true
		end
	end)

	Hooks:PreHook(TankCopDamage, "damage_melee", "Ghost145Plus_TankCopDamage_damage_melee", function(self, attack_data)
		if self._unit:movement():cool() and attack_data and attack_data.damage then
			self._unit:movement()._damage_break_cool = true
		end
	end)
end