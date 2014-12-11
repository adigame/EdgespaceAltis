/*
    File: fn_robShops.sqf
    Description:Main functionality for robbing the federal reserve.
    this addAction["Rob the Cash Register",life_fnc_robGasAction,"",99,false,false,"",' playerSide == civilian && !(_target getVariable ["gas_rob_ip",false]) && !(_target getVariable ["gas_locked",false]) && (currentWeapon player) != ""'];
*/
private["_unit","_shop","_funds","_timer","_toFar","_pos","_marker","_chance","_tazed","_player"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;//Action name
_player = player;
_toFar = false;
_tazed = false;
_timer = time + (5 * 60); //Default timer is 5 minutes to rob.
_pos = GetPos player;
if(player distance _shop > 6) exitWith {
    hint "You need to stand within 5 meters of the ATM to rob it!"
};
if (life_robbery_in_progress) exitWith {hint "Robbery already in progress"};
if (playerSide == west) exitWith {hint "I will notify the IPID (Independent Police Investigative Directorate) if you don't leave immediately"};
//if({side _x == west} count playableUnits < 1) exitWith {hint "There needs to be at least 1 Police Officer on duty to rob the ATM!"};

_chance = ceil(random 3);
if (_chance == 0) then {_funds = 16000;};
if (_chance == 1) then {_funds = 18000;};
if (_chance == 2) then {_funds = 25000;};
if (_chance == 3) then {_funds = 125000;};
if (_funds == 0) exitWith {hint "The ATM has no cash!";};
if(!([false,"boltcutter",1] call life_fnc_handleInv)) exitWith {"You need a bolt cutter!"};

_shop removeAction _action;
life_robbery_in_progress = true;
titleText["Breaking into the ATM","PLAIN"];
sleep 3;
titleText["A civilian spotted you and called the police","PLAIN"];

[[2,"An ATM is being robbed!!!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[0,"Anonymous witness reported the location of the robbery, you have 5 minutes to intervene"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
//[[getPlayerUID _player,name _player,"211g"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

_marker = createMarker ["_unit", _Pos]; 
"_unit" setMarkerColor "ColorRed";
"_unit" setMarkerText "!DANGER! ATM Robbery In Progress !DANGER!";
"_unit" setMarkerType "mil_warning";

while {true} do
{
    //Timer display (TO BE REPLACED WITH A NICE GUI LAYER)
    _countDown = [(_timer - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
    hintSilent format["You need to stay within 5m!\n\nTime Remaining:\n %1\n\nDistance: %2m",_countDown,round(player distance _shop)];

    if(player distance _shop > 6) exitWith {_toFar = true;};
    if((round(_timer - time)) < 1) exitWith {};
    if(!alive player) exitWith {};
    if(life_istazed) exitWith {_tazed = true;};
    sleep 0.1;
};

switch(true) do
{
    case (_toFar):
    {
        hint "You went too far from the ATM, the robbery has failed!";
        [[2,"Robbery Failed. Suspect is fleeing the crime scene!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 
        [[_shop,0],"TON_fnc_robGasState",false,false] spawn life_fnc_MP;
        sleep 30; 
        deleteMarker "_unit";
    };
    case (!alive player):
    {
        hint "Robbery failed because you died.";
        [[2,"Robbery stopped, suspect was brutally murdered!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
        [[_shop,0],"TON_fnc_robGasState",false,false] spawn life_fnc_MP;
        sleep 30; 
        deleteMarker "_unit";
    };
    
    case (_tazed):
    {
        hint "You were tazed, the robbery has failed!";
        [[2,"Robbery stopped, arrest the robber and collect the bounty!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;	
        [[_shop,0],"TON_fnc_robGasState",false,false] spawn life_fnc_MP;
        sleep 30; 
        deleteMarker "_unit";
    };
    
    case ((round(_timer - time)) < 1):
    {
        hint format["You have successfully robbed $%1\n\n To avoid the police tracing you, your bank card will not work for 8 minutes",[_funds] call life_fnc_numberText];
        [[2,"Robbers finished robbing the ATM!!!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
        [[0,"Be Careful Robbers might still be at the crime scene."],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
        [[getPlayerUID _player,name _player,"211c"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
        deleteMarker "_unit"; 
        [] spawn
        {
            life_use_atm = false;
            sleep 480; 
            life_use_atm = true;
        };
        life_cash = life_cash + _funds;
        [[_shop,1],"TON_fnc_robGasState",false,false] spawn life_fnc_MP;
        sleep 480; //Cooldown between the robberies
    };
};

life_robbery_in_progress = false;
_shop switchMove "";//Reseting the shop owner
