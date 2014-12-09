#include <macro.h>
/*
	File: fn_vehicleListCfg.sqf
	Description: Master configuration list / array for buy-able vehicles & prices and their shop.
	
	Vehicle Classes:

	
	
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{	
	case "med_air_1":
	{
		_return = 
		[
			["B_Heli_Light_01_F",10], //MH-9 Hummingbird
			["O_Heli_Light_02_unarmed_F",10], //PO-30 Orca
			["I_Heli_Transport_02_F",10], //CH-49 Mohawk
			["I_Heli_light_03_unarmed_F",10] // WY-55 Hellcat 
			["O_Heli_Transport_04_medevac_F",10] // Taru Medical
		];
	};

	case "med_shop":
	{
		_return = 
		[
			["C_Offroad_01_F",10], // Offroad
			["I_Truck_02_medical_F",10], // Zamak Medical
			["O_Truck_03_medical_F",10], // Tempest Medical
			["B_Truck_01_medical_F",10], // HEMTT Medical
			["C_SUV_01_F",10] // SUV
		];
	};

	case "reb_v_1":
	{
		_return =
		[
			["B_Quadbike_01_F",8000], // Quadbike
			["C_Offroad_01_F",25000] // Offroad
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",750000]]; //Offroad (Armed)
			_return set[count _return,
			["O_MRAP_02_F",1000000]]; // Ifrit
			_return set[count _return,
			["B_MRAP_01_F",2000000]]; // Hunter
			_return set[count _return,
			["B_MRAP_01_hmg_F",3500000]]; // Hunter HMG
			_return set[count _return,
			["I_MRAP_03_F",2500000]]; // Strider
			_return set[count _return,
			["B_Heli_Light_01_F",625000]]; // MH-9 Hummingbird
			_return set[count _return,
			["I_Heli_Transport_02_F",2000000]]; //CH-49 Mohawk
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",1750000]]; // PO-30 Orca (Black)
			_return set[count _return,
			["O_Heli_Transport_04_box_F",2250000]]; // Mi-290 Taru (Cargo)
			_return set[count _return,
			["O_Heli_Transport_04_covered_F",3250000] // Taru Transport
		};
	};
	
	case "civ_car_1":
	{
		_return = 
		[
			["B_Quadbike_01_F",8000], // Quadbike
			["C_Van_01_fuel_F",40000], // Fuel Truck
			["C_Hatchback_01_F",12000], //Hatchback
			["C_Offroad_01_F",25000], // Offroad
			["C_SUV_01_F",30000], // SUV
			["C_Van_01_transport_F",50000], // Truck
			["C_Hatchback_01_sport_F",13000] // Hatchback (Sport)
		];
	}; 

	case "civ_truck_1":
	{
		_return =
		[
			["C_Van_01_transport_F",50000], // Truck
			["C_Van_01_box_F",60000], // Truck Boxer
			["O_Truck_03_fuel_F",100000], // Tempest Fuel
			["O_Truck_02_transport_F",175000], // Transport
			["O_Truck_03_transport_F",185000], // Tempest Transport
			["O_Truck_03_device_F",1000000], // Tempest Device
			["B_Truck_01_mover_F",300000], // HEMTT
			["B_Truck_01_covered_F",605000], // HEMTT Transport (Covered)
			["B_Truck_01_transport_F",600000], // HEMTT Transport
			["B_Truck_01_box_F",1000000] // HEMTT Box
		];	 
	};

	case "civ_air_1":
	{
		_return =
		[
			["B_Heli_Light_01_F",1255000], // MH-9 Hummingbird
			["O_Heli_Light_02_unarmed_F",1250000] // PO-30 Orca (Black)
			["C_Heli_Light_01_civil_F",1300000] // M900
			["B_Heli_Transport_03_F",1550000] // Huron
			["O_Heli_Transport_04_F",1750000] // Taru
			["O_Heli_Transport_04_covered_F",1850000] // Taru Transport
		];
	};
	
	case "civ_ship_1":
	{
		_return =
		[
			["B_Lifeboat",2000],
			["C_Rubberboat",5000],
			["O_SDV_01_F",70000],
			["C_Boat_Civil_01_F",60000]
		];
	};
	
	
	case "cop_car_1":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_SUV_01_F",15000]]; // SUV
			_return set[count _return,
			["C_Offroad_01_F",5000]]; // Offroad
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_Hatchback_01_F",25000]]; // Hatchback
		};
		if (__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",35000]]; // Hatchback Sport
		};
		if (__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["B_MRAP_01_F",250000]]; // Hunter
		}; 
		if (__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["I_MRAP_03_F",250000]]; // Strider
		};
		
		if (__GETC__(life_coplevel) > 6) then
			_return set[count _return,
			["B_G_Offroad_01_armed_F",250000]]; // Offroad Armed
			_return set[count _return,
			["O_MRAP_02_F",300000]]; // Ifrit
			_return set[count _return,
			["B_MRAP_01_hmg_F"500000]]; // Hunter HMG
		};
	
	};
	
	case "cop_air_1":
	{
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",30000]]; // MH-9 Hummingbird
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",50000]]; // WY-55 Hellcat 
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["I_Heli_Transport_02_F",65000]]; //CH-49 Mohawk
			_return set[count _return,
			["B_Heli_Transport_01_F",200000]]; // UH-80 Ghost Hawk
			_return set[count _return,
			["B_Heli_Transport_03_F",225000]]; // Huron
			_return set[count _return,
			["B_Heli_Transport_03_unarmed_F",225000]]; // Huron
			
		};
	};
	

	case "cop_ship_1":
	{
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_Boat_Transport_01_F",15000]];
			_return set[count _return,
			["C_Boat_Civil_01_police_F",50000]];
			_return set[count _return,
			["B_Boat_Armed_01_minigun_F",300000]];
			_return set[count _return,
			["B_SDV_01_F",300000]];
		};
	};
	
	case "donator_car":
	{
		if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,
			["B_Quadbike_01_F",500]]; // Quadbike
			_return set[count _return,
			["C_Offroad_01_F",2500]]; // Offroad
			_return set[count _return,
			["C_Hatchback_01_sport_F",10000]]; // Hatchback Sport
			_return set[count _return,
			["C_SUV_01_F",20000]]; // SUV
			_return set[count _return,
			["C_Van_01_fuel_F",7500]]; // Fuel Truck
			_return set[count _return,
			["B_Heli_Light_01_F",100000]]; // MH-9 Hummingbird
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",175000]]; // PO-30 Orca (Black)
			_return set[count _return,
			["I_Heli_Transport_02_F",650000]]; //CH-49 Mohawk
		};
	};
	
	case "soldner_1":
	{
		if(__GETC__(life_donator) > 3) then
		{
			_return set[count _return,
			["I_MRAP_03_F",2000000]]; // Strider
			_return set[count _return,
			["O_MRAP_02_F",1800000]]; // Ifrit
			_return set[count _return,
			["I_Heli_Transport_02_F",650000]]; //CH-49 Mohawk
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",175000]]; // PO-30 Orca (Black)
			_return set[count _return,
			["B_Heli_Light_01_F",100000]]; // MH-9 Hummingbird
			_return set[count _return,
			["B_Truck_01_box_F",2500000]]; // HEMTT Box
			_return set[count _return,
			["B_MRAP_01_F",2000000]]; // Hunter
			_return set[count _return,
			["C_Hatchback_01_sport_F",1250000]]; // Hatchback Sport
		};
	}; 
	
	case "kart_shop":
	{
		_return = 
		[
			["C_Kart_01_Blu_F",10000],
			["C_Kart_01_Fuel_F",10000],
			["C_Kart_01_Red_F",10000],
			["C_Kart_01_Vrana_F",10000]
		];
	};
};
_return;