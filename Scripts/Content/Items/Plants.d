//#################################################################################################
//##
//##	Heilwirkung und Kosten von Pflanzen
//##
//#################################################################################################

// alchemistisch genutzte Pflanzen
const int Value_MoutainMoss		= 2;	const int HP_MoutainMoss		= 5;
const int Value_Stoneroot		= 2;	const int HP_Stoneroot			= 0;
const int Value_BloodThistle	= 2;	const int HP_BloodThistle		= -10;
const int Value_OrcLeaf			= 2;	const int Mana_OrcLeaf			= 1;
const int Value_RavenHerb		= 10;	const int Mana_RavenHerb		= 3;
const int Value_Nightshade		= 25;	const int Mana_Nightshade		= 10;

// beim Kochen benutzte Pflanzen
const int Value_CaveMushroom	= 2;	const int HP_CaveMushroom		= 10;
const int Value_Swampweed		= 5;	const int Mana_Swampweed		= 5;

// sonstige Pflanzen
const int Value_Woodberry		= 3;	const int HP_Woodberry			= 20;
const int Value_Flameberry		= 6;	const int HP_Flameberry			= 40;
const int Value_Trollberry		= 10;	const int HP_Trollberry			= -1000;

//#################################################################################################
//##
//##	alchemistisch genutzte Pflanzen
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Bergmoos
//////////////////////////////////////////////////////////////////////////////////
instance ItPl_MountainMoss(C_Item)
{
	name						= NAME_MountainMoss;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Plants_mountainmoos_01.3ds";
	material					= MAT_WOOD;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MoutainMoss;

	scemeName					= "FOOD";
	on_state[0]					= UseMountainMoss;

	value						= Value_MoutainMoss;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MoutainMoss;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseMountainMoss()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseMountainMoss");
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MoutainMoss);
};

//////////////////////////////////////////////////////////////////////////////////
//	Steinwurzel
//////////////////////////////////////////////////////////////////////////////////
instance ItPl_Stoneroot(C_Item)
{
	name						= NAME_Stoneroot;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Plants_Stoneroot_01.3ds";
	material					= MAT_WOOD;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Stoneroot;

	scemeName					= "FOOD";
	on_state[0]					= UseStoneroot;

	value						= Value_Stoneroot;

	description					= name;
	text[0]						= "Diese Pflanze wirkt wie ein starkes";		count[0] = 0;
	text[1]						= "Schlafmittel!";								count[1] = HP_Stoneroot;
	text[2]						= "";											count[2] = 0;
	text[3]						= NAME_Bonus_HP;								count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseStoneroot()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseStoneroot");
	AI_StartState(self, ZS_Unconscious, 1, "");
};

//////////////////////////////////////////////////////////////////////////////////
//	Blutdistel
//////////////////////////////////////////////////////////////////////////////////
instance ItPl_BloodThistle(C_Item)
{
	name						= NAME_BloodThistle;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Plants_Seraphis_01.3ds";
	material					= MAT_WOOD;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_BloodThistle;

	scemeName					= "FOOD";
	on_state[0]					= UseBloodThistle;

	value						= Value_BloodThistle;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_BloodThistle;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseBloodThistle()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseBloodThistle");
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_BloodThistle);
};

//////////////////////////////////////////////////////////////////////////////////
//	Orkblatt
//////////////////////////////////////////////////////////////////////////////////
instance ItPl_OrcLeaf(C_Item)
{
	name						= NAME_OrcLeaf;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Plants_Herb_01.3ds";
	material					= MAT_WOOD;

	change_atr[0]				= ATR_MANA; change_value[0] = Mana_OrcLeaf;

	scemeName					= "FOOD";
	on_state[0]					= UseOrcLeaf;

	value						= Value_OrcLeaf;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Mana;								count[1] = Mana_OrcLeaf;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseOrcLeaf()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseOrcLeaf");
	Npc_ChangeAttribute(self, ATR_MANA, Mana_OrcLeaf);
};

