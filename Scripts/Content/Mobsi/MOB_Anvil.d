//#################################################################################
//#################################################################################
//
//	Mobsi ANVIL - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_HasBasics()
{
	if ((hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_ANVIL) 			// richtiges MOBSI?
	&& Npc_HasItems(hero, ItMw_Sledgehammer))					// Werkzeug vorhanden?
	{
		PrintDebugMobsi("MOB_Anvil_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_HasBasics...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_Swordblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_Swordblade()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_HotIron) 						// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_KnowsSword())
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Swordblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Swordblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_2HSwordblade()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_HotLongIron) 					// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_Knows2HSword())
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_2HSwordblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_Blood2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_Blood2HSwordblade()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_BloodHotLongIron) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 2) 		// Talent vorhanden?
	&& Knows_OrcSword)
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Blood2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Blood2HSwordblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_Dark2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_Dark2HSwordblade()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_DarkHotLongIron) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 3) 		// Talent vorhanden?
	&& B_KnowsDemonWeapon())
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Dark2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Dark2HSwordblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_Axeblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_Axeblade()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_HotIron) 						// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_KnowsAxe())
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Axeblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Axeblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_2HAxeblade()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_HotLongIron) 					// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_Knows2HAxe())
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_2HAxeblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_Blood2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_Blood2HAxeblade()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_BloodHotLongIron) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 2) 		// Talent vorhanden?
	&& Knows_OrcAxe)
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Blood2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Blood2HAxeblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_Dark2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_Dark2HAxeblade()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_DarkHotLongIron) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 3) 		// Talent vorhanden?
	&& B_KnowsDemonWeapon())
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Dark2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Dark2HAxeblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_Stump
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_Stump()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_HotIron) 						// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_KnowsBlunt())
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Stump...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Stump...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_2HStump
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_2HStump()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_HotLongIron) 					// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_Knows2HBlunt())
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_2HStump...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_2HStump...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_Blood2HStump
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_Blood2HStump()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_BloodHotLongIron) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 2) 		// Talent vorhanden?
	&& Knows_OrcHammer)
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Blood2HStump...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Blood2HStump...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce_Dark2HStump
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce_Dark2HStump()
{
	if (MOB_Anvil_HasBasics()
	&& Npc_HasItems(hero, ItMi_DarkHotLongIron) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 3) 		// Talent vorhanden?
	&& B_KnowsDemonWeapon())
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Dark2HStump...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce_Dark2HStump...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Anvil_CanProduce()
{
	if (MOB_Anvil_CanProduce_Swordblade()
	|| MOB_Anvil_CanProduce_2HSwordblade()
	|| MOB_Anvil_CanProduce_Blood2HSwordblade()
	|| MOB_Anvil_CanProduce_Dark2HSwordblade()
	|| MOB_Anvil_CanProduce_Axeblade()
	|| MOB_Anvil_CanProduce_2HAxeblade()
	|| MOB_Anvil_CanProduce_Blood2HAxeblade()
	|| MOB_Anvil_CanProduce_Dark2HAxeblade()
	|| MOB_Anvil_CanProduce_Stump()
	|| MOB_Anvil_CanProduce_2HStump()
	|| MOB_Anvil_CanProduce_Blood2HStump()
	|| MOB_Anvil_CanProduce_Dark2HStump())
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Anvil_CanProduce...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Anvil_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_Anvil_GetCantString()
{
	if (Npc_GetTalentSkill(self, NPC_TALENT_SMITH) < 1)
	{
		return _STR_MESSAGE_MOBSI_ANVIL_TAL;
	}
	else
	{
		if (Npc_HasItems(self, ItMw_Sledgehammer) < 1)
		{
			return _STR_MESSAGE_MOBSI_ANVIL_TOOL;
		}
		else
		{
			return _STR_MESSAGE_MOBSI_ANVIL_MAT;
		};
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi ANVIL - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_ANVIL_CONDITION()
{
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_ANVIL;

	if (Npc_IsPlayer(self))
	{
		if (MOB_Anvil_CanProduce())
		{
			PrintDebugMobsi("MOB_ANVIL_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_Anvil_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("MOB_ANVIL_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		PrintDebugMobsi("MOB_ANVIL_CONDITION...TRUE Nsc");
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_ANVIL_S0()
{
	PrintDebugMobsi("MOB_ANVIL_S0");
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
};

func void MOB_ANVIL_S1()
{
	PrintDebugMobsi("MOB_ANVIL_S1");

	if (Npc_IsPlayer(self))
	{
		PrintDebugMobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);

		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMw_SledgeHammer);

		self.aivar[AIV_INVINCIBLE] = TRUE;

		AI_ProcessInfos(self);
	}
	else
	{
		PrintDebugMobsi("MOB_ANVIL_S1 Nsc");
		//AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
		//AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMw_SledgeHammer);
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi ANVIL - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_Exit(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_Anvil_HasBasics;
	information		= MOB_Anvil_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_Anvil_Exit_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	//MOBSI-Abmeldung hier!
	_ = AI_UseMob(self, SCEMENAME_ANVIL, -1);
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Anvil_AutoExit()
{
	PrintDebugMobsi("MOB_Anvil_AutoExit");

	if (!MOB_Anvil_CanProduce())
	{
		MOB_Anvil_Exit_Info();
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi ANVIL - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Swordblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_Swordblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_Swordblade;
	information		= MOB_Anvil_Swordblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotIron, NAME_Ore, NAME_Swordblade);
} else {
	description		= B_BuildAnvilString!(NAME_HotIron, NAME_Ore, NAME_Swordblade);
} // !comp_time
};

func void MOB_Anvil_Swordblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_HotSwordblade, 		// Produkt
	NAME_Swordblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_HotIron);				// Art Rohstoff
	MOB_Anvil_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_2HSwordblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_2HSwordblade;
	information		= MOB_Anvil_2HSwordblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotLongIron, NAME_Ore, NAME_2HSwordblade);
} else {
	description		= B_BuildAnvilString!(NAME_HotLongIron, NAME_Ore, NAME_2HSwordblade);
} // !comp_time
};

func void MOB_Anvil_2HSwordblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Hot2HSwordblade, 		// Produkt
	NAME_2HSwordblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_HotLongIron);			// Art Rohstoff
	MOB_Anvil_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Blood2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_Blood2HSwordblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_Blood2HSwordblade;
	information		= MOB_Anvil_Blood2HSwordblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotLongIron, NAME_BloodOre, NAME_2HSwordblade);
} else {
	description		= B_BuildAnvilString!(NAME_HotLongIron, NAME_BloodOre, NAME_2HSwordblade);
} // !comp_time
};

