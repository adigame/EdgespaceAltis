#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","SAPS Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","SAPS Pyrgos","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","SAPS HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_gsg9","SAPS Alpha","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_kilo","SAPS Beta","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_zulu","SAPS Echo","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_bane","SAPS Delta","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_10","SAPS Training","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
			
		];
	};
	
	case civilian:
	{
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_training","Shooting Range","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		// Only Allow Rebel to Spawn at the Rebel HQ
		if(license_civ_rebel && playerSide == civilian) then 
		{
		_return = _return + [
			["reb_spawn_hq","Rebel HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["rebel_spawn_1","Rebel Outpost 1","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(license_civ_corporation && playerSide == civilian) then 
		{
		_return = _return + [
			["corp_spawn_hq","Corporate HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["corp_spawn_1","Corporate Outpost 1","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};

		if(__GETC__(life_donator) == 3) then 
		{
			_return = _return + [
				["so_spawn_1","Mercenary HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["don_spawn_1","Donator HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(__GETC__(life_donator) == 1) then
		{
			_return = _return + [
				["don_spawn_1","Donator HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(__GETC__(life_donator) == 2) then
		{
			_return = _return + [
				["don_spawn_1","Donator HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return set[count _return,[format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"]];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Airfield Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["adac_spawn_1","EMS West","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["adac_spawn_2","EMS EAST","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
		];
	};
};

_return;