//////////////////////////////////////////////////////////////////////////////////
//	Rabenkraut
//////////////////////////////////////////////////////////////////////////////////
instance ItPl_RavenHerb(C_Item)
{
	name						= NAME_RavenHerb;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Plants_Herb_02.3ds";
	material					= MAT_WOOD;

	change_atr[0]				= ATR_MANA; change_value[0] = Mana_RavenHerb;

	scemeName					= "FOOD";
	on_state[0]					= UseRavenHerb;

	value						= Value_RavenHerb;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Mana;								count[1] = Mana_RavenHerb;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseRavenHerb()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseRavenHerb");
	Npc_ChangeAttribute(self, ATR_MANA, Mana_RavenHerb);
};

//////////////////////////////////////////////////////////////////////////////////
//	Nachtschatten
//////////////////////////////////////////////////////////////////////////////////
instance ItPl_Nightshade(C_Item)
{
	name						= NAME_Nightshade;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Plants_Herb_03.3ds";
	material					= MAT_WOOD;

	change_atr[0]				= ATR_MANA; change_value[0] = Mana_Nightshade;

	scemeName					= "FOOD";
	on_state[0]					= UseNightshade;

	value						= Value_Nightshade;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Mana;								count[1] = Mana_Nightshade;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseNightshade()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseNightshade");
	Npc_ChangeAttribute(self, ATR_MANA, Mana_Nightshade);
};

//#################################################################################################
//##
//##	beim Kochen benutzte Pflanzen
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Höhlenpilz
//////////////////////////////////////////////////////////////////////////////////
instance ItPl_CaveMushroom(C_Item)
{
	name						= NAME_CaveMushroom;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Plants_mushroom_01.3ds";
	material					= MAT_WOOD;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_CaveMushroom;

	scemeName					= "FOOD";
	on_state[0]					= UseCaveMushroom;

	value						= Value_CaveMushroom;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_CaveMushroom;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseCaveMushroom()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseCaveMushroom");
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_CaveMushroom);
};

//////////////////////////////////////////////////////////////////////////////////
//	Sumpfkraut
//////////////////////////////////////////////////////////////////////////////////
instance ItPl_Swampweed(C_Item)
{
	name						= NAME_Swampweed;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Plants_Swampherb_01.3ds";
	material					= MAT_WOOD;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = Mana_SwampWeed;

	scemeName					= "FOOD";
	on_state[0]					= UseSwampweed;

	value						= Value_Swampweed;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = Mana_SwampWeed;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseSwampweed()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseSwampweed");
	Npc_ChangeAttribute(self, ATR_HITPOINTS, Mana_SwampWeed);
};

//#################################################################################################
//##
//##	sonstige Pflanzen
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Waldbeere
//////////////////////////////////////////////////////////////////////////////////
instance ItPl_Woodberry(C_ITEM)
{
	name						= NAME_Woodberry;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Plants_Berrys_01.3ds";
	material					= MAT_WOOD;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Woodberry;

	scemeName					= "FOOD";
	on_state[0]					= UseWoodberry;

	value						= Value_Woodberry;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Woodberry;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseWoodberry()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseWoodberry");
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Woodberry);
};

//////////////////////////////////////////////////////////////////////////////////
//	Flammbeere
//////////////////////////////////////////////////////////////////////////////////
instance ItPl_Flameberry(C_Item)
{
	name						= NAME_Flameberry;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Plants_Flameberry_01.3ds";
	material					= MAT_WOOD;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Flameberry;

	scemeName					= "FOOD";
	on_state[0]					= UseFlameberry;

	value						= Value_Flameberry;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Flameberry;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseFlameberry()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseFlameberry");
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Flameberry);
};

//////////////////////////////////////////////////////////////////////////////////
//	Trollkirsche
//////////////////////////////////////////////////////////////////////////////////
instance ItPl_Trollberry(C_Item)
{
	name						= NAME_Trollberry;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Plants_Trollberrys_01.3ds";
	material					= MAT_WOOD;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Trollberry;

	scemeName					= "FOOD";
	on_state[0]					= UseTrollberry;

	value						= Value_Trollberry;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Diese Beeren sind für Menschen";				count[1] = 0;
	text[2]						= "hochgradig giftig!";							count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseTrollberry()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseTrollberry");
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Trollberry);
};
