#include <macro.h>
/*
	File: fn_vehicleListCfg.sqf
	Description: Master configuration list / array for buy-able vehicles & prices and their shop.
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
			["B_Heli_Light_01_F",10],
			["O_Heli_Light_02_unarmed_F",10],
			["I_Heli_Transport_02_F",10],
			["I_Heli_light_03_unarmed_F",10]
		];
	};

	case "med_shop":
	{
		_return = 
		[
			["C_Offroad_01_F",10],
			["C_Offroad_01_repair_F",10],
			["C_Van_01_box_F",10],
			["B_Truck_01_transport_F",10],
			["I_Truck_02_medical_F",10],
			["O_Truck_03_medical_F",10],
			["B_Truck_01_medical_F",10],
			["C_SUV_01_F",10]
		];
	};

	case "civ_car_1":
	{
		_return = 
		[
			["B_Quadbike_01_F",8000],
			["C_Van_01_fuel_F",40000],
			["C_Hatchback_01_F",12000],
			["C_Offroad_01_F",25000],
			["C_SUV_01_F",30000],
			["C_Van_01_transport_F",50000],
			["C_Hatchback_01_sport_F",13000]
		];
	}; 

	case "civ_servt_1":
	{
		_return =
		[
			["C_Offroad_01_F",25000] //Service Truck
		];
	};
	
	case "civ_truck_1":
	{
		_return =
		[
			["C_Van_01_transport_F",50000], // Std
			["C_Van_01_box_F",60000], // Boxer
			["O_Truck_03_fuel_F",100000], // Tempest Fuel
			["O_Truck_02_transport_F",175000], // Transport
			["O_Truck_03_transport_F",185000], // Tempest Transport
			["B_Truck_01_covered_F",605000],
			["B_Truck_01_transport_F",600000],
			["B_Truck_01_box_F",1000000]
		];	
	};

	case "reb_v_1":
	{
		_return =
		[
			["B_Quadbike_01_F",8000],
			["C_Offroad_01_F",25000]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,["B_G_Offroad_01_armed_F",875000]];
			_return set[count _return,["O_MRAP_02_F",2000000]];
			_return set[count _return,["B_MRAP_01_F",3000000]];
		};
	};

	
	case "reb_air":
	{
		_return set[count _return,["B_Heli_Light_01_F",625000]];
		_return set[count _return,["O_Heli_Light_02_unarmed_F",1750000]];
		_return set[count _return,["C_Heli_Light_01_civil_F",625000]];
		_return set[count _return,["O_Heli_Transport_04_F",1550000]];
		_return set[count _return,["O_Heli_Transport_04_box_F",2250000]];
		_return set[count _return,["B_Heli_Transport_03_unarmed_F",2250000]];
	};
	
	case "corp_air":
	{
		_return set[count _return,["B_Heli_Light_01_F",625000]];
		_return set[count _return,["O_Heli_Light_02_unarmed_F",1750000]];
		_return set[count _return,["C_Heli_Light_01_civil_F",625000]];
		_return set[count _return,["O_Heli_Transport_04_F",1550000]];
		_return set[count _return,["O_Heli_Transport_04_box_F",2250000]];
		_return set[count _return,["B_Heli_Transport_03_unarmed_F",2250000]];
	};
	
	
	
	case "cop_car_1":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
				_return set[count _return,
				["C_SUV_01_F",15000]];
				_return set[count _return,
				["C_Offroad_01_F",5000]];
		};
	if(__GETC__(life_coplevel) > 2) then
		{
				_return set[count _return,
				["C_Hatchback_01_F",25000]];
		};
	if (__GETC__(life_coplevel) > 3) then
		{
				_return set[count _return,
				["C_Hatchback_01_sport_F",35000]];
		};
	if (__GETC__(life_coplevel) > 4) then
		{
				_return set[count _return,
				["B_MRAP_01_F",250000]];
		};
	if (__GETC__(life_coplevel) > 5) then
		{
				_return set[count _return,
				["I_MRAP_03_F",250000]];
		};
	};
	
	case "civ_air_1":
	{
		_return =
		[
			["B_Heli_Light_01_F",1255000],
			["C_Heli_Light_01_civil_F",625000],
			["O_Heli_Light_02_unarmed_F",1750000],
			["O_Heli_Transport_04_box_F",2250000], // Cargo
			["O_Heli_Transport_04_F",750000], // No Cargo
			["B_Heli_Transport_03_F",2250000],
			["B_Heli_Transport_03_unarmed_F",2250000]
		];
	};
	
	case "cop_air_1":
	{
		if(__GETC__(life_coplevel) > 2) then
			{
				_return set[count _return,
				["B_Heli_Light_01_F",30000]];
			};
		if(__GETC__(life_coplevel) > 3) then
			{
				_return set[count _return,
				["I_Heli_light_03_unarmed_F",50000]];
			};
		if(__GETC__(life_coplevel) > 4) then
			{
				_return set[count _return,
				["I_Heli_Transport_02_F",65000]];
				_return set[count _return,
				["B_Heli_Transport_01_F",200000]];
				_return set[count _return,
				["B_Heli_Transport_03_F",225000]];
			};
	};
	
	case "civ_ship_1":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["O_SDV_01_F",70000],
			["C_Boat_Civil_01_F",60000]
		];
	};
	
	case "cop_ship_1":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_SDV_01_F",100000]
		];
	};
	
	case "donator_car":
	{
		if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,
			["B_Quadbike_01_F",500]];
			_return set[count _return,
			["C_Offroad_01_F",2500]];
			_return set[count _return,
			["C_Hatchback_01_sport_F",10000]];
			_return set[count _return,
			["C_SUV_01_F",20000]];
			_return set[count _return,
			["C_Van_01_fuel_F",7500]];
			_return set[count _return,
			["B_Heli_Light_01_F",100000]];
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",175000]];
			_return set[count _return,
			["I_Heli_Transport_02_F",650000]];
		};
	};
	
	case "corp_1":
	{
		_return =
		[
		["B_Quadbike_01_F",8000],
		["C_Van_01_fuel_F",40000],
		["C_Hatchback_01_F",12000],
		["C_Offroad_01_F",25000],
		["C_SUV_01_F",30000],
		["C_Van_01_transport_F",50000],
		["C_Hatchback_01_sport_F",13000],
		["C_Van_01_transport_F",50000], // Std
		["C_Van_01_box_F",60000], // Boxer
		["O_Truck_03_fuel_F",100000], // Tempest Fuel
		["O_Truck_03_device_F",200000], // Tempest Fuel
		["O_Truck_02_transport_F",175000], // Transport
		["O_Truck_03_transport_F",185000], // Tempest Transport
		["B_Truck_01_covered_F",605000],
		["B_Truck_01_transport_F",600000],
		["B_Truck_01_box_F",1000000]
		];
		if(license_civ_corporation) then
		{
			_return set[count _return,["B_G_Offroad_01_armed_F",875000]];
			_return set[count _return,["O_MRAP_02_F",2000000]];
			_return set[count _return,["B_MRAP_01_F",3000000]];
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
	
	case "admin":
	{
		_return = 
		[
			["C_Kart_01_Blu_F",1],
			["C_Kart_01_Fuel_F",1],
			["C_Kart_01_Red_F",1],
			["C_Kart_01_Vrana_F",1]
		];
	};
	
};
_return;