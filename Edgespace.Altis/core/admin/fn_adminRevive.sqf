#include <macro.h>
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint "!!Access Denied!!";};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};

[[player],"life_fnc_revived",_target,FALSE] spawn life_fnc_MP;

hint format["You have Revived %1",_target getVariable["realname",name _target]];
