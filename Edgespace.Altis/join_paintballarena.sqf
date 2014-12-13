if (pb_running==0) then {

    hint "You have created a new lobby!";
    disableUserInput true;
    pb_playercount = 1;
    publicVariable "pb_playercount";
    
    pb_running = 1;
    publicVariable "pb_running";
    pb_player1 = player;
    publicVariable "pb_player1";
    [[5,"<t size='2'><t color='#FF0000'>Paintball Arena</t></t><br/><br/><t size='1'>The paintball area has been started the lobby will close in 60 seconds!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
    sleep 30;
    [[5,"<t size='2'><t color='#FF0000'>Paintball Arena</t></t><br/><br/><t size='1'>The paintball area lobby is open for 30 more seconds!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
    sleep 20;
    [[5,"<t size='2'><t color='#FF0000'>Paintball Arena</t></t><br/><br/><t size='1'>The paintball area lobby is open for 10 more seconds!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
    sleep 10;
    
    [] call life_fnc_saveGear;
    _meingear = life_gear;
    
    _meinePos = getPos player;
    
    if (pb_playercount>=2) then {
        [[5,"<t size='2'><t color='#FF0000'>Paintball Arena</t></t><br/><br/><t size='1'>The paintball area has started!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
        
        pb_player1points = nil;
        pb_player2points = nil;
        pb_player3points = nil;
        pb_player4points = nil;
        pb_player5points = nil;
        pb_player6points = nil;
        pb_player7points = nil;
        pb_player8points = nil;
        pb_player9points = nil;
        pb_player10points = nil;
        
        publicVariable "pb_player1points";
        publicVariable "pb_player2points";
        publicVariable "pb_player3points";
        publicVariable "pb_player4points";
        publicVariable "pb_player5points";
        publicVariable "pb_player6points";
        publicVariable "pb_player7points";
        publicVariable "pb_player8points";
        publicVariable "pb_player9points";
        publicVariable "pb_player10points";

        sleep 0.1;
        
        pb_player1points=0;
        pb_player2points=0;
        pb_player3points=0;
        pb_player4points=0;
        pb_player5points=0;
        pb_player6points=0;
        pb_player7points=0;
        pb_player8points=0;
        pb_player9points=0;
        pb_player10points=0;
        
        publicVariable "pb_player1points";
        publicVariable "pb_player2points";
        publicVariable "pb_player3points";
        publicVariable "pb_player4points";
        publicVariable "pb_player5points";
        publicVariable "pb_player6points";
        publicVariable "pb_player7points";
        publicVariable "pb_player8points";
        publicVariable "pb_player9points";
        publicVariable "pb_player10points";
        
        hint "test start";
        pb_running = 2;
        publicVariable "pb_running";
        
        execVM "while_paintballarena.sqf";
        
        RemoveAllWeapons player;
        {player removeMagazine _x;} foreach (magazines player);
        removeUniform player;
        removeVest player;
        removeBackpack player;
        removeGoggles player;
        removeHeadGear player;
        wohin = 1;
        player forceAddUniform "U_I_Protagonist_VR";
        player addWeaponGlobal pb_weapon;
        player addMagazines [pb_wpnammo , 10];
        {
            player unassignItem _x;
            player removeItem _x;
        } foreach (assignedItems player);
        player allowdamage false;
        
        cangetpoint = 1;
        player addEventHandler ["Hit", {
        _theguy = _this select 1;
        if (cangetpoint==1) then {
        if (_theguy == pb_player1) then {pb_player1points = pb_player1points+1;publicVariable "pb_player1points";};
        if (_theguy == pb_player2) then {pb_player2points = pb_player2points+1;publicVariable "pb_player2points";};
        if (_theguy == pb_player3) then {pb_player3points = pb_player3points+1;publicVariable "pb_player3points";};
        if (_theguy == pb_player3) then {pb_player3points = pb_player3points+1;publicVariable "pb_player3points";};
        if (_theguy == pb_player4) then {pb_player4points = pb_player4points+1;publicVariable "pb_player4points";};
        if (_theguy == pb_player5) then {pb_player5points = pb_player5points+1;publicVariable "pb_player5points";};
        if (_theguy == pb_player6) then {pb_player6points = pb_player6points+1;publicVariable "pb_player6points";};
        if (_theguy == pb_player7) then {pb_player7points = pb_player7points+1;publicVariable "pb_player7points";};
        if (_theguy == pb_player8) then {pb_player8points = pb_player8points+1;publicVariable "pb_player8points";};
        if (_theguy == pb_player9) then {pb_player9points = pb_player9points+1;publicVariable "pb_player9points";};
        if (_theguy == pb_player10) then {pb_player10points = pb_player10points+1;publicVariable "pb_player10points";};
        cangetpoint = 0;
        };
        switch (wohin) do {
            case 1: { player setPos pb_player1spawn; };
            case 2: { player setPos pb_player2spawn };
            case 3: { player setPos pb_player3spawn };
            case 4: { player setPos pb_player4spawn };
            case 5: { player setPos pb_player5spawn };
            case 6: { player setPos pb_player6spawn };
            case 7: { player setPos pb_player7spawn };
            case 8: { player setPos pb_player8spawn };
            case 9: { player setPos pb_player9spawn };
            case 10: { player setPos pb_player10spawn };
        };
        player setDamage 0;
        sleep 1;
        cangetpoint = 1;
    }];
        
        player setPos pb_player1spawn;
            
        disableUserInput false;
            
        hint "The Area has started! 5 Minutes Remaining";
        sleep 240;
        hint "1 Minute remaining!";
        sleep 60;
        
        hint format["You made %1 point(s) in the match",pb_player1points];
        pb_running = 0;
        publicVariable "pb_running";    
        player removeAllEventHandlers "Hit";    
        life_gear = _meingear;
        [] spawn life_fnc_Loadgear;
        player setPos _meinePos;
        player allowdamage true;
        
        sleep 2;
    
        pb_player1 = nil;
        pb_player2 = nil;
        pb_player3 = nil;
        pb_player4 = nil;
        pb_player5 = nil;
        pb_player6 = nil;
        pb_player7 = nil;
        pb_player8 = nil;
        pb_player9 = nil;
        pb_player10 = nil;
        pb_player1points = nil;
        pb_player2points = nil;
        pb_player3points = nil;
        pb_player4points = nil;
        pb_player5points = nil;
        pb_player6points = nil;
        pb_player7points = nil;
        pb_player8points = nil;
        pb_player9points = nil;
        pb_player10points = nil;
        publicVariable "pb_player1";
        publicVariable "pb_player2";
        publicVariable "pb_player3";
        publicVariable "pb_player4";
        publicVariable "pb_player5";
        publicVariable "pb_player6";
        publicVariable "pb_player7";
        publicVariable "pb_player8";
        publicVariable "pb_player9";
        publicVariable "pb_player10";
        publicVariable "pb_player1points";
        publicVariable "pb_player2points";
        publicVariable "pb_player3points";
        publicVariable "pb_player4points";
        publicVariable "pb_player5points";
        publicVariable "pb_player6points";
        publicVariable "pb_player7points";
        publicVariable "pb_player8points";
        publicVariable "pb_player9points";
        publicVariable "pb_player10points";

    
    } else { hint "The paintball lobby has been canceled because there were less than 2 players!";execVM "init_paintballarena.sqf"; };
    ////[[5,"<t size='2'><t color='#FF0000'>Paintballarena</t></t><br/><br/><t size='1'>Das Spiel wurde abgebrochen, da nicht mind. 2 Spieler der Lobby beigetreten sind.</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
    pb_running = 0;
    publicVariable "pb_running";
};

if (pb_running==1) then {

    call life_fnc_saveGear;
    _meingear = life_gear;
    _meinePos = getPos player;
    disableUserInput true;
    wohin = 0;

    pb_playercount = pb_playercount+1;
    publicVariable "pb_playercount";
    switch (pb_playercount) do {
        case 2: { hint "You are not a member of the paintball lobby space remaining: 2";pb_player2 = player;publicVariable "pb_player2";wohin=2; };
        case 3: { hint "You are not a member of the paintball lobby space remaining: 3";pb_player3 = player;publicVariable "pb_player3";wohin=3; };
        case 4: { hint "You are not a member of the paintball lobby space remaining: 4";pb_player4 = player;publicVariable "pb_player4";wohin=4; };
        case 5: { hint "You are not a member of the paintball lobby space remaining: 5";pb_player5 = player;publicVariable "pb_player5";wohin=5; };
        case 6: { hint "You are not a member of the paintball lobby space remainingz: 6";pb_player6 = player;publicVariable "pb_player6";wohin=6; };
        case 7: { hint "You are not a member of the paintball lobby space remaining: 7";pb_player7 = player;publicVariable "pb_player7";wohin=7; };
        case 8: { hint "You are not a member of the paintball lobby space remaining: 8";pb_player8 = player;publicVariable "pb_player8";wohin=8; };
        case 9: { hint "You are not a member of the paintball lobby space remaining: 9";pb_player9 = player;publicVariable "pb_player9";wohin=9; };
        case 10: { hint "You are not a member of the paintball lobby space remaining: 10";pb_player10 = player;publicVariable "pb_player10";wohin=10; };
        case 11: { hint "The lobby is full!"; };
    };
    
    while {pb_running==1} do {}; //WARTESCHLEIFE AUF HOST
    disableUserInput false;
    pb_running = 2;
    publicVariable "pb_running";
    hint "The match has begun 5 minutes remaining!";
    
    RemoveAllWeapons player;
    {player removeMagazine _x;} foreach (magazines player);
    removeUniform player;
    removeVest player;
    removeBackpack player;
    removeGoggles player;
    removeHeadGear player;
    player forceAddUniform "U_I_Protagonist_VR";
    player addWeaponGlobal pb_weapon;
    player addMagazines [pb_wpnammo , 10];
    {
        player unassignItem _x;
        player removeItem _x;
    } foreach (assignedItems player);        
    player allowdamage false;    
    
    cangetpoint = 1;
        player addEventHandler ["Hit", {
        _theguy = _this select 1;
        if (cangetpoint==1) then {
        if (_theguy == pb_player1) then {pb_player1points = pb_player1points+1;publicVariable "pb_player1points";};
        if (_theguy == pb_player2) then {pb_player2points = pb_player2points+1;publicVariable "pb_player2points";};
        if (_theguy == pb_player3) then {pb_player3points = pb_player3points+1;publicVariable "pb_player3points";};
        if (_theguy == pb_player3) then {pb_player3points = pb_player3points+1;publicVariable "pb_player3points";};
        if (_theguy == pb_player4) then {pb_player4points = pb_player4points+1;publicVariable "pb_player4points";};
        if (_theguy == pb_player5) then {pb_player5points = pb_player5points+1;publicVariable "pb_player5points";};
        if (_theguy == pb_player6) then {pb_player6points = pb_player6points+1;publicVariable "pb_player6points";};
        if (_theguy == pb_player7) then {pb_player7points = pb_player7points+1;publicVariable "pb_player7points";};
        if (_theguy == pb_player8) then {pb_player8points = pb_player8points+1;publicVariable "pb_player8points";};
        if (_theguy == pb_player9) then {pb_player9points = pb_player9points+1;publicVariable "pb_player9points";};
        if (_theguy == pb_player10) then {pb_player10points = pb_player10points+1;publicVariable "pb_player10points";};
        cangetpoint = 0;
        };
        switch (wohin) do {
            case 1: { player setPos pb_player1spawn; };
            case 2: { player setPos pb_player2spawn };
            case 3: { player setPos pb_player3spawn };
            case 4: { player setPos pb_player4spawn };
            case 5: { player setPos pb_player5spawn };
            case 6: { player setPos pb_player6spawn };
            case 7: { player setPos pb_player7spawn };
            case 8: { player setPos pb_player8spawn };
            case 9: { player setPos pb_player9spawn };
            case 10: { player setPos pb_player10spawn };
        };
        player setDamage 0;
        sleep 1;
        cangetpoint = 1;
    }];
    
    switch (wohin) do {
        case 2: { player setPos pb_player2spawn };
        case 3: { player setPos pb_player3spawn };
        case 4: { player setPos pb_player4spawn };
        case 5: { player setPos pb_player5spawn };
        case 6: { player setPos pb_player6spawn };
        case 7: { player setPos pb_player7spawn };
        case 8: { player setPos pb_player8spawn };
        case 9: { player setPos pb_player9spawn };
        case 10: { player setPos pb_player10spawn };
    };
    
    execVM "while_paintballarena.sqf";
    while {pb_running==2} do {}; //WARTESCHLEIFE AUF HOST

    pb_running = 0;
    publicVariable "pb_running";
    
    if (player==pb_player1) then {hint format["You made %1 point(s)!",pb_player1points];};
    if (player==pb_player2) then {hint format["You made %1 point(s)!",pb_player2points];};
    if (player==pb_player3) then {hint format["You made %1 point(s)!",pb_player3points];};
    if (player==pb_player4) then {hint format["You made %1 point(s)!",pb_player4points];};
    if (player==pb_player5) then {hint format["You made %1 point(s)!",pb_player5points];};
    if (player==pb_player6) then {hint format["You made %1 point(s)!",pb_player6points];};
    if (player==pb_player7) then {hint format["You made %1 point(s)!",pb_player7points];};
    if (player==pb_player8) then {hint format["You made %1 point(s)!",pb_player8points];};
    if (player==pb_player9) then {hint format["You made %1 point(s)!",pb_player9points];};
    if (player==pb_player10) then {hint format["You made %1 point(s)!",pb_player10points];};
    
    pb_player1 = nil;
    pb_player2 = nil;
    pb_player3 = nil;
    pb_player4 = nil;
    pb_player5 = nil;
    pb_player6 = nil;
    pb_player7 = nil;
    pb_player8 = nil;
    pb_player9 = nil;
    pb_player10 = nil;
    publicVariable "pb_player1";
    publicVariable "pb_player2";
    publicVariable "pb_player3";
    publicVariable "pb_player4";
    publicVariable "pb_player5";
    publicVariable "pb_player6";
    publicVariable "pb_player7";
    publicVariable "pb_player8";
    publicVariable "pb_player9";
    publicVariable "pb_player10";
            
    life_gear = _meingear;
    [] spawn life_fnc_Loadgear;
    player setPos _meinePos;
    player allowdamage true;
    player removeAllEventHandlers "Hit";
};

if (pb_running==2) then {
    hint "There is already a game in progress please try again later!";
};