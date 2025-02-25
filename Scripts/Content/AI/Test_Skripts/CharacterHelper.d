//#####################################################################
//##
//##
//##							Instanz
//##
//##
//#####################################################################
INSTANCE CH(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name 			= "CharacterHelper";
	Npctype			= Npctype_Main;
	guild			= GIL_NONE;
	level			= 10;
	voice			= 15;
	id				= 0;


	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody	(self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			-1);

	//-------- ai ----------
	start_aistate = ZS_CH_Hangaround;
};

func void ZS_CH_Hangaround ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"ZS_CH_Hangaround");

	//Npc_PercEnable  	(self,	PERC_ASSESSPLAYER		,	B_AssessSC			);
	Npc_PercEnable  	(self,	PERC_ASSESSTALK			,	B_AssessTalk		);
};

func void ZS_CH_Hangaround_Loop ()
{
	PrintDebugNpc	(PD_ZS_LOOP,	"ZS_CH_Hangaround_Loop");
};

func void ZS_CH_Hangaround_End ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"ZS_CH_Hangaround_End");
};

func void B_SetHeroExp()
{
    var string Attributes;

    hero.exp = (250*((hero.level+1))*(hero.level));
    hero.exp_next = (250*((hero.level+2))*(hero.level+1));
    hero.lp = (hero.level * LP_PER_LEVEL) + HERO_START_LP;

    Attributes = "Level Up: Lernpunkte:";
    Attributes = ConcatStrings(Attributes, IntToString(hero.LP));
    Attributes = ConcatStrings(Attributes, "Hitpoints:");
    Attributes = ConcatStrings(Attributes, IntToString(hero.attribute[ATR_HITPOINTS_MAX]));

    _ = PrintScreen	(Attributes, -1,-1,FONT_OLD_BIG,3);
    Snd_Play 	("LEVELUP");
};

func void B_SetHeroEquipment()
{
	PrintDebugNpc	(PD_ZS_CHECK, "B_SetHeroEquipment");
    CreateInvItems(hero,ItAm_Arrow,100);
    CreateInvItems(hero,ItAm_Bolt,100);
	CreateInvItems(hero,ItMi_Silver, 500);
    CreateInvItems(hero,ItLsTorch,30);
   	CreateInvItems(hero,ItFo_Potion_Health_03,10);
    CreateInvItems(hero,ItFo_Potion_Mana_03,10);
    CreateInvItems(hero,ItKe_Lockpick,30);
    CreateInvItems(hero,ItWr_Worldmap,1);
};

func void B_SetHeroAttributes(VAR INT selection, var int increase, var int LP_cost)
{
    var string Attributes;

    if (hero.lp >= LP_cost)
	{
		hero.lp = hero.lp - LP_cost;

		Npc_ChangeAttribute (hero, selection, increase);

		Attributes = "Lernpunkte:";
        Attributes = ConcatStrings(Attributes, IntToString(hero.LP));
        Attributes = ConcatStrings(Attributes, "Str:");
        Attributes = ConcatStrings(Attributes, IntToString(hero.attribute[ATR_STRENGTH]));
        Attributes = ConcatStrings(Attributes, "Dex:");
        Attributes = ConcatStrings(Attributes, IntToString(hero.attribute[ATR_DEXTERITY]));
        Attributes = ConcatStrings(Attributes, "Mana:");
        Attributes = ConcatStrings(Attributes, IntToString(hero.attribute[ATR_MANA_MAX]));

		_ = PrintScreen	(Attributes, -1,-1,FONT_OLD_BIG,3);
	}
	else
	{
		_ = PrintScreen	(PRINT_NotEnoughSkillPoints, -1,-1,FONT_OLD_BIG,2);
		B_Say		(self, other, "$NOLEARNNOPOINTS");
	};
};

func void B_SetHeroWeapon()
{
	_ = AI_EquipBestMeleeWeapon	(hero);
	_ = AI_EquipBestRangedWeapon(hero);

    B_SetHeroEquipment();
};

//***************************************************************************
//	Rahmen-Infos
//***************************************************************************
instance  CH_Exit (C_INFO)
{
	npc			=  CH;
	nr			=  999;
	condition	=  CH_Exit_Condition;
	information	=  CH_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = "ENDE";
};

FUNC int  CH_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  CH_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Levelwahl
//***************************************************************************

func void CH_Level_BACK()
{
	Info_ClearChoices	(CH_Level);
};

INSTANCE CH_Level (C_INFO)
{
	npc				= CH;
	condition		= CH_Level_Condition;
	information		= CH_Level_Info;
	important		= 0;
	permanent		= 1;
	description		= "Gib mir Level!";
};

FUNC INT CH_Level_Condition()
{
	if (hero.level == 0)
	{
		return TRUE;
	};
	return FALSE;
};

func VOID CH_Level_Info()
{

	Info_ClearChoices	(CH_Level);

	Info_AddChoice		(CH_Level, "BACK",			CH_Level_BACK);
	Info_AddChoice		(CH_Level, "Level  1 -  5", CH_Level1);
	Info_AddChoice		(CH_Level, "Level  6 - 10", CH_Level6);
	Info_AddChoice		(CH_Level, "Level 11 - 15", CH_Level11);
	Info_AddChoice		(CH_Level, "Level 16 - 20", CH_Level16);
	Info_AddChoice		(CH_Level, "Level 21 - 25", CH_Level21);
	Info_AddChoice		(CH_Level, "Level 26 - 30", CH_Level26);
};

func void CH_Level26()
{
	Info_ClearChoices	(CH_Level);

	Info_AddChoice		(CH_Level, "BACK",		CH_Level_BACK);
	Info_AddChoice		(CH_Level, "Level 26" , CH_Level_26);
	Info_AddChoice		(CH_Level, "Level 27" , CH_Level_27);
	Info_AddChoice		(CH_Level, "Level 28" , CH_Level_28);
	Info_AddChoice		(CH_Level, "Level 29" , CH_Level_29);
	Info_AddChoice		(CH_Level, "Level 30" , CH_Level_30);
};

func void CH_Level21()
{
	Info_ClearChoices	(CH_Level);

	Info_AddChoice		(CH_Level, "BACK"		, CH_Level_BACK);
	Info_AddChoice		(CH_Level, "Level 21" , CH_Level_21);
	Info_AddChoice		(CH_Level, "Level 22" , CH_Level_22);
	Info_AddChoice		(CH_Level, "Level 23" , CH_Level_23);
	Info_AddChoice		(CH_Level, "Level 24" , CH_Level_24);
	Info_AddChoice		(CH_Level, "Level 25" , CH_Level_25);
};

func void CH_Level16()
{
	Info_ClearChoices	(CH_Level);

	Info_AddChoice		(CH_Level, "BACK"		, CH_Level_BACK);
	Info_AddChoice		(CH_Level, "Level 16" , CH_Level_16);
	Info_AddChoice		(CH_Level, "Level 17" , CH_Level_17);
	Info_AddChoice		(CH_Level, "Level 18" , CH_Level_18);
	Info_AddChoice		(CH_Level, "Level 19" , CH_Level_19);
	Info_AddChoice		(CH_Level, "Level 20" , CH_Level_20);
};

func void CH_Level11()
{
	Info_ClearChoices	(CH_Level);

	Info_AddChoice		(CH_Level, "BACK"		, CH_Level_BACK);
	Info_AddChoice		(CH_Level, "Level 11" , CH_Level_11);
	Info_AddChoice		(CH_Level, "Level 12" , CH_Level_12);
	Info_AddChoice		(CH_Level, "Level 13" , CH_Level_13);
	Info_AddChoice		(CH_Level, "Level 14" , CH_Level_14);
	Info_AddChoice		(CH_Level, "Level 15" , CH_Level_15);
};

