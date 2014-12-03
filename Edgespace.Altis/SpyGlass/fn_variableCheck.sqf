/*
	File: fn_variableCheck.sqf
	
	Description:
	Checks against harmful variables, disable this if client-performance is 
	to bad in the fn_initSpy.sqf, the menuCheck should be good enough!
*/
private["_badVariables","_checkThread"];
_badVariables = ["JxMxE_hide","JME_Keybinds","JME_has_yet_to_fuck_this_shit","JME_deleteC","JME_Tele","JME_ANAL_PLOW","JME_M_E_N_U_initMenu","JME_M_E_N_U_hax_toggled","W_O_O_K_I_E_FUD_Pro_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_Car_RE",
	"JxMxE_Veh_M","JxMxE_LifeCash500k","W_O_O_K_I_E_FUD_FuckUp_GunStore","W_O_O_K_I_E_FUD_M_E_N_U_initMenu","W_O_O_K_I_E_FuckUp_GunStore_a","JME_KillCursor","JME_OPTIONS","JME_M_E_N_U_fill_TROLLmenu","ASSPLUNGE","FOXBYPASS","POLICE_IN_HELICOPTA",
	"JxMxE_EBRP","W_O_O_K_I_E_M_E_N_U_funcs_inited","Menu_Init_Lol","E_X_T_A_S_Y_Atm","W_O_O_K_I_E_Pro_RE","W_O_O_K_I_E_Debug_Mon","W_O_O_K_I_E_Debug_1337","Veh_S_P_A_W_N_Shitt","sfsefse","tw4etinitMenu","tw4etgetControl",
	"JxMxEsp","JxMxE_GOD","JxMxE_Heal","efr4243234","sdfwesrfwesf233","sdgff4535hfgvcxghn","adadawer24_1337","lkjhgfuyhgfd","E_X_T_A_S_Y_M_E_N_U_funcs_inited","dayz_serverObjectMonitor","fsfgdggdzgfd","fsdddInfectLOL","Wookie_List",
	"JxMxE_TP","Wookie_Pro_RE","Wookie_Car_RE","Wookie_Debug_Mon","faze_funcs_inited","advertising_banner_infiSTAR","atext_star_xa","Monky_hax_dbclick","qopfkqpofqk","debug_star_colorful","AntiAntiAntiAntiHax","antiantiantiantih4x",
	"JxMxE_Infect","hub","scrollinit","gfYJV","Lystic_LMAOOOOOOOOOOOOOOOOOOO","Lystic_Re","Lysto_Lyst","E_X_T_A_S_Y_Keybinds","Menulocations","Lystic_Init","scroll_m_init_star","exstr1","pathtoscrdir3","Monky_funcs_inited",
	"JxMxE_secret","Monky_initMenu","player_zombieCheck","E_X_T_A_S_Y_Recoil","godlol","playericons","abcdefGEH","wierdo","go_invisible_infiSTAR","serverObjectMonitor","enamearr","initarr3","locdb","sCode","infAmmoIndex",
	"nukeDONEstar","Wookie_List","Wookie_Pro_RE","FUCKTONIC","E_X_T_A_S_Y_FuckUp_GunStore_a","E_X_T_A_S_Y_Cash_1k_t","E_X_T_A_S_Y_Cash_a","E_X_T_A_S_Y_LicenseDrive","E_X_T_A_S_Y_Menu_LOOOOOOOOOL","Metallica_vehicleg0dv3_infiSTAR",
	"JJJJ_MMMM___EEEEEEE_INIT_MENU","JJJJ_MMMM___EEEEEEE_GAPER","JJJJ_MMMM___EEEEEEE_SMOKExWEEDxEVERYDAY_BUM_RAPE","JJJJ_MMMM___EEEEEEE_OPTIONS","JJJJ_MMMM___EEEEEEE_M_E_N_U_fill_Target","E3p",
	"Jesus_MODE","ESP","MissileStrike","AL_Liscenses","NoIllegal","NoWeight","m0nkyaatp_sadksadxa","m0nkyaatp_RANDSTR","myvar23","player_adminlevel","TNK","I_like_turtles",
	"BIGM","Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTARS","Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTAR1","GMod","No_No_No_Tonic_likes_A_Big_Fat_Sheep_Cock_Right_in_the_bum_G0d_Mode",
	"Sload","T3le","life_no_injection","Tonic_has_a_gaping_vagina","my_anus_hurtz","aKFerm","aKMMenu","aKTitans","aKLikeaG0d","riasgremory_G0d_Mode","aKCarG0d","riasgremory_Car_Jesus","aKE5p","riasgremory_isseilol","aKPMark",
	"riasgremory_Noobs","riasgremory_Bitches","riasgremory_Map_Markers","aKUnMmo","jenesuispasuncheateur_unamo","aKVoit","Loljesaispasquoiecriremdr","isseigremory","gremorysama","aKTaCu","aKCardetroy","aKGetKey","aKKillcursor",
	"aKNoEscort","aKEscort","aKtroll","aKTPall","aKUnrestrain","aKNoEscortMe","aKNoTaze","aKJailplayer","aKLisense","riasgremory_titans_shit_reold","Tonic_merde","jaimepaslepoisin_HLEAL","TTTT_IIII___TTTTTTT_RAP_FR","TTTT_IIII___TTTTTTT_REPGA",
	"TTTT_IIII___TTTTTTT_REPGAs","jaimepaslepoisin_HLEAL","Root_Main4","Root_Pistol4","Root_Rifle4","Root_Machinegun4","Root_Sniper4","Root_Launcher4","Root_Attachement4",
	"pic","veh","wuat_fpsMonitor","unitList","list_wrecked","p","fffffffffff","markPos","pos","marker","TentS","VL","MV",
	"mk2","i","j","fuckmegrandma","mehatingjews","scode","TTT5OptionNR","igodokxtt","omgwtfbbq","namePlayer","thingtoattachto","HaxSmokeOn","v",
	"antiloop","ARGT_JUMP","selecteditem","moptions","delaymenu","gluemenu","spawnweapons1","abcd","skinmenu","playericons","changebackpack","keymenu",
	"img","surrmenu","footSpeedIndex","ctrl_onKeyDown","plrshldblcklst","musekeys","dontAddToTheArray","morphtoanimals","playerDistanceScreen","pm",
	"debugConsoleIndex","MY_KEYDOWN_FNC","TAG_onKeyDown","changestats","helpmenu","unitsmenu","xZombieBait","shnmenu","slag","xtags","tempslag",
	"dayzRespawn2","dayzRespawn3","hangender","addgun","ESP","BIS_fnc_3dCredits_n","ViLayer","maphalf","activeITEMlist","activeITEMlistanzahl","xyzaa",
	"iBeFlying","rem","DAYZ_CA1_Lollipops","bowonky","HMDIR","HDIR","Monky_funcs_inited","atext","boost","Ug8YtyGyvguGF","inv","rspwn","nd","qofjqpofq",
	"invall","initarr","reinit","byebyezombies","keymenu2","hotkeymenu","letmeknow","Listw","mahcaq","mapm","weapFun","firstrun","take1","dwarden","bowonky",
	"bowen","monky","pic","god","toggle_keyEH","drawic","mk2","i","j","ptags","abox1","dayz_godmode","testIndex","g0d","g0dmode","zeus","zeusmode","cargod",
	"qopfkqpofqk","monkytp","pbx","playershield","zombieDistanceScreen","theKeyControl","plrshldblckls","zombieshield","pathtoscrdir","footSpeedKeys","wl",
	"spawnitems1","lmzsjgnas","vm","Monky_hax_toggled","pu","nb","vspeed","godlol","aesp","godall","initarr3","initarr2","DEV_ConsoleOpen","LOKI_GUI_Key_Color",
	"W_O_O_K_I_E_FUD_Pro_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_FuckUp_GunStore","W_O_O_K_I_E_FUD_M_E_N_U_initMenu",
	"W_O_O_K_I_E_FuckUp_GunStore_a","W_O_O_K_I_E_M_E_N_U_funcs_inited","Menu_Init_Lol","W_O_O_K_I_E_Pro_RE","W_O_O_K_I_E_Debug_Mon","W_O_O_K_I_E_Debug_1337",
	"Veh_S_P_A_W_N_Shitt","sfsefse","tw4etinitMenu","tw4etgetControl","efr4243234","sdfwesrfwesf233","sdgff4535hfgvcxghn","adadawer24_1337","lkjhgfuyhgfd",
	"dayz_serverObjectMonitor","fsfgdggdzgfd","fsdddInfectLOL","Wookie_List","Wookie_Pro_RE","Wookie_Car_RE","Wookie_Debug_Mon","faze_funcs_inited",
	"advertising_banner_infiSTAR","atext_star_xa","Monky_hax_dbclick","debug_star_colorful","AntiAntiAntiAntiHax","antiantiantiantih4x","hub","scrollinit",
	"gfYJV","Lystic_LMAOOOOOOOOOOOOOOOOOOO","Lystic_Re","Lysto_Lyst","Menulocations","Lystic_Init","scroll_m_init_star","exstr1","pathtoscrdir3",
	"Monky_initMenu","player_zombieCheck","abcdefGEH","wierdo","go_invisible_infiSTAR","serverObjectMonitor","enamearr","locdb","infAmmoIndex","nukeDONEstar",
	"g00d_Metallica","tphigh_choice_infistar","tphigh_menu_Metallica_menu","E_X_T_A_S_Y_Atm","E_X_T_A_S_Y_M_E_N_U_funcs_inited","E_X_T_A_S_Y_Keybinds",
	"E_X_T_A_S_Y_Recoil","FUCKTONIC","E_X_T_A_S_Y_FuckUp_GunStore_a","E_X_T_A_S_Y_Cash_1k_t","E_X_T_A_S_Y_Cash_a","E_X_T_A_S_Y_LicenseDrive","Heal","Intro",
	"E_X_T_A_S_Y_Menu_LOOOOOOOOOL","FOXBYPASS","Dayz_GUI_R","dayz_originalPlayer","zeus_star","_infiSTAR","ppe","ppe2","willschabppe33","Cash",
	"j___m___e____i_masterbate_to_bum_rape___hovering","j___m___e____i_masterbate_to_bum_rape___BelieveIcanFly","JJJJ_MMMM___EEEEEEE_INIT_MENU","JJJJ_MMMM___EEEEEEE_fly",
	"JJJJ_MMMM___EEEEEEE_NoRecoil","JJJJ_MMMM___EEEEEEE_CLIP","JJJJ_MMMM___EEEEEEE_Invisable","JJJJ_MMMM___EEEEEEE_GiantCock","JJJJ_MMMM___EEEEEEE_JetBus","JJJJ_MMMM___EEEEEEE_BoxQuad",
	"JJJJ_MMMM___EEEEEEE_SpawnCrate","JJJJ_MMMM___EEEEEEE_JJJJ_MMMM___EEEEEEE_to_Swastika","JJJJ_MMMM___EEEEEEE_Cash_1mill","JJJJ_MMMM___EEEEEEE_Cash_5mill",
	"JJJJ_MMMM___EEEEEEE_Cash_1mill_t","JJJJ_MMMM___EEEEEEE_Cash_5mill_t","JJJJ_MMMM___EEEEEEE_JesusMode_t","Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTARS",
	"JJJJ_MMMM___EEEEEEE_M_E_N_U_fill_All","JJJJ_MMMM___EEEEEEE_M_E_N_U_initMenu","JJJJ_MMMM___EEEEEEE_OPTIONS","JJJJ_MMMM___EEEEEEE_PLAYERLOL","No_No_No_Tonic_likes_A_Big_Fat_Sheep_Cock_Right_in_the_bum_G0d_Mode","HAAJASDOKAD_keyp",
	"HAAJASDOKAD_keybinds","HAAJASDOKAD_targetkey","HAAJASDOKAD_escorttt","HAAJASDOKAD_tepe","HAAJASDOKAD_ladida","HAAJASDOKAD_RANDOM_VARIABLE_killAnnoying","HAAJASDOKAD_annoyingLock","HAAJASDOKAD_annoyingPlayer",
	"HAAJASDOKAD_playersToGod","HAAJASDOKAD_countedPlayersGod","HAAJASDOKAD_ANUS_FINGER_BANG","HAAJASDOKAD_suicide","HAAJASDOKAD_destroyall","HAAJASDOKAD_destroyallsure","HAAJASDOKAD_healallsure","HAAJASDOKAD_teleportallsure",
	"HAAJASDOKAD_healall","HAAJASDOKAD_tepall","HAAJASDOKAD_cashall","HAAJASDOKAD_turtlespawn","HAAJASDOKAD_HAAJASDOKAD_invisibleit","HAAJASDOKAD_kick","HAAJASDOKAD_invisible","HAAJASDOKAD_hakenkreuz","HAAJASDOKAD_e5p",
	"HAAJASDOKAD_mape5p","HAAJASDOKAD_cash","HAAJASDOKAD_night","HAAJASDOKAD_alllicenses","HAAJASDOKAD_misseles","HAAJASDOKAD_jetbus","HAAJASDOKAD_fly","HAAJASDOKAD_nyan","HAAJASDOKAD_DAHUGETHINGG","HAAJASDOKAD_3Dtext","HAAJASDOKAD_boxquad",
	"HAAJASDOKAD_erdbeben","HAAJASDOKAD_altilife","HAAJASDOKAD_spawnvehs","HAAJASDOKAD_troll","HAAJASDOKAD_main_menu","nuke_vars","TONIC_HAS_A_GAPER_NUKE_2","mdh_nuke_destruction_zone","mdh_nuke_camshake","mdh_nuke_ash","mdh_nuke_colorcorrection",
	"mdh_nuke_removecorrection","mdh_nuke_removeash","nukepos","jaimepaslepoisin_HLEAL","Root_Main4","Root_Pistol4","Root_Rifle4","Root_Machinegun4","Root_Sniper4","Root_Launcher4","Root_Attachement4","fuckfest"
];

_checkThread = {
	{
		_key = _x;
		{
			_var = _x getVariable _key;
			if(!isNil "_var") exitWith {
				_x setVariable[_key,nil];
				[[profileName,getPlayerUID player,_key],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
				[[profileName,format["Variable: %1",_key]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
				sleep 0.5;
				["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
			};
		} forEach [missionNamespace, uiNamespace, profileNamespace, parsingNamespace];
	} foreach _this;
};

//Create the worker.
while {true} do {
	_thread = _badVariables spawn _checkThread;
	waitUntil {scriptDone _thread};
	sleep 120; //Goto sleep for 2 minutes.
};
