/*
	Tortures the player
*/
private["_unit","_rand","_damage", "_fatigue"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;


    if(player distance (getMarkerPos "Safe_Kav") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};
    if(player distance (getMarkerPos "Save_Reb") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};
    if(player distance (getMarkerPos "Save_Jail") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};


if(life_action_inUse) exitWith {};

if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "You cant torture the player."};

life_action_inUse = true;

_rand = [0,4] call life_fnc_randomRound;


switch(_rand) do 
{
	case 0:
	{
		hintSilent "You hit the player in the stomach.";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.07;
		
		if(_damage >= 1) then { _damage = 0.95; };
		
		_unit setDamage _damage;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.2;
		
		if(_fatigue >= 1) then { _fatigue = 1; };
		
		_unit setFatigue _fatigue;
		[player,"punch"] call life_fnc_globalSound;
		//_unit say3D "punch";
	};
	case 1:
	{
		hintSilent "You hit the player in the face.";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.1;
		
		if(_damage >= 1) then { _damage = 0.98; };
		
		_unit setDamage _damage;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.25;
		
		if(_fatigue >= 1) then { _fatigue = 1; };
		[player,"punch"] call life_fnc_globalSound;
		//_unit say3D "punch";
	};
	case 2:
	{
		hintSilent "You have kicked the player.";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.11;
		
		if(_damage >= 1) then { _damage = 0.98; };
		
		_unit setDamage _damage;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.1;
		
		if(_fatigue >= 1) then { _fatigue = 1; };
		[player,"punch_break"] call life_fnc_globalSound;
		//_unit say3D "punch_break";
	};
	case 3:
	{
		hintSilent "You have kicked the player in his nutsack.";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.5;
		
		if(_damage >= 1) then { _damage = 0.99; };
		
		_unit setDamage _damage;
		
		_unit setFatigue 1;
		[player,"punch_balls"] call life_fnc_globalSound;
		//_unit say3D "punch_balls";
		
	};
	default
	{
		hintSilent "You have knocked the players teeth out.";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.1;
		
		if(_damage >= 1) then { _damage = 0.98; };
		
		_unit setDamage _damage;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.1;
		
		if(_fatigue >= 1) then { _fatigue = 1; };
		[player,"punch"] call life_fnc_globalSound;
		//_unit say3D "punch";
	};
};


life_action_inUse = false;

[[getPlayerUID player,name player,"",["Torture","207B"]],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;