func void CH_Level6()
{
	Info_ClearChoices	(CH_Level);

	Info_AddChoice		(CH_Level, "BACK"	    , CH_Level_BACK);
	Info_AddChoice		(CH_Level, "Level  6" , CH_Level_6);
	Info_AddChoice		(CH_Level, "Level  7" , CH_Level_7);
	Info_AddChoice		(CH_Level, "Level  8" , CH_Level_8);
	Info_AddChoice		(CH_Level, "Level  9" , CH_Level_9);
	Info_AddChoice		(CH_Level, "Level 10" , CH_Level_10);
};

func void CH_Level1()
{
	Info_ClearChoices	(CH_Level);

	Info_AddChoice		(CH_Level, "BACK"		, CH_Level_BACK);
	Info_AddChoice		(CH_Level, "Level 1" 	, CH_Level_1);
	Info_AddChoice		(CH_Level, "Level 2" 	, CH_Level_2);
	Info_AddChoice		(CH_Level, "Level 3" 	, CH_Level_3);
	Info_AddChoice		(CH_Level, "Level 4" 	, CH_Level_4);
	Info_AddChoice		(CH_Level, "Level 5" 	, CH_Level_5);
};

func void CH_Level_1()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 1;
    hero.attribute[ATR_HITPOINTS_MAX] = 52;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_2()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 2;
    hero.attribute[ATR_HITPOINTS_MAX] = 64;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_3()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 3;
    hero.attribute[ATR_HITPOINTS_MAX] = 76;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_4()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 4;
    hero.attribute[ATR_HITPOINTS_MAX] = 88;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_5()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 5;
    hero.attribute[ATR_HITPOINTS_MAX] = 100;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_6()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 6;
    hero.attribute[ATR_HITPOINTS_MAX] = 112;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_7()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 7;
    hero.attribute[ATR_HITPOINTS_MAX] = 124;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_8()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 8;
    hero.attribute[ATR_HITPOINTS_MAX] = 136;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_9()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 9;
    hero.attribute[ATR_HITPOINTS_MAX] = 148;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_10()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 10;
    hero.attribute[ATR_HITPOINTS_MAX] = 160;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_11()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 11;
    hero.attribute[ATR_HITPOINTS_MAX] = 172;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_12()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 12;
    hero.attribute[ATR_HITPOINTS_MAX] = 184;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_13()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 13;
    hero.attribute[ATR_HITPOINTS_MAX] = 196;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_14()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 14;
    hero.attribute[ATR_HITPOINTS_MAX] = 208;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_15()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 15;
    hero.attribute[ATR_HITPOINTS_MAX] = 220;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_16()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 16;
    hero.attribute[ATR_HITPOINTS_MAX] = 232;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_17()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 17;
    hero.attribute[ATR_HITPOINTS_MAX] = 244;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_18()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 18;
    hero.attribute[ATR_HITPOINTS_MAX] = 256;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_19()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 19;
    hero.attribute[ATR_HITPOINTS_MAX] = 268;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_20()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 20;
    hero.attribute[ATR_HITPOINTS_MAX] = 280;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_21()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 21;
    hero.attribute[ATR_HITPOINTS_MAX] = 292;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_22()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 22;
    hero.attribute[ATR_HITPOINTS_MAX] = 304;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_23()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 23;
    hero.attribute[ATR_HITPOINTS_MAX] = 316;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_24()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 24;
    hero.attribute[ATR_HITPOINTS_MAX] = 328;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_25()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 25;
    hero.attribute[ATR_HITPOINTS_MAX] = 340;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_26()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 26;
    hero.attribute[ATR_HITPOINTS_MAX] = 352;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_27()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 27;
    hero.attribute[ATR_HITPOINTS_MAX] = 364;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_28()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 28;
    hero.attribute[ATR_HITPOINTS_MAX] = 376;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_29()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 29;
    hero.attribute[ATR_HITPOINTS_MAX] = 388;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_30()
{
	Info_ClearChoices	(CH_Level);

    hero.level = 30;
    hero.attribute[ATR_HITPOINTS_MAX] = 400;
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

    B_SetHeroExp();
	B_SetHeroWeapon();
};


//#####################################################################
//##
//##
//##					ATTRIBUTE: Stärke
//##
//##
//#####################################################################
INSTANCE CH_Training_STR (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_STR_Condition;
	information		= CH_Training_STR_Info;
	important		= 0;
	permanent		= 1;
	description		= "ATTRIBUTE: Stärke";
};

FUNC INT CH_Training_STR_Condition()
{
	if	(hero.LP > 0)
	{
		return TRUE;
	};
	return FALSE;
};

func void CH_Training_STR_Info()
{
	Info_ClearChoices	(CH_Training_STR);

	Info_AddChoice		(CH_Training_STR, "ZURÜCK"	     							, CH_Training_STR_BACK);
	Info_AddChoice		(CH_Training_STR, "Stärke (alle restlichen Lernpunkte)"		, CH_Strength_all);
	Info_AddChoice		(CH_Training_STR, "Stärke (für beste Nahkampfwaffe)"		, CH_Strength_Weapon);
	if	(hero.LP >= 20*LPCOST_ATTRIBUTE_STRENGTH)
	{
	    Info_AddChoice	(CH_Training_STR, B_BuildLearnString(NAME_LearnStrength_20,20*LPCOST_ATTRIBUTE_STRENGTH,0)	, CH_Strength20);
	};
	if	(hero.LP >= 10*LPCOST_ATTRIBUTE_STRENGTH)
	{
	    Info_AddChoice	(CH_Training_STR, B_BuildLearnString(NAME_LearnStrength_10,10*LPCOST_ATTRIBUTE_STRENGTH,0)	, CH_Strength10);
	};
	if	(hero.LP >= 5*LPCOST_ATTRIBUTE_STRENGTH)
	{
		Info_AddChoice	(CH_Training_STR, B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)	 	, CH_Strength5);
	};
	if	(hero.LP >= LPCOST_ATTRIBUTE_STRENGTH)
	{
	    Info_AddChoice	(CH_Training_STR, B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		, CH_Strength1);
	};
};

func void CH_Strength1()
{
    B_SetHeroAttributes(ATR_STRENGTH, 1, LPCOST_ATTRIBUTE_STRENGTH);

    Info_ClearChoices	(CH_Training_STR);
};

func void CH_Strength5()
{
    B_SetHeroAttributes(ATR_STRENGTH, 5, 5*LPCOST_ATTRIBUTE_STRENGTH);

    Info_ClearChoices	(CH_Training_STR);
};

func void CH_Strength10()
{
    B_SetHeroAttributes(ATR_STRENGTH, 10, 10*LPCOST_ATTRIBUTE_STRENGTH);

    Info_ClearChoices	(CH_Training_STR);
};

func void CH_Strength20()
{
    B_SetHeroAttributes(ATR_STRENGTH, 20, 20*LPCOST_ATTRIBUTE_STRENGTH);

    Info_ClearChoices	(CH_Training_STR);
};

func void CH_Strength_Weapon ()
{
	Info_ClearChoices	(CH_Training_STR);

	var int value;
	var int	increase;

	if		(hero.level <= 5)	{	value = 11;	}
	else if	(hero.level <= 9)	{	value = 17;	}
	else if	(hero.level <= 15)	{	value = 26;	}
	else if	(hero.level <= 20)	{	value = 52;	}
	else if	(hero.level <= 25)	{	value = 62;	}
	else if	(hero.level <= 30)	{	value = 78;	};

	if (hero.attribute[ATR_STRENGTH] < value)
	{
  		increase = value - hero.attribute[ATR_STRENGTH];
    	B_SetHeroAttributes(ATR_STRENGTH,increase,increase*LPCOST_ATTRIBUTE_STRENGTH);

	    _ = AI_EquipBestMeleeWeapon(hero);
	}
	else
	{
        _ = PrintScreen	("nötige STR bereits vorhanden", -1,-1,FONT_OLD_BIG,10);
	};
};

func void CH_Strength_all()
{
    B_SetHeroAttributes(ATR_STRENGTH, hero.lp, hero.lp*LPCOST_ATTRIBUTE_STRENGTH);

    Info_ClearChoices	(CH_Training_STR);
};

func void CH_Training_STR_BACK()
{
	Info_ClearChoices	(CH_Training_STR);
};


