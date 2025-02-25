//-------- Bögen --------
const int Damage_ShortBow		= 10;	const int Value_ShortBow		= 100;	const int Dex_ShortBow			= 20;
const int Damage_RiderBow		= 15;	const int Value_RiderBow		= 150;	const int Dex_RiderBow			= 25;
const int Damage_FieldBow		= 20;	const int Value_FieldBow		= 200;	const int Dex_FieldBow			= 30;
const int Damage_HuntingBow		= 25;	const int Value_HuntingBow		= 250;	const int Dex_HuntingBow		= 35;
const int Damage_LongBow		= 30;	const int Value_LongBow			= 300;	const int Dex_LongBow			= 40;
const int Damage_HedgeBow		= 35;	const int Value_HedgeBow		= 400;	const int Dex_HedgeBow			= 45;
const int Damage_YewBow			= 40;	const int Value_YewBow			= 500;	const int Dex_YewBow			= 50;
const int Damage_ArmyBow		= 45;	const int Value_ArmyBow			= 750;	const int Dex_ArmyBow			= 60;
const int Damage_WarBow			= 50;	const int Value_WarBow			= 1000;	const int Dex_WarBow			= 80;
const int Damage_StormBow		= 60;	const int Value_StormBow		= 1500;	const int Dex_StormBow			= 100;

//-------- Armbrüste --------
const int Damage_LightCrossbow	= 40;	const int Value_LightCrossbow	= 750;	const int Dex_LightCrossbow		= 40;
const int Damage_Crossbow		= 50;	const int Value_Crossbow		= 1000;	const int Dex_Crossbow			= 50;
const int Damage_HeavyCrossbow	= 60;	const int Value_HeavyCrossbow	= 1500;	const int Dex_HeavyCrossbow		= 60;
const int Damage_WarCrossbow	= 70;	const int Value_WarCrossbow		= 2000;	const int Dex_WarCrossbow		= 70;

