/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
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

	case "187V": {_type = ["Vehicular Manslaughter (VDM)",120000]};
	case "187": {_type = ["Murder",60000]};
	case "901": {_type = ["Escaping Jail",100000]};
	case "261": {_type = ["Rape",5000]}; //What type of sick bastard would add this?
	case "261A": {_type = ["Attempted Rape",3000]};
	case "215": {_type = ["Attempted Vehicle Theft",10000]};
	case "213": {_type = ["Use of illegal explosives",10000]};
	case "211": {_type = ["Robbery",60000]};
	case "207": {_type = ["Kidnapping",100000]};
	case "207A": {_type = ["Attempted Kidnapping",50000]};
	case "207B": {_type = ["Torture",50000]};
	case "487": {_type = ["Vehicle Theft",20000]};
	case "488": {_type = ["Petty Theft",15000]};
	case "480": {_type = ["Hit and run",1300]};
	case "481": {_type = ["Drug Possession",1000]};
	case "482": {_type = ["Intent to distribute",5000]};
	case "483": {_type = ["Drug Trafficking",9500]};
	case "459": {_type = ["Breaking and Entering",50000]};
	case "390": {_type = ["Being under the influence of alcohol in public",15000]};
	case "919": {_type = ["Organ Theft",50000]};
	case "1": {_type = ["Driving without a driver's license",15000]};
    case "2": {_type = ["Attempted vehicle theft",10000]};
    case "3": {_type = ["Theft of vehicle",20000]};
    case "4": {_type = ["Driving without lights",1500]};
    case "5": {_type = ["Speeding",6000]};
    case "6": {_type = ["Reckless driving",7500]};
    case "7": {_type = ["Attempted theft of a police vehicle",15000]};
    case "8": {_type = ["Theft of a police vehicle",25000]};
    case "9": {_type = ["Landing without permission",20000]};
    case "10": {_type = ["Driving an illegal vehicle", 100000]};
    case "11": {_type = ["Hit and Run",150000]};
    case "12": {_type = ["Fleeing from the police",17500]};
    case "13": {_type = ["VDM",150000]};
    case "14": {_type = ["Illegal roadblocks",50000]};
    case "15": {_type = ["Attempting to steal a vehicle",45000]};
    case "16": {_type = ["Following the police",5000]};
    case "17": {_type = ["Trolling another player",15000]};
    case "18": {_type = ["Harassment of a police officer",30000]};
    case "19": {_type = ["Entering a restricted area",50000]};
    case "20": {_type = ["Killing a police officer",100000]};
    case "21": {_type = ["Firing at a police officer",50000]};
    case "22": {_type = ["Destruction of police property",15000]};
    case "23": {_type = ["Being under the influence of drugs",10000]};
    case "24": {_type = ["Possession of a firearm without a license",70000]};
    case "25": {_type = ["Carrying a weapon within city limits",50000]};
    case "26": {_type = ["Possession of an illegal weapon",150000]};
    case "27": {_type = ["Firing a weapon within city limits",50000]};
    case "28": {_type = ["Hostage Taking",60000]};
    case "29": {_type = ["Robbing another player",60000]};
    case "30": {_type = ["Bank Robbery",120000]};
    case "31": {_type = ["Murder",60000]};
    case "32": {_type = ["Civil disobedience",75000]};
    case "33": {_type = ["Leading a rebellion",75000]};
    case "34": {_type = ["Attacking an outpost or checkpoint",120000]};
    case "35": {_type = ["Landing in a no-fly zone",75000]};
    case "36": {_type = ["Flying below 300m in city limits",20000]};
    case "37": {_type = ["Escaping from prison",100000]};
    case "38": {_type = ["Flying without a license",50000]};
    case "39": {_type = ["Excessive use of vehicle horn",7500]};
    case "40": {_type = ["Trading illegal items",50000]};
	case "41": {_type = ["Avoiding a road block",25000]};
	case "42": {_type = ["Initiating Load Shedding",25000]};
	case "120S": {_type = ["Not Paying a Speeding Ticket",5000]};
	case "120H": {_type = ["Multiple Speeding Violations",8000]};
	case "120WL": {_type = ["Driving without a License",8000]};
	case "120FS": {_type = ["Reckless Driving and Dangerous Driving",8000]};

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