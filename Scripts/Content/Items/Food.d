//#################################################################################################
//##
//##	Heilwirkung und Kosten von Nahrungsmitteln
//##
//#################################################################################################

const int Value_Apple			= 2; const int HP_Apple				= 12;
const int Value_Grapes			= 3; const int HP_Grapes			= 15;
const int Value_Loaf			= 2; const int HP_Loaf				= 12;
const int Value_MuttonRaw		= 2; const int HP_MuttonRaw			= 10;
const int Value_Mutton			= 3; const int HP_Mutton			= 20; // Rohes Fleisch mit Pfanne benutzt
const int Value_Ham				= 5; const int HP_Ham				= 30; // Schinken ist teuer M.F.
const int Value_Cheese			= 3; const int HP_Cheese			= 15;
const int Value_Rice			= 2; const int HP_Rice				= 10;

const int Value_Beer			= 5; const int HP_Beer				= 0;
const int Value_Wine			= 8; const int HP_Wine				= 0; // Wein ist teuer M.F.
const int Value_Booze			= 7; const int HP_Booze				= 0;

const int Value_Salt			= 5;

//#################################################################################################
//##
//##	Essbares
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Apfel
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_Apple(C_Item)
{
	name						= NAME_Apple;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Apple_01.3ds";
	material					= MAT_LEATHER;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Apple;

	scemeName					= "FOOD";
	on_state[0]					= UseApple;

	value						= Value_Apple;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Apple;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseApple()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Apple);
};

//////////////////////////////////////////////////////////////////////////////////
//	Weintrauben
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_Grapes(C_Item)
{
	name						= NAME_Grapes;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Grapes_01.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Grapes;

	scemeName					= "FOOD";
	on_state[0]					= UseGrapes;

	value						= Value_Grapes;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Grapes;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseGrapes()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Grapes);
};

//////////////////////////////////////////////////////////////////////////////////
//	Brot
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_Loaf(C_Item)
{
	name						= NAME_Loaf;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Loaf_01.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Loaf;

	scemeName					= "FOODHUGE";
	on_state[0]					= UseLoaf;

	value						= Value_Loaf;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Loaf;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseLoaf()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Loaf);
};

//////////////////////////////////////////////////////////////////////////////////
//	gebratenes Fleisch
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_Mutton(C_Item)
{
	name						= NAME_Mutton;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_CookedMutton_01.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Mutton;

	scemeName					= "MEAT";
	on_state[0]					= UseMutton;

	value						= Value_Mutton;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Mutton;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseMutton()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Mutton);
};

//////////////////////////////////////////////////////////////////////////////////
//	rohes Fleisch
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MuttonRaw(C_Item)
{
	name						= NAME_MuttonRaw;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_RawMutton_01.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MuttonRaw;

	scemeName					= "MEAT";
	on_state[0]					= UseMuttonRaw;

	value						= Value_MuttonRaw;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MuttonRaw;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseMuttonRaw()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MuttonRaw);
};

//////////////////////////////////////////////////////////////////////////////////
//	Schinken
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_Ham(C_Item)
{
	name						= NAME_Ham;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_mutton_01.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Ham;

	scemeName					= "FOODHUGE";
	on_state[0]					= UseHam;

	value						= Value_Ham;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Ham;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseHam()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Ham);
};

//////////////////////////////////////////////////////////////////////////////////
//	Käse
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_Cheese(C_Item)
{
	name						= NAME_Cheese;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Cheese_01.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Cheese;

	scemeName					= "FOODHUGE";
	on_state[0]					= UseCheese;

	value						= Value_Cheese;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Cheese;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseCheese()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Cheese);
};

//#################################################################################################
//##
//##	Trinkbares
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Bier
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_Beer(C_Item)
{
	name						= NAME_Beer;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Beer_01.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Beer;

	scemeName					= "POTION";
	on_state[0]					= UseBeer;

	value						= Value_Beer;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Beer;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseBeer()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Beer);
};

//////////////////////////////////////////////////////////////////////////////////
//	Wein
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_Wine(C_Item)
{
	name						= NAME_Wine;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Wine_01.3ds";
	material					= MAT_LEATHER;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Wine;

	scemeName					= "POTION";
	on_state[0]					= UseWine;

	value						= Value_Wine;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Wine;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseWine()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Wine);
};

//////////////////////////////////////////////////////////////////////////////////
//	Schnaps
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_Booze(C_Item)
{
	name						= NAME_Booze;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Booze_01.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Booze;

	scemeName					= "POTION";
	on_state[0]					= UseBooze;

	value						= Value_Booze;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Booze;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseBooze()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Booze);
};

//////////////////////////////////////////////////////////////////////////////////
//	Salz
//////////////////////////////////////////////////////////////////////////////////
instance ItMi_Salt(C_Item)
{
	name						= NAME_Salt;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Alchemy_Salt_01.3DS";
	material					= MAT_CLAY;

	value						= Value_Salt;

	description					= name;
	text[0]						= "Darf in keiner Speise fehlen!";				count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};