//KURZBOGEN//
instance ItRw_ShortBow(C_Item)
{
	name						= NAME_ShortBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW | ITEM_MULTI;

	munition					= ItAm_Arrow;

	visual						= "ItRw_Bow_Small_01.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_Shortbow;

	damageTotal					= Damage_Shortbow;
	damageType					= DAM_POINT;

	value						= Value_Shortbow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeBow;									count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItRw_RiderBow(C_Item)
{
	name						= NAME_RiderBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW | ITEM_MULTI;

	munition					= ItAm_Arrow;

	visual						= "ItRw_Bow_Small_02.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_RiderBow;

	damageTotal					= Damage_RiderBow;
	damageType					= DAM_POINT;

	value						= Value_RiderBow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeBow;									count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItRw_FieldBow(C_Item)
{
	name						= NAME_FieldBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW | ITEM_MULTI;

	munition					= ItAm_Arrow;

	visual						= "ItRw_Bow_Small_03.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_FieldBow;

	damageTotal					= Damage_FieldBow;
	damageType					= DAM_POINT;

	value						= Value_FieldBow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeBow;									count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItRw_HuntingBow(C_Item)
{
	name						= NAME_HuntingBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW | ITEM_MULTI;

	munition					= ItAm_Arrow;

	visual						= "ItRw_Bow_Small_04.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_HuntingBow;

	damageTotal					= Damage_HuntingBow;
	damageType					= DAM_POINT;

	value						= Value_HuntingBow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeBow;									count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
//LANGBOGEN//
/******************************************************************************************/
instance ItRw_LongBow(C_Item)
{
	name						= NAME_LongBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW | ITEM_MULTI;

	munition					= ItAm_Arrow;

	visual						= "ItRw_Bow_Long_01.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_LongBow;

	damageTotal					= Damage_LongBow;
	damageType					= DAM_POINT;

	value						= Value_LongBow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeBow;									count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItRw_HedgeBow(C_Item)
{
	name						= NAME_HedgeBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW | ITEM_MULTI;

	munition					= ItAm_Arrow;

	visual						= "ItRw_Bow_Long_02.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_HedgeBow;

	damageTotal					= Damage_HedgeBow;
	damageType					= DAM_POINT;

	value						= Value_HedgeBow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeBow;									count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItRw_YewBow(C_Item)
{
	name						= NAME_YewBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW | ITEM_MULTI;

	munition					= ItAm_Arrow;

	visual						= "ItRw_Bow_Long_03.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_YewBow;

	damageTotal					= Damage_YewBow;
	damageType					= DAM_POINT;

	value						= Value_YewBow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeBow;									count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItRw_ArmyBow(C_Item)
{
	name						= NAME_ArmyBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW | ITEM_MULTI;

	munition					= ItAm_Arrow;

	visual						= "ItRw_Bow_Long_07.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_ArmyBow;

	damageTotal					= Damage_ArmyBow;
	damageType					= DAM_POINT;

	value						= Value_ArmyBow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeBow;									count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
//KRIEGSBOGEN//
/******************************************************************************************/
instance ItRw_WarBow(C_Item)
{
	name						= NAME_WarBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW;

	munition					= ItAm_Arrow;

	visual						= "ItRw_Bow_War_01.mms";
	material					= MAT_WOOD | ITEM_MULTI;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_WarBow;

	damageTotal					= Damage_WarBow;
	damageType					= DAM_POINT;

	value						= Value_WarBow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeBow;									count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItRw_StormBow(C_Item)
{
	name						= NAME_StormBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW | ITEM_MULTI;

	munition					= ItAm_Arrow;

	visual						= "ItRw_Bow_War_03.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_StormBow;

	damageTotal					= Damage_StormBow;
	damageType					= DAM_POINT;

	value						= Value_StormBow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeBow;									count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
//ARMBRUST//
/******************************************************************************************/
instance ItRw_LightCrossBow(C_Item)
{
	name						= NAME_LightCrossBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_CROSSBOW | ITEM_MULTI;

	munition					= ItAm_Bolt;

	visual						= "ItRwCrossbow1.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_LightCrossbow;

	damageTotal					= Damage_LightCrossbow;
	damageType					= DAM_POINT;

	value						= Value_LightCrossbow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeCrossbow;							count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItRw_CrossBow(C_Item)
{
	name						= NAME_CrossBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_CROSSBOW | ITEM_MULTI;

	munition					= ItAm_Bolt;

	visual						= "ItRwCrossbow2.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_Crossbow;

	damageTotal					= Damage_Crossbow;
	damageType					= DAM_POINT;

	value						= Value_Crossbow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeCrossbow;							count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItRw_HeavyCrossBow(C_Item)
{
	name						= NAME_HeavyCrossBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_CROSSBOW | ITEM_MULTI;

	munition					= ItAm_Bolt;

	visual						= "ItRwCrossbow3.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_HeavyCrossbow;

	damageTotal					= Damage_HeavyCrossbow;
	damageType					= DAM_POINT;

	value						= Value_HeavyCrossbow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeCrossbow;							count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItRw_WarCrossBow(C_Item)
{
	name						= NAME_WarCrossBow;

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_CROSSBOW | ITEM_MULTI;

	munition					= ItAm_Bolt;

	visual						= "ItRwCrossbow4.mms";
	material					= MAT_WOOD;

	cond_atr[0]					= ATR_DEXTERITY;
	cond_value[0]				= Dex_WarCrossbow;

	damageTotal					= Damage_WarCrossbow;
	damageType					= DAM_POINT;

	value						= Value_WarCrossbow;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_TypeCrossbow;							count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[0];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
//MUNITION//
/******************************************************************************************/
instance ItAm_Arrow(C_Item)
{
	name						= NAME_Arrow;

	mainflag					= ITEM_KAT_MUN;
	flags						= ITEM_BOW | ITEM_MULTI;

	visual						= "ItAm_Arrow_01.3ds";
	material					= MAT_WOOD;

	value						= 1;

	description					= name;
	//text[0]					= "";											count[0] = ;
	//text[1]					= "";											count[1] = ;
	//text[2]					= NAME_Damage;									count[2] = damageTotal;
	//text[3]					= NAME_Dex_needed;								count[3] = cond_value[0];
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItAm_Bolt(C_Item)
{
	name						= NAME_Bolt;

	mainflag					= ITEM_KAT_MUN;
	flags						= ITEM_CROSSBOW | ITEM_MULTI;

	visual						= "ItAm_Bolt_01.3ds";
	material					= MAT_WOOD;

	value						= 1;

	description					= name;
	//text[0]					= "";											count[0] = ;
	//text[1]					= "";											count[1] = ;
	//text[2]					= NAME_Damage;									count[2] = damageTotal;
	//text[3]					= NAME_Dex_needed;								count[3] = cond_value[0];
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/********************************************************************************/
// Orc-Schamane (wird im Magiemodus zur Visulaisierung benutzt)
instance ItRwOrcstaff(C_Item)
{
	name						= "Grachtnakk";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_AXE;

	visual						= "ItRw_2H_Orcstaff_01.3DS";
	material					= MAT_WOOD;

	damageTotal					= 0;
	damageType					= DAM_BLUNT;

	value						= 0;

	description					= name;
	//text[0]					= "";											count[0] = ;
	//text[1]					= "";											count[1] = ;
	//text[2]					= NAME_Damage;									count[2] = damageTotal;
	//text[3]					= NAME_Dex_needed;								count[3] = cond_value[0];
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/********************************************************************************/
// Untoter Orc-Priester (wird im Magiemodus zur Visulaisierung benutzt)
instance ItRwUdOrcstaff(C_Item)
{
	name						= "ShaBaNakk";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_AXE;

	visual						= "ItRw_2H_Orcstaff_01.3DS";
	material					= MAT_WOOD;

	damageTotal					= 0;
	damageType					= DAM_BLUNT;

	value						= 0;

	description					= name;
	//text[0]					= "";											count[0] = ;
	//text[1]					= "";											count[1] = ;
	//text[2]					= NAME_Damage;									count[2] = damageTotal;
	//text[3]					= NAME_Dex_needed;								count[3] = cond_value[0];
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};
