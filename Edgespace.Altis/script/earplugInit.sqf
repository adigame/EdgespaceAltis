wakPlugs = false;
wakOnAction = ["<t color='#ffff33'>Put in Earplugs</t>", "script\earplugsaction.sqf", [], -90, false, true, "", "_target == vehicle player"];

0.5 fadeSound 1;
{_x addAction wakOnAction;
_x addEventHandler ["Respawn", {
    _unit = _this select 0;
    wakPlugs = false;
    0.5 fadeSound 1;
    _unit addAction wakOnAction;
}];
} forEach allUnits;