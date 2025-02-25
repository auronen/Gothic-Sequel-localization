//#################################################################################
//#################################################################################
//
//	Mobsi WATERPIPE - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_WATERPIPE_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_WATERPIPE_HasBasics()
{
	if ((hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_WATERPIPE) 				// richtiges MOBSI?
	&& (Npc_HasItems(hero, ItPl_Swampweed) >= 1))						// Rohstoff vorhanden?
	{
		PrintDebugMobsi("MOB_WATERPIPE_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_WATERPIPE_HasBasics...FALSE");
		return FALSE;
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi WATERPIPE - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_WATERPIPE_CONDITION()
{
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_WATERPIPE;

	if (Npc_IsPlayer(self))
	{
		if (MOB_WATERPIPE_HasBasics())
		{
			PrintDebugMobsi("MOB_WATERPIPE_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			_ = PrintScreen(_STR_MESSAGE_MOBSI_WATERPIPE_MAT, -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("MOB_WATERPIPE_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_WATERPIPE_S0()
{
	PrintDebugMobsi("MOB_WATERPIPE_S0");
};

func void MOB_WATERPIPE_S1()
{
	PrintDebugMobsi("MOB_WATERPIPE_S1");

	if (Npc_IsPlayer(self))
	{
		PrintDebugMobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_ProcessInfos(self);
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi WATERPIPE - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////////////////
instance MOB_WATERPIPE_Exit(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_WATERPIPE_HasBasics;
	information		= MOB_WATERPIPE_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_WATERPIPE_Exit_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	var int int_Randomizer;
	int_Randomizer = Hlp_Random(6);
	if (int_Randomizer == 1)
	{
		AI_Wait(self, 10);
		B_Say(self, NULL, "$WATERPIPEVISION1");
	};

	if (int_Randomizer == 2)
	{
		AI_Wait(self, 10);
		B_Say(self, NULL, "$WATERPIPEVISION2");
	};

	if (int_Randomizer == 3)
	{
		AI_Wait(self, 10);
		B_Say(self, NULL, "$WATERPIPEVISION3");
	};

	if (int_Randomizer == 4)
	{
		AI_Wait(self, 10);
		B_Say(self, NULL, "$WATERPIPEVISION4");
	};

	if (int_Randomizer == 5)
	{
		AI_Wait(self, 10);
		B_Say(self, NULL, "$WATERPIPEVISION5");
	};

	_ = AI_UseMob(self, "WATERPIPE", -1);
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_WATERPIPE_AutoExit()
{
	PrintDebugMobsi("MOB_WATERPIPE_AutoExit");

	MOB_WATERPIPE_Exit_Info();
};

//#################################################################################
//#################################################################################
//
//	Mobsi WATERPIPE - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info 1
///////////////////////////////////////////////////////////////////////////////////
instance MOB_WATERPIPE(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_WATERPIPE_HasBasics;
	information		= MOB_WATERPIPE_Info;
	permanent		= TRUE;
	important		= TRUE;
	description		= "";
};

func void MOB_WATERPIPE_Info()
{
	if (C_NpcIsInvincible(hero))
	{
		_ = Npc_RemoveInvItems(hero, ItPl_Swampweed, 1);
		MOB_WATERPIPE_AutoExit();
	};
};
