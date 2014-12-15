/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the robbing process?
*/
private["_target"];
_target = cursorTarget;

//Error checks
    if(player distance (getMarkerPos "Safe_Kav") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};
    if(player distance (getMarkerPos "Save_Reb") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};
    if(player distance (getMarkerPos "Save_Jail") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};

if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

if(_target getVariable["robbed",false]) exitWith {};
[[player],"life_fnc_robPerson",_target,false] spawn life_fnc_MP;
_target setVariable["robbed",TRUE,TRUE];