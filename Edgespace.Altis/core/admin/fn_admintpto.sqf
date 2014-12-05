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
if(_target == player) exitWith {hint "You can not teleport to yourself";};

player setPos (getPos _target);
hint format["You have teleported to %1(s) location",_target getVariable["realname",name _target]];
