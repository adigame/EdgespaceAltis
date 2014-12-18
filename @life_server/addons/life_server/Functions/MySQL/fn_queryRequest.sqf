/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles the incoming request and sends an asynchronous query 
	request to the database.
	
	Return:	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
	
		
	Client        Client		        Server		             Client
	init.sqf ---> fn_dataQuery.sqf ---> fn_queryRequest.sqf ---> fn_requestReceived
	
*/
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

// Check to see if a player actually called this
if(isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;

/*
	_returnCount is the count of entries we are expecting back from the async call.
	The other part is well the SQL statement.
*/
_query = switch(_side) do {

// Selected Columns 11
case west: {_returnCount = 11; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, cop_licenses, coplevel, cop_gear, cop_prof, blacklist FROM players WHERE playerid='%1'",_uid];};

// Selected Columns 10
case civilian: {_returnCount = 10; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear, civ_prof FROM players WHERE playerid='%1'",_uid];};

// Selected Columns 10
case independent: {_returnCount = 10; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, med_licenses, mediclevel, med_gear, med_prof FROM players WHERE playerid='%1'",_uid];};
};

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

if(typeName _queryResult == "STRING") exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

if(count _queryResult == 0) exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

//Blah conversion thing from a2net->extdb
private["_tmp"];
// 2 Cash
_tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call DB_fnc_numberSafe];

		diag_log "---------------- Cash Data ---------------------";
		diag_log format["%1",_queryResult select 2];
		diag_log "------------------------------------------------";

// 3 ATM Cash
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call DB_fnc_numberSafe];

		diag_log "---------------- ATM Cash Data -----------------";
		diag_log format["%1",_queryResult select 3];
		diag_log "------------------------------------------------";

// 6 Parse licenses
_new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};

_queryResult set[6,_old];

		diag_log "---------------- licenses Data -----------------";
		diag_log format["%1",_queryResult select 6];
		diag_log "------------------------------------------------";

// 8 Gear
_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[8,_new];

		diag_log "---------------- Gear Data ---------------------";
		diag_log format["%1",_queryResult select 8];
		diag_log "------------------------------------------------";


// 9 Proficiency
//Parse licenses (Always index 9)
_new = [(_queryResult select 9)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[9,_new];
 
//Convert string to number
_old = _queryResult select 9;
for "_i" from 0 to (count _old)-1 do
{
_data = _old select _i;
_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_numberSafe),([_data select 2,1] call DB_fnc_numberSafe) ]];
};
 
_queryResult set[9,_old];

		diag_log "---------------- Proficency Data --------------";
		diag_log format["%1",_queryResult select 9];
		diag_log "------------------------------------------------";


//Parse data for specific side.
switch (_side) do {
	case west: {
	// 10 Blacklisted
		_queryResult set[10,([_queryResult select 10,1] call DB_fnc_bool)];
		
		diag_log "---------------- Blacklisted Data --------------";
		diag_log format["%1",_queryResult select 10];
		diag_log "------------------------------------------------";
		
	};
	
	case civilian: {
	// 7 Arrested
		_queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];
		
		diag_log "---------------- Arrested Data -----------------";
		diag_log format["%1",_queryResult select 7];
		diag_log "------------------------------------------------";	
		
   
	// 10 Houses		
		_houseData = _uid spawn TON_fnc_fetchPlayerHouses;
		waitUntil {scriptDone _houseData};
		_queryResult pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]);
		
		diag_log "---------------- House Data ---------------------";
		diag_log format["%1",_queryResult select 10];
		diag_log "------------------------------------------------";	
	
	// 11 Gang
		_gangData = _uid spawn TON_fnc_queryPlayerGang;
		waitUntil{scriptDone _gangData};
		_queryResult pushBack (missionNamespace getVariable[format["gang_%1",_uid],[]]);
		
		diag_log "---------------- Gang Data ---------------------";
		diag_log format["%1",_queryResult select 11];
		diag_log "------------------------------------------------";	
	
	// 12 Tents
		 _tent = _uid spawn life_fnc_getTents;
		waitUntil{scriptDone _tent};
		_queryResult pushBack (missionNamespace getVariable[format["tent_%1",_uid],[]]);
		missionNamespace setVariable[format["tent_%1",_uid],nil];
		
		diag_log "---------------- Tent Data ---------------------";
		diag_log format["%1",_queryResult select 12];
		diag_log "------------------------------------------------";	
		
	};
};

_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
_queryResult set[13,_keyArr];

// Pass results array with player ID the client side fn_requestReceived.sqf
[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] spawn life_fnc_MP;