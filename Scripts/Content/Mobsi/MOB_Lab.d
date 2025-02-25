//#################################################################################
//#################################################################################
//
//	Mobsi LAB - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Lab_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_HasBasics()
{
	PrintDebugMobsi("MOB_Lab_HasBasics");
	if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_LAB)
	{
		return TRUE;
	};

	return FALSE;
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Lab_CanProduceHealth1
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceHealth1()
{
	PrintDebugMobsi("MOB_Lab_CanProduceHealth1");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_ALCHEMY) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_Alcohol) >= 1)
	&& (Npc_HasItems(self, ItPl_MountainMoss) >= 1)
	&& (Npc_HasItems(self, ItPl_OrcLeaf) >= 1)
	&& Knows_HealingPotions
	&& MOB_Lab_HasBasics())
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
//	MOB_Lab_CanProduceMana1
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceMana1()
{
	PrintDebugMobsi("MOB_Lab_CanProduceMana1");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_ALCHEMY) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_Alcohol) >= 1)
	&& (Npc_HasItems(self, ItPl_Stoneroot) >= 1)
	&& (Npc_HasItems(self, ItPl_OrcLeaf) >= 1)
	&& Knows_ManaPotions
	&& MOB_Lab_HasBasics())
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
//	MOB_Lab_CanProduceSpeed1
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceSpeed1()
{
	PrintDebugMobsi("MOB_Lab_CanProduceSpeed1");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_ALCHEMY) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItMi_Alcohol) >= 1)
	&& (Npc_HasItems(self, ItPl_BloodThistle) >= 1)
	&& (Npc_HasItems(self, ItPl_OrcLeaf) >= 1)
	&& Knows_SpeedPotions
	&& MOB_Lab_HasBasics())
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
//	MOB_Lab_CanProduceHealth2
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceHealth2()
{
	PrintDebugMobsi("MOB_Lab_CanProduceHealth2");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_ALCHEMY) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_Alcohol) >= 1)
	&& (Npc_HasItems(self, ItPl_MountainMoss) >= 1)
	&& (Npc_HasItems(self, ItPl_RavenHerb) >= 1)
	&& Knows_HealingPotions
	&& MOB_Lab_HasBasics())
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
//	MOB_Lab_CanProduceMana2
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceMana2()
{
	PrintDebugMobsi("MOB_Lab_CanProduceMana2");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_ALCHEMY) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_Alcohol) >= 1)
	&& (Npc_HasItems(self, ItPl_Stoneroot) >= 1)
	&& (Npc_HasItems(self, ItPl_RavenHerb) >= 1)
	&& Knows_ManaPotions
	&& MOB_Lab_HasBasics())
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
//	MOB_Lab_CanProduceSpeed2
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceSpeed2()
{
	PrintDebugMobsi("MOB_Lab_CanProduceSpeed2");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_ALCHEMY) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItMi_Alcohol) >= 1)
	&& (Npc_HasItems(self, ItPl_BloodThistle) >= 1)
	&& (Npc_HasItems(self, ItPl_RavenHerb) >= 1)
	&& Knows_SpeedPotions
	&& MOB_Lab_HasBasics())
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		PrintDebugMobsi(".,.FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Lab_CanProduceHealth3
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceHealth3()
{
	PrintDebugMobsi("MOB_Lab_CanProduceHealth3");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_ALCHEMY) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_Alcohol) >= 1)
	&& (Npc_HasItems(self, ItPl_MountainMoss) >= 1)
	&& (Npc_HasItems(self, ItPl_Nightshade) >= 1)
	&& Knows_HealingPotions
	&& MOB_Lab_HasBasics())
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
//	MOB_Lab_CanProduceMana3
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceMana3()
{
	PrintDebugMobsi("MOB_Lab_CanProduceMana3");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_ALCHEMY) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_Alcohol) >= 1)
	&& (Npc_HasItems(self, ItPl_Stoneroot) >= 1)
	&& (Npc_HasItems(self, ItPl_Nightshade) >= 1)
	&& Knows_ManaPotions
	&& MOB_Lab_HasBasics())
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
//	MOB_Lab_CanProduceSpeed3
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceSpeed3()
{
	PrintDebugMobsi("MOB_Lab_CanProduceSpeed3");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_ALCHEMY) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItMi_Alcohol) >= 1)
	&& (Npc_HasItems(self, ItPl_BloodThistle) >= 1)
	&& (Npc_HasItems(self, ItPl_Nightshade) >= 1)
	&& Knows_SpeedPotions
	&& MOB_Lab_HasBasics())
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
//	MOB_Lab_CanProduceHealth
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceHealth()
{
	PrintDebugMobsi("MOB_Lab_CanProduceHealth");
	if (MOB_Lab_CanProduceHealth1()
	|| MOB_Lab_CanProduceHealth2()
	|| MOB_Lab_CanProduceHealth3())
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
//	MOB_Lab_CanProduceMana
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceMana()
{
	PrintDebugMobsi("MOB_Lab_CanProduceMana");
	if (MOB_Lab_CanProduceMana1()
	|| MOB_Lab_CanProduceMana2()
	|| MOB_Lab_CanProduceMana3())
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
//	MOB_Lab_CanProduceSpeed
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduceSpeed()
{
	PrintDebugMobsi("MOB_Lab_CanProduceSpeed");
	if (MOB_Lab_CanProduceSpeed1()
	|| MOB_Lab_CanProduceSpeed2()
	|| MOB_Lab_CanProduceSpeed3())
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
//	MOB_Lab_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CanProduce()
{
	PrintDebugMobsi("MOB_Lab_CanProduce");
	if (MOB_Lab_CanProduceHealth()
	|| MOB_Lab_CanProduceMana()
	|| MOB_Lab_CanProduceSpeed())
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
//	MOB_Lab_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_Lab_GetCantString()
{
	PrintDebugMobsi("MOB_Lab_GetCantString");
	if (Npc_GetTalentSkill(self, NPC_TALENT_ALCHEMY) < 1)
	{
		PrintDebugMobsi("...no Talent");
		return _STR_MESSAGE_MOBSI_Lab_TAL;
	}
	else
	{
		PrintDebugMobsi("...no Material");
		return _STR_MESSAGE_MOBSI_Lab_MAT;
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi LAB - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Lab_CONDITION()
{
	PrintDebugMobsi("MOB_Lab_CONDITION");
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_LAB;

	if (Npc_IsPlayer(self))
	{
		if (MOB_Lab_CanProduce())
		{
			PrintDebugMobsi(PD_TRUE);
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_Lab_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi(PD_FALSE);
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
func void MOB_LAB_S0()
{
	if (B_CompareNpcInstance(self, hero))
	{
		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	};

	PrintDebugMobsi("MOB_LAB_S0");
};

func void MOB_Lab_S1()
{
	PrintDebugMobsi("MOB_Lab_S1");

	if (B_CompareNpcInstance(self, hero))
	{
		PrintDebugMobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;
		self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_LAB;

		AI_ProcessInfos(self);
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi LAB - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Lab_EXIT(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_Lab_EXIT_Condition;
	information		= MOB_Lab_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int MOB_Lab_EXIT_Condition()
{
	return(hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_LAB);
};

func void MOB_Lab_EXIT_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	//MOBSI-Abmeldung hier!
	_ = AI_UseMob(self, SCEMENAME_LAB, -1);
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Lab_AutoExit()
{
	PrintDebugMobsi("MOB_Lab_AutoExit");

	if (!MOB_Lab_CanProduce())
	{
		MOB_Lab_Exit_Info();
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi LAB - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Heiltrank 1
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Lab_ProduceHealth1(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Lab_CanProduceHealth1;
	information		= MOB_Lab_ProduceHealth1_Info;
	permanent		= TRUE;
	description		= NAME_HealthPotion1;
};

func void MOB_Lab_ProduceHealth1_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_Potion_Health_01, 		// Art Produkt
	NAME_HealthPotion1, 		// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Alcohol, 				// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_MountainMoss, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItPl_OrcLeaf);				// Art Rohstoff 3

	MOB_Lab_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Heiltrank 2
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Lab_ProduceHealth2(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Lab_CanProduceHealth2;
	information		= MOB_Lab_ProduceHealth2_Info;
	permanent		= TRUE;
	description		= NAME_HealthPotion2;
};

func void MOB_Lab_ProduceHealth2_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_Potion_Health_02, 		// Art Produkt
	NAME_HealthPotion2, 		// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Alcohol, 				// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_MountainMoss, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItPl_RavenHerb);			// Art Rohstoff 3

	MOB_Lab_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Heiltrank 3
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Lab_ProduceHealth3(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Lab_CanProduceHealth3;
	information		= MOB_Lab_ProduceHealth3_Info;
	permanent		= TRUE;
	description		= NAME_HealthPotion3;
};

func void MOB_Lab_ProduceHealth3_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_Potion_Health_03, 		// Art Produkt
	NAME_HealthPotion3, 		// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Alcohol, 				// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_MountainMoss, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItPl_Nightshade);			// Art Rohstoff 3

	MOB_Lab_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Manatrank 1
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Lab_ProduceMana1(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Lab_CanProduceMana1;
	information		= MOB_Lab_ProduceMana1_Info;
	permanent		= TRUE;
	description		= NAME_ManaPotion1;
};

func void MOB_Lab_ProduceMana1_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_Potion_Mana_01, 		// Art Produkt
	NAME_ManaPotion1, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Alcohol, 				// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_Stoneroot, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItPl_OrcLeaf);				// Art Rohstoff 3

	MOB_Lab_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Manatrank 2
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Lab_ProduceMana2(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Lab_CanProduceMana2;
	information		= MOB_Lab_ProduceMana2_Info;
	permanent		= TRUE;
	description		= NAME_ManaPotion2;
};

func void MOB_Lab_ProduceMana2_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_Potion_Mana_02, 		// Art Produkt
	NAME_ManaPotion2, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Alcohol, 				// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_Stoneroot, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItPl_RavenHerb);			// Art Rohstoff 3

	MOB_Lab_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Manatrank 3
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Lab_ProduceMana3(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Lab_CanProduceMana3;
	information		= MOB_Lab_ProduceMana3_Info;
	permanent		= TRUE;
	description		= NAME_ManaPotion3;
};

func void MOB_Lab_ProduceMana3_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_Potion_Mana_03, 		// Art Produkt
	NAME_ManaPotion3, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Alcohol, 				// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_Stoneroot, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItPl_Nightshade);			// Art Rohstoff 3

	MOB_Lab_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Speedtrank 1
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Lab_ProduceSpeed1(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Lab_CanProduceSpeed1;
	information		= MOB_Lab_ProduceSpeed1_Info;
	permanent		= TRUE;
	description		= NAME_SpeedPotion1;
};

func void MOB_Lab_ProduceSpeed1_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_Potion_Haste_01, 		// Art Produkt
	NAME_SpeedPotion1, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Alcohol, 				// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_BloodThistle, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItPl_OrcLeaf);				// Art Rohstoff 3

	MOB_Lab_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Speedtrank 2
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Lab_ProduceSpeed2(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Lab_CanProduceSpeed2;
	information		= MOB_Lab_ProduceSpeed2_Info;
	permanent		= TRUE;
	description		= NAME_SpeedPotion2;
};

func void MOB_Lab_ProduceSpeed2_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_Potion_Haste_02, 		// Art Produkt
	NAME_SpeedPotion2, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Alcohol, 				// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_BloodThistle, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItPl_RavenHerb);			// Art Rohstoff 3

	MOB_Lab_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Speedtrank 3
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Lab_ProduceSpeed3(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Lab_CanProduceSpeed3;
	information		= MOB_Lab_ProduceSpeed3_Info;
	permanent		= TRUE;
	description		= NAME_SpeedPotion3;
};

func void MOB_Lab_ProduceSpeed3_Info()
{
	B_ProduceItem3(1, 			// Anzahl Produkt
	ItFo_Potion_Haste_03, 		// Art Produkt
	NAME_SpeedPotion3, 			// Produkt-Name
	1, 							// Anzahl Rohstoff 1
	ItMi_Alcohol, 				// Art Rohstoff 1
	1, 							// Anzahl Rohstoff 2
	ItPl_BloodThistle, 			// Art Rohstoff 2
	1, 							// Anzahl Rohstoff 3
	ItPl_Nightshade);			// Art Rohstoff 3

	MOB_Lab_AutoExit();
};
