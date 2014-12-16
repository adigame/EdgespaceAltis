/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,-1,[0]] call BIS_fnc_param;

diag_log format["Remove license - %1", _state];

switch (_state) do
{
	//Jail licenses
	case 1:
	{
		license_civ_gun = false;
		license_civ_rebel = false;
		license_civ_corporation = false;
	};

	// Drivers License
	case 10:
	{
		license_civ_driver = false;
		hint localize "STR_Civ_RevokeLicense_Driver";
	};
	// Truck License
	case 11:
	{
		license_civ_truck = false;
		hint localize "STR_Civ_RevokeLicense_Truck";
	};
	// Pilot License
	case 12:
	{
		license_civ_air = false;
		hint localize "STR_Civ_RevokeLicense_Pilot";
	};
	// Boating License
	case 13:
	{
		license_civ_boat = false;
		hint localize "STR_Civ_RevokeLicense_Boating";
	};
	// Diving License
	case 14:
	{
		license_civ_dive = false;
		hint localize "STR_Civ_RevokeLicense_Diving";
	};
	// Taxi License
	case 15:
	{
		license_civ_driver = false;
		license_civ_truck = false;
		license_civ_air = false;
		license_civ_boat = false;
		license_civ_air = false;
		license_civ_dive = false;
		hint localize "STR_Civ_RevokeLicense_AllMotor";
	};
	// Firearms License
	case 16:
	{
		license_civ_gun = false;
		hint localize "STR_Civ_RevokeLicense_Firearm";
	};
	//Remove Corp licenses when becoming Rebel
	case 20:
	{
		if(license_civ_corporation) then //OR license_civ_packaging OR license_civ_export) then {
		{
			license_civ_corporation = false;
			license_civ_gold = false;
		    license_civ_platinum = false;
			license_civ_uranium = false;
			if (_state == 6) then
			{
				hint "Your Corporate licenses have been revoked for joining the rebels.";
			}
			else
			{
				hint "You have relinquished all your Corporate licenses.";
			};
		};
	};
	//Remove Rebel Licenses when joining corp
	case 21:
	{
		if(license_civ_rebel OR license_civ_heroin OR license_civ_marijuana OR license_civ_coke) then 
		{
			license_civ_rebel = false;
			license_civ_meth = false;
			if (_state == 4) then
			{
				license_civ_heroin = false;
				license_civ_marijuana = false;
				license_civ_coke = false;
				hint "You forfeit your rebel licenses by joining the Corporation.";
			}
			else
			{
				hint "You have relinquished all your Rebel licenses.";
			};
		};
	};

};