// ************************************************************************************************
// Wirkung und Kosten von Tränken
// ************************************************************************************************

// Heilung
const int Value_HpEssenz			= 25;	const int HP_Essenz				= 100;
const int Value_HpExtrakt			= 50;	const int HP_Extrakt			= 200;
const int Value_HpElixier			= 125;	const int HP_Elixier			= 500;

// Mana
const int Value_ManaEssenz			= 25;	const int Mana_Essenz			= 50;
const int Value_ManaExtrakt			= 50;	const int Mana_Extrakt			= 100;
const int Value_ManaElixier			= 125;	const int Mana_Elixier			= 250;

// Speed-Potions
const int Value_Haste1				= 25;	const int Time_Haste1			= 60000;	// 1 min.
const int Value_Haste2				= 50;	const int Time_Haste2			= 120000;	// 2 min.
const int Value_Haste3				= 125;	const int Time_Haste3			= 300000;	// 5 min.

// Permanente Attribut-Steigerungen
const int Value_StrEssenz			= 300;	const int STR_Essenz			= 3;
const int Value_StrExtrakt			= 500;	const int STR_Extrakt			= 5;
const int Value_StrElixier			= 800;	const int STR_Elixier			= 8;

const int Value_DexEssenz			= 300;	const int DEX_Essenz			= 3;
const int Value_DexExtrakt			= 500;	const int DEX_Extrakt			= 5;
const int Value_DexElixier			= 800;	const int DEX_Elixier			= 8;

// Trank der Macht
const int Value_StrDex_Macht		= 800;	const int StrDex_Macht			= 4;

// Trank der Herrschaft
const int Value_StrDex_Herrschaft	= 1200;	const int StrDex_Herrschaft		= 6;

const int Value_HpMaxEssenz			= 500;	const int HPMax_Essenz			= 5;
const int Value_HpMaxExtrakt		= 1000;	const int HPMax_Extrakt			= 10;
const int Value_HpMaxElixier		= 1500;	const int HPMax_Elixier			= 15;

const int Value_ManaMaxEssenz		= 500;	const int ManaMax_Essenz		= 5;
const int Value_ManaMaxExtrakt		= 1000;	const int ManaMax_Extrakt		= 10;
const int Value_ManaMaxElixier		= 1500;	const int ManaMax_Elixier		= 15;

/******************************************************************************************/
//	MANATRÄNKE																			//
/******************************************************************************************/
instance ItFo_Potion_Mana_01(C_Item)
{
	name						= NAME_ManaPotion1;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Mana_01.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_MANA; change_value[0] = Mana_Essenz;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseManaPotion;

	value						= Value_ManaEssenz;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Mana;								count[1] = Mana_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseManaPotion()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseManaPotion");
	Npc_ChangeAttribute(self, ATR_MANA, Mana_Essenz);
};

/******************************************************************************************/
instance ItFo_Potion_Mana_02(C_Item)
{
	name						= NAME_ManaPotion2;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Mana_02.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_MANA; change_value[0] = Mana_Extrakt;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseMana2Potion;

	value						= Value_ManaExtrakt;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Mana;								count[1] = Mana_Extrakt;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseMana2Potion()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseMana2Potion");
	Npc_ChangeAttribute(self, ATR_MANA, Mana_Extrakt);
};

/******************************************************************************************/
instance ItFo_Potion_Mana_03(C_Item)
{
	name						= NAME_ManaPotionAll;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Mana_03.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_MANA; change_value[0] = 999999;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseMana3Potion;

	value						= Value_ManaElixier;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Regeneriert Mana vollständig";				count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseMana3Potion()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseMana3Potion");
	Npc_ChangeAttribute(self, ATR_MANA,(self.attribute[ATR_MANA_MAX] - self.attribute[ATR_MANA]));
};

/******************************************************************************************/
//	HEILTRÄNKE																			//
/******************************************************************************************/
instance ItFo_Potion_Health_01(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Health_01.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Essenz;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseHealthPotion;

	value						= Value_HpEssenz;

	description					= NAME_HealthPotion1;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseHealthPotion()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseHealthPotion");
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Essenz);
};

/******************************************************************************************/
instance ItFo_Potion_Health_02(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Health_02.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Extrakt;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseHealth2Potion;

	value						= Value_HpExtrakt;

	description					= NAME_HealthPotion2;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Extrakt;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseHealth2Potion()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseHealthPotion");
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Extrakt);
};

/******************************************************************************************/
instance ItFo_Potion_Health_03(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Health_03.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = 999999;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseHealth3Potion;

	value						= Value_HpElixier;

	description					= NAME_HealthPotionAll;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Regeneriert die Gesundheit vollständig";		count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseHealth3Potion()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "UseHealthPotion");
	Npc_ChangeAttribute(self, ATR_HITPOINTS,(self.attribute[ATR_HITPOINTS_MAX] - self.attribute[ATR_HITPOINTS]));
};

/******************************************************************************************/
//STRENGTH

