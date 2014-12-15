/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/

if (!(player getVariable "missingOrgan")) exitwith {hint "You do not need a Kidney Transplant."};

if(Amarok_Cash < 100000) exitWith {hint format[localize "STR_NOTF_HS_NoCash",100000];};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
sleep 8;
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
//player setdamage 0;
[[player, 0], "TON_fnc_Amarok_SetDamage",false,false] spawn life_fnc_MP;

// Organ Stuff
player setVariable["missingOrgan",false,true];
life_thirst = 100;
life_hunger = 100;
player enableFatigue false;

Amarok_Cash = Amarok_Cash - 100000;
