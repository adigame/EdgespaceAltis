#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

//Introcam
[] spawn life_fnc_IntroCam;

//UniformGlobal
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_B_HeliPilotCoveralls"};
        player setObjectTextureGlobal [0,"skins\human\medic\adac_uniform.jpg"];
        waitUntil {uniform player != "U_B_HeliPilotCoveralls"};
    };
};
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_O_OfficerUniform_ocamo"};
        player setObjectTextureGlobal [0,"skins\human\medic\medic_uniform.jpg"];
        waitUntil {uniform player != "U_O_OfficerUniform_ocamo"};
    };
};

//Backpack Skins
[] spawn
{
while {true} do
    {
        waitUntil {backpack player == "B_Kitbag_cbr"};
        (unitBackpack player) setObjectTextureGlobal [0,"skins\human\medic\adac_backpack.jpg"];
        waitUntil {backpack player != "B_Kitbag_cbr"};
    };
};
[] spawn
{
while {true} do
    {
        waitUntil {backpack player == "B_Kitbag_sgg"};
        (unitBackpack player) setObjectTextureGlobal [0,"skins\human\medic\medic_backpack.jpg"];
        waitUntil {backpack player != "B_Kitbag_sgg"};
    };
};

//Medic Gear + Setup
if((__GETC__(life_medicLevel)) == 1) exitWith {
	removeUniform player;
	removeHeadgear player;
	RemoveAllWeapons player;
	RemoveVest player;
	RemoveGoggles player;
	RemoveAllItems player;
	player forceAddUniform "U_O_OfficerUniform_ocamo";
	player addBackpackGlobal "B_Kitbag_sgg";
	[] call life_fnc_medicLoadout;
};

//ADAC Gear + Setup
if((__GETC__(life_medicLevel)) == 2) exitWith {
	removeUniform player;
	removeHeadgear player;
	RemoveAllWeapons player;
	RemoveVest player;
	RemoveGoggles player;
	player forceAddUniform "U_B_HeliPilotCoveralls";
	player addHeadgear "H_Cap_marshal";
	player addBackpackGlobal "B_Kitbag_cbr";
	[] call life_fnc_medicLoadout;
	_igiload = execVM "IgiLoad\IgiLoadInit.sqf";
};