instance ItFo_Potion_Strength_01(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Strength_01.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_STRENGTH; change_value[0] = STR_Essenz;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseStrengthPotion;

	value						= Value_StrEssenz;

	description					= NAME_StrPotion1;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Str;								count[1] = STR_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_StrEssenz;
};

func void UseStrengthPotion()
{
	B_RaiseAttribute(ATR_STRENGTH, STR_Essenz);
};

/******************************************************************************************/
instance ItFo_Potion_Strength_02(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Strength_02.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_STRENGTH; change_value[0] = STR_Extrakt;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseStrength2Potion;

	value						= Value_StrExtrakt;

	description					= NAME_StrPotion2;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Str;								count[1] = STR_Extrakt;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_StrExtrakt;
};

func void UseStrength2Potion()
{
	B_RaiseAttribute(ATR_STRENGTH, STR_Extrakt);
};

/******************************************************************************************/
instance ItFo_Potion_Strength_03(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Strength_03.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_STRENGTH; change_value[0] = STR_Elixier;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseStrength3Potion;

	value						= Value_StrElixier;

	description					= NAME_StrPotion3;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Str;								count[1] = STR_Elixier;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_StrElixier;
};

func void UseStrength3Potion()
{
	B_RaiseAttribute(ATR_STRENGTH, STR_Elixier);
};

/******************************************************************************************/
//	DEXTERITY

instance ItFo_Potion_Dex_01(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Dex_01.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_DEXTERITY; change_value[0] = DEX_Essenz;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseDexPotion;

	value						= Value_DexEssenz;

	description					= NAME_DexPotion1;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Dex;								count[1] = DEX_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_DexEssenz;
};

func void UseDexPotion()
{
	B_RaiseAttribute(ATR_DEXTERITY, DEX_Essenz);
};

/******************************************************************************************/
instance ItFo_Potion_Dex_02(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Dex_02.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_DEXTERITY; change_value[0] = DEX_Extrakt;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseDex2Potion;

	value						= Value_DexExtrakt;

	description					= NAME_DexPotion2;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Dex;								count[1] = DEX_Extrakt;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_DexExtrakt;
};

func void UseDex2Potion()
{
	B_RaiseAttribute(ATR_DEXTERITY, DEX_Extrakt);
};

/******************************************************************************************/
instance ItFo_Potion_Dex_03(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Dex_03.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_DEXTERITY; change_value[0] = DEX_Elixier;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseDex3Potion;

	value						= Value_DexElixier;

	description					= NAME_DexPotion3;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Dex;								count[1] = DEX_Elixier;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_DexElixier;
};

func void UseDex3Potion()
{
	B_RaiseAttribute(ATR_DEXTERITY, DEX_Elixier);
};

/******************************************************************************************/
// STRENGTH & DEX

instance ItFo_Potion_Master_01(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Master_01.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_DEXTERITY; change_value[0] = StrDex_Macht;
	change_atr[1]				= ATR_STRENGTH; change_value[1] = StrDex_Macht;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseMasterPotion;

	value						= Value_StrDex_Macht;

	description					= NAME_StrDexPotion1;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Dex;								count[1] = StrDex_Macht;
	text[2]						= NAME_Bonus_Str;								count[2] = StrDex_Macht;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_StrDex_Macht;
};

func void UseMasterPotion()
{
	Npc_ChangeAttribute(self, ATR_STRENGTH, StrDex_Macht);
	Npc_ChangeAttribute(self, ATR_DEXTERITY, StrDex_Macht);

	var string msg;
	msg = ConcatStrings(NAME_RaiseStrDex, IntToString(StrDex_Macht));
	_ = PrintScreen(msg, -1, -1, FONT_OLD_BIG, _TIME_MESSAGE_RAISEATTRIBUTE);
};

/******************************************************************************************/
instance ItFo_Potion_Master_02(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Master_02.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_DEXTERITY; change_value[0] = StrDex_Herrschaft;
	change_atr[1]				= ATR_STRENGTH; change_value[1] = StrDex_Herrschaft;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseMaster2Potion;

	value						= Value_StrDex_Herrschaft;

	description					= NAME_StrDexPotion1;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_Dex;								count[1] = StrDex_Herrschaft;
	text[2]						= NAME_Bonus_Str;								count[2] = StrDex_Herrschaft;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_StrDex_Herrschaft;
};

func void UseMaster2Potion()
{
	Npc_ChangeAttribute(self, ATR_STRENGTH, StrDex_Herrschaft);
	Npc_ChangeAttribute(self, ATR_DEXTERITY, StrDex_Herrschaft);

	var string msg;
	msg = ConcatStrings(NAME_RaiseStrDex, IntToString(StrDex_Herrschaft));
	_ = PrintScreen(msg, -1, -1, FONT_OLD_BIG, _TIME_MESSAGE_RAISEATTRIBUTE);
};

/******************************************************************************************/
// Hitpoints

instance ItFo_Potion_Health_Perma_01(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Health_Perma_01.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_HITPOINTS_MAX; change_value[0] = HPMax_Essenz;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseLifePotion;

	value						= Value_HpMaxEssenz;

	description					= NAME_HealthPermaPotion1;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HpMax;								count[1] = HPMax_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_HpMaxEssenz;
};

