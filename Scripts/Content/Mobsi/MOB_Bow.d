/////////////////////////////////////////////////////////////////
//	Hilfsfunktionen für den Bogenmacher	(JP)
//	===================================
//
//	-Die Funktionen folgen in der Benennung dem Schema
//	B_CanProduce[Produkt] und überprüfen dann entsprechend, ob Talent,
//	Zutaten und Rezeptur vorhanden bzw. bekannt sind
//
///////////////////////////////////////////////////////////////////
/**/
func int MOB_BOW_HasBasics()
{
	if ((hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BOW)
	&& (Npc_HasItems(self, ItMi_Fletcherknife) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func int MOB_BOW_CanProduceShortBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceShortBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_ShortBow)
	&& Knows_RecipeBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceRiderBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceRiderBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_RiderBow)
	&& Knows_RecipeBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceFieldBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceFieldBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_FieldBow)
	&& Knows_RecipeBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceHuntingBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceHuntingBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_HuntingBow)
	&& Knows_RecipeBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceLongBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceLongBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_LongBow)
	&& Knows_RecipeLongBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceHedgeBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceHedgeBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_HedgeBow)
	&& Knows_RecipeLongBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceYewBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceYewBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_YewBow)
	&& Knows_RecipeLongBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceArmyBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceArmyBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_ArmyBow)
	&& Knows_RecipeLongBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceWarBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceWarBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_WarBow)
	&& Knows_RecipeLongBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceStormBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceStormBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_StormBow)
	&& Knows_RecipeLongBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceLightCrossBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceLightCrossBow");
	if (Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_2
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_CrossBow)
	&& Knows_RecipeCrossBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceCrossBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceCrossBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_CrossBow)
	&& Knows_RecipeCrossBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceHeavyCrossBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceHeavyCrossBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_HeavyCrossBow)
	&& Knows_RecipeCrossBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceWarCrossBow()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceWarCrossBow");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_FletcherWood) >= Amnt_WarCrossBow)
	&& Knows_RecipeCrossBow
	&& MOB_BOW_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

/////////////////////////////////////////////////////////////////
//
//	Sammelfunktionen für die Rezeptkategorien
//
/////////////////////////////////////////////////////////////////

func int MOB_BOW_CanProduceBows()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceBow");
	if (MOB_BOW_CanProduceShortBow()
	|| MOB_BOW_CanProduceRiderBow()
	|| MOB_BOW_CanProduceFieldBow()
	|| MOB_BOW_CanProduceHuntingBow())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceLongBows()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceLongBow");
	if (MOB_BOW_CanProduceLongBow()
	|| MOB_BOW_CanProduceHedgeBow()
	|| MOB_BOW_CanProduceYewBow()
	|| MOB_BOW_CanProduceArmyBow()
	|| MOB_BOW_CanProduceWarBow()
	|| MOB_BOW_CanProduceStormBow())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_BOW_CanProduceCrossBows()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_BOW_CanProduceCrossBow");
	if (MOB_BOW_CanProduceLightCrossBow()
	|| MOB_BOW_CanProduceCrossBow()
	|| MOB_BOW_CanProduceWarCrossBow()
	|| MOB_BOW_CanProduceHeavyCrossBow())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

