/*
	File: fn_gather.sqf
	Description: Main functionality for gathering.
*/
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = [
"apple_gather_01",
"apple_gather_02",
"apple_gather_03",
"apple_gather_04",
"peaches_gather_01",
"peaches_gather_02",
"peaches_gather_03",
"peaches_gather_04", // needs to be added to map
"heroin_gather_01",
"cocaine_gather_01",
"cocaine_gather_02",
"weed_gather_01", // needs to be added to map
"weed_gather_02",
"grape_gather_01",
"grape_gather_02",
"rye_gather_01",
"yeast_gather_01",
"hops_gather_01",
"meth_gather_01"
];

_zone = "";

if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	hint "You are not near a gathering zone";
	life_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_gather_01","apple_gather_02","apple_gather_03","apple_gather_04"]): {_gather = "apple"; _val = 3; hint "You are gathering apples";};
	case (_zone in ["peaches_gather_01","peaches_gather_02","peaches_gather_03","peaches_gather_04"]): {_gather = "peach"; _val = 3; hint "You are gathering peaches";};
	case (_zone in ["heroin_gather_01"]): {_gather = "heroinu"; _val = 1 + (round random 3); hint "You are gathering heroin";};
	case (_zone in ["cocaine_gather_01","cocaine_gather_02"]): {_gather = "cocaine"; _val = 1; hint "You are gathering cocoa leaf";};
	case (_zone in ["weed_gather_01"]): {_gather = "cannabis"; _val = 1 + (round random 3); hint "You are gathering weed";};
	case (_zone in ["weed_gather_02"]): {_gather = "cannabis"; _val = 1 + (round random 3); hint "You are gathering weed";};
	case (_zone in ["meth_gather_01"]): {_gather = "methu"; _val = 1 + (round random 2); hint "You are gathering meth";};
	case (_zone in ["grape_gather_01"]): {_gather = "grapes"; _val = 3 + (round random 3); hint "You are gathering grapes";};
	case (_zone in ["rye_gather_01"]): {_gather = "rye"; _val = 1 + (round random 3); hint "You are gathering rye";};
	case (_zone in ["yeast_gather_01"]): {_gather = "yeast"; _val = 1 + (round random 3); hint "You are gathering yeast";};
	case (_zone in ["hops_gather_01"]): {_gather = "hops"; _val = 1 + (round random 3); hint "You are gathering hops";};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Inventory is Full"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