func void UseLifePotion()
{
	B_RaiseAttribute(ATR_HITPOINTS_MAX, HPMax_Essenz);
};

/******************************************************************************************/
instance ItFo_Potion_Health_Perma_02(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Health_Perma_02.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_HITPOINTS_MAX; change_value[0] = HPMax_Extrakt;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseLife2Potion;

	value						= Value_HpMaxExtrakt;

	description					= NAME_HealthPermaPotion2;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HpMax;								count[1] = HPMax_Extrakt;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_HpMaxExtrakt;
};

func void UseLife2Potion()
{
	B_RaiseAttribute(ATR_HITPOINTS_MAX, HPMax_Extrakt);
};

/******************************************************************************************/
instance ItFo_Potion_Health_Perma_03(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Health_Perma_03.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_HITPOINTS_MAX; change_value[0] = HPMax_Elixier;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseLife3Potion;

	value						= Value_HpMaxElixier;

	description					= NAME_HealthPermaPotion3;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HpMax;								count[1] = HPMax_Elixier;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_HpMaxElixier;
};

func void UseLife3Potion()
{
	B_RaiseAttribute(ATR_HITPOINTS_MAX, HPMax_Elixier);
};

/******************************************************************************************/
// MANA

instance ItFo_Potion_Mana_Perma_01(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Mana_Perma_01.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_MANA_MAX; change_value[0] = ManaMax_Essenz;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseNectarPotion;

	value						= Value_ManaMaxEssenz;

	description					= NAME_ManaPermaPotion1;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_ManaMax;							count[1] = ManaMax_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_ManaMaxEssenz;
};

func void UseNectarPotion()
{
	B_RaiseAttribute(ATR_MANA_MAX, ManaMax_Essenz);
	PrintDebugNpc(PD_ITEM_MOBSI, "Ich trinke Magie");
};

/******************************************************************************************/
instance ItFo_Potion_Mana_Perma_02(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Mana_Perma_02.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_MANA_MAX; change_value[0] = ManaMax_Extrakt;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseNectar2Potion;

	value						= Value_ManaMaxExtrakt;

	description					= NAME_ManaPermaPotion2;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_ManaMax;							count[1] = ManaMax_Extrakt;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_ManaMaxExtrakt;
};

func void UseNectar2Potion()
{
	B_RaiseAttribute(ATR_MANA_MAX, ManaMax_Extrakt);
	PrintDebugNpc(PD_ITEM_MOBSI, "Ich trinke Magie");
};

/******************************************************************************************/
instance ItFo_Potion_Mana_Perma_03(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Mana_Perma_03.3ds";
	material					= MAT_GLAS;

	change_atr[0]				= ATR_MANA_MAX; change_value[0] = ManaMax_Elixier;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseNectar3Potion;

	value						= Value_ManaMaxElixier;

	description					= NAME_ManaPermaPotion3;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_ManaMax;							count[1] = ManaMax_Elixier;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_ManaMaxElixier;
};

func void UseNectar3Potion()
{
	B_RaiseAttribute(ATR_MANA_MAX, ManaMax_Elixier);
	PrintDebugNpc(PD_ITEM_MOBSI, "Ich trinke Magie");
};

/******************************************************************************************/
//	SPEED-POTIONS																	      //
/******************************************************************************************/
instance ItFo_Potion_Haste_01(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Haste_01.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseHastePotion1;

	value						= Value_Haste1;

	description					= NAME_SpeedPotion1;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Ermöglicht kurzzeitiges Sprinten ";			count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= NAME_Duration;								count[3] = Time_Haste1 / 60000;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseHastePotion1()
{
	Mdl_ApplyOverlayMDSTimed(self, "HUMANS_SPRINT.MDS", Time_Haste1);
	PrintDebugNpc(PD_ITEM_MOBSI, "jetzt bin ich schnell");
};

/******************************************************************************************/
instance ItFo_Potion_Haste_02(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Haste_01.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseHastePotion2;

	value						= Value_Haste2;

	description					= NAME_SpeedPotion2;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Ermöglicht Sprinten ";						count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= NAME_Duration;								count[3] = Time_Haste2 / 60000;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseHastePotion2()
{
	Mdl_ApplyOverlayMDSTimed(self, "HUMANS_SPRINT.MDS", Time_Haste2);
	PrintDebugNpc(PD_ITEM_MOBSI, "jetzt bin ich schnell");
};

/******************************************************************************************/
instance ItFo_Potion_Haste_03(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Haste_01.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseHastePotion3;

	value						= Value_Haste3;

	description					= NAME_SpeedPotion3;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Ermöglicht längeres Sprinten ";				count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= NAME_Duration;								count[3] = Time_Haste3 / 60000;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseHastePotion3()
{
	Mdl_ApplyOverlayMDSTimed(self, "HUMANS_SPRINT.MDS", Time_Haste3);
	PrintDebugNpc(PD_ITEM_MOBSI, "jetzt bin ich schnell");
};
