#include <macro.h>
/*
	File: fn_adminMarkers.sqf
*/
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0;};
_unit = player;

if(life_hidden) then {
	life_hidden = false;
	hint "Invisibility disabled";
	_unit hideObject false;
	_unit setVariable["adminlevel", __GETC__(life_adminlevel), true];
	_unit setVariable["steam64id",(getPlayerUID player),true]; 
	_unit setVariable["realname",profileName,true]; 
} else {
	life_hidden = true;
	hint "Invisibility enabled";
	_unit hideObject true;
	_unit setVariable["realname",""];   
};

