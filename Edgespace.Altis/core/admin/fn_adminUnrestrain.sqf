#include <macro.h>
/*
	File: fn_adminSpectate.sqf
	Author: ColinM9991
	
	Description:
	Spectate the chosen player.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint "!!Access Denied!!";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.05;
  };
};

hint format["You Have Unrestrained %1 \n\n",_unit getVariable["realname",name _unit]];

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["ziptied",FALSE,TRUE]; 
_unit setVariable["Escorting",FALSE,TRUE]; 
_unit setVariable["transporting",FALSE,TRUE];


