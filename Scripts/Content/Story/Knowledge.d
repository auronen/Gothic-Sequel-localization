///////////////////////////////////////
//	SC-Kenntnisse über Tierverwertung
///////////////////////////////////////
var int Knows_GetTeeth;
var int Knows_GetClaws;
var int Knows_GetFur;
var int Knows_GetHide;
var int Knows_GetTongue;
var int Knows_GetMCMandibles;
var int Knows_GetMCPlates;
var int Knows_GetBFSting;
var int Knows_GetUluMulu;

////////////////////////////////////////
//	SC-Kenntnisse über Schmiedewaffen
////////////////////////////////////////
var int Knows_Shortsword;
var int Knows_Longsword;
var int Knows_Broadsword;
var int Knows_Bastardsword;
var int Knows_2HSword;
var int Knows_OrcSword;

var int Knows_Hatchet;
var int Knows_Battleaxe;
var int Knows_DoublebladedAxe;
var int Knows_BerserkAxe;
var int Knows_OrcAxe;

var int Knows_IronClub;
var int Knows_Mace;
var int Knows_Morningstar;
var int Knows_Warhammer;
var int Knows_OrcHammer;

////////////////////////////////////////
//	SC-Kenntnisse über Kochrezepte
////////////////////////////////////////

var int Knows_RecipeMeatbug;
var int Knows_RecipeMolerat;
var int Knows_RecipeHerb;
var int Knows_RecipeMushroom;
var int Knows_RecipeMeat;

////////////////////////////////////////
//	SC-Kenntnisse über Alchemierezepte
////////////////////////////////////////
var int Knows_ManaPotions;
var int Knows_HealingPotions;
var int Knows_SpeedPotions;
var int Knows_DexterityPotions;
var int Knows_StrengthPotions;
var int Knows_HpMaxPotions;
var int Knows_ManaMaxPotions;

////////////////////////////////////////
//	SC-Kenntnisse über Bogenherstellung
////////////////////////////////////////
var int Knows_RecipeBow;
var int Knows_RecipeLongBow;
var int Knows_RecipeCrossBow;

////////////////////////////////////////
//	SC-Kenntnisse über Pflanzen
////////////////////////////////////////
var int Knows_MountainMoss;
var int Knows_Stoneroot;
var int Knows_BloodThistle;
var int Knows_OrcLeaf;
var int Knows_Ravenherb;
var int Knows_Nightshade;
var int Knows_CaveMushroom;
var int Knows_Woodberry;
var int Knows_Flameberry;
var int Knows_Trollberry;

//#################################################################################
//#################################################################################
//
//	WISSEN - Nahkampfwaffen
//
//#################################################################################
//#################################################################################
func void B_LearnShortsword()
{
	if (!Knows_Shortsword)
	{
		Knows_Shortsword = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_1);
	};
};

func void B_LearnLongsword()
{
	if (!Knows_Longsword)
	{
		Knows_Longsword = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_2);
	};
};

func void B_LearnBroadsword()
{
	if (!Knows_Broadsword)
	{
		Knows_Broadsword = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_3);
	};
};

func void B_LearnBastardsword()
{
	if (!Knows_Bastardsword)
	{
		Knows_Bastardsword = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_4);
	};
};

func void B_Learn2HSword()
{
	if (!Knows_2HSword)
	{
		Knows_2HSword = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_5);
	};
};

func void B_LearnOrcSword()
{
	if (!Knows_OrcSword)
	{
		Knows_OrcSword = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_6);
	};
};

func void B_LearnHatchet()
{
	if (!Knows_Hatchet)
	{
		Knows_Hatchet = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_7);
	};
};

func void B_LearnBattleaxe()
{
	if (!Knows_Battleaxe)
	{
		Knows_Battleaxe = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_8);
	};
};

func void B_LearnDoublebladedAxe()
{
	if (!Knows_DoublebladedAxe)
	{
		Knows_DoublebladedAxe = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_9);
	};
};

func void B_LearnBerserkAxe()
{
	if (!Knows_BerserkAxe)
	{
		Knows_BerserkAxe = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_10);
	};
};

func void B_LearnOrcAxe()
{
	if (!Knows_OrcAxe)
	{
		Knows_OrcAxe = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_11);
	};
};

func void B_LearnIronclub()
{
	if (!Knows_Ironclub)
	{
		Knows_Ironclub = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_12);
	};
};

func void B_LearnMace()
{
	if (!Knows_Mace)
	{
		Knows_Mace = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_13);
	};
};

