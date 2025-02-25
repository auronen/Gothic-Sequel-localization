//#################################################################################
//#################################################################################
//
//	Mobsi FIRE - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Fire_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Fire_HasBasics()
{
	if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_FIRE) 			// richtiges MOBSI?
	{
		PrintDebugMobsi("MOB_Fire_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Fire_HasBasics...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Fire_CanProduce_HotIron
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Fire_CanProduce_HotIron()
{
	if (MOB_Fire_HasBasics()
	&& Npc_HasItems(hero, ItMi_RawIron) 						// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1))		// Talent vorhanden?
	{
		PrintDebugMobsi("MOB_Fire_CanProduce_HotIron...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Fire_CanProduce_HotIron...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Fire_CanProduce_HotLongIron
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Fire_CanProduce_HotLongIron()
{
	if (MOB_Fire_HasBasics()
	&& Npc_HasItems(hero, ItMi_RawLongIron) 					// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_Knows2HWeapon())
	{
		PrintDebugMobsi("MOB_Fire_CanProduce_HotLongIron...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Fire_CanProduce_HotLongIron...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Fire_CanProduce_BloodHotLongIron
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Fire_CanProduce_BloodHotLongIron()
{
	if (MOB_Fire_HasBasics()
	&& Npc_HasItems(hero, ItMi_BloodRawLongIron) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 2) 		// Talent vorhanden?
	&& B_KnowsOrcWeapon())
	{
		PrintDebugMobsi("MOB_Fire_CanProduce_BloodHotLongIron...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Fire_CanProduce_BloodHotLongIron...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Fire_CanProduce_DarkHotLongIron
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Fire_CanProduce_DarkHotLongIron()
{
	if (MOB_Fire_HasBasics()
	&& Npc_HasItems(hero, ItMi_DarkRawLongIron) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 3) 		// Talent vorhanden?
	&& B_KnowsDemonWeapon())
	{
		PrintDebugMobsi("MOB_Fire_CanProduce_DarkHotLongIron...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Fire_CanProduce_DarkHotLongIron...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Fire_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Fire_CanProduce()
{
	if (MOB_Fire_CanProduce_HotIron()
	|| MOB_Fire_CanProduce_HotLongIron()
	|| MOB_Fire_CanProduce_BloodHotLongIron()
	|| MOB_Fire_CanProduce_DarkHotLongIron())
	{
		PrintDebugMobsi("MOB_Fire_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Fire_CanProduce...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Fire_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_Fire_GetCantString()
{
	if (Npc_GetTalentSkill(self, NPC_TALENT_SMITH) < 1)
	{
		return _STR_MESSAGE_MOBSI_FIRE_TAL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_FIRE_MAT;
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi FIRE - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_FIRE_CONDITION()
{
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_FIRE;

	if (Npc_IsPlayer(self))
	{
		if (MOB_Fire_CanProduce())
		{
			PrintDebugMobsi("MOB_FIRE_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_Fire_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("MOB_FIRE_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		PrintDebugMobsi("MOB_FIRE_CONDITION...TRUE");
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_FIRE_S0()
{
	PrintDebugMobsi("MOB_FIRE_S0");
};

func void MOB_FIRE_S1()
{
	PrintDebugMobsi("MOB_FIRE_S1");

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
//	Mobsi FIRE - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Fire_Exit(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_Fire_HasBasics;
	information		= MOB_Fire_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_Fire_Exit_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	//MOBSI-Abmeldung hier!
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	_ = AI_UseMob(self, SCEMENAME_FIRE, -1);
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Fire_AutoExit()
{
	PrintDebugMobsi("MOB_Fire_AutoExit");

	if (!MOB_Fire_CanProduce())
	{
		MOB_Fire_Exit_Info();
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi FIRE - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	HotIron
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Fire_HotIron(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Fire_CanProduce_HotIron;
	information		= MOB_Fire_HotIron_Info;
	permanent		= TRUE;
	description		= B_ConcatThreeStrings(NAME_RawIron, NAME_Ore, NAME_Smith_Fire);
};

func void MOB_Fire_HotIron_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_HotIron, 				// Produkt
	NAME_RawIron, 				// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_RawIron);				// Art Rohstoff
	MOB_Fire_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	HotLongIron
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Fire_HotLongIron(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Fire_CanProduce_HotLongIron;
	information		= MOB_Fire_HotLongIron_Info;
	permanent		= TRUE;
	description		= B_ConcatThreeStrings(NAME_RawLongIron, NAME_Ore, NAME_Smith_Fire);
};

func void MOB_Fire_HotLongIron_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_HotLongIron, 			// Produkt
	NAME_RawLongIron, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_RawLongIron);			// Art Rohstoff
	MOB_Fire_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	BloodHotLongIron
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Fire_BloodHotLongIron(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Fire_CanProduce_BloodHotLongIron;
	information		= MOB_Fire_BloodHotLongIron_Info;
	permanent		= TRUE;
	description		= B_ConcatThreeStrings(NAME_RawLongIron, NAME_BloodOre, NAME_Smith_Fire);
};

func void MOB_Fire_BloodHotLongIron_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_BloodHotLongIron, 		// Produkt
	NAME_RawLongIron, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_BloodRawLongIron);		// Art Rohstoff
	MOB_Fire_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	DarkHotLongIron
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Fire_DarkHotLongIron(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Fire_CanProduce_DarkHotLongIron;
	information		= MOB_Fire_DarkHotLongIron_Info;
	permanent		= TRUE;
	description		= B_ConcatThreeStrings(NAME_RawLongIron, NAME_DarkOre, NAME_Smith_Fire);
};

func void MOB_Fire_DarkHotLongIron_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_DarkHotLongIron, 		// Produkt
	NAME_RawLongIron, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_DarkRawLongIron);		// Art Rohstoff
	MOB_Fire_AutoExit();
};
