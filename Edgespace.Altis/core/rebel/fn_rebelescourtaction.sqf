/*
	File: fn_escortAction.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

    if(player distance (getMarkerPos "Safe_Kav") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};
    if(player distance (getMarkerPos "Save_Reb") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};
    if(player distance (getMarkerPos "Save_Jail") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};

if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
if(!(_unit getVariable "ziptied")) exitWith {}; //He's not Zipted.
_unit attachTo [player,[0.1,1.1,0]];
_unit setVariable["transporting",false,true];
_unit setVariable["Escorting",true,true];
player reveal _unit;