//#####################################################################
//##
//##
//##					ATTRIBUTE: Geschick
//##
//##
//#####################################################################
INSTANCE CH_Training_DEX (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_DEX_Condition;
	information		= CH_Training_DEX_Info;
	important		= 0;
	permanent		= 1;
	description		= "ATTRIBUTE: Geschick";
};

FUNC INT CH_Training_DEX_Condition()
{
	if	(hero.LP > 0)
	{
		return TRUE;
	};
	return FALSE;
};

func void CH_Training_DEX_Info ()
{
	Info_ClearChoices	(CH_Training_DEX);
	Info_AddChoice		(CH_Training_DEX, "ZURÜCK"	     							, CH_Training_DEX_BACK);
	Info_AddChoice		(CH_Training_DEX, "Geschick (alle restlichen Lernpunkte)" 	, CH_Dexterity_all);
	Info_AddChoice		(CH_Training_DEX, "Geschick (für beste Fernkampfwaffe)"		, CH_Dexterity_Weapon);
	if	(hero.LP >= 20)
	{
	    Info_AddChoice	(CH_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_20,20*LPCOST_ATTRIBUTE_DEXTERITY,0)	, CH_Dexterity20);
	};
	if	(hero.LP >= 10)
	{
	    Info_AddChoice	(CH_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_10,10*LPCOST_ATTRIBUTE_DEXTERITY,0)	, CH_Dexterity10);
	};
	if	(hero.LP >= 5)
	{
		Info_AddChoice	(CH_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	, CH_Dexterity5);
	};
	if	(hero.LP >= 1)
	{
	    Info_AddChoice	(CH_Training_DEX, B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		, CH_Dexterity1);
	};
};

func void CH_Dexterity1()
{
    B_SetHeroAttributes	(ATR_DEXTERITY, 1, LPCOST_ATTRIBUTE_DEXTERITY);

    Info_ClearChoices	(CH_Training_DEX);
};

func void CH_Dexterity5()
{
    B_SetHeroAttributes	(ATR_DEXTERITY, 5, 5*LPCOST_ATTRIBUTE_DEXTERITY);

    Info_ClearChoices	(CH_Training_DEX);
};

func void CH_Dexterity10()
{
    B_SetHeroAttributes	(ATR_DEXTERITY, 10, 10*LPCOST_ATTRIBUTE_DEXTERITY);

    Info_ClearChoices	(CH_Training_DEX);
};

func void CH_Dexterity20()
{
    B_SetHeroAttributes	(ATR_DEXTERITY, 20, 20*LPCOST_ATTRIBUTE_DEXTERITY);

    Info_ClearChoices	(CH_Training_DEX);
};

func void CH_Dexterity_Weapon ()
{
	Info_ClearChoices	(CH_Training_DEX);

	var int value;
	var int	increase;

	if		(hero.level <= 5)	{	value = 16;	}
	else if	(hero.level <= 9)	{	value = 22;	}
	else if	(hero.level <= 15)	{	value = 28;	}
	else if	(hero.level <= 20)	{	value = 34;	}
	else if	(hero.level <= 25)	{	value = 40;	}
	else if	(hero.level <= 30)	{	value = 50;	};

	if (hero.attribute[ATR_DEXTERITY] < value)
	{
  		increase = value - hero.attribute[ATR_DEXTERITY];
    	B_SetHeroAttributes(ATR_DEXTERITY,increase,increase*LPCOST_ATTRIBUTE_DEXTERITY);

	    _ = AI_EquipBestRangedWeapon(hero);
	}
	else
	{
        _ = PrintScreen	("nötige DEX bereits vorhanden", -1,-1,FONT_OLD_BIG,10);
	};
};

func void CH_Dexterity_all()
{
    B_SetHeroAttributes(ATR_DEXTERITY, hero.lp, hero.lp*LPCOST_ATTRIBUTE_DEXTERITY);

    Info_ClearChoices	(CH_Training_DEX);
};

func void CH_Training_DEX_BACK()
{
	Info_ClearChoices	(CH_Training_DEX);
};


//#####################################################################
//##
//##
//##					ATTRIBUTE: Mana
//##
//##
//#####################################################################
INSTANCE CH_Training_Mana (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Mana_Condition;
	information		= CH_Training_Mana_Info;
	important		= 0;
	permanent		= 1;
	description		= "ATTRIBUTE: Mana";
};

FUNC INT CH_Training_Mana_Condition()
{
	if	(hero.LP > 0)
	{
		return TRUE;
	};
	return FALSE;
};

func void CH_Training_Mana_Info()
{
	Info_ClearChoices	(CH_Training_Mana);
	Info_AddChoice		(CH_Training_Mana, "BACK"	     					, CH_Training_Mana_BACK);
    Info_AddChoice		(CH_Training_Mana, "Mana (restliche Lernpunkte)" 	, CH_Mana_all);
	if	(hero.LP >= 20)
	{
        Info_AddChoice	(CH_Training_Mana, B_BuildLearnString(NAME_LearnMana_20,20*LPCOST_ATTRIBUTE_MANA,0)	, CH_Mana20);
    };
	if	(hero.LP >= 10)
	{
        Info_AddChoice	(CH_Training_Mana, B_BuildLearnString(NAME_LearnMana_10,10*LPCOST_ATTRIBUTE_MANA,0)	, CH_Mana10);
    };
	if	(hero.LP >= 5)
	{
		Info_AddChoice	(CH_Training_Mana, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		, CH_Mana5);
	};
	if	(hero.LP >= 1)
	{
	    Info_AddChoice	(CH_Training_Mana, B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		, CH_Mana1);
	};
};

func void CH_Mana1()
{
    B_SetHeroAttributes	(ATR_MANA_MAX,	1, LPCOST_ATTRIBUTE_MANA);
    B_SetHeroAttributes	(ATR_MANA,		1, 0);

    Info_ClearChoices	(CH_Training_Mana);
};

func void CH_Mana5()
{
    B_SetHeroAttributes	(ATR_MANA_MAX,	5, 5*LPCOST_ATTRIBUTE_MANA);
    B_SetHeroAttributes	(ATR_MANA, 		5, 0);


    Info_ClearChoices	(CH_Training_Mana);
};

func void CH_Mana10()
{
    B_SetHeroAttributes	(ATR_MANA_MAX,	10, 10*LPCOST_ATTRIBUTE_MANA);
    B_SetHeroAttributes	(ATR_MANA,		10, 00);

    Info_ClearChoices	(CH_Training_Mana);
};

func void CH_Mana20()
{
    B_SetHeroAttributes	(ATR_MANA_MAX,	20, 20*LPCOST_ATTRIBUTE_MANA);
    B_SetHeroAttributes	(ATR_MANA,		20, 00);

    Info_ClearChoices	(CH_Training_Mana);
};

func void CH_Mana_all()
{
	var int lp;
	lp = hero.lp;
    B_SetHeroAttributes	(ATR_MANA_MAX,	hero.lp, hero.lp*LPCOST_ATTRIBUTE_MANA);
	B_SetHeroAttributes	(ATR_MANA,		lp, 00);

    Info_ClearChoices	(CH_Training_Mana);
};

func void CH_Training_Mana_BACK()
{
	Info_ClearChoices	(CH_Training_Mana);
};


//#####################################################################
//##
//##
//##					TALENTE: Kampf
//##
//##
//#####################################################################
INSTANCE CH_Training_Combat (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Combat_Condition;
	information		= CH_Training_Combat_Info;
	important		= 0;
	permanent		= 1;
	description		= "TALENTE: Kampf";
};

FUNC INT CH_Training_Combat_Condition()
{
	if	(hero.LP > 0)
	{
		return TRUE;
	};
	return FALSE;
};

