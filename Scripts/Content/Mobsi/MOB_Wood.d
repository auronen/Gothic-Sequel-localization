//#################################################################################
//#################################################################################
//
//	Mobsi WOOD - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_WOOD_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_WOOD_HasBasics()
{
	if ((hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_WOOD) 					// richtiges MOBSI?
	&& Npc_HasItems(hero, ItMi_Fletcherknife))							// Werkzeug vorhanden?
	{
		PrintDebugMobsi("MOB_WOOD_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_WOOD_HasBasics...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_WOOD_CanProduce_1
///////////////////////////////////////////////////////////////////////////////////
func int MOB_WOOD_CanProduce_1()
{
	if (MOB_WOOD_HasBasics()
	&& MOB_WOOD_IsWOODAvailable(1))										// noch genügend Holz im Busch?
	{
		PrintDebugMobsi("MOB_WOOD_CanProduce_1...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_WOOD_CanProduce_1...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_WOOD_CanProduce_5
///////////////////////////////////////////////////////////////////////////////////
func int MOB_WOOD_CanProduce_5()
{
	if (MOB_WOOD_HasBasics()
	&& MOB_WOOD_IsWOODAvailable(5))										// noch genügend Holz im Busch?
	{
		PrintDebugMobsi("MOB_WOOD_CanProduce_5...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_WOOD_CanProduce_5...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_WOOD_CanProduce_10
///////////////////////////////////////////////////////////////////////////////////
func int MOB_WOOD_CanProduce_10()
{
	if (MOB_WOOD_HasBasics()
	&& MOB_WOOD_IsWOODAvailable(10))									// noch genügend Holz im Busch?
	{
		PrintDebugMobsi("MOB_WOOD_CanProduce_10...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_WOOD_CanProduce_10...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_WOOD_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int MOB_WOOD_CanProduce()
{
	if (MOB_WOOD_CanProduce_1()
	|| MOB_WOOD_CanProduce_5()
	|| MOB_WOOD_CanProduce_10())
	{
		PrintDebugMobsi("MOB_WOOD_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_WOOD_CanProduce...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_WOOD_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_WOOD_GetCantString()
{
	if (Npc_HasItems(self, ItMi_Fletcherknife) < 1)
	{
		return _STR_MESSAGE_MOBSI_WOOD_TOOL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_WOOD_MAT;
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi WOOD - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_WOOD_CONDITION()
{
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_WOOD;

	if (Npc_IsPlayer(self))
	{
		if (MOB_WOOD_CanProduce())
		{
			PrintDebugMobsi("MOB_WOOD_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_WOOD_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("MOB_WOOD_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		if (MOB_WOOD_IsWOODAvailable(1))
		{
			PrintDebugMobsi("MOB_WOOD_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintDebugMobsi("MOB_WOOD_CONDITION...FALSE");
			return FALSE;
		};
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_WOOD_S0()
{
	PrintDebugMobsi("MOB_WOOD_S0");
};

func void MOB_WOOD_S1()
{
	PrintDebugMobsi("MOB_WOOD_S1");

	if (Npc_IsPlayer(self))
	{
		PrintDebugMobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;

		var C_Item weapon;
		weapon = Npc_GetEquippedMeleeWeapon(self);
		if ((Hlp_GetInstanceID(weapon) == ItMi_Fletcherknife)
		&& (Npc_HasItems(self, ItMi_Fletcherknife) == 1))
		{
			AI_UnequipWeapons(self);
		};

		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_Fletcherknife);
		AI_ProcessInfos(self);
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi WOOD - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////////////////
instance MOB_WOOD_Exit(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_WOOD_HasBasics;
	information		= MOB_WOOD_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_WOOD_Exit_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	_ = AI_UseMob(self, SCEMENAME_WOOD, -1);
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_WOOD_AutoExit()
{
	PrintDebugMobsi("MOB_WOOD_AutoExit");

	if (!MOB_WOOD_CanProduce())
	{
		MOB_WOOD_Exit_Info();
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi WOOD - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info 1
///////////////////////////////////////////////////////////////////////////////////
instance MOB_WOOD_1(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_WOOD_CanProduce_1;
	information		= MOB_WOOD_1_Info;
	permanent		= TRUE;
	description		= "1 Holz schneiden";
};

func void MOB_WOOD_1_Info()
{
	AI_PlayAni(self, "T_WOOD_RANDOM_1");

	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_FletcherWOOD, 			// Produkt
	ItMi_FletcherWOOD.name, 	// Produkt-Name
	0, 							// Anzahl Rohstoff
	0);							// Art Rohstoff
	MOB_WOOD_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Info 5
///////////////////////////////////////////////////////////////////////////////////
instance MOB_WOOD_5(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_WOOD_CanProduce_5;
	information		= MOB_WOOD_5_Info;
	permanent		= TRUE;
	description		= "5 Holz schneiden";
};

func void MOB_WOOD_5_Info()
{
	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");

	B_ProduceItem(5, 			// Anzahl Produkt
	ItMi_FletcherWOOD, 			// Produkt
	ItMi_FletcherWOOD.name, 	// Produkt-Name
	0, 							// Anzahl Rohstoff
	0);							// Art Rohstoff
	MOB_WOOD_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Info 10
///////////////////////////////////////////////////////////////////////////////////
instance MOB_WOOD_10(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_WOOD_CanProduce_10;
	information		= MOB_WOOD_10_Info;
	permanent		= TRUE;
	description		= "10 Holz schneiden";
};

func void MOB_WOOD_10_Info()
{
	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");

	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");
	AI_PlayAni(self, "T_WOOD_RANDOM_1");

	B_ProduceItem(10, 			// Anzahl Produkt
	ItMi_FletcherWOOD, 			// Produkt
	ItMi_FletcherWOOD.name, 	// Produkt-Name
	0, 							// Anzahl Rohstoff
	0);							// Art Rohstoff
	MOB_WOOD_AutoExit();
};
