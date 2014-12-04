waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Description: Puts a small bar in the bottom right of screen to display in-game information
*/
// Start only after Spawn
waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)};

_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
systemChat format["Loading game server info...", _rscLayer];

[] spawn {
	sleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | Cops: %2 | Civs: %3 | Medics: %4 | CASH: %5 | BANK: %6 | PLAYERS: %7 | GRIDREF: %8", round diag_fps, west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits,[life_cash] call life_fnc_numberText,[life_atmcash] call life_fnc_numberText, count playableUnits, mapGridPosition player,_counter];
	}; 
};
