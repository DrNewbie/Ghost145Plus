m_ghost = m_ghost or {
	_path = ModPath,
	_data_path = SavePath.."ghost145.txt",
	_data = {
		mode = 1,
		pager = 1,
		nocivkill = false,
		markduration = 1,
		shoutingnoise = 1,
		ecmcam = true,
		ecmphone = true,
		ecmpager = true,
		iidetect = 1,
		oneshotkill = false
	}
}

function m_ghost:save()
	local file = io.open(m_ghost._data_path, "w+")
	if file then
		file:write(json.encode(self._data))
		file:close()
	end
end

function m_ghost:load()
	local file = io.open(m_ghost._data_path, "r")
	if file then
		self._data = json.decode(file:read("*all"))
		file:close()
	end
end

function m_ghost:in_stealth()
	return managers.groupai:state():whisper_mode()
end

Hooks:Add("LocalizationManagerPostInit", "LocManPosIni_g145Menu", function(loc)
	local lang, path = SystemInfo and SystemInfo:language(), "loc.en.txt"
	loc:load_localization_file(m_ghost._path..path)
end)

Hooks:Add("MenuManagerInitialize", "MenManIni_g145Menu", function(menu_manager)
	function MenuCallbackHandler:m_ghost_save()
		m_ghost:save()
	end
	function MenuCallbackHandler:m_ghost_default_set()
		local _dialog_data = {
			title = "[Ghost 145+]",
			text = "Please reboot the game.",
			button_list = {{ text = "[OK]", is_cancel_button = true }},
			id = tostring(math.random(0,0xFFFFFFFF))
		}
		managers.system_menu:show(_dialog_data)
		m_ghost._data = {
			pager = 1,
			nocivkill = false,
			markduration = 1,
			shoutingnoise = 1,
			ecmcam = true,
			ecmphone = true,
			ecmpager = true,
			iidetect = 1,
			oneshotkill = false
		}
		m_ghost:save()
	end
	function MenuCallbackHandler:m_ghost_pager_set(item)
		m_ghost._data.pager = item:value()
	end
	function MenuCallbackHandler:m_ghost_nocivkill_set(item)
		m_ghost._data.nocivkill = tostring(item:value()) == 'on' and true or false
	end
	function MenuCallbackHandler:m_ghost_markduration_set(item)
		m_ghost._data.markduration = item:value()
	end
	function MenuCallbackHandler:m_ghost_shoutingnoise_set(item)
		m_ghost._data.shoutingnoise = item:value()
	end
	function MenuCallbackHandler:m_ghost_ecmcam_set(item)
		m_ghost._data.ecmcam = tostring(item:value()) == 'on' and true or false
	end
	function MenuCallbackHandler:m_ghost_ecmpager_set(item)
		m_ghost._data.ecmpager = tostring(item:value()) == 'on' and true or false
	end
	function MenuCallbackHandler:m_ghost_ecmphone_set(item)
		m_ghost._data.ecmphone = tostring(item:value()) == 'on' and true or false
	end
	function MenuCallbackHandler:m_ghost_iidetect_set(item)
		m_ghost._data.iidetect = item:value()
	end
	function MenuCallbackHandler:m_ghost_oneshotkill_set(item)
		m_ghost._data.oneshotkill = tostring(item:value()) == 'on' and true or false
	end
	m_ghost:load()
	MenuHelper:LoadFromJsonFile(m_ghost._path.."menu.txt", m_ghost, m_ghost._data)
end)

_G.UpdateThisMod = _G.UpdateThisMod or nil
Hooks:Add('MenuManagerOnOpenMenu', 'Ghost145Plus_RunInitNow', function(self, menu, ...)
	if menu == 'menu_main' then
		DelayedCalls:Add('DelayedMod_Ghost145Plus_RunInitNow_Delay', 1, function()
			if UpdateThisMod then
				UpdateThisMod:Add({
					mod_id = 'Ghost 145+',
					data = {
						modworkshop_id = 21203,
						dl_url = 'https://drnewbie.github.io/Ghost145Plus/Custom/Ghost145Plus.zip',
						info_url = 'https://drnewbie.github.io/Ghost145Plus/Custom/Ghost145Plus/mod.txt'
					}
				})
			end
		end)
	end
end)