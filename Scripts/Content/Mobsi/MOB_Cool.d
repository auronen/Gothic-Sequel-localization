//#################################################################################
//#################################################################################
//
//	Mobsi COOL - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_HasBasics()
{
	if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_COOL) 		// richtiges MOBSI?
	{
		PrintDebugMobsi("MOB_Cool_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_HasBasics...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_Swordblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_Swordblade()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_HotSwordblade) 					// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_KnowsSword())
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Swordblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Swordblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_2HSwordblade()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_Hot2HSwordblade) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_Knows2HSword())										// Waffenmodell erlernt?
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_2HSwordblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_Blood2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_Blood2HSwordblade()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_BloodHot2HSwordblade) 			// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 2) 		// Talent vorhanden?
	&& Knows_OrcSword)											// Waffenmodell erlernt?
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Blood2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Blood2HSwordblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_Dark2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_Dark2HSwordblade()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_DarkHot2HSwordblade) 			// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 3) 		// Talent vorhanden?
	&& B_KnowsDemonWeapon())									// Waffenmodell erlernt?
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Dark2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Dark2HSwordblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_Axeblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_Axeblade()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_HotAxeblade) 					// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_KnowsAxe())
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Axeblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Axeblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_2HAxeblade()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_Hot2HAxeblade) 					// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_Knows2HAxe())											// Waffenmodell erlernt?
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_2HAxeblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_Blood2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_Blood2HAxeblade()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_BloodHot2HAxeblade) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 2) 		// Talent vorhanden?
	&& Knows_OrcAxe)											// Waffenmodell erlernt?
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Blood2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Blood2HAxeblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_Dark2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_Dark2HAxeblade()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_DarkHot2HAxeblade) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 3) 		// Talent vorhanden?
	&& B_KnowsDemonWeapon())									// Waffenmodell erlernt?
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Dark2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Dark2HAxeblade...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_Stump
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_Stump()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_HotStump) 						// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_KnowsBlunt())
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Stump...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Stump...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_2HStump
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_2HStump()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_Hot2HStump) 						// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1) 		// Talent vorhanden?
	&& B_Knows2HBlunt())										// Waffenmodell erlernt?
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_2HStump...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_2HStump...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_Blood2HStump
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_Blood2HStump()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_BloodHot2HStump) 				// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 2) 		// Talent vorhanden?
	&& Knows_OrcHammer)											// Waffenmodell erlernt?
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Blood2HStump...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Blood2HStump...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce_Dark2HStump
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce_Dark2HStump()
{
	if (MOB_Cool_HasBasics()
	&& Npc_HasItems(hero, ItMi_DarkHot2HStump) 					// Rohstoff vorhanden?
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 3) 		// Talent vorhanden?
	&& B_KnowsDemonWeapon())									// Waffenmodell erlernt?
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Dark2HStump...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce_Dark2HStump...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cool_CanProduce()
{
	if (MOB_Cool_CanProduce_Swordblade()
	|| MOB_Cool_CanProduce_2HSwordblade()
	|| MOB_Cool_CanProduce_Blood2HSwordblade()
	|| MOB_Cool_CanProduce_Dark2HSwordblade()
	|| MOB_Cool_CanProduce_Axeblade()
	|| MOB_Cool_CanProduce_2HAxeblade()
	|| MOB_Cool_CanProduce_Blood2HAxeblade()
	|| MOB_Cool_CanProduce_Dark2HAxeblade()
	|| MOB_Cool_CanProduce_Stump()
	|| MOB_Cool_CanProduce_2HStump()
	|| MOB_Cool_CanProduce_Blood2HStump()
	|| MOB_Cool_CanProduce_Dark2HStump())
	{
		PrintDebugMobsi("MOB_Cool_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cool_CanProduce...FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cool_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_Cool_GetCantString()
{
	if (Npc_GetTalentSkill(self, NPC_TALENT_SMITH) < 1)
	{
		return _STR_MESSAGE_MOBSI_COOL_TAL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_COOL_MAT;
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi COOL - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_COOL_CONDITION()
{
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_COOL;

	if (Npc_IsPlayer(self))
	{
		if (MOB_Cool_CanProduce())
		{
			PrintDebugMobsi("MOB_COOL_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_Cool_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("MOB_COOL_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		PrintDebugMobsi("MOB_COOL_CONDITION...TRUE");
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_COOL_S0()
{
	PrintDebugMobsi("MOB_COOL_S0");
};

func void MOB_COOL_S1()
{
	PrintDebugMobsi("MOB_COOL_S1");

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
//	Mobsi COOL - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_Exit(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_Cool_HasBasics;
	information		= MOB_Cool_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_Cool_Exit_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	//MOBSI-Abmeldung hier!
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	_ = AI_UseMob(self, SCEMENAME_COOL, -1);
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Cool_AutoExit()
{
	PrintDebugMobsi("MOB_Cool_AutoExit");

	if (!MOB_Cool_CanProduce())
	{
		MOB_Cool_Exit_Info();
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi COOL - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Swordblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_SWORDBLADE(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_Swordblade;
	information		= MOB_Cool_Swordblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_HotSwordblade, NAME_Ore, NAME_Swordblade);
} else {
	description		= B_BuildCoolString!(NAME_HotSwordblade, NAME_Ore, NAME_Swordblade);
} // !comp_time
};

func void MOB_Cool_Swordblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Swordblade, 			// Produkt
	NAME_Swordblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_HotSwordblade);		// Art Rohstoff
	MOB_Cool_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_2HSwordblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_2HSwordblade;
	information		= MOB_Cool_2HSwordblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_Hot2HSwordblade, NAME_Ore, NAME_2HSwordblade);
} else {
	description		= B_BuildCoolString!(NAME_Hot2HSwordblade, NAME_Ore, NAME_2HSwordblade);
} // !comp_time
};

func void MOB_Cool_2HSwordblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_2HSwordblade, 			// Produkt
	NAME_2HSwordblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_Hot2HSwordblade);		// Art Rohstoff
	MOB_Cool_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Blood2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_Blood2HSwordblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_Blood2HSwordblade;
	information		= MOB_Cool_Blood2HSwordblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_Hot2HSwordblade, NAME_BloodOre, NAME_2HSwordblade);
} else {
	description		= B_BuildCoolString!(NAME_Hot2HSwordblade, NAME_BloodOre, NAME_2HSwordblade);
} // !comp_time
};

func void MOB_Cool_Blood2HSwordblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Blood2HSwordblade, 	// Produkt
	NAME_2HSwordblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_BloodHot2HSwordblade);	// Art Rohstoff
	MOB_Cool_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Dark2HSwordblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_Dark2HSwordblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_Dark2HSwordblade;
	information		= MOB_Cool_Dark2HSwordblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_Hot2HSwordblade, NAME_DarkOre, NAME_2HSwordblade);
} else {
	description		= B_BuildCoolString!(NAME_Hot2HSwordblade, NAME_DarkOre, NAME_2HSwordblade);
} // !comp_time
};

