//#################################################################################
//#################################################################################
//
//	Mobsi CAULDRON - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_HasBasics()
{
	PrintDebugMobsi("MOB_Cauldron_HasBasics");
	if ((hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_CAULDRON)
	&& (Npc_HasItems(hero, ItMi_Scoop) || Npc_HasItems(hero, ItMi_StinkingSalt)))
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanSpoil
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanSpoil()
{
	PrintDebugMobsi("MOB_Cauldron_CanSpoil");
	var C_Npc halvor; halvor = Hlp_GetNpc(MIL_100_Halvor);
	if ((Npc_GetDistToWP(hero, HALVOR_WP_COOKING) < HALVOR_COOKING_AREA)
	&& !Npc_CanSeeNpc(halvor, hero)
	&& !Halvor_StewSalted)
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMeatbugSoup
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMeatbugSoup()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMeatbugSoup");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItAt_Meatbug) >= 1)
	&& (Npc_HasItems(self, ItFo_Loaf) >= 1)
	&& Knows_RecipeMeatbug
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMeatbugStew
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMeatbugStew()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMeatbugStew");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItAt_Meatbug) >= 1)
	&& (Npc_HasItems(self, ItFo_Cheese) >= 1)
	&& Knows_RecipeMeatbug
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMeatbugPie
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMeatbugPie()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMeatbugPie");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItAt_Meatbug) >= 1)
	&& (Npc_HasItems(self, ItFo_Ham) >= 1)
	&& Knows_RecipeMeatbug
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMoleratSoup
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMoleratSoup()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMoleratSoup");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItAt_MoleratGrease) >= 1)
	&& (Npc_HasItems(self, ItFo_Loaf) >= 1)
	&& Knows_RecipeMolerat
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMoleratStew
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMoleratStew()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMoleratStew");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItAt_MoleratGrease) >= 1)
	&& (Npc_HasItems(self, ItFo_Cheese) >= 1)
	&& Knows_RecipeMolerat
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMoleratPie
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMoleratPie()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMoleratPie");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItAt_MoleratGrease) >= 1)
	&& (Npc_HasItems(self, ItFo_Ham) >= 1)
	&& Knows_RecipeMolerat
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceHerbSoup
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceHerbSoup()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceHerbSoup");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItPl_Swampweed) >= 1)
	&& (Npc_HasItems(self, ItFo_Loaf) >= 1)
	&& Knows_RecipeHerb
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceHerbStew
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceHerbStew()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceHerbStew");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItPl_Swampweed) >= 1)
	&& (Npc_HasItems(self, ItFo_Cheese) >= 1)
	&& Knows_RecipeHerb
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceHerbPie
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceHerbPie()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceHerbPie");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItPl_Swampweed) >= 1)
	&& (Npc_HasItems(self, ItFo_Ham) >= 1)
	&& Knows_RecipeHerb
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMushroomSoup
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMushroomSoup()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMushroomSoup");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItPl_CaveMushroom) >= 1)
	&& (Npc_HasItems(self, ItFo_Loaf) >= 1)
	&& Knows_RecipeMushroom
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMushroomStew
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMushroomStew()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMushroomStew");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItPl_CaveMushroom) >= 1)
	&& (Npc_HasItems(self, ItFo_Cheese) >= 1)
	&& Knows_RecipeMushroom
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMushroomPie
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMushroomPie()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMushroomPie");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItPl_CaveMushroom) >= 1)
	&& (Npc_HasItems(self, ItFo_Ham) >= 1)
	&& Knows_RecipeMushroom
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMeatSoup
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMeatSoup()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMeatSoup");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItFo_Mutton) >= 1)
	&& (Npc_HasItems(self, ItFo_Loaf) >= 1)
	&& Knows_RecipeMeat
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMeatStew
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMeatStew()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMeatStew");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItFo_Mutton) >= 1)
	&& (Npc_HasItems(self, ItFo_Cheese) >= 1)
	&& Knows_RecipeMeat
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMeatPie
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMeatPie()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMeatPie");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_COOK) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_Salt) >= 1)
	&& (Npc_HasItems(self, ItFo_Mutton) >= 1)
	&& (Npc_HasItems(self, ItFo_Ham) >= 1)
	&& Knows_RecipeMeat
	&& MOB_Cauldron_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMeatbug
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMeatbug()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMeatbug");

	if (MOB_Cauldron_CanProduceMeatbugSoup()
	|| MOB_Cauldron_CanProduceMeatbugStew()
	|| MOB_Cauldron_CanProduceMeatbugPie())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMolerat
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMolerat()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMolerat");

	if (MOB_Cauldron_CanProduceMoleratSoup()
	|| MOB_Cauldron_CanProduceMoleratStew()
	|| MOB_Cauldron_CanProduceMoleratPie())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceHerb
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceHerb()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceHerb");

	if (MOB_Cauldron_CanProduceHerbSoup()
	|| MOB_Cauldron_CanProduceHerbStew()
	|| MOB_Cauldron_CanProduceHerbPie())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMushroom
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMushroom()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMushroom");

	if (MOB_Cauldron_CanProduceMushroomSoup()
	|| MOB_Cauldron_CanProduceMushroomStew()
	|| MOB_Cauldron_CanProduceMushroomPie())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Cauldron_CanProduceMeat
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Cauldron_CanProduceMeat()
{
	PrintDebugMobsi("MOB_Cauldron_CanProduceMeat");

	if (MOB_Cauldron_CanProduceMeatSoup()
	|| MOB_Cauldron_CanProduceMeatStew()
	|| MOB_Cauldron_CanProduceMeatPie())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_CAULDRON_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int MOB_CAULDRON_CanProduce()
{
	PrintDebugMobsi("MOB_CAULDRON_CanProduce");

	if (MOB_Cauldron_CanProduceMeatbug()
	|| MOB_Cauldron_CanProduceMolerat()
	|| MOB_Cauldron_CanProduceHerb()
	|| MOB_Cauldron_CanProduceMushroom()
	|| MOB_Cauldron_CanProduceMeat()
	|| MOB_Cauldron_CanSpoil())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(PD_FALSE);
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_CAULDRON_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_CAULDRON_GetCantString()
{
	PrintDebugMobsi("MOB_CAULDRON_GetCantString");

	if (Npc_GetTalentSkill(self, NPC_TALENT_COOK) < 1)
	{
		var C_Npc halvor; halvor = Hlp_GetNpc(MIL_100_Halvor);
		if ((Npc_GetDistToWP(hero, HALVOR_WP_COOKING) < HALVOR_COOKING_AREA)
		&& Npc_CanSeeNpc(halvor, hero)
		&& !Halvor_StewSalted
		&& Npc_HasItems(hero, ItMi_StinkingSalt))
		{
			PrintDebugMobsi("MOB_CAULDRON_GetCantString ...Halvor can see");
			return _STR_MESSAGE_MOBSI_CAULDRON_HALVOR;
		}
		else
		{
			PrintDebugMobsi("MOB_CAULDRON_GetCantString ...no Talent");
			return _STR_MESSAGE_MOBSI_CAULDRON_TAL;
		};
	}
	else
	{
		if (Npc_HasItems(self, ItMi_Scoop) < 1)
		{
			PrintDebugMobsi("MOB_CAULDRON_GetCantString... no Tool");
			return _STR_MESSAGE_MOBSI_CAULDRON_TOOL;
		}
		else
		{
			PrintDebugMobsi("MOB_CAULDRON_GetCantString no Material");
			return _STR_MESSAGE_MOBSI_CAULDRON_MAT;
		};
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi CAULDRON - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_CAULDRON_CONDITION()
{
	PrintDebugMobsi("MOB_CAULDRON_CONDITION");
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_CAULDRON;

	if (Npc_IsPlayer(self))
	{
		if (MOB_CAULDRON_CanProduce())
		{
			PrintDebugMobsi(PD_TRUE);
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_CAULDRON_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("...FALSE");
			return FALSE;
		};
	}
	else
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Cauldron_S1()
{
	PrintDebugMobsi("MOB_Cauldron_S1");

	if (B_CompareNpcInstance(self, hero))
	{
		PrintDebugMobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;
		self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_Cauldron;

		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Scoop);

		AI_ProcessInfos(self);
	}
	else
	{
		PrintDebugMobsi("... von Nsc benutzt");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Scoop);
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi CAULDRON - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_EXIT(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_Cauldron_HasBasics;
	information		= MOB_Cauldron_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_Cauldron_EXIT_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	_ = AI_UseMob(self, SCEMENAME_CAULDRON, -1);
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Cauldron_AutoExit()
{
	PrintDebugMobsi("MOB_Cauldron_AutoExit");

	if (!MOB_Cauldron_CanProduce())
	{
		MOB_Cauldron_Exit_Info();
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi CAULDRON - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Spoil Halvor's Meat-Stew
///////////////////////////////////////////////////////////////////////////////////
instance MOB_CAULDRON_Spoil(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanSpoil;
	information		= MOB_Cauldron_Spoil_Info;
	description		= "(Müffelsalz hineinrühren)";
};

func void MOB_Cauldron_Spoil_Info()
{
	_ = PrintScreen(_STR_MESSAGE_MOBSI_CAULDRON_SPOIL, -1, _YPOS_MESSAGE_PRODUCE, FONT_OLD_SMALL, _TIME_MESSAGE_PRODUCE);

	_ = Npc_RemoveInvItem(hero, ItMi_StinkingSalt);
	Halvor_StewSalted = TRUE;
	B_Snaf_Salted();

	//---- Animation ----
	AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Scoop);
	AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_StinkingSalt);
	AI_PlayAni(self, "T_CAULDRON_DROP_1");
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_PlayAni(self, "T_CAULDRON_DROP_2");
	AI_PlayAni(self, "T_CAULDRON_MIX_1");					// Einmal umrühren
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Fleischwanzen-Suppe
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMeatbugSoup(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMeatbugSoup;
	information		= MOB_Cauldron_ProduceMeatbugSoup_Info;
	permanent		= TRUE;
	description		= NAME_MeatbugSoup;
};

func void MOB_Cauldron_ProduceMeatbugSoup_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MeatbugSoup, 			// Art Produkt
	NAME_MeatbugSoup, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItAt_Meatbug, 				// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Loaf);					// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Fleischwanzen-Eintopf
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMeatbugStew(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMeatbugStew;
	information		= MOB_Cauldron_ProduceMeatbugStew_Info;
	permanent		= TRUE;
	description		= NAME_MeatbugStew;
};

func void MOB_Cauldron_ProduceMeatbugStew_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MeatbugStew, 			// Art Produkt
	NAME_MeatbugStew, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItAt_Meatbug, 				// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Cheese);				// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Fleischwanzen-Ragout
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMeatbugPie(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMeatbugPie;
	information		= MOB_Cauldron_ProduceMeatbugPie_Info;
	permanent		= TRUE;
	description		= NAME_MeatbugPie;
};

func void MOB_Cauldron_ProduceMeatbugPie_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MeatbugPie, 			// Art Produkt
	NAME_MeatbugPie, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItAt_Meatbug, 				// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Cheese);				// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Molerat-Suppe
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMoleratSoup(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMoleratSoup;
	information		= MOB_Cauldron_ProduceMoleratSoup_Info;
	permanent		= TRUE;
	description		= NAME_MoleratSoup;
};

func void MOB_Cauldron_ProduceMoleratSoup_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MoleratSoup, 			// Art Produkt
	NAME_MoleratSoup, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItAt_MoleratGrease, 		// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Loaf);					// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Molerat-Eintopf
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMoleratStew(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMoleratStew;
	information		= MOB_Cauldron_ProduceMoleratStew_Info;
	permanent		= TRUE;
	description		= NAME_MoleratStew;
};

func void MOB_Cauldron_ProduceMoleratStew_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MoleratStew, 			// Art Produkt
	NAME_MoleratStew, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItAt_MoleratGrease, 		// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Cheese);				// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Molerat-Ragout
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMoleratPie(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMoleratPie;
	information		= MOB_Cauldron_ProduceMoleratPie_Info;
	permanent		= TRUE;
	description		= NAME_MoleratPie;
};

func void MOB_Cauldron_ProduceMoleratPie_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MoleratPie, 			// Art Produkt
	NAME_MoleratPie, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItAt_MoleratGrease, 		// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Cheese);				// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Kräuter-Suppe
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceHerbSoup(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceHerbSoup;
	information		= MOB_Cauldron_ProduceHerbSoup_Info;
	permanent		= TRUE;
	description		= NAME_HerbSoup;
};

func void MOB_Cauldron_ProduceHerbSoup_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_HerbSoup, 				// Art Produkt
	NAME_HerbSoup, 				// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_SwampWeed, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Loaf);					// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Kräuter-Eintopf
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceHerbStew(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceHerbStew;
	information		= MOB_Cauldron_ProduceHerbStew_Info;
	permanent		= TRUE;
	description		= NAME_HerbStew;
};

func void MOB_Cauldron_ProduceHerbStew_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_HerbStew, 				// Art Produkt
	NAME_HerbStew, 				// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_SwampWeed, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Cheese);				// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Kräuter-Ragout
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceHerbPie(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceHerbPie;
	information		= MOB_Cauldron_ProduceHerbPie_Info;
	permanent		= TRUE;
	description		= NAME_HerbPie;
};

func void MOB_Cauldron_ProduceHerbPie_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_HerbPie, 				// Art Produkt
	NAME_HerbPie, 				// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_SwampWeed, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Cheese);				// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Pilz-Suppe
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMushroomSoup(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMushroomSoup;
	information		= MOB_Cauldron_ProduceMushroomSoup_Info;
	permanent		= TRUE;
	description		= NAME_MushroomSoup;
};

func void MOB_Cauldron_ProduceMushroomSoup_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MushroomSoup, 			// Art Produkt
	NAME_MushroomSoup, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_CaveMushroom, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Loaf);					// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Pilz-Eintopf
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMushroomStew(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMushroomStew;
	information		= MOB_Cauldron_ProduceMushroomStew_Info;
	permanent		= TRUE;
	description		= NAME_MushroomStew;
};

func void MOB_Cauldron_ProduceMushroomStew_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MushroomStew, 			// Art Produkt
	NAME_MushroomStew, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_CaveMushroom, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Cheese);				// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Pilz-Ragout
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMushroomPie(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMushroomPie;
	information		= MOB_Cauldron_ProduceMushroomPie_Info;
	permanent		= TRUE;
	description		= NAME_MushroomPie;
};

func void MOB_Cauldron_ProduceMushroomPie_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MushroomPie, 			// Art Produkt
	NAME_MushroomPie, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_CaveMushroom, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Cheese);				// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Fleisch-Suppe
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMeatSoup(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMeatSoup;
	information		= MOB_Cauldron_ProduceMeatSoup_Info;
	permanent		= TRUE;
	description		= NAME_MeatSoup;
};

func void MOB_Cauldron_ProduceMeatSoup_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MeatSoup, 				// Art Produkt
	NAME_MeatSoup, 				// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItFo_Mutton, 				// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Loaf);					// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Fleisch-Eintopf
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMeatStew(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMeatStew;
	information		= MOB_Cauldron_ProduceMeatStew_Info;
	permanent		= TRUE;
	description		= NAME_MeatStew;
};

func void MOB_Cauldron_ProduceMeatStew_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MeatStew, 				// Art Produkt
	NAME_MeatStew, 				// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItFo_Mutton, 				// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Cheese);				// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Fleisch-Ragout
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Cauldron_ProduceMeatPie(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Cauldron_CanProduceMeatPie;
	information		= MOB_Cauldron_ProduceMeatPie_Info;
	permanent		= TRUE;
	description		= NAME_MeatPie;
};

func void MOB_Cauldron_ProduceMeatPie_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_MeatPie, 				// Art Produkt
	NAME_MeatPie, 				// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Salt, 					// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItFo_Mutton, 				// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItFo_Cheese);				// Art Rohstoff 3

	MOB_Cauldron_AutoExit();
};
