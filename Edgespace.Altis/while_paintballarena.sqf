_mypoints = 0;
_oldpoints = 0;

while {pb_running==2} do {
    if (player == pb_player1) then { _mypoints = pb_player1points; };
    if (player == pb_player2) then { _mypoints = pb_player2points; };
    if (player == pb_player3) then { _mypoints = pb_player3points; };
    if (player == pb_player4) then { _mypoints = pb_player4points; };
    if (player == pb_player5) then { _mypoints = pb_player5points; };
    if (player == pb_player6) then { _mypoints = pb_player6points; };
    if (player == pb_player7) then { _mypoints = pb_player7points; };
    if (player == pb_player8) then { _mypoints = pb_player8points; };
    if (player == pb_player9) then { _mypoints = pb_player9points; };
    if (player == pb_player10) then { _mypoints = pb_player10points;};
    _oldpoints = _mypoints;
    sleep 3;
    if (player == pb_player1) then { _mypoints = pb_player1points; };
    if (player == pb_player2) then { _mypoints = pb_player2points; };
    if (player == pb_player3) then { _mypoints = pb_player3points; };
    if (player == pb_player4) then { _mypoints = pb_player4points; };
    if (player == pb_player5) then { _mypoints = pb_player5points; };
    if (player == pb_player6) then { _mypoints = pb_player6points; };
    if (player == pb_player7) then { _mypoints = pb_player7points; };
    if (player == pb_player8) then { _mypoints = pb_player8points; };
    if (player == pb_player9) then { _mypoints = pb_player9points; };
    if (player == pb_player10) then { _mypoints = pb_player10points; };
    if (_oldpoints!=_mypoints) then { hint format["You made a point, Current Score: %1",_mypoints]; };
};

_mypoints = 0;
_oldpoints = 0;