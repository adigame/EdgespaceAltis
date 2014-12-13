/*
	ALAH SNACKBAR!
*/
private["_test"];
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