func void CH_Training_Combat_Info()
{
	Info_ClearChoices	(CH_Training_Combat);

	Info_AddChoice		(CH_Training_Combat, "BACK"	     				, CH_Training_Combat_BACK);

	if	(hero.LP >= LPCOST_TALENT_CROSSBOW_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_CROSSBOW) == 1)
	{
	    Info_AddChoice	(CH_Training_Combat, B_BuildLearnString(NAME_LearnCrossbow_2,	LPCOST_TALENT_CROSSBOW_2,	0)	,	CH_CrossbowL2);
	};

	if	(hero.LP >= LPCOST_TALENT_CROSSBOW_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_BOW) == 2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_CROSSBOW) == 0)
	{
	    Info_AddChoice	(CH_Training_Combat, B_BuildLearnString(NAME_LearnCrossbow_1,	LPCOST_TALENT_CROSSBOW_1,	0)	, CH_CrossbowL1);
	};

	if	(hero.LP >= LPCOST_TALENT_BOW_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_BOW) == 1)
	{
	    Info_AddChoice	(CH_Training_Combat, B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,	0)		, CH_BowL2);
	};

	if	(hero.LP >= LPCOST_TALENT_STAFF_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_STAFF) == 0)
	{
	    Info_AddChoice	(CH_Training_Combat, B_BuildLearnString(NAME_LearnStaff_1,		LPCOST_TALENT_STAFF_1,	0)		, CH_StaffL1);
	};

	if	(hero.LP >= LPCOST_TALENT_STAFF_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_STAFF) == 1)
	{
	    Info_AddChoice	(CH_Training_Combat, B_BuildLearnString(NAME_LearnStaff_2,		LPCOST_TALENT_STAFF_2,	0)		, CH_StaffL2);
	};

	if	(hero.LP >= LPCOST_TALENT_BOW_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_BOW) == 0)
	{
	    Info_AddChoice	(CH_Training_Combat, B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,	0)		, CH_BowL1);
	};

	if	(hero.LP >= LPCOST_TALENT_2H_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_2H) == 1)
	{
	    Info_AddChoice	(CH_Training_Combat, B_BuildLearnString(NAME_Learn2h_2,			LPCOST_TALENT_2H_2,	0)			, CH_2hL2);
	};

	if	(hero.LP >= LPCOST_TALENT_2H_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_2H) == 0)
	{
	    Info_AddChoice	(CH_Training_Combat, B_BuildLearnString(NAME_Learn2h_1,			LPCOST_TALENT_2H_1,	0)			, CH_2hL1);
	};

	if	(hero.LP >= LPCOST_TALENT_1H_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1)
	{
	    Info_AddChoice	(CH_Training_Combat, B_BuildLearnString(NAME_Learn1h_2,			LPCOST_TALENT_1H_2,	0)			, CH_1hL2);
	};

	if 	(hero.LP >= LPCOST_TALENT_1H_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0)
	{
	    Info_AddChoice	(CH_Training_Combat, B_BuildLearnString(NAME_Learn1h_1,			LPCOST_TALENT_1H_1,	0)			, CH_1hL1);
	};
};

func void CH_1hL1()
{
	Info_ClearChoices	(CH_Training_Combat);

    _ = B_GiveSkill			(hero, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1);
};

func void CH_1hL2()
{
	Info_ClearChoices	(CH_Training_Combat);

    _ = B_GiveSkill			(hero, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2);
};

func void CH_2hL1()
{
	Info_ClearChoices	(CH_Training_Combat);

    _ = B_GiveSkill			(hero, NPC_TALENT_2H, 1, LPCOST_TALENT_2H_1);
};

func void CH_2hL2()
{
	Info_ClearChoices	(CH_Training_Combat);

    _ = B_GiveSkill			(hero, NPC_TALENT_2H, 2, LPCOST_TALENT_2H_2);
};

func void CH_StaffL1()
{
	Info_ClearChoices	(CH_Training_Combat);

    _ = B_GiveSkill			(hero, NPC_TALENT_STAFF, 1, LPCOST_TALENT_STAFF_1);
};

func void CH_StaffL2()
{
	Info_ClearChoices	(CH_Training_Combat);

    _ = B_GiveSkill			(hero, NPC_TALENT_STAFF, 2, LPCOST_TALENT_STAFF_2);
};

func void CH_BowL1()
{
	Info_ClearChoices	(CH_Training_Combat);
    _ = B_GiveSkill			(hero, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1);
};

func void CH_BowL2()
{
	Info_ClearChoices	(CH_Training_Combat);
    _ = B_GiveSkill			(hero, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2);
};

func void CH_CrossbowL1()
{
	Info_ClearChoices	(CH_Training_Combat);
    _ = B_GiveSkill			(hero, NPC_TALENT_CROSSBOW, 1, LPCOST_TALENT_CROSSBOW_1);
};

func void CH_CrossbowL2()
{
	Info_ClearChoices	(CH_Training_Combat);
    _ = B_GiveSkill			(hero, NPC_TALENT_CROSSBOW, 2, LPCOST_TALENT_CROSSBOW_2);
};

func void CH_Training_Combat_BACK()
{
	Info_ClearChoices	(CH_Training_Combat);
};



//#####################################################################
//##
//##
//##					TALENTE: Magie
//##
//##
//#####################################################################
INSTANCE CH_Training_Magic (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Magic_Condition;
	information		= CH_Training_Magic_Info;
	important		= 0;
	permanent		= 1;
	description		= "TALENTE: Magie";
};

FUNC INT CH_Training_Magic_Condition()
{
	if	(hero.LP > 0)
	{
		return TRUE;
	};
	return FALSE;
};

func void CH_Training_Magic_Info()
{
	Info_ClearChoices	(CH_Training_Magic);
	Info_AddChoice		(CH_Training_Magic, "BACK"	     					, CH_Training_Magic_BACK);


 	//-------- Alchemie --------
    if	(hero.LP >= LPCOST_TALENT_ALCHEMY_3)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY) == TAL_STEP_2)
	{
	    Info_AddChoice	(CH_Training_Magic,	B_BuildLearnString(NAME_LearnAlchemy_3,		LPCOST_TALENT_ALCHEMY_3,	0),			CH_Alchemie3);
	};
    if	(hero.LP >= LPCOST_TALENT_ALCHEMY_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY) == TAL_STEP_1)
	{
	    Info_AddChoice	(CH_Training_Magic,	B_BuildLearnString(NAME_LearnAlchemy_2,		LPCOST_TALENT_ALCHEMY_2,	0),			CH_Alchemie2);
	};
	if	(hero.LP >= LPCOST_TALENT_ALCHEMY_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY) == 0)
	{
	    Info_AddChoice	(CH_Training_Magic,	B_BuildLearnString(NAME_LearnAlchemy_1,		LPCOST_TALENT_ALCHEMY_1,	0),			CH_Alchemie1);
	};

	//-------- Runen Erschaffen ---------
     if	(hero.LP >= LPCOST_TALENT_THAUMATURGY_3)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_THAUMATURGY) == TAL_STEP_2)
	{
	    Info_AddChoice	(CH_Training_Magic,	B_BuildLearnString(NAME_LearnThaumaturgy_3,		LPCOST_TALENT_ALCHEMY_3,	0),			CH_Thaumaturgy3);
	};
   if	(hero.LP >= LPCOST_TALENT_THAUMATURGY_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_THAUMATURGY) == TAL_STEP_1)
	{
	    Info_AddChoice	(CH_Training_Magic,	B_BuildLearnString(NAME_LearnThaumaturgy_2,		LPCOST_TALENT_ALCHEMY_2,	0),			CH_Thaumaturgy2);
	};
	if	(hero.LP >= LPCOST_TALENT_THAUMATURGY_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_THAUMATURGY) == 0)
	{
	    Info_AddChoice	(CH_Training_Magic,	B_BuildLearnString(NAME_LearnThaumaturgy_1,		LPCOST_TALENT_ALCHEMY_1,	0),			CH_Thaumaturgy1);
	};

	//-------- Magische Kreise ---------
	if	(hero.lp >= LPCOST_TALENT_MAGE_6)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice	(CH_Training_Magic,	B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,	0),	CH_Magic6);
	};
	if	(hero.lp >= LPCOST_TALENT_MAGE_5)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice	(CH_Training_Magic, B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,	0), CH_Magic5);
	};
	if	(hero.lp >= LPCOST_TALENT_MAGE_4)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice	(CH_Training_Magic, B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,	0), CH_Magic4);
	};
	if	(hero.lp >= LPCOST_TALENT_MAGE_3)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice	(CH_Training_Magic, B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,	0), CH_Magic3);
	};
	if	(hero.lp >= LPCOST_TALENT_MAGE_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice	(CH_Training_Magic, B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,	0), CH_Magic2);
	};
	if	(hero.lp >= LPCOST_TALENT_MAGE_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 0)
	{
		Info_AddChoice	(CH_Training_Magic, B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,	0), CH_Magic1);
	};
};

