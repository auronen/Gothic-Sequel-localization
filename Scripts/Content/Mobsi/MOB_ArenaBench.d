//#################################################################################
//#################################################################################
//
//	Mobsi ARENABENCH - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_ARENABENCH_CONDITION(var int rightSide)
{
	PrintDebugMobsi("MOB_ARENABENCH_CONDITION");

	if (Npc_IsPlayer(self))
	{
		PrintDebugMobsi("...SC!");

		if (Arena_FightSelected
		&& Arena_PlayerFight
		&& Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M))
		{
			PrintDebugMobsi("...Vorbereitungszeit für den SC-Gladiator!");
			PrintGlobals(PD_ITEM_MOBSI);

			if ((rightSide && (Goliath_Challenged || Malgar_Challenged))
			|| (!rightSide && (Grim_Challenged || Brutus_Challenged || Thora_Challenged)))
			{
				PrintDebugMobsi("...richtige Kammer!");
				return TRUE;
			}
			else
			{
				PrintDebugMobsi("...falsche Kammer!");
				_ = PrintScreen(_STR_MESSAGE_MOBSI_ARENABENCH_CHAMBER, -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
				AI_PlayAni(self, "T_DONTKNOW");
				return FALSE;
			};
		}
		else
		{
			PrintDebugMobsi("...nur für Gladiatoren!");
			_ = PrintScreen(_STR_MESSAGE_MOBSI_ARENABENCH_GLADIATOR, -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			return FALSE;
		};
	}
	else
	{
		PrintDebugMobsi("...NSC!");
		return TRUE;
	};
};

func int MOB_ARENABENCH_L_CONDITION()
{
	PrintDebugMobsi("MOB_ARENABENCH_L_CONDITION");

	return MOB_ARENABENCH_CONDITION(FALSE);
};

func int MOB_ARENABENCH_R_CONDITION()
{
	PrintDebugMobsi("MOB_ARENABENCH_R_CONDITION");

	return MOB_ARENABENCH_CONDITION(TRUE);
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_ARENABENCH_S1()
{
	PrintDebugMobsi("MOB_ARENABENCH_S1");

	if (Npc_IsPlayer(self)
	&& Arena_FightSelected
	&& Arena_PlayerFight
	&& Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M))
	{
		PrintDebugMobsi("...Vorbereitungszeit für den SC-Gladiator!");
		PrintGlobals(PD_ITEM_MOBSI);

		self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_ARENABENCH;
		self.aivar[AIV_INVINCIBLE] = TRUE;

		AI_ProcessInfos(self);
	};
};

func void MOB_ARENABENCH_L_S1()
{
	PrintDebugMobsi("MOB_ARENABENCH_L_S1");

	MOB_ARENABENCH_S1();
};

func void MOB_ARENABENCH_R_S1()
{
	PrintDebugMobsi("MOB_ARENABENCH_R_S1");

	MOB_ARENABENCH_S1();
};

//#################################################################################
//#################################################################################
//
//	Mobsi ARENABENCH - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////////////////
instance MOB_ARENABENCH_Exit(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_ARENABENCH_Exit_Condition;
	information		= MOB_ARENABENCH_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int MOB_ARENABENCH_Exit_Condition()
{
	if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_ARENABENCH)
	{
		return TRUE;
	};

	return FALSE;
};

func void MOB_ARENABENCH_Exit_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	_ = AI_UseMob(hero, SCEMENAME_ARENABENCH, -1);
};

//#################################################################################
//#################################################################################
//
//	Mobsi ARENABENCH - Funktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info GotoFight
///////////////////////////////////////////////////////////////////////////////////
instance MOB_ARENABENCH1(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_ARENABENCH_GotoFight_Condition;
	information		= MOB_ARENABENCH_GotoFight_Info;
	permanent		= TRUE;
	description		= "(bis zum Kampf warten)";
};

func int MOB_ARENABENCH_GotoFight_Condition()
{
	if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_ARENABENCH)
	{
		return TRUE;
	};

	return FALSE;
};

func void MOB_ARENABENCH_GotoFight_Info()
{
	_ = AI_UseMob(hero, SCEMENAME_ARENABENCH, -1);
	AI_Snd_Play(hero, "ARENAHORN_01");

	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	Wld_SetTime(ARENABEGIN_H, ARENABEGIN_M + 1);

	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];

	_ = PrintScreen("Du bist hochkonzentriert und bereit für den Kampf!", -1, -1, FONT_OLD_BIG, 3);
};
