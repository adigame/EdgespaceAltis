/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];
switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _val = 2;};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _val = 2;};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _val = 4;};
	case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _val = 5;};
	case (player distance (getMarkerPos "diamond_1") < 50): {
	if(!license_civ_corporation) exitWith {_mine = "wrongfaction";};
	if(license_civ_rebel) exitWith {hint "Rebels dont have the training to mine uranium";_mine = "wrongfactionrebel";};
	_mine = "diamond"; _val = 1;
	};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _val = 2;};
	
	case (player distance (getMarkerPos "gold_1") < 50): {
	if(!license_civ_corporation) exitWith {_mine = "wrongfaction";};
	if(license_civ_rebel) exitWith {hint "Rebels dont have the training to mine uranium";_mine = "wrongfactionrebel";};
	_mine = "goldu"; _val = 2;
	};
	
	case (player distance (getMarkerPos "plat_1") < 50): {
	if(!license_civ_corporation) exitWith {_mine = "wrongfaction";};
	if(license_civ_rebel) exitWith {hint "Rebels dont have the training to mine uranium";_mine = "wrongfactionrebel";};
	_mine = "platinumu"; _val = 2;
	};
	
	case (player distance (getMarkerPos "uranium_1") < 100): 
	{
	if(!license_civ_corporation) exitWith {_mine = "wrongfaction";};
	if(license_civ_rebel) exitWith {hint "Rebels dont have the training to mine uranium";_mine = "wrongfactionrebel";};
	_mine = "uranium1"; _val = 1
	};
	default {_mine = "";};
};
//Mine check
if(_mine == "wrongfaction") exitWith {hint "You need to be part of the corporate faction to mine here"};
if(_mine == "wrongfactionrebel") exitWith {hint "Rebels dont have the training to mine uranium"};
if(_mine == "") exitWith {hint "You are not near a mine!"};
if(vehicle player != player) exitWith {hint "You must exit your vehicle";};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Your inventory is full."};
life_action_inUse = true;
 
_time = 0;
_profName = [_mine] call life_fnc_profType;
if( _profName != "" ) then 
{
_data = missionNamespace getVariable (_profName);
_time = ( 3 - (0.25 * (_data select 0)));
};
 
for "_i" from 0 to 2 do
{
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
sleep _time;
};
 
 
if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
if( _profName != "" ) then 
{
[_profName,25] call life_fnc_addExp;
};
};
 
life_action_inUse = false;