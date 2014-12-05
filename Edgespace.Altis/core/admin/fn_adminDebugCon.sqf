#include <macro.h>
/*
	File: fn_adminDebugCon.sqf
	Author: ColinM9991
	
	Description:
	Opens the Debug Console.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint "!!Access Denied!!";};

createDialog "RscDisplayDebugPublic";