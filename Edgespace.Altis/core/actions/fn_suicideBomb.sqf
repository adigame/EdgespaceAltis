/*
	ALAH SNACKBAR!
*/
private["_test"];
    
	if(player distance (getMarkerPos "Safe_Kav") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};
    if(player distance (getMarkerPos "Save_Reb") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};
    if(player distance (getMarkerPos "Save_Jail") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};
	
if(vest player != "V_HarnessOGL_brn") exitWith {};
[[0,format["%1 has activated their suicide vest.",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
hint "You have activated your suicide vest 30 seconds remaining.";
player say3D "suicide";
[player,"suicide"] call life_fnc_globalSound;
sleep 30;
player say3D "suicide";
[player,"suicide"] call life_fnc_globalSound;
if(alive player) then {player setDamage 1;};
_test = "Bo_Mk82" createVehicle [0,0,9999];
_test setPos (getPos player);
_test setVelocity [100,0,0];
[[0,format["%1 has set off their suicide vest.",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;