func void CH_Magic1()
{
	Info_ClearChoices	(CH_Training_Magic);
    _ = B_GiveSkill			(hero, NPC_TALENT_MAGE, 1, LPCOST_TALENT_MAGE_1);

    CreateInvItem		(hero,ItAr_RuneLight);
    CreateInvItem		(hero,ItAr_RuneFirebolt);
    CreateInvItem		(hero,ItAr_RuneThunderbolt);

	CreateInvItems		(hero,ItAr_ScrollTrfScavenger,	10);
	CreateInvItems		(hero,ItAr_ScrollTrfMolerat,	10);
	CreateInvItems		(hero,ItAr_ScrollTrfWaran,		10);
};

func void CH_Magic2()
{
	Info_ClearChoices	(CH_Training_Magic);

    _ = B_GiveSkill			(hero, NPC_TALENT_MAGE, 2, LPCOST_TALENT_MAGE_2);

    CreateInvItem		(hero,ItAr_RuneHeal);
    CreateInvItem		(hero,ItAr_RuneSleep);
    CreateInvItem		(hero,ItAr_RuneWindfist);

	CreateInvItems		(hero,ItAr_ScrollTrfWolf,		10);
	CreateInvItems 	 	(hero,ItAr_ScrollTrfBloodfly,	10);
	CreateInvItems		(hero,ItAr_ScrollTrfLurker,		10);
};

func void CH_Magic3()
{
	Info_ClearChoices	(CH_Training_Magic);

    _ = B_GiveSkill			(hero, NPC_TALENT_MAGE, 3, LPCOST_TALENT_MAGE_3);

 	CreateInvItem		(hero,ItAr_RuneTelekinesis);
    CreateInvItem		(hero,ItAr_RunePyrokinesis);
    CreateInvItem		(hero,ItAr_RuneIceCube);
    CreateInvItem		(hero,ItAr_RuneCharm);
    CreateInvItem		(hero,ItAr_RuneFireball);
    CreateInvItem		(hero,ItAr_RuneThunderball);

	CreateInvItems		(hero,ItAr_ScrollTrfMeatbug,		10);
	CreateInvItems		(hero,ItAr_ScrollTrfCrawler,		10);
	CreateInvItems		(hero,ItAr_ScrollTrfSnapper,		10);
	CreateInvItems		(hero,ItAr_ScrollSummonSkeletons,10);
};

func void CH_Magic4()
{
	Info_ClearChoices	(CH_Training_Magic);

    _ = B_GiveSkill			(hero, NPC_TALENT_MAGE, 4, LPCOST_TALENT_MAGE_4);

    CreateInvItem		(hero,ItAr_RuneControl);
    CreateInvItem		(hero,ItAr_RuneChainLightning);
    CreateInvItem		(hero,ItAr_RuneStormfist);
    CreateInvItem		(hero,ItAr_RuneDestroyUndead);
    CreateInvItem		(hero,ItAr_RuneFirestorm);

	CreateInvItems		(hero,ItAr_ScrollTrfOrcdog,		10);
	CreateInvItems		(hero,ItAr_ScrollTrfShadowbeast,	10);
	CreateInvItems		(hero,ItAr_ScrollSummonGolem,	10);
	CreateInvItems		(hero,ItAr_ScrollFear,			10);
	CreateInvItems		(hero,ItAr_ScrollBerzerk,		10);
	CreateInvItems		(hero,ItAr_ScrollShrink,			10);
};

func void CH_Magic5()
{
	Info_ClearChoices	(CH_Training_Magic);

    _ = B_GiveSkill			(hero, NPC_TALENT_MAGE, 5, LPCOST_TALENT_MAGE_5);

    CreateInvItem		(hero,ItAr_RuneIceWave);
    CreateInvItem		(hero,ItAr_RuneFireRain);

	CreateInvItems		(hero,ItAr_ScrollSummonDemon,	10);
};

func void CH_Magic6()
{
	Info_ClearChoices	(CH_Training_Magic);

    _ = B_GiveSkill			(hero, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6);

	CreateInvItem		(hero,ItAr_RuneBreathOfDeath);

	CreateInvItems		(hero,ItAr_ScrollArmyOfDarkness,	10);
};

func void CH_Alchemie1()
{
	Info_ClearChoices	(CH_Training_Magic);
    _ = B_GiveSkill			(hero, NPC_TALENT_ALCHEMY, 1, LPCOST_TALENT_ALCHEMY_1);
};

func void CH_alchemie2()
{
	Info_ClearChoices	(CH_Training_Magic);
    _ = B_GiveSkill			(hero, NPC_TALENT_ALCHEMY, 2, LPCOST_TALENT_ALCHEMY_2);
};

func void CH_Alchemie3()
{
	Info_ClearChoices	(CH_Training_Magic);
    _ = B_GiveSkill			(hero, NPC_TALENT_ALCHEMY, 3, LPCOST_TALENT_ALCHEMY_3);
};

func void CH_Thaumaturgy1()
{
	Info_ClearChoices	(CH_Training_Magic);
    _ = B_GiveSkill			(hero, NPC_TALENT_THAUMATURGY, 1, LPCOST_TALENT_THAUMATURGY_1);
};

func void CH_Thaumaturgy2()
{
	Info_ClearChoices	(CH_Training_Magic);
    _ = B_GiveSkill			(hero, NPC_TALENT_THAUMATURGY, 2, LPCOST_TALENT_thaumaturgy_2);
};

func void CH_Thaumaturgy3()
{
	Info_ClearChoices	(CH_Training_Magic);
    _ = B_GiveSkill			(hero, NPC_TALENT_THAUMATURGY, 3, LPCOST_TALENT_THAUMATURGY_3);
};

func void CH_Training_Magic_BACK()
{
	Info_ClearChoices	(CH_Training_Magic);
};



//#####################################################################
//##
//##
//##					TALENTE: Dieb
//##
//##
//#####################################################################
INSTANCE CH_Training_Thievery (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Thievery_Condition;
	information		= CH_Training_Thievery_Info;
	important		= 0;
	permanent		= 1;
	description		= "TALENTE: Dieb";
};

FUNC INT CH_Training_Thievery_Condition()
{
	if	(hero.LP > 0)
	{
		return TRUE;
	};
	return FALSE;
};


func void CH_Training_Thievery_Info()
{
	Info_ClearChoices	(CH_Training_Thievery);


	Info_AddChoice		(CH_Training_Thievery, "BACK",																			CH_Training_Thievery_BACK);

    if	(hero.LP >= LPCOST_TALENT_ACROBAT)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) == 0)
	{
	    Info_AddChoice	(CH_Training_Thievery,	B_BuildLearnString(NAME_LearnAcrobat,		LPCOST_TALENT_ACROBAT,	0),			CH_Acrobat);
	};
	if	(hero.LP >= LPCOST_TALENT_SNEAK)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0)
	{
	    Info_AddChoice	(CH_Training_Thievery,	B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,	0), 		CH_Sneak);
	};
	if	(hero.LP >= LPCOST_TALENT_PICKPOCKET_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1)
	{
	    Info_AddChoice	(CH_Training_Thievery,	B_BuildLearnString(NAME_LearnPickpocket_2,	LPCOST_TALENT_PICKPOCKET_2,	0),		CH_Pickpocket2);
	};
	if	(hero.LP >= LPCOST_TALENT_PICKPOCKET_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0)
	{
	    Info_AddChoice	(CH_Training_Thievery,	B_BuildLearnString(NAME_LearnPickpocket_1,	LPCOST_TALENT_PICKPOCKET_1,	0),		CH_Pickpocket1);
	};
	if	(hero.LP >= LPCOST_TALENT_PICKLOCK_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1)
	{
	    Info_AddChoice	(CH_Training_Thievery,	B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,	0),		CH_Picklock2);
	};
	if	(hero.LP >= LPCOST_TALENT_PICKLOCK_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0)
	{
	    Info_AddChoice	(CH_Training_Thievery, B_BuildLearnString(NAME_LearnPicklock_1,		LPCOST_TALENT_PICKLOCK_1,	0),		CH_Picklock1);
	};
};