func int MOB_Bow_CanProduce()
{
	if (MOB_BOW_CanProduceBows()
	|| MOB_BOW_CanProduceLongBows()
	|| MOB_BOW_CanProduceCrossBows())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int Mob_Bow_KnowsAnyRecipe()
{
	if (Knows_RecipeBow
	|| Knows_RecipeLongBow
	|| Knows_RecipeCrossBow)
	{
		return TRUE;
	};

	return FALSE;
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Bow_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_Bow_GetCantString()
{
	PrintDebugMobsi("MOB_Bow_GetCantString");
	if (Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) < 1)
	{
		PrintDebugMobsi("MOB_Bow_GetCantString ...no Talent");
		return _STR_MESSAGE_MOBSI_Bow_TAL;
	}
	else
	{
		if (Npc_HasItems(self, ItMi_Fletcherknife) < 1)
		{
			PrintDebugMobsi("MOB_Bow_GetCantString... no Tool");
			return _STR_MESSAGE_MOBSI_Bow_TOOL;
		};

		if (!Mob_Bow_KnowsAnyRecipe())
		{
			return _STR_MESSAGE_MOBSI_Bow_Book;
		}
		else
		{
			PrintDebugMobsi("MOB_Bow_GetCantString no Material");
			return _STR_MESSAGE_MOBSI_Bow_MAT;
		};
	};
};

/////////////////////////////////////////////////////////////////
//	Bogenmachertisch(JP)
//	===================
//
//	- in diesem File werden die verschiedenen Dialoge angelegt, die
//	nötig sind, damit der Spieler mit dem Tisch Bögen und Armbrüste
//	herstellen kann
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
//	Tisch unbenutzt
///////////////////////////////////////////////////////////////////////////////////

instance MOB_BOW(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_BOW_CanProduceBows;
	information		= MOB_BOWDialog_Info;
	permanent		= TRUE;
	description		= "Kurzbögen";
};

func void MOB_BOWDialog_Info()
{
	Info_ClearChoices(MOB_BOW);

	Info_AddChoice(MOB_BOW, Dialog_Back, MOB_BOW_BACK);

	if (MOB_BOW_CanProduceShortBow())
	{
		Info_AddChoice(MOB_BOW, NAME_ShortBow, MOB_PRODUCE_SHORTBOW);
	};

	if (MOB_BOW_CanProduceRiderBow())
	{
		Info_AddChoice(MOB_BOW, NAME_RiderBow, MOB_PRODUCE_RIDERBOW);
	};

	if (MOB_BOW_CanProduceFieldBow())
	{
		Info_AddChoice(MOB_BOW, NAME_FieldBow, MOB_PRODUCE_FIELDBOW);
	};

	if (MOB_BOW_CanProduceHuntingBow())
	{
		Info_AddChoice(MOB_BOW, NAME_HuntingBow, MOB_PRODUCE_HUNTINGBOW);
	};
};

func void MOB_BOW_BACK()
{
	Info_ClearChoices(MOB_BOW);
};

/**/
func int MOB_Bow_CONDITION()
{
	PrintDebugMobsi("MOB_Bow_CONDITION");
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_Bow;

	if (Npc_IsPlayer(self))
	{
		//if MOB_Bow_CanProduce()
		//{
			//PrintDebugMobsi("MOB_Bow_CONDITION...TRUE");
			//return TRUE;
		//}
		//else
		//{
			//PrintScreen(MOB_Bow_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			//AI_PlayAni(self, "T_DONTKNOW");
			//PrintDebugMobsi("MOB_Bow_CONDITION...FALSE");
			//return FALSE;
		//};
	}
	else
	{
		PrintDebugMobsi("MOB_Bow_CONDITION...TRUE");
		return TRUE;
	};

	return FALSE;
};

/**/
///////////////////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////////////////
instance MOB_BOW_EXIT(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_BOW_HasBasics;
	information		= MOB_BOW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_BOW_EXIT_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Bow_AutoExit()
{
	PrintDebugMobsi("MOB_Bow_AutoExit");

	if (!MOB_Bow_CanProduce())
	{
		MOB_Bow_Exit_Info();
	};
};

/**/
///////////////////////////////////////////////////////////////////////////////////
//
//	Triggerfunktion
//
///////////////////////////////////////////////////////////////////////////////////
func void MOB_BOW_S0()
{
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");

	PrintDebugMobsi("MOB_BOW_S0");
};

func void MOB_BOW_S1()
{
	PrintDebugMobsi("MOB_BOW_S1");

	if (B_CompareNpcInstance(self, hero))
	{
		PrintDebugMobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;
		self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_BOW;

		AI_ProcessInfos(self);
	}
	else
	{
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_BowWood);
	};
};

/**/

///////////////////////////////////////////////////////////////////////////////////
//	Langbögen herstellen
///////////////////////////////////////////////////////////////////////////////////
instance MOB_BOW_LongBow(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_BOW_CanProduceLongBows;
	information		= MOB_BOW_LongBow_Info;
	permanent		= TRUE;
	description		= "Langbögen";
};

func void MOB_BOW_LongBow_Info()
{
	Info_ClearChoices(MOB_BOW_LongBow);

	Info_AddChoice(MOB_BOW_LongBow, Dialog_Back, MOB_BOW_LongBow_BACK);

	if (MOB_BOW_CanProduceLongBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_LongBow, MOB_PRODUCE_LONGBOW);
	};

	if (MOB_BOW_CanProduceHedgeBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_HedgeBow, MOB_PRODUCE_HEDGEBOW);
	};

	if (MOB_BOW_CanProduceYewBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_YewBow, MOB_PRODUCE_YewBOW);
	};

	if (MOB_BOW_CanProduceArmyBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_ArmyBow, MOB_PRODUCE_ARMYBOW);
	};

	if (MOB_BOW_CanProduceWarBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_WarBow, MOB_PRODUCE_WARBOW);
	};

	if (MOB_BOW_CanProduceStormBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_StormBow, MOB_PRODUCE_STORMBOW);
	};
};

