#include <macro.h>
/*
	File: fn_ziptieAction.sqf
	Description: Zip Tie the target.
*/

	private["_unit"];
	_unit = cursorTarget;
	if(isNull _unit) exitWith {}; //Not valid
	if((_unit getVariable "ziptied")) exitWith {};
	if(life_inv_zipties < 1) exitWith {hint "You have no cable ties."};
	if(player == _unit) exitWith {};
	if(!isPlayer _unit) exitWith {};

	// Remove a ziptie from the player inventory
	life_inv_zipties = life_inv_zipties - 1;

	// Play a sound that the player is zip tied
	[player,"ziptie"] call life_fnc_globalSound;
	
	// Set the player as zip tied
	_unit setVariable["ziptied",true,true];
	[[player], "life_fnc_rebelziptie", _unit, false] spawn life_fnc_MP;

	// Announce to server
	[[0,format["%1 was cable tied by %2",_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

	// Update the wanted system
	[[getPlayerUID player,name player,"485"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	//titleText["You have cable tied the citizen and are wanted for kidnapping","PLAIN"];
