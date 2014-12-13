#include <macro.h>
/*
	File: fn_sellOil.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the oil to the oil trader.
	Will be revised.
*/
private["_val"];

_val = life_inv_oilp;

if(life_inv_oilp < 10) exitWith { hint "You need atleast 10 litres of oil to sell";};
if(([false,"oilp",_val] call life_fnc_handleInv)) then
{
	titleText[format["You have sold oil for fuel cans"],"PLAIN"];
	life_inv_oilp = life_inv_oilp - 10;
	life_inv_fuelF = life_inv_fuelF + 10;
	life_carryWeight = life_carryWeight + 50;
};