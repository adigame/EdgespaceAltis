/* 
	Author: TheTotenkopf für SealDrop.de
*/

while {true} do {
	sleep 1800;
	[] call SOCK_fnc_updateRequest;
	hint "Your player information is automatically saved to the server.\n\n Next autosave in: 30 minutes"
};