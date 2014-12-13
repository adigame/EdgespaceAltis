#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide !=west): {"You are not a police officer!"};
			default
			{
				["Police Const Store",
					[
						["Rangefinder",nil,10]
					]
				];
			};
		};
	};

	case "cop_visier":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a police officer!"};
			case (__GETC__(life_coplevel) < 1): {"Police officers may only access this!"};
			default
			{
				["Other",
					[
						["ItemMap",nil,10],
						["ItemWatch",nil,10],
						["ItemCompass",nil,10],
						["ItemGPS",nil,10],
						["ToolKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles_OPFOR",nil,10],
						["Chemlight_red",nil,10],
						["Chemlight_yellow",nil,10],
						["Chemlight_green",nil,10],
						["Chemlight_blue",nil,10],
						["acc_flashlight",nil,10],
						["acc_pointer_IR",nil,10],
						["B_UavTerminal",nil,10],
						["Rangefinder",nil,10],
						["optic_Holosight",nil,10],
						["optic_ACO_smg",nil,10],
						["optic_MRCO",nil,10],
						["optic_LRPS",nil,10],
						["optic_DMS",nil,10],
						["optic_NVS",nil,10],
						["optic_Arco",nil,10],
						["muzzle_snds_L",nil,10],
						["muzzle_snds_M",nil,10],
						["muzzle_snds_H",nil,10]
					]
				];
			};
		};
	};
	
	case "adac_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not a pharamedic/EMS"};
			case (__GETC__(life_mediclevel) < 2): {"Only pharamedics/EMS can access this!"}; 
			default {
				["Medic Shop",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ToolKit",nil,10],
						["FirstAidKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles",nil,10],
						["Chemlight_red",nil,20],
						["Chemlight_yellow",nil,20],
						["Chemlight_green",nil,20],
						["Chemlight_blue",nil,20]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not a pharamedic/EMS"};
			case (__GETC__(life_mediclevel) < 1): {"Only pharamedics/EMS can access this!"}; 
			default {
				["Pharamedic's Store",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ToolKit",nil,10],
						["FirstAidKit",nil,10],
						["Medikit",nil,10],
						["NVGoggles",nil,10],
						["Chemlight_red",nil,20],
						["Chemlight_yellow",nil,20],
						["Chemlight_green",nil,20],
						["Chemlight_blue",nil,20]
					]
				];
			};
		};
	};
	
	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide !=west): {"You are not a police officer"};
			case (__GETC__(life_coplevel) < 2): {"You are not a sargent!"};
			default
			{
				["Police Sgt Store",
					[
						["arifle_sdar_F","Taser Rifle",10],
						["hgun_Rook40_F","Taser Pistol",10],
						["hgun_Rook40_snds_F","Taser Pistol Silenced",10],
						["16Rnd_9x21_Mag","Tazer Pistol Magazine",10],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",10]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide !=west): {"You are not a police officer!"};
			case (__GETC__(life_coplevel) < 3): {"You are not a lieutenant"};
			default
			{
				["Police Lt Store",
					[
						["arifle_MXC_F",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_sdar_F","Taser Rifle",10],
						["SMG_02_F",nil,10],
						["30Rnd_65x39_caseless_mag","6,5mm Magazine",10],
						["30Rnd_9x21_Mag","9mm-Gummi",10],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",10]
					]
				];
			};
		};
	};
	
	case "cop_kommisar":
	{
		switch(true) do
		{
			case (playerSide !=west): {"You are not a police officer!"};
			case (__GETC__(life_coplevel) < 4): {"You are not a captain"};
			default
			{
				["Police CPT Store",
					[
						["SMG_02_F",nil,10],
						["arifle_TRG20_F",nil,10],
						["arifle_MX_F",nil,10],
						["arifle_MXC_F",nil,10],
						["30Rnd_65x39_caseless_mag","6,5mm Scharf",10],
						["30Rnd_9x21_Mag",nil,10],
						["30Rnd_556x45_Stanag",nil,10],
						["SmokeShellOrange","Orange Smoke Grenade",10]
					]
				];
			};
		};
	};	
	
	case "cop_sek":
	{
		switch(true) do
		{
			case (playerSide !=west): {"You are not a police officer!"};
			case (__GETC__(life_coplevel) < 5): {"You are not a major"};
			default
			{
				["Police Maj Store",
					[
						["arifle_MXM_Black_F",nil,10],
						["arifle_MX_Black_F",nil,10],
						["arifle_MXC_Black_F",nil,10],
						["SMG_02_F",nil,10],
						["arifle_TRG21_F",nil,10],
						["SmokeShellBlue","Tear Gas",10],
						["HandGrenade_Stone","Flash Bang",10],
						["SmokeShellOrange","Orange Smoke Grenade",10],
						["30Rnd_65x39_caseless_mag","6,5mm Scharf",10],
						["30Rnd_9x21_Mag",nil,10],
						["30Rnd_556x45_Stanag",nil,10]
					]
				];
			};
		};
	};
	
	case "cop_gsg":
	{
		switch(true) do
		{
			case (playerSide !=west): {"You are not a police officer!"};
			case (__GETC__(life_coplevel) < 6): {"You are not a lieutenant colonel"};
			default
			{
				["Police Lt Col Store",
					[
						["arifle_MXM_Black_F",nil,10],
						["arifle_MX_Black_F",nil,10],
						["arifle_MXC_Black_F",nil,10],
						["arifle_MX_SW_Black_F",nil,10],
						["srifle_GM6_F","GM6 Lynx 12.7 mm",80000],
						["5Rnd_127x108_Mag","Lynx Magazine",750],
						["SMG_02_F",nil,10],
						["srifle_EBR_F",nil,10],
						["arifle_TRG21_F",nil,10],
						["arifle_TRG20_F",nil,10],
						["optic_LRPS",nil,30000],
						["optic_NVS","Night Vision Scope",3000],
						["SmokeShellBlue","Tear Gas",10],
						["HandGrenade_Stone","Flash Bang",10],
						["SmokeShellOrange","Orange Smoke Grenade",10],
						["30Rnd_65x39_caseless_mag","6,5mm Scharf",10],
						["20Rnd_762x51_Mag",nil,10],
						["30Rnd_9x21_Mag",nil,10],
						["100Rnd_65x39_caseless_mag",nil,10]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You do not have rebel training!"};
			default
			{
				["Mohammed's Gun Store",
					[
						["arifle_TRG20_F","TRG-20 5.56 mm",100000],
						["arifle_Katiba_F","Katiba 6.5 mm",75000],
						["srifle_EBR_F","Mk18 ABR 7.62 mm",100000],
						["srifle_GM6_F","GM6 Lynx 12.7 mm",275000],
						["SMG_01_F","Vermin SMG .45 ACP",75000],
						["hgun_Pistol_heavy_01_MRD_F","4-five .45",25000],
						["hgun_P07_F","P07 9 mm",15000],
						["srifle_DMR_01_F","Rahim 7.62 mm",200000],
						["arifle_SDAR_F","Under Water Gun",30000],
						["acc_flashlight",nil,7500],
						["acc_pointer_IR",nil,15000],
						["optic_ACO_grn",nil,5000],
						["optic_Aco_smg",nil,5000],
						["optic_Holosight",nil,3600],
						["optic_Hamr",nil,10500],
						["optic_NVS","Night Vision Scope",20000],
						["optic_DMS",nil,40000],
						["optic_LRPS",nil,60000],
						["30Rnd_9x21_Mag",nil,200],
						["16Rnd_9x21_Mag",nil,150],
						["SmokeShellGreen",nil,2500],
						["muzzle_snds_M","6,5mm Silencer",10000],
						["30Rnd_45ACP_Mag_SMG_01","Vermin Magazine",500],
						["20Rnd_762x51_Mag","MK18 Magazine",500],
						["11Rnd_45ACP_Mag","4-five Magazine",500],
						["30Rnd_556x45_Stanag",nil,300],
						["5Rnd_127x108_Mag","Lynx Magazine",1000],
						["10Rnd_762x51_Mag","Rahim Magazine",500],
						["30Rnd_65x39_caseless_green","Katiba Magazine",275]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You do not have a gun license!"};
			default
			{
				["Joe's Firearms",
					[
						["hgun_P07_F",nil,15000],
						["hgun_Pistol_heavy_02_F",nil,20000],
						["hgun_ACPC2_F",nil,17500],
						["hgun_PDW2000_F",nil,30000],
						["optic_ACO_grn_smg",nil,2500],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator!"};
			case (__GETC__(life_donator) == 1):
			{
				["Donator Store Rank 1",
					[
						["hgun_P07_F",nil,1250],
						["hgun_PDW2000_F",nil,6500],
						["hgun_ACPC2_F",nil,11500],
						["optic_ACO_grn_smg",nil,750],
						["hgun_pistol_heavy_01_F",nil,6000],
						["optic_MRCO",nil,10000],
						["ToolKit",nil,50],
						["NVGoggles",nil,350],
						["Rangefinder",nil,5000],
						["itemgps",nil,50],
						["FirstAidKit",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};

			case (__GETC__(life_donator) == 2):
			{
				["Donator Store Rank  2",
					[
						["hgun_P07_F",nil,500],
						["hgun_PDW2000_F",nil,6500],
						["hgun_pistol_heavy_01_F",nil,6000],
						["arifle_Mk20C_plain_F",nil,45000],
						["optic_ACO_grn_smg",nil,750],
						["optic_MRCO",nil,10000],
						["NVGoggles",nil,350],
						["ToolKit",nil,100],
						["itemGPS",nil,100],
						["FirstAidKit",nil,25],
						["Rangefinder",nil,5000],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,85],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};

			case (__GETC__(life_donator) == 3):
			{
				["Mercenary Gun Store",
					[
						["hgun_P07_F",nil,5000],
						["hgun_PDW2000_F",nil,10000],
						["arifle_TRG21_F",nil,250000],
						["arifle_Mk20C_F",nil,100000],
						["arifle_Mk20_F",nil,125000],
						["arifle_Mk20_GL_F",nil,150000],
						["srifle_DMR_01_F",nil,250000],
						["srifle_EBR_F",nil,225000],
						["arifle_Katiba_F",nil,25000],
						["hgun_pistol_heavy_01_F",nil,12500],
						["hgun_ACPC2_F",nil,13500],
						["optic_ACO_grn",nil,7500],
						["optic_MRCO",nil,10000],
						["optic_LRPS",nil,50000],
						["optic_DMS",nil,25000],
						["Rangefinder",nil,15000],
						["SmokeShellGreen",nil,2500],
						["1Rnd_SmokeGreen_Grenade_shell",nil,5000],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_acp",nil,10000],
						["muzzle_snds_M",nil,30000],
						["muzzle_snds_H",nil,20000],
						["NVGoggles_INDEP",nil,2500],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_65x39_caseless_green",nil,750],
						["10Rnd_762x51_Mag",nil,750],
						["20Rnd_762x51_Mag",nil,750],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,85],
						["9Rnd_45ACP_Mag",nil,100],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
		    };
		};
	};
	
	case "genstore":
	{
		["Dion Wired",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ItemMap",nil,50],
				["ItemCompass",nil,50],
				["ItemWatch",nil,50],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,1500],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};

	case "uranium":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"You are not a civilian"};
            case (!license_civ_uranium): {"You do not have a uranium license"};
            default
            {
                ["Uranium Trader",
                    [
                        ["ToolKit",nil,200],
                        ["FirstAidKit",nil,100],
                        ["U_I_HeliPilotCoveralls","Anti-Radiation Suit",50000]
                    ]
                ];
            };
        };
    }; 
};

/*

		"srifle_LRR_F",
		"srifle_DMR_01_F",
		"srifle_EBR_F",
		"arifle_MX_F",
		"arifle_MXC_F",
		"arifle_MXM_F",
		"arifle_Katiba_F",
		"arifle_Katiba_C_F",
		"arifle_sdar_F",
		"arifle_Mk20_F",
		"LMG_Mk200_F",
		"hgun_P07_snds_F",
		"optic_Holosight",
		"acc_flashlight",
		"optic_Arco",
		"optic_MRCO",
		"optic_Holosight",
		"optic_Arco",
		"optic_Hamr",
		"optic_MRCO",
		"optic_Aco",
		"optic_DMS",
		"optic_LRPS",
		"optic_SOS",
		"arifle_Mk20C_F",
		"arifle_MX_Black_F",
		"arifle_MX_GL_Black_F",
		"arifle_MX_SW_Black_F",
		"arifle_MXC_Black_F",
		"arifle_MX_SW_F",
		"arifle_TRG20_F",
		"arifle_TRG21_F",
		"acc_flashlight",
		"acc_pointer_IR",
		"muzzle_snds_acp",
		"muzzle_snds_B",
		"muzzle_snds_H",
		"muzzle_snds_H_MG",
		"muzzle_snds_L",
		"muzzle_snds_M",
		"optic_Aco",
		"optic_ACO_grn",
		"optic_ACO_grn_smg",
		"optic_Aco_smg",
		"optic_Arco",
		"optic_DMS",
		"optic_Hamr",
		"optic_MRCO",
		"optic_SOS",
		"optic_LRPS"


*/