func void CH_Picklock1()
{
	Info_ClearChoices	(CH_Training_Thievery);
    _ = B_GiveSkill			(hero, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1);
};

func void CH_Picklock2()
{
	Info_ClearChoices	(CH_Training_Thievery);
    _ = B_GiveSkill			(hero, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2);
};

func void CH_Pickpocket1()
{
	Info_ClearChoices	(CH_Training_Thievery);
    _ = B_GiveSkill			(hero, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1);
};

func void CH_Pickpocket2()
{
	Info_ClearChoices	(CH_Training_Thievery);
    _ = B_GiveSkill			(hero, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2);
};

func void CH_Sneak()
{
	Info_ClearChoices	(CH_Training_Thievery);
    _ = B_GiveSkill			(hero, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK);
};

func void CH_Acrobat()
{
	Info_ClearChoices	(CH_Training_Thievery);
    _ = B_GiveSkill			(hero, NPC_TALENT_ACROBAT, 1, LPCOST_TALENT_ACROBAT);
};

func void CH_Training_Thievery_BACK()
{
	Info_ClearChoices	(CH_Training_Thievery);
};





//#####################################################################
//##
//##
//##					TALENTE: Handwerk
//##
//##
//#####################################################################
INSTANCE CH_Training_Craft (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Craft_Condition;
	information		= CH_Training_Craft_Info;
	important		= 0;
	permanent		= 1;
	description		= "TALENTE: Handwerk";
};

FUNC INT CH_Training_Craft_Condition()
{
	if	(hero.LP > 0)
	{
		return TRUE;
	};
	return FALSE;
};


func void CH_Training_Craft_Info()
{
	Info_ClearChoices	(CH_Training_Craft);


	Info_AddChoice		(CH_Training_Craft, "BACK"	     						, CH_Training_Craft_BACK);

	//-------- Bogenmachen --------
	if	(hero.LP >= LPCOST_TALENT_BOWMAKER_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_BOWMAKER) == 0)
	{
	    Info_AddChoice	(CH_Training_Craft,	B_BuildLearnString(NAME_LearnBowmaker_1,		LPCOST_TALENT_BOWMAKER_1,	0),			CH_Bow1);
	};

    if	(hero.LP >= LPCOST_TALENT_BOWMAKER_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_BOWMAKER) == TAL_STEP_1)
	{
	    Info_AddChoice	(CH_Training_Craft,	B_BuildLearnString(NAME_LearnBowmaker_2,		LPCOST_TALENT_BOWMAKER_2,	0),			CH_Bow2);
	};

    if	(hero.LP >= LPCOST_TALENT_BOWMAKER_3)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_BOWMAKER) == TAL_STEP_2)
	{
	    Info_AddChoice	(CH_Training_Craft,	B_BuildLearnString(NAME_LearnBowmaker_3,		LPCOST_TALENT_BOWMAKER_3,	0),			CH_Bow3);
	};

	//-------- Kochen --------
	if	(hero.LP >= LPCOST_TALENT_COOK_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) == 0)
	{
	    Info_AddChoice	(CH_Training_Craft,	B_BuildLearnString(NAME_LearnCook_1,		LPCOST_TALENT_COOK_1,	0),			CH_Cook1);
	};

    if	(hero.LP >= LPCOST_TALENT_COOK_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) == TAL_STEP_1)
	{
	    Info_AddChoice	(CH_Training_Craft,	B_BuildLearnString(NAME_LearnCook_2,		LPCOST_TALENT_COOK_2,	0),			CH_COOK2);
	};

    if	(hero.LP >= LPCOST_TALENT_COOK_3)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) == TAL_STEP_2)
	{
	    Info_AddChoice	(CH_Training_Craft,	B_BuildLearnString(NAME_LearnCook_3,		LPCOST_TALENT_COOK_3,	0),			CH_COOK3);
	};

	//-------- Schmieden --------
    if	(hero.LP >= LPCOST_TALENT_SMITH_1)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) == 0)
	{
	    Info_AddChoice	(CH_Training_Craft,	B_BuildLearnString(NAME_LearnSmith_1,		LPCOST_TALENT_SMITH_1,	0),			CH_Smith1);
	};

    if	(hero.LP >= LPCOST_TALENT_SMITH_2)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) == 1)
	{
	    Info_AddChoice	(CH_Training_Craft,	B_BuildLearnString(NAME_LearnSmith_2,		LPCOST_TALENT_SMITH_2,	0),			CH_Smith2);
	};

    if	(hero.LP >= LPCOST_TALENT_SMITH_3)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) == 2)
	{
	    Info_AddChoice	(CH_Training_Craft,	B_BuildLearnString(NAME_LearnSmith_3,		LPCOST_TALENT_SMITH_3,	0),			CH_Smith3);
	};
};

func void CH_Smith1()
{
	Info_ClearChoices	(CH_Training_Craft);
    _ = B_GiveSkill			(hero, NPC_TALENT_SMITH, 1, LPCOST_TALENT_SMITH_1);
};

func void CH_Smith2()
{
	Info_ClearChoices	(CH_Training_Craft);
    _ = B_GiveSkill			(hero, NPC_TALENT_SMITH, 2, LPCOST_TALENT_SMITH_2);
};

func void CH_Smith3()
{
	Info_ClearChoices	(CH_Training_Craft);
    _ = B_GiveSkill			(hero, NPC_TALENT_SMITH, 3, LPCOST_TALENT_SMITH_3);
};


func void CH_Training_Craft_BACK()
{
	Info_ClearChoices	(CH_Training_Craft);
};

func void CH_Cook1()
{
	Info_ClearChoices	(CH_Training_Craft);
    _ = B_GiveSkill			(hero, NPC_TALENT_COOK, 1, LPCOST_TALENT_COOK_1);
};

func void CH_Cook2()
{
	Info_ClearChoices	(CH_Training_Craft);
    _ = B_GiveSkill			(hero, NPC_TALENT_COOK, 2, LPCOST_TALENT_COOK_2);
};

func void CH_Cook3()
{
	Info_ClearChoices	(CH_Training_Craft);
    _ = B_GiveSkill			(hero, NPC_TALENT_COOK, 3, LPCOST_TALENT_COOK_3);
};


func void CH_Bow1()
{
	Info_ClearChoices	(CH_Training_Craft);
    _ = B_GiveSkill			(hero, NPC_TALENT_BOWMAKER, 1, LPCOST_TALENT_BOWMAKER_1);
};

func void CH_Bow2()
{
	Info_ClearChoices	(CH_Training_Craft);
    _ = B_GiveSkill			(hero, NPC_TALENT_BOWMAKER, 2, LPCOST_TALENT_BOWMAKER_2);
};

func void CH_Bow3()
{
	Info_ClearChoices	(CH_Training_Craft);
    _ = B_GiveSkill			(hero, NPC_TALENT_BOWMAKER, 3, LPCOST_TALENT_BOWMAKER_3);
};





//#####################################################################
//##
//##
//##					WISSEN: Waffenschmieden
//##
//##
//#####################################################################
INSTANCE CH_Training_SmithKnowledge (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_SmithKnowledge_Condition;
	information		= CH_Training_SmithKnowledge_Info;
	important		= 0;
	permanent		= 1;
	description		= "WISSEN: Waffenschmieden";
};

