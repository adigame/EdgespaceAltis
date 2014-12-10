/*
	File: fn_rebelInteractionMenu.sqf
	Description:
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","Btn10"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //No target

if (player getVariable "restrained") exitWith {closeDialog 0;}; // Restrain check

if (player getVariable "ziptied") exitWith {closeDialog 0;}; // ziptie check 

if (player distance _curTarget > 5) exitwith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
life_pInact_curTarget = _curTarget;

if(playerSide == civilian) then {
	_Btn1 ctrlSetText "Rob the Player";
	_Btn1 buttonSetAction "player playMove 'AinvPknlMstpSnonWnonDnon_medic1'; sleep 3; [life_pInact_curTarget] call life_fnc_robAction; closeDialog 0;";

	if((_curTarget getVariable["ziptied",true])) then {
	_Btn2 ctrlSetText "Cut the Cable Tie";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_rebelunrestrain; closeDialog 0;";
	} else {
	_Btn2 ctrlSetText "Cable Tie Players Hands";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_rebelziptieaction; closeDialog 0;";
	};
	_Btn3 ctrlSetText "Torture Player";
	_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_rebeltortureplayer; closeDialog 0;";

	if((_curTarget getVariable["Escorting",true])) then {
	_Btn4 ctrlSetText "Stop Escourt Player";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_rebelstopescorting; closeDialog 0;";
	} else {
	_Btn4 ctrlSetText "Escourt Player";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_rebelescourtaction; closeDialog 0;";
	};
	if((_curTarget getVariable["ziptied",true])) then {
	_Btn5 ctrlSetText "Put in Car";
	_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";
	};
	// Disable unused control
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
	_Btn10 ctrlShow false;
};