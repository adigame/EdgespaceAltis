/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {5000}; //Drivers License 
	case "boat": {5000}; //Boating license
	case "pilot": {250000}; //Pilot/air license
	case "gun": {50000}; //Firearm/gun license 
	case "dive": {5000}; //Diving license
	case "oil": {10000}; //Oil processing license
	case "cair": {15000}; //Cop Pilot License 
	case "swat": {350000}; //Swat License 
	case "cg": {10000}; //Coast guard license 
	case "heroin": {45000}; //Heroin processing license
	case "marijuana": {20000}; //Marijuana processing license
	case "medmarijuana": {75000}; // Medical Marijuana processing license 
	case "gang": {500000}; //Gang license 
	case "rebel": {750000}; //Rebel license 
	case "corp": {750000}; // Corporation Licence
	case "truck": {25000}; //Truck license 
	case "diamond": {50000}; // Diamond License
	case "salt": {20000}; //Salz License
	case "cocaine": {80000}; //Kokain License
	case "sand": {14500}; //Sand License
	case "iron": {9500}; //Eisen License
	case "copper": {9000}; //Kupfer License
	case "cement": {6500}; //Zement License
	case "grapes": {10000}; //Trauben License
	case "moonshine": {80000}; //Moonshine License
	case "meth": {65000}; //Meth License
	case "medic": {10000}; //Medic License
	case "mair": {15000}; //Maische
	case "home": {500000}; //Home License
	case "adac": {10000}; //ADAC License
	case "stiller":{25000}; //Distiller License
	case "liquor":{50000}; // liquor License
	case "bottler":{25000}; //Abfüller License
	case "mash":{100000}; //Maische License
	case "uranium": {150000}; //Uranium License
	case "goldingot": {150000}; //Gold License
	case "platingot": {150000}; //Platinum License
};