func void MOB_BOW_LONGBOW_BACK()
{
	Info_ClearChoices(MOB_BOW_LONGBOW);
};

///////////////////////////////////////////////////////////////////////////////////
//	Armbrüste herstellen
///////////////////////////////////////////////////////////////////////////////////
instance MOB_BOW_crossBow(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_BOW_CanProduceCrossBows;
	information		= MOB_BOW_crossBow_Info;
	permanent		= TRUE;
	description		= "Armbrüste";
};

func void MOB_BOW_crossBow_Info()
{
	Info_ClearChoices(MOB_BOW_crossBow);

	Info_AddChoice(MOB_BOW_crossBow, Dialog_Back, MOB_BOW_crossBow_BACK);

	if (MOB_BOW_CanProduceLightcrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_CrossBow, MOB_PRODUCE_crossBOW);
	};

	if (MOB_BOW_CanProducecrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_LightCrossBow, MOB_PRODUCE_LightcrossBOW);
	};

	if (MOB_BOW_CanProduceHeavycrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_HeavyCrossBow, MOB_PRODUCE_HeavycrossBOW);
	};

	if (MOB_BOW_CanProduceWarcrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_WarCrossBow, MOB_PRODUCE_WarcrossBOW);
	};
};

func void MOB_BOW_crossBOW_BACK()
{
	Info_ClearChoices(MOB_BOW_CrossBow);
};

func void MOB_PRODUCE_SHORTBOW()
{
	B_ProduceItem(Prod_ShortBow,
	ItRw_ShortBow,
	NAME_ShortBow,
	Amnt_ShortBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW);

	Info_AddChoice(MOB_BOW, Dialog_Back, MOB_BOW_BACK);

	if (MOB_BOW_CanProduceShortBow())
	{
		Info_AddChoice(MOB_BOW, NAME_ShortBow, MOB_PRODUCE_SHORTBOW);
	};

	if (MOB_BOW_CanProduceRiderBow())
	{
		Info_AddChoice(MOB_BOW, NAME_RiderBow, MOB_PRODUCE_RIDERBOW);
	};

	if (MOB_BOW_CanProduceFieldBow())
	{
		Info_AddChoice(MOB_BOW, NAME_FieldBow, MOB_PRODUCE_FIELDBOW);
	};

	if (MOB_BOW_CanProduceHuntingBow())
	{
		Info_AddChoice(MOB_BOW, NAME_HuntingBow, MOB_PRODUCE_HUNTINGBOW);
	};
};

func void MOB_PRODUCE_RIDERBOW()
{
	B_ProduceItem(Prod_RiderBow,
	ItRw_RiderBow,
	Name_RiderBow,
	Amnt_RiderBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW);

	Info_AddChoice(MOB_BOW, Dialog_Back, MOB_BOW_BACK);

	if (MOB_BOW_CanProduceShortBow())
	{
		Info_AddChoice(MOB_BOW, NAME_ShortBow, MOB_PRODUCE_SHORTBOW);
	};

	if (MOB_BOW_CanProduceRiderBow())
	{
		Info_AddChoice(MOB_BOW, NAME_RiderBow, MOB_PRODUCE_RIDERBOW);
	};

	if (MOB_BOW_CanProduceFieldBow())
	{
		Info_AddChoice(MOB_BOW, NAME_FieldBow, MOB_PRODUCE_FIELDBOW);
	};

	if (MOB_BOW_CanProduceHuntingBow())
	{
		Info_AddChoice(MOB_BOW, NAME_HuntingBow, MOB_PRODUCE_HUNTINGBOW);
	};
};

