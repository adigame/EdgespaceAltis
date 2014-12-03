#include <macro.h>
/*
	Author: TheTotenkopf
	
	Description: L�scht alles f�r den Respawn und setzt alles neu
*/

// Setzt den Medic nach Respawn zur�ck
removeUniform player;
removeHeadgear player;
removeBackpack player;
removeAllItems player;
removeVest player;
removeAllWeapons player;
removeAllAssignedItems player;
{player removeMagazine _x;} foreach (magazines player);
RemoveGoggles player;

//Medic Gear + Setup
if((__GETC__(life_medicLevel)) == 1) exitWith {
	player forceAddUniform "U_O_OfficerUniform_ocamo";
	player addBackpackGlobal "B_Kitbag_sgg";
	[] call life_fnc_medicLoadout;
};

//ADAC Gear + Setup
if((__GETC__(life_medicLevel)) == 2) exitWith {
	player forceAddUniform "U_B_HeliPilotCoveralls";
	player addHeadgear "H_Cap_marshal";
	player addBackpackGlobal "B_Kitbag_cbr";
	[] call life_fnc_medicLoadout;
};