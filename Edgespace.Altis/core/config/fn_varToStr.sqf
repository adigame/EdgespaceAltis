/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	case "life_inv_oilu": {"Oil Unprocessed"};
	case "life_inv_oilp": {"Oil Processed"};
	case "life_inv_heroinu": {"Unprocessed Heroin"};
	case "life_inv_heroinp": {"Processed Heroin"};
	case "life_inv_cannabis": {"Cannabis"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_apple": {"Apple"};
	case "life_inv_rabbit": {"Rabbit Meat"};
	case "life_inv_salema": {"Salema"};
	case "life_inv_ornate": {"Ornate"};
	case "life_inv_mackerel": {"Mackerel "};
	case "life_inv_tuna": {"Tuna"};
	case "life_inv_mullet": {"Mullet"};
	case "life_inv_catshark": {"Catshark"};
	case "life_inv_turtle": {"Turtle Meat"};
	case "life_inv_fishingpoles": {"Angel"};
	case "life_inv_water": {"Water"};
	case "life_inv_coffee": {"Coffee"};
	case "life_inv_turtlesoup": {"Turtle Soup"};
	case "life_inv_donuts": {"Donuts"};
	case "life_inv_fuelE": {"Fuel Can (Empty)"};
	case "life_inv_fuelF": {"Fuel Can (Full)"};
	case "life_inv_pickaxe": {"Pickaxe"};
	case "life_inv_copperore": {"Copper Ore"};
	case "life_inv_ironore": {"Iron Ore"};
	case "life_inv_ironr": {"Iron Bar"};
	case "life_inv_copperr": {"Copper Bar"};
	case "life_inv_sand": {"Sand"};
	case "life_inv_salt": {"Salt"};
	case "life_inv_saltr": {"Salt Refined"};
	case "life_inv_glass": {"Glass"};
	case "life_inv_diamond": {"Diamond Uncut"};
	case "life_inv_diamondr": {"Diamond Cut"};
	case "life_inv_tbacon": {"Tactical Bacon"};
	case "life_inv_redgull": {"RedBull"};
	case "life_inv_lockpick": {"Lockpick"};
	case "life_inv_peach": {"Peach"};
	case "life_inv_coke": {"Unprocessed cocoa leaf"};
	case "life_inv_cokep": {"Processed Cocaine"};
	case "life_inv_spikeStrip": {"Spike Strip"};
	case "life_inv_rock": {"Rock"};
	case "life_inv_goldu": {"Unprocessed Gold"};
	case "life_inv_platu": {"Unprocessed Platinum"};
	case "life_inv_goldingot": {"Gold Ingot"};
	case "life_inv_platingot": {"Platinum Ingot"};
	case "life_inv_cement": {"Cement Sack"};
	case "life_inv_goldbar": {"Gold Bar"};
	case "life_inv_wine": {"Wine"};
	case "life_inv_grapes": {"Grapes"};
	case "life_inv_methu": {"Unprocessed Methamphetamine"};
	case "life_inv_methp": {"Pure Methamphetamine"};
	case "life_inv_storage1": {"Strorage Crate (Small)"};
	case "life_inv_artifact": {"Rare Artifact"};
	case "life_inv_roundobject" : {"Unidentifiable Round Object"};
	case "life_inv_squareobject" : {"Unidentifiable Square Object"};
	case "life_inv_pottery" : {"Ancient Pottery"};
	case "life_inv_coins" : {"Unknown Coins"};
	case "life_inv_stonetablet": {"Ancient Stone Tablet"}; //TREASURE HUNTING ITEMS AFTER APPRAISAL
	case "life_inv_carvedstone": {"Ancient Carved Stone"};
	case "life_inv_valuablecoins": {"Valuable Coins"};
	case "life_inv_storage2": {"Strorage Crate (Large)"};
	case "life_inv_battery": {"Battery"};
	case "life_inv_blastingcharge": {"C4"};
	case "life_inv_boltcutter": {"Bolt Cutter"};
	case "life_inv_defusekit": {"C4 Defuse Kit"};
	case "life_inv_painkillers": {"Pain Killers"};
	case "life_inv_morphium": {"Morphine"};
	case "life_inv_zipties": {"Zipties"};
	case "life_inv_storagesmall": {"Small Storage Box"};
	case "life_inv_storagebig": {"Large Storage Box"};
	case "life_inv_mauer": {"RoadBlock"};
	case "life_inv_mash": {"Grain Mash Mixture"};
	case "life_inv_yeast": {"Yeast"};
	case "life_inv_rye": {"Rye"};
	case "life_inv_hops": {"Hops"};
	case "life_inv_whiskey": {"Distilled Whiskey"};
	case "life_inv_beerp": {"Fermented Beer"};
	case "life_inv_bottles": {"Glass Bottle"};
	case "life_inv_cornmeal": {"Corn Meal"};
	case "life_inv_bottledwhiskey": {"Bottled Whiskey"};
	case "life_inv_bottledbeer": {"Bottled Beer"};
	case "life_inv_bottledshine": {"Bottled Moonshine"};
	case "life_inv_moonshine": {"Distilled Moonshine"};
	case "life_inv_puranium": {"Legal Uranium Purifier"}; // Add This
    case "life_inv_ipuranium": {"Illegal Uranium Purifier"}; // Add This
    case "life_inv_uranium1": {"Uranium Waste"}; // Add This
    case "life_inv_uranium2": {"Raw Uranium"}; // Add This
    case "life_inv_uranium3": {"Purified Uranium"}; // Add This
    case "life_inv_uranium4": {"Enriched Uranium"}; // Add This
    case "life_inv_uranium": {"Weapons Grade Uranium"}; // Add This
	case "life_inv_kidney": {"Kidney"}; 
	case "life_inv_gpstracker": {"GPS Tracker"};
	case "life_inv_scalpel": {"Scalpel"};
	case "life_inv_offroadammo": {"Offroad Ammo"}; 
	case "life_inv_tentciv": {"Tent"};
	
	//Prof Block
	case "Oil_Prof": {(localize "STR_Prof_Oil")};
	case "Iron_Prof": {(localize "STR_Prof_Iron")};
	case "Copper_Prof": {(localize "STR_Prof_Copper")};
	case "Rock_Prof": {(localize "STR_Prof_Rock")};
	case "Fruit_Prof": {(localize "STR_Prof_Fruit")};
	case "Salt_Prof": {(localize "STR_Prof_Salt")};
	case "Sand_Prof": {(localize "STR_Prof_Sand")};
	case "Diamond_Prof": {(localize "STR_Prof_Diamond")};
	case "Cocain_Prof": {(localize "STR_Prof_Cocain")};
	case "Canabis_Prof": {(localize "STR_Prof_Canabis")};
	case "Heroin_Prof": {(localize "STR_Prof_Heroin")};
		
	//License Block
	case "license_civ_driver": {"Drivers License"};
	case "license_civ_air": {"Pilots License"};
	case "license_civ_heroin": {"Heroin Training"};
	case "license_civ_gang": {"Gang License"};
	case "license_civ_oil": {"Oil Proccessing"};
	case "license_civ_dive": {"Divers Permit"};
	case "license_civ_boat": {"Boat License"};
	case "license_civ_gun": {"Gun License"};
	case "license_cop_air": {"Police Pilot License"};
	case "license_cop_swat": {"SWAT License"};
	case "license_cop_cg": {"Coast Guard License"};
	case "license_civ_rebel": {"Rebel Training"};
	case "license_civ_truck": {"Truck License"};
	case "license_civ_diamond": {"Diamond Proccessing"};
	case "license_civ_copper": {"Copper Proccessing"};
	case "license_civ_iron": {"Iron Proccessing"};
	case "license_civ_sand": {"Sand Proccessing"};
	case "license_civ_salt": {"Salt Proccessing"};
	case "license_civ_coke": {"Cocaine Training"};
	case "license_civ_marijuana": {"Marijuana Training"};
	case "license_civ_cement": {"Cerment Mixing License"};
	case "license_civ_meth": {"Methamphetamine Training"};
	case "license_civ_grapes": {"Wine Proccessing"};
	case "license_civ_moonshine": {"Moonshine Proccessing"};
	case "license_civ_meth": {"Methamphetamine Training"};
	case "license_med_air": {"Medical Pilot Certificate"};
	case "license_civ_home": {"Home Owners Bond"};
	case "license_med_adac": {"ADAC License"};
	case "license_civ_stiller": {"Destillier License"};
	case "license_civ_liquor": {"Liquor License"};
	case "license_civ_bottler": {"Bottler License"};
	case "license_civ_uranium": {"Uranium License"};
	case "license_civ_corporation": {"Corporation License"};
	case "license_civ_gold": {"Gold Processing"};
	case "license_civ_platinum": {"Platinum Processing"};
};
