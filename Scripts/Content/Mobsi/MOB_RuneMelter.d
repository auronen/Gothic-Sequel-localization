//#################################################################################
//#################################################################################
//
//	Mobsi RUNEMELTER - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RuneMelter_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RuneMelter_HasBasics()
{
	PrintDebugMobsi("MOB_Runemelter_HasBasics");
	if ((hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_Runemelter)
	&& (Npc_HasItems(hero, ItMi_Pliers) >= 1))
	{
		PrintDebugMobsi("MOB_Cauldron_HasBasics ... TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cauldron_HasBasics ... FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Mob_Runemelter_CanProduceRune
///////////////////////////////////////////////////////////////////////////////////
func int Mob_Runemelter_CanProduceRune()
{
	PrintDebugMobsi("Mob_Runemelter_CanProduceRune");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_1)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_OreNugget) >= Amnt_Rune
	&& (self.attribute[ATR_MANA] >= Mana_Rune)
	&& MOB_RuneMelter_HasBasics()))
	{
		PrintDebugMobsi("Mob_Runemelter_CanProduceRune ... True");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("Mob_Runemelter_CanProduceRune ...False");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Mob_Runemelter_CanProduceBloodRune
///////////////////////////////////////////////////////////////////////////////////
func int Mob_Runemelter_CanProduceBloodRune()
{
	PrintDebugMobsi("Mob_Runemelter_CanProduceBloodRune");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_BloodOreNugget) >= Amnt_BloodRune
	&& (self.attribute[ATR_MANA] >= Mana_BloodRune)
	&& MOB_RuneMelter_HasBasics()))
	{
		PrintDebugMobsi("Mob_Runemelter_CanProduceBloodRune True");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("Mob_Runemelter_CanProduceBloodRune ...False");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Mob_Runemelter_CanProduceDarkRune
///////////////////////////////////////////////////////////////////////////////////
func int Mob_Runemelter_CanProduceDarkRune()
{
	PrintDebugMobsi("Mob_Runemelter_CanProduceDarkRune");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_3)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_5)
	&& (Npc_HasItems(self, ItMi_DarkOreNugget) >= Amnt_DarkRune
	&& (self.attribute[ATR_MANA] >= Mana_DarkRune)
	&& MOB_RuneMelter_HasBasics()))
	{
		PrintDebugMobsi("Mob_Runemelter_CanProduceDarkRune ...True");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("Mob_Runemelter_CanProduceDarkRune...False");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Mob_Runemelter_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int Mob_Runemelter_CanProduce()
{
	PrintDebugMobsi("Mob_Runemelter_CanProduce");
	if (Mob_Runemelter_CanProduceRune()
	|| Mob_Runemelter_CanProduceBloodRune()
	|| Mob_Runemelter_CanProduceDarkRune())
	{
		PrintDebugMobsi("Mob_Runemelter_CanProduce ...True");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("Mob_Runemelter_CanProduce ...False");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Runemelter_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_Runemelter_GetCantString()
{
	PrintDebugMobsi("MOB_Runemelter_GetCantString");
	if (Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) < 1)
	{
		PrintDebugMobsi("MOB_Runemelter_GetCantString ...no Talent");
		return _STR_MESSAGE_MOBSI_Rune_TAL;
	}
	else
	{
		if (Npc_HasItems(self, ItMi_Pliers) < 1)
		{
			PrintDebugMobsi("MOB_Runemelter_GetCantString... no Tool");
			return _STR_MESSAGE_MOBSI_Rune_TOOL;
		}
		else
		{
			if (hero.attribute[ATR_MANA] < Mana_Rune)
			{
				PrintDebugMobsi("MOB_Runemelter_GetCantString no Mana");
				return _STR_MESSAGE_MOBSI_Rune_MANA;
			}
			else
			{
				PrintDebugMobsi("MOB_Runemelter_GetCantString no Material");
				return _STR_MESSAGE_MOBSI_Runemelter_MAT;
			};
		};
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi RUNEMELTER - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Runemelter_CONDITION()
{
	PrintDebugMobsi("MOB_Runemelter_CONDITION");
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_Runemelter;

	if (Npc_IsPlayer(self))
	{
		if (MOB_Runemelter_CanProduce())
		{
			PrintDebugMobsi("MOB_Runemelter_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_Runemelter_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("MOB_Runemelter_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		PrintDebugMobsi("MOB_Runemelter_CONDITION...TRUE");
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_RUNEMELTER_S1()
{
	PrintDebugMobsi("MOB_RUNEMELTER_S1");

	if (B_CompareNpcInstance(self, hero))
	{
		PrintDebugMobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;
		self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_RUNEMELTER;

		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Pliers);

		AI_ProcessInfos(self);
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi RUNEMELTER - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////////////////
instance MOB_RUNEMELTER_EXIT(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_RuneMelter_HasBasics;
	information		= MOB_RUNEMELTER_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_RUNEMELTER_EXIT_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	_ = AI_UseMob(self, SCEMENAME_RUNEMELTER, -1);
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_RUNEMELTER_AutoExit()
{
	PrintDebugMobsi("MOB_RUNEMELTER_AutoExit");

	if (!MOB_RUNEMELTER_CanProduce())
	{
		//Info_ClearChoices(MOB_CAULDRON);
		MOB_RUNEMELTER_Exit_Info();
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi RUNEMELTER - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Rune
///////////////////////////////////////////////////////////////////////////////////
instance MOB_RUNEMELTER_Rune(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= Mob_Runemelter_CanProduceRune;
	information		= MOB_PRODUCE_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemelterString!(NAME_BlankRune, Amnt_Rune, NAME_Nugget);
} else {
	description		= B_BuildRunemelterString(NAME_BlankRune, Amnt_Rune, NAME_Nugget);
}
};

func void MOB_PRODUCE_RUNE()
{
	B_ProduceItem(1,
	ItAr_RuneBlank,
	NAME_BlankRune,
	Amnt_Rune,
	ItMi_OreNugget);

	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Mana_Rune;
	MOB_RUNEMELTER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	BloodRune
///////////////////////////////////////////////////////////////////////////////////
instance MOB_RUNEMELTER_BloodRune(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= Mob_Runemelter_CanProduceBloodRune;
	information		= MOB_PRODUCE_BLOODRUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemelterString!(NAME_BlankBloodRune, Amnt_BloodRune, NAME_BloodNugget);
} else {
	description		= B_BuildRunemelterString(NAME_BlankBloodRune, Amnt_BloodRune, NAME_BloodNugget);
}
};

func void MOB_PRODUCE_BLOODRUNE()
{
	B_ProduceItem(1,
	ItAr_BloodRuneBlank,
	NAME_BlankBloodRune,
	Amnt_BloodRune,
	ItMi_BloodOreNugget);

	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Mana_BloodRune;
	MOB_RUNEMELTER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	DarkRune
///////////////////////////////////////////////////////////////////////////////////
instance MOB_RUNEMELTER_DarkRune(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= Mob_Runemelter_CanProduceDarkRune;
	information		= MOB_PRODUCE_DARKRUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemelterString!(NAME_BlankDarkRune, Amnt_DarkRune, NAME_DarkNugget);
} else {
	description		= B_BuildRunemelterString(NAME_BlankDarkRune, Amnt_DarkRune, NAME_DarkNugget);
}
};

func void MOB_PRODUCE_DARKRUNE()
{
	B_ProduceItem(1,
	ItAr_DarkRuneBlank,
	NAME_BlankDarkRune,
	Amnt_DarkRune,
	ItMi_DarkOreNugget);

	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Mana_DarkRune;
	MOB_RUNEMELTER_AutoExit();
};
