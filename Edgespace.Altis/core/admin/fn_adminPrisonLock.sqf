#include <macro.h>
/*
	File: adminPrisonLock.sqf
	Author: Kekie
	Credits: To original script author(s)
	Description: Based on tonic's federal bank system 3.1.4
	Lock down the new prison.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint "!!Access Denied!!";};


private["_cellblock1","_cellblock2","_cellblock3"];
		
_cellblock1 = nearestObject [[23452.8,19054.6,0.00143909],"Land_I_Barracks_V2_F"];
_cellblock2 = nearestObject [[23479.5,19078.7,0.00143909],"Land_I_Barracks_V2_F"];
_cellblock3 = nearestObject [[23504.2,19052.5,0.00143933],"Land_I_Barracks_V2_F"];

for "_i" from 1 to 22 do {_cellblock1 setVariable[format["bis_disabled_Door_%1",_i],1,true]; _cellblock1 animate [format["Door_%1_rot",_i],0];};
for "_i" from 1 to 22 do {_cellblock2 setVariable[format["bis_disabled_Door_%1",_i],1,true]; _cellblock2 animate [format["Door_%1_rot",_i],0];};
for "_i" from 1 to 22 do {_cellblock3 setVariable[format["bis_disabled_Door_%1",_i],1,true]; _cellblock3 animate [format["Door_%1_rot",_i],0];};

_cellblock1 allowDamage false;
_cellblock2 allowDamage false;
_cellblock3 allowDamage false;

systemChat "Prion Lockdown Initiated.";
