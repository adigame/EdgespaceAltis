/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:Master configuration for vehicle weight.
	
	Vehicle Classes:
	
	
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{

	case "O_Heli_Transport_04_medevac_F": {25};
	case "B_Heli_Transport_03_F": {100};
	case "O_Heli_Transport_04_F": {100};
	case "O_Heli_Transport_04_box_F": {100};
	case "O_Heli_Transport_04_covered_F": {100};
	case "B_Heli_Transport_01_F": {100};
	case "B_Heli_Transport_03_unarmed_F": {100};
	case "C_Heli_Light_01_civil_F": {100};
	case "B_G_Offroad_01_armed_F": {100};
	case "I_Truck_02_medical_F": {25};
	case "I_Truck_02_medical_F": {25};
	case "O_Truck_03_medical_F": {25};
	case "B_Truck_01_medical_F": {25};
	case "O_Truck_03_fuel_F": {25};
	case "B_Truck_01_mover_F": {100};
	case "B_SDV_01_F": {100};
	case "B_Lifeboat": {100};
	case "C_Rubberboat": {100};
	case "O_SDV_01_F": {100};
	case "B_Boat_Armed_01_minigun_F": {100};
	case "C_Kart_01_Blu_F": {0};
	case "C_Kart_01_Fuel_F": {0};
	case "C_Kart_01_Red_F": {0};
	case "C_Kart_01_Vrana_F": {0};
	case "C_Offroad_01_F": {100};
	case "B_G_Offroad_01_F": {100};
	case "B_Quadbike_01_F": {35};
	case "I_Truck_02_covered_F": {350};
	case "I_Truck_02_transport_F": {300};
	case "C_Hatchback_01_F": {55};
	case "C_Hatchback_01_sport_F": {55};
	case "C_SUV_01_F": {75};
	case "C_Van_01_transport_F": {200};
	case "I_G_Van_01_transport_F": {200};
	case "C_Van_01_box_F": {250};
	case "C_Boat_Civil_01_F": {85};
	case "C_Boat_Civil_01_police_F": {85};
	case "C_Boat_Civil_01_rescue_F": {85};
	case "B_Truck_01_box_F": {1000};
	case "B_Truck_01_covered_F": {500};
	case "B_Truck_01_transport_F": {500};
	case "B_MRAP_01_F": {100};
	case "O_MRAP_02_F": {100};
	case "I_MRAP_03_F": {100};
	case "B_MRAP_01_hmg_F": {100};
	case "B_Heli_Light_01_F": {90};
	case "O_Heli_Light_02_unarmed_F": {400};
	case "I_Heli_Transport_02_F": {500};
	case "C_Rubberboat": {45};
	case "O_Boat_Armed_01_hmg_F": {75};
	case "B_G_Boat_Transport_01_F": {45};
	case "B_Boat_Transport_01_F": {45};
	case "O_Heli_Light_02_F": {500};
	case "I_Heli_light_03_unarmed_F": {150};
	case "O_Truck_03_transport_F": {300};
	case "O_Truck_03_covered_F": {200};
	case "Land_CargoBox_V1_F": {800};
	case "I_Truck_02_box_F": {650};
	case "O_Truck_03_device_F": {300};
	case "Land_CargoBox_V1_F": {400};
	case "Box_IND_Grenades_F": {250};
	case "B_supplyCrate_F": {250};
	case "C_Van_01_fuel_F": {100};
	case "O_Truck_02_transport_F": {300};
	case "B_Truck_01_ammo_F": {550};
	default {-1};
};