func void MOB_Cool_Dark2HSwordblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Dark2HSwordblade, 		// Produkt
	NAME_2HSwordblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_DarkHot2HSwordblade);	// Art Rohstoff
	MOB_Cool_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Axeblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_Axeblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_Axeblade;
	information		= MOB_Cool_Axeblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_HotAxeblade, NAME_Ore, NAME_Axeblade);
} else {
	description		= B_BuildCoolString!(NAME_HotAxeblade, NAME_Ore, NAME_Axeblade);
} // !comp_time
};

func void MOB_Cool_Axeblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Axeblade, 				// Produkt
	NAME_Axeblade, 				// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_HotAxeblade);			// Art Rohstoff
	MOB_Cool_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Info 2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_2HAxeblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_2HAxeblade;
	information		= MOB_Cool_2HAxeblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_Hot2HAxeblade, NAME_Ore, NAME_2HAxeblade);
} else {
	description		= B_BuildCoolString!(NAME_Hot2HAxeblade, NAME_Ore, NAME_2HAxeblade);
} // !comp_time
};

func void MOB_Cool_2HAxeblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_2HAxeblade, 			// Produkt
	NAME_2HAxeblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_Hot2HAxeblade);		// Art Rohstoff
	MOB_Cool_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Blood2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_Blood2HAxeblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_Blood2HAxeblade;
	information		= MOB_Cool_Blood2HAxeblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_Hot2HAxeblade, NAME_BloodOre, NAME_2HAxeblade);
} else {
	description		= B_BuildCoolString!(NAME_Hot2HAxeblade, NAME_BloodOre, NAME_2HAxeblade);
} // !comp_time
};