FUNC INT CH_Training_SmithKnowledge_Condition()
{
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};


func void CH_Training_SmithKnowledge_Info()
{
	Info_ClearChoices	(CH_Training_SmithKnowledge);


	Info_AddChoice		(CH_Training_SmithKnowledge, "BACK",					CH_Training_SmithKnowledge_BACK);

	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_Orchammer
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_Orchammer,			CH_Orchammer);
	};
 	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_Warhammer

	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_Warhammer,			CH_Warhammer);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_Morningstar

	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_Morningstar,		CH_Morningstar);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_Mace
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_Mace,				CH_Mace);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_Ironclub
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_Ironclub,			CH_Ironclub);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_OrcAxe
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_OrcAxe,			CH_OrcAxe);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_BerserkAxe
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_BerserkAxe,		CH_BerserkAxe);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_DoublebladedAxe
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_DoublebladedAxe,	CH_DoublebladedAxe);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_Battleaxe
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_Battleaxe,			CH_Battleaxe);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_Hatchet
    {
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_Hatchet,			CH_Hatchet);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_OrcSword
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_OrcSword,			CH_OrcSword);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_2HSword
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_2HSword,			CH_2HSword);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_Bastardsword
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_Bastardsword,		CH_Bastardsword);
	};
    if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_Broadsword
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_Broadsword,		CH_Broadsword);
	};
    if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_Longsword
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_Longsword,			CH_Longsword);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
    &&	!Knows_Shortsword
	{
	    Info_AddChoice	(CH_Training_SmithKnowledge,	NAME_Shortsword,		CH_Shortsword);
	};
};

func void CH_Shortsword      ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnShortsword      ();		};
func void CH_Longsword       ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnLongsword       ();		};
func void CH_Broadsword      ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnBroadsword      ();		};
func void CH_Bastardsword    ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnBastardsword    ();		};
func void CH_2HSword         ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_Learn2HSword         ();		};
func void CH_OrcSword        ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnOrcSword        ();		};
func void CH_Hatchet         ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnHatchet         ();		};
func void CH_Battleaxe       ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnBattleaxe       ();		};
func void CH_DoublebladedAxe ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnDoublebladedAxe ();		};
func void CH_BerserkAxe      ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnBerserkAxe      ();		};
func void CH_OrcAxe          ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnOrcAxe          ();		};
func void CH_IronClub        ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnIronClub        ();		};
func void CH_Mace            ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnMace            ();		};
func void CH_Morningstar     ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnMorningstar     ();		};
func void CH_Warhammer       ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnWarhammer       ();		};
func void CH_OrcHammer       ()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnOrcHammer       ();		};

func void CH_Training_SmithKnowledge_BACK()
{
	Info_ClearChoices	(CH_Training_SmithKnowledge);
};







//#####################################################################
//##
//##
//##					WISSEN: Kochen
//##
//##
//#####################################################################
INSTANCE CH_Training_CookKnowledge (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_CookKnowledge_Condition;
	information		= CH_Training_CookKnowledge_Info;
	important		= 0;
	permanent		= 1;
	description		= "WISSEN: Kochrezepte";
};

FUNC INT CH_Training_CookKnowledge_Condition()
{
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= TAL_STEP_1)
	{
		return TRUE;
	};
	return FALSE;
};


func void CH_Training_CookKnowledge_Info()
{
	Info_ClearChoices	(CH_Training_CookKnowledge);

	Info_AddChoice		(CH_Training_CookKnowledge, "BACK",					CH_Training_CookKnowledge_BACK);

	if	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= TAL_STEP_1)
    &&	!Knows_RecipeMeatbug
	{
	    Info_AddChoice	(CH_Training_CookKnowledge,	NAME_RecipeMeatbug,			CH_Meatbug);
	};
 	if	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= TAL_STEP_1)
    &&	!Knows_RecipeHerb
	{
	    Info_AddChoice	(CH_Training_CookKnowledge,	NAME_RecipeHerb,			CH_Herb);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= TAL_STEP_1)
    &&	!Knows_RecipeMushroom
	{
	    Info_AddChoice	(CH_Training_CookKnowledge,	NAME_RecipeMushroom,		CH_Mushroom);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= TAL_STEP_1)
    &&	!Knows_RecipeMeat
	{
	    Info_AddChoice	(CH_Training_CookKnowledge,	NAME_RecipeMeat,			CH_Meat);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= TAL_STEP_1)
    &&	!Knows_RecipeMolerat
	{
	    Info_AddChoice	(CH_Training_CookKnowledge,	NAME_RecipeMolerat,			CH_Molerat);
	};
};

func void CH_Training_CookKnowledge_BACK()
{
	Info_ClearChoices	(CH_Training_CookKnowledge);
};

func void CH_Meatbug     	()		{	B_LearnRecipeMeatbug      	();		};
func void CH_Herb       	()		{	B_LearnRecipeHerb 	      	();		};
func void CH_Mushroom      	()		{	B_LearnRecipeMushroom    	();		};
func void CH_Meat    		()		{	B_LearnRecipeMeat    		();		};
func void CH_Molerat       	()		{	B_LearnRecipeMolerat	    ();		};







//#####################################################################
//##
//##
//##					WISSEN: Alchemie
//##
//##
//#####################################################################
INSTANCE CH_Training_AlchemieKnowledge (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_AlchemieKnowledge_Condition;
	information		= CH_Training_AlchemieKnowledge_Info;
	important		= 0;
	permanent		= 1;
	description		= "WISSEN: Alchemie";
};

FUNC INT CH_Training_AlchemieKnowledge_Condition()
{
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_Alchemy) >= TAL_STEP_1)
	{
		return TRUE;
	};
	return FALSE;
};


func void CH_Training_AlchemieKnowledge_Info()
{
	Info_ClearChoices	(CH_Training_AlchemieKnowledge);

	Info_AddChoice		(CH_Training_AlchemieKnowledge, "BACK",					CH_Training_AlchemieKnowledge_BACK);

	if	(Npc_GetTalentSkill(hero, NPC_TALENT_Alchemy) >= TAL_STEP_1)
    &&	!Knows_SpeedPotions
	{
	    Info_AddChoice	(CH_Training_AlchemieKnowledge,	Name_BookSpeedPotions,		CH_Speed);
	};
 	if	(Npc_GetTalentSkill(hero, NPC_TALENT_Alchemy) >= TAL_STEP_1)
    &&	!Knows_ManaPotions
	{
	    Info_AddChoice	(CH_Training_AlchemieKnowledge,	Name_BookManaPotions,			CH_Mana);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_Alchemy) >= TAL_STEP_1)
    &&	!Knows_HealingPotions
	{
	    Info_AddChoice	(CH_Training_AlchemieKnowledge,	Name_BookHealingPotions,		CH_Healing);
	};
};

func void CH_Training_AlchemieKnowledge_BACK()
{
	Info_ClearChoices	(CH_Training_AlchemieKnowledge);
};

func void CH_Mana     		()		{		B_LearnRecipeManaPotions      	();		};
func void CH_Healing     	()		{		B_LearnRecipeHealingPotions     ();		};
func void CH_Speed     		()		{		B_LearnRecipeSpeedPotions      	();		};








//#####################################################################
//##
//##
//##					WISSEN: Bogenmachen
//##
//##
//#####################################################################
INSTANCE CH_Training_BowKnowledge (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_BowKnowledge_Condition;
	information		= CH_Training_BowKnowledge_Info;
	important		= 0;
	permanent		= 1;
	description		= "WISSEN: Bogenmachen";
};

FUNC INT CH_Training_BowKnowledge_Condition()
{
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_BOWMAKER) >= TAL_STEP_1)
	{
		return TRUE;
	};
	return FALSE;
};


