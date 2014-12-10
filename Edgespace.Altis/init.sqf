enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

//Exec Scripts and more...
life_versionInfo = "Edgespace Altis Life RPG";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf"; //Load the Server Strings
[] execVM "script\fastrope.sqf"; //Load Fastrope
[] execVM "script\welcome.sqf"; //Load Welcome Intro
[] execVM "script\teargas.sqf"; //Load Teargas 
[] execVM "script\gasmask.sqf";  // Load Gas Mask for Cops
[] execVM "script\safezones.sqf"; //Load the Savezones
[] execVM "script\fn_statusBar.sqf"; //Load the Statusbar
[] execVM "script\dynamicweather.sqf"; // Load Dynamic Weather
[] execVM "script\nosidechat.sqf"; // Warning for Side Channel Voice
StartProgress = true;

// Fog
[] spawn {
	while{true} do {
		sleep 10;
		200 setFog 0;
		sleep 590;
	};
};

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;
    
};