func void MOB_Cool_Blood2HAxeblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Blood2HAxeblade, 		// Produkt
	NAME_2HAxeblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_BloodHot2HAxeblade);	// Art Rohstoff
	MOB_Cool_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Dark2HAxeblade
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_Dark2HAxeblade(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_Dark2HAxeblade;
	information		= MOB_Cool_Dark2HAxeblade_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_Hot2HAxeblade, NAME_DarkOre, NAME_2HAxeblade);
} else {
	description		= B_BuildCoolString!(NAME_Hot2HAxeblade, NAME_DarkOre, NAME_2HAxeblade);
} // !comp_time
};

func void MOB_Cool_Dark2HAxeblade_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Dark2HAxeblade, 		// Produkt
	NAME_2HAxeblade, 			// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_DarkHot2HAxeblade);	// Art Rohstoff
	MOB_Cool_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Stump
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_Stump(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_Stump;
	information		= MOB_Cool_Stump_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_HotStump, NAME_Ore, NAME_Stump);
} else {
	description		= B_BuildCoolString!(NAME_HotStump, NAME_Ore, NAME_Stump);
} // !comp_time
};

func void MOB_Cool_Stump_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Stump, 				// Produkt
	NAME_Stump, 				// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_HotStump);				// Art Rohstoff
	MOB_Cool_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	2HStump
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_2HStump(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_2HStump;
	information		= MOB_Cool_2HStump_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_Hot2HStump, NAME_Ore, NAME_2HStump);
} else {
	description		= B_BuildCoolString!(NAME_Hot2HStump, NAME_Ore, NAME_2HStump);
} // !comp_time
};

func void MOB_Cool_2HStump_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_2HStump, 				// Produkt
	NAME_2HStump, 				// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_Hot2HStump);			// Art Rohstoff
	MOB_Cool_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Blood2HStump
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_Blood2HStump(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_Blood2HStump;
	information		= MOB_Cool_Blood2HStump_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_Hot2HStump, NAME_BloodOre, NAME_2HStump);
} else {
	description		= B_BuildCoolString!(NAME_Hot2HStump, NAME_BloodOre, NAME_2HStump);
} // !comp_time
};

func void MOB_Cool_Blood2HStump_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Blood2HStump, 			// Produkt
	NAME_2HStump, 				// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_BloodHot2HStump);		// Art Rohstoff
	MOB_Cool_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Dark2HStump
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cool_Dark2HStump(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cool_CanProduce_Dark2HStump;
	information		= MOB_Cool_Dark2HStump_Info;
	permanent		= TRUE;
#if !comp_time {
	description		= B_BuildCoolString(NAME_Hot2HStump, NAME_DarkOre, NAME_2HStump);
} else {
	description		= B_BuildCoolString!(NAME_Hot2HStump, NAME_DarkOre, NAME_2HStump);
} // !comp_time
};

func void MOB_Cool_Dark2HStump_Info()
{
	B_ProduceItem(1, 			// Anzahl Produkt
	ItMi_Dark2HStump, 			// Produkt
	NAME_2HStump, 				// Produkt-Name
	1, 							// Anzahl Rohstoff
	ItMi_DarkHot2HStump);		// Art Rohstoff
	MOB_Cool_AutoExit();
};