func void MOB_PRODUCE_FIELDBOW()
{
	B_ProduceItem(Prod_FieldBow,
	ItRw_FieldBow,
	Name_FieldBow,
	Amnt_FieldBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW);

	Info_AddChoice(MOB_BOW, Dialog_Back, MOB_BOW_BACK);

	if (MOB_BOW_CanProduceShortBow())
	{
		Info_AddChoice(MOB_BOW, NAME_ShortBow, MOB_PRODUCE_SHORTBOW);
	};

	if (MOB_BOW_CanProduceRiderBow())
	{
		Info_AddChoice(MOB_BOW, NAME_RiderBow, MOB_PRODUCE_RIDERBOW);
	};

	if (MOB_BOW_CanProduceFieldBow())
	{
		Info_AddChoice(MOB_BOW, NAME_FieldBow, MOB_PRODUCE_FIELDBOW);
	};

	if (MOB_BOW_CanProduceHuntingBow())
	{
		Info_AddChoice(MOB_BOW, NAME_HuntingBow, MOB_PRODUCE_HUNTINGBOW);
	};
};

func void MOB_PRODUCE_HUNTINGBOW()
{
	B_ProduceItem(Prod_HuntingBow,
	ItRw_HuntingBow,
	Name_HuntingBow,
	Amnt_HuntingBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW);

	Info_AddChoice(MOB_BOW, Dialog_Back, MOB_BOW_BACK);

	if (MOB_BOW_CanProduceShortBow())
	{
		Info_AddChoice(MOB_BOW, NAME_ShortBow, MOB_PRODUCE_SHORTBOW);
	};

	if (MOB_BOW_CanProduceRiderBow())
	{
		Info_AddChoice(MOB_BOW, NAME_RiderBow, MOB_PRODUCE_RIDERBOW);
	};

	if (MOB_BOW_CanProduceFieldBow())
	{
		Info_AddChoice(MOB_BOW, NAME_FieldBow, MOB_PRODUCE_FIELDBOW);
	};

	if (MOB_BOW_CanProduceHuntingBow())
	{
		Info_AddChoice(MOB_BOW, NAME_HuntingBow, MOB_PRODUCE_HUNTINGBOW);
	};
};

func void MOB_PRODUCE_LONGBOW()
{
	B_ProduceItem(Prod_LongBow,
	ItRw_LongBow,
	Name_LongBow,
	Amnt_LongBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW_LongBow);

	Info_AddChoice(MOB_BOW_LongBow, Dialog_Back, MOB_BOW_LongBow_BACK);

	if (MOB_BOW_CanProduceLongBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_LongBow, MOB_PRODUCE_LONGBOW);
	};

	if (MOB_BOW_CanProduceHedgeBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_HedgeBow, MOB_PRODUCE_HEDGEBOW);
	};

	if (MOB_BOW_CanProduceYewBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_YewBow, MOB_PRODUCE_YewBOW);
	};

	if (MOB_BOW_CanProduceArmyBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_ArmyBow, MOB_PRODUCE_ARMYBOW);
	};

	if (MOB_BOW_CanProduceWarBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_WarBow, MOB_PRODUCE_WARBOW);
	};

	if (MOB_BOW_CanProduceStormBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_StormBow, MOB_PRODUCE_STORMBOW);
	};
};

func void MOB_PRODUCE_HEDGEBOW()
{
	B_ProduceItem(Prod_HedgeBow,
	ItRw_HedgeBow,
	Name_HedgeBow,
	Amnt_HedgeBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW_LongBow);

	Info_AddChoice(MOB_BOW_LongBow, Dialog_Back, MOB_BOW_LongBow_BACK);

	if (MOB_BOW_CanProduceLongBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_LongBow, MOB_PRODUCE_LONGBOW);
	};

	if (MOB_BOW_CanProduceHedgeBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_HedgeBow, MOB_PRODUCE_HEDGEBOW);
	};

	if (MOB_BOW_CanProduceYewBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_YewBow, MOB_PRODUCE_YewBOW);
	};

	if (MOB_BOW_CanProduceArmyBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_ArmyBow, MOB_PRODUCE_ARMYBOW);
	};

	if (MOB_BOW_CanProduceWarBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_WarBow, MOB_PRODUCE_WARBOW);
	};

	if (MOB_BOW_CanProduceStormBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_StormBow, MOB_PRODUCE_STORMBOW);
	};
};

