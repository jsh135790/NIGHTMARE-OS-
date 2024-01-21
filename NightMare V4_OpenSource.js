//适配CS:GO版本OnetapV4
//欢迎访问我们的官方网站: nightmare.plus 请遵守开源协议
//注:此版本仅公开我所创作的源代码，所以你可能会遇到无法运行的情况。
//Github: https://github.com/jsh135790/NIGHTMARE-OS- NIGHTMARE开源版本(OpenSource)
//@author: Pilot1337 & SYR1337 & BOT_MOLU(陌路) 2022-01-16 23:14


UI.AddSubTab(["Visuals", "SUBTAB_MGR"], "NightMare Visuals");
// UI.AddSubTab(["Visuals", "SUBTAB_MGR"], "NightMare Visuals");
UI.AddSubTab(["Visuals", "SUBTAB_MGR"], "NightMare Newind");
UI.AddSubTab(["Rage", "SUBTAB_MGR"], "NightMare Yaw");
//AA
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Enabled NightMare AntiAim");
UI.AddHotkey(["Rage", "Anti Aim", "General", "Key assignment"], "NightMare AntiAim Switch Key", "NightMare AntiAim Switch Key");
UI.AddHotkey(["Rage", "Anti Aim", "General", "Key assignment"], "NightMare Legit AntiAim Rebind", "NightMare Legit AntiAim Rebind");
UI.AddHotkey(["Rage", "Anti Aim", "General", "Key assignment"], "NightMare AntiAim Safety Peek Key", "NightMare AntiAim Safety Peek Key");

var player_state_condition = ["Standing", "Moving", "Slow Walk", "Jumping", "Crouching"]
UI.AddDropdown([ "Rage", "NightMare Yaw", "NightMare Yaw"], "Anti-Aimbot Condition", ["Default", "Override Custom", "Custom Player Condition"], 0);
UI.AddDropdown([ "Rage", "NightMare Yaw", "NightMare Yaw"], "Custom Player Condition", player_state_condition, 0);
UI.AddDropdown([ "Rage", "NightMare Yaw", "NightMare Yaw"], "Yaw Base", ["Local View", "At Targets"], 0);
UI.AddDropdown(["Rage", "NightMare Yaw", "NightMare Yaw"], "Body Yaw Extended", ["Switch Key", "Random", "Jitter", "Freestanding", "Reserved Freestanding", "Adaptive Freestanding", "Reserved Adaptive Freestanding", "Ideal Yaw", "Reserved Ideal Yaw", "Adaptive Ideal Yaw", "Shooting Switch", "Randomized Angles", "Automatic Twist"], 0);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Yaw Slider", - 180, 180);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Yaw Slider Extended", - 180, 180);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Jitter Slider", - 180, 180);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Jitter Slider Extended", - 180, 180);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Body Yaw Slider", - 60, 60);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Body Yaw Slider Extended", - 60, 60);
UI.AddDropdown(["Rage", "NightMare Yaw", "NightMare Yaw"], "Lower Body Yaw Target", ["Eye yaw", "Opposite", "Half-Sway", "Customized Offset"], 0);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Lower Body Yaw Offset", - 60, 60);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Lower Body Yaw Offset Extended", - 60, 60);
UI.AddDropdown(["Rage", "NightMare Yaw", "NightMare Yaw"], "Fake Yaw Types", ["Off", "Random", "Jitter", "Cycle"], 0);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Fake Yaw Limit", 0, 60);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Fake Yaw Limit 2", 0, 60);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Fake Yaw Limit Extended", 0, 60);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Fake Yaw Limit Extended 2", 0, 60);
for (var i = 0; i <= 4; i ++) {
	UI.AddDropdown([ "Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Yaw Base", ["Local View", "At Targets"], 0);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Yaw Slider", - 180, 180);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Yaw Slider Extended", - 180, 180);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Jitter Slider", - 180, 180);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Jitter Slider Extended", - 180, 180);
	UI.AddDropdown(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Body Yaw Types", ["Switch Key", "Random", "Jitter", "Freestanding", "Reserved Freestanding", "Adaptive Freestanding", "Reserved Adaptive Freestanding", "Ideal Yaw", "Reserved Ideal Yaw", "Adaptive Ideal Yaw", "Shooting Switch", "Randomized Angles", "Automatic Twist"], 0);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Body Yaw Slider", - 60, 60);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Body Yaw Slider Extended", - 60, 60);
	UI.AddDropdown(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Lower Body Yaw Target", ["Eye yaw", "Opposite", "Half-Sway", "Customized Offset"], 0);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Lower Body Yaw Offset", - 60, 60);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Lower Body Yaw Offset Extended", - 60, 60);
	UI.AddDropdown(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Fake Yaw Types", ["Off", "Random", "Jitter", "Cycle"], 0);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Fake Yaw Limit", 0, 60);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Fake Yaw Limit 2", 0, 60);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Fake Yaw Limit Extended", 0, 60);
	UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[" + player_state_condition[i] + "]Fake Yaw Limit Extended 2", 0, 60);
	UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Fake Yaw Limit"], 60);
	UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Fake Yaw Limit 2"], 60);
	UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Body Yaw Slider"], - 60);
	UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Fake Yaw Limit Extended"], 60);
	UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Body Yaw Slider Extended"], 60);
	UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Fake Yaw Limit Extended 2"], 60);
}

UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Anti Brute Force");
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Smart Ideal Yaw");
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Jitter On Dormant");
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Un Blocket Restrictions[Valve Exploit]");
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Force Eye Yaw On Exploit");
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Block Manual AntiAim Angles");
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "[Exploit]Double Tap Fast Refine");
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Lower Delta Slow Walk AntiAim");
UI.AddMultiDropdown(["Rage", "NightMare Yaw", "NightMare Yaw"], "AntiAim Extended Functions", ["Leg Movement Break", "Avoid Shooting Fakelag", "Instant Double Tap[Fast Charging]"]);
UI.AddDropdown(["Rage", "NightMare Yaw", "NightMare Yaw"], "[Avoid]Shooting Anti-Backtrack Fakelag", ["Offensive", "Defensive"], 1);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "[Exploit]Instant Double Tap Tickbase", 17, 18);
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Draw Nightmare AntiAim Indicators");
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Nightmare AntiAim Arrows Indicators Length", 0, 200);
UI.AddColorPicker(["Rage", "NightMare Yaw", "NightMare Yaw"], "Nightmare AntiAim Indicators Real Color");
UI.AddColorPicker(["Rage", "NightMare Yaw", "NightMare Yaw"], "Nightmare AntiAim Indicators Fake Color");
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Nightmare Double Tap Indicators");
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Nightmare Double Tap Indicators X", 0, Render.GetScreenSize()[0]);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Nightmare Double Tap Indicators Y", 0, Render.GetScreenSize()[1]);
UI.AddColorPicker(["Rage", "NightMare Yaw", "NightMare Yaw"], "Nightmare Double Tap Indicators Color");
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Nightmare Double Tap Indicators States Infor");
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Nightmare Double Tap Indicators Rainbow(Fading)");

// ------------------------------------------- Nightmare Fakelag && Nightmare Boxer-------------------------------------------
UI.AddSubTab(["Rage", "SUBTAB_MGR"], "Nightmare Boxer");
UI.AddSubTab(["Rage", "SUBTAB_MGR"], "Nightmare Fakelag");
UI.AddCheckbox(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Enabled Nightmare Alternative Fakelag");
UI.AddDropdown(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Nightmare Fakelag Types", ["Dynamic", "Maximum", "Fluctuate", "Fluctuate-Update", "Randomized", "Alternative", "Update", "Cycle"], 0);
UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Fakelag Cycle Value", 1, 50, 6);
for (var i = 1; i <= UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Fakelag Cycle Value"]); i ++) {
	UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Fakelag Cycle Limit/" + i, 0, 14, 14);
}

UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Start Limit", 0, 14, 14);
UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "End Limit", 0, 14, 14);
UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Maximum Limit", 0, 15, 15);
UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Normal Limit", 0, 14, 13);
UI.AddMultiDropdown(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Alternative Condition", ["Standing", "Moving", "Slow Walk", "Jumping", "Shooting"])
UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Send Time", 0, 14, 0);
UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Send Limit", 0, 14, 0);
UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Choked Limit", 0, 14, 13);
UI.AddMultiDropdown(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Force Choked Condition", ["Standing", "Moving", "Slow Walk", "Jumping", "Shooting"])
UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Force Choked Limit", 0, 14, 14);
UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Force Exploit Limit", 0, 14, 14);
UI.AddCheckbox(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Locket Maximum Limit[Enabled Nightmare Yaw]");
UI.AddCheckbox(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "Force Changer Fakelag Block Limit[UnSafe AA]");
UI.AddCheckbox(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "On Shot Correction Fakelag");
UI.AddSliderInt(["Rage", "Nightmare Fakelag", "Nightmare Fakelag"], "ShotTick Correction Limit", 0, 14, 0);
UI.AddCheckbox(["Rage", "Nightmare Boxer", "Nightmare Boxer"], "Enabled Nightmare Boxer Indicators");
UI.AddSliderInt(["Rage", "Nightmare Boxer", "SHEET_MGR", "Nightmare Boxer"], "Nightmare Boxer X", - 145, Render.GetScreenSize()[0]);
UI.AddSliderInt(["Rage", "Nightmare Boxer", "SHEET_MGR", "Nightmare Boxer"], "Nightmare Boxer Y",- 195, Render.GetScreenSize()[1]);
UI.AddColorPicker(["Rage", "Nightmare Boxer", "SHEET_MGR", "Nightmare Boxer"], "Nightmare Boxer Color", [0, 255, 255, 255]);

UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Slider"], - 5);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter Slider"], - 6);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit"], 60);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Smart Ideal Yaw"], 1);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Slider"], - 60);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Slider Extended"], 5);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter Slider Extended"], 6);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit Extended"], 60);
UI.SetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Force Exploit Limit"], 14);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Slider Extended"], 60);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Block Manual AntiAim Angles"], 1);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Double Tap Fast Refine"], 1);
// UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Delta Slow Walk AntiAim"], 1);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators"], 1);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Instant Double Tap Tickbase"], 18);
UI.SetColor(["Rage", "Nightmare Boxer", "Nightmare Boxer", "Nightmare Boxer Color"], [0, 115, 255, 255]);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators States Infor"], 1);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Arrows Indicators Length"], 95);
UI.SetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Force Changer Fakelag Block Limit[UnSafe AA]"], 1);
UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Rainbow(Fading)"], 1);
UI.SetColor(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Color"], [0, 255, 255, 255]);
UI.SetColor(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Indicators Fake Color"], [0, 255, 255, 255]);
UI.SetColor(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Indicators Real Color"], [255, 255, 255, 255]);

UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Base"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Slider"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter Slider"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Slider"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti Brute Force"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Smart Ideal Yaw"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter On Dormant"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Slider Extended"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter Slider Extended"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Body Yaw Offset"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Body Yaw Target"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit Extended"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Force Eye Yaw On Exploit"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Slider Extended"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Block Manual AntiAim Angles"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Double Tap Fast Refine"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Delta Slow Walk AntiAim"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Body Yaw Offset Extended"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators"], 0);
UI.SetEnabled(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Switch Key"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators X"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Y"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"], 0);
UI.SetEnabled(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Instant Double Tap Tickbase"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Color"], 0);
UI.SetEnabled(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[Avoid]Shooting Anti-Backtrack Fakelag"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Indicators Real Color"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Indicators Fake Color"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Arrows Indicators Length"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators States Infor"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Rainbow(Fading)"], 0);

var i = 0;
var fix_in = 0;
var frame = 0;
var time_fix = 0;
var rv_circle = 0;
var fix_out = - 0.42;
var last_choked = 0;
var lag_state = false;
const fs_target = (1);
var lag_history_1 = 0;
var lag_history_2 = 0;
var lag_history_3 = 0;
var lag_history_4 = 0;
var lastHitTime = 0.0;
var peeking_state = 0;
var shot_breaking = 0;
var lag_breaking = false;
var target_send_state = 1;
var lag_send_number = 0;
var lag_rotate_update = 0;
var force_legit_use = false;
var lastImpactTimes = [0.0];
var dynamic_fast_alpha = 0;
var override_trigger = false;
var maximum_cycle_lag = 0;
var shooting_switch = false;
var legit_use_reduce = false;
var tickbase_shift_label = "";
var lag_fakeyaw_update = 1;
var anti_brute_switch = false;
var fakelag_update_cycle = 0;
var fakelag_cycle_choked = 1;
var tickbase_shift_fired = false;
var lag_fakeyaw_update_2 = 1;
var fluctuation_update_lag = 0;
var dynamic_slider_breaker = 0;
var lastImpacts =[[0.0, 0.0, 0.0]];
var maximum_cycle_lag_vis = 1;
var dynamic_alpha_breaker = 0;
var fakelag_choked_number = 1;
var maximum_cycle_state = false;
var time, delay, fillbar, shotsfired;
var tickbase_shift_first_alpha = 0;
var master_switch_rotate = false;
var dynamic_alpha_switch = false;
var master_switch_fakeyaw = false;
var tickbase_recharge_shift = false;
var slower_dynamic_fast_alpha = 0;
var maximum_cycle_state_vis = false;
var tickbase_recharge_shift_label = "";
var nightmare_yaw_state = "DEFAULT";
var tickbase_recharge_shift_alpha = 255;
var slower_dynamic_alpha_switch = false;
var nightmare_yaw_color = [255, 255, 255, 255];
var rapid_texter_dynamic_alpha_creative_move = 0;
var hideshot_texter_dynamic_alpha_creative_move = 0;
var fakeduck_texter_dynamic_alpha_creative_move = 0;
var lag_data = {threshold : false, stored_last_shot : 0, stored_item : 0}
var data = {
    side : 1,
    last_hit : 0,
    hit_side : 0,
    last_side : 0
}

var shared = {
	side: 0,
	last_side: 0,
	target: null,
	create_fonts: true,
	fonts: {default: null, small: null},
}

var cmove = {
	delay : 0,
	last_charge : 0,
	old_tickbase : 0,
	shift_time : true,
	validate_cmd : 0,
	shift_number : 0,
	is_cmd_safe : true,
	can_shift_tickbase : 0,
	command_number : 0,
	skip_next_differ : false,
	charged_before : false,
	did_shift_before : false,
	choked_recharge_1 : 0,
	choked_recharge_2 : 0,
	choked_recharge_3 : 0,
	choked_recharge_4 : 0,
	old_command_num : 0,
	choked_last_lag_break : 0,
	last_tickbase_recharge : 0,
	recharge_shift_time : false,
	debug_reload_charge : true,
	debug_reload_charge_tickbase : 0,
}

var weapon_bullet_list = {
    1: "AA",
    2: "AA",
    3: "AA",
    4: "AA",
    7: "AAA",
    8: "AAA",
    9: "A",
    10: "AAA",
    11: "AA",
    13: "AAA",
    14: "AAA",
    16: "AAA",
    17: "AAA",
    19: "AAA",
    23: "AAA",
    24: "AAA",
    25: "AA",
    26: "AAA",
    27: "AA",
    28: "AAA",
    29: "AAA",
    30: "AA",
    32: "AA",
    33: "AAA",
    34: "AAA",
    35: "AA",
    36: "AA",
    38: "AA",
    39: "AAA",
    40: "A",
    60: "AAA",
    61: "AA",
    63: "AA",
    64: "A"
}

var weapon_icons_list = {
	"61": "G",
	"4": "D",
	"2": "B",
	"64": "J",
	"1": "A",
	"36": "F",
	"30": "H",
	"34": "O",
	"17": "K",
	"26": "M",
	"24": "L",
	"7": "W",
	"39": "V",
	"8": "U",
	"60": "T",
	"16": "S",
	"40": "a",
	"9": "Z",
	"11": "X",
	"38": "Y",
	"25": "b",
	"27": "d",
	"14": "g",
	"28": "f",
	"32": "E",
	"10": "R",
	"3": "C",
	"33": "N",
	"24": "L",
	"19": "P",
	"63": "I",
	"23": "N",
	"13": "Q",
	"29": "c",
	"31": "h",
	"35": "e",
	"44": "j",
	"45": "k",
	"46": "l",
	"48": "n",
	"43": "m",
	"47": "i",
	"49": "o",
	"500": "1",
	"505": "2",
	"506": "3",
	"507": "4",
	"508": "5",
	"515": "8",
	"512": "0",
	"516": "9",
	"514": "7",
	"509": "6",
	"59": "1"
}

function math_rad(degree) {
	return (degree / 180) * Math.PI;
}

function deg2rad(degree) {
	return degree * Math.PI / 180;
}

function vector_store(value) {
	return (value == null || value == undefined) ? 0 : value
}

function vec_length_2d(vec) {
	return Math.sqrt(vec[0] * vec[0] + vec[1] * vec[1]);
}

function unloader_reset_aa() {
	AntiAim.SetOverride(0)
	AntiAim.SetLBYOffset(60)
	AntiAim.SetRealOffset(60)
}

function ExtendVector(vector, angle, extension) {
	var radianAngle = deg2rad(angle);
	return [extension * Math.cos(radianAngle) + vector[0], extension * Math.sin(radianAngle) + vector[1], vector[2]];
}

function VectorAdd(a, b) {
	return [a[0] + b[0], a[1] + b[1], a[2] + b[2]];
}

function VectorSubtract(a, b) {
	return [a[0] - b[0], a[1] - b[1], a[2] - b[2]];
}

function VectorMultiply(a, b) {
	return [a[0] * b[0], a[1] * b[1], a[2] * b[2]];
}

function VectorLength(x, y, z) {
	return Math.sqrt(x * x + y * y + z * z);
}

function VectorNormalize(vec) {
	var length = VectorLength(vec[0], vec[1], vec[2]);
	return [vec[0] / length, vec[1] / length, vec[2] / length];
}

function VectorDot(a, b) {
	return a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
}

function VectorDistance(a, b) {
	return VectorLength(a[0] - b[0], a[1] - b[1], a[2] - b[2]);
}

function getDistanceTo(a, b)
{
    var lx = a[0];
    var ly = a[1];
    var lz = a[2];
    var tx = b[0];
    var ty = b[1];
    var tz = b[2];
    var dx = lx - tx;
    var dy = ly - ty;
    var dz = lz - tz;
    return Math.sqrt(dx * dx + dy * dy + dz * dz);
}

var get_entity_distance = function(local_entity, target_entity) {
	var GetDistanceInMeter = function(a_x, a_y, a_z, b_x, b_y, b_z) {
		return Math.ceil(Math.sqrt(Math.pow(a_x - b_x, 2) + Math.pow(a_y - b_y, 2) + Math.pow(a_z - b_z, 2)) * 0.0254)
	}

	return GetDistanceInMeter(local_entity[0], local_entity[1], local_entity[2], target_entity[0], target_entity[1], target_entity[2])
}

function math_random(min, max) {
	min = Math.min(min, max)
	max = Math.max(min, max)
	return Math.floor(Math.random() * (Math.floor(max) - Math.ceil(min) + 1)) + Math.ceil(min)
}

function subtract(vec, vec2) {
	return [
		vec[0] - vec2[0],
		vec[1] - vec2[1],
		vec[2] - vec2[2]
	]
}

function multiply(vec, vec2) {
	return [
		vec[0] * vec2[0],
		vec[1] * vec2[1],
		vec[2] * vec2[2]
	]
}

function normalize(angle) {
	while (angle < - 180) {
		angle += 360;
  	}

	while (angle > 180) {
		angle -= 360;
	}

	return angle;
}

function choked_cycle_lag(choked_fluctuation, maximum) {
	if (choked_fluctuation == 0) {
		fakelag_cycle_choked = fakelag_cycle_choked + 1
	}

	if (fakelag_cycle_choked > maximum) {
		fakelag_cycle_choked = 1
	}

	return fakelag_cycle_choked
}

function lag_fluctuation_update(choked, max_limit) {
	if (choked == 0) {
		fluctuation_update_lag = fluctuation_update_lag + 1
	}

	if (fluctuation_update_lag > max_limit) {
		fluctuation_update_lag = 0
	}

	return fluctuation_update_lag
}

function fakelag_update_clamp(choked_val, min_limit, max_limit) {
	if (fakelag_update_cycle < min_limit) {
		fakelag_update_cycle = min_limit
	}

	if (choked_val == 0) {
		fakelag_update_cycle = fakelag_update_cycle + 1
	}

	if (fakelag_update_cycle > max_limit) {
		fakelag_update_cycle = 0
	}

	return fakelag_update_cycle
}

function ClosestPointOnRay(target, rayStart, rayEnd) {
	var to = VectorSubtract(target, rayStart);
	var dir = VectorSubtract(rayEnd, rayStart);
	var length = VectorLength(dir[0], dir[1], dir[2]);
	dir = VectorNormalize(dir);
	var rangeAlong = VectorDot(dir, to);
	if (rangeAlong < 0.0) {
		return rayStart;
	}

	if (rangeAlong > length) {
		return rayEnd;
	}

	return VectorAdd(rayStart, VectorMultiply(dir, [rangeAlong, rangeAlong, rangeAlong]));
}

function getDistance(me, pos) {
	const origin = Entity.GetRenderOrigin(me);
	const sub = subtract(pos, origin);
	const distance = Math.sqrt(sub[0] * sub[0] + sub[1] * sub[1] + sub[2] * sub[2]);
	return distance;
}

function disabled_shottick_lagstate(entity) {
	var player_weapon = Entity.GetProp(entity, "CBasePlayer", "m_hActiveWeapon")
	if (player_weapon == "m_hActiveWeapon") {
		return true
	}

	var local_flags = Entity.GetProp(entity, "CBasePlayer", "m_fFlags");
	if (!(local_flags & (1 << 0))) {
		return true
	}

	var weapon_name = Entity.GetProp(player_weapon, "CBaseAttributableItem", "m_iItemDefinitionIndex") & 0xFFFF
	if (weapon_bullet_list[weapon_name] == null || weapon_bullet_list[weapon_name] == undefined) {
		return true
	}

	return false
}

function get_weapon_bullet(player) {
	var player_weapon = Entity.GetProp(player, "CBasePlayer", "m_hActiveWeapon")
	if (player_weapon == "m_hActiveWeapon") {
		return "A"
	}

	var weapon_name = Entity.GetProp(player_weapon, "CBaseAttributableItem", "m_iItemDefinitionIndex") & 0xFFFF
	return (weapon_bullet_list[weapon_name] == null || weapon_bullet_list[weapon_name] == undefined) ? "A" : weapon_bullet_list[weapon_name]
}

function player_weapon_const(player) {
	var weapon = Entity.GetProp(Entity.GetWeapon(player), "CBaseAttributableItem", "m_iItemDefinitionIndex") & 0xFFFF;
	if (weapon_icons_list[weapon] == undefined) {
		var weapon = "59"
	}

	return weapon_icons_list[weapon]
}

function setMath(int, max, declspec) {
	var value = 0;
	var int = Math.min(int, max);
	var tmp = max / int;
	var i = (declspec / tmp);
	if (i >= 0) {
		value = Math.floor(i + 0.5);
	} else {
		value = Math.ceil(i - 0.5);
	}

	return value;
}

function heaven_circle() {
	var local_player = Entity.GetLocalPlayer()
	if (!UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) || !Entity.IsAlive(local_player)) {
		return
	}

	var attack_player = Entity.GetEntityFromUserID(Event.GetInt("userid"));
	if (attack_player == Entity.GetLocalPlayer()) {
		if (- fix_out < (Globals.Realtime() * time_fix)) {
			fix_in = Globals.Realtime() + fix_out;
		}

		if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 10) {
			shooting_switch = shooting_switch ? false : true
		}
	}
}

function angle_to_vector(angles) {
	const sp = Math.sin(deg2rad(angles[0]));
	const cp = Math.cos(deg2rad(angles[0]));
	const sy = Math.sin(deg2rad(angles[1]));
	const cy = Math.cos(deg2rad(angles[1]));
	return [cp * cy, cp * sy, - sp]
}

function pointlate(entity, position, ticks) {
	const velocity = Entity.GetProp(entity, "CBasePlayer", "m_vecVelocity[0]");
	const interval = Globals.TickInterval();
	position[0] += velocity[0] * interval * ticks;
	position[1] += velocity[1] * interval * ticks;
	position[2] += velocity[2] * interval * ticks;
	return position;
};

function getFOV(me, pos) {
	const eye_pos = Entity.GetEyePosition(me);
	const viewangles = Local.GetViewAngles();
	const sub = subtract(pos, eye_pos);
	const yaw = Math.atan2(sub[1], sub[0]) * 180 / Math.PI;
	const pitch = - Math.atan2(sub[2], Math.sqrt(sub[0] ** 2 + sub[1] ** 2 )) * 180 / Math.PI;
	var yaw_delta = ((viewangles[1] % 360 - yaw % 360 ) % 360);
	const pitch_delta = viewangles[0] - pitch;
	yaw_delta = normalize(yaw_delta);
	return Math.sqrt(yaw_delta * yaw_delta + pitch_delta * pitch_delta);
}

function alternative_send_time(number_value, time) {
	if (number_value == 0) {
		target_send_state = target_send_state >= (time + 1) ? 1 : target_send_state + 1
	}

	return (target_send_state != time)
}

function entity_dormant_target() {
	var local_player = Entity.GetLocalPlayer()
	if (!UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) || !Entity.IsAlive(local_player)) {
		return false
	}

	var player_dormant = true
	var enemys = Entity.GetEnemies()
	for (var i = 0; i < enemys.length; i ++) {
		if (Entity.IsAlive(enemys[i]) && !Entity.IsDormant(enemys[i])) {
			player_dormant = false
		}
	}

	return player_dormant
}

function dynamic_cycle_alpha() {
	var local_player = Entity.GetLocalPlayer()
	if (!Entity.IsAlive(local_player)) {
		return 0
	}

	if (dynamic_fast_alpha < 1 && !dynamic_alpha_switch) {
		dynamic_fast_alpha = dynamic_fast_alpha + Globals.Frametime()
		if (dynamic_fast_alpha >= 1) {
			dynamic_alpha_switch = true
		}

	} else if (dynamic_fast_alpha > 0 && dynamic_alpha_switch) {
		dynamic_fast_alpha = dynamic_fast_alpha - Globals.Frametime()
		if (dynamic_fast_alpha <= 0) {
			dynamic_alpha_switch = false
		}
	}

	return Math.min(Math.max(0, dynamic_fast_alpha), 1)
}

var g_player_desync = function() {
	var real = Local.GetRealYaw()
	var fake = Local.GetFakeYaw()
	return Math.floor(normalize(real - fake) / 2)
}

var dynamic_alpha_slower = function() {
	var local_player = Entity.GetLocalPlayer()
	if (!Entity.IsAlive(local_player)) {
		return 0
	}

	var frame_time = Globals.Frametime() / 20
	if (slower_dynamic_fast_alpha < 1 && !slower_dynamic_alpha_switch) {
		slower_dynamic_fast_alpha = slower_dynamic_fast_alpha + frame_time
		if (slower_dynamic_fast_alpha >= 1) {
			slower_dynamic_alpha_switch = true
		}

	} else if (slower_dynamic_fast_alpha > 0 && slower_dynamic_alpha_switch) {
		slower_dynamic_fast_alpha = slower_dynamic_fast_alpha - frame_time
		if (slower_dynamic_fast_alpha <= 0) {
			slower_dynamic_alpha_switch = false
		}
	}

	return Math.min(Math.max(0, slower_dynamic_fast_alpha), 1)
}

function can_fired(ticks_to_shift) {
	var local_player = Entity.GetLocalPlayer();
	var weapon = Entity.GetWeapon(local_player);
	if (Entity.IsAlive(local_player) == false || local_player == null || weapon == null) {
		return false;
	}

	var tickbase = Entity.GetProp(local_player, "CCSPlayer", "m_nTickBase");
	var weapon_last_curtime = Globals.TickInterval() * (tickbase - ticks_to_shift);
	if (weapon_last_curtime < Entity.GetProp(local_player, "CCSPlayer", "m_flNextAttack")) {
		return false;
	}

	if (weapon_last_curtime < Entity.GetProp(weapon, "CBaseCombatWeapon", "m_flNextPrimaryAttack")) {
		return false;
	}

	return true;
}

function tickbase_unloader() {
	var local_player = Entity.GetLocalPlayer();
	if (!Entity.IsAlive(local_player)) {
		return;
	}

	Exploit.EnableRecharge();
}

function tickbase_instant_dt() {
	if (Entity.IsAlive(Entity.GetLocalPlayer()) == false || UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) < 4 || !(UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"]) || UI.GetValue(["Rage", "Exploits", "Key assignment", "Hide shots"])) || UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"])) {
		return;
	}

	var is_charged = Exploit.GetCharge()
	Exploit[(is_charged != 1 ? "Enable" : "Disable") + "Recharge"]()
	if (can_fired(UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Instant Double Tap Tickbase"])) && is_charged != 1) {
		Exploit.DisableRecharge();
		Exploit.Recharge()
	}

	Exploit.OverrideTolerance(0);
	Cheat.ExecuteCommand("sv_maxusrcmdprocessticks 20");
	Exploit.OverrideShift(UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) ? UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Instant Double Tap Tickbase"]) : 16);
	Exploit.OverrideMaxProcessTicks(UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) ? UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Instant Double Tap Tickbase"]) : 16);
}

function pcall_get_icon(name, height) {
	const bullet_font = Render.GetFont(name, height, false)
	if (bullet_font) {
		return bullet_font
	} else {
		Cheat.PrintColor([255, 255, 255, 255], "操你妈火速把: " + name + " 这个鸡巴文件放到OT的Javascripts文件夹里面操你妈你纯鸡巴废物 如果名字不对你就自己把文件名字改成这个 \n");
		return false
	}
}

function get_double_tap_state(tickbase) {
	var local_player = Entity.GetLocalPlayer()
	if (!UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) || !Entity.IsAlive(local_player)) {
		return "Unknown"
	}

	if (tickbase >= 19) {
		return "Debug[Teleport]"
	} else if (tickbase == 18) {
		return "Instant 2X"
	} else if (tickbase == 17) {
		return "Instant"
	} else if (tickbase == 16) {
		return "Faster"
	} else if (tickbase == 15) {
		return "Ready"
	} else if (tickbase == 2) {
		return "Charge Error"
	} else {
		return "Un Safety"
	}
}

var dynamic_breaker_alpha = function(switch_state, max, min, speed) {
	var local_player = Entity.GetLocalPlayer()
	if (!UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) || !Entity.IsAlive(local_player)) {
		return 0
	}

	if (switch_state) {
		dynamic_alpha_breaker = dynamic_alpha_breaker + speed
		if (dynamic_alpha_breaker >= max) {
			dynamic_alpha_breaker = max
		}

	} else {
		dynamic_alpha_breaker = dynamic_alpha_breaker - speed
		if (dynamic_alpha_breaker <= min) {
			dynamic_alpha_breaker = min
		}
	}

	return dynamic_alpha_breaker
}

function rainbow(h, s, v) {
	var r, g, b, i, f, p, q, t;
	if (arguments.length === 1) {
		s = h.s, v = h.v, h = h.h;
	}

	i = Math.floor(h * 6);
	f = h * 6 - i;
	p = v * (1 - s);
	q = v * (1 - f * s);
	t = v * (1 - (1 - f) * s);
	switch (i % 6) {
		case 0: r = v, g = t, b = p; break;
		case 1: r = q, g = v, b = p; break;
		case 2: r = p, g = v, b = t; break;
		case 3: r = p, g = q, b = v; break;
		case 4: r = t, g = p, b = v; break;
		case 5: r = v, g = p, b = q; break;
	}

	return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255), 255]
}

function entity_player_peek() {
	var enemy = Entity.GetEnemies()
	var local_player = Entity.GetLocalPlayer()
	if (!UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) || !Entity.IsAlive(local_player) || enemy.length == 0) {
		peeking_state = 0
		return
	}

	var eye_position_1 = vector_store(Entity.GetEyePosition(local_player)[0])
	var eye_position_2 = vector_store(Entity.GetEyePosition(local_player)[1])
	var eye_position_3 = vector_store(Entity.GetEyePosition(local_player)[2])
	var velocity_prop_1 = vector_store(Entity.GetProp(local_player, "CBasePlayer", "m_vecVelocity[0]")[0])
	var velocity_prop_2 = vector_store(Entity.GetProp(local_player, "CBasePlayer", "m_vecVelocity[0]")[1])
	var velocity_prop_3 = vector_store(Entity.GetProp(local_player, "CBasePlayer", "m_vecVelocity[0]")[2])
	var predict_eye_angles_1 = vector_store((eye_position_1 + velocity_prop_1 * (Globals.TickInterval() * 16)))
	var predict_eye_angles_2 = vector_store((eye_position_2 + velocity_prop_2 * (Globals.TickInterval() * 16)))
	var predict_eye_angles_3 = vector_store((eye_position_3 + velocity_prop_3 * (Globals.TickInterval() * 16)))
	if (Math.sqrt((velocity_prop_1 * velocity_prop_1) + (velocity_prop_2 * velocity_prop_2)) < 2) {
		peeking_state = 0
		return
	}

	for (var i = 0; i <= enemy.length; i ++) {
		var entity_target = (Math.max(1, vector_store(enemy[i] - 1)))
		if (!Entity.IsAlive(entity_target) || Entity.IsDormant(entity_target)) {
			peeking_state = 0
			return
		}

		var head_origin_1 = vector_store(Entity.GetHitboxPosition(entity_target, 0)[0])
		var head_origin_2 = vector_store(Entity.GetHitboxPosition(entity_target, 0)[1])
		var head_origin_3 = vector_store(Entity.GetHitboxPosition(entity_target, 0)[2])
		var velocity_prop_1 = vector_store(Entity.GetProp(local_player, "CBasePlayer", "m_vecVelocity[0]")[0])
		var velocity_prop_2 = vector_store(Entity.GetProp(local_player, "CBasePlayer", "m_vecVelocity[0]")[1])
		var velocity_prop_3 = vector_store(Entity.GetProp(local_player, "CBasePlayer", "m_vecVelocity[0]")[2])
		var predicted_head_origin_1 = vector_store((head_origin_1 + velocity_prop_1 * (Globals.TickInterval() * 16)))
		var predicted_head_origin_2 = vector_store((head_origin_2 + velocity_prop_2 * (Globals.TickInterval() * 16)))
		var predicted_head_origin_3 = vector_store((head_origin_3 + velocity_prop_3 * (Globals.TickInterval() * 16)))
		var tace_bullet_calculate = Trace.Bullet(local_player, entity_target, [predict_eye_angles_1, predict_eye_angles_2, predict_eye_angles_3], [predicted_head_origin_1, predicted_head_origin_2, predicted_head_origin_3])
		if (tace_bullet_calculate[1] > 0) {
			peeking_state = 1
			return
		}
	}

	peeking_state = 0
}

function get_dragons_target(me) {
	const sanitize = function(entity) {
		return Entity.IsDormant(entity) || !Entity.IsAlive(entity);
	}

	const enemies = Entity.GetEnemies()
	const distance_based = UI.GetValue(fs_target)
	var data = {target: null, fov: 180, distance: 8192}
	for (var i = 0; i < enemies.length; i ++) {
		const entity = enemies[i]
		if (sanitize(entity)) {
			return;
		}

		if (!distance_based) {
			const head_position = Entity.GetHitboxPosition(entity, 0);
			const fov = getFOV(me, head_position);
			if (fov < data.fov) {
				data.fov = fov;
				data.target = entity;
			}
		} else {
			const origin = Entity.GetRenderOrigin(entity);
			const distance = getDistance(me, origin);
			if (distance < data.distance) {
				data.distance = distance;
				data.target = entity;
			}
		}
	}

	shared.target = data.target;
}

var get_entity_condition = function(entity_target) {
	var condition_state = 0
	var local_flags = Entity.GetProp(entity_target, "CBasePlayer", "m_fFlags");
	var local_vel_length = vec_length_2d(Entity.GetProp(entity_target, "CBasePlayer", "m_vecVelocity[0]"));
	var slowwalk_toggled = UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"]) && local_vel_length > 1.0;
	if (local_flags == 256 || local_flags == 262) {
		condition_state = 3
	} else if (local_flags == 263) {
		condition_state = 4
	} else if (local_vel_length > 2) {
		condition_state = slowwalk_toggled ? 2 : 1
	} else {
		condition_state = 0
	}

	return player_state_condition[condition_state]
}

function get_freestanding_side(me, body_type) {
	shared.side = 0;
	const eye_angles = Local.GetViewAngles()[1]
	const eye_position = Entity.GetEyePosition(me)
	var is_reserved = body_type == 4 || body_type == 6
	var data = {damages: [0, 0], fractions: {left: 0, right: 0}}
	if (shared.target) {
		const angles = [- 90, 90]
		const multiplier = [32, 32, 32]
		const head_position = Entity.GetHitboxPosition(shared.target, 0)
		for (var i = 0; i < angles.length; i ++) {
			const current = angles[i]
			const direction = multiply(angle_to_vector([0, eye_angles + current, 0]), multiplier)
			const point = pointlate(me, [eye_position[0] + direction[0], eye_position[1] + direction[1], eye_position[2] + direction[2],], 4)
			const bullet = Trace.Bullet(me, shared.target, point, head_position)
			if (!bullet)
			continue;
			data.damages[i] = bullet[1];
		}

		if (data.damages[0] < data.damages[1]) {
			shared.side = is_reserved ? 2: 1;
		} else if (data.damages[0] > data.damages[1]) {
			shared.side = is_reserved ? 1: 2;
		}
	}

	if (shared.side) {
		return;
	}

	for (var i = eye_angles - 180; i < eye_angles + 180; i += 180 / 12) {
		if (i === eye_angles) continue;
		const rotation = deg2rad(i);
		const point = [eye_position[0] + Math.cos(rotation) * 256, eye_position[1] + Math.sin(rotation) * 256, eye_position[2]];
		const line = Trace.Line(me, eye_position, point);
		if (!line) continue;
		data.fractions[i > eye_angles ? "right" : "left"] += line[1];
	}

	if (data.fractions.left < data.fractions.right) {
		shared.side = is_reserved ? 2: 1;
	} else if (data.fractions.left > data.fractions.right) {
		shared.side = is_reserved ? 1: 2;
	}
}

function ideal_yaw_freestanding() {
	var body_yaw = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 1 ? UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) : UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Body Yaw Types"])
	if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) == false || Entity.IsAlive(Entity.GetLocalPlayer()) == false || (!body_yaw == 7 || !body_yaw == 8)) {
		return 1
	}

	var curtime = Globals.Curtime()
	if (data.hit_side !== 0 && curtime - data.last_hit > 5) {
		data.last_hit = 0
		data.hit_side = 0
		data.last_side = 0
	}

	var trace_data = {left : 0, right: 0}
	var camera_angle = Local.GetCameraAngles()
	var local_eye_post = Entity.GetEyePosition(Entity.GetLocalPlayer())
	var x = local_eye_post[0]
	var y = local_eye_post[1]
	var z = local_eye_post[2]
	var yaw = camera_angle[1]
	for (var i = yaw - 90; i < yaw + 90; i = i + 30) {
		if (i !== yaw) {
			var pitch_z = z
			var rad = math_rad(i)
			var pitch_y = y + 256 * Math.sin(rad)
			var pitch_x = x + 256 * Math.cos(rad)
			var fraction = Trace.Line(Entity.GetLocalPlayer(), [x, y, z], [pitch_x, pitch_y, pitch_z])
			if (i < yaw) {
				trace_data.left = trace_data.left + fraction
			} else {
				trace_data.right = trace_data.right + fraction
			}
		}
	}

	data.side = trace_data.left < trace_data.right ? 1 : 2
	if (data.side == data.last_side) {
		return data.side
	}

	data.last_side = data.side
	if (!data.hit_side == 0) {
		data.side = data.hit_side == 1 ? 2 : 1
	}

	return data.side
}

function ideal_yaw_data_side_reset() {
	var body_yaw = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 1 ? UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) : UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Body Yaw Types"])
	if (!Entity.IsAlive(Entity.GetLocalPlayer()) || !Entity.GetEntityFromUserID(Event.GetInt("userid")) == Entity.GetLocalPlayer() || (!body_yaw == 7 || !body_yaw == 8) || !UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Smart Ideal Yaw"])) {
		return;
	}

	data.last_side = 0
	data.hit_side = data.side
	data.last_hit = Globals.Curtime()
}

function antibrute_entity_hurt() {
	if (!Entity.IsAlive(Entity.GetLocalPlayer()) || !Entity.IsAlive(Entity.GetLocalPlayer()) || !UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) || !UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti Brute Force"]) ) {
		anti_brute_switch = false;
		return;
	}

	if (Entity.GetEntityFromUserID(Event.GetInt("userid")) !== Entity.GetLocalPlayer()) {
		return;
	}

	var hitbox = Event.GetInt('hitgroup');
	if (hitbox == 1 || hitbox == 6 || hitbox == 7) {
		var curtime = Global.Curtime();
		if (Math.abs(lastHitTime - curtime) > 0.5) {
			lastHitTime = curtime;
		}
	}
}

function antibrute_entity_bullet() {
	if (!Entity.IsAlive(Entity.GetLocalPlayer()) || !UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) || !UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti Brute Force"]) ) {
		anti_brute_switch = false
		return
	}

	var source;
	var curtime = Global.Curtime();
	if (Math.abs(lastHitTime - curtime) < 0.5) return;
	var entity = Entity.GetEntityFromUserID(Event.GetInt("userid"));
	var impact = [Event.GetFloat("x"), Event.GetFloat("y"), Event.GetFloat("z"), curtime];
	if (Entity.IsValid(entity) && Entity.IsEnemy(entity)) {
		if (!Entity.IsDormant(entity)) {
			source = Entity.GetEyePosition(entity)
		} else if (Math.abs(lastImpactTimes[entity] - curtime) < 0.1) {
			source = lastImpacts[entity]
		} else {
			lastImpacts[entity] = impact;
			lastImpactTimes[entity] = curtime;
			return;
		}

		var local = Entity.GetLocalPlayer();
		var localEye = Entity.GetEyePosition(local);
		var localOrigin = Entity.GetProp(local, "CBaseEntity", "m_vecOrigin");
		var localBody = VectorMultiply(VectorAdd(localEye, localOrigin), [0.5, 0.5, 0.5]);
		var bodyVec = ClosestPointOnRay(localBody, source, impact);
		var bodyDist = VectorDistance(localBody, bodyVec);
		if (bodyDist < 85.0) {
			var realPos;
			var fakePos;
			var closestRayPoint;
			var realAngle = Local.GetRealYaw();
			var fakeAngle = Local.GetFakeYaw();
			var headVec = ClosestPointOnRay(localEye, source, impact);
			var headDist = VectorDistance(localEye, headVec);
			var feetDist = VectorDistance(localOrigin, feetVec);
			var feetVec = ClosestPointOnRay(localOrigin, source, impact);
			if (bodyDist < headDist && bodyDist < feetDist) {
				closestRayPoint = bodyVec;
				realPos = ExtendVector(bodyVec, realAngle + 180.0, 10.0);
				fakePos = ExtendVector(bodyVec, fakeAngle + 180.0, 10.0);
			} else if (feetDist < headDist) {
				closestRayPoint = feetVec;
				var realPos1 = ExtendVector(bodyVec, realAngle - 30.0 + 60.0, 10.0);
				var realPos2 = ExtendVector(bodyVec, realAngle - 30.0 - 60.0, 10.0);
				var fakePos1 = ExtendVector(bodyVec, fakeAngle - 30.0 + 60.0, 10.0);
				var fakePos2 = ExtendVector(bodyVec, fakeAngle - 30.0 - 60.0, 10.0);
				if (VectorDistance(feetVec, realPos1) < VectorDistance(feetVec, realPos2)) {
					realPos = realPos1;
				} else {
					realPos = realPos2;
				}

				if (VectorDistance(feetVec, fakePos1) < VectorDistance(feetVec, fakePos2)) {
					fakePos = fakePos1;
				} else {
					fakePos = fakePos2;
				}
			} else {
				closestRayPoint = headVec;
				realPos = ExtendVector(bodyVec, realAngle, 10.0);
				fakePos = ExtendVector(bodyVec, fakeAngle, 10.0);
			}

			if (VectorDistance(closestRayPoint, fakePos) < VectorDistance(closestRayPoint, realPos)) {
				lastHitTime = curtime;
				anti_brute_switch = anti_brute_switch ? false : true
			}
		}

		lastImpacts[entity] = impact;
		lastImpactTimes[entity] = curtime;
	}
}

function tickbase_exploit_crooked() {
	var next_shift_amount = 0
	var local_player = Entity.GetLocalPlayer()
	if (!UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) || !Entity.IsAlive(local_player)) {
		return
	}

	if (cmove.validate_cmd > 0) {
		cmove.validate_cmd = cmove.validate_cmd - 1
		if (UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"])) {
			should_break_tbc = true
		}
	}

	if (Globals.ChokedCommands() < cmove.choked_last_lag_break) {
		cmove.choked_recharge_1 = cmove.choked_recharge_2
		cmove.choked_recharge_2 = cmove.choked_recharge_3
		cmove.choked_recharge_3 = cmove.choked_recharge_4
		cmove.choked_recharge_4 = cmove.choked_last_lag_break
	}

	var ready_to_shift = can_fired(13)
	cmove.choked_last_lag_break = Globals.ChokedCommands();
	var weapon_ready = can_fired(Math.abs(- 1 - next_shift_amount))
	var tickbase = Entity.GetProp(local_player, "CCSPlayer", "m_nTickBase")
	if (ready_to_shift && cmove.shift_time == true) {
		cmove.shift_number = Math.max(1, (1 - Math.floor(Globals.Frametime() * 60)) * (cmove.shift_number + cmove.choked_recharge_4 + 1))
		cmove.shift_time = false
	} else {
		cmove.shift_time = true
	}

	cmove.command_number = tickbase + cmove.shift_number
	if (ready_to_shift || (weapon_ready == false && cmove.did_shift_before)) {
		next_shift_amount = 13
	} else {
		next_shift_amount = 0
	}

	if ((!cmove.old_tickbase == 0) && tickbase < cmove.old_tickbase) {
		if ((cmove.old_tickbase - tickbase) > 11) {
			cmove.skip_next_differ = true
			cmove.charged_before = false
			cmove.can_shift_tickbase = false
		}
	}

	var difference = (cmove.command_number - cmove.old_command_num)
	if (difference >= 11 && difference <= 17) {
		cmove.can_shift_tickbase = cmove.skip_next_differ ? false : true
		cmove.charged_before = cmove.can_shift_tickbase
		cmove.last_charge = difference + (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Instant Double Tap Tickbase"]) == 18 ? 2 : 1)
		cmove.is_cmd_safe = difference > 3 && (Math.abs(17 - difference) <= 3)
		cmove.delay = Math.abs(17 - cmove.last_charge)
	}

	cmove.can_shift_tickbase = ready_to_shift && cmove.charged_before
	cmove.old_tickbase = tickbase
	cmove.old_command_num = cmove.command_number
	cmove.skip_next_differ = false
	cmove.did_shift_before = next_shift_amount == 0 ? false : true
	cmove.can_shift_tickbase = cmove.can_shift_tickbase ? 2 : 0
	if (cmove.can_shift_tickbase == 0 && cmove.charged_before) {
		cmove.can_shift_tickbase = 1
	}

	if (cmove.can_shift_tickbase == 0) {
		cmove.last_charge = 0
	}

	if (!ready_to_shift && cmove.recharge_shift_time) {
		cmove.last_tickbase_recharge = 0
		cmove.recharge_shift_time = false
	} else if (ready_to_shift && !cmove.recharge_shift_time) {
		cmove.last_tickbase_recharge = cmove.last_charge
		cmove.recharge_shift_time = true
	}

	if (!ready_to_shift && cmove.choked_recharge_4 < 3 && cmove.debug_reload_charge) {
		cmove.debug_reload_charge_tickbase = UI.GetValue(["Rage", "Fake Lag", "Fake Lag", "Limit"]) == 14 ? 17 : (UI.GetValue(["Rage", "Fake Lag", "Fake Lag", "Limit"]) + 2)
		cmove.debug_reload_charge = false
	}

	if (!cmove.debug_reload_charge && ready_to_shift && cmove.last_tickbase_recharge <= 11) {
		cmove.last_tickbase_recharge = cmove.debug_reload_charge_tickbase
		cmove.debug_reload_charge = true
	}
}

function tickbase_cmove_shift_fired(c) {
	if (!UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) || !Entity.IsAlive(Entity.GetLocalPlayer())) {
		return
	}

	var entity_target = Entity.GetEntityFromUserID(Event.GetInt("userid"))
	if (entity_target == Entity.GetLocalPlayer() && UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"])) {
		tickbase_shift_fired = true
		tickbase_shift_first_alpha = 255
		tickbase_shift_label = "[ - ] Fired DT | " + Math.floor(Global.Latency() * 1000 / 1.5) + " Ms | Safety: " + (cmove.last_tickbase_recharge >= 16 ? "True" : "False")
	}
}

var condition_text_switch = function(condition_text) {
	if (condition_text == "Standing") {
		return "STANDING"
	} else if (condition_text == "Moving") {
		return "MOVING"
	} else if (condition_text == "Slow Walk") {
		return "SLOW WALK"
	} else if (condition_text == "Jumping") {
		return "JUMPING"
	} else {
		return "CROUCHING"
	}
}

function get_force_choked(entity_target) {
	fix_out = 0.32;
	if (fix_in > Globals.Realtime()) {
		shot_circle = setMath(fix_in - Globals.Realtime(), fix_out , 40) * 0.004;
	} else {
		shot_circle = 0;
	}

	var player_fire = can_fired(16) == false && shot_circle > 0;
	var local_flags = Entity.GetProp(entity_target, "CBasePlayer", "m_fFlags");
	var local_vel_length = vec_length_2d(Entity.GetProp(entity_target, "CBasePlayer", "m_vecVelocity[0]"));
	var script_force_choked = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Force Choked Condition"]);
	var slowwalk_toggled = UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"]) && local_vel_length > 1.0;
	if (player_fire == true) {
		return script_force_choked & (1 << 4) ? true : false;
	}

	if (!(local_flags & (1 << 0))) {
		return script_force_choked & (1 << 3) ? true : false;
	}

	if (slowwalk_toggled == 1) {
		return script_force_choked & (1 << 2) ? true : false;
	}

	if (local_vel_length > 3.5) {
		return script_force_choked & (1 << 1) ? true : false;
	}

	else {
		return script_force_choked & (1 << 0) ? true : false;
	}

	return script_force_choked & (1 << 0) ? true : false;
}

function get_player_state(entity_target) {
	fix_out = 0.32;
	if (fix_in > Globals.Realtime()) {
		shot_circle = setMath(fix_in - Globals.Realtime(), fix_out , 40) * 0.004;
	} else {
		shot_circle = 0;
	}

	var player_fire = can_fired(16) == false && shot_circle > 0;
	var local_flags = Entity.GetProp(entity_target, "CBasePlayer", "m_fFlags");
	var local_vel_length = vec_length_2d(Entity.GetProp(entity_target, "CBasePlayer", "m_vecVelocity[0]"));
	var script_flags = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Alternative Condition"]);
	var slowwalk_toggled = UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"]) && local_vel_length > 1.0;
	if (player_fire == true) {
		return script_flags & (1 << 4) ? true : false;
	}

	if (!(local_flags & (1 << 0))) {
		return script_flags & (1 << 3) ? true : false;
	}

	if (slowwalk_toggled == 1) {
		return script_flags & (1 << 2) ? true : false;
	}

	if (local_vel_length > 3.5) {
		return script_flags & (1 << 1) ? true : false;
	}

	else {
		return script_flags & (1 << 0) ? true : false;
	}

	return script_flags & (1 << 0) ? true : false;
}


function handle_main() {
	var nightmare_yaw_state = "DEFAULT";
	var nightmare_yaw_color = [255, 255, 255, 255];
	var enabled = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]);
	var faketype_select = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Types"]) == 0 ? 0 : 1
	var default_aa = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 1 ? 1 : 0
	var body_yaw_extened = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 0 ? 1 : 0;
	var customization_aa = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 2 ? 0 : 1;
	var boxer_enabled = UI.GetValue(["Rage", "Nightmare Boxer", "Nightmare Boxer", "Enabled Nightmare Boxer Indicators"]);
	var fakelag_max = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Nightmare Fakelag Types"]) == 1 ? 1 : 0;
	var fakelag_alter = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Nightmare Fakelag Types"]) == 5 ? 1 : 0;
	var shot_tick_correct = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "On Shot Correction Fakelag"]) ? 1 : 0;
	var lower_body_yaw_target = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Body Yaw Target"]) == 3 ? 1 : 0;
	var fakelag_random = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Nightmare Fakelag Types"]) == 4 ? 1 : 0
	var fakelag_updates = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Nightmare Fakelag Types"]) == 6 ? 1 : 0
	var fakelag_enabled = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Enabled Nightmare Alternative Fakelag"]);
	var instant_double_tap_speed = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) >= 4 ? 1 : 0;
	var fakelag_cycles_condition = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Nightmare Fakelag Types"]) == 7 ? 1 : 0;
	var smart_ideal_yaw = (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 7 || UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 8 || UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 9) ? 1 : 0;
	var avoid_shooting_fakelag_clamp = (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) == 2 || UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) == 3 || UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) == 6 || UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) == 7) ? 1 : 0;
	UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Custom Player Condition"], (enabled && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 2) ? 1 : 0);

    if (UI.IsMenuOpen()) {
	for (var i = 0; i <= 4; i ++) {
		var is_player_custom_aa = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 2
		var player_condition = player_state_condition[UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Custom Player Condition"])]
		var fake_type_def = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Fake Yaw Types"]) == 0 ? 0 : 1
		var lower_body_yaw = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Lower Body Yaw Target"]) == 3 ? 1 : 0;
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Yaw Base"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Yaw Slider"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Yaw Slider Extended"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Jitter Slider"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Jitter Slider Extended"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Body Yaw Types"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Body Yaw Slider"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Body Yaw Slider Extended"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Lower Body Yaw Target"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Fake Yaw Types"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Fake Yaw Limit"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Fake Yaw Limit 2"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa && fake_type_def) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Fake Yaw Limit Extended"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Fake Yaw Limit Extended 2"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa && fake_type_def) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Lower Body Yaw Offset"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa && lower_body_yaw) ? 1 : 0);
		UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + player_state_condition[i] + "]Lower Body Yaw Offset Extended"], (enabled && player_condition == player_state_condition[i] && is_player_custom_aa && lower_body_yaw) ? 1 : 0);
	}
    }


    if (UI.IsMenuOpen()) {
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"], enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Base"], enabled && customization_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Slider"], enabled && customization_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter Slider"], enabled && customization_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit"], enabled && default_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Types"], enabled && default_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Slider"], enabled && default_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti Brute Force"], enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter On Dormant"], enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"], enabled && default_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Slider Extended"], enabled && customization_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter Slider Extended"], enabled && customization_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Body Yaw Target"], enabled && default_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit Extended"], enabled && default_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Force Eye Yaw On Exploit"], enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Slider Extended"], enabled && default_aa);
        UI.SetEnabled(["Rage", "Nightmare Boxer", "Nightmare Boxer", "Nightmare Boxer X"], boxer_enabled);
        UI.SetEnabled(["Rage", "Nightmare Boxer", "Nightmare Boxer", "Nightmare Boxer Y"], boxer_enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"], enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Block Manual AntiAim Angles"], enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Double Tap Fast Refine"], enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Delta Slow Walk AntiAim"], enabled);
        UI.SetEnabled(["Rage", "Nightmare Boxer", "Nightmare Boxer", "Nightmare Boxer Color"], boxer_enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"], enabled);
        UI.SetEnabled(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"], enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Un Blocket Restrictions[Valve Exploit]"], enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit 2"], enabled && faketype_select && default_aa);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Smart Ideal Yaw"], enabled && smart_ideal_yaw);
        UI.SetEnabled(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"], enabled);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Nightmare Fakelag Types"], fakelag_enabled);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "On Shot Correction Fakelag"], fakelag_enabled);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Send Time"], fakelag_enabled && fakelag_alter);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Send Limit"], fakelag_enabled && fakelag_alter);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "End Limit"], fakelag_enabled && fakelag_updates);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Start Limit"], fakelag_enabled && fakelag_updates);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit Extended 2"], enabled && faketype_select && default_aa);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Maximum Limit"], fakelag_enabled && fakelag_max);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Force Exploit Limit"], fakelag_enabled && fakelag_alter);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Body Yaw Offset"], enabled && lower_body_yaw_target && default_aa);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Force Choked Limit"], fakelag_enabled && fakelag_alter);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Alternative Condition"], fakelag_enabled && fakelag_alter);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Force Choked Condition"], fakelag_enabled && fakelag_alter);
        UI.SetEnabled(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Switch Key"], enabled && body_yaw_extened);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Force Changer Fakelag Block Limit[UnSafe AA]"], fakelag_enabled);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Body Yaw Offset Extended"], enabled && lower_body_yaw_target && default_aa);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "ShotTick Correction Limit"], fakelag_enabled && shot_tick_correct);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Locket Maximum Limit[Enabled Nightmare Yaw]"], fakelag_enabled);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Choked Limit"], fakelag_enabled && (fakelag_alter || fakelag_random));
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Instant Double Tap Tickbase"], enabled && instant_double_tap_speed);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "[Avoid]Shooting Anti-Backtrack Fakelag"], enabled && avoid_shooting_fakelag_clamp);
        UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Normal Limit"], fakelag_enabled && (fakelag_max == 1 ? 0 : 1) && (fakelag_updates == 1 ? 0 : 1) && (fakelag_cycles_condition == 1 ? 0 : 1));
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Indicators Real Color"], enabled && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"]));
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Indicators Fake Color"], enabled && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"]));
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Arrows Indicators Length"], enabled && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"]));
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators"], enabled && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"]) && instant_double_tap_speed);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators X"], enabled && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"]) && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators"]) && instant_double_tap_speed);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Y"], enabled && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"]) && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators"]) && instant_double_tap_speed);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Color"], enabled && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"]) && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators"]) && instant_double_tap_speed);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators States Infor"], enabled && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"]) && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators"]) && instant_double_tap_speed);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Rainbow(Fading)"], enabled && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"]) && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators"]) && instant_double_tap_speed);
    }
	
	if (!maximum_cycle_state_vis) {
		maximum_cycle_lag_vis= UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Fakelag Cycle Value"])
		maximum_cycle_state_vis = true
	}

	UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Fakelag Cycle Value"], fakelag_enabled && fakelag_cycles_condition);
	for (var i = 1; i <= Math.min(UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Fakelag Cycle Value"]), maximum_cycle_lag_vis); i ++) {
		fakelag_name = "Fakelag Cycle Limit/" + i
		UI.SetEnabled(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", fakelag_name], fakelag_enabled && fakelag_cycles_condition);
	}

	if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"]) && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Delta Slow Walk AntiAim"])) {
		nightmare_yaw_state = "LOW DELTA"
		nightmare_yaw_color = [195, 175, 255, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 0) {
		nightmare_yaw_state = "DEFAULT"
		nightmare_yaw_color = [155, 155, 255, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 1) {
		nightmare_yaw_state = "RANDOM"
		nightmare_yaw_color = [255, 200, 175, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 2) {
		nightmare_yaw_state = "DYNAMIC"
		nightmare_yaw_color = [225, 195, 255, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 3) {
		nightmare_yaw_state = "FREESTANDING"
		nightmare_yaw_color = [255, 255, 255, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 4) {
		nightmare_yaw_state = "RESERVED"
		nightmare_yaw_color = [255, 175, 215, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 5 || UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 6) {
		nightmare_yaw_state = "ADAPTIVE"
		nightmare_yaw_color = [0, 255, 255, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 10) {
		nightmare_yaw_state = "SHOOTING CHANGER"
		nightmare_yaw_color = [255, 195, 195, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 11) {
		nightmare_yaw_state = "RANDOM ANGLE"
		nightmare_yaw_color = [255, 225, 175, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 12) {
		nightmare_yaw_state = "AUTOMATIC"
		nightmare_yaw_color = [255, 165, 165, 255]
	} else {
		nightmare_yaw_state = "IDEAL YAW"
		nightmare_yaw_color = [255, 155, 45, 255]
	}

	if (peeking_state == 1 && nightmare_yaw_state !== "LOW DELTA") {
		nightmare_yaw_state = "DRAGONS"
		nightmare_yaw_color = [255, 0, 0, Math.sin(Math.abs(- Math.PI + (Globals.Curtime() * (1 / 0.5)) % (Math.PI * 2))) * 255]
	}

	if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 0) {
		nightmare_yaw_state = "ONETAP"
		nightmare_yaw_color = [255, 155, 45, 255]
	}

	if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 2) {
		nightmare_yaw_state = condition_text_switch(get_entity_condition(Entity.GetLocalPlayer()))
		nightmare_yaw_color = [0, 255, 255, 255]
	}

	var frame_slow = 2 * Globals.Frametime();
	var frame_time = 6 * Globals.Frametime();
	var frame_fast = 80 * Globals.Frametime();
	var frame_rapid = 400 * Globals.Frametime()
	if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) && Entity.IsAlive(Entity.GetLocalPlayer()) && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Draw Nightmare AntiAim Indicators"])) {
		var rapid_removes = 0
		var screen_size = Global.GetScreenSize()
		var font_calibrib = Render.GetFont("calibrib.ttf", 20, true)
		var local_player_desync_breaking_angles = g_player_desync()
		var small_font_calibrib = Render.GetFont("calibrib.ttf", 10, true)
		var real_arrows_color = UI.GetColor(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Indicators Real Color"])
		var fake_arrows_color = UI.GetColor(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Indicators Fake Color"])
		var tickbase_last_charge = can_fired(16) ? UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Instant Double Tap Tickbase"]) : 0
		var dt_charging_color = [can_fired(17) ? 0 : 255, can_fired(17) ? 255 : 0, 0, can_fired(17) ? 255 : Math.sin(Math.abs(- Math.PI + (Globals.Curtime() * (1 / 0.5)) % (Math.PI * 2))) * 255]
		var rapid_texter_dynamic_alpha_creative_move = (dynamic_breaker_alpha(UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"]), 255, 0, frame_time * 255) / 255) * dt_charging_color[3]
		var desync_left_color = [Math.floor(local_player_desync_breaking_angles) < 0 ? fake_arrows_color[0] : real_arrows_color[0], Math.floor(local_player_desync_breaking_angles) < 0 ? fake_arrows_color[1] : real_arrows_color[1], Math.floor(local_player_desync_breaking_angles) < 0 ? fake_arrows_color[2] : real_arrows_color[2], Math.floor(local_player_desync_breaking_angles) < 0 ? fake_arrows_color[3] : real_arrows_color[3]]
		var desync_right_color = [Math.floor(local_player_desync_breaking_angles) >= 0 ? fake_arrows_color[0] : real_arrows_color[0], Math.floor(local_player_desync_breaking_angles) >= 0 ? fake_arrows_color[1] : real_arrows_color[1], Math.floor(local_player_desync_breaking_angles) >= 0 ? fake_arrows_color[2] : real_arrows_color[2], Math.floor(local_player_desync_breaking_angles) >= 0 ? fake_arrows_color[3] : real_arrows_color[3]]
		if (UI.GetValue(["Rage", "Exploits", "Key assignment", "Hide shots"])) {
			hideshot_texter_dynamic_alpha_creative_move = hideshot_texter_dynamic_alpha_creative_move + frame_time
			if (hideshot_texter_dynamic_alpha_creative_move >= 1) {
				hideshot_texter_dynamic_alpha_creative_move = 1
			}

		} else {
			hideshot_texter_dynamic_alpha_creative_move = hideshot_texter_dynamic_alpha_creative_move - frame_time
			if (hideshot_texter_dynamic_alpha_creative_move <= 0) {
				hideshot_texter_dynamic_alpha_creative_move = 0
			}
		}

		if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"])) {
			fakeduck_texter_dynamic_alpha_creative_move = fakeduck_texter_dynamic_alpha_creative_move + frame_time
			if (fakeduck_texter_dynamic_alpha_creative_move >= 1) {
				fakeduck_texter_dynamic_alpha_creative_move = 1
			}

		} else {
			fakeduck_texter_dynamic_alpha_creative_move = fakeduck_texter_dynamic_alpha_creative_move - frame_time
			if (fakeduck_texter_dynamic_alpha_creative_move <= 0) {
				fakeduck_texter_dynamic_alpha_creative_move = 0
			}
		}

		var correct_y = 0
		var dt_indicator_calibrib = Render.GetFont("arial.ttf", 11, true)
		var state_text_height = Render.TextSize(nightmare_yaw_state, small_font_calibrib)[0] / 2
		var dt_ind_x = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators X"])
		var dt_ind_y = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Y"])
		var dt_ind_color = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Rainbow(Fading)"]) ? rainbow(Global.Tickcount() % 350 / 350, 1, 1, 1, 255) : UI.GetColor(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Color"])
		var globals_dt_indicator_alpha = dynamic_breaker_alpha(UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"]), dt_ind_color[3], 0, 150 * Globals.Frametime()) / dt_ind_color[3]
		var text_size_height = Render.TextSize("DT[Nightmare]:          " + " | Safety: " + (cmove.last_tickbase_recharge >= 16 ? "True" : "False") + " | Tickbase(v): " + cmove.last_tickbase_recharge + " | " + (can_fired(17) ? get_double_tap_state(cmove.last_tickbase_recharge) : "Recharge"), dt_indicator_calibrib)[0]
		Render.String(screen_size[0] / 2 - 25, screen_size[1] / 2 + 30, 0, "NIGHTMARE", [255, 255, 255, 255], small_font_calibrib)
		Render.String(screen_size[0] / 2 - state_text_height + 2, screen_size[1] / 2 + 40, 0, nightmare_yaw_state, [nightmare_yaw_color[0], nightmare_yaw_color[1], nightmare_yaw_color[2], nightmare_yaw_color[3]], small_font_calibrib)
		Render.String(screen_size[0] / 2 + (Math.floor(Math.abs(local_player_desync_breaking_angles)) <= 9 ? 3 : 0) - 5, screen_size[1] / 2 + 16, 0, Math.floor(Math.abs(local_player_desync_breaking_angles)) + "", [fake_arrows_color[0], fake_arrows_color[1], fake_arrows_color[2], fake_arrows_color[3]], small_font_calibrib)
		Render.GradientRect(screen_size[0] / 2, screen_size[1] / 2 + 28, Math.floor(Math.abs(local_player_desync_breaking_angles)), 2, 1, [fake_arrows_color[0], fake_arrows_color[1], fake_arrows_color[2], fake_arrows_color[3]], [fake_arrows_color[0], fake_arrows_color[1], fake_arrows_color[2], 0])
		Render.GradientRect(screen_size[0] / 2 - (Math.floor(Math.abs(local_player_desync_breaking_angles))) + 1, screen_size[1] / 2 + 28, Math.floor(Math.abs(local_player_desync_breaking_angles)), 2, 1, [fake_arrows_color[0], fake_arrows_color[1], fake_arrows_color[2], 0], [fake_arrows_color[0], fake_arrows_color[1], fake_arrows_color[2], fake_arrows_color[3]])
		if (fakeduck_texter_dynamic_alpha_creative_move > 0) {
			Render.String(screen_size[0] / 2 - Render.TextSize("FAKE DUCK", small_font_calibrib)[0]/2, screen_size[1] / 2 + 50, 0, "FAKE DUCK", [255, 255, 255, fakeduck_texter_dynamic_alpha_creative_move * 255], small_font_calibrib)
			rapid_removes = rapid_removes + 10
		}

		if (hideshot_texter_dynamic_alpha_creative_move > 0) {
			Render.String(screen_size[0] / 2 - Render.TextSize("HIDE SHOT", small_font_calibrib)[0]/2, screen_size[1] / 2 + 50 + rapid_removes, 0, "HIDE SHOT", [150, 255, 255, hideshot_texter_dynamic_alpha_creative_move * 255], small_font_calibrib)
			rapid_removes = rapid_removes + 10
		}

		if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) >= 4 && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators"])) {
			if (can_fired(17)) {
				if (tickbase_recharge_shift_alpha <= 0) {
					tickbase_recharge_shift = false
				}

				dynamic_slider_breaker = dynamic_slider_breaker + frame_fast
				if (dynamic_slider_breaker >= 29) {
					dynamic_slider_breaker = 29
				}

				tickbase_recharge_shift_label = "[ + ] Charged(" + cmove.last_tickbase_recharge + ") | " + (cmove.last_tickbase_recharge >= 16 ? "Safety: True" : "Safety: False") + " | State: " + get_double_tap_state(cmove.last_tickbase_recharge)
			} else {

				tickbase_recharge_shift = true
				tickbase_recharge_shift_alpha = 255
				dynamic_slider_breaker = dynamic_slider_breaker - frame_fast
				if (dynamic_slider_breaker <= 1) {
					dynamic_slider_breaker = 1
				}
			}

			var bullet_fonts = pcall_get_icon("Weapons Bullet.ttf", 20)
			var weapon_fonts = pcall_get_icon("Weapons Icon.ttf", 20)
			var dynamic_gradient_alpha = dynamic_cycle_alpha() * 255 * (dynamic_slider_breaker / 29)
			var weapon_icon_height = Render.TextSize(player_weapon_const(Entity.GetLocalPlayer()), weapon_fonts)[0]
			Render.String(dt_ind_x, dt_ind_y + 25, 0, player_weapon_const(Entity.GetLocalPlayer()), [255, 255, 255, globals_dt_indicator_alpha * 255], weapon_fonts)
			Render.String(dt_ind_x + weapon_icon_height + 5, dt_ind_y + 23, 0, get_weapon_bullet(Entity.GetLocalPlayer()), [255, 255, 255, globals_dt_indicator_alpha * (((dynamic_slider_breaker - 1) / 29) * 255)], bullet_fonts)
			Render.FilledRect(dt_ind_x + 1, dt_ind_y, text_size_height + 10, 18, [17, 17, 17, 100 * globals_dt_indicator_alpha])
			Render.String(dt_ind_x + 5, dt_ind_y + 3, 0, "DT[Nightmare]:          " + " | Safety: " + (cmove.last_tickbase_recharge >= 16 ? "True" : "False") + " | Tickbase(v): " + cmove.last_tickbase_recharge + " | " + (can_fired(17) ? get_double_tap_state(cmove.last_tickbase_recharge) : "Recharge"), [255, 255, 255, 255 * globals_dt_indicator_alpha], dt_indicator_calibrib)
			Render.FilledRect(dt_ind_x + 81, dt_ind_y + 5, dynamic_slider_breaker, 9, [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dt_ind_color[3] * globals_dt_indicator_alpha])
			if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators Rainbow(Fading)"])) {
				Render.GradientRect(dt_ind_x + 1, dt_ind_y - 1, (text_size_height + 10) / 2, 2, 1, [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dynamic_gradient_alpha * globals_dt_indicator_alpha], [dt_ind_color[0], dt_ind_color[2], dt_ind_color[1], dt_ind_color[3] * globals_dt_indicator_alpha])
				Render.GradientRect(dt_ind_x + 1 + (text_size_height + 10) / 2, dt_ind_y - 1, (text_size_height + 10) / 2 + 2, 2, 1, [dt_ind_color[0], dt_ind_color[2], dt_ind_color[1], dt_ind_color[3] * globals_dt_indicator_alpha], [dt_ind_color[2], dt_ind_color[1], dt_ind_color[0], dynamic_gradient_alpha * globals_dt_indicator_alpha])
				Render.GradientRect(dt_ind_x, dt_ind_y, 2, 20, 0, [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dynamic_gradient_alpha * globals_dt_indicator_alpha], [dt_ind_color[1], dt_ind_color[0], dt_ind_color[2], dt_ind_color[3] * globals_dt_indicator_alpha])
				Render.GradientRect(dt_ind_x + 1 + text_size_height + 10, dt_ind_y, 2, 20, 0, [dt_ind_color[2], dt_ind_color[1], dt_ind_color[0], dynamic_gradient_alpha * globals_dt_indicator_alpha], [dt_ind_color[1], dt_ind_color[0], dt_ind_color[2], dt_ind_color[3] * globals_dt_indicator_alpha])
				Render.GradientRect(dt_ind_x + 1, dt_ind_y + 18, (text_size_height + 10) / 2, 2, 1, [dt_ind_color[1], dt_ind_color[0], dt_ind_color[2], dt_ind_color[3] * globals_dt_indicator_alpha], [dt_ind_color[1], dt_ind_color[2], dt_ind_color[0], dynamic_gradient_alpha * globals_dt_indicator_alpha])
				Render.GradientRect(dt_ind_x + 1 + (text_size_height + 10) / 2, dt_ind_y + 18, (text_size_height + 10) / 2 + 1, 2, 1, [dt_ind_color[1], dt_ind_color[2], dt_ind_color[0], dynamic_gradient_alpha * globals_dt_indicator_alpha], [dt_ind_color[1], dt_ind_color[0], dt_ind_color[2], dt_ind_color[3] * globals_dt_indicator_alpha])
			} else {
				Render.GradientRect(dt_ind_x + 1, dt_ind_y - 1, (text_size_height + 10) / 2, 2, 1, [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dynamic_gradient_alpha * globals_dt_indicator_alpha], [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dt_ind_color[3] * globals_dt_indicator_alpha])
				Render.GradientRect(dt_ind_x + 1 + (text_size_height + 10) / 2, dt_ind_y - 1, (text_size_height + 10) / 2 + 2, 2, 1, [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dt_ind_color[3] * globals_dt_indicator_alpha], [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dynamic_gradient_alpha * globals_dt_indicator_alpha])
				Render.GradientRect(dt_ind_x, dt_ind_y, 2, 20, 0, [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dynamic_gradient_alpha * globals_dt_indicator_alpha], [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dt_ind_color[3] * globals_dt_indicator_alpha])
				Render.GradientRect(dt_ind_x + 1 + text_size_height + 10, dt_ind_y, 2, 20, 0, [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dynamic_gradient_alpha * globals_dt_indicator_alpha], [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dt_ind_color[3] * globals_dt_indicator_alpha])
				Render.GradientRect(dt_ind_x + 1, dt_ind_y + 18, (text_size_height + 10) / 2, 2, 1, [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dt_ind_color[3] * globals_dt_indicator_alpha], [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dynamic_gradient_alpha * globals_dt_indicator_alpha])
				Render.GradientRect(dt_ind_x + 1 + (text_size_height + 10) / 2, dt_ind_y + 18, (text_size_height + 10) / 2 + 1, 2, 1, [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dynamic_gradient_alpha * globals_dt_indicator_alpha], [dt_ind_color[0], dt_ind_color[1], dt_ind_color[2], dt_ind_color[3] * globals_dt_indicator_alpha])
			}

			if (tickbase_shift_fired && tickbase_shift_first_alpha > 0 && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators States Infor"])) {
				tickbase_shift_first_alpha = tickbase_shift_first_alpha - 2.5
				if (tickbase_shift_first_alpha <= 1) {
					tickbase_shift_fired = false
					tickbase_shift_first_alpha = 0
				}

				correct_y = correct_y + 15
				Render.String(dt_ind_x, dt_ind_y + 45, 0, tickbase_shift_label, [255, 255, 255, tickbase_shift_first_alpha * globals_dt_indicator_alpha], dt_indicator_calibrib)
			}

			if (tickbase_recharge_shift && tickbase_recharge_shift_alpha > 0 && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare Double Tap Indicators States Infor"])) {
				tickbase_recharge_shift_alpha = tickbase_recharge_shift_alpha - 2.5
				if (tickbase_recharge_shift_alpha <= 1) {
					tickbase_recharge_shift = false
					tickbase_recharge_shift_alpha = 0
				}

				Render.String(dt_ind_x, dt_ind_y + 45 + correct_y, 0, tickbase_recharge_shift_label, [255, 255, 255, tickbase_recharge_shift_alpha * globals_dt_indicator_alpha], dt_indicator_calibrib)
			}
		}

		if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) >= 4 && rapid_texter_dynamic_alpha_creative_move > 0) {
			Render.String(screen_size[0] / 2 - Render.TextSize("RAPID[" + tickbase_last_charge + "]", small_font_calibrib)[0]/2 , screen_size[1] / 2 + 50 + rapid_removes, 0, "RAPID[" + tickbase_last_charge + "]", [dt_charging_color[0], dt_charging_color[1], dt_charging_color[2], rapid_texter_dynamic_alpha_creative_move], small_font_calibrib)
			rapid_removes = rapid_removes + 10
		}

		if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"]) || UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"])) {
			var legit_peek_remove_x = UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"]) ? 5 : 27
			var legit_peek_text = UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"]) ? "LEGIT PEEK" : "FREESTANDING PEEK"
			Render.String(screen_size[0] / 2 - Render.TextSize(legit_peek_text, small_font_calibrib)[0]/2, screen_size[1] / 2 + 50 + rapid_removes, 0, legit_peek_text, [255, 0, 0, Math.sin(Math.abs(- Math.PI + (Globals.Curtime() * (1 / 0.5)) % (Math.PI * 2))) * 255], small_font_calibrib)
		}

		if (!entity_dormant_target()) {
			Render.String(screen_size[0] / 2 - UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Arrows Indicators Length"]), screen_size[1] / 2 - 9, 0, (Math.floor(local_player_desync_breaking_angles) <= - 28 ? "<<" : "<"), [desync_left_color[0], desync_left_color[1], desync_left_color[2], desync_left_color[3]], font_calibrib)
			Render.String(screen_size[0] / 2 + UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Nightmare AntiAim Arrows Indicators Length"]) - 10, screen_size[1] / 2 - 9, 0, (Math.floor(local_player_desync_breaking_angles) >= 28 ? ">>" : ">"), [desync_right_color[0], desync_right_color[1], desync_right_color[2], desync_right_color[3]], font_calibrib)
		}
	}
}

function running_syr_fakelag(lag_shottick_registered) {
	var fakelag_value = 14
	var double_tap = UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"])
	var on_shot_antiaim = UI.GetValue(["Rage", "Exploits", "Key assignment", "Hide shots"])
	var fake_duking = UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"])
	var force_exploit_limit = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Force Exploit Limit"])
	var enabled = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Enabled Nightmare Alternative Fakelag"])
	if (!Entity.IsAlive(Entity.GetLocalPlayer()) || !enabled) {
		return false
	}

	var player_state = get_player_state(Entity.GetLocalPlayer());
	var get_player_force_choked = get_force_choked(Entity.GetLocalPlayer());
	var exploit_states = double_tap == 1 || on_shot_antiaim == 1 || fake_duking == 1;
	var end_limit = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "End Limit"]);
	var start_limit = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Start Limit"]);
	var send_time = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Send Time"]);
	var send_limit = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Send Limit"]);
	var normal_limit = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Normal Limit"]);
	var choked_limit = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Choked Limit"]);
	var maximum_limit = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Maximum Limit"]);
	var fakelag_type = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Nightmare Fakelag Types"]);
	var force_choked_limit = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Force Choked Limit"]);
	var get_send_target = alternative_send_time(Globals.ChokedCommands(), UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Send Time"]));
	if (Globals.ChokedCommands() == 0) {
		lag_breaking = lag_breaking ? false : true;
	}

	if (fakelag_type == 0) {
		fakelag_value = normal_limit
		if (fakelag_value < 3) {
			override_trigger = true
		}

	} else if (fakelag_type == 1) {
		fakelag_value = maximum_limit
		if (fakelag_value < 3) {
			override_trigger = true
		}

	} else if (fakelag_type == 2) {
		fakelag_value = lag_breaking ? 0 : normal_limit
		if (lag_breaking) {
			override_trigger = true
		}

	} else if (fakelag_type == 3) {
		var fluctuation_update_var = lag_fluctuation_update(Globals.ChokedCommands(), normal_limit)
		fakelag_value = lag_breaking ? fluctuation_update_var : normal_limit
		if (lag_breaking && fluctuation_update_var < 3) {
			override_trigger = true
		}

	} else if (fakelag_type == 4) {
		fakelag_value = math_random(normal_limit, choked_limit)
		if (fakelag_value < 3) {
			override_trigger = true
		}

	} else if (fakelag_type == 6) {
		fakelag_value = fakelag_update_clamp(Globals.ChokedCommands(), start_limit, end_limit)
		if (fakelag_value < 3) {
			override_trigger = true
		}

	} else if (fakelag_type == 7) {
		if (!maximum_cycle_state) {
			maximum_cycle_lag = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Fakelag Cycle Value"])
			maximum_cycle_state = true
		}

		fakelag_choked_number = choked_cycle_lag(Globals.ChokedCommands(), Math.min(UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Fakelag Cycle Value"]), maximum_cycle_lag))
		fakelag_value = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Fakelag Cycle Limit/" + fakelag_choked_number])
		if (fakelag_value < 3) {
			override_trigger = true
		}
	} else {
		if (exploit_states) {
			fakelag_value = force_exploit_limit
		} else if (get_player_force_choked == true && !exploit_states) {
			fakelag_value = force_choked_limit
		} else if (send_time <= 0 && player_state == false && get_player_force_choked == false && !exploit_states) {
			fakelag_value = normal_limit
		} else if (send_time > 0 && player_state && get_player_force_choked == false && !exploit_states) {
			fakelag_value = send_time == 1 ? (lag_breaking ? send_limit : choked_limit) : (get_send_target ? send_limit : choked_limit)
			if (((send_time == 1 && lag_breaking) || (send_time > 1 && get_send_target)) && UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Force Changer Fakelag Block Limit[UnSafe AA]"]) && send_limit < 3) {
				override_trigger = true
			}
		}
	}

	var set_cache = function(self) {
		var process = function(should_call, VAR) {
			UI.SetValue(["Rage", "Fake Lag", "Fake Lag", "Enabled"], VAR == 0 ? (should_call ? 0 : 1) : 1)
			if (should_call) {
				UI.SetValue(["Rage", "Fake Lag", "Fake Lag", "Limit"], VAR)
				if (UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Force Changer Fakelag Block Limit[UnSafe AA]"]) && VAR < 3) {
					AntiAim.SetOverride(0)
					override_trigger = true
				}
			} else {
				UI.SetValue(["Rage", "Fake Lag", "Fake Lag", "Limit"], fakelag_value)
			}
		}

		process(self == null ? false : self, UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "ShotTick Correction Limit"]))
	}

	var max_process_ticks = fakelag_value >= 15 ? 20 : 18
	if (lag_shottick_registered && UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "On Shot Correction Fakelag"])) {
		max_process_ticks = UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "ShotTick Correction Limit"]) + 2
	}

	if (UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"]) || UI.GetValue(["Rage", "Exploits", "Key assignment", "Hide shots"]) || fake_duking) {
		max_process_ticks = 18
	}

	Exploit.OverrideMaxProcessTicks(max_process_ticks)
	UI.SetValue(["Visuals", "Extra", "General", "Hold firing animation"], (UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "On Shot Correction Fakelag"]) && !disabled_shottick_lagstate(Entity.GetLocalPlayer())) ? 0 : 1)
	set_cache(lag_shottick_registered && UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "On Shot Correction Fakelag"]) && !UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"]) && !UI.GetValue(["Rage", "Exploits", "Key assignment", "Hide shots"]) && fake_duking == 0)
}

function creative_nightmare_fakelag() {
	var local_player = Entity.GetLocalPlayer()
	if (!Entity.IsAlive(local_player) || !UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Enabled Nightmare Alternative Fakelag"])) {
		return false
	}

	var weapon = Entity.GetWeapon(local_player)
	var m_iItem = (Entity.GetProp(weapon, "CBaseAttributableItem", "m_iItemDefinitionIndex") & 0xFFFF)
	var last_shot_time = Entity.GetProp(weapon, "CWeaponCSBase", "m_fLastShotTime")
	var limitation = function() {
		var in_accel = function() {
			var local_player = Entity.GetLocalPlayer()
			var velocity = Entity.GetProp(local_player, "CBasePlayer", "m_vecVelocity[0]")
			return Math.sqrt((velocity[0] * velocity[0]) + (velocity[1] * velocity[1])) != 0 ? true : false
		}

		var max_commands = in_accel() ? 1 : 2
		if (!lag_data.threshold && last_shot_time !== lag_data.stored_last_shot) {
			lag_data.stored_last_shot = last_shot_time
			lag_data.threshold = true
			return true
		}

		if (lag_data.threshold && Globals.ChokedCommands() >= max_commands) {
			lag_data.threshold = false
			return true
		}

		return false
	}
    
	if (lag_data.stored_item !== m_iItem) {
		lag_data.stored_last_shot = last_shot_time
		lag_data.stored_item = m_iItem
	}

	running_syr_fakelag(limitation() && Entity.IsAlive(local_player) && !disabled_shottick_lagstate(local_player))
}

var legit_antiaim = 0
var g_bomb_distance = function() {
	if (Entity.GetEntitiesByClassID(129)[0] == null) {
		return 9999
	}

	return get_entity_distance(Entity.GetRenderOrigin(Entity.GetLocalPlayer()), Entity.GetRenderOrigin(Entity.GetEntitiesByClassID(129)[0]))
}

var legit_e_antiaim = function() {
	if (g_bomb_distance() < 2) {
		legit_antiaim = 0
		return 0
	}

	if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"]) && legit_antiaim == 0) {
		Cheat.ExecuteCommand("-use")
		legit_antiaim = 1
	}

	if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"]) && legit_antiaim == 0) {
		Cheat.ExecuteCommand("-use")
		legit_antiaim = 2
	}

	if ((UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"]) || UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"])) && legit_antiaim != 0) {
		return legit_antiaim
	}

	if (legit_antiaim != 0) {
		Cheat.ExecuteCommand("-use")
		legit_antiaim = 0
	}

	return legit_antiaim
}

var desync_angle = function() {
	if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Enabled NightMare AntiAim"]) == false || Entity.IsAlive(Entity.GetLocalPlayer()) == false) {
		shot_circle = 0
		AntiAim.SetOverride(0)
		return
	}


	if (Globals.ChokedCommands() == 0) {
		lag_state = lag_state ? false : true;
		lag_send_number = lag_send_number >= 2 ? 0 : lag_send_number + 1
	}

	var is_active = false
	var lower_body_yaw_angle = 0
	var use_types = legit_e_antiaim()
	var yaw_base = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Base"])
	var yaw_slider = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Slider"])
	var yaw_slider_right = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Slider Extended"])
	var jitter_slider = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter Slider"])
	var jitter_slider_right = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter Slider Extended"])
	var desync_switch = !UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Switch Key"])
	var double_tap = UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"])
	var on_shot_antiaim = UI.GetValue(["Rage", "Exploits", "Key assignment", "Hide shots"])
	var fake_duking = UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"])
	var nightmare_tickbase_exploit = double_tap == 1 || on_shot_antiaim == 1 || fake_duking == 1
	var shot_breaking = (fix_in > Globals.Realtime()) ? setMath(fix_in - Globals.Realtime(), fix_out , 40) * 0.004 : 0
	if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 1) {
		is_active = true
		yaw_base = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Base"])
		yaw_slider = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Slider"])
		yaw_slider_right = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Slider Extended"])
		jitter_slider = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter Slider"])
		jitter_slider_right = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter Slider Extended"])
		body_yaw = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"])
		body_yaw_slider = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Slider"])
		body_yaw_slider_right = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Slider Extended"])
		lower_body_yaw = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Body Yaw Target"])
		lower_body_yaw_offset = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Body Yaw Offset"])
		lower_body_yaw_extended = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Body Yaw Offset Extended"])
		fake_yaw = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Types"])
		fake_yaw_limit = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit"])
		fake_yaw_limit_extra = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit 2"])
		fake_yaw_limit_right = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit Extended"])
		fake_yaw_limit_right_extra = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Fake Yaw Limit Extended 2"])
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 2) {
		is_active = true
		yaw_base = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Yaw Base"])
		yaw_slider = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Yaw Slider"])
		yaw_slider_right = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Yaw Slider Extended"])
		jitter_slider = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Jitter Slider"])
		jitter_slider_right = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Jitter Slider Extended"])
		body_yaw = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Body Yaw Types"])
		body_yaw_slider = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Body Yaw Slider"])
		body_yaw_slider_right = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Body Yaw Slider Extended"])
		lower_body_yaw = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Lower Body Yaw Target"])
		lower_body_yaw_offset = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Lower Body Yaw Offset"])
		lower_body_yaw_extended = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Lower Body Yaw Offset Extended"])
		fake_yaw = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Fake Yaw Types"])
		fake_yaw_limit = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Fake Yaw Limit"])
		fake_yaw_limit_extra = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Fake Yaw Limit 2"])
		fake_yaw_limit_right = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Fake Yaw Limit Extended"])
		fake_yaw_limit_right_extra = UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[" + get_entity_condition(Entity.GetLocalPlayer()) + "]Fake Yaw Limit Extended 2"])
	}

	if (is_active) {
		var fake_yaw_angle = desync_switch ? fake_yaw_limit_right : fake_yaw_limit
		var body_yaw_angle = desync_switch ? body_yaw_slider_right : body_yaw_slider
		if (body_yaw == 1) {
			body_yaw_angle = desync_switch ? math_random(body_yaw_slider_right, 0) : math_random(body_yaw_slider, 0)
		} else if (body_yaw == 2) {
			body_yaw_angle = desync_switch ? (lag_state ? body_yaw_slider_right : - body_yaw_slider_right) : (lag_state ? body_yaw_slider : - body_yaw_slider)
		} else if (body_yaw >= 3 && body_yaw <= 6) {
			get_dragons_target(Entity.GetLocalPlayer())
			get_freestanding_side(Entity.GetLocalPlayer(), body_yaw)
			desync_switch = shared.side == 1 ? desync_switch : !desync_switch
			if (body_yaw == 3) {
				body_yaw_angle = desync_switch ? body_yaw_slider : body_yaw_slider_right
			} else if (body_yaw == 4) {
				body_yaw_angle = desync_switch ? body_yaw_slider_right : body_yaw_slider
			} else {
				body_yaw_angle = desync_switch ? (body_yaw == 5 ? body_yaw_slider : body_yaw_slider_right) : (body_yaw == 5 ? body_yaw_slider_right : body_yaw_slider)
				if (UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"])) {
					body_yaw_angle = lag_state ? body_yaw_angle : - body_yaw_angle
				}
			}

		} else if (body_yaw >= 7 && body_yaw <= 9) {
			desync_switch = ideal_yaw_freestanding() == 1 ? desync_switch : !desync_switch
			if (body_yaw == 7) {
				body_yaw_angle = desync_switch ? body_yaw_slider : body_yaw_slider_right
			} else if (body_yaw == 8) {
				body_yaw_angle = desync_switch ? body_yaw_slider_right : body_yaw_slider
			} else {
				body_yaw_angle = desync_switch ? body_yaw_slider_right : body_yaw_slider
				if (UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"])) {
					body_yaw_angle = lag_state ? body_yaw_angle : - body_yaw_angle
				}
			}

		} else if (body_yaw == 10) {
			desync_switch = shooting_switch
			body_yaw_angle = desync_switch ? body_yaw_slider_right : body_yaw_slider
		} else if (body_yaw == 11) {
			var randomized_real_angles = math_random(left_desync_angles, - right_desync_angles)
			desync_switch = randomized_real_angles > 0
			body_yaw_angle = desync_switch ? body_yaw_slider_right : body_yaw_slider
		} else if (body_yaw == 12) {
			var left_desync_angles = body_yaw_slider
			var right_desync_angles = body_yaw_slider_right
			body_yaw_angle = math_random(1, 2) == 2 ? normalize(math_random(0, Math.abs(math_random(left_desync_angles, - right_desync_angles))) - 30) : normalize(math_random(1, Math.abs(math_random(left_desync_angles, - right_desync_angles))) + 0)
		}

		if (fake_yaw == 1) {
			fake_yaw_angle = !desync_switch ? math_random(fake_yaw_limit_right, fake_yaw_limit_right_extra) : math_random(fake_yaw_limit, fake_yaw_limit_extra)
		} else if (fake_yaw == 2) {
			fake_yaw_angle = !desync_switch ? (lag_state ? fake_yaw_limit_right : fake_yaw_limit_right_extra) : (lag_state ? fake_yaw_limit : fake_yaw_limit_extra)
		} else if (fake_yaw == 3) {
			if (Globals.ChokedCommands() == 0) {
				if (!master_switch_fakeyaw) {
					lag_fakeyaw_update = lag_fakeyaw_update + 1
					if (lag_fakeyaw_update >= (!desync_switch ? fake_yaw_limit_right_extra : fake_yaw_limit_extra)) {
						lag_fakeyaw_update = (!desync_switch ? fake_yaw_limit_right_extra : fake_yaw_limit_extra)
						master_switch_fakeyaw = true
					}
				} else {
					lag_fakeyaw_update = lag_fakeyaw_update - 1
					if (lag_fakeyaw_update <= (!desync_switch ? fake_yaw_limit_right : fake_yaw_limit)) {
						lag_fakeyaw_update = (!desync_switch ? fake_yaw_limit_right : fake_yaw_limit)
						master_switch_fakeyaw = false
					}
				}
			}

			fake_yaw_angle = lag_fakeyaw_update
		}

		if (lower_body_yaw == 1) {
			lower_body_yaw_angle = body_yaw_angle < 0 ? 60 : - 60
		} else if (lower_body_yaw == 2) {
			lower_body_yaw_angle = ((Globals.Tickcount() % 100 > 1) && (Globals.Tickcount() % 100 < 50)) ? 0 : (body_yaw_angle < 0 ? 60 : - 60)
		} else if (lower_body_yaw == 3) {
			lower_body_yaw_angle = body_yaw_angle < 0 ? lower_body_yaw_extended : lower_body_yaw_offset
		}
	}

	var block_tickbase_refine = false
	if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[Exploit]Double Tap Fast Refine"]) && nightmare_tickbase_exploit) {
		block_tickbase_refine = true
		UI.SetValue(["Visuals", "Extra", "General", "Hold firing animation"], fake_duking ? 1 : 0)
	}

	if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Jitter On Dormant"]) && entity_dormant_target()) {
		desync_switch = lag_state
		body_yaw_angle = lag_state ? body_yaw_angle : - body_yaw_angle
	}

	if ((UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) == 2 || UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) == 3 || UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) == 6 || UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "AntiAim Extended Functions"]) == 7) && !UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Enabled Nightmare Alternative Fakelag"])) {
		if (nightmare_tickbase_exploit) {
			UI.SetValue(["Rage", "Fake Lag", "Fake Lag", "Limit"], 14)
			UI.SetValue(["Visuals", "Extra", "General", "Hold firing animation"], (fake_duking || (double_tap && !block_tickbase_refine)) ? 1 : 0)
		} else {
			if (shot_breaking > 0 && shot_breaking <= 0.032) {
				UI.SetValue(["Rage", "Fake Lag", "Fake Lag", "Limit"], 0)
				UI.SetValue(["Visuals", "Extra", "General", "Hold firing animation"], UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[Avoid]Shooting Anti-Backtrack Fakelag"]) == 0 ? 0 : 1)
			} else {
				UI.SetValue(["Rage", "Fake Lag", "Fake Lag", "Limit"], 14)
				UI.SetValue(["Visuals", "Extra", "General", "Hold firing animation"], UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "[Avoid]Shooting Anti-Backtrack Fakelag"]) == 0 ? 1 : 0)
			}
		}
	}

	if (UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "On Shot Correction Fakelag"]) && UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "Enabled Nightmare Alternative Fakelag"]) && (UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "ShotTick Correction Limit"]) == 1 || UI.GetValue(["Rage", "Nightmare Fakelag", "Nightmare Fakelag", "ShotTick Correction Limit"]) == 0)) {
		UI.SetValue(["Visuals", "Extra", "General", "Hold firing animation"], 0)
	}

	if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Force Eye Yaw On Exploit"]) && (double_tap == 1 || on_shot_antiaim == 1) && fake_duking == 0) {
		UI.SetValue(["Rage", "Anti Aim", "Fake", "Lower body yaw mode"], 0)
		lower_body_yaw_angle = 0
	}

	if ((UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Left direction"]) || UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Right direction"])) && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Block Manual AntiAim Angles"])) {
		lower_body_yaw_angle = 0
		body_yaw_angle = 60
	}

	if (use_types != 0) {
		AntiAim.SetOverride(0)
		UI.SetValue(["Config", "Cheat", "General", "Restrictions"], 0)
		UI.SetValue(["Rage", "Anti Aim", "General", "Pitch mode"], 0)
		UI.SetValue(["Rage", "Anti Aim", "Directions", "At targets"], 0)
		UI.SetValue(["Rage", "Anti Aim", "Directions", "Jitter offset"], 0)
		UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], 180)
		UI.SetValue(["Rage", "Anti Aim", "SHEET_MGR", "Hide real angle"], 1)
		UI.SetValue(["Rage", "Anti Aim", "Directions", "Auto direction"], UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"]))
		UI.SetValue(["Rage", "Anti Aim", "SHEET_MGR", "Lower body yaw mode"], use_types == 1 ? 0 : ((use_types == 2 && (double_tap == 1 || on_shot_antiaim == 1) && fake_duking == 0) ? 0 : 1))
		UI.SetHotkeyState(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"], UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"]) ? (desync_switch ? "None" : "Always") : (lag_state ? "None" : "Always"))
		Cheat.ExecuteCommand("-use")
		legit_antiaim = 0
	} else {
		AntiAim.SetOverride(is_active ? 1 : 0)
		AntiAim.SetLBYOffset(lower_body_yaw_angle)
		UI.SetValue(["Rage", "Anti Aim", "General", "Pitch mode"], 1)
		UI.SetValue(["Rage", "Anti Aim", "Directions", "Auto direction"], 0)
		UI.SetValue(["Rage", "Anti Aim", "Directions", "At targets"], yaw_base)
		UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], desync_switch ? yaw_slider : yaw_slider_right)
		UI.SetValue(["Rage", "Anti Aim", "Directions", "Jitter offset"], desync_switch ? jitter_slider : jitter_slider_right)
		AntiAim.SetRealOffset(body_yaw_angle > 0 ? (body_yaw_angle + fake_yaw_angle) / 2 : (body_yaw_angle - fake_yaw_angle) / 2)
		UI.SetValue(["Config", "Cheat", "General", "Restrictions"], UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Un Blocket Restrictions[Valve Exploit]"]) ? 0 : 1)
		UI.SetHotkeyState(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"], is_active ? (desync_switch ? "None" : "Always") : (!desync_switch ? "None" : "Always"))
	}
}

function nightmare_heaven_indicators() {
	if (!Entity.IsAlive(Entity.GetLocalPlayer()) || !UI.GetValue(["Rage", "Nightmare Boxer", "Nightmare Boxer", "Enabled Nightmare Boxer Indicators"])) {
		return
	}

	fix_out = 0.32;
	if (fix_in > Globals.Realtime()) {
		shot_circle = setMath(fix_in - Globals.Realtime(), fix_out , 40) * 0.004;
	} else {
		shot_circle = 0;
	}

	var white_anim = shot_circle * 620
	var fakelag_state_color = [0, 255, 255]
	var font = Render.GetFont("segoeuib.ttf", 10, true)
	var local_player_desync_breaking_angles = g_player_desync()
	var double_tap = UI.GetValue(["Rage", "Exploits", "Key assignment", "Double tap"])
	var fake_duking = UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"]) == 1
	var boxer_x = UI.GetValue(["Rage", "Nightmare Boxer", "SHEET_MGR", "Nightmare Boxer", "Nightmare Boxer X"])
	var boxer_y = UI.GetValue(["Rage", "Nightmare Boxer", "SHEET_MGR", "Nightmare Boxer", "Nightmare Boxer Y"])
	var boxer_color = UI.GetColor(["Rage", "Nightmare Boxer", "SHEET_MGR", "Nightmare Boxer", "Nightmare Boxer Color"])
	var boxer_color_r = Math.min(255, boxer_color[0] + white_anim); var boxer_color_g = Math.min(255, boxer_color[1] + white_anim); var boxer_color_b = Math.min(255, boxer_color[2] + white_anim); var boxer_color_a =  Math.min(255, boxer_color[3] + white_anim)
	Render.GradientRect(boxer_x + 148, boxer_y + 200, 204, 40, 40, [0, 0, 0, 255], [25, 25, 25, 5])
	Render.GradientRect(boxer_x + 148, boxer_y + 237, 204, 40, 40, [0, 0, 0, 255], [25, 25, 25, 5])
	Render.GradientRect(boxer_x + 353, boxer_y + 200, 3, 35, 35, [boxer_color_r, boxer_color_g, boxer_color_b, boxer_color_a], [boxer_color_r, boxer_color_g, boxer_color_b, 0])
	Render.GradientRect(boxer_x + 353, boxer_y + 240, 3, 35, 35, [boxer_color_r, boxer_color_g, boxer_color_b, boxer_color_a], [boxer_color_r, boxer_color_g, boxer_color_b, 0])
	Render.GradientRect(boxer_x + 146, boxer_y + 235, 100, 2, 10, [boxer_color_r, boxer_color_g, boxer_color_b, boxer_color_a], [boxer_color_r, boxer_color_g, boxer_color_b, 20])
	Render.GradientRect(boxer_x + 146, boxer_y + 275, 100, 2, 10, [boxer_color_r, boxer_color_g, boxer_color_b, boxer_color_a], [boxer_color_r, boxer_color_g, boxer_color_b, 20])
	Render.GradientRect(boxer_x + 146, boxer_y + 200, 15 + (dynamic_alpha_slower() * 5), 37, 37, [boxer_color_r, boxer_color_g, boxer_color_b, boxer_color_a], [boxer_color_r, boxer_color_g, boxer_color_b, dynamic_alpha_slower() * 50])
	Render.GradientRect(boxer_x + 146, boxer_y + 240, 15 + (dynamic_alpha_slower() * 5), 37, 37, [boxer_color_r, boxer_color_g, boxer_color_b, boxer_color_a], [boxer_color_r, boxer_color_g, boxer_color_b, dynamic_alpha_slower() * 50])
	Render.GradientRect(boxer_x + 146, boxer_y + 200, 140 + (dynamic_alpha_slower() * 30), 2, 10, [boxer_color_r, boxer_color_g, boxer_color_b, boxer_color_a], [boxer_color_r, boxer_color_g, boxer_color_b, dynamic_alpha_slower() * 50])
	Render.GradientRect(boxer_x + 146, boxer_y + 240, 140 + (dynamic_alpha_slower() * 30), 2, 10, [boxer_color_r, boxer_color_g, boxer_color_b, boxer_color_a], [boxer_color_r, boxer_color_g, boxer_color_b, dynamic_alpha_slower() * 50])
	if (Globals.ChokedCommands() < last_choked) {
		lag_history_1 = lag_history_2
		lag_history_2 = lag_history_3
		lag_history_3 = lag_history_4
		lag_history_4 = last_choked
	}

	if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"]) && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Lower Delta Slow Walk AntiAim"])) {
		nightmare_yaw_state = "LOW DELTA"
		nightmare_yaw_color = [195, 175, 255, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 0) {
		nightmare_yaw_state = "DEFAULT"
		nightmare_yaw_color = [155, 155, 255, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 1) {
		nightmare_yaw_state = "RANDOM"
		nightmare_yaw_color = [255, 200, 175, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 2) {
		nightmare_yaw_state = "DYNAMIC"
		nightmare_yaw_color = [225, 195, 255, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 3) {
		nightmare_yaw_state = "FREESTANDING"
		nightmare_yaw_color = [255, 255, 255, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 4) {
		nightmare_yaw_state = "RESERVED"
		nightmare_yaw_color = [255, 175, 215, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 5 || UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 6) {
		nightmare_yaw_state = "ADAPTIVE"
		nightmare_yaw_color = [0, 255, 255, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 10) {
		nightmare_yaw_state = "SHOOTING CHANGER"
		nightmare_yaw_color = [255, 195, 195, 255]
	} else if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Body Yaw Extended"]) == 12) {
		nightmare_yaw_state = "AUTOMATIC"
		nightmare_yaw_color = [255, 165, 165, 255]
	} else {
		nightmare_yaw_state = "IDEAL YAW"
		nightmare_yaw_color = [255, 155, 45, 255]
	}

	if (peeking_state == 1 && nightmare_yaw_state !== "LOW DELTA") {
		nightmare_yaw_state = "DRAGONS"
		nightmare_yaw_color = [255, 0, 0, Math.sin(Math.abs(- Math.PI + (Globals.Curtime() * (1 / 0.5)) % (Math.PI * 2))) * 255]
	}

	if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 0) {
		nightmare_yaw_state = "ONETAP"
		nightmare_yaw_color = [255, 155, 45, 255]
	}

	if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Anti-Aimbot Condition"]) == 2) {
		nightmare_yaw_state = condition_text_switch(get_entity_condition(Entity.GetLocalPlayer()))
		nightmare_yaw_color = [0, 255, 255, 255]
	}

	last_choked = Globals.ChokedCommands()
	var total_limit = lag_history_1 + lag_history_2 + lag_history_3 + lag_history_4
	var max_val = Math.max(Math.max(lag_history_1, lag_history_2), Math.max(lag_history_3, lag_history_4))
	var local_vel_length = vec_length_2d(Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_vecVelocity[0]"))
	var absolute_limit = (3 * 0.25) + (Math.max(Math.max(lag_history_1, lag_history_2), Math.max(lag_history_3, lag_history_4)) / total_limit)
	var test_flu_val = Math.max(Math.max(lag_history_1, lag_history_2), Math.max(lag_history_3, lag_history_4)) - Math.min(Math.min(lag_history_1, lag_history_2), Math.min(lag_history_3, lag_history_4))
	var player_head_direction = UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Left direction"]) ? "M-LEFT" : (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Right direction"]) ? "M-RIGHT" : (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Yaw Base"]) == 1 ? "AT-TGT" : (Math.floor(local_player_desync_breaking_angles) < 0 ? "LEFT" : "RIGHT")))
	if (!fake_duking) {
		if (!double_tap) {
			if (max_val <= 14) {
				if (max_val >= 0 && max_val <= 2) {
					Fakelag_Status = "INACTIVE"
				} else if (max_val >= 3 && max_val <= 3) {
					Fakelag_Status = "LOW"
				} else if (max_val <= 9 && test_flu_val <= 2) {
					Fakelag_Status = "NOMINAL"
				} else if (max_val >= 10 && test_flu_val <= 2) {
					if (max_val >= 13 && max_val <= 14 && last_choked >= 13) {
						Fakelag_Status = "MAXIMIZED"
					} else if (max_val >= 10 && max_val <= 12) {
						Fakelag_Status = "MAX-MINIMAL"
					}

				} else if (test_flu_val >= 2 && max_val >= 5) {
					if (test_flu_val >= 9 && test_flu_val <= 10) {
						Fakelag_Status = "FLUCTUATED"
					} else if (test_flu_val >= 11 && test_flu_val <= 13 && absolute_limit < 1.29) {
						Fakelag_Status = "FLUCT-MAX"
					} else if (test_flu_val >= 13 && absolute_limit > 1.29) {
						Fakelag_Status = "FL-BREAK"
					} else if (test_flu_val >= 3 && test_flu_val <= 8) {
						Fakelag_Status = "FLUCT-MIN"
					}
				}

			} else if (max_val >= 15) {
				if (absolute_limit > 1.12) {
					Fakelag_Status = "BREAK-EXP"
				} else if (absolute_limit < 1.12) {
					Fakelag_Status = "OVERFLOW"
				}
			}
		} else {
			Fakelag_Status = "DOUBLE TAP"
		}
	} else {
		Fakelag_Status = "FAKEDUCK"
	}

	if (double_tap && fake_duking) {
		Fakelag_Status = "F-DUCK[DT]"
	}

	if (Fakelag_Status == "LOW") {
		fakelag_state_color = [255, 0, 0]
	} else if (Fakelag_Status == "UPDATING...") {
		fakelag_state_color = [230, 161, 0]
	} else if (Fakelag_Status == "INACTIVE") {
		fakelag_state_color = [255, 0, 0]
	} else if (Fakelag_Status == "F-DUCK[DT]") {
		fakelag_state_color = [187, 128, 255]
	} else if (Fakelag_Status == "DOUBLE TAP") {
		fakelag_state_color = [187, 128, 255]
	} else if (Fakelag_Status == "FAKEDUCK") {
		fakelag_state_color = [187, 128, 255]
	} else if (Fakelag_Status == "FLUCTUATED") {
		fakelag_state_color = [123, 194, 21]
	} else if (Fakelag_Status == "FLUCT-MAX") {
		fakelag_state_color = [123, 180, 15]
	} else if (Fakelag_Status == "FLUCT-MIN") {
		fakelag_state_color = [123, 180, 15]
	} else if (Fakelag_Status == "F-LOW") {
		fakelag_state_color = [123, 180, 15]
	} else if (Fakelag_Status == "FL-BREAK") {
		fakelag_state_color = [212, 86, 251]
	} else if (Fakelag_Status == "MAXIMIZED") {
		fakelag_state_color = [20, 142, 255]
	} else if (Fakelag_Status == "MAX-MINIMAL") {
		fakelag_state_color = [20, 142, 255]
	} else if (Fakelag_Status == "NOMINAL") {
		fakelag_state_color = [123, 180, 15]
	} else if (Fakelag_Status == "OVERFLOW") {
		fakelag_state_color = [255, 50, 0]
	} else if (Fakelag_Status == "BREAK-EXP") {
		fakelag_state_color = [168, 0, 230]
	}

	Render.String(boxer_x + 180, boxer_y + 202, 10, "FAKE LAG", [210, 112, 213, 255], font)
	Render.String(boxer_x + 315, boxer_y + 202, 10, "NIGHTMARE", [0, 255, 255, 255], font)
	Render.String(boxer_x + 180, boxer_y + 221, 10, "HISTORY:", [135, 170, 219, 255], font)
	Render.String(boxer_x + 245, boxer_y + 202, 10, Fakelag_Status + "", [fakelag_state_color[0], fakelag_state_color[1], fakelag_state_color[2], 255], font)
	Render.String(boxer_x + 250, boxer_y + 221, 10, lag_history_4 + (lag_history_4 != lag_history_3 ? ">" : "-") + lag_history_3 + (lag_history_3 != lag_history_2 ? ">" : "-") + lag_history_2 + (lag_history_2 != lag_history_1 ? ">" : "-") + lag_history_1, [boxer_color[0], boxer_color[1], boxer_color[2], 255], font)
	Render.String(boxer_x + 310, boxer_y + 221, 10, "M:" + max_val, [boxer_color[0], boxer_color[1], boxer_color[2], 255], font)
	Render.String(boxer_x + 335, boxer_y + 221, 10, " F:" + test_flu_val, [boxer_color[0], boxer_color[1], boxer_color[2], 255], font)
	Render.GradientRect(boxer_x + 151, boxer_y + 215, Globals.ChokedCommands() * 10.5, 3, 4, [boxer_color[0], boxer_color[1], boxer_color[2], 50], [boxer_color[0], boxer_color[1], boxer_color[2], 255])
	Render.FilledRect(boxer_x + 151, boxer_y + 217, 200, 1, [255, 255, 255, 50])
	Render.String(boxer_x + 179, boxer_y + 242, 10, "    CONDITION", [74, 101, 220, 255], font)
	Render.String(boxer_x + 315, boxer_y + 242, 10, "DIR:" + player_head_direction, [115, 182, 219, 255], font);
	Render.String(boxer_x + 249, boxer_y + 242, 10, nightmare_yaw_state + "", [nightmare_yaw_color[0], nightmare_yaw_color[1], nightmare_yaw_color[2], nightmare_yaw_color[3]], font);
	Render.GradientRect(boxer_x + 151, boxer_y + 255, Math.floor(Math.abs(local_player_desync_breaking_angles)) * 3.4, 3, 4, [boxer_color[0], boxer_color[1], boxer_color[2], 50], [boxer_color[0], boxer_color[1], boxer_color[2], 255])
	Render.FilledRect(boxer_x + 151, boxer_y + 257, 200, 1, [255, 255, 255, 50])
	Render.String(boxer_x + 315, boxer_y + 261, 10, "NIGHTMARE", [0, 255, 255, 255], font)
	Render.String(boxer_x + 206 + (Math.floor(local_vel_length) >= 100 ? 6 : (Math.floor(local_vel_length) >= 10 ? 3 : 0)), boxer_y + 261, 10, "VELOCITY: " + Math.floor(local_vel_length) + " (SPEED)", [135, 170, 219, 255], font)
}
//Slowwalk
function getRandomInteger(min, max) {
    return min + Math.ceil(Math.random() * (max - min));
}
UI.AddCheckbox(["Rage", "NightMare Yaw", "NightMare Yaw"], "Slow Walk");
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Min Speed", 0, 100);
UI.AddSliderInt(["Rage", "NightMare Yaw", "NightMare Yaw"], "Max Speed", 0, 100);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Min Speed"], 0);
UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Max Speed"], 0);
function slowwalk() {
    if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Slow Walk"])) {
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Min Speed"], 1);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Max Speed"], 1);
        if (UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Min Speed"]) > UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Max Speed"])) {
            UI.SetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Max Speed"], UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Min Speed"]));
        }
    } else {
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Min Speed"], 0);
        UI.SetEnabled(["Rage", "NightMare Yaw", "NightMare Yaw", "Max Speed"], 0);
    }
    if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"]) && UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Slow Walk"])) {
        dir = [0, 0, 0]
        if (Input.IsKeyPressed(0x57)) {
            dir[0] += getRandomInteger(UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Min Speed"]), UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Max Speed"]));
        }
        if (Input.IsKeyPressed(0x44)) {
            dir[1] += getRandomInteger(UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Min Speed"]), UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Max Speed"]));
        }
        if (Input.IsKeyPressed(0x41)) {
            dir[1] -= getRandomInteger(UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Min Speed"]), UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Max Speed"]));
        }
        if (Input.IsKeyPressed(0x53)) {
            dir[0] -= getRandomInteger(UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Min Speed"]), UI.GetValue(["Rage", "NightMare Yaw", "NightMare Yaw", "Max Speed"]));
        }
        UserCMD.SetMovement(dir);
    }
}
//HUD
var script = {
    shared: {
        choke_history: [0, 0, 0, 0],
        choke_max: 0,
    }
};
const update_choke_data = function() {
    const choked = Globals.ChokedCommands();

    script.shared.choke_max = Math.max(script.shared.choke_max, choked);

    if (Globals.Tickcount() % 16 == 0) {
        script.shared.choke_history.unshift(script.shared.choke_max);
        script.shared.choke_max = 0;

        if (script.shared.choke_history.length > 4)
            script.shared.choke_history.pop();
    }
}
var wCategory = {
    "usp s": "USP",
    "glock 18": "Glock",
    "p2000": "P2000",
    "cz75 auto": "CZ-75",
    "five seven": "Five Seven",
    "dual berettas": "Dualies",
    "r8 revolver": "Revolver",
    "desert eagle": "Deagle",
    "p250": "P250",
    "tec 9": "Tec-9",
    "mp9": "MP9",
    "mp7": "MP7",
    "mac 10": "Mac10",
    "pp bizon": "PP-Bizon",
    "ump 45": "UMP45",
    "mp5 sd": "MP5",
    "p90": "P90",
    "ak 47": "AK47",
    "sg 553": "SG553",
    "aug": "AUG",
    "famas": "FAMAS",
    "galil ar": "GALIL",
    "m4a1 s": "M4A1-S",
    "m4a4": "M4A4",
    "ssg 08": "SSG08",
    "awp": "AWP",
    "g3sg1": "G3SG1",
    "scar 20": "SCAR20",
    "nova": "Nova",
    "xm1014": "XM1014",
    "sawed off": "Sawed off",
    "mag 7": "MAG7",
    "m249": "M249",
    "negev": "Negev"
};
Render.Filled3DCircle = function (position, radius, degrees, start_at, clr, fill_clr) {
    var old_x, old_y;

    degrees = degrees < 361 && degrees || 360; degrees = degrees > -1 && degrees || 0;
    start_at += 1;

    for (rot = start_at; rot < degrees + start_at + 1; rot += start_at * 8) {
        rot_r = rot * (Math.PI / 180);
        line_x = radius * Math.cos(rot_r) + position[0], line_y = radius * Math.sin(rot_r) + position[1];

        var curr = Render.WorldToScreen([line_x, line_y, position[2]]);
        var cur = Render.WorldToScreen([position[0], position[1], position[2]]);

        if (cur[0] != null && curr[0] != null && old_x != null) {
            Render.Polygon([[curr[0], curr[1]], [old_x, old_y], [cur[0], cur[1]]], fill_clr)
            Render.Line(curr[0], curr[1], old_x, old_y, clr)
        }

        old_x = curr[0], old_y = curr[1];
    }
}
function render_arc(x, y, radius, radius_inner, start_angle, end_angle, segments, color) {
    segments = 360 / segments;

    for (var i = start_angle; i < start_angle + end_angle; i = i + segments) {

        var rad = i * Math.PI / 180;
        var rad2 = (i + segments) * Math.PI / 180;

        var rad_cos = Math.cos(rad);
        var rad_sin = Math.sin(rad);

        var rad2_cos = Math.cos(rad2);
        var rad2_sin = Math.sin(rad2);

        var x1_inner = x + rad_cos * radius_inner;
        var y1_inner = y + rad_sin * radius_inner;

        var x1_outer = x + rad_cos * radius;
        var y1_outer = y + rad_sin * radius;

        var x2_inner = x + rad2_cos * radius_inner;
        var y2_inner = y + rad2_sin * radius_inner;

        var x2_outer = x + rad2_cos * radius;
        var y2_outer = y + rad2_sin * radius;

        Render.Polygon([
                [x1_outer, y1_outer],
                [x2_outer, y2_outer],
                [x1_inner, y1_inner]
            ],
            color
        );

        Render.Polygon([
                [x1_inner, y1_inner],
                [x2_outer, y2_outer],
                [x2_inner, y2_inner]
            ],
            color
        );
    }
}
function VectorLerp(vecSource, vecDestination, flPercentage){
    return vecSource + (vecDestination - vecSource)* flPercentage;
}
function rainbow(h, s, v) {
	var r, g, b, i, f, p, q, t;
	if (arguments.length === 1) {
		s = h.s, v = h.v, h = h.h;
	}

	i = Math.floor(h * 6);
	f = h * 6 - i;
	p = v * (1 - s);
	q = v * (1 - f * s);
	t = v * (1 - (1 - f) * s);
	switch (i % 6) {
		case 0: r = v, g = t, b = p; break;
		case 1: r = q, g = v, b = p; break;
		case 2: r = p, g = v, b = t; break;
		case 3: r = p, g = q, b = v; break;
		case 4: r = t, g = p, b = v; break;
		case 5: r = v, g = p, b = q; break;
	}

	return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255), 255]
}
function GradientText(font_name,font_size,font_install,color1,color2,posx,posy,text){
    var font_local = Render.GetFont(font_name, font_size, font_install);
    var every_size;
    var text_t = text;
    var len = text_t.length;
    var rinc = (color1[0]-color2[0])/len;
    var ginc = (color1[1]-color2[1])/len;
    var binc = (color1[2]-color2[2])/len;
    var ainc = (color1[3]-color2[3])/len;
    var ox = 0;
    for(var i = 0;i<=len;i++){
        var c = text_t.substr(i,1);
        color1[0] = color1[0] + rinc;
        color1[1] = color1[1] + ginc;
        color1[2] = color1[2] + binc;
        color1[3] = color1[3] + ainc;
        every_size = Render.TextSize( c, font_local );
        Render.String(posx+ox,posy,0, c, color1, font_local);
        ox = ox+every_size[0];
    }
}
//HUD
const text = "";
const text_ind = "N I G H T M A R E";
var rad_colors = {
    shared: {
        color_history: [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0],[0,0,0,0]],
		armor_history: [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0],[0,0,0,0]],
		bullet_history: [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0],[0,0,0,0]],
        trail_history: [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0],[0,0,0,0]],
        new_ind_history: [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0],[0,0,0,0]],
        generic_history: [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0],[0,0,0,0]],
        purple_history:[[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0],[0,0,0,0]],
    }
};
// var health_color = [];
const update_color_data = function() {
	var local_health = (Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_iHealth"))>100?100:(Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_iHealth"));
    // var hud_timer = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "Hud speed"])
    // var health_type = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "Hud type"])
    const alpha = Math.sin(Math.abs(-Math.PI + (Globals.Curtime() * (1 / .75)) % (Math.PI * 2))) * 255;
    // if(health_type==0) health_color=[250 - local_health * 2.2, 5 + local_health * 2.2,0,alpha];
    // if(health_type==1){
    //     health_color=rainbow(Global.Tickcount() % 350 / 350, 1, 1, 1, 255);
    //     health_color[3] = alpha;
    // }
    // if(health_type==2) health_color=[Math.sin(Math.abs(-Math.PI + (Globals.Curtime() * (1 / .75)) % (Math.PI * 2))) * 255,0,255,alpha];
	// Math.sin(Math.abs(-Math.PI + (Globals.Curtime() * (1 / .75)) % (Math.PI * 2))) * 255,0,255,alpha 紫色
    // 250 - local_health * 2.2, 5 + local_health * 2.2,0,(health_num==1)?255:alpha 生命值
    // const health_colord = health_color;
	const armor_colord = [60, 169, 247, alpha];
	const bullet_colord = rainbow(Global.Realtime() * 0.25, 1, 1,1,255);
    // Global.Realtime() * UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "Fade speed"]) trailRGB速度测试
    const trail_colord = rainbow(Global.Realtime() * UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "Fade speed"]), 1, 1, 1, 255);
    const purple_colord = rainbow(Global.Realtime() * 0.25, 1, 1,1,255);
    const new_ind_colord = rainbow(Global.Realtime() * 0.25, 1, 1,1,255);
    const generic_colord = rainbow(Global.Realtime() * 0.25, 1, 1,1,255);
    // Cheat.Print("")
    // if (Globals.Tickcount() % (16-hud_timer) == 0) {
    //     rad_colors.shared.color_history.unshift(health_colord);
    //     if (rad_colors.shared.color_history.length > 5){
	// 		rad_colors.shared.color_history.pop();
	// 	}
    // }
    if (Globals.Tickcount() % 2 == 0) {
        rad_colors.shared.purple_history.unshift(purple_colord);
        rad_colors.shared.new_ind_history.unshift(new_ind_colord);
        if(rad_colors.shared.purple_history.length > text.length){
            rad_colors.shared.purple_history.pop();
        }
        if(rad_colors.shared.new_ind_history.length > text_ind.length){
            rad_colors.shared.new_ind_history.pop();
        }
    }
    if (Globals.Tickcount() % 8 == 0){
        rad_colors.shared.generic_history.unshift(generic_colord);
        if (rad_colors.shared.generic_history.length > 5){
			rad_colors.shared.generic_history.pop();
		}
    }
    if (Globals.Tickcount() % 16 == 0) {
		rad_colors.shared.armor_history.unshift(armor_colord);
		rad_colors.shared.bullet_history.unshift(bullet_colord);
        rad_colors.shared.trail_history.unshift(trail_colord);
        
		if (rad_colors.shared.armor_history.length > 5){
			rad_colors.shared.armor_history.pop();
		}
		if (rad_colors.shared.bullet_history.length > 5){
			rad_colors.shared.bullet_history.pop();
		}
        if (rad_colors.shared.trail_history.length > 5){
			rad_colors.shared.trail_history.pop();
		}
        
        
    }
}
const command_thread = function() {
    update_choke_data();
    update_color_data();
}
function formatTime(time) {
    var strTime = time.toString();
    var formattedTime = "";
    if (time < 10) {
        formattedTime += "0" + strTime;
    }
    else {
        formattedTime = strTime;
    }

    return formattedTime;
}
function main_visuals(){
    var re_theme_cset = UI.GetColor( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Color picker"] );
    var re_theme_type = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Theme style"]);
    var re_theme_color = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Color method"]);
    var screensize = Global.GetScreenSize();
    var font_normal = Render.GetFont("seguisb.ttf", 14, true);
    var font_smaller = Render.GetFont("segoeuib.ttf", 13, true);
    var font_2 = Render.GetFont("calibri.ttf", 16, true);
    var font = Render.GetFont("verdana.ttf", 11, true);
    var icon = Render.GetFont("icons.ttf", 24, false);
    var local_real = Math.abs(Local.GetRealYaw())
	var local_fake = Math.abs(Local.GetFakeYaw())
	var desync_delta = Math.min((local_fake > local_real) ? ((local_fake - local_real) / 2) : ((local_real - local_fake) / 2), 58).toFixed(1);
    var desync_safety = Math.min(Math.round(1.7 * Math.abs(desync_delta)), 100);
    if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
        var desync_side = "<";
    } else {
        var desync_side = ">";
    }
    var solus_color = (re_theme_color==0||re_theme_color==1)?re_theme_cset:rainbow(Global.Tickcount() % 350 / 350, 1, 1, 1, 255);
    var lobby_solus_color = (re_theme_color==0||re_theme_color==1)?re_theme_cset:rainbow(Global.Realtime()*0.25, 1, 1, 1, 255);
    var solus_username = Cheat.GetUsername();
    var tick_rate = Global.Tickrate();
    const solus_ping = Math.round(Entity.GetProp(Entity.GetLocalPlayer(), "CPlayerResource", "m_iPing")).toString();
    var today = new Date();
    var date_time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    // var lobby_info = "Nightmare.JS|"+solus_username+"|"+date_time;
    var lobby_info_len = Render.TextSize("Nightmare.pub | "+solus_username+" | "+date_time, font );
    var game_info_len = Render.TextSize("Nightmare.pub | "+solus_username+" | delay:"+solus_ping+"ms | "+tick_rate+"tick | "+date_time, font );
    var desync_info_len = Render.TextSize("FAKE("+desync_delta+")", font );
    const ticks = script.shared.choke_history;
    var fl_info_len = Render.TextSize("FL: "+ticks[0], font );
    avatar = Render.AddTexture("ot/scripts/tx.jpg");
    var md_game_info_len_max = Render.TextSize("[Nightmare.pub] | "+solus_username+" | "+"PING:"+solus_ping+"ms | ",font_normal)[0]+Render.TextSize('4',icon)[0]+Render.TextSize(date_time+" ",font_normal)[0];
    var sunset_lobby_info = Render.TextSize("Nightmare.pub | "+solus_username+" | "+date_time, font );
    var sunset_game_info = Render.TextSize("Nightmare.pub | "+solus_username+" | "+solus_ping+" ms | "+tick_rate+" tick | "+date_time, font );
    UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Color picker"],(re_theme_color==0||re_theme_color==1)?1:0);
    switch(re_theme_type){
        case 0:
            if (!Entity.IsAlive(Entity.GetLocalPlayer())){
                Render.GradientRect( screensize[0]-sunset_lobby_info[0]-16, 12, (sunset_lobby_info[0]+10)/2, 17, 1,[ 25, 25, 25, 0 ],[25,25,25,160] );
                Render.GradientRect( screensize[0]-sunset_lobby_info[0]-16+(sunset_lobby_info[0]+10)/2, 12, (sunset_lobby_info[0]+4)/2, 17, 1,[ 25, 25, 25, 160 ],[25,25,25,0] );
                if(re_theme_color==0){
                    Render.GradientRect( screensize[0]-sunset_lobby_info[0]-16, 11, (sunset_lobby_info[0]+10)/2, 1, 1,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 0], [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 255] );
                    Render.GradientRect( screensize[0]-sunset_lobby_info[0]-16+(sunset_lobby_info[0]+10)/2, 11, (sunset_lobby_info[0]+4)/2, 1, 1,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 255], [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 0] );
                    Render.GradientRect( screensize[0]-sunset_lobby_info[0]-16, 29, (sunset_lobby_info[0]+10)/2, 1, 1,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 0], [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 255] );
                    Render.GradientRect( screensize[0]-sunset_lobby_info[0]-16+(sunset_lobby_info[0]+10)/2, 29, (sunset_lobby_info[0]+4)/2, 1, 1,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 255], [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 0] );
                    Render.String(screensize[0]-sunset_lobby_info[0]-11,12,0, "Nightmare.pub | "+solus_username+" | "+date_time, [255,255,255,255], font);
                }else{
                    Render.GradientRect( screensize[0]-sunset_lobby_info[0]-16, 11, (sunset_lobby_info[0]+10)/2, 1, 1,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 0], [lobby_solus_color[0], lobby_solus_color[2], lobby_solus_color[1], 255] );
                    Render.GradientRect( screensize[0]-sunset_lobby_info[0]-16+(sunset_lobby_info[0]+10)/2, 11, (sunset_lobby_info[0]+4)/2, 1, 1,[lobby_solus_color[0], lobby_solus_color[2], lobby_solus_color[1], 255], [lobby_solus_color[2], lobby_solus_color[1], lobby_solus_color[0], 0] );
                    Render.GradientRect( screensize[0]-sunset_lobby_info[0]-16, 29, (sunset_lobby_info[0]+10)/2, 1, 1,[lobby_solus_color[1], lobby_solus_color[0], lobby_solus_color[2], 0], [lobby_solus_color[1], lobby_solus_color[2], lobby_solus_color[0], 255] );
                    Render.GradientRect( screensize[0]-sunset_lobby_info[0]-16+(sunset_lobby_info[0]+10)/2, 29, (sunset_lobby_info[0]+4)/2, 1, 1,[lobby_solus_color[1], lobby_solus_color[2], lobby_solus_color[0], 255], [lobby_solus_color[2], lobby_solus_color[1], lobby_solus_color[0], 0] );
                    Render.String(screensize[0]-sunset_lobby_info[0]-11,12,0, "Night", [255,255,255,255], font);
                    GradientText("verdana.ttf",11,true,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 255], [lobby_solus_color[0], lobby_solus_color[2], lobby_solus_color[1], 255],screensize[0]-sunset_lobby_info[0]-11+Render.TextSize("Night", font )[0],12,"mare");
                    Render.String(screensize[0]-sunset_lobby_info[0]-11+Render.TextSize("Nightmare", font )[0],12,0, ".pub | "+solus_username+" | "+date_time, [255,255,255,255], font);
                }
            }else{
                Render.GradientRect( screensize[0]-sunset_game_info[0]-16, 12, (sunset_game_info[0]+10)/2, 17, 1,[ 25, 25, 25, 0 ],[25,25,25,160] );
                Render.GradientRect( screensize[0]-sunset_game_info[0]-16+(sunset_game_info[0]+10)/2, 12, (sunset_game_info[0]+4)/2, 17, 1,[ 25, 25, 25, 160 ],[25,25,25,0] );
                if(re_theme_color==0){
                    Render.GradientRect( screensize[0]-sunset_game_info[0]-16, 11, (sunset_game_info[0]+10)/2, 1, 1,[solus_color[0], solus_color[1], solus_color[2], 0], [solus_color[0], solus_color[1], solus_color[2], 255] );
                    Render.GradientRect( screensize[0]-sunset_game_info[0]-16+(sunset_game_info[0]+10)/2, 11, (sunset_game_info[0]+4)/2, 1, 1,[solus_color[0], solus_color[1], solus_color[2], 255], [solus_color[0], solus_color[1], solus_color[2], 0] );
                    Render.GradientRect( screensize[0]-sunset_game_info[0]-16, 29, (sunset_game_info[0]+10)/2, 1, 1,[solus_color[0], solus_color[1], solus_color[2], 0], [solus_color[0], solus_color[1], solus_color[2], 255] );
                    Render.GradientRect( screensize[0]-sunset_game_info[0]-16+(sunset_game_info[0]+10)/2, 29, (sunset_game_info[0]+4)/2, 1, 1,[solus_color[0], solus_color[1], solus_color[2], 255], [solus_color[0], solus_color[1], solus_color[2], 0] );
                    Render.String(screensize[0]-sunset_game_info[0]-11,12,0, "Nightmare.pub | "+solus_username+" | "+solus_ping+" ms | "+tick_rate+" tick | "+date_time, [255,255,255,255], font);
                }else{
                    Render.GradientRect( screensize[0]-sunset_game_info[0]-16, 11, (sunset_game_info[0]+10)/2, 1, 1,[solus_color[0], solus_color[1], solus_color[2], 0], [solus_color[0], solus_color[2], solus_color[1], 255] );
                    Render.GradientRect( screensize[0]-sunset_game_info[0]-16+(sunset_game_info[0]+10)/2, 11, (sunset_game_info[0]+4)/2, 1, 1,[solus_color[0], solus_color[2], solus_color[1], 255], [solus_color[2], solus_color[1], solus_color[0], 0] );
                    Render.GradientRect( screensize[0]-sunset_game_info[0]-16, 29, (sunset_game_info[0]+10)/2, 1, 1,[solus_color[1], solus_color[0], solus_color[2], 0], [solus_color[1], solus_color[2], solus_color[0], 255] );
                    Render.GradientRect( screensize[0]-sunset_game_info[0]-16+(sunset_game_info[0]+10)/2, 29, (sunset_game_info[0]+4)/2, 1, 1,[solus_color[1], solus_color[2], solus_color[0], 255], [solus_color[2], solus_color[1], solus_color[0], 0] );
                    Render.String(screensize[0]-sunset_game_info[0]-11,12,0, "Night", [255,255,255,255], font);
                    GradientText("verdana.ttf",11,true,[solus_color[0], solus_color[1], solus_color[2], 255], [solus_color[0], solus_color[2], solus_color[1], 255],screensize[0]-sunset_game_info[0]-11+Render.TextSize("Night", font )[0],12,"mare");
                    Render.String(screensize[0]-sunset_game_info[0]-11+Render.TextSize("Nightmare", font )[0],12,0, ".pub | "+solus_username+" | "+solus_ping+" ms | "+tick_rate+" tick | "+date_time, [255,255,255,255], font);
                }
            }
            break;
        case 1:
            if (!Entity.IsAlive(Entity.GetLocalPlayer())){
                Render.FilledRect( screensize[0]-lobby_info_len[0]-20, 12, lobby_info_len[0]+10, 17, [ 25, 25, 25, 160 ] );
                if(re_theme_color==0){
                    Render.GradientRect(screensize[0]-lobby_info_len[0]-20, 10, (lobby_info_len[0]+10) / 2, 2, 1, lobby_solus_color, lobby_solus_color);
                    Render.GradientRect(screensize[0]-lobby_info_len[0]-20+(lobby_info_len[0]+10) / 2, 10, (lobby_info_len[0]+10) / 2, 2, 1, lobby_solus_color, lobby_solus_color)
                    Render.String(screensize[0]-lobby_info_len[0]-15,12,0, "Nightmare.pub | "+solus_username+" | "+date_time, [255,255,255,255], font)
                }else{
                    Render.GradientRect(screensize[0]-lobby_info_len[0]-20, 10, (lobby_info_len[0]+10) / 2, 2, 1, [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 255], [lobby_solus_color[0], lobby_solus_color[2], lobby_solus_color[1], 255]);
                    Render.GradientRect(screensize[0]-lobby_info_len[0]-20+(lobby_info_len[0]+10) / 2, 10, (lobby_info_len[0]+10) / 2, 2, 1, [lobby_solus_color[0], lobby_solus_color[2], lobby_solus_color[1], 255], [lobby_solus_color[2], lobby_solus_color[1], lobby_solus_color[0],255])
                    Render.String(screensize[0]-lobby_info_len[0]-15,12,0, "Nightmare.pub | "+solus_username+" | "+date_time, [255,255,255,255], font)
                }
            }else{
                Render.FilledRect( screensize[0]-game_info_len[0]-20, 12, game_info_len[0]+10, 17, [ 25, 25, 25, 160 ] );
                Render.FilledRect( screensize[0]-fl_info_len[0]-20, 38, fl_info_len[0]+10, 17, [ 25, 25, 25, 160 ] );
                Render.GradientRect( screensize[0]-fl_info_len[0]-desync_info_len[0]-40, 38, (desync_info_len[0]+10)/2, 17, 1,[ 25, 25, 25, 0 ],[ 25, 25, 25, 160 ] );
                Render.GradientRect( screensize[0]-fl_info_len[0]-desync_info_len[0]-40+(desync_info_len[0]+10)/2, 38, (desync_info_len[0]+10)/2, 17, 1,[ 25, 25, 25, 160 ],[ 25, 25, 25, 0 ] );
                Render.GradientRect( screensize[0]-fl_info_len[0]-desync_info_len[0]-40, 38, 2, 8.5, 0,[ 250 - desync_delta * 3.67, 5 + desync_delta * 3.67,0,0 ],[ 250 - desync_delta * 3.67, 5 + desync_delta * 3.67,0, 225 ] );
                Render.GradientRect( screensize[0]-fl_info_len[0]-desync_info_len[0]-40, 38+8.5, 2, 8.5, 0,[ 250 - desync_delta * 3.67, 5 + desync_delta * 3.67,0, 225 ],[ 250 - desync_delta * 3.67, 5 + desync_delta * 3.67,0, 0 ] );
                Render.String(screensize[0]-fl_info_len[0]-15,38,0, "FL: "+ticks[0], [255,255,255,255], font)
                Render.String(screensize[0]-fl_info_len[0]-desync_info_len[0]-35,38,0, "FAKE("+desync_delta+")", [255,255,255,255], font)
                if(re_theme_color==0){
                    //solus watermark
                    Render.GradientRect(screensize[0]-game_info_len[0]-20, 10, (game_info_len[0]+10) / 2, 2, 1, solus_color, solus_color);
                    Render.GradientRect(screensize[0]-game_info_len[0]-20+(game_info_len[0]+10) / 2, 10, (game_info_len[0]+10) / 2, 2, 1, solus_color, solus_color);
                    Render.GradientRect(screensize[0]-fl_info_len[0]-20, 55, (fl_info_len[0]+10) / 2, 1, 1, [255,255,255,0], [255,255,255,255]);
                    Render.GradientRect(screensize[0]-fl_info_len[0]-20+(fl_info_len[0]+10) / 2, 55, (fl_info_len[0]+10) / 2, 1, 1, [255,255,255,255], [255,255,255,0]);
                    Render.String(screensize[0]-game_info_len[0]-15,12,0, "Nightmare.pub | "+solus_username+" | delay:"+solus_ping+"ms | "+tick_rate+"tick | "+date_time, [255,255,255,255], font);
                }else{
                    //solus watermark
                    Render.GradientRect(screensize[0]-game_info_len[0]-20, 10, (game_info_len[0]+10) / 2, 2, 1, [solus_color[0], solus_color[1], solus_color[2], 255], [solus_color[0], solus_color[2], solus_color[1], 255]);
                    Render.GradientRect(screensize[0]-game_info_len[0]-20+(game_info_len[0]+10) / 2, 10, (game_info_len[0]+10) / 2, 2, 1, [solus_color[0], solus_color[2], solus_color[1], 255], [solus_color[2], solus_color[1], solus_color[0],255])
                    Render.GradientRect(screensize[0]-fl_info_len[0]-20, 55, (fl_info_len[0]+10) / 2, 1, 1, [255,255,255,0], [255,255,255,255]);
                    Render.GradientRect(screensize[0]-fl_info_len[0]-20+(fl_info_len[0]+10) / 2, 55, (fl_info_len[0]+10) / 2, 1, 1, [255,255,255,255], [255,255,255,0]);
                    Render.String(screensize[0]-game_info_len[0]-15,12,0, "Nightmare.pub | "+solus_username+" | delay:"+solus_ping+"ms | "+tick_rate+"tick | "+date_time, [255,255,255,255], font)
                }
                
            }
            break;
        case 2:
            Render.FilledRect( screensize[0]-md_game_info_len_max-38-13, 17, md_game_info_len_max+38, 36, [ 35, 35, 35, 180 ] );
            // Render.FilledRect( screensize[0]-md_game_info_len_max-30-11+Render.TextSize("4.0",font_2)[0], 18, 1, 16, [ 70,70,74, 200 ] );
            if (!Entity.IsAlive(Entity.GetLocalPlayer())){
                if(re_theme_color==0){
                    //var md_game_info_len_max = Render.TextSize("NIGHTMARE",font_2)[0]+Render.TextSize('USER',font_smaller)[0]+Render.TextSize(solus_username,font_normal)[0]+Render.TextSize('PING',font_smaller)[0]+Render.TextSize(solus_ping+"ms",font_normal)[0]+Render.TextSize('DATE',font_smaller)[0]+Render.TextSize(date_time+" ",font_normal)[0];
                    //solus watermark -16 = 378
                    // Render.FilledRect( screensize[0]-md_game_info_len[0]-14, 10, md_game_info_len[0]+4, 1, [ 255, 0, 0, 255 ] );
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 16, md_game_info_len_max+18, 1, [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 200] );
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 17, md_game_info_len_max+18, 1, [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 255] );
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 18, md_game_info_len_max+18, 1, [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 200] );//up
                    Render.FilledRect( screensize[0]-13, 18, 1, 35, [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 200] );
                    Render.FilledRect( screensize[0]-14, 18, 1, 35, [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 255] );
                    Render.FilledRect( screensize[0]-15, 18, 1, 35, [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 200] );//right
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 16+36, md_game_info_len_max+18, 1, [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 200] );
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 17+36, md_game_info_len_max+18, 1, [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 255] );
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 18+36, md_game_info_len_max+18, 1, [lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 200] );//down
                    // Render.FilledRect( screensize[0]-md_game_info_len[0]-14, 14, md_game_info_len[0]+4, 1, [ 255, 0, 0, 255 ] );
                    
                    // Render.String(screensize[0]-md_game_info_len[0]-12,14,0, "Nightmare.JS | "+solus_username+" | delay:"+solus_ping+"ms | "+tick_rate+"tick | "+date_time, [255,255,255,255], font_1);
                }else{
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 16, md_game_info_len_max+18, 1, 1,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 200], [lobby_solus_color[2], lobby_solus_color[0], lobby_solus_color[1], 200]);
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 17, md_game_info_len_max+18, 1, 1,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 255], [lobby_solus_color[2], lobby_solus_color[0], lobby_solus_color[1], 255]);
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 18, md_game_info_len_max+18, 1, 1,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 200], [lobby_solus_color[2], lobby_solus_color[0], lobby_solus_color[1], 200]);
                    Render.GradientRect( screensize[0]-13, 18, 1, 35, 0,[lobby_solus_color[2], lobby_solus_color[0], lobby_solus_color[1], 200], [lobby_solus_color[1], lobby_solus_color[2], lobby_solus_color[0], 200]);
                    Render.GradientRect( screensize[0]-14, 18, 1, 35, 0,[lobby_solus_color[2], lobby_solus_color[0], lobby_solus_color[1], 255], [lobby_solus_color[1], lobby_solus_color[2], lobby_solus_color[0], 255]);
                    Render.GradientRect( screensize[0]-15, 18, 1, 35, 0,[lobby_solus_color[2], lobby_solus_color[0], lobby_solus_color[1], 200], [lobby_solus_color[1], lobby_solus_color[2], lobby_solus_color[0], 200]);
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 16+36, md_game_info_len_max+18, 1, 1,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 200], [lobby_solus_color[1], lobby_solus_color[2], lobby_solus_color[0], 200]);
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 17+36, md_game_info_len_max+18, 1, 1,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 255], [lobby_solus_color[1], lobby_solus_color[2], lobby_solus_color[0], 255]);
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 18+36, md_game_info_len_max+18, 1, 1,[lobby_solus_color[0], lobby_solus_color[1], lobby_solus_color[2], 200], [lobby_solus_color[1], lobby_solus_color[2], lobby_solus_color[0], 200]);
                }
                Render.String(screensize[0]-md_game_info_len_max-14-11,24,0, "[Nightmare.pub] | "+solus_username+" | "+"PING:"+solus_ping+"ms | ", [255,255,255,255], font_normal);
                Render.String(screensize[0]-md_game_info_len_max-14-11+Render.TextSize("[Nightmare.pub] | "+solus_username+" | "+"PING:"+solus_ping+"ms | ",font_normal)[0],24,0, "4", [255,255,255,255], icon);

                Render.String(screensize[0]-md_game_info_len_max-10-11+Render.TextSize("[Nightmare.pub] | "+solus_username+" | "+"PING:"+solus_ping+"ms | ",font_normal)[0]+Render.TextSize("4",icon)[0],24,0, date_time+"", [255,255,255,255], font_normal);
                Render.FilledRect(screensize[0]-md_game_info_len_max-80, 10, 50, 50, [25, 25, 25, 255]);
                Render.TexturedRect(screensize[0]-md_game_info_len_max-75, 15, 40, 40, avatar);
                
            }else{
                if(re_theme_color==0){
                    //var md_game_info_len_max = Render.TextSize("NIGHTMARE",font_2)[0]+Render.TextSize('USER',font_smaller)[0]+Render.TextSize(solus_username,font_normal)[0]+Render.TextSize('PING',font_smaller)[0]+Render.TextSize(solus_ping+"ms",font_normal)[0]+Render.TextSize('DATE',font_smaller)[0]+Render.TextSize(date_time+" ",font_normal)[0];
                    //solus watermark -16 = 378
                    // Render.FilledRect( screensize[0]-md_game_info_len[0]-14, 10, md_game_info_len[0]+4, 1, [ 255, 0, 0, 255 ] );
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 16, md_game_info_len_max+18, 1, [solus_color[0], solus_color[1], solus_color[2], 200] );
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 17, md_game_info_len_max+18, 1, [solus_color[0], solus_color[1], solus_color[2], 255] );
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 18, md_game_info_len_max+18, 1, [solus_color[0], solus_color[1], solus_color[2], 200] );//up
                    Render.FilledRect( screensize[0]-13, 18, 1, 35, [solus_color[0], solus_color[1], solus_color[2], 200] );
                    Render.FilledRect( screensize[0]-14, 18, 1, 35, [solus_color[0], solus_color[1], solus_color[2], 255] );
                    Render.FilledRect( screensize[0]-15, 18, 1, 35, [solus_color[0], solus_color[1], solus_color[2], 200] );//right
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 16+36, md_game_info_len_max+18, 1, [solus_color[0], solus_color[1], solus_color[2], 200] );
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 17+36, md_game_info_len_max+18, 1, [solus_color[0], solus_color[1], solus_color[2], 255] );
                    Render.FilledRect( screensize[0]-md_game_info_len_max-30, 18+36, md_game_info_len_max+18, 1, [solus_color[0], solus_color[1], solus_color[2], 200] );//down
                    // Render.FilledRect( screensize[0]-md_game_info_len[0]-14, 14, md_game_info_len[0]+4, 1, [ 255, 0, 0, 255 ] );
                    
                    // Render.String(screensize[0]-md_game_info_len[0]-12,14,0, "Nightmare.JS | "+solus_username+" | delay:"+solus_ping+"ms | "+tick_rate+"tick | "+date_time, [255,255,255,255], font_1);
                }else{
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 16, md_game_info_len_max+18, 1, 1,[solus_color[0], solus_color[1], solus_color[2], 200], [solus_color[2], solus_color[0], solus_color[1], 200]);
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 17, md_game_info_len_max+18, 1, 1,[solus_color[0], solus_color[1], solus_color[2], 255], [solus_color[2], solus_color[0], solus_color[1], 255]);
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 18, md_game_info_len_max+18, 1, 1,[solus_color[0], solus_color[1], solus_color[2], 200], [solus_color[2], solus_color[0], solus_color[1], 200]);
                    Render.GradientRect( screensize[0]-13, 18, 1, 35, 0,[solus_color[2], solus_color[0], solus_color[1], 200], [solus_color[1], solus_color[2], solus_color[0], 200]);
                    Render.GradientRect( screensize[0]-14, 18, 1, 35, 0,[solus_color[2], solus_color[0], solus_color[1], 255], [solus_color[1], solus_color[2], solus_color[0], 255]);
                    Render.GradientRect( screensize[0]-15, 18, 1, 35, 0,[solus_color[2], solus_color[0], solus_color[1], 200], [solus_color[1], solus_color[2], solus_color[0], 200]);
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 16+36, md_game_info_len_max+18, 1, 1,[solus_color[0], solus_color[1], solus_color[2], 200], [solus_color[1], solus_color[2], solus_color[0], 200]);
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 17+36, md_game_info_len_max+18, 1, 1,[solus_color[0], solus_color[1], solus_color[2], 255], [solus_color[1], solus_color[2], solus_color[0], 255]);
                    Render.GradientRect( screensize[0]-md_game_info_len_max-30, 18+36, md_game_info_len_max+18, 1, 1,[solus_color[0], solus_color[1], solus_color[2], 200], [solus_color[1], solus_color[2], solus_color[0], 200]);
                }
                Render.String(screensize[0]-md_game_info_len_max-14-11,24,0, "[Nightmare.pub] | "+solus_username+" | "+"PING:"+solus_ping+"ms | ", [255,255,255,255], font_normal);
                Render.String(screensize[0]-md_game_info_len_max-14-11+Render.TextSize("[Nightmare.pub] | "+solus_username+" | "+"PING:"+solus_ping+"ms | ",font_normal)[0],24,0, "4", [255,255,255,255], icon);

                Render.String(screensize[0]-md_game_info_len_max-10-11+Render.TextSize("[Nightmare.pub] | "+solus_username+" | "+"PING:"+solus_ping+"ms | ",font_normal)[0]+Render.TextSize("4",icon)[0],24,0, date_time+"", [255,255,255,255], font_normal);
                Render.FilledRect(screensize[0]-md_game_info_len_max-80, 10, 50, 50, [25, 25, 25, 255]);
                Render.TexturedRect(screensize[0]-md_game_info_len_max-75, 15, 40, 40, avatar);
                
            }
            break;
    }
}
function pr(value)
{
    return Cheat.Print(value+'\n')
}//debug
//indicator new
var wep2name = {
	'1' : "desert eagle",
	'2' : "dual berettas",
	'3' : "five seven",
	'4' : "glock 18",
	'7' : "ak 47",
	'8' : "aug",
	'9' : "awp",
	'10' : "famas",
	'11' : "g3sg1",
	'13' : "galil ar",
	'14' : "m249",
	'16' : "m4a4",
	'17' : "mac 10",
	'19' : "p90",
	'23' : "mp5 sd",
	'24' : "ump 45",
	'25' : "xm1014",
	'26' : "pp bizon",
	'27' : "mag 7",
	'28' : "negev",
	'29' : "sawed off",
	'30' : "tec 9",
	'31' : "zeus x27",
	'32' : "p2000",
	'33' : "mp7",
	'34' : "mp9",
	'35' : "nova",
	'36' : "p250",
	'38' : "scar 20",
	'39' : "sg 553",
	'40' : "ssg 08",
	'41' : "knife",
	'42' : "knife",
	'43' : "flashbang",
	'44' : "high explosive grenade",
	'45' : "smoke grenade",
	'46' : "molotov",
	'47' : "decoy grenade",
	'48' : "incendiary grenade",
	'49' : "c4 explosive",
	'59' : "knife",
	'60' : "m4a1 s",
	'61' : "usp s",
	'63' : "cz75 auto",
	'64' : "r8 revolver",
	'500' : "bayonet",
	'505' : "flip knife",
	'506' : "gut knife",
	'507' : "karambit",
	'508' : "m9 bayonet",
	'509' : "huntsman knife",
	'512' : "falchion knife",
	'514' : "bowie knife",
	'515' : "butterfly knife",
	'516' : "shadow daggers",
	'519' : "ursus knife",
	'520' : "knife",
	'522' : "stiletto knife",
	'523' : "knife",
	'524' : "knife"
}//全语言支持
function player_weapon_name(wep_id) {
	var weapon = Entity.GetProp(wep_id, "CBaseAttributableItem", "m_iItemDefinitionIndex") & 0xFFFF;
	if (wep2name[weapon] == undefined) {
		var weapon = "59"
	}
	return wep2name[weapon]
}
//hitmissball
var real_hitpercent = 0.0;
var display_hitpercent = 0.0;
var ball_hit = 0;
var ball_total = 0;
var hitpersent_flags = [];
var ball_step = 0;

function ball_Draw () {
    var is_ball_open = UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Hit/miss ball"]);
    if(UI.IsMenuOpen()){
        if(UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings" ])==0){
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball X" ],is_ball_open?1:0);
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y" ],is_ball_open?1:0);
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Theme Color" ],is_ball_open?1:0);
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Back color" ],is_ball_open?1:0);
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Inner Radius" ],is_ball_open?1:0);
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Radius" ],is_ball_open?1:0);
        }else{
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball X" ],0);
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y" ],0);
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Theme Color" ],0);
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Back color" ],0);
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Inner Radius" ],0);
            UI.SetEnabled([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Radius" ],0);
        }
    }
    if(World.GetServerString()&&UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Hit/miss ball"])){
        var ball_radius = UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Radius"]);
        var ball_innerradius = UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Inner Radius"]);
        var ThemeColor = UI.GetColor([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Theme Color"]);
        var BackColor = UI.GetColor([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Back color"]);
        var font_2 = Render.GetFont("segoeuib.ttf", 18, true);
        Render.String(UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"]) + 3, UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"]) - 12, 1, (real_hitpercent * 100).toFixed(1).toString() + "%", [255, 255, 255, 255], font_2);
        Render.String(UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"]) - 130+(70-ball_radius)/2, UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"]) - 49, 1, "Misses: " + (ball_total - ball_hit).toString(), [25, 25, 25, 255], font_2);
        Render.String(UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"]) +110-(70-ball_radius)/2, UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"]) - 49, 1, "Hits: " + ball_hit.toString(), [25, 25, 25, 255], font_2);
        Render.String(UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"]), UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"]) + ball_radius+13, 1, "Total: " + ball_total.toString(), [25, 25, 25, 255], font_2);
        Render.String(UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"]) - 130+(70-ball_radius)/2, UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"]) - 50, 1, "Misses: " + (ball_total - ball_hit).toString(), [255, 255, 255, 255], font_2);
        Render.String(UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"]) +110-(70-ball_radius)/2, UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"]) - 50, 1, "Hits: " + ball_hit.toString(), [255, 255, 255, 255], font_2);
        Render.String(UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"]), UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"]) + ball_radius+12, 1, "Total: " + ball_total.toString(), [255, 255, 255, 255], font_2);
        render_arc(UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"]), UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"]), ball_radius, ball_innerradius, 0, 360, 200, BackColor);
    
        if (display_hitpercent < real_hitpercent) {
        ball_step = 0.008;
        display_hitpercent += ball_step;
        }
        render_arc(UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"]), UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"]), ball_radius, ball_innerradius, -90, display_hitpercent * 100 * 3.6, 200, ThemeColor);
        if (Global.IsKeyPressed(1) && UI.IsMenuOpen()) {
            const mouse_pos = Global.GetCursorPosition();
            if (in_bounds(mouse_pos, UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"])-ball_radius, UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"])-ball_radius, UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"])+ball_radius, UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"])+ball_radius)) {
                UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals" , "[Hit/Miss]Ball X"], mouse_pos[0] - 30);
                UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[Hit/Miss]Ball Y"], mouse_pos[1] - 20);
            }
        }
    }
}
function ball_ragebot_fire(){
  ball_total++;
  real_hitpercent = (ball_hit / ball_total).toFixed(3);
  display_hitpercent = 0
  ball_step = 0;
}
function ball_player_hurt(){
    if (Entity.GetEntityFromUserID(Event.GetInt('attacker')) == Entity.GetLocalPlayer()) {
      ball_hit++
      if(ball_hit>ball_total) ball_hit=ball_total;
      real_hitpercent = (ball_hit / ball_total).toFixed(3);
  }
}
//new ind
var ind_alpha = 0;
var number_add = 0;
var text_colors = [255,255,255,255];
function indicator_new(){
    avatar = Render.AddTexture("ot/scripts/tx.jpg");
    var ind_type = UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind","Indicator main type"]);
    const ticks = script.shared.choke_history;
    var frames = 8 * Globals.Frametime();
    var ind_font = Render.GetFont("Verdana.ttf", 11, true);
    var ind_alpha_ground = UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind","Background alpha"]);
    var ind_x = UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind","indicator new x"]);
    var ind_y = UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind","indicator new y"]);
    var fake_limit = (Globals.ChokedCommands() / Math.max(UI.GetValue(["Rage", "Fake Lag", "Limit"]), 3)) * UI.GetValue(["Rage", "Fake Lag", "Limit"]);
    var local_real = Math.abs(Local.GetRealYaw());
	var local_fake = Math.abs(Local.GetFakeYaw());
	var desync_delta = Math.min((local_fake > local_real) ? ((local_fake - local_real) / 2) : ((local_real - local_fake) / 2), 58).toFixed(1);
    var desync_safety = Math.min(Math.round(1.7 * Math.abs(desync_delta)), 100);
    //纯文字指示器测试
    var pure_number = 0;
    //nemesis-like
    var nemesis_number = 0;
    if(UI.IsMenuOpen()){
        switch(ind_type){
            case 0:
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background alpha"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "[Holo]Color style"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "[Holo]Theme Color"], 0);

                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Fakelag"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Desync yaw"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Weapon info"], 0);

                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Theme color"], 0);

                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "indicator new x"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "indicator new y"], 0);

                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Advanced info"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Font size"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Custom text"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Custom text color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Weapon color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Text options"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background color override"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Sign type"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Pure text y"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Pure text x"], 0);
                break;
            case 1:
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "[Holo]Color style"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "[Holo]Theme Color"], (UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "[Holo]Color style"])==1)?0:1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background alpha"], 1);

                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Fakelag"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Desync yaw"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Weapon info"], 0);

                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "indicator new x"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "indicator new y"], 0);

                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Advanced info"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Font size"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Custom text"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Theme color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Custom text color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Weapon color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Text options"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background color override"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Sign type"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Pure text y"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Pure text x"], 0);
                break;
            case 2:
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background alpha"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "[Holo]Color style"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "[Holo]Theme Color"], 0);

                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Fakelag"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Desync yaw"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Weapon info"], 1);

        
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Advanced info"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Sign type"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Custom text"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Font size"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Theme color"], (UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Text options"])==1)?1:0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Custom text color"], (UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Text options"])==1)?1:0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Weapon color"], (UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Text options"])==1)?1:0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Text options"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar color"], (UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"]))?1:0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background color override"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background color"], (UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Background color override"]))?1:0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "indicator new x"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "indicator new y"], 0);

                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Pure text x"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Pure text y"], 1);
                break;
            case 3:
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background alpha"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "[Holo]Color style"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "[Holo]Theme Color"], 0);

                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Fakelag"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Desync yaw"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Weapon info"], 0);


                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "indicator new x"], 1);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "indicator new y"], 1);

                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Advanced info"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Font size"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Custom text"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Theme color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Custom text color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Weapon color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Text options"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background color override"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Background color"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Sign type"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Pure text y"], 0);
                UI.SetEnabled(["Visuals", "NightMare Newind", "NightMare Newind", "Pure text x"], 0);
                break;
        }
    }
    switch(ind_type){
        case 1:
            if (Entity.IsAlive(Entity.GetLocalPlayer())) {
                var osaa_text = "",osaa_color = [];
                var ind_font = Render.GetFont("verdana.ttf",9,true);
                var ind_fontbig = Render.GetFont("verdana.ttf",11,true);
                var ind_fontcir = Render.GetFont("verdana.ttf",5,true);
                var re_theme_color = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Color method"]);
                var ind_color_top = (re_theme_color==0||re_theme_color==1)?UI.GetColor([ "Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Color picker" ]):rainbow(Global.Tickcount() % 350 / 350, 1, 1, 1, 255);
                var ind_color = (UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "[Holo]Color style"])==0)?UI.GetColor([ "Visuals", "NightMare Newind", "NightMare Newind", "[Holo]Theme Color" ]):ind_color_top;
                var velocity = vec_length_2d(Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_vecVelocity[0]"));
                var ix = screen_size[0] / 2 + 140 - 0.16 * velocity;
                var iy = screen_size[1] / 2 + 90 - 0.10 * velocity;
                var is_inair = Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_flFallVelocity");
                var is_hsaa = UI.GetValue(["Rage","Exploits","Keys","Hide shots"]);
                if(is_hsaa){
                  osaa_text = "ON";
                  osaa_color = [119,249,55,255];
                }else{
                  osaa_text = "OFF";
                  osaa_color = [255,0,0,255];
                }
                if (is_inair < -1 || is_inair > 1) iy -= 3
                Render.Line(screen_size[0] / 2, screen_size[1] / 2, ix, iy, [255, 255, 255, 180]);
                Render.FilledCircle(screen_size[0] / 2, screen_size[1] / 2, 3, [255, 255, 255, 255]);
              
                Render.FilledRect(ix, iy, 196, 57, [35,35,35,UI.GetValue([ "Visuals", "NightMare Newind", "NightMare Newind", "Background alpha" ])]);
                render_arc(ix + 172, iy + 20,10,8,270,360,50,[25,25,25,255]);
                render_arc(ix + 172, iy + 20,10,8,270,desync_safety*6,50,ind_color);
                switch(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Theme style"])){
                    case 0:
                        if(re_theme_color==0){
                            Render.FilledRect(ix, iy, 196, 2, ind_color_top );
                        }else{
                            Render.GradientRect( ix, iy, 196, 2, 1, [ ind_color_top[0], ind_color_top[1], ind_color_top[2], 255 ], [ ind_color_top[2], ind_color_top[0], ind_color_top[1], 255 ]);
                        }
                        break;
                    case 1:
                        if(re_theme_color==0){
                            Render.FilledRect(ix, iy, 196, 2, ind_color_top );
                        }else{
                            Render.GradientRect( ix, iy, 196, 2, 1, [ ind_color_top[0], ind_color_top[1], ind_color_top[2], 255 ], [ ind_color_top[2], ind_color_top[0], ind_color_top[1], 255 ]);
                        }
                        break;
                    case 2:
                        if(re_theme_color==0){
                            Render.FilledRect(ix, iy, 196, 2, ind_color_top );
                            Render.FilledRect(ix+196, iy, 2, 57, ind_color_top );
                            Render.FilledRect(ix, iy, 2, 57, ind_color_top );
                            Render.FilledRect(ix, iy+57, 198, 2, ind_color_top );
                        }else{
                            Render.GradientRect(ix, iy, 98, 2, 1, [ind_color_top[0], ind_color_top[1], ind_color_top[2], 255], [ind_color_top[0], ind_color_top[2], ind_color_top[1], 255])
                            Render.GradientRect(ix+98, iy, 98, 2, 1, [ind_color_top[0], ind_color_top[2], ind_color_top[1], 255], [ind_color_top[2], ind_color_top[1], ind_color_top[0], 255])
                            Render.GradientRect(ix, iy, 2, 57, 0, [ind_color_top[0], ind_color_top[1], ind_color_top[2], 255], [ind_color_top[1], ind_color_top[0], ind_color_top[2], 255])
                            Render.GradientRect(ix+196, iy, 2, 57, 0, [ind_color_top[2], ind_color_top[1], ind_color_top[0], 255], [ind_color_top[1], ind_color_top[0], ind_color_top[2], 255])
                            Render.GradientRect(ix, iy+57, 99, 2, 1, [ind_color_top[1], ind_color_top[0], ind_color_top[2], 255], [ind_color_top[2], ind_color_top[1], ind_color_top[0], 255])
                            Render.GradientRect(ix+99, iy+57, 99, 2, 1, [ind_color_top[2], ind_color_top[1], ind_color_top[0], 255], [ind_color_top[1], ind_color_top[0], ind_color_top[2], 255])
                        }
                        break;
                    case 3:
                        if(re_theme_color==0){
                            Render.FilledRect(ix, iy, 196, 2, ind_color_top );
                        }else{
                            Render.GradientRect( ix, iy, 196, 2, 1, [ ind_color_top[0], ind_color_top[1], ind_color_top[2], 255 ], [ ind_color_top[2], ind_color_top[0], ind_color_top[1], 255 ]);
                        }
                        break;
                }
                // Render.FilledRect(ix, iy, 190, 3, UI.GetColor([ "Visuals", "Indicator","Indicator", "SKEET:IND TitleBar Color" ] ));
                Render.String(ix + 8, iy + 5, 0, "NIGHTMARE ANTI-AIM", [0, 0, 0, 255], ind_font);
                Render.String(ix + 7, iy + 5, 0, "NIGHTMARE ANTI-AIM", [255, 255, 255, 255], ind_font);
                Render.GradientRect(ix + 8, iy + 22+(9-desync_safety*0.15), 2, desync_safety*0.15, 0, [255 - 4.25 * desync_safety, 4.25 * desync_safety, 0, 0], [255 - 4.25 * desync_safety, 4.25 * desync_safety, 0, 255]);
                Render.GradientRect(ix + 8, iy + 31-1, 2, desync_safety*0.15, 0, [255 - 4.25 * desync_safety, 4.25 * desync_safety, 0, 255], [255 - 4.25 * desync_safety, 4.25 * desync_safety, 0, 0]);
                Render.String(ix + 15, iy + 22, 0, "FAKE (" + desync_safety.toString(), [0, 0, 0, 255], ind_fontbig);
                Render.String(ix + 14, iy + 22, 0, "FAKE (" + desync_safety.toString(), [255, 255, 255, 255], ind_fontbig);
                
                Render.String(ix + 14 + Render.TextSize("FAKE (" + desync_safety.toString(), ind_fontbig)[0], iy + 22, 0, "o", [255, 255, 255, 255], ind_fontcir);
                Render.String(ix + 15 + Render.TextSize("FAKE (" + desync_safety.toString(), ind_fontbig)[0] + 5, iy + 22, 0, ")", [0,0,0, 255], ind_fontbig);
                Render.String(ix + 14 + Render.TextSize("FAKE (" + desync_safety.toString(), ind_fontbig)[0] + 5, iy + 22, 0, ")", [255, 255, 255, 255], ind_fontbig);
            
                Render.String(ix + 16, iy + 40, 0, "SP:", [0, 0, 0, 255], ind_font);
                Render.String(ix + 15, iy + 40, 0, "SP:", [255, 255, 255, 255], ind_font);
                Render.FilledRect(ix + 20+Render.TextSize("SP:",ind_font)[0], iy + 44, 43, 6, [25,25,25,255]);
                Render.FilledRect(ix + 21+Render.TextSize("SP:",ind_font)[0], iy + 45, (UI.GetValue(["Rage","Fake Lag","Fake Lag","Limit"])>14?14:UI.GetValue(["Rage","Fake Lag","Fake Lag","Limit"])) * 3, 4, ind_color);
                Render.FilledRect(ix + 84, iy + 44, 43, 6, [25,25,25,255]);
                Render.FilledRect(ix + 85, iy + 45, (desync_safety>60?60:desync_safety) * 0.7, 4, ind_color);
            
                Render.String(ix + 136, iy + 40, 0, "OSAA:", [255, 255, 255, 255], ind_font);
                Render.String(ix + 137+Render.TextSize("OSAA:",ind_font)[0], iy + 40, 0, osaa_text, osaa_color, ind_font);
              }
            break;
        case 2:
            if(Entity.IsAlive(Entity.GetLocalPlayer())){
                var font_size = UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind","Font size"]);
                var text_font = Render.GetFont("Calibrib.ttf", font_size, true);
                var text_y = UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind","Pure text y"]);
                var text_x = UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind","Pure text x"]);
                var sign_text;
                var bg_color,bar_color,theme_c,wep_c,custom_c;
                var custom_text = UI.GetString(["Visuals", "NightMare Newind", "NightMare Newind", "Custom text"]);
                if(custom_text=="") custom_text = "Nightmare.pub"
                if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Text options"])==1){
                    theme_c = UI.GetColor(["Visuals", "NightMare Newind", "NightMare Newind", "Theme color"])
                    custom_c = UI.GetColor(["Visuals", "NightMare Newind", "NightMare Newind", "Custom text color"])
                    wep_c = UI.GetColor(["Visuals", "NightMare Newind", "NightMare Newind", "Weapon color"])
                }else{
                    theme_c = [255,255,255,255]
                    wep_c = [255,255,255,255]
                    custom_c = [255,255,255,255]
                }
                if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"])) bar_color = UI.GetColor(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar color"])
                if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Background color override"])) bg_color = UI.GetColor(["Visuals", "NightMare Newind", "NightMare Newind", "Background color"])
                else bg_color = [17,17,17,ind_alpha_ground];
                if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Sign type"])==0) sign_text = ": ";
                else sign_text = "-> ";
                if(custom_text!=""){
                    var custom_text_size = Render.TextSize( custom_text, text_font );
                    pure_number+=1;
                    Render.GradientRect( 10+text_x, text_y, custom_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], 0 ], [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ]);
                    Render.GradientRect( 10+text_x+custom_text_size[0]/2, text_y, custom_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ], [ bg_color[0],bg_color[1],bg_color[2], 0 ]);
                    if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"])){
                        Render.GradientRect( 10+text_x, text_y-2, custom_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+custom_text_size[0]/2, text_y-2, custom_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                        Render.GradientRect( 10+text_x, text_y+custom_text_size[1], custom_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+custom_text_size[0]/2, text_y+custom_text_size[1], custom_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                    }
                    Render.String(10+text_x, text_y+4,0, custom_text, [25, 25, 25,255], text_font);
                    Render.String(10+text_x, text_y+2,0, custom_text, custom_c, text_font);
                }
                if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind","Fakelag"])){
                    var fl_text_size = Render.TextSize( "FL "+sign_text+ticks[0] + " - " + ticks[1] + " - " + ticks[2], text_font )
                    Render.GradientRect( 10+text_x, text_y+pure_number*50, fl_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], 0 ], [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ]);
                    Render.GradientRect( 10+text_x+fl_text_size[0]/2, text_y+pure_number*50, fl_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ], [ bg_color[0],bg_color[1],bg_color[2], 0 ]);
                    if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"])){
                        Render.GradientRect( 10+text_x, text_y-2+pure_number*50, fl_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+fl_text_size[0]/2, text_y-2+pure_number*50, fl_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                        Render.GradientRect( 10+text_x, text_y+fl_text_size[1]+pure_number*50, fl_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+fl_text_size[0]/2, text_y+fl_text_size[1]+pure_number*50, fl_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                    }
                    Render.String(10+text_x, text_y+4+pure_number*50,0, "FL "+sign_text+ticks[0] + " - " + ticks[1] + " - " + ticks[2], [25, 25, 25,255], text_font);
                    Render.String(10+text_x, text_y+2+pure_number*50,0, "FL "+sign_text+ticks[0] + " - " + ticks[1] + " - " + ticks[2], theme_c, text_font);
                    pure_number+=1;
                }
                if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind","Desync yaw"])){
                    var yaw_text_size = Render.TextSize( "Desync "+sign_text+desync_safety+"%", text_font )
                    Render.GradientRect( 10+text_x, text_y+pure_number*50, yaw_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], 0 ], [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ]);
                    Render.GradientRect( 10+text_x+yaw_text_size[0]/2, text_y+pure_number*50, yaw_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ], [ bg_color[0],bg_color[1],bg_color[2], 0 ]);
                    if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"])){
                        Render.GradientRect( 10+text_x, text_y-2+pure_number*50, yaw_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+yaw_text_size[0]/2, text_y-2+pure_number*50, yaw_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                        Render.GradientRect( 10+text_x, text_y+yaw_text_size[1]+pure_number*50, yaw_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+yaw_text_size[0]/2, text_y+yaw_text_size[1]+pure_number*50, yaw_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                    }
                    Render.String(10+text_x, text_y+4+pure_number*50,0, "Desync "+sign_text+desync_safety+"%", [25,25,25,255], text_font);
                    Render.String(10+text_x, text_y+2+pure_number*50,0, "Desync "+sign_text+desync_safety+"%", theme_c, text_font);
                    pure_number+=1;
                }
                if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind","Weapon info"])){
                    var me = Entity.GetLocalPlayer();
                    var weapon = Entity.GetWeapon(me);
                    var wep_ral_name = player_weapon_name(weapon)
                    var pure_name,pure_dmg,pure_fov,pure_htc;
                    if(wCategory.hasOwnProperty(wep_ral_name)){
                        pure_name = wCategory[wep_ral_name];
                        pure_fov = UI.GetValue(["Rage", "Target", wCategory[wep_ral_name], "Field of view"]);
                        pure_htc = UI.GetValue(["Rage", "Accuracy", wCategory[wep_ral_name], "Hitchance"]);
                        if (UI.GetValue(["Rage", "General", "General", "Key assignment", "Damage override"])) {
                            if (UI.GetValue(["Rage", "Overrides", wCategory[wep_ral_name], "Minimum damage (on key)"]) != 0) {
                                pure_dmg = UI.GetValue(["Rage", "Overrides", wCategory[wep_ral_name], "Minimum damage (on key)"])
                            } else {
                                pure_dmg = UI.GetValue(["Rage", "Overrides", "General" ,"Minimum damage (on key)"])
                            }
                        } else {
                            if (UI.GetValue(["Rage", "Target", wCategory[wep_ral_name], "Hitboxes"]) != 0) {
                                pure_dmg = UI.GetValue(["Rage", "Target", wCategory[wep_ral_name], "Minimum damage"])
                            } else {
                                pure_dmg = UI.GetValue(["Rage", "Target", "Minimum damage"])
                            }
                        }
                    }else{
                        pure_name = "Global";
                        pure_fov = UI.GetValue(["Rage", "Target", "General", "Field of view"]);
                        pure_dmg = UI.GetValue(["Rage", "Target","General", "Minimum damage"])
                        pure_htc = UI.GetValue(["Rage", "Accuracy", "General", "Hitchance"]);
                    }
                    var wep_text_size = Render.TextSize( "Weapon "+sign_text+pure_name, text_font )
                    var fov_text_size = Render.TextSize( "FOV "+sign_text+pure_fov, text_font )
                    var dmg_text_size = Render.TextSize( "DMG "+sign_text+pure_dmg, text_font )
                    var htc_text_size = Render.TextSize( "HTC "+sign_text+pure_htc+"%", text_font )
    
                    Render.GradientRect( 10+text_x, text_y+pure_number*50, wep_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], 0 ], [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ]);
                    Render.GradientRect( 10+text_x+wep_text_size[0]/2, text_y+pure_number*50, wep_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ], [ bg_color[0],bg_color[1],bg_color[2], 0 ]);
                    if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"])){
                        Render.GradientRect( 10+text_x, text_y-2+pure_number*50, wep_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+wep_text_size[0]/2, text_y-2+pure_number*50, wep_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                        Render.GradientRect( 10+text_x, text_y+wep_text_size[1]+pure_number*50, wep_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+wep_text_size[0]/2, text_y+wep_text_size[1]+pure_number*50, wep_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                    }
                    Render.String(10+text_x, text_y+4+pure_number*50,0, "Weapon "+sign_text+pure_name, [25,25,25,255], text_font);
                    Render.String(10+text_x, text_y+2+pure_number*50,0, "Weapon "+sign_text+pure_name, wep_c, text_font);
                    pure_number+=1;
                    Render.GradientRect( 10+text_x, text_y+pure_number*50, fov_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], 0 ], [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ]);
                    Render.GradientRect( 10+text_x+fov_text_size[0]/2, text_y+pure_number*50, fov_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ], [ bg_color[0],bg_color[1],bg_color[2], 0 ]);
                    if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"])){
                        Render.GradientRect( 10+text_x, text_y-2+pure_number*50, fov_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+fov_text_size[0]/2, text_y-2+pure_number*50, fov_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                        Render.GradientRect( 10+text_x, text_y+fov_text_size[1]+pure_number*50, fov_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+fov_text_size[0]/2, text_y+fov_text_size[1]+pure_number*50, fov_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                    }
                    Render.String(10+text_x, text_y+4+pure_number*50,0, "FOV "+sign_text+pure_fov, [25,25,25,255], text_font);
                    Render.String(10+text_x, text_y+2+pure_number*50,0, "FOV "+sign_text+pure_fov, wep_c, text_font);
                    pure_number+=1;
                    Render.GradientRect( 10+text_x, text_y+pure_number*50, dmg_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], 0 ], [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ]);
                    Render.GradientRect( 10+text_x+dmg_text_size[0]/2, text_y+pure_number*50, dmg_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ], [ bg_color[0],bg_color[1],bg_color[2], 0 ]);
                    if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"])){
                        Render.GradientRect( 10+text_x, text_y-2+pure_number*50, dmg_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+dmg_text_size[0]/2, text_y-2+pure_number*50, dmg_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                        Render.GradientRect( 10+text_x, text_y+dmg_text_size[1]+pure_number*50, dmg_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+dmg_text_size[0]/2, text_y+dmg_text_size[1]+pure_number*50, dmg_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                    }
                    Render.String(10+text_x, text_y+4+pure_number*50,0, "DMG "+sign_text+pure_dmg, [25,25,25,255], text_font);
                    Render.String(10+text_x, text_y+2+pure_number*50,0, "DMG "+sign_text+pure_dmg, wep_c, text_font);
                    pure_number+=1;
                    Render.GradientRect( 10+text_x, text_y+pure_number*50, htc_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], 0 ], [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ]);
                    Render.GradientRect( 10+text_x+htc_text_size[0]/2, text_y+pure_number*50, htc_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ], [ bg_color[0],bg_color[1],bg_color[2], 0 ]);
                    if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"])){
                        Render.GradientRect( 10+text_x, text_y-2+pure_number*50, htc_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+htc_text_size[0]/2, text_y-2+pure_number*50, htc_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                        Render.GradientRect( 10+text_x, text_y+htc_text_size[1]+pure_number*50, htc_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+htc_text_size[0]/2, text_y+htc_text_size[1]+pure_number*50, htc_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                    }
                    Render.String(10+text_x, text_y+4+pure_number*50,0, "HTC "+sign_text+pure_htc+"%", [25,25,25,255], text_font);
                    Render.String(10+text_x, text_y+2+pure_number*50,0, "HTC "+sign_text+pure_htc+"%", wep_c, text_font);
                    pure_number+=1;
                }
                if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Advanced info"])){
                    var dt_status,hs_status;
                    if(UI.GetValue(["Rage", "Exploits", "Keys", "Double tap"])) dt_status = "On";
                    else dt_status = "Off"
                    if(UI.GetValue(["Rage", "Exploits", "Keys", "Hide shots"])) hs_status = "On"
                    else hs_status = "Off"
                    var adv_text_size = Render.TextSize( "D "+sign_text+dt_status+"&"+"H "+sign_text+hs_status, text_font );
                    var hit_text_size = Render.TextSize(ball_hit+"/"+ball_total+"("+(real_hitpercent * 100).toFixed(1).toString()+"%"+")",text_font);
                    Render.GradientRect( 10+text_x, text_y+pure_number*50, hit_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], 0 ], [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ]);
                    Render.GradientRect( 10+text_x+hit_text_size[0]/2, text_y+pure_number*50, hit_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ], [ bg_color[0],bg_color[1],bg_color[2], 0 ]);
                    if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"])){
                        Render.GradientRect( 10+text_x, text_y-2+pure_number*50, hit_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+hit_text_size[0]/2, text_y-2+pure_number*50, hit_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                        Render.GradientRect( 10+text_x, text_y+hit_text_size[1]+pure_number*50, hit_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+hit_text_size[0]/2, text_y+hit_text_size[1]+pure_number*50, hit_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                    }
                    Render.String(10+text_x, text_y+4+pure_number*50,0, ball_hit+"/"+ball_total+"("+(real_hitpercent * 100).toFixed(1).toString()+"%"+")", [25,25,25,255], text_font);
                    Render.String(10+text_x, text_y+2+pure_number*50,0, ball_hit+"/"+ball_total+"("+(real_hitpercent * 100).toFixed(1).toString()+"%"+")", [200,200,200,255], text_font);
                    pure_number+=1;
                    Render.GradientRect( 10+text_x, text_y+pure_number*50, adv_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], 0 ], [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ]);
                    Render.GradientRect( 10+text_x+adv_text_size[0]/2, text_y+pure_number*50, adv_text_size[0]/2, 35, 1, [ bg_color[0],bg_color[1],bg_color[2], ind_alpha_ground ], [ bg_color[0],bg_color[1],bg_color[2], 0 ]);
                    if(UI.GetValue(["Visuals", "NightMare Newind", "NightMare Newind", "Addon bar"])){
                        Render.GradientRect( 10+text_x, text_y-2+pure_number*50, adv_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+adv_text_size[0]/2, text_y-2+pure_number*50, adv_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                        Render.GradientRect( 10+text_x, text_y+adv_text_size[1]+pure_number*50, adv_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 0 ], [ bar_color[0],bar_color[1],bar_color[2], 255 ]);
                        Render.GradientRect( 10+text_x+adv_text_size[0]/2, text_y+adv_text_size[1]+pure_number*50, adv_text_size[0]/2, 2, 1, [ bar_color[0],bar_color[1],bar_color[2], 255 ], [ bar_color[0],bar_color[1],bar_color[2], 0 ]);
                    }
                    Render.String(10+text_x, text_y+4+pure_number*50,0, "D "+sign_text+dt_status+"&"+"H "+sign_text+hs_status, [25,25,25,255], text_font);
                    Render.String(10+text_x, text_y+2+pure_number*50,0, "D "+sign_text+dt_status+"&"+"H "+sign_text+hs_status, theme_c, text_font);
                    pure_number+=1;
                }
            }
            break;
        case 3:
            var mordern_font = Render.GetFont("seguisb.ttf", 14, true);
            var mordern_font_nor = Render.GetFont("seguisb.ttf", 10, true);
            var neme_font = Render.GetFont("smallest_pixel-7.ttf",18,false);
            var re_theme_cset = UI.GetColor( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Color picker"] );
            var re_theme_color = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Color method"]);
            var solus_color = (re_theme_color==0||re_theme_color==1)?re_theme_cset:rainbow(Global.Tickcount() % 350 / 350, 1, 1, 1, 255);
            var re_theme_type = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Theme style"]);
            var neme_font_smll = Render.GetFont("lucon.ttf",10,true);
            var darw_font_smll = Render.GetFont("verdana.ttf",10,true);
            var local_vel_length = vec_length_2d(Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_vecVelocity[0]"));
            if(Entity.IsAlive(Entity.GetLocalPlayer())){
                Render.FilledRect( ind_x, ind_y+2, 126, 22, [ 39, 39, 39, 180 ] );//中部
                Render.GradientRect( ind_x+1, ind_y+3, 62, 2, 1,[ solus_color[0], solus_color[1], solus_color[2], 255 ],[ solus_color[0], solus_color[2], solus_color[1], 255 ] );
                Render.GradientRect( ind_x+63, ind_y+3, 62, 2, 1,[ solus_color[0], solus_color[2], solus_color[1], 255 ],[ solus_color[2], solus_color[1], solus_color[0], 255 ] );
                Render.GradientRect( ind_x+1, ind_y+5, 1, 19, 0,[ solus_color[0], solus_color[1], solus_color[2], 255 ],[ solus_color[0], solus_color[2], solus_color[1], 0 ] );
                Render.GradientRect( ind_x+124, ind_y+5, 1, 19, 0,[ solus_color[2], solus_color[1], solus_color[0], 255 ],[ solus_color[0], solus_color[2], solus_color[1], 0 ] );
                Render.String(ind_x+(Render.TextSize("Indicators",neme_font_smll)[0])/2+3, ind_y+9,0, "Indicators", [255,255,255,255], neme_font_smll);
                Render.String(ind_x+3, ind_y+24,0, "Fake yaw", [255,255,255,255], darw_font_smll);
                Render.String(ind_x+3, ind_y+36,0, "Fake lag", [255,255,255,255], darw_font_smll);
                Render.String(ind_x+3, ind_y+48,0, "Velocity", [255,255,255,255], darw_font_smll);
                Render.FilledRect( ind_x+59, ind_y+29, 64, 7, [ 25, 25, 25, 255 ] );//中部
                Render.FilledRect( ind_x+59, ind_y+41, 64, 7, [ 25, 25, 25, 255 ] );//中部
                Render.FilledRect( ind_x+59, ind_y+53, 64, 7, [ 25, 25, 25, 255 ] );//中部
                Render.GradientRect( ind_x+60, ind_y+30, desync_delta*1.03, 5, 1,[ solus_color[0], solus_color[2], solus_color[1], 255 ],[ solus_color[2], solus_color[1], solus_color[0], 255 ] );
                Render.GradientRect( ind_x+60, ind_y+42, fake_limit>14?62:fake_limit*4.428571428571429, 5, 1,[ solus_color[0], solus_color[2], solus_color[1], 255 ],[ solus_color[2], solus_color[1], solus_color[0], 255 ] );
                Render.GradientRect( ind_x+60, ind_y+54, local_vel_length>400?62:local_vel_length*0.155, 5, 1,[ solus_color[0], solus_color[2], solus_color[1], 255 ],[ solus_color[2], solus_color[1], solus_color[0], 255 ] );
            }
            if (Global.IsKeyPressed(1) && UI.IsMenuOpen()) {
                const mouse_pos = Global.GetCursorPosition();
                if (in_bounds(mouse_pos, ind_x, ind_y+2, ind_x +126, ind_y+80)) {
                    UI.SetValue(["Visuals", "NightMare Newind", "NightMare Newind","indicator new x"], mouse_pos[0] - 30);
                    UI.SetValue(["Visuals", "NightMare Newind", "NightMare Newind","indicator new y"], mouse_pos[1] - 20);
                }
            }
            if(!Entity.IsAlive(Entity.GetLocalPlayer())){
                ind_alpha = ind_alpha - frames;
                if (ind_alpha < 0) ind_alpha = 0;
            }
        break;
    }
}


//NightMare Visuals
function misc_set(){
    var screensize = Render.GetScreenSize();
    var colors = rainbow(Global.Realtime() * UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Global]Gradient Speed"]), 1, 1,1,255);
    var is_rainbow_bar = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Misc]RainbowBar"]);
    var rainbow_type = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bar]color type"]);
    var pos_type = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bar]pos type"]);
    if(UI.IsMenuOpen()&&UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings" ])==2){
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bar]color type"], is_rainbow_bar?1:0);
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bar]pos type"], is_rainbow_bar?1:0);
    }else{
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bar]color type"], 0);
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bar]pos type"], 0);
    }
    if (is_rainbow_bar == 1) {
        switch(rainbow_type){
            case 0:
                if(pos_type==0){
                    Render.GradientRect(0, 0, screensize[0], 3, 1, colors, colors);
                    Render.GradientRect(0, 0, 3, screensize[1], 0, colors, colors);
                    Render.GradientRect(0, screensize[1] - 3, screensize[0], 3, 1, colors, colors);//g=0 b=1 r=2
                    Render.GradientRect(screensize[0] - 3, 0, 3, screensize[1], 0, colors, colors);
                }else{
                    Render.GradientRect(0, 0, screensize[0], 3, 1, colors, colors);
                }
                break;
            case 1:
                if(pos_type==0){
                    Render.GradientRect(0, 0, screensize[0], 3, 1, [colors[0], colors[1], colors[2], 255], [colors[2], colors[0], colors[1], 255]);
                    Render.GradientRect(0, 0, 3, screensize[1], 0, [colors[0], colors[1], colors[2], 255], [colors[2], colors[0], colors[1], 255]);
                    Render.GradientRect(0, screensize[1] - 3, screensize[0], 3, 1, [colors[2], colors[0], colors[1], 255], [colors[0], colors[1], colors[2], 255]);
                    Render.GradientRect(screensize[0] - 3, 0, 3, screensize[1], 0, [colors[2], colors[0], colors[1], 255], [colors[0], colors[1], colors[2], 255]);
                }else{
                    Render.GradientRect(0, 0, screensize[0], 3, 1, [colors[0], colors[1], colors[2], 255], [colors[2], colors[0], colors[1], 255]);
                }
                break;
        }
    }
    //zeus
    var font = Render.GetFont("Nightmare.ttf", 24, false);
    if(UI.IsMenuOpen()&&UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings" ])==2){
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Zeus]Warning type"], UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Misc]Zeus Warning"])?1:0);
    }else{
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Zeus]Warning type"], 0);
    }
    if (UI.GetValue(["Visuals","NightMare Visuals","NightMare Visuals","[Misc]Zeus Warning"])){
        var zeus_type = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Zeus]Warning type"]);
        var zeus_flash = Render.AddTexture("ot/scripts/zeus_icon_small.png");
        var plr = Entity.GetPlayers()
        for (i = 0; i < plr.length; i++)
        {
            if (Entity.IsEnemy(plr[i]) && Entity.IsAlive(plr[i]) && !Entity.IsDormant(plr[i]))
            {
                var local_dis = Entity.GetRenderOrigin( Entity.GetLocalPlayer() );
                var enemy_dis = Entity.GetRenderOrigin( plr[i] );
                var real_dis = getDistanceTo(local_dis, enemy_dis)
                var weps = Entity.GetWeapons( plr[i] )
                var bounds = Entity.GetRenderBox(plr[i])
                if (bounds[0] == 1){
                    if(real_dis<=560){
                        for(var j in weps){
                            if(Entity.GetName(weps[j])=='zeus x27'&&zeus_type==1) Render.String(bounds[1]-Render.TextSize("D",font)[0], bounds[2],0, "D", [255 ,255 ,0,255], font);
                            if(Entity.GetName(weps[j])=='zeus x27'&&zeus_type==0) Render.TexturedRect( bounds[1], bounds[2]-45, 50, 50, zeus_flash );;
                        }
                    } 
                }
            }
        }
    }
}
function draw_dmgoverride() {
    if(UI.IsMenuOpen()&&UI.GetValue([ "Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings" ])==2){
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Damage]indicator color"], UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]damage indicator"])?1:0);
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Damage]indicator text color"], UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]damage indicator"])?1:0);
    }else{
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Damage]indicator color"], 0);
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Damage]indicator text color"], 0);
    }
    if (UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]damage indicator"])) {
        var font = Render.GetFont("Verdana.ttf", 11, true);
        if (Entity.IsAlive(Entity.GetLocalPlayer())) {
            var color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Damage]indicator color"]);
            var tcolor = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Damage]indicator text color"]);
            var screenSize = Render.GetScreenSize();
            var weaponName = Entity.GetWeapon(Entity.GetLocalPlayer())
            var wep_ral_name = player_weapon_name(weaponName)
            if (wCategory.hasOwnProperty(wep_ral_name)) {
                var is_dmg_Override = UI.GetValue(["Rage", "General", "General", "Key assignment", "Damage override"]);
                renddmg1 = UI.GetValue(["Rage", "Overrides" , wCategory[wep_ral_name], "Minimum damage (on key)"]);
                renddmg2 = UI.GetValue(["Rage", "Overrides" , "General", "Minimum damage (on key)"]);
                renddmg3 = UI.GetValue(["Rage", "Target", wCategory[wep_ral_name], "Minimum damage"]);
                renddmg4 = UI.GetValue(["Rage", "Target", "General", "Minimum damage"]);
                if (is_dmg_Override) {
                    if (UI.GetValue(["Rage", "Overrides" , wCategory[wep_ral_name], "Minimum damage (on key)"]) != 0) {
                        render_arc(screenSize[0] / 2, screenSize[1] / 2, 14, 9, 180, 360, 50, [25, 25, 25, color[3]]);
                        render_arc(screenSize[0] / 2, screenSize[1] / 2, 14, 9, 180, (renddmg1 * 2.769), 50, color);
                        Render.String(screenSize[0] / 2 + 23, screenSize[1] / 2 + 6, 0, UI.GetValue(["Rage", "Overrides" ,  wCategory[wep_ral_name], "Minimum damage (on key)"]).toString(), [25, 25, 25, 255], font);
                        Render.String(screenSize[0] / 2 + 24, screenSize[1] / 2 + 7, 0, UI.GetValue(["Rage", "Overrides" ,  wCategory[wep_ral_name], "Minimum damage (on key)"]).toString(), tcolor, font);
                    } else {
                        render_arc(screenSize[0] / 2, screenSize[1] / 2, 14, 9, 180, 360, 50, [25, 25, 25, color[3]]);
                        render_arc(screenSize[0] / 2, screenSize[1] / 2, 14, 9, 180, (renddmg2 * 2.769), 50, color);
                        Render.String(screenSize[0] / 2 + 23, screenSize[1] / 2 + 6, 0, UI.GetValue(["Rage", "Overrides" ,  "Minimum damage (on key)"]).toString(), [25, 25, 25, 255], font);
                        Render.String(screenSize[0] / 2 + 24, screenSize[1] / 2 + 7, 0, UI.GetValue(["Rage", "Overrides" ,  "Minimum damage (on key)"]).toString(), tcolor, font);
                    }
                } else {
                    if (UI.GetValue(["Rage", "Target", wCategory[wep_ral_name], "Hitboxes"]) != 0) {
                        render_arc(screenSize[0] / 2, screenSize[1] / 2, 14, 9, 180, 360, 50, [25, 25, 25, color[3]]);
                        render_arc(screenSize[0] / 2, screenSize[1] / 2, 14, 9, 180, (renddmg3 * 2.769), 50, color);
                        Render.String(screenSize[0] / 2 + 23, screenSize[1] / 2 + 6, 0, UI.GetValue(["Rage", "Target", wCategory[wep_ral_name], "Minimum damage"]).toString(), [25, 25, 25, 255], font);
                        Render.String(screenSize[0] / 2 + 24, screenSize[1] / 2 + 7, 0, UI.GetValue(["Rage", "Target", wCategory[wep_ral_name], "Minimum damage"]).toString(), tcolor, font);
                    } else {
                        render_arc(screenSize[0] / 2, screenSize[1] / 2, 14, 9, 180, 360, 50, [25, 25, 25, color[3]]);
                        render_arc(screenSize[0] / 2, screenSize[1] / 2, 14, 9, 180, (renddmg4 * 2.769), 50, color);
                        Render.String(screenSize[0] / 2 + 23, screenSize[1] / 2 + 6, 0, UI.GetValue(["Rage", "Target", "General", "Minimum damage"]).toString(), [25, 25, 25, 255], font);
                        Render.String(screenSize[0] / 2 + 24, screenSize[1] / 2 + 7, 0, UI.GetValue(["Rage", "Target", "General", "Minimum damage"]).toString(), tcolor, font);
                    }
                }
            }
        }
    }
}
function in_bounds(vec, x, y, x2, y2) {
    return (vec[0] > x) && (vec[1] > y) && (vec[0] < x2) && (vec[1] < y2)
}
function get_states(path) {
    return UI.GetHotkeyState(path);
}
var solus_alpha = 0;
var max_width = 0;
var slow_walk_a = 0;
var fake_duck_a = 0;
var auto_peek_a = 0;
var desync_alpha = 0;
var safe_p_a = 0;
var force_body_a = 0;
var dt_alpha = 0;
var hs_alpha = 0;
var spec_alpha = 0;
var aw_alpha = 0;
var legit_alpha = 0;
var safety_alpha = 0;
var edge_alpha = 0;
var dmg_alpha = 0;
var box_alpha = 0;
var duck_alpha = 0;
var solus_key = new Array();
function solus_keybinds() {
    var is_keybinds_open = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[Theme]Keybinds"]);
    if(UI.IsMenuOpen()){
        if(is_keybinds_open&&UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==0){
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Keybinds x"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Keybinds y"], 1);
        }else{
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Keybinds x"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Keybinds y"], 0);
        }
    }
    if (!World.GetServerString()) return;

    var re_theme_type = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Theme style"]);
    var re_theme_color = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Color method"]);
    var re_theme_cset = UI.GetColor( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Color picker"] );
    var solus_keycolor = (re_theme_color==0||re_theme_color==1)?re_theme_cset:rainbow(Global.Tickcount() % 350 / 350, 1, 1, 1, 255);

    var key_x = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[Theme]Keybinds x"]);
    var key_y = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[Theme]Keybinds y"]);
    var font = Render.GetFont("lucon.ttf", 12, true);
    var key_font = Render.GetFont("verdana.ttf", 11, true);
    var draw_font = Render.GetFont("icons_new.ttf", 18, false);
    var new_font = Render.GetFont("Nightmare.ttf", 18, false);
    var mordern_font = Render.GetFont("seguisb.ttf", 14, true);
    var frames = 8 * Globals.Frametime();
    var solus_width = 75;
    var max_width = 0;
    
    
    

    // var solus_keycolor = (solus_type==0||solus_type==1)?UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals","Solid color"]):rainbow(Global.Tickcount() % 350 / 350, 1, 1, 1, 255);
    if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"])) {
        slow_walk_a = Math.min(slow_walk_a + frames, 1);
    } else {
        slow_walk_a = slow_walk_a - frames;
        if (slow_walk_a < 0) slow_walk_a = 0;
        if (slow_walk_a == 0) {
            solus_key.splice(solus_key.indexOf("Slow walk"));
        }
    }

    if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"])) {
        fake_duck_a = Math.min(fake_duck_a + frames, 1);
    } else {
        fake_duck_a = fake_duck_a - frames;
        if (fake_duck_a < 0) fake_duck_a = 0;
        if (fake_duck_a == 0) {
            solus_key.splice(solus_key.indexOf("Duck peek assist"));
        }
    }

    if (UI.GetValue(["Misc.", "Keys", "Auto peek"])) {
        auto_peek_a = Math.min(auto_peek_a + frames, 1);
    } else {
        auto_peek_a = auto_peek_a - frames;
        if (auto_peek_a < 0) auto_peek_a = 0;
        if (auto_peek_a == 0) {
            solus_key.splice(solus_key.indexOf("Auto peek"));
        }
    }

    if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
        desync_alpha = Math.min(desync_alpha + frames, 1);
    } else {
        desync_alpha = desync_alpha - frames;
        if (desync_alpha < 0) desync_alpha = 0;
        if (desync_alpha == 0) {
            solus_key.splice(solus_key.indexOf("Anti-aim inverter"));
        }
    }

    if (UI.GetValue(["Rage", "General", "General", "Key assignment", "Force safe point"])) {
        safe_p_a = Math.min(safe_p_a + frames, 1);
    } else {
        safe_p_a = safe_p_a - frames;
        if (safe_p_a < 0) safe_p_a = 0;
        if (safe_p_a == 0) {
            solus_key.splice(solus_key.indexOf("Safe point override"));
        }
    }

    if (UI.GetValue(["Rage", "General", "General", "Key assignment", "Force body aim"])) {
        force_body_a = Math.min(force_body_a + frames, 1);
    } else {
        force_body_a = force_body_a - frames;
        if (force_body_a < 0) force_body_a = 0;
        if (force_body_a == 0) {
            solus_key.splice(solus_key.indexOf("Force body aim"));
        }
    }

    if (UI.GetValue(["Rage", "Exploits", "Keys", "Double tap"])) {
        dt_alpha = Math.min(dt_alpha + frames, 1);
    } else {
        dt_alpha = dt_alpha - frames;
        if (dt_alpha < 0) dt_alpha = 0;
        if (dt_alpha == 0) {
            solus_key.splice(solus_key.indexOf("Double tap"));
        }
    }

    if (UI.GetValue(["Rage", "Exploits", "Keys", "Hide shots"])) {
        hs_alpha = Math.min(hs_alpha + frames, 1);
    } else {
        hs_alpha = hs_alpha - frames;
        if (hs_alpha < 0) hs_alpha = 0;
        if (hs_alpha == 0) {
            solus_key.splice(solus_key.indexOf("On shot anti-aim"));
        }
    }
    if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"])) {
        legit_alpha = Math.min(legit_alpha + frames, 1);
    } else {
        legit_alpha = legit_alpha - frames;
        if (legit_alpha < 0) legit_alpha = 0;
        if (legit_alpha == 0) {
            solus_key.splice(solus_key.indexOf("Legit Sway"));
        }
    }
    if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"])) {
        safety_alpha = Math.min(safety_alpha + frames, 1);
    } else {
        safety_alpha = safety_alpha - frames;
        if (safety_alpha < 0) safety_alpha = 0;
        if (safety_alpha == 0) {
            solus_key.splice(solus_key.indexOf("Safety legit peek"));
        }
    }
    if (UI.GetValue(["Misc.", "Keys", "Key assignment", "Edge jump"])) {
        edge_alpha = Math.min(edge_alpha + frames, 1);
    } else {
        edge_alpha = edge_alpha - frames;
        if (edge_alpha < 0) edge_alpha = 0;
        if (edge_alpha == 0) {
            solus_key.splice(solus_key.indexOf("Edge jump"));
        }
    }
    if (UI.GetValue(["Rage", "General", "General", "Key assignment", "Damage override"])) {
        dmg_alpha = Math.min(dmg_alpha + frames, 1);
    } else {
        dmg_alpha = dmg_alpha - frames;
        if (dmg_alpha < 0) dmg_alpha = 0;
        if (dmg_alpha == 0) {
            solus_key.splice(solus_key.indexOf("Damage override"));
        }
    }
    if(UI.GetValue(["Rage", "General", "General", "Key assignment", "Hitbox override"])) {
        box_alpha = Math.min(box_alpha + frames, 1);
    } else {
        box_alpha = box_alpha - frames;
        if (box_alpha < 0) box_alpha = 0;
        if (box_alpha == 0) {
            solus_key.splice(solus_key.indexOf("Hitbox override"));
        }
    }


    if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"])) {
        if (solus_key.indexOf("Slow walk") == -1)
            solus_key.push("Slow walk")
    }

    if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"])) {
        if (solus_key.indexOf("Duck peek assist") == -1)
            solus_key.push("Duck peek assist")
    }
    if (UI.GetValue(["Misc.", "Keys", "Auto peek"])) {
        if (solus_key.indexOf("Auto peek") == -1)
            solus_key.push("Auto peek")
    }
    if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])) {
        if (solus_key.indexOf("Anti-aim inverter") == -1)
            solus_key.push("Anti-aim inverter")
    }
    if (UI.GetValue(["Rage", "General", "General", "Key assignment", "Force safe point"])) {
        if (solus_key.indexOf("Safe point override") == -1)
            solus_key.push("Safe point override")
    }
    if (UI.GetValue(["Rage", "General", "General", "Key assignment", "Force body aim"])) {
        if (solus_key.indexOf("Force body aim") == -1)
            solus_key.push("Force body aim")
    }
    if (UI.GetValue(["Rage", "Exploits", "Keys", "Double tap"])) {
        if (solus_key.indexOf("Double tap") == -1)
            solus_key.push("Double tap")
    }
    if (UI.GetValue(["Rage", "Exploits", "Keys", "Hide shots"])) {
        if (solus_key.indexOf("On shot anti-aim") == -1)
            solus_key.push("On shot anti-aim")
    }
    if(UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"])){
        if (solus_key.indexOf("Legit Sway") == -1)
            solus_key.push("Legit Sway")
    }
    if(UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"])){
        if (solus_key.indexOf("Safety legit peek") == -1)
            solus_key.push("Safety legit peek")
    }
    if(UI.GetValue(["Misc.", "Keys", "Key assignment", "Edge jump"])){
        if (solus_key.indexOf("Edge jump") == -1)
            solus_key.push("Edge jump")
    }
    if(UI.GetValue(["Rage", "General", "General", "Key assignment", "Damage override"])){
        if (solus_key.indexOf("Damage override") == -1)
            solus_key.push("Damage override")
    }
    if(UI.GetValue(["Rage", "General", "General", "Key assignment", "Hitbox override"])){
        if (solus_key.indexOf("Hitbox override") == -1)
            solus_key.push("Hitbox override")
    }
    
    
    if (solus_key.length > 0) {
        solus_alpha = Math.min(solus_alpha + frames, 1);
    } else {
        solus_alpha = solus_alpha - frames;
        if (solus_alpha < 0) solus_alpha = 0;
    }
    for (i = 0; i < solus_key.length; i++) {
        if (Render.TextSize(solus_key[i], font)[0] > max_width) {
            max_width = Render.TextSize(solus_key[i], font)[0];
        }
    }
    // Cheat.Print(solus_alpha+"\n")
    if (max_width == 0) max_width = 50;
    solus_width = solus_width + max_width;
    if(is_keybinds_open&&solus_alpha > 0){
        // if(solus_ui_style==0) Render.FilledRect(key_x-4, key_y + 5, solus_width+8, 23, [35, 35, 35, solus_alpha *180]);
        // else Render.FilledRect(key_x-4, key_y + 5, solus_width+8, 23, [25, 25, 25, solus_alpha *220]);
        switch(re_theme_type){
            case 0:
                if(re_theme_color==0){
                    Render.GradientRect(key_x-4, key_y + 5, (solus_width+8)/2, 24, 1,[35, 35, 35, 0],[35, 35, 35, solus_alpha *180]);
                    Render.GradientRect(key_x-4+(solus_width+8)/2, key_y + 5, (solus_width+8)/2, 24, 1,[35, 35, 35, solus_alpha *180],[35,35,35,0]);
                    Render.GradientRect(key_x-4, key_y + 4, (solus_width+8)/2, 1, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],0] , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255]);
                    Render.GradientRect(key_x+(solus_width+8)/2-4, key_y + 4, (solus_width+8)/2, 1, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255] , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],0]);
                    Render.GradientRect(key_x-4, key_y + 28, (solus_width+8)/2, 1, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],0] , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255]);
                    Render.GradientRect(key_x+(solus_width+8)/2-4, key_y + 28, (solus_width+8)/2, 1, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255] , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],0]);
                }else{
                    Render.GradientRect(key_x-4, key_y + 5, (solus_width+8)/2, 24, 1,[35, 35, 35, 0],[35, 35, 35, solus_alpha *180]);
                    Render.GradientRect(key_x-4+(solus_width+8)/2, key_y + 5, (solus_width+8)/2, 24, 1,[35, 35, 35, solus_alpha *180],[35,35,35,0]);
                    Render.GradientRect(key_x-4, key_y + 4, (solus_width+8)/2, 1, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],0] , [solus_keycolor[0],solus_keycolor[2],solus_keycolor[1],solus_alpha *255]);
                    Render.GradientRect(key_x+(solus_width+8)/2-4, key_y + 4, (solus_width+8)/2, 1, 1 , [solus_keycolor[0],solus_keycolor[2],solus_keycolor[1],solus_alpha *255] , [solus_keycolor[2],solus_keycolor[1],solus_keycolor[0],0]);
                    Render.GradientRect(key_x-4, key_y + 28, (solus_width+8)/2, 1, 1 , [solus_keycolor[0],solus_keycolor[2],solus_keycolor[1],0] , [solus_keycolor[1],solus_keycolor[2],solus_keycolor[0],solus_alpha *255]);
                    Render.GradientRect(key_x+(solus_width+8)/2-4, key_y + 28, (solus_width+8)/2, 1, 1 , [solus_keycolor[1],solus_keycolor[2],solus_keycolor[0],solus_alpha *255] , [solus_keycolor[2],solus_keycolor[1],solus_keycolor[0],0]);
                }
                Render.String(key_x + solus_width / 2 - (Render.TextSize("keybinds", font)[0] / 2) + 2, key_y + 11, 0, "keybinds", [0, 0, 0, solus_alpha * 255 / 1.3], font);
                Render.String(key_x + solus_width / 2 - (Render.TextSize("keybinds", font)[0] / 2) + 1, key_y + 10, 0, "keybinds", [255, 255, 255, solus_alpha * 255], font);
                break;
            case 1:
                if(re_theme_color==0){
                    Render.FilledRect(key_x-4, key_y + 5, solus_width+8, 23, [35, 35, 35, solus_alpha *180]);
                    Render.GradientRect(key_x-4, key_y + 3, (solus_width+8)/2, 2, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255] , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255]);
                    Render.GradientRect(key_x+(solus_width+8)/2-4, key_y + 3, (solus_width+8)/2, 2, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255] , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255]);
                }else{
                    Render.FilledRect(key_x-4, key_y + 5, solus_width+8, 23, [35, 35, 35, solus_alpha *180]);
                    Render.GradientRect(key_x-4, key_y + 3, (solus_width+8)/2, 2, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255] , [solus_keycolor[0],solus_keycolor[2],solus_keycolor[1],solus_alpha *255]);
                    Render.GradientRect(key_x+(solus_width+8)/2-4, key_y + 3, (solus_width+8)/2, 2, 1 , [solus_keycolor[0],solus_keycolor[2],solus_keycolor[1],solus_alpha *255] , [solus_keycolor[2],solus_keycolor[1],solus_keycolor[0],solus_alpha *255]);
                }
                Render.String(key_x + solus_width / 2 - (Render.TextSize("keybinds", font)[0] / 2) + 2, key_y + 11, 0, "keybinds", [0, 0, 0, solus_alpha * 255 / 1.3], font);
                Render.String(key_x + solus_width / 2 - (Render.TextSize("keybinds", font)[0] / 2) + 1, key_y + 10, 0, "keybinds", [255, 255, 255, solus_alpha * 255], font);
                break;
            case 2:
                if(re_theme_color==0){
                    Render.GradientRect(key_x-2, key_y + 1, solus_width+4, 2, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255] , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255]);
                    Render.GradientRect(key_x-3, key_y + 2, solus_width+6, 2, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255] , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255]);
                    Render.GradientRect(key_x-4, key_y + 3, solus_width+8, 2, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255] , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255]);
                    Render.FilledRect(key_x-3, key_y + 4, solus_width+6, 1, [35, 35, 35, solus_alpha *255]);
                    Render.FilledRect(key_x-4, key_y + 5, solus_width+8, 23, [35, 35, 35, solus_alpha *255]);
                    Render.FilledRect(key_x-4, key_y + 26, solus_width+8, 2, [25, 25, 25, solus_alpha *255]);
                }else{
                    Render.GradientRect(key_x-2, key_y + 1, solus_width+4, 2, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255] , [solus_keycolor[2],solus_keycolor[0],solus_keycolor[1],solus_alpha *255]);
                    Render.GradientRect(key_x-3, key_y + 2, solus_width+6, 2, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255] , [solus_keycolor[2],solus_keycolor[0],solus_keycolor[1],solus_alpha *255]);
                    Render.GradientRect(key_x-4, key_y + 3, solus_width+8, 2, 1 , [solus_keycolor[0],solus_keycolor[1],solus_keycolor[2],solus_alpha *255] , [solus_keycolor[2],solus_keycolor[0],solus_keycolor[1],solus_alpha *255]);
                    Render.FilledRect(key_x-3, key_y + 4, solus_width+6, 1, [35, 35, 35, solus_alpha *255]);
                    Render.FilledRect(key_x-4, key_y + 5, solus_width+8, 23, [35, 35, 35, solus_alpha *255]);
                    Render.FilledRect(key_x-4, key_y + 26, solus_width+8, 2, [25, 25, 25, solus_alpha *255]);
                }
                Render.String(key_x + (Render.TextSize("H", draw_font)[0])+6, key_y + 8, 0, "H", [0, 0, 0, solus_alpha * 255 / 1.3], new_font);
                Render.String(key_x + (Render.TextSize("H", draw_font)[0])+6, key_y + 7, 0, "H", [255, 255, 255, solus_alpha * 255 / 1.3], new_font);
                Render.String(key_x + (Render.TextSize("H", draw_font)[0]) + (Render.TextSize("keybinds", font)[0] / 2) + 8, key_y + 4, 0, "Keybinds", [0, 0, 0, solus_alpha * 255 / 1.3], mordern_font);
                Render.String(key_x + (Render.TextSize("H", draw_font)[0]) + (Render.TextSize("keybinds", font)[0] / 2) + 7, key_y + 5, 0, "Keybinds", [255, 255, 255, solus_alpha * 255 / 1.3], mordern_font);
                break;
        }
            
            for (i = 0; i < solus_key.length; i++) {
                switch (solus_key[i]) {
                    case 'Slow walk':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, slow_walk_a * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, slow_walk_a * 255], key_font);

                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"])+"]", [0, 0, 0, slow_walk_a * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"])+"]", [255, 255, 255, slow_walk_a * 255], key_font);
                        
                        break;
                    case 'Duck peek assist':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, fake_duck_a * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, fake_duck_a * 255], key_font);

                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"])+"]", [0, 0, 0, fake_duck_a * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "Fake duck"])+"]", [255, 255, 255, fake_duck_a * 255], key_font);
                        
                        break;
                    case 'Auto peek':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, auto_peek_a * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, auto_peek_a * 255], key_font);

                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Misc.", "Keys", "Auto peek"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Misc.", "Keys", "Auto peek"])+"]", [0, 0, 0, auto_peek_a * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Misc.", "Keys", "Auto peek"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Misc.", "Keys", "Auto peek"])+"]", [255, 255, 255, auto_peek_a * 255], key_font);
                        
                        break;
                    case 'Anti-aim inverter':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, desync_alpha * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, desync_alpha * 255], key_font);

                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])+"]", [0, 0, 0, desync_alpha * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "AA direction inverter"])+"]", [255, 255, 255, desync_alpha * 255], key_font);
                        
                        break;
                        
                    case 'Safe point override':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, safe_p_a * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, safe_p_a * 255], key_font);

                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Rage", "General", "General", "Key assignment", "Force safe point"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "General", "General", "Key assignment", "Force safe point"])+"]", [0, 0, 0, safe_p_a * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Rage", "General", "General", "Key assignment", "Force safe point"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "General", "General", "Key assignment", "Force safe point"])+"]", [255, 255, 255, safe_p_a * 255], key_font);
                        
                        break;
                    case 'Force body aim':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, force_body_a * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, force_body_a * 255], key_font);

                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Rage", "General", "General", "Key assignment", "Force body aim"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "General", "General", "Key assignment", "Force body aim"])+"]", [0, 0, 0, force_body_a * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Rage", "General", "General", "Key assignment", "Force body aim"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "General", "General", "Key assignment", "Force body aim"])+"]", [255, 255, 255, force_body_a * 255], key_font);
                        
                        break;
                    case 'Double tap':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, dt_alpha * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, dt_alpha * 255], key_font);

                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Rage", "Exploits", "Keys", "Double tap"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Exploits", "Keys", "Double tap"])+"]", [0, 0, 0, dt_alpha * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Rage", "Exploits", "Keys", "Double tap"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Exploits", "Keys", "Double tap"])+"]", [255, 255, 255, dt_alpha * 255], key_font);
                        
                        break;
                    case 'On shot anti-aim':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, hs_alpha * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, hs_alpha * 255], key_font);

                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Rage", "Exploits", "Keys", "Hide shots"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Exploits", "Keys", "Hide shots"])+"]", [0, 0, 0, hs_alpha * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Rage", "Exploits", "Keys", "Hide shots"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Exploits", "Keys", "Hide shots"])+"]", [255, 255, 255, hs_alpha * 255], key_font);
                        
                        break;
                    case 'Legit Sway':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, legit_alpha * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, legit_alpha * 255], key_font);
    
                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"])+"]", [0, 0, 0, legit_alpha * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "NightMare Legit AntiAim Rebind"])+"]", [255, 255, 255, legit_alpha * 255], key_font);
                        
                        break;
                    case 'Safety legit peek':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, safety_alpha * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, safety_alpha * 255], key_font);
    
                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"])+"]", [0, 0, 0, safety_alpha * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "Anti Aim", "General", "Key assignment", "NightMare AntiAim Safety Peek Key"])+"]", [255, 255, 255, safety_alpha * 255], key_font);
                        
                        break;
                    case 'Edge jump':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, edge_alpha * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, edge_alpha * 255], key_font);

                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Misc.", "Keys", "Key assignment", "Edge jump"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Misc.", "Keys", "Key assignment", "Edge jump"])+"]", [0, 0, 0, edge_alpha * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Misc.", "Keys", "Key assignment", "Edge jump"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Misc.", "Keys", "Key assignment", "Edge jump"])+"]", [255, 255, 255, edge_alpha * 255], key_font);
                        
                        break;
                    case 'Damage override':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, dmg_alpha * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, dmg_alpha * 255], key_font);

                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Rage", "General", "General", "Key assignment", "Damage override"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "General", "General", "Key assignment", "Damage override"])+"]", [0, 0, 0, dmg_alpha * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Rage", "General", "General", "Key assignment", "Damage override"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "General", "General", "Key assignment", "Damage override"])+"]", [255, 255, 255, dmg_alpha * 255], key_font);
                        
                        break;
                    case 'Hitbox override':
                        
                        Render.String(key_x + 3, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [0, 0, 0, box_alpha * 255 / 1.3], key_font);
                        Render.String(key_x + 2, VectorLerp(key_y + 28,key_y + 28 + 18 * i,1), 0, solus_key[i], [255, 255, 255, box_alpha * 255], key_font);

                        Render.String(key_x - 3 + solus_width - Render.TextSize("["+get_states(["Rage", "General", "General", "Key assignment", "Hitbox override"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "General", "General", "Key assignment", "Hitbox override"])+"]", [0, 0, 0, box_alpha * 255 / 1.3], key_font);
                        Render.String(key_x - 2 + solus_width - Render.TextSize("["+get_states(["Rage", "General", "General", "Key assignment", "Hitbox override"])+"]", key_font)[0], key_y + 28 + 18 * i, 0, "["+get_states(["Rage", "General", "General", "Key assignment", "Hitbox override"])+"]", [255, 255, 255, box_alpha * 255], key_font);
                        
                        break;
                }

            }
    }
    if (Global.IsKeyPressed(1) && UI.IsMenuOpen()) {
        const mouse_pos = Global.GetCursorPosition();
        if (in_bounds(mouse_pos, key_x, key_y, key_x + solus_width, key_y + 30)) {
            UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[Theme]Keybinds x"], mouse_pos[0] - solus_width / 2);
            UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[Theme]Keybinds y"], mouse_pos[1] - 20);
        }
    }
}
function get_spectators(){
    var specs = [];
    const players = Entity.GetPlayers();

    for (i = 0; i < players.length; i++)
    {
        const cur = players[i];

        if (Entity.GetProp(cur, "CBasePlayer", "m_hObserverTarget") != "m_hObserverTarget") {
            const obs = Entity.GetProp(cur, "CBasePlayer", "m_hObserverTarget")

            if (obs === Entity.GetLocalPlayer())
            {
                const name = Entity.GetName(cur);
                specs.push(name);
            }
        }
    }

    return specs;
}

function solus_spec() {
        var is_spec_open = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[Theme]Spectator"]);
        if(UI.IsMenuOpen()){
            if(is_spec_open&&UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==0){
                UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spec x"], 1);
                UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spec y"], 1);
            }else{
                UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spec x"], 0);
                UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spec y"], 0);
            }
        }
        if (!World.GetServerString()) return;

        var re_theme_type = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Theme style"]);
        var re_theme_color = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Color method"]);
        var re_theme_cset = UI.GetColor( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Color picker"] );
        var solus_speccolor = (re_theme_color==0||re_theme_color==1)?re_theme_cset:rainbow(Global.Tickcount() % 350 / 350, 1, 1, 1, 255);

        var spec_x = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spec x"]);
        var spec_y = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spec y"]);
        const text_spec = get_spectators();
        var font = Render.GetFont("Verdana.ttf", 11, true);
        var spec_font = Render.GetFont("lucon.ttf", 12, true);
        var draw_font = Render.GetFont("icons_new.ttf", 16, false);
        var mordern_font = Render.GetFont("seguisb.ttf", 14, true);
		var frames = 8 * Globals.Frametime();
        var width2 = 100;
        var maxwidth2 = 0;
        
        
        // var solus_speccolor = (solus_type==0||solus_type==1)?UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals","Solid color"]):rainbow(Global.Tickcount() % 350 / 350, 1, 1, 1, 255);
        
		if (text_spec.length > 0) {
            spec_alpha = Math.min(spec_alpha + frames, 1);
        } else {
            spec_alpha = spec_alpha - frames;
            if (spec_alpha < 0) spec_alpha = 0;
        }
    
        for (i = 0; i < text_spec.length; i++) {
            if (Render.TextSize(text_spec[i], font)[0] > maxwidth2) {
                maxwidth2 = Render.TextSize(text_spec[i], font)[0];
            }
        }
        if (maxwidth2 == 0) maxwidth2 = 50;
        width2 = width2 + maxwidth2;
        //Gradient
        if(is_spec_open){
            switch(re_theme_type){
                case 0:
                    if(re_theme_color==0){
                        Render.GradientRect(spec_x-4, spec_y + 2, (width2+8)/2, 24, 1,[35, 35, 35, 0],[35, 35, 35, spec_alpha *180]);
                        Render.GradientRect(spec_x-4+(width2+8)/2, spec_y + 2, (width2+8)/2, 24, 1,[35, 35, 35, spec_alpha *180],[35,35,35,0]);
                        Render.GradientRect(spec_x-4, spec_y + 1, (width2+8)/2, 1, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],0] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha *255]);
                        Render.GradientRect(spec_x+(width2+8)/2-4, spec_y + 1, (width2+8)/2, 1, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha *255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],0]);
                        Render.GradientRect(spec_x-4, spec_y + 25, (width2+8)/2, 1, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],0] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha *255]);
                        Render.GradientRect(spec_x+(width2+8)/2-4, spec_y + 25, (width2+8)/2, 1, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha *255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],0]);
                    }else{
                        Render.GradientRect(spec_x-4, spec_y + 2, (width2+8)/2, 24, 1,[35, 35, 35, 0],[35, 35, 35, spec_alpha *180]);
                        Render.GradientRect(spec_x-4+(width2+8)/2, spec_y + 2, (width2+8)/2, 24, 1,[35, 35, 35, spec_alpha *180],[35,35,35,0]);
                        Render.GradientRect(spec_x-4, spec_y + 1, (width2+8)/2, 1, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],0] , [solus_speccolor[0],solus_speccolor[2],solus_speccolor[1],spec_alpha *255]);
                        Render.GradientRect(spec_x+(width2+8)/2-4, spec_y + 1, (width2+8)/2, 1, 1 , [solus_speccolor[0],solus_speccolor[2],solus_speccolor[1],spec_alpha *255] , [solus_speccolor[2],solus_speccolor[1],solus_speccolor[0],0]);
                        Render.GradientRect(spec_x-4, spec_y + 25, (width2+8)/2, 1, 1 , [solus_speccolor[0],solus_speccolor[2],solus_speccolor[1],0] , [solus_speccolor[1],solus_speccolor[2],solus_speccolor[0],spec_alpha *255]);
                        Render.GradientRect(spec_x+(width2+8)/2-4, spec_y + 25, (width2+8)/2, 1, 1 , [solus_speccolor[1],solus_speccolor[2],solus_speccolor[0],spec_alpha *255] , [solus_speccolor[2],solus_speccolor[1],solus_speccolor[0],0]);
                    }
                    Render.String(spec_x + width2 / 2 - (Render.TextSize("spectators", spec_font)[0] / 2) + 2, spec_y + 7, 0, "spectators", [0, 0, 0,  spec_alpha*255 / 1.3], spec_font);
                    Render.String(spec_x + width2 / 2 - (Render.TextSize("spectators", spec_font)[0] / 2) + 1, spec_y + 6, 0, "spectators", [255, 255, 255,  spec_alpha*255], spec_font);
                    break;
                case 1:
                    if(re_theme_color==0){
                        Render.FilledRect(spec_x-4, spec_y + 2, width2+8, 23, [35, 35, 35, spec_alpha* 180]);
                        Render.GradientRect(spec_x-4, spec_y, (width2+8)/2, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255]);
                        Render.GradientRect(spec_x+(width2+8)/2-4, spec_y, (width2+8)/2, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255]);
                    }else{
                        Render.FilledRect(spec_x-4, spec_y + 2, width2+8, 23, [35, 35, 35, spec_alpha* 180]);
                        Render.GradientRect(spec_x-4, spec_y, (width2+8)/2, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[2],solus_speccolor[1],spec_alpha*255]);
                        Render.GradientRect(spec_x+(width2+8)/2-4, spec_y, (width2+8)/2, 2, 1 , [solus_speccolor[0],solus_speccolor[2],solus_speccolor[1],spec_alpha*255] , [solus_speccolor[2],solus_speccolor[1],solus_speccolor[0],spec_alpha*255]);
                    }
                    Render.String(spec_x + width2 / 2 - (Render.TextSize("spectators", spec_font)[0] / 2) + 2, spec_y + 7, 0, "spectators", [0, 0, 0,  spec_alpha*255 / 1.3], spec_font);
                    Render.String(spec_x + width2 / 2 - (Render.TextSize("spectators", spec_font)[0] / 2) + 1, spec_y + 6, 0, "spectators", [255, 255, 255,  spec_alpha*255], spec_font);
                    break;
                // case 2:
                //     if(re_theme_color==0){
                //         Render.FilledRect(spec_x-4, spec_y + 2, width2+8, 23, [35, 35, 35, spec_alpha* 180]);
                //         Render.GradientRect(spec_x-4, spec_y, (width2+8)/2, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255]);
                //         Render.GradientRect(spec_x+(width2+8)/2-4, spec_y, (width2+8)/2, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255]);
                //         Render.GradientRect(spec_x-4, spec_y + 2, 2, 23, 0 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255]);
                //         Render.GradientRect(spec_x+(width2+8)-6, spec_y + 2, 2, 23, 0 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255]);
                //         Render.GradientRect(spec_x-4, spec_y + 23, (width2+8)/2, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255]);
                //         Render.GradientRect(spec_x+(width2+8)/2-4, spec_y + 23, (width2+8)/2, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255]);
                //     }else{
                //         Render.FilledRect(spec_x-4, spec_y + 2, width2+8, 23, [35, 35, 35, spec_alpha* 180]);
                //         Render.GradientRect(spec_x-4, spec_y, (width2+8)/2, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[2],solus_speccolor[1],spec_alpha*255]);
                //         Render.GradientRect(spec_x+(width2+8)/2-4, spec_y, (width2+8)/2, 2, 1 , [solus_speccolor[0],solus_speccolor[2],solus_speccolor[1],spec_alpha*255] , [solus_speccolor[2],solus_speccolor[1],solus_speccolor[0],spec_alpha*255]);
                //         Render.GradientRect(spec_x-4, spec_y + 2, 2, 23, 0 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[1],solus_speccolor[0],solus_speccolor[2],spec_alpha*255]);
                //         Render.GradientRect(spec_x+(width2+8)-6, spec_y + 2, 2, 23, 0 , [solus_speccolor[2],solus_speccolor[1],solus_speccolor[0],spec_alpha*255] , [solus_speccolor[1],solus_speccolor[0],solus_speccolor[2],spec_alpha*255]);
                //         Render.GradientRect(spec_x-4, spec_y + 23, (width2+8)/2, 2, 1 , [solus_speccolor[1],solus_speccolor[0],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[2],solus_speccolor[1],solus_speccolor[0],spec_alpha*255]);
                //         Render.GradientRect(spec_x+(width2+8)/2-4, spec_y + 23, (width2+8)/2, 2, 1 , [solus_speccolor[2],solus_speccolor[1],solus_speccolor[0],spec_alpha*255] , [solus_speccolor[1],solus_speccolor[0],solus_speccolor[2],spec_alpha*255]);
                //     }
                //     Render.String(spec_x + width2 / 2 - (Render.TextSize("spectators", spec_font)[0] / 2) + 2, spec_y + 7, 0, "spectators", [0, 0, 0,  spec_alpha*255 / 1.3], spec_font);
                //     Render.String(spec_x + width2 / 2 - (Render.TextSize("spectators", spec_font)[0] / 2) + 1, spec_y + 6, 0, "spectators", [255, 255, 255,  spec_alpha*255], spec_font);
                //     break;
                case 2:
                    if(re_theme_color==0){
                        Render.GradientRect(spec_x-2, spec_y-2, width2+4, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255]);
                        Render.GradientRect(spec_x-3, spec_y-1, width2+6, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255]);
                        Render.GradientRect(spec_x-4, spec_y, width2+8, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255]);
                    }else{
                        Render.GradientRect(spec_x-2, spec_y-2, width2+4, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[2],solus_speccolor[0],solus_speccolor[1],spec_alpha*255]);
                        Render.GradientRect(spec_x-3, spec_y-1, width2+6, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[2],solus_speccolor[0],solus_speccolor[1],spec_alpha*255]);
                        Render.GradientRect(spec_x-4, spec_y, width2+8, 2, 1 , [solus_speccolor[0],solus_speccolor[1],solus_speccolor[2],spec_alpha*255] , [solus_speccolor[2],solus_speccolor[0],solus_speccolor[1],spec_alpha*255]);
                    }
                    Render.FilledRect(spec_x-3, spec_y+1, width2+6, 1, [35, 35, 35, spec_alpha* 255]);
                    Render.FilledRect(spec_x-4, spec_y + 2, width2+8, 23, [35, 35, 35, spec_alpha* 255]);
                    Render.FilledRect(spec_x-4, spec_y+23, width2+8, 2, [25, 25, 25, spec_alpha* 255]);
                    Render.String(spec_x + (Render.TextSize("A", draw_font)[0] / 2) , spec_y + 6, 0, "A", [0, 0, 0,  spec_alpha*255 / 1.3], draw_font);
                    Render.String(spec_x + (Render.TextSize("A", draw_font)[0] / 2) , spec_y + 5, 0, "A", [255, 255, 255,  spec_alpha*255 / 1.3], draw_font);
                    Render.String(spec_x + (Render.TextSize("A", draw_font)[0] / 2) + 30, spec_y+1, 0, "Spectators", [0, 0, 0,  spec_alpha*255 / 1.3], mordern_font);
                    Render.String(spec_x + (Render.TextSize("A", draw_font)[0] / 2) + 29, spec_y + 2, 0, "Spectators", [255, 255, 255,  spec_alpha*255 / 1.3], mordern_font);
                    break;
            }
            
            for (i = 0; i < text_spec.length; i++)
            {
            Render.FilledRect(spec_x + 90 + width2  - (Render.TextSize(toString(text_spec), font)[0] ), VectorLerp(spec_y + 30,spec_y + 30 + 15 * i,1), 12,12, [20, 20, 20, 255]);
            Render.String(spec_x + 96 + width2  - (Render.TextSize(toString(text_spec), font)[0] ), VectorLerp(spec_y + 28,spec_y + 28 + 15 * i,1), 1, "?", [255, 255, 255, 255 / 1.3], font);
            Render.String(spec_x + (Render.TextSize((text_spec[i]), font)[0] /2 ) , VectorLerp(spec_y + 25,spec_y + 25 + 15 * i,1), 1, text_spec[i], [0, 0, 0, 255 / 1.3], font);
            Render.String(spec_x + (Render.TextSize((text_spec[i]), font)[0] /2 ), VectorLerp(spec_y + 26,spec_y + 26 + 15 * i,1), 1, text_spec[i], [255, 255, 255, 255], font);
            
            }
        }
        if (Global.IsKeyPressed(1) && UI.IsMenuOpen()) {
            const mouse_pos = Global.GetCursorPosition();
            if (in_bounds(mouse_pos, spec_x, spec_y, spec_x + width2, spec_y + 30)) {
                UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spec x"], mouse_pos[0] - width2 / 2);
                UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spec y"], mouse_pos[1] - 20);
            }
        }
}
var wep2tab = {
    "usp s": "G",
    "glock 18": "D",
    "dual berettas": "B",
    "r8 revolver": "J",
    "desert eagle": "A",
    "p250": "F",
    "tec 9": "H",
    "mp9": "O",
    "mac 10": "K",
    "pp bizon": "M",
    "ump 45": "L",
    "ak 47": "W",
    "sg 553": "V",
    "aug": "U",
    "m4a1 s": "T",
    "m4a4": "S",
    "ssg 08": "a",
    "awp": "Z",
    "g3sg1": "X",
    "scar 20": "Y",
    "xm1014": "b",
    "mag 7": "d",
    "m249": "g",
    "negev": "f",
    "p2000": "E",
    "famas": "R",
    "five seven": "C",
    "mp7": "N",
    "ump 45": "L",
    "p90": "P",
    "cz75 auto": "I",
    "mp5 sd": "N",
    "galil ar": "Q",
    "sawed off": "c",
    "zeus x27": 'h',
    'nova': "e",
    'high explosive grenade': 'j',
    'smoke grenade': 'k',
    'molotov': 'l',
    'incendiary grenade': 'n',
    'flashbang': 'i',
    'decoy grenade': 'm',
    'c4 explosive': 'o',
    "bayonet": '1',
    "flip knife": '2',
    "gut knife": '3',
    "karambit": '4',
    "m9 bayonet": '5',
    "butterfly knife": '8',
    "falchion knife": '0',
    "shadow daggers": '9',
    "bowie knife": '7',
    "huntsman knife": '6',
    "ursus knife": '1',
    "navaja knife": '1', 
    "stiletto knife": '1', 
    "skeleton knife": '1', 
    "nomad knife": '1', 
    "survival knife": '1', 
    "paracord knife": '1', 
    "classic knife": '1', 
    "talon knife": '1',
    'knife': '1',
    '': ''
};
//Hud
var radius_flag = false,str_alpha_flag = false,radius_full = false,rect_flag = false,hud_radius = 0,hud_alpha = 0,hud_rect = 0,hud_radius_step = 0,hud_alpha_step = 0,hud_rect_step = 0;
var hud_health_rect = 0,hud_armor_rect = 0,hud_hurt_rect = 0,hud_armorhurt_rect = 0,hud_health_step = 0,hud_armor_step = 0,hud_hurt_step = 0,hud_armorhurt_step = 0,local_hurt = 0,armor_hurt = 0;
var hurt_logs = [];
var steps_health = 0,steps_armor = 0;

function draw_hud(){
    // pr(radius_flag+" "+hud_radius+" "+hud_alpha)
    var font_wep = Render.GetFont("astriumwep.ttf",22,false);
    var font_str = Render.GetFont("verdanab.ttf",12,true);
    var is_hud = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]New hud"]);
    if(UI.IsMenuOpen()){
        if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==0){
            UI.SetEnabled( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]hud x"], is_hud );
            UI.SetEnabled( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]hud y"], is_hud );
            UI.SetEnabled( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]theme color"] , is_hud );
            UI.SetEnabled( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]text color"], is_hud );
        }else{
            UI.SetEnabled( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]hud x"], 0 );
            UI.SetEnabled( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]hud y"], 0 );
            UI.SetEnabled( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]theme color"] , 0 );
            UI.SetEnabled( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]text color"], 0 );
        }
    }
    
    var hud_xc = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]hud x"]);
    var hud_yc = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]hud y"]);
    //anima
    var alpha_ral = 255,radius_ral = 360,rect_ral = 250;
    if(is_hud&&Entity.IsAlive(Entity.GetLocalPlayer())){
        Convar.SetFloat("hidehud", 8);
        var local_health = (Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_iHealth"))>100?100:(Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_iHealth"));
        var local_armor = Entity.GetProp(Entity.GetLocalPlayer(), "CCSPlayerResource", "m_iArmor");
        rect_flag = true;
        radius_flag = true;
        str_alpha_flag = true;
    }else{
        rect_flag = false;
        radius_flag = false;
        str_alpha_flag = false;
    }
    if(radius_flag){
        if(hud_radius<radius_ral){
            hud_radius_step += 0.08;
            hud_radius += hud_radius_step;
        }
        if(hud_radius>=radius_ral){
            hud_radius = 360;
            radius_full = true;
        }
    }else{
        radius_full = false;
        hud_radius_step = 0;
        hud_radius = 0;
    }
    if(str_alpha_flag&&radius_full){
        if(hud_alpha<alpha_ral){
            hud_alpha_step += 0.02;
            hud_alpha += hud_alpha_step;
        }
        if(hud_alpha>=alpha_ral){
            hud_alpha = 255;
        }
    }else{
        hud_alpha_step = 0;
        hud_alpha = 0;
    }
    if(rect_flag&&radius_full){
        if(hud_rect<rect_ral){
            hud_rect_step += 0.015;
            hud_rect += hud_rect_step;
        }
        if(hud_health_rect<local_health*2.5){
            hud_health_step += 0.015;
            hud_health_rect += hud_health_step;
        }
        if(hud_armor_rect<local_armor*2.5){
            hud_armor_step += 0.015;
            hud_armor_rect += hud_armor_step;
        }
        if(hud_rect>=rect_ral)hud_rect = 250;
        if(hud_health_rect>=local_health*2.5)hud_health_rect = local_health*2.5;
        if(hud_armor_rect>=local_armor*2.5)hud_armor_rect = local_armor*2.5;
    }else{
        Convar.SetFloat("hidehud", 0);
        hud_hurt_step = 0;
        hud_armorhurt_step = 0;
        hud_health_step = 0;
        hud_armor_step = 0;
        hud_rect_step = 0;
        hud_rect = 0;
        hud_health_rect = 0;
        hud_armor_rect = 0;
    }
    if(is_hud&&Entity.IsAlive(Entity.GetLocalPlayer())){
        // Convar.SetFloat("hidehud", 8);28-0 143-0
        var theme_color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]theme color"]);
        var text_color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]text color"]);
        var me = Entity.GetLocalPlayer();//104,195,69
        var weapon = Entity.GetWeapon(me);
        var wep_ral_name = player_weapon_name(weapon)
        var ammo = Entity.GetProp(weapon,"CBaseCombatWeapon" ,"m_iClip1");
        var wep_reserve_ammo = Entity.GetProp( Entity.GetWeapon(Entity.GetLocalPlayer()), "CBaseCombatWeapon", "m_iPrimaryReserveAmmoCount" );
        // Render.GradientRect( hud_xc+62,hud_yc-5, hud_rect, 1,1, [ theme_color[0], theme_color[1], theme_color[2], 255 ],[ theme_color[0], theme_color[1], theme_color[2], 0 ] );
        Render.FilledRect( hud_xc+62,hud_yc-25, hud_rect, 18, [ 35,35,35, 180 ] );
        Render.FilledRect( hud_xc+62,hud_yc-2, hud_rect, 18, [ 35,35,35, 180 ] );
        for(var i in hurt_logs){
            var health = hurt_logs[i].health;
            var armor = hurt_logs[i].armor;
            steps_health += 0.5;
            steps_armor += 0.1;
            Render.FilledRect( hud_xc+62+local_health*2.5,hud_yc-25, health-steps_health, 18, [250 - (local_health-health) * 2.2, 5 + (local_health-health) * 2.2,0,255] );
            Render.FilledRect( hud_xc+62+local_armor*2.5,hud_yc-2, armor-steps_armor, 18, [ 12,139,201, 255 ] );
            if((hurt_logs[i].health-steps_health<=0)&&(hurt_logs[i].armor-steps_armor<=0)){
                hurt_logs.splice(i,1);
                steps_health = 0;
                steps_armor = 0;
            }
        }
        Render.GradientRect( hud_xc+62,hud_yc-25, hud_health_rect, 18, 1,[36,221,33,255],[119,249,55,255] );
        Render.GradientRect( hud_xc+62,hud_yc-2, hud_armor_rect, 18, 1,[ 0,100,189, 255 ],[17,169,218,255] );//0,100,189
        Render.String( hud_xc+67,hud_yc-24, 0, "HP "+local_health, [255, 255, 255, hud_alpha], font_str);
        Render.String( hud_xc+67+Render.TextSize("HP "+local_health,font_str)[0],hud_yc-24, 0, " | 100", [255, 255, 255, hud_alpha>75?hud_alpha-75:0], font_str);
        Render.String( hud_xc+67,hud_yc-1, 0, "AC "+local_armor, [255, 255, 255, hud_alpha], font_str);
        Render.String( hud_xc+67+Render.TextSize("AC "+local_armor,font_str)[0],hud_yc-1, 0, " | 100", [255, 255, 255, hud_alpha>75?hud_alpha-75:0], font_str);
        render_arc(hud_xc+20,hud_yc-5,37,0,90,hud_radius,6,[25,25,25,255]);
        if(wep2tab.hasOwnProperty(wep_ral_name)){
            Render.String( hud_xc+22-Render.TextSize(wep2tab[wep_ral_name],font_wep)[0]/2, hud_yc-27, 0, wep2tab[wep_ral_name], [text_color[0], text_color[1], text_color[2], hud_alpha], font_wep);
            Render.String( hud_xc+20-Render.TextSize(ammo+"|"+wep_reserve_ammo,font_str)[0]/2, hud_yc-22+Render.TextSize(wep2tab[wep_ral_name],font_wep)[1], 0, ammo+"|"+wep_reserve_ammo, [text_color[0], text_color[1], text_color[2], hud_alpha], font_str);
        }
        render_arc(hud_xc+20,hud_yc-5,48,37,90,hud_radius,6,theme_color);
        Render.Rect( hud_xc, hud_yc-24+Render.TextSize(wep2tab[wep_ral_name],font_wep)[1], 40, 1, [ 45, 45, 45, hud_alpha ] );
        
        
        if (Global.IsKeyPressed(1) && UI.IsMenuOpen()) {
            const mouse_pos = Global.GetCursorPosition();
            if (in_bounds(mouse_pos, hud_xc-48, hud_yc-48, hud_xc+298, hud_yc + 48)) {
                UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]hud x"], mouse_pos[0] - 30);
                UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Hud]hud y"], mouse_pos[1] - 20);
            }
        }
    }
}
function hud_round_start(){
    hurt_logs.splice(0,hurt_logs.length);
}
function hud_round_end(){
    hurt_logs.splice(0,hurt_logs.length);
}
function hud_onPlayerHurt() {
    if (Entity.GetEntityFromUserID(Event.GetInt("userid")) == Entity.GetLocalPlayer()) {
        hurt_logs.push({health:Event.GetInt("dmg_health"),armor:Event.GetInt("dmg_armor")});
    }
}
//foottrail
function get_velocity() {
    var velocity = Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_vecVelocity[0]");
    var speed = Math.sqrt(velocity[0] * velocity[0] + velocity[1] * velocity[1]);
    return speed;
}

var trails = [];

function trail() {
    var is_trail = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[World]footrail"]);
    var localPlayer = Entity.GetLocalPlayer();
	var trail_rads = rad_colors.shared.trail_history;
	var taril_true_color = trail_rads[0];
    var trail_size = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "Trail size"])
    var trail_thick = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "Trail thick"])
    if(UI.IsMenuOpen()){
        if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==1){
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Fade speed"], (is_trail)?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Trail size"], (is_trail)?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Trail thick"], (is_trail)?1:0);
        }else{
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Fade speed"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Trail size"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Trail thick"], 0);
        }
    }
    
    
	taril_true_color[3] = get_velocity()/(10-trail_thick)
    if(is_trail){
        if (Entity.IsValid(localPlayer) && get_velocity() > 25){
            var position = Entity.GetHitboxPosition(localPlayer, 6);
            if(Array.isArray(position)){
                trails.push({remove:Global.Tickcount() + 30, location:position, colored:taril_true_color});
    
                for ( var i in trails ){
                    var time = Global.Tickcount();
                    if (trails[i].remove <= time){
                        trails.splice(i, 1);
                    }
                    var location = trails[i].location;
                    var position = Render.WorldToScreen([location[0], location[1], location[2] - 55]);
                    Render.FilledCircle( position[0], position[1], trail_size, trails[i].colored);
                    
                }
            }
        }else{
            trails.splice(0, trails.length);
        }
    }
}
//Healthesp
function Health_base_esp(){
    // var font = Render.GetFont( "Minecraftia.ttf", 7, false)
    var is_esp_open = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[World]Health Base Box ESP"]);
    // UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Health type"], (is_esp_open?1:0));
    if(UI.IsMenuOpen()){
        if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==1){
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Box type"], (is_esp_open?1:0));
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Custom Color 1"], (is_esp_open?1:0));
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Custom Color 2"], (is_esp_open?1:0));
        }else{
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Box type"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Custom Color 1"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Custom Color 2"], 0);
        }
    }
    
    
    if (UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Health Base Box ESP"]))
    {
        clr1 = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Custom Color 1"])
        clr2 = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Custom Color 2"])
        if (clr1[3] >= 128) clr1[3] = 128
        plr = Entity.GetPlayers()
        for (i = 0; i < plr.length; i++)
        {
            if (Entity.IsEnemy(plr[i]) && Entity.IsAlive(plr[i]) && !Entity.IsDormant(plr[i])){
                var enemy_health = Entity.GetProp( plr[i], "CBasePlayer", "m_iHealth" );
                // var enemy_size = Render.TextSize( enemy_health+"", font );
                bounds = Entity.GetRenderBox(plr[i])
                if (bounds[0] == 1)
                {
                    if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Box type"])==0){
                        Render.GradientRect(bounds[1], bounds[2]+((bounds[4]-bounds[2])-(bounds[4]-bounds[2])*enemy_health/100), bounds[3]-bounds[1], (bounds[4]-bounds[2])*enemy_health/100,  0, [ 250 - enemy_health * 2.2, 5 + enemy_health * 2.2, 0, 0 ], [ 250 - enemy_health * 2.2, 5 + enemy_health * 2.2, 0, 255 ] )
                    }
                    if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Box type"])==1){
                        Render.GradientRect(bounds[1], bounds[2]+((bounds[4]-bounds[2])-(bounds[4]-bounds[2])*enemy_health/100), bounds[3]-bounds[1], (bounds[4]-bounds[2])*enemy_health/100,  0, [ clr1[0], clr1[1], clr1[2], clr1[3] ], [ 250 - enemy_health * 2.2, 5 + enemy_health * 2.2, 0, 180 ] )
                    }
                    if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Box type"])==2){
                        Render.GradientRect(bounds[1], bounds[2]+((bounds[4]-bounds[2])-(bounds[4]-bounds[2])*enemy_health/100), bounds[3]-bounds[1], (bounds[4]-bounds[2])*enemy_health/100,  0, [ clr1[0], clr1[1], clr1[2], 0 ], [ clr1[0], clr1[1], clr1[2], clr1[3]] )
                    }
                    if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Box type"])==3){
                        Render.GradientRect(bounds[1], bounds[2]+((bounds[4]-bounds[2])-(bounds[4]-bounds[2])*enemy_health/100), bounds[3]-bounds[1], (bounds[4]-bounds[2])*enemy_health/100,  0, [ clr1[0], clr1[1], clr1[2], clr1[3] ], [ clr2[0], clr2[1], clr2[2], clr2[3] ]  )
                    }
                    if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[ESP]Box type"])==4){
                        Render.GradientRect(bounds[1], bounds[2], bounds[3]-bounds[1], bounds[4]-bounds[2],  0, [ clr1[0], clr1[1], clr1[2], clr1[3] ], [ clr2[0], clr2[1], clr2[2], clr2[3] ] )
                    }
                }
            }
        }
    }   
}

//hitmarker
var damage_Vector = [ ];
var hit_dmg = 0,shot_clip = 1;
function draw_hitmarker(){
    var is_marker_open = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Hitmarker"]);
    var marker_color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Marker]color"]);
    var font_size = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Marker]size"]);
    if(UI.IsMenuOpen()){
        if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==1){
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Marker]color"], (is_marker_open?1:0));
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Marker]size"], (is_marker_open?1:0));
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Marker]Font"], (is_marker_open?1:0));
        }else{
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Marker]color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Marker]size"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Marker]Font"], 0);
        }
    }
    
    
    var font_select = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Marker]Font"]);
    var font_name,font_pos;
    if(font_select==0) font_name = "arial.ttf", font_pos = true;
    if(font_select==1) font_name = "smallest_pixel-7.ttf", font_pos = false;
    if(font_select==2) font_name = "Comfortaa-Bold.ttf", font_pos = false;
    if(font_select==3) font_name = "Verdana.ttf", font_pos = true;
    if(font_select==4) font_name = "calibri.ttf", font_pos = true;
    var hit_marker_font = Render.GetFont(font_name, font_size, font_pos);
    var text_size = Render.TextSize( hit_dmg+"", hit_marker_font );
    var r = marker_color[0];
    var g = marker_color[1];
    var b = marker_color[2];
    // Cheat.Print(damage_Vector[0].headshot+" "+damage_Vector[0].damage+"\n")
    if(is_marker_open){
        for ( var i in damage_Vector ){
            if (Globals.Realtime() - damage_Vector[i].time > 1) {
                damage_Vector.splice(i, 1);
                continue;
            }
            var anim_Time = Globals.Realtime() - damage_Vector[i].time;
            var final_Time = (anim_Time * 255) * -1;
            var world_To_Screen = Render.WorldToScreen(damage_Vector[i].vec3);
            var weapon_damage = damage_Vector[i].damage;
            var hit_group = damage_Vector[i].headshot;
            var y_floud = final_Time*-1/3;
            Render.String(world_To_Screen[0]-Render.TextSize(weapon_damage+"",hit_marker_font)[0]/2, world_To_Screen[1]-text_size[1]-y_floud, 0, weapon_damage+"", hit_group==1?[255,0,0,final_Time]:[ r, g, b, final_Time ], hit_marker_font );
        }
    }
}
function on_player_hit(){
    var victim = Entity.GetEntityFromUserID( Event.GetInt("userid" ) );
    var attacker = Entity.GetEntityFromUserID( Event.GetInt("attacker") );
    if ( !Entity.IsLocalPlayer(attacker) )
        return;
    var attack_Bone = Event.GetInt("hitgroup");
    hit_dmg = Event.GetInt('dmg_health');
    var pos = Entity.GetHitboxPosition( victim, attack_Bone );
    damage_Vector.push({headshot:Event.GetInt("hitgroup"),damage:Event.GetInt('dmg_health'),vec3:pos,time:Globals.Realtime()})
    if(damage_Vector.length>shot_clip) damage_Vector.shift();
    // pr(Event.GetInt("hitgroup"))
    // new Damage( Event.GetInt("hitgroup"), Event.GetInt('dmg_health'),pos, Globals.Realtime())
}
//effect
var effect_arr = [];
function death_effect(){
    var is_effect = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Kill effect"]);
    if(UI.IsMenuOpen()){
        if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==0){
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]Effect type"], is_effect?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect size"], is_effect?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect float speed"], is_effect?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect-fade time"], is_effect?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect color"], is_effect?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect - RGB"], is_effect?1:0);
        }else{
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]Effect type"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect size"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect float speed"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect-fade time"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect - RGB"], 0);
        }
    }
    
    var is_rgb = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect - RGB"]);
    var font_size = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect size"]);
    var float_speed = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect float speed"]);
    var fade_time = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect-fade time"]);
    var effect_color = is_rgb?rainbow(Global.Tickcount() % 350 / 250, 1, 1, 1, 255):UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Kill]effect color"]);
    var kill_type = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[Kill]Effect type"]);
    var font_name,font_state;
    if(kill_type==0) font_name="badcache.ttf",font_state = false;
    if(kill_type==1) font_name="love.ttf",font_state = false,font_size = font_size*2;
    var font = Render.GetFont(font_name, font_size, font_state);
    if(is_effect){
        for(var ind in effect_arr){
            if (Globals.Realtime() - effect_arr[ind].time > 1) {
                effect_arr.splice(ind, 1);
                continue;
            }
            var local_player = Entity.GetLocalPlayer()
            var death_victim = Entity.GetEntityFromUserID(effect_arr[ind].victim);
            var pos_victim = Entity.GetRenderBox(death_victim);
            var anim_Time = Globals.Realtime() - effect_arr[ind].time;
            var final_Time = (anim_Time * fade_time) * -1;
            var y_floud = final_Time*-1/float_speed;
            if(Entity.IsAlive(local_player)){
                if(kill_type==0) Render.String(pos_victim[1]+Render.TextSize("A",font)[0]/2, pos_victim[2]-y_floud, 0, "A", [effect_color[0], effect_color[1], effect_color[2], final_Time], font);
                if(kill_type==1){
                    Render.String(pos_victim[1]+Render.TextSize("A",font)[0]/2, pos_victim[2]-y_floud, 0, "A", [effect_color[0], effect_color[1], effect_color[2], final_Time], font);
                    Render.String(pos_victim[1]+Render.TextSize("A",font)[0]/2-1, pos_victim[2]-y_floud, 0, "A", [effect_color[0], effect_color[1], effect_color[2], final_Time], font);
                    Render.String(pos_victim[1]+Render.TextSize("A",font)[0]/2+1, pos_victim[2]-y_floud, 0, "A", [effect_color[0], effect_color[1], effect_color[2], final_Time], font);
                    Render.String(pos_victim[1]+Render.TextSize("A",font)[0]/2, pos_victim[2]-y_floud+1, 0, "A", [effect_color[0], effect_color[1], effect_color[2], final_Time], font);
                    Render.String(pos_victim[1]+Render.TextSize("A",font)[0]/2, pos_victim[2]-y_floud-1, 0, "A", [effect_color[0], effect_color[1], effect_color[2], final_Time], font);
                }
            }
        }
    }
}
function on_death(){
    var death_attack = Entity.GetEntityFromUserID(Event.GetInt("attacker"));
    var death_victim = Entity.GetEntityFromUserID(Event.GetInt("userid"));
    var local_player = Entity.GetLocalPlayer();
    if(death_attack == local_player&&death_victim != local_player){
        effect_arr.push({victim:Event.GetInt("userid"),distant:Event.GetFloat("distance"),time:Globals.Realtime()});
    }
}
//buylist
//buylist
wtt = 300
hgg = 50
    //buylist
name1 = "";
name2 = "";
name3 = "";
name4 = "";
name5 = "";
allweapon1 = "";
allweapon2 = "";
allweapon3 = "";
allweapon4 = "";
allweapon5 = "";

function drawbuylist() {

    var re_theme_cset = UI.GetColor( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Color picker"] );
    var re_theme_type = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Theme style"]);
    var re_theme_color = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Color method"]);

    var buy_font = Render.GetFont("lucon.ttf", 12, true);
    var draw_font = Render.GetFont("icons_new.ttf", 15, false);
    var mordern_font = Render.GetFont("seguisb.ttf", 14, true);

    var font2 = Render.GetFont("Comfortaa-Bold.ttf", 12, false);
    var bl = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Buylist"]);
    if(UI.IsMenuOpen()){
        if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==1&&bl){
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist] x"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist] y"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist]item color"], 1);
        }else{
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist] x"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist] y"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist]item color"], 0);
        }
    }
    
    if (Entity.IsAlive(Entity.GetLocalPlayer()) == false)
        return;
    x = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist] x"])
    y = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist] y"])
    var font = Render.GetFont("astriumwep.ttf", 16, false);
    
    if (bl) {
        // Cheat.Print(hgg + "\n");
        var item_text = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist]item color"]);
        var rgb_color = (re_theme_color==0||re_theme_color==1)?re_theme_cset:rainbow(Global.Tickcount() % 350 / 350, 1, 1, 1, 255);
        switch(re_theme_type){
            case 0:
                if(re_theme_color==0){
                    Render.GradientRect(x + 45, y+13, 220, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[1],rgb_color[2],255]);
                }else{
                    Render.GradientRect(x + 45, y+13, 110, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[2],rgb_color[1],255]);
                    Render.GradientRect(x + 155, y+13, 110, 2, 1, [rgb_color[0],rgb_color[2],rgb_color[1],255],[rgb_color[2],rgb_color[1],rgb_color[0],255]);
                }
                Render.GradientRect(x + 45, y+15, 220, 23, 1, [35,35,35,180],[35,35,35,180]);
                Render.String(x + 156-Render.TextSize("Buylist",buy_font)[0]/2, y+21, 0, "Buylist", [25, 25, 25,  255], buy_font);
                Render.String(x + 155-Render.TextSize("Buylist",buy_font)[0]/2, y+20, 0, "Buylist", [255, 255, 255,  255], buy_font);
            break;
            case 1:
                if(re_theme_color==0){
                    Render.GradientRect(x + 45, y+13, 100, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[1],rgb_color[2],0]);
                    Render.GradientRect(x + 165, y+13, 100, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],0],[rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    Render.GradientRect(x + 43, y+13, 2, 25, 0, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    Render.GradientRect(x + 265, y+13, 2, 25, 0, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    Render.GradientRect(x + 43, y+38, 112, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[1],rgb_color[2],0]);
                    Render.GradientRect(x + 155, y+38, 112, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],0],[rgb_color[0],rgb_color[1],rgb_color[2],255]);
                }else{
                    Render.GradientRect(x + 45, y+13, 100, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[2],rgb_color[1],0]);
                    Render.GradientRect(x + 165, y+13, 100, 2, 1, [rgb_color[0],rgb_color[2],rgb_color[1],0],[rgb_color[2],rgb_color[1],rgb_color[0],255]);
                    Render.GradientRect(x + 43, y+13, 2, 25, 0, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[1],rgb_color[0],rgb_color[2],255]);
                    Render.GradientRect(x + 265, y+13, 2, 25, 0, [rgb_color[2],rgb_color[1],rgb_color[0],255],[rgb_color[1],rgb_color[0],rgb_color[2],255]);
                    Render.GradientRect(x + 43, y+38, 112, 2, 1, [rgb_color[1],rgb_color[0],rgb_color[2],255],[rgb_color[1],rgb_color[2],rgb_color[0],0]);
                    Render.GradientRect(x + 155, y+38, 112, 2, 1, [rgb_color[2],rgb_color[1],rgb_color[0],0],[rgb_color[1],rgb_color[0],rgb_color[2],255]);
                }
                Render.GradientRect(x + 45, y+15, 220, 23, 1, [35,35,35,180],[35,35,35,180]);
                Render.String(x + 156-Render.TextSize("Buylist",buy_font)[0]/2, y+21, 0, "Buylist", [25, 25, 25,  255], buy_font);
                Render.String(x + 155-Render.TextSize("Buylist",buy_font)[0]/2, y+20, 0, "Buylist", [255, 255, 255,  255], buy_font);
            break;
            case 2:
                if(re_theme_color==0){
                    Render.GradientRect(x + 45, y+13, 110, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    Render.GradientRect(x + 155, y+13, 110, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    Render.GradientRect(x + 43, y+13, 2, 25, 0, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    Render.GradientRect(x + 265, y+13, 2, 25, 0, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    Render.GradientRect(x + 43, y+38, 112, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    Render.GradientRect(x + 155, y+38, 112, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[1],rgb_color[2],255]);
                }else{
                    Render.GradientRect(x + 45, y+13, 110, 2, 1, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[0],rgb_color[2],rgb_color[1],255]);
                    Render.GradientRect(x + 155, y+13, 110, 2, 1, [rgb_color[0],rgb_color[2],rgb_color[1],255],[rgb_color[2],rgb_color[1],rgb_color[0],255]);
                    Render.GradientRect(x + 43, y+13, 2, 25, 0, [rgb_color[0],rgb_color[1],rgb_color[2],255],[rgb_color[1],rgb_color[0],rgb_color[2],255]);
                    Render.GradientRect(x + 265, y+13, 2, 25, 0, [rgb_color[2],rgb_color[1],rgb_color[0],255],[rgb_color[1],rgb_color[0],rgb_color[2],255]);
                    Render.GradientRect(x + 43, y+38, 112, 2, 1, [rgb_color[1],rgb_color[0],rgb_color[2],255],[rgb_color[2],rgb_color[1],rgb_color[0],255]);
                    Render.GradientRect(x + 155, y+38, 112, 2, 1, [rgb_color[2],rgb_color[1],rgb_color[0],255],[rgb_color[1],rgb_color[0],rgb_color[2],255]);
                }
                Render.GradientRect(x + 45, y+15, 220, 23, 1, [35,35,35,180],[35,35,35,180]);
                Render.String(x + 156-Render.TextSize("Buylist",buy_font)[0]/2, y+21, 0, "Buylist", [25, 25, 25,  255], buy_font);
                Render.String(x + 155-Render.TextSize("Buylist",buy_font)[0]/2, y+20, 0, "Buylist", [255, 255, 255,  255], buy_font);
            break;
            case 3:
                if(re_theme_color==0){
                    Render.GradientRect(x + 47, y+11, 216, 2, 1 , [rgb_color[0],rgb_color[1],rgb_color[2],255] , [rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    Render.GradientRect(x + 46, y+12, 218, 2, 1 , [rgb_color[0],rgb_color[1],rgb_color[2],255] , [rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    Render.GradientRect(x + 45, y+13, 220, 2, 1 , [rgb_color[0],rgb_color[1],rgb_color[2],255] , [rgb_color[0],rgb_color[1],rgb_color[2],255]);
                }else{
                    Render.GradientRect(x + 47, y+11, 216, 2, 1 , [rgb_color[0],rgb_color[1],rgb_color[2],255] , [rgb_color[2],rgb_color[0],rgb_color[1],255]);
                    Render.GradientRect(x + 46, y+12, 218, 2, 1 , [rgb_color[0],rgb_color[1],rgb_color[2],255] , [rgb_color[2],rgb_color[0],rgb_color[1],255]);
                    Render.GradientRect(x + 45, y+13, 220, 2, 1 , [rgb_color[0],rgb_color[1],rgb_color[2],255] , [rgb_color[2],rgb_color[0],rgb_color[1],255]);
                }
                Render.GradientRect(x + 46, y+14, 218, 23, 1, [35,35,35,255],[35,35,35,255]);
                Render.GradientRect(x + 45, y+15, 220, 23, 1, [35,35,35,255],[35,35,35,255]);
                Render.GradientRect(x + 45, y+36, 220, 2, 1, [25,25,25,255],[25,25,25,255]);
                Render.String(x + 51+Render.TextSize("b",draw_font)[0]/2, y+18, 0, "b", [255, 255, 255,255/1.3], draw_font);
                Render.String(x + 59+Render.TextSize("b",draw_font)[0]/2+Render.TextSize("Buylist",mordern_font)[0]/2, y+15, 0, "Buylist", [255, 255, 255,255/1.3], mordern_font);
            break;
        }
        wtt = 300
        hgg = 50
        y_y = y
        x_x = x
        if (name1 != "") {
            Render.String(x_x + 155 - 93, y_y + 22 + 29, 0, name1, [255, 255, 255, 255], font2);
            if (allweapon1 != "") {
                Render.String(x_x + 175, y_y + 22 + 27, 0, allweapon1, item_text, font);
            }
        }
        if (name2 != "") {
            hgg = hgg + 22;
            Render.String(x_x + 155 - 93, y_y + 22 + 54, 0, name2, [255, 255, 255, 255], font2);
            if (allweapon2 != "") {
                Render.String(x_x + 175, y_y + 22 + 52, 0, allweapon2, item_text, font);
            }
        }
        if (name3 != "") {
            hgg = hgg + 22;
            Render.String(x_x + 155 - 93, y_y + 22 + 79, 0, name3, [255, 255, 255, 255], font2);
            if (allweapon3 != "") {
                Render.String(x_x + 175, y_y + 22 + 77, 0, allweapon3, item_text, font);
            }
        }
        if (name4 != "") {
            hgg = hgg + 22;
            Render.String(x_x + 155 - 93, y_y + 22 + 104, 0, name4, [255, 255, 255, 255], font2);
            if (allweapon4 != "") {
                Render.String(x_x + 175, y_y + 22 + 102, 0, allweapon4, item_text, font);
            }
        }
        if (name5 != "") {
            hgg = hgg + 22;
            Render.String(x_x + 155 - 93, y_y + 22 + 129, 0, name5, [255, 255, 255, 255], font2);
            if (allweapon5 != "") {
                Render.String(x_x + 175, y_y + 22 + 127, 0, allweapon5, item_text, font);
            }
        }
        if (Global.IsKeyPressed(1) && UI.IsMenuOpen()) {
            const mouse_pos = Global.GetCursorPosition();
            if (in_bounds(mouse_pos, x + 45, y, x + 345, y + 157)) {
                UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[Buylist] x"], mouse_pos[0] - 150);
                UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[Buylist] y"], mouse_pos[1] - 20);
            }
        }
    }
}

function BuyLogss() {
    ent = Entity.GetName(Entity.GetEntityFromUserID(Event.GetInt('userid')));
    team = Event.GetInt('team')
    if (team != Entity.GetProp(Entity.GetLocalPlayer(), "CBaseEntity", "m_iTeamNum")) {
        if (name1 == "") {
            name1 = Entity.GetName(Entity.GetEntityFromUserID(Event.GetInt('userid')));
        } else {
            if ((name2 == "") && (name1 != ent)) {
                name2 = ent;
            }
            if ((name3 == "") && (name2 != ent)) {
                if (name1 != ent) {
                    name3 = ent;
                }
            }
            if ((name4 == "") && (name3 != ent)) {
                if ((name2 != ent) && (name1 != ent)) {
                    name4 = ent;
                }
            }
            if ((name5 == "") && (name4 != ent)) {
                if ((name3 != ent) && (name2 != ent)) {
                    if (name1 != ent) {
                        name5 = ent;
                    }
                }
            }
        }
        if (ent == name1) {
            allweapon1 = allweapon1 + get_icon(Event.GetString('weapon'));
        }
        if (ent == name2) {
            allweapon2 = allweapon2 + get_icon(Event.GetString('weapon'));
        }
        if (ent == name3) {
            allweapon3 = allweapon3 + get_icon(Event.GetString('weapon'));
        }
        if (ent == name4) {
            allweapon4 = allweapon4 + get_icon(Event.GetString('weapon'));
        }
        if (ent == name5) {
            allweapon5 = allweapon5 + get_icon(Event.GetString('weapon'));
        }
    }
}

function roundend() {
    name1 = "";
    name2 = "";
    name3 = "";
    name4 = "";
    name5 = "";
    allweapon1 = "";
    allweapon2 = "";
    allweapon3 = "";
    allweapon4 = "";
    allweapon5 = "";
}

function rountstart() {
    name1 = "";
    name2 = "";
    name3 = "";
    name4 = "";
    name5 = "";
    allweapon1 = "";
    allweapon2 = "";
    allweapon3 = "";
    allweapon4 = "";
    allweapon5 = "";
}

function get_icon(a) {
    var letter = ""
    switch (a) {
        case "weapon_deagle":
            letter = "A"
            break
        case "weapon_elite":
            letter = "B"
            break
        case "weapon_fiveseven":
            letter = "C"
            break
        case "weapon_glock":
            letter = "D"
            break
        case "weapon_ak47":
            letter = "W"
            break
        case "weapon_aug":
            letter = "U"
            break
        case "weapon_awp":
            letter = "Z"
            break
        case "weapon_famas":
            letter = "R"
            break
        case "weapon_m249":
            letter = "g"
            break
        case "weapon_g3sg1":
            letter = "X"
            break
        case "weapon_galilar":
            letter = "Q"
            break
        case "weapon_m4a1":
            letter = "S"
            break
        case "weapon_m4a1_silencer":
            letter = "T"
            break
        case "weapon_mac10":
            letter = "K"
            break
        case "weapon_hkp2000":
            letter = "E"
            break
        case "weapon_mp5sd":
            letter = "N"
            break
        case "weapon_ump45":
            letter = "L"
            break
        case "weapon_xm1014":
            letter = "b"
            break
        case "weapon_bizon":
            letter = "M"
            break
        case "weapon_mag7":
            letter = "d"
            break
        case "weapon_negev":
            letter = "f"
            break
        case "weapon_sawedoff":
            letter = "c"
            break
        case "weapon_tec9":
            letter = "H"
            break
        case "weapon_taser":
            letter = "h"
            break
        case "weapon_p250":
            letter = "F"
            break
        case "weapon_mp7":
            letter = "N"
            break
        case "weapon_mp9":
            letter = "O"
            break
        case "weapon_nova":
            letter = "e"
            break
        case "weapon_p90":
            letter = "P"
            break
        case "weapon_scar20":
            letter = "Y"
            break
        case "weapon_sg556":
            letter = "V"
            break
        case "weapon_ssg08":
            letter = "a"
            break
        case "weapon_flashbang":
            letter = "i"
            break
        case "weapon_hegrenade":
            letter = "j"
            break
        case "weapon_smokegrenade":
            letter = "k"
            break
        case "weapon_molotov":
            letter = "l"
            break
        case "weapon_decoy":
            letter = "m"
            break
        case "weapon_incgrenade":
            letter = "n"
            break
        case "weapon_usp_silencer":
            letter = "G"
            break
        case "weapon_cz75a":
            letter = "I"
            break
        case "weapon_revolver":
            letter = "J"
            break
        case "item_assaultsuit":
            letter = "p"
            break
        case "item_kevlar":
            letter = "q"
            break
        case "item_defuser":
            letter = "r"
            break
        default:
            letter = ""
            break
    }
    return letter
}
//buylist
//bullet
var bullet_imp = [];

function bullet_get(){
    var player_id = Event.GetInt("userid");
    var bullet_rads = rad_colors.shared.purple_history;
    var bullet_rgb = bullet_rads[0];
    var player_index = Entity.GetEntityFromUserID( player_id );
    if(player_index == Entity.GetLocalPlayer()){
        var local_eyepos = Entity.GetEyePosition(Entity.GetLocalPlayer());
        bullet_imp.push({impx:Event.GetFloat("x"),impy:Event.GetFloat("y"),impz:Event.GetFloat("z"),eyepos:local_eyepos,time:Globals.Realtime(),rgb:bullet_rgb});
    }
}
function draw_bullet(){
    var is_bullet_open = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[World]Bullet Tracers"]);
    if(UI.IsMenuOpen()){
        if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==1){
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]Tracer time"], (is_bullet_open?1:0));
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]Tracer color"], (is_bullet_open?1:0));
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]Drop Point Marker"], (is_bullet_open?1:0));
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]color style"], (is_bullet_open?1:0));
        }else{
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]Tracer time"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]Tracer color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]Drop Point Marker"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]color style"], 0);
        }
    }
    var font = Render.GetFont("verdana.ttf",14,true)
    var bullet_style = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]color style"]);
    var draw_point_mark = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]Drop Point Marker"])
    var bullet_time = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]Tracer time"]);
    if(is_bullet_open){
        for(var i in bullet_imp){
            if(Globals.Realtime() - bullet_imp[i].time > bullet_time){
                bullet_imp.splice(i,1);
                continue;
            }
            var anim_Time = Globals.Realtime() - bullet_imp[i].time;
            var final_Time = (anim_Time * (255/bullet_time)) * -1;
            var bullet_color = bullet_style==0?UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Bullet]Tracer color"]):bullet_imp[i].rgb;
            var real_eyepos = Render.WorldToScreen(bullet_imp[i].eyepos);
            var bullet_pos = Render.WorldToScreen([bullet_imp[i].impx,bullet_imp[i].impy,bullet_imp[i].impz]);
            if (bullet_pos[2] != undefined && real_eyepos[2] != undefined&&bullet_pos[2] != 0 && real_eyepos[2] != 0 &&bullet_pos[0]!=0&&real_eyepos[0]!=0&&real_eyepos[1]!=0){
                Render.Line(real_eyepos[0], real_eyepos[1], bullet_pos[0], bullet_pos[1], [bullet_color[0],bullet_color[1],bullet_color[2],final_Time]);
                // Render.String(bullet_pos[0]-5, bullet_pos[1]-20,0,"x",bullet_color,bullet_font)
                if(draw_point_mark==0){
                    Render.Circle(bullet_pos[0], bullet_pos[1],6,[bullet_color[0],bullet_color[1],bullet_color[2],final_Time]);
                    Render.Circle(bullet_pos[0], bullet_pos[1],1,[bullet_color[0],bullet_color[1],bullet_color[2],final_Time]);
                }else if(draw_point_mark==1){
                    Render.String(bullet_pos[0]-Render.TextSize("+",font)[0]/2, bullet_pos[1]-Render.TextSize("+",font)[1]/1.35,0,"+",[bullet_color[0],bullet_color[1],bullet_color[2],final_Time],font)
                }else if(draw_point_mark==2){
                    Render.Rect( bullet_pos[0]-6, bullet_pos[1]-6, 10, 10, [bullet_color[0],bullet_color[1],bullet_color[2],final_Time] );
                }
                
            }
        }
    }
}
//fd
function ANGLE2VEC(angle) {
    var pitch = angle[0];
    var yaw = angle[1];
    return [Math.cos(deg2rad(pitch)) * Math.cos(deg2rad(yaw)), Math.cos(deg2rad(pitch)) * Math.sin(deg2rad(yaw)), -Math.sin(deg2rad(pitch))];
}

function getWallDistance(entity, angle) {
    var vector = ANGLE2VEC(angle);
    var origin = Entity.GetRenderOrigin(entity);
    origin[2] += Entity.GetProp(entity, "CBasePlayer", "m_vecViewOffset[2]")[0];
    var end = [origin[0] + vector[0] * 8192, origin[1] + vector[1] * 8192, origin[2] + vector[2] * 8192];
    var result = Trace.Line(entity, origin, end);
    if (result[1] != 1) {
        var wall = [origin[0] + vector[0] * result[1] * 8192, origin[1] + vector[1] * result[1] * 8192, origin[2] + vector[2] * result[1] * 8192];
        var distance = Math.sqrt(Math.pow(origin[0] - wall[0], 2) + Math.pow(origin[1] - wall[1], 2) + Math.pow(origin[2] - wall[2], 2));
        return distance;
    } else {
        return 0;
    }
}


function fastDuckUpdate() {
    var buttons = UserCMD.GetButtons();
    var localPlayer=Entity.GetLocalPlayer();
    var maxLevel=31;
    var valve = Entity.GetProp(Entity.GetGameRulesProxy(), "CCSGameRulesProxy", "m_bIsValveDS");
    if (valve) {
        if (UI.GetValue(["Rage", "Anti Aim", "Key assignment", "Fake duck"])) {
            enableFakeLag = false;
            var duckAmount = Entity.GetProp(localPlayer, "CCSPlayer", "m_flDuckAmount");
            UserCMD.Choke();
            if (duckAmount <= maxLevel / 100) {
                crouched = true
            };
            if (duckAmount >= 0.8) {
                crouched = false;
                UserCMD.Send()
            };
            if (crouched) {
                UserCMD.SetButtons(buttons | (1 << 2));
            } else {
                UserCMD.SetButtons(buttons | (1 << 22));
            }
            var eyePos = Entity.GetEyePosition(localPlayer);
            var origin = Entity.GetRenderOrigin(localPlayer);
            eyePos[2] = origin[2] + 46 + (18 - (maxLevel + 1) / 100 * 18);
            cameraPos=Local.GetCameraPosition();
            if(!Input.IsKeyPressed(0x11)){
                if(UI.GetValue(["Misc.","Keys","Keys","Key assignment","Thirdperson"])==1){
                    angles=Local.GetViewAngles();
                    angles[0]=angles[0]*-1;
                    if(angles[1]>0){
                        angles[1]=angles[1]-180;
                    }else{
                        angles[1]=180+angles[1];
                    }
                    var back = getWallDistance(localPlayer, angles);
                    var angles=ANGLE2VEC(angles);
                    var thirdDistance=UI.GetValue(["Misc.","View","Camera","Thirdperson distance"]);
                    if(back<thirdDistance){
                        thirdDistance=back-10;
                    }
                    Local.SetCameraPosition([eyePos[0]+angles[0]*thirdDistance,eyePos[1]+angles[1]*thirdDistance,eyePos[2]+angles[2]*thirdDistance]);
                }else{
                    Local.SetCameraPosition([eyePos[0],eyePos[1],eyePos[2]]);
                }
            }
        } else {
            UserCMD.SetButtons(buttons | (1 << 22));
            enableFakeLag = true;
        }
    }
}
function BuyLogs() {
    if (UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Buy Log"])) {
        var ent = Entity.GetEntityFromUserID(Event.GetInt('userid'))
        var team = Event.GetInt('team')
        if (team != Entity.GetProp(Entity.GetLocalPlayer(), "CBaseEntity", "m_iTeamNum")) {
            var item = Event.GetString('weapon')
            item = item.replace("weapon_", "")
            item = item.replace("item_", "")
            item = item.replace("assaultsuit", "防弹衣+防弹头盔")
            item = item.replace("kevlar", "防弹衣")
            item = item.replace("incgrenade", "燃烧弹")
            item = item.replace("hegrenade", "高爆手雷")
            item = item.replace("decoy", "诱饵弹")
            item = item.replace("galilar", "加利尔AR")
            item = item.replace("famas", "法玛斯")
            item = item.replace("ssg08", "鸟狙")
            item = item.replace("awp", "大狙")
            item = item.replace("ssg08", "鸟狙")
            item = item.replace("awp", "大狙")
            item = item.replace("flashbang", "闪光弹")
            if (item != "unknown") {
                var name = Entity.GetName(ent)
                Global.PrintChat(" \x01[\x03梦魇\x01] \x08" + "玩家 \x06" + name + " \x01购买了 \x04" + item + " \n");
                Cheat.PrintColor([131, 111, 255, 255], "[梦魇] 购买记录：");
                Cheat.PrintColor([240, 255, 255, 255], "玩家 ");
                Cheat.PrintColor([255, 127, 0, 255], name + "");
                Cheat.PrintColor([240, 255, 255, 255], "购买了 ");
                Cheat.PrintColor([0, 255, 127, 255], item + "\n");
            }
        }
    }
}
//target sign
var target_sign = 0

function onCM() {
    target_sign = Ragebot.GetTarget();
}

function Draw_target() {
    var font3 = Render.GetFont("verdanab.ttf", 25, true);
    ts = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]Target Sign"]);
    var colors = rainbow(Global.Realtime() * UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Global]Gradient Speed"]), 1, 1 ,1,255);
    var pos = Entity.GetRenderBox(target_sign);
    var a = pos[3] - pos[1];
    a /= 2;
    a += pos[1];
    if (ts == 1&&Entity.IsAlive(Entity.GetLocalPlayer())) {
        Render.FilledCircle(a, pos[2] - 28, 15, [15, 15, 15, 200]);
        Render.Circle(a, pos[2] - 28, 15, [colors[0], colors[1], colors[2], 255]);
        Render.Circle(a, pos[2] - 28, 14, [colors[0], colors[1], colors[2], 255]);
        Render.String(a - 4.5, pos[2] - 45, 0, "!", [colors[0], colors[1], colors[2], 255], font3);
    }
}
//Heaven
var heaven = 0;
var heaven_wt = 30;
var flg_heaven = false;
var heaven_i = 0;
function Heaven() {
    itype = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "Heaven2.0"]);
    if(UI.IsMenuOpen()){
        if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==0){
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Indicator x"], itype?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Indicator y"], itype?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Rainbow"], itype?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]FL Color"], itype?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Desync Color"], itype?1:0);
        }else{
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Indicator x"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Indicator y"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Rainbow"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]FL Color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Desync Color"], 0);
        }
    }
    
    
    const ticks = script.shared.choke_history;
    var font = Render.GetFont("seguisb.ttf", 10, true);
    var font2 = Render.GetFont("verdanab.ttf", 10, true);
    var colors = rainbow(Global.Realtime() * UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Global]Gradient Speed"]), 1, 1, 1,255);
    x1 = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Indicator x"]);
    y1 = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Indicator y"]);
    var limit = UI.GetValue(["Rage", "Fake Lag", "Limit"]);
    var tlimit = UI.GetValue(["Rage", "Fake Lag", "Trigger limit"]);

    var local = Entity.GetLocalPlayer();
    var local_velocity = Entity.GetProp(local, "CBasePlayer", "m_vecVelocity[0]");
    var local_vel_length = vec_length_2d(local_velocity);
    var slowwalk_toggled = UI.GetValue(["Rage", "Anti Aim", "Key assignment", "Slow walk"]) && local_vel_length > 1.10;
    var sw = UI.GetValue(["Rage", "Anti Aim", "Key assignment", "Slow walk"]);
    hr = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Rainbow"]);
    hf = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]FL Color"]);
    hd = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Heaven]Desync Color"]);
    if(itype){
        heaven = 1;
        Render.GradientRect(x1, y1, 240, 50, 1, [30, 30, 30, 255], [30, 30, 30, 20]);
        if (heaven_wt >= 30) {
            flg_heaven = false;
        } else if (heaven_wt < 10) {
            flg_heaven = true;
        }
        if (flg_heaven == false) {
            heaven_i = 0.06;
            heaven_wt -= heaven_i;
        }
        if (flg_heaven == true) {
            heaven_wt += heaven_i;
        }
        if (hr == 1) {
            Render.GradientRect(x1, y1, heaven_wt, 50, 1, [colors[0], colors[1], colors[2], 255], [30, 30, 30, 0]);//g-0 b-1 r-2
            Render.GradientRect(x1, y1, 120, 2, 1, [colors[0], colors[1], colors[2], 255], [colors[2], colors[0], colors[1], 0]);
            Render.GradientRect(x1, y1, 2, 50, 0, [colors[0], colors[1], colors[2], 255], [colors[0], colors[1], colors[2], 255]);
            Render.GradientRect(x1, y1 + 50, 180, 2, 1, [colors[0], colors[1], colors[2], 255], [colors[2], colors[0], colors[1], 0]);
        } else {
            Render.GradientRect(x1, y1, heaven_wt, 50, 1, hf, [30, 30, 30, 0]);
            Render.GradientRect(x1, y1, 120, 2, 1, hf, [255, 250, 250, 0]);
            Render.GradientRect(x1, y1, 2, 50, 0, hf, hf);
            Render.GradientRect(x1, y1 + 50, 180, 2, 1, hf, [255, 250, 250, 0]);
        }
    
        Render.String(x1 + 10, y1 + 6, 0, "FAKE LAG  :", [48, 222, 239, 255], font);
        if (limit != 0) {
            Render.String(x1 + 73, y1 + 6, 0, "FLUCTUATED", [255, 255, 255, 255], font);
            Render.String(x1 + 73, y1 + 32, 0, ticks[0] + "-" + ticks[1] + "-" + ticks[2] + "-" + ticks[3], [255, 255, 255, 255], font);
        } else {
            Render.String(x1 + 73, y1 + 6, 0, "DEFALUT", [255, 255, 255, 255], font);
            Render.String(x1 + 73, y1 + 32, 0, ticks[0] + "-" + ticks[1] + "-" + ticks[2] + "-" + ticks[3], [255, 255, 255, 255], font);
        }
        Render.String(x1 + 172, y1 + 6, 0, "NIGHTMARE", [77, 144, 199, 255], font2);
        Render.String(x1 + 200, y1 + 32, 0, "[PAID]", [255, 215, 0, 255], font2);
        Render.GradientRect(x1, y1 + 25, 240, 2, 1, [255, 255, 255, 50], [255, 255, 255, 50]);
        Render.GradientRect(x1, y1 + 25, limit * 17.14, 2, 1, [105, 105, 105, 50], [255, 255, 255, 255]);
    
        Render.String(x1 + 10, y1 + 32, 0, "HISTORY   :", [48, 222, 239, 255], font);
    
        Render.String(x1 + 120, y1 + 32, 0, "M:  14", [154, 205, 50, 255], font);
        Render.String(x1 + 150, y1 + 32, 0, "F:  " + (tlimit - limit), [154, 205, 50, 255], font);
        Render.GradientRect(x1, y1 + 60, 240, 50, 1, [30, 30, 30, 255], [30, 30, 30, 20]);
        if (hr == 1) {
            Render.GradientRect(x1, y1 + 60, heaven_wt, 50, 1, [colors[0], colors[1], colors[2], 255], [30, 30, 30, 0]);
            Render.GradientRect(x1, y1 + 60, 120, 2, 1, [colors[0], colors[1], colors[2], 255], [colors[2], colors[0], colors[1], 0]);
            Render.GradientRect(x1, y1 + 60, 2, 50, 0, [colors[0], colors[1], colors[2], 255], [colors[0], colors[1], colors[2], 255]);
            Render.GradientRect(x1, y1 + 110, 180, 2, 1, [colors[0], colors[1], colors[2], 255], [colors[2], colors[0], colors[1], 0]);
        } else {
            Render.GradientRect(x1, y1 + 60, heaven_wt, 50, 1, hd, [30, 30, 30, 0]);
            Render.GradientRect(x1, y1 + 60, 120, 2, 1, hd, [255, 250, 250, 0]);
            Render.GradientRect(x1, y1 + 60, 2, 50, 0, hd, hd);
            Render.GradientRect(x1, y1 + 110, 180, 2, 1, hd, [255, 250, 250, 0]);
        }
    
        Render.String(x1 + 10, y1 + 66, 0, "DESYNC:", [255, 105, 180, 255], font);
        fakeyaw = Local.GetFakeYaw();
        var num = Math.round(fakeyaw)
        var num1 = num;
        if (num1 < 0) {
            num1 *= -1;
        }
        Render.String(x1 + 60, y1 + 66, 0, num + "", [255, 255, 255, 255], font);
        if (num / 100 >= 1 || num / 100 <= -1) {
            Render.Circle(x1 + 83, y1 + 66, 1, [255, 255, 255, 255]);
        } else {
            Render.Circle(x1 + 80, y1 + 66, 1, [255, 255, 255, 255]);
        }
        Render.String(x1 + 90, y1 + 66, 0, "/", [255, 255, 255, 255], font);
        Render.String(x1 + 100, y1 + 66, 0, "DIR:", [154, 205, 50, 255], font);
        Render.String(x1 + 172, y1 + 66, 0, "NIGHTMARE", [77, 144, 199, 255], font2);
        if (UI.GetValue(["Rage", "Anti Aim", "Directions", "At targets"]) == 0) {
            Render.String(x1 + 125, y1 + 66, 0, "DEFALUT", [255, 255, 255, 255], font);
        } else {
            Render.String(x1 + 125, y1 + 66, 0, "TARGET", [255, 255, 255, 255], font);
        }
        Render.GradientRect(x1, y1 + 85, 240, 2, 1, [255, 255, 255, 50], [255, 255, 255, 50]);
        Render.GradientRect(x1, y1 + 85, num1 * 1.33, 2, 1, [105, 105, 105, 50], [255, 255, 255, 255]);
        Render.String(x1 + 10, y1 + 92, 0, "ACCT.P:", [255, 105, 180, 255], font);
    
        inaccuracy = Local.GetInaccuracy();
        accuracy = 1 - inaccuracy;
        acc = (accuracy).toFixed(2);
        if (accuracy >= 0.8) {
            Render.String(x1 + 60, y1 + 92, 0, "ONETAP", [255, 255, 255, 255], font);
        } else if (accuracy >= 0.57 && accuracy < 0.8) {
            Render.String(x1 + 60, y1 + 92, 0, "HIGH", [255, 255, 255, 255], font);
        } else {
            Render.String(x1 + 60, y1 + 92, 0, "LOW", [255, 255, 255, 255], font);
        }
        Render.String(x1 + 105, y1 + 92, 0, "/", [255, 255, 255, 255], font);
        Render.String(x1 + 118, y1 + 92, 0, "ACC:  " + acc, [154, 205, 50, 255], font);
        if (slowwalk_toggled) {
            Render.String(x1 + 172, y1 + 92, 0, "Slowwalking", [238, 130, 238, 255], font2);
        } else if (local_vel_length > 1.10 && sw == 0) {
            Render.String(x1 + 172, y1 + 92, 0, "Moving", [238, 130, 238, 255], font2);
        } else {
            Render.String(x1 + 172, y1 + 92, 0, "Standing", [238, 130, 238, 255], font2);
        }
    }
    
}
//dmglog
var logs_hitboxes = [
    'generic',
    '头部',
    '身体',
    '胃',
    '左臂',
    '右臂',
    '左腿',
    '右腿',
    '脖子'
];
var logs_shots = 0;
var logs_predicthc = 0;
var logs_safety1 = 0;
var logs_hitboxName = "";
var logs_exploit = 0;
function getHitboxName(index)
{
    switch (index)
    {
        case 0:
            logs_hitboxName = "头部";
            break;
        case 1:
            logs_hitboxName = "头部";
            break;
        case 2:
            logs_hitboxName = "胃";
            break;
        case 3:
            logs_hitboxName = "胃";
            break;
        case 4:
            logs_hitboxName = "胃";
            break;
        case 5:
            logs_hitboxName = "身体";
            break;
        case 6:
            logs_hitboxName = "身体";
            break;
        case 7:
            logs_hitboxName = "左腿";
            break;
        case 8:
            logs_hitboxName = "右腿";
            break;
        case 9:
            logs_hitboxName = "左腿";
            break;
        case 10:
            logs_hitboxName = "右腿";
            break;
        case 11:
            logs_hitboxName = "左腿";
            break;
        case 12:
            logs_hitboxName = "右腿";
            break;
        case 13:
            logs_hitboxName = "左臂";
            break;
        case 14:
            logs_hitboxName = "右臂";
            break;
        case 15:
            logs_hitboxName = "左臂";
            break;
        case 16:
            logs_hitboxName = "左臂";
            break;
        case 17:
            logs_hitboxName = "右臂";
            break;
        case 18:
            logs_hitboxName = "右臂";
            break;
        default:
            logs_hitboxName = "身体";
    }
    return logs_hitboxName;
}
function HitgroupName(index) {
    return logs_hitboxes[index] || '身体';
}

var logs_target = -1;
var logs_shots_fired = 0;
var logs_hits = 0;
var logs_lastUpdate = 0;
var logs_logged = false;
var logs_tickrate = Globals.Tickrate()



function ragebot_fire() {
    logs_predicthc = Event.GetInt("hitchance");
    logs_safety1 = Event.GetInt("safepoint");
    logs_hitboxName = getHitboxName(Event.GetInt("hitbox"));
    logs_exploit = (Event.GetInt("exploit")+1).toString();
    logs_target = Event.GetInt("target_index");
    logs_shots_fired++;
    logs_logged = false;
    logs_lastUpdate = Globals.Curtime();
}

function hitlog() {
    var hit = Entity.GetEntityFromUserID(Event.GetInt("userid"));
    var attacker = Entity.GetEntityFromUserID(Event.GetInt("attacker"));
    if (attacker == Entity.GetLocalPlayer() && hit == logs_target) logs_hits++;

    var hittype = "击中 ";
    me = Entity.GetLocalPlayer();
    hitbox = Event.GetInt('hitgroup');
    target_damage = Event.GetInt("dmg_health");
    target_health = Event.GetInt("health");
    victim = Event.GetInt('userid');
    attacker = Event.GetInt('attacker');
    weapon = Event.GetString('weapon');
    victimIndex = Entity.GetEntityFromUserID(victim);
    attackerIndex = Entity.GetEntityFromUserID(attacker);
    name = Entity.GetName(victimIndex);


      if (logs_safety1 == 1) {
          logs_safety1 = "1";
      }
      else {
          logs_safety1 = "0";
      }

    if (weapon == "hegrenade")
      hittype = "爆炸 ";
    else if (weapon == "inferno")
      hittype = "燃烧 ";
    else if (weapon == "knife")
      hittype = "刀击 ";
    if (UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Ragebot logs"])){
        if (me == attackerIndex && me != victimIndex) {1
            Cheat.PrintColor([211,44,230, 255], "[梦魇] ");
        if (hittype == "击中 ") {
            Cheat.PrintChat(" \x08[\x0eRebirth+\x08] [\x04"+logs_shots.toString()+"\x08] "+hittype+name+" 的 \x10"+HitgroupName(hitbox)+"\x08 造成 \x07"+target_damage.toString()+"\x08伤害 ("+target_health.toString()+" 剩余) 瞄准部位=\x10"+logs_hitboxName+"\x08("+logs_predicthc.toString()+"%%) 安全点=\x03"+logs_safety1+"\n");
            Cheat.Print("["+logs_shots.toString()+"] "+hittype+name+" 的 "+HitgroupName(hitbox)+" 造成 "+target_damage.toString()+"伤害 ("+target_health.toString()+" 剩余) 瞄准部位="+logs_hitboxName+" (命中率: "+logs_predicthc.toString()+"%% | 安全点: "+logs_safety1+")"+"\n");
        }
        else {
          Cheat.Print("["+logs_shots.toString()+"] "+hittype+name+" 的 "+HitgroupName(hitbox)+" 造成 "+target_damage.toString()+"伤害 ("+target_health.toString()+" 剩余) \n");
        }
    
        }
    }
  if (logs_shots == 99)
    logs_shots = 0;
  else
    logs_shots++;

}

function logs_onDraw() {
    if (!World.GetServerString()) return;

    if (logs_shots_fired > logs_hits && (Globals.Curtime() - logs_lastUpdate > 0.17)) {
      if (Globals.Curtime() - logs_lastUpdate > 1) {
        logs_shots_fired = 0;
        logs_hits = 0;
      }
      if (!logs_logged) {
        logs_logged = true;
        var issafe = "1";
        var reason = "解析";
        if (logs_safety1 == 0) {
          issafe = "0";
        }

        if (Entity.IsAlive(logs_target) == false)
            reason = "目标已死亡";
        else if (Entity.IsAlive(Entity.GetLocalPlayer()) == false)
            reason = "玩家已死亡";
        else if (logs_safety1 == true && logs_predicthc < 92)
            reason = "扩散";
        else if (logs_safety1 == true && logs_predicthc == 93)
            reason = "扩散:"
        else if (logs_safety1 == true && logs_predicthc == 94)
            reason = "扩散:"
        else if (logs_safety1 == true && logs_predicthc == 95)
            reason = "扩散:"
        else if (logs_safety1 == true && logs_predicthc == 96)
            reason = "扩散:"
        else if (logs_safety1 == true && logs_predicthc > 97)
            reason = "解析错误";
        if (UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Ragebot logs"])){
            if (reason == "目标已死亡") {
                Cheat.PrintColor([211,44,230, 255], "[梦魇] ");
                Cheat.PrintColor([255, 255, 255, 255], "["+logs_shots.toString()+"] ");
                Cheat.PrintColor([255, 255, 255, 255],"未命中 "+Entity.GetName(logs_target)+" 的 "+logs_hitboxName+" 由于 ");
                Cheat.PrintColor([37, 255, 40, 255],reason);
                Cheat.PrintColor([255, 255, 255, 255]," (命中率): "+logs_predicthc.toString()+"%% | 安全点= "+issafe+")"+"(延迟: " +Math.round(Entity.GetProp(Entity.GetLocalPlayer(), "CPlayerResource", "m_iPing")).toString()+ " | tickrate: " +logs_tickrate+ ")\n");
                  }
              if (reason == "玩家已死亡") {
                Cheat.PrintColor([211,44,230, 255], "[梦魇] ");
                Cheat.PrintColor([255, 255, 255, 255], "["+logs_shots.toString()+"] ");
                Cheat.PrintColor([255, 255, 255, 255],"未命中 "+Entity.GetName(logs_target)+" 的 "+logs_hitboxName+" 由于 ");
                Cheat.PrintColor([37, 255, 40, 255],reason);
                Cheat.PrintColor([255, 255, 255, 255]," (命中率: "+logs_predicthc.toString()+"%% | 安全点= "+issafe+")"+"(延迟: " +Math.round(Entity.GetProp(Entity.GetLocalPlayer(), "CPlayerResource", "m_iPing")).toString()+ " | tickrate: " +logs_tickrate+ ")\n");
              }
                  if (reason == "解析错误") {
                Cheat.PrintColor([211,44,230, 255], "[梦魇] ");
                Cheat.PrintColor([255, 255, 255, 255], "["+logs_shots.toString()+"] ");
                Cheat.PrintColor([255, 255, 255, 255],"未命中 "+Entity.GetName(logs_target)+" 的 "+logs_hitboxName+" 由于 ");
                Cheat.PrintColor([241, 255, 64, 255],reason);
                Cheat.PrintColor([126, 255, 99, 255]," [精准]]");
                Cheat.PrintColor([255, 255, 255, 255],", (命中率: "+logs_predicthc.toString()+"%% | 安全点= "+issafe+")"+"\n");
          }
                  if (reason == "解析") {
                      Cheat.PrintColor([211,44,230, 255], "[梦魇] ");
                      Cheat.PrintColor([255, 255, 255, 255], "["+logs_shots.toString()+"] ");
                      Cheat.PrintColor([255, 255, 255, 255],"未命中 "+Entity.GetName(logs_target)+" 的 "+logs_hitboxName+" 由于 ");
                      Cheat.PrintColor([255, 0, 0, 255],reason);
                      Cheat.PrintColor([255, 255, 255, 255],", (命中率: "+logs_predicthc.toString()+"%% | 安全点= "+issafe+")"+"\n");
                      }
                      if (reason == "扩散") {
                          Cheat.PrintColor([211,44,230, 255], "[梦魇] ");
                          Cheat.PrintColor([255, 255, 255, 255], "["+logs_shots.toString()+"] ");
                          Cheat.PrintColor([255, 255, 255, 255],"未命中 "+Entity.GetName(logs_target)+" 的 "+logs_hitboxName+" 由于 ");
                          Cheat.PrintColor([0, 112, 255, 255],reason);
                          Cheat.PrintColor([0, 112, 255, 255],":");
                          Cheat.PrintColor([255, 255, 255, 255],", (命中率: "+logs_predicthc.toString()+"%% | 安全点= "+issafe+")"+"\n");
                        }
                        if (reason == "扩散:") {
                          Cheat.PrintColor([211,44,230, 255], "[梦魇] ");
                          Cheat.PrintColor([255, 255, 255, 255], "["+logs_shots.toString()+"] ");
                          Cheat.PrintColor([255, 255, 255, 255],"未命中 "+Entity.GetName(logs_target)+" 的 "+logs_hitboxName+" 由于 ");
                          Cheat.PrintColor([0, 112, 255, 255],reason);
                          Cheat.PrintColor([255, 255, 255, 255],", (命中率: "+logs_predicthc.toString()+"%% | 安全点= "+issafe+")"+"\n");
                        }
                      Cheat.PrintChat(" \x08[\x0eRebirth+\x08] [\x04"+logs_shots.toString()+"\x08] "+"\x08未命中 "+Entity.GetName(logs_target)+" 的 \x10"+logs_hitboxName+"\x08("+logs_predicthc.toString()+"%%) 由于 \x07"+reason+"\x08, 安全点=\x03"+issafe);
        }
        
        if (logs_shots == 99)
          logs_shots = 0;
        else
          logs_shots++;
      }
    }
}
//ASPECT RATIO
function aspectratio( ) {
    menu_val = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "Aspect Ratio"] );
    string_menu_val = menu_val.toString();
    
    Convar.SetString ("r_aspectratio", string_menu_val );
}
//bomb helper
//region api
const global_print = Global.Print, global_print_chat = Global.PrintChat, global_print_color = Global.PrintColor, global_register_callback = Global.RegisterCallback, global_execute_command = Global.ExecuteCommand, global_frame_stage = Global.FrameStage, global_tickcount = Global.Tickcount, global_tickrate = Global.Tickrate, global_tick_interval = Global.TickInterval, global_curtime = Global.Curtime, global_realtime = Global.Realtime, global_frametime = Global.Frametime, global_latency = Global.Latency, global_get_view_angles = Global.GetViewAngles, global_set_view_angles = Global.SetViewAngles, global_get_map_name = Global.GetMapName, global_is_key_pressed = Global.IsKeyPressed, global_get_screen_size = Global.GetScreenSize, global_get_cursor_position = Global.GetCursorPosition, global_play_sound = Global.PlaySound, global_play_microphone = Global.PlayMicrophone, global_stop_microphone = Global.StopMicrophone, global_get_username = Global.GetUsername, global_set_clan_tag = Global.SetClanTag, globals_tickcount = Globals.Tickcount, globals_tickrate = Globals.Tickrate, globals_tick_interval = Globals.TickInterval, globals_curtime = Globals.Curtime, globals_realtime = Globals.Realtime, globals_frametime = Globals.Frametime, sound_play = Sound.Play, sound_play_microphone = Sound.PlayMicrophone, sound_stop_microphone = Sound.StopMicrophone, cheat_get_username = Cheat.GetUsername, cheat_register_callback = cheat_register_callback = new Proxy(Cheat.RegisterCallback, { apply: function(_, _, args) { switch(args[0]) { case 'paint': Cheat.RegisterCallback('Draw', args[1]); break; case 'create_move': Cheat.RegisterCallback('CreateMove', args[1]); break; case 'fsn': Cheat.RegisterCallback('FrameStageNotify', args[1]); break; default: Cheat.RegisterCallback(args[0], args[1]); break; } } }), cheat_execute_command = Cheat.ExecuteCommand, cheat_frame_stage = Cheat.FrameStage, cheat_print = Cheat.Print, cheat_print_chat = Cheat.PrintChat, cheat_print_color = Cheat.PrintColor, local_latency = Local.Latency, local_get_view_angles = Local.GetViewAngles, local_set_view_angles = Local.SetViewAngles, local_set_clan_tag = Local.SetClanTag, local_get_real_yaw = Local.GetRealYaw, local_get_fake_yaw = Local.GetFakeYaw, local_get_spread = Local.GetSpread, local_get_inaccuracy = Local.GetInaccuracy, world_get_map_name = World.GetMapName, world_get_server_string = World.GetServerString, input_get_cursor_position = Input.GetCursorPosition, input_is_key_pressed = Input.IsKeyPressed, render_string = Render.String, render_text_size = Render.TextSize, render_line = Render.Line, render_rect = Render.Rect, render_filled_rect = Render.FilledRect, render_gradient_rect = Render.GradientRect, render_circle = Render.Circle, render_filled_circle = Render.FilledCircle, render_polygon = Render.Polygon, render_world_to_screen = Render.WorldToScreen, render_add_font = Render.GetFont, render_find_font = Render.FindFont, render_string_custom = Render.StringCustom, render_textured_rect = Render.TexturedRect, render_add_texture = Render.AddTexture, render_text_size_custom = Render.TextSizeCustom, render_get_screen_size = Render.GetScreenSize, ui_get_value = UI.GetValue, ui_set_value = UI.SetValue, ui_add_checkbox = UI.AddCheckbox, ui_add_slider_int = UI.AddSliderInt, ui_add_slider_float = UI.AddSliderFloat, ui_add_hotkey = UI.AddHotkey, ui_add_label = UI.AddLabel, ui_add_dropdown = UI.AddDropdown, ui_add_multi_dropdown = UI.AddMultiDropdown, ui_add_color_picker = UI.AddColorPicker, ui_add_textbox = UI.AddTextbox, ui_set_enabled = UI.SetEnabled, ui_get_string = UI.GetString, ui_get_color = UI.GetColor, ui_set_color = UI.SetColor, ui_is_hotkey_active = UI.IsHotkeyActive, ui_toggle_hotkey = UI.ToggleHotkey, ui_is_menu_open = UI.IsMenuOpen, convar_get_int = Convar.GetInt, convar_set_int = Convar.SetInt, convar_get_float = Convar.GetFloat, convar_set_float = Convar.SetFloat, convar_get_string = Convar.GetString, convar_set_string = Convar.SetString, event_get_int = Event.GetInt, event_get_float = Event.GetFloat, event_get_string = Event.GetString, entity_get_entities = Entity.GetEntities, entity_get_entities_by_class_i_d = Entity.GetEntitiesByClassID, entity_get_players = Entity.GetPlayers, entity_get_enemies = Entity.GetEnemies, entity_get_teammates = Entity.GetTeammates, entity_get_local_player = Entity.GetLocalPlayer, entity_get_game_rules_proxy = Entity.GetGameRulesProxy, entity_get_entity_from_user_i_d = Entity.GetEntityFromUserID, entity_is_teammate = Entity.IsTeammate, entity_is_enemy = Entity.IsEnemy, entity_is_bot = Entity.IsBot, entity_is_local_player = Entity.IsLocalPlayer, entity_is_valid = Entity.IsValid, entity_is_alive = Entity.IsAlive, entity_is_dormant = Entity.IsDormant, entity_get_class_i_d = Entity.GetClassID, entity_get_class_name = Entity.GetClassName, entity_get_name = Entity.GetName, entity_get_weapon = Entity.GetWeapon, entity_get_weapons = Entity.GetWeapons, entity_get_render_origin = Entity.GetRenderOrigin, entity_get_prop = Entity.GetProp, entity_set_prop = Entity.SetProp, entity_get_hitbox_position = Entity.GetHitboxPosition, entity_get_eye_position = Entity.GetEyePosition, trace_line = Trace.Line, trace_bullet = Trace.Bullet, usercmd_set_movement = UserCMD.SetMovement, usercmd_get_movement = UserCMD.GetMovement, usercmd_set_angles = UserCMD.SetAngles, usercmd_force_jump = UserCMD.ForceJump, usercmd_force_crouch = UserCMD.ForceCrouch, antiaim_get_override = AntiAim.GetOverride, antiaim_set_override = AntiAim.SetOverride, antiaim_set_real_offset = AntiAim.SetRealOffset, antiaim_set_fake_offset = AntiAim.SetFakeOffset, antiaim_set_l_b_y_offset = AntiAim.SetLBYOffset, exploit_get_charge = Exploit.GetCharge, exploit_recharge = Exploit.Recharge, exploit_disable_recharge = Exploit.DisableRecharge, exploit_enable_recharge = Exploit.EnableRecharge, ragebot_override_minimum_damage = Ragebot.OverrideMinimumDamage, ragebot_override_hitchance = Ragebot.OverrideHitchance, ragebot_override_accuracy_boost = Ragebot.OverrideAccuracyBoost, ragebot_override_multipoint_scale = Ragebot.OverrideMultipointScale, ragebot_force_safety = Ragebot.ForceSafety;
//endregion
var screen_size = global_get_screen_size();
var bombsite, player_name, site = "";
var plating_time = 3.125;
var planting, planted, ignore_dropped, ignore_self = false;
var r = 108, g = 195, b = 18;
var rr = 108, gr = 195, br = 18;
var bomb_beginwhen = null;
const planting_height = 0;
const defuse_height = 0;
function getBombSite(bomb_entity)
{
    return bomb_site = entity_get_prop(bomb_entity, "CPlantedC4", "m_nBombSite") == 1 ? "B" : "A";
}

function getDamage(damage, armor_value)
{
    if (armor_value > 0)
    {
        var new_value = damage * .5;
        var armor = (damage - new_value) * .5;
        if (armor > armor_value)
        {
            armor = armor_value * (1 / .5);
            new_value = damage - armor;
        }
        damage = new_value;
    }
    return damage;
}

function getBombDamage(player_entity, bomb_entity)
{
    var player_pos = entity_get_render_origin(player_entity);
    var bomb_pos = entity_get_render_origin(bomb_entity);
    var distance = getDistanceTo(player_pos, bomb_pos);
    const a = 450.7;
    const b = 75.68;
    const c = 789.2;
    const d = ((distance - b) / c);
    var damage = a * Math.exp(-d * d);
    var armor_value = entity_get_prop(player_entity, "CCSPlayerResource", "m_iArmor");

    return Math.max(Math.ceil(getDamage(damage, armor_value)), 0)
}


var bomb_ind_alpha = 0;
var bomb_number_add = 0;
var num_count = 0;
function on_paint()
{
    var frames = 8 * Globals.Frametime();
    var bomb_select_number = 0;
    var bomb_on = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "Boom helper"])
    var theme_color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "Theme Color"])
    var text_color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "Text Color"])
    if(UI.IsMenuOpen()){
        if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==2){
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Theme Color"], bomb_on?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Text Color"], bomb_on?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Helper x"], bomb_on?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Helper y"], bomb_on?1:0);
        }else{
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Theme Color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Text Color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Helper x"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Helper y"], 0);
        }
    }
    
    
    var x = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "Helper x"]);
    var y = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "Helper y"]);
    const bomb_entity = entity_get_entities_by_class_i_d(129);
    var bomb_text = Render.GetFont("astriumwep.ttf",24,false)
    var bomb_text_font = Render.GetFont("arialbd.ttf",12,true)
    var bomb = null;
    var font = render_add_font("Verdana.ttf", 12, true);
    const c4 = Entity.GetEntitiesByClassID(129)[0];
    if(bomb_on){//9 - x 9 - y
        render_filled_rect(x+1, y+1, 180, (planted)?52+num_count*18:52, [32,32,32,bomb_ind_alpha*150]);
        // Cheat.Print(bomb_damage+"\n")
        Render.FilledCircle( x+26, y+28, 16, [ 25, 25, 25, bomb_ind_alpha*255 ] );
        render_circle(x+26, y+28, 17, [ theme_color[0],theme_color[1],theme_color[2], bomb_ind_alpha*255 ])
        render_string(x+16, y+17, 0, "o", [theme_color[0],theme_color[1],theme_color[2], bomb_ind_alpha*255], bomb_text)
        render_string(x+51, y+8, 0, "Status:", [text_color[0], text_color[1], text_color[2], bomb_ind_alpha*255], bomb_text_font)
        render_string(x+71, y+35, 0, "time:", [text_color[0], text_color[1], text_color[2], bomb_ind_alpha*255], bomb_text_font)
        render_filled_rect(x+57, y+25, 92, 8, [25,25,25,bomb_ind_alpha*150]);
        render_rect(x, y, 182, (planted)?54+num_count*18:54, [theme_color[0],theme_color[1],theme_color[2],bomb_ind_alpha*255])
        if (planting)
        {
            bomb_select_number+=1;
            var plant_time = globals_curtime()-bomb_beginwhen;
            if (player_name != entity_get_name(entity_get_local_player())){
                render_string(x+94, y+8, 0, "Planting - "+bombsite, [255, 0, 0, bomb_ind_alpha*255], bomb_text_font)
                render_string(x+103, y+35, 0, plant_time.toFixed(2)+"", [205, 92, 92, bomb_ind_alpha*255], bomb_text_font)
                
            }else{
                render_string(x+94, y+8, 0, "Planting - "+bombsite, [0, 255, 0, bomb_ind_alpha*255], bomb_text_font)
                render_string(x+103, y+35, 0, plant_time.toFixed(2)+"", [67, 205, 128, bomb_ind_alpha*255], bomb_text_font)
            }
            
            // render_string(x/2, y/2, 0, bombsite + " - " + player_name, [0, 0, 0, bomb_ind_alpha*255], font)
            // render_string(x/2, y/2, 0, bombsite + " - " + player_name, [r, g, b, bomb_ind_alpha*255], font)
            render_filled_rect(x+58, y+26, plant_time*30, 6, [255,255,255,bomb_ind_alpha*255]);
            // Cheat.Print(plant_time+"\n")
            // planting_height =  Math.min(y, y * (globals_curtime() - bomb_beginwhen) / plating_time);
            // render_filled_rect(0, 0, 15, render_get_screen_size()[1], [32,32,32,bomb_ind_alpha*150]);
            // render_filled_rect(0, y - planting_height, 15, y, [rr,gr,br,bomb_ind_alpha*255]);
        }
        if (planted)
        {
            if (bomb_entity != null)
            {
                bomb = bomb_entity[1];
                var local_player = entity_get_local_player();
                var bomb_time_max = convar_get_float("mp_c4timer");
                var bomb_damage = getBombDamage(local_player, c4);
                var player = entity_get_prop(c4, "CPlantedC4", "m_hBombDefuser");
                // if (player == 1)
                // {
                //     draw_defuse_bar();
                // }
            }
            var bomb_text = Render.GetFont("astriumwep.ttf",24,false)
        var bomb_text_font = Render.GetFont("arialbd.ttf",12,true)
            const timer = (Entity.GetProp(c4, "CPlantedC4", "m_flC4Blow") - Globals.Curtime()).toFixed(2);
            const planted_text = getBombSite(c4) + " - " + timer.toString() + "s";
            // const height = Math.min(y, y * timer/bomb_time_max);
    
            // render_filled_rect(0, 0, 15, render_get_screen_size()[1], [32,32,32,150]);
            // render_filled_rect(0, y - height, 15, y, [rr,gr,br,bomb_ind_alpha*255]);
    
            render_string(x+94, y+8, 0, "Planted - "+getBombSite(c4), [255, 0, 0, bomb_ind_alpha*255], bomb_text_font)
            render_string(x+103, y+36, 0, timer+"", [r, g, b, bomb_ind_alpha*255], bomb_text_font)
            render_filled_rect(x+58, y+26, timer*2.25, 6, [r, g, b,bomb_ind_alpha*255]);
            render_string(x+11, y+49, 0, "DMG:", [text_color[0], text_color[1], text_color[2], bomb_ind_alpha*255], bomb_text_font)
            render_filled_rect(x+57, y+52, 92, 8, [25,25,25,bomb_ind_alpha*150]);
            // render_string(17, 2, 0, planted_text, [0, 0, 0, bomb_ind_alpha*255], font)
            // render_string(15, 0, 0, planted_text, [r, g, b, bomb_ind_alpha*255], font)
            if (timer <= 10)
            {
                r = 230,g = 235,b = 145;
            }
            if (timer <= 5)
            {
                r = bomb_ind_alpha*255, g = 1, b = 1;
                rr = bomb_ind_alpha*255, gr = 1, br = 1;
            }
            if (timer <= 0)
            {
                r = 108, g = 195, b = 18;
                rr = 108, gr = 195, br = 18;
                planted = false;
                planting = false;
                return;
            }
            if(bomb_damage >=100) bomb_damage = 100;
            if (bomb_damage > 1)
            {
                render_filled_rect(x+58, y+53, (100<bomb_damage)?90:bomb_damage*0.9, 6,[30+bomb_damage*2.2,250-bomb_damage*2.2,0,bomb_ind_alpha*255]);
                const damage_text= entity_get_prop(local_player, "CBasePlayer", "m_iHealth") <= bomb_damage ? "FA" : bomb_damage.toString();
                const damage_color = entity_get_prop(local_player, "CBasePlayer", "m_iHealth") <= bomb_damage ? [255,1,1,bomb_ind_alpha*255] : [230,235,145, bomb_ind_alpha*255];
                render_string(x+153, y+49, 0, damage_text, damage_color, bomb_text_font)
                // render_string(17, 30, 0, damage_text, [0, 0, 0, bomb_ind_alpha*255], font);
                // render_string(15, 28, 0, damage_text, damage_color, font);
            }
            bomb_select_number+=1;
        }
        num_count = bomb_select_number;
        bomb_number_add = bomb_select_number;
        if (bomb_select_number > 0&&Entity.IsAlive(Entity.GetLocalPlayer())) {
            bomb_ind_alpha = Math.min(bomb_ind_alpha + frames, 1);
        }else {
            bomb_ind_alpha = bomb_ind_alpha - frames;
            if (bomb_ind_alpha < 0) bomb_ind_alpha = 0;
        }
        if (Global.IsKeyPressed(1) && UI.IsMenuOpen()) {
            const mouse_pos = Global.GetCursorPosition();
            if (in_bounds(mouse_pos, x, y, x+180, y+52)) {
                UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","Helper x"], mouse_pos[0] - 70);
                UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","Helper y"], mouse_pos[1] -20);
            }
        }
    }
    
}
const a_site_array = [425, 333, 79, 262, 154, 94, 281, 204, 92, 152];
const b_site_array = [426, 422, 504, 314, 405, 536, 282, 205, 97, 153];
function beginPlant()
{
    var userid = event_get_int("userid");
    site = event_get_int("site");
    if (!userid) return;
    cheat_print("[onetap] Planting on bombsite id: " + event_get_int("site")+"\n");
    if (site % 2 == 1)
        site = 'B';
    else
        site = 'A';

    var userid_name = entity_get_entity_from_user_i_d(userid);
    var userid_name_final = entity_get_name(userid_name);

    planting = true;
    bombsite = site;
    player_name = userid_name_final;
    bomb_beginwhen = globals_curtime();
}
function abortPlant()
{
    planting = false;
    planted = false;
    planting_height = 0;
    defuse_height = 0;
}
function bombPlanted()
{
    planting = false;
    planted = true;
}
function reset()
{
    planting = false;
    planted = false;
    planting_height = 0;
    defuse_height = 0;
    site = "";
}
//enemies info
var enemy_realwep = [];
var enemy_count = 0;
function Enemies_info(){
    var is_info = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","Enemies info"]);
    var font_wep = Render.GetFont("astriumwep.ttf",24,false);
    var font_list = Render.GetFont("Verdana.ttf", 14, true);
    if(UI.IsMenuOpen()){
        if( UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==3){
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Info text color"], is_info?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Cash color"], is_info?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Health color"], is_info?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Info weapon color"], is_info?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "infolist x"], is_info?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "infolist y"], is_info?1:0);
        }else{
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Info text color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Cash color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Health color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Info weapon color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "infolist x"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "infolist y"], 0);
        }
    }
    
    var re_theme_cset = UI.GetColor( ["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Color picker"] );
    var re_theme_type = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Theme style"]);
    var re_theme_color = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Color method"]);

    var info_font = Render.GetFont("lucon.ttf", 12, true);
    var draw_font = Render.GetFont("icons_new.ttf", 18, false);
    var mordern_font = Render.GetFont("seguisb.ttf", 14, true);

    var list_x = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "infolist x"])
    var list_y = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "infolist y"])
    var text_color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "Info text color"])
    var cash_color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "Cash color"])
    var bar_color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "Health color"])
    var wep_color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "Info weapon color"])
    var rgb_color = (re_theme_color==0||re_theme_color==1)?re_theme_cset:rainbow(Global.Tickcount() % 350 / 350, 1, 1, 1, 255);

    if (is_info){
        var plr = Entity.GetEnemies()
        if(World.GetServerString()){
            switch(re_theme_type){
                case 0:
                    if(re_theme_color==0){
                        Render.GradientRect(list_x-10, list_y+1, 110, 24, 1,[35,35,35,0],[35,35,35,180]);
                        Render.GradientRect(list_x-10+110, list_y+1, 110, 24, 1,[35,35,35,180],[35,35,35,0]);
                        Render.GradientRect(list_x-10, list_y, 110, 1, 1 , [rgb_color[0],rgb_color[1],rgb_color[2],0], [rgb_color[0],rgb_color[1],rgb_color[2],255]);
                        Render.GradientRect(list_x-10+110, list_y, 110, 1, 1 , [rgb_color[0],rgb_color[1],rgb_color[2],255], [rgb_color[0],rgb_color[1],rgb_color[2],0]);
                        Render.GradientRect(list_x-10, list_y+24, 110, 1, 1 , [rgb_color[0],rgb_color[1],rgb_color[2],0], [rgb_color[0],rgb_color[1],rgb_color[2],255]);
                        Render.GradientRect(list_x-10+110, list_y+24, 110, 1, 1 , [rgb_color[0],rgb_color[1],rgb_color[2],255], [rgb_color[0],rgb_color[1],rgb_color[2],0]);
                    }else{
                        Render.GradientRect(list_x-10, list_y+1, 110, 24, 1,[35,35,35,0],[35,35,35,180]);
                        Render.GradientRect(list_x-10+110, list_y+1, 110, 24, 1,[35,35,35,180],[35,35,35,0]);
                        Render.GradientRect(list_x-10, list_y, 110, 1, 1 , [rgb_color[0],rgb_color[1],rgb_color[2],0], [rgb_color[0],rgb_color[2],rgb_color[1],255]);
                        Render.GradientRect(list_x-10+110, list_y, 110, 1, 1 , [rgb_color[0],rgb_color[2],rgb_color[1],255], [rgb_color[2],rgb_color[1],rgb_color[0],0]);
                        Render.GradientRect(list_x-10, list_y+24, 110, 1, 1 , [rgb_color[0],rgb_color[2],rgb_color[1],0], [rgb_color[1],rgb_color[2],rgb_color[0],255]);
                        Render.GradientRect(list_x-10+110, list_y+24, 110, 1, 1 , [rgb_color[1],rgb_color[2],rgb_color[0],255], [rgb_color[2],rgb_color[1],rgb_color[0],0]);
                    }
                    // Render.GradientRect(list_x-10, list_y+1, 220, 23, 1, [35,35,35,180],[35,35,35,180]);
                    Render.String(list_x + 56, list_y+7, 0, "Enemies Info", [25,25,25,255], info_font);
                    Render.String(list_x + 55, list_y+6, 0, "Enemies Info", [255,255,255,255], info_font);
                break;
                case 1:
                    case 0:
                    if(re_theme_color==0){
                        Render.GradientRect(list_x-10, list_y-1, 220, 2, 1,[rgb_color[0],rgb_color[1],rgb_color[2],255], [rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    }else{
                        Render.GradientRect(list_x-10, list_y-1, 110, 2, 1,[rgb_color[0],rgb_color[1],rgb_color[2],255], [rgb_color[0],rgb_color[2],rgb_color[1],255]);
                        Render.GradientRect(list_x+100, list_y-1, 110, 2, 1,[rgb_color[0],rgb_color[2],rgb_color[1],255], [rgb_color[2],rgb_color[1],rgb_color[0],255]);
                    }
                    Render.GradientRect(list_x-10, list_y+1, 220, 23, 1, [35,35,35,180],[35,35,35,180]);
                    Render.String(list_x + 56, list_y+7, 0, "Enemies Info", [25,25,25,255], info_font);
                    Render.String(list_x + 55, list_y+6, 0, "Enemies Info", [255,255,255,255], info_font);
                break;
                case 2:
                    if(re_theme_color==0){
                        Render.GradientRect(list_x-8, list_y-3, 216, 2, 1,[rgb_color[0],rgb_color[1],rgb_color[2],255], [rgb_color[0],rgb_color[1],rgb_color[2],255]);
                        Render.GradientRect(list_x-9, list_y-2, 218, 2, 1,[rgb_color[0],rgb_color[1],rgb_color[2],255], [rgb_color[0],rgb_color[1],rgb_color[2],255]);
                        Render.GradientRect(list_x-10, list_y-1, 220, 2, 1,[rgb_color[0],rgb_color[1],rgb_color[2],255], [rgb_color[0],rgb_color[1],rgb_color[2],255]);
                    }else{
                        Render.GradientRect(list_x-8, list_y-3, 216, 2, 1,[rgb_color[0],rgb_color[1],rgb_color[2],255], [rgb_color[2],rgb_color[0],rgb_color[1],255]);
                        Render.GradientRect(list_x-9, list_y-2, 218, 2, 1,[rgb_color[0],rgb_color[1],rgb_color[2],255], [rgb_color[2],rgb_color[0],rgb_color[1],255]);
                        Render.GradientRect(list_x-10, list_y-1, 220, 2, 1,[rgb_color[0],rgb_color[1],rgb_color[2],255], [rgb_color[2],rgb_color[0],rgb_color[1],255]);
                    }
                    Render.GradientRect(list_x-9, list_y, 218, 1, 1, [35,35,35,255],[35,35,35,255]);
                    Render.GradientRect(list_x-10, list_y+1, 220, 23, 1, [35,35,35,255],[35,35,35,255]);
                    Render.GradientRect(list_x-10, list_y+22, 220, 2, 1, [25,25,25,255],[25,25,25,255]);
                    Render.String(list_x+2, list_y+3, 0, "C", [255,255,255,255/1.3], draw_font);
                    Render.String(list_x + 32, list_y+1, 0, "Enemies Info", [255,255,255,255/1.3], mordern_font);
                break;
            }
        }
        for (i = 0; i < plr.length; i++){
            var enemy_name = Entity.GetName( plr[i] )
            var enemy_weps = Entity.GetWeapons( plr[i] )
            var enemy_wep = Entity.GetName(Entity.GetWeapon( plr[i] ));
            var enemy_cash = Entity.GetProp( plr[i], "CCSPlayer", "m_iAccount")
            var enemy_hp = Entity.GetProp(plr[i], "CBasePlayer", "m_iHealth")
            var enemy_allwep = '';
            var enemy_name_replace = [];
            var enemy_name_replace2 = '';
            var first_wep_iconsize;
            if(enemy_name.length>5){
                for(var ind = 0;ind<5;ind++){
                    enemy_name_replace[ind] = enemy_name[ind];
                    enemy_name_replace2 = enemy_name_replace2+enemy_name_replace[ind];
                    if(ind==4){
                        enemy_name_replace[ind+1] = "...";
                        enemy_name_replace2 = enemy_name_replace2+enemy_name_replace[ind+1];
                    }
                }
            }
            if(Entity.IsAlive( plr[i] )){
                var wep_ral_name = player_weapon_name(Entity.GetWeapon( plr[i] ))
                if(enemy_wep!=undefined && enemy_wep!=enemy_name && enemy_weps[0]!=''&&enemy_weps[0]!=""&&enemy_weps[0]!=' '&&enemy_weps[0]!=" "){
                    if(wep2tab.hasOwnProperty(wep_ral_name)){
                        // enemy_allwep = enemy_allwep+wep2tab[wep_ral_name];
                        Render.String(list_x,list_y+49+i*48,0, Entity.IsAlive( plr[i] )?wep2tab[wep_ral_name]:"", [wep_color[0],wep_color[1],wep_color[2],255], font_wep)
                        first_wep_iconsize = Render.TextSize(Entity.IsAlive( plr[i] )?wep2tab[wep_ral_name]:"",font_wep)[0]
                    }
                }
                for(var j in enemy_weps){
                    var weps_slice_name = player_weapon_name(enemy_weps[j])
                    if(weps_slice_name=='knife') enemy_weps.splice(j,1);
                    if(Entity.GetWeapon( plr[i] )==enemy_weps[j]) enemy_weps.splice(j,1);
                }
                if(enemy_weps.length>0 && enemy_weps[0]!=''&&enemy_weps[0]!=""&&enemy_weps[0]!=' '&&enemy_weps[0]!=" "){
                    enemy_weps.forEach(function(wep){
                        var weps_ral_name = player_weapon_name(wep)
                        if(wep2tab.hasOwnProperty(weps_ral_name)){
                            enemy_allwep = enemy_allwep+wep2tab[weps_ral_name];
                        }
                    });
                }
                if(enemy_weps[0]!="" && enemy_allwep!='undefined' && enemy_allwep!=undefined && enemy_allwep!="undefined"){
                    Render.String(list_x+first_wep_iconsize,list_y+49+i*48,0, Entity.IsAlive( plr[i] )?enemy_allwep:"", [wep_color[0],wep_color[1],wep_color[2],140], font_wep)
                }
            }
            var text_max_size = Render.TextSize((enemy_name.length>5?enemy_name_replace2+"":enemy_name+"")+" $"+enemy_cash+" HP ",font_list)[0];
            var health_bar_step = (200-text_max_size)/100;
            Render.String(list_x,list_y+28+i*46,0, enemy_name.length>5?enemy_name_replace2+"":enemy_name+"", [25 ,25 ,25,255], font_list)
            Render.String(list_x,list_y+29+i*46,0, enemy_name.length>5?enemy_name_replace2+"":enemy_name+"", text_color, font_list)
            Render.String(list_x+Render.TextSize(enemy_name.length>5?enemy_name_replace2+"":enemy_name+"",font_list)[0],list_y+28+i*46,0," $", [25 ,25 ,25,255], font_list)
            Render.String(list_x+Render.TextSize(enemy_name.length>5?enemy_name_replace2+"":enemy_name+"",font_list)[0],list_y+29+i*46,0," $", [78,238,148,255], font_list)
            Render.String(list_x+Render.TextSize((enemy_name.length>5?enemy_name_replace2+"":enemy_name+"")+" $",font_list)[0],list_y+28+i*46,0,enemy_cash+"", [25 ,25 ,25,255], font_list)
            Render.String(list_x+Render.TextSize((enemy_name.length>5?enemy_name_replace2+"":enemy_name+"")+" $",font_list)[0],list_y+29+i*46,0,enemy_cash+"", cash_color, font_list)
            Render.String(list_x+Render.TextSize((enemy_name.length>5?enemy_name_replace2+"":enemy_name+"")+" $"+enemy_cash,font_list)[0],list_y+28+i*46,0," HP", [25 ,25 ,25,255], font_list)
            Render.String(list_x+Render.TextSize((enemy_name.length>5?enemy_name_replace2+"":enemy_name+"")+" $"+enemy_cash,font_list)[0],list_y+29+i*46,0," HP", text_color, font_list)
            if(text_max_size>=200){
                Render.String(list_x+Render.TextSize((enemy_name.length>5?enemy_name_replace2+"":enemy_name+"")+" $"+enemy_cash+" HP",font_list)[0],list_y+28+i*46,0,enemy_hp+"", [25 ,25 ,25,255], font_list)
                Render.String(list_x+Render.TextSize((enemy_name.length>5?enemy_name_replace2+"":enemy_name+"")+" $"+enemy_cash+" HP",font_list)[0],list_y+29+i*46,0,enemy_hp+"", text_color, font_list)
            }else{
                Render.FilledRect(list_x+Render.TextSize((enemy_name.length>5?enemy_name_replace2+"":enemy_name+"")+" $"+enemy_cash+" HP ",font_list)[0]-1,list_y+35+i*46,200-text_max_size+2, 7, [ 25, 25, 25, 255 ] );
                Render.FilledRect(list_x+Render.TextSize((enemy_name.length>5?enemy_name_replace2+"":enemy_name+"")+" $"+enemy_cash+" HP ",font_list)[0],list_y+36+i*46,enemy_hp*health_bar_step, 5, bar_color );
            }
            // Render.String(list_x,list_y+30+i*46,0, enemy_name+" $"+enemy_cash+" HP"+enemy_hp, [255 ,255 ,0,255], font_list)
            if (Global.IsKeyPressed(1) && UI.IsMenuOpen()) {
                const mouse_pos = Global.GetCursorPosition();
                if (in_bounds(mouse_pos, list_x, list_y, list_x + 200, list_y+23)) {
                    UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "infolist x"], mouse_pos[0] - 30);
                    UI.SetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "infolist y"], mouse_pos[1] - 16);
                }
            }
        }

    }   
}
//circle indicator
function normalize_yaw_arrow(angle) {
    const angle = (angle % 360 + 360) % 360;
    return angle > 180 ? angle - 360 : angle;
}
function calculate_yaw(src, to) {
    const delta = [src[0] - to[0], src[1] - to[1]]
    const yaw = Math.atan(delta[1] / delta[0])
    yaw = this.normalize_yaw_arrow(yaw* 180 / Math.PI)
    if (delta[0] >= 0) {
        yaw = this.normalize_yaw_arrow(yaw + 180)
    }
    return yaw
}
function adjust_angle(angle) {
    if (angle < 0) {
        angle = (90 + angle * (-1));
    } else if (angle > 0) {
        angle = (90 - angle);
    }
    return angle;
}
function world_point_visible(origin) {
    const w2s = WorldToScreen(origin)
    if (w2s[0] < 0 || w2s[0] > screen_size[0] || w2s[1] < 0 || w2s[1] > screen_size[1]) {
        return false
    } else {
        return true
    }
}
function WorldToScreen(point) {
    const screen = Render.WorldToScreen(point)
    return screen;
}
function Get_arrow_color(player) {
    const color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]Color"])
    var alpha = 50 + get_velocity(player)
    if (alpha > 255) {
        var alpha = 255
    } else if (alpha < 5) {
        var alpha = 50
    }

    return [color[0], color[1], color[2], alpha]
}
function DrawArrow() {
    var is_circle = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[General]Circle enemies indicator"])
    if(UI.IsMenuOpen()){
        if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==0){
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]Color"], (is_circle)?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]distance"], (is_circle)?1:0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]thickness"], (is_circle)?1:0);
        }else{
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]Color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]distance"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]thickness"], 0);
        }
    }
    
    
    if (Entity.IsAlive(Entity.GetLocalPlayer()) && UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[General]Circle enemies indicator"])){
        const players_ab = Entity.GetEnemies();
        const local_origin = Entity.GetRenderOrigin(Entity.GetLocalPlayer());
        const view_angles = Local.GetViewAngles();
        const view_yaw = view_angles[1] - 180
    
    
        for (var ab = 0; ab < players_ab.length; ab++) {
            const player_for = players_ab[ab]
            if (Entity.IsValid(player_for) == 1 && Entity.IsAlive(player_for) == 1) {
                
                const player_origin = Entity.GetRenderOrigin(player_for);
                const yaw_cal = calculate_yaw(local_origin, player_origin);
                const yaw_Orgin = adjust_angle(yaw_cal - view_yaw);
                const a = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]distance"]) + ab * 20
    
                if (!Entity.IsValid(player_for) || !Entity.IsAlive(player_for)) {
                    continue;
                }
                if (Entity.IsDormant(player_for) && get_velocity(player_for) < 30) {
                    continue;
                }
                if (world_point_visible(player_origin) && !Entity.IsDormant(player_for)) {
                    render_arc(screen_size[0] / 2, screen_size[1] / 2, a, a - UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]thickness"]), yaw_Orgin - 15, 30, 66, [80, 80, 80, 0]);
                } else if (!world_point_visible(player_origin) && !Entity.IsDormant(player_for)) {
                    render_arc(screen_size[0] / 2, screen_size[1] / 2, a, a - UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]thickness"]), yaw_Orgin - 15, 30, 66, Get_arrow_color(player_for));
                } else if (Entity.IsDormant(player_for) && Entity.GetRenderBox(player_for)[0]) {
                    render_arc(screen_size[0] / 2, screen_size[1] / 2, a, a - UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]thickness"]), yaw_Orgin - 15, 30, 66, [80, 80, 80, 60])
                }
            }
        }
    }
}
//onload info
var on_load_flag = false,on_load_alpha = 0;
function onload_info(){
    var menu_x = UI.GetMenuPosition()[0];
    var menu_y = UI.GetMenuPosition()[1];
    var font_info = Render.GetFont("segoeuib.ttf", 16, true);
    var font_onload = Render.GetFont("seguisb.ttf", 13, true);
    var font_onload_new = Render.GetFont("seguisb.ttf", 15, true);
    var font_load = Render.GetFont("MuseoSansCyrl-900.ttf", 24, false);//UI.IsMenuOpen()
    var n = 0.68;
    on_load_flag = UI.IsMenuOpen()?true:false;
    if(on_load_flag&&on_load_alpha<=255){
        n += n;
        on_load_alpha+=n;
        if(on_load_alpha>255) on_load_alpha = 255;
    }else on_load_alpha = 0;
    if(UI.IsMenuOpen()){
        Render.FilledRect( menu_x+UI.GetMenuPosition()[2]+7, menu_y+6, 274, 2, [ 51,51,51, on_load_alpha ] );
        Render.FilledRect( menu_x+UI.GetMenuPosition()[2]+6, menu_y+7, 276, 42, [ 51,51,51, on_load_alpha ] );
        Render.FilledRect( menu_x+UI.GetMenuPosition()[2]+6, menu_y+49, 276, 20, [ 73,73,73, on_load_alpha ] );
        Render.FilledRect( menu_x+UI.GetMenuPosition()[2]+7, menu_y+69, 274, 1, [ 73,73,73, on_load_alpha ] );
        Render.String(menu_x+UI.GetMenuPosition()[2]+Render.TextSize("NIGHTMARE.PUB",font_onload)[0]/2-38, menu_y+14,0, "NIGHTMARE.PUB", [255,255,255,on_load_alpha], font_load);
        Render.String(menu_x+UI.GetMenuPosition()[2]+Render.TextSize("NIGHTMARE.PUB",font_onload)[0]/2-38, menu_y+48,0, "> 02/13/22 Last Updated", [255,255,255,on_load_alpha], font_onload);
        Render.FilledRect( menu_x+UI.GetMenuPosition()[2]+7, menu_y+78, 274, 1, [ 51,51,51, on_load_alpha ] );
        Render.FilledRect( menu_x+UI.GetMenuPosition()[2]+6, menu_y+79, 276, 94, [ 51,51,51, on_load_alpha ] );
        Render.FilledRect( menu_x+UI.GetMenuPosition()[2]+7, menu_y+173, 274, 1, [ 51,51,51, on_load_alpha ] );
        Render.FilledRect( menu_x+UI.GetMenuPosition()[2]+14, menu_y+81+11+Render.TextSize("News",font_info)[1], 5, 50, [ 226,226,226, on_load_alpha ] );
        Render.String(menu_x+UI.GetMenuPosition()[2]+14, menu_y+81,0, "News", [255,255,255,on_load_alpha], font_info);
        Render.String(menu_x+UI.GetMenuPosition()[2]+34, menu_y+81+14+Render.TextSize("News",font_info)[1],0, "Updated visual system.", [255,255,255,on_load_alpha], font_onload_new);
        Render.String(menu_x+UI.GetMenuPosition()[2]+34, menu_y+81+14+Render.TextSize("News",font_info)[1]+20,0, "Fix autowall problem.", [255,255,255,on_load_alpha], font_onload_new);
    }
}
//static legs
function static_legs() {
    var is_statistic_leg = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[Rage]Static legs"])
    if(is_statistic_leg){
        var lpFlags = Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_fFlags")

        if (!(lpFlags & (1 << 0))) {
            var buttons = UserCMD.GetButtons()
            buttons &= ~(1 << 1) // IN_JUMP = FALSE
            UserCMD.SetButtons(buttons);
        }
    }
}
//rain/predict
var is_predict = UI.AddCheckbox( ["Visuals", "World", "Grenades"], "[4.0]Prediction" );
var outlineColorPicker = UI.AddColorPicker(["Visuals", "World", "Grenades"], "[Prediction]Outline color");
var fillColorPicker = UI.AddColorPicker(["Visuals", "World", "Grenades"], "[Prediction]Filled color");

var rain_option = UI.AddDropdown( [ "Visuals", "World", "Weather" ], "[4.0]Rain color mode", [ "Original","Rgb" ], 0 );
var rain_original = UI.GetColor(["Visuals", "World", "Weather", "Rain color"]);
function rain_onDraw() {
    var rain_color = UI.GetValue(rain_option);
    switch(rain_color){
        case 0:
            UI.SetColor(["Visuals", "World", "Weather", "Rain color"], rain_original);
            break;
        case 1:
            UI.SetColor(["Visuals", "World", "Weather", "Rain color"], rainbow(Math.abs(Math.sin(Globals.Realtime())) * 360, 1, 1));
            break;
    }
//prediction
    var ui_predict = UI.GetValue(is_predict);
    var localPlayer = Entity.GetLocalPlayer();
    UI.SetEnabled(outlineColorPicker,ui_predict?1:0);
    UI.SetEnabled(fillColorPicker,ui_predict?1:0);
    if (Entity.IsAlive(localPlayer)&&ui_predict) {
        GrenadePrediction.Run();

        var currentGrenade = GrenadePrediction.GetPredictedGrenade();
        if (typeof currentGrenade != "undefined") {
            var outlineColor = UI.GetColor(outlineColorPicker);
            var fillColor = UI.GetColor(fillColorPicker);

            var type = currentGrenade.Type;

            if (type == "Molotov" || type == "Incendiary") {
                Render.Filled3DCircle(currentGrenade.Position, 160, 360, 0, outlineColor, fillColor);
            }
            else if (type == "Grenade") {
                Render.Filled3DCircle(currentGrenade.Position, 160, 360, 0, outlineColor, fillColor);
            }
            else if (type == "Smoke") {
                Render.Filled3DCircle(currentGrenade.Position, 130, 360, 0, outlineColor, fillColor);
            }
            else if (type == "Decoy" || type == "Flash") {
                Render.Filled3DCircle(currentGrenade.Position, 10, 360, 0, outlineColor, fillColor);
            }


        }
    }
}
//killannouncer
var kill_count = 0,kill_time = 0,kill_flag = 0;
function announcer_kill(){
    var death_attack = Entity.GetEntityFromUserID(Event.GetInt("attacker"));
    var death_victim = Entity.GetEntityFromUserID(Event.GetInt("userid"));
    var local_player = Entity.GetLocalPlayer();
    if(death_attack == local_player&&death_victim != local_player&&UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Kill announcer"])){
        kill_count++;
        kill_flag++;
        kill_time=Globals.Realtime();
    }
}
function draw_announcer(){
    var announcer_font = Render.GetFont("segoeuib.ttf", 28, true);
    var is_announcer = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Kill announcer"]);
    var ann_color = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals","[Announcer]Color picker"]);
    if(UI.IsMenuOpen()&&UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])==1) UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals","[Announcer]Color picker"],is_announcer?1:0);
    else UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals","[Announcer]Color picker"],0);
    if(Entity.IsAlive(Entity.GetLocalPlayer())){
        if(kill_flag==1&&is_announcer){
            var anim_Time = Globals.Realtime() - kill_time;
            var final_Time = (anim_Time * 255) * -1;
            var y_floud = final_Time/3;
            Render.String(Render.GetScreenSize()[0]/2-Render.TextSize(kill_count+" Struck ! ",announcer_font)[0]/2,0+Render.GetScreenSize()[1]/3-Render.TextSize(kill_count+" Struck ! ",announcer_font)[1],0, kill_count+" Struck ! ", [ann_color[0],ann_color[1],ann_color[2],y_floud], announcer_font);
            if(y_floud<-255){
                kill_flag--;
            }
        }else if(kill_flag > 1&&is_announcer){
            var anim_Time = (Globals.Realtime() - kill_time)*5;
            var final_Time = (anim_Time * 180) * -1;
            Render.String(Render.GetScreenSize()[0]/2-Render.TextSize(kill_count+" Struck ! ",announcer_font)[0]/2,0+Render.GetScreenSize()[1]/3-Render.TextSize(kill_count+" Struck ! ",announcer_font)[1],0, kill_count+" Struck ! ", [255,255,255,final_Time], announcer_font);
            if(final_Time<-180) kill_flag = 1;
        }
    }
}
function announcer_round_end(){
    kill_count = 0;
    kill_flag = 0;
    kill_time = 0;
}
//hiteffect
var effect_hit = 0,effect_hit_i = 0,effect_base = 0;

function effect_playerHurt() {
    var local = Entity.GetLocalPlayer()
    var attacker = Entity.GetEntityFromUserID(Event.GetInt("attacker"));
    if (local == attacker) {
        effect_hit++;
    }
}

function effect_drawHit() {
    var colors = rainbow(Global.Realtime() * 0.1, 1, 1);
    var effect_colorp = UI.GetColor(["Visuals", "NightMare Visuals", "NightMare Visuals","[Effect]Color picker"]);
    var he = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Hit Effect"]);
    if (UI.IsMenuOpen()&&UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Select Settings"])==1) {
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Effect]Color picker"], he?1:0);
    } else {
        UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Effect]Color picker"], 0);
    }
    if (effect_hit == 1) {
        effect_hit_i = effect_hit_i + 1;
        effect_base += 0.83;
        var i2 = effect_hit_i + 1 * 2;
        var hi = 0.13;
        var hi1 = 0.7;
        var hi2 = 0.6;
        var center = Global.GetScreenSize();
        var color = [255, 255, 255, 255 - effect_hit_i]
        var alpha = 255 - i2;
        var fade = effect_hit_i - 3;
        if (he == 1) {
            Render.GradientRect(0, 0, center[0], 120 - fade, 0, [effect_colorp[0], effect_colorp[1], effect_colorp[2], alpha], [effect_colorp[0], effect_colorp[1], effect_colorp[2], 0]);
            Render.GradientRect(0, center[1] - 120 + fade, center[0], 120, 0, [effect_colorp[0], effect_colorp[1], effect_colorp[2], 0], [effect_colorp[0], effect_colorp[1], effect_colorp[2], alpha]);
            Render.GradientRect(center[0] - 90 + fade * 0.8, 0, 90, center[1], 1, [effect_colorp[0], effect_colorp[1], effect_colorp[2], 0], [effect_colorp[0], effect_colorp[1], effect_colorp[2], alpha]);
            Render.GradientRect(0, 0, 90 - fade * 0.8, center[1], 1, [effect_colorp[0], effect_colorp[1], effect_colorp[2], alpha], [effect_colorp[0], effect_colorp[1], effect_colorp[2], 0]);
        }
        if (color[3] <= 5) {
            effect_hit--;
            effect_hit_i = 0
            i2 = 0
            hi = 0;
            hi1 = 0
            hi2 = 0
            effect_base = 0
        }
    } else if (effect_hit > 1) {
        effect_hit_i = 0
        i2 = 0
        hi = 0
        hi1 = 0
        hi2 = 0
        effect_base = 0
        effect_hit = 1;
    }
}
//lightstrike
var lastPositions = [];
function light_onCreateMove() {
    var enemies = Entity.GetPlayers();
    enemies.forEach(function (enemy) {
        if (Entity.IsAlive(enemy) && !Entity.IsDormant(enemy)) {
            lastPositions[enemy] = Entity.GetRenderOrigin(enemy)
        }
    })
}
function light_onPlayerHurt() {
    if (Entity.GetEntityFromUserID(Event.GetInt("attacker")) == Entity.GetLocalPlayer()) {
        var position = lastPositions[Entity.GetEntityFromUserID(Event.GetInt("userid"))];
        if(UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Lightstrike"])){
            World.CreateLightningStrike(false, position);
        }
    }
}
function earse_menu(){
    if(UI.IsMenuOpen()){
        var set_select = UI.GetValue(["Visuals", "NightMare Visuals", "NightMare Visuals","[4.0]Select Settings"])
        switch(set_select){
            //world
            case 0:
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Health Base Box ESP"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]footrail"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Buy Log"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Buylist"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Bullet Tracers"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Hitmarker"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Ragebot logs"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Lightstrike"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Hit Effect"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Kill announcer"], 0);
            //others
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Aspect Ratio"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]damage indicator"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Misc]RainbowBar"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Misc]Zeus Warning"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Global]Gradient Speed"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Boom helper"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]Static legs"], 0);
            //genaral
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Keybinds"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spectator"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Heaven2.0"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]Target Sign"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]New hud"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Kill effect"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[General]Circle enemies indicator"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]Color"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]distance"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]thickness"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Hit/miss ball"], 1);
            //info
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Enemies info"], 0);
            break;
            case 1:
            //world
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Health Base Box ESP"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]footrail"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Buy Log"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Buylist"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Bullet Tracers"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Hitmarker"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Ragebot logs"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Lightstrike"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Hit Effect"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Kill announcer"], 1);
            //others
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Aspect Ratio"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]damage indicator"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Misc]RainbowBar"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Misc]Zeus Warning"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Global]Gradient Speed"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Boom helper"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]Static legs"], 0);
            //genaral
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Keybinds"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spectator"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Heaven2.0"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]Target Sign"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]New hud"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Kill effect"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[General]Circle enemies indicator"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]Color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]distance"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]thickness"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Hit/miss ball"], 0);
            //info
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Enemies info"], 0);
            break;
            case 2:
            //others
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Aspect Ratio"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]damage indicator"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Misc]RainbowBar"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Misc]Zeus Warning"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Global]Gradient Speed"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Boom helper"], 1);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]Static legs"], 1);
            //world
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Health Base Box ESP"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]footrail"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Buy Log"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Buylist"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Bullet Tracers"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Hitmarker"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Ragebot logs"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Lightstrike"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Hit Effect"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Kill announcer"], 0);
            //genaral
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Keybinds"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spectator"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Heaven2.0"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]Target Sign"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]New hud"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Kill effect"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[General]Circle enemies indicator"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]Color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]distance"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]thickness"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Hit/miss ball"], 0);
            //info
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Enemies info"], 0);
            break;
            case 3:
            //others
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Aspect Ratio"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]damage indicator"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Misc]RainbowBar"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Misc]Zeus Warning"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Global]Gradient Speed"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Boom helper"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]Static legs"], 0);
            //world
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Health Base Box ESP"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]footrail"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Buy Log"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Buylist"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Bullet Tracers"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Hitmarker"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Ragebot logs"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[World]Lightstrike"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Hit Effect"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Kill announcer"], 0);
            //genaral
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Keybinds"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Theme]Spectator"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Heaven2.0"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Rage]Target Sign"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]New hud"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Kill effect"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[General]Circle enemies indicator"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]Color"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]distance"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Circle]thickness"], 0);
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[4.0]Hit/miss ball"], 0);
            //info
            UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "Enemies info"], 1);
            break;
        }
    }
    
}

function handle_menu(){
    var screensize = Global.GetScreenSize();
    //remake
    UI.AddDropdown(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[4.0]Theme style",["Original","Solus","Modern"],0);
    UI.AddDropdown(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[4.0]Color method",["Custom","Fade","Dynamic Fade"],0);
    UI.AddColorPicker( ["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Theme]Color picker" );
    //indicator new
    UI.AddDropdown( ["Visuals", "NightMare Newind", "NightMare Newind"],"Indicator main type", [ "None","Holo","Pure text","Martix" ], 0 );

    UI.AddDropdown( ["Visuals", "NightMare Newind", "NightMare Newind"],"Text options", [ "Default","Override" ], 0 );
    UI.AddColorPicker(["Visuals", "NightMare Newind", "NightMare Newind"], "Custom text color");
    UI.AddColorPicker(["Visuals", "NightMare Newind", "NightMare Newind"], "Theme color");
    UI.AddColorPicker(["Visuals", "NightMare Newind", "NightMare Newind"], "Weapon color");
    UI.AddDropdown( ["Visuals", "NightMare Newind", "NightMare Newind"],"Sign type", [ ":","->" ], 0 );
    UI.AddTextbox( ["Visuals", "NightMare Newind", "NightMare Newind"], "Custom text" );
    UI.AddDropdown( ["Visuals", "NightMare Newind", "NightMare Newind"],"[Holo]Color style", [ "Custom","Adaptive" ], 0 );
    UI.AddColorPicker(["Visuals", "NightMare Newind", "NightMare Newind"], "[Holo]Theme Color");
    UI.AddSliderInt(["Visuals", "NightMare Newind", "NightMare Newind"], "Background alpha",0,180);
    UI.AddSliderInt(["Visuals", "NightMare Newind", "NightMare Newind"], "Font size",32,36);
    UI.AddCheckbox(["Visuals", "NightMare Newind", "NightMare Newind"],"Background color override");
    UI.AddColorPicker(["Visuals", "NightMare Newind", "NightMare Newind"], "Background color");
    UI.AddCheckbox(["Visuals", "NightMare Newind", "NightMare Newind"],"Addon bar");
    UI.AddColorPicker(["Visuals", "NightMare Newind", "NightMare Newind"], "Addon bar color");

    UI.AddCheckbox(["Visuals", "NightMare Newind", "NightMare Newind"],"Fakelag");
    UI.AddCheckbox(["Visuals", "NightMare Newind", "NightMare Newind"],"Desync yaw");
    UI.AddCheckbox(["Visuals", "NightMare Newind", "NightMare Newind"],"Weapon info");
    UI.AddSliderInt(["Visuals", "NightMare Newind", "NightMare Newind"], "indicator new x", 0, screensize[0]);
    UI.AddSliderInt(["Visuals", "NightMare Newind", "NightMare Newind"], "indicator new y", 0, screensize[1]);
    //纯文字设置
    UI.AddCheckbox(["Visuals", "NightMare Newind", "NightMare Newind"],"Advanced info");
    UI.AddSliderInt(["Visuals", "NightMare Newind", "NightMare Newind"], "Pure text x", 0, 30);
    UI.AddSliderInt(["Visuals", "NightMare Newind", "NightMare Newind"], "Pure text y", 0, screensize[1]);

    
    //indicator
    UI.AddDropdown( ["Visuals", "NightMare Visuals", "NightMare Visuals"],"[4.0]Select Settings", [ "General","World","Others","Enemies Info" ], 0 );

    //solus ui
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"],"[Theme]Keybinds");
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Theme]Keybinds x", 0, screensize[0]);
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Theme]Keybinds y", 0, screensize[1]);
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"],"[Theme]Spectator");
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Theme]Spec x", 0, screensize[0]);
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Theme]Spec y", 0, screensize[1]);
    //hit/miss ball
    UI.AddCheckbox( [ "Visuals", "NightMare Visuals", "NightMare Visuals" ], "[4.0]Hit/miss ball" );
    UI.AddSliderInt([ "Visuals", "NightMare Visuals", "NightMare Visuals" ],"[Hit/Miss]Ball X", 0, Render.GetScreenSize()[0]);
    UI.AddSliderInt([ "Visuals", "NightMare Visuals", "NightMare Visuals" ],"[Hit/Miss]Ball Y", 0, Render.GetScreenSize()[1]);
    UI.AddColorPicker([ "Visuals", "NightMare Visuals", "NightMare Visuals" ],"[Hit/Miss]Theme Color");
    UI.AddColorPicker([ "Visuals", "NightMare Visuals", "NightMare Visuals" ],"[Hit/Miss]Back color");
    UI.AddSliderInt( [ "Visuals", "NightMare Visuals", "NightMare Visuals" ], "[Hit/Miss]Inner Radius", 20, 45 );
    UI.AddSliderInt( [ "Visuals", "NightMare Visuals", "NightMare Visuals" ], "[Hit/Miss]Radius", 45, 70 );
    //Healthesp
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[World]Health Base Box ESP")
    UI.AddDropdown( ["Visuals", "NightMare Visuals", "NightMare Visuals"], "[ESP]Box type", [ "One side","Two side","Custom one side","Custom two side","Coolbox" ], 0 )
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"],"[ESP]Custom Color 1")
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"],"[ESP]Custom Color 2")
    //HUD
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[4.0]New hud");
    UI.AddSliderInt( ["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Hud]hud x", 0, screen_size[0] );
    UI.AddSliderInt( ["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Hud]hud y", 0, screen_size[1] );
    UI.AddColorPicker( ["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Hud]theme color" );
    UI.AddColorPicker( ["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Hud]text color" );
    //foottrail
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"],"[World]footrail");
    UI.AddSliderFloat(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Fade speed", 0.15, 1);
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Trail size", 6, 15);
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Trail thick", 0, 4);
    //fd
    // UI.AddHotkey(["Rage", "General", "General", "Key assignment"], "MM Fake Duck", "MM Fake Duck");
    //ASPECT RATIO
    UI.AddSliderFloat(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Aspect Ratio", 0.0, 5.0);
	UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Rage]damage indicator");
	UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Damage]indicator color");
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Damage]indicator text color");
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Misc]RainbowBar");
    UI.AddDropdown(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Bar]color type", ["Colorx1", "RGB"], 0);
    UI.AddDropdown(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Bar]pos type", ["Full", "upon"], 0);
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Misc]Zeus Warning");
    UI.AddDropdown(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Zeus]Warning type", ["Mjolnir", "Flash"], 0);
    UI.AddSliderFloat(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Global]Gradient Speed", 0.1, 1.0);
    
    //effective
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[World]Lightstrike");
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[4.0]Ragebot logs");
    //hitsset
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[World]Hitmarker");
    UI.AddDropdown(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Marker]Font", ["ariblk", "Minecraft","Comfortaa","Verdana","Calibri"], 0);
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Marker]color");
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Marker]size", 14, 26);
    //bullet
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"],"[World]Bullet Tracers");
    UI.AddDropdown(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Bullet]Drop Point Marker", ["Circle", "X","Rect","None"], 0);
    UI.AddDropdown(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Bullet]color style", ["Custom", "Rgb"], 0);
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Bullet]Tracer color");
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Bullet]Tracer time", 1, 4);
    //kill effect
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[4.0]Kill effect");
    UI.AddDropdown( ["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Kill]Effect type",[ "Headshot","love" ], 0 )
    UI.AddSliderInt( ["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Kill]effect size", 24, 32 )
    UI.AddSliderFloat( ["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Kill]effect float speed", 2.0, 3.6 )
    UI.AddSliderInt( ["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Kill]effect-fade time", 160, 255 )
    UI.AddColorPicker( ["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Kill]effect color")
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Kill]effect - RGB");
    //buylist
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[4.0]Buy Log");
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[4.0]Buylist");
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Buylist] x", 0, Global.GetScreenSize()[0]);
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Buylist] y", 0, Global.GetScreenSize()[1]);
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Buylist]item color");
    UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist] x"], 0);
    UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist] y"], 0);
    UI.SetEnabled(["Visuals", "NightMare Visuals", "NightMare Visuals", "[Buylist]item color"], 0);
    //bomb helper
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Boom helper");
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Theme Color");
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Text Color");
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Helper x", 0, Global.GetScreenSize()[0]);
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Helper y", 0, Global.GetScreenSize()[1]);
    //2.0
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Rage]Target Sign");
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Heaven2.0");
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Heaven]Indicator x", 0, screensize[0]);
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Heaven]Indicator y", 0, screensize[1]);
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Heaven]Rainbow");
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Heaven]FL Color");
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Heaven]Desync Color");
    //enemies info
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"],"Enemies info")
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Info text color");
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Cash color");
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Health color");
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "Info weapon color");
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "infolist x", 0, Global.GetScreenSize()[0]);
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "infolist y", 0, Global.GetScreenSize()[1]);
    //circle indicator
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[General]Circle enemies indicator");
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Circle]Color");
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Circle]distance", 0, 400)
    UI.AddSliderInt(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Circle]thickness", 0, 20)
    //static legs
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"],"[Rage]Static legs")
    //hiteffect
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[4.0]Hit Effect");
    UI.AddColorPicker(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[Effect]Color picker");
    //killannouncer
    UI.AddCheckbox(["Visuals", "NightMare Visuals", "NightMare Visuals"], "[4.0]Kill announcer");
    UI.AddColorPicker( ["Visuals", "NightMare Visuals", "NightMare Visuals"],"[Announcer]Color picker");
}handle_menu();
//HUD
Cheat.RegisterCallback("player_hurt", "hud_onPlayerHurt")
Cheat.RegisterCallback("round_start", "hud_round_start")
Cheat.RegisterCallback("round_end", "hud_round_end")
Cheat.RegisterCallback("Draw", "draw_hud");
Cheat.RegisterCallback("CreateMove", "command_thread");
//foottrail
Cheat.RegisterCallback("Draw", "trail")
//watermark
Cheat.RegisterCallback("Draw", "main_visuals")
//solus ui
Global.RegisterCallback("Draw", "solus_keybinds")
Global.RegisterCallback("Draw", "solus_spec")
//indicator new
Global.RegisterCallback("Draw", "indicator_new")
//misc sets
Global.RegisterCallback("Draw", "misc_set")
//fd
Cheat.RegisterCallback("CreateMove", "fastDuckUpdate")
//Healthesp
Cheat.RegisterCallback("Draw", "Health_base_esp");
Cheat.RegisterCallback( "FrameStageNotify", "aspectratio" );
Global.RegisterCallback("player_hurt","on_player_hit");
Cheat.RegisterCallback("Draw","draw_hitmarker");
//effect
Cheat.RegisterCallback("Draw", "rain_onDraw");
Cheat.RegisterCallback("player_death", "light_onPlayerHurt");
Cheat.RegisterCallback("CreateMove", "light_onCreateMove");
Cheat.RegisterCallback("Draw", "death_effect");
Cheat.RegisterCallback("player_death", "on_death");
//buylist
Global.RegisterCallback("item_purchase", "BuyLogss");
Global.RegisterCallback('round_end', 'roundend');
Global.RegisterCallback('round_start', 'rountstart');
Global.RegisterCallback("Draw", "drawbuylist")
//bullet
Cheat.RegisterCallback("bullet_impact", "bullet_get");
Cheat.RegisterCallback("Draw", "draw_bullet");
Global.RegisterCallback("item_purchase", "BuyLogs");
//target sign
Cheat.RegisterCallback("CreateMove", "onCM");
Cheat.RegisterCallback("Draw", "Draw_target");
//Heaven
Cheat.RegisterCallback("Draw", "Heaven");
//dmglog
Global.RegisterCallback("ragebot_fire", "ragebot_fire");
Global.RegisterCallback("player_hurt", "hitlog");
Global.RegisterCallback("Draw", "logs_onDraw");
Cheat.RegisterCallback("Draw", "draw_dmgoverride");
//AAcall
Cheat.RegisterCallback("Draw", "handle_main")
Cheat.RegisterCallback("Unload", "unloader_reset_aa")
Cheat.RegisterCallback("Unload", "tickbase_unloader")
Cheat.RegisterCallback("weapon_fire", "heaven_circle")
Cheat.RegisterCallback("CreateMove", "desync_angle")
Cheat.RegisterCallback("CreateMove", "entity_player_peek")
Cheat.RegisterCallback("CreateMove", "tickbase_instant_dt")
Cheat.RegisterCallback("player_hurt", "antibrute_entity_hurt")
Cheat.RegisterCallback("Draw", "nightmare_heaven_indicators")
Cheat.RegisterCallback("CreateMove", "ideal_yaw_freestanding")
Cheat.RegisterCallback("bullet_impact", "antibrute_entity_bullet")
Cheat.RegisterCallback("player_hurt", "ideal_yaw_data_side_reset")
Cheat.RegisterCallback("CreateMove", "tickbase_exploit_crooked")
Cheat.RegisterCallback("CreateMove", "creative_nightmare_fakelag")
Cheat.RegisterCallback("bullet_impact", "tickbase_cmove_shift_fired")
Cheat.RegisterCallback("CreateMove", "slowwalk");
//bomb helper
Cheat.RegisterCallback("bomb_beginplant", "beginPlant");
Cheat.RegisterCallback("bomb_abortplant", "abortPlant");
Cheat.RegisterCallback("bomb_planted", "bombPlanted");
Cheat.RegisterCallback("bomb_defused", "reset");
Cheat.RegisterCallback("round_start", "reset");
Cheat.RegisterCallback("Draw", "on_paint");
Cheat.RegisterCallback("Draw", "earse_menu");
//enemies info
Cheat.RegisterCallback("Draw", "Enemies_info")
//circle indicator
Cheat.RegisterCallback("Draw", "DrawArrow");
//static legs
Cheat.RegisterCallback("CreateMove", "static_legs");
//onload info
Cheat.RegisterCallback("Draw", "onload_info");
//hit/miss ball
Global.RegisterCallback("Draw", "ball_Draw");
Global.RegisterCallback("ragebot_fire", "ball_ragebot_fire");
Global.RegisterCallback("player_hurt", "ball_player_hurt");
//hiteffect
Global.RegisterCallback("Draw", "effect_drawHit");
Global.RegisterCallback("player_hurt", "effect_playerHurt");
//killannouncer
Cheat.RegisterCallback("player_death", "announcer_kill");
Cheat.RegisterCallback("Draw", "draw_announcer");
Cheat.RegisterCallback("round_end", "announcer_round_end")
Cheat.ExecuteCommand( "showconsole" );
Cheat.PrintColor([255, 192, 203, 25], "[梦魇]");
Cheat.PrintColor([80,86,206, 25], ".@@@@/      =@@^   =@@^    ,@@@@@@@@@@`   .@@@.      =@@^  @@@@@@@@@@@@@  @@@@`       .@@@@       /@@@@.      =@@@@@@@@@@`   =@@@@@@@@@\n");
Cheat.PrintColor([255, 192, 203, 25], "[梦魇]");
Cheat.PrintColor([117,85,202, 25], ".@@@@@@     =@@^   =@@^   /@@/      /@@^  .@@@.      =@@^      =@@^       @@@@@.      /@@@@      =@@^@@/      =@@^    ./@@^  =@@^\n");
Cheat.PrintColor([255, 192, 203, 25], "[梦魇]");
Cheat.PrintColor([172,82,195, 25], ".@@@.@@@`   =@@^   =@@^  ,@@@.            .@@@.      =@@^      =@@^       @@^@@/     =@@*@@     ,@@/ =@@^     =@@^     =@@^  =@@^\n");
Cheat.PrintColor([255, 192, 203, 25], "[梦魇]");
Cheat.PrintColor([198,80,192, 25], ".@@@  /@@^  =@@^   =@@^  =@@@             .@@@@@@@@@@@@@^      =@@^       @@^,@@^   =@@`*@@    .@@@   /@@`    =@@/]]]/@@@/   =@@@@@@@@\n");
Cheat.PrintColor([255, 192, 203, 25], "[梦魇]");
Cheat.PrintColor([218,120,166, 25], ".@@@   =@@/ =@@^   =@@^  =@@@   .@@@@@@@  .@@@@@@@@@@@@@^      =@@^       @@^ =@@^ ,@@^ *@@    /@@`   .@@@    =@@@[/@@@.     =@@/\n");
Cheat.PrintColor([255, 192, 203, 25], "[梦魇]");
Cheat.PrintColor([225,137,155, 25], ".@@@    ,@@@=@@^   =@@^  .@@@^      *@@@  .@@@.      =@@^      =@@^       @@^  =@@`@@/  *@@   =@@@@@@@@@@@/   =@@^  ,@@@`    =@@^\n");
Cheat.PrintColor([255, 192, 203, 25], "[梦魇]");
Cheat.PrintColor([240,170,135, 25], ".@@@     .@@@@@^   =@@^   .@@@/`   ,@@@@  .@@@.      =@@^      =@@^       @@^   /@@@@.  *@@  ,@@@       /@@^  =@@^   .@@@^   =@@^\n");
Cheat.PrintColor([255, 192, 203, 25], "[梦魇]");
Cheat.PrintColor([249,191,120, 25], ".@@@       /@@@^   =@@^     ,/@@@@@@@[.   .@@@.      =@@^      =@@^       @@^   .@@@`   *@@ .@@@`       .@@@` =@@^     /@@/  =@@@@@@@@@.\n");
Cheat.PrintColor([186, 85, 211, 25], "[公告]:");
Cheat.PrintColor([255, 106, 106, 25], "祝新年快乐！\n");
Cheat.PrintColor([186, 85, 211, 25], "[公告]:");
Cheat.PrintColor([255, 106, 106, 25], "正在对视觉进行重置！\n");
Cheat.PrintColor([186, 85, 211, 25], "[公告]:");
Cheat.PrintColor([255, 106, 106, 25], "新作品Ribirth+现已公布！\n");
Cheat.PrintColor([186, 85, 211, 25], "[公告]:");
Cheat.PrintColor([255, 106, 106, 25], "官方网站http://nightmare.pub！\n");
Cheat.PrintColor([186, 85, 211, 25], "[公告]:");
Cheat.PrintColor([255, 106, 106, 25], "内部测试版本，感谢您的使用！\n");

// 2021.8.21 Nightmare Adaptive Weapon
UI.AddSubTab(["Rage", "SUBTAB_MGR"], "NightMare Weapon");
var weapon_data = {
	def_elements : {},
	weapon_state : 0,
	last_current_index : 0,
	weapon_elements : {},
	weapon_list : ["Global", "Awp", "Scout", "Auto-Snipers", "R8-Revolver", "Deagle", "Duals", "AK47", "M4A4", "MP9", "Pistol", "Rifle", "Shotguns", "MachingGuns", "Taser Zeus"],
	elements_codes : ["General", "USP", "Glock", "P2000", "CZ-75", "Five Seven", "Dualies", "Revolver", "Deagle", "P250", "Tec-9", "MP9", "MP7", "Mac10", "PP-Bizon", "UMP45", "MP5", "P90", "AK47", "SG553", "AUG", "FAMAS", "GALIL", "M4A1-S", "M4A4", "SSG08", "AWP", "G3SG1", "SCAR20", "Nova", "XM1014", "Sawed off", "MAG7", "M249", "Negev"]
}

weapon_data.def_elements = {
	enabled : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "Enabled NightMare Weapon"),
	current_weapon : UI.AddDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "Nightmare Weapon Current", weapon_data.weapon_list, 0),
	update_current : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "Update Current Weapon")
}

for (var i = 0; i <= weapon_data.weapon_list.length - 1; i ++) {
	weapon_data.weapon_elements[i] = {
		enabled_weapon : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Enabled Config"),
		hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
		mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
		hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Hitchance", 0, 100),
		damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Damage", 0, 130),
		head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Head Scale", 0, 100),
		body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Body Scale", 0, 100),
		auto_scope : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Auto Scope"),
		auto_stop : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Auto Stop"),
		auto_stop_condition : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Auto Stop Condition", ["Duck", "Early", "On center only", "Lethal only", "Visible only", "In air", "Between shots", "Force accuracy"]),
		prefer_safe : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Prefer Safe Point"),
		prefer_baim : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Prefer Body Aim"),
		enabled_current_state : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Enabled Current States", ["[Def]Visible", "Jump", "Hide Shot", "Double Tap", "No Scope", "Distance"]),
		current_state : UI.AddDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Current State", ["[Def]Visible", "Jump", "Hide Shot", "Double Tap", "No Scope", "Distance"], 0),
		vis_active : {
			hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
			mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
			hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Hitchance", 0, 100),
			damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Damage", 0, 130),
			head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Head Scale", 0, 100),
			body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Body Scale", 0, 100),
			auto_scope : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Auto Scope"),
			auto_stop : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Auto Stop"),
			auto_stop_condition : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Auto Stop Condition", ["Duck", "Early", "On center only", "Lethal only", "Visible only", "In air", "Between shots", "Force accuracy"]),
			prefer_safe : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Prefer Safe Point"),
			prefer_baim : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Prefer Body Aim")
		}, 

		jump_active : {
			wall : {
				hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Jump Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Jump Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Jump Hitchance", 0, 100),
				damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Jump Damage", 0, 130),
				head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Jump Head Scale", 0, 100),
				body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Jump Body Scale", 0, 100)
			},

			vis : {
				hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Jump Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Jump Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Jump Hitchance", 0, 100),
				damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Jump Damage", 0, 130),
				head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Jump Head Scale", 0, 100),
				body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Jump Body Scale", 0, 100)
			},

			auto_scope : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Jump Auto Scope"),
			auto_stop : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Jump Auto Stop"),
			auto_stop_condition : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Jump Auto Stop Condition", ["Duck", "Early", "On center only", "Lethal only", "Visible only", "In air", "Between shots", "Force accuracy"]),
			prefer_safe : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Jump Prefer Safe Point"),
			prefer_baim : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Jump Prefer Body Aim")
		}, 

		hideshot_active : {
			wall : {
				hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Hide Shot Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Hide Shot Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Hide Shot Hitchance", 0, 100),
				damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Hide Shot Damage", 0, 130),
				head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Hide Shot Head Scale", 0, 100),
				body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Hide Shot Body Scale", 0, 100)
			},

			vis : {
				hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Hide Shot Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Hide Shot Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Hide Shot Hitchance", 0, 100),
				damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Hide Shot Damage", 0, 130),
				head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Hide Shot Head Scale", 0, 100),
				body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Hide Shot Body Scale", 0, 100)
			},

			auto_scope : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Hide Auto Scope"),
			auto_stop : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Hide Auto Stop"),
			auto_stop_condition : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Hide Auto Stop Condition", ["Duck", "Early", "On center only", "Lethal only", "Visible only", "In air", "Between shots", "Force accuracy"]),
			prefer_safe : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Hide Prefer Safe Point"),
			prefer_baim : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Hide Prefer Body Aim")
		}, 

		dt_active : {
			wall : {
				hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def DT Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def DT Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def DT Hitchance", 0, 100),
				damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def DT Damage", 0, 130),
				head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def DT Head Scale", 0, 100),
				body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def DT Body Scale", 0, 100)
			},

			vis : {
				hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis DT Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis DT Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis DT Hitchance", 0, 100),
				damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis DT Damage", 0, 130),
				head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis DT Head Scale", 0, 100),
				body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis DT Body Scale", 0, 100)
			},

			auto_scope : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]DT Auto Scope"),
			auto_stop : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]DT Auto Stop"),
			auto_stop_condition : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]DT Auto Stop Condition", ["Duck", "Early", "On center only", "Lethal only", "Visible only", "In air", "Between shots", "Force accuracy"]),
			prefer_safe : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]DT Prefer Safe Point"),
			prefer_baim : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]DT Prefer Body Aim")
		}, 

		nos_active : {
			wall : {
				hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Nos Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Nos Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Nos Hitchance", 0, 100),
				damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Nos Damage", 0, 130),
				head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Nos Head Scale", 0, 100),
				body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Nos Body Scale", 0, 100)
			},

			vis : {
				hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Nos Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Nos Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Nos Hitchance", 0, 100),
				damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Nos Damage", 0, 130),
				head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Nos Head Scale", 0, 100),
				body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Nos Body Scale", 0, 100)
			},

			auto_scope : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Nos Auto Scope"),
			auto_stop : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Nos Auto Stop"),
			auto_stop_condition : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Nos Auto Stop Condition", ["Duck", "Early", "On center only", "Lethal only", "Visible only", "In air", "Between shots", "Force accuracy"]),
			prefer_safe : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Nos Prefer Safe Point"),
			prefer_baim : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Nos Prefer Body Aim")
		}, 

		distance_active : {
			distance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Trigger Distance /X M", 0, 200),
			wall : {
				hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Dis Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Dis Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Dis Hitchance", 0, 100),
				damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Dis Damage", 0, 130),
				head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Dis Head Scale", 0, 100),
				body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Def Dis Body Scale", 0, 100)
			},

			vis : {
				hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Dis Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				mp_hitbox : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Dis Multi Hitbox", ["Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet", "Arms"]),
				hitchance : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Dis Hitchance", 0, 100),
				damage : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Dis Damage", 0, 130),
				head_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Dis Head Scale", 0, 100),
				body_scale : UI.AddSliderInt(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Vis Dis Body Scale", 0, 100)
			},

			auto_scope : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Dis Auto Scope"),
			auto_stop : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Dis Auto Stop"),
			auto_stop_condition : UI.AddMultiDropdown(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Dis Auto Stop Condition", ["Duck", "Early", "On center only", "Lethal only", "Visible only", "In air", "Between shots", "Force accuracy"]),
			prefer_safe : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Dis Prefer Safe Point"),
			prefer_baim : UI.AddCheckbox(["Rage", "NightMare Weapon", "NightMare Weapon"], "[" + weapon_data.weapon_list[i] + "]Dis Prefer Body Aim")
		},
	}

	UI.SetValue(weapon_data.weapon_elements[0].enabled_weapon, 1)
	UI.SetEnabled(weapon_data.weapon_elements[0].enabled_weapon, 0)
}

var constant_table = function(reference, index) {
	return UI.GetValue(reference) & (1 << index) ? 1 : 0
}

var cover_to_number = function(state) {
	if (typeof state == "boolean") {
		return state ? 1 : 0
	}

	return state
}

var calculate_weapons = function() {
	var local_player = Entity.GetLocalPlayer()
	if (!Entity.IsAlive(local_player) || local_player == undefined) {
		return 0
	}

	var weapon = Entity.GetWeapon(local_player)
	if (weapon == null || weapon == undefined) {
		return 0
	}

	var active_weapon = 0
	var item_active_index = Entity.GetProp(weapon, "CBaseAttributableItem", "m_iItemDefinitionIndex") & 0xFFFF
	if (item_active_index == 9) {
		active_weapon = 1
	} else if (item_active_index == 40) {
		active_weapon = 2
	} else if (item_active_index == 11 || item_active_index == 38) {
		active_weapon = 3
	} else if (item_active_index == 64) {
		active_weapon = 4
	} else if (item_active_index == 1) {
		active_weapon = 5
	} else if (item_active_index == 2) {
		active_weapon = 6
	} else if (item_active_index == 7) {
		active_weapon = 7
	} else if (item_active_index == 16) {
		active_weapon = 8
	} else if (item_active_index == 34) {
		active_weapon = 9
	} else if (item_active_index == 61 || item_active_index == 4 || item_active_index == 36 || item_active_index == 30 || item_active_index == 32 || item_active_index == 3 || item_active_index == 63) {
		active_weapon = 10
	} else if (item_active_index == 39 || item_active_index == 8 || item_active_index == 60 || item_active_index == 10 || item_active_index == 13) {
		active_weapon = 11
	} else if (item_active_index == 17 || item_active_index == 26 || item_active_index == 24 || item_active_index == 33 || item_active_index == 19 || item_active_index == 23) {
		active_weapon = 12
	} else if (item_active_index == 25 || item_active_index == 27 || item_active_index == 14 || item_active_index == 28 || item_active_index == 29 || item_active_index == 35) {
		active_weapon = 13
	} else if (item_active_index == 31) {
		active_weapon = 14
	} else {
		active_weapon = 0
	}

	return active_weapon
}

var set_elements_visible = function() {
	if (!UI.IsMenuOpen()) {
		return
	}

	UI.SetEnabled(weapon_data.def_elements.update_current, UI.GetValue(weapon_data.def_elements.enabled))
	UI.SetEnabled(weapon_data.def_elements.current_weapon, UI.GetValue(weapon_data.def_elements.enabled))
	for (var i = 0; i <= weapon_data.weapon_list.length - 1; i ++) {
		if (i == 0) {
			UI.SetValue(weapon_data.weapon_elements[i].enabled_weapon, 1)
		}

		UI.SetEnabled(weapon_data.weapon_elements[i].enabled_weapon, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && i != 0))
		UI.SetEnabled(weapon_data.weapon_elements[i].hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)]))
		UI.SetEnabled(weapon_data.weapon_elements[i].mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)]))
		UI.SetEnabled(weapon_data.weapon_elements[i].hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)]))
		UI.SetEnabled(weapon_data.weapon_elements[i].damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)]))
		UI.SetEnabled(weapon_data.weapon_elements[i].head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)]))
		UI.SetEnabled(weapon_data.weapon_elements[i].body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)]))
		UI.SetEnabled(weapon_data.weapon_elements[i].auto_scope, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)]))
		UI.SetEnabled(weapon_data.weapon_elements[i].auto_stop, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)]))
		UI.SetEnabled(weapon_data.weapon_elements[i].auto_stop_condition, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].auto_stop)))
		UI.SetEnabled(weapon_data.weapon_elements[i].prefer_safe, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)]))
		UI.SetEnabled(weapon_data.weapon_elements[i].prefer_baim, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)]))
		UI.SetEnabled(weapon_data.weapon_elements[i].enabled_current_state, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)]))
		UI.SetEnabled(weapon_data.weapon_elements[i].current_state, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && (constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0) || constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1) || constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2) || constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3) || constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) || constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5))))
		UI.SetEnabled(weapon_data.weapon_elements[i].vis_active.hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 0 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0)))
		UI.SetEnabled(weapon_data.weapon_elements[i].vis_active.mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 0 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0)))
		UI.SetEnabled(weapon_data.weapon_elements[i].vis_active.hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 0 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0)))
		UI.SetEnabled(weapon_data.weapon_elements[i].vis_active.damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 0 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0)))
		UI.SetEnabled(weapon_data.weapon_elements[i].vis_active.head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 0 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0)))
		UI.SetEnabled(weapon_data.weapon_elements[i].vis_active.body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 0 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0)))
		UI.SetEnabled(weapon_data.weapon_elements[i].vis_active.auto_scope, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 0 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0)))
		UI.SetEnabled(weapon_data.weapon_elements[i].vis_active.auto_stop, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 0 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0)))
		UI.SetEnabled(weapon_data.weapon_elements[i].vis_active.auto_stop_condition, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 0 && UI.GetValue(weapon_data.weapon_elements[i].vis_active.auto_stop) && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0)))
		UI.SetEnabled(weapon_data.weapon_elements[i].vis_active.prefer_safe, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 0 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0)))
		UI.SetEnabled(weapon_data.weapon_elements[i].vis_active.prefer_baim, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 0 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 0)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.wall.hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.wall.mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.wall.hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.wall.damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.wall.head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.wall.body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.vis.hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.vis.mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.vis.hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.vis.damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.vis.head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.vis.body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.auto_scope, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.auto_stop, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.auto_stop_condition, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1) && UI.GetValue(weapon_data.weapon_elements[i].jump_active.auto_stop)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.prefer_safe, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].jump_active.prefer_baim, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 1 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 1)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.wall.hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.wall.mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.wall.hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.wall.damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.wall.head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.wall.body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.vis.hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.vis.mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.vis.hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.vis.damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.vis.head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.vis.body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.auto_scope, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.auto_stop, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.auto_stop_condition, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2) && UI.GetValue(weapon_data.weapon_elements[i].hideshot_active.auto_stop)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.prefer_safe, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].hideshot_active.prefer_baim, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 2 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 2)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.wall.hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.wall.mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.wall.hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.wall.damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.wall.head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.wall.body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.vis.hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.vis.mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.vis.hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.vis.damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.vis.head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.vis.body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.auto_scope, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.auto_stop, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.auto_stop_condition, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3) && UI.GetValue(weapon_data.weapon_elements[i].dt_active.auto_stop)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.prefer_safe, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].dt_active.prefer_baim, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 3 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 3)))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.wall.hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.wall.mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.wall.hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.wall.damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.wall.head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.wall.body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.vis.hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.vis.mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.vis.hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.vis.damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.vis.head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.vis.body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.auto_scope, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.auto_stop, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.auto_stop_condition, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && UI.GetValue(weapon_data.weapon_elements[i].nos_active.auto_stop) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.prefer_safe, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].nos_active.prefer_baim, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 4 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 4) && i <= 3))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.distance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.wall.hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.wall.mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.wall.hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.wall.damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.wall.head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.wall.body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.vis.hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.vis.mp_hitbox, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.vis.hitchance, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.vis.damage, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.vis.head_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.vis.body_scale, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.auto_scope, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.auto_stop, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.auto_stop_condition, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5) && UI.GetValue(weapon_data.weapon_elements[i].distance_active.auto_stop)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.prefer_safe, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
		UI.SetEnabled(weapon_data.weapon_elements[i].distance_active.prefer_baim, cover_to_number(UI.GetValue(weapon_data.def_elements.enabled) && UI.GetValue(weapon_data.weapon_elements[i].enabled_weapon) && weapon_data.weapon_list[i] == weapon_data.weapon_list[UI.GetValue(weapon_data.def_elements.current_weapon)] && UI.GetValue(weapon_data.weapon_elements[i].current_state) == 5 && constant_table(weapon_data.weapon_elements[i].enabled_current_state, 5)))
	}

	if (UI.GetValue(weapon_data.def_elements.update_current) && Entity.IsAlive(Entity.GetLocalPlayer())) {
		var active_index = UI.GetValue(weapon_data.weapon_elements[calculate_weapons()].enabled_weapon) ? calculate_weapons() : 0
		if (weapon_data.last_current_index != active_index) {
			UI.SetValue(weapon_data.def_elements.current_weapon, active_index)
			weapon_data.last_current_index = active_index
		}
	}
}

var g_player_visible = function() {
	var is_visible_target = 0
	var hitbox_is_visible = function(enemy, hitbox_number) {
		var hitbox_number = hitbox_number == null ? 18 : hitbox_number
		for (i = 0; i < hitbox_number; i ++) {
			var enemy_eye_pos = Entity.GetEyePosition(enemy)
			var local_hitbox_pos = Entity.GetHitboxPosition(Entity.GetLocalPlayer(), i)
			var resolved_result = Trace.Bullet(enemy, Entity.GetLocalPlayer(), enemy_eye_pos, local_hitbox_pos)
			if (resolved_result != null && resolved_result[2]) {
				return true
			}
		}

		return false
	}

	var enemy_list = Entity.GetEnemies()
	for (i = 0; i < enemy_list.length; i ++) {
		if (Entity.IsAlive(enemy_list[i]) && !Entity.IsDormant(enemy_list[i])) {
			if (hitbox_is_visible(enemy_list[i], 18)) {
				return true
			}
		}
	}

	return false
}

var g_weapon_state = function(distance, weapon_element) {
	weapon_data.weapon_state = 0
	var enemy_list = Entity.GetEnemies()
	if (g_player_visible() && constant_table(weapon_element.enabled_current_state, 0)) {
		weapon_data.weapon_state = 1
	}

	if (!(Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_fFlags") & (1 << 0)) && constant_table(weapon_element.enabled_current_state, 1)) {
		weapon_data.weapon_state = 2
	}

	if (UI.GetValue(["Rage", "Exploits", "Keys", "Hide shots"]) && constant_table(weapon_element.enabled_current_state, 2)) {
		weapon_data.weapon_state = 3
	}

	if (UI.GetValue(["Rage", "Exploits", "Keys", "Double tap"]) && constant_table(weapon_element.enabled_current_state, 3)) {
		weapon_data.weapon_state = 4
	}

	if (Entity.GetProp(Entity.GetLocalPlayer(), "CCSPlayer", "m_bIsScoped") == 0 && constant_table(weapon_element.enabled_current_state, 4)) {
		weapon_data.weapon_state = 5
	}

	for (var index = 0; index < enemy_list.length; index ++) {
		var enemy_entity = enemy_list[index]
		if (Entity.IsAlive(enemy_entity)) {
			if (get_entity_distance(Entity.GetRenderOrigin(Entity.GetLocalPlayer()), Entity.GetRenderOrigin(enemy_entity)) < distance && constant_table(weapon_element.enabled_current_state, 5)) {
				weapon_data.weapon_state = 6
			}
		}
	}

	return weapon_data.weapon_state
}

var running_nightmare_weapon = function() {
	if (!Entity.IsAlive(Entity.GetLocalPlayer()) || Entity.GetLocalPlayer() == undefined || !UI.GetValue(weapon_data.def_elements.enabled)) {
		return
	}

	var active_weapon_index = calculate_weapons()
	if (active_weapon_index == null || active_weapon_index == undefined || !UI.GetValue(weapon_data.weapon_elements[active_weapon_index].enabled_weapon)) {
		active_weapon_index = 0
	}

	var weapon_element = weapon_data.weapon_elements[active_weapon_index]
	var extra_weapon_element = weapon_data.weapon_elements[active_weapon_index]
	var weapon_state = g_weapon_state(UI.GetValue(weapon_data.weapon_elements[active_weapon_index].distance_active.distance), weapon_element)
	if (weapon_state == 1) {
		weapon_element = weapon_data.weapon_elements[active_weapon_index].vis_active
		extra_weapon_element = weapon_data.weapon_elements[active_weapon_index].vis_active
	} else if (weapon_state == 2) {
		extra_weapon_element = weapon_data.weapon_elements[active_weapon_index].jump_active
		weapon_element = g_player_visible() ? weapon_data.weapon_elements[active_weapon_index].jump_active.vis : weapon_data.weapon_elements[active_weapon_index].jump_active.wall
	} else if (weapon_state == 3) {
		extra_weapon_element = weapon_data.weapon_elements[active_weapon_index].hideshot_active
		weapon_element = g_player_visible() ? weapon_data.weapon_elements[active_weapon_index].hideshot_active.vis : weapon_data.weapon_elements[active_weapon_index].hideshot_active.wall
	} else if (weapon_state == 4) {
		extra_weapon_element = weapon_data.weapon_elements[active_weapon_index].dt_active
		weapon_element = g_player_visible() ? weapon_data.weapon_elements[active_weapon_index].dt_active.vis : weapon_data.weapon_elements[active_weapon_index].dt_active.wall
	} else if (weapon_state == 5) {
		extra_weapon_element = weapon_data.weapon_elements[active_weapon_index].nos_active
		weapon_element = g_player_visible() ? weapon_data.weapon_elements[active_weapon_index].nos_active.vis : weapon_data.weapon_elements[active_weapon_index].nos_active.wall
	} else if (weapon_state == 6) {
		extra_weapon_element = weapon_data.weapon_elements[active_weapon_index].distance_active
		weapon_element = g_player_visible() ? weapon_data.weapon_elements[active_weapon_index].distance_active.vis : weapon_data.weapon_elements[active_weapon_index].distance_active.wall
	}

	var hitbox = UI.GetValue(weapon_element.hitbox)
	var mp_hitbox = UI.GetValue(weapon_element.mp_hitbox)
	var hitchance = UI.GetValue(weapon_element.hitchance)
	var damage = UI.GetValue(weapon_element.damage)
	var head_scale = UI.GetValue(weapon_element.head_scale)
	var body_scale = UI.GetValue(weapon_element.body_scale)
	var auto_scope = UI.GetValue(extra_weapon_element.auto_scope)
	var auto_stop = UI.GetValue(extra_weapon_element.auto_stop)
	var auto_stop_condition = UI.GetValue(extra_weapon_element.auto_stop_condition)
	var prefer_safe = UI.GetValue(extra_weapon_element.prefer_safe)
	var prefer_baim = UI.GetValue(extra_weapon_element.prefer_baim)
	for (i = 0; i < weapon_data.elements_codes.length; i ++) {
		UI.SetValue(["Rage", "Target", weapon_data.elements_codes[i], "Hitboxes"], hitbox)
		UI.SetValue(["Rage", "Target", weapon_data.elements_codes[i], "Multipoint hitboxes"], mp_hitbox)
		UI.SetValue(["Rage", "Accuracy", weapon_data.elements_codes[i], "Hitchance"], hitchance)
		UI.SetValue(["Rage", "Target", weapon_data.elements_codes[i], "Minimum damage"], damage)
		UI.SetValue(["Rage", "Target", weapon_data.elements_codes[i], "Head pointscale"], head_scale)
		UI.SetValue(["Rage", "Target", weapon_data.elements_codes[i], "Body pointscale"], body_scale)
		UI.SetValue(["Rage", "Accuracy", weapon_data.elements_codes[i], "Auto stop"], auto_stop)
		UI.SetValue(["Rage", "Accuracy", weapon_data.elements_codes[i], "Auto stop modifiers"], auto_stop_condition)
		UI.SetValue(["Rage", "Accuracy", weapon_data.elements_codes[i], "Prefer safe point"], prefer_safe)
		UI.SetValue(["Rage", "Accuracy", weapon_data.elements_codes[i], "Prefer body aim"], prefer_baim)
		if (weapon_data.elements_codes[i] == "General" || weapon_data.elements_codes[i] == "SCAR20" || weapon_data.elements_codes[i] == "AWP" || weapon_data.elements_codes[i] == "SSG08" || weapon_data.elements_codes[i] == "G3SG1") {
			UI.SetValue(["Rage", "Accuracy", weapon_data.elements_codes[i], "Auto scope"], auto_scope)
		}
	}
}

Cheat.RegisterCallback("Draw", "set_elements_visible")
Cheat.RegisterCallback("CreateMove", "running_nightmare_weapon")