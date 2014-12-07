/*
	File: fn_weaponShopMenu.sqf
	Description:
*/
private["_config","_itemInfo","_itemList"];
uiNamespace setVariable ["Weapon_Shop",_this select 3];

disableSerialization;
if(!(createDialog "life_weapon_shop")) exitwith {};

_config = [_this select 3] call life_fnc_weaponShopCfg;
if(typeName _config == "STRING") exitWith {hint _config; closeDialog 0;};

ctrlSetText[38401,_config select 0];

_filters = ((findDisplay 38400) displayCtrl 38402);
lbClear _filters;

_filters lbAdd "Store";
_filters lbAdd "Inventory";

_filters lbSetCurSel 0;