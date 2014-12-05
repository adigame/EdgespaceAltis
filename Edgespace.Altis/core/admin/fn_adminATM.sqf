#include <macro.h>

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint "!!Access Denied!!";};

createDialog "Life_atm_management";
[]spawn life_fnc_atmMenu;
