/*
	File: fn_rebelunrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Error check?

_unit setVariable["ziptied",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;
[[0,format["%1 was unrestrained by %2",_unit getVariable["realname",name _unit], player getVariable["realname",name player]]],"life_fnc_broadcast",west,FALSE] call life_fnc_MP;