func void MOB_PRODUCE_YewBOW()
{
	B_ProduceItem(Prod_YewBow,
	ItRw_YewBow,
	Name_YewBow,
	Amnt_YewBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW_LongBow);

	Info_ClearChoices(MOB_BOW_LongBow);

	Info_AddChoice(MOB_BOW_LongBow, Dialog_Back, MOB_BOW_LongBow_BACK);

	if (MOB_BOW_CanProduceLongBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_LongBow, MOB_PRODUCE_LONGBOW);
	};

	if (MOB_BOW_CanProduceHedgeBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_HedgeBow, MOB_PRODUCE_HEDGEBOW);
	};

	if (MOB_BOW_CanProduceYewBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_YewBow, MOB_PRODUCE_YewBOW);
	};

	if (MOB_BOW_CanProduceArmyBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_ArmyBow, MOB_PRODUCE_ARMYBOW);
	};

	if (MOB_BOW_CanProduceWarBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_WarBow, MOB_PRODUCE_WARBOW);
	};

	if (MOB_BOW_CanProduceStormBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_StormBow, MOB_PRODUCE_STORMBOW);
	};
};

func void MOB_PRODUCE_ARMYBOW()
{
	B_ProduceItem(Prod_ArmyBow,
	ItRw_ArmyBow,
	Name_ArmyBow,
	Amnt_ArmyBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW_LongBow);

	Info_ClearChoices(MOB_BOW_LongBow);

	Info_AddChoice(MOB_BOW_LongBow, Dialog_Back, MOB_BOW_LongBow_BACK);

	if (MOB_BOW_CanProduceLongBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_LongBow, MOB_PRODUCE_LONGBOW);
	};

	if (MOB_BOW_CanProduceHedgeBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_HedgeBow, MOB_PRODUCE_HEDGEBOW);
	};

	if (MOB_BOW_CanProduceYewBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_YewBow, MOB_PRODUCE_YewBOW);
	};

	if (MOB_BOW_CanProduceArmyBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_ArmyBow, MOB_PRODUCE_ARMYBOW);
	};

	if (MOB_BOW_CanProduceWarBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_WarBow, MOB_PRODUCE_WARBOW);
	};

	if (MOB_BOW_CanProduceStormBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_StormBow, MOB_PRODUCE_STORMBOW);
	};
};

func void MOB_PRODUCE_WARBOW()
{
	B_ProduceItem(Prod_WarBow,
	ItRw_WarBow,
	Name_WarBow,
	Amnt_WarBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();

	Info_ClearChoices(MOB_BOW_LongBow);

	Info_AddChoice(MOB_BOW_LongBow, Dialog_Back, MOB_BOW_LongBow_BACK);

	if (MOB_BOW_CanProduceLongBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_LongBow, MOB_PRODUCE_LONGBOW);
	};

	if (MOB_BOW_CanProduceHedgeBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_HedgeBow, MOB_PRODUCE_HEDGEBOW);
	};

	if (MOB_BOW_CanProduceYewBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_YewBow, MOB_PRODUCE_YewBOW);
	};

	if (MOB_BOW_CanProduceArmyBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_ArmyBow, MOB_PRODUCE_ARMYBOW);
	};

	if (MOB_BOW_CanProduceWarBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_WarBow, MOB_PRODUCE_WARBOW);
	};

	if (MOB_BOW_CanProduceStormBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_StormBow, MOB_PRODUCE_STORMBOW);
	};
};

func void MOB_PRODUCE_STORMBOW()
{
	B_ProduceItem(Prod_StormBow,
	ItRw_StormBow,
	NAME_StormBow,
	Amnt_StormBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW_LongBow);

	Info_AddChoice(MOB_BOW_LongBow, Dialog_Back, MOB_BOW_LongBow_BACK);

	if (MOB_BOW_CanProduceLongBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_LongBow, MOB_PRODUCE_LONGBOW);
	};

	if (MOB_BOW_CanProduceHedgeBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_HedgeBow, MOB_PRODUCE_HEDGEBOW);
	};

	if (MOB_BOW_CanProduceYewBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_YewBow, MOB_PRODUCE_YewBOW);
	};

	if (MOB_BOW_CanProduceArmyBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_ArmyBow, MOB_PRODUCE_ARMYBOW);
	};

	if (MOB_BOW_CanProduceWarBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_WarBow, MOB_PRODUCE_WARBOW);
	};

	if (MOB_BOW_CanProduceStormBow())
	{
		Info_AddChoice(MOB_BOW_LongBow, NAME_StormBow, MOB_PRODUCE_STORMBOW);
	};
};

