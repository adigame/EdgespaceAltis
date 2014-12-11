
// Check if the player has battery left
if(life_battery < 2) exitWith {hint "Your battery is dead."};

// Dont allow the player to use their smartphone when tied up
if (player getVariable ["restrained", false] || player getVariable ["surrender", false] || player getVariable ["ziptied", false]) {exit with hint "You cant do that you are tied up!"; };
createDialog "Life_my_smartphone";