func void MOB_Anvil_Blood2HSwordblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_BloodHot2HSwordblade, 	// Produkt
	NAME_2HSwordblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_BloodHotLongIron);		// Art Rohstoff
	MOB_Anvil_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Dark2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_Dark2HSwordblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_Dark2HSwordblade;
	information		= MOB_Anvil_Dark2HSwordblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotLongIron, NAME_DarkOre, NAME_2HSwordblade);
} else {
	description		= B_BuildAnvilString!(NAME_HotLongIron, NAME_DarkOre, NAME_2HSwordblade);
} // !comp_time
};

func void MOB_Anvil_Dark2HSwordblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_DarkHot2HSwordblade, 	// Produkt
	NAME_2HSwordblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_DarkHotLongIron);		// Art Rohstoff
	MOB_Anvil_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Axeblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_Axeblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_Axeblade;
	information		= MOB_Anvil_Axeblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotIron, NAME_Ore, NAME_Axeblade);
} else {
	description		= B_BuildAnvilString!(NAME_HotIron, NAME_Ore, NAME_Axeblade);
} // !comp_time
};

func void MOB_Anvil_Axeblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_HotAxeblade, 			// Produkt
	NAME_Axeblade, 				// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_HotIron);				// Art Rohstoff
	MOB_Anvil_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_MOB_Anvil_AutoExit(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_2HAxeblade;
	information		= MOB_Anvil_2HAxeblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotLongIron, NAME_Ore, NAME_2HAxeblade);
} else {
	description		= B_BuildAnvilString!(NAME_HotLongIron, NAME_Ore, NAME_2HAxeblade);
} // !comp_time
};

