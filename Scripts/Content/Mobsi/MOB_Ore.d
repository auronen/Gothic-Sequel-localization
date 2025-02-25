//#################################################################################
//#################################################################################
//
//	Mobsi ORE - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Ore_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Ore_HasBasics()
{
	if ((hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_ORE) 					// richtiges MOBSI?
	&& Npc_HasItems(hero, ItMw_Pickaxe))								// Werkzeug vorhanden?
	{
		PrintDebugMobsi("MOB_Ore_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Ore_HasBasics...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Ore_CanProduce_1
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Ore_CanProduce_1()
{
	if (MOB_Ore_HasBasics()
	&& MOB_Ore_IsOreAvailable(1))										// noch genügend Erz in der Ader?
	{
		PrintDebugMobsi("MOB_Ore_CanProduce_1...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Ore_CanProduce_1...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Ore_CanProduce_5
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Ore_CanProduce_5()
{
	if (MOB_Ore_HasBasics()
	&& MOB_Ore_IsOreAvailable(5))										// noch genügend Erz in der Ader?
	{
		PrintDebugMobsi("MOB_Ore_CanProduce_5...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Ore_CanProduce_5...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Ore_CanProduce_10
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Ore_CanProduce_10()
{
	if (MOB_Ore_HasBasics()
	&& MOB_Ore_IsOreAvailable(10))										// noch genügend Erz in der Ader?
	{
		PrintDebugMobsi("MOB_Ore_CanProduce_10...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Ore_CanProduce_10...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Ore_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Ore_CanProduce()
{
	if (MOB_Ore_CanProduce_1()
	|| MOB_Ore_CanProduce_5()
	|| MOB_Ore_CanProduce_10())
	{
		PrintDebugMobsi("MOB_Ore_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Ore_CanProduce...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Ore_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_Ore_GetCantString()
{
	if (Npc_HasItems(self, ItMw_Pickaxe) < 1)
	{
		return _STR_MESSAGE_MOBSI_ORE_TOOL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_ORE_MAT;
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi ORE - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_ORE_CONDITION()
{
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_ORE;

	if (Npc_IsPlayer(self))
	{
		if (MOB_Ore_CanProduce())
		{
			PrintDebugMobsi("MOB_ORE_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_Ore_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("MOB_ORE_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		if (MOB_Ore_IsOreAvailable(1))
		{
			PrintDebugMobsi("MOB_ORE_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintDebugMobsi("MOB_ORE_CONDITION...FALSE");
			return FALSE;
		};
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_ORE_S0()
{
	PrintDebugMobsi("MOB_ORE_S0");
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
};

func void MOB_ORE_S1()
{
	PrintDebugMobsi("MOB_ORE_S1");

	if (Npc_IsPlayer(self))
	{
		PrintDebugMobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;

		// falls die einzige Spitzhacke auf den Rücken ist, vorher de-equippen
		var C_Item weapon;
		weapon = Npc_GetEquippedMeleeWeapon(self);
		if ((Hlp_GetInstanceID(weapon) == ItMw_Pickaxe)
		&& (Npc_HasItems(self, ItMw_Pickaxe) == 1))
		{
			AI_UnequipWeapons(self);
		};

		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMw_PickAxe);
		AI_ProcessInfos(self);
	}
	else
	{
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMw_PickAxe);
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi ORE - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Ore_Exit(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_Ore_HasBasics;
	information		= MOB_Ore_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_Ore_Exit_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	_ = AI_UseMob(self, SCEMENAME_ORE, -1);
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Ore_AutoExit()
{
	PrintDebugMobsi("MOB_Ore_AutoExit");

	if (!MOB_Ore_CanProduce())
	{
		MOB_Ore_Exit_Info();
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi ORE - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info 1
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Ore_1(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Ore_CanProduce_1;
	information		= MOB_Ore_1_Info;
	permanent		= TRUE;
	description		= "ein wenig Erz schürfen";
};

func void MOB_Ore_1_Info()
{
	AI_PlayAni(self, "T_ORE_RANDOM_1");

	B_ProduceItem(Hlp_Random(3) + 1, 	// Anzahl Produkt
	ItMi_OreNugget, 					// Produkt
	NAME_Nugget, 						// Produkt-Name
	0, 									// Anzahl Rohstoff
	0);									// Art Rohstoff
	MOB_Ore_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Info 5
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Ore_5(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Ore_CanProduce_5;
	information		= MOB_Ore_5_Info;
	permanent		= TRUE;
	description		= "etwas mehr Erz schürfen";
};

func void MOB_Ore_5_Info()
{
	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");

	B_ProduceItem(Hlp_Random(11) + 5, 	// Anzahl Produkt
	ItMi_OreNugget, 					// Produkt
	NAME_Nugget, 						// Produkt-Name
	0, 									// Anzahl Rohstoff
	0);									// Art Rohstoff
	MOB_Ore_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Info 10
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Ore_10(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Ore_CanProduce_10;
	information		= MOB_Ore_10_Info;
	permanent		= TRUE;
	description		= "richtig viel Erz schürfen";
};

func void MOB_Ore_10_Info()
{
	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");

	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");
	AI_PlayAni(self, "T_ORE_RANDOM_1");

	B_ProduceItem(Hlp_Random(21) + 10, 	// Anzahl Produkt
	ItMi_OreNugget, 					// Produkt
	NAME_Nugget, 						// Produkt-Name
	0, 									// Anzahl Rohstoff
	0);									// Art Rohstoff
	MOB_Ore_AutoExit();
};
