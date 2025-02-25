///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_EXIT(C_Info)
{
	npc				= DMH_1302_Malgar;
	nr				= 999;
	condition		= DMH_1302_Malgar_EXIT_Condition;
	information		= DMH_1302_Malgar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DMH_1302_Malgar_EXIT_Condition()
{
	return TRUE;
};

func void DMH_1302_Malgar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##						ARENA-KAMPF
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info MYWEAPON
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_MYWEAPON(C_Info)
{
	npc				= DMH_1302_Malgar;
	nr				= 1;
	condition		= DMH_1302_Malgar_MYWEAPON_Condition;
	information		= DMH_1302_Malgar_MYWEAPON_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DMH_1302_Malgar_MYWEAPON_Condition()
{
	if (Npc_HasItems(hero, ItMw_Malgar_Broadsword))
	{
		if (Arena_FightRunning
		&& Arena_PlayerFight
		&& Malgar_Challenged
		&& !Arena_PlayerStoleWeapon)
		{
			return TRUE;
		}
		else
		{
			//self.aivar[AIV_PLAYERHASMYWEAPON] = TRUE;
			return FALSE;
		};
	};

	return FALSE;
};

func void DMH_1302_Malgar_MYWEAPON_Info()
{
	AI_SetWalkMode(self, NPC_RUN);
	AI_GotoNpc(self, hero);
	AI_Output(self, hero, "DMH_1302_MYWEAPON_Info_11_01"); //(eiskalt) Gib mir meine Waffe! JETZT!

	Info_ClearChoices(DMH_1302_Malgar_MYWEAPON);
	Info_AddChoice(DMH_1302_Malgar_MYWEAPON, "Nein, ich behalte sie!", DMH_1302_Malgar_MYWEAPON_TAKEN);
	Info_AddChoice(DMH_1302_Malgar_MYWEAPON, "Hier hast du sie zurück!", DMH_1302_Malgar_MYWEAPON_GIVEBACK);
};

func void DMH_1302_Malgar_MYWEAPON_GIVEBACK()
{
	Info_ClearChoices(DMH_1302_Malgar_MYWEAPON);
	AI_Output(hero, self, "DMH_1302_MYWEAPON_GIVEBACK_15_01"); //Hier hast du sie zurück!
	B_GiveInvItems(hero, self, ItMw_Malgar_Broadsword, 1);
	AI_Output(self, hero, "DMH_1302_MYWEAPON_GIVEBACK_11_02"); //(souverän) Gut!
	AI_StopProcessInfos(self);
};

func void DMH_1302_Malgar_MYWEAPON_TAKEN()
{
	Info_ClearChoices(DMH_1302_Malgar_MYWEAPON);
	AI_Output(hero, self, "DMH_1302_MYWEAPON_TAKEN_15_01"); //Nein, ich behalte sie!
	AI_Output(self, hero, "DMH_1302_MYWEAPON_TAKEN_11_02"); //(verständnislos) Ts ts ts, Regel Nummer 3...
	AI_StopProcessInfos(self);

	B_Arena_AbortFight(AF_PLAYERSTOLEWEAPON);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGED
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_CHALLENGED(C_Info)
{
	npc				= DMH_1302_Malgar;
	nr				= 2;
	condition		= DMH_1302_Malgar_CHALLENGED_Condition;
	information		= DMH_1302_Malgar_CHALLENGED_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DMH_1302_Malgar_CHALLENGED_Condition()
{
	if (Malgar_Challenged
	&& Arena_PlayerFight
	&& C_NpcIsInvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void DMH_1302_Malgar_CHALLENGED_Info()
{
	if (Wld_IsTime(0, 0, ARENABEGIN_H, ARENABEGIN_M))
	{
		if (Npc_GetDistToWP(self, ARENA_WP_LEFT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
			AI_Output(self, hero, "DMH_1302_CHALLENGED_11_01"); //(grüssend) Heute abend, Gladiator...
		}
		else
		{
			AI_Output(self, hero, "DMH_1302_CHALLENGED_11_02"); //Geh rüber!
		};

		AI_StopProcessInfos(self);
		return;
	};

	if (Npc_IsInRoutine(self, ZS_ArenaFight))
	{
		AI_Output(self, hero, "DMH_1302_CHALLENGED_11_03"); //Kämpfe Gladiator!
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		AI_Output(self, hero, "DMH_1302_CHALLENGED_11_04"); //(grüssend) Morgen abend, Gladiator...
		AI_StopProcessInfos(self);
		return;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PRENPC
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_PRENPC(C_Info)
{
	npc				= DMH_1302_Malgar;
	condition		= DMH_1302_Malgar_PRENPC_Condition;
	information		= DMH_1302_Malgar_PRENPC_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DMH_1302_Malgar_PRENPC_Condition()
{
	if (Arena_NpcFight
	&& ((Arena_NpcCombo == AC_BRUTUS_MALGAR) || (Arena_NpcCombo == AC_MALGAR_THORA))
	&& Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	&& C_NpcIsInvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void DMH_1302_Malgar_PRENPC_Info()
{
	AI_Output(self, hero, "DMH_1302_PRENPC_11_01"); //Raus hier!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GLADIATOR
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_GLADIATOR(C_Info)
{
	npc				= DMH_1302_Malgar;
	nr				= 1;
	condition		= DMH_1302_Malgar_GLADIATOR_Condition;
	information		= DMH_1302_Malgar_GLADIATOR_Info;
	description		= "Du bist Gladiator, oder?";
};

func int DMH_1302_Malgar_GLADIATOR_Condition()
{
	return TRUE;
};

func void DMH_1302_Malgar_GLADIATOR_Info()
{
	AI_Output(hero, self, "DMH_1302_GLADIATOR_15_01"); //Du bist Gladiator, oder?
	AI_Output(self, hero, "DMH_1302_GLADIATOR_11_02"); //Ja.
};

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_WEAPON(C_Info)
{
	npc				= DMH_1302_Malgar;
	nr				= 0;
	condition		= DMH_1302_Malgar_WEAPON_Condition;
	information		= DMH_1302_Malgar_WEAPON_Info;
	description		= "Kämpfst wohl mit dem Schwert.";
};

func int DMH_1302_Malgar_WEAPON_Condition()
{
	if (Npc_KnowsInfo(hero, DMH_1302_Malgar_GLADIATOR))
	{
		return TRUE;
	};

	return FALSE;
};

func void DMH_1302_Malgar_WEAPON_Info()
{
	AI_Output(hero, self, "DMH_1302_WEAPON_15_01"); //Kämpfst wohl mit dem Schwert.
	AI_Output(self, hero, "DMH_1302_WEAPON_11_02"); //Ja!
};

///////////////////////////////////////////////////////////////////////
//	Info VICTORIES
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_VICTORIES(C_Info)
{
	npc				= DMH_1302_Malgar;
	nr				= 0;
	condition		= DMH_1302_Malgar_VICTORIES_Condition;
	information		= DMH_1302_Malgar_VICTORIES_Info;
	description		= "Wieviele Arenakämpfe hast du schon gewonnen?";
};

func int DMH_1302_Malgar_VICTORIES_Condition()
{
	if (Npc_KnowsInfo(hero, DMH_1302_Malgar_GLADIATOR))
	{
		return TRUE;
	};

	return FALSE;
};

func void DMH_1302_Malgar_VICTORIES_Info()
{
	AI_Output(hero, self, "DMH_1302_VICTORIES_15_01"); //Wieviele Arenakämpfe hast du schon gewonnen?
	AI_Output(self, hero, "DMH_1302_VICTORIES_11_02"); //Genug!
};

///////////////////////////////////////////////////////////////////////
//	Info QUIET
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_QUIET(C_Info)
{
	npc				= DMH_1302_Malgar;
	nr				= 1;
	condition		= DMH_1302_Malgar_QUIET_Condition;
	information		= DMH_1302_Malgar_QUIET_Info;
	description		= "Du sprichst wohl nicht sehr viel, was?";
};

func int DMH_1302_Malgar_QUIET_Condition()
{
	if (Npc_KnowsInfo(hero, DMH_1302_Malgar_WEAPON)
	&& Npc_KnowsInfo(hero, DMH_1302_Malgar_VICTORIES))
	{
		return TRUE;
	};

	return FALSE;
};

func void DMH_1302_Malgar_QUIET_Info()
{
	AI_Output(hero, self, "DMH_1302_QUIET_15_01"); //Du sprichst wohl nicht sehr viel, was?
	AI_Output(self, hero, "DMH_1302_QUIET_11_02"); //hmmmm
	AI_Output(hero, self, "DMH_1302_QUIET_15_03"); //Na dann...
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGE
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_CHALLENGE(C_Info)
{
	npc				= DMH_1302_Malgar;
	nr				= 0;
	condition		= DMH_1302_Malgar_CHALLENGE_Condition;
	information		= DMH_1302_Malgar_CHALLENGE_Info;
	permanent		= TRUE;
	description		= "Kämpfe gegen mich in der Arena!";
};

func int DMH_1302_Malgar_CHALLENGE_Condition()
{
	if (Npc_KnowsInfo(hero, DMH_1302_Malgar_QUIET)
	&& !Grim_Challenged
	&& !Goliath_Challenged
	&& !Brutus_Challenged
	&& !Malgar_Challenged
	&& !Thora_Challenged
	&& Arenamaster_Accepted
	&& Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M))
	{
		return TRUE;
	};

	return FALSE;
};

func void DMH_1302_Malgar_CHALLENGE_Info()
{
	AI_Output(hero, self, "DMH_1302_CHALLENGE_15_01"); //Kämpfe gegen mich in der Arena!
	AI_Output(hero, self, "DMH_1302_CHALLENGE_15_02"); //Das geht auch ganz ohne sprechen!

	if (!Npc_HasItems(self, ItMw_Malgar_Broadsword))
	{
		AI_Output(self, hero, "DMH_1302_CHALLENGE_11_03"); //Geht nicht. Mein Schwert ist weg.

		if (Npc_HasItems(hero, ItMw_Malgar_Broadsword))
		{
			Info_ClearChoices(DMH_1302_Malgar_CHALLENGE);
			Info_AddChoice(DMH_1302_Malgar_CHALLENGE, "Ich habe deine Waffe... ähem... gefunden! Hier!", DMH_1302_Malgar_CHALLENGE_FOUND);
		};

		return;
	};

	if (Arena_PlayerBanned)
	{
		AI_Output(self, hero, "DMH_1302_CHALLENGE_11_04"); //Nein, du bist verbannt!
	}
	else
	{
		if (!Brutus_PlayerWonBefore)
		{
			AI_Output(self, hero, "DMH_1302_CHALLENGE_11_05"); //Wenn du Brutus besiegst, kämpfe ich gegen dich!
			AI_Output(hero, self, "DMH_1302_CHALLENGE_15_06"); //Das waren ja mehr als drei Silben in einem Satz!
			AI_Output(self, hero, "DMH_1302_CHALLENGE_11_07"); //(Brummel)

			return;
		};

		if (B_Arena_GetGladiatorVictoryRanking(PC_Hero) == B_Arena_GetGladiatorVictoryRanking(AMZ_900_Thora))
		{
			AI_Output(self, hero, "DMH_1302_CHALLENGE_11_08"); //Dir fehlt nur ein Sieg zum Titel!
			AI_Output(self, hero, "DMH_1302_CHALLENGE_11_09"); //Du musst gegen den Champion kämpfen.
			AI_Output(self, hero, "DMH_1302_CHALLENGE_11_10"); //Wenn du Thora besiegst, bist DU der neue Champion!

			return;
		};

		if ((B_Arena_GetGladiatorRanking(PC_Hero) == 1)
		&& (B_Arena_GetGladiatorRanking(DMH_1302_Malgar) >= 3))
		{
			AI_Output(self, hero, "DMH_1302_CHALLENGE_11_11"); //Du bist der Champion, ich bin nicht mal zweiter.
			AI_Output(self, hero, "DMH_1302_CHALLENGE_11_12"); //Kämpfe gegen den zweiten!

			return;
		};

		//else
		AI_Output(self, hero, "DMH_1302_CHALLENGE_11_13"); //Gut!
		AI_Output(self, hero, "DMH_1302_CHALLENGE_11_14"); //Geh zum Arenameister!

		Malgar_Challenged = TRUE;
	};
};

func void DMH_1302_Malgar_CHALLENGE_FOUND()
{
	Info_ClearChoices(DMH_1302_Malgar_CHALLENGE);
	AI_Output(hero, self, "DMH_1302_CHALLENGE_FOUND_15_01"); //Ich habe deine Waffe... ähem... gefunden! Hier!
	B_GiveInvItems(hero, self, ItMw_Malgar_Broadsword, 1);
	AI_Output(self, hero, "DMH_1302_CHALLENGE_FOUND_11_02"); //Kann nur für dich hoffen, dass du sie wirklich GEFUNDEN hast.
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_HOWDY(C_Info)
{
	npc				= DMH_1302_Malgar;
	nr				= 0;
	condition		= DMH_1302_Malgar_HOWDY_Condition;
	information		= DMH_1302_Malgar_HOWDY_Info;
	permanent		= TRUE;
	description		= "Möchtest du dich unterhalten?";
};

func int DMH_1302_Malgar_HOWDY_Condition()
{
	if (Npc_KnowsInfo(hero, DMH_1302_Malgar_QUIET)
	&& !DMH_1302_Malgar_CHALLENGE_Condition())
	{
		return TRUE;
	};

	return FALSE;
};

func void DMH_1302_Malgar_HOWDY_Info()
{
	AI_Output(hero, self, "DMH_1302_HOWDY_15_01"); //(leicht spöttisch) Möchtest du dich unterhalten?
	AI_Output(self, hero, "DMH_1302_HOWDY_11_02"); //Nein!
	AI_Output(hero, self, "DMH_1302_HOWDY_15_03"); //Das... dachte ich mir!
	AI_StopProcessInfos(self);
};