func void MOB_PRODUCE_LIGHTCROSSBOW()
{
	B_ProduceItem(Prod_LightCrossBow,
	ItRw_LightCrossBow,
	Name_LightCrossBow,
	Amnt_LightCrossBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW_crossBow);

	Info_AddChoice(MOB_BOW_crossBow, Dialog_Back, MOB_BOW_crossBow_BACK);

	if (MOB_BOW_CanProduceLightcrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_CrossBow, MOB_PRODUCE_crossBOW);
	};

	if (MOB_BOW_CanProducecrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_LightCrossBow, MOB_PRODUCE_LightcrossBOW);
	};

	if (MOB_BOW_CanProduceHeavycrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_HeavyCrossBow, MOB_PRODUCE_HeavycrossBOW);
	};

	if (MOB_BOW_CanProduceWarcrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_WarCrossBow, MOB_PRODUCE_WarcrossBOW);
	};
};

func void MOB_PRODUCE_CROSSBOW()
{
	B_ProduceItem(Prod_CrossBow,
	ItRw_CrossBow,
	Name_CrossBow,
	Amnt_CrossBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW_crossBow);

	Info_AddChoice(MOB_BOW_crossBow, Dialog_Back, MOB_BOW_crossBow_BACK);

	if (MOB_BOW_CanProduceLightcrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_CrossBow, MOB_PRODUCE_crossBOW);
	};

	if (MOB_BOW_CanProducecrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_LightCrossBow, MOB_PRODUCE_LightcrossBOW);
	};

	if (MOB_BOW_CanProduceHeavycrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_HeavyCrossBow, MOB_PRODUCE_HeavycrossBOW);
	};

	if (MOB_BOW_CanProduceWarcrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_WarCrossBow, MOB_PRODUCE_WarcrossBOW);
	};
};

func void MOB_PRODUCE_HEAVYCROSSBOW()
{
	B_ProduceItem(Prod_HeavyCrossBow,
	ItRw_HeavyCrossBow,
	Name_HeavyCrossBow,
	Amnt_HeavyCrossBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW_crossBow);

	Info_AddChoice(MOB_BOW_crossBow, Dialog_Back, MOB_BOW_crossBow_BACK);

	if (MOB_BOW_CanProduceLightcrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_CrossBow, MOB_PRODUCE_crossBOW);
	};

	if (MOB_BOW_CanProducecrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_LightCrossBow, MOB_PRODUCE_LightcrossBOW);
	};

	if (MOB_BOW_CanProduceHeavycrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_HeavyCrossBow, MOB_PRODUCE_HeavycrossBOW);
	};

	if (MOB_BOW_CanProduceWarcrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_WarCrossBow, MOB_PRODUCE_WarcrossBOW);
	};
};

func void MOB_PRODUCE_WARCROSSBOW()
{
	B_ProduceItem(Prod_WarCrossBow,
	ItRw_WarCrossBow,
	Name_WarCrossBow,
	Amnt_WarCrossBow,
	ItMi_FletcherWood);
	MOB_Bow_AutoExit();
	Info_ClearChoices(MOB_BOW_crossBow);

	Info_AddChoice(MOB_BOW_crossBow, Dialog_Back, MOB_BOW_crossBow_BACK);

	if (MOB_BOW_CanProduceLightcrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_CrossBow, MOB_PRODUCE_crossBOW);
	};

	if (MOB_BOW_CanProducecrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_LightCrossBow, MOB_PRODUCE_LightcrossBOW);
	};

	if (MOB_BOW_CanProduceHeavycrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_HeavyCrossBow, MOB_PRODUCE_HeavycrossBOW);
	};

	if (MOB_BOW_CanProduceWarcrossBow())
	{
		Info_AddChoice(MOB_BOW_crossBow, NAME_WarCrossBow, MOB_PRODUCE_WarcrossBOW);
	};
};

/**/
