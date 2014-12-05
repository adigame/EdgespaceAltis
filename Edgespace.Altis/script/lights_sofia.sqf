if (life_kw_sofia) exitWith {hint "You have already initiated load shedding in Sofia you will need to wait 10 minutes"};
_types = ["Lamps_Base_F", "PowerLines_base_F", "Lamp_LampAirport_F", "Land_LampStreet_small_F", "Land_LampStreet_F", "Land_LampSolar_F", "Land_LampShabby_F", "Land_LampHalogen_F", "Land_LampHarbour_F", "Land_LampDecor_F"];
_onoff = _this select 0;

for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
    // power coverage is a marker I placed.
	_lamps = getMarkerPos "kraftwerk_1_2" nearObjects [_types select _i, 1000];
	sleep 1;
	{_x setDamage _onoff} forEach _lamps;
};

if(playerSide == civilian) then
{
	life_kw_sofia = true;
	hint "You have initiated initiated load shedding in Sofia";
	[[getPlayerUID player,profileName,"42"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[0,format["!!! %1 from ESKOM has started load shedding in Sofia !!!", name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	sleep 600;
	life_kw_sofia = false;
	[[0,format["!!! Load shedding has stopped Sofia !!!", name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	hint "!!! load shedding has stopped Sofia !!!";
};