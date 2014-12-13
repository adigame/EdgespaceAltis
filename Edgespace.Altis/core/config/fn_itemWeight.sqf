/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {8};
	case "oilp": {4};
	case "heroinu": {6};
	case "heroinp": {3};
	case "cannabis": {4};
	case "marijuana": {2};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {8};
	case "fishing": {2};
	case "turtlesoup": {4};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {5};
	case "ironore": {6};
	case "copper_r": {2};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {5};
	case "salt_r": {3};
	case "glass": {2};
	case "diamond": {8};
	case "diamondc": {6};
	case "cocaine": {7};
	case "cocainep": {3};
	case "spikeStrip": {5};
	case "rock": {7};
	case "cement": {5};
	case "goldbar": {10};
	case "wine": {5};
	case "grapes": {3};
	case "methu": {8};
	case "methp": {4};
	case "battery": {1};
	case "blastingcharge": {30};
	case "boltcutter": {10};
	case "defusekit": {1};
	case "painkillers": {5};
	case "morphium": {6};
	case "zipties": {1};
	case "storagesmall": {10};
	case "storagebig": {20};
	case "mauer": {15};
	case "rye": {3};
	case "hops": {3};
	case "yeast": {3};
	case "cornmeal": {2};
	case "mash": {4};
	case "whiskey": {5};
	case "beerp": {4};
	case "moonshine": {2};
	case "bottledwhiskey": {5};
	case "bottledbeer": {5};
	case "bottledshine": {4};
	case "bottles": {1};
	case "puranium": {3};
    case "ipuranium": {3};
    case "uranium1": {100};
    case "uranium2": {100};
    case "uranium3": {100};
    case "uranium4": {100};
    case "uranium": {100};
	case "kidney": {20};
	case "scalpel": {5};
	case "gpstracker": {4};
	case "peach": {2};
	default {1};
};