func void B_LearnMorningstar()
{
	if (!Knows_Morningstar)
	{
		Knows_Morningstar = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_14);
	};
};

func void B_LearnWarhammer()
{
	if (!Knows_Warhammer)
	{
		Knows_Warhammer = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_15);
	};
};

func void B_LearnOrcHammer()
{
	if (!Knows_OrcHammer)
	{
		Knows_OrcHammer = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNSMITH, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_SmithWeapons, LOG_NOTE);
		B_LogEntry(GE_SmithWeapons, GE_SmithWeapons_16);
	};
};

//---------------------------------------------------------------------------------------
// Abfrage von Waffenkategorien
//---------------------------------------------------------------------------------------
func int B_KnowsSword()
{
	if (Knows_Shortsword
	|| Knows_Longsword
	|| Knows_Broadsword
	|| Knows_Bastardsword)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int B_Knows2HSword()
{
	if (Knows_2HSword)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int B_KnowsAxe()
{
	if (Knows_Hatchet
	|| Knows_Battleaxe)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int B_Knows2HAxe()
{
	if (Knows_DoublebladedAxe
	|| Knows_BerserkAxe)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int B_KnowsBlunt()
{
	if (Knows_IronClub
	|| Knows_Mace
	|| Knows_Morningstar)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int B_Knows2HBlunt()
{
	if (Knows_Warhammer)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int B_Knows2HWeapon()
{
	if (Knows_2HSword
	|| Knows_DoublebladedAxe
	|| Knows_BerserkAxe
	|| Knows_Warhammer)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int B_KnowsOrcWeapon()
{
	if (Knows_OrcSword
	|| Knows_OrcAxe
	|| Knows_OrcHammer)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int B_KnowsDemonWeapon()
{
	return FALSE;
};

//#################################################################################
//#################################################################################
//
//	WISSEN - Kochrezepte
//
//#################################################################################
//#################################################################################

func void B_LearnRecipeMeatbug()
{
	if (!Knows_RecipeMeatbug)
	{
		Knows_RecipeMeatbug = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNCOOK, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_CookingRecipies, LOG_NOTE);
		B_LogEntry(GE_CookingRecipies, GE_CookingRecipies_Meatbug);
	};
};

func void B_LearnRecipeMolerat()
{
	if (!Knows_RecipeMolerat)
	{
		Knows_RecipeMolerat = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNCOOK, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_CookingRecipies, LOG_NOTE);
		B_LogEntry(GE_CookingRecipies, GE_CookingRecipies_Molerat);
	};
};

func void B_LearnRecipeHerb()
{
	if (!Knows_RecipeHerb)
	{
		Knows_RecipeHerb = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNCOOK, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_CookingRecipies, LOG_NOTE);
		B_LogEntry(GE_CookingRecipies, GE_CookingRecipies_Herb);
	};
};

func void B_LearnRecipeMushroom()
{
	if (!Knows_RecipeMushroom)
	{
		Knows_RecipeMushroom = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNCOOK, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_CookingRecipies, LOG_NOTE);
		B_LogEntry(GE_CookingRecipies, GE_CookingRecipies_Mushroom);
	};
};

func void B_LearnRecipeMeat()
{
	if (!Knows_RecipeMeat)
	{
		Knows_RecipeMeat = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNCOOK, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_CookingRecipies, LOG_NOTE);
		B_LogEntry(GE_CookingRecipies, GE_CookingRecipies_Meat);
	};
};

//#################################################################################
//#################################################################################
//
//	WISSEN - Alchemierezepte
//
//#################################################################################
//#################################################################################
func void B_LearnRecipeHealingPotions()
{
	if (!Knows_HealingPotions)
	{
		Knows_HealingPotions = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNALCHEMIE, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_AlchemieRecipies, LOG_NOTE);
		B_LogEntry(GE_AlchemieRecipies, GE_AlchemieRecipies_HP);
	};
};

func void B_LearnRecipeManaPotions()
{
	if (!Knows_ManaPotions)
	{
		Knows_ManaPotions = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNALCHEMIE, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_AlchemieRecipies, LOG_NOTE);
		B_LogEntry(GE_AlchemieRecipies, GE_AlchemieRecipies_Mana);
	};
};


func void B_LearnRecipeSpeedPotions()
{
	if (!Knows_SpeedPotions)
	{
		Knows_SpeedPotions = TRUE;

		_ = PrintScreen(_STR_MESSAGE_LEARNALCHEMIE, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

		Log_CreateTopic(GE_AlchemieRecipies, LOG_NOTE);
		B_LogEntry(GE_AlchemieRecipies, GE_AlchemieRecipies_Speed);

	};
};

//#################################################################################
//#################################################################################
//
//	WISSEN - Pflanzen
//
//#################################################################################
//#################################################################################
func void B_LearnWoodberry()
{
	if (!Knows_Woodberry)
	{
		_ = PrintScreen(_STR_MESSAGE_LEARNPLANTS, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_Plants, LOG_NOTE);
		B_LogEntry(GE_Plants, GE_Plants_1);
	};
};

func void B_LearnFlameberry()
{
	if (!Knows_Flameberry)
	{
		_ = PrintScreen(_STR_MESSAGE_LEARNPLANTS, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_Plants, LOG_NOTE);
		B_LogEntry(GE_Plants, GE_Plants_2);
	};
};

func void B_LearnTrollberry()
{
	if (!Knows_Trollberry)
	{
		_ = PrintScreen(_STR_MESSAGE_LEARNPLANTS, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_Plants, LOG_NOTE);
		B_LogEntry(GE_Plants, GE_Plants_3);
	};
};

func void B_LearnCaveMushroom()
{
	if (!Knows_CaveMushroom)
	{
		_ = PrintScreen(_STR_MESSAGE_LEARNPLANTS, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_Plants, LOG_NOTE);
		B_LogEntry(GE_Plants, GE_Plants_4);
	};
};

func void B_LearnMountainMoss()
{
	if (!Knows_MountainMoss)
	{
		// gelehrt von HLR_501_Talamon
		_ = PrintScreen(_STR_MESSAGE_LEARNPLANTS, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_Plants, LOG_NOTE);
		B_LogEntry(GE_Plants, GE_Plants_5);
	};
};

func void B_LearnStoneroot()
{
	if (!Knows_Stoneroot)
	{
		// gelehrt von HLR_501_Talamon
		_ = PrintScreen(_STR_MESSAGE_LEARNPLANTS, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_Plants, LOG_NOTE);
		B_LogEntry(GE_Plants, GE_Plants_6);
	};
};

func void B_LearnBloodThistle()
{
	if (!Knows_BloodThistle)
	{
		_ = PrintScreen(_STR_MESSAGE_LEARNPLANTS, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_Plants, LOG_NOTE);
		B_LogEntry(GE_Plants, GE_Plants_7);
	};
};

func void B_LearnOrcLeaf()
{
	if (!Knows_OrcLeaf)
	{
		// gelehrt von HLR_501_Talamon
		_ = PrintScreen(_STR_MESSAGE_LEARNPLANTS, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_Plants, LOG_NOTE);
		B_LogEntry(GE_Plants, GE_Plants_8);
	};
};

func void B_LearnRavenHerb()
{
	if (!Knows_RavenHerb)
	{
		_ = PrintScreen(_STR_MESSAGE_LEARNPLANTS, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_Plants, LOG_NOTE);
		B_LogEntry(GE_Plants, GE_Plants_9);
	};
};

func void B_LearnNightshade()
{
	if (!Knows_Nightshade)
	{
		// gelehrt von HLR_501_Talamon
		_ = PrintScreen(_STR_MESSAGE_LEARNPLANTS, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_Plants, LOG_NOTE);
		B_LogEntry(GE_Plants, GE_Plants_10);
	};
};

//#################################################################################
//#################################################################################
//
//	WISSEN - Fernkampfwaffen
//
//#################################################################################
//#################################################################################

func void B_LearnRecipeBow()
{
	Knows_RecipeBow = TRUE;

	_ = PrintScreen(_STR_MESSAGE_LEARNBOW, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

	Log_CreateTopic(GE_BowMaker, LOG_NOTE);
	B_LogEntry(GE_BowMaker, GE_BowMaker_Bow);
};

func void B_LearnRecipeLongBow()
{
	Knows_RecipeLongBow = TRUE;

	_ = PrintScreen(_STR_MESSAGE_LEARNBOW, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

	Log_CreateTopic(GE_BowMaker, LOG_NOTE);
	B_LogEntry(GE_BowMaker, GE_BowMaker_LongBow);

};

func void B_LearnRecipeCrossBow()
{
	Knows_RecipeCrossBow = TRUE;

	_ = PrintScreen(_STR_MESSAGE_LEARNBOW, -1, _YPOS_MESSAGE_LEARN, FONT_OLD_BIG, _TIME_MESSAGE_LEARN);

	Log_CreateTopic(GE_BowMaker, LOG_NOTE);
	B_LogEntry(GE_BowMaker, GE_BowMaker_CrossBow);

};
