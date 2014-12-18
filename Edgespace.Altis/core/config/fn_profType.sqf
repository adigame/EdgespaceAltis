/*
File: fn_profType
Author: Jacob "PapaBear" Tyler
 
Description:
Text changing
*/
//convert name to prof name
_type = [_this,0,"",[""]] call BIS_fnc_param;
 
if(_type == "" ) exitWith {[]};
 
_profName = "";
//diag_log "--------------- fn_profType.sqf ----------------";
//diag_log format["Proccessing Type: %1",_type];
//diag_log "------------------------------------------------";
switch ( _type ) do
{

//text to license
case "heroin": {_profName = "Heroin_Prof"; };
case "heroinu": {_profName = "Heroin_Prof"; };
case "heroinp": {_profName = "Heroin_Prof"; };
case "cocaine": { _profName = "Cocain_Prof";};
case "cocainep": { _profName = "Cocain_Prof";};
case "cannabis": { _profName = "Canabis_Prof";};
case "marijuana": { _profName = "Canabis_Prof";};
case "copper": { _profName = "Copper_Prof"; };
case "copper_r": { _profName = "Copper_Prof"; };
case "copperore": { _profName = "Copper_Prof"; };
case "iron": { _profName = "Iron_Prof";};
case "ironore": { _profName = "Iron_Prof";};
case "iron_r": { _profName = "Iron_Prof";};
case "salt": {_profName = "Salt_Prof"; };
case "salt_r": {_profName = "Salt_Prof"; };
case "sand": { _profName = "Sand_Prof";};
case "glass": { _profName = "Glass_Prof";};
case "diamond": { _profName = "Diamond_Prof";};
case "diamondc": { _profName = "Diamond_Prof";};
case "oil": { _profName = "Oil_Prof";};
case "oilu": { _profName = "Oil_Prof";};
case "oilp": { _profName = "Oil_Prof";};
case "apple": { _profName = "Fruit_Prof"; };
case "peach": { _profName = "Fruit_Prof";};
case "cement": { _profName = "Rock_Prof";};
case "rock": { _profName = "Rock_Prof";};
case "goldu": { _profName = "Gold_Prof";};
case "goldingot": { _profName = "Gold_Prof";};
case "platingot": { _profName = "Plat_Prof";};
case "platu": { _profName = "Plat_Prof";};
case "grapes": { _profName = "Wine_Prof";};
case "wine": { _profName = "Wine_Prof";};
case "bottledshine": { _profName = "Moonshine_Prof";};
case "moonshine": { _profName = "Moonshine_Prof";};
case "mash": { _profName = "Moonshine_Prof";};
case "meth": { _profName = "Meth_Prof";};
case "methu": { _profName = "Meth_Prof";};
case "methp": { _profName = "Meth_Prof";};
case "whiskey": { _profName = "Whiskey_Prof";};
case "bottledwhiskey": { _profName = "Whiskey_Prof";};
case "beer": { _profName = "Beer_Prof";};
case "beerp": { _profName = "Beer_Prof";};
case "bottledbeer": { _profName = "Beer_Prof";};
case "uranium": { _profName = "Uranium_Prof";};
case "uranium1": { _profName = "Uranium_Prof";};
case "uranium2": { _profName = "Uranium_Prof";};
case "uranium4": { _profName = "Uranium_Prof";};
case "yeast": { _profName = "Yeast_Prof";};
case "hops": { _profName = "Hops_Prof";};
case "rye": { _profName = "Rye_Prof";};


//license to text
case "Heroin_Prof": {_profName = "Heroin"; };
case "Cocain_Prof": { _profName = "Cocaine";};
case "Canabis_Prof": { _profName = "Cannabis";};
case "Copper_Prof": { _profName = "Copper"; };
case "Iron_Prof": { _profName = "Iron";};
case "Salt_Prof": {_profName = "Salt"; };
case "Sand_Prof": { _profName = "Sand";};
case "Glass_Prof": { _profName = "Glass";};
case "Diamond_Prof": { _profName = "Diamond";};
case "Oil_Prof": { _profName = "Oil";};
case "Rock_Prof": { _profName = "Rock";};
case "Fruit_Prof": { _profName = "Fruit"; };
case "Gold_Prof": { _profName = "Gold";};
case "Plat_Prof": { _profName = "Platinum";};
case "Wine_Prof": { _profName = "Wine";};
case "Moonshine_Prof": { _profName = "Moonshine";};
case "Meth_Prof": { _profName = "Meth";};
case "Whiskey_Prof": { _profName = "Whiskey";};
case "Beer_Prof": { _profName = "Beer";};
case "Uranium_Prof": { _profName = "Uranium";};
case "Yeast_Prof": { _profName = "Yeast";};
case "Hops_Prof": { _profName = "Hops";};
case "Rye_Prof": { _profName = "Rye";};

default{""};
};
 
 
 
_profName;