func void CH_Training_BowKnowledge_Info()
{
	Info_ClearChoices	(CH_Training_BowKnowledge);

	Info_AddChoice		(CH_Training_BowKnowledge, "BACK",					CH_Training_BowKnowledge_BACK);

	if	(Npc_GetTalentSkill(hero, NPC_TALENT_BOWMAKER) >= TAL_STEP_1)
    &&	!Knows_RecipeBow
	{
	    Info_AddChoice	(CH_Training_BowKnowledge,	NAME_ItWr_Bow,			CH_Bow);
	};
 	if	(Npc_GetTalentSkill(hero, NPC_TALENT_BOWMAKER) >= TAL_STEP_1)
    &&	!Knows_RecipeLongBow
	{
	    Info_AddChoice	(CH_Training_BowKnowledge,	NAME_ItWr_LongBow,		CH_LongBow);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_BOWMAKER) >= TAL_STEP_1)
    &&	!Knows_RecipeCrossBow
	{
	    Info_AddChoice	(CH_Training_BowKnowledge,	NAME_ItWr_CrossBow,		CH_CrossBow);
	};

};

func void CH_Training_BowKnowledge_BACK()
{
	Info_ClearChoices	(CH_Training_BowKnowledge);
};

func void CH_Bow     		()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnRecipeBow      		();		};
func void CH_LongBow       	()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnRecipeLongBow 	   	();		};
func void CH_CrossBow      	()		{	/*Info_ClearChoices(CH_Training_SmithKnowledge);*/	B_LearnRecipeCrossBow    	();		};




//#####################################################################
//##
//##
//##					ROHSTOFFE & WERKZEUGE
//##
//##
//#####################################################################
INSTANCE CH_Training_Equipment (C_INFO)
{
	npc				= CH;
	condition		= CH_Training_Equipment_Condition;
	information		= CH_Training_Equipment_Info;
	important		= 0;
	permanent		= 1;
	description		= "ROHSTOFFE & WERKZEUGE";
};

FUNC INT CH_Training_Equipment_Condition()
{
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH)			>= 1)
	||	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK)			>= 1)
	||	(Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY)		>= 1)
	||	(Npc_GetTalentSkill(hero, NPC_TALENT_THAUMATURGY)	>= 1)
	||	(Npc_GetTalentSkill(hero, NPC_TALENT_BOWMAKER)		>= 1)
	{
		return TRUE;
	};
	return FALSE;
};


func void CH_Training_Equipment_Info()
{
	Info_ClearChoices	(CH_Training_Equipment);


	Info_AddChoice		(CH_Training_Equipment, 	"BACK",					CH_Training_Equipment_BACK);

	if	(Npc_GetTalentSkill(hero, NPC_TALENT_BOWMAKER)	>= 1)
	{
	    Info_AddChoice	(CH_Training_Equipment,	"...fürs Bogenmachen",		CH_Training_Equipment_BOWMAKER);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_THAUMATURGY)>= 1)
	{
	    Info_AddChoice	(CH_Training_Equipment,	"...fürs Runenmachen",		CH_Training_Equipment_THAUMATURGY);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY)	>= 1)
	{
	    Info_AddChoice	(CH_Training_Equipment,	"...für Alchemie",			CH_Training_Equipment_ALCHEMY);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) 		>= 1)
	{
	    Info_AddChoice	(CH_Training_Equipment,	"...fürs Kochen",			CH_Training_Equipment_COOK);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) 	>= 1)
	{
	    Info_AddChoice	(CH_Training_Equipment,	"...fürs Schmieden",		CH_Training_Equipment_SMITH);
	};
};



func void CH_Training_Equipment_SMITH ()
{
	Info_ClearChoices	(CH_Training_Equipment);

	CreateInvItems(hero,	ItMi_Pliers,		1);
	CreateInvItems(hero,	ItMw_Sledgehammer,	1);
	CreateInvItems(hero,	ItMw_Pickaxe,		1);

	CreateInvItems(hero,	ItMi_OreNugget,		100);
	CreateInvItems(hero,	ItMi_BloodOreNugget,100);
	CreateInvItems(hero,	ItMi_DarkOreNugget,	100);
};

func void CH_Training_Equipment_COOK ()
{
	Info_ClearChoices	(CH_Training_Equipment);

	CreateInvItems(hero,	ItMi_Scoop,			1);

	CreateInvItems(hero,	ItMi_Salt,			20);
	CreateInvItems(hero,	ItAt_Meatbug,		10);
	CreateInvItems(hero,	ItAt_MoleratGrease,	10);
	CreateInvItems(hero,	ItPl_Swampweed,		10);
	CreateInvItems(hero,	ItPl_CaveMushroom,	10);
	CreateInvItems(hero,	ItFo_Mutton,		10);
	CreateInvItems(hero,	ItFo_Loaf,			10);
	CreateInvItems(hero,	ItFo_Cheese,		10);
	CreateInvItems(hero,	ItFo_Ham,			10);
};

func void CH_Training_Equipment_ALCHEMY ()
{
	Info_ClearChoices	(CH_Training_Equipment);

	CreateInvItems(hero,	ItMi_Alcohol,		10);
	CreateInvItems(hero,	ItPl_MountainMoss,	10);
	CreateInvItems(hero,	ItPl_Stoneroot,		10);
	CreateInvItems(hero,	ItPl_BloodThistle,	10);
	CreateInvItems(hero,	ItPl_OrcLeaf,		10);
	CreateInvItems(hero,	ItPl_Nightshade,	10);
	CreateInvItems(hero,	ItPl_RavenHerb,		10);

};

func void CH_Training_Equipment_THAUMATURGY ()
{
	Info_ClearChoices	(CH_Training_Equipment);
	CreateInvItems(hero,	ItMi_Pliers,				1);
	CreateInvItems(hero,	ItMw_Sledgehammer,			1);

	CreateInvItems(hero,	ItMi_OreNugget,				100);
	CreateInvItems(hero,	ItMi_BloodOreNugget,		100);
	CreateInvItems(hero,	ItMi_DarkOreNugget,			100);

	CreateInvItems(hero,	ItAr_RuneBlank,				10);
	CreateInvItems(hero,	ItAr_BloodRuneBlank,		10);
	CreateInvItems(hero,	ItAr_DarkRuneBlank,			10);

	CreateInvItems(hero,	ItAr_ScrollLight,			5);
	CreateInvItems(hero,	ItAr_ScrollFirebolt,		5);
	CreateInvItems(hero,	ItAr_ScrollHeal,			5);
	CreateInvItems(hero,	ItAr_ScrollThunderbolt,		5);
	CreateInvItems(hero,	ItAr_ScrollWindfist,		5);
	CreateInvItems(hero,	ItAr_ScrollSleep,			5);
	CreateInvItems(hero,	ItAr_ScrollCharm,			5);
	CreateInvItems(hero,	ItAr_ScrollThunderball,		5);
	CreateInvItems(hero,	ItAr_ScrollIceCube,			5);
	CreateInvItems(hero,	ItAr_ScrollPyrokinesis,		5);
	CreateInvItems(hero,	ItAr_ScrollDestroyUndead,	5);
	CreateInvItems(hero,	ItAr_ScrollChainLightning,	5);
	CreateInvItems(hero,	ItAr_ScrollStormfist,		5);
	CreateInvItems(hero,	ItAr_ScrollTelekinesis,		5);
	CreateInvItems(hero,	ItAr_ScrollFireball,		5);
	CreateInvItems(hero,	ItAr_ScrollFirestorm,		5);
	CreateInvItems(hero,	ItAr_ScrollControl,			5);
	CreateInvItems(hero,	ItAr_ScrollBreathOfDeath,	5);
	CreateInvItems(hero,	ItAr_ScrollIceWave,			5);
	CreateInvItems(hero,	ItAr_ScrollFireRain,		5);
};

func void CH_Training_Equipment_BOWMAKER ()
{
	Info_ClearChoices	(CH_Training_Equipment);
	CreateInvItems(hero,	ItMi_FletcherWood,		100);
	CreateInvItems(hero,	ItMi_FletcherKnife,		1);
};





func void CH_Training_Equipment_BACK()
{
	Info_ClearChoices	(CH_Training_Equipment);
};




