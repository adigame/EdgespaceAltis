/*
	File: fn_wantedAdd.sqf
	Description: Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{

case "2": {_type = ["Attempted theft of civilian vehicle", 2000]};
case "3": {_type = ["Theft of civilian vehicle", 5000]};
case "4": {_type = ["Driving without lights", 500]};
case "5": {_type = ["Multiple Speeding Violations", 20000]};
case "6": {_type = ["Dangerous driving", 5000]};
case "7": {_type = ["Attempted theft police vehicle", 7500]};
case "8": {_type = ["Theft of police vehicle", 20000]};
case "9": {_type = ["Landing in a no-fly zone", 3000]};
case "10": {_type = ["Driving illegal vehicles", 8000]};
case "11": {_type = ["Hit and run", 10000]};
case "12": {_type = ["Evading from police", 7500]};
case "13": {_type = ["Driving over another civilian", 10000]};
case "14": {_type = ["Illegal roadblocks", 5000]};
case "15": {_type = ["Resisting arrest", 1500]};
case "16": {_type = ["Trade in exotic goods", 25000]};
case "17": {_type = ["Insulting the authorities", 500]};
case "18": {_type = ["Harassment to a police officer", 1000]};
case "19": {_type = ["Entering a restricted zone", 2500]};
case "20": {_type = ["Killing a police officer", 25000]};
case "21": {_type = ["Firing on police/officials/property", 15000]};
case "22": {_type = ["Destruction of police property", 15000]};
case "23": {_type = ["Illegal Contraband(Drugs)", 15000]};
case "24": {_type = ["Possession of firearms without a license", 5000]};
case "25": {_type = ["Carrying a weapon inside city limits", 2000]};
case "26": {_type = ["Possession of a illegal weapon", 5000]};
case "27": {_type = ["Use of firearms within cities", 10000]};
case "28": {_type = ["Holding a hostage", 20000]};
case "29": {_type = ["Attack on individuals/vehicles", 10000]};
case "30": {_type = ["Bank robbery", 150000]};
case "31": {_type = ["Murder", 60000]};
case "32": {_type = ["Rebellion", 35000]};
case "33": {_type = ["Disturbing the peace", 7500]};
case "34": {_type = ["Flying without a pilots license", 1500]};
case "35": {_type = ["Flying/hovering below 200m in city limits", 3000]};
case "36": {_type = ["Prison Break", 20000]};
case "37": {_type = ["Excessive use of Car Horn", 1000]};
case "38": {_type = ["Attempting Murder", 10000]};
case "39": {_type = ["Kidnapping", 10000]};
case "40": {_type = ["Trespassing", 1000]};
case "41": {_type = ["Illegal Gambling", 5000]};
case "42": {_type = ["Trolling", 20000]};
case "43": {_type = ["Evading Justice", 10000]};
case "44": {_type = ["Attempting Suicide", 5000]};
case "45": {_type = ["Illegally crossing the border", 6000]};
case "46": {_type = ["Illegal Parking in Kavala", 1000]};
case "47": {_type = ["Harassing Civilians", 2000]};
case "48": {_type = ["Torture", 10000]};
case "49": {_type = ["Robbing a store", 5000]};
case "50": {_type = ["Robbing a person", 5000]};
case "51": {_type = ["Organ Theft", 5000]};
case "52": {_type = ["Possession of an illegal item", 5000]};
case "53": {_type = ["Multiple speeding violations and defeating the ends of justice", 50000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
};