func void MOB_Anvil_2HAxeblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Hot2HAxeblade, 		// Produkt
	NAME_2HAxeblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_HotLongIron);			// Art Rohstoff
	MOB_Anvil_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Blood2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_Blood2HAxeblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_Blood2HAxeblade;
	information		= MOB_Anvil_Blood2HAxeblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotLongIron, NAME_BloodOre, NAME_2HAxeblade);
} else {
	description		= B_BuildAnvilString!(NAME_HotLongIron, NAME_BloodOre, NAME_2HAxeblade);
} // !comp_time
};

func void MOB_Anvil_Blood2HAxeblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_BloodHot2HAxeblade, 	// Produkt
	NAME_2HAxeblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_BloodHotLongIron);		// Art Rohstoff
	MOB_Anvil_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Dark2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_Dark2HAxeblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_Dark2HAxeblade;
	information		= MOB_Anvil_Dark2HAxeblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotLongIron, NAME_DarkOre, NAME_2HAxeblade);
} else {
	description		= B_BuildAnvilString!(NAME_HotLongIron, NAME_DarkOre, NAME_2HAxeblade);
} // !comp_time
};

func void MOB_Anvil_Dark2HAxeblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_DarkHot2HAxeblade, 	// Produkt
	NAME_2HAxeblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_DarkHotLongIron);		// Art Rohstoff
	MOB_Anvil_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Stump
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_Stump(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_Stump;
	information		= MOB_Anvil_Stump_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotIron, NAME_Ore, NAME_Stump);
} else {
	description		= B_BuildAnvilString!(NAME_HotIron, NAME_Ore, NAME_Stump);
} // !comp_time
};

func void MOB_Anvil_Stump_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_HotStump, 				// Produkt
	NAME_Stump, 				// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_HotIron);				// Art Rohstoff
	MOB_Anvil_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	2HStump
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_2HStump(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_2HStump;
	information		= MOB_Anvil_2HStump_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotLongIron, NAME_Ore, NAME_2HStump);
} else {
	description		= B_BuildAnvilString!(NAME_HotLongIron, NAME_Ore, NAME_2HStump);
} // !comp_time
};

func void MOB_Anvil_2HStump_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Hot2HStump, 			// Produkt
	NAME_2HStump, 				// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_HotLongIron);			// Art Rohstoff
	MOB_Anvil_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Blood2HStump
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_Blood2HStump(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_Blood2HStump;
	information		= MOB_Anvil_Blood2HStump_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotLongIron, NAME_BloodOre, NAME_2HStump);
} else {
	description		= B_BuildAnvilString!(NAME_HotLongIron, NAME_BloodOre, NAME_2HStump);
} // !comp_time
};

func void MOB_Anvil_Blood2HStump_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_BloodHot2HStump, 		// Produkt
	NAME_2HStump, 				// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_BloodHotLongIron);		// Art Rohstoff
	MOB_Anvil_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Dark2HStump
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Anvil_Dark2HStump(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Anvil_CanProduce_Dark2HStump;
	information		= MOB_Anvil_Dark2HStump_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildAnvilString(NAME_HotLongIron, NAME_DarkOre, NAME_2HStump);
} else {
	description		= B_BuildAnvilString!(NAME_HotLongIron, NAME_DarkOre, NAME_2HStump);
} // !comp_time
};

func void MOB_Anvil_Dark2HStump_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_DarkHot2HStump, 		// Produkt
	NAME_2HStump, 				// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_DarkHotLongIron);		// Art Rohstoff
	MOB_Anvil_AutoExit();
};
