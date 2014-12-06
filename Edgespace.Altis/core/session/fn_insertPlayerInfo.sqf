/*
	File: fn_insertPlayerInfo.sqf
	Description: 
*/
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
cutText[localize "STR_Session_QueryFail","BLACK FADED"];
0 cutFadeOut 9999999;

[[getPlayerUID player,profileName,life_cash,life_atmcash,player],"DB_fnc_insertRequest",false,false] spawn life_fnc_MP;