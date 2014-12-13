/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";

[8,true,true,12] execFSM "core\fsm\timeModule.fsm";
execVM "arena_paintballarena.sqf";
execVM "init_paintballarena.sqf";