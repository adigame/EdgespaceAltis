#include <macro.h>
/*
File: fn_adminGodMode.sqf
Author: Tobias 'Xetoxyc' Sittenauer
 
Description: Enables God mode for Admin
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint "!!Access Denied!!";};

closeDialog 0;
 
if(life_god) then {
	life_god = false;
	hint "God mode disabled";
	player allowDamage true;
} else {
	life_god = true;
	hint "God mode enabled";
	player allowDamage false;
};

