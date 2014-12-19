_onScreenTime = 10;
 
sleep 1;
_role1 = "Welcome to Edgespace AltisLife";
_role1names = ["ts.edgespace.co.za:9987"];
_role2 = "Join Our Teamspeak";
_role2names = ["ts.edgespace.co.za:9987<br/>No Poking Admins Allowed<br/>You will be kicked, repeated abuse and you will be banned."];
_role3 = "Server Rules";
_role3names = ["Must be followed at all times. Press M to see the rules"]; 
_role4 = "Please Report";
_role4names = ["Any in-game issues, bugs, or problems on the website or teamspeak"];
_role5 = "NO VOICE IN SIDE";
_role5names = ["Absolutely no voice over side<br/>You will be kicked, repeated abuse and you will be banned"];
_role6 = "SAFE ZONES";
_role6names = ["Kavala Market <br/> Rebel HQ <br/> No Stealing <br/> No Knocking Out <br/> NO SHOOTING <br/> NO VDM <br/> NO RDM <br/> No Organ Theft <br/> No Restraining <br/> You have been warned!"];
_role7 = "Basic Controls";
_role7names = ["See map screen for details<br/>Press M to see the controls"];
_role8 = "Server Admins";
_role8names = ["NightShade"];
{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='.80' color='#00c800' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.75' color='#ffffff' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50],
[safezoneY + safezoneH - 0.8,0.7],
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
[_role8, _role8names]
];