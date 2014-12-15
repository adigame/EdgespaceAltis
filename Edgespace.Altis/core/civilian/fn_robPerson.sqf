/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

    if(player distance (getMarkerPos "Safe_Kav") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};
    if(player distance (getMarkerPos "Save_Reb") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};
    if(player distance (getMarkerPos "Save_Jail") < 400) exitWith {titleText ["You Are In A Safe Zone!", "PLAIN", 3];};


if(isNull _robber) exitWith {}; //No one to return it to?

if(life_cash > 0) then
{
	[[life_cash],"life_fnc_robReceive",_robber,false] spawn life_fnc_MP;
	//[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[life_cash] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	life_cash = 0;
}
	else
{
	[[2,"STR_NOTF_RobFail",true,[profileName]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
};