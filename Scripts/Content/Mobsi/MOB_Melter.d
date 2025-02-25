//#################################################################################
//#################################################################################
//
//	Mobsi MELTER - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Melter_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Melter_HasBasics()
{
	if ((hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_MELTER) 					// richtiges MOBSI?
	&& Npc_HasItems(hero, ItMi_Pliers))									// Werkzeug vorhanden?
	{
		PrintDebugMobsi("MOB_Melter_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Melter_HasBasics...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Melter_CanProduce_RawIron
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Melter_CanProduce_RawIron()
{
	if (MOB_Melter_HasBasics()
	&& (Npc_GetTalentSkill(self, NPC_TALENT_SMITH) >= 1) 				// ausreichend Schmiedetalent?
	&& (Npc_HasItems(self, ItMi_OreNugget) >= Cost_RawIron))			// ausreichend Rohstoffe?
	{
		PrintDebugMobsi("MOB_Melter_CanProduce_RawIron...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Melter_CanProduce_RawIron...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Melter_CanProduce_RawLongIron
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Melter_CanProduce_RawLongIron()
{
	if (MOB_Melter_HasBasics()
	&& (Npc_GetTalentSkill(self, NPC_TALENT_SMITH) >= 1) 				// ausreichend Schmiedetalent?
	&& (Npc_HasItems(self, ItMi_OreNugget) >= Cost_RawLongIron) 		// ausreichend Rohstoffe?
	&& B_Knows2HWeapon())
	{
		PrintDebugMobsi("MOB_Melter_CanProduce_RawLongIron...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Melter_CanProduce_RawLongIron...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Melter_CanProduce_BloodRawLongIron
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Melter_CanProduce_BloodRawLongIron()
{
	if (MOB_Melter_HasBasics()
	&& (Npc_GetTalentSkill(self, NPC_TALENT_SMITH) >= 2) 				// ausreichend Schmiedetalent?
	&& (Npc_HasItems(self, ItMi_BloodOreNugget) >= Cost_RawLongIron) 	// ausreichend Rohstoffe?
	&& B_KnowsOrcWeapon())
	{
		PrintDebugMobsi("MOB_Melter_CanProduce_BloodRawLongIron...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Melter_CanProduce_BloodRawLongIron...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Melter_CanProduce_DarkRawLongIron
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Melter_CanProduce_DarkRawLongIron()
{
	if (MOB_Melter_HasBasics()
	&& (Npc_GetTalentSkill(self, NPC_TALENT_SMITH) >= 3) 				// ausreichend Schmiedetalent?
	&& (Npc_HasItems(self, ItMi_DarkOreNugget) >= Cost_RawLongIron) 	// ausreichend Rohstoffe?
	&& B_KnowsDemonWeapon())
	{
		PrintDebugMobsi("MOB_Melter_CanProduce_DarkRawLongIron...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Melter_CanProduce_DarkRawLongIron...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Melter_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Melter_CanProduce()
{
	if (MOB_Melter_CanProduce_RawIron()
	|| MOB_Melter_CanProduce_RawLongIron()
	|| MOB_Melter_CanProduce_BloodRawLongIron()
	|| MOB_Melter_CanProduce_DarkRawLongIron())
	{
		PrintDebugMobsi("MOB_Melter_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Melter_CanProduce...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Melter_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_Melter_GetCantString()
{
	if (Npc_GetTalentSkill(self, NPC_TALENT_SMITH) < 1)
	{
		return _STR_MESSAGE_MOBSI_MELTER_TAL;
	}
	else
	{
		if (Npc_HasItems(self, ItMi_Pliers) < 1)
		{
			return _STR_MESSAGE_MOBSI_MELTER_TOOL;
		}
		else
		{
			return _STR_MESSAGE_MOBSI_MELTER_MAT;
		};
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi MELTER - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_MELTER_CONDITION()
{
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_MELTER;

	if (Npc_IsPlayer(self))
	{
		if (MOB_Melter_CanProduce())
		{
			PrintDebugMobsi("MOB_MELTER_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_Melter_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("MOB_MELTER_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		PrintDebugMobsi("MOB_MELTER_CONDITION...TRUE");
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_MELTER_S0()
{
	PrintDebugMobsi("MOB_MELTER_S0");
};

func void MOB_MELTER_S1()
{
	PrintDebugMobsi("MOB_MELTER_S1");

	if (Npc_IsPlayer(self))
	{
		PrintDebugMobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;

		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_Pliers);

		AI_ProcessInfos(self);
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi MELTER - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Melter_Exit(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_Melter_HasBasics;
	information		= MOB_Melter_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_Melter_Exit_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	_ = AI_UseMob(self, SCEMENAME_MELTER, -1);
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Melter_AutoExit()
{
	PrintDebugMobsi("MOB_Melter_AutoExit");

	if (!MOB_Melter_CanProduce())
	{
		MOB_Melter_Exit_Info();
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi MELTER - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	RawIron
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Melter_RawIron(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Melter_CanProduce_RawIron;
	information		= MOB_Melter_RawIron_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildMelterString(Cost_RawIron, NAME_Nugget, NAME_RawIron);
} else {
	description		= B_BuildMelterString!(Cost_RawIron, NAME_Nugget, NAME_RawIron);
} // !comp_time
};

func void MOB_Melter_RawIron_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_RawIron, 				// Produkt
	NAME_Nugget, 				// Produkt-Name
	Cost_RawIron, 				// Anzahl Rohstoff
	ItMi_OreNugget);			// Art Rohstoff

	MOB_Melter_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	RawLongIron
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Melter_RawLongIron(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Melter_CanProduce_RawLongIron;
	information		= MOB_Melter_RawLongIron_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildMelterString(Cost_RawLongIron, NAME_Nugget, NAME_RawLongIron);
} else {
	description		= B_BuildMelterString!(Cost_RawLongIron, NAME_Nugget, NAME_RawLongIron);
} // !comp_time
};

func void MOB_Melter_RawLongIron_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_RawLongIron, 			// Produkt
	NAME_Nugget, 				// Produkt-Name
	Cost_RawLongIron, 			// Anzahl Rohstoff
	ItMi_OreNugget);			// Art Rohstoff

	MOB_Melter_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	BloodRawLongIron
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Melter_BloodRawLongIron(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Melter_CanProduce_BloodRawLongIron;
	information		= MOB_Melter_BloodRawLongIron_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildMelterString(Cost_RawLongIron, NAME_BloodNugget, NAME_RawLongIron);
} else {
	description		= B_BuildMelterString!(Cost_RawLongIron, NAME_BloodNugget, NAME_RawLongIron);
} // !comp_time
};

func void MOB_Melter_BloodRawLongIron_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_BloodRawLongIron, 		// Produkt
	NAME_BloodNugget, 			// Produkt-Name
	Cost_RawLongIron, 			// Anzahl Rohstoff
	ItMi_BloodOreNugget);		// Art Rohstoff

	MOB_Melter_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	DarkRawLongIron
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Melter_DarkRawLongIron(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Melter_CanProduce_DarkRawLongIron;
	information		= MOB_Melter_DarkRawLongIron_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildMelterString(Cost_RawLongIron, NAME_DarkNugget, NAME_RawLongIron);
} else {
	description		= B_BuildMelterString!(Cost_RawLongIron, NAME_DarkNugget, NAME_RawLongIron);
} // !comp_time
};

func void MOB_Melter_DarkRawLongIron_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_DarkRawLongIron, 		// Produkt
	NAME_Nugget, 				// Produkt-Name
	Cost_RawLongIron, 			// Anzahl Rohstoff
	ItMi_DarkOreNugget);		// Art Rohstoff

	MOB_Melter_AutoExit();
};
