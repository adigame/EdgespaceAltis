if (life_kw_kavala) exitWith {hint "Do have already initiated load shedding"};
_types = ["Lamps_Base_F", "PowerLines_base_F", "Lamp_LampAirport_F", "Land_LampStreet_small_F", "Land_LampStreet_F", "Land_LampSolar_F", "Land_LampShabby_F", "Land_LampHalogen_F", "Land_LampHarbour_F", "Land_LampDecor_F"];
_onoff = _this select 0;

for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
    // powercoverage is a marker I placed.
	_lamps = getMarkerPos "kraftwerk_1" nearObjects [_types select _i, 1000];
	sleep 1;
	{_x setDamage _onoff} forEach _lamps;
};

if(playerSide == civilian) then
{
	life_kw_kavala = true;
	[[getPlayerUID player,profileName,"42"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[0,format["!!! %1 has started load shedding Kavala !!!", name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	sleep 300;
	life_kw_kavala = false;
};