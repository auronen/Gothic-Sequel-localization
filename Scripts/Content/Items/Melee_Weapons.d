//-------- Schwerter --------
const int Damage_Shortsword			= 20;	const int Value_Shortsword				= 50;	const int Str_Shortsword			= 20;
const int Damage_Longsword			= 50;	const int Value_Longsword				= 100;	const int Str_Longsword				= 30;
const int Damage_Broadsword			= 80;	const int Value_Broadsword				= 300;	const int Str_Broadsword			= 50;
const int Damage_Bastardsword		= 90;	const int Value_Bastardsword			= 500;	const int Str_Bastardsword			= 70;
const int Damage_2HSword			= 120;	const int Value_2HSword					= 1000;	const int Str_2HSword				= 90;
const int Damage_OrcSword			= 150;	const int Value_OrcSword				= 5000;	const int Str_OrcSword				= 100;

//-------- Äxte --------
const int Damage_Hatchet			= 30;	const int Value_Hatchet					= 100;	const int Str_Hatchet				= 30;
const int Damage_Battleaxe			= 60;	const int Value_Battleaxe				= 200;	const int Str_Battleaxe				= 60;
const int Damage_DoublebladedAxe	= 100;	const int Value_DoublebladedAxe			= 500;	const int Str_DoublebladedAxe		= 120;
const int Damage_BerserkAxe			= 130;	const int Value_BerserkAxe				= 1000;	const int Str_BerserkAxe			= 150;
const int Damage_OrcAxe				= 160;	const int Value_OrcAxe					= 5000;	const int Str_OrcAxe				= 175;

//-------- Stumpfwaffen --------
const int Damage_IronClub			= 40;	const int Value_IronClub				= 100;	const int Str_IronClub				= 30;
const int Damage_Mace				= 70;	const int Value_Mace					= 200;	const int Str_Mace					= 75;
const int Damage_Morningstar		= 110;	const int Value_Morningstar				= 500;	const int Str_Morningstar			= 125;
const int Damage_Warhammer			= 140;	const int Value_Warhammer				= 1000;	const int Str_Warhammer				= 175;
const int Damage_OrcHammer			= 170;	const int Value_OrcHammer				= 5000;	const int Str_OrcHammer				= 200;

//-------- Erz --------
const int Damage_BloodOre			= 100;	const int Value_BloodOre				= 100;	const int Str_BloodOre				= 100;
const int Damage_DarkOre			= 100;	const int Value_DarkOre					= 100;	const int Str_DarkOre				= 100;

//-------- Kampfstäbe --------
const int Damage_Battlestaff		= 100;	const int Value_Battlestaff				= 1000;	const int Str_Battlestaff			= 100;	const int Dex_Battlestaff				= 100;

//-------- provisorische Waffen --------
const int Damage_Club				= 10;	const int Value_Club					= 10;	const int Str_Club					= 10;
const int Damage_Poker				= 10;	const int Value_Poker					= 10;	const int Str_Poker					= 10;
const int Damage_Sickle				= 10;	const int Value_Sickle					= 10;	const int Str_Sickle				= 10;
const int Damage_Pickaxe			= 10;	const int Value_Pickaxe					= 10;	const int Str_Pickaxe				= 10;
const int Damage_Sledgehammer		= 10;	const int Value_Sledgehammer			= 100;	const int Str_Sledgehammer			= 10;
const int Damage_Scythe				= 10;	const int Value_Scythe					= 10;	const int Str_Scythe				= 10;
const int Damage_RustySword			= 10;	const int Value_RustySword				= 10;	const int Str_RustySword			= 10;
const int Damage_WitheredAxe		= 10;	const int Value_WitheredAxe				= 10;	const int Str_WitheredAxe			= 10;
const int Damage_Nailmace			= 10;	const int Value_Nailmace				= 10;	const int Str_Nailmace				= 10;
const int Damage_NotchedMace		= 10;	const int Value_NotchedMace				= 10;	const int Str_NotchedMace			= 10;

//-------- Gildenwaffen --------
const int Damage_MilitiaSword		= 50;	const int Value_MilitiaSword			= 10;	const int Str_MilitiaSword			= 30;
const int Damage_PaladinSword		= 120;	const int Value_PaladinSword			= 100;	const int Str_PaladinSword			= 90;
const int Damage_DemonHunterAxe		= 130;	const int Value_DemonHunterAxe			= 100;	const int Str_DemonHunterAxe		= 150;
const int Damage_AuxiliaryMace		= 70;	const int Value_AuxiliaryMace			= 20;	const int Str_AuxiliaryMace			= 60;

//////////////////////////////////////////////////////////////////////////////////
//	B_CalcValue
//////////////////////////////////////////////////////////////////////////////////
func int B_CalcValue(var int value, var int percentage)
{
	return ((value * percentage) / 100);
};

//////////////////////////////////////////////////////////////////////////////////
//	B_CalcDamage
//////////////////////////////////////////////////////////////////////////////////
func int B_CalcDamage(var int damage, var int percentage)
{
	return ((damage * percentage) / 100);
};

//////////////////////////////////////////////////////////////////////////////////
//	B_CalcStr
//////////////////////////////////////////////////////////////////////////////////
func int B_CalcStr(var int str, var int percentage)
{
	return ((str * percentage) / 100);
};

//*********************************************************************************
//
//
//		S C H W E R T E R
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Kurzschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Shortsword(C_Item)
{
	name						= NAME_Shortsword;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_SWD | ITEM_MULTI;

	visual						= "ItMw_1H_Sword_Short_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Shortsword;

	damageTotal					= Damage_Shortsword;
	damageType					= DAM_EDGE;
	range						= 100;

	value						= Value_Shortsword;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Langschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Longsword(C_Item)
{
	name						= NAME_Longsword;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_SWD | ITEM_MULTI;

	visual						= "ItMw_1H_Sword_Long_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Longsword;

	damageTotal					= Damage_Longsword;
	damageType					= DAM_EDGE;
	range						= 120;

	value						= Value_Longsword;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Breitschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Broadsword(C_Item)
{
	name						= NAME_Broadsword;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_SWD | ITEM_MULTI;

	visual						= "ItMw_1H_Sword_Broad_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Broadsword;

	damageTotal					= Damage_Broadsword;
	damageType					= DAM_EDGE;
	range						= 130;

	value						= Value_Broadsword;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Bastardschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Bastardsword(C_Item)
{
	name						= NAME_Bastardsword;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_SWD | ITEM_MULTI;

	visual						= "ItMw_1H_Sword_Bastard_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Bastardsword;

	damageTotal					= Damage_Bastardsword;
	damageType					= DAM_EDGE;
	range						= 130;

	value						= Value_Bastardsword;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Zweihänder
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_2HSword(C_Item)
{
	name						= NAME_2HSword;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_SWD | ITEM_MULTI;

	visual						= "ItMw_2H_Sword_Heavy_02.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_2HSword;

	damageTotal					= Damage_2HSword;
	damageType					= DAM_EDGE;
	range						= 150;

	value						= Value_2HSword;

	description					= name;
	text[0]						= NAME_TypeTwoHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Orkschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Orcsword(C_Item)
{
	name						= NAME_Orcsword;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_SWD | ITEM_MULTI;

	visual						= "ItMw_2H_OrcSword_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_OrcSword;

	damageTotal					= Damage_OrcSword;
	damageType					= DAM_EDGE;
	range						= 150;

	value						= Value_OrcSword;

	description					= name;
	text[0]						= NAME_TypeTwoHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//*********************************************************************************
//
//
//		Ä X T E
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Beil
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Hatchet(C_Item)
{
	name						= NAME_Hatchet;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE | ITEM_MULTI;

	visual						= "ItMw_1H_Hatchet_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Hatchet;

	damageTotal					= Damage_Hatchet;
	damageType					= DAM_EDGE;
	range						= 100;

	value						= Value_Hatchet;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Streitaxt
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Battleaxe(C_Item)
{
	name						= NAME_Battleaxe;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE | ITEM_MULTI;

	visual						= "ItMw_1H_Axe_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Battleaxe;

	damageTotal					= Damage_Battleaxe;
	damageType					= DAM_EDGE;
	range						= 100;

	value						= Value_Battleaxe;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Doppelblattaxt
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_DoublebladedAxe(C_Item)
{
	name						= NAME_DoublebladedAxe;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_AXE | ITEM_MULTI;

	visual						= "ItMw_2H_Axe_heavy_03.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_DoublebladedAxe;

	damageTotal					= Damage_DoublebladedAxe;
	damageType					= DAM_EDGE;
	range						= 150;

	value						= Value_DoublebladedAxe;

	description					= name;
	text[0]						= NAME_TypeTwoHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Berserkeraxt
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_BerserkAxe(C_Item)
{
	name						= NAME_BerserkAxe;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_AXE | ITEM_MULTI;

	visual						= "ItMw_2H_Axe_Heavy_04.3DS";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_BerserkAxe;

	damageTotal					= Damage_BerserkAxe;
	damageType					= DAM_EDGE;
	range						= 150;

	value						= Value_BerserkAxe;

	description					= name;
	text[0]						= NAME_TypeTwoHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Orkaxt
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Orcaxe(C_Item)
{
	name						= NAME_Orcaxe;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_AXE | ITEM_MULTI;

	visual						= "ItMw_2H_OrcAxe_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_OrcAxe;

	damageTotal					= Damage_OrcAxe;
	damageType					= DAM_EDGE;
	range						= 150;

	value						= Value_OrcAxe;

	description					= name;
	text[0]						= NAME_TypeTwoHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//*********************************************************************************
//
//
//		S T U M P F W A F F E N
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Eisenkeule
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_IronClub(C_Item)
{
	name						= NAME_IronClub;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE | ITEM_MULTI;

	visual						= "ItMw_1H_Mace_Light_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_IronClub;

	damageTotal					= Damage_IronClub;
	damageType					= DAM_BLUNT;
	range						= 100;

	value						= Value_IronClub;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Streitkolben
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Mace(C_Item)
{
	name						= NAME_Mace;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE | ITEM_MULTI;

	visual						= "ItMw_1H_Mace_War_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Mace;

	damageTotal					= Damage_Mace;
	damageType					= DAM_BLUNT;
	range						= 100;

	value						= Value_Mace;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Morgenstern
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Morningstar(C_Item)
{
	name						= NAME_Morningstar;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE | ITEM_MULTI;

	visual						= "ItMw_1H_Mace_02.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Morningstar;

	damageTotal					= Damage_Morningstar;
	damageType					= DAM_BLUNT;
	range						= 100;

	value						= Value_Morningstar;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Kriegshammer
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Warhammer(C_Item)
{
	name						= NAME_Warhammer;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_AXE | ITEM_MULTI;

	visual						= "ItMw_2H_OrcMace_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Warhammer;

	damageTotal					= Damage_Warhammer;
	damageType					= DAM_BLUNT;
	range						= 100;

	value						= Value_Warhammer;

	description					= name;
	text[0]						= NAME_TypeTwoHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Orkhammer
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_OrcHammer(C_Item)
{
	name						= NAME_OrcHammer;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_AXE | ITEM_MULTI;

	visual						= "ItMw_2H_OrcMace_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_OrcHammer;

	damageTotal					= Damage_OrcHammer;
	damageType					= DAM_BLUNT;
	range						= 150;

	value						= Value_OrcHammer;

	description					= name;
	text[0]						= NAME_TypeTwoHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//*********************************************************************************
//
//
//		PROVISORISCHE WAFFEN
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Keule
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Club(C_Item)
{
	name						= NAME_Club;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE;

	visual						= "ItMw_1H_Club_01.3DS";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Club;

	damageTotal					= Damage_Club;
	damageType					= DAM_BLUNT;
	range						= 100;

	value						= Value_Club;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Schürhaken
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Poker(C_Item)
{
	name						= NAME_Poker;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_SWD;

	visual						= "ItMw_1H_Poker_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Poker;

	damageTotal					= Damage_Poker;
	damageType					= DAM_BLUNT;
	range						= 100;

	value						= Value_Poker;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Sichel
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Sickle(C_Item)
{
	name						= NAME_Sickle;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE;

	visual						= "ItMw_1H_Sickle_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Sickle;

	damageTotal					= Damage_Sickle;
	damageType					= DAM_EDGE;
	range						= 100;

	value						= Value_Sickle;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Spitzhacke
//	- Auch für Mobsi-Benutzung (PickOre)
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Pickaxe(C_Item)
{
	name						= NAME_Pickaxe;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_AXE;

	visual						= "ItMw_2H_Pickaxe_01.3DS";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Pickaxe;

	damageTotal					= Damage_Pickaxe;
	damageType					= DAM_EDGE;
	range						= 100;

	value						= Value_Pickaxe;

	description					= name;
	text[0]						= NAME_TypeTwoHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItMw_BloodPickaxe(C_Item)
{
	name						= NAME_Pickaxe;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_AXE;

	visual						= "ItMw_2H_Pickaxe_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= B_CalcStr(Str_Pickaxe, Str_BloodOre);

	damageTotal					= B_CalcDamage(Damage_Pickaxe, Damage_BloodOre);
	damageType					= DAM_EDGE;
	range						= 100;

	value						= B_CalcValue(Value_Pickaxe, Value_BloodOre);

	description					= name;
	text[0]						= NAME_TypeTwoHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Schmiedehammer
//	- Auch für Mobsi-Benutzung (Schmieden)
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Sledgehammer(C_Item)
{
	name						= NAME_Sledgehammer;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE;

	visual						= "ItMw_1H_Sledgehammer_01.3DS";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Sledgehammer;

	damageTotal					= Damage_Sledgehammer;
	damageType					= DAM_BLUNT;
	range						= 100;

	value						= Value_Sledgehammer;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Sense
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Scythe(C_Item)
{
	name						= NAME_Scythe;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE;

	visual						= "ItMw_1H_Scythe_01.3DS";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Scythe;

	damageTotal					= Damage_Scythe;
	damageType					= DAM_EDGE;
	range						= 100;

	value						= Value_Scythe;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	rostiges Schwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_RustySword(C_Item)
{
	name						= "Rostiges Schwert";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_SWD;

	visual						= "ItMw_1H_Sword_Old_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_RustySword;

	damageTotal					= Damage_RustySword;
	damageType					= DAM_EDGE;
	range						= 100;

	value						= Value_RustySword;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= NAME_TypeOneHanded;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Nagelkeule
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Nailmace(C_Item)
{
	name						= "Nagelkeule";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE;

	visual						= "ItMw_1H_Nailmace_01.3DS";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Nailmace;

	damageTotal					= Damage_Nailmace;
	damageType					= DAM_BLUNT;
	range						= 100;

	value						= Value_Nailmace;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= NAME_TypeOneHanded;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Verwitterte Axt
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_WitheredAxe(C_Item)
{
	name						= "Verwitterte Axt";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE;

	visual						= "ItMw_1H_Axe_Old_01.3DS";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_WitheredAxe;

	damageTotal					= Damage_WitheredAxe;
	damageType					= DAM_EDGE;
	range						= 100;

	value						= Value_WitheredAxe;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= NAME_TypeOneHanded;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Schartiger Streitkolben
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_NotchedMace(C_Item)
{
	name						= "schartiger Streitkolben";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE;

	visual						= "ItMw_1H_Mace_01.3DS";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_NotchedMace;

	damageTotal					= Damage_NotchedMace;
	damageType					= DAM_BLUNT;
	range						= 100;

	value						= Value_NotchedMace;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= NAME_TypeOneHanded;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//*********************************************************************************
//
//
//		K A M P F S T Ä B E
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Kampfstab
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_BattleStaff(C_Item)
{
	name						= NAME_Battlestaff;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_STAFF;

	visual						= "ItMw_2H_StaffLong_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_atr[1]					= ATR_DEXTERITY;
	cond_value[0]				= Str_BattleStaff;
	cond_value[1]				= Dex_BattleStaff;

	damageTotal					= Damage_Battlestaff;
	damageType					= DAM_BLUNT;
	range						= 250;

	value						= Value_Battlestaff;

	description					= name;
	text[0]						= NAME_TypeStaff;								count[0] = 0;
	text[1]						= NAME_Damage;									count[1] = damageTotal;
	text[2]						= NAME_Str_needed;								count[2] = cond_value[0];
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[1];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//*********************************************************************************
//
//
//		G i l d e n  -   W A F F E N
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Milizschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_MilitiaSword(C_Item)
{
	name						= NAME_MilitiaSword;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_SWD | ITEM_MULTI;

	visual						= "ItMw_1H_Sword_Long_02.3DS";
	material					= MAT_METAL;

	ownerGuild					= GIL_MILITIA;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_MilitiaSword;

	damageTotal					= Damage_MilitiaSword;
	damageType					= DAM_EDGE;
	range						= 120;

	value						= Value_MilitiaSword;

	description					= name;
	text[0]						= "Nur Milizsoldaten tragen diese Art";			count[0] = 0;
	text[1]						= "der Langschwerter.";							count[1] = 0;
	text[2]						= NAME_TypeOneHanded;							count[2] = 0;
	text[3]						= NAME_Damage;									count[3] = damageTotal;
	text[4]						= NAME_Str_needed;								count[4] = cond_value[0];
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Paladin-Zweihänder
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_PaladinSword(C_Item)
{
	name						= NAME_PaladinSword;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_SWD | ITEM_MULTI;

	visual						= "ItMw_2H_Sword_Heavy_03.3DS";
	material					= MAT_METAL;

	ownerGuild					= GIL_PALADIN;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_PaladinSword;

	damageTotal					= Damage_PaladinSword;
	damageType					= DAM_EDGE;
	range						= 150;

	value						= Value_PaladinSword;

	description					= name;
	text[0]						= "Nur die Paladine des Königs tragen";			count[0] = 0;
	text[1]						= "solche zweihändigen Schwerter.";				count[1] = 0;
	text[2]						= NAME_TypeTwoHanded;							count[2] = 0;
	text[3]						= NAME_Damage;									count[3] = damageTotal;
	text[4]						= NAME_Str_needed;								count[4] = cond_value[0];
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Dämonenjäger-Axt
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_DemonhunterAxe(C_Item)
{
	name						= NAME_DemonhunterAxe;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_AXE | ITEM_MULTI;

	visual						= "ItMw_2H_Axe_Heavy_02.3DS";
	material					= MAT_WOOD;

	ownerGuild					= GIL_DEMONHUNTER;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_DemonhunterAxe;

	damageTotal					= Damage_DemonhunterAxe;
	damageType					= DAM_EDGE;
	range						= 150;

	value						= Value_DemonhunterAxe;

	description					= name;
	text[0]						= "Die Dämonenjäger führen solche";				count[0] = 0;
	text[1]						= "wuchtigen Zweihandäxte.";					count[1] = 0;
	text[2]						= NAME_TypeTwoHanded;							count[2] = 0;
	text[3]						= NAME_Damage;									count[3] = damageTotal;
	text[4]						= NAME_Str_needed;								count[4] = cond_value[0];
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Streitkolben der Hilfstruppen
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_AuxiliaryMace(C_Item)
{
	name						= NAME_AuxiliaryMace;

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE | ITEM_MULTI;

	visual						= "ItMw_1H_Mace_War_02.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_AuxiliaryMace;

	damageTotal					= Damage_AuxiliaryMace;
	damageType					= DAM_EDGE;
	range						= 100;

	value						= Value_AuxiliaryMace;

	description					= name;
	text[0]						= "Ein Streitkolben wie sie die";				count[0] = 0;
	text[1]						= "Hilfstruppen des Königs tragen.";			count[1] = 0;
	text[2]						= NAME_TypeOneHanded;							count[2] = damageTotal;
	text[3]						= NAME_Damage;									count[3] = cond_value[0];
	text[4]						= NAME_Str_needed;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//*********************************************************************************
//
//
//		p e r s ö n l i c h e     W A F F E N
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Grims Spitzhacke
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Grim_Pickaxe(C_Item)
{
	name						= "Grim's Spitzhacke";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_AXE;

	owner						= MIN_306_Grim;
	visual						= "ItMw_2H_Pickaxe_01.3DS";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Pickaxe;

	damageTotal					= Damage_Pickaxe;
	damageType					= DAM_EDGE;
	range						= 100;

	value						= Value_Pickaxe;

	description					= name;
	text[0]						= NAME_TypeTwoHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Goliath's Schmiedehammer
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Goliath_Sledgehammer(C_Item)
{
	name						= "Goliath's Schmiedehammer";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE;

	owner						= WRK_216_Goliath;
	visual						= "ItMw_1H_Sledgehammer_01.3DS";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Sledgehammer;

	damageTotal					= Damage_Sledgehammer;
	damageType					= DAM_BLUNT;
	range						= 100;

	value						= Value_Sledgehammer;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Brutus' Langschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Brutus_Longsword(C_Item)
{
	name						= "Brutus' Langschwert";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_SWD | ITEM_MULTI;

	owner						= MIL_121_Brutus;
	visual						= "ItMw_1H_Sword_Long_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Longsword;

	damageTotal					= Damage_Longsword;
	damageType					= DAM_EDGE;
	range						= 120;

	value						= Value_Longsword;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Malgar's Breitschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Malgar_Broadsword(C_Item)
{
	name						= "Malgar's Breitschwert";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_SWD | ITEM_MULTI;

	owner						= DMH_1302_Malgar;
	visual						= "ItMw_1H_Sword_Broad_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Broadsword;

	damageTotal					= Damage_Broadsword;
	damageType					= DAM_EDGE;
	range						= 130;

	value						= Value_Broadsword;

	description					= name;
	text[0]						= NAME_TypeOneHanded;							count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Thora's Kampfstab
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Thora_BattleStaff(C_Item)
{
	name						= "Thora's Kampfstab";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_STAFF;

	owner						= AMZ_900_Thora;
	visual						= "ItMw_2H_StaffLong_01.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_atr[1]					= ATR_DEXTERITY;
	cond_value[0]				= Str_BattleStaff / 2;
	cond_value[1]				= Dex_BattleStaff / 2;

	damageTotal					= Damage_Battlestaff;
	damageType					= DAM_BLUNT;
	range						= 250;

	value						= Value_Battlestaff;

	description					= name;
	text[0]						= NAME_TypeStaff;								count[0] = 0;
	text[1]						= NAME_Damage;									count[1] = damageTotal;
	text[2]						= NAME_Str_needed;								count[2] = cond_value[0];
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[1];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Kurzschwert des Arenameisters
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Arenamaster_Sword(C_Item)
{
	name						= "Gladiatorenzucht";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_SWD | ITEM_MULTI;

	owner						= MIL_122_Arenamaster;
	visual						= "ItMw_1H_Sword_Short_05.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Shortsword;

	damageTotal					= Damage_Shortsword;
	damageType					= DAM_EDGE;
	range						= 100;

	value						= Value_Shortsword;

	description					= name;
	text[0]						= "Die persönliche Waffe des Arenameisters";	count[0] = 0;
	text[1]						= "ist eher eine Zierwaffe als alles andere.";	count[1] = 0;
	text[2]						= NAME_TypeOneHanded;							count[2] = 0;
	text[3]						= NAME_Damage;									count[3] = damageTotal;
	text[4]						= NAME_Str_needed;								count[4] = cond_value[0];
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Diego's Langschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Diego_Sword(C_Item)
{
	name						= "Brutus' Langschwert";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_SWD | ITEM_MULTI;

	owner						= MIL_121_Brutus;
	visual						= "ItMw_1H_Sword_Long_05.3DS";
	material					= MAT_METAL;

	cond_atr[0]					= ATR_STRENGTH;
	cond_value[0]				= Str_Longsword;

	damageTotal					= Damage_Longsword;
	damageType					= DAM_EDGE;
	range						= 120;

	value						= Value_Longsword;

	description					= name;
	text[0]						= "Diego's Langschert ist schlicht aber";		count[0] = 0;
	text[1]						= "präzise. Die Waffe eines Meisters.";			count[1] = 0;
	text[2]						= NAME_TypeOneHanded;							count[2] = 0;
	text[3]						= NAME_Damage;									count[3] = damageTotal;
	text[4]						= NAME_Str_needed;								count[4] = cond_value[0];
	text[5]						= NAME_Value;									count[5] = value;
};
