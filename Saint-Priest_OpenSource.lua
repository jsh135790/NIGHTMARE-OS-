local urlmon = ffi.load "UrlMon"
local wininet = ffi.load "WinInet"



--修复Neverlose v3.3版本报错
--欢迎访问我们的官方网站: nightmare.plus 请遵守开源协议
--注:此版本仅公开我所创作的源代码，所以你可能会遇到无法运行的情况。
--Github: https://github.com/jsh135790/NIGHTMARE-OS- NIGHTMARE开源版本(OpenSource)
---@author: Pilot1337 & SYR1337 & BOT_MOLU(陌路) & DIO1337 2023-03-29 19:39:52




-- if pcall(ffi.typeof, "struct S_steamApiCtx_t") or pcall(ffi.typeof, "struct _OVERLAPPED") then
-- 	-- check if already defined.
-- else
	ffi.cdef[[
		unsigned long GetFileSize(
			void* hFile,
			unsigned long* lpFileSizeHigh
		);

		typedef struct {
			uint8_t r;
			uint8_t g;
			uint8_t b;
			uint8_t a;
		} color_struct_t;

		bool WriteFile(
			void* hFile,
			char* lpBuffer,
			unsigned long nNumberOfBytesToWrite,
			unsigned long* lpNumberOfBytesWritten,
			void* lpOverlapped
		);

		bool ReadFile(
			void* hFile,
			char* lpBuffer,
			unsigned long nNumberOfBytesToRead,
			unsigned long* lpNumberOfBytesRead,
			int lpOverlapped
		);

		void* CreateFileA(
			const char* lpFileName,
			unsigned long dwDesiredAccess,
			unsigned long dwShareMode,
			unsigned long lpSecurityAttributes,
			unsigned long dwCreationDisposition,
			unsigned long dwFlagsAndAttributes,
			void* hTemplateFile
		);

		typedef struct {
			unsigned long* Internal;
			unsigned long* InternalHigh;
			union {
				struct {
					unsigned long Offset;
					unsigned long OffsetHigh;
				} DUMMYSTRUCTNAME;
				void* Pointer;
			} DUMMYUNIONNAME;
			void* hEvent;
		} OVERLAPPED, *LPOVERLAPPED;

		typedef struct {
			void* steam_client;
			void* steam_user;
			void* steam_friends;
			void* steam_utils;
			void* steam_matchmaking;
			void* steam_user_stats;
			void* steam_apps;
			void* steam_matchmakingservers;
			void* steam_networking;
			void* steam_remotestorage;
			void* steam_screenshots;
			void* steam_http;
			void* steam_unidentifiedmessages;
			void* steam_controller;
			void* steam_ugc;
			void* steam_applist;
			void* steam_music;
			void* steam_musicremote;
			void* steam_htmlsurface;
			void* steam_inventory;
			void* steam_video;
		} S_steamApiCtx_t;
		void* CloseHandle(void *hFile);
		//typedef struct _s_Vec {float x, y, z;} s_Vec;
		//void GetLocalTime(lpsystemtime lpSystemTime);
		typedef void*(__thiscall* get_client_entity_t)(void*, int);
		bool DeleteUrlCacheEntryA(const char* lpszUrlName);
		typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);
		bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);
		int VirtualFree(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);
		typedef void (__cdecl* console_color_print)(void*,const color_struct_t&, const char*, ...);
		void* VirtualAlloc(void* lpAddress, unsigned long dwSize, unsigned long flAllocationType, unsigned long flProtect);
		int VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);
		void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);
		void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);
	]]
-- end
-- 全局变量
local Script = {
	icon_data = db.icon or {}, 
	ffi_helpers = {},
	cache_lerp = {},
	cache_missed = {},
	cache_fonts = {},
	hotkey_state = {},
	avatar_cache = {},
	cache_hookers = {},
	control_ticks = false,
	restore_cur_weapon = 0,
	current_velocity = 0,
	surface_fonts = {},
	surface_function = {},
	update_choked_limit = 1,
	cacher_viewangles = {0, 0, 0},
	switcher_choker = false,
	cache_delay_call = {},
	cache_free_hook = {},
	cache_download = {},
	m_keys = {},
	spec_key = {},
	freestanding_side = 1,
	target_send_state = 1,
	cache_static_animation = {},
	desync_angle = 0,
	animation_land = {curticks = 0, curtime = 0},
	menu_sz = ui.get_size(),
	menu_pos = ui.get_position(),
	--lerp_attachment = {{0, 0}, {0, 0}, false},
	lerp_originalpos = vector(0,0),
	lerp_targetpos = vector(0,0),
	active_binds = {},
	binds_alpha = {},
	binds_pos = {},
	binds_width = 75,
	anti_bruteforce = false,
	vecTraceStart = vector(0, 0, 0),
	rapid_data = {0, 0},
	username = common.get_username(),
	screen_size = render.screen_size(),
	choke_history = {0,0,0,0},
	choke_max = 0,
	hurt_logs = {},
	death_logs = {},
	bullet_array = {},
	spectators_list={},
	spectators_list2={},
	my_steam64id = panorama.loadstring([[
		return MyPersonaAPI.GetXuid()
	]])(),

	start_time = 0,
	stranim_flag = false,
	start_alpha =0,
	start_anim = {},
	rect1str_pos = vector(render.screen_size().x/2,render.screen_size().y),
	rect2str_pos = vector(render.screen_size().x/2,render.screen_size().y),
	fade_y = 0,
	circlr_lep = 0,
	plr_avatar = nil,
	--solusv2
	ex_pos = 0,
	fl_pos = 0,
	ex_alpha = 0,
	fake_pos = 0,
	fl_size = 0,
	key_drag = 0,
	spec_drag = 0,
	--hit_log
	log_array = {},
	log_height = 18,
	ori_y = render.screen_size().y,
	ori_pos = {},
	uprect_pos = {},
	underect_pos = {},
	log_cirlerp = {},
	log_xlerp = {},
	log_lerpalpha = {},
	--aa ind
	aaind_rect = 0,
	aaind_upon = 0,
	aaind_under = 0,
	aaind_pureupon = 0,
	aaind_pureunder = 0,
	aaind_puredt = 0,
	aa_purestate = 0,
	aaind_upony = 0,
	aaind_dtalpha = 0,
	aaind_dtrect = 0,
	aaind_undery = 0,
	--weapon
	line_length = 0,
	--checkfont
	font_check = false,
	font_fircheck = false,
	font_lerp = 0,
	font_lerpalpha = 255,
	font_process = 0,
	font_loadcir = 0,
	font_loadedtime = 0,
	font_1 = false,
	font_2 = false,
	font_3 = false,
	font_4 = false,
	font_5 = false,
	font_6 = false,
	font_7 = false,
	font_8 = false,
	font_9 = false,
	img_1 = false,
	img_2 = false,
	--zues
	zues_alpha = 0,
	--weapon box
	accurate_shot = 0,
	miss_shot = 0,
	body_miss = 0,
	head_miss = 0,
	box_rect = 0,
	bosdef_x = 0,
	bosdef_y = 0,
	onload_alpha = 0,
	box_dragable = 0,
	box_length = 30,
	solusv1_alphalerp = 0,
	--lua info
	lua_drag = 0,
	--speed
	plr_hurttime = 0,
	spd_alpha = 0,
	spd_rect = 0,
	spddef_x = 0,
	spddef_y = 0,
	spddrag_alpha = 0,
	spd_interval = 0,
	--clantag
	anim_clantag = nil,
	--bloom
	bloom_entity = {},
	bloom_props = false,
	--config
	new_author = 0,
	new_time = 0,
	randomseed = 0,
	weapons = {"Global", "Awp", "Scout", "Auto-Snipers", "R8-Revolver", "Deagle", "Duals", "AK47", "M4A4", "MP9", "Pistol", "Rifle", "Shotguns", "MachingGuns", "Taser Zeus"},
	effect_time = 0,
	scr_count = 0,
	announcer_count = 0,
	trail_arr = {},
	shot_time = 0,
	fakeyaw_rotation = {
		0,
		false
	},

	choked_cacher = {
		false,
		cvar.sv_maxusrcmdprocessticks:int()
		--cvar.FindVar("sv_maxusrcmdprocessticks"):GetInt()
	},

	bind_system = {
		left = false,
		right = false,
		back = false
	},

	configs = {
		create = false,
		delete = false,
		export = false,
		import = false,
		current_configs = {},
		update_configs = true,
		export_clipboard = false,
		import_clipboard = false,
		default_config = "empty config",
		config_author = common.get_username(),
		last_load_config_time = common.get_config_name()
	},

	data = {
		stored_item = 0,
		threshold = false,
		stored_last_shot = 0
	},
	weapon_toindex = {
		["taser"] = "^",
		["smokegrenade"] = "E",
		["flashbang"] = "G",
		["hegrenade"] = "H",
		["inferno"] = "D",
		["decoy"] = "F",
		["molotov"] = "D",
		["unknown"] = "p"
	},
	registered_box = {
		[0] = "Generic",
		[1] = "Head",
		[2] = "Chest",
		[3] = "Stomach",
		[4] = "Left arm",
		[5] = "Right arm",
		[6] = "Left leg",
		[7] = "Right leg",
		[8] = "Gear"
	},
	registered_boxcn = {
		[0] = "躯干",
		[1] = "头部",
		[2] = "身体",
		[3] = "胃",
		[4] = "左臂",
		[5] = "右臂",
		[6] = "左腿",
		[7] = "右腿",
		[8] = "器械"
	},
	registered_reason = {
		[0] = "Hit",
		[1] = "Resolver",
		[2] = "Spread",
		[3] = "Occlusion",
		[4] = "Prediction error",
	},
	registered_reasoncn = {
		[0] = "Hit",
		[1] = "解析",
		[2] = "扩散",
		[3] = "实体阻碍",
		[4] = "预判错误",
	},
	log_boxen = {
		[0] = "Head",
		[1] = "Head",
		[2] = "Stomach",
		[3] = "Stomach",
		[4] = "Stomach",
		[5] = "Body",
		[6] = "Body",
		[7] = "L leg",
		[8] = "R leg",
		[9] = "L leg",
		[10] = "R leg",
		[11] = "L leg",
		[12] = "R leg",
		[13] = "L arm",
		[14] = "R arm",
		[15] = "L arm",
		[16] = "L arm",
		[17] = "R arm",
		[18] = "R arm",
	},

	log_box = {
		[0] = "头部",
		[1] = "头部",
		[2] = "胃",
		[3] = "胃",
		[4] = "胃",
		[5] = "身体",
		[6] = "身体",
		[7] = "左腿",
		[8] = "右腿",
		[9] = "左腿",
		[10] = "右腿",
		[11] = "左腿",
		[12] = "右腿",
		[13] = "左臂",
		[14] = "右臂",
		[15] = "左臂",
		[16] = "左臂",
		[17] = "右臂",
		[18] = "右臂",
	},

	nameToIcon = {
		-- Pistols
		["Desert Eagle"] = "!", ["Dual Berettas"] = "\"", ["Five-SeveN"] = "#", ["Glock-18"] = "$", ["P250"] = "%", ["Tec-9"] = "&", ["P2000"] = "'", ["USP-S"] = "(", ["CZ75-Auto"]= ")",
		["R8 Revolver"] = "*",
	
		-- SMGs
		["MP5-SD"]= "+", ["MAC-10"]= ",", ["MP9"]= "-", ["PP-Bizon"]= ".", ["UMP-45"]= "/", ["MP7"]= "0", ["P90"]= "1",
	
		-- Rifles
		["M4A1-S"]= "2", ["M4A4"]= "3", ["AK-47"]= "4", ["SG 553"]= "5", ["AUG"]= "6", ["FAMAS"]= "7", ["Galil AR"]= "8",
	
		-- Snipers
		["AWP"]= "9", ["G3SG1"]= ":", ["SCAR-20"]= ";", ["SSG 08"]= "<",
	
		-- Heavy
		["M249"]= "=", ["Negev"]= ">", ["Nova"]= "?", ["Sawed-Off"]= "@", ["XM1014"]= "A", ["MAG-7"]= "B",
	
		-- Grenades
		["Incendiary Grenade"]= "C", ["Molotov"]= "D", ["Smoke Grenade"]= "E", ["Decoy Grenade"]= "F", ["Flashbang"]= "G", ["High Explosive Grenade"]= "H",
	
		-- Knives 
		["Knife"]= "I", ["knife_t"]= "J", ["Bayonet"]= "K", ["Bowie Knife"]= "L", ["Butterfly Knife"]= "M", ["Falchion Knife"]= "N", ["Flip Knife"]= "O", ["Gut Knife"]= "P",
		["Karambit"]= "Q", ["M9 Bayonet"]= "R", ["Huntsman Knife"]= "S", ["Shadow Daggers"]= "T", ["Ursus Knife"]= "U", ["Navaja Knife"]= "V", ["Nomad Knife"]= "W",
		["Skeleton Knife"]= "X", ["Stiletto Knife"]= "Y", ["Talon Knife"]= "Z", ["Classic Knife"]= "[", ["Paracord Knife"]= "\\", ["Survival Knife"]= "]",
	
		-- Other weapons
		["Zeus x27"]= "^", ["m4a1_unsilenced"]= "_", ["usp_unsilenced"]= "`",
	
		-- Kill icons
		["inferno"]= "a", ["noscope"]= "b", ["penetration"]= "c", ["headshot"]= "d", ["c4 explosion"]= "e", ["flash assist"]= "f",
		["flashed"]= "g", ["domination"]= "h", ["revenge"]= "i", ["suicide"]= "j", ["headslayer"]= "k",
	
		-- Inventory
		["kevlar"]= "l", ["helmet"]= "m", ["defuser"]= "n", ["C4 Explosive"] = "o",
	
		-- Extras
		["bullet casing"]= "q", ["bullet"]= "p", ["crosshair"]= "r",
	},

	to_hitbox = {0, 5, 2, 13, 14, 7, 8},
	player_state = {"Global", "Standing", "Running", "Slow motion", "Jump", "Crouch T", "Crouch CT", "Jump crouch", "Manual left", "Manual right", "On key"},
	-- 关于脚本的内容
	About = {
		version = "Beta 3.1.5",
		name = "Saint-Priest.lua",
		neverlose_version = "Neverlose 3.2.0"
	}
}
--local tab_image = render.load_image(network.get("https://i.postimg.cc/PqvtPSDS/5151.gif"),vector(640,360))
-- 引用Neverlose UI
Script.ref = {
	Aimbot = {
		 -- Exploits
		Hideshots = ui.find("Aimbot","Ragebot","Main","Hide Shots"),
		Doubletap = ui.find("Aimbot","Ragebot","Main","Double Tap"),
		-- Ragebot
		hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
		damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
		--multipoint = ui.find("Aimbot", "Ragebot", "Selection", "Static Point Scale"),
		multipoint_head = ui.find("Aimbot", "Ragebot", "Selection","Multipoint", "Head Scale"),
		multipoint_body = ui.find("Aimbot", "Ragebot", "Selection","Multipoint", "Body Scale"),
		body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
		safe_point = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
		body_aim_disabled = ui.find("Aimbot", "Ragebot", "Safety","Body Aim", "Disablers"),
		auto_scope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"),
		auto_stop = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop"),
		auto_stop_condition = ui.find("Aimbot", "Ragebot", "Accuracy","Auto Stop", "Options"),
		dt_auto_stop_condition = ui.find("Aimbot", "Ragebot", "Accuracy","Auto Stop", "Double Tap"),
		Autopeek = ui.find("Aimbot","Ragebot","Main","Peek Assist"),
	},

	AntiAim = {
		Slowwalk = ui.find("Aimbot","Anti Aim","Misc","Slow Walk"),
		Fakeduck = ui.find("Aimbot","Anti Aim","Misc","Fake Duck"),
		--Enable = ui.find("Aimbot", "Anti Aim", "Main", "Enable Anti Aim"),
		--Angle_enable = ui.find("Aimbot", "Anti Aim", "Fake Angle", "Enable Fake Angle"),
		inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
		Backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
		Extended = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
	},

	FakeLag = {
		Enabled = ui.find("Aimbot","Anti Aim","Fake Lag","Enabled"),
		Limit = ui.find("Aimbot","Anti Aim","Fake Lag","Limit"),
		Limit_random = ui.find("Aimbot","Anti Aim","Fake Lag","Variability")
	},

	Visuals = {
		Removals = ui.find("Visuals", "World", "Main", "Removals"),
		Thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson")
	},

	Misc = {
		PING = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
		Autostrafe = ui.find("Miscellaneous","Main","Movement","Strafe Assist"),
	},
}

Script.ffi_helpers.VmtEntry = function(instance, index, type)
	return ffi.cast(type, (ffi.cast("void***", instance)[0])[index])
end

Script.ffi_helpers.BindArgument = function(fn, arg)
	return function(...)
		return fn(arg, ...)
	end
end

Script.ffi_helpers.ThisCallVtableBinder = function(module, interface, index, type)
	local success, instance = pcall(utils.create_interface, module, interface)

	local addr = ffi.cast("void***", instance)
	return ffi.cast(ffi.typeof(type), addr[0][index]), addr
end

Script.ffi_helpers.VmtThunk = function(index, typestring)
	local t = ffi.typeof(typestring)
	return function(instance, ...)
		assert(instance ~= nil)
		if instance then
			return Script.ffi_helpers.VmtEntry(instance, index, t)(instance, ...)
		end
	end
end

Script.ffi_helpers.ThiscallVmtBind = function(module, interface, index, type)
	local addr = ffi.cast("void***", utils.create_interface(module, interface)) or error(("[%s]%s interface is nil value"):format(Script.About.name, interface), 2)
	return ffi.cast(ffi.typeof(type), addr[0][index]), addr
end

Script.ffi_helpers.VmtBind = function(module, interface, index, typestring)
	local success, typeof = pcall(ffi.typeof, typestring)
	local instance = utils.create_interface(module, interface) or error(("[%s]Invalid vmt interface"):format(Script.About.name))
	if not success then
		error(("[%s]vmt success error: %s"):format(Script.About.name, typeof), 2)
	end

	local fnptr = Script.ffi_helpers.VmtEntry(instance, index, typeof) or error(("[%s]invalid vtable vind fnptr"):format(Script.About.name))
	return function(...)
		return fnptr(instance, ...)
	end
end

Script.ffi_helpers.VmtHookHelpers = {
	copy = function(dst, src, len)
		return ffi.copy(ffi.cast("void*", dst), ffi.cast("const void*", src), len)
	end,

	virtual_protect = function(lpAddress, dwSize, flNewProtect, lpflOldProtect)
		return ffi.C.VirtualProtect(ffi.cast("void*", lpAddress), dwSize, flNewProtect, lpflOldProtect)
	end,

	virtual_alloc = function(lpAddress, dwSize, flAllocationType, flProtect, blFree)
		local alloc = ffi.C.VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect)
		if blFree then
			table.insert(Script.cache_free_hook, function()
				ffi.C.VirtualFree(alloc, 0, 0x8000)
			end)
		end

		return ffi.cast("intptr_t", alloc)
	end
}

Script.ffi_helpers.VmtHook = function(vt)
	local org_func = {}
	local new_hook = {}
	new_hook.this = ffi.cast("intptr_t**", vt)[0]
	local old_prot = ffi.new("unsigned long[1]")
	local virtual_table = ffi.cast("intptr_t**", vt)[0]
	new_hook.hookMethod = function(cast, func, method)
		org_func[method] = virtual_table[method]
		Script.ffi_helpers.VmtHookHelpers.virtual_protect(virtual_table + method, 4, 0x4, old_prot)
		virtual_table[method] = ffi.cast("intptr_t", ffi.cast(cast, func))
		Script.ffi_helpers.VmtHookHelpers.virtual_protect(virtual_table + method, 4, old_prot[0], old_prot)
		return ffi.cast(cast, org_func[method])
	end

	new_hook.unHookMethod = function(method)
		Script.ffi_helpers.VmtHookHelpers.virtual_protect(virtual_table + method, 4, 0x4, old_prot)
		local alloc_addr = Script.ffi_helpers.VmtHookHelpers.virtual_alloc(nil, 5, 0x1000, 0x40, false)
		local trampoline_bytes = ffi.new("uint8_t[?]", 5, 0x90)
		trampoline_bytes[0] = 0xE9
		ffi.cast("int32_t*", trampoline_bytes + 1)[0] = org_func[method] - tonumber(alloc_addr) - 5
		Script.ffi_helpers.VmtHookHelpers.copy(alloc_addr, trampoline_bytes, 5)
		virtual_table[method] = ffi.cast("intptr_t", alloc_addr)
		Script.ffi_helpers.VmtHookHelpers.virtual_protect(virtual_table + method, 4, old_prot[0], old_prot)
		org_func[method] = nil
	end

	new_hook.unHookAll = function()
		for method, func in pairs(org_func) do
			new_hook.unHookMethod(method)
		end
	end

	table.insert(Script.cache_hookers, new_hook.unHookAll)
	return new_hook
end

local class_ptr = ffi.typeof("void***")
local interface_type = ffi.typeof("uintptr_t**")
local ientitylist = ffi.cast(class_ptr, utils.create_interface("client.dll", "VClientEntityList003"))
local vgui_system = ffi.cast(interface_type, utils.create_interface("vgui2.dll", "VGUI_System010"))
--local console_cvar_interface = ffi.cast(interface_type, utils.create_interface("vstdlib.dll", "VEngineCvar007")) 
--local console_color_log = ffi.cast("console_color_print", console_cvar_interface[0][25])
local console_color_log = Script.ffi_helpers.BindArgument(Script.ffi_helpers.ThisCallVtableBinder("vstdlib.dll", "VEngineCvar007", 25, "void(__cdecl*)(void*, void*, const char*)"))
local entity_list_pointer = ffi.cast("void***", utils.create_interface("client.dll", "VClientEntityList003"))
local get_client_entity_uintptr_address = ffi.cast("GetClientEntity_4242425_t", entity_list_pointer[0][3])
local get_client_entity = ffi.cast("get_client_entity_t", ffi.cast(class_ptr, utils.create_interface("client.dll", "VClientEntityList003"))[0][3])
local get_clipboard_text_count = Script.ffi_helpers.BindArgument(ffi.cast("int(__thiscall*)(void*)", vgui_system[0][7]), vgui_system)
local set_clipboard_text = Script.ffi_helpers.BindArgument(ffi.cast("void(__thiscall*)(void*, const char*, int)", vgui_system[0][9]), vgui_system)
local native_ShellExecute = Script.ffi_helpers.VmtBind("vgui2.dll", "VGUI_System010", 3, "void(__thiscall*)(void*, const char *, const char *)")
local get_clipboard_text = Script.ffi_helpers.BindArgument(ffi.cast("void(__thiscall*)(void*, int, const char*, int)", vgui_system[0][11]), vgui_system)
local native_ShellExecuteEx = Script.ffi_helpers.VmtBind("vgui2.dll", "VGUI_System010", 33, "void(__thiscall*)(void*, const char *, const char *, const char *)")
local set_clantag = ffi.cast("int(__fastcall*)(const char*, const char*)", utils.opcode_scan("engine.dll", "53 56 57 8B DA 8B F9 FF 15"))
--Script.ffi_helpers.func_get_client_entity = Script.ffi_helpers.VmtBind("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")

Script.ffi_helpers.native_ISteamUtils = ffi.cast("void***", Script.ffi_helpers.pS_SteamApiCtx.steam_utils)
Script.ffi_helpers.native_ISteamFriends = ffi.cast("void***", Script.ffi_helpers.pS_SteamApiCtx.steam_friends)
Script.ffi_helpers.native_ISteamFriends_GetLargeFriendAvatar = Script.ffi_helpers.VmtThunk(36, "int(__thiscall*)(void*, uint64_t)")
Script.ffi_helpers.native_ISteamFriends_GetSmallFriendAvatar = Script.ffi_helpers.VmtThunk(34, "int(__thiscall*)(void*, uint64_t)")
Script.ffi_helpers.native_ISteamFriends_GetMediumFriendAvatar = Script.ffi_helpers.VmtThunk(35, "int(__thiscall*)(void*, uint64_t)")
Script.ffi_helpers.native_ISteamUtils_GetImageSize = Script.ffi_helpers.VmtThunk(5, "bool(__thiscall*)(void*, int, uint32_t*, uint32_t*)")
Script.ffi_helpers.native_ISteamUtils_GetImageRGBA = Script.ffi_helpers.VmtThunk(6, "bool(__thiscall*)(void*, int, unsigned char*, int)")
Script.ffi_helpers.FindElement = ffi.cast("unsigned long(__thiscall*)(void*,const char*)",utils.opcode_scan("client.dll", "55 8B EC 53 8B 5D 08 56 57 8B F9 33 F6 39 77 28"))
Script.ffi_helpers.CHudChat = Script.ffi_helpers.FindElement(ffi.cast("unsigned long**", ffi.cast("uintptr_t",utils.opcode_scan("client.dll", "B9 ? ? ? ? E8 ? ? ? ? 8B 5D 08"))+1)[0],"CHudChat")
Script.ffi_helpers.FFI_ChatPrint = Script.ffi_helpers.BindArgument(ffi.cast("void(__cdecl*)(int, int, int,const char*, ...)",ffi.cast("void***",Script.ffi_helpers.CHudChat)[0][27]),Script.ffi_helpers.CHudChat)

Script.ffi_helpers.full_filesystem = utils.create_interface("filesystem_stdio.dll", "VFileSystem017")
Script.ffi_helpers.full_filesystem_class = ffi.cast(ffi.typeof("void***"), Script.ffi_helpers.full_filesystem)
Script.ffi_helpers.func_find_close = ffi.cast("void (__thiscall*)(void*, int)", Script.ffi_helpers.full_filesystem_class[0][35])
Script.ffi_helpers.func_find_next = ffi.cast("const char* (__thiscall*)(void*, int)", Script.ffi_helpers.full_filesystem_class[0][33])
Script.ffi_helpers.func_find_first = ffi.cast("const char* (__thiscall*)(void*, const char*, int*)", Script.ffi_helpers.full_filesystem_class[0][32])
Script.ffi_helpers.func_is_directory = ffi.cast("bool (__thiscall*)(void*, const char*, const char*)", Script.ffi_helpers.full_filesystem_class[0][23])
Script.ffi_helpers.func_remove_file = ffi.cast("void (__thiscall*)(void*, const char*, const char*)", Script.ffi_helpers.full_filesystem_class[0][20])
Script.ffi_helpers.func_add_search_path = ffi.cast("void (__thiscall*)(void*, const char*, const char*, int)", Script.ffi_helpers.full_filesystem_class[0][11])
Script.ffi_helpers.func_remove_search_path = ffi.cast("bool (__thiscall*)(void*, const char*, const char*)", Script.ffi_helpers.full_filesystem_class[0][12])
--file
Script.ffi_helpers.file_stdio = ffi.cast("void***", utils.create_interface("filesystem_stdio.dll", "VBaseFileSystem011"))
Script.ffi_helpers.file_exists = ffi.cast("bool(__thiscall*)(void*, const char*, const char*)", Script.ffi_helpers.file_stdio[0][10])
Script.ffi_helpers.PrintInChat = function(...)
	Script.ffi_helpers.FFI_ChatPrint(0,0,tostring(...))
end

Script.ffi_helpers.FileSystem_get_neverlose_path = function()
	return common.get_game_directory():sub(1, - 5) .. "csgo\\"
end

Script.ffi_helpers.FileSystem_add_search_path = function(path, path_id, type)
	Script.ffi_helpers.func_add_search_path(Script.ffi_helpers.full_filesystem_class, path, path_id, type)
end

Script.ffi_helpers.FileSystem_is_directory = function(path, path_id)
	return Script.ffi_helpers.func_is_directory(Script.ffi_helpers.full_filesystem_class, path, path_id)
end

Script.ffi_helpers.FileSystem_remove_search_path = function(path, path_id)
	Script.ffi_helpers.func_remove_search_path(Script.ffi_helpers.full_filesystem_class, path, path_id)
end

Script.ffi_helpers.FileSystem_remove = function(file, path_id)
	Script.ffi_helpers.func_remove_file(Script.ffi_helpers.full_filesystem_class, file, path_id)
end

Script.ffi_helpers.ClientColorLog = function(color,...)
	local log_color = ffi.new("color_struct_t")
	for key, args in pairs({r = color.r, g = color.g, b = color.b, a = color.a}) do
		log_color[key] = args
	end
	console_color_log(log_color,tostring(...))
end

Script.ffi_helpers.FileSystem_find_next = function(handle)
	local file = Script.ffi_helpers.func_find_next(Script.ffi_helpers.full_filesystem_class, handle)
	if file == ffi.NULL then
		return nil
	end

	return ffi.string(file)
end

Script.ffi_helpers.FileSystem_find_close = function(handle)
	Script.ffi_helpers.func_find_close(Script.ffi_helpers.full_filesystem_class, handle)
end

Script.ffi_helpers.FileSystem_find_first = function(path)
	local handle = ffi.new("int[1]")
	local file = Script.ffi_helpers.func_find_first(Script.ffi_helpers.full_filesystem_class, path, handle)
	if file == ffi.NULL then
		return nil
	end

	return handle, ffi.string(file)
end

Script.ffi_helpers.GetPathFiles = function(file_path, suffix_name, start_files)
	local my_file_idx = 1
	local my_file_table = {}
	if start_files and type(start_files) == "table" then
		my_file_table = start_files
		my_file_idx = #start_files + 1
	end

	local my_directory = common.get_game_directory():sub(1, - 5) .. file_path
	Script.ffi_helpers.FileSystem_add_search_path(my_directory, "GAME", 0)
	if not Script.ffi_helpers.FileSystem_is_directory(my_directory, "GAME") then
		my_file_table[my_file_idx] = ""
		Script.ffi_helpers.FileSystem_remove_search_path(my_directory, "GAME")
		return my_file_table
	end

	local is_config = suffix_name:lower() == ".ini"
	local handle, file = Script.ffi_helpers.FileSystem_find_first(my_directory .. "*.*")
	while file do
		if file:lower():find(suffix_name:lower()) or (is_config and file:lower():find(".txt")) then
			my_file_table[my_file_idx] = file
			my_file_idx = my_file_idx + 1
		end

		file = Script.ffi_helpers.FileSystem_find_next(handle[0])
	end

	Script.ffi_helpers.FileSystem_find_close(handle[0])
	if #my_file_table == 0 then
		my_file_table[my_file_idx] = ""
	end

	Script.ffi_helpers.FileSystem_remove_search_path(my_directory, "GAME")
	return my_file_table
end

Script.ffi_helpers.SaveConfig = function(name, data)
	local overlapped = ffi.new("OVERLAPPED")
	overlapped.DUMMYUNIONNAME.DUMMYSTRUCTNAME.Offset = 0xFFFFFFFF
	overlapped.DUMMYUNIONNAME.DUMMYSTRUCTNAME.OffsetHigh = 0xFFFFFFFF
	local override_config = ffi.cast("void*", ffi.C.CreateFileA(("nl\\saint-priset\\configs\\%s"):format(name), 0xC0000000, 0x3, 0, 0x2, 0x80, nil))
	ffi.C.WriteFile(override_config, ffi.cast("char*", data), data:len(), nil, ffi.cast("void*", overlapped))
	ffi.C.CloseHandle(override_config)
end

Script.ffi_helpers.GetFileData = function(config_name)
	local get_config = ffi.cast("void*", ffi.C.CreateFileA(("nl\\saint-priset\\configs\\%s"):format(config_name), 0xC0000000, 0x3, 0, 0x4, 0x80, nil))
	local get_config_offset = ffi.C.GetFileSize(get_config, nil)
	local get_config_buffer = ffi.new("char[" ..(get_config_offset + 1).. "]")
	ffi.C.ReadFile(get_config, get_config_buffer, get_config_offset, nil, 0)
	local get_config_data = ffi.string(get_config_buffer)
	ffi.C.CloseHandle(get_config)
	return get_config_data
end

Script.ffi_helpers.CreateNewConfig = function(config_name)
	local overlapped = ffi.new("OVERLAPPED")
	if config_name:len() <= 0 then
		Script.ffi_helpers.ClientColorLog(color(255, 0, 0, 255), ("[%s]创建参数失败, 参数名字不能为空\n"):format(Script.About.name))
		--Cheat.AddNotify(("[%s]Create Config"):format(Script.About.name), ("[%s]Config name can not be empty\n"):format(Script.About.name))
		return
	end

	overlapped.DUMMYUNIONNAME.DUMMYSTRUCTNAME.Offset = 0xFFFFFFFF
	overlapped.DUMMYUNIONNAME.DUMMYSTRUCTNAME.OffsetHigh = 0xFFFFFFFF
	local override_config = ffi.cast("void*", ffi.C.CreateFileA(("nl\\saint-priset\\configs\\%s.ini"):format(config_name), 0xC0000000, 0x3, 0, 0x2, 0x80, nil))
	ffi.C.CloseHandle(override_config)
	if config_name ~= Script.configs.default_config then
		Script.ffi_helpers.ClientColorLog(color(0, 255, 0, 255), ("[%s]创建参数完成, 参数名字: %s\n"):format(Script.About.name, config_name))
		--Cheat.AddNotify(("[%s]Create Config"):format(Script.About.name), ("[%s]Config create success, config name: %s\n"):format(Script.About.name, config_name))
	end

	local m_config_list = Script.ffi_helpers.GetPathFiles("nl\\saint-priset\\configs\\", ".ini")
	if #m_config_list > 0 and config_name ~= Script.configs.default_config then
		Script.Menu_UI.config.current_config:update(m_config_list)
		for idx, name in pairs(m_config_list) do
			if name == ("%s.ini"):format(config_name) then
				Script.Menu_UI.config.current_config:set(name)
			end
		end

		Script.Handle_Main()
	end
end

Script.ffi_helpers.SetClipboardText = function(text)
	local m_text = tostring(text)
	set_clipboard_text(m_text, m_text:len())
end

Script.ffi_helpers.GetClipboardText = function()
	local clipboard_text_length = get_clipboard_text_count()
	if clipboard_text_length > 0 then
		local buffer = ffi.new("char[?]", clipboard_text_length)
		local size = clipboard_text_length * ffi.sizeof("char[?]", clipboard_text_length)
		get_clipboard_text(0, buffer, size)
		return ffi.string(buffer, clipboard_text_length - 1)
	end

	return ""
end

Script.ffi_helpers.DownloadFromUrl = function(url, download_path)
	ffi.C.CreateDirectoryA(download_path, nil)
	wininet.DeleteUrlCacheEntryA(url)
	urlmon.URLDownloadToFileA(nil, url, download_path, 0,0)
end

Script.ffi_helpers.ShellExecute = function(verb, command)
	native_ShellExecute(verb, command)
end

-- Script.ffi_helpers.ShellExecute("open", "cmd") -- 运行cmd
-- Script.ffi_helpers.ShellExecute("open", "https://hao.360.com/?wd_xp1") -- 打开网页https://hao.360.com/?wd_xp1
-- Script.ffi_helpers.ShellExecute("open", "C:\\Users\Administrator\\Desktop\\xxx.exe") -- 你可以使用Script.ffi_helpers.DownloadFromUrl将文件下载到一个文件path再使用ShellExecute运行该程序(.exe)

Script.ffi_helpers.ShellExecuteEx = function(verb, file, parameters)
	native_ShellExecuteEx(verb, file, parameters)
end

Script.ffi_helpers.GetClientEntityAddress = function(entity)
	if entity == nil then
		return - 1
	end

	if type(entity) == "number" then
		local address = get_client_entity_uintptr_address(entity_list_pointer, entity)
		if address then
			return address
		end

		return - 1
	end

	local address = get_client_entity(ientitylist, entity:get_index())
	if address then
		return address
	end

	return - 1
end

Script.ffi_helpers.NewJmpHook  = function(cast, callback, hook_addr, size, trampoline, org_bytes_tramp)
	local size = size or 5
	local new_hook, mt = {}, {}
	local trampoline = trampoline or false
	local org_bytes = ffi.new("uint8_t[?]", size)
	local old_prot = ffi.new("unsigned long[1]")
	local void_addr = ffi.cast("void*", hook_addr)
	local detour_addr = tonumber(ffi.cast("intptr_t", ffi.cast("void*", ffi.cast(cast, callback))))
	ffi.copy(org_bytes, void_addr, size)
	if trampoline then
		local alloc_addr = ffi.gc(ffi.C.VirtualAlloc(nil, size + 5, 0x1000, 0x40), function(addr)
			ffi.C.VirtualFree(addr, 0, 0x8000)
		end)

		local trampoline_bytes = ffi.new("uint8_t[?]", size + 5, 0x90)
		if org_bytes_tramp then
			local bytes = {}
			for byte in org_bytes_tramp:gmatch("(%x%x)") do
				table.insert(bytes, tonumber(byte, 16))
			end

			trampoline_bytes = ffi.new("uint8_t[?]", size + 5, bytes)
		else
			ffi.copy(trampoline_bytes, org_bytes, size)
		end

		trampoline_bytes[size] = 0xE9
		ffi.cast("uint32_t*", trampoline_bytes + size + 1)[0] = hook_addr - tonumber(ffi.cast("intptr_t", ffi.cast("void*", ffi.cast(cast, alloc_addr)))) - size
		ffi.copy(alloc_addr, trampoline_bytes, size + 5)
		new_hook.call = ffi.cast(cast, alloc_addr)
		mt = {__call = function(self, ...)
			return self.call(...)
		end}
	else
		new_hook.call = ffi.cast(cast, hook_addr)
		mt = {__call = function(self, ...)
			self.stop()
			local res = self.call(...)
			self.start()
			return res
		end}
	end

	local hook_bytes = ffi.new("uint8_t[?]", size, 0x90)
	hook_bytes[0] = 0xE9
	ffi.cast("uint32_t*", hook_bytes + 1)[0] = detour_addr - hook_addr - 5
	new_hook.status = false
	local function set_status(bool)
		new_hook.status = bool
		ffi.C.VirtualProtect(void_addr, size, 0x40, old_prot)
		ffi.copy(void_addr, bool and hook_bytes or org_bytes, size)
		ffi.C.VirtualProtect(void_addr, size, old_prot[0], old_prot)
	end

	new_hook.stop = function()
		set_status(false)
	end

	new_hook.start = function()
		set_status(true)
	end

	new_hook.set_state = function(state)
		set_status(state == nil and false or state)
	end

	new_hook.start()
	table.insert(Script.cache_hookers, new_hook.stop)
	return setmetatable(new_hook, mt)
end

-- 重复调用函数
Script.API = {
	getMunuele = function(table, val) 
        if #table > 0 then 
            for i=1, #table do 
                if table[i] == val then 
                    return true 
                end 
            end 
        end 
        return false 
    end,
	getMemuindex = function(table, val) 
        if #table > 0 then 
            for i=1, #table do 
                if table[i] == val then 
                    return i 
                end 
            end 
        end 
        return false 
    end,
	--ffi
	Deg2Rad = function(degree)
		return (math.pi / 180) * degree
	end,

	GetCSGOPath = function()
		return common.get_game_directory():sub(1, - 5)
	end,

	CreatePath = function(path)
		ffi.C.CreateDirectoryA(path, nil)
	end,

	Anim_Lerp = function(vecSource, vecDestination, flPercentage)
		if vecSource ~= 0 and vecSource < 0.001 then
			return 0
		end

		return vecSource + (vecDestination - vecSource) * flPercentage
	end,

	Lerp = function(vecSource, vecDestination, flPercentage)
		local handledx = vecSource.x + (vecDestination.x - vecSource.x) * flPercentage
		local handledy = vecSource.y + (vecDestination.y - vecSource.y) * flPercentage
		return vector(handledx,handledy)
	end,

	Lerp_number = function(start, vend, time)
		return start + (vend - start) * time
	end,

	GetDistanceInMeter = function(init1, init2)
		return math.ceil(math.sqrt(math.pow(init1.x - init2.x, 2) + math.pow(init1.y - init2.y, 2) + math.pow(init1.z - init2.z, 2)) * 0.0254)
	end,

	ColorModifier = function(clr, a)
		return color(clr.r, clr.g, clr.b, clr.a * a)
	end,

	Clamp = function(var, min, max)
		local cur_min = math.min(min, max)
		local cur_max = math.max(min, max)
		return math.max(cur_min, math.min(var, cur_max))
	end,

	Json = panorama.loadstring([[
		return {
			decode: JSON.parse,
			encode: JSON.stringify
		};
	]])(),

	FileDownload = function(url, path)
		local cache_key = ("%s %s"):format(url, path)
		if not Script.cache_download[cache_key] then
			Script.ffi_helpers.DownloadFromUrl(url, path)
			Script.cache_download[cache_key] = true
		end
	end,

	PlaySound = function(path, volume)
		if type(path) ~= "string" or type(volume) ~= "number" or path == nil or path == nil then
			error(("[%s]Invalid playsound arguments. Expected string and number"):format(Script.About.name), 2)
		end

		utils.console_exec(("playvol %s %i"):format(path, volume))
	end,

	DelayCall = function(delay, func, args)
		table.insert(Script.cache_delay_call, {
			args = args,
			delay = delay,
			callback = func,
			current_time = globals.realtime
		})
	end,

	GetPlayerDistance = function(entity1, entity2)
		if entity1 == nil or entity2 == nil or not entity1:is_alive() or not entity2:is_alive() then
			return 99999
		end

		local m_vecOrigin_1 = entity1.m_vecOrigin
		local m_vecOrigin_2 = entity2.m_vecOrigin
		return m_vecOrigin_1:dist(m_vecOrigin_2)
	end,

	MultiCallback = function(func, args, state)
		func()
		for _, Handle in pairs(args) do
			Handle:set_callback(function()
				if state then
					func()
				end
			end)
		end
	end,

	Contains = function(table, val)
		for _, g in pairs(table) do
			if g == val then
				return true
			end
		end

		return false
	end,

	GetDucking = function(player)
		if not player or not player:is_alive() then
			return false
		end

		local duckamount = player.m_flDuckAmount
		return bit.band(player.m_fFlags, 2) == 2 or duckamount > 0.5
	end,

	GetJumping = function(player)
		if not player or not player:is_alive() then
			return false
		end

		local flags = player.m_fFlags
		return bit.band(flags, 1) == 0
	end,

	GetVelocity = function(player)
		if not player or not player:is_alive() then
			return 0
		end

		local velocity_x = player.m_vecVelocity.x
		local velocity_y = player.m_vecVelocity.y
		return math.sqrt((velocity_x * velocity_x) + (velocity_y * velocity_y))
	end,

	Extrapolate = function(entity, tick)
		if not entity or not entity:is_alive() or type(tick) ~= "number" then
			error(("[%s]Invalid extrapolate arguments. Check player is alive and tick is number value"):format(Script.About.name), 2)
		end

		local m_vecVelocity = entity.m_vecVelocity
		local extrapolated_pos = entity.m_vecOrigin + (m_vecVelocity * (globals.tickinterval * tick))
		return extrapolated_pos
	end,

	GetPlayerVisible = function(target, extrapolate)
		local local_player = entity.get_local_player()
		if not local_player or not target or not local_player:is_alive() or not target:is_alive() or target:is_dormant() or not target:is_enemy() then
			return false
		end

		local max_ticks = cvar.sv_maxusrcmdprocessticks:int()
		local target_origin = extrapolate and Script.API.Extrapolate(target, max_ticks) or target.m_vecOrigin
		return local_player:is_visible(target_origin)
	end,

	Table2Array = function(table, state) -- Script.API.Table2Array(table, 1)是获取表key的数组, Script.API.Table2Array(table, 2)或者啥也不填直接Script.API.Table2Array(table) 这样是获取表内容
		local array = {}
		local m_get_state = state ~= nil and state == 1
		for _, data in pairs(table) do
			table.insert(array, m_get_state and _ or data)
		end

		return array
	end,

	NormalizeYaw = function(flYaw)
		while flYaw > 180 do
			flYaw = flYaw - 360
		end

		while flYaw < - 180 do
			flYaw = flYaw + 360
		end

		return flYaw
	end,

	NormaliseAngle = function(angle)
		angle = angle % 360 
		angle = (angle + 360) % 360
		if (angle > 180)  then
			angle = angle - 360
		end

		return angle
	end,

	CreateLerpAnimation = function(cur, target, speed, key, limit)
		local m_key = tostring(key)
		if Script.cache_lerp[m_key] == nil then
			Script.cache_lerp[m_key] = cur
		end

		local frametime = globals.frametime * (speed / 10)
		Script.cache_lerp[m_key] = Script.API.Anim_Lerp(Script.cache_lerp[m_key], target, frametime)
		if limit then
			Script.cache_lerp[m_key] = math.min(math.max(limit.min, Script.cache_lerp[m_key]), limit.max)
		end

		return Script.cache_lerp[m_key]
	end,

	CreateStaticAnimation = function(max, switcher, speed, key, get_float)
		local m_key = tostring(key)
		local frametime = globals.frametime * (speed / 10)
		if Script.cache_static_animation[m_key] == nil then
			Script.cache_static_animation[m_key] = 0
		end

		Script.cache_static_animation[m_key] = Script.API.Clamp(switcher and (Script.cache_static_animation[m_key] + frametime) or (Script.cache_static_animation[m_key] - frametime), 0, 1)
		return get_float and Script.cache_static_animation[m_key] or (Script.cache_static_animation[m_key] * max)
	end,

	GetPlayerPeek = function(target, extrapolate)
		local local_player = entity.get_local_player()
		if not local_player or not target or not local_player:is_alive() or not target:is_alive() or not target:is_enemy() or target:is_dormant() then
			return false
		end

		local max_ticks = cvar.sv_maxusrcmdprocessticks:int()
		local target_origin = extrapolate and Script.API.Extrapolate(target, max_ticks - 2) or target.m_vecOrigin
		local local_origin = extrapolate and Script.API.Extrapolate(local_player, Script.ref.FakeLag.Limit:get()) or local_player.m_vecOrigin
		local trace_bullet = utils.trace_bullet(local_player, local_origin, target_origin)
		return trace_bullet > 0
	end,

	IsModuleLoaded = function(m)
		if type(m) ~= "string" then
			error(("[%s]Invalid module arguments. Expected string"):format(Script.About.name), 2)
		end

		for _, searcher in pairs(package.loaders) do
			local module = searcher(m)
			if type(module) == "function" then
				return true
			end
		end

		return false
	end,

	IsShootable = function(entity, hitbox)
		if type(hitbox) ~= "number" then
			error(("[%s]Invalid shoottable arguments. Check hitbox is number value"):format(Script.About.name), 2)
		end

		local local_player = entity.get_local_player()
		if not local_player or not local_player:is_alive() or not entity or not entity:is_alive() or not entity:is_enemy() or entity:is_dormant() then
			return false
		end

		local m_eye_pos = local_player:get_eye_position()
		local entity_hitbox_pos = entity:get_hitbox_position(hitbox)
		local traceder = utils.trace_line(m_eye_pos, entity_hitbox_pos, local_player, 0x000000FF)
		return traceder.fraction == 1
	end,

	GetAllersPeek = function(extrapolate)
		for _, ptr in pairs(entity.get_players()) do
			if Script.API.GetPlayerPeek(ptr, extrapolate) then
				return true
			end
		end

		return false
	end,

	GetAllersVisible = function(extrapolate)
		for _, ptr in pairs(entity.get_players()) do
			if Script.API.GetPlayerVisible(ptr, extrapolate) then
				return true
			end
		end

		return false
	end,

	GetAllersVisibleDatas = function(extrapolate)
		local data = {false, {}}
		for _, ptr in pairs(entity.get_players()) do
			if Script.API.GetPlayerVisible(ptr, extrapolate) then
				data[1] = true
				data[2][ptr:get_index()] = true
			end
		end

		return data
	end,

	GetAllersShootable = function(hitbox)
		for _, ptr in pairs(entity.get_players()) do
			if Script.API.IsShootable(ptr, hitbox) then
				return true
			end
		end

		return false
	end,

	apiset_clantag = function(tag_arr)
		if tag_arr == Script.last_clantag then return end
		set_clantag(tag_arr, tag_arr)
		Script.last_clantag = tag_arr
	end,

	build_clantag = function(tag)
		local ret_tag = { ' ' }
		for i = 1, #tag do
		  table.insert(ret_tag, tag:sub(1, i))
		end
		for i = #ret_tag - 1, 1, -1 do
		  table.insert(ret_tag, ret_tag[i])
		end
	  
		return ret_tag
	end,

	CreateFont = function(font_name, scale, flags)
		local flags_list = {}
		if type(flags) == "string" then
			if flags:find("a") then
				table.insert(flags_list, "a")
			end

			if flags:find("b") then
				table.insert(flags_list, "b")
			end

			if flags:find("i") then
				table.insert(flags_list, "i")
			end

			if flags:find("o") then
				table.insert(flags_list, "o")
			end

			if flags:find("d") then
				table.insert(flags_list, "d")
			end

		elseif type(flags) == "table" then
			flags_list = flags
		end

		local cache_key = ("%s %s %s"):format(font_name, scale, table.concat(flags_list))
		if Script.cache_fonts[cache_key] == nil then
			if flags_list and #flags_list > 0 then
				Script.cache_fonts[cache_key] = render.load_font(font_name, scale,flags_list[1])
			else
				Script.cache_fonts[cache_key] = render.load_font(font_name, scale)
			end
		end

		return Script.cache_fonts[cache_key]
	end,

	GetKeyState = function(hotkey, state)
		-- hotkey是按键的ui, state = [holding, toggle, always on, off hoding]
		local state = type(state) == "number" and state or state:get()
		local cache_key = ("%s %s %s"):format(hotkey:GetName(), hotkey:get(), state)
		if Script.hotkey_state[cache_key] == nil then
			Script.hotkey_state[cache_key] = {false, false}
		end

		if state == 0 then
			Script.hotkey_state[cache_key][1] = common.is_button_down(hotkey:get())
		elseif state == 1 then
			if not Script.hotkey_state[cache_key][2] and common.is_button_down(hotkey:get()) then
				Script.hotkey_state[cache_key][1] = not Script.hotkey_state[cache_key][1]
				Script.hotkey_state[cache_key][2] = true
			elseif not common.is_button_down(hotkey:get()) then
				Script.hotkey_state[cache_key][2] = false
			end

		elseif state == 2 then
			Script.hotkey_state[cache_key][1] = true
		elseif state == 3 then
			Script.hotkey_state[cache_key][1] = not common.is_button_down(hotkey:get())
		end

		return Script.hotkey_state[cache_key][1]
	end,

	CalculateAngles = function(from, to)
		local sub = {
			x = to.x - from.x, 
			y = to.y - from.y, 
			z = to.z - from.z
		}

		local world_to_screen = function(x_position, y_position)
			if x_position == 0 and y_position == 0 then
				return 0
			end

			local deg_position = math.deg(math.atan2(y_position, x_position))
			return deg_position
		end

		local hyp = math.sqrt(sub.x * sub.x + sub.y * sub.y)
		local yaw = world_to_screen(sub.x, sub.y)
		local pitch = world_to_screen(hyp, - sub.z)
		return vector(pitch, yaw, 0)	
	end,

	GetColorRGB = function(frequency, rgb_split_ratio)
		function Calculate_rgba(h, s, v, rainbow_a)
			local rainbow_r, rainbow_g, rainbow_b
			local i = math.floor(h * 6)
			local f = h * 6 - i
			local p = v * (1 - s)
			local q = v * (1 - f * s)
			local t = v * (1 - (1 - f) * s)
			i = i % 6
			if i == 0 then
				rainbow_r, rainbow_g, rainbow_b = v, t, p
			elseif i == 1 then
				rainbow_r, rainbow_g, rainbow_b = q, v, p
			elseif i == 2 then
				rainbow_r, rainbow_g, rainbow_b = p, v, t
			elseif i == 3 then
				rainbow_r, rainbow_g, rainbow_b = p, q, v
			elseif i == 4 then
				rainbow_r, rainbow_g, rainbow_b = t, p, v
			elseif i == 5 then
				rainbow_r, rainbow_g, rainbow_b = v, p, q
			end
    
			return rainbow_r * 255, rainbow_g * 255, rainbow_b * 255, rainbow_a * 255
		end

		local calc_rgb_r, calc_rgb_g, calc_rgb_b = Calculate_rgba(globals.realtime * frequency, 1, 1, 1)
		return color(calc_rgb_r * rgb_split_ratio, calc_rgb_g * rgb_split_ratio, calc_rgb_b * rgb_split_ratio, 1)
	end,

	GetGradientColors = function(clr_1, clr_2, text)
		local function color_to_normalzied(clr)
			return {
				r = math.floor(clr.r),
				a = math.floor(clr.a),
				b = math.floor(clr.b),
				g = math.floor(clr.g)
			}
		end

		local color_gradient = {
			color_to_normalzied(clr_1),
			color_to_normalzied(clr_2)
		}

		local output_colors = {}
		local length = #text - 1
		local faded_r = (color_gradient[2].r - color_gradient[1].r) / length
		local faded_g = (color_gradient[2].g - color_gradient[1].g) / length
		local faded_b = (color_gradient[2].b - color_gradient[1].b) / length
		local faded_a = (color_gradient[2].a - color_gradient[1].a) / length
		for i = 1, length + 1 do
			color_gradient[1].r = math.max(color_gradient[1].r + faded_r, 0)
			color_gradient[1].a = math.max(color_gradient[1].a + faded_a, 0)
			color_gradient[1].g = math.max(color_gradient[1].g + faded_g, 0)
			color_gradient[1].b = math.max(color_gradient[1].b + faded_b, 0)
			output_colors[i] = {math.abs(math.max(math.floor(color_gradient[1].r), 0)), math.abs(math.max(math.floor(color_gradient[1].g), 0)), math.abs(math.max(math.floor(color_gradient[1].b), 0)), math.abs(math.max(math.floor(color_gradient[1].a), 0))}
		end

		output_colors[text:len()] = {math.floor(clr_2.r), math.floor(clr_2.g), math.floor(clr_2.b), math.floor(clr_2.a)}
		return output_colors
	end,

	Vector2Angles = function(target_origin, local_player_origin)
		local origin_x, origin_y, origin_z
		local target_x, target_y, target_z
		local local_player = entity.get_local_player()
		if not local_player or not local_player:is_alive() then
			return vector(0, 0, 0)
		end

		if x2 == nil then
			target_x, target_y, target_z = x1, y1, z1
			local eye_angle = local_player:get_eye_position()
			origin_x, origin_y, origin_z = eye_angle.x, eye_angle.y, eye_angle.z
			if origin_x == nil then
				return vector(0, 0, 0)
			end
		else
			origin_x, origin_y, origin_z = x1, y1, z1
			target_x, target_y, target_z = x2, y2, z2
		end

		local delta_x, delta_y, delta_z = target_x - origin_x, target_y - origin_y, target_z - origin_z
		if delta_x == 0 and delta_y == 0 then
			return vector((delta_z > 0 and 270 or 90), 0, 0)
		else
			local yaw = math.deg(math.atan2(delta_y, delta_x))
			local hyp = math.sqrt(delta_x * delta_x + delta_y * delta_y)
			local pitch = math.deg(math.atan2(- delta_z, hyp))
			return vector(pitch, yaw, 0)
		end
	end,

	RenderGradientText = function(x, y, color_1, color_2, size, font, text, center_x, center_y, outline)
		local center_offset = vector(0, 0)
		local current_offset = vector(0, 0)
		local m_colors = Script.API.GetGradientColors(color_1, color_2, text)
		if center_x or center_y then
			for idx = 1, text:len() do
				local text_size = render.measure_text(font,"",text:sub(idx, idx))
				if center_x then
					center_offset.x = center_offset.x + text_size.x
				end

				if center_y then
					center_offset.y = center_offset.y + text_size.y
				end
			end

			center_offset.x = center_x and (center_offset.x / 2) or 0
			center_offset.y = center_y and (center_offset.y / 2) or 0
		end

		for idx = 1, text:len() do
			local current_color = color(unpack(m_colors[idx]))
			local text_size = render.measure_text(font,"",text:sub(idx, idx))
			if outline then
				render.text(font, vector(x + center_offset.x + current_offset.x, y + center_offset.y - 1), color(0, 0, 0, current_color.a),nil,text:sub(idx, idx))
				render.text(font, vector(x + center_offset.x + current_offset.x - 1, y + center_offset.y), color(0, 0, 0, current_color.a),nil,text:sub(idx, idx))
				render.text(font, vector(x + center_offset.x + current_offset.x + 1, y + center_offset.y), color(0, 0, 0, current_color.a),nil,text:sub(idx, idx))
				render.text(font, vector(x + center_offset.x + current_offset.x, y + center_offset.y + 1), color(0, 0, 0, current_color.a),nil,text:sub(idx, idx))
			end

			render.text(font, vector(x + center_offset.x + current_offset.x, y + center_offset.y), current_color,nil,text:sub(idx, idx))
			current_offset.x = current_offset.x + text_size.x
		end
	end,

	File_exists = function(path)
		if Script.ffi_helpers.file_exists(Script.ffi_helpers.file_stdio, ("%s%s"):format(common.get_game_directory():sub(0, - 5), path), nil) then
			return true
		end
	
		return false
	end,

	gethealthbaseclr = function(percentage)
		local r = 124*2 - 124 * percentage
		local g = 195 * percentage
		local b = 13
		return r, g, b
	end,
	
	remap = function(val, newmin, newmax, min, max, clamp)
		min = min or 0
		max = max or 1
	
		local pct = (val-min)/(max-min)
	
		if clamp ~= false then
			pct = math.min(1, math.max(0, pct))
		end
	
		return newmin+(newmax-newmin)*pct
	end,

	getRandomInteger = function(min, max)
		return min + math.ceil(math.random() * (max - min))
	end,

	RenderRoundedgradientrect = function(x,y,color1,color2,horizontal,portrait,thick,toalpha,radian)
		local yaw = 1==thick and -0.1 or 0.2
		local radius = math.ceil(portrait*radian)+yaw--0.0625/0.1
		render.rect(vector(x-radius,y), vector(x+horizontal+radius-thick,y+portrait+radius), color(0, 0, 0, Script.Menu_UI.visual_panel.bg_alpha:get()),3)
		render.blur(vector(x-radius,y), vector(x+horizontal+radius-thick,y+portrait+radius),1,0.6,3)
		render.gradient(vector(x,y), vector(x+horizontal,y+thick), color1, color2, color1, color2)--上横
		render.circle_outline(vector(x,y+radius),color1, portrait*radian,180,0.25, thick)--左上角圆
		render.circle_outline(vector(x+horizontal,y+radius),color2,portrait*radian,270,0.25,thick)--右上角圆
		render.gradient(vector(x-radius,y+radius), vector(x-(radius-thick),y+radius+(portrait-radius)), color1, color1, color(color2.r, color2.g,color2.b, toalpha) , color(color2.r, color2.g,color2.b, toalpha))--左丨
		render.gradient(vector(x+horizontal+radius-thick,y+radius), vector(x+horizontal+radius,y+radius+(portrait-radius)), color2 , color2, color(color1.r, color1.g,color1.b, toalpha) , color(color1.r, color1.g,color1.b, toalpha))--右丨
		render.circle_outline(vector(x,y+radius+(portrait-radius)),color(color2.r, color2.g,color2.b, toalpha), portrait*radian,90,0.25,thick)--左下角圆
		render.circle_outline(vector(x+horizontal,y+radius+(portrait-radius)),color(color1.r, color1.g,color1.b, toalpha), portrait*radian,0,0.25,thick)--右下角圆
		render.gradient(vector(x,y+radius*2+(portrait-radius)-thick), vector(x+horizontal,y+radius*2+(portrait-radius)),  color(color2.r, color2.g,color2.b, toalpha), color(color1.r, color1.g,color1.b, toalpha), color(color2.r, color2.g,color2.b, toalpha), color(color1.r, color1.g,color1.b, toalpha))--下横
	end,

	Renderpriestrect = function(x,y,color1,color2,horizontal,portrait,thick,toalpha,radian,is_comp)
		local yaw = 1==thick and -0.1 or 0.2
		local radius = radian--math.ceil(horizontal*radian)--0.0625/0.1
		render.rect(vector(x-radius,y), vector(x+horizontal+radius-thick,y+portrait), color(17, 17, 17, 255),radius+1)
		--render.blur(vector(x-radius,y), vector(x+horizontal+radius-thick,y+portrait+radius),color(1.0, 1,1, 0.6),3)
		if is_comp then
			render.gradient(vector(x,y), vector(x+horizontal/2,y+thick), color(color1.r, color1.g,color1.b, color1.a), color(color1.b, color1.r,color1.g, color1.a), color(color1.r, color1.g,color1.b, color1.a), color(color1.b, color1.r,color1.g, color1.a))--上横
			render.gradient(vector(x+horizontal/2,y), vector(x+horizontal,y+thick), color(color1.b, color1.r,color1.g, color1.a), color(color1.g, color1.b,color1.r, color1.a), color(color1.b, color1.r,color1.g, color1.a), color(color1.g, color1.b,color1.r, color1.a))--上横
			render.circle_outline(vector(x+horizontal,y+radius),color(color1.g, color1.b,color1.r, color1.a), radius,270,0.25,thick)--右上角圆
			render.gradient(vector(x+horizontal+radius-thick,y+radius), vector(x+horizontal+radius,y+(portrait-radius)), color(color1.g, color1.b,color1.r, 255) , color(color1.g, color1.b,color1.r, 255), color(color1.r, color1.b,color1.g, 255) , color(color1.r, color1.b,color1.g, 255))--右丨
			render.circle_outline(vector(x+horizontal,y+(portrait-radius)),color(color1.r, color1.b,color1.g, 255), radius,0,0.25,thick)--右下角圆
			render.gradient(vector(x,y+radius+(portrait-radius)-thick), vector(x+horizontal/2,y+radius+(portrait-radius)),  color(color1.g, color1.r,color1.b, color1.a), color(color1.b, color1.g,color1.r, color1.a), color(color1.g, color1.r,color1.b, color1.a), color(color1.b, color1.g,color1.r, color1.a))--下横
			render.gradient(vector(x+horizontal/2,y+radius+(portrait-radius)-thick), vector(x+horizontal,y+radius+(portrait-radius)),  color(color1.b, color1.g,color1.r, color1.a), color(color1.r, color1.b,color1.g, color1.a), color(color1.b, color1.g,color1.r, color1.a), color(color1.r, color1.b,color1.g, color1.a))--下横
		else
			render.gradient(vector(x,y), vector(x+horizontal,y+thick), color1, color2, color1, color2)--上横
			render.circle_outline(vector(x+horizontal,y+radius),color2, radius,270,0.25,thick)--右上角圆
			render.gradient(vector(x+horizontal+radius-thick,y+radius), vector(x+horizontal+radius,y+(portrait-radius)), color2 , color2, color(color1.r, color1.g,color1.b, 255) , color(color1.r, color1.g,color1.b, 255))--右丨
			render.circle_outline(vector(x+horizontal,y+(portrait-radius)),color(color1.r, color1.g,color1.b, 255), radius,0,0.25,thick)--右下角圆
			render.gradient(vector(x,y+radius+(portrait-radius)-thick), vector(x+horizontal,y+radius+(portrait-radius)),  color(color2.r, color2.g,color2.b, 255), color(color1.r, color1.g,color1.b, 255), color(color2.r, color2.g,color2.b, 255), color(color1.r, color1.g,color1.b, 255))--下横
		end
	end,

	Rendersolusv2textrect = function(x,y,color1,color2,horizontal,portrait,thick,toalpha,radian,is_rainbow)
		--local yaw = 1==thick and -0.1 or 0.2
		local radius = radian--math.ceil(horizontal*radian)--0.0625/0.1
		--render.rect(vector(x+1,y), vector(x+horizontal-1,y+portrait), color(0, 0, 0, (Script.Menu_UI.visual_panel.bg_alpha:get())*0.8),radius+1)
		render.blur(vector(x+1,y), vector(x+horizontal-1,y+portrait),1,0.6,radius)
		render.rect(vector(x+1,y), vector(x+horizontal-1,y+portrait), color(0, 0, 0, (Script.Menu_UI.visual_panel.bg_alpha:get())*0.8),radius)
		if is_rainbow then
			render.gradient(vector(x+radius,y), vector(x+(horizontal-radius)/2,y+thick), color(color1.r, color1.g,color1.b, color1.a), color(color1.b, color1.r,color1.g, color1.a), color(color1.r, color1.g,color1.b, color1.a), color(color1.b, color1.r,color1.g, color1.a))--上横
			render.gradient(vector(x+(horizontal-radius)/2,y), vector(x+horizontal-radius,y+thick), color(color1.b, color1.r,color1.g, color1.a), color(color1.g, color1.b,color1.r, color1.a), color(color1.b, color1.r,color1.g, color1.a), color(color1.g, color1.b,color1.r, color1.a))--上横
			render.circle_outline(vector(x+radius,y+radius),color1, radian,180,0.25,thick)--左上角圆
			render.circle_outline(vector(x+horizontal-radius,y+radius),color(color1.g, color1.b,color1.r, color1.a), radian,270,0.25,thick)--右上角圆
			render.gradient(vector(x,y+radius), vector(x+thick,y+portrait), color1, color1, color(color1.g, color1.r,color1.b, 0) , color(color1.g, color1.r,color1.b, 0))--左丨
			render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+portrait), color(color1.g, color1.b,color1.r, 255) , color(color1.g, color1.b,color1.r, 255), color(color1.r, color1.b,color1.g, 0) , color(color1.r, color1.b,color1.g, 0))--右丨
			--render.circle_outline(vector(x+radius,y+(portrait-radius)), horizontal*radian,30, color(color2.r, color2.g,color2.b, toalpha),thick,90,180)--左下角圆
			--render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)), horizontal*radian,30, color(color1.r, color1.g,color1.b, toalpha),thick,0,90)--右下角圆
			render.gradient(vector(x,y+radius+(portrait-radius)-thick), vector(x+horizontal/2,y+radius+(portrait-radius)),  color(color1.g, color1.r,color1.b, 0), color(color1.b, color1.g,color1.r, 255), color(color1.g, color1.r,color1.b, 0), color(color1.b, color1.g,color1.r, 255))--下横
			render.gradient(vector(x+horizontal/2,y+radius+(portrait-radius)-thick), vector(x+horizontal,y+radius+(portrait-radius)),  color(color1.b, color1.g,color1.r, 255), color(color1.r, color1.b,color1.g, 0), color(color1.b, color1.g,color1.r, 255), color(color1.r, color1.b,color1.g, 0))--下横
		else
			render.gradient(vector(x+radius,y), vector(x+horizontal-radius,y+thick), color1, color2, color1, color2)--上横
			render.circle_outline(vector(x+radius,y+radius),color1, radian,180,0.25,thick)--左上角圆
			render.circle_outline(vector(x+horizontal-radius,y+radius),color2, radian,270,0.25,thick)--右上角圆
			render.gradient(vector(x,y+radius), vector(x+thick,y+portrait), color1, color1, color(color2.r, color2.g,color2.b, 0) , color(color2.r, color2.g,color2.b, 0))--左丨
			render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+portrait), color2 , color2, color(color1.r, color1.g,color1.b, 0) , color(color1.r, color1.g,color1.b, 0))--右丨
			--render.circle_outline(vector(x+radius,y+(portrait-radius)), horizontal*radian,30, color(color2.r, color2.g,color2.b, toalpha),thick,90,180)--左下角圆
			--render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)), horizontal*radian,30, color(color1.r, color1.g,color1.b, toalpha),thick,0,90)--右下角圆
			render.gradient(vector(x,y+radius+(portrait-radius)-thick), vector(x+horizontal/2,y+radius+(portrait-radius)),  color(color1.r, color1.g,color1.b, 0), color(color2.r, color2.g,color2.b, 255), color(color1.r, color1.g,color1.b, 0), color(color2.r, color2.g,color2.b, 255))--下横
			render.gradient(vector(x+horizontal/2,y+radius+(portrait-radius)-thick), vector(x+horizontal,y+radius+(portrait-radius)),  color(color2.r, color2.g,color2.b, 255), color(color1.r, color1.g,color1.b, 0), color(color2.r, color2.g,color2.b, 255), color(color1.r, color1.g,color1.b, 0))--下横
		end
		
	end,

	Rendersolusv2rect = function(x,y,color1,color2,horizontal,portrait,thick,toalpha,radian,is_rainbow,back_alpha)
		--local yaw = 1==thick and -0.1 or 0.2
		local radius = radian--math.ceil(horizontal*radian)--0.0625/0.1
		render.blur(vector(x+1,y), vector(x+horizontal-1,y+portrait),1,0.6,radius)
		render.rect(vector(x+1,y), vector(x+horizontal-1,y+portrait), color(0, 0, 0, back_alpha and back_alpha or (Script.Menu_UI.visual_panel.bg_alpha:get())*0.8),radius)
		if is_rainbow then
			render.gradient(vector(x+radius,y), vector(x+(horizontal-radius)/2,y+thick), color(color1.r, color1.g,color1.b, color1.a), color(color1.b, color1.r,color1.g, color1.a), color(color1.r, color1.g,color1.b, color1.a), color(color1.b, color1.r,color1.g, color1.a))--上横
			render.gradient(vector(x+(horizontal-radius)/2,y), vector(x+horizontal-radius,y+thick), color(color1.b, color1.r,color1.g, color1.a), color(color1.g, color1.b,color1.r, color1.a), color(color1.b, color1.r,color1.g, color1.a), color(color1.g, color1.b,color1.r, color1.a))--上横
			render.circle_outline(vector(x+radius,y+radius),color1, radius,180,0.25,thick)--左上角圆
			render.circle_outline(vector(x+horizontal-radius,y+radius),color(color1.g, color1.b,color1.r, color1.a), radius,270,0.25,thick)--右上角圆
			render.gradient(vector(x,y+radius), vector(x+thick,y+(portrait-radius)), color1, color1, color(color1.g, color1.r,color1.b, color1.a*toalpha) , color(color1.g, color1.r,color1.b, color1.a*toalpha))--左丨
			render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+(portrait-radius)), color(color1.g, color1.b,color1.r, color1.a) , color(color1.g, color1.b,color1.r, color1.a), color(color1.r, color1.b,color1.g, color1.a*toalpha) , color(color1.r, color1.b,color1.g, color1.a*toalpha))--右丨
			render.circle_outline(vector(x+radius,y+(portrait-radius)),color(color1.g, color1.r,color1.b, color1.a*toalpha), radius,90,0.25,thick)--左下角圆
			render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)),color(color1.r, color1.b,color1.g, color1.a*toalpha), radius,0,0.25,thick)--右下角圆
			render.gradient(vector(x+radius,y+radius+(portrait-radius)-thick), vector(x+(horizontal-radius)/2,y+radius+(portrait-radius)),  color(color1.g, color1.r,color1.b, color1.a*toalpha), color(color1.b, color1.g,color1.r, color1.a*toalpha), color(color1.g, color1.r,color1.b, color1.a*toalpha), color(color1.b, color1.g,color1.r, color1.a*toalpha))--下横
			render.gradient(vector(x+(horizontal-radius)/2,y+radius+(portrait-radius)-thick), vector(x+horizontal-radius,y+radius+(portrait-radius)),  color(color1.b, color1.g,color1.r, color1.a*toalpha), color(color1.r, color1.b,color1.g, color1.a*toalpha), color(color1.b, color1.g,color1.r, color1.a*toalpha), color(color1.r, color1.b,color1.g, color1.a*toalpha))--下横
		else
			render.gradient(vector(x+radius,y), vector(x+horizontal-radius,y+thick), color1, color2, color1, color2)--上横
			render.circle_outline(vector(x+radius,y+radius),color1, radius,180,0.25,thick)--左上角圆
			render.circle_outline(vector(x+horizontal-radius,y+radius),color2, radius,270,0.25,thick)--右上角圆
			render.gradient(vector(x,y+radius), vector(x+thick,y+(portrait-radius)), color1, color1, color(color2.r, color2.g,color2.b, toalpha) , color(color2.r, color2.g,color2.b, toalpha))--左丨
			render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+(portrait-radius)), color2 , color2, color(color1.r, color1.g,color1.b, toalpha) , color(color1.r, color1.g,color1.b, toalpha))--右丨
			render.circle_outline(vector(x+radius,y+(portrait-radius)),color(color2.r, color2.g,color2.b, toalpha), radius,90,0.25, thick)--左下角圆
			render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)),color(color1.r, color1.g,color1.b, toalpha), radius,0,0.25, thick)--右下角圆
			render.gradient(vector(x+radius,y+radius+(portrait-radius)-thick), vector(x+horizontal-radius,y+radius+(portrait-radius)),  color(color2.r, color2.g,color2.b, toalpha), color(color1.r, color1.g,color1.b, toalpha), color(color2.r, color2.g,color2.b, toalpha), color(color1.r, color1.g,color1.b, toalpha))--下横
		end
		
	end,

	Rendersolusv2rectwindow = function(x,y,color1,color2,horizontal,portrait,thick,toalpha,radian,is_rainbow)
		--local yaw = 1==thick and -0.1 or 0.2
		local radius = radian--math.ceil(horizontal*radian)--0.0625/0.1
		render.blur(vector(x+1,y), vector(x+horizontal-1,y+portrait),1,color1.a,radius+1)
		render.rect(vector(x+1,y), vector(x+horizontal-1,y+portrait), color(0, 0, 0, color1.a*(Script.Menu_UI.visual_panel.bg_alpha:get()/255)),radius+1)
		if is_rainbow then
			render.gradient(vector(x+radius,y), vector(x+(horizontal-radius)/2,y+thick), color(color1.r, color1.g,color1.b, color1.a), color(color1.b, color1.r,color1.g, color1.a), color(color1.r, color1.g,color1.b, color1.a), color(color1.b, color1.r,color1.g, color1.a))--上横
			render.gradient(vector(x+(horizontal-radius)/2,y), vector(x+horizontal-radius,y+thick), color(color1.b, color1.r,color1.g, color1.a), color(color1.g, color1.b,color1.r, color1.a), color(color1.b, color1.r,color1.g, color1.a), color(color1.g, color1.b,color1.r, color1.a))--上横
			render.circle_outline(vector(x+radius,y+radius),color1, radius,180,0.25,thick)--左上角圆
			render.circle_outline(vector(x+horizontal-radius,y+radius),color(color1.g, color1.b,color1.r, color1.a), radius,270,0.25,thick)--右上角圆
			render.gradient(vector(x,y+radius), vector(x+thick,y+(portrait-radius)), color1, color1, color(color1.g, color1.r,color1.b, color1.a*toalpha) , color(color1.g, color1.r,color1.b, color1.a*toalpha))--左丨
			render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+(portrait-radius)), color(color1.g, color1.b,color1.r, color1.a) , color(color1.g, color1.b,color1.r, color1.a), color(color1.r, color1.b,color1.g, color1.a*toalpha) , color(color1.r, color1.b,color1.g, color1.a*toalpha))--右丨
			render.circle_outline(vector(x+radius,y+(portrait-radius)),color(color1.g, color1.r,color1.b, color1.a*toalpha), radius,90,0.25,thick)--左下角圆
			render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)),color(color1.r, color1.b,color1.g, color1.a*toalpha), radius,0,0.25,thick)--右下角圆
			render.gradient(vector(x+radius,y+radius+(portrait-radius)-thick), vector(x+(horizontal-radius)/2,y+radius+(portrait-radius)),  color(color1.g, color1.r,color1.b, color1.a*toalpha), color(color1.b, color1.g,color1.r, color1.a*toalpha), color(color1.g, color1.r,color1.b, color1.a*toalpha), color(color1.b, color1.g,color1.r, color1.a*toalpha))--下横
			render.gradient(vector(x+(horizontal-radius)/2,y+radius+(portrait-radius)-thick), vector(x+horizontal-radius,y+radius+(portrait-radius)),  color(color1.b, color1.g,color1.r, color1.a*toalpha), color(color1.r, color1.b,color1.g, color1.a*toalpha), color(color1.b, color1.g,color1.r, color1.a*toalpha), color(color1.r, color1.b,color1.g, color1.a*toalpha))--下横
		else
			render.gradient(vector(x+radius,y), vector(x+horizontal-radius,y+thick), color1, color2, color1, color2)--上横
			render.circle_outline(vector(x+radius,y+radius),color1, radius,180,0.25,thick)--左上角圆
			render.circle_outline(vector(x+horizontal-radius,y+radius),color2, radius,270,0.25,thick)--右上角圆
			render.gradient(vector(x,y+radius), vector(x+thick,y+(portrait-radius)), color1, color1, color(color2.r, color2.g,color2.b, color1.a*toalpha) , color(color2.r, color2.g,color2.b, color1.a*toalpha))--左丨
			render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+(portrait-radius)), color2 , color2, color(color1.r, color1.g,color1.b, color1.a*toalpha) , color(color1.r, color1.g,color1.b, color1.a*toalpha))--右丨
			render.circle_outline(vector(x+radius,y+(portrait-radius)),color(color2.r, color2.g,color2.b, color1.a*toalpha), radius,90,0.25,thick)--左下角圆
			render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)),color(color1.r, color1.g,color1.b, color1.a*toalpha), radius,0,0.25,thick)--右下角圆
			render.gradient(vector(x+radius,y+radius+(portrait-radius)-thick), vector(x+horizontal-radius,y+radius+(portrait-radius)),  color(color2.r, color2.g,color2.b, color1.a*toalpha), color(color1.r, color1.g,color1.b, color1.a*toalpha), color(color2.r, color2.g,color2.b, color1.a*toalpha), color(color1.r, color1.g,color1.b, color1.a*toalpha))--下横
		end
	end,

	GetGradientSidebar = function(clr_1, clr_2, text)
		local output = ''
		local function color_to_normalzied(clr)
			return {
				r = math.floor(clr.r),
				a = math.floor(clr.a),
				b = math.floor(clr.b),
				g = math.floor(clr.g)
			}
		end

		local color_gradient = {
			color_to_normalzied(clr_1),
			color_to_normalzied(clr_2)
		}

		local length = #text - 1
		local faded_r = (color_gradient[2].r - color_gradient[1].r) / length
		local faded_g = (color_gradient[2].g - color_gradient[1].g) / length
		local faded_b = (color_gradient[2].b - color_gradient[1].b) / length
		local faded_a = (color_gradient[2].a - color_gradient[1].a) / length
		for i = 1, length + 1 do
			output = output .. ('\a%02x%02x%02x%02x%s'):format(color_gradient[1].r, color_gradient[1].g, color_gradient[1].b, color_gradient[1].a, text:sub(i, i))
			color_gradient[1].r = math.max(color_gradient[1].r + faded_r, 0)
			color_gradient[1].a = math.max(color_gradient[1].a + faded_a, 0)
			color_gradient[1].g = math.max(color_gradient[1].g + faded_g, 0)
			color_gradient[1].b = math.max(color_gradient[1].b + faded_b, 0)
		end
		return output
	end,

	menu_icon = function (icon_name, menu_name, icon_color, menu_name_color, menu_name_color2)
		local icon = icon_name ~= nil and ui.get_icon(icon_name) or ""
		local menu_name_outtext = menu_name_color ~= nil and "" or("\aFFFFFFFF" .. menu_name)
	
		if icon_color then
			icon = ("\a%02x%02x%02x%02x%s"):format(icon_color.r, icon_color.g, icon_color.b, icon_color.a, icon)
		end
		
		if menu_name_color2 then
			local function color_to_normalzied(clr)
				return {
					r = math.floor(clr.r),
					a = math.floor(clr.a),
					b = math.floor(clr.b),
					g = math.floor(clr.g)
				}
			end
	
			local color_gradient = {
				color_to_normalzied(menu_name_color),
				color_to_normalzied(menu_name_color2)
			}
	
			local length = #menu_name - 1
			local faded_r = (color_gradient[2].r - color_gradient[1].r) / length
			local faded_g = (color_gradient[2].g - color_gradient[1].g) / length
			local faded_b = (color_gradient[2].b - color_gradient[1].b) / length
			local faded_a = (color_gradient[2].a - color_gradient[1].a) / length
			for i = 1, length + 1 do
				menu_name_outtext = menu_name_outtext .. ('\a%02x%02x%02x%02x%s'):format(color_gradient[1].r, color_gradient[1].g, color_gradient[1].b, color_gradient[1].a, menu_name:sub(i, i))
				color_gradient[1].r = math.max(color_gradient[1].r + faded_r, 0)
				color_gradient[1].a = math.max(color_gradient[1].a + faded_a, 0)
				color_gradient[1].g = math.max(color_gradient[1].g + faded_g, 0)
				color_gradient[1].b = math.max(color_gradient[1].b + faded_b, 0)
			end
		elseif menu_name_color then
			menu_name_outtext = ("\a%02x%02x%02x%02x%s"):format(menu_name_color.r, menu_name_color.g, menu_name_color.b, menu_name_color.a, menu_name)
		end
	
		return tostring(icon .. menu_name_outtext)
	end,

	RenderBlurRoundedtoalpharect = function(x,y,color1,color2,horizontal,portrait,thick,radian,font,size,text,color_mode,is_toalpha,is_text)
		--local yaw = 1==thick and -0.1 or 0.2
		local cac_font = Script.API.CreateFont(font,size)
		local rgb_color = Script.API.GetColorRGB(15/100,1)
		local font_size = render.measure_text(cac_font,"",text)
		local radius = radian--math.ceil(horizontal*radian)--0.0625/0.1
		local alpha = is_toalpha == true and color1.a or 255
		if is_text then
			color2.a = is_toalpha and color1.a or color2.a
			if color_mode == 2 then
				render.blur(vector(x+1,y), vector(x+horizontal-1,y+portrait),1, color1.a/255,radius+1)
				render.rect(vector(x+1,y), vector(x+horizontal-1,y+portrait), color(0, 0, 0, color1.a*(Script.Menu_UI.visual_panel.bg_alpha:get()/255)),radius+1)
				render.gradient(vector(x+radius,y), vector(x+(horizontal-radius)/2,y+thick), color(color1.r, color1.g,color1.b, alpha), color(color1.b, color1.r,color1.g, 0), color(color1.r, color1.g,color1.b, alpha), color(color1.b, color1.r,color1.g, 0))--上横
				Script.API.RenderGradientText(x+(horizontal-font_size.x)/2 + 2, y-font_size.y/2, color(rgb_color.r, rgb_color.g, rgb_color.b, alpha),color(rgb_color.g, rgb_color.b, rgb_color.r, alpha),size,cac_font,text,false,false,true)
				render.gradient(vector(x+(horizontal-radius)/2,y), vector(x+horizontal-radius,y+thick), color(color1.b, color1.r,color1.g, 0), color(color1.g, color1.b,color1.r, alpha), color(color1.b, color1.r,color1.g, 0), color(color1.g, color1.b,color1.r, alpha))--上横
				render.circle_outline(vector(x+radius,y+radius),color(color1.r, color1.g,color1.b, alpha), radius,180,0.25,thick)--左上角圆
				render.circle_outline(vector(x+horizontal-radius,y+radius),color(color1.g, color1.b,color1.r, alpha), radius,270,0.25,thick)--右上角圆
				render.gradient(vector(x,y+radius), vector(x+thick,y+(portrait-radius)), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, alpha), color(color1.g, color1.r,color1.b, alpha) , color(color1.g, color1.r,color1.b, alpha))--左丨
				render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+(portrait-radius)), color(color1.g, color1.b,color1.r, alpha) , color(color1.g, color1.b,color1.r, alpha), color(color1.r, color1.b,color1.g, alpha) , color(color1.r, color1.b,color1.g, alpha))--右丨
				render.circle_outline(vector(x+radius,y+(portrait-radius)),color(color1.g, color1.r,color1.b, alpha), radius,90,0.25,thick)--左下角圆
				render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)),color(color1.r, color1.b,color1.g, alpha), radius,0,0.25,thick)--右下角圆
				render.gradient(vector(x+radius,y+radius+(portrait-radius)-thick), vector(x+(horizontal-radius)/2,y+radius+(portrait-radius)),  color(color1.g, color1.r,color1.b, alpha), color(color1.b, color1.g,color1.r, alpha), color(color1.g, color1.r,color1.b, alpha), color(color1.b, color1.g,color1.r, alpha))--下横
				render.gradient(vector(x+(horizontal-radius)/2,y+radius+(portrait-radius)-thick), vector(x+horizontal-radius,y+radius+(portrait-radius)),  color(color1.b, color1.g,color1.r, alpha), color(color1.r, color1.b,color1.g, alpha), color(color1.b, color1.g,color1.r, alpha), color(color1.r, color1.b,color1.g, alpha))--下横
			else
				render.blur(vector(x+1,y), vector(x+horizontal-1,y+portrait),1, color1.a/255,radius+1)
				render.rect(vector(x+1,y), vector(x+horizontal-1,y+portrait), color(0, 0, 0, color1.a*(Script.Menu_UI.visual_panel.bg_alpha:get()/255)),radius+1)
				render.gradient(vector(x+radius,y), vector(x+(horizontal-radius)/2,y+thick), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, 0), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, 0))--上横
				Script.API.RenderGradientText(x+(horizontal-font_size.x)/2 + 2, y-font_size.y/2, color(color1.r, color1.g, color1.b, alpha),color(color2.r, color2.g, color2.b, alpha),size,cac_font,text,false,false,true)
				render.gradient(vector(x+(horizontal-radius)/2,y), vector(x+horizontal-radius,y+thick), color(color1.r, color1.g,color1.b, 0), color(color2.r, color2.g,color2.b, alpha), color(color1.r, color1.g,color1.b, 0), color(color2.r, color2.g,color2.b, alpha))--上横
				render.circle_outline(vector(x+radius,y+radius),color(color1.r, color1.g,color1.b, alpha), radius,180,0.25,thick)--左上角圆
				render.circle_outline(vector(x+horizontal-radius,y+radius),color(color2.r, color2.g,color2.b, alpha), radius,270,0.25,thick)--右上角圆
				render.gradient(vector(x,y+radius), vector(x+thick,y+(portrait-radius)), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, alpha), color(color2.r, color2.g,color2.b, alpha) , color(color2.r, color2.g,color2.b, alpha))--左丨
				render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+(portrait-radius)), color(color2.r, color2.g,color2.b, alpha) , color(color2.r, color2.g,color2.b, alpha), color(color1.r, color1.g,color1.b, alpha) , color(color1.r, color1.g,color1.b, alpha))--右丨
				render.circle_outline(vector(x+radius,y+(portrait-radius)),color(color2.r, color2.g,color2.b, alpha), radius,90,0.25,thick)--左下角圆
				render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)),color(color1.r, color1.g,color1.b, alpha), radius,0,0.25,thick)--右下角圆
				render.gradient(vector(x+radius,y+radius+(portrait-radius)-thick), vector(x+(horizontal-radius),y+radius+(portrait-radius)),color(color2.r, color2.g,color2.b,alpha), color(color1.r, color1.g,color1.b, alpha), color(color2.r, color2.g,color2.b, alpha), color(color1.r, color1.g,color1.b, alpha))--下横
			end
		else
			if color_mode == 2 then
				render.blur(vector(x+1,y), vector(x+horizontal-1,y+portrait),1, color1.a/255,radius+1)
				render.rect(vector(x+1,y), vector(x+horizontal-1,y+portrait), color(0, 0, 0, color1.a*(Script.Menu_UI.visual_panel.bg_alpha:get()/255)),radius+1)
				render.gradient(vector(x+radius,y), vector(x+(horizontal-radius)/2,y+thick), color(color1.r, color1.g,color1.b, alpha), color(color1.b, color1.r,color1.g, alpha), color(color1.r, color1.g,color1.b, alpha), color(color1.b, color1.r,color1.g, alpha))--上横
				render.gradient(vector(x+(horizontal-radius)/2,y), vector(x+horizontal-radius,y+thick), color(color1.b, color1.r,color1.g, alpha), color(color1.g, color1.b,color1.r, alpha), color(color1.b, color1.r,color1.g, alpha), color(color1.g, color1.b,color1.r, alpha))--上横
				render.circle_outline(vector(x+radius,y+radius),color(color1.r, color1.g,color1.b, alpha), radius,180,0.25,thick)--左上角圆
				render.circle_outline(vector(x+horizontal-radius,y+radius),color(color1.g, color1.b,color1.r, alpha), radius,270,0.25,thick)--右上角圆
				render.gradient(vector(x,y+radius), vector(x+thick,y+(portrait-radius)), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, alpha), color(color1.g, color1.r,color1.b, alpha) , color(color1.g, color1.r,color1.b, alpha))--左丨
				render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+(portrait-radius)), color(color1.g, color1.b,color1.r, alpha) , color(color1.g, color1.b,color1.r, alpha), color(color1.r, color1.b,color1.g, alpha) , color(color1.r, color1.b,color1.g, alpha))--右丨
				render.circle_outline(vector(x+radius,y+(portrait-radius)),color(color1.g, color1.r,color1.b, alpha), radius,90,0.25,thick)--左下角圆
				render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)),color(color1.r, color1.b,color1.g, alpha), radius,0,0.25,thick)--右下角圆
				render.gradient(vector(x+radius,y+radius+(portrait-radius)-thick), vector(x+(horizontal-radius)/2,y+radius+(portrait-radius)),  color(color1.g, color1.r,color1.b, alpha), color(color1.b, color1.g,color1.r, alpha), color(color1.g, color1.r,color1.b, alpha), color(color1.b, color1.g,color1.r, alpha))--下横
				render.gradient(vector(x+(horizontal-radius)/2,y+radius+(portrait-radius)-thick), vector(x+horizontal-radius,y+radius+(portrait-radius)),  color(color1.b, color1.g,color1.r, alpha), color(color1.r, color1.b,color1.g, alpha), color(color1.b, color1.g,color1.r, alpha), color(color1.r, color1.b,color1.g, alpha))--下横
			else
				render.blur(vector(x+1,y), vector(x+horizontal-1,y+portrait),1, color1.a/255,radius+1)
				render.rect(vector(x+1,y), vector(x+horizontal-1,y+portrait), color(0, 0, 0, color1.a*(Script.Menu_UI.visual_panel.bg_alpha:get()/255)),radius+1)
				render.gradient(vector(x+radius,y), vector(x+(horizontal-radius)/2,y+thick), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, alpha))--上横
				render.gradient(vector(x+(horizontal-radius)/2,y), vector(x+horizontal-radius,y+thick), color(color1.r, color1.g,color1.b, alpha), color(color2.r, color2.g,color2.b, alpha), color(color1.r, color1.g,color1.b, alpha), color(color2.r, color2.g,color2.b, alpha))--上横
				render.circle_outline(vector(x+radius,y+radius),color(color1.r, color1.g,color1.b, alpha), radius,180,0.25,thick)--左上角圆
				render.circle_outline(vector(x+horizontal-radius,y+radius),color(color2.r, color2.g,color2.b, alpha), radius,270,0.25,thick)--右上角圆
				render.gradient(vector(x,y+radius), vector(x+thick,y+(portrait-radius)), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, alpha), color(color2.r, color2.g,color2.b, alpha) , color(color2.r, color2.g,color2.b, alpha))--左丨
				render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+(portrait-radius)), color(color2.r, color2.g,color2.b, alpha) , color(color2.r, color2.g,color2.b, alpha), color(color1.r, color1.g,color1.b, alpha) , color(color1.r, color1.g,color1.b, alpha))--右丨
				render.circle_outline(vector(x+radius,y+(portrait-radius)),color(color2.r, color2.g,color2.b, alpha), radius,90,0.25,thick)--左下角圆
				render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)),color(color1.r, color1.g,color1.b, alpha), radius,0,0.25,thick)--右下角圆
				render.gradient(vector(x+radius,y+radius+(portrait-radius)-thick), vector(x+(horizontal-radius),y+radius+(portrait-radius)),color(color2.r, color2.g,color2.b,alpha), color(color1.r, color1.g,color1.b, alpha), color(color2.r, color2.g,color2.b, alpha), color(color1.r, color1.g,color1.b, alpha))--下横
			end
		end
	end,
	Rendeweaponbox = function(x,y,color1,color2,horizontal,portrait,thick,radian,font,size,text,color_mode,is_toalpha,is_text)
		--local yaw = 1==thick and -0.1 or 0.2
		local cac_font = Script.API.CreateFont(font,size)
		local rgb_color = Script.API.GetColorRGB(15/100,1)
		local font_size = render.measure_text(cac_font,"",text)
		local radius = radian--math.ceil(horizontal*radian)--0.0625/0.1
		local alpha = is_toalpha == true and color1.a or 255
		color2.a = is_toalpha and color1.a or color2.a
		if color_mode == 2 then
			render.blur(vector(x+1,y), vector(x+horizontal-1,y+portrait),1, alpha,radius)
			render.rect(vector(x+1,y), vector(x+horizontal-1,y+portrait), color(0, 0, 0, (Script.Menu_UI.visual_panel.bg_alpha:get())),radius)
			--render.blur(vector(x+1,y), vector(x+horizontal-1,y+portrait),color(1.0, 1,1, alpha),radius+1)
			render.gradient(vector(x+radius,y), vector(x+radius+horizontal/2-font_size.x/2,y+thick), color(color1.r, color1.g,color1.b, alpha), color(color1.b, color1.r,color1.g, 0), color(color1.r, color1.g,color1.b, alpha), color(color1.b, color1.r,color1.g, 0))--上横
			Script.API.RenderGradientText(x+(horizontal)/2-font_size.x/2, y-font_size.y/2, color(rgb_color.r, rgb_color.g, rgb_color.b, alpha),color(rgb_color.g, rgb_color.b, rgb_color.r, alpha),size,cac_font,text,false,false,true)
			render.gradient(vector(x+radius+horizontal/2+font_size.x/2-10,y), vector(x+horizontal-radius,y+thick), color(color1.b, color1.r,color1.g, 0), color(color1.g, color1.b,color1.r, alpha), color(color1.b, color1.r,color1.g, 0), color(color1.g, color1.b,color1.r, alpha))--上横
			render.circle_outline(vector(x+radius,y+radius),color(color1.r, color1.g,color1.b, alpha), radius,180,0.25,thick)--左上角圆
			render.circle_outline(vector(x+horizontal-radius,y+radius),color(color1.g, color1.b,color1.r, alpha), radius,270,0.25,thick)--右上角圆
			render.gradient(vector(x,y+radius), vector(x+thick,y+(portrait-radius)), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, alpha), color(color1.g, color1.r,color1.b, alpha*0.5) , color(color1.g, color1.r,color1.b, alpha*0.5))--左丨
			render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+(portrait-radius)), color(color1.g, color1.b,color1.r, alpha) , color(color1.g, color1.b,color1.r, alpha), color(color1.r, color1.b,color1.g, alpha*0.5) , color(color1.r, color1.b,color1.g, alpha*0.5))--右丨
			render.circle_outline(vector(x+radius,y+(portrait-radius)),color(color1.g, color1.r,color1.b, alpha*0.5), radius,90,0.25,thick)--左下角圆
			render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)),color(color1.r, color1.b,color1.g, alpha*0.5), radius,0,0.25,thick)--右下角圆
			render.gradient(vector(x+radius,y+radius+(portrait-radius)-thick), vector(x+(horizontal-radius)/2,y+radius+(portrait-radius)),  color(color1.g, color1.r,color1.b, alpha*0.5), color(color1.b, color1.g,color1.r, alpha*0.5), color(color1.g, color1.r,color1.b, alpha*0.5), color(color1.b, color1.g,color1.r, alpha*0.5))--下横
			render.gradient(vector(x+(horizontal-radius)/2,y+radius+(portrait-radius)-thick), vector(x+horizontal-radius,y+radius+(portrait-radius)),  color(color1.b, color1.g,color1.r, alpha*0.5), color(color1.r, color1.b,color1.g, alpha*0.5), color(color1.b, color1.g,color1.r, alpha*0.5), color(color1.r, color1.b,color1.g, alpha*0.5))--下横
		else
			render.blur(vector(x+1,y), vector(x+horizontal-1,y+portrait),1, alpha,radius)
			render.rect(vector(x+1,y), vector(x+horizontal-1,y+portrait), color(0, 0, 0, (Script.Menu_UI.visual_panel.bg_alpha:get())),radius)
			--render.blur(vector(x+1,y), vector(x+horizontal-1,y+portrait),color(1.0, 1,1, alpha),radius+1)
			render.gradient(vector(x+radius,y), vector(x+radius+horizontal/2-font_size.x/2,y+thick), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, 0), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, 0))--上横
			Script.API.RenderGradientText(x+(horizontal)/2-font_size.x/2, y-font_size.y/2, color(color1.r, color1.g, color1.b, alpha),color(color2.r, color2.g, color2.b, alpha),size,cac_font,text,false,false,true)
			render.gradient(vector(x+radius+horizontal/2+font_size.x/2-10,y), vector(x+horizontal-radius,y+thick), color(color1.r, color1.g,color1.b, 0), color(color2.r, color2.g,color2.b, alpha), color(color1.r, color1.g,color1.b, 0), color(color2.r, color2.g,color2.b, alpha))--上横
			render.circle_outline(vector(x+radius,y+radius),color(color1.r, color1.g,color1.b, alpha), radius,180,0.25,thick)--左上角圆
			render.circle_outline(vector(x+horizontal-radius,y+radius),color(color2.r, color2.g,color2.b, alpha), radius,270,0.25,thick)--右上角圆
			render.gradient(vector(x,y+radius), vector(x+thick,y+(portrait-radius)), color(color1.r, color1.g,color1.b, alpha), color(color1.r, color1.g,color1.b, alpha), color(color2.r, color2.g,color2.b, alpha*0.5) , color(color2.r, color2.g,color2.b, alpha*0.5))--左丨
			render.gradient(vector(x+horizontal-thick,y+radius), vector(x+horizontal,y+(portrait-radius)), color(color2.r, color2.g,color2.b, alpha) , color(color2.r, color2.g,color2.b, alpha), color(color1.r, color1.g,color1.b, alpha*0.5) , color(color1.r, color1.g,color1.b, alpha*0.5))--右丨
			render.circle_outline(vector(x+radius,y+(portrait-radius)),color(color2.r, color2.g,color2.b, alpha*0.5), radius,90,0.25,thick)--左下角圆
			render.circle_outline(vector(x+horizontal-radius,y+(portrait-radius)),color(color1.r, color1.g,color1.b, alpha*0.5), radius,0,0.25,thick)--右下角圆
			render.gradient(vector(x+radius,y+radius+(portrait-radius)-thick), vector(x+(horizontal-radius),y+radius+(portrait-radius)),color(color2.r, color2.g,color2.b,alpha*0.5), color(color1.r, color1.g,color1.b, alpha*0.5), color(color2.r, color2.g,color2.b, alpha*0.5), color(color1.r, color1.g,color1.b, alpha*0.5))--下横
		end
	end,

	update_choke_data = function()
		local choked = globals.choked_commands
		Script.choke_max = math.max(Script.choke_max, choked)
		if (globals.tickcount % 16 == 0) then
			table.insert(Script.choke_history,1,Script.choke_max)
			Script.choke_max = 0
			if (#Script.choke_history > 4) then
				table.remove(Script.choke_history)
			end
		end
	end,

	Base64 = {
        encode = function (source_str)
            local s64 = ""
            local str = source_str
            local b64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
            while #str > 0 do
                local buf = 0
                local bytes_num = 0
                for byte_cnt = 1,3 do
                    buf = (buf * 256)
                    if #str > 0 then
                        buf = buf + string.byte(str, 1, 1)
                        str = string.sub(str, 2)
                        bytes_num = bytes_num + 1
                    end
                end
        
                for group_cnt = 1, (bytes_num + 1) do
                    local b64char = math.fmod(math.floor(buf / 262144), 64) + 1
                    s64 = s64 .. string.sub(b64chars, b64char, b64char)
                    buf = buf * 64
                end
        
                for fill_cnt = 1, (3 - bytes_num) do
                    s64 = s64 .. "="
                end
            end
        
            return s64
        end,
        
        decode = function(str64)
            local temp = {}
            local b64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
            for i = 1, 64 do
                temp[string.sub(b64chars, i, i)] = i
            end

            local str = ""
            temp["="] = 0
            for i = 1, #str64, 4 do
                if i > #str64 then
                    break
                end

                local data = 0
                local str_count=0
                for j = 0, 3 do
                    local str1 = string.sub(str64, i + j, i + j)
                    if not temp[str1] then
                        return
                    end

                    if temp[str1] < 1 then
                        data = data * 64
                    else
                        data = data * 64 + temp[str1] - 1
                        str_count = str_count + 1
                    end
                end

                for j = 16, 0, - 8 do
                    if str_count > 0 then
                        str=str .. string.char(math.floor(data / math.pow(2, j)))
                        data = math.fmod(data, math.pow(2, j))
                        str_count = str_count - 1
                    end
                end
            end
        
            local last = tonumber(string.byte(str, string.len(str), string.len(str)))
            if last == 0 then
                str = string.sub(str, 1, string.len(str) - 1)
            end

            return str
        end,
    },
	-- Base64 = (function()
	-- 	local base64_extract = function(flag, from, width)
	-- 		return bit.band(bit.rshift(flag, from), bit.lshift(1, width) - 1)
	-- 	end

	-- 	local base64_makeencoder = function(alphabet)
	-- 		local decoder = {}
	-- 		local encoder = {}
	-- 		for i = 1, 65 do
	-- 			local chr = string.byte(string.sub(alphabet, i, i)) or 32
	-- 			if decoder[chr] ~= nil then
	-- 				error(("[%s]Invalid alphabet: duplicate character: %s"):format("Nightmare.lua", tostring(chr)), 3)
	-- 			end

	-- 			encoder[i - 1] = chr
	-- 			decoder[chr] = i - 1
	-- 		end

	-- 		return encoder, decoder
	-- 	end

	-- 	return {
	-- 		encode = function(str)
	-- 			local cache = {}
	-- 			local cache_encode, encode_index, string_length = {}, 1, #str
	-- 			local encoders = {base64_makeencoder("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=")}
	-- 			local encoder = encoders[1]
	-- 			local lastn = string_length % 3
	-- 			for i = 1, string_length - lastn, 3 do
	-- 				local byte_1, byte_2, byte_3 = string.byte(str, i, i + 2)
	-- 				local bytes = byte_1 * 0x10000 + byte_2 * 0x100 + byte_3
	-- 				local cache_string = cache[bytes]
	-- 				if not cache_string then
	-- 					cache_string = string.char(encoder[base64_extract(bytes, 18, 6)], encoder[base64_extract(bytes, 12, 6)], encoder[base64_extract(bytes, 6, 6)], encoder[base64_extract(bytes, 0, 6)])
	-- 					cache[bytes] = cache_string
	-- 				end

	-- 				cache_encode[encode_index] = cache_string
	-- 				encode_index = encode_index + 1
	-- 			end

	-- 			if lastn == 2 then
	-- 				local bype_1, bype_2 = string.byte(str, string_length - 1, string_length)
	-- 				local string_bytes = bype_1 * 0x10000 + bype_2 * 0x100
	-- 				cache_encode[encode_index] = string.char(encoder[base64_extract(string_bytes, 18, 6)], encoder[base64_extract(string_bytes, 12, 6)], encoder[base64_extract(string_bytes, 6, 6)], encoder[64])
	-- 			elseif lastn == 1 then
	-- 				local string_bytes = string.byte(str, string_length) * 0x10000
	-- 				cache_encode[encode_index] = string.char(encoder[base64_extract(string_bytes, 18, 6)], encoder[base64_extract(string_bytes, 12, 6)], encoder[64], encoder[64])
	-- 			end

	-- 			return table.concat(cache_encode)
	-- 		end,

	-- 		decode = function(base64)
	-- 			local decoders = {base64_makeencoder("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=")}
	-- 			local decoder = decoders[2]
	-- 			local pattern = "[^%w%+%/%=]"
	-- 			if decoder then
	-- 				local base62, base63
	-- 				for charcode, b64code in pairs(decoder) do
	-- 					if b64code == 62 then
	-- 						base62 = charcode
	-- 					elseif b64code == 63 then
	-- 						base63 = charcode
	-- 					end
	-- 				end

	-- 				pattern = string.format("[^%%w%%%s%%%s%%=]", string.char(base62), string.char(base63))
	-- 			end

	-- 			local cache = {}
	-- 			local cache_decode, decode_index = {}, 1
	-- 			local b64 = string.gsub(tostring(base64), pattern, "")
	-- 			local base64_length = #b64
	-- 			local padding = string.sub(b64, - 2) == "==" and 2 or string.sub(b64, - 1) == "=" and 1 or 0
	-- 			for i = 1, padding > 0 and base64_length - 4 or base64_length, 4 do
	-- 				local byte_1, byte_2, byte_3, byte_4 = string.byte(b64, i, i + 3)
	-- 				local bytes = byte_1 * 0x1000000 + byte_2 * 0x10000 + byte_3 * 0x100 + byte_4
	-- 				local string_cache = cache[bytes]
	-- 				if not string_cache then
	-- 					local bytes = decoder[byte_1] * 0x40000 + decoder[byte_2] * 0x1000 + decoder[byte_3] * 0x40 + decoder[byte_4]
	-- 					string_cache = string.char(base64_extract(bytes, 16, 8), base64_extract(bytes, 8, 8), base64_extract(bytes, 0, 8))
	-- 					cache[bytes] = string_cache
	-- 				end

	-- 				cache_decode[decode_index] = string_cache
	-- 				decode_index = decode_index + 1
	-- 			end

	-- 			if padding == 1 then
	-- 				local byte_1, byte_2, byte_3 = string.byte(b64, base64_length - 3, base64_length - 1)
	-- 				local bytes = decoder[byte_1] * 0x40000 + decoder[byte_2] * 0x1000 + decoder[byte_3] * 0x40
	-- 				cache_decode[decode_index] = string.char(base64_extract(bytes, 16, 8), base64_extract(bytes, 8, 8))
	-- 			elseif padding == 2 then
	-- 				local byte_1, byte_2 = string.byte(b64, base64_length - 3, base64_length - 2)
	-- 				local bytes = decoder[byte_1] * 0x40000 + decoder[byte_2] * 0x1000
	-- 				cache_decode[decode_index] = string.char(base64_extract(bytes, 16, 8))
	-- 			end

	-- 			return table.concat(cache_decode)
	-- 		end
	-- 	}
	-- end)(),

	SurfaceLibrary = (function()
		local font_cache = {}
		local bit = require "bit"
		local surface_library = {}
		local new_intptr = ffi.typeof("int[1]")
		local new_charbuffer = ffi.typeof("char[?]")
		local new_widebuffer = ffi.typeof("wchar_t[?]")
		local vmt_entry = function(instance, index, type)
			return ffi.cast(type, (ffi.cast("void***", instance)[0])[index])
		end

		local surface_func_bind = function(module, interface, index, typestring)
			local success, typeof = pcall(ffi.typeof, typestring)
			local instance = utils.create_interface(module, interface) or error(("[%s]Invalid surface interface"):format(script.script_name))
			if not success then
				error(("[%s]vmt surface error: %s"):format(script.script_name, typeof), 2)
			end

			local fnptr = vmt_entry(instance, index, typeof) or error(("[%s]invalid surface vtable"):format(script.script_name))
			return function(...)
				return fnptr(instance, ...)
			end
		end

		local native_Localize_FindSafe = surface_func_bind("localize.dll", "Localize_001", 12, "wchar_t*(__thiscall*)(void*, const char*)")
		local native_Localize_ConvertAnsiToUnicode = surface_func_bind("localize.dll", "Localize_001", 15, "int(__thiscall*)(void*, const char*, wchar_t*, int)")
		local native_Localize_ConvertUnicodeToAnsi = surface_func_bind("localize.dll", "Localize_001", 16, "int(__thiscall*)(void*, wchar_t*, char*, int)")
		local native_Surface_DrawSetColor = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 15, "void(__thiscall*)(void*, int, int, int, int)")
		local native_Surface_DrawFilledRect = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 16, "void(__thiscall*)(void*, int, int, int, int)")
		local native_Surface_DrawOutlinedRect = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 18, "void(__thiscall*)(void*, int, int, int, int)")
		local native_Surface_DrawLine = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 19, "void(__thiscall*)(void*, int, int, int, int)")
		local native_Surface_DrawPolyLine = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 20, "void(__thiscall*)(void*, int*, int*, int)")
		local native_Surface_DrawSetTextFont = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 23, "void(__thiscall*)(void*, unsigned long)")
		local native_Surface_DrawSetTextColor = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 25, "void(__thiscall*)(void*, int, int, int, int)")
		local native_Surface_DrawSetTextPos = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 26, "void(__thiscall*)(void*, int, int)")
		local native_Surface_DrawPrintText = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 28, "void(__thiscall*)(void*, const wchar_t*, int, int)")
		local native_Surface_DrawGetTextureId = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 34, "int(__thiscall*)(void*, const char*)")
		local native_Surface_DrawGetTextureFile = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 35, "bool(__thiscall*)(void*, int, char*, int)")
		local native_Surface_DrawSetTextureFile = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 36, "void(__thiscall*)(void*, int, const char*, int, bool)")
		local native_Surface_DrawSetTextureRGBA = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 37, "void(__thiscall*)(void*, int, const wchar_t*, int, int)")
		local native_Surface_DrawSetTexture = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 38, "void(__thiscall*)(void*, int)")
		local native_Surface_DeleteTextureByID = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 39, "void(__thiscall*)(void*, int)")
		local native_Surface_DrawGetTextureSize 	= surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 40, "void(__thiscall*)(void*, int, int&, int&)")
		local native_Surface_DrawTexturedRect = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 41, "void(__thiscall*)(void*, int, int, int, int)")
		local native_Surface_IsTextureIDValid = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 42, "bool(__thiscall*)(void*, int)")
		local native_Surface_CreateNewTextureID = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 43, "int(__thiscall*)(void*, bool)")
		local native_Surface_UnlockCursor = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 66, "void(__thiscall*)(void*)")
		local native_Surface_LockCursor = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 67, "void(__thiscall*)(void*)")
		local native_Surface_CreateFont = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 71, "unsigned int(__thiscall*)(void*)")
		local native_Surface_SetFontGlyph = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 72, "void(__thiscall*)(void*, unsigned long, const char*, int, int, int, int, unsigned long, int, int)")
		local native_Surface_GetTextSize = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 79, "void(__thiscall*)(void*, unsigned long, const wchar_t*, int&, int&)")
		local native_Surface_GetCursorPos = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 100, "unsigned int(__thiscall*)(void*, int*, int*)")
		local native_Surface_SetCursorPos = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 101, "unsigned int(__thiscall*)(void*, int, int)")
		local native_Surface_DrawOutlinedCircle = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 103, "void(__thiscall*)(void*, int, int, int, int)")
		local native_Surface_DrawFilledRectFade = surface_func_bind("vguimatsurface.dll", "VGUI_Surface031", 123, "void(__thiscall*)(void*, int, int, int, int, unsigned int, unsigned int, bool)")
		local function check_null_value(datas)
			for idx, data in pairs(datas) do
				if data == nil then
					return false
				end
			end

			return true
		end

		local function draw_print_text(text, localized)
			if localized then
				local cb_size = 1024
				local char_buffer = new_charbuffer(cb_size)
				native_Localize_ConvertUnicodeToAnsi(text, char_buffer, cb_size)
				local test = ffi.string(char_buffer)
				return native_Surface_DrawPrintText(text, test:len(), 0)
			else
				local wb_size = 1024
				local wide_buffer = new_widebuffer(wb_size)
				native_Localize_ConvertAnsiToUnicode(text, wide_buffer, wb_size)
				return native_Surface_DrawPrintText(wide_buffer, text:len(), 0)
			end
		end

		local function get_text_size(font, text)
			local h_ptr = new_intptr()
			local w_ptr = new_intptr()
			local wide_buffer = new_widebuffer(1024)
			native_Localize_ConvertAnsiToUnicode(text, wide_buffer, 1024)
			native_Surface_GetTextSize(font, wide_buffer, w_ptr, h_ptr)
			local w = tonumber(w_ptr[0])
			local h = tonumber(h_ptr[0])
			return w, h
		end

		surface_library.create_font = function(windows_font_name, tall, weight, flags)
			local flags_i = 0
			local t = type(flags)
			if t == "number" then
				flags_i = flags
			elseif t == "table" then
				for i = 1, #flags do
					flags_i = flags_i + flags[i]
				end
			else
				error("invalid flags type, has to be number or table")
			end

			local cache_key = ("%s%s%s"):format(windows_font_name, tall, weight)
			if font_cache[cache_key] == nil then
				font_cache[cache_key] = native_Surface_CreateFont()
				native_Surface_SetFontGlyph(font_cache[cache_key], windows_font_name, tall, weight, 0, 0, bit.bor(flags_i), 0, 0)
			end

			return font_cache[cache_key]
		end

		surface_library.localize_string = function(str, buf_size)
			local res = native_Localize_FindSafe(str)
			local charbuffer = new_charbuffer(buf_size or 1024)
			native_Localize_ConvertUnicodeToAnsi(res, charbuffer, buf_size or 1024)
			return charbuffer and ffi.string(charbuffer) or nil
		end

		surface_library.draw_text = function(x, y, r, g, b, a, font, text, outline)
			if not check_null_value({x, y, r, g, b, a, font, text}) then
				return
			end

			if outline then
				native_Surface_DrawSetTextPos(x - 1, y)
				native_Surface_DrawSetTextFont(font)
				native_Surface_DrawSetTextColor(0, 0, 0, a)
				draw_print_text(text, false)
				native_Surface_DrawSetTextPos(x + 1, y)
				native_Surface_DrawSetTextFont(font)
				native_Surface_DrawSetTextColor(0, 0, 0, a)
				draw_print_text(text, false)
				native_Surface_DrawSetTextPos(x, y - 1)
				native_Surface_DrawSetTextFont(font)
				native_Surface_DrawSetTextColor(0, 0, 0, a)
				draw_print_text(text, false)
				native_Surface_DrawSetTextPos(x, y + 1)
				native_Surface_DrawSetTextFont(font)
				native_Surface_DrawSetTextColor(0, 0, 0, a)
				draw_print_text(text, false)
				native_Surface_DrawSetTextPos(x, y)
				native_Surface_DrawSetTextFont(font)
				native_Surface_DrawSetTextColor(r, g, b, a)
				return draw_print_text(text, false)
			else
				native_Surface_DrawSetTextPos(x, y)
				native_Surface_DrawSetTextFont(font)
				native_Surface_DrawSetTextColor(r, g, b, a)
				return draw_print_text(text, false)
			end
		end

		surface_library.draw_localized_text = function(x, y, r, g, b, a, font, text)
			if not check_null_value({x, y, r, g, b, a, font, text}) then
				return
			end

			native_Surface_DrawSetTextPos(x, y)
			native_Surface_DrawSetTextFont(font)
			native_Surface_DrawSetTextColor(r, g, b, a)
			local localized_string = native_Localize_FindSafe(text)
			return draw_print_text(localized_string, true)
		end

		surface_library.draw_line = function(x0, y0, x1, y1, r, g, b, a)
			if not check_null_value({x0, y0, x1, y1, r, g, b, a}) then
				return
			end

			native_Surface_DrawSetColor(r, g, b, a)
			return native_Surface_DrawLine(x0, y0, x1, y1)
		end

		surface_library.draw_filled_rect = function(x, y, w, h, r, g, b, a)
			if not check_null_value({x, y, w, h, r, g, b, a}) then
				return
			end

			native_Surface_DrawSetColor(r, g, b, a)
			return native_Surface_DrawFilledRect(x, y, x + w, y + h)
		end

		surface_library.draw_outlined_rect = function(x, y, w, h, r, g, b, a)
			if not check_null_value({x, y, w, h, r, g, b, a}) then
				return
			end

			native_Surface_DrawSetColor(r, g, b, a)
			return native_Surface_DrawOutlinedRect(x, y, x + w, y + h)
		end

		surface_library.draw_filled_outlined_rect = function(x, y, w, h, r0, g0, b0, a0, r1, g1, b1, a1)
			if not check_null_value({x, y, w, h, r0, g0, b0, a0, r1, g1, b1, a1}) then
				return
			end

			native_Surface_DrawSetColor(r0, g0, b0, a0)
			native_Surface_DrawFilledRect(x, y, x + w, y + h)
			native_Surface_DrawSetColor(r1, g1, b1, a1)
			return native_Surface_DrawOutlinedRect(x, y, x + w, y + h)
		end

		surface_library.draw_filled_gradient_rect = function(x, y, w, h, r0, g0, b0, a0, r1, g1, b1, a1, horizontal)
			if not check_null_value({x, y, w, h, r0, g0, b0, a0, r1, g1, b1, a1, horizontal}) then
				return
			end

			native_Surface_DrawSetColor(r0, g0, b0, a0)
			native_Surface_DrawFilledRectFade(x, y, x + w, y + h, 255, 255, horizontal)
			native_Surface_DrawSetColor(r1, g1, b1, a1)
			return native_Surface_DrawFilledRectFade(x, y, x + w, y + h, 0, 255, horizontal)
		end

		surface_library.draw_outlined_circle = function(x, y, r, g, b, a, radius, segments)
			if not check_null_value({x, y, r, g, b, a, radius, segments}) then
				return
			end

			native_Surface_DrawSetColor(r, g, b, a)
			return native_Surface_DrawOutlinedCircle(x, y, radius, segments)
		end

		surface_library.draw_poly_line = function(x, y, r, g, b, a, count)
			if not check_null_value({x, y, r, g, b, a, count}) then
				return
			end

			native_Surface_DrawSetColor(r, g, b, a)
			return native_Surface_DrawPolyLine(new_intptr(x), new_intptr(y), count)
		end

		surface_library.test_font = function(x, y, r, g, b, a, font)
			if not check_null_value({x, y, r, g, b, a, font}) then
				return
			end

			local _, height_offset = get_text_size(font, "a b c d e f g h i j k l m n o p q r s t u v w x y z")
			surface_library.draw_text(x, y, r, g, b, a, font, "a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 ß + # ä ö ü , . -", false)
			surface_library.draw_text(x, y + height_offset, r, g, b, a,  font, "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z = ! \" § $ % & / ( ) = ? { [ ] } \\ * ' _ : ; ~ ", false)
		end

		surface_library.get_text_size = function(font, text)
			if not check_null_value({font, text}) then
				return 0, 0
			end

			return get_text_size(font, text)
		end

		surface_library.set_mouse_pos = function(x, y)
			if not check_null_value({x, y}) then
				return
			end

			return native_Surface_SetCursorPos(x, y)
		end

		surface_library.get_mouse_pos = function()
			local x_ptr = new_intptr()
			local y_ptr = new_intptr()
			native_Surface_GetCursorPos(x_ptr, y_ptr)
			local x = tonumber(x_ptr[0])
			local y = tonumber(y_ptr[0])
			return x, y
		end

		surface_library.unlock_cursor = function()
			return native_Surface_UnlockCursor()
		end

		surface_library.lock_cursor = function()
			return native_Surface_LockCursor()
		end

		surface_library.load_texture_rgba = function(contact, w, h)
			if not check_null_value({contact, w, h}) then
				return
			end

			local texture = native_Surface_CreateNewTextureID(false)
			native_Surface_DrawSetTextureRGBA(texture, contact, w, h)
			return texture, w, h
		end

		surface_library.load_texture = function(filename)
			if not check_null_value({filename}) then
				return
			end

			local texture = native_Surface_CreateNewTextureID(false)
			native_Surface_DrawSetTextureFile(texture, filename, true, true)
			local wide_ptr = new_intptr()
			local tall_ptr = new_intptr()
			native_Surface_DrawGetTextureSize(texture, wide_ptr, tall_ptr)
			local w = tonumber(wide_ptr[0])
			local h = tonumber(tall_ptr[0])
			return texture, w, h
		end

		surface_library.font_flags_list = {
			["FONTFLAG_NONE"] = 0x000,
			["FONTFLAG_ITALIC"]  = 0x001,
			["FONTFLAG_BITMAP"] = 0x800,
			["FONTFLAG_ROTARY"] = 0x040,
			["FONTFLAG_SYMBOL"] = 0x008,
			["FONTFLAG_OUTLINE"] = 0x200,
			["FONTFLAG_CUSTOM"] = 0x400,
			["FONTFLAG_ADDITIVE"] = 0x100,
			["FONTFLAG_ANTIALIAS"] = 0x010,
			["FONTFLAG_STRIKEOUT"] = 0x004,
			["FONTFLAG_UNDERLINE"] = 0x002,
			["FONTFLAG_DROPSHADOW"] = 0x080,
			["FONTFLAG_GAUSSIANBLUR"] = 0x020,
		}

		surface_library.finder_font_flags = function(flags)
			for flags, bits in pairs(surface_library.font_flags_list) do
				if tostring(flags):upper():find(flags:upper()) then
					return bits
				end
			end

			return surface_library.font_flags_list["FONTFLAG_NONE"]
		end

		surface_library.renderer_gradient_text = function(x, y, r, g, b, a, r_2, g_2, b_2, a_2, font, text, center, outline)
			local surface_width_offset = 0
			local surface_height_offset = 0
			local center = type(center) ~= "boolean" and false or center
			local function get_gradient_text_color(clr_1, clr_2, text)
				local function color_to_normalzied(clr)
					return {
						r = math.floor(clr.r * 255),
						a = math.floor(clr.a * 255),
						b = math.floor(clr.b * 255),
						g = math.floor(clr.g * 255)
					}
				end

				local color_gradient = {
					color_to_normalzied(clr_1),
					color_to_normalzied(clr_2)
				}

				local output_colors = {}
				local length = #text - 1
				local faded_r = (color_gradient[2].r - color_gradient[1].r) / length
				local faded_g = (color_gradient[2].g - color_gradient[1].g) / length
				local faded_b = (color_gradient[2].b - color_gradient[1].b) / length
				local faded_a = (color_gradient[2].a - color_gradient[1].a) / length
				for i = 1, length + 1 do
					color_gradient[1].r = color_gradient[1].r + faded_r
					color_gradient[1].a = color_gradient[1].a + faded_a
					color_gradient[1].g = color_gradient[1].g + faded_g
					color_gradient[1].b = color_gradient[1].b + faded_b
					output_colors[i] = {math.max(math.floor(color_gradient[1].r), 0), math.max(math.floor(color_gradient[1].g), 0), math.max(math.floor(color_gradient[1].b), 0), math.max(math.floor(color_gradient[1].a), 0)}
				end

				return output_colors
			end

			local text_process_width, text_process_height = surface_library.get_text_size(font, text)
			local colors = get_gradient_text_color(Color.RGBA(r, g, b, a), Color.RGBA(r_2, g_2, b_2, a_2), text)
			for idx = 1, text:len() do
				local text_width, text_height = surface_library.get_text_size(font, text:sub(idx, idx))
				surface_library.draw_text(x + surface_width_offset - (center and (text_process_width / 2) or 0), y - (center and (text_process_height / 2) or 0), colors[idx][1], colors[idx][2], colors[idx][3], colors[idx][4], font, text:sub(idx, idx), outline)
				surface_width_offset = surface_width_offset + text_width
				surface_height_offset = surface_height_offset + text_height
			end
		end

		setmetatable(surface_library, {
			__index = renderer
		})

		return surface_library
	end)(),

	CreateSurfaceFont = function(name, offset, width, flags)
		local cache_key = ("%s %s %s %s"):format(name, offset, width, table.concat(flags))
		if not Script.surface_fonts[cache_key] then
			Script.surface_fonts[cache_key] = Script.API.SurfaceLibrary.create_font(name, offset, width, flags)
		end

		return Script.surface_fonts[cache_key]
	end,

	StaticBodyYaw = function(bodyyaw, fakeyaw)
		if bodyyaw > fakeyaw and bodyyaw > 0 then
			ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Left Limit"):set(math.min(fakeyaw, 60))
			ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Right Limit"):set(math.min(fakeyaw, 60))
			--AntiAim.OverrideLimit(math.min(fakeyaw, 60))
			Script.ref.AntiAim.inverter:set(false)
		elseif bodyyaw < fakeyaw and bodyyaw > 0 then
			ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Left Limit"):set(math.min(bodyyaw, 60))
			ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Right Limit"):set(math.min(bodyyaw, 60))
			--AntiAim.OverrideLimit(math.min(bodyyaw, 60))
			Script.ref.AntiAim.inverter:set(false)
		elseif math.abs(bodyyaw) > fakeyaw and bodyyaw < 0 then
			ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Left Limit"):set(math.min(fakeyaw, 60))
			ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Right Limit"):set(math.min(fakeyaw, 60))
			--AntiAim.OverrideLimit(math.min(fakeyaw, 60))
			Script.ref.AntiAim.inverter:set(true)
		elseif math.abs(bodyyaw) < fakeyaw and bodyyaw < 0 then
			ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Left Limit"):set(math.min(math.abs(bodyyaw), 60))
			ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Right Limit"):set(math.min(math.abs(bodyyaw), 60))
			--AntiAim.OverrideLimit(math.min(math.abs(bodyyaw), 60))
			Script.ref.AntiAim.inverter:set(true)
		end
	end,

	JitterBodyYaw = function(randomseed, maximum, bodyyaw)
		local cached_bodyyaw = {}
		if bodyyaw == - 180 then
			cached_bodyyaw[1] = 0.0
		else
			if bodyyaw ~= 0 then
				if bodyyaw == 180 then
					cached_bodyyaw[0] = 0.0
					cached_bodyyaw[1] = maximum
				else
					math.randomseed(bodyyaw)
					cached_bodyyaw[0] = math.random(- maximum, maximum)
					cached_bodyyaw[1] = math.random(- maximum, maximum)
				end

				return cached_bodyyaw[randomseed % 2]
			end

			cached_bodyyaw[1] = maximum
		end

		cached_bodyyaw[0] = - maximum
		return cached_bodyyaw[randomseed % 2]
	end,

	AntiAimbotBodyYaw = function(fakeyaw, bodyyaw)
		local make_bodyyaw = Script.API.JitterBodyYaw(Script.randomseed, 60, bodyyaw)
		Script.ref.AntiAim.inverter:set(make_bodyyaw < 0)
		ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Left Limit"):set(math.min(math.abs(make_bodyyaw), fakeyaw))
		ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Right Limit"):set(math.min(math.abs(make_bodyyaw), fakeyaw))
		--AntiAim.OverrideLimit(math.min(math.abs(make_bodyyaw), fakeyaw))
	end,

	BodyYawJitter = function(bodyyaw, fakeyaw) 
		if globals.choked_commands == 1 then
			Script.randomseed = Script.randomseed + 1
		end

		Script.API.AntiAimbotBodyYaw(fakeyaw, bodyyaw)
	end,

	GetLocalCurrentWeapon = function()
		local local_player = entity.get_local_player()
		if not local_player or not local_player:is_alive() then
			return 1
		end

		local m_active_weapon = local_player:get_player_weapon()
		if m_active_weapon == nil then
			return 1
		end

		local active_weapon = 1
		local item_active_index = m_active_weapon.m_iItemDefinitionIndex
		if item_active_index == 9 then
			active_weapon = 2
		elseif item_active_index == 40 then
			active_weapon = 3
		elseif item_active_index == 11 or item_active_index == 38 then
			active_weapon = 4
		elseif item_active_index == 64 then
			active_weapon = 5
		elseif item_active_index == 1 then
			active_weapon = 6
		elseif item_active_index == 2 then
			active_weapon = 7
		elseif item_active_index == 7 then
			active_weapon = 8
		elseif item_active_index == 16 then
			active_weapon = 9
		elseif item_active_index == 34 then
			active_weapon = 10
		elseif item_active_index == 61 or item_active_index == 4 or item_active_index == 36 or item_active_index == 30 or item_active_index == 32 or item_active_index == 3 or item_active_index == 63 then
			active_weapon = 11
		elseif item_active_index == 39 or item_active_index == 8 or item_active_index == 60 or item_active_index == 10 or item_active_index == 13 then
			active_weapon = 12
		elseif item_active_index == 17 or item_active_index == 26 or item_active_index == 24 or item_active_index == 33 or item_active_index == 19 or item_active_index == 23 then
			active_weapon = 13
		elseif item_active_index == 25 or item_active_index == 27 or item_active_index == 14 or item_active_index == 28 or item_active_index == 29 or item_active_index == 35 then
			active_weapon = 14
		elseif item_active_index == 31 then
			active_weapon = 15
		else
			active_weapon = 1
		end

		return active_weapon
	end,

	SurfaceRenderHelpers = {
		renderer_gradient_text = function(x, y, r, g, b, a, r_2, g_2, b_2, a_2, font, text, center, outline)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.renderer_gradient_text(x, y, r, g, b, a, r_2, g_2, b_2, a_2, font, text, center, outline)
			end)
		end,

		finder_font_flags = function(flags)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.finder_font_flags(flags)
			end)
		end,

		load_texture = function(filename)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.load_texture(filename)
			end)
		end,

		load_texture_rgba = function(contact, w, h)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.load_texture_rgba(contact, w, h)
			end)
		end,

		set_mouse_pos = function(x, y)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.set_mouse_pos(x, y)
			end)
		end,

		get_text_size = function(font, text)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.get_text_size(font, text)
			end)
		end,

		test_font = function(x, y, r, g, b, a, font)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.test_font(x, y, r, g, b, a, font)
			end)
		end,

		draw_poly_line = function(x, y, r, g, b, a, count)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.draw_poly_line(x, y, r, g, b, a, count)
			end)
		end,

		draw_outlined_circle = function(x, y, r, g, b, a, radius, segments)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.draw_outlined_circle(x, y, r, g, b, a, radius, segments)
			end)
		end,

		draw_filled_gradient_rect = function(x, y, w, h, r0, g0, b0, a0, r1, g1, b1, a1, horizontal)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.draw_filled_gradient_rect(x, y, w, h, r0, g0, b0, a0, r1, g1, b1, a1, horizontal)
			end)
		end,

		draw_filled_outlined_rect = function(x, y, w, h, r0, g0, b0, a0, r1, g1, b1, a1)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.draw_filled_outlined_rect(x, y, w, h, r0, g0, b0, a0, r1, g1, b1, a1)
			end)
		end,

		draw_outlined_rect = function(x, y, w, h, r, g, b, a)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.draw_outlined_rect(x, y, w, h, r, g, b, a)
			end)
		end,

		draw_filled_rect = function(x, y, w, h, r, g, b, a)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.draw_filled_rect(x, y, w, h, r, g, b, a)
			end)
		end,

		draw_line = function(x0, y0, x1, y1, r, g, b, a)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.draw_line(x0, y0, x1, y1, r, g, b, a)
			end)
		end,

		draw_localized_text = function(x, y, r, g, b, a, font, text)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.draw_localized_text(x, y, r, g, b, a, font, text)
			end)
		end,

		draw_text = function(x, y, r, g, b, a, font, text, outline)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.draw_text(x, y, r, g, b, a, font, text, outline)
			end)
		end,

		localize_string = function(str, buf_size)
			table.insert(Script.surface_function, function()
				Script.API.SurfaceLibrary.localize_string(str, buf_size)
			end)
		end
	}
}

Script.API.CreatePath("nl\\saint-priset")
Script.API.CreatePath("nl\\saint-priset\\configs")
Script.API.CreatePath("nl\\saint-priset\\fonts")
Script.API.CreatePath("Essential fonts")
Script.ffi_helpers.CreateNewConfig(Script.configs.default_config)
-- 菜单用表
Script.Menu_table = {
	Control_Panel = {
		menu = {"Off", "Ragebot", "Visuals", "Misc"},
	},

	visual_panel = {
		watermark_select = {"Off", "Original", "Solus v1", "Solus v2"},
		time_Select = {"24-hour clock","12-hour clock"},
		color_mode = {"Solid","Gradient","Rainbow"},
		ind_color_mode = {"Custom","Alternative"},
		--world
		font_select = {"Verdana","Pixeled"},
		hitmk_mode = {"Static","Float"},
		droptop_mode = {"+","x","Circle"},
		--weapon
		line_mode = {"Solid","Gradient"},
		dmg_pos = {"Top left", "Top right", "Bottom left", "Bottom right"},
		Prefix_style = {"Priest","Icon"},
		visualization_mode = {"Default","Pure text"}
	}
}
local color_control = nil
local color_control_2 = nil
if Script.icon_data.tabsty == nil then
	color_control = nil
else
	color_control = Script.icon_data.tabclr1
end
if Script.icon_data.titlesty == nil then
	color_control_2 = nil
else
	color_control_2 = Script.icon_data.titleclr1
end
local home_page = ui.create(Script.API.menu_icon("info-circle","  Home",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control),Script.API.menu_icon("user-astronaut","  Control Panel",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local info_page = ui.create(Script.API.menu_icon("info-circle","  Home",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control),Script.API.menu_icon("comment-dots","  Newest info",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local visual_page = ui.create(Script.API.menu_icon("adjust","  Visuals",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control),Script.API.menu_icon("palette","  Main Visuals",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local visual_world = ui.create(Script.API.menu_icon("adjust","  Visuals",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control),Script.API.menu_icon("globe-americas","  World Visuals",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local aavis_world = ui.create(Script.API.menu_icon("adjust","  Visuals",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control),Script.API.menu_icon("eye","  Anti-Aim visuals",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local wepvis_world = ui.create(Script.API.menu_icon("adjust","  Visuals",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control),Script.API.menu_icon("skull","  Weapon visuals",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local anti_aimpage = ui.create(Script.API.menu_icon("user-secret","  Anti-Aim",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control), Script.API.menu_icon("users-cog","  Anti-aimbot angles",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))--user-secret
local lag_page = ui.create(Script.API.menu_icon("redo","  Fake Lag",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control), Script.API.menu_icon("history","  Advanced-fakelag",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local misc_page = ui.create(Script.API.menu_icon("code","  Misc",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control), Script.API.menu_icon("crosshairs","  Ragebot Logs",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local warn_page = ui.create(Script.API.menu_icon("code","  Misc",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control), Script.API.menu_icon("exclamation-triangle","  Warnings",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local exploits_page = ui.create(Script.API.menu_icon("code","  Misc",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control), Script.API.menu_icon("wheelchair","  Extended exploits",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local other_page = ui.create(Script.API.menu_icon("code","  Misc",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control), Script.API.menu_icon("forward","  Others",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local bloom_page = ui.create(Script.API.menu_icon("code","  Misc",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control), Script.API.menu_icon("lightbulb","  Bloom",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local config_page = ui.create(Script.API.menu_icon("cog","  Config",Script.icon_data.iconclr or nil,Script.icon_data.tabclr or nil, color_control), Script.API.menu_icon("star","  Main",Script.icon_data.iconclr or nil,Script.icon_data.titleclr or nil,color_control_2))
local menu_img = nil
local side_bar_t = Script.API.GetGradientSidebar(color(200,5,199,255),color(91,155,249,255),"Saint-Priest")
ui.sidebar(side_bar_t,"meteor")
if Script.API.File_exists("Essential fonts\\5151.gif") then
	menu_img = render.load_image_from_file("Essential fonts\\5151.gif",vector(640,360))
end
-- 菜单
Script.Menu_UI = {
    --create tab
	Control_Panel = {
		Log = {
			Script.API.File_exists("Essential fonts\\5151.gif") and home_page:texture(menu_img,vector(380,200)),
			Main = home_page:label(Script.API.menu_icon("code-branch"," - "..Script.About.name.." \n")),
			Main2 = home_page:label(" - Version "..Script.About.version),
			Main3 = home_page:label(" - for "..Script.About.neverlose_version),
			Main5 = home_page:label("Good luck! "..Script.username.."\n "),
		},
		fold_color = home_page:switch(Script.API.menu_icon(nil,"Fold colorpicker",nil,Script.icon_data.subclr or nil), false),
		icon_color = home_page:color_picker("Menu icon color" ,color(255, 255, 255, 255)),
		tab_colorsty = home_page:combo("Tab style", Script.Menu_table.visual_panel.line_mode, 0),
		tab_color1 = home_page:color_picker("Tab color 1" ,color(255, 255, 255, 255)),
		tab_color2 = home_page:color_picker("Tab color 2" ,color(255, 255, 255, 255)),
		title_colorsty = home_page:combo("Title style", Script.Menu_table.visual_panel.line_mode, 0),
		title_color1 = home_page:color_picker("Title color 1" ,color(255, 255, 255, 255)),
		title_color2 = home_page:color_picker("Title color 2" ,color(255, 255, 255, 255)),
		subtitle_color = home_page:color_picker("Subtitle color" ,color(255, 255, 255, 255)),
		drag_color = home_page:color_picker(Script.API.menu_icon(nil,"Dragable box color",nil,Script.icon_data.subclr or nil) ,color(255, 255, 255, 255)),
		but_web = home_page:button('Official web', function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL('http://nightmare.plus/')
		end),
		group_web = home_page:button('Join QQ group', function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL('https://jq.qq.com/?_wv=1027&k=L1RePz0T')
		end),
		font_web = home_page:button('Get font file', function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL('https://wwc.lanzoul.com/b0l4kiib')
		end),
		bili_web = home_page:button('Bilibili Channel', function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL('https://space.bilibili.com/1241439738')
		end),
		--Selectmenu = Menu.Combo("Home","Control Panel", "Select menu", Script.Menu_table.Control_Panel.menu, 0, "hey, It's just a menu, you don't think there's an easter eggs, do you? .w.")
	},

	info_Panel = {
		main_info = info_page:label("\aFFFFFFFF".." Version 3.1.5 update logs :".." \n"),
		main_info1 = info_page:label("- Updated all render functions".." \n"),
		main_info2 = info_page:label("- Added animation effects to Weaponbox".." \n"),
		main_info3 = info_page:label("- Added custom fonts".." \n"),
		main_info4 = info_page:label("- Added custom menu colors".." \n"),
		main_info5 = info_page:label("- Added Lua information".." \n"),
		main_info6 = info_page:label("- Added Manual AA Indicator".." \n"),
		main_info7 = info_page:label("- Adjusted the spacing of the text AA indicator".." \n"),
		main_info8 = info_page:label("- Added Solid and Gradient to the custom menu".." \n"),
		main_info9 = info_page:label("- Fixed some Anti-Aim bugs and improved AA logic".." \n"),
		main_info10 = info_page:label("- Reworked Speed warning".." \n"),
	},

	visual_panel = {--Display Mode
		watermark_Select = visual_page:combo(Script.API.menu_icon(nil,"Watermark",nil,Script.icon_data.subclr or nil), Script.Menu_table.visual_panel.watermark_select, 0),
		color_theme = visual_page:combo("Color mode", Script.Menu_table.visual_panel.color_mode, 0),
		font_type = visual_page:combo("Custom font", {"Verdana", "Tahoma"}, 0),
		coloredit1 = visual_page:color_picker("Color 1" ,color(255, 255, 255, 255)),
		coloredit2 = visual_page:color_picker("Color 2" ,color(255, 255, 255, 255)),
		rgb_Select = visual_page:combo("RGB style", {"Defalut","Complex"}, 0),
		time_Select = visual_page:combo("Time style", Script.Menu_table.visual_panel.time_Select, 0),
		bg_alpha = visual_page:slider("Background alpha", 0, 180,180, "Background alpha."),
		clr_color = visual_page:color_picker("Circle Color" ,color(255, 255, 255, 255)),
		windows_slect = visual_page:selectable(Script.API.menu_icon(nil,"Window Indicators",nil,Script.icon_data.subclr or nil) ,{"Keybinds", "Spectators list"}, 0, "Window Indicators."),
		binds_x = visual_page:slider("Keybinds x", 0, Script.screen_size.x,Script.screen_size.x/2-50, "Keybinds x."),
		binds_y = visual_page:slider("Keybinds y", 0, Script.screen_size.y,Script.screen_size.y/2, "Keybinds y."),
		spec_x = visual_page:slider("Spectator list x", 0, Script.screen_size.x,Script.screen_size.x/2+50, "Spectator list x."),
		spec_y = visual_page:slider("Spectator list y", 0, Script.screen_size.y,Script.screen_size.y/2, "Spectator list y."),
		wepbox_ind = visual_page:switch(Script.API.menu_icon(nil,"Weapon box",nil,Script.icon_data.subclr or nil), false),
		info_x = visual_page:slider("Weapon box x", 0, Script.screen_size.x,100, "Weapon box x."),
		info_y = visual_page:slider("Weapon box y", 0, Script.screen_size.y,100, "Weapon box y."),
		lua_info = visual_page:switch(Script.API.menu_icon(nil,"Lua info", nil, Script.icon_data.subclr or nil), false),
		lua_x = visual_page:slider("Info x", 0, Script.screen_size.x, 100),
		lua_y = visual_page:slider("Info y", 0, Script.screen_size.y, 100),
		--world
		hit_marker = visual_world:switch(Script.API.menu_icon(nil,"Hit marker",nil,Script.icon_data.subclr or nil), false),
		font_Select = visual_world:combo("Font", Script.Menu_table.visual_panel.font_select, 0),
		hit_type = visual_world:combo("Marker type", Script.Menu_table.visual_panel.hitmk_mode, 0),
		anim_time = visual_world:slider("Animation time", 1, 4,1, "Hitmark animation time."),
		hitmk_size = visual_world:slider("Font size", 14, 26,14, "Hitmark font size."),
		hit_mkcolor = visual_world:color_picker("Hit color" ,color(255, 255, 255, 255)),
		kill_efct = visual_world:switch(Script.API.menu_icon(nil,"Kill effect",nil,Script.icon_data.subclr or nil), false),
		efct_color1 = visual_world:color_picker("Effect color" ,color(255, 255, 255, 255)),
		scr_efct = visual_world:switch(Script.API.menu_icon(nil,"Screen effect",nil,Script.icon_data.subclr or nil), false),
		scr_efctcolor1 = visual_world:color_picker("Screen effect color" ,color(255, 255, 255, 255)),
		kill_announcer = visual_world:switch(Script.API.menu_icon(nil,"Kill announcer",nil,Script.icon_data.subclr or nil), false),
		announcer_color = visual_world:color_picker("Announcer color" ,color(255, 255, 255, 255)),
		bullet_tracer = visual_world:switch(Script.API.menu_icon(nil,"Simple bullet tracer",nil,Script.icon_data.subclr or nil), false),
		is_onlydrop = visual_world:switch("Only drop point", false),
		tracer_color = visual_world:color_picker("tracer color" ,color(255, 255, 255, 255)),
		droptop_select = visual_world:combo("Drop Point type", Script.Menu_table.visual_panel.droptop_mode, 0),
		foot_trail = visual_world:switch(Script.API.menu_icon(nil,"Foot trail",nil,Script.icon_data.subclr or nil), false),
		trailclr_select = visual_world:combo("Trail color mode", Script.Menu_table.visual_panel.ind_color_mode, 0),
		trail_color = visual_world:color_picker("Trail color" ,color(255, 255, 255, 255)),
		trail_size = visual_world:slider("Trail size", 6, 12,6, "Foot trail size."),
		--Anti-Aim ind
		aa_ind = aavis_world:switch(Script.API.menu_icon(nil,"Anti-Aim indicator",nil,Script.icon_data.subclr or nil), false),
		aa_style = aavis_world:combo("Inicator style", {"Modern","Pure text"}, 0),
		aa_staindcolor = aavis_world:color_picker("State color" ,color(255, 255, 255, 255)),
		aa_styindcolor = aavis_world:color_picker("Style color" ,color(255, 255, 255, 255)),
		aa_textind = aavis_world:switch("Text F/R indicator", false),
		aa_textindcolor = aavis_world:color_picker("Defalut color" ,color(255, 255, 255, 255)),
		arrow_ind = aavis_world:switch("Arrow display", false),
		arrow_style = aavis_world:combo("Arrow style", {"Fake/Real","Manual AA"}, 0),
		arrow_ad = aavis_world:slider("Arrow adjustment", 0, 140,0, "Arrow distance adjustment."),
		arrow_color = aavis_world:color_picker("Arrow color" ,color(255, 255, 255, 255)),
		aa_indmode = aavis_world:combo("AA Color style", Script.Menu_table.visual_panel.ind_color_mode, 0),
		aa_indcolor = aavis_world:color_picker("Fake color" ,color(255, 255, 255, 255)),
		aa_indcolor1 = aavis_world:color_picker("Real color" ,color(255, 255, 255, 255)),
		--weapon ind
		dmg_ind = wepvis_world:switch(Script.API.menu_icon(nil,"Damage indicator",nil,Script.icon_data.subclr or nil), false),
		dmg_mode = wepvis_world:combo("Damage indicator position", Script.Menu_table.visual_panel.dmg_pos, 0),
		scope_ind = wepvis_world:switch(Script.API.menu_icon(nil,"Custom scope line",nil,Script.icon_data.subclr or nil), false),
		line_mode = wepvis_world:combo("Line color mode", Script.Menu_table.visual_panel.line_mode, 0),
		line_dismode = wepvis_world:combo("Line display mode", {"Defalut","Reverse"}, 0),
		line_color1 = wepvis_world:color_picker("Line color 1" ,color(255, 255, 255, 255)),
		line_color2 = wepvis_world:color_picker("Line color 2" ,color(255, 255, 255, 255)),
		line_thick = wepvis_world:slider("Thickness", 1, 2,1),
		line_off = wepvis_world:slider("Offset length", 0, 50,0),
		line_l = wepvis_world:slider("Line length", 0, Script.screen_size.y/2,50),
		line_anim = wepvis_world:slider("Anim speed", 3, 12,3),
	},


	antiaim = (function()
		local control_element = {
			main_enable = anti_aimpage:switch(Script.API.menu_icon(nil,"Enabled anti-aimbot",nil,Script.icon_data.subclr or nil), false),
			desync_preset = anti_aimpage:combo("Desync control types", {"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"}, 0),
			anti_brute = anti_aimpage:combo("Anti brute-force", {"Off", "On-miss", "On-hit", "All"}, 0),
			switcher_side = anti_aimpage:combo("Switcher custom aa", {"Manual", "Freestanding", "R-Freestanding", "Jitter"}, 0),
			switcher_key = anti_aimpage:switch("Manual switcher custom side", false),
			custom_player_side = anti_aimpage:combo("Custom player side", {"Left", "Right"}, 0),
			custom_player_state = anti_aimpage:combo("Custom player state", Script.player_state, 0),
			manual_left_hotkey = anti_aimpage:hotkey("Manual-left hotkey", 90),
			manual_right_hotkey = anti_aimpage:hotkey("Manual-right hotkey", 67),
			manual_back_hotkey = anti_aimpage:hotkey("Manual-back hotkey", 88),
			manual_state = anti_aimpage:slider("Manual state", 0, 3,0, ""),
			avoid_backstab = anti_aimpage:switch("Avoid backstab", false),
			lby_fix = anti_aimpage:switch("LBY Breaker", false),
		}

		control_element.custom = {}
		for i, side in pairs({"L", "R"}) do
			if control_element.custom[i] == nil then
				control_element.custom[i] = {}
			end

			for idx, ptr in pairs(Script.player_state) do
				control_element.custom[i][idx] = {
					enable = anti_aimpage:switch(("[%s]%s[Override Global]"):format(side, ptr), false),
					pitch = anti_aimpage:combo(("[%s]%s Pitch"):format(side, ptr), {"Disabled", "Down", "Fake down", "Fake up"}, 0),
					yaw_base = anti_aimpage:combo(("[%s]%s Yaw base"):format(side, ptr), {"Disabled", "Backward", "Static"}, 0),
					yaw_slider = anti_aimpage:slider(("[%s]%s Yaw add"):format(side, ptr),  - 180, 180, 0),
					yaw_jitter = anti_aimpage:combo(("[%s]%s Yaw jitter"):format(side, ptr), {"Disabled", "Center", "Offset", "Random", "Spin"}, 0),
					jitter_slider = anti_aimpage:slider(("[%s]%s Jitter degree"):format(side, ptr),  - 180, 180, 0),
					body_yaw = anti_aimpage:combo(("[%s]%s Body yaw"):format(side, ptr), {"Static", "Jitter"}, 0),
					body_yaw_slider = anti_aimpage:slider(("[%s]%s Body yaw add"):format(side, ptr),  - 180, 180, 90),
					fake_type = anti_aimpage:combo(("[%s]%s Fake yaw limit types"):format(side, ptr), {"Off", "Random", "Jitter", "Switcher ticking", "Update", "Rotation"}, 0),
					fake_slider = anti_aimpage:slider(("[%s]%s Fake yaw limit"):format(side, ptr), 0, 60, 60),
					fake_slider_ex = anti_aimpage:slider(("[%s]%s Fake yaw limit ext"):format(side, ptr), 0, 60, 60),
					fake_options =anti_aimpage:selectable(("[%s]%s Fake options"):format(side, ptr), {"Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"}, 0),
					lby_mode = anti_aimpage:combo(("[%s]%s Lby mode"):format(side, ptr), {"Disabled", "Opposite", "Sway"}, 0),
					freestanding = anti_aimpage:combo(("[%s]%s Freestanding body yaw"):format(side, ptr), {"Off", "Peek Fake", "Peek Real"}, 0),
					desync_onshot = anti_aimpage:combo(("[%s]%s Desync on shot"):format(side, ptr), {"Defalut", "Opposite", "Freestanding", "Switch"}, 0),
					roll_slider = anti_aimpage:slider(("[%s]%s Roll degree"):format(side, ptr), - 180, 180, 0)
				}

				if idx == 1 then
					control_element.custom[i][idx].enable:set(true)
				end
			end
		end

		return control_element
	end)(),

	misc = {
		hit_log = misc_page:switch(Script.API.menu_icon(nil,"Hit&Miss log",nil,Script.icon_data.subclr or nil), false),
		hit_color = misc_page:color_picker("Hitlog color" ,color(255, 255, 255, 255)),
		mis_color = misc_page:color_picker("Misslog color" ,color(255, 255, 255, 255)),
		hitlg_dismode = misc_page:selectable("Display mode", {"Console","Chat","Visualization"}, 0),
		vis_dismode = misc_page:combo("Visualization mode", Script.Menu_table.visual_panel.visualization_mode, 0),
		back_alpha = misc_page:slider("Background alpha", 0, 255,180),
		prefix_mode = misc_page:combo("Prefix style", Script.Menu_table.visual_panel.Prefix_style, 0),
		anim_mode = misc_page:combo("Animation style", {"Vertical","Horizontal"}, 0),
        --warnings
		zeus_warn = warn_page:switch(Script.API.menu_icon(nil,"Zeus Warning",nil,Script.icon_data.subclr or nil), false),
		speed_warn = warn_page:switch(Script.API.menu_icon(nil,"Speed Warning",nil,Script.icon_data.subclr or nil), false),--274, 160
		speed_x = warn_page:slider("Speed Warning x", 0, Script.screen_size.x,274),
		speed_y = warn_page:slider("Speed Warning y", 0, Script.screen_size.y,112),
        --Extended exploits
		extended_backtrack = exploits_page:switch(Script.API.menu_icon(nil,"Extended Backtrack",nil,Script.icon_data.subclr or nil), false),
		extended_backtrack_limit = exploits_page:slider("Backtrack Limit", 0.0,1000.0,1),
		animation_breaker = exploits_page:selectable(Script.API.menu_icon(nil,"Animation breakers",nil,Script.icon_data.subclr or nil), {"Reserved leg", "Ground 0 pitch", "Static leg in jump"}, 0),
        --Others
		custom_slowwalk = other_page:switch(Script.API.menu_icon(nil,"Custom Slowwalk",nil,Script.icon_data.subclr or nil), false),--274, 160
		min_speed = other_page:slider("Min speed", 0, 100,0),
		max_speed = other_page:slider("Max speed", 0, 100,0),
		animation_tag = other_page:switch(Script.API.menu_icon(nil,"Dynamic clantag",nil,Script.icon_data.subclr or nil), false),
		talk_on_kill = other_page:switch(Script.API.menu_icon(nil,"Custom talk on kill",nil,Script.icon_data.subclr or nil), false),
		textbox = other_page:input("Talk text", "1"),
		jump_fix = other_page:switch(Script.API.menu_icon(nil,"Jumpshots fix",nil,Script.icon_data.subclr or nil), false),
        --Bloom
		bloom_set = bloom_page:switch(Script.API.menu_icon(nil,"Enable",nil,Script.icon_data.subclr or nil), false),
		world_exposure = bloom_page:slider("World exposure", 0.0, 100.0, 0.0),
		model_ambient = bloom_page:slider("Model ambient", 0.0, 100.0, 0.0),
		bloom_scale = bloom_page:slider("Bloom scale", 0.0, 100.0, 0.0),
		--Aspect Ratio
		aspect_ratio = bloom_page:slider("Aspect Ratio", 0.0, 50.0, 0.0),
	},

	config = {
		current_config = config_page:combo("Current localtion configs", Script.ffi_helpers.GetPathFiles("nl\\saint-priset\\configs\\", ".ini"), 0),
		save_config = config_page:button("Save current config"),
		load_config = config_page:button("Load current config"),
		delete_config = config_page:button("Delete current config"),
		update_config = config_page:button("Update current localtion config list"),
		create_config_name = config_page:input("Create new config name", "New Config"),
		create_config = config_page:button("Create new config"),
		export_clipboard = config_page:button("Export to clipboard"),
		import_clipboard = config_page:button("Import from clipboard"),
		--c_config_author = config_page:label(("Current config author: %s"):format(Script.username)),
		--c_config_time = config_page:label(("Time to create config: %s"):format("1"))
	}
}

local function GetConfigPackages()
	local self = Script
	local ConfigPackageDatas = {--Script.configs.last_load_config_time
		--["author"] = {self.configs.config_author , (self.configs.config_author == Script.username) and common.get_date("%m/%d/%Y") or Script.configs.last_load_config_time},
		--Main clr
		["Fold color"] = self.Menu_UI.Control_Panel.fold_color,
		["Icon color"] = self.Menu_UI.Control_Panel.icon_color,
		["Tab color style"] = self.Menu_UI.Control_Panel.tab_colorsty,
		["Tab color 1"] = self.Menu_UI.Control_Panel.tab_color1,
		["Tab color 2"] = self.Menu_UI.Control_Panel.tab_color2,
		["Title color style"] = self.Menu_UI.Control_Panel.title_colorsty,
		["Title color 1"] = self.Menu_UI.Control_Panel.title_color1,
		["Title color 2"] = self.Menu_UI.Control_Panel.title_color2,
		["Subtitle color"] = self.Menu_UI.Control_Panel.subtitle_color,
		["Visual dragclr"] = self.Menu_UI.Control_Panel.drag_color,
		["Visual main"] = self.Menu_UI.visual_panel.Main,
		["Visual watermark select"] = self.Menu_UI.visual_panel.watermark_Select,
		["Visual color theme"] = self.Menu_UI.visual_panel.color_theme,
		["Visual custom font"] = self.Menu_UI.visual_panel.font_type,
		["Visual panel color 1"] = self.Menu_UI.visual_panel.coloredit1,
		["Visual panel color 2"] = self.Menu_UI.visual_panel.coloredit2,
		["Visual rgb select"] = self.Menu_UI.visual_panel.rgb_Select,
		["Visual panel time select"] = self.Menu_UI.visual_panel.time_Select,
		["Visual panel background alpha"] = self.Menu_UI.visual_panel.bg_alpha,
		["Visual panel Circle clr"] = self.Menu_UI.visual_panel.clr_color,
		["Visual panel windows"] = self.Menu_UI.visual_panel.windows_slect,
		["Visual panel binds x"] = self.Menu_UI.visual_panel.binds_x,
		["Visual panel binds y"] = self.Menu_UI.visual_panel.binds_y,
		["Visual panel spec x"] = self.Menu_UI.visual_panel.spec_x,
		["Visual panel spec y"] = self.Menu_UI.visual_panel.spec_y,
		["Visual panel wep info"] = self.Menu_UI.visual_panel.wepbox_ind,
		["Visual panel info x"] = self.Menu_UI.visual_panel.info_x,
		["Visual panel info y"] = self.Menu_UI.visual_panel.info_y,
		["Visual panel lua info"] = self.Menu_UI.visual_panel.lua_info,
		["Visual panel lua x"] = self.Menu_UI.visual_panel.lua_x,
		["Visual panel lua y"] = self.Menu_UI.visual_panel.lua_y,
		["Visual panel hitmark"] = self.Menu_UI.visual_panel.hit_marker,
		["Visual panel font select"] = self.Menu_UI.visual_panel.font_Select,
		["Visual panel hit type"] = self.Menu_UI.visual_panel.hit_type,
		["Visual panel anim time"] = self.Menu_UI.visual_panel.anim_time,
		["Visual panel hitmark size"] = self.Menu_UI.visual_panel.hitmk_size,
		["Visual panel hitmark color"] = self.Menu_UI.visual_panel.hit_mkcolor,
		["Visual panel kill effect"] = self.Menu_UI.visual_panel.kill_efct,
		["Visual panel kill effect color 1"] = self.Menu_UI.visual_panel.efct_color1,
		["Visual panel screen effect"] = self.Menu_UI.visual_panel.scr_efct,
		["Visual panel screen effect color 1"] = self.Menu_UI.visual_panel.scr_efctcolor1,
		["Visual panel kill announcer"] = self.Menu_UI.visual_panel.kill_announcer,
		["Visual panel kill announcer color"] = self.Menu_UI.visual_panel.announcer_color,
		["Visual panel bullet tracer"] = self.Menu_UI.visual_panel.bullet_tracer,
		["Visual panel bullet tracer color"] = self.Menu_UI.visual_panel.tracer_color,
		["Visual panel drop select"] = self.Menu_UI.visual_panel.droptop_select,
		["Visual panel foot trail"] = self.Menu_UI.visual_panel.foot_trail,
		["Visual panel foot trail select"] = self.Menu_UI.visual_panel.trailclr_select,
		["Visual panel foot trail color"] = self.Menu_UI.visual_panel.trail_color,
		["Visual panel foot trail size"] = self.Menu_UI.visual_panel.trail_size,
		["Visual panel aa ind"] = self.Menu_UI.visual_panel.aa_ind,
		["Visual panel ind style"] = self.Menu_UI.visual_panel.aa_style,
		["Visual panel state clr"] = self.Menu_UI.visual_panel.aa_staindcolor,
		["Visual panel style clr"] = self.Menu_UI.visual_panel.aa_styindcolor,
		["Visual panel text ind"] = self.Menu_UI.visual_panel.aa_textind,
		["Visual panel text ind clr"] = self.Menu_UI.visual_panel.aa_textindcolor,
		["Visual panel arrows ind"] = self.Menu_UI.visual_panel.arrow_ind,
		["Visual panel arrows style"] = self.Menu_UI.visual_panel.arrow_style,
		["Visual panel arrows ind adjust"] = self.Menu_UI.visual_panel.arrow_ad,
		["Visual panel arrows ind color"] = self.Menu_UI.visual_panel.arrow_color,
		["Visual panel aa ind mode"] = self.Menu_UI.visual_panel.aa_indmode,
		["Visual panel aa ind color"] = self.Menu_UI.visual_panel.aa_indcolor,
		["Visual panel aa ind color1"] = self.Menu_UI.visual_panel.aa_indcolor1,
		["Dmg ind"] = self.Menu_UI.visual_panel.dmg_ind,
		["Dmg pos"] = self.Menu_UI.visual_panel.dmg_mode,
		["Scope line"] = self.Menu_UI.visual_panel.scope_ind,
		["Scope mode"] = self.Menu_UI.visual_panel.line_mode,
		["Scope dis mode"] = self.Menu_UI.visual_panel.line_dismode,
		["Scope color 1"] = self.Menu_UI.visual_panel.line_color1,
		["Scope color 2"] = self.Menu_UI.visual_panel.line_color2,
		["Scope thick"] = self.Menu_UI.visual_panel.line_thick,
		["Scope offset"] = self.Menu_UI.visual_panel.line_off,
		["Scope length"] = self.Menu_UI.visual_panel.line_l,
		["Scope speed"] = self.Menu_UI.visual_panel.line_anim,
		["Hit log"] = self.Menu_UI.misc.hit_log,
		["Hit color"] = self.Menu_UI.misc.hit_color,
		["Miss color"] = self.Menu_UI.misc.mis_color,
		["Hitlog dism"] = self.Menu_UI.misc.hitlg_dismode,
		["Hitlog prefix"] = self.Menu_UI.misc.prefix_mode,
		["Hitlog bgalpha"] = self.Menu_UI.misc.back_alpha,
		["Hitlog vismode"] = self.Menu_UI.misc.vis_dismode,
		["Hitlog lerppos"] = self.Menu_UI.misc.anim_mode,
		["Zeus warn"] = self.Menu_UI.misc.zeus_warn,
		["Speed warn"] = self.Menu_UI.misc.speed_warn,
		["Speed warnx"] = self.Menu_UI.misc.speed_x,
		["Speed warny"] = self.Menu_UI.misc.speed_y,
		-- ["extended_dt"] = self.Menu_UI.misc.extended_dt,
		-- ["rapid_fire"] = self.Menu_UI.misc.rapid_fire,
		-- ["tolerance_extended"] = self.Menu_UI.misc.tolerance_extended,
		-- ["recharge_types"] = self.Menu_UI.misc.recharge_types,
		["Animation breakers"] = self.Menu_UI.misc.animation_breaker,
		["Custom Slowwalk"] = self.Menu_UI.misc.custom_slowwalk,
		["Slowwalk minsp"] = self.Menu_UI.misc.min_speed,
		["Slowwalk maxsp"] = self.Menu_UI.misc.max_speed,
		["Clantag"] = self.Menu_UI.misc.animation_tag,
		["Trash talk"] = self.Menu_UI.misc.talk_on_kill,
		["Talk text"] = self.Menu_UI.misc.textbox,
		["Jump fix"] = self.Menu_UI.misc.jump_fix,
		["Bloom"] = self.Menu_UI.misc.bloom_set,
		["Bloom world"] = self.Menu_UI.misc.world_exposure,
		["Bloom model"] = self.Menu_UI.misc.model_ambient,
		["Bloom scale"] = self.Menu_UI.misc.bloom_scale,
		["Ext Backtrack"] = self.Menu_UI.misc.extended_backtrack,
		["Ext Backtrack Limit"] = self.Menu_UI.misc.extended_backtrack_limit,
	}


	for key, element in pairs(self.Menu_UI.antiaim) do
		if key == "custom" then
			for idx, data in pairs(element) do
				for i, handles in pairs(data) do
					for keys, menu in pairs(handles) do
						ConfigPackageDatas[("Antiaim element: %s %s %s"):format(idx, i, keys)] = menu
					end
				end
			end
		else
			ConfigPackageDatas[("Antiaim element: %s"):format(key)] = element
		end
	end

	-- for key, element in pairs(self.Menu_UI.ragebot) do
	-- 	if key == "custom" then
	-- 		for idx, data in pairs(element) do
	-- 			for i, handle in pairs(data) do
	-- 				ConfigPackageDatas[("Ragebot element: %s %s %s"):format(key, idx, i)] = handle
	-- 			end
	-- 		end
	-- 	else
	-- 		ConfigPackageDatas[("Ragebot element: %s"):format(key)] = element
	-- 	end
	-- end

	return ConfigPackageDatas
end

local function GetConfigDatas()
	local CachedConfigs = {}
	local ConfigPackage = GetConfigPackages()
	local return_string = ""
	for key, data in pairs(ConfigPackage) do
		-- if key == "author" then
		-- 	CachedConfigs[key] = data
		-- else
			local data_ind = data:get()
			if type(data_ind) == "userdata" then
				local color = data:get()
				CachedConfigs[key] = {color.r, color.g, color.b, color.a}
			elseif type(data_ind) == "table" then
				if #data_ind == 0 then
					goto skip
				else
					CachedConfigs[key] = data:get()
				end
			else
				CachedConfigs[key] = data:get()
			end
			::skip::
			-- end
		--end
	end

	-- for key, data in pairs(CachedConfigs) do
	-- 	if type(CachedConfigs[key]) == "table" then
	-- 		for i,k in CachedConfigs[key] do
	-- 			return_string = return_string..tostring(CachedConfigs[key][i])
	-- 		end
	-- 	else
	-- 		return_string = return_string..tostring(CachedConfigs[key])
	-- 	end
	-- end
	-- return return_string
	-- return json.stringify(CachedConfigs)
	return Script.API.Base64.encode(Script.API.Json.encode(CachedConfigs))
end

local function MainConfigSystem()
	if ui.get_alpha() == 1 and Script.configs.update_configs then
		local m_config_list = Script.ffi_helpers.GetPathFiles("nl\\saint-priset\\configs\\", ".ini")
		Script.Menu_UI.config.current_config:update(m_config_list)
		Script.configs.current_configs = m_config_list
		for idx, name in pairs(m_config_list) do
			if name == ("%s.ini"):format(config_name) then
				Script.Menu_UI.config.current_config:set(idx)
			end
		end

		Script.configs.update_configs = false
	elseif not ui.get_alpha() == 1 then
		Script.configs.update_configs = true
	end

	local current_config = Script.configs.current_configs[Script.API.getMemuindex(Script.ffi_helpers.GetPathFiles("nl\\saint-priset\\configs\\", ".ini"),Script.Menu_UI.config.current_config:get())]
	if Script.configs.create then
		Script.configs.update_configs = true
		Script.ffi_helpers.CreateNewConfig(Script.Menu_UI.config.create_config_name:get())
		Script.configs.create = false
	end

	if Script.configs.delete then
		Script.configs.update_configs = true
		Script.ffi_helpers.FileSystem_remove(("%s%s%s"):format(Script.API.GetCSGOPath(), "nl\\saint-priset\\configs\\", current_config), "GAME")
		Script.ffi_helpers.ClientColorLog(color(0, 255, 0, 255), ("[%s]删除参数: %s 成功\n"):format(Script.About.name, current_config))
		--Cheat.AddNotify(("[%s]Delete Config"):format(Script.About.name), ("[%s]Delete config: %s success\n"):format(Script.About.name, current_config))
		Script.Handle_Main()
		Script.configs.delete = false
	end

	if Script.configs.export then
		--files.write(string.sub(common.get_game_directory(), 0, - 5).."nl\\saint-priest\\configs\\"..current_config,GetConfigDatas())
		Script.ffi_helpers.SaveConfig(current_config, GetConfigDatas())
		Script.ffi_helpers.ClientColorLog(color(0, 255, 0, 255), ("[%s]保存参数: %s 成功\n"):format(Script.About.name, current_config))
		--Cheat.AddNotify(("[%s]Save Config"):format(Script.About.name), ("[%s]Save config: %s success\n"):format(Script.About.name, current_config))
		Script.Handle_Main()
		Script.configs.export = false
	end

	if Script.configs.export_clipboard then
		Script.ffi_helpers.SetClipboardText(GetConfigDatas())
		Script.ffi_helpers.ClientColorLog(color(0, 255, 0, 255), ("[%s]导出参数: %s 成功\n"):format(Script.About.name, current_config))
		--Cheat.AddNotify(("[%s]Export Config"):format(Script.About.name), ("[%s]Export config: %s success\n"):format(Script.About.name, current_config))
		Script.Handle_Main()
		Script.configs.export_clipboard = false
	end

	if Script.configs.import then
		local config_data = Script.ffi_helpers.GetFileData(current_config)
		if config_data ~= nil and config_data:len() > 0 then
			local ConfigPackage = GetConfigPackages()
			assert(Script.API.Base64.decode(config_data) ~= nil, ("[%s]加载参数: %s 失败, 请检查你的参数是否正确\n"):format(Script.About.name, current_config))
			local CurrentConfigPackage = Script.API.Json.decode(Script.API.Base64.decode(config_data))
			for key, data in pairs(ConfigPackage) do
				local config = CurrentConfigPackage[key]
				if config == nil or data:get_type() == "hotkey" then
					goto skip
				end
				local data_ind = data:get()
				if type(data_ind) == "table" then
					data:set(config)
				elseif type(data_ind) == "userdata" then
					data:set(color(config[1],config[2],config[3],config[4]))
				else
					data:set(config)
				end
				-- if key == "author" then
				-- 	Script.configs.config_author = config[1]
				-- 	Script.configs.last_load_config_time = config[2]
				-- else
					-- local data_ind = data:get()
					-- if config ~= nil then
					-- 	if type(data_ind) == "table" then
					-- 		if type(data_ind[1]) == "number" then
					-- 			data:set(color(unpack(config)))
					-- 		else
					-- 			data:set(config)
					-- 		end
					-- 	else
					-- 	end
					-- end
				--end
				::skip::
			end
			-- if Script.Menu_UI.config.c_config_author and Script.Menu_UI.config.c_config_time then
			-- 	Script.Menu_UI.config.c_config_author:destroy()
			-- 	Script.Menu_UI.config.c_config_time:destroy()
			-- end
			-- if Script.new_author ~= 0 then
			-- 	Script.new_author:destroy()
			-- 	Script.new_time:destroy()
			-- end
			-- Script.new_author = config_page:lable(("Current config author: %s"):format(Script.configs.config_author))
			-- --print(Script.configs.last_load_config_time)
			-- Script.new_time = config_page:lable(("Time to create config: %s"):format(Script.configs.last_load_config_time))
			Script.ffi_helpers.ClientColorLog(color(0, 255, 0, 255), ("[%s]加载参数: %s 成功\n"):format(Script.About.name, current_config))
			--Cheat.AddNotify(("[%s]Load Config"):format(Script.About.name), ("[%s]Load config: %s success\n"):format(Script.About.name, current_config))
			Script.Handle_Main()
		end

		Script.configs.import = false
	end
	if Script.configs.import_clipboard then
		local config_data = Script.ffi_helpers.GetClipboardText()
		if config_data ~= nil and config_data:len() > 0 then
			local ConfigPackage = GetConfigPackages()
			assert(Script.API.Base64.decode(config_data) ~= nil, ("[%s]导入参数: %s 失败, 请检查你的参数是否正确\n"):format(Script.About.name, current_config))
			local CurrentConfigPackage = Script.API.Json.decode(Script.API.Base64.decode(config_data))
			for key, data in pairs(ConfigPackage) do
				local config = CurrentConfigPackage[key]
				if config == nil or data:get_type() == "hotkey" then
					goto skip
				end
				local data_ind = data:get()
				if type(data_ind) == "table" then
					data:set(config)
				elseif type(data_ind) == "userdata" then
					data:set(color(config[1],config[2],config[3],config[4]))
				else
					data:set(config)
				end
				-- if key == "author" then
				-- 	Script.configs.config_author = config[1]
				-- 	Script.configs.last_load_config_time = config[2]
				-- else
					-- local data_ind = data:get()
					-- if config ~= nil then
					-- 	if type(data_ind) == "table" then
					-- 		if type(data_ind[1]) == "number" then
					-- 			data:set(color(unpack(config)))
					-- 		else
					-- 			data:set(config)
					-- 		end
					-- 	else
					-- 	end
					-- end
				--end
				::skip::
			end

			-- if Script.Menu_UI.config.c_config_author and Script.Menu_UI.config.c_config_time then
			-- 	Script.Menu_UI.config.c_config_author:destroy()
			-- 	Script.Menu_UI.config.c_config_time:destroy()
			-- end
			-- if Script.new_author ~= 0 then
			-- 	Script.new_author:destroy()
			-- 	Script.new_time:destroy()
			-- end
			-- Script.new_author = config_page:lable(("Current config author: %s"):format(Script.configs.config_author))
			-- --print(Script.configs.last_load_config_time)
			-- Script.new_time = config_page:lable(("Time to create config: %s"):format(Script.configs.last_load_config_time))
			Script.ffi_helpers.ClientColorLog(color(0, 255, 0, 255), ("[%s]导入参数: %s 成功\n"):format(Script.About.name, current_config))
			--Cheat.AddNotify(("[%s]Load Config"):format(Script.About.name), ("[%s]Import config: %s success\n"):format(Script.About.name, current_config))
			Script.Handle_Main()
		end

		Script.configs.import_clipboard = false
	end
end

function Script.UpdateManuak()
	local self = Script
	local m_state = self.Menu_UI.antiaim.manual_state:get()
	local left_state, right_state, backward_state = self.Menu_UI.antiaim.manual_left_hotkey:get(), self.Menu_UI.antiaim.manual_right_hotkey:get(), self.Menu_UI.antiaim.manual_back_hotkey:get()
	if left_state == self.bind_system.left and right_state == self.bind_system.right and backward_state == self.bind_system.back then
		return
	end

	self.bind_system.left, self.bind_system.right, self.bind_system.back = left_state, right_state, backward_state
	if (left_state and m_state == 1) or (right_state and m_state == 2) or (backward_state and m_state == 3) then
		self.Menu_UI.antiaim.manual_state:set(0)
		return
	end

	if left_state and m_state ~= 1 then
		self.Menu_UI.antiaim.manual_state:set(1)
	end

	if right_state and m_state ~= 2 then
		self.Menu_UI.antiaim.manual_state:set(2)
	end

	if backward_state and m_state ~= 3 then
		self.Menu_UI.antiaim.manual_state:set(3)
	end
end

function Script.GetFreeStandSide(e)
	local self = Script
	local g_GetClosestPlayer = function(from)
		return self.API.GetClosestPlayer()
	end

	local AngleVector = function(ang)
		local sp = math.sin(math.rad(ang.x))
		local cp = math.cos(math.rad(ang.x))
		local sy = math.sin(math.rad(ang.y))
		local cy = math.cos(math.rad(ang.y))
		return vector(cp * cy, cp * sy, - sp)
	end

	local AngleExtrapolate = function(vec, angles, distance) 
		local dir = AngleVector(angles)
		return vector(
			vec.x + dir.x * distance,
			vec.y + dir.y * distance,
			vec.z + dir.z * distance
		)
	end

	local entity = entity.get_local_player()
	--local player = entity:GetPlayer()
	local eye_pos = entity:get_eye_position()
	local view_angles = e.view_angles
	local vel_x = entity.m_vecVelocity.x
	local vel_y = entity.m_vecVelocity.y
	local speed = vector(vel_x, vel_y, 0):length2d()
	local data = {
		left = 0, right = 0, distance = 8192
	}

	local closest = g_GetClosestPlayer(eye_pos)
	for i = view_angles.y - 180, view_angles.y + 180, 30 do 
		if i == view_angles.y then
			goto continue 
		end

		local rotation = math.rad(i)
		local point = vector(
			eye_pos.x + math.cos(rotation) * 1028,
			eye_pos.y + math.sin(rotation) * 1028,
			eye_pos.z
		)

		if (type(point) ~= "userdata" or type(eye_pos) ~= "userdata" or type(entity) ~= "userdata") then
			goto continue
		end

		local trace = utils.trace_line(eye_pos, point, entity, 0x4600400b)
		local dst = trace.fraction * 1028
		if not closest then
			local side = i > view_angles.y and "left" or "right"
			data[side] = data[side] + dst
		end

		if data.distance > dst then
			data.distance = dst
		end

		::continue::
	end

	if closest then
		local rotation = rage.antiaim:get_rotation()
		local positions = {
			left = AngleExtrapolate(eye_pos, vector(0, rotation - 90, 0), 64),
			right = AngleExtrapolate(eye_pos, vector(0, rotation + 90, 0), 64)
		}
	
		for side, pos in pairs(positions) do
			local bullet = utils.trace_bullet(closest, closest:get_eye_position(), pos)
			data[side] = bullet
		end

		if data.left > 0 and data.right > 0 then
			return {
				self.freestanding_side,
				closest,
				0
			}
		end
	end

	local g_dist = data.distance
	self.freestanding_side = data.left > data.right and 1 or 2
	return {
		self.freestanding_side,
		closest,
		g_dist
	}
end

function Script.OverrideAntiAim(data)
	local self = Script
	if not data or type(data) ~= "table" then
		return
	end

	if data.pitch ~= nil then
		ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):set(data.pitch)
	end

	if data.yaw ~= nil then
		ui.find("Aimbot", "Anti Aim", "Angles","Yaw", "Offset"):set(data.yaw)
	end

	if data.yawbase ~= nil then
		ui.find("Aimbot", "Anti Aim", "Angles","Yaw"):set(data.yawbase)
	end

	if data.inverter ~= nil then
		ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Inverter"):set(data.inverter)
	end

	if data.yaw_jitter ~= nil then
		ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):set(data.yaw_jitter)
	end

	if data.jitter_slider ~= nil then
		ui.find("Aimbot", "Anti Aim", "Angles","Yaw Modifier", "Offset"):set(data.jitter_slider)
	end

	if data.fake_limit ~= nil and data.fake_limit_right == nil then
		ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Left Limit"):set(data.fake_limit)
		ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Right Limit"):set(data.fake_limit)
	elseif data.fake_limit ~= nil and data.fake_limit_right ~= nil then
		ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Left Limit"):set(data.fake_limit)
		ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Right Limit"):set(data.fake_limit_right)
	end

	--	ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "LBY Mode"):set(data.lby ~= nil and data.lby or "Disabled")
	--	ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "On Shot"):set(data.onshot ~= nil and data.onshot or "Defalut")
	ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Freestanding"):set(data.freestand ~= nil and data.freestand or "Off")
	local enable_option = {}
	for num = 1,4 do
        local cur_option = data.options[num]
        if cur_option ~= nil then
            enable_option[num] = cur_option
        else
            enable_option[num] = ""
        end
    end
	ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Options"):set(enable_option)
	-- for idx = 1, 4 do
	-- 	if data.options[idx] ~= nil and data.options[idx] ~= false then
	-- 		ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Options"):set(data.options[idx])
	-- 	end
	-- end
end

function Script.GetLagState(e)
	local self = Script
	local local_player = entity.get_local_player()
	if not local_player or not local_player:is_alive() then
		return
	end

	return self.API.GetJumping(local_player) and 4 or self.API.GetDucking(local_player) and 5 or Script.ref.AntiAim.Slowwalk:get() and 3 or self.API.GetVelocity(local_player) > 1.1 and 2 or 1
end

function Script.GetPlayerState(e)
	local self = Script
	local local_player = entity.get_local_player()
	if not local_player or not local_player:is_alive() then
		return
	end

	local player_state = 1
	local desync_switcher = not self.Menu_UI.antiaim.switcher_key:get()
	if self.API.getMemuindex({"Manual", "Freestanding", "R-Freestanding", "Jitter"},self.Menu_UI.antiaim.switcher_side:get()) == 1 then
		desync_switcher = not self.Menu_UI.antiaim.switcher_key:get()
	elseif self.API.getMemuindex({"Manual", "Freestanding", "R-Freestanding", "Jitter"},self.Menu_UI.antiaim.switcher_side:get()) == 2 then
		desync_switcher = side == 1
	elseif self.API.getMemuindex({"Manual", "Freestanding", "R-Freestanding", "Jitter"},self.Menu_UI.antiaim.switcher_side:get()) == 3 then
		desync_switcher = side == 2
	elseif self.API.getMemuindex({"Manual", "Freestanding", "R-Freestanding", "Jitter"},self.Menu_UI.antiaim.switcher_side:get()) == 4 then
		desync_switcher = self.switcher_choker
	end

	if self.API.getMemuindex({"Off", "On-miss", "On-hit", "All"},self.Menu_UI.antiaim.anti_brute:get()) ~= 1 and self.anti_bruteforce then
		desync_switcher = not desync_switcher
	end

	local menu_data = self.Menu_UI.antiaim.custom[desync_switcher and 1 or 2]
	if menu_data[11].enable:get() then
		player_state = 11
	elseif self.Menu_UI.antiaim.manual_state:get() == 1 and menu_data[9].enable:get() then
		player_state = 9
	elseif self.Menu_UI.antiaim.manual_state:get() == 2 and menu_data[10].enable:get() then
		player_state = 10
	elseif self.API.GetVelocity(local_player) < 1.1 and menu_data[2].enable:get() then
		player_state = 2
	elseif self.API.GetJumping(local_player) and self.API.GetDucking(local_player) and menu_data[8].enable:get() then
		player_state = 8
	elseif self.API.GetJumping(local_player) and menu_data[5].enable:get() then
		player_state = 5
	elseif self.API.GetDucking(local_player) and menu_data[local_player.m_iTeamNum == 2 and 6 or 7].enable:get() then
		player_state = local_player.m_iTeamNum == 2 and 6 or 7
	elseif Script.ref.AntiAim.Slowwalk:get() and menu_data[4].enable:get() then
		player_state = 4
	elseif self.API.GetVelocity(local_player) >= 1.1 and menu_data[3].enable:get() then
		player_state = 3
	end

	return menu_data[player_state]
end

function Script.ApplyChoking(e)
	local self = Script
	if globals.choked_commands == 0 then
		self.switcher_choker = not self.switcher_choker
	end
end

function Script.CalculateAlternative(number_value, time)
	local self = Script
	if number_value == 0 then
		self.target_send_state = self.target_send_state >= (time + 1) and 1 or self.target_send_state + 1
	end

	return self.target_send_state ~= time
end

function Script.GetShotTick()
	local self = Script
	local local_player = entity.get_local_player()
	if not local_player or not local_player:is_alive() then
		return false
	end

	local active_weapon = local_player:get_player_weapon()
	if active_weapon == nil then
		return false
	end

	local last_shot_time = active_weapon.m_fLastShotTime
	local m_iItem = active_weapon.m_iItemDefinitionIndex
	local limitation = function()
		local max_commands = self.API.GetVelocity(local_player) > 1.1 and 1 or 2
		if not self.data.threshold and last_shot_time ~= self.data.stored_last_shot then
			self.data.stored_last_shot = last_shot_time
			self.data.threshold = true
			return true
		end

		if self.data.threshold and globals.choked_commands >= max_commands then
			self.data.threshold = false
			return true
		end

		return false
	end
    
	if self.data.stored_item ~= m_iItem then
		self.data.stored_last_shot = last_shot_time
		self.data.stored_item = m_iItem
	end

	return limitation()
end

function Script.AngleToVector2(angle)
	local self = Script
	return vector(math.cos(angle), math.sin(angle))
end

function Script.AnglesToVector2(angles)
	local self = Script
	local roll = self.AngleToVector2(angles.z * 0.017453292519943)
	local yaw = self.AngleToVector2(angles.y * 0.017453292519943)
	local pitch = self.AngleToVector2(angles.x * 0.017453292519943)
	local vector_cached = {
		vector(pitch.x * yaw.x, pitch.x * yaw.y, 0),
		vector(- 1 * roll.y * pitch.y * yaw.x + - 1 * roll.x * - yaw.y, - 1 * roll.y * pitch.y * yaw.y + - 1 * roll.x * yaw.x, 0)
	}

	return vector_cached[1] / #vector_cached[1], vector_cached[2] / #vector_cached[2]
end

function Script.RunDesync(e)
	local self = Script
	local local_player = entity.get_local_player()
	if not self.Menu_UI.antiaim.main_enable:get() or not local_player or not local_player:is_alive() then
		return
	end

	self.UpdateManuak()
	local side, current_thread, dist = unpack(self.GetFreeStandSide(e))
	if self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 1 then
		local side_inverter = side == 2
		if self.API.getMemuindex({"Off", "On-miss", "On-hit", "All"},self.Menu_UI.antiaim.anti_brute:get()) ~= 1 and self.anti_bruteforce then
			side_inverter = side == 1
		end

		self.OverrideAntiAim({
			lby = "Disabled",
			yaw = 0,
			pitch = "Down",
			onshot = "Defalut",
			yawbase = "Backward",
			freestand = "Off",
			yaw_jitter = "Disabled",
			fake_limit = 60,
			jitter_slider = 0,
			fake_limit_right = 60,
			inverter = side_inverter,
			options = {"Avoid Overlap", nil, nil, "Anti Bruteforce"}
		})

	elseif self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 2 then
		local side_inverter = side == 1
		if self.API.getMemuindex({"Off", "On-miss", "On-hit", "All"},self.Menu_UI.antiaim.anti_brute:get()) ~= 1 and self.anti_bruteforce then
			side_inverter = side == 2
		end

		self.OverrideAntiAim({
			lby = "Disabled",
			yaw = 0,
			pitch = "Down",
			onshot = "Defalut",
			yawbase = "Backward",
			yaw_jitter = "Disabled",
			freestand = "Off",
			fake_limit = 60,
			jitter_slider = 0,
			fake_limit_right = 60,
			inverter = side_inverter,
			options = {"Avoid Overlap", nil, nil, nil}
		})

	elseif self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 3 then
		self.OverrideAntiAim({
			lby = "Disabled",
			yaw = 0,
			pitch = "Down",
			onshot = "Defalut",
			yawbase = "Backward",
			yaw_jitter = "Disabled",
			freestand = "Off",
			fake_limit = 60,
			jitter_slider = 0,
			fake_limit_right = 60,
			inverter = self.switcher_choker,
			options = {"Avoid Overlap", nil, nil, nil}
		})

	elseif self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 4 then
		self.OverrideAntiAim({
			lby = "Disabled",
			yaw = 0,
			pitch = "Down",
			onshot = "Defalut",
			yawbase = "Backward",
			yaw_jitter = "Center",
			freestand = "Peek Fake",
			fake_limit = 60,
			jitter_slider = 46,
			fake_limit_right = 60,
			inverter = self.switcher_choker,
			options = {"Avoid Overlap", nil, nil, "Anti Bruteforce"}
		})

	elseif self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 5 then
		self.OverrideAntiAim({
			lby = "Disabled",
			yaw = 0,
			pitch = "Down",
			onshot = "Defalut",
			yawbase = "Backward",
			yaw_jitter = "Center",
			freestand = "Peek Fake",
			fake_limit = 60,
			jitter_slider = 58,
			fake_limit_right = 60,
			inverter = self.switcher_choker,
			options = {"Avoid Overlap", nil, nil, "Anti Bruteforce"}
		})

	elseif self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 6 then
		local CurCustomElement = self.GetPlayerState()
		local current_fake_yaw = CurCustomElement.fake_slider:get()
		local body_yaw_add = CurCustomElement.body_yaw_slider:get()
		if self.API.getMemuindex({"Off", "Random", "Jitter", "Switcher ticking", "Update", "Rotation"},CurCustomElement.fake_type:get()) == 2 then
			current_fake_yaw = math.random(current_fake_yaw, CurCustomElement.fake_slider_ex:get())
		elseif self.API.getMemuindex({"Off", "Random", "Jitter", "Switcher ticking", "Update", "Rotation"},CurCustomElement.fake_type:get()) == 3 then
			current_fake_yaw = self.switcher_choker and current_fake_yaw or CurCustomElement.fake_slider_ex:get()
		elseif self.API.getMemuindex({"Off", "Random", "Jitter", "Switcher ticking", "Update", "Rotation"},CurCustomElement.fake_type:get()) == 4 then
			current_fake_yaw = globals.tickcount % 2 == 0 and current_fake_yaw or CurCustomElement.fake_slider_ex:get()
		elseif self.API.getMemuindex({"Off", "Random", "Jitter", "Switcher ticking", "Update", "Rotation"},CurCustomElement.fake_type:get()) == 5 then
			local min_fake = math.min(current_fake_yaw, CurCustomElement.fake_slider_ex:get())
			local max_fake = math.max(current_fake_yaw, CurCustomElement.fake_slider_ex:get())
			if globals.choked_commands == 0 then
				Script.fakeyaw_rotation[1] = Script.fakeyaw_rotation[1] + 1
			end

			if Script.fakeyaw_rotation[1] > max_fake then
				Script.fakeyaw_rotation[1] = min_fake
			end

			current_fake_yaw = Script.fakeyaw_rotation[1]
		elseif self.API.getMemuindex({"Off", "Random", "Jitter", "Switcher ticking", "Update", "Rotation"},CurCustomElement.fake_type:get()) == 6 then
			local min_fake = math.min(current_fake_yaw, CurCustomElement.fake_slider_ex:get())
			local max_fake = math.max(current_fake_yaw, CurCustomElement.fake_slider_ex:get())
			if globals.choked_commands == 0 then
				Script.fakeyaw_rotation[1] = Script.fakeyaw_rotation[2] and (Script.fakeyaw_rotation[1] + 1) or (Script.fakeyaw_rotation[1] - 1)
				if Script.fakeyaw_rotation[1] >= max_fake then
					Script.fakeyaw_rotation[2] = false
				elseif Script.fakeyaw_rotation[1] <= min_fake then
					Script.fakeyaw_rotation[2] = true
				end
			end

			current_fake_yaw = Script.fakeyaw_rotation[1]
		end

		self.OverrideAntiAim({
			inverter = body_yaw_add < 0,
			fake_limit = current_fake_yaw,
			fake_limit_right = current_fake_yaw,
			pitch = CurCustomElement.pitch:get(),
			lby = CurCustomElement.lby_mode:get(),
			yaw = CurCustomElement.yaw_slider:get(),
			yawbase = CurCustomElement.yaw_base:get(),
			yaw_jitter = CurCustomElement.yaw_jitter:get(),
			jitter_slider = CurCustomElement.jitter_slider:get(),
			onshot = CurCustomElement.desync_onshot:get(),
			freestand = CurCustomElement.freestanding:get(),--{"Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"}
			options = {CurCustomElement.fake_options:get(1) and "Avoid Overlap" or nil, CurCustomElement.fake_options:get(2) and "Jitter" or nil, CurCustomElement.fake_options:get(3) and "Randomize Jitter" or nil, CurCustomElement.fake_options:get(4) and "Anti Bruteforce" or nil}
		})

		if self.API.getMemuindex({"Static", "Jitter"},CurCustomElement.body_yaw:get()) == 1 then
			self.API.StaticBodyYaw(body_yaw_add, current_fake_yaw)
		else
			self.API.BodyYawJitter(body_yaw_add, current_fake_yaw)
		end
	end

	if self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) ~= 6 and self.Menu_UI.antiaim.manual_state:get() ~= 0 then
		self.OverrideAntiAim({
			lby = "Disabled",
			pitch = "Down",
			onshot = "Defalut",
			yawbase = "Backward",
			yaw_jitter = "Center",
			freestand = "Peek Fake",
			fake_limit = 60,
			jitter_slider = 0,
			inverter = false,
			fake_limit_right = 60,
			options = {"Avoid Overlap", nil, nil, nil},
			yaw = self.Menu_UI.antiaim.manual_state:get() == 1 and - 90 or self.Menu_UI.antiaim.manual_state:get() == 2 and 90 or 0
		})
	end

	if self.Menu_UI.antiaim.lby_fix:get() then
		local yaw  = render.camera_angles().y
		if e.choked_commands == 0 and not e.in_attack then
			yaw = yaw + (ui.find("Aimbot", "Anti Aim", "Angles","Body Yaw", "Inverter"):get() and 120 or -120)
			e.send_packet = false
		end
		e.view_angles.y = yaw
	end



	if self.Menu_UI.antiaim.avoid_backstab:get() then
		Script.ref.AntiAim.Backstab:set(true)
	else
		Script.ref.AntiAim.Backstab:set(false)
	end
end

Script.RapidFire = function()
	local local_player = entity.get_local_player()
	local active_weapon = local_player:get_player_weapon()
	if active_weapon == nil then
		return
	end

	local last_shot_time = active_weapon.m_fLastShotTime
	local m_iItem = active_weapon.m_iItemDefinitionIndex
	if Script.rapid_data[1] ~= m_iItem then
		Script.rapid_data[2] = last_shot_time
		Script.rapid_data[1] = m_iItem
	end

	if Script.rapid_data[2] ~= last_shot_time then
		--Script.ref.AntiAim.Angle_enable:set(false)
		Script.rapid_data[2] = last_shot_time
		return
	end

	--Script.ref.AntiAim.Angle_enable:Set(true)
end

function Script.Handle_Main(e)
	local self = Script
	local wtmk_state = self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get())
	--local sub_state = self.Menu_UI.Control_Panel.Selectmenu:get()
	--self.Menu_UI.Control_Panel.Selectmenu:visibility(main_state)
	self.Menu_UI.antiaim.manual_state:visibility(false)
	self.Menu_UI.antiaim.avoid_backstab:visibility(self.Menu_UI.antiaim.main_enable:get())
	self.Menu_UI.antiaim.desync_preset:visibility(self.Menu_UI.antiaim.main_enable:get())
    self.Menu_UI.antiaim.lby_fix:visibility(self.Menu_UI.antiaim.main_enable:get())
    
	self.Menu_UI.antiaim.anti_brute:visibility(self.Menu_UI.antiaim.main_enable:get())
	self.Menu_UI.antiaim.manual_left_hotkey:visibility(self.Menu_UI.antiaim.main_enable:get())
	self.Menu_UI.antiaim.manual_right_hotkey:visibility(self.Menu_UI.antiaim.main_enable:get())
	self.Menu_UI.antiaim.manual_back_hotkey:visibility(self.Menu_UI.antiaim.main_enable:get())--"Manual", "Freestanding", "R-Freestanding", "Jitter"
	self.Menu_UI.antiaim.switcher_side:visibility(self.Menu_UI.antiaim.main_enable:get() and self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 6)
	self.Menu_UI.antiaim.switcher_key:visibility(self.Menu_UI.antiaim.main_enable:get() and self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 6 and self.API.getMemuindex({"Manual", "Freestanding", "R-Freestanding", "Jitter"},self.Menu_UI.antiaim.switcher_side:get()) == 1)
	self.Menu_UI.antiaim.custom_player_side:visibility(self.Menu_UI.antiaim.main_enable:get() and self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 6)
	self.Menu_UI.antiaim.custom_player_state:visibility(self.Menu_UI.antiaim.main_enable:get() and self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 6)
	for side, data in pairs(self.Menu_UI.antiaim.custom) do
		for idx, m_list in pairs(data) do
			for key, menu in pairs(m_list) do
				if key == "enable" then
					menu:visibility(self.Menu_UI.antiaim.main_enable:get() and self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 6 and side == self.API.getMemuindex({"Left", "Right"},self.Menu_UI.antiaim.custom_player_side:get()) and idx == self.API.getMemuindex(Script.player_state,self.Menu_UI.antiaim.custom_player_state:get()) and idx ~= 1)
				else
					local should = (((key == "fake_slider_ex" and self.API.getMemuindex({"Off", "Random", "Jitter", "Switcher ticking", "Update", "Rotation"},m_list.fake_type:get()) ~= 1 or key ~= "fake_slider_ex") and ((key == "roll_slider" and Script.ref.AntiAim.Extended:get()) or key ~= "roll_slider") and ((key == "jitter_slider" and self.API.getMemuindex({"Off", "Center", "Offset", "Random", "Spin"},m_list.yaw_jitter:get()) ~= 0 or key ~= "jitter_slider") and m_list.enable:get())))
					menu:visibility(self.Menu_UI.antiaim.main_enable:get() and self.API.getMemuindex({"Freestanding", "R-Freestanding", "Jitter previous", "Tank", "Tank 2", "Custom"},self.Menu_UI.antiaim.desync_preset:get()) == 6 and should and side == self.API.getMemuindex({"Left", "Right"},self.Menu_UI.antiaim.custom_player_side:get()) and idx == self.API.getMemuindex(Script.player_state,self.Menu_UI.antiaim.custom_player_state:get()))
				end
			end
		end
	end

	self.Menu_UI.Control_Panel.icon_color:visibility(not(self.Menu_UI.Control_Panel.fold_color:get()))
	self.Menu_UI.Control_Panel.tab_colorsty:visibility(not(self.Menu_UI.Control_Panel.fold_color:get()))
	self.Menu_UI.Control_Panel.tab_color1:visibility(not(self.Menu_UI.Control_Panel.fold_color:get()))
	self.Menu_UI.Control_Panel.tab_color2:visibility((not(self.Menu_UI.Control_Panel.fold_color:get()) and self.API.getMemuindex(Script.Menu_table.visual_panel.line_mode,Script.Menu_UI.Control_Panel.tab_colorsty:get()) == 2))
	self.Menu_UI.Control_Panel.title_colorsty:visibility(not(self.Menu_UI.Control_Panel.fold_color:get()))
	self.Menu_UI.Control_Panel.title_color1:visibility(not(self.Menu_UI.Control_Panel.fold_color:get()))
	self.Menu_UI.Control_Panel.title_color2:visibility((not(self.Menu_UI.Control_Panel.fold_color:get()) and self.API.getMemuindex(Script.Menu_table.visual_panel.line_mode,Script.Menu_UI.Control_Panel.title_colorsty:get()) == 2))
	self.Menu_UI.Control_Panel.subtitle_color:visibility(not(self.Menu_UI.Control_Panel.fold_color:get()))
	self.Menu_UI.visual_panel.color_theme:visibility(wtmk_state ~= 1)
	self.Menu_UI.visual_panel.coloredit1:visibility(self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) ~= 3 and wtmk_state ~= 1)
	self.Menu_UI.visual_panel.coloredit2:visibility(wtmk_state ~= 1 and self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2)
	self.Menu_UI.visual_panel.rgb_Select:visibility(self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 and wtmk_state == 2)
	self.Menu_UI.visual_panel.time_Select:visibility(wtmk_state ~= 1)
	self.Menu_UI.visual_panel.bg_alpha:visibility(wtmk_state ~= 1 and wtmk_state ~= 2)
	self.Menu_UI.visual_panel.clr_color:visibility(wtmk_state == 3)
	self.Menu_UI.visual_panel.wepbox_ind:visibility(wtmk_state ~= 1)
	self.Menu_UI.visual_panel.windows_slect:visibility(wtmk_state ~= 1)
	self.Menu_UI.visual_panel.lua_info:visibility(wtmk_state ~= 1)
	self.Menu_UI.visual_panel.font_type:visibility(wtmk_state ~= 1)
	--key&spectator
	self.Menu_UI.visual_panel.binds_x:visibility(false)
	self.Menu_UI.visual_panel.binds_y:visibility(false)
	self.Menu_UI.visual_panel.spec_x:visibility(false)
	self.Menu_UI.visual_panel.spec_y:visibility(false)
	--weapon box
	--self.Menu_UI.visual_panel.wepbox_ind:visibility(false)
	self.Menu_UI.visual_panel.info_x:visibility(false)
	self.Menu_UI.visual_panel.info_y:visibility(false)
	--lua info
	self.Menu_UI.visual_panel.lua_x:visibility(false)
	self.Menu_UI.visual_panel.lua_y:visibility(false)
	--world
	self.Menu_UI.visual_panel.font_Select:visibility(self.Menu_UI.visual_panel.hit_marker:get())
	self.Menu_UI.visual_panel.hit_type:visibility(self.Menu_UI.visual_panel.hit_marker:get())
	self.Menu_UI.visual_panel.anim_time:visibility(self.Menu_UI.visual_panel.hit_marker:get())
	self.Menu_UI.visual_panel.hitmk_size:visibility(self.Menu_UI.visual_panel.hit_marker:get())
	self.Menu_UI.visual_panel.hit_mkcolor:visibility(self.Menu_UI.visual_panel.hit_marker:get())
	self.Menu_UI.visual_panel.efct_color1:visibility(self.Menu_UI.visual_panel.kill_efct:get())
	self.Menu_UI.visual_panel.scr_efctcolor1:visibility(self.Menu_UI.visual_panel.scr_efct:get())
	self.Menu_UI.visual_panel.announcer_color:visibility(self.Menu_UI.visual_panel.kill_announcer:get())
	self.Menu_UI.visual_panel.is_onlydrop:visibility(self.Menu_UI.visual_panel.bullet_tracer:get())
	self.Menu_UI.visual_panel.tracer_color:visibility(self.Menu_UI.visual_panel.bullet_tracer:get())
	self.Menu_UI.visual_panel.droptop_select:visibility(self.Menu_UI.visual_panel.bullet_tracer:get())
	self.Menu_UI.visual_panel.trailclr_select:visibility(self.Menu_UI.visual_panel.foot_trail:get())
	self.Menu_UI.visual_panel.trail_color:visibility(self.Menu_UI.visual_panel.foot_trail:get() and self.API.getMemuindex(Script.Menu_table.visual_panel.ind_color_mode,self.Menu_UI.visual_panel.trailclr_select:get()) == 1)
	self.Menu_UI.visual_panel.trail_size:visibility(self.Menu_UI.visual_panel.foot_trail:get())
	self.Menu_UI.visual_panel.aa_style:visibility(self.Menu_UI.visual_panel.aa_ind:get())
	self.Menu_UI.visual_panel.aa_staindcolor:visibility(self.Menu_UI.visual_panel.aa_ind:get() and self.API.getMemuindex({"Modern","Pure text"},self.Menu_UI.visual_panel.aa_style:get()) == 2)
	self.Menu_UI.visual_panel.aa_styindcolor:visibility(self.Menu_UI.visual_panel.aa_ind:get() and self.API.getMemuindex({"Modern","Pure text"},self.Menu_UI.visual_panel.aa_style:get()) == 2)
	self.Menu_UI.visual_panel.aa_textind:visibility(self.Menu_UI.visual_panel.aa_ind:get() and self.API.getMemuindex({"Modern","Pure text"},self.Menu_UI.visual_panel.aa_style:get()) == 2)
	self.Menu_UI.visual_panel.aa_textindcolor:visibility(self.Menu_UI.visual_panel.aa_ind:get() and not self.Menu_UI.visual_panel.aa_textind:get() and self.API.getMemuindex({"Modern","Pure text"},self.Menu_UI.visual_panel.aa_style:get()) == 2)
	self.Menu_UI.visual_panel.arrow_ind:visibility(self.Menu_UI.visual_panel.aa_ind:get())
	self.Menu_UI.visual_panel.arrow_color:visibility(self.Menu_UI.visual_panel.aa_ind:get() and self.Menu_UI.visual_panel.arrow_ind:get())
	self.Menu_UI.visual_panel.arrow_ad:visibility(self.Menu_UI.visual_panel.aa_ind:get() and self.Menu_UI.visual_panel.arrow_ind:get())
	self.Menu_UI.visual_panel.arrow_style:visibility(self.Menu_UI.visual_panel.aa_ind:get() and self.Menu_UI.visual_panel.arrow_ind:get())
	self.Menu_UI.visual_panel.aa_indmode:visibility(self.Menu_UI.visual_panel.aa_ind:get() and self.API.getMemuindex({"Modern","Pure text"},self.Menu_UI.visual_panel.aa_style:get()) == 1)
	self.Menu_UI.visual_panel.aa_indcolor:visibility((self.Menu_UI.visual_panel.aa_ind:get() and self.API.getMemuindex(Script.Menu_table.visual_panel.ind_color_mode,self.Menu_UI.visual_panel.aa_indmode:get()) == 1) or self.API.getMemuindex({"Modern","Pure text"},self.Menu_UI.visual_panel.aa_style:get()) == 2)
	self.Menu_UI.visual_panel.aa_indcolor1:visibility(self.Menu_UI.visual_panel.aa_ind:get() and self.Menu_UI.visual_panel.aa_textind:get() and self.API.getMemuindex({"Modern","Pure text"},self.Menu_UI.visual_panel.aa_style:get()) == 2)
	--weapon visuals
	self.Menu_UI.visual_panel.dmg_mode:visibility(self.Menu_UI.visual_panel.dmg_ind:get())
	self.Menu_UI.visual_panel.line_mode:visibility(self.Menu_UI.visual_panel.scope_ind:get())
	self.Menu_UI.visual_panel.line_dismode:visibility(self.Menu_UI.visual_panel.scope_ind:get())
	self.Menu_UI.visual_panel.line_color1:visibility(self.Menu_UI.visual_panel.scope_ind:get())
	self.Menu_UI.visual_panel.line_color2:visibility(self.Menu_UI.visual_panel.scope_ind:get() and self.API.getMemuindex(Script.Menu_table.visual_panel.line_mode,self.Menu_UI.visual_panel.line_mode:get()) == 2)
	self.Menu_UI.visual_panel.line_thick:visibility(self.Menu_UI.visual_panel.scope_ind:get())
	self.Menu_UI.visual_panel.line_off:visibility(self.Menu_UI.visual_panel.scope_ind:get())
	self.Menu_UI.visual_panel.line_l:visibility(self.Menu_UI.visual_panel.scope_ind:get())
	self.Menu_UI.visual_panel.line_anim:visibility(self.Menu_UI.visual_panel.scope_ind:get())

	--misc
	self.Menu_UI.misc.hitlg_dismode:visibility(self.Menu_UI.misc.hit_log:get())--Script.Menu_table.visual_panel.visualization_mode
	self.Menu_UI.misc.hit_color:visibility(self.Menu_UI.misc.hit_log:get() and self.API.getMunuele(self.Menu_UI.misc.hitlg_dismode:get(),"Console"))
	self.Menu_UI.misc.mis_color:visibility(self.Menu_UI.misc.hit_log:get() and self.API.getMunuele(self.Menu_UI.misc.hitlg_dismode:get(),"Console"))
	self.Menu_UI.misc.prefix_mode:visibility(self.Menu_UI.misc.hit_log:get() and self.API.getMunuele(self.Menu_UI.misc.hitlg_dismode:get(),"Visualization"))
	self.Menu_UI.misc.vis_dismode:visibility(self.Menu_UI.misc.hit_log:get() and self.API.getMunuele(self.Menu_UI.misc.hitlg_dismode:get(),"Visualization"))
	self.Menu_UI.misc.back_alpha:visibility(self.Menu_UI.misc.hit_log:get() and self.API.getMunuele(self.Menu_UI.misc.hitlg_dismode:get(),"Visualization") and self.API.getMemuindex(Script.Menu_table.visual_panel.visualization_mode,self.Menu_UI.misc.vis_dismode:get()) == 1)
	self.Menu_UI.misc.anim_mode:visibility(self.Menu_UI.misc.hit_log:get() and self.API.getMunuele(self.Menu_UI.misc.hitlg_dismode:get(),"Visualization") and self.API.getMemuindex(Script.Menu_table.visual_panel.visualization_mode,self.Menu_UI.misc.vis_dismode:get()) == 2)
	self.Menu_UI.misc.speed_x:visibility(false)
	self.Menu_UI.misc.speed_y:visibility(false)
	self.Menu_UI.misc.min_speed:visibility(self.Menu_UI.misc.custom_slowwalk:get())
	self.Menu_UI.misc.max_speed:visibility(self.Menu_UI.misc.custom_slowwalk:get())
	self.Menu_UI.misc.textbox:visibility(self.Menu_UI.misc.talk_on_kill:get())
	self.Menu_UI.misc.extended_backtrack_limit:visibility(self.Menu_UI.misc.extended_backtrack:get())
	self.Menu_UI.misc.world_exposure:visibility(self.Menu_UI.misc.bloom_set:get())
	self.Menu_UI.misc.model_ambient:visibility(self.Menu_UI.misc.bloom_set:get())
	self.Menu_UI.misc.bloom_scale:visibility(self.Menu_UI.misc.bloom_set:get())
end

function Script.Run_Delay_Call(e)
	local self = Script
	for idx, data in pairs(Script.cache_delay_call) do
		if (globals.realtime - data.current_time) > data.delay then
			if data.callback and type(data.callback) == "function" then
				if data.args ~= nil then
					data.callback(data.args)
				else
					data.callback()
				end
			end

			table.remove(Script.cache_delay_call, idx)
		end
	end
end
function Script.first_check()
	if (Script.API.File_exists("Essential fonts\\badcache.ttf")) and (Script.API.File_exists("Essential fonts\\verdana.ttf")) and (Script.API.File_exists("Essential fonts\\Arrows Sexy.otf")) and (Script.API.File_exists("Essential fonts\\Acta Symbols W95 Arrows.ttf")) and (Script.API.File_exists("Essential fonts\\Smallest Pixel-7.ttf")) and (Script.API.File_exists("Essential fonts\\Segoe UI Bold.ttf")) and (Script.API.File_exists("Essential fonts\\calibri.ttf")) and (Script.API.File_exists("Essential fonts\\PastelIcons.ttf")) and (Script.API.File_exists("Essential fonts\\Saint-Priest.ttf")) and (Script.API.File_exists("Essential fonts\\5151.gif")) and (Script.API.File_exists("Essential fonts\\gifdone.gif")) then
		Script.font_check = true
		font_fircheck = true
	end
end
local font_str = render.load_font("Verdana", 24,"o")
local font_strte = render.load_font("Verdana", 28,"o")
local font_strts = render.load_font("Verdana", 18,"o")
local font_cal = render.load_font("Verdana", 10)
local font_dmg = render.load_font("Verdana", 10,"o")
function Script.startanim()
	if Script.font_check == false and Script.font_fircheck == false then
		if Script.font_1 == false then
			if Script.API.File_exists("Essential fonts\\badcache.ttf") then
				Script.font_1 = true
				Script.font_process = Script.font_process + 1
			end
		end
		if Script.font_2 == false then
			if Script.API.File_exists("Essential fonts\\verdana.ttf") then
				Script.font_2 = true
				Script.font_process = Script.font_process + 1
			end
		end
		if Script.font_3 == false then
			if Script.API.File_exists("Essential fonts\\Arrows Sexy.otf") then
				Script.font_3 = true
				Script.font_process = Script.font_process + 1
			end
		end
		if Script.font_4 == false then
			if Script.API.File_exists("Essential fonts\\Acta Symbols W95 Arrows.ttf") then
				Script.font_4 = true
				Script.font_process = Script.font_process + 1
			end
		end
		if Script.font_5 == false then
			if Script.API.File_exists("Essential fonts\\Smallest Pixel-7.ttf") then
				Script.font_5 = true
				Script.font_process = Script.font_process + 1
			end
		end
		if Script.font_6 == false and Script.API.File_exists("Essential fonts\\Segoe UI Bold.ttf") then
			if Script.API.File_exists("Essential fonts\\Segoe UI Bold.ttf") then
				Script.font_6 = true
				Script.font_process = Script.font_process + 1
			end
		end
		if Script.font_7 == false and Script.API.File_exists("Essential fonts\\calibri.ttf") then
			if Script.API.File_exists("Essential fonts\\calibri.ttf") then
				Script.font_7 = true
				Script.font_process = Script.font_process + 1
			end
		end
		if Script.font_8 == false and Script.API.File_exists("Essential fonts\\PastelIcons.ttf") then
			if Script.API.File_exists("Essential fonts\\PastelIcons.ttf") then
				Script.font_8 = true
				Script.font_process = Script.font_process + 1
			end
		end
		if Script.font_9 == false and Script.API.File_exists("Essential fonts\\Saint-Priest.ttf") then
			if Script.API.File_exists("Essential fonts\\Saint-Priest.ttf") then
				Script.font_9 = true
				Script.font_process = Script.font_process + 1
			end
		end
		if Script.img_1 == false and Script.API.File_exists("Essential fonts\\5151.gif") then
			if Script.API.File_exists("Essential fonts\\5151.gif") then
				Script.img_1 = true
				Script.font_process = Script.font_process + 1
			end
		end
		if Script.img_2 == false and Script.API.File_exists("Essential fonts\\gifdone.gif") then
			if Script.API.File_exists("Essential fonts\\gifdone.gif") then
				Script.img_2 = true
				Script.font_process = Script.font_process + 1
			end
		end
		Script.font_loadedtime = globals.realtime
		Script.font_lerp = Script.API.Lerp_number(Script.font_lerp,(Script.font_process/11)*100,globals.frametime * 3)
		Script.font_loadcir = Script.API.Lerp_number(Script.font_loadcir,3.6*math.ceil(Script.font_lerp),globals.frametime * 3)
		local stranim_size = render.measure_text(font_str,"",math.ceil(Script.font_lerp).."%")
		local stranim_sizetop = render.measure_text(font_strte,"","[Priest] Detected missing fonts")
		local stranim_sizeunder = render.measure_text(font_strte,"","Please click the <Get Font> button in the menu")
		local stranim_tip = render.measure_text(font_strts,"","Unpack the downloaded file")
		local stranim_tipunder = render.measure_text(font_strts,"","Put in csgo/Essential fonts folder")
		render.blur(vector(0.0, 0.0), vector(render.screen_size().x, render.screen_size().y),1,1)
		render.text(font_strte, vector(render.screen_size().x/2-stranim_sizetop.x/2, 200), color(255, 255, 255), nil, "[Priest] Detected missing fonts")
		render.text(font_strte, vector(render.screen_size().x/2-stranim_sizeunder.x/2, 250), color(255, 255, 255), nil, "Please click the <Get Font> button in the menu")
		render.text(font_str, vector(render.screen_size().x/2-stranim_size.x/2, render.screen_size().y/2-stranim_size.y/2), color(255, 255, 255), nil, tostring(math.ceil(Script.font_lerp).."%"))
		render.circle_outline(vector(render.screen_size().x/2, render.screen_size().y/2),color(255, 255, 255, 255), 34.0, 180, Script.font_loadcir/360,7)
		render.text(font_strts, vector(render.screen_size().x/2-stranim_tip.x/2, render.screen_size().y-stranim_tip.y-stranim_tipunder.y-100), color(255, 255, 255,Script.font_lerpalpha), nil, "Unpack the downloaded file")
		render.text(font_strts, vector(render.screen_size().x/2-stranim_tipunder.x/2, render.screen_size().y-100-stranim_tipunder.y), color(255, 255, 255,Script.font_lerpalpha), nil, "Put in csgo/Essential fonts folder")
	elseif Script.font_check == true and Script.font_loadcir ~= 0 and Script.font_fircheck == false then
		if Script.font_process == 9 and globals.realtime - Script.font_loadedtime < 2 then
			Script.font_lerp = Script.API.Lerp_number(Script.font_lerp,(Script.font_process/11)*100,globals.frametime * 3)
			Script.font_loadcir = Script.API.Lerp_number(Script.font_loadcir,3.6*math.ceil(Script.font_lerp),globals.frametime * 3)
			local stranim_size = render.measure_text(font_str,"",math.ceil(Script.font_lerp).."%")
			local stranim_sizetop = render.measure_text(font_strte,"","[Priest] Detected missing fonts")
			local stranim_sizeunder = render.measure_text(font_strte,"","Please click the <Get Font> button in the menu")
			local stranim_tip = render.measure_text(font_strts,"","Unpack the downloaded file")
			local stranim_tipunder = render.measure_text(font_strts,"","Put in csgo/Essential fonts folder")
			render.blur(vector(0.0, 0.0), vector(render.screen_size().x, render.screen_size().y),1,1)
			render.text(font_strte, vector(render.screen_size().x/2-stranim_sizetop.x/2, 200), color(255, 255, 255), nil, "[Priest] Detected missing fonts")
			render.text(font_strte, vector(render.screen_size().x/2-stranim_sizeunder.x/2, 250), color(255, 255, 255), nil, "Please click the <Get Font> button in the menu")
			render.text(font_str, vector(render.screen_size().x/2-stranim_size.x/2, render.screen_size().y/2-stranim_size.y/2), color(255, 255, 255), nil, tostring(math.ceil(Script.font_lerp).."%"))
			render.circle_outline(vector(render.screen_size().x/2, render.screen_size().y/2),color(255, 255, 255, 255), 34.0, 180,Script.font_loadcir/360,7)
			render.text(font_strts, vector(render.screen_size().x/2-stranim_tip.x/2, render.screen_size().y-stranim_tip.y-stranim_tipunder.y-100), color(255, 255, 255,Script.font_lerpalpha), nil, "Unpack the downloaded file")
			render.text(font_strts, vector(render.screen_size().x/2-stranim_tipunder.x/2, render.screen_size().y-100-stranim_tipunder.y), color(255, 255, 255,Script.font_lerpalpha), nil, "Put in csgo/Essential fonts folder")
		elseif Script.font_process == 11 and globals.realtime - Script.font_loadedtime < 2.8 and Script.font_fircheck == false then
			Script.start_anim[1].time = globals.realtime
			Script.font_lerpalpha = Script.API.Lerp_number(Script.font_lerpalpha,0,globals.frametime * 6)
			local stranim_size = render.measure_text(font_str,"",math.ceil(Script.font_lerp).."%")
			local stranim_sizetop = render.measure_text(font_strte,"","[Priest] Detected missing fonts")
			local stranim_sizeunder = render.measure_text(font_strte,"","Please click the <Get Font> button in the menu")
			local stranim_tip = render.measure_text(font_strts,"","Unpack the downloaded file")
			local stranim_tipunder = render.measure_text(font_strts,"","Put in csgo/Essential fonts folder")
			render.blur(vector(0.0, 0.0), vector(render.screen_size().x, render.screen_size().y),1,Script.font_lerpalpha)
			render.text(font_strte, vector(render.screen_size().x/2-stranim_sizetop.x/2, 200), color(255, 255, 255,Script.font_lerpalpha), nil, "[Priest] Detected missing fonts")
			render.text(font_strte, vector(render.screen_size().x/2-stranim_sizeunder.x/2, 250), color(255, 255, 255,Script.font_lerpalpha), nil, "Please click the <Get Font> button in the menu")
			render.text(font_str, vector(render.screen_size().x/2-stranim_size.x/2, render.screen_size().y/2-stranim_size.y/2), color(255, 255, 255,Script.font_lerpalpha), nil, tostring(math.ceil(Script.font_lerp).."%"))
			render.circle_outline(vector(render.screen_size().x/2, render.screen_size().y/2),color(255, 255, 255,Script.font_lerpalpha), 34.0, 180,Script.font_loadcir/360,7)
			render.text(font_strts, vector(render.screen_size().x/2-stranim_tip.x/2, render.screen_size().y-stranim_tip.y-stranim_tipunder.y-100), color(255, 255, 255,Script.font_lerpalpha), nil,"Unpack the downloaded file")
			render.text(font_strts, vector(render.screen_size().x/2-stranim_tipunder.x/2, render.screen_size().y-100-stranim_tipunder.y), color(255, 255, 255,Script.font_lerpalpha), nil, "Put in csgo/Essential fonts folder")
		end
	end
end
Script.bosdef_x = Script.Menu_UI.visual_panel.info_x:get()
Script.bosdef_y = Script.Menu_UI.visual_panel.info_y:get()
Script.spddef_x = Script.Menu_UI.misc.speed_x:get()
Script.spddef_y = Script.Menu_UI.misc.speed_y:get()
local str_img = nil
local priest_tag = Script.API.build_clantag("Saint-Priest")
table.insert(Script.start_anim,{time = globals.realtime,str_pos = vector(render.screen_size().x/2,render.screen_size().y),end_pos = vector(render.screen_size().x/2,render.screen_size().y)})
function Script.Render_Visuals(e)
	if Script.font_check == false then
		if (not Script.API.File_exists("Essential fonts\\badcache.ttf")) or (not Script.API.File_exists("Essential fonts\\verdana.ttf")) or (not Script.API.File_exists("Essential fonts\\Arrows Sexy.otf")) or (not Script.API.File_exists("Essential fonts\\Acta Symbols W95 Arrows.ttf")) or (not Script.API.File_exists("Essential fonts\\Smallest Pixel-7.ttf")) or (not Script.API.File_exists("Essential fonts\\Segoe UI Bold.ttf")) or (not Script.API.File_exists("Essential fonts\\calibri.ttf")) or (not Script.API.File_exists("Essential fonts\\5151.gif")) or (not Script.API.File_exists("Essential fonts\\gifdone.gif") or (not Script.API.File_exists("Essential fonts\\PastelIcons.ttf")) or (not Script.API.File_exists("Essential fonts\\Saint-Priest.ttf"))) then
			return
		end
	end
	Script.font_check = true
	if Script.font_fircheck == false and globals.realtime - Script.font_loadedtime <= 2.8 then
		return
	end
	local self = Script
	local screen_size = self.screen_size
	local timeStr = self.API.getMemuindex({"24-hour clock","12-hour clock"},self.Menu_UI.visual_panel.time_Select:get()) == 1 and common.get_date("%H:%M:%S") or common.get_date("%I:%M %p")
	local in_game = globals.is_in_game
	local player = entity.get_local_player()
	local netchann_info = utils.net_channel()
	local tick = 1/globals.tickinterval
	local ping = in_game == true and string.format("%1.f",math.max(0.0,netchann_info.latency[0])*1000.0) or "nil"
	local watermark_text = in_game == true and "Saint-Priest | "..Script.username.." | delay:"..ping.."ms | "..tick.."tick | "..tostring(timeStr) or "Saint-Priest | "..Script.username.." | Lobby".." | "..tostring(timeStr)
	--local text_size = render.measure_text(watermark_text, 14,font_cal)--我是煞笔
	local real_rotation = rage.antiaim:get_rotation()
    local desync_rotation = rage.antiaim:get_rotation(true)
    local max_desync_delta = rage.antiaim:get_max_desync()
    local min_desync_delta = max_desync_delta*-1
	local plr_vel = Script.API.GetVelocity(player)
	local charge_tickbase = rage.exploit:get()
	Script.desync_angle = real_rotation-desync_rotation;
	if (Script.desync_angle > max_desync_delta)then
        Script.desync_angle = max_desync_delta
    elseif(Script.desync_angle < min_desync_delta)then
        Script.desync_angle = min_desync_delta
    end
	local ticks = Script.choke_history
	local desync_info = string.format("FAKE:(%.1f°)",math.abs(Script.desync_angle))
	local priest_font = Script.API.getMemuindex({"Verdana", "Tahoma"}, Script.Menu_UI.visual_panel.font_type:get()) == 1 and self.API.CreateFont("Essential fonts\\verdana.ttf",12) or self.API.CreateFont("Tahoma", 14)

	local weapon_font_s = self.API.CreateFont("Essential fonts\\PastelIcons.ttf",16)
	local weapon_font_b = self.API.CreateFont("Essential fonts\\PastelIcons.ttf",24)

	local priest_text = in_game == true and "[Saint-Priest] Welcome:"..Script.username.." | PING: "..ping.."ms | Time: "..tostring(timeStr) or "[Saint-Priest] Welcome:"..Script.username.." | Lobby | Time: "..tostring(timeStr)
	local priest_size = render.measure_text(priest_font,"",priest_text)
	local solusv1_dsytext = string.format("FAKE:(%.1f°) | safety: %d%s | side: ",math.abs(Script.desync_angle),(math.abs(Script.desync_angle)/max_desync_delta)*100,"%")..(Script.ref.AntiAim.inverter:get() and "<" or ">")
	local solusv1_size = render.measure_text(priest_font,"",watermark_text)
	local solusv1_dsysize = render.measure_text(priest_font,"",solusv1_dsytext)
	local solusv2_text = in_game == true and " | "..Script.username.." | delay:"..ping.."ms | "..tick.."tick | "..tostring(timeStr) or " | "..Script.username.." | Lobby".." | "..tostring(timeStr)
	local solusv2_size = render.measure_text(priest_font,"",watermark_text)

	local should_breaker_lc = not Script.ref.Aimbot.Hideshots:get() and not Script.ref.Aimbot.Doubletap:get() and Script.API.GetJumping(player) and plr_vel > 260
	local recharge = Script.ref.Aimbot.Doubletap:get() and not Script.ref.AntiAim.Fakeduck:get() and charge_tickbase > 0
	local shifting = Script.ref.Aimbot.Doubletap:get() and not Script.ref.AntiAim.Fakeduck:get() and charge_tickbase >= 1
	local exploit_text = shifting and " | SHIFTING" or (recharge and " | RECHARGE" or (should_breaker_lc and " | BREAKER LC" or ""))
	local explot_size = render.measure_text(priest_font,"",exploit_text)
	local solusv2_dsytext = string.format("FAKE:(%.1f°)",math.abs(Script.desync_angle))
	local solusv2_dsysize = render.measure_text(priest_font,"",solusv2_dsytext)
	--local solusv2_fltext = ("FL: %d".." | %s"):format(ticks[1],exploit_text)
	local solusv2_fltext = "FL: "..ticks[1]
	local solusv2_flsize = render.measure_text(priest_font,"",solusv2_fltext)
	local drag_clr = Script.Menu_UI.Control_Panel.drag_color:get()
	--print(solusv1_dsytext)
	local wtm_color1 = self.Menu_UI.visual_panel.coloredit1:get()
	local wtm_color2 = self.Menu_UI.visual_panel.coloredit2:get()
	-- if(in_game)then
	-- 	local me_avatar = self.API.GetPlayerAvatar(player, 32)
	-- 	if me_avatar ~= nil then
	-- 		render.texture(me_avatar, vector(screen_size.x / 2, screen_size.y / 2), vector(64, 64), color(1.0, 1.0, 1.0, 1.0), 6)
	-- 	end
	-- end
	--[[local me_avatar = self.API.GetPlayerAvatar(player, 32)
	if me_avatar ~= nil then
		render.texture(me_avatar, vector(screen_size.x / 2, screen_size.y / 2), vector(32, 32), color(1.0, 1.0, 1.0, 1.0), 0.5)
	end]]

	local rgb_color = Script.API.GetColorRGB(15/100,1)
	--print(self.Menu_UI.visual_panel.coloredit1)
	--local a = Script.API.CreateLerpAnimation(screen_size.x, 100, 100, "a lerp")
	--print(render.measure_text(" | ", 12,font_cal).x)
	--print(tostring((text_size.x+8)*0.00625))
	--print(tostring(priest_size))
	if self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 2 then
		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
			render.rect(vector(screen_size.x-(priest_size.x+61),17), vector(screen_size.x-(priest_size.x+61)+40,57), color(17, 17, 17, 255),3)
			local avatar = Script.plr_avatar
			if avatar then
				render.texture(avatar, vector(screen_size.x-(priest_size.x+61)+5,22), vector(30, 30), color(1.0*255, 1.0*255, 1.0*255, 1*255),f,3)
			else
				Script.plr_avatar = Script.ffi_helpers.get_steam_avatar(self.my_steam64id, 30,30)
			end

			Script.API.Renderpriestrect(screen_size.x-priest_size.x-21, 23,wtm_color1,wtm_color1,priest_size.x+8,priest_size.y+16,1,0.8,3)
			render.text(priest_font,vector(screen_size.x-priest_size.x-17, 31),color(1*255, 1*255, 1*255, 1*255),nil,priest_text)
		end
		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
			render.rect(vector(screen_size.x-(priest_size.x+61),17), vector(screen_size.x-(priest_size.x+61)+40,57), color(17, 17, 17, 255),3)
			local avatar = Script.plr_avatar
			if avatar then
				render.texture(avatar, vector(screen_size.x-(priest_size.x+61)+5,22), vector(30, 30), color(1.0*255, 1.0*255, 1.0*255, 1*255),f,3)
			else
				Script.plr_avatar = Script.ffi_helpers.get_steam_avatar(self.my_steam64id, 30,30)
			end
			Script.API.Renderpriestrect(screen_size.x-priest_size.x-21, 23,wtm_color1,wtm_color2,priest_size.x+8,priest_size.y+16,1,0.8,3)
			render.text(priest_font,vector(screen_size.x-priest_size.x-17, 31),color(1*255, 1*255, 1*255, 1*255),nil,priest_text)
		end
		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
			render.rect(vector(screen_size.x-(priest_size.x+61),17), vector(screen_size.x-(priest_size.x+61)+40,57), color(17, 17, 17, 255),3)
			local avatar = Script.plr_avatar
			if avatar then
				render.texture(avatar, vector(screen_size.x-(priest_size.x+61)+5,22), vector(30, 30), color(1.0*255, 1.0*255, 1.0*255, 1*255),f,3)
			else
				Script.plr_avatar = Script.ffi_helpers.get_steam_avatar(self.my_steam64id, 30,30)
			end
			if self.API.getMemuindex({"Defalut","Complex"},self.Menu_UI.visual_panel.rgb_Select:get()) == 2 then
				Script.API.Renderpriestrect(screen_size.x-priest_size.x-21, 23,color(rgb_color.r, rgb_color.g, rgb_color.b, 255),color(rgb_color.g, rgb_color.b, rgb_color.r, 255),priest_size.x+8,priest_size.y+16,1,0.8,3,true)
			else
				Script.API.Renderpriestrect(screen_size.x-priest_size.x-21, 23,color(rgb_color.r, rgb_color.g, rgb_color.b, 255),color(rgb_color.g, rgb_color.b, rgb_color.r, 255),priest_size.x+8,priest_size.y+16,1,0.8,3)
			end
			render.text(priest_font, vector(screen_size.x-priest_size.x-17, 31), color(1*255, 1*255, 1*255, 1*255), nil,priest_text)
		end
	elseif self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 3 then
		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then--89,119,238
			if entity.get_local_player() then
				render.rect(vector(screen_size.x-solusv1_dsysize.x-32, 44), vector(screen_size.x-8, 44+solusv1_dsysize.y+7), color(0, 0, 0, self.Menu_UI.visual_panel.bg_alpha:get()))
				render.rect(vector(screen_size.x-solusv1_dsysize.x-34, 44), vector(screen_size.x-solusv1_dsysize.x-32, 44+solusv1_dsysize.y+7), wtm_color1)
				render.circle_outline(vector(screen_size.x-solusv1_dsysize.x-22, 53),Script.Menu_UI.visual_panel.clr_color:get(), 5.0,0,((math.abs(Script.desync_angle)/max_desync_delta)*100)*3.6/360,2)
				--Script.API.RenderBlurHalfRoundedrect(screen_size.x-fl_size.x-10, 54-fl_size.y/2,wtm_color1,wtm_color1,fl_size.x,fl_size.y+6,2,0.0625)
				render.text(priest_font,vector(screen_size.x-solusv1_dsysize.x-11, 48), color(0, 0, 0, 0.8*255), nil,solusv1_dsytext)
				render.text(priest_font,vector(screen_size.x-solusv1_dsysize.x-12, 47), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil,solusv1_dsytext)
			end
				--render.blur(vector(screen_size.x-(text_size.x+21),13), vector(screen_size.x-(text_size.x+61)+text_size.x+52, text_size.y+25),color(1.0, 1,1, 1),3)
				render.rect(vector(screen_size.x-(solusv1_size.x+16), 15), vector(screen_size.x-8, 15+solusv1_size.y+9), color(0, 0, 0, self.Menu_UI.visual_panel.bg_alpha:get()))
				render.text(priest_font,vector(screen_size.x-(solusv1_size.x+11), 20), color(0, 0, 0, 0.8*255), nil, watermark_text)
				render.text(priest_font,vector(screen_size.x-(solusv1_size.x+12), 19), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil, watermark_text)
				render.rect(vector(screen_size.x-(solusv1_size.x+16), 13), vector(screen_size.x-8, 15), wtm_color1)
				--Script.API.RenderRoundedgradientrect(screen_size.x-(text_size.x+19),13,wtm_color1,wtm_color1,text_size.x+8,text_size.y+10,1,0.3,0.0625)
				--Script.API.RenderGradientText(screen_size.x-(text_size.x+15),19,color(1.0, 1,1, 1),color(1, 1,1, 1),14,font_cal,watermark_text,false,false,true)
		end
		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
			if entity.get_local_player() then
				render.rect(vector(screen_size.x-solusv1_dsysize.x-32, 44), vector(screen_size.x-8, 44+solusv1_dsysize.y+7), color(0, 0, 0, self.Menu_UI.visual_panel.bg_alpha:get()))

				render.gradient(vector(screen_size.x-solusv1_dsysize.x-34, 44), vector(screen_size.x-solusv1_dsysize.x-32, 44+(solusv1_dsysize.y+7)/2), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1*255), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1*255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1*255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1*255))
				render.gradient(vector(screen_size.x-solusv1_dsysize.x-34, 44+(solusv1_dsysize.y+7)/2), vector(screen_size.x-solusv1_dsysize.x-32, 44+solusv1_dsysize.y+7), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1*255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1*255), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 1*255), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 1*255))
				--render.rect(vector(screen_size.x-solusv1_dsysize.x-34, 40), vector(screen_size.x-solusv1_dsysize.x-32, 40+solusv1_dsysize.y+7), wtm_color1)
				render.circle_outline(vector(screen_size.x-solusv1_dsysize.x-22, 53),Script.Menu_UI.visual_panel.clr_color:get(), 5.0,0,((math.abs(Script.desync_angle)/max_desync_delta)*100)*3.6/360,2)
				--Script.API.RenderBlurHalfRoundedrect(screen_size.x-fl_size.x-10, 54-fl_size.y/2,wtm_color1,wtm_color1,fl_size.x,fl_size.y+6,2,0.0625)
				render.text(priest_font,vector(screen_size.x-solusv1_dsysize.x-11, 48), color(0, 0, 0, 0.8*255), nil,solusv1_dsytext)
				render.text(priest_font,vector(screen_size.x-solusv1_dsysize.x-12, 47), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil,solusv1_dsytext)
			end
				--render.blur(vector(screen_size.x-(text_size.x+21),13), vector(screen_size.x-(text_size.x+61)+text_size.x+52, text_size.y+25),color(1.0, 1,1, 1),3)
				render.rect(vector(screen_size.x-(solusv1_size.x+16), 15), vector(screen_size.x-8, 15+solusv1_size.y+9), color(0, 0, 0, self.Menu_UI.visual_panel.bg_alpha:get()))
				render.text(priest_font, vector(screen_size.x-(solusv1_size.x+11), 20), color(0, 0, 0, 0.8*255), nil, watermark_text)
				render.text(priest_font, vector(screen_size.x-(solusv1_size.x+12), 19), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil, watermark_text)

				render.gradient(vector(screen_size.x-(solusv1_size.x+16), 13), vector(screen_size.x-(solusv1_size.x+16)/2, 15), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1*255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1*255), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1*255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1*255))
				render.gradient(vector(screen_size.x-(solusv1_size.x+16)/2, 13), vector(screen_size.x-8, 15), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1*255), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 1*255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1*255), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 1*255))
				--render.rect(vector(screen_size.x-(solusv1_size.x+16), 11), vector(screen_size.x-8, 13), wtm_color1)
				--Script.API.RenderRoundedgradientrect(screen_size.x-(text_size.x+19),13,wtm_color1,wtm_color1,text_size.x+8,text_size.y+10,1,0.3,0.0625)
				--Script.API.RenderGradientText(screen_size.x-(text_size.x+15),19,color(1.0, 1,1, 1),color(1, 1,1, 1),14,font_cal,watermark_text,false,false,true)
		end
		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
			if entity.get_local_player() then
				render.rect(vector(screen_size.x-solusv1_dsysize.x-32, 44), vector(screen_size.x-8, 44+solusv1_dsysize.y+7), color(0, 0, 0, self.Menu_UI.visual_panel.bg_alpha:get()))

				render.gradient(vector(screen_size.x-solusv1_dsysize.x-34, 44), vector(screen_size.x-solusv1_dsysize.x-32, 44+(solusv1_dsysize.y+7)/2), color(rgb_color.r, rgb_color.g, rgb_color.b, 1*255), color(rgb_color.r, rgb_color.g, rgb_color.b, 1*255), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*255), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*255))
				render.gradient(vector(screen_size.x-solusv1_dsysize.x-34, 44+(solusv1_dsysize.y+7)/2), vector(screen_size.x-solusv1_dsysize.x-32, 44+solusv1_dsysize.y+7), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*255), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*255), color(rgb_color.g, rgb_color.b, rgb_color.r, 1*255), color(rgb_color.g, rgb_color.b, rgb_color.r, 1*255))
				--render.rect(vector(screen_size.x-solusv1_dsysize.x-34, 40), vector(screen_size.x-solusv1_dsysize.x-32, 40+solusv1_dsysize.y+7), wtm_color1)
				render.circle_outline(vector(screen_size.x-solusv1_dsysize.x-22, 53),Script.Menu_UI.visual_panel.clr_color:get(), 5.0,0,((math.abs(Script.desync_angle)/max_desync_delta)*100)*3.6/360,2)
				--Script.API.RenderBlurHalfRoundedrect(screen_size.x-fl_size.x-10, 54-fl_size.y/2,wtm_color1,wtm_color1,fl_size.x,fl_size.y+6,2,0.0625)
				render.text(priest_font, vector(screen_size.x-solusv1_dsysize.x-11, 48), color(0, 0, 0, 0.8*255), nil,solusv1_dsytext)
				render.text(priest_font, vector(screen_size.x-solusv1_dsysize.x-12, 47), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil,solusv1_dsytext)
			end
				--render.blur(vector(screen_size.x-(text_size.x+21),13), vector(screen_size.x-(text_size.x+61)+text_size.x+52, text_size.y+25),color(1.0, 1,1, 1),3)
				render.rect(vector(screen_size.x-(solusv1_size.x+16), 15), vector(screen_size.x-8, 15+solusv1_size.y+9), color(0, 0, 0, self.Menu_UI.visual_panel.bg_alpha:get()))
				render.text(priest_font, vector(screen_size.x-(solusv1_size.x+11), 20), color(0, 0, 0, 0.8*255), nil,watermark_text)
				render.text(priest_font, vector(screen_size.x-(solusv1_size.x+12), 19), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil,watermark_text)

				render.gradient(vector(screen_size.x-(solusv1_size.x+16), 13), vector(screen_size.x-(solusv1_size.x+16)/2, 15), color(rgb_color.r, rgb_color.g, rgb_color.b, 1*255), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*255), color(rgb_color.r, rgb_color.g, rgb_color.b, 1*255), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*255))
				render.gradient(vector(screen_size.x-(solusv1_size.x+16)/2, 13), vector(screen_size.x-8, 15), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*255), color(rgb_color.g, rgb_color.b, rgb_color.r, 1*255), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*255), color(rgb_color.g, rgb_color.b, rgb_color.r, 1*255))
				--render.rect(vector(screen_size.x-(solusv1_size.x+16), 11), vector(screen_size.x-8, 13), wtm_color1)
				--Script.API.RenderRoundedgradientrect(screen_size.x-(text_size.x+19),13,wtm_color1,wtm_color1,text_size.x+8,text_size.y+10,1,0.3,0.0625)
				--Script.API.RenderGradientText(screen_size.x-(text_size.x+15),19,color(1.0, 1,1, 1),color(1, 1,1, 1),14,font_cal,watermark_text,false,false,true)
		end
	elseif self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 4 then
		local radius_ = exploit_text ~= "" and 0.0225 or 0.08
		if Script.ex_pos == 0 then
			Script.ex_pos = vector(screen_size.x-(solusv2_flsize.x+15)+solusv2_flsize.x, 50)
			Script.fl_pos = vector(screen_size.x-(solusv2_flsize.x+15)-explot_size.x, 50)
			Script.fake_pos = vector(screen_size.x-(solusv2_flsize.x+15)-explot_size.x-7-(solusv2_dsysize.x+17), 50)
			Script.fl_size = solusv2_flsize.x
		end
		if exploit_text ~= "" then
			Script.ex_alpha = Script.API.Lerp_number(Script.ex_alpha,255,globals.frametime *5)
			Script.fl_pos.x = Script.API.Lerp_number(Script.fl_pos.x,screen_size.x-(solusv2_flsize.x+15)-explot_size.x,globals.frametime *5)
			Script.ex_pos.x = Script.API.Lerp_number(Script.ex_pos.x,Script.fl_pos.x+solusv2_flsize.x,globals.frametime *8)
			Script.fake_pos.x = Script.API.Lerp_number(Script.fake_pos.x,Script.fl_pos.x-7-(solusv2_dsysize.x+17),globals.frametime *8)
			Script.fl_size = Script.API.Lerp_number(Script.fl_size,solusv2_flsize.x+10+explot_size.x,globals.frametime *5)
		else
			Script.ex_alpha = Script.API.Lerp_number(Script.ex_alpha,0,globals.frametime *5)
			Script.fl_pos.x = Script.API.Lerp_number(Script.fl_pos.x,screen_size.x-(solusv2_flsize.x+15)-explot_size.x,globals.frametime *5)
			Script.ex_pos.x = Script.API.Lerp_number(Script.ex_pos.x,Script.fl_pos.x+solusv2_flsize.x,globals.frametime *8)
			Script.fake_pos.x = Script.API.Lerp_number(Script.fake_pos.x,Script.fl_pos.x-7-(solusv2_dsysize.x+17),globals.frametime *8)
			Script.fl_size = Script.API.Lerp_number(Script.fl_size,solusv2_flsize.x+10+explot_size.x,globals.frametime *5)
		end
		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
			if entity.get_local_player() then
				--render.rect(vector(screen_size.x-(solusv2_dsysize.x+25)-(solusv2_flsize.x+22),45), vector(screen_size.x-(solusv2_dsysize.x+25)-(solusv2_flsize.x+22)+solusv2_dsysize.x+14,45+solusv2_dsysize.y+9), color(0, 0, 0, (self.Menu_UI.visual_panel.bg_alpha:get())),math.ceil((solusv2_dsysize.x+14)*0.0675))
				Script.API.Rendersolusv2textrect(Script.fake_pos.x-8,45,wtm_color1,wtm_color1,solusv2_dsysize.x+14,solusv2_dsysize.y+9,1,0.3,3)
				render.text(priest_font, vector(Script.fake_pos.x+1, 51), color(0, 0, 0, 0.8*255), nil,solusv2_dsytext)
				render.text(priest_font, vector(Script.fake_pos.x, 50), color(1*255, 1*255, 1*255, 1*255), nil,solusv2_dsytext)
				Script.API.Rendersolusv2textrect(Script.fl_pos.x-5,45,wtm_color1,wtm_color1,Script.fl_size,solusv2_dsysize.y+9,1,0.3,3)
				render.text(priest_font, vector(Script.fl_pos.x+1, 51), color(0, 0, 0, 0.8*255), nil,solusv2_fltext)
				render.text(priest_font, vector(Script.fl_pos.x, 50), color(1*255, 1*255, 1*255, 1*255), nil,solusv2_fltext)
				render.text(priest_font, Script.ex_pos+1, color(0, 0, 0, (Script.ex_alpha)*0.8), nil,exploit_text)
				render.text(priest_font, Script.ex_pos, color(1*255, 1*255, 1*255, Script.ex_alpha), nil,exploit_text)
				-- render.rect(vector(screen_size.x-(solusv2_dsysize.x+25)-(solusv2_flsize.x+22),45), vector(screen_size.x-(solusv2_dsysize.x+25)-(solusv2_flsize.x+22)+solusv2_dsysize.x+14,45+solusv2_dsysize.y+9), color(0, 0, 0, (self.Menu_UI.visual_panel.bg_alpha:get())),math.ceil((solusv2_dsysize.x+14)*0.0675))
				-- Script.API.Rendersolusv2textrect(screen_size.x-(solusv2_dsysize.x+25)-(solusv2_flsize.x+22),45,wtm_color1,wtm_color1,solusv2_dsysize.x+14,solusv2_dsysize.y+9,1,0.3,0.0675)
				-- render.text(solusv2_dsytext, vector(screen_size.x-(solusv2_dsysize.x+17)-(solusv2_flsize.x+21), 51), color(0, 0, 0, 0.8), 12,priest_font,false)
				-- render.text(solusv2_dsytext, vector(screen_size.x-(solusv2_dsysize.x+17)-(solusv2_flsize.x+22), 50), color(1, 1, 1, 1), 12,priest_font,false)
				-- render.rect(vector(screen_size.x-(solusv2_flsize.x+20),45), vector(screen_size.x-(solusv2_flsize.x+20)+solusv2_flsize.x+10,45+solusv2_dsysize.y+9), color(0, 0, 0, (self.Menu_UI.visual_panel.bg_alpha:get())),math.ceil((solusv2_flsize.x+6)*0.08))
				-- Script.API.Rendersolusv2textrect(screen_size.x-(solusv2_flsize.x+20),45,wtm_color1,wtm_color1,solusv2_flsize.x+10,solusv2_dsysize.y+9,1,0.3,0.0225)
				-- render.text(solusv2_fltext, vector(screen_size.x-(solusv2_flsize.x+14), 51), color(0, 0, 0, 0.8), 12,priest_font,false)
				-- render.text(solusv2_fltext, vector(screen_size.x-(solusv2_flsize.x+15), 50), color(1, 1, 1, 1), 12,priest_font,false)
			end
			
			--render.blur(vector(screen_size.x-(text_size.x+21),13), vector(screen_size.x-(text_size.x+61)+text_size.x+52, text_size.y+25),color(1.0, 1,1, 1),3)
			--render.rect(vector(screen_size.x-(text_size.x+19),13), vector(screen_size.x-(text_size.x+19)+text_size.x+8,13+text_size.y+10), color(0, 0, 0, 0.6),3)
			Script.API.Rendersolusv2rect(screen_size.x-(solusv2_size.x+22),13,wtm_color1,wtm_color1,solusv2_size.x+12,solusv2_size.y+12,1,0.3,3)
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+14), 20), color(0, 0, 0, 0.8*255), nil,"Saint-")
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+14)+render.measure_text(priest_font,"","Saint-").x, 20), color(0, 0, 0, 0.8*255), nil,"Priest")
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+14)+render.measure_text(priest_font,"","Saint-Priest").x, 20), color(0, 0, 0, 0.8*255), nil,solusv2_text)
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+15), 19), color(1*255, 1*255, 1*255, 1*255), nil,"Saint-")
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+15)+render.measure_text(priest_font,"","Saint-").x, 19), wtm_color1, nil,"Priest")
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+15)+render.measure_text(priest_font,"","Saint-Priest").x, 19), color(1*255, 1*255, 1*255, 1*255), nil,solusv2_text)
			--Script.API.RenderGradientText(screen_size.x-(text_size.x+14),20,color(0, 0, 0, 0.8),color(0, 0, 0, 0.8),14,font_cal,watermark_text,false,false,false)
			--Script.API.RenderGradientText(screen_size.x-(text_size.x+15),19,color(1.0, 1,1, 1),color(1, 1,1, 1),14,font_cal,watermark_text,false,false,false)
		end
		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
			if entity.get_local_player() then
				Script.API.Rendersolusv2textrect(Script.fake_pos.x-8,45,wtm_color1,wtm_color2,solusv2_dsysize.x+14,solusv2_dsysize.y+9,1,0.3,3)
				render.text(priest_font, vector(Script.fake_pos.x+1, 51), color(0, 0, 0, 0.8*255), nil,solusv2_dsytext)
				render.text(priest_font, vector(Script.fake_pos.x, 50), color(1*255, 1*255, 1*255, 1*255), nil,solusv2_dsytext)
				Script.API.Rendersolusv2textrect(Script.fl_pos.x-5,45,wtm_color1,wtm_color2,Script.fl_size,solusv2_dsysize.y+9,1,0.3,3)
				render.text(priest_font, vector(Script.fl_pos.x+1, 51), color(0, 0, 0, 0.8*255), nil,solusv2_fltext)
				render.text(priest_font, vector(Script.fl_pos.x, 50), color(1*255, 1*255, 1*255, 1*255), nil,solusv2_fltext)
				render.text(priest_font, Script.ex_pos+1, color(0, 0, 0, (Script.ex_alpha)*0.8*255), nil,exploit_text)
				render.text(priest_font, Script.ex_pos, color(1*255, 1*255, 1*255, Script.ex_alpha), nil,exploit_text)
				--render.rect(vector(screen_size.x-(solusv2_dsysize.x+25)-(solusv2_flsize.x+22),45), vector(screen_size.x-(solusv2_dsysize.x+25)-(solusv2_flsize.x+22)+solusv2_dsysize.x+14,45+solusv2_dsysize.y+9), color(0, 0, 0, (self.Menu_UI.visual_panel.bg_alpha:get())),math.ceil((solusv2_dsysize.x+14)*0.0675))
			end
			
			--render.blur(vector(screen_size.x-(text_size.x+21),13), vector(screen_size.x-(text_size.x+61)+text_size.x+52, text_size.y+25),color(1.0, 1,1, 1),3)
			--render.rect(vector(screen_size.x-(text_size.x+19),13), vector(screen_size.x-(text_size.x+19)+text_size.x+8,13+text_size.y+10), color(0, 0, 0, 0.6),3)
			Script.API.Rendersolusv2rect(screen_size.x-(solusv2_size.x+22),13,wtm_color1,wtm_color2,solusv2_size.x+12,solusv2_size.y+12,1,0.3,3)
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+15), 20), color(0, 0, 0, 0.8*255), nil,"Saint-")
			Script.API.RenderGradientText(screen_size.x-(solusv2_size.x+15)+render.measure_text(priest_font,"","Saint-").x, 20,color(0, 0, 0, 0.8*255),color(0, 0, 0, 0.8*255),12,priest_font,"Priest",false,false,false)
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+14)+render.measure_text(priest_font,"","Saint-Priest").x, 20), color(0, 0, 0, 0.8*255), nil,solusv2_text)
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+16), 19), color(1*255, 1*255, 1*255, 1*255), nil,"Saint-")
			Script.API.RenderGradientText(screen_size.x-(solusv2_size.x+16)+render.measure_text(priest_font,"","Saint-").x, 19,wtm_color1,wtm_color2,12,priest_font,"Priest",false,false,false)
			--render.text("Priest", vector(screen_size.x-(solusv2_size.x+15)+render.measure_text("Saint-", 12 ,priest_font).x, 20), wtm_color1, 12, priest_font)
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+15)+render.measure_text(priest_font,"","Saint-Priest").x, 19), color(1*255, 1*255, 1*255, 1*255), nil,solusv2_text)
			--Script.API.RenderGradientText(screen_size.x-(text_size.x+14),20,color(0, 0, 0, 0.8),color(0, 0, 0, 0.8),14,font_cal,watermark_text,false,false,false)
			--Script.API.RenderGradientText(screen_size.x-(text_size.x+15),19,color(1.0, 1,1, 1),color(1, 1,1, 1),14,font_cal,watermark_text,false,false,false)
		end
		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
			if entity.get_local_player() then
				Script.API.Rendersolusv2textrect(Script.fake_pos.x-8,45,color(rgb_color.r, rgb_color.g, rgb_color.b, 1.0*255),color(rgb_color.g, rgb_color.b, rgb_color.r, 1.0*255),solusv2_dsysize.x+14,solusv2_dsysize.y+9,1,0.3,3,true)
				render.text(priest_font, vector(Script.fake_pos.x+1, 51), color(0, 0, 0, 0.8*255), nil,solusv2_dsytext)
				render.text(priest_font, vector(Script.fake_pos.x, 50), color(1*255, 1*255, 1*255, 1*255), nil,solusv2_dsytext)
				Script.API.Rendersolusv2textrect(Script.fl_pos.x-5,45,color(rgb_color.r, rgb_color.g, rgb_color.b, 1.0*255),color(rgb_color.g, rgb_color.b, rgb_color.r, 1.0*255),Script.fl_size,solusv2_dsysize.y+9,1,0.3,3,true)
				render.text(priest_font, vector(Script.fl_pos.x+1, 51), color(0, 0, 0, 0.8*255), nil,solusv2_fltext)
				render.text(priest_font, vector(Script.fl_pos.x, 50), color(1*255, 1*255, 1*255, 1*255), nil,solusv2_fltext)
				render.text(priest_font, Script.ex_pos+1, color(0, 0, 0, (Script.ex_alpha)*0.8*255), nil,exploit_text)
				render.text(priest_font, Script.ex_pos, color(1*255, 1*255, 1*255, Script.ex_alpha), nil,exploit_text)
				--render.rect(vector(screen_size.x-(solusv2_dsysize.x+25)-(solusv2_flsize.x+22),45), vector(screen_size.x-(solusv2_dsysize.x+25)-(solusv2_flsize.x+22)+solusv2_dsysize.x+14,45+solusv2_dsysize.y+9), color(0, 0, 0, (self.Menu_UI.visual_panel.bg_alpha:get())),math.ceil((solusv2_dsysize.x+14)*0.0675))
				--render.text(fl_state, vector(screen_size.x-fl_size.x-6, 51), color(1.0, 1.0, 1.0, 1.0), 14,font_cal,false)
			end
			
			--render.blur(vector(screen_size.x-(text_size.x+21),13), vector(screen_size.x-(text_size.x+61)+text_size.x+52, text_size.y+25),color(1.0, 1,1, 1),3)
			--render.rect(vector(screen_size.x-(text_size.x+19),13), vector(screen_size.x-(text_size.x+19)+text_size.x+8,13+text_size.y+10), color(0, 0, 0, 0.6),3)
			Script.API.Rendersolusv2rect(screen_size.x-(solusv2_size.x+22),13,color(rgb_color.r, rgb_color.g, rgb_color.b, 1.0*255),color(rgb_color.g, rgb_color.b, rgb_color.r, 1.0*255),solusv2_size.x+12,solusv2_size.y+12,1,0.3,3,true)
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+15), 20), color(0, 0, 0, 0.8*255), nil,"Saint-")
			Script.API.RenderGradientText(screen_size.x-(solusv2_size.x+15)+render.measure_text(priest_font,"","Saint-").x, 20,color(0, 0, 0, 0.8*255),color(0, 0, 0, 0.8*255),12,priest_font,"Priest",false,false,false)
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+14)+render.measure_text(priest_font,"","Saint-Priest").x, 20), color(0, 0, 0, 0.8*255), nil,solusv2_text)
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+16), 19), color(1*255, 1*255, 1*255, 1*255), nil,"Saint-")
			Script.API.RenderGradientText(screen_size.x-(solusv2_size.x+16)+render.measure_text(priest_font,"","Saint-").x, 19,color(rgb_color.r, rgb_color.g, rgb_color.b, 1.0*255),color(rgb_color.g, rgb_color.b, rgb_color.r, 1.0*255),12,priest_font,"Priest",false,false,false)
			--render.text("Priest", vector(screen_size.x-(solusv2_size.x+15)+render.measure_text("Saint-", 12 ,priest_font).x, 20), wtm_color1, 12, priest_font)
			render.text(priest_font, vector(screen_size.x-(solusv2_size.x+15)+render.measure_text(priest_font,"","Saint-Priest").x, 19), color(1*255, 1*255, 1*255, 1*255), nil,solusv2_text)
			--Script.API.RenderGradientText(screen_size.x-(text_size.x+14),20,color(0, 0, 0, 0.8),color(0, 0, 0, 0.8),14,font_cal,watermark_text,false,false,false)
			--Script.API.RenderGradientText(screen_size.x-(text_size.x+15),19,color(1.0, 1,1, 1),color(1, 1,1, 1),14,font_cal,watermark_text,false,false,false)
		end
	end
	--world visuals
	  --hit marker
	local hit_color = self.Menu_UI.visual_panel.hit_mkcolor:get()
	local font_size = self.Menu_UI.visual_panel.hitmk_size:get()
	local font_type = "verdana"
	local real_time = self.Menu_UI.visual_panel.anim_time:get()
	local mker_type = self.API.getMemuindex(Script.Menu_table.visual_panel.hitmk_mode,self.Menu_UI.visual_panel.hit_type:get())
	if self.API.getMemuindex(Script.Menu_table.visual_panel.font_select,self.Menu_UI.visual_panel.font_Select:get()) == 1 then font_type = "verdana"
	elseif self.API.getMemuindex(Script.Menu_table.visual_panel.font_select,self.Menu_UI.visual_panel.font_Select:get()) == 2 then font_type = "Smallest Pixel-7" end
	local c_font = Script.API.CreateFont("Essential fonts\\"..font_type..".ttf",font_size)
	--print(self.Menu_UI.visual_panel.font_Select:get())
	if self.Menu_UI.visual_panel.hit_marker:get() then
		for i,v in ipairs(Script.hurt_logs) do
			--print(tostring(Script.hurt_logs[i].time))
			if globals.realtime - Script.hurt_logs[i].time >= real_time then
				table.remove(Script.hurt_logs,i)
				goto continue
			end
			local screen_pos = render.world_to_screen(Script.hurt_logs[i].pos)
			local anim_time = globals.realtime - Script.hurt_logs[i].time
			local anim_alpha = (255-(anim_time/real_time*255))
			local mark_damage = tostring(Script.hurt_logs[i].dmg)
			local float_anim = (anim_time*255)*-1/10
			if screen_pos ~= nil then
				render.text(c_font,(mker_type == 1 and vector(screen_pos.x-render.measure_text(c_font,"","-"..mark_damage).x/2,screen_pos.y) or vector(screen_pos.x-render.measure_text(c_font,"","-"..mark_damage).x/2,screen_pos.y+float_anim)), color(hit_color.r,hit_color.g, hit_color.b, anim_alpha), nil,"-"..mark_damage)
			end
			::continue::
		end
	else
		for i = #Script.hurt_logs,1,-1 do
			table.remove(Script.hurt_logs,i)
		end
	end
	    -- kill effect
	local k_font = Script.API.CreateFont("Essential fonts\\badcache.ttf",24)
	local is_deatheffect = self.Menu_UI.visual_panel.kill_efct:get()
	local effect_clr = self.Menu_UI.visual_panel.efct_color1:get()
	if is_deatheffect then
		for i,v in ipairs(Script.death_logs) do
			if globals.realtime - Script.death_logs[i].time >= 2 then
				table.remove(Script.death_logs,i)
				goto continue
			end
			local screen_pos = render.world_to_screen(Script.death_logs[i].pos)
			local anim_time = globals.realtime - Script.death_logs[i].time
			local anim_alpha = (255-(anim_time/2*255))
			local float_anim = (anim_time*255)*-1/8
			if screen_pos ~= nil then
				render.text(k_font,vector(screen_pos.x-render.measure_text(k_font,"","A").x/2,screen_pos.y+float_anim-render.measure_text(k_font,"","A").y/2), color(effect_clr.r,effect_clr.g,effect_clr.b,anim_alpha), nil,"A")
			end
			::continue::
		end
	else
		for i = #Script.death_logs,1,-1 do
			table.remove(Script.death_logs,i)
		end
	end
		--screen effect
	local effct_time = globals.realtime - Script.effect_time
	local is_screffect = self.Menu_UI.visual_panel.scr_efct:get()
	local s_efc = 120
	local h_efc = 100
	local scr_color = self.Menu_UI.visual_panel.scr_efctcolor1:get()
	if is_screffect then
		local s_step = effct_time*60
		local h_step = effct_time*50
		if Script.scr_count >= 1 then
			render.gradient(vector(0, 0), vector(h_efc-h_step, screen_size.y), color(scr_color.r, scr_color.g, scr_color.b, 255), color(scr_color.r, scr_color.g, scr_color.b, 0), color(scr_color.r, scr_color.g, scr_color.b, 255), color(scr_color.r, scr_color.g, scr_color.b, 0))
			render.gradient(vector(screen_size.x, 0), vector(screen_size.x-h_efc+h_step, screen_size.y), color(scr_color.r, scr_color.g, scr_color.b, 255), color(scr_color.r, scr_color.g, scr_color.b, 0), color(scr_color.r, scr_color.g, scr_color.b, 255), color(scr_color.r, scr_color.g, scr_color.b, 0))
			render.gradient(vector(0, 0), vector(screen_size.x, s_efc-s_step), color(scr_color.r, scr_color.g, scr_color.b, 255), color(scr_color.r, scr_color.g, scr_color.b, 255), color(scr_color.r, scr_color.g, scr_color.b, 0), color(scr_color.r, scr_color.g, scr_color.b, 0))
			render.gradient(vector(0, screen_size.y), vector(screen_size.x, screen_size.y-s_efc+s_step), color(scr_color.r, scr_color.g, scr_color.b, 255), color(scr_color.r, scr_color.g, scr_color.b, 255), color(scr_color.r, scr_color.g, scr_color.b, 0), color(scr_color.r, scr_color.g, scr_color.b, 0))
		end
		if effct_time >= 2 and Script.scr_count > 0 then
			Script.scr_count = Script.scr_count - 1
		end
	end
		--kill announcer
	local is_announcer = self.Menu_UI.visual_panel.kill_announcer:get()
	local announcer_color = self.Menu_UI.visual_panel.announcer_color:get()
	if is_announcer then
		local announcer_alpha = (255-(effct_time/2.5*255))
		local announcer_font = Script.API.CreateFont("Essential fonts\\Segoe UI Bold.ttf",28)
		local announce_size = render.measure_text(announcer_font,"",Script.announcer_count.." Struck ! ")
		local flash_alpha = (255-(effct_time*5/2*255))
		if Script.announcer_count >= 1 then
			render.text(announcer_font, vector(screen_size.x/2-announce_size.x/2,screen_size.y/3-announce_size.y), color(announcer_color.r, announcer_color.g, announcer_color.b, announcer_alpha), nil,Script.announcer_count.." Struck ! ")
			render.text(announcer_font, vector(screen_size.x/2-announce_size.x/2,screen_size.y/3-announce_size.y), color(255, 255, 255, flash_alpha), nil,Script.announcer_count.." Struck ! ")
			render.rect(vector(screen_size.x/2-announce_size.x/2,screen_size.y/3), vector(screen_size.x/2+announce_size.x/2-effct_time*(announce_size.x/2.5),screen_size.y/3+1), color(announcer_color.r, announcer_color.g, announcer_color.b, announcer_alpha))
		end
		if effct_time >= 2.5 and Script.announcer_count > 0 then
			Script.announcer_count = Script.announcer_count - 1
		end
	end
		--bullet tracer
	local impact_color = self.Menu_UI.visual_panel.tracer_color:get()
	local drop_select = self.API.getMemuindex(Script.Menu_table.visual_panel.droptop_mode,self.Menu_UI.visual_panel.droptop_select:get())
	if self.Menu_UI.visual_panel.bullet_tracer:get() and entity.get_local_player() then
		if player:is_alive() then
			local drop_font = Script.API.CreateFont("Essential fonts\\verdana.ttf",14)
			for i,v in ipairs(Script.bullet_array) do
				if globals.realtime - Script.bullet_array[i].time >= 2 then
					table.remove(Script.bullet_array,i)
					goto continue
				end
				local screen_pos = render.world_to_screen(vector(Script.bullet_array[i].impx, Script.bullet_array[i].impy, Script.bullet_array[i].impz))
				local eye_pos = render.world_to_screen(Script.bullet_array[i].pos)
				local anim_time = globals.realtime - Script.bullet_array[i].time
				local anim_alpha = (255-(anim_time/2*255))
				if screen_pos ~= nil then
					if drop_select == 1 then
						render.text(drop_font, vector(screen_pos.x-render.measure_text(drop_font,"","+").x/2, screen_pos.y-render.measure_text(drop_font,"","+").y/2), color(impact_color.r, impact_color.g, impact_color.b, anim_alpha), nil,"+")
					elseif drop_select == 2 then render.text(drop_font, vector(screen_pos.x-render.measure_text(drop_font,"","x").x/2, screen_pos.y-render.measure_text(drop_font,"","x").y/2), color(impact_color.r, impact_color.g, impact_color.b, anim_alpha), nil,"x")
					else render.circle_outline(vector(screen_pos.x, screen_pos.y),color(impact_color.r, impact_color.g, impact_color.b, anim_alpha), 6.0, 0,1,1 )
						 render.circle_outline(vector(screen_pos.x, screen_pos.y),color(impact_color.r, impact_color.g, impact_color.b, anim_alpha), 3.0, 0,1,1 )
					end
					if not self.Menu_UI.visual_panel.is_onlydrop:get() then
						render.line(eye_pos, screen_pos, color(impact_color.r, impact_color.g, impact_color.b, anim_alpha))
					end
				end
				::continue::
			end
		end
	else
		for i = #Script.bullet_array,1,-1 do
			table.remove(Script.bullet_array,i)
		end
	end
		--foot trail
	if self.Menu_UI.visual_panel.foot_trail:get() and entity.get_local_player() and player:is_alive() and plr_vel > 25 then
		local trail_clrm = self.API.getMemuindex(Script.Menu_table.visual_panel.ind_color_mode,self.Menu_UI.visual_panel.trailclr_select:get())
		local t_clr = trail_clrm == 1 and self.Menu_UI.visual_panel.trail_color:get() or color(rgb_color.r, rgb_color.g, rgb_color.b, plr_vel/6)
		local plr_footpos = player.m_vecOrigin
		local t_size = self.Menu_UI.visual_panel.trail_size:get()
		table.insert(Script.trail_arr,{remove = globals.tickcount + 30,pos = plr_footpos,colored = t_clr})
		for i,v in ipairs(Script.trail_arr) do
			local r_time = globals.tickcount
			if Script.trail_arr[i].remove <= r_time then
				table.remove(Script.trail_arr,i)
			end

			local draw_pos = render.world_to_screen(Script.trail_arr[i].pos)
			local draw_clr = Script.trail_arr[i].colored
			render.circle(draw_pos,color(draw_clr.r, draw_clr.g, draw_clr.b, plr_vel/6), t_size, 0,1 )
		end
	else
		for i = #Script.trail_arr,1,-1 do
			table.remove(Script.trail_arr,i)
		end
	end
	--weapon box
	local back_alpha = self.Menu_UI.visual_panel.bg_alpha:get()
	if self.Menu_UI.visual_panel.wepbox_ind:get() and entity.get_local_player() then-- 100 100
		local info_font = Script.API.CreateFont("Essential fonts\\Smallest Pixel-7.ttf",11)
		local info_cx = Script.Menu_UI.visual_panel.info_x:get()
		local info_cy = Script.Menu_UI.visual_panel.info_y:get()
		local hit_chance = (1 - Script.miss_shot/Script.accurate_shot)*100
		local body_mixc = (1 - Script.body_miss/Script.miss_shot)*100
		local head_misc = (1 - Script.head_miss/Script.miss_shot)*100
		local icon_size = vector(0,0)
		local info_mouse = ui.get_mouse_position()
		local timeToShoot = 0
		local cur = globals.curtime
		local weapon_index = 0
		local boxmax_length = player:get_player_weapon() ~= nil and math.max(render.measure_text(priest_font,"","Weapon info").x+10, 20+render.measure_text(weapon_font_b,"",Script.nameToIcon[(player:get_player_weapon()):get_name()]).x+render.measure_text(priest_font, "", ("HTC : %d"):format(Script.ref.Aimbot.hitchance:get())).x, 20+render.measure_text(weapon_font_b,"",Script.nameToIcon[(player:get_player_weapon()):get_name()]).x+render.measure_text(priest_font, "", ("DMG : %d"):format(Script.ref.Aimbot.damage:get())).x) or 40
		if player:is_alive() or ui.get_alpha() == 1 then
			Script.onload_alpha = Script.API.Lerp_number(Script.onload_alpha,255,globals.frametime*4)
			Script.solusv1_alphalerp = Script.API.Lerp_number(Script.solusv1_alphalerp,back_alpha,globals.frametime*4)
		else
			Script.onload_alpha = Script.API.Lerp_number(Script.onload_alpha,0,globals.frametime*8)
			Script.solusv1_alphalerp = Script.API.Lerp_number(Script.solusv1_alphalerp,0,globals.frametime*8)
		end
		if (player:get_player_weapon() ~= nil and (player:get_player_weapon()).m_iItemDefinitionIndex ~= nil) then
			if cur < (player:get_player_weapon()).m_flNextPrimaryAttack then
				timeToShoot = (player:get_player_weapon()).m_flNextPrimaryAttack - cur
			elseif cur < player.m_flNextAttack then
				timeToShoot = player.m_flNextAttack - cur
			end
			if math.floor((timeToShoot * 1000) + 0.5) <= 10 then
				timeToShoot = 0
			end
			if timeToShoot > 1.9 then
				timeToShoot = 0
			end
			Script.shot_time = math.max(Script.shot_time,math.floor((timeToShoot * 1000) + 0.5))
			weapon_index = (player:get_player_weapon()).m_iItemDefinitionIndex
		end
		--print(tostring(weapon_index))
		if ui.get_alpha() == 1 and (info_mouse.x >= info_cx-20 and info_mouse.y >= info_cy-20 and info_mouse.x <= info_cx+170 and info_mouse.y <= info_cy+100) then
			Script.box_dragable = Script.API.Lerp_number(Script.box_dragable,255,globals.frametime*6)
			--self.Menu_UI.misc.speed_x:set(Script.spddef_x)
			--self.Menu_UI.misc.speed_y:set(Script.spddef_y)
		else
			Script.box_dragable = Script.API.Lerp_number(Script.box_dragable,0,globals.frametime*6)
		end
		Script.API.RenderBlurRoundedtoalpharect(info_cx-20, info_cy-20, color(drag_clr.r,drag_clr.g,drag_clr.b,Script.box_dragable), color(drag_clr.r,drag_clr.g,drag_clr.b,Script.box_dragable), self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 2 and 190 or Script.box_length+40, 120,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"DRAGABLE",0,true,true)
		if self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 2 then
			if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
				Script.box_rect = Script.accurate_shot ~= 0 and Script.API.Lerp_number(Script.box_rect,hit_chance*0.6,globals.frametime*4) or 0
				--Script.API.RenderBlurRoundedtoalpharect(info_cx-20, info_cy-20, color(1,1,1,Script.spddrag_alpha), color(1,1,1,Script.spddrag_alpha), 252, 88,1,0.02,"Essential fonts\\Smallest Pixel-7.ttf",11,"DRAGABLE",0,true,true)
				Script.API.Rendeweaponbox(info_cx, info_cy, color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.onload_alpha), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.onload_alpha), 150, 80,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"WEAPON INFO",0,true,true)
				render.rect(vector(info_cx+10, info_cy+10), vector(info_cx+13, info_cy+70), color(22, 22, 22, (Script.onload_alpha)*0.8),6)
				render.rect(vector(info_cx+10, info_cy+70-Script.box_rect), vector(info_cx+13, info_cy+70), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.onload_alpha),6)
				render.rect(vector(info_cx+8, info_cy+70-Script.box_rect), vector(info_cx+15, info_cy+68-Script.box_rect),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.onload_alpha),6)
				render.text(info_font, vector(info_cx+27, info_cy+12), color(255, 255, 255, Script.onload_alpha), nil,"Hit Rate:")
				render.text(info_font, vector(info_cx+27, info_cy+28), color(255, 255, 255, Script.onload_alpha), nil,"Body mis:")
				render.text(info_font, vector(info_cx+27, info_cy+44), color(255, 255, 255, Script.onload_alpha), nil,"Head mis:")
				render.text(info_font, vector(info_cx+27, info_cy+60), color(255, 255, 255, Script.onload_alpha), nil,"Cur DMG:")
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%.1f%%"):format(hit_chance)).x, info_cy+12), color(255, 255, 255, Script.onload_alpha), nil,("%.1f%%"):format(hit_chance))
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%.1f%%"):format(body_mixc)).x, info_cy+28), color(255, 255, 255, Script.onload_alpha), nil,("%.1f%%"):format(body_mixc))
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%.1f%%"):format(head_misc)).x, info_cy+44), color(255, 255, 255, Script.onload_alpha), nil,("%.1f%%"):format(head_misc))
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%d"):format(Script.ref.Aimbot.damage:get())).x, info_cy+60), color(255, 255, 255, Script.onload_alpha), nil,("%d"):format(Script.ref.Aimbot.damage:get()))
			elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
				Script.box_rect = Script.accurate_shot ~= 0 and Script.API.Lerp_number(Script.box_rect,hit_chance*0.6,globals.frametime*4) or 0
				--Script.API.RenderBlurRoundedtoalpharect(info_cx-20, info_cy-20, color(1,1,1,Script.spddrag_alpha), color(1,1,1,Script.spddrag_alpha), 252, 88,1,0.02,"Essential fonts\\Smallest Pixel-7.ttf",11,"DRAGABLE",0,true,true)
				Script.API.Rendeweaponbox(info_cx, info_cy, color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.onload_alpha), wtm_color2, 150, 80,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"WEAPON INFO",1,true,true)
				render.rect(vector(info_cx+10, info_cy+10), vector(info_cx+13, info_cy+70), color(22, 22, 22, (Script.onload_alpha)*0.8),6)
				render.rect(vector(info_cx+10, info_cy+70-Script.box_rect), vector(info_cx+13, info_cy+70), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.onload_alpha),6)
				render.rect(vector(info_cx+8, info_cy+70-Script.box_rect), vector(info_cx+15, info_cy+68-Script.box_rect),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.onload_alpha),6)
				render.text(info_font, vector(info_cx+27, info_cy+12), color(255, 255, 255, Script.onload_alpha), nil,"Hit Rate:")
				render.text(info_font, vector(info_cx+27, info_cy+28), color(255, 255, 255, Script.onload_alpha), nil,"Body mis:")
				render.text(info_font, vector(info_cx+27, info_cy+44), color(255, 255, 255, Script.onload_alpha), nil,"Head mis:")
				render.text(info_font, vector(info_cx+27, info_cy+60), color(255, 255, 255, Script.onload_alpha), nil,"Cur DMG:")
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%.1f%%"):format(hit_chance)).x, info_cy+12), color(255, 255, 255, Script.onload_alpha), nil,("%.1f%%"):format(hit_chance))
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%.1f%%"):format(body_mixc)).x, info_cy+28), color(255, 255, 255, Script.onload_alpha), nil,("%.1f%%"):format(body_mixc))
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%.1f%%"):format(head_misc)).x, info_cy+44), color(255, 255, 255, Script.onload_alpha), nil,("%.1f%%"):format(head_misc))
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%d"):format(Script.ref.Aimbot.damage:get())).x, info_cy+60), color(255, 255, 255, Script.onload_alpha), nil,("%d"):format(Script.ref.Aimbot.damage:get()))
			elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
				Script.box_rect = Script.accurate_shot ~= 0 and Script.API.Lerp_number(Script.box_rect,hit_chance*0.6,globals.frametime*4) or 0
				--Script.API.RenderBlurRoundedtoalpharect(info_cx-20, info_cy-20, color(1,1,1,Script.spddrag_alpha), color(1,1,1,Script.spddrag_alpha), 252, 88,1,0.02,"Essential fonts\\Smallest Pixel-7.ttf",11,"DRAGABLE",0,true,true)
				Script.API.Rendeweaponbox(info_cx, info_cy, color(rgb_color.r, rgb_color.g, rgb_color.b, Script.onload_alpha),color(rgb_color.g, rgb_color.b, rgb_color.r, Script.onload_alpha), 150, 80,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"WEAPON INFO",2,true,true)
				render.rect(vector(info_cx+10, info_cy+10), vector(info_cx+13, info_cy+70), color(22, 22, 22, (Script.onload_alpha)*0.8),6)
				render.gradient(vector(info_cx+10, info_cy+70-Script.box_rect), vector(info_cx+13, info_cy+70),color(rgb_color.g, rgb_color.b, rgb_color.r,Script.onload_alpha),color(rgb_color.g, rgb_color.b, rgb_color.r,Script.onload_alpha), color(rgb_color.r, rgb_color.g, rgb_color.b,Script.onload_alpha),color(rgb_color.r, rgb_color.g, rgb_color.b,Script.onload_alpha))
				render.gradient(vector(info_cx+8, info_cy+70-Script.box_rect), vector(info_cx+15, info_cy+68-Script.box_rect),color(rgb_color.g, rgb_color.b, rgb_color.r,Script.onload_alpha),color(rgb_color.g, rgb_color.b, rgb_color.r,Script.onload_alpha),color(rgb_color.g, rgb_color.b, rgb_color.r,Script.onload_alpha),color(rgb_color.g, rgb_color.b, rgb_color.r,Script.onload_alpha))
				render.text(info_font, vector(info_cx+27, info_cy+12), color(255, 255, 255, Script.onload_alpha), nil,"Hit Rate:")
				render.text(info_font, vector(info_cx+27, info_cy+28), color(255, 255, 255, Script.onload_alpha), nil,"Body mis:")
				render.text(info_font, vector(info_cx+27, info_cy+44), color(255, 255, 255, Script.onload_alpha), nil,"Head mis:")
				render.text(info_font, vector(info_cx+27, info_cy+60), color(255, 255, 255, Script.onload_alpha), nil,"Cur DMG:")
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%.1f%%"):format(hit_chance)).x, info_cy+12), color(255, 255, 255, Script.onload_alpha), nil,("%.1f%%"):format(hit_chance))
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%.1f%%"):format(body_mixc)).x, info_cy+28), color(255, 255, 255, Script.onload_alpha), nil,("%.1f%%"):format(body_mixc))
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%.1f%%"):format(head_misc)).x, info_cy+44), color(255, 255, 255, Script.onload_alpha), nil,("%.1f%%"):format(head_misc))
				render.text(info_font, vector(info_cx+135-render.measure_text(info_font,"",("%d"):format(Script.ref.Aimbot.damage:get())).x, info_cy+60), color(255, 255, 255, Script.onload_alpha), nil,("%d"):format(Script.ref.Aimbot.damage:get()))
			end
		elseif self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 3 then
			Script.box_length = Script.API.Lerp_number(Script.box_length, boxmax_length, globals.frametime*8)
			if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
				render.gradient(vector(info_cx, info_cy), vector(info_cx+Script.box_length, info_cy+2), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.onload_alpha), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.onload_alpha), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.onload_alpha), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.onload_alpha))
				render.gradient(vector(info_cx, info_cy+2), vector(info_cx+Script.box_length, info_cy+render.measure_text(priest_font,"","Weapon info").y+8), color(22, 22, 22, (Script.solusv1_alphalerp)), color(22, 22, 22, (Script.solusv1_alphalerp)), color(22, 22, 22, (Script.solusv1_alphalerp)), color(22, 22, 22, (Script.solusv1_alphalerp)))
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2+1, info_cy+1+render.measure_text(priest_font,"","Weapon info").y/2-1), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,"Weapon info")
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2, info_cy+render.measure_text(priest_font,"","Weapon info").y/2-1), color(255, 255, 255, Script.onload_alpha), nil,"Weapon info")

				if player:get_player_weapon() ~= nil then
					render.text(weapon_font_b, vector(info_cx+5, info_cy+30), color(255, 255, 255, Script.onload_alpha), nil,Script.nameToIcon[(player:get_player_weapon()):get_name()])
					icon_size = render.measure_text(weapon_font_b,"",Script.nameToIcon[(player:get_player_weapon()):get_name()])
				end
				--Render.WeaponIcon(weapon_index, vector(info_cx+5, info_cy+30), color(1, 1, 1, Script.onload_alpha), 24)
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+44), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+43), color(255, 255, 255, Script.onload_alpha), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+28), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+27), color(255, 255, 255, Script.onload_alpha), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5+1, info_cy+41+icon_size.y), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5, info_cy+40+icon_size.y), color(255, 255, 255, Script.onload_alpha), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.gradient(vector(info_cx+9+render.measure_text(priest_font,"","FIRED :").x, info_cy+40+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), vector(info_cx+8+render.measure_text(priest_font,"","FIRED :").x+timeToShoot*Script.box_length/2, info_cy+43+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0),color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0))
			elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
				render.gradient(vector(info_cx, info_cy), vector(info_cx+Script.box_length/2, info_cy+2), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, Script.onload_alpha), color(wtm_color1.g, wtm_color1.b, wtm_color1.r,Script.onload_alpha), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, Script.onload_alpha), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, Script.onload_alpha))
				render.gradient(vector(info_cx+Script.box_length/2, info_cy), vector(info_cx+Script.box_length, info_cy+2), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, Script.onload_alpha), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, Script.onload_alpha), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, Script.onload_alpha), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, Script.onload_alpha))
				render.gradient(vector(info_cx, info_cy+2), vector(info_cx+Script.box_length, info_cy+render.measure_text(priest_font,"","Weapon info").y+8), color(22, 22, 22, (Script.solusv1_alphalerp)), color(22, 22, 22, (Script.solusv1_alphalerp)), color(22, 22, 22, (Script.solusv1_alphalerp)), color(22, 22, 22, (Script.solusv1_alphalerp)))
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2+1, info_cy+1+render.measure_text(priest_font,"","Weapon info").y/2-1), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,"Weapon info")
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2, info_cy+render.measure_text(priest_font,"","Weapon info").y/2-1), color(255, 255, 255, Script.onload_alpha), nil,"Weapon info")
				if player:get_player_weapon() ~= nil then
					render.text(weapon_font_b, vector(info_cx+5, info_cy+30), color(255, 255, 255, Script.onload_alpha), nil,Script.nameToIcon[(player:get_player_weapon()):get_name()])
					icon_size = render.measure_text(weapon_font_b,"",Script.nameToIcon[(player:get_player_weapon()):get_name()])
				end
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+44), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+43), color(255, 255, 255, Script.onload_alpha), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+28), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+27), color(255, 255, 255, Script.onload_alpha), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5+1, info_cy+41+icon_size.y), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5, info_cy+40+icon_size.y), color(255, 255, 255, Script.onload_alpha), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.gradient(vector(info_cx+9+render.measure_text(priest_font,"","FIRED :").x, info_cy+40+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), vector(info_cx+8+render.measure_text(priest_font,"","FIRED :").x+timeToShoot*Script.box_length/2, info_cy+43+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0),color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0))
			elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
				render.gradient(vector(info_cx, info_cy), vector(info_cx+Script.box_length/2, info_cy+2), color(rgb_color.r, rgb_color.g, rgb_color.b, Script.onload_alpha), color(rgb_color.b, rgb_color.r, rgb_color.g, Script.onload_alpha), color(rgb_color.r, rgb_color.g, rgb_color.b, Script.onload_alpha), color(rgb_color.b, rgb_color.r, rgb_color.g, Script.onload_alpha))
				render.gradient(vector(info_cx+Script.box_length/2, info_cy), vector(info_cx+Script.box_length, info_cy+2), color(rgb_color.b, rgb_color.r, rgb_color.g, Script.onload_alpha), color(rgb_color.g, rgb_color.b, rgb_color.r, Script.onload_alpha), color(rgb_color.b, rgb_color.r, rgb_color.g, Script.onload_alpha), color(rgb_color.g, rgb_color.b, rgb_color.r, Script.onload_alpha))
				render.gradient(vector(info_cx, info_cy+2), vector(info_cx+Script.box_length, info_cy+render.measure_text(priest_font,"","Weapon info").y+8), color(22, 22, 22, (Script.solusv1_alphalerp)), color(22, 22, 22, (Script.solusv1_alphalerp)), color(22, 22, 22, (Script.solusv1_alphalerp)), color(22, 22, 22, (Script.solusv1_alphalerp)))
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2+1, info_cy+1+render.measure_text(priest_font,"","Weapon info").y/2-1), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,"Weapon info")
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2, info_cy+render.measure_text(priest_font,"","Weapon info").y/2-1), color(255, 255, 255, Script.onload_alpha), nil,"Weapon info")
				if player:get_player_weapon() ~= nil then
					render.text(weapon_font_b, vector(info_cx+5, info_cy+30), color(255, 255, 255, Script.onload_alpha), nil,Script.nameToIcon[(player:get_player_weapon()):get_name()])
					icon_size = render.measure_text(weapon_font_b,"",Script.nameToIcon[(player:get_player_weapon()):get_name()])
				end
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+44), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+43), color(255, 255, 255, Script.onload_alpha), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+28), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+27), color(255, 255, 255, Script.onload_alpha), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5+1, info_cy+41+icon_size.y), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5, info_cy+40+icon_size.y), color(255, 255, 255, Script.onload_alpha), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.gradient(vector(info_cx+9+render.measure_text(priest_font,"","FIRED :").x, info_cy+40+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), vector(info_cx+8+render.measure_text(priest_font,"","FIRED :").x+timeToShoot*Script.box_length/2, info_cy+43+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0),color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0))
			end
		elseif self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 4 then
			Script.box_length = Script.API.Lerp_number(Script.box_length, boxmax_length, globals.frametime*8)
			if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
				Script.API.Rendersolusv2rectwindow(info_cx, info_cy, color(wtm_color1.r, wtm_color1.g, wtm_color1.b, Script.onload_alpha), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, Script.onload_alpha), Script.box_length, render.measure_text(priest_font,"","Weapon info").y+8,1,0.6,3)
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2+1, info_cy-1+render.measure_text(priest_font,"","Weapon info").y/2), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,"Weapon info")
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2, info_cy+render.measure_text(priest_font,"","Weapon info").y/2-2), color(255, 255, 255, Script.onload_alpha), nil,"Weapon info")
				if player:get_player_weapon() ~= nil then
					render.text(weapon_font_b, vector(info_cx+5, info_cy+30), color(255, 255, 255, Script.onload_alpha), nil,Script.nameToIcon[(player:get_player_weapon()):get_name()])
					icon_size = render.measure_text(weapon_font_b,"",Script.nameToIcon[(player:get_player_weapon()):get_name()])
				end
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+28), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+27), color(255, 255, 255, Script.onload_alpha), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+44), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+43), color(255, 255, 255, Script.onload_alpha), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5+1, info_cy+41+icon_size.y), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5, info_cy+40+icon_size.y), color(255, 255, 255, Script.onload_alpha), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.gradient(vector(info_cx+9+render.measure_text(priest_font,"","FIRED :").x, info_cy+40+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), vector(info_cx+8+render.measure_text(priest_font,"","FIRED :").x+timeToShoot*Script.box_length/2, info_cy+43+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0),color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0))
			elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
				Script.API.Rendersolusv2rectwindow(info_cx, info_cy, color(wtm_color1.r, wtm_color1.g, wtm_color1.b, Script.onload_alpha), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, Script.onload_alpha), Script.box_length, render.measure_text(priest_font,"","Weapon info").y+8,1,0.6,3)
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2+1, info_cy-1+render.measure_text(priest_font,"","Weapon info").y/2), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,"Weapon info")
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2, info_cy+render.measure_text(priest_font,"","Weapon info").y/2-2), color(255, 255, 255, Script.onload_alpha), nil,"Weapon info")
				if player:get_player_weapon() ~= nil then
					render.text(weapon_font_b, vector(info_cx+5, info_cy+30), color(255, 255, 255, Script.onload_alpha), nil,Script.nameToIcon[(player:get_player_weapon()):get_name()])
					icon_size = render.measure_text(weapon_font_b,"",Script.nameToIcon[(player:get_player_weapon()):get_name()])
				end
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+28), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+27), color(255, 255, 255, Script.onload_alpha), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+44), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+43), color(255, 255, 255, Script.onload_alpha), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5+1, info_cy+41+icon_size.y), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5, info_cy+40+icon_size.y), color(255, 255, 255, Script.onload_alpha), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.gradient(vector(info_cx+9+render.measure_text(priest_font,"","FIRED :").x, info_cy+40+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), vector(info_cx+8+render.measure_text(priest_font,"","FIRED :").x+timeToShoot*Script.box_length/2, info_cy+43+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0),color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0))
			elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
				Script.API.Rendersolusv2rectwindow(info_cx, info_cy, color(rgb_color.r, rgb_color.g, rgb_color.b, Script.onload_alpha), color(rgb_color.g, rgb_color.b, rgb_color.r, Script.onload_alpha), Script.box_length, render.measure_text(priest_font,"","Weapon info").y+8,1,0.6,3,true)
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2+1, info_cy-1+render.measure_text(priest_font,"","Weapon info").y/2), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,"Weapon info")
				render.text(priest_font, vector(info_cx+Script.box_length/2-render.measure_text(priest_font,"","Weapon info").x/2, info_cy+render.measure_text(priest_font,"","Weapon info").y/2-2), color(255, 255, 255, Script.onload_alpha), nil,"Weapon info")
				if player:get_player_weapon() ~= nil then
					render.text(weapon_font_b, vector(info_cx+5, info_cy+30), color(255, 255, 255, Script.onload_alpha), nil,Script.nameToIcon[(player:get_player_weapon()):get_name()])
					icon_size = render.measure_text(weapon_font_b,"",Script.nameToIcon[(player:get_player_weapon()):get_name()])
				end
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+28), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+27), color(255, 255, 255, Script.onload_alpha), nil,("HTC : %d"):format(Script.ref.Aimbot.hitchance:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x+1, info_cy+44), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+15+icon_size.x, info_cy+43), color(255, 255, 255, Script.onload_alpha), nil,("DMG : %d"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5+1, info_cy+41+icon_size.y), color(0, 0, 0, (Script.onload_alpha)*0.8), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.text(priest_font, vector(info_cx+5, info_cy+40+icon_size.y), color(255, 255, 255, Script.onload_alpha), nil,("FIRED :"):format(Script.ref.Aimbot.damage:get()))
				render.gradient(vector(info_cx+9+render.measure_text(priest_font,"","FIRED :").x, info_cy+40+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), vector(info_cx+8+render.measure_text(priest_font,"","FIRED :").x+timeToShoot*Script.box_length/2, info_cy+43+icon_size.y+render.measure_text(priest_font,"","FIRED :").y/2), color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0),color(255, 255, 255, Script.onload_alpha),color(255, 255, 255, 0))
			end
		end
		if ui.get_alpha() == 1 and common.is_button_down(0x1) and (info_mouse.x >= info_cx-20 and info_mouse.y >= info_cy-20 and info_mouse.x <= (self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 2 and info_cx+190 or info_cx+Script.box_length+20) and info_mouse.y <= info_cy+100) then
			Script.bosdef_x = math.floor(Script.API.Lerp_number(Script.bosdef_x,info_mouse.x-75,globals.frametime * 30))
			Script.bosdef_y = math.floor(Script.API.Lerp_number(Script.bosdef_y,info_mouse.y-40,globals.frametime * 30))
			--print(tostring(info_mouse.x-75))
			Script.Menu_UI.visual_panel.info_x:set(Script.bosdef_x)
			Script.Menu_UI.visual_panel.info_y:set(Script.bosdef_y)
			--self.Menu_UI.misc.speed_x:set(Script.spddef_x)
			--self.Menu_UI.misc.speed_y:set(Script.spddef_y)
		end
	end
	--keybinds
	local max_length = 75
	local max_height = 10
	local activate_binds = {}
	local max_key_alpha = 0
	local binds_list = ui.get_binds()
	local animation_speed = 80 --百分比速度
	local frametime = globals.frametime * (animation_speed / 10)
	if entity.get_local_player() and self.Menu_UI.visual_panel.windows_slect:get(1) and self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) ~= 1 then-- and player:is_alive() and #binds_list > 0
		-- local activate_keys = false
		local keybinds_x = self.Menu_UI.visual_panel.binds_x:get()
		local keybinds_y = self.Menu_UI.visual_panel.binds_y:get()
		local mouse = ui.get_mouse_position()
		-- if #binds_list > 0 then
		-- 	max_length = (self.API.Get_length_keybinds(binds_list , 12 ,priest_font) <= 75) and 75 or Script.API.Get_length_keybinds(binds_list , 12 ,priest_font) + (screen_size.x/1920)*10
		-- end
	
		for i, m_key in pairs(binds_list) do
			if self.m_keys[m_key.name] == nil then
				self.m_keys[m_key.name] = {
					alpha = 0,
					name = m_key.name,
					mode = m_key.mode == 2 and "[toggled]" or "[holding]"
				}
			end
	
			activate_binds[m_key.name] = true
			self.m_keys[m_key.name].mode = m_key.mode == 2 and "[toggled]" or "[holding]"
			self.m_keys[m_key.name].alpha = self.API.Clamp(self.API.Anim_Lerp(self.m_keys[m_key.name].alpha, m_key.active and 1 or 0, frametime), 0, 1)
		end
	
		local m_update_index = 0
		if Script.m_keys ~= nil then
			for _, data in pairs(self.m_keys) do
				if data.alpha > 0 and not activate_binds[data.name] then
					data.alpha = self.API.Clamp(self.API.Anim_Lerp(data.alpha, 0, frametime), 0, 1)
				elseif data.alpha > 0 and activate_binds[data.name] then
					-- activate_keys = true
					max_height = max_height + (15 * data.alpha)
					local key_size = render.measure_text(priest_font,"",data.name)
					local mode_size = render.measure_text(priest_font,"",data.mode)
					if max_key_alpha < data.alpha then
						max_key_alpha = data.alpha
					end
	
					if max_length < ((key_size.x + mode_size.x) + 10) then
						max_length = max_length + ((((key_size.x + mode_size.x) + 10) - max_length) * data.alpha)
					end
				end
			end
		end
		--Script.API.RenderFilledRoundedgradientrect(screen_size.x/2, screen_size.y/2, color(1,1,1,1),  color(1,1,1,1), 25, 25,0.18)
		local animation_box = self.API.CreateLerpAnimation(max_key_alpha, max_key_alpha, animation_speed, "Lerp keybinds alpha")
		--animation_box是需要用的方框透明度
		local current_length = self.API.CreateLerpAnimation(max_length, max_length, animation_speed, "Lerp keybinds length")
		if ui.get_alpha() == 1 and (mouse.x >= keybinds_x - 20 and mouse.y >= keybinds_y - 42 and mouse.x <= keybinds_x + current_length + 40 and mouse.y <= keybinds_y + max_height + 60) then
			Script.key_drag = Script.API.Lerp_number(Script.key_drag, 255, globals.frametime*8)
		else
			Script.key_drag = Script.API.Lerp_number(Script.key_drag, 0, globals.frametime*8)
		end
		Script.API.RenderBlurRoundedtoalpharect(keybinds_x-20, keybinds_y - 42, color(drag_clr.r,drag_clr.g,drag_clr.b,Script.key_drag), color(drag_clr.r,drag_clr.g,drag_clr.b,Script.key_drag), current_length+40, max_height+60,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"DRAGABLE",0,true,true)
		if self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 2 then
			if ui.get_alpha() == 1 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					Script.API.RenderBlurRoundedtoalpharect(keybinds_x-3, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color1, animation_box), current_length+6, max_height+1,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"KEYBINDS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					Script.API.RenderBlurRoundedtoalpharect(keybinds_x-3, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), current_length+6, max_height+1,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"KEYBINDS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					Script.API.RenderBlurRoundedtoalpharect(keybinds_x-3, keybinds_y - 5, color(rgb_color.r, rgb_color.g, rgb_color.b, 255), color(rgb_color.r, rgb_color.g, rgb_color.b, 255), current_length+6, max_height+1,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"KEYBINDS",2,true,true)
				end
				if common.is_button_down(0x1) and (mouse.x >= keybinds_x - 20 and mouse.y >= keybinds_y - 42 and mouse.x <= keybinds_x + current_length + 40 and mouse.y <= keybinds_y + max_height + 60) then
					self.Menu_UI.visual_panel.binds_x:set(mouse.x-math.floor(current_length/2))
					self.Menu_UI.visual_panel.binds_y:set(mouse.y-math.floor(max_height/2))
				end
			elseif not (ui.get_alpha() == 1) and player:is_alive() and animation_box > 0 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					Script.API.RenderBlurRoundedtoalpharect(keybinds_x-3, keybinds_y - 5, self.API.ColorModifier(wtm_color1, animation_box),self.API.ColorModifier(wtm_color1, animation_box), current_length+6, max_height+1,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"KEYBINDS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					Script.API.RenderBlurRoundedtoalpharect(keybinds_x-3, keybinds_y - 5, self.API.ColorModifier(wtm_color1, animation_box),self.API.ColorModifier(wtm_color2, animation_box), current_length+6, max_height+1,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"KEYBINDS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					Script.API.RenderBlurRoundedtoalpharect(keybinds_x-3, keybinds_y - 5, color(rgb_color.r, rgb_color.g, rgb_color.b, rgb_color.a*255 * animation_box), color(rgb_color.r, rgb_color.g, rgb_color.b, rgb_color.a*255 * animation_box), current_length+6, max_height+1,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"KEYBINDS",2,true,true)
				end
			end
		elseif self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 3 then
			if ui.get_alpha() == 1 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					render.rect(vector(keybinds_x, keybinds_y - 20), vector(keybinds_x+current_length, keybinds_y - 20 + render.measure_text(priest_font,"","keybinds").y + 8), color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()))
					render.rect(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length, keybinds_y-20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255))
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-2), color(0, 0, 0, 0.8*255), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color1, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					render.rect(vector(keybinds_x, keybinds_y - 20), vector(keybinds_x+current_length, keybinds_y - 20 + render.measure_text(priest_font,"","keybinds").y + 8), color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()))

					render.gradient(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length/2, keybinds_y - 20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255))
					render.gradient(vector(keybinds_x+current_length/2,keybinds_y - 22), vector(keybinds_x+current_length,keybinds_y - 20), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 255))
					--render.rect(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length, keybinds_y-20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1))
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-2), color(0, 0, 0, 0.8*255), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					render.rect(vector(keybinds_x, keybinds_y - 20), vector(keybinds_x+current_length, keybinds_y - 20 + render.measure_text(priest_font,"","keybinds").y + 8), color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()))
					render.gradient(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length/2, keybinds_y - 20), color(rgb_color.r, rgb_color.g, rgb_color.b, 255), color(rgb_color.b, rgb_color.r, rgb_color.g, 255), color(rgb_color.r, rgb_color.g, rgb_color.b, 255), color(rgb_color.b, rgb_color.r, rgb_color.g, 255))
					render.gradient(vector(keybinds_x+current_length/2,keybinds_y - 22), vector(keybinds_x+current_length,keybinds_y - 20), color(rgb_color.b, rgb_color.r, rgb_color.g, 255), color(rgb_color.g, rgb_color.b, rgb_color.r, 255), color(rgb_color.b, rgb_color.r, rgb_color.g, 255), color(rgb_color.g, rgb_color.b, rgb_color.r, 255))
					--render.rect(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length, keybinds_y-20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1))
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-2), color(0, 0, 0, 0.8*255), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",1,true,true)
				end
	
				if common.is_button_down(0x1) and (mouse.x >= keybinds_x - 20 and mouse.y >= keybinds_y - 42 and mouse.x <= keybinds_x + current_length + 40 and mouse.y <= keybinds_y + max_height + 60) then
					self.Menu_UI.visual_panel.binds_x:set(mouse.x-math.floor(current_length/2))
					self.Menu_UI.visual_panel.binds_y:set(mouse.y-math.floor(max_height/2))
				end
			elseif not (ui.get_alpha() == 1) and player:is_alive() and animation_box > 0 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					render.rect(vector(keybinds_x, keybinds_y - 20), vector(keybinds_x+current_length, keybinds_y - 20 + render.measure_text(priest_font,"","keybinds").y + 8), self.API.ColorModifier(color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()),animation_box))
					render.rect(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length, keybinds_y-20), self.API.ColorModifier(color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255),animation_box))
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-2), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color1, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					render.rect(vector(keybinds_x, keybinds_y - 20), vector(keybinds_x+current_length, keybinds_y - 20 + render.measure_text(priest_font,"","keybinds").y + 8), self.API.ColorModifier(color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()),animation_box))

					render.gradient(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length/2, keybinds_y - 20), self.API.ColorModifier(color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255),animation_box), self.API.ColorModifier(color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255),animation_box), self.API.ColorModifier(color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255),animation_box), self.API.ColorModifier(color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255),animation_box))
					render.gradient(vector(keybinds_x+current_length/2,keybinds_y - 22), vector(keybinds_x+current_length,keybinds_y - 20), self.API.ColorModifier(color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255),animation_box), self.API.ColorModifier(color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 255),animation_box), self.API.ColorModifier(color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255),animation_box), self.API.ColorModifier(color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 255),animation_box))

					--render.gradient(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length/2, keybinds_y - 20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1))
					--render.gradient(vector(keybinds_x+current_length/2,keybinds_y - 22), vector(keybinds_x+current_length,keybinds_y - 20), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 1), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 1))
					--render.rect(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length, keybinds_y-20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1))
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-2), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					render.rect(vector(keybinds_x, keybinds_y - 20), vector(keybinds_x+current_length, keybinds_y - 20 + render.measure_text(priest_font,"","keybinds").y + 8), self.API.ColorModifier(color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()),animation_box))
					render.gradient(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length/2, keybinds_y - 20), self.API.ColorModifier(color(rgb_color.r, rgb_color.g, rgb_color.b, 255),animation_box), self.API.ColorModifier(color(rgb_color.b, rgb_color.r, rgb_color.g, 255),animation_box), self.API.ColorModifier(color(rgb_color.r, rgb_color.g, rgb_color.b, 255),animation_box), self.API.ColorModifier(color(rgb_color.b, rgb_color.r, rgb_color.g, 255),animation_box))
					render.gradient(vector(keybinds_x+current_length/2,keybinds_y - 22), vector(keybinds_x+current_length,keybinds_y - 20), self.API.ColorModifier(color(rgb_color.b, rgb_color.r, rgb_color.g, 255),animation_box), self.API.ColorModifier(color(rgb_color.g, rgb_color.b, rgb_color.r, 255),animation_box), self.API.ColorModifier(color(rgb_color.b, rgb_color.r, rgb_color.g, 255),animation_box), self.API.ColorModifier(color(rgb_color.g, rgb_color.b, rgb_color.r, 255),animation_box))
					--render.rect(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length, keybinds_y-20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1))
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-2), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",1,true,true)
				end
			end
		elseif self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 4 then
			if ui.get_alpha() == 1 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					Script.API.Rendersolusv2rectwindow(keybinds_x, keybinds_y - 20, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color1, 1), current_length, render.measure_text(priest_font,"","keybinds").y + 8,1,0.6,3)
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 19+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),1), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),1), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color1, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					Script.API.Rendersolusv2rectwindow(keybinds_x, keybinds_y - 20, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, 1), current_length, render.measure_text(priest_font,"","keybinds").y + 8,1,0.6,3)
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 19+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),1), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),1), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					Script.API.Rendersolusv2rectwindow(keybinds_x, keybinds_y - 20, color(rgb_color.r, rgb_color.g, rgb_color.b, 255), color(rgb_color.g, rgb_color.b, rgb_color.r, 255), current_length, render.measure_text(priest_font,"","keybinds").y + 8,1,0.6,3,true)
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 19+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),1), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),1), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, color(rgb_color.r, rgb_color.g, rgb_color.b, 1), color(rgb_color.r, rgb_color.g, rgb_color.b, 1), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",2,true,true)
				end
	
				if common.is_button_down(0x1) and (mouse.x >= keybinds_x - 20 and mouse.y >= keybinds_y - 42 and mouse.x <= keybinds_x + current_length + 40 and mouse.y <= keybinds_y + max_height + 60) then
					self.Menu_UI.visual_panel.binds_x:set(mouse.x-math.floor(current_length/2))
					self.Menu_UI.visual_panel.binds_y:set(mouse.y-math.floor(max_height/2))
				end
			elseif not (ui.get_alpha() == 1) and player:is_alive() and animation_box > 0 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					Script.API.Rendersolusv2rectwindow(keybinds_x, keybinds_y - 20, self.API.ColorModifier(wtm_color1, animation_box), self.API.ColorModifier(wtm_color1, animation_box), current_length, render.measure_text(priest_font,"","keybinds").y + 8,1,0.6,3)
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 19+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, animation_box),self.API.ColorModifier(wtm_color1, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					Script.API.Rendersolusv2rectwindow(keybinds_x, keybinds_y - 20, self.API.ColorModifier(wtm_color1, animation_box), self.API.ColorModifier(wtm_color2, animation_box), current_length, render.measure_text(priest_font,"","keybinds").y + 8,1,0.6,3)
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 19+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, animation_box),self.API.ColorModifier(wtm_color2, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					Script.API.Rendersolusv2rectwindow(keybinds_x, keybinds_y - 20, color(rgb_color.r, rgb_color.g, rgb_color.b, rgb_color.a*255 * animation_box), color(rgb_color.g, rgb_color.b, rgb_color.r, rgb_color.a*255 * animation_box), current_length, render.measure_text(priest_font,"","keybinds").y + 8,1,0.6,3,true)
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2+1, keybinds_y - 19+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"keybinds")
					render.text(priest_font, vector(keybinds_x-render.measure_text(priest_font,"","keybinds").x/2+current_length/2, keybinds_y - 20+render.measure_text(priest_font,"","keybinds").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"keybinds")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, color(rgb_color.r, rgb_color.g, rgb_color.b, rgb_color.a * animation_box), color(rgb_color.r, rgb_color.g, rgb_color.b, rgb_color.a * animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",2,true,true)
				end
			end
		end
		--print(tostring(Script.m_keys ~= nil))
		if Script.m_keys ~= nil then
			for _, data in pairs(self.m_keys) do
				--print(tostring(_))
				if data.alpha > 0 and activate_binds[data.name] then
					local m_key_name = data.name
					if false then --按键字体动画 改成if true后开启 或添加开启判定, mode也可同样添加
						m_key_name = data.name:sub(1, math.ceil(data.name:len() * data.alpha))
					end
	
					if player:is_alive() then
						render.text(priest_font, vector(keybinds_x + 4, keybinds_y + math.floor(m_update_index * 15) + 4), color(0, 0, 0, data.alpha*255), nil ,m_key_name)
						render.text(priest_font, vector(keybinds_x + max_length - 2 - render.measure_text(priest_font,"",data.mode).x, keybinds_y + math.floor(m_update_index * 15) + 4), color(0, 0, 0, data.alpha*255), nil, data.mode)
						render.text(priest_font, vector(keybinds_x + 3, keybinds_y + math.floor(m_update_index * 15) + 3), color(1.0*255, 1.0*255, 1.0*255, data.alpha*255), nil ,m_key_name)
						render.text(priest_font, vector(keybinds_x + max_length - 3 - render.measure_text(priest_font,"",data.mode).x, keybinds_y + math.floor(m_update_index * 15) + 3), color(1.0*255, 1.0*255, 1.0*255, data.alpha*255), nil, data.mode)
					end
	
					m_update_index = m_update_index + data.alpha
				end
			end
		end
	else
		for k, v in pairs(self.m_keys) do
			v = nil
		end
	end
	--print(tostring(in_game))
	--spectator
	local specmax_length = 75
	local specmax_height = 10
	if entity.get_local_player() and self.Menu_UI.visual_panel.windows_slect:get(2) and self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) ~= 1 then
		local s_update_index = 0
		local activate_players = {}
		local activate_state = false
		local observer_target = player
		local mouse = ui.get_mouse_position()
		local specs_x = self.Menu_UI.visual_panel.spec_x:get()
		local specs_y = self.Menu_UI.visual_panel.spec_y:get()
		if player ~= nil and not player:is_alive() then
			observer_target = entity.get(player.m_hObserverTarget)
		end
		for i, ptr in pairs(entity.get_players()) do
			local name = ptr:get_name()
			if Script.spectators_list[name] == nil then
				Script.spectators_list[name] = {
					alpha = 0,
					player = ptr,
					name = ptr:get_name(),
					avatar = ptr:get_steam_avatar()
				}
			end

			activate_players[name] = true
			Script.spectators_list[name].name = name
			Script.spectators_list[name].alpha = self.API.Clamp(self.API.Anim_Lerp(Script.spectators_list[name].alpha, (ptr ~= player and not ptr:is_alive() and not ptr:is_dormant() and entity.get(ptr.m_hObserverTarget) == observer_target) and 1 or 0, frametime), 0, 1)
			if Script.spectators_list[name].avatar == nil then
				Script.spectators_list[name].avatar = ptr:get_steam_avatar()
			end
		end
		if Script.spectators_list ~= nil then
			for k, data in pairs(Script.spectators_list) do
				if data.alpha > 0 and not activate_players[data.name] then
					data.alpha = self.API.Clamp(self.API.Anim_Lerp(data.alpha, 0, frametime), 0, 1)
				elseif data.alpha > 0 and activate_players[data.name] then
					if data.alpha > 0.01 then
						activate_state = true
					end
	
					specmax_height = specmax_height + (16 * data.alpha)
					local name_size = render.measure_text(priest_font,"",data.name)
					if specmax_length < ((name_size.x + 12) + 10) then
						specmax_length = specmax_length + ((((name_size.x + 12) + 12) - specmax_length) * data.alpha)
					end
				end
			end
		end

		local animation_box = self.API.CreateStaticAnimation(1, activate_state, animation_speed, "Spectators box", true)
		local speccurrent_length = self.API.CreateLerpAnimation(specmax_length, specmax_length, animation_speed, "spectator")
		--animation_box是需要用的方框透明度
		if ui.get_alpha() == 1 and (mouse.x >= specs_x - 20 and mouse.y >= specs_y - 42 and mouse.x <= specs_x + speccurrent_length + 40 and mouse.y <= specs_y + specmax_height + 60) then
			Script.spec_drag = Script.API.Lerp_number(Script.spec_drag, 255, globals.frametime*8)
		else
			Script.spec_drag = Script.API.Lerp_number(Script.spec_drag, 0, globals.frametime*8)
		end
		Script.API.RenderBlurRoundedtoalpharect(specs_x-20, specs_y - 42, color(drag_clr.r,drag_clr.g,drag_clr.b,Script.spec_drag), color(drag_clr.r,drag_clr.g,drag_clr.b,Script.spec_drag), speccurrent_length+40, specmax_height+60,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"DRAGABLE",0,true,true)
		if self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 2 then
			if ui.get_alpha() == 1 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					Script.API.RenderBlurRoundedtoalpharect(specs_x-3, specs_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color1, animation_box), speccurrent_length+6, specmax_height,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"SPECTATORS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					Script.API.RenderBlurRoundedtoalpharect(specs_x-3, specs_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), speccurrent_length+6, specmax_height,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"SPECTATORS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					Script.API.RenderBlurRoundedtoalpharect(specs_x-3, specs_y - 5, color(rgb_color.r, rgb_color.g, rgb_color.b, 255), color(rgb_color.r, rgb_color.g, rgb_color.b, 255), speccurrent_length+6, specmax_height,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"SPECTATORS",2,true,true)
				end
	
				if common.is_button_down(0x1) and (mouse.x >= specs_x - 20 and mouse.y >= specs_y - 42 and mouse.x <= specs_x + speccurrent_length + 40 and mouse.y <= specs_y + specmax_height + 60) then
					self.Menu_UI.visual_panel.spec_x:set(mouse.x-math.floor(speccurrent_length/2))
					self.Menu_UI.visual_panel.spec_y:set(mouse.y-math.floor(specmax_height/2))
				end
	
			elseif not (ui.get_alpha() == 1) and animation_box > 0 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					Script.API.RenderBlurRoundedtoalpharect(specs_x-3, specs_y - 5, self.API.ColorModifier(wtm_color1, animation_box), self.API.ColorModifier(wtm_color1, animation_box), speccurrent_length+6, specmax_height,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"SPECTATORS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					Script.API.RenderBlurRoundedtoalpharect(specs_x-3, specs_y - 5, self.API.ColorModifier(wtm_color1, animation_box), self.API.ColorModifier(wtm_color2, animation_box), speccurrent_length+6, specmax_height,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"SPECTATORS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					Script.API.RenderBlurRoundedtoalpharect(specs_x-3, specs_y - 5, color(rgb_color.r, rgb_color.g, rgb_color.b, rgb_color.a*255 * animation_box),color(rgb_color.r, rgb_color.g, rgb_color.b, rgb_color.a*255 * animation_box), speccurrent_length+6, specmax_height,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"SPECTATORS",2,true,true)
				end
			end
		elseif self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 3 then
			if ui.get_alpha() == 1 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					render.rect(vector(specs_x, specs_y - 20), vector(specs_x+speccurrent_length, specs_y - 20 + render.measure_text(priest_font,"","spectators").y + 8), color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()))
					render.rect(vector(specs_x, specs_y - 22), vector(specs_x+speccurrent_length, specs_y-20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255))
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-2), color(0, 0, 0, 0.8*255), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color1, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					render.rect(vector(specs_x, specs_y - 20), vector(specs_x+speccurrent_length, specs_y - 20 + render.measure_text(priest_font,"","spectators").y + 8), color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()))

					render.gradient(vector(specs_x, specs_y - 22), vector(specs_x+speccurrent_length/2, specs_y - 20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255))
					render.gradient(vector(specs_x+speccurrent_length/2,specs_y - 22), vector(specs_x+speccurrent_length,specs_y - 20), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 255), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 255))
					--render.rect(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length, keybinds_y-20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1))
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-2), color(0, 0, 0, 0.8*255), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					render.rect(vector(specs_x, specs_y - 20), vector(specs_x+speccurrent_length, specs_y - 20 + render.measure_text(priest_font,"","spectators").y + 8), color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()))
					render.gradient(vector(specs_x, specs_y - 22), vector(specs_x+speccurrent_length/2, specs_y - 20), color(rgb_color.r, rgb_color.g, rgb_color.b, 255), color(rgb_color.b, rgb_color.r, rgb_color.g, 255), color(rgb_color.r, rgb_color.g, rgb_color.b, 255), color(rgb_color.b, rgb_color.r, rgb_color.g, 255))
					render.gradient(vector(specs_x+speccurrent_length/2,specs_y - 22), vector(specs_x+speccurrent_length,specs_y - 20), color(rgb_color.b, rgb_color.r, rgb_color.g, 255), color(rgb_color.g, rgb_color.b, rgb_color.r, 255), color(rgb_color.b, rgb_color.r, rgb_color.g, 255), color(rgb_color.g, rgb_color.b, rgb_color.r, 255))
					--render.rect(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length, keybinds_y-20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1))
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-2), color(0, 0, 0, 0.8*255), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",1,true,true)
				end
	
				if common.is_button_down(0x1) and (mouse.x >= specs_x - 20 and mouse.y >= specs_y - 42 and mouse.x <= specs_x + speccurrent_length + 40 and mouse.y <= specs_y + specmax_height + 60) then
					self.Menu_UI.visual_panel.spec_x:set(mouse.x-math.floor(speccurrent_length/2))
					self.Menu_UI.visual_panel.spec_y:set(mouse.y-math.floor(specmax_height/2))
				end
			elseif not (ui.get_alpha() == 1) and animation_box > 0 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					render.rect(vector(specs_x, specs_y - 20), vector(specs_x+speccurrent_length, specs_y - 20 + render.measure_text(priest_font,"","spectators").y + 8), self.API.ColorModifier(color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()),animation_box))
					render.rect(vector(specs_x, specs_y - 22), vector(specs_x+speccurrent_length, specs_y-20), self.API.ColorModifier(color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255),animation_box))
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-2), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color1, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					render.rect(vector(specs_x, specs_y - 20), vector(specs_x+speccurrent_length, specs_y - 20 + render.measure_text(priest_font,"","spectators").y + 8), self.API.ColorModifier(color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()),animation_box))

					render.gradient(vector(specs_x, specs_y - 22), vector(specs_x+speccurrent_length/2, specs_y - 20), self.API.ColorModifier(color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255),animation_box), self.API.ColorModifier(color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255),animation_box), self.API.ColorModifier(color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 255),animation_box), self.API.ColorModifier(color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255),animation_box))
					render.gradient(vector(specs_x+speccurrent_length/2,specs_y - 22), vector(specs_x+speccurrent_length,specs_y - 20), self.API.ColorModifier(color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255),animation_box), self.API.ColorModifier(color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 255),animation_box), self.API.ColorModifier(color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 255),animation_box), self.API.ColorModifier(color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 255),animation_box))

					--render.gradient(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length/2, keybinds_y - 20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1))
					--render.gradient(vector(keybinds_x+current_length/2,keybinds_y - 22), vector(keybinds_x+current_length,keybinds_y - 20), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 1), color(wtm_color1.g, wtm_color1.b, wtm_color1.r, 1), color(wtm_color2.r, wtm_color2.g, wtm_color2.b, 1))
					--render.rect(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length, keybinds_y-20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1))
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-2), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					render.rect(vector(specs_x, specs_y - 20), vector(specs_x+speccurrent_length, specs_y - 20 + render.measure_text(priest_font,"","spectators").y + 8), self.API.ColorModifier(color(17, 17, 17, self.Menu_UI.visual_panel.bg_alpha:get()),animation_box))
					render.gradient(vector(specs_x, specs_y - 22), vector(specs_x+speccurrent_length/2, specs_y - 20), self.API.ColorModifier(color(rgb_color.r, rgb_color.g, rgb_color.b, 255),animation_box), self.API.ColorModifier(color(rgb_color.b, rgb_color.r, rgb_color.g, 255),animation_box), self.API.ColorModifier(color(rgb_color.r, rgb_color.g, rgb_color.b, 255),animation_box), self.API.ColorModifier(color(rgb_color.b, rgb_color.r, rgb_color.g, 255),animation_box))
					render.gradient(vector(specs_x+speccurrent_length/2,specs_y - 22), vector(specs_x+speccurrent_length,specs_y - 20), self.API.ColorModifier(color(rgb_color.b, rgb_color.r, rgb_color.g, 255),animation_box), self.API.ColorModifier(color(rgb_color.g, rgb_color.b, rgb_color.r, 255),animation_box), self.API.ColorModifier(color(rgb_color.b, rgb_color.r, rgb_color.g, 255),animation_box), self.API.ColorModifier(color(rgb_color.g, rgb_color.b, rgb_color.r, 255),animation_box))
					--render.rect(vector(keybinds_x, keybinds_y - 22), vector(keybinds_x+current_length, keybinds_y-20), color(wtm_color1.r, wtm_color1.g, wtm_color1.b, 1))
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-2), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(keybinds_x, keybinds_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), current_length, max_height,1,0.0625,"Smallest Pixel-7",11,"KEYBINDS",1,true,true)
				end
			end
		elseif self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) == 4 then
			if ui.get_alpha() == 1 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					Script.API.Rendersolusv2rectwindow(specs_x, specs_y - 20, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color1, 1), speccurrent_length, render.measure_text(priest_font,"","spectators").y + 8,1,0.6,3)
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 19+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),1), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),1), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(specs_x, specs_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color1, animation_box), speccurrent_length, specmax_height,1,0.0625,"Smallest Pixel-7",11,"SPECTATORS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					Script.API.Rendersolusv2rectwindow(specs_x, specs_y - 20, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, 1), speccurrent_length, render.measure_text(priest_font,"","spectators").y + 8,1,0.6,3)
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 19+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),1), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),1), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(specs_x, specs_y - 5, self.API.ColorModifier(wtm_color1, 1), self.API.ColorModifier(wtm_color2, animation_box), speccurrent_length, specmax_height,1,0.0625,"Smallest Pixel-7",11,"SPECTATORS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					Script.API.Rendersolusv2rectwindow(specs_x, specs_y - 20, color(rgb_color.r, rgb_color.g, rgb_color.b, 255), color(rgb_color.r, rgb_color.g, rgb_color.b, 255), speccurrent_length, render.measure_text(priest_font,"","spectators").y + 8,1,0.6,3,true)
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 19+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),1), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),1), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(specs_x, specs_y - 5, color(rgb_color.r, rgb_color.g, rgb_color.b, 1), color(rgb_color.r, rgb_color.g, rgb_color.b, 1), speccurrent_length, specmax_height,1,0.0625,"Smallest Pixel-7",11,"SPECTATORS",2,true,true)
				end
	
				if common.is_button_down(0x1) and (mouse.x >= specs_x - 20 and mouse.y >= specs_y - 42 and mouse.x <= specs_x + speccurrent_length + 40 and mouse.y <= specs_y + specmax_height + 60) then
					self.Menu_UI.visual_panel.spec_x:set(mouse.x-math.floor(speccurrent_length/2))
					self.Menu_UI.visual_panel.spec_y:set(mouse.y-math.floor(specmax_height/2))
				end
	
			elseif not (ui.get_alpha() == 1) and animation_box > 0 then
				if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
					Script.API.Rendersolusv2rectwindow(specs_x, specs_y - 20, self.API.ColorModifier(wtm_color1, animation_box), self.API.ColorModifier(wtm_color1, animation_box), speccurrent_length, render.measure_text(priest_font,"","spectators").y + 8,1,0.6,3)
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 19+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(specs_x, specs_y - 5, self.API.ColorModifier(wtm_color1, animation_box), self.API.ColorModifier(wtm_color1, animation_box), speccurrent_length, specmax_height,1,0.0625,"Smallest Pixel-7",11,"SPECTATORS",0,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
					Script.API.Rendersolusv2rectwindow(specs_x, specs_y - 20, self.API.ColorModifier(wtm_color1, animation_box), self.API.ColorModifier(wtm_color2, animation_box), speccurrent_length, render.measure_text(priest_font,"","spectators").y + 8,1,0.6,3)
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 19+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(specs_x, specs_y - 5, self.API.ColorModifier(wtm_color1, animation_box), self.API.ColorModifier(wtm_color2, animation_box), speccurrent_length, specmax_height,1,0.0625,"Smallest Pixel-7",11,"SPECTATORS",1,true,true)
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
					Script.API.Rendersolusv2rectwindow(specs_x, specs_y - 20, color(rgb_color.r, rgb_color.g, rgb_color.b, rgb_color.a*255 * animation_box), color(rgb_color.r, rgb_color.g, rgb_color.b, rgb_color.a*255 * animation_box), speccurrent_length, render.measure_text(priest_font,"","spectators").y + 8,1,0.6,3,true)
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2+1, specs_y - 19+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(0, 0, 0, 0.8*255),animation_box), nil,"spectators")
					render.text(priest_font, vector(specs_x-render.measure_text(priest_font,"","spectators").x/2+speccurrent_length/2, specs_y - 20+render.measure_text(priest_font,"","spectators").y/2-3), self.API.ColorModifier(color(1.0*255, 1.0*255, 1.0*255, 1.0*255),animation_box), nil,"spectators")
					--Script.API.RenderBlurRoundedtoalpharect(specs_x, specs_y - 5, color(rgb_color.r, rgb_color.g, rgb_color.b, rgb_color.a * animation_box),color(rgb_color.r, rgb_color.g, rgb_color.b, rgb_color.a * animation_box), speccurrent_length, specmax_height,1,0.0625,"Smallest Pixel-7",11,"SPECTATORS",2,true,true)
				end
			end
		end
		if Script.spectators_list ~= nil then
			for _p, data_s in pairs(Script.spectators_list) do
				if data_s.alpha > 0 and activate_players[data_s.name] and data_s.alpha ~= nil and _p ~= nil and data_s ~= nil then
					--local avatar = Script.ffi_helpers.get_steam_avatar(data.player, 14, 14)
					if data_s.avatar then
						render.texture(data_s.avatar, vector(specs_x + 3, specs_y + math.floor(s_update_index * 16) + 3), vector(12, 12), color(255, 255, 255, data_s.alpha*255))
					else
						render.rect(vector(specs_x + 3, specs_y + math.floor(s_update_index * 16) + 3), vector(specs_x + 15, specs_y + math.floor(s_update_index * 16) + 15), color(0, 0, 0, data_s.alpha*255))
						render.text(priest_font, vector(specs_x + 3 + (render.measure_text(priest_font,"","?").x / 2), specs_y + math.floor(s_update_index * 16) + 3), color(255, 255, 255, data_s.alpha*255), nil,"?" )
					end

					render.text(priest_font,vector(specs_x + 22, specs_y + math.floor(s_update_index * 16) + 4), color(0, 0, 0, data_s.alpha*255), nil, data_s.name)
					render.text(priest_font,vector(specs_x + 21, specs_y + math.floor(s_update_index * 16) + 3), color(255, 255, 255, data_s.alpha*255), nil, data_s.name)
					s_update_index = s_update_index + data_s.alpha
				end
			end
		end
	else
		for k, v in pairs(Script.spectators_list) do
			v = nil
		end
	end
	--hitLog
	-- local weapon_index = 0
	-- if (player:get_player_weapon() ~= nil and (player:get_player_weapon()):GetProp("m_iItemDefinitionIndex")~=nil) then
	-- 	weapon_index = (player:get_player_weapon()):GetProp("m_iItemDefinitionIndex")
	-- end
	--print(tostring(#Script.log_array))
	if self.Menu_UI.misc.hit_log:get() and self.Menu_UI.misc.hitlg_dismode:get(3) then
		local anim_type = self.API.getMemuindex({"Vertical","Horizontal"},self.Menu_UI.misc.anim_mode:get())
		local hitback_alpha = Script.Menu_UI.misc.back_alpha:get()
		local puretext_font = Script.API.CreateFont("Essential fonts\\calibri.ttf",12)
		local hit_clr = self.Menu_UI.misc.hit_color:get()
		local miss_clr = self.Menu_UI.misc.mis_color:get()
		local wep_size = vector(0,0)
		--print(tostring(#Script.hurt_logs))
		for k = #Script.log_array,1,-1 do--ori_pos
			--print(tostring(k))
			--print(tostring(globals.realtime - Script.log_array[k].time))
			local hurt_text = 0
			local hurt_textcal = 0
			local hurtext_size = 0
			local plr_wep = Script.log_array[k].wep_index
			wep_size = render.measure_text(weapon_font_s,"",plr_wep)
			if self.API.getMemuindex(Script.Menu_table.visual_panel.visualization_mode,self.Menu_UI.misc.vis_dismode:get()) == 1 then
				if Script.log_array[k].is_miss == false then
					if Script.log_array[k].pre_t == 1 then
						hurt_text = ("[Priest] hurt %s's %s for %d demage(%d remaining)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg,Script.log_array[k].remain)
						hurtext_size = render.measure_text(priest_font,"",hurt_text).x
					else
						hurt_textcal = ("[  ] hurt %s's %s for %d demage(%d remaining)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg,Script.log_array[k].remain)
						hurt_text = (" hurt %s's %s for %d demage(%d remaining)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg,Script.log_array[k].remain)
						hurtext_size = render.measure_text(priest_font,"",hurt_textcal).x + wep_size.x
					end
				else
					if Script.log_array[k].pre_t == 1 then
						hurt_text = ("[Priest] missed %s's %s due to %s(backtrack %d)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason,Script.log_array[k].bt)
						hurtext_size = render.measure_text(priest_font,"",hurt_text).x
					else
						hurt_textcal = ("[  ] missed %s's %s due to %s(backtrack %d)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason,Script.log_array[k].bt)
						hurt_text = (" missed %s's %s due to %s(backtrack %d)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason,Script.log_array[k].bt)
						hurtext_size = render.measure_text(priest_font,"",hurt_textcal).x + wep_size.x
					end
				end
			elseif self.API.getMemuindex(Script.Menu_table.visual_panel.visualization_mode,self.Menu_UI.misc.vis_dismode:get()) == 2 then
				if Script.log_array[k].is_miss == false then
					if Script.log_array[k].pre_t == 1 then
						hurt_text = ("Hurt %s's %s for %d demage(%d remaining)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg,Script.log_array[k].remain)
						hurtext_size = render.measure_text(priest_font,"",hurt_text).x
					else
						hurt_textcal = ("[  ] Hurt %s's %s for %d demage(%d remaining)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg,Script.log_array[k].remain)
						hurt_text = ("[  ] Hurt %s's %s for %d demage(%d remaining)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg,Script.log_array[k].remain)
						hurtext_size = render.measure_text(priest_font,"",hurt_textcal).x + wep_size.x
					end
				else
					if Script.log_array[k].pre_t == 1 then
						hurt_text = ("Missed %s's %s due to %s(backtrack %d)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason,Script.log_array[k].bt)
						hurtext_size = render.measure_text(priest_font,"",hurt_text).x
					else
						hurt_textcal = ("[  ] Missed %s's %s due to %s(backtrack %d)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason,Script.log_array[k].bt)
						hurt_text = ("[  ] Missed %s's %s due to %s(backtrack %d)\n"):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason,Script.log_array[k].bt)
						hurtext_size = render.measure_text(priest_font,"",hurt_textcal).x + wep_size.x
					end
				end
			end
			local anim_time = globals.frametime * (30 / 10)
			local lerp_y = self.API.getMemuindex(Script.Menu_table.visual_panel.visualization_mode,self.Menu_UI.misc.vis_dismode:get()) == 1 and ((screen_size.y-100) - (k*37)) or ((screen_size.y-100) - (k*19))
			if Script.ori_pos[k] == nil then
				Script.log_lerpalpha[k] = 0
				Script.ori_pos[k] = screen_size.y
				Script.uprect_pos[k] = screen_size.x/2-hurtext_size/2
				Script.underect_pos[k] = screen_size.x/2+hurtext_size/2
				Script.log_xlerp[k] = Script.log_array[k].pre_t == 2 and screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x or screen_size.x/2-hurtext_size/2 
				Script.log_cirlerp[k] = 0
			end
			if globals.realtime - Script.log_array[k].time <= 2.5 then
				Script.log_lerpalpha[k] = Script.API.Lerp_number(Script.log_lerpalpha[k],255,anim_time)
				Script.ori_pos[k] = Script.API.Lerp_number(Script.ori_pos[k],lerp_y,anim_time)
				Script.uprect_pos[k] = Script.API.Lerp_number(Script.uprect_pos[k],screen_size.x/2+hurtext_size/2,anim_time)
				Script.underect_pos[k] = Script.API.Lerp_number(Script.underect_pos[k],screen_size.x/2-hurtext_size/2,anim_time)
				Script.log_cirlerp[k] = Script.API.Lerp_number(Script.log_cirlerp[k],180,anim_time)
				if self.API.getMemuindex(Script.Menu_table.visual_panel.visualization_mode,self.Menu_UI.misc.vis_dismode:get()) == 1 then
					if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
						render.rect(vector(screen_size.x/2-hurtext_size/2, Script.ori_pos[k]), vector(screen_size.x/2+hurtext_size/2, Script.ori_pos[k]+26), color(0, 0, 0, (Script.log_lerpalpha[k])))
						render.gradient(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]-2),vector(Script.uprect_pos[k],Script.ori_pos[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]))
						render.gradient(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+26),vector(Script.underect_pos[k],Script.ori_pos[k]+28), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]))
						render.circle(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 90, 0.5)
						render.circle(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 270, 0.5)
						render.circle_outline(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), 14.5, 90, Script.log_cirlerp[k]/360,2)
						render.circle_outline(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), 14.5, 270, Script.log_cirlerp[k]/360,2)
						if Script.log_array[k].pre_t == 1 then
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						else
							--render.text("[ ", vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(weapon_font_s, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.9), color(255, 255, 255, Script.log_lerpalpha[k]), nil,plr_wep)
							--Render.WeaponIcon(plr_wep, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.9), color(1.0, 1.0, 1.0 ,Script.log_lerpalpha[k]), 16)
							--render.text(" ]", vector(screen_size.x/2-hurtext_size/2+render.measure_text("[ ", 12, priest_font).x+wep_size.x,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,""," ]").x+render.measure_text(priest_font,"","[ ").x+wep_size.x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						end
					elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
						render.rect(vector(screen_size.x/2-hurtext_size/2, Script.ori_pos[k]), vector(screen_size.x/2+hurtext_size/2, Script.ori_pos[k]+26), color(0, 0, 0, (Script.log_lerpalpha[k])))
						render.gradient(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]-2),vector(Script.uprect_pos[k],Script.ori_pos[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.log_lerpalpha[k]))
						render.gradient(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+26),vector(Script.underect_pos[k],Script.ori_pos[k]+28), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]))
						render.circle(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 90, 0.5)
						render.circle(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 270, 0.5)
						render.circle_outline(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), 14.5, 90, Script.log_cirlerp[k]/360,2)
						render.circle_outline(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.log_lerpalpha[k]), 14.5, 270, Script.log_cirlerp[k]/360,2)
						if Script.log_array[k].pre_t == 1 then
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						else
							--render.text("[ ", vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(weapon_font_s, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.9), color(255, 255, 255, Script.log_lerpalpha[k]), nil,plr_wep)
							--Render.WeaponIcon(plr_wep, vector(screen_size.x/2-hurtext_size/2+render.measure_text("[ ", 12, priest_font).x,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.9), color(1.0, 1.0, 1.0 , Script.log_lerpalpha[k]), 16)
							--render.text(" ]", vector(screen_size.x/2-hurtext_size/2+render.measure_text("[ ", 12, priest_font).x+wep_size.x,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,""," ]").x+render.measure_text(priest_font,"","[ ").x+wep_size.x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						end
					elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
						render.rect(vector(screen_size.x/2-hurtext_size/2, Script.ori_pos[k]), vector(screen_size.x/2+hurtext_size/2, Script.ori_pos[k]+26), color(0, 0, 0, (Script.log_lerpalpha[k])))
						render.gradient(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]-2),vector(Script.uprect_pos[k],Script.ori_pos[k]), color(rgb_color.r, rgb_color.g, rgb_color.b, Script.log_lerpalpha[k]),color(rgb_color.g, rgb_color.b, rgb_color.r, Script.log_lerpalpha[k]), color(rgb_color.r, rgb_color.g, rgb_color.b, Script.log_lerpalpha[k]),color(rgb_color.g, rgb_color.b, rgb_color.r, Script.log_lerpalpha[k]))
						render.gradient(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+26),vector(Script.underect_pos[k],Script.ori_pos[k]+28), color(rgb_color.g, rgb_color.b, rgb_color.r, Script.log_lerpalpha[k]), color(rgb_color.r, rgb_color.g, rgb_color.b, Script.log_lerpalpha[k]), color(rgb_color.g, rgb_color.b, rgb_color.r, Script.log_lerpalpha[k]), color(rgb_color.r, rgb_color.g, rgb_color.b, Script.log_lerpalpha[k]))
						render.circle(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 90, 0.5)
						render.circle(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 270, 0.5)
						render.circle_outline(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(rgb_color.r, rgb_color.g, rgb_color.b, Script.log_lerpalpha[k]), 14.5, 90, Script.log_cirlerp[k]/360,2)
						render.circle_outline(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(rgb_color.g, rgb_color.b, rgb_color.r, Script.log_lerpalpha[k]), 14.5, 270, Script.log_cirlerp[k]/360,2)
						if Script.log_array[k].pre_t == 1 then
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						else
							--render.text("[ ", vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(weapon_font_s, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.9), color(255, 255, 255, Script.log_lerpalpha[k]), nil,plr_wep)
							--Render.WeaponIcon(plr_wep, vector(screen_size.x/2-hurtext_size/2+render.measure_text("[ ", 12, priest_font).x,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.9), color(1.0, 1.0, 1.0 , Script.log_lerpalpha[k]), 16)
							--render.text(" ]", vector(screen_size.x/2-hurtext_size/2+render.measure_text("[ ", 12, priest_font).x+wep_size.x,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,""," ]").x+render.measure_text(priest_font,"","[ ").x+wep_size.x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						end
					end
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.visualization_mode,self.Menu_UI.misc.vis_dismode:get()) == 2 then
					if Script.log_array[k].pre_t == 2 then--screen_size.x/2-hurtext_size/2+render.measure_text(" ]", 12, priest_font).x+render.measure_text("[ ", 12, priest_font).x+wep_size.x
						render.text(weapon_font_s, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/2.1), color(255, 255, 255, Script.log_lerpalpha[k]), nil,plr_wep)
						--Render.WeaponIcon(plr_wep, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/2.1), color(1.0, 1.0, 1.0, Script.log_lerpalpha[k]), 16)
						if Script.log_array[k].is_miss == false then
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"Hurt ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"","Hurt ").x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s"):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"'s ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's "):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"for ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s for "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%d "):format(Script.log_array[k].dmg))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s for %d "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg)).x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0, Script.log_lerpalpha[k]), nil,("damage(%d remaining)"):format(Script.log_array[k].remain))

							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"Hurt ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"","Hurt ").x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s"):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"'s ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's "):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"for ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s for "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%d "):format(Script.log_array[k].dmg))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s for %d "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,("damage(%d remaining)"):format(Script.log_array[k].remain))
						else
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"Missed ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"","Missed ").x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s"):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"'s ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's "):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"due to ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s due to "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].miss_reason))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s due to %s "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason)).x+1,Script.ori_pos[k]+1+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(0, 0, 0, Script.log_lerpalpha[k]), nil,("(backtrack %d)"):format(Script.log_array[k].bt))

							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"Missed ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"","Missed ").x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s"):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"'s ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's "):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"due to ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s due to "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].miss_reason))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s due to %s "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,("(backtrack %d)"):format(Script.log_array[k].bt))
						end
					else
						if Script.log_array[k].is_miss == false then
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"Hurt ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"","Hurt ").x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s"):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,"'s ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's "):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,"for ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s for "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%d "):format(Script.log_array[k].dmg))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s for %d "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,("damage(%d remaining)"):format(Script.log_array[k].remain))

							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"Hurt ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"","Hurt ").x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s"):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"'s ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's "):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"for ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s for "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%d "):format(Script.log_array[k].dmg))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s for %d "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,("damage(%d remaining)"):format(Script.log_array[k].remain))
						else
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"Missed ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"","Missed ").x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s"):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,"'s ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's "):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,"due to ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s due to "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].miss_reason))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s due to %s "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,("(backtrack %d)"):format(Script.log_array[k].bt))
							
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"Missed ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"","Missed ").x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s"):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"'s ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's "):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"due to ")
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s due to "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].miss_reason))
							render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s due to %s "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,("(backtrack %d)"):format(Script.log_array[k].bt))
						end
					end
				end
				
				
				--render.gradient(vector(screen_size.x/2+hurtext_size/2,screen_size.y-170),Script.rect2str_pos, wtm_color2, wtm_color1, wtm_color2, wtm_color1)
			else
				Script.log_lerpalpha[k] = Script.API.Lerp_number(Script.log_lerpalpha[k],0,globals.frametime*8)
				Script.ori_pos[k] = Script.API.Lerp_number(Script.ori_pos[k],screen_size.y+10,anim_time)
				Script.uprect_pos[k] = Script.API.Lerp_number(Script.uprect_pos[k],screen_size.x/2-hurtext_size/2,anim_time)
				Script.log_xlerp[k] = anim_type == 2 and Script.API.Lerp_number(Script.log_xlerp[k],screen_size.x+10,anim_time) or Script.log_xlerp[k]
				Script.underect_pos[k] = Script.API.Lerp_number(Script.underect_pos[k],screen_size.x/2+hurtext_size/2,anim_time)
				Script.log_cirlerp[k] = Script.API.Lerp_number(Script.log_cirlerp[k],0,anim_time)
				if self.API.getMemuindex(Script.Menu_table.visual_panel.visualization_mode,self.Menu_UI.misc.vis_dismode:get()) == 1 then
					if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
						render.rect(vector(screen_size.x/2-hurtext_size/2, Script.ori_pos[k]), vector(screen_size.x/2+hurtext_size/2, Script.ori_pos[k]+26), color(0, 0, 0, (Script.log_lerpalpha[k])))
						render.gradient(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]-2),vector(Script.uprect_pos[k],Script.ori_pos[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]))
						render.gradient(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+26),vector(Script.underect_pos[k],Script.ori_pos[k]+28), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]))
						render.circle(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 90, 0.5)
						render.circle(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 270, 0.5)
						render.circle_outline(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), 14.5, 90, Script.log_cirlerp[k]/360,2)
						render.circle_outline(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), 14.5, 270, Script.log_cirlerp[k]/360,2)
						if Script.log_array[k].pre_t == 1 then
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						else
							--render.text("[ ", vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(weapon_font_s, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.9), color(255, 255, 255, Script.log_lerpalpha[k]), nil,plr_wep)
							--Render.WeaponIcon(plr_wep, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,hurt_text).y/1.9), color(1.0, 1.0, 1.0 , Script.log_lerpalpha[k]), 16)
							--render.text(" ]", vector(screen_size.x/2-hurtext_size/2+render.measure_text("[ ", 12, priest_font).x+wep_size.x,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,""," ]").x+render.measure_text(priest_font,"","[ ").x+wep_size.x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						end
					elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
						render.rect(vector(screen_size.x/2-hurtext_size/2, Script.ori_pos[k]), vector(screen_size.x/2+hurtext_size/2, Script.ori_pos[k]+26), color(0, 0, 0, (Script.log_lerpalpha[k])))
						render.gradient(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]-2),vector(Script.uprect_pos[k],Script.ori_pos[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.log_lerpalpha[k]))
						render.gradient(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+26),vector(Script.underect_pos[k],Script.ori_pos[k]+28), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.log_lerpalpha[k]), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]))
						render.circle(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 90, 0.5)
						render.circle(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 270, 0.5)
						render.circle_outline(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.log_lerpalpha[k]), 14.5, 90, Script.log_cirlerp[k]/360,2)
						render.circle_outline(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.log_lerpalpha[k]), 14.5, 270, Script.log_cirlerp[k]/360,2)
						if Script.log_array[k].pre_t == 1 then
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						else
							--render.text("[ ", vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(weapon_font_s, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.9), color(255, 255, 255, Script.log_lerpalpha[k]), nil,plr_wep)
							--Render.WeaponIcon(plr_wep, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,hurt_text).y/1.9), color(1.0, 1.0, 1.0 , Script.log_lerpalpha[k]), 16)
							--render.text(" ]", vector(screen_size.x/2-hurtext_size/2+render.measure_text("[ ", 12, priest_font).x+wep_size.x,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,""," ]").x+render.measure_text(priest_font,"","[ ").x+wep_size.x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						end
					elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
						render.rect(vector(screen_size.x/2-hurtext_size/2, Script.ori_pos[k]), vector(screen_size.x/2+hurtext_size/2, Script.ori_pos[k]+26), color(0, 0, 0, (Script.log_lerpalpha[k])))
						render.gradient(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]-2),vector(Script.uprect_pos[k],Script.ori_pos[k]), color(rgb_color.r, rgb_color.g, rgb_color.b, Script.log_lerpalpha[k]),color(rgb_color.g, rgb_color.b, rgb_color.r, Script.log_lerpalpha[k]), color(rgb_color.r, rgb_color.g, rgb_color.b, Script.log_lerpalpha[k]),color(rgb_color.g, rgb_color.b, rgb_color.r, Script.log_lerpalpha[k]))
						render.gradient(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+26),vector(Script.underect_pos[k],Script.ori_pos[k]+28), color(rgb_color.g, rgb_color.b, rgb_color.r, Script.log_lerpalpha[k]), color(rgb_color.r, rgb_color.g, rgb_color.b, Script.log_lerpalpha[k]), color(rgb_color.g, rgb_color.b, rgb_color.r, Script.log_lerpalpha[k]), color(rgb_color.r, rgb_color.g, rgb_color.b, Script.log_lerpalpha[k]))
						render.circle(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 90, 0.5)
						render.circle(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(0, 0, 0, (Script.log_lerpalpha[k])), 13.0, 270, 0.5)
						render.circle_outline(vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+13),color(rgb_color.r, rgb_color.g, rgb_color.b, Script.log_lerpalpha[k]), 14.5, 90, Script.log_cirlerp[k]/360,2)
						render.circle_outline(vector(screen_size.x/2+hurtext_size/2,Script.ori_pos[k]+13),color(rgb_color.g, rgb_color.b, rgb_color.r, Script.log_lerpalpha[k]), 14.5, 270, Script.log_cirlerp[k]/360,2)
						if Script.log_array[k].pre_t == 1 then
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						else
							--render.text("[ ", vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(weapon_font_s, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.9), color(255, 255, 255, Script.log_lerpalpha[k]), nil,plr_wep)
							--Render.WeaponIcon(plr_wep, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.9), color(1.0, 1.0, 1.0 , Script.log_lerpalpha[k]), 16)
							--render.text(" ]", vector(screen_size.x/2-hurtext_size/2+render.measure_text("[ ", 12, priest_font).x+wep_size.x,Script.ori_pos[k]+render.measure_text(hurt_text, 12,priest_font).y/1.7), color(1.0, 1.0, 1.0, 1.0), 12,priest_font)
							render.text(priest_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,""," ]").x+render.measure_text(priest_font,"","[ ").x+wep_size.x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,hurt_text)
						end
					end
				elseif self.API.getMemuindex(Script.Menu_table.visual_panel.visualization_mode,self.Menu_UI.misc.vis_dismode:get()) == 2 then
					if anim_type == 2 then
						if Script.log_array[k].pre_t == 2 then--screen_size.x/2-hurtext_size/2+render.measure_text(" ]", 12, priest_font).x+render.measure_text("[ ", 12, priest_font).x+wep_size.x
							render.text(weapon_font_s, vector(Script.log_xlerp[k],lerp_y+render.measure_text(priest_font,"",hurt_text).y/2.1), color(255, 255, 255, Script.log_lerpalpha[k]), nil,plr_wep)
							--Render.WeaponIcon(plr_wep, vector(Script.log_xlerp[k],lerp_y+render.measure_text(priest_font,hurt_text).y/2.1), color(1.0, 1.0, 1.0 , Script.log_lerpalpha[k]), 16)
							if Script.log_array[k].is_miss == false then
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(255, 255, 255, Script.log_lerpalpha[k]), nil,"Hurt ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"","Hurt ").x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s"):format(Script.log_array[k].name)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,"'s ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's "):format(Script.log_array[k].name)).x+1,lerp_y+render.measure_text(puretext_font,hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,lerp_y+render.measure_text(puretext_font,hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,"for ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s for "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%d "):format(Script.log_array[k].dmg))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s for %d "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,("damage(%d remaining)"):format(Script.log_array[k].remain))

								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"Hurt ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"","Hurt ").x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s"):format(Script.log_array[k].name)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"'s ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's "):format(Script.log_array[k].name)).x,lerp_y+render.measure_text(puretext_font,hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,lerp_y+render.measure_text(puretext_font,hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"for ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s for "):format(Script.log_array[k].name,Script.log_array[k].box)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%d "):format(Script.log_array[k].dmg))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s for %d "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,("damage(%d remaining)"):format(Script.log_array[k].remain))
							else
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(255, 255, 255, Script.log_lerpalpha[k]), nil,"Missed ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"","Missed ").x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s"):format(Script.log_array[k].name)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,"'s ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's "):format(Script.log_array[k].name)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,"due to ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s due to "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].miss_reason))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s due to %s "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7)+1, color(0, 0, 0, Script.log_lerpalpha[k]), nil,("(backtrack %d)"):format(Script.log_array[k].bt))

								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"Missed ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"","Missed ").x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s"):format(Script.log_array[k].name)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"'s ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's "):format(Script.log_array[k].name)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"due to ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s due to "):format(Script.log_array[k].name,Script.log_array[k].box)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].miss_reason))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,""," ]").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s due to %s "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,("(backtrack %d)"):format(Script.log_array[k].bt))
							end
						else
							if Script.log_array[k].is_miss == false then
								render.text(puretext_font, vector(Script.log_xlerp[k]+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"Hurt ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"","Hurt ").x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,puretext_font,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Hurt %s"):format(Script.log_array[k].name)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,puretext_font,"'s ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Hurt %s's "):format(Script.log_array[k].name)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,puretext_font,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Hurt %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,puretext_font,"for ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Hurt %s's %s for "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,puretext_font,("%d "):format(Script.log_array[k].dmg))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Hurt %s's %s for %d "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,puretext_font,("damage(%d remaining)"):format(Script.log_array[k].remain))

								render.text(puretext_font, vector(Script.log_xlerp[k],lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"Hurt ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"","Hurt ").x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,puretext_font,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Hurt %s"):format(Script.log_array[k].name)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,puretext_font,"'s ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Hurt %s's "):format(Script.log_array[k].name)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,puretext_font,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Hurt %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,puretext_font,"for ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Hurt %s's %s for "):format(Script.log_array[k].name,Script.log_array[k].box)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,puretext_font,("%d "):format(Script.log_array[k].dmg))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Hurt %s's %s for %d "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,puretext_font,("damage(%d remaining)"):format(Script.log_array[k].remain))
							else
								render.text(puretext_font, vector(Script.log_xlerp[k]+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,puretext_font,"Missed ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"","Missed ").x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,puretext_font,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Missed %s"):format(Script.log_array[k].name)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,puretext_font,"'s ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Missed %s's "):format(Script.log_array[k].name)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,puretext_font,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Missed %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,puretext_font,"due to ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Missed %s's %s due to "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,puretext_font,("%s "):format(Script.log_array[k].miss_reason))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Missed %s's %s due to %s "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason)).x+1,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,puretext_font,("(backtrack %d)"):format(Script.log_array[k].bt))

								render.text(puretext_font, vector(Script.log_xlerp[k],lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,puretext_font,"Missed ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"","Missed ").x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,puretext_font,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Missed %s"):format(Script.log_array[k].name)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,puretext_font,"'s ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Missed %s's "):format(Script.log_array[k].name)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,puretext_font,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Missed %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,puretext_font,"due to ")
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Missed %s's %s due to "):format(Script.log_array[k].name,Script.log_array[k].box)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,puretext_font,("%s "):format(Script.log_array[k].miss_reason))
								render.text(puretext_font, vector(Script.log_xlerp[k]+render.measure_text(puretext_font,"",("Missed %s's %s due to %s "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason)).x,lerp_y+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,puretext_font,("(backtrack %d)"):format(Script.log_array[k].bt))
							end
						end
					else
						if Script.log_array[k].pre_t == 2 then--screen_size.x/2-hurtext_size/2+render.measure_text(" ]", 12, priest_font).x+render.measure_text("[ ", 12, priest_font).x+wep_size.x
							render.text(weapon_font_s, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/2.1), color(255, 255, 255, Script.log_lerpalpha[k]), nil,plr_wep)
							--Render.WeaponIcon(plr_wep, vector(screen_size.x/2-hurtext_size/2+render.measure_text(priest_font,"","[ ").x,Script.ori_pos[k]+render.measure_text(priest_font,"",hurt_text).y/2.1), color(1.0, 1.0, 1.0 , Script.log_lerpalpha[k]), 16)
							if Script.log_array[k].is_miss == false then
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+wep_size.x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"Hurt ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"","Hurt ").x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s"):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"'s ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's "):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"for ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s for "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%d "):format(Script.log_array[k].dmg))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Hurt %s's %s for %d "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,("damage(%d remaining)"):format(Script.log_array[k].remain))
							else
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"Missed ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"","Missed ").x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s"):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"'s ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's "):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"due to ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s due to "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].miss_reason))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,""," ]").x+render.measure_text(puretext_font,"","[ ").x+wep_size.x+render.measure_text(puretext_font,"",("Missed %s's %s due to %s "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,("(backtrack %d)"):format(Script.log_array[k].bt))
							end
						else
							if Script.log_array[k].is_miss == false then
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,puretext_font,"Hurt ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"","Hurt ").x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s"):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"'s ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's "):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"for ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s for "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%d "):format(Script.log_array[k].dmg))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s for %d "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,("damage(%d remaining)"):format(Script.log_array[k].remain))

								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,puretext_font,"Hurt ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"","Hurt ").x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s"):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"'s ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's "):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"for ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s for "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(hit_clr.r,hit_clr.g,hit_clr.b,Script.log_lerpalpha[k]), nil,("%d "):format(Script.log_array[k].dmg))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Hurt %s's %s for %d "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].dmg)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,("damage(%d remaining)"):format(Script.log_array[k].remain))
							else
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,puretext_font,"Missed ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"","Missed ").x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s"):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"'s ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's "):format(Script.log_array[k].name)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,"due to ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s due to "):format(Script.log_array[k].name,Script.log_array[k].box)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].miss_reason))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s due to %s "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason)).x+1,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7+1), color(0, 0, 0, Script.log_lerpalpha[k]), nil,("(backtrack %d)"):format(Script.log_array[k].bt))

								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,puretext_font,"Missed ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"","Missed ").x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s"):format(Script.log_array[k].name))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s"):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"'s ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's "):format(Script.log_array[k].name)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].box))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,"due to ")
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s due to "):format(Script.log_array[k].name,Script.log_array[k].box)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(miss_clr.r,miss_clr.g,miss_clr.b,Script.log_lerpalpha[k]), nil,("%s "):format(Script.log_array[k].miss_reason))
								render.text(puretext_font, vector(screen_size.x/2-hurtext_size/2+render.measure_text(puretext_font,"",("Missed %s's %s due to %s "):format(Script.log_array[k].name,Script.log_array[k].box,Script.log_array[k].miss_reason)).x,Script.ori_pos[k]+render.measure_text(puretext_font,"",hurt_text).y/1.7), color(255, 255, 255, Script.log_lerpalpha[k]), nil,("(backtrack %d)"):format(Script.log_array[k].bt))
							end
						end
					end
				end
					if Script.log_lerpalpha[k] <= 3 then
						table.remove(Script.log_array,k)
						table.remove(Script.ori_pos,k)
						table.remove(Script.uprect_pos,k)
						table.remove(Script.underect_pos,k)
						table.remove(Script.log_xlerp,k)
						table.remove(Script.log_cirlerp,k)
						table.remove(Script.log_lerpalpha,k)
					end
				-- end
			end
		end
	else
		for i = 1,#Script.log_array do
			table.remove(Script.log_array,i)
		end
	end
	--AA ind
	--print(tostring(self.Menu_UI.visual_panel.aa_style:get("Modern")))
	if entity.get_local_player() and self.Menu_UI.visual_panel.aa_ind:get() then
		if player:is_alive() then
			local aa_font = self.API.CreateFont("Essential fonts\\Smallest Pixel-7.ttf",10,"o")
			local arrow_font = self.API.CreateFont("Essential fonts\\Acta Symbols W95 Arrows.ttf",20)
			local arrow_size = render.measure_text(arrow_font,"","w")
			local arrow_size2 = render.measure_text(arrow_font,"","Q")
			local aa_size = render.measure_text(aa_font,"","SAINT-PRIEST")
			local aa_puresize = render.measure_text(aa_font,"","PRIESTYAW")
			local aa_puredt = render.measure_text(aa_font,"",string.format("DT< %d",rage.exploit:get()*100).."% >")
			local aa_state = "Original"
			if Script.Menu_UI.antiaim.desync_preset:get() == "Freestanding" then
				aa_state = Script.Menu_UI.antiaim.main_enable:get() and "Freestanding" or "Original"
			elseif Script.Menu_UI.antiaim.desync_preset:get() == "R-Freestanding" then
				aa_state = Script.Menu_UI.antiaim.main_enable:get() and "Reverse" or "Original"
			elseif Script.Menu_UI.antiaim.desync_preset:get() == "Jitter previous" then
				aa_state = Script.Menu_UI.antiaim.main_enable:get() and "Jitter" or "Original"
			elseif Script.Menu_UI.antiaim.desync_preset:get() == "Tank" or Script.Menu_UI.antiaim.desync_preset:get() == "Tank 2" then
				aa_state = Script.Menu_UI.antiaim.main_enable:get() and "Tank" or "Original"
			elseif Script.Menu_UI.antiaim.desync_preset:get() == "Custom" then
				aa_state = Script.Menu_UI.antiaim.main_enable:get() and "Custom" or "Original"
			end
			local aa_purestate = render.measure_text(aa_font,"",aa_state)
			local plr_state = "< Defalut >"
			local chrg = rage.exploit:get()
			if self.API.getMemuindex({"Modern","Pure text"},self.Menu_UI.visual_panel.aa_style:get()) == 2 then
				local r_clr = self.Menu_UI.visual_panel.aa_indcolor:get()
				local f_clr = self.Menu_UI.visual_panel.aa_indcolor1:get()
				local sta_clr = self.Menu_UI.visual_panel.aa_staindcolor:get()
				local sty_clr = self.Menu_UI.visual_panel.aa_styindcolor:get()
				local def_clr = self.Menu_UI.visual_panel.aa_textindcolor:get()
				if Script.API.GetJumping(player) then
					plr_state = "< Jumping >"
				elseif Script.API.GetDucking(player) then
					plr_state = "< Ducking >"
				elseif self.API.GetVelocity(player) < 1.1 then
					plr_state = "< Standing >"
				elseif Script.ref.AntiAim.Slowwalk:get() then
					plr_state = "< Slowwalk >"
				elseif self.API.GetVelocity(player) >= 1.1 then
					plr_state = "< Walking >"
				end
				if not player.m_bIsScoped then
					if Script.aaind_pureupon ~= screen_size.x/2-(aa_puresize.x)/2 then
						Script.aaind_pureupon = self.API.Lerp_number(Script.aaind_pureupon,screen_size.x/2-(aa_puresize.x)/2,globals.frametime * 4)
					end
					if Script.aaind_pureunder ~= screen_size.x/2-render.measure_text(aa_font,"",plr_state).x/2 then
						Script.aaind_pureunder = self.API.Lerp_number(Script.aaind_pureunder,screen_size.x/2-render.measure_text(aa_font,"",plr_state).x/2,globals.frametime * 4)
					end
					if Script.aaind_puredt ~= screen_size.x/2-aa_puredt.x/2 then
						Script.aaind_puredt = self.API.Lerp_number(Script.aaind_puredt,screen_size.x/2-aa_puredt.x/2,globals.frametime * 4)
					end
					if Script.aa_purestate ~= screen_size.x/2-aa_purestate.x/2 then
						Script.aa_purestate = self.API.Lerp_number(Script.aa_purestate,screen_size.x/2-aa_purestate.x/2,globals.frametime * 4)
					end
				else
					if Script.aaind_pureupon ~= screen_size.x/2-(aa_puresize.x)/2 then
						Script.aaind_pureupon = self.API.Lerp_number(Script.aaind_pureupon,screen_size.x/2+10,globals.frametime * 4)
					end
					if Script.aaind_pureunder ~= screen_size.x/2-render.measure_text(aa_font,"",plr_state).x/2 then
						Script.aaind_pureunder = self.API.Lerp_number(Script.aaind_pureunder,screen_size.x/2+10,globals.frametime * 4)
					end
					if Script.aaind_puredt ~= screen_size.x/2-aa_puredt.x/2 then
						Script.aaind_puredt = self.API.Lerp_number(Script.aaind_puredt,screen_size.x/2+10,globals.frametime * 4)
					end
					if Script.aa_purestate ~= screen_size.x/2-aa_purestate.x/2 then
						Script.aa_purestate = self.API.Lerp_number(Script.aa_purestate,screen_size.x/2+10,globals.frametime * 4)
					end
				end
				if Script.ref.Aimbot.Doubletap:get() then
					Script.aaind_dtalpha = self.API.Lerp_number(Script.aaind_dtalpha,255,globals.frametime * 7)
				else
					Script.aaind_dtalpha = self.API.Lerp_number(Script.aaind_dtalpha,0,globals.frametime * 7)
				end
				if self.Menu_UI.visual_panel.arrow_ind:get() then
					if Script.API.getMemuindex({"Fake/Real","Manual AA"},Script.Menu_UI.visual_panel.arrow_style:get()) == 1 then
						render.text(arrow_font, vector(screen_size.x/2-arrow_size.x-100-(self.Menu_UI.visual_panel.arrow_ad:get())+1,screen_size.y/2-arrow_size.y/2+1), color(17, 17, 17, 255), nil,"w")
						render.text(arrow_font, vector(screen_size.x/2+92+arrow_size.x+(self.Menu_UI.visual_panel.arrow_ad:get())+1,screen_size.y/2-arrow_size.y/2+1), color(17, 17, 17, 255), nil,"x")
						render.text(arrow_font, vector(screen_size.x/2-arrow_size.x-100-(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size.y/2), color(1.0*255, 1.0*255, 1.0*255, 0.6*255), nil,"w")
						render.text(arrow_font, vector(screen_size.x/2+92+arrow_size.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size.y/2), color(1.0*255, 1.0*255, 1.0*255, 0.6*255), nil,"x")
						if Script.ref.AntiAim.inverter:get() then
							render.text(arrow_font, vector(screen_size.x/2-arrow_size.x-100-(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size.y/2), self.Menu_UI.visual_panel.arrow_color:get(), nil,"w")
						else
							render.text(arrow_font, vector(screen_size.x/2+92+arrow_size.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size.y/2), self.Menu_UI.visual_panel.arrow_color:get(), nil,"x")
						end
					else
						render.text(arrow_font, vector(screen_size.x/2-arrow_size2.x-58-(self.Menu_UI.visual_panel.arrow_ad:get())+1,screen_size.y/2-arrow_size2.y/2+1), color(17, 17, 17, 180), nil,"Q")
						render.text(arrow_font, vector(screen_size.x/2+42+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get())+1,screen_size.y/2-arrow_size2.y/2+1), color(17, 17, 17, 180), nil,"R")
						render.text(arrow_font, vector(screen_size.x/2-arrow_size2.x-58-(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), color(34, 34, 34, 0.6*255), nil,"Q")
						render.rect(vector(screen_size.x/2-58-(self.Menu_UI.visual_panel.arrow_ad:get())+2,screen_size.y/2-arrow_size2.y/2), vector(screen_size.x/2-58-(self.Menu_UI.visual_panel.arrow_ad:get())+4,screen_size.y/2+arrow_size2.y/2-4), color(34, 34, 34, 0.6*255))
						render.text(arrow_font, vector(screen_size.x/2+42+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), color(34, 34, 34, 0.6*255), nil,"R")
						render.rect(vector(screen_size.x/2+38+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), vector(screen_size.x/2+40+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2+arrow_size2.y/2-4), color(34, 34, 34, 0.6*255))
						if Script.ref.AntiAim.inverter:get() then
							render.rect(vector(screen_size.x/2-58-(self.Menu_UI.visual_panel.arrow_ad:get())+2,screen_size.y/2-arrow_size2.y/2), vector(screen_size.x/2-58-(self.Menu_UI.visual_panel.arrow_ad:get())+4,screen_size.y/2+arrow_size2.y/2-4), self.Menu_UI.visual_panel.arrow_color:get())
						else
							render.rect(vector(screen_size.x/2+38+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), vector(screen_size.x/2+40+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2+arrow_size2.y/2-4), self.Menu_UI.visual_panel.arrow_color:get())
						end
						if Script.Menu_UI.antiaim.manual_state:get() == 1 then
							render.text(arrow_font, vector(screen_size.x/2-arrow_size2.x-58-(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), self.Menu_UI.visual_panel.arrow_color:get(), nil,"Q")
						elseif Script.Menu_UI.antiaim.manual_state:get() == 2 then
							render.text(arrow_font, vector(screen_size.x/2+42+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), self.Menu_UI.visual_panel.arrow_color:get(), nil,"R")
						end
					end
				end
				if self.Menu_UI.visual_panel.aa_textind:get() then
					if Script.ref.AntiAim.inverter:get() then
						render.text(aa_font, vector(Script.aaind_pureupon,screen_size.y/2+aa_size.y+5), r_clr, nil,"PRIEST")
						render.text(aa_font, vector(Script.aaind_pureupon+render.measure_text(aa_font,"","PRIEST").x-2,screen_size.y/2+aa_size.y+5), f_clr, nil,"YAW")
					else
						render.text(aa_font, vector(Script.aaind_pureupon,screen_size.y/2+aa_size.y+5), f_clr, nil,"PRIEST")
						render.text(aa_font, vector(Script.aaind_pureupon+render.measure_text(aa_font,"","PRIEST").x-2,screen_size.y/2+aa_size.y+5), r_clr, nil,"YAW")
					end
				else
					render.text(aa_font, vector(Script.aaind_pureupon,screen_size.y/2+aa_size.y+5), def_clr, nil,"PRIESTYAW")
				end
				render.text(aa_font, vector(Script.aaind_pureunder,screen_size.y/2+aa_size.y+15), sta_clr, nil,plr_state)
				render.text(aa_font, vector(Script.aa_purestate,screen_size.y/2+aa_size.y+25), sty_clr, nil,aa_state)
				render.text(aa_font, vector(Script.aaind_puredt,screen_size.y/2+aa_size.y+35), color(255, 255, 255, Script.aaind_dtalpha), nil,"DT")
				render.text(aa_font, vector(Script.aaind_puredt+render.measure_text(aa_font,"","DT").x,screen_size.y/2+aa_size.y+35), color((1-rage.exploit:get())*255, rage.exploit:get()*255-((1-rage.exploit:get())*255), 0, Script.aaind_dtalpha), nil,string.format("< %d",rage.exploit:get()*100).."% >")
			else
				Script.aaind_rect = self.API.Lerp_number(Script.aaind_rect,math.abs(Script.desync_angle)*0.75,globals.frametime * 4)
				Script.aaind_dtrect = self.API.Lerp_number(Script.aaind_dtrect,45*chrg,globals.frametime * 4)
				if Script.aaind_upon == 0 then
					Script.aaind_upon = screen_size.x/2-aa_size.x/2+1-12
					Script.aaind_under = screen_size.x/2-aa_size.x/2-4
					Script.aaind_upony = screen_size.y/2+aa_size.y+17
					Script.aaind_undery = screen_size.y/2+aa_size.y+29
				end
				if Script.ref.Aimbot.Doubletap:get() then
					Script.aaind_upony = self.API.Lerp_number(Script.aaind_upony,screen_size.y/2+aa_size.y+17+12.9,globals.frametime * 4)
					Script.aaind_undery = self.API.Lerp_number(Script.aaind_undery,screen_size.y/2+aa_size.y+29+12.9,globals.frametime * 4)
					Script.aaind_dtalpha = self.API.Lerp_number(Script.aaind_dtalpha,255,globals.frametime * 8)
				else
					Script.aaind_upony = self.API.Lerp_number(Script.aaind_upony,screen_size.y/2+aa_size.y+17,globals.frametime * 4)
					Script.aaind_undery = self.API.Lerp_number(Script.aaind_undery,screen_size.y/2+aa_size.y+29,globals.frametime * 4)
					Script.aaind_dtalpha = self.API.Lerp_number(Script.aaind_dtalpha,0,globals.frametime * 8)
				end
				if player.m_bIsScoped then
					Script.aaind_upon = self.API.Lerp_number(Script.aaind_upon,screen_size.x/2+10,globals.frametime * 4)
					Script.aaind_under = self.API.Lerp_number(Script.aaind_under,screen_size.x/2+10,globals.frametime * 4)
				else
					Script.aaind_upon = self.API.Lerp_number(Script.aaind_upon,screen_size.x/2-aa_size.x/2+1-12,globals.frametime * 4)
					Script.aaind_under = self.API.Lerp_number(Script.aaind_under,screen_size.x/2-aa_size.x/2-4,globals.frametime * 4)
				end
				--print(tostring(render.measure_text("AA", 10,aa_font).y))
				if self.Menu_UI.visual_panel.arrow_ind:get() then
					if Script.API.getMemuindex({"Fake/Real","Manual AA"},Script.Menu_UI.visual_panel.arrow_style:get()) == 1 then
						render.text(arrow_font, vector(screen_size.x/2-arrow_size.x-100-(self.Menu_UI.visual_panel.arrow_ad:get())+1,screen_size.y/2-arrow_size.y/2+1), color(17, 17, 17, 255), nil,"w")
						render.text(arrow_font, vector(screen_size.x/2+92+arrow_size.x+(self.Menu_UI.visual_panel.arrow_ad:get())+1,screen_size.y/2-arrow_size.y/2+1), color(17, 17, 17, 255), nil,"x")
						render.text(arrow_font, vector(screen_size.x/2-arrow_size.x-100-(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size.y/2), color(1.0*255, 1.0*255, 1.0*255, 0.6*255), nil,"w")
						render.text(arrow_font, vector(screen_size.x/2+92+arrow_size.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size.y/2), color(1.0*255, 1.0*255, 1.0*255, 0.6*255), nil,"x")
						if Script.ref.AntiAim.inverter:get() then
							render.text(arrow_font, vector(screen_size.x/2-arrow_size.x-100-(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size.y/2), self.Menu_UI.visual_panel.arrow_color:get(), nil,"w")
						else
							render.text(arrow_font, vector(screen_size.x/2+92+arrow_size.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size.y/2), self.Menu_UI.visual_panel.arrow_color:get(), nil,"x")
						end
					else
						render.text(arrow_font, vector(screen_size.x/2-arrow_size2.x-58-(self.Menu_UI.visual_panel.arrow_ad:get())+1,screen_size.y/2-arrow_size2.y/2+1), color(17, 17, 17, 180), nil,"Q")
						render.text(arrow_font, vector(screen_size.x/2+42+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get())+1,screen_size.y/2-arrow_size2.y/2+1), color(17, 17, 17, 180), nil,"R")
						render.text(arrow_font, vector(screen_size.x/2-arrow_size2.x-58-(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), color(34, 34, 34, 0.6*255), nil,"Q")
						render.rect(vector(screen_size.x/2-58-(self.Menu_UI.visual_panel.arrow_ad:get())+2,screen_size.y/2-arrow_size2.y/2), vector(screen_size.x/2-58-(self.Menu_UI.visual_panel.arrow_ad:get())+4,screen_size.y/2+arrow_size2.y/2-4), color(34, 34, 34, 0.6*255))
						render.text(arrow_font, vector(screen_size.x/2+42+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), color(34, 34, 34, 0.6*255), nil,"R")
						render.rect(vector(screen_size.x/2+38+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), vector(screen_size.x/2+40+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2+arrow_size2.y/2-4), color(34, 34, 34, 0.6*255))
						if Script.ref.AntiAim.inverter:get() then
							render.rect(vector(screen_size.x/2-58-(self.Menu_UI.visual_panel.arrow_ad:get())+2,screen_size.y/2-arrow_size2.y/2), vector(screen_size.x/2-58-(self.Menu_UI.visual_panel.arrow_ad:get())+4,screen_size.y/2+arrow_size2.y/2-4), self.Menu_UI.visual_panel.arrow_color:get())
						else
							render.rect(vector(screen_size.x/2+38+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), vector(screen_size.x/2+40+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2+arrow_size2.y/2-4), self.Menu_UI.visual_panel.arrow_color:get())
						end
						if Script.Menu_UI.antiaim.manual_state:get() == 1 then
							render.text(arrow_font, vector(screen_size.x/2-arrow_size2.x-58-(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), self.Menu_UI.visual_panel.arrow_color:get(), nil,"Q")
						elseif Script.Menu_UI.antiaim.manual_state:get() == 2 then
							render.text(arrow_font, vector(screen_size.x/2+42+arrow_size2.x+(self.Menu_UI.visual_panel.arrow_ad:get()),screen_size.y/2-arrow_size2.y/2), self.Menu_UI.visual_panel.arrow_color:get(), nil,"R")
						end
					end
				end--boxy upony+3 upony+aa_size.y/2
				render.text(aa_font, vector(Script.aaind_under,screen_size.y/2+aa_size.y+17), color(1.0*255, 1.0*255, 1.0*255, Script.aaind_dtalpha), nil,"DT")
				render.rect(vector(Script.aaind_under+14+aa_size.y/4,screen_size.y/2+aa_size.y+20), vector(Script.aaind_under+14+aa_size.y/4+45,screen_size.y/2+aa_size.y+20+aa_size.y/2), color(0, 0, 0, Script.aaind_dtalpha*0.6))
				render.circle(vector(Script.aaind_under+14+aa_size.y/4,screen_size.y/2+aa_size.y+20+aa_size.y/4),color(0, 0, 0, Script.aaind_dtalpha*0.6), aa_size.y/4, 90, 0.5)
				render.circle(vector(Script.aaind_under+14+aa_size.y/4+45,screen_size.y/2+aa_size.y+20+aa_size.y/4),color(0, 0, 0, Script.aaind_dtalpha*0.6), aa_size.y/4, 270, 0.5)
				render.text(aa_font, vector(Script.aaind_under,Script.aaind_upony), color(1.0*255, 1.0*255, 1.0*255, 1.0*255), nil,"AA")
				render.rect(vector(Script.aaind_under+14+aa_size.y/4,Script.aaind_upony+3), vector(Script.aaind_under+14+aa_size.y/4+45,Script.aaind_upony+3+aa_size.y/2), color(0, 0, 0, 0.6*255))
				render.circle(vector(Script.aaind_under+14+aa_size.y/4,Script.aaind_upony+3+aa_size.y/4),color(0, 0, 0, 0.6*255), aa_size.y/4, 90, 0.5)
				render.circle(vector(Script.aaind_under+14+aa_size.y/4+45,Script.aaind_upony+3+aa_size.y/4),color(0, 0, 0, 0.6*255), aa_size.y/4, 270, 0.5)
				render.text(aa_font, vector(Script.aaind_under,Script.aaind_undery), color(1.0*255, 1.0*255, 1.0*255, 0.6*255), nil,"OS")
				render.text(aa_font, vector(Script.aaind_under+18,Script.aaind_undery), color(1.0*255, 1.0*255, 1.0*255, 0.6*255), nil,"FD")
				render.text(aa_font, vector(Script.aaind_under+36,Script.aaind_undery), color(1.0*255, 1.0*255, 1.0*255, 0.6*255), nil,"BA")
				render.text(aa_font, vector(Script.aaind_under+54,Script.aaind_undery), color(1.0*255, 1.0*255, 1.0*255, 0.6*255), nil,"SP")
				if Script.ref.Aimbot.Hideshots:get() then render.text(aa_font, vector(Script.aaind_under,Script.aaind_undery), color(1.0*255, 1.0*255, 1.0*255, 1*255), nil,"OS") end
				if Script.ref.AntiAim.Fakeduck:get() then render.text(aa_font, vector(Script.aaind_under+18,Script.aaind_undery), color(1.0*255, 1.0*255, 1.0*255, 1*255), nil,"FD") end
				if Script.ref.Aimbot.body_aim:get() ~= "Default" then render.text(aa_font, vector(Script.aaind_under+36,Script.aaind_undery), color(1.0*255, 1.0*255, 1.0*255, 1*255), nil,"BA") end
				if Script.ref.Aimbot.safe_point:get() ~= "Default" then render.text(aa_font, vector(Script.aaind_under+54,Script.aaind_undery), color(1.0*255, 1.0*255, 1.0*255, 1*255), nil,"SP") end
				if self.API.getMemuindex(Script.Menu_table.visual_panel.ind_color_mode,self.Menu_UI.visual_panel.aa_indmode:get()) == 1 then
					Script.API.RenderGradientText(Script.aaind_upon,screen_size.y/2+aa_size.y+5,self.Menu_UI.visual_panel.aa_indcolor:get(),self.Menu_UI.visual_panel.aa_indcolor:get(),10,aa_font,"SAINT-PRIEST",false,false,false)
					render.rect(vector(Script.aaind_under+14+aa_size.y/4,Script.aaind_upony+3), vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_rect,Script.aaind_upony+3+aa_size.y/2), self.Menu_UI.visual_panel.aa_indcolor:get())
					render.circle(vector(Script.aaind_under+14+aa_size.y/4,Script.aaind_upony+3+aa_size.y/4),self.Menu_UI.visual_panel.aa_indcolor:get(), aa_size.y/4, 90, 0.5)
					render.circle(vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_rect,Script.aaind_upony+3+aa_size.y/4),self.Menu_UI.visual_panel.aa_indcolor:get(), aa_size.y/4, 270, 0.5)
					if chrg ~= 0 then
						render.rect(vector(Script.aaind_under+14+aa_size.y/4,screen_size.y/2+aa_size.y+20), vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_dtrect,screen_size.y/2+aa_size.y+20+aa_size.y/2), color((self.Menu_UI.visual_panel.aa_indcolor:get()).r,(self.Menu_UI.visual_panel.aa_indcolor:get()).g,(self.Menu_UI.visual_panel.aa_indcolor:get()).b,Script.aaind_dtalpha))
						render.circle(vector(Script.aaind_under+14+aa_size.y/4,screen_size.y/2+aa_size.y+20+aa_size.y/4),color((self.Menu_UI.visual_panel.aa_indcolor:get()).r,(self.Menu_UI.visual_panel.aa_indcolor:get()).g,(self.Menu_UI.visual_panel.aa_indcolor:get()).b,Script.aaind_dtalpha), aa_size.y/4, 90, 0.5)
						render.circle(vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_dtrect,screen_size.y/2+aa_size.y+20+aa_size.y/4),color((self.Menu_UI.visual_panel.aa_indcolor:get()).r,(self.Menu_UI.visual_panel.aa_indcolor:get()).g,(self.Menu_UI.visual_panel.aa_indcolor:get()).b,Script.aaind_dtalpha), aa_size.y/4, 270,0.5)
					end
				else
					if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
						Script.API.RenderGradientText(Script.aaind_upon,screen_size.y/2+aa_size.y+5,wtm_color1,wtm_color1,10,aa_font,"SAINT-PRIEST",false,false,false)
						render.rect(vector(Script.aaind_under+14+aa_size.y/4,Script.aaind_upony+3), vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_rect,Script.aaind_upony+3+aa_size.y/2), wtm_color1)
						render.circle(vector(Script.aaind_under+14+aa_size.y/4,Script.aaind_upony+3+aa_size.y/4),wtm_color1, aa_size.y/4, 90, 0.5)
						render.circle(vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_rect,Script.aaind_upony+3+aa_size.y/4),wtm_color1, aa_size.y/4, 270, 0.5)
						if chrg ~= 0 then
							render.rect(vector(Script.aaind_under+14+aa_size.y/4,screen_size.y/2+aa_size.y+20), vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_dtrect,screen_size.y/2+aa_size.y+20+aa_size.y/2), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.aaind_dtalpha))
							render.circle(vector(Script.aaind_under+14+aa_size.y/4,screen_size.y/2+aa_size.y+20+aa_size.y/4),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.aaind_dtalpha), aa_size.y/4, 90,0.5)
							render.circle(vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_dtrect,screen_size.y/2+aa_size.y+20+aa_size.y/4),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.aaind_dtalpha), aa_size.y/4, 270,0.5)
						end
					elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
						Script.API.RenderGradientText(Script.aaind_upon,screen_size.y/2+aa_size.y+5,wtm_color1,wtm_color2,10,aa_font,"SAINT-PRIEST",false,false,false)
	
						render.gradient(vector(Script.aaind_under+14+aa_size.y/4,Script.aaind_upony+3), vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_rect,Script.aaind_upony+3+aa_size.y/2), wtm_color1,wtm_color2,wtm_color1,wtm_color2)
						render.circle(vector(Script.aaind_under+14+aa_size.y/4,Script.aaind_upony+3+aa_size.y/4),wtm_color1, aa_size.y/4, 90, 0.5)
						render.circle(vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_rect,Script.aaind_upony+3+aa_size.y/4),Script.aaind_rect <= 4 and wtm_color1 or wtm_color2, aa_size.y/4, 270, 0.5)
						if chrg ~= 0 then
							render.gradient(vector(Script.aaind_under+14+aa_size.y/4,screen_size.y/2+aa_size.y+20), vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_dtrect,screen_size.y/2+aa_size.y+20+aa_size.y/2), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.aaind_dtalpha), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.aaind_dtalpha), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.aaind_dtalpha), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.aaind_dtalpha))
							render.circle(vector(Script.aaind_under+14+aa_size.y/4,screen_size.y/2+aa_size.y+20+aa_size.y/4),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.aaind_dtalpha), aa_size.y/4, 90, 0.5)
							render.circle(vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_dtrect,screen_size.y/2+aa_size.y+20+aa_size.y/4),color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.aaind_dtalpha), aa_size.y/4, 270, 0.5)
						end
					elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
						Script.API.RenderGradientText(Script.aaind_upon,screen_size.y/2+aa_size.y+5,color(rgb_color.r, rgb_color.g, rgb_color.b, 1*255),color(rgb_color.g, rgb_color.b, rgb_color.r, 1*255),10,aa_font,"SAINT-PRIEST",false,false,false)
						render.gradient(vector(Script.aaind_under+14+aa_size.y/4,Script.aaind_upony+3), vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_rect,Script.aaind_upony+3+aa_size.y/2), color(rgb_color.r, rgb_color.g, rgb_color.b, 1*255),color(rgb_color.g, rgb_color.b, rgb_color.r, 1*255),color(rgb_color.r, rgb_color.g, rgb_color.b, 1*255),color(rgb_color.g, rgb_color.b, rgb_color.r, 1*255))
						render.circle(vector(Script.aaind_under+14+aa_size.y/4,Script.aaind_upony+3+aa_size.y/4),color(rgb_color.r, rgb_color.g, rgb_color.b, 255), aa_size.y/4, 90, 0.5)
						render.circle(vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_rect,Script.aaind_upony+3+aa_size.y/4),Script.aaind_rect <= 4 and color(rgb_color.r, rgb_color.g, rgb_color.b, 255) or color(rgb_color.g, rgb_color.b, rgb_color.r, 255), aa_size.y/4, 270, 0.5)
						if chrg ~= 0 then
							render.gradient(vector(Script.aaind_under+14+aa_size.y/4,screen_size.y/2+aa_size.y+20), vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_dtrect,screen_size.y/2+aa_size.y+20+aa_size.y/2), color(rgb_color.r, rgb_color.g, rgb_color.b, Script.aaind_dtalpha),color(rgb_color.g, rgb_color.b, rgb_color.r, Script.aaind_dtalpha),color(rgb_color.r, rgb_color.g, rgb_color.b, Script.aaind_dtalpha),color(rgb_color.g, rgb_color.b, rgb_color.r, Script.aaind_dtalpha))
							render.circle(vector(Script.aaind_under+14+aa_size.y/4,screen_size.y/2+aa_size.y+20+aa_size.y/4),color(rgb_color.r, rgb_color.g, rgb_color.b,Script.aaind_dtalpha), aa_size.y/4, 90, 0.5)
							render.circle(vector(Script.aaind_under+14+aa_size.y/4+Script.aaind_dtrect,screen_size.y/2+aa_size.y+20+aa_size.y/4),color(rgb_color.g, rgb_color.b, rgb_color.r,Script.aaind_dtalpha), aa_size.y/4, 270, 0.5)
						end
					end
				end
			end
		end
	end
	--dmg ind
	if Script.Menu_UI.visual_panel.dmg_ind:get() and entity.get_local_player() then
		if player:is_alive() then
			if self.API.getMemuindex(Script.Menu_table.visual_panel.dmg_pos,Script.Menu_UI.visual_panel.dmg_mode:get()) == 4 then render.text(font_dmg, vector(screen_size.x/2+9, screen_size.y/2+render.measure_text(font_dmg,"",Script.ref.Aimbot.damage:get()).y/2-2), color(255, 255, 255, 255), nil,Script.ref.Aimbot.damage:get()) end
			if self.API.getMemuindex(Script.Menu_table.visual_panel.dmg_pos,Script.Menu_UI.visual_panel.dmg_mode:get()) == 3 then render.text(font_dmg, vector(screen_size.x/2-render.measure_text(font_dmg,"",Script.ref.Aimbot.damage:get()).x-7, screen_size.y/2+render.measure_text(font_dmg,"",Script.ref.Aimbot.damage:get()).y/2-2), color(255, 255, 255, 255), nil,Script.ref.Aimbot.damage:get()) end
			if self.API.getMemuindex(Script.Menu_table.visual_panel.dmg_pos,Script.Menu_UI.visual_panel.dmg_mode:get()) == 2 then render.text(font_dmg, vector(screen_size.x/2+9, screen_size.y/2-render.measure_text(font_dmg,"",Script.ref.Aimbot.damage:get()).y-7), color(255, 255, 255, 255), nil,Script.ref.Aimbot.damage:get()) end
			if self.API.getMemuindex(Script.Menu_table.visual_panel.dmg_pos,Script.Menu_UI.visual_panel.dmg_mode:get()) == 1 then render.text(font_dmg, vector(screen_size.x/2-render.measure_text(font_dmg,"",Script.ref.Aimbot.damage:get()).x-9, screen_size.y/2-render.measure_text(font_dmg,"",Script.ref.Aimbot.damage:get()).y-7), color(255, 255, 255, 255), nil,Script.ref.Aimbot.damage:get()) end
		end
	end
	--scope line
	if Script.Menu_UI.visual_panel.scope_ind:get() and entity.get_local_player() then
		local line_spd = self.Menu_UI.visual_panel.line_anim:get()
		local line_thk = self.Menu_UI.visual_panel.line_thick:get()
		local line_res = self.API.getMemuindex({"Defalut","Reverse"},self.Menu_UI.visual_panel.line_dismode:get())
		if player:is_alive() and player.m_bIsScoped then
			if self.API.getMemuindex(Script.Menu_table.visual_panel.line_mode,Script.Menu_UI.visual_panel.line_mode:get()) == 1 then
				Script.line_length = Script.API.Lerp_number(Script.line_length,Script.Menu_UI.visual_panel.line_l:get(),globals.frametime * line_spd)
				local offset = Script.Menu_UI.visual_panel.line_off:get()
				local color1 = Script.Menu_UI.visual_panel.line_color1:get()
				--print(tostring(Script.line_length))
				if line_res == 1 then
					render.gradient(vector(screen_size.x/2-offset, screen_size.y/2-line_thk/2), vector(screen_size.x/2-offset-Script.line_length, screen_size.y/2+line_thk/2), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 0))
					render.gradient(vector(screen_size.x/2-line_thk/2, screen_size.y/2-offset), vector(screen_size.x/2+line_thk/2, screen_size.y/2-offset-Script.line_length), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 0))
					render.gradient(vector(screen_size.x/2+offset, screen_size.y/2-line_thk/2), vector(screen_size.x/2+offset+Script.line_length, screen_size.y/2+line_thk/2), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 0))
					render.gradient(vector(screen_size.x/2-line_thk/2, screen_size.y/2+offset), vector(screen_size.x/2+line_thk/2, screen_size.y/2+offset+Script.line_length), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 0))
				else
					render.gradient(vector(screen_size.x/2-offset, screen_size.y/2-line_thk/2), vector(screen_size.x/2-offset-Script.line_length, screen_size.y/2+line_thk/2), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 255))
					render.gradient(vector(screen_size.x/2-line_thk/2, screen_size.y/2-offset), vector(screen_size.x/2+line_thk/2, screen_size.y/2-offset-Script.line_length), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 255))
					render.gradient(vector(screen_size.x/2+offset, screen_size.y/2-line_thk/2), vector(screen_size.x/2+offset+Script.line_length, screen_size.y/2+line_thk/2), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 255))
					render.gradient(vector(screen_size.x/2-line_thk/2, screen_size.y/2+offset), vector(screen_size.x/2+line_thk/2, screen_size.y/2+offset+Script.line_length), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 255))
				end
			else
				Script.line_length = Script.API.Lerp_number(Script.line_length,Script.Menu_UI.visual_panel.line_l:get(),globals.frametime * line_spd)
				local offset = Script.Menu_UI.visual_panel.line_off:get()
				local color1 = Script.Menu_UI.visual_panel.line_color1:get()
				local color2 = Script.Menu_UI.visual_panel.line_color2:get()
				--print(tostring(Script.line_length))
				if line_res == 1 then
					render.gradient(vector(screen_size.x/2-offset, screen_size.y/2-line_thk/2), vector(screen_size.x/2-offset-Script.line_length, screen_size.y/2+line_thk/2), color(color1.r, color1.g, color1.b, 255), color(color2.r, color2.g, color2.b, 0), color(color1.r, color1.g, color1.b, 255), color(color2.r, color2.g, color2.b, 0))
					render.gradient(vector(screen_size.x/2-line_thk/2, screen_size.y/2-offset), vector(screen_size.x/2+line_thk/2, screen_size.y/2-offset-Script.line_length), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 255), color(color2.r, color2.g, color2.b, 0), color(color2.r, color2.g, color2.b, 0))
					render.gradient(vector(screen_size.x/2+offset, screen_size.y/2-line_thk/2), vector(screen_size.x/2+offset+Script.line_length, screen_size.y/2+line_thk/2), color(color1.r, color1.g, color1.b, 255), color(color2.r, color2.g, color2.b, 0), color(color1.r, color1.g, color1.b, 255), color(color2.r, color2.g, color2.b, 0))
					render.gradient(vector(screen_size.x/2-line_thk/2, screen_size.y/2+offset), vector(screen_size.x/2+line_thk/2, screen_size.y/2+offset+Script.line_length), color(color1.r, color1.g, color1.b, 255), color(color1.r, color1.g, color1.b, 255), color(color2.r, color2.g, color2.b, 0), color(color2.r, color2.g, color2.b, 0))
				else
					render.gradient(vector(screen_size.x/2-offset, screen_size.y/2-line_thk/2), vector(screen_size.x/2-offset-Script.line_length, screen_size.y/2+line_thk/2), color(color1.r, color1.g, color1.b, 0), color(color2.r, color2.g, color2.b, 255), color(color1.r, color1.g, color1.b, 0), color(color2.r, color2.g, color2.b, 255))
					render.gradient(vector(screen_size.x/2-line_thk/2, screen_size.y/2-offset), vector(screen_size.x/2+line_thk/2, screen_size.y/2-offset-Script.line_length), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 0), color(color2.r, color2.g, color2.b, 255), color(color2.r, color2.g, color2.b, 255))
					render.gradient(vector(screen_size.x/2+offset, screen_size.y/2-line_thk/2), vector(screen_size.x/2+offset+Script.line_length, screen_size.y/2+line_thk/2), color(color1.r, color1.g, color1.b, 0), color(color2.r, color2.g, color2.b, 255), color(color1.r, color1.g, color1.b, 0), color(color2.r, color2.g, color2.b, 255))
					render.gradient(vector(screen_size.x/2-line_thk/2, screen_size.y/2+offset), vector(screen_size.x/2+line_thk/2, screen_size.y/2+offset+Script.line_length), color(color1.r, color1.g, color1.b, 0), color(color1.r, color1.g, color1.b, 0), color(color2.r, color2.g, color2.b, 255), color(color2.r, color2.g, color2.b, 255))
				end
			end
		else
			Script.line_length = Script.API.Lerp_number(Script.line_length,0,globals.frametime * 8)
		end
	end
	--Zeus warning
	if self.Menu_UI.misc.zeus_warn:get() and entity.get_local_player() then
		local zues_font = Script.API.CreateFont("Essential fonts\\Arrows Sexy.otf",26)
		if player:is_alive() then
			local players = entity.get_players()
			for table_index, player_pointer in pairs(players) do
				if player_pointer == player then goto skip end
				if player_pointer:is_enemy() then
					local plr_dis = Script.API.GetPlayerDistance(player,player_pointer)
					if plr_dis <= 900 then
						Script.zues_alpha = Script.API.Lerp_number(Script.zues_alpha,255,globals.frametime * 8)
					else
						Script.zues_alpha = Script.API.Lerp_number(Script.zues_alpha,0,globals.frametime * 8)
					end
					local draw_pos = player_pointer:get_hitbox_position(0)--getorigin
					--local min = vector()
					--local max = vector()
					--local bound_pos = player_pointer:GetRenderBounds(min, max)
					local rel_eyepos = render.world_to_screen(draw_pos)
					if rel_eyepos ~= nil then
						render.text(zues_font, vector(rel_eyepos.x+24,rel_eyepos.y-10), color(255, 255, 0, Script.zues_alpha), nil,"A")
					end
				end
				::skip::
			end
		end
	end
	--speed warn 默认274, 112
	local spped_xs = self.Menu_UI.misc.speed_x:get()
	local spped_ys = self.Menu_UI.misc.speed_y:get()
	if self.Menu_UI.misc.speed_warn:get() and entity.get_local_player() then
		local r,g,b = 0,0,0
		local a = 0
		local speed_icon = Script.API.CreateFont("Essential fonts\\Saint-Priest.ttf", 20)
		local spdmouse = ui.get_mouse_position()
		local speed_font = Script.API.CreateFont("Essential fonts\\Segoe UI Bold.ttf",36)
		local ww_font = Script.API.CreateFont("Verdana",14,"b")
		if player:is_alive() then
			local modifier = player.m_flVelocityModifier
			Script.spd_rect = Script.API.Lerp_number(Script.spd_rect,modifier*180,globals.frametime * 5)
			if ui.get_alpha() == 1 then
				Script.spd_alpha = Script.API.Lerp_number(Script.spd_alpha,255,globals.frametime * 6)
				if spdmouse.x >= Script.spddef_x and spdmouse.y >= Script.spddef_y-20 and spdmouse.x <= Script.spddef_x+222 and spdmouse.y <= Script.spddef_y+68 then
					Script.spddrag_alpha = Script.API.Lerp_number(Script.spddrag_alpha,255,globals.frametime * 6)
				else
					Script.spddrag_alpha = Script.API.Lerp_number(Script.spddrag_alpha,0,globals.frametime * 6)
				end
				Script.API.RenderBlurRoundedtoalpharect(Script.spddef_x, Script.spddef_y-20, color(drag_clr.r,drag_clr.g,drag_clr.b,Script.spddrag_alpha), color(drag_clr.r,drag_clr.g,drag_clr.b,Script.spddrag_alpha), 242, 88,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"DRAGABLE",0,true,true)
				--render.text(ww_font, vector(spped_xs+65, spped_ys+4), color(0, 0, 0, Script.spd_alpha), nil,("%.0f%% Remain"):format(modifier*100))
				--render.poly(color(0, 0, 0, Script.spd_alpha), vector(spped_xs+26, spped_ys), vector(spped_xs, spped_ys+48), vector(spped_xs+52, spped_ys+48))
				--render.poly(plr_vel<=251 and color((1 - (Script.spd_rect/144)*0.88)*255, (0.12+(Script.spd_rect/144)*0.88)*255, 0, Script.spd_alpha) or color(0, 255, 0, Script.spd_alpha), vector(spped_xs+26, spped_ys+8), vector(spped_xs+6, spped_ys+45), vector(spped_xs+46, spped_ys+45))
				--render.text(speed_font, vector(spped_xs+26-render.measure_text(speed_font,"","!").x/2, spped_ys+render.measure_text(speed_font,"","!").y/3.2), color(0, 0, 0, Script.spd_alpha), nil,"!")
				render.text(ww_font, vector(spped_xs+33 + render.measure_text(speed_icon,"","2").x + 9, spped_ys+11), color(17, 17, 17, Script.spd_alpha), nil,("Slowed down %.0f%%"):format(modifier*100))
				render.text(ww_font, vector(spped_xs+33 + render.measure_text(speed_icon,"","2").x + 8, spped_ys+10), color(255, 255, 255, Script.spd_alpha), nil,("Slowed down %.0f%%"):format(modifier*100))
				render.text(speed_icon, vector(spped_xs+36, spped_ys+6), color(17, 17, 17, Script.spd_alpha), nil, "2")
				render.text(speed_icon, vector(spped_xs+35, spped_ys+5), color(255, 255, 255, Script.spd_alpha), nil, "2")
				render.rect(vector(spped_xs+26, spped_ys+28), vector(spped_xs+212, spped_ys+43), color(17, 17, 17, (Script.spd_alpha)*0.8),8)
				render.rect(vector(spped_xs+29, spped_ys+31), vector(spped_xs+29+Script.spd_rect, spped_ys+40), plr_vel<=251 and color((1 - (Script.spd_rect/180)*0.88)*255, (0.12+(Script.spd_rect/180)*0.88)*255, 0, Script.spd_alpha) or color(0, 255, 0, Script.spd_alpha),3)
				if common.is_button_down(0x1) and (spdmouse.x >= Script.spddef_x-20 and spdmouse.y >= Script.spddef_y-20 and spdmouse.x <= Script.spddef_x+232 and spdmouse.y <= Script.spddef_y+68) then
					Script.spddef_x = math.floor(Script.API.Lerp_number(Script.spddef_x,spdmouse.x-106,globals.frametime * 30))
					Script.spddef_y = math.floor(Script.API.Lerp_number(Script.spddef_y,spdmouse.y-24,globals.frametime * 30))
					self.Menu_UI.misc.speed_x:set(Script.spddef_x)
					self.Menu_UI.misc.speed_y:set(Script.spddef_y)
				end
			else
				if modifier ~= 1 then
					r, g, b = Script.API.gethealthbaseclr(modifier)
					a = Script.API.remap(modifier, 1, 0, 0.85, 1)
					Script.spd_interval = Script.spd_interval + (1-modifier) * 0.7 + 0.3
					local warningAlpha = math.abs(Script.spd_interval*0.01 % 2 - 1) * 255

					render.text(ww_font, vector(spped_xs+33 + render.measure_text(speed_icon,"","2").x + 9, spped_ys+11), color(17, 17, 17, warningAlpha*a), nil,("Slowed down %.0f%%"):format(modifier*100))
					render.text(ww_font, vector(spped_xs+33 + render.measure_text(speed_icon,"","2").x + 8, spped_ys+10), color(255, 255, 255, warningAlpha*a), nil,("Slowed down %.0f%%"):format(modifier*100))
					render.text(speed_icon, vector(spped_xs+36, spped_ys+6), color(17, 17, 17, warningAlpha*a), nil, "2")
					render.text(speed_icon, vector(spped_xs+35, spped_ys+5), color(255, 255, 255, warningAlpha*a), nil, "2")
					render.rect(vector(spped_xs+26, spped_ys+28), vector(spped_xs+212, spped_ys+43), color(17, 17, 17, warningAlpha*a*0.8),8)
					render.rect(vector(spped_xs+29, spped_ys+31), vector(spped_xs+29+Script.spd_rect, spped_ys+40), color(r, g, b, warningAlpha*a),3)

					-- render.text(ww_font, vector(spped_xs+65, spped_ys+4), color(0, 0, 0, warningAlpha*a), nil,("%.0f%% Remain"):format(modifier*100))
					-- render.text(ww_font, vector(spped_xs+64, spped_ys+3), color(255, 255, 255, warningAlpha*a), nil,("%.0f%% Remain"):format(modifier*100))
					-- render.poly(color(16, 16, 16, warningAlpha*a), vector(spped_xs+26, spped_ys), vector(spped_xs, spped_ys+48), vector(spped_xs+52, spped_ys+48))
					-- render.poly(color(r, g, b, (warningAlpha*a)), vector(spped_xs+26, spped_ys+8), vector(spped_xs+6, spped_ys+45), vector(spped_xs+46, spped_ys+45))
					-- render.text(speed_font, vector(spped_xs+26-render.measure_text(speed_font,"","!").x/2, spped_ys+render.measure_text(speed_font,"","!").y/3.2), color(0, 0, 0, (warningAlpha*a)),nil,"!")
					-- render.rect(vector(spped_xs+62, spped_ys+28), vector(spped_xs+212, spped_ys+48), color(0, 0, 0, warningAlpha*a*0.8),6)
					-- render.rect(vector(spped_xs+65, spped_ys+31), vector(spped_xs+65+Script.spd_rect, spped_ys+45), color(r, g, b, warningAlpha*a),3)
				end
			end
		else
			Script.spd_rect = plr_vel <= 251 and Script.API.Lerp_number(Script.spd_rect,(plr_vel/250)*180,globals.frametime * 5) or Script.API.Lerp_number(Script.spd_rect,180,globals.frametime * 5)
			if ui.get_alpha() == 1 then
				Script.spd_alpha = Script.API.Lerp_number(Script.spd_alpha,255,globals.frametime * 6)
				if spdmouse.x >= Script.spddef_x-20 and spdmouse.y >= Script.spddef_y-20 and spdmouse.x <= Script.spddef_x+232 and spdmouse.y <= Script.spddef_y+68 then
					Script.spddrag_alpha = Script.API.Lerp_number(Script.spddrag_alpha,255,globals.frametime * 6)
				else
					Script.spddrag_alpha = Script.API.Lerp_number(Script.spddrag_alpha,0,globals.frametime * 6)
				end
				if common.is_button_down(0x1) and (spdmouse.x >= Script.spddef_x and spdmouse.y >= Script.spddef_y-20 and spdmouse.x <= Script.spddef_x+222 and spdmouse.y <= Script.spddef_y+68) then
					Script.spddef_x = math.floor(Script.API.Lerp_number(Script.spddef_x,spdmouse.x-106,globals.frametime * 30))
					Script.spddef_y = math.floor(Script.API.Lerp_number(Script.spddef_y,spdmouse.y-24,globals.frametime * 30))
					self.Menu_UI.misc.speed_x:set(Script.spddef_x)
					self.Menu_UI.misc.speed_y:set(Script.spddef_y)
				end
			else
				Script.spd_alpha = Script.API.Lerp_number(Script.spd_alpha,0,globals.frametime * 8)
				Script.spddrag_alpha = Script.API.Lerp_number(Script.spddrag_alpha,0,globals.frametime * 8)
			end
			Script.API.RenderBlurRoundedtoalpharect(Script.spddef_x, Script.spddef_y-20, color(drag_clr.r,drag_clr.g,drag_clr.b,Script.spddrag_alpha), color(drag_clr.r,drag_clr.g,drag_clr.b,Script.spddrag_alpha), 242, 88,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"DRAGABLE",0,true,true)

			render.text(ww_font, vector(spped_xs+33 + render.measure_text(speed_icon,"","2").x + 9, spped_ys+11), color(17, 17, 17, Script.spd_alpha), nil,("Slowed down %.0f%%"):format((plr_vel <= 251) and (plr_vel/251)*100 or 100))
			render.text(ww_font, vector(spped_xs+33 + render.measure_text(speed_icon,"","2").x + 8, spped_ys+10), color(255, 255, 255, Script.spd_alpha), nil,("Slowed down %.0f%%"):format((plr_vel <= 251) and (plr_vel/251)*100 or 100))
			render.text(speed_icon, vector(spped_xs+36, spped_ys+6), color(17, 17, 17, Script.spd_alpha), nil, "2")
			render.text(speed_icon, vector(spped_xs+35, spped_ys+5), color(255, 255, 255, Script.spd_alpha), nil, "2")
			render.rect(vector(spped_xs+26, spped_ys+28), vector(spped_xs+212, spped_ys+43), color(17, 17, 17, Script.spd_alpha*0.8),8)
			render.rect(vector(spped_xs+29, spped_ys+31), vector(spped_xs+29+Script.spd_rect, spped_ys+40), plr_vel<=251 and color((1 - (Script.spd_rect/180)*0.88)*255, (0.12+(Script.spd_rect/180)*0.88)*255, 0, Script.spd_alpha) or color(0, 255, 0, Script.spd_alpha),3)

			-- render.text(ww_font, vector(spped_xs+65, spped_ys+4), color(0, 0, 0, Script.spd_alpha), nil,("%.0f%% Remain"):format((plr_vel <= 251) and (plr_vel/251)*100 or 100))
			-- render.text(ww_font, vector(spped_xs+64, spped_ys+3), color(255, 255, 255, Script.spd_alpha), nil,("%.0f%% Remain"):format((plr_vel <= 251) and (plr_vel/251)*100 or 100))
			-- render.poly(color(0, 0, 0, Script.spd_alpha), vector(spped_xs+26, spped_ys), vector(spped_xs, spped_ys+48), vector(spped_xs+52, spped_ys+48))
			-- render.poly(plr_vel<=251 and color((1 - (Script.spd_rect/144)*0.88)*255, (0.12+(Script.spd_rect/144)*0.88)*255, 0, Script.spd_alpha) or color(0, 255, 0, Script.spd_alpha), vector(spped_xs+26, spped_ys+8), vector(spped_xs+6, spped_ys+45), vector(spped_xs+46, spped_ys+45))
			-- render.text(speed_font, vector(spped_xs+26-render.measure_text(speed_font,"","!").x/2, spped_ys+render.measure_text(speed_font,"","!").y/3.2), color(0, 0, 0, Script.spd_alpha), nil,"!")
			-- render.rect(vector(spped_xs+62, spped_ys+28), vector(spped_xs+212, spped_ys+48), color(0, 0, 0, (Script.spd_alpha)*0.8),6)
			-- render.rect(vector(spped_xs+65, spped_ys+31), vector(spped_xs+65+Script.spd_rect, spped_ys+45), plr_vel<=251 and color((1 - (Script.spd_rect/144)*0.88)*255, (0.12+(Script.spd_rect/144)*0.88)*255, 0, Script.spd_alpha) or color(0, 255, 0, Script.spd_alpha),3)
		end
	end
	--lua info
	if Script.Menu_UI.visual_panel.lua_info:get() and entity.get_local_player() and self.API.getMemuindex(Script.Menu_table.visual_panel.watermark_select,self.Menu_UI.visual_panel.watermark_Select:get()) ~= 1 then
		local bold_font = Script.API.CreateFont("Verdana", 12, "b")
        local plr_avatar = player:get_steam_avatar()
        local bg_alpha = Script.Menu_UI.visual_panel.bg_alpha:get()
        local lua_x = Script.Menu_UI.visual_panel.lua_x:get()
        local lua_y = Script.Menu_UI.visual_panel.lua_y:get()
		local mouse_pos = ui.get_mouse_position()
        local line1_size = render.measure_text(bold_font, "", "Saint-Priest* ")
        local line2_size = render.measure_text(bold_font, "", "Predicted: ")
		local max_sizee = math.max(render.measure_text(bold_font, "", "Saint-Priest* version [B3.1.0]").x, render.measure_text(bold_font, "", "Predicted: 23-1-15").x, render.measure_text(bold_font, "", "Last update time - 2022.11.12").x)
		if mouse_pos.x >= lua_x-20 and mouse_pos.y >= lua_y-20 and mouse_pos.x <= lua_x+40+max_sizee and mouse_pos.y <= lua_y+100 then
			Script.lua_drag = Script.API.Lerp_number(Script.lua_drag,255,globals.frametime * 6)
		else
			Script.lua_drag = Script.API.Lerp_number(Script.lua_drag,0,globals.frametime * 6)
		end
		Script.API.RenderBlurRoundedtoalpharect(lua_x-20, lua_y-20, color(drag_clr.r,drag_clr.g,drag_clr.b,Script.lua_drag), color(drag_clr.r,drag_clr.g,drag_clr.b,Script.lua_drag), 110+max_sizee, 100,1,3,"Essential fonts\\Smallest Pixel-7.ttf",11,"DRAGABLE",0,true,true)
		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
			Script.API.Rendersolusv2rect(lua_x,lua_y,color(wtm_color1.r,wtm_color1.g,wtm_color1.b,255),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,255),max_sizee+70,60,1,255,4,false,bg_alpha)
			
			render.text(bold_font, vector(lua_x+61,lua_y+10), color(17,17,17,255), "", "Saint-Priest* ")
			render.text(bold_font, vector(lua_x+61+line1_size.x,lua_y+10), color(17,17,17,255), "", "version [B3.1.0]")
			render.text(bold_font, vector(lua_x+61,lua_y+25), color(17,17,17,255), "", "Predicted: ")
			render.text(bold_font, vector(lua_x+61+line2_size.x,lua_y+25), color(17,17,17,255), "", "23-1-15")
			render.text(bold_font, vector(lua_x+61,lua_y+40), color(17,17,17,255), "", "Last update time - 2022.11.12")
	
			render.text(bold_font, vector(lua_x+60,lua_y+9), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,255), "", "Saint-Priest* ")
			render.text(bold_font, vector(lua_x+60+line1_size.x,lua_y+9), color(255,255,255,255), "", "version [B3.1.0]")
			render.text(bold_font, vector(lua_x+60,lua_y+24), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,255), "", "Predicted: ")
			render.text(bold_font, vector(lua_x+60+line2_size.x,lua_y+24), color(255,255,255,255), "", "23-1-15")
			render.text(bold_font, vector(lua_x+60,lua_y+39), color(255,255,255,255), "", "Last update time - 2022.11.12")
		elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
			Script.API.Rendersolusv2rect(lua_x,lua_y,color(wtm_color1.r,wtm_color1.g,wtm_color1.b,255),color(wtm_color2.r,wtm_color2.g,wtm_color2.b,255),max_sizee+70,60,1,255,4,false,bg_alpha)
			render.text(bold_font, vector(lua_x+61,lua_y+10), color(17,17,17,255), "", "Saint-Priest* ")
			render.text(bold_font, vector(lua_x+61+line1_size.x,lua_y+10), color(17,17,17,255), "", "version [B3.1.0]")
			render.text(bold_font, vector(lua_x+61,lua_y+25), color(17,17,17,255), "", "Predicted: ")
			render.text(bold_font, vector(lua_x+61+line2_size.x,lua_y+25), color(17,17,17,255), "", "23-1-15")
			render.text(bold_font, vector(lua_x+61,lua_y+40), color(17,17,17,255), "", "Last update time - 2022.11.12")
	
			Script.API.RenderGradientText(lua_x+60, lua_y+9,color(wtm_color1.r,wtm_color1.g,wtm_color1.b,255),color(wtm_color2.r,wtm_color2.g,wtm_color2.b,255),14,bold_font,"Saint-Priest* ",false,false,false)
			render.text(bold_font, vector(lua_x+60+line1_size.x,lua_y+9), color(255,255,255,255), "", "version [B3.1.0]")
			Script.API.RenderGradientText(lua_x+60, lua_y+24,color(wtm_color1.r,wtm_color1.g,wtm_color1.b,255),color(wtm_color2.r,wtm_color2.g,wtm_color2.b,255),14,bold_font,"Predicted: ",false,false,false)
			render.text(bold_font, vector(lua_x+60+line2_size.x,lua_y+24), color(255,255,255,255), "", "23-1-15")
			render.text(bold_font, vector(lua_x+60,lua_y+39), color(255,255,255,255), "", "Last update time - 2022.11.12")
			elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
				Script.API.Rendersolusv2rect(lua_x,lua_y,color(rgb_color.r, rgb_color.g, rgb_color.b,255),color(rgb_color.g, rgb_color.b, rgb_color.r,255),max_sizee+70,60,1,255,4,true,bg_alpha)
				render.text(bold_font, vector(lua_x+61,lua_y+10), color(17,17,17,255), "", "Saint-Priest* ")
				render.text(bold_font, vector(lua_x+61+line1_size.x,lua_y+10), color(17,17,17,255), "", "version [B3.1.0]")
				render.text(bold_font, vector(lua_x+61,lua_y+25), color(17,17,17,255), "", "Predicted: ")
				render.text(bold_font, vector(lua_x+61+line2_size.x,lua_y+25), color(17,17,17,255), "", "23-1-15")
				render.text(bold_font, vector(lua_x+61,lua_y+40), color(17,17,17,255), "", "Last update time - 2022.11.12")
		
				Script.API.RenderGradientText(lua_x+60, lua_y+9,color(rgb_color.r, rgb_color.g, rgb_color.b,255),color(rgb_color.g, rgb_color.b, rgb_color.r,255),14,bold_font,"Saint-Priest* ",false,false,false)
				render.text(bold_font, vector(lua_x+60+line1_size.x,lua_y+9), color(255,255,255,255), "", "version [B3.1.0]")
				Script.API.RenderGradientText(lua_x+60, lua_y+24,color(rgb_color.r, rgb_color.g, rgb_color.b,255),color(rgb_color.g, rgb_color.b, rgb_color.r,255),14,bold_font,"Predicted: ",false,false,false)
				render.text(bold_font, vector(lua_x+60+line2_size.x,lua_y+24), color(255,255,255,255), "", "23-1-15")
				render.text(bold_font, vector(lua_x+60,lua_y+39), color(255,255,255,255), "", "Last update time - 2022.11.12")
		end
		if ui.get_alpha() == 1 and common.is_button_down(0x1) and (mouse_pos.x >= lua_x-20 and mouse_pos.y >= lua_y-20 and mouse_pos.x <= lua_x+40+max_sizee and mouse_pos.y <= lua_y+100) then
			Script.Menu_UI.visual_panel.lua_x:set(mouse_pos.x - (110+max_sizee)/2)
			Script.Menu_UI.visual_panel.lua_y:set(mouse_pos.y - 30)
		end
        render.texture(plr_avatar, vector(lua_x+10,lua_y+10), vector(40,40), color(255,255,255,255), "", 3)
    end
	--clantag
	if Script.Menu_UI.misc.animation_tag:get() and globals.is_connected and utils.net_channel() then
		local add_speed = (utils.net_channel()).latency[0] / globals.tickinterval
		local rel_tick = globals.tickcount + add_speed
		local rel_speed = math.floor(math.fmod(rel_tick / 16, #priest_tag + 1) + 1)
		Script.API.apiset_clantag(priest_tag[rel_speed])
	else
		Script.API.apiset_clantag(" ")
	end
	--jumpshots fix
	if Script.Menu_UI.misc.jump_fix:get() and entity.get_local_player() then
		if player:is_alive() and player:get_player_weapon() ~= nil then
			if player:get_player_weapon():get_name() == "SSG 08" then
				if player:is_alive() and Script.API.GetJumping(player) and plr_vel > 15 then
					Script.ref.Misc.Autostrafe:set(true)
				else
					Script.ref.Misc.Autostrafe:set(false)
				end
			end
		end
	end
	--bloom
	if Script.Menu_UI.misc.bloom_set:get() and in_game then
		Script.bloom_entity = entity.get_entities("CEnvTonemapController")
		for i = 1, #Script.bloom_entity do
			local cvar_bloom = cvar.r_modelAmbientMin
			if Script.bloom_props == false then
				Script.bloom_entity[i].m_bUseCustomAutoExposureMin = true
				Script.bloom_entity[i].m_bUseCustomAutoExposureMax = true
				Script.bloom_entity[i].m_bUseCustomBloomScale = true
				Script.bloom_props = true
			end
			if Script.bloom_props == true then
				local bloom_val = Script.Menu_UI.misc.world_exposure:get() / 10
				Script.bloom_entity[i].m_flCustomAutoExposureMin = bloom_val
				Script.bloom_entity[i].m_flCustomAutoExposureMax = bloom_val
				Script.bloom_entity[i].m_flCustomBloomScale = Script.Menu_UI.misc.bloom_scale:get() / 10
			end
			cvar_bloom:float(Script.Menu_UI.misc.model_ambient:get() / 10)
		end
	end
	--aspect ratio
	local aspect_r = Script.Menu_UI.misc.aspect_ratio:get()
	cvar.r_aspectratio:string(tostring(aspect_r/10))
	--extended backtrack
	local ext_bt = Script.Menu_UI.misc.extended_backtrack:get()
	if ext_bt and entity.get_local_player() then
		Script.ref.Misc.PING:set(Script.Menu_UI.misc.extended_backtrack_limit:get())
		cvar.sv_maxunlag:float(Script.Menu_UI.misc.extended_backtrack_limit:get()/1000)
	else
		cvar.sv_maxunlag:float(0.2)
	end
	-- start anim
	if Script.stranim_flag == false then
		local smooth = 30
		local strframetime = globals.frametime * (smooth / 10)
		if str_img == nil then
			str_img = render.load_image_from_file("Essential fonts\\gifdone.gif",vector(533,300))
		end
		--print(tostring(text_size.y))
		if (globals.realtime - Script.start_anim[1].time) <= 8 then
			Script.start_alpha = self.API.Lerp_number(Script.start_alpha,255,strframetime)
			render.blur(vector(0,0),vector(screen_size.x,screen_size.y),1,Script.start_alpha/255)
			render.texture(str_img,vector(screen_size.x/2-533/2,screen_size.y/2-150),vector(533,300),color(255,255,255,Script.start_alpha))
			--print(tostring(Script.rect1str_pos.x).."     "..tostring(screen_size.x/2-strtext_size.x/2))
			--print(tostring(globals.realtime - Script.start_anim[1].time))
			--print(tostring(lep_pos.x))
			
		else
			--if Script.fade_y == 0 then Script.fade_y = screen_size.y-200 end
			Script.start_alpha = self.API.Lerp_number(Script.start_alpha,0,strframetime)
			render.blur(vector(0,0),vector(screen_size.x,screen_size.y),1,Script.start_alpha/255)
			render.texture(str_img,vector(screen_size.x/2-533/2,screen_size.y/2-150),vector(533,300),color(255,255,255,Script.start_alpha))
			--print(tostring(Script.rect1str_pos.x).."     "..tostring(screen_size.x/2-strtext_size.x/2))
			if Script.start_alpha <= 0.3 then Script.stranim_flag = true end
		end
	end

	-- local str_pos = Script.start_anim[1].str_pos
	-- if Script.stranim_flag == false then
	-- 	local smooth = 30
	-- 	local strframetime = globals.frametime * (smooth / 10)
	-- 	local strtext = ("[Priest.lua] Welcome back, %s! Lua was Successfully loaded ! build: Beta 2.6.8"):format(Script.username)
    --     local strtext_size = render.measure_text(priest_font,"",strtext)
	-- 	--print(tostring(text_size.y))
	-- 	if (globals.realtime - Script.start_anim[1].time) <= 2 then
	-- 		if (str_pos.x == Script.rect1str_pos.x or str_pos.x == Script.rect2str_pos.x) then
	-- 			Script.rect1str_pos = vector(screen_size.x/2-strtext_size.x/2,screen_size.y-202)
	-- 			Script.rect2str_pos = vector(screen_size.x/2+strtext_size.x/2,screen_size.y-168)
	-- 		end
	-- 		if Script.fade_y == 0 then Script.fade_y = screen_size.y+10 end
	-- 		Script.start_alpha = self.API.Lerp_number(Script.start_alpha,255,strframetime)
	-- 		Script.fade_y = self.API.Lerp_number(Script.fade_y,screen_size.y-200,strframetime)
	-- 		Script.circlr_lep = Script.API.Lerp_number(Script.circlr_lep,180,strframetime)
	-- 		Script.rect1str_pos = self.API.Lerp(Script.rect1str_pos,vector(screen_size.x/2+strtext_size.x/2,screen_size.y-202),strframetime)
	-- 		Script.rect2str_pos = self.API.Lerp(Script.rect2str_pos,vector(screen_size.x/2-strtext_size.x/2,screen_size.y-168),strframetime)
	-- 		--print(tostring(Script.rect1str_pos.x).."     "..tostring(screen_size.x/2-strtext_size.x/2))
	-- 		--print(tostring(globals.realtime - Script.start_anim[1].time))
	-- 		--print(tostring(lep_pos.x))
	-- 		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
	-- 			render.rect(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30), color(0, 0, 0, 0.6*Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(Script.rect1str_pos.x,Script.fade_y-2), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30),vector(Script.rect2str_pos.x,Script.fade_y+32), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha))
	-- 			render.circle(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 90, 0.5)
	-- 			render.circle(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 270, 0.5)
	-- 			render.circle_outline(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), 16.5, 90, Script.circlr_lep/360,2)
	-- 			render.circle_outline(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), 16.5, 270, Script.circlr_lep/360,2)
	-- 			render.text(priest_font, vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+render.measure_text(priest_font,"",strtext).y/1.3), color(1.0*255, 1.0*255, 1.0*255, 1.0*Script.start_alpha), nil,strtext)
	-- 		elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
	-- 			render.rect(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30), color(0, 0, 0, 0.6*Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(Script.rect1str_pos.x,Script.fade_y-2), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.start_alpha), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30),vector(Script.rect2str_pos.x,Script.fade_y+32), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.start_alpha), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.start_alpha), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha))
	-- 			render.circle(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 90, 0.5)
	-- 			render.circle(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 270, 0.5)
	-- 			render.circle_outline(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), 16.5, 90, Script.circlr_lep/360,2)
	-- 			render.circle_outline(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.start_alpha), 16.5, 270, Script.circlr_lep/360,2)
	-- 			render.text(priest_font, vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+render.measure_text(priest_font,"",strtext).y/1.3), color(1.0*255, 1.0*255, 1.0*255, 1.0*Script.start_alpha), nil,strtext)
	-- 		elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
	-- 			render.rect(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30), color(0, 0, 0, 0.6*Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(Script.rect1str_pos.x,Script.fade_y-2), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*Script.start_alpha),color(rgb_color.g, rgb_color.b, rgb_color.r, 1*Script.start_alpha), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*Script.start_alpha),color(rgb_color.g, rgb_color.b, rgb_color.r, 1*Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30),vector(Script.rect2str_pos.x,Script.fade_y+32), color(rgb_color.g, rgb_color.b, rgb_color.r, 1*Script.start_alpha), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*Script.start_alpha), color(rgb_color.g, rgb_color.b, rgb_color.r, 1*Script.start_alpha), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*Script.start_alpha))
	-- 			render.circle(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 90, 0.5)
	-- 			render.circle(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 270, 0.5)
	-- 			render.circle_outline(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(rgb_color.b, rgb_color.r, rgb_color.g, 1*Script.start_alpha), 16.5, 90, Script.circlr_lep/360,2)
	-- 			render.circle_outline(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(rgb_color.g, rgb_color.b, rgb_color.r, 1*Script.start_alpha), 16.5, 270, Script.circlr_lep/360,2)
	-- 			render.text(priest_font, vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+render.measure_text(priest_font,"",strtext).y/1.3), color(1.0*255, 1.0*255, 1.0*255, 1.0*Script.start_alpha), nil,strtext)
	-- 		end
	-- 	else
	-- 		--if Script.fade_y == 0 then Script.fade_y = screen_size.y-200 end
	-- 		Script.start_alpha = self.API.Lerp_number(Script.start_alpha,0,strframetime)
	-- 		Script.fade_y = self.API.Lerp_number(Script.fade_y,screen_size.y+10,strframetime)
	-- 		Script.circlr_lep = Script.API.Lerp_number(Script.circlr_lep,0,strframetime)
	-- 		Script.rect1str_pos = self.API.Lerp(Script.rect1str_pos,vector(screen_size.x/2-strtext_size.x/2,Script.fade_y-2),strframetime)
	-- 		Script.rect2str_pos = self.API.Lerp(Script.rect2str_pos,vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30),strframetime)
	-- 		--print(tostring(Script.rect1str_pos.x).."     "..tostring(screen_size.x/2-strtext_size.x/2))
	-- 		if self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 1 then
	-- 			render.rect(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30), color(0, 0, 0, 0.6*Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(Script.rect1str_pos.x,Script.fade_y-2), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+32),vector(Script.rect2str_pos.x,Script.fade_y+30), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha))
	-- 			render.circle(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 90, 0.5)
	-- 			render.circle(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 270, 0.5)
	-- 			render.circle_outline(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), 16.0, 90, Script.circlr_lep/360,2)
	-- 			render.circle_outline(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), 16.0, 270, Script.circlr_lep/360,2)
	-- 			render.text(priest_font, vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+render.measure_text(priest_font,"",strtext).y/1.3), color(1.0*255, 1.0*255, 1.0*255, 1.0*Script.start_alpha),nil,strtext)
	-- 		elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 2 then
	-- 			render.rect(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30), color(0, 0, 0, 0.6*Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(Script.rect1str_pos.x,Script.fade_y-2), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.start_alpha), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+32),vector(Script.rect2str_pos.x,Script.fade_y+30), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.start_alpha), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.start_alpha), color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha))
	-- 			render.circle(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 90, 0.5)
	-- 			render.circle(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 270, 0.5)
	-- 			render.circle_outline(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(wtm_color1.r,wtm_color1.g,wtm_color1.b,Script.start_alpha), 16.0, 90, Script.circlr_lep/360,2)
	-- 			render.circle_outline(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(wtm_color2.r,wtm_color2.g,wtm_color2.b,Script.start_alpha), 16.0, 270, Script.circlr_lep/360,2)
	-- 			render.text(priest_font, vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+render.measure_text(priest_font,"",strtext).y/1.3), color(1.0*255, 1.0*255, 1.0*255, 1.0*Script.start_alpha),nil,strtext)
	-- 		elseif self.API.getMemuindex(Script.Menu_table.visual_panel.color_mode,self.Menu_UI.visual_panel.color_theme:get()) == 3 then
	-- 			render.rect(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30), color(0, 0, 0, 0.6*Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y),vector(Script.rect1str_pos.x,Script.fade_y-2), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*Script.start_alpha),color(rgb_color.g, rgb_color.b, rgb_color.r, 1*Script.start_alpha), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*Script.start_alpha),color(rgb_color.g, rgb_color.b, rgb_color.r, 1*Script.start_alpha))
	-- 			render.gradient(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+32),vector(Script.rect2str_pos.x,Script.fade_y+30), color(rgb_color.g, rgb_color.b, rgb_color.r, 1*Script.start_alpha), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*Script.start_alpha), color(rgb_color.g, rgb_color.b, rgb_color.r, 1*Script.start_alpha), color(rgb_color.b, rgb_color.r, rgb_color.g, 1*Script.start_alpha))
	-- 			render.circle(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 90, 0.5)
	-- 			render.circle(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(0, 0, 0, 0.6*Script.start_alpha), 15.0, 270, 0.5)
	-- 			render.circle_outline(vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+15),color(rgb_color.b, rgb_color.r, rgb_color.g, 1*Script.start_alpha), 16.0, 90, Script.circlr_lep/360,2)
	-- 			render.circle_outline(vector(screen_size.x/2+strtext_size.x/2,Script.fade_y+30-15),color(rgb_color.g, rgb_color.b, rgb_color.r, 1*Script.start_alpha), 16.0, 270, Script.circlr_lep/360,2)
	-- 			render.text(priest_font, vector(screen_size.x/2-strtext_size.x/2,Script.fade_y+render.measure_text(priest_font,"",strtext).y/1.3), color(1.0*255, 1.0*255, 1.0*255, 1.0*Script.start_alpha),nil,strtext)
	-- 		end
	-- 		if Script.fade_y >= screen_size.y then Script.stranim_flag = true end
	-- 	end
	-- end
end

function cus_slow(e)
	if Script.Menu_UI.misc.custom_slowwalk:get() then
		if Script.Menu_UI.misc.min_speed:get() > Script.Menu_UI.misc.max_speed:get() then Script.Menu_UI.misc.min_speed:set(Script.Menu_UI.misc.max_speed:get()) end
		if Script.ref.AntiAim.Slowwalk:get() then
			e.forwardmove = 150*(e.forwardmove/(250-Script.API.getRandomInteger(Script.Menu_UI.misc.min_speed:get(),Script.Menu_UI.misc.max_speed:get())))
			e.sidemove = 150*(e.sidemove/(250-Script.API.getRandomInteger(Script.Menu_UI.misc.min_speed:get(),Script.Menu_UI.misc.max_speed:get())))
		end
	end
end

function Script.On_player_hurt(event)
	local self = Script
	local user_id = event.userid
	local local_player = entity.get_local_player()
	local hurt_plr = entity.get(user_id,true)
	local atk_id = event.attacker
	local atk_plr = entity.get(atk_id,true)
	local atk_wep = event.weapon
	-- if local_player == hurt_plr and local_player:is_alive() and (self.Menu_UI.antiaim.anti_brute:Get() == 2 or self.Menu_UI.antiaim.anti_brute:Get() == 3) then
	-- 	self.anti_bruteforce = not self.anti_bruteforce
	-- end
	if local_player == hurt_plr and self.Menu_UI.misc.speed_warn:get() then
		Script.plr_hurttime = globals.realtime
	end
	if local_player == atk_plr then
		local hurtplr_name = entity.get(user_id,true):get_name()
		local hurt_damage = event.dmg_health
		local enm_remain = event.health
		local hitbox_group = Script.log_box[event.hitgroup]
		local group_box = Script.to_hitbox[event.hitgroup]
		if group_box == nil then group_box = 5 end
		local pos_hurt = hurt_plr:get_hitbox_position(group_box)
		local pre_type = self.API.getMemuindex(Script.Menu_table.visual_panel.Prefix_style,self.Menu_UI.misc.prefix_mode:get())
		-- local weapon_index = 1--weapon_toindex
		-- if atk_wep == "taser" or atk_wep == "smokegrenade" or atk_wep == "flashbang" or atk_wep == "hegrenade" or atk_wep == "inferno" or atk_wep == "decoy" or atk_wep == "molotov" then
		-- 	weapon_index = Script.weapon_toindex[atk_wep]
		-- else
		-- 	if (atk_plr:get_player_weapon() ~= nil and (atk_plr:get_player_weapon()):GetProp("m_iItemDefinitionIndex")~=nil) then
		-- 		weapon_index = (atk_plr:get_player_weapon()):GetProp("m_iItemDefinitionIndex")
		-- 	end
		-- end
		local weapon_index = "p"
		if atk_wep == "taser" or atk_wep == "smokegrenade" or atk_wep == "flashbang" or atk_wep == "hegrenade" or atk_wep == "inferno" or atk_wep == "decoy" or atk_wep == "molotov" then
			weapon_index = Script.weapon_toindex[atk_wep]
		else
			if atk_plr:get_player_weapon() ~= nil then
				weapon_index = Script.nameToIcon[(atk_plr:get_player_weapon()):get_name()]
			end
		end
		--print(event:GetString("weapon", "unknown").."  "..tostring(weapon_index))
		--local pos_hurt = hurt_plr:GetProp("DT_BaseEntity", "m_vecOrigin")
		--print(group_box)
		table.insert(Script.log_array,#Script.log_array > 0 and #Script.log_array+1 or 1,{dmg = hurt_damage,pos = pos_hurt,time = globals.realtime,name = hurt_plr:get_name(),box = Script.log_boxen[event.hitgroup],remain = enm_remain,is_miss = false,wep_index = weapon_index,pre_t = pre_type})
		table.insert(Script.hurt_logs,{dmg = hurt_damage,pos = pos_hurt,time = globals.realtime})
		if self.Menu_UI.misc.hit_log:get() and self.Menu_UI.misc.hitlg_dismode:get(1) then
			self.ffi_helpers.ClientColorLog(self.Menu_UI.misc.hit_color:get(), ("[%s]击中了 %s 的 %s 造成 %d 伤害(剩余 %d 血量)\n"):format(self.About.name,hurtplr_name,hitbox_group,hurt_damage,enm_remain))
		end
		if self.Menu_UI.misc.hit_log:get() and self.Menu_UI.misc.hitlg_dismode:get(2) then
			Script.ffi_helpers.PrintInChat("\x01 \x01[\x0E"..Script.About.name.."\x01] \x05击中 \x01\x08".. hurtplr_name .."\x01 的 \x02".. hitbox_group .."\x01 造成 \x07".. hurt_damage .."\x01 伤害 剩余血量: \x10".. enm_remain)
		end
		--print("["..Script.About.name.."] Hurt "..hurtplr_name.." in the "..hitbox_group.." for "..hurt_damage.." hp ("..enm_remain.." remaining)")
	end
end

function Script.On_bullet_impact(event)
	local self = Script
	local user_id = event.userid
	local atk_id = event.attacker
	local local_player = entity.get_local_player()
	local atk_plr = entity.get(atk_id,true)
	local shot_plr = entity.get(user_id,true)
	local bullet_vector = vector(event.x, event.y, event.z)
	-- if atk_plr == local_player and local_player:is_alive() and bullet_vector:dist(local_player:GetProp("m_vecOrigin")) > 50 and bullet_vector:dist(local_player:GetProp("m_vecOrigin")) < 115 and (self.Menu_UI.antiaim.anti_brute:Get() == 1 or self.Menu_UI.antiaim.anti_brute:Get() == 3) then
	-- 	self.anti_bruteforce = not self.anti_bruteforce
	-- end

	if shot_plr == local_player then
		local bullet_x = event.x
		local bullet_y = event.y
		local bullet_z = event.z
		local eye_pos = shot_plr:get_hitbox_position(0)
		Script.shot_time = 0
		table.insert(Script.bullet_array,{pos = eye_pos,impx = bullet_x,impy = bullet_y,impz = bullet_z,time = globals.realtime})
	end
end

function Script.On_player_death(event)
	local self = Script
	local user_id = event.userid
	local death_plr = entity.get(user_id,true)
	local atk_id = event.attacker
	local atk_plr = entity.get(atk_id,true)
	if entity.get_local_player() == atk_plr then
		local hurtplr_name = entity.get(user_id,true):get_name()
		local pos_draw = death_plr:get_hitbox_position(0)
		Script.effect_time = globals.realtime
		Script.scr_count = Script.scr_count + 1
		Script.announcer_count = Script.announcer_count + 1
		if Script.Menu_UI.misc.talk_on_kill:get() then utils.console_exec('say "' .. Script.Menu_UI.misc.textbox:get() .. '"') end
		--local pos_draw = death_plr:GetProp("DT_BaseEntity", "m_vecOrigin")
		--print(pos_hurt)
		table.insert(Script.death_logs,{pos = pos_draw,time = globals.realtime})
	end
end

function Script.On_registered_shot(event)
	local self = Script
	local mis_reason = event.state
	local aim_group = event.wanted_hitgroup
	local aim_dmg = event.wanted_damage
	local mis_bt = event.backtrack
	local target_plr = event.target
	local target_name = target_plr:get_name()
	local rel_group = Script.registered_box[aim_group]
	--local rel_reason = Script.registered_reason[mis_reason]
	local atk_plr = entity.get_local_player()
	Script.accurate_shot = Script.accurate_shot + 1
	if mis_reason ~= nil then
		Script.miss_shot = Script.miss_shot + 1
		if aim_group == 1 then
			Script.head_miss = Script.head_miss + 1
		else
			Script.body_miss = Script.body_miss + 1
		end
		-- if Script.cache_missed[target_plr:get_index()] == nil then
		-- 	Script.cache_missed[target_plr:get_index()] = 0
		-- end
		local pre_type = self.API.getMemuindex(Script.Menu_table.visual_panel.Prefix_style,self.Menu_UI.misc.prefix_mode:get())
		local weapon_index = "p"
		-- if (atk_plr:get_player_weapon() ~= nil and (atk_plr:get_player_weapon()).m_iItemDefinitionIndex ~= nil) then
		-- 	weapon_index = (atk_plr:get_player_weapon()).m_iItemDefinitionIndex
		-- end

		if atk_plr:get_player_weapon() ~= nil then
			weapon_index = Script.nameToIcon[(atk_plr:get_player_weapon()):get_name()]
		end
		--Script.cache_missed[target_plr:get_index()] = Script.cache_missed[target_plr:get_index()] + 1
		table.insert(Script.log_array,#Script.log_array > 0 and #Script.log_array+1 or 1,{dmg = aim_dmg,bt = mis_bt,time = globals.realtime,name = target_name,box = rel_group,miss_reason = mis_reason,is_miss = true,wep_index = weapon_index,pre_t = pre_type})
		if self.Menu_UI.misc.hit_log:get() and self.Menu_UI.misc.hitlg_dismode:get(1) then
			self.ffi_helpers.ClientColorLog(self.Menu_UI.misc.mis_color:get(), ("[%s]未命中 %s 的 %s 由于 %s,预计造成 %d 伤害(回溯: %dtick)\n"):format(self.About.name,target_name,Script.registered_boxcn[aim_group],mis_reason,aim_dmg,mis_bt))
		end

		if self.Menu_UI.misc.hit_log:get() and self.Menu_UI.misc.hitlg_dismode:get(2) then
			Script.ffi_helpers.PrintInChat("\x01 \x01[\x0E"..Script.About.name.."\x01] \x05未命中 \x01\x08".. target_name .."\x01 的 \x02".. Script.registered_boxcn[aim_group] .."\x01 由于 \x0A".. mis_reason .."\x01 预计造成 \x0F"..aim_dmg.." \x01伤害(回溯: \x09".. mis_bt.."tick\x01)")
		end
	end

	--print(tostring(target_name))
end

Script.OnFrameStage = function(thisptr, edx)
	Script.on_framestage(thisptr, edx)
	local local_player = entity.get_local_player()
	if not local_player or not local_player:is_alive() then
		return
	end

	local Address = Script.ffi_helpers.GetClientEntityAddress(local_player:get_index())
	local FrameIsLocalPlayer = ffi.cast("uintptr_t", thisptr) == Address
	if not FrameIsLocalPlayer then
		return
	end

	if Script.Menu_UI.misc.animation_breaker:get(1) then
		local_player.m_flPoseParameter[0] = 1
	end

	if Script.Menu_UI.misc.animation_breaker:get(2) then
		local bit_flags = bit.band(local_player.m_fFlags, bit.lshift(1,0))
		if bit_flags == 1 then
			Script.animation_land.curticks = Script.animation_land.curticks + 1
		else
			Script.animation_land.curticks = 0
			Script.animation_land.curtime = globals.curtime + 1
		end

		if Script.animation_land.curticks > (Script.ref.FakeLag.Limit:get() + 1) and Script.animation_land.curtime > globals.curtime then
			local_player.m_flPoseParameter[12] = 0.5
		end
	end

	if Script.Menu_UI.misc.animation_breaker:get(3) then
		local_player.m_flPoseParameter[6] = 1.1
	end
end

Script.Register_Framestage = function()
	local local_player = entity.get_local_player()
	if Script.on_framestage or not local_player or not local_player:is_alive() then
		return
	end

	Script.on_framestage = Script.ffi_helpers.VmtHook(Script.ffi_helpers.GetClientEntityAddress(local_player:get_index())).hookMethod("void(__fastcall*)(void*, void*)", Script.OnFrameStage, 224)
end

function Script.On_Shutdown()
	Script.icon_data.iconclr = {r = Script.Menu_UI.Control_Panel.icon_color:get().r,g = Script.Menu_UI.Control_Panel.icon_color:get().g,b = Script.Menu_UI.Control_Panel.icon_color:get().b,a = Script.Menu_UI.Control_Panel.icon_color:get().a}
	Script.icon_data.tabclr = {r = Script.Menu_UI.Control_Panel.tab_color1:get().r,g = Script.Menu_UI.Control_Panel.tab_color1:get().g,b = Script.Menu_UI.Control_Panel.tab_color1:get().b,a = Script.Menu_UI.Control_Panel.tab_color1:get().a}
	Script.icon_data.tabclr1 = {r = Script.Menu_UI.Control_Panel.tab_color2:get().r,g = Script.Menu_UI.Control_Panel.tab_color2:get().g,b = Script.Menu_UI.Control_Panel.tab_color2:get().b,a = Script.Menu_UI.Control_Panel.tab_color2:get().a}
	Script.icon_data.titleclr = {r = Script.Menu_UI.Control_Panel.title_color1:get().r,g = Script.Menu_UI.Control_Panel.title_color1:get().g,b = Script.Menu_UI.Control_Panel.title_color1:get().b,a = Script.Menu_UI.Control_Panel.title_color1:get().a}
	Script.icon_data.titleclr1 = {r = Script.Menu_UI.Control_Panel.title_color2:get().r,g = Script.Menu_UI.Control_Panel.title_color2:get().g,b = Script.Menu_UI.Control_Panel.title_color2:get().b,a = Script.Menu_UI.Control_Panel.title_color2:get().a}
	Script.icon_data.subclr = {r = Script.Menu_UI.Control_Panel.subtitle_color:get().r,g = Script.Menu_UI.Control_Panel.subtitle_color:get().g,b = Script.Menu_UI.Control_Panel.subtitle_color:get().b,a = Script.Menu_UI.Control_Panel.subtitle_color:get().a}
	Script.icon_data.tabsty = ({["nil"] = nil, ["var"] = true})[Script.API.getMemuindex(Script.Menu_table.visual_panel.line_mode,Script.Menu_UI.Control_Panel.tab_colorsty:get()) == 1 and "nil" or "var"]
	Script.icon_data.titlesty = ({["nil"] = nil, ["var"] = true})[Script.API.getMemuindex(Script.Menu_table.visual_panel.line_mode,Script.Menu_UI.Control_Panel.title_colorsty:get()) == 1 and "nil" or "var"]
	db.icon = Script.icon_data
end

function Script.On_Destroy()
	local self = Script
	for _, hook in pairs(Script.cache_hookers) do
		hook()
	end

	for _, free_hook in pairs(Script.cache_free_hook) do
		free_hook()
	end
end

-- Script.RoundStart = function(e)
-- 	for idx, _ in pairs(Script.cache_missed) do
-- 		Script.cache_missed[idx] = 0
-- 	end
-- end

-- Script.EventCallbacks = {
-- 	["round_start"] = function(e)
-- 		Script.RoundStart(e)
-- 	end,

-- 	["player_hurt"] = function (e)
-- 		Script.On_player_hurt(e)
-- 	end,

-- 	["player_death"] = function (e)
-- 		Script.On_player_death(e)
-- 	end,

-- 	["bullet_impact"] = function (e)
-- 		Script.On_bullet_impact(e)
-- 	end,
-- }

-- 回调
Script.Callbacks = {
	["render"] = function(e)
		-- Script:On_Draw()
		MainConfigSystem()
		Script.startanim()
		Script.Render_Visuals()
		Script.Run_Delay_Call()
	end,

	["shutdown"] = function(e)
		Script.On_Shutdown(e)
		Script.On_Destroy(e)
	end,

	-- ["console"] = function(e)
	-- 	-- Script:On_Console(e)
	-- end,

	-- ["prediction"] = function(e)
	-- 	-- Script:On_Prediction(e)
	-- end,

	-- ["fire_bullet"] = function(e)
	-- 	-- Script:On_Fire_Bullet(e)
	-- end,

	["createmove"] = function(e)
		-- Script:On_Createmovee(e)
		Script.Register_Framestage()
		Script.API.update_choke_data()
	end,

	["createmove_run"] = function(e)
		-- Script:On_Createmovee(e)
		cus_slow(e)
	end,

	-- ["frame_stage"] = function(e)
	-- 	-- Script:On_Frame_Stage(e)
	-- end,

	-- ["override_view"] = function(e)
	-- 	-- Script:On_Override_View(e)
	-- end,

	-- ["ragebot_shot"] = function(e)
	-- 	-- Script:On_Ragebot_Shot(e)
	-- end,

	-- ["pre_prediction"] = function(e)
	-- 	--Script.RunDesync(e)
	-- 	--WorkWeapons(e)
	-- 	-- Script:On_Pre_Prediction(e)
	-- end,

	["aim_ack"] = function(e)
		Script.On_registered_shot(e)
		--Script:On_Registered_Shot(e)
	end,

	-- ["round_start"] = function(e)
	-- 	Script.RoundStart(e)
	-- end,

	["player_hurt"] = function (e)
		Script.On_player_hurt(e)
	end,

	["player_death"] = function (e)
		Script.On_player_death(e)
	end,

	["bullet_impact"] = function (e)
		Script.On_bullet_impact(e)
	end,

	-- ["events"] = function(e)
	-- 	-- Script:On_Events(e)
	-- 	if Script.EventCallbacks[e:GetName()] then
	-- 		local m_event_callbacks = Script.EventCallbacks[e:GetName()]
	-- 		if type(m_event_callbacks) == "function" then
	-- 			m_event_callbacks(e)
	-- 		elseif type(m_event_callbacks) == "table" then
	-- 			for _, Callback in pairs(m_event_callbacks) do
	-- 				Callback(e)
	-- 			end
	-- 		else
	-- 			error(("[%s]Invalid event callback type, event name: %s"):format(Script.About.name, e:GetName()), 2)
	-- 		end
	-- 	end
	-- end
}
-- events.render:set(function(ctx)
--     MainConfigSystem()
-- 	--Script.startanim()
-- 	Script.Render_Visuals()
-- 	Script.Run_Delay_Call()
-- 	Script.Handle_Main()
-- end)
function Script.InitMains()
	local self = Script
	self.Menu_UI.config.save_config:set_callback(function()
		self.configs.export = true
	end)

	self.Menu_UI.config.load_config:set_callback(function()
		self.configs.import = true
	end)

	self.Menu_UI.config.delete_config:set_callback(function()
		self.configs.delete = true
	end)

	self.Menu_UI.config.create_config:set_callback(function()
		self.configs.create = true
	end)

	self.Menu_UI.config.update_config:set_callback(function()
		self.configs.update_configs = true
	end)

	self.Menu_UI.config.import_clipboard:set_callback(function()
		self.configs.import_clipboard = true
	end)

	self.Menu_UI.config.export_clipboard:set_callback(function()
		self.configs.export_clipboard = true
	end)

	local m_callback_list =  {
		self.Menu_UI.Control_Panel.Enable,
		self.Menu_UI.Control_Panel.fold_color,
		self.Menu_UI.Control_Panel.tab_colorsty,
		self.Menu_UI.Control_Panel.title_colorsty,
		self.Menu_UI.visual_panel.watermark_Select,
		self.Menu_UI.visual_panel.color_theme,
		self.Menu_UI.visual_panel.hit_marker,
		self.Menu_UI.visual_panel.hitmk_size,
		self.Menu_UI.visual_panel.kill_efct,
		self.Menu_UI.visual_panel.scr_efct,
		self.Menu_UI.visual_panel.kill_announcer,
		self.Menu_UI.visual_panel.bullet_tracer,
		self.Menu_UI.visual_panel.foot_trail,
		self.Menu_UI.visual_panel.trailclr_select,
		self.Menu_UI.visual_panel.key_binds,
		self.Menu_UI.visual_panel.spectator_list,
		self.Menu_UI.antiaim.main_enable,
		self.Menu_UI.antiaim.desync_preset,
		self.Menu_UI.antiaim.switcher_side,
		self.Menu_UI.antiaim.custom_player_side,
		self.Menu_UI.antiaim.custom_player_state,
		self.Menu_UI.misc.hit_log,
		-- self.Menu_UI.ragebot.enabled_weapon,
		-- self.Menu_UI.ragebot.cur_weapon,
		self.Menu_UI.misc.hitlg_dismode,
		self.Menu_UI.visual_panel.aa_ind,
		self.Menu_UI.visual_panel.aa_indmode,
		self.Menu_UI.visual_panel.arrow_ind,
		self.Menu_UI.visual_panel.scope_ind,
		self.Menu_UI.visual_panel.line_mode,
		self.Menu_UI.visual_panel.dmg_ind,
		self.Menu_UI.misc.prefix_mode,
		self.Menu_UI.misc.vis_dismode,
		self.Menu_UI.visual_panel.wepbox_ind,
		self.Menu_UI.misc.custom_slowwalk,
		self.Menu_UI.misc.talk_on_kill,
		self.Menu_UI.misc.bloom_set,
		self.Menu_UI.misc.extended_backtrack,
		self.Menu_UI.visual_panel.aa_style,
		self.Menu_UI.visual_panel.aa_textind,
	}

	for _, data in pairs(self.Menu_UI.antiaim.custom) do
		for _, m_list in pairs(data) do
			table.insert(m_callback_list, m_list.enable)
			table.insert(m_callback_list, m_list.yaw_jitter)
			table.insert(m_callback_list, m_list.fake_type)
			-- table.insert(m_callback_list, m_list.roll_angle)
		end
	end

	-- for i, elements in pairs(self.Menu_UI.ragebot.custom) do
	-- 	table.insert(m_callback_list, elements.auto_stop)
	-- 	table.insert(m_callback_list, elements.multipoint)
	-- 	table.insert(m_callback_list, elements.baim_state)
	-- 	table.insert(m_callback_list, elements.enable_this)
	-- 	table.insert(m_callback_list, elements.weapon_funcs)
	-- 	table.insert(m_callback_list, elements.force_safe_miss)
	-- 	table.insert(m_callback_list, elements.force_baim_miss)
	-- end
	self.API.MultiCallback(function()
		self.Handle_Main()
	end, m_callback_list, ui.get_alpha() == 1)

	for Name, Callback_Arg in pairs(self.Callbacks) do
		events[Name]:set(function(e)
			if type(Callback_Arg) == "function" then
				Callback_Arg(e)
			elseif type(Callback_Arg) == "table" then
				for _, Callback in pairs(Callback_Arg) do
					Callback(e)
				end
			else
				error(("[%s]Invalid cheat callback type, callback name: %s, please check your callback type"):format(self.About.name, Name), 2)
			end
		end)
	end

	-- self:OnPaintHandle()
	self.API.DelayCall(1, function()
		self.ffi_helpers.ClientColorLog(color(0, 255, 255, 255), ("[%s]欢迎使用Priest.lua for neverlose.cc 目前已全部修复！\n"):format(self.About.name))
		self.ffi_helpers.ClientColorLog(color(0, 255, 0, 255), ("[%s]我们的官方网站:www.nightmare.plus\n"):format(self.About.name))
		self.ffi_helpers.ClientColorLog(color(255, 0, 255, 255), ("[%s]运行库请手动点击Get font下载,并放入CSGO根目录下的Essential fonts文件夹！\n"):format(self.About.name))
	end)
end
Script.first_check()
Script.InitMains()
--Script.downloadfont()
-- local function loop_in_range(value, min, max)
-- 	local range = max - min
-- 	return min + math.fmod(value - min, range)
-- end
-- function Script:OnPaintHandle()
-- 	local function lerp(a, b, t)
-- 		return a + (b - a) * t
-- 	end

-- 	local function ease_out(t)
-- 		return 1 - math.pow(1 - t, 3)
-- 	end

-- 	local function ease_in(t)
-- 		return math.pow(t, 3)
-- 	end

-- 	local function ease_in_out(t)
-- 		if t < 0.5 then
-- 			return ease_in(t * 2) / 2
-- 		else
-- 			return ease_out(t * 2 - 1) / 2 + 0.5
-- 		end
-- 	end

-- 	local function ease_out_in(t)
-- 		if t < 0.5 then
-- 			return ease_out(t * 2) / 2
-- 		else
-- 			return ease_in(t * 2 - 1) / 2 + 0.5
-- 		end
-- 	end

-- 	local function ease_out_in_quad(t)
-- 		if t < 0.5 then
-- 			return ease_out(t * 2) / 2
-- 		else
-- 			return ease_in(t * 2 - 1) / 2 + 0.5
-- 		end
-- 	end

-- 	local function ease_out_in_cubic(t)
-- 		if t < 0.5 then
-- 			return ease_out(t * 2) / 2
-- 		else
-- 			return ease_in(t * 2 - 1) / 2 + 0.5
-- 		end
-- 	end

-- 	local function ease_out_in_quart(t)
-- 		if t < 0.5 then
-- 			return ease_out(t * 2) / 2
-- 		else
-- 			return ease_in(t * 2 - 1) / 2 + 0.5
-- 		end
-- 	end

-- 	local function ease_out_in_quint(t)
-- 		if t < 0.5 then
-- 			return ease_out(t * 2) / 2
-- 		else
-- 			return ease_in(t * 2 - 1) / 2 + 0.5
-- 		end
-- 	end

-- 	local function ease_out_in_sine(t)
-- 		if t < 0.5 then
-- 			return ease_out(t * 2) / 2
-- 		else
-- 			return ease_in(t * 2 - 1) / 2 + 0.5
-- 		end
-- 	end

-- 	local function ease_out_in_expo(t)
-- 		if t < 0.5 then
-- 			return ease_out(t * 2) / 2
-- 		else
-- 			return ease_in(t * 2 - 1) / 2 + 0.5
-- 		end
-- 	end
-- end



