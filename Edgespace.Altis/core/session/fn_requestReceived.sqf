#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};

if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};

// New Player
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};

// No Data?
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};

// Wrong Player?
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_donator")) exitWith {
	[[profileName,getPlayerUID player,"VariablesAlreadySet"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,format["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2\nlife_donator: %3",life_adminlevel,life_coplevel,life_donator]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.9;
	["SpyGlass",false,false] execVM "\a3\functions_f\Misc\fn_endMission.sqf";
};


//Parse basic player information.

		diag_log "-------------- Get Cash -----------------------";
		diag_log format["(2) Cash: %1",_this select 2];
		diag_log "------------------------------------------------";
		life_cash = parseNumber (_this select 2);

		diag_log "-------------- Get ATM Cash --------------------";
		diag_log format["(3) ATM Cash: %1",_this select 3];
		diag_log "------------------------------------------------";
		life_atmcash = parseNumber (_this select 3);

		diag_log "-------------- Get Admin Level -----------------";
		diag_log format["(4) Admin Level: %1",_this select 4];
		diag_log "------------------------------------------------";
		__CONST__(life_adminlevel,parseNumber(_this select 4));

		diag_log "-------------- Get Donator Level ----------------";
		diag_log format["(5) Donator: %1",_this select 5];
		diag_log "------------------------------------------------";
		__CONST__(life_donator,parseNumber(_this select 5));

		diag_log "-------------- Get Licenses --------------------";
		diag_log format["(6) Licenses: %1",_this select 6];
		diag_log "------------------------------------------------";
		//Loop through licenses
		if(count (_this select 6) > 0) then {{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);};
		
		diag_log "-------------- Get Gear ------------------------";
		diag_log format["(8) Gear: %1",_this select 8];
		diag_log "------------------------------------------------";
		life_gear = _this select 8;
		[] call life_fnc_loadGear;

		diag_log "-------------- Get Proficency Data --------------";
		diag_log format["(9) Proficency: %1",_this select 9];
		diag_log "------------------------------------------------";
		if(count (_this select 9) > 0) then {{missionNamespace setVariable [(_x select 0),[parseNumber (_x select 1), parseNumber (_x select 2)]];} foreach (_this select 9);};


//Parse side specific information.
switch(playerSide) do {
case west: {
__CONST__(life_coplevel, parseNumber(_this select 7));
__CONST__(life_medicLevel,0);

		diag_log "-------------- Check if Black Listed -----------";
		diag_log format["(10) Blacklisted: %1",_this select 10];
		diag_log "------------------------------------------------";
		life_blacklisted = _this select 10;
};
	
	case civilian: {
		
		diag_log "-------------- Check if Arrested ---------------";
		diag_log format["(7) Arrested: %1",_this select 7];
		diag_log "------------------------------------------------";

		life_is_arrested = _this select 7;
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		
		
		diag_log "---------------- Get Houses Data ---------------";
		diag_log format["(10) Houses: %1",_this select 10];
		diag_log "------------------------------------------------";
		
		life_houses = _this select 10;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		
		diag_log "---------------- Get Gang Data -----------------";
		diag_log format["(11) Gang: %1",_this select 11];
		diag_log "------------------------------------------------";
		
		life_gangData = _this select 11;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
		
		diag_log "---------------- Get Tent Data -----------------";
		diag_log format["(12) Tent: %1",_this select 12];
		diag_log "------------------------------------------------";
		
		life_tent = _this select 12;

	};
	
	case independent: {
		diag_log "---------------- Get Medic Data -----------------";
		diag_log format["(7) Medic Level: %1",_this select 7];
		diag_log "------------------------------------------------";
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_coplevel,0);
	};
};
		/* Unused
		diag_log "---------------- (14) --------------------------";
		diag_log format["(14): %1",_this select 14];
		diag_log "------------------------------------------------";
		
		diag_log "---------------- (15) --------------------------";
		diag_log format["(15): %1",_this select 15];
		diag_log "------------------------------------------------";
		
		diag_log "---------------- (16) --------------------------";
		diag_log format["(16): %1",_this select 16];
		diag_log "------------------------------------------------";
		
		diag_log "---------------- (17) --------------------------";
		diag_log format["(17): %1",_this select 17];
		diag_log "------------------------------------------------";
		
		diag_log "---------------- (18) --------------------------";
		diag_log format["(18): %1",_this select 18];
		diag_log "------------------------------------------------";
		
		diag_log "---------------- (19) --------------------------";
		diag_log format["(19): %1",_this select 19];
		diag_log "------------------------------------------------"; */


// Vehicles
if(count (_this select 13) > 0) then {
{life_vehicles pushBack _x;} foreach (_this select 13);
};


		diag_log "---------------- Get Vehicle Data --------------------------";
		diag_log format["(13) Vehicles: %1",_this select 13];
		diag_log "------------------------------------------------"; 

life_session_completed = true;