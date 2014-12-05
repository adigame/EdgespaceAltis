#include <macro.h>
/*
	File: fn_adminMenu.sqf
	Description: Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

ctrlEnable [2904,false];    // close
ctrlEnable [2905,false];	// get id
ctrlEnable [2906,false];	// spectate
ctrlEnable [2907,false];	// tp
ctrlEnable [2908,false];	// tphere
ctrlEnable [2909,false];	// unrestrain
ctrlEnable [2910,false];	// atm
ctrlEnable [2911,false];	// invisible
ctrlEnable [2912,false];	// comp
ctrlEnable [2913,false];	// freeze
ctrlEnable [2914,false];    // debug
ctrlEnable [2915,false];	// godmode
ctrlEnable [2916,false];	// to to target
ctrlEnable [2917,false];	// prison lock
ctrlEnable [2918,false];    // prison unlock
ctrlEnable [2919,false];	// revive
ctrlEnable [2920,false];	// esp

switch(__GETC__(life_adminlevel)) do
{
	case 1: {
		ctrlEnable [2904,true];
		ctrlEnable [2905,true];
		//ctrlEnable [2906,true];
		//ctrlEnable [2907,true];
		//ctrlEnable [2908,true];
		//ctrlEnable [2909,true];
		//ctrlEnable [2910,true];
		//ctrlEnable [2913,true];
		//ctrlEnable [2915,true];
		//ctrlEnable [2917,true];
	};
	case 2: {
		ctrlEnable [2904,true];
		ctrlEnable [2905,true];
		//ctrlEnable [2906,true];
		//ctrlEnable [2907,true];
		//ctrlEnable [2908,true];
		ctrlEnable [2909,true];
		ctrlEnable [2910,true];
		//ctrlEnable [2912,true];
		//ctrlEnable [2913,true];
		//ctrlEnable [2914,true];
		//ctrlEnable [2915,true];
		//ctrlEnable [2916,true];
		//ctrlEnable [2917,true];
		//ctrlEnable [2918,true];
		//ctrlEnable [2920,true];
	};
	case 3: {
		ctrlEnable [2904,true];
		ctrlEnable [2905,true];
		ctrlEnable [2906,true];
		ctrlEnable [2907,true];
		ctrlEnable [2908,true];
		ctrlEnable [2909,true];
		ctrlEnable [2910,true];
		ctrlEnable [2911,true];
		ctrlEnable [2912,true];
		ctrlEnable [2913,true];
		ctrlEnable [2914,true];
		ctrlEnable [2915,true];
		ctrlEnable [2916,true];
		ctrlEnable [2917,true];
		ctrlEnable [2918,true];
		ctrlEnable [2919,true];
		ctrlEnable [2920,true];
	};
};

//Purge List
lbClear _list;

{
	_side = switch(side _x) do {
	case west: {"Cop"}; 
	case civilian : {"Civ"}; 
	case independent : {"EMT"};
	default {"Unknown"};
	};

	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
	
} foreach playableUnits;

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};




