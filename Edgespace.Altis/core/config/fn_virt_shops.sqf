/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "artifact": {["Altis Artifact Trader",["stonetablet","carvedstone","valuablecoins","pottery"]]};
	case "market": {["Market",["water","rabbit","apple","storagebig","storagesmall","redgull","battery","tbacon","lockpick","pickaxe","zipties","peach","boltcutter","blastingcharge","gpstracker","tentciv"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge","gpstracker"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "turtledealer": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana","methp"]]};
	case "fishmarket": {["CTFM Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r"]]};
	case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "cop": {["Police Item Store",["donuts","coffee","spikeStrip","mauer","battery","painkillers","redgull","defusekit","gpstracker"]]};
	case "cement": {["Cement Dealer",["cement"]]};
	case "liquorstore": {["Liquior Store",["wine","bottledbeer","bottledwhiskey"]]};
	case "pharmacy": {["Dis-Chem Pharmacy",["painkillers","morphium","scalpel"]]};
	case "medic": {["Medic Store",["apple","donuts","coffee","battery","redgull","fuelF"]]};
	case "bootlegger": {["Boot Legger's",["bottledshine","bottledbeer"]]};
	case "bar": {["The Lounge",["bottles","cornmeal","wine","bottledwhiskey","bottledbeer"]]};
	case "uranium": {["Uranium",["uranium","puranium"]]};
	case "organ": {["Organ Dealer",["kidney"]]};
	case "gold": {["Gold Trader",["goldingot"]]};
	case "platinum": {["Platinum Trader",["platingot"]]};
};