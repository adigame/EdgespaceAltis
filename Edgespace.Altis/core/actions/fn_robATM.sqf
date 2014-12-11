/*
    File: fn_robATM.sqf
    Author: DerHeiligeBimBam und Chuck Norris
    
    Description:
ATM / Geldautomat ausrauben
    
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;
 
if(side _robber != civilian) exitWith { hint "You're not a civilian!" };
if(_robber distance _shop > 4) exitWith { hint "You have to stand next to the ATM!" };
 
if !(_kassa) then { _kassa = 1000; };
if (_rip) exitWith { hint "This ATM has already been robbed!" };
if (vehicle player != _robber) exitWith { hint "Get out of your vehicle first!" };
 
if !(alive _robber) exitWith {};
if(!([false,"boltcutter",1] call life_fnc_handleInv)) exitWith {"You need a bolt cutter!"};
if (_kassa == 0) exitWith { hint "There is no money!" };
 
_rip = true;
_kassa = 20000 + round(random 30000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 85) then { hint "Someone has alerted the police to your actions!"; [[1,format["Someone is breaking into an ATM!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };
 
_cops = (west countSide playableUnits);
if(_cops < 2) 
exitWith{[[_vault,-1],"disableSerialization;",false,false] spawn 
life_fnc_MP; hint "There needs to be at least 2 police online!";};
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["You need to be within 2 meters of the ATM. (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
if(_rip) then
{
while{true} do
{
sleep 0.85;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["You need to be within 2 meters of the ATM. (%1%2)...",round(_cP * 100),"%"];
_Pos = position player; 
               _marker = createMarker ["Marker200", _Pos]; 
               "Marker200" setMarkerColor "ColorRed";
               "Marker200" setMarkerText "!! Danger ATM Robbery !!";
               "Marker200" setMarkerType "mil_warning"; 
if(_cP >= 1) exitWith {};
if(_robber distance _shop > 2.5) exitWith { };
if!(alive _robber) exitWith {};
};
if!(alive _robber) exitWith { _rip = false; };
if(_robber distance _shop > 2.5) exitWith { deleteMarker 
"Marker200"; _shop switchMove ""; hint "You have moved too far away robbery failed."; 5 cutText ["","PLAIN"]; _rip = 
false; };
5 cutText ["","PLAIN"];
 
titleText[format["You have stolen $%1",[_kassa] call life_fnc_numberText],"PLAIN"];
deleteMarker "Marker200"; 
life_cash = life_cash + _kassa;
 
_rip = false;
life_use_atm = false;
sleep (30 + random(180));
life_use_atm = true;
if!(alive _robber) exitWith {};
[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
sleep 300;
_action = _shop addAction["Rob ATM",life_fnc_robATM]; 
_shop switchMove "";