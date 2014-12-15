/*
	File: dynamicweather.sqf
	Description: Random Weather Script
*/
	private ["_UpdateWeather"];
	//PreLoad Variablen
	if (isDedicated) then
	{
		Weather_Fog = [0,0,0];
		Weather_Waves = 0;
		Weather_OverCast = 0.5;
		Weather_Wind = [10, 10, true];
		Weather_Rain = 0;
		Weather_RainCounter = 1;
	};
	
	_UpdateWeather =
	{
		if (isDedicated) then
			{
				Weather_Chance = round(random 100);
				if(Weather_Chance <= 10) then
					{
						Weather_Fog = [0,0,0]; Weather_Waves = 0; Weather_OverCast = 0.2; Weather_Wind = [5, 5, true]; Weather_Rain = 0; Weather_RainCounter = 0;
						Weather_RWMod = round(random 9);
						if(Weather_RWMod == 0)	then {Weather_Fog = [1, 0.1,10];	Weather_Rain = 0.1;	Weather_OverCast = 0.4;}; //Dicht
						if(Weather_RWMod == 1)	then {Weather_Fog = [1, 0.2,10];	Weather_Rain = 0.2;	Weather_OverCast = 0.3;};
						if(Weather_RWMod == 2)	then {Weather_Fog = [1, 0.3,10];	Weather_Rain = 0.2;	Weather_OverCast = 0.2;}; //geht so, akzeptabler Nebel
						if(Weather_RWMod == 3)	then {Weather_Fog = [0.9, 0.1,15];	Weather_RainCounter = 0;}; //Dicht
						if(Weather_RWMod == 4)	then {Weather_Fog = [0.8, 0.1,15];	Weather_Rain = 0.2;	Weather_OverCast = 0.4;};
						if(Weather_RWMod == 5)	then {Weather_Fog = [0.7, 0.1,15];	Weather_RainCounter = 0;}; //geht so, akzeptabler Nebel
						if(Weather_RWMod == 6)	then {Weather_Fog = [0.6, 0.1,30];	Weather_RainCounter = 0;};
						if(Weather_RWMod == 7)	then {Weather_Fog = [0.5, 0.1,30];	Weather_Rain = 0.2;	Weather_OverCast = 0.5;};
						if(Weather_RWMod == 8)	then {Weather_Fog = [0.4, 0.1,30];	Weather_RainCounter = 0;}; //geht so, akzeptabler Nebel
						if(Weather_RWMod == 9)	then {Weather_Fog = [0.1, 0.1,50];	Weather_Rain = 0.4;	Weather_Waves = 1;	Weather_OverCast = 0.5;}; //Hoch halt
					};

				if(Weather_Chance >=11 && Weather_Chance <= 30 && Weather_RainCounter == 0) then
					{
						Weather_Fog = [0,0,0]; Weather_Waves = 0; Weather_OverCast = 1; Weather_Rain = 0; Weather_RainCounter = 1;
						Weather_RWMod = round(random 9);
						if(Weather_RWMod == 0)	then {Weather_Fog = 0.1;	Weather_Waves = 1;		Weather_OverCast = 1; 	Weather_Wind = [12, 12, true];	Weather_Rain = 0.6;};
						if(Weather_RWMod == 1)	then {Weather_Fog = 0.3;	Weather_Waves = 1;		Weather_OverCast = 1; 	Weather_Wind = [12, 12, true];	Weather_Rain = 0.6;};
						if(Weather_RWMod == 2)	then {Weather_Fog = 0.1;	Weather_Waves = 1;		Weather_OverCast = 0.9; Weather_Wind = [12, 12, true];	Weather_Rain = 0.5;};
						if(Weather_RWMod == 3)	then {Weather_Fog = 0.2;	Weather_Waves = 0.8;	Weather_OverCast = 0.8; Weather_Wind = [0, 20, true];	Weather_Rain = 0.5;};
						if(Weather_RWMod == 4)	then {Weather_Fog = 0.1;	Weather_Waves = 0.8;	Weather_OverCast = 0.7; Weather_Wind = [23, 0, true];	Weather_Rain = 0.3;};
						if(Weather_RWMod == 5)	then {Weather_Fog = 0.1;	Weather_Waves = 0.6;	Weather_OverCast = 0.7; Weather_Wind = [0, 21, true];	Weather_Rain = 0.3;};
						if(Weather_RWMod == 6)	then {Weather_Fog = 0.1;	Weather_Waves = 0.4;	Weather_OverCast = 0.6; Weather_Wind = [18, 0, true];	Weather_Rain = 0.2;};
						if(Weather_RWMod == 7)	then {Weather_Fog = 0.1;	Weather_Waves = 0.2;	Weather_OverCast = 0.5; Weather_Wind = [7, 7, true];	Weather_Rain = 0.2;};
						if(Weather_RWMod == 8)	then {Weather_Fog = 0.1;	Weather_Waves = 0.1;	Weather_OverCast = 0.4; Weather_Wind = [5, 7, true];	Weather_Rain = 0.2;};
						if(Weather_RWMod == 9)	then {Weather_Fog = 0.1;	Weather_Waves = 0;		Weather_OverCast = 0.4; Weather_Wind = [7, 5, true];	Weather_Rain = 0.1;};
					};

				if(Weather_Chance >=11 && Weather_Chance <= 30 && Weather_RainCounter == 1) then {Weather_Chance = 31};

				if(Weather_Chance >=31 && Weather_Chance <= 90) then
				{
					Weather_Fog = [0,0,0]; Weather_Waves = 0; Weather_OverCast = 0.2; Weather_Wind = [5, 5, true]; Weather_Rain = 0; Weather_RainCounter = 0;
					Weather_RWMod = round(random 9);
					if(Weather_RWMod == 0)	then {Weather_OverCast = 0.9;	Weather_Wind = [10, 0, true];};
					if(Weather_RWMod == 1)	then {Weather_OverCast = 0.9;	Weather_Wind = [0, 10, true];};
					if(Weather_RWMod == 2)	then {Weather_OverCast = 0.7;	Weather_Wind = [5, 10, true];};
					if(Weather_RWMod == 3)	then {Weather_OverCast = 0.7;	Weather_Wind = [10, 5, true];};
					if(Weather_RWMod == 4)	then {Weather_OverCast = 0.6;	Weather_Wind = [0, 10, true];};
					if(Weather_RWMod == 5)	then {Weather_OverCast = 0.6;	Weather_Wind = [5, 0, true];};
					if(Weather_RWMod == 6)	then {Weather_OverCast = 0.5;	Weather_Wind = [5, 5, true];};
					if(Weather_RWMod == 7)	then {Weather_OverCast = 0.5;	Weather_Wind = [5, 0, true];};
					if(Weather_RWMod == 8)	then {Weather_OverCast = 0.4;	Weather_Wind = [0, 5, true];};
					if(Weather_RWMod == 9)	then {Weather_OverCast = 0.4;	Weather_Wind = [5, 5, true];};
					
				};

				if(Weather_Chance >=91 && Weather_Chance <= 100) then
				{
					Weather_Fog = [0,0,0]; Weather_Waves = 0; Weather_OverCast = 0.2; Weather_Wind = [5, 5, true]; Weather_Rain = 0; Weather_RainCounter = 1;
					Weather_RWMod = round(random 2);
					if(Weather_RWMod == 0)	then {Weather_OverCast = 0.2;	Weather_Wind = [10, 0, true];};
					if(Weather_RWMod == 1)	then {Weather_OverCast = 0.2;	Weather_Wind = [0, 10, true];};
					if(Weather_RWMod == 2)	then {Weather_OverCast = 0.1;	Weather_Wind = [0, 0, true];};				
				};
				Diag_log format ["::::::::: Weather System ::::::::: Weather_Chance = %1 ::: Weather_RWMod = %2",Weather_Chance, Weather_RWMod];
				publicVariable "Weather_Fog";
				publicVariable "Weather_Waves";
				publicVariable "Weather_OverCast";
				publicVariable "Weather_Wind";
				publicVariable "Weather_Rain";
			};
	};

	if(isDedicated)then
	{
		while{true}do
		{
			[] call _UpdateWeather;
			sleep 1;
			60 setfog (Weather_Fog);
			60 setRain (Weather_Rain);
			0 setOvercast (Weather_OverCast);
			setWind (Weather_Wind);
			60 setWaves (Weather_Waves);
			sleep 1200;
		};
	};

	if (!isDedicated) then
	{
		while{true}do
		{
			60 setfog (Weather_Fog);
			60 setRain (Weather_Rain);
			0 setOvercast (Weather_OverCast);
			setWind (Weather_Wind);
			60 setWaves (Weather_Waves);
			//hint format ["::::::::: Weather System ::::::::: Weather_Chance = %1 ::: Weather_RWMod = %2",Weather_Chance, Weather_RWMod];
			uiSleep 120;
		};
	}; 