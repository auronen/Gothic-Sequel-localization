const int Amnt_FletcherWood = 2;

//#################################################################################
//#################################################################################
//
//	Mobsi fletcher - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_fletcher_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_fletcher_HasBasics()
{
	if ((hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_fletcher) 		// richtiges MOBSI?
	&& (Npc_HasItems(hero, ItMi_FletcherKnife) >= 1				// Werkzeug vorhanden?
	&& Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) >= 1))
	{
		PrintDebugMobsi("MOB_fletcher_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_fletcher_HasBasics...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_fletcher_CanProduce_1
///////////////////////////////////////////////////////////////////////////////////
func int MOB_fletcher_CanProduce_1()
{
	if (MOB_fletcher_HasBasics()
	&& (Npc_HasItems(hero, ItMi_FletcherWood) >= AMnt_FletcherWood))
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_1...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_1...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_fletcher_CanProduce_5
///////////////////////////////////////////////////////////////////////////////////
func int MOB_fletcher_CanProduce_5()
{
	if (MOB_fletcher_HasBasics()
	&& (Npc_HasItems(hero, ITMI_FletcherWood) >= (AMnt_FletcherWood * 5)))
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_5...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_5...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_fletcher_CanProduce_10
///////////////////////////////////////////////////////////////////////////////////
func int MOB_fletcher_CanProduce_10()
{
	if (MOB_fletcher_HasBasics()
	&& (Npc_HasItems(hero, ITMI_FletcherWood) >= (AMnt_FletcherWood * 10)))
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_10...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_10...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_fletcher_CanProduce_1
///////////////////////////////////////////////////////////////////////////////////
func int MOB_fletcher_CanProduce_1Bolts()
{
	if (MOB_fletcher_HasBasics()
	&& (Npc_HasItems(hero, ItMi_FletcherWood) >= AMnt_FletcherWood)
	&& Knows_RecipeCrossBow)
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_1...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_1...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_fletcher_CanProduce_5
///////////////////////////////////////////////////////////////////////////////////
func int MOB_fletcher_CanProduce_5Bolts()
{
	if (MOB_fletcher_HasBasics()
	&& (Npc_HasItems(hero, ITMI_FletcherWood) >= (AMnt_FletcherWood * 5))
	&& Knows_RecipeCrossBow)
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_5...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_5...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_fletcher_CanProduce_10
///////////////////////////////////////////////////////////////////////////////////
func int MOB_fletcher_CanProduce_10Bolts()
{
	if (MOB_fletcher_HasBasics()
	&& (Npc_HasItems(hero, ITMI_FletcherWood) >= (AMnt_FletcherWood * 10))
	&& Knows_RecipeCrossBow)
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_10...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce_10...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_fletcher_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int MOB_fletcher_CanProduce()
{
	if (MOB_fletcher_CanProduce_1()
	|| MOB_fletcher_CanProduce_5()
	|| MOB_fletcher_CanProduce_10())
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_fletcher_CanProduce...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_fletcher_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_fletcher_GetCantString()
{
	if (Npc_GetTalentSkill(self, NPC_TALENT_BOWMAKER) < 1)
	{
		return _STR_MESSAGE_MOBSI_FLETCHER_TAL;
	}
	else
	{
		if (Npc_HasItems(self, ItMi_Fletcherknife) < 1)
		{
			return _STR_MESSAGE_MOBSI_fletcher_TOOL;
		}
		else
		{
			return _STR_MESSAGE_MOBSI_fletcher_MAT;
		};
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi fletcher - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_FLETCHER_CONDITION()
{
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_fletcher;

	if (Npc_IsPlayer(self))
	{
		if (MOB_fletcher_CanProduce())
		{
			PrintDebugMobsi("MOB_fletcher_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_fletcher_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("MOB_fletcher_CONDITION...FALSE");
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
func void MOB_fletcher_S0()
{
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	PrintDebugMobsi("MOB_fletcher_S0");
};

func void MOB_fletcher_S1()
{
	PrintDebugMobsi("MOB_fletcher_S1");

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
		AI_ProcessInfos(self);
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi fletcher - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////////////////
instance MOB_fletcher_Exit(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_fletcher_HasBasics;
	information		= MOB_fletcher_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_fletcher_Exit_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	_ = AI_UseMob(self, "fletcher", -1);
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_RemoveItemFromSlot(self, "ZS_RIGTHAND");
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_fletcher_AutoExit()
{
	PrintDebugMobsi("MOB_fletcher_AutoExit");

	if (!MOB_fletcher_CanProduce())
	{
		MOB_fletcher_Exit_Info();
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi fletcher - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info 1
///////////////////////////////////////////////////////////////////////////////////
instance MOB_fletcher_1(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_fletcher_CanProduce_1;
	information		= MOB_fletcher_1_Info;
	permanent		= TRUE;
	description		= "1 Pfeil herstellen";
};

func void MOB_fletcher_1_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItAm_Arrow, 				// Produkt
	Name_Arrow, 				// Produkt-Name
	Amnt_FletcherWood, 			// Anzahl Rohstoff
	ItMi_FletcherWood);			// Art Rohstoff
	MOB_fletcher_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Info 5
///////////////////////////////////////////////////////////////////////////////////
instance MOB_fletcher_5(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_fletcher_CanProduce_5;
	information		= MOB_fletcher_5_Info;
	permanent		= TRUE;
	description		= "5 Pfeile herstellen";
};

func void MOB_fletcher_5_Info()
{
	/*
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	*/
	B_ProduceItem(5, 			// Anzahl Produkt
	ItAM_Arrow, 				// Produkt
	Name_Arrow, 				// Produkt-Name
	Amnt_FletcherWood * 5, 		// Anzahl Rohstoff
	ItMi_FletcherWood);			// Art Rohstoff
	MOB_fletcher_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Info 10
///////////////////////////////////////////////////////////////////////////////////
instance MOB_fletcher_10(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_fletcher_CanProduce_10;
	information		= MOB_fletcher_10_Info;
	permanent		= TRUE;
	description		= "10 Pfeile herstellen";
};

func void MOB_fletcher_10_Info()
{
	/*
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");

	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	*/
	B_ProduceItem(10, 			// Anzahl Produkt
	ItAm_Arrow, 				// Produkt
	Name_Arrow, 				// Produkt-Name
	Amnt_FletcherWood * 10, 	// Anzahl Rohstoff
	ItMi_FletcherWood);			// Art Rohstoff
	MOB_fletcher_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Info 1Bolt
///////////////////////////////////////////////////////////////////////////////////
instance MOB_fletcher_1Bolts(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_fletcher_CanProduce_1Bolts;
	information		= MOB_fletcher_1Bolts_Info;
	permanent		= TRUE;
	description		= "1 Bolzen herstellen";
};

func void MOB_fletcher_1Bolts_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItAm_Bolt, 					// Produkt
	Name_Bolt,					// Produkt-Name
	Amnt_FletcherWood,			// Anzahl Rohstoff
	ItMi_FletcherWood);			// Art Rohstoff
	MOB_fletcher_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Info 5
///////////////////////////////////////////////////////////////////////////////////
instance MOB_fletcher_5Bolts(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_fletcher_CanProduce_5Bolts;
	information		= MOB_fletcher_5Bolts_Info;
	permanent		= TRUE;
	description		= "5 Bolzen herstellen";
};

func void MOB_fletcher_5Bolts_Info()
{
	B_ProduceItem(5, 			// Anzahl Produkt
	ItAM_Bolt, 					// Produkt
	Name_Bolt, 					// Produkt-Name
	Amnt_FletcherWood * 5, 		// Anzahl Rohstoff
	ItMi_FletcherWood);			// Art Rohstoff
	MOB_fletcher_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Info 10
///////////////////////////////////////////////////////////////////////////////////
instance MOB_fletcher_10Bolts(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_fletcher_CanProduce_10Bolts;
	information		= MOB_fletcher_10Bolts_Info;
	permanent		= TRUE;
	description		= "10 Bolzen herstellen";
};

func void MOB_fletcher_10Bolts_Info()
{
	B_ProduceItem(10, 			// Anzahl Produkt
	ItAm_Bolt, 					// Produkt
	Name_Bolt, 					// Produkt-Name
	Amnt_FletcherWood * 10, 	// Anzahl Rohstoff
	ItMi_FletcherWood);			// Art Rohstoff
	MOB_fletcher_AutoExit();
};
