//#################################################################################
//#################################################################################
//
//	Mobsi RUNEMAKER - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_HasBasics()
{
	if ((hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_RUNEMAKER)
	&& (Npc_HasItems(self, ITMI_pliers) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneLight
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneLight()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneLight");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_1)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItAr_RuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollLight) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneLight)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneFirebolt
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneFirebolt()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneFirebolt");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_1)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItAr_RuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollFirebolt) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneFirebolt)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneHeal
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneHeal()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneHeal");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_1)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItAr_RuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollHeal) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneHeal)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneThunderbolt
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneThunderbolt()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneThunderbolt");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_1)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_1)
	&& (Npc_HasItems(self, ItAr_RuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollThunderbolt) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneThunderbolt)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneWindfist
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneWindfist()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneWindfist");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_1)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItAr_RuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollWindfist) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneWindfist)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneSleep
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneSleep()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneSleep");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_1)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_2)
	&& (Npc_HasItems(self, ItAr_RuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollSleep) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneSleep)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneCharm
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneCharm()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneCharm");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItAr_BloodRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollCharm) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneCharm)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneThunderball
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneThunderball()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneThunderball");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItAr_BloodRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollThunderball) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneThunderball)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneIcecube
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneIcecube()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneIcecube");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItAr_BloodRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollIceCube) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneIcecube)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRunePyrokinesis
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRunePyrokinesis()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRunePyrokinesis");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItAr_BloodRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollPyrokinesis) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RunePyrokinesis)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneDestroyUndead
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneDestroyUndead()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneDestroyUndead");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_4)
	&& (Npc_HasItems(self, ItAr_BloodRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollDestroyUndead) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneDestroyUndead)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneChainlightning
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneChainlightning()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneChainlightning");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_4)
	&& (Npc_HasItems(self, ItAr_BloodRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollChainLightning) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneChainlightning)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneStormfist
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneStormfist()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneStormfist");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_4)
	&& (Npc_HasItems(self, ItAr_BloodRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollStormfist) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneStormfist)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneTelekinesis
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneTelekinesis()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneTelekinesis");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItAr_BloodRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollTelekinesis) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneTelekinesis)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneFireball
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneFireball()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneFireball");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_3)
	&& (Npc_HasItems(self, ItAr_BloodRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollFireball) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneFireball)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneFirestorm
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneFirestorm()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneFireStorm");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_4)
	&& (Npc_HasItems(self, ItAr_BloodRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollFirestorm) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneFireStorm)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneControl
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneControl()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneControl");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_2)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_4)
	&& (Npc_HasItems(self, ItAr_BloodRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollControl) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneControl)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneBreathOfDeath
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneBreathOfDeath()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneBreathOfDeath");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_3)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_6)
	&& (Npc_HasItems(self, ItAr_DarkRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollBreathOfDeath) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneBreathOfDeath)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneIcewave
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneIcewave()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneIcewave");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_3)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_5)
	&& (Npc_HasItems(self, ItAr_DarkRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollIceWave) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneIcewave)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduceRuneFirerain
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduceRuneFirerain()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduceRuneFireRain");
	if ((Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) >= TAL_STEP_3)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_MAGE) >= TAL_STEP_5)
	&& (Npc_HasItems(self, ItAr_DarkRuneBlank) >= 1)
	&& (Npc_HasItems(self, ItAr_ScrollFireRain) >= 1)
	&& (self.attribute[ATR_MANA_MAX] >= ManaPerm_RuneFireRain)
	&& MOB_RUNEMAKER_HasBasics())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int MOB_RUNEMAKER_CanProduce()
{
	PrintDebugNpc(PD_ZS_CHECK, "MOB_RUNEMAKER_CanProduce");

	if (MOB_RUNEMAKER_CanProduceRuneLight()
	|| MOB_RUNEMAKER_CanProduceRuneFirebolt()
	|| MOB_RUNEMAKER_CanProduceRuneFireball()
	|| MOB_RUNEMAKER_CanProduceRuneFirestorm()
	|| MOB_RUNEMAKER_CanProduceRuneFirerain()
	|| MOB_RUNEMAKER_CanProduceRuneHeal()
	|| MOB_RUNEMAKER_CanProduceRuneThunderbolt()
	|| MOB_RUNEMAKER_CanProduceRuneThunderball()
	|| MOB_RUNEMAKER_CanProduceRuneChainlightning()
	|| MOB_RUNEMAKER_CanProduceRuneIcecube()
	|| MOB_RUNEMAKER_CanProduceRuneIcewave()
	|| MOB_RUNEMAKER_CanProduceRunePyrokinesis()
	|| MOB_RUNEMAKER_CanProduceRuneWindfist()
	|| MOB_RUNEMAKER_CanProduceRuneStormfist()
	|| MOB_RUNEMAKER_CanProduceRuneTelekinesis()
	|| MOB_RUNEMAKER_CanProduceRuneControl()
	|| MOB_RUNEMAKER_CanProduceRuneCharm()
	|| MOB_RUNEMAKER_CanProduceRuneSleep())
	{
		PrintDebugNpc(PD_ZS_CHECK, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "FALSE");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_RUNEMAKER_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_RUNEMAKER_GetCantString()
{
	PrintDebugMobsi("MOB_runemaker_GetCantString");
	if (Npc_GetTalentSkill(self, NPC_TALENT_THAUMATURGY) < 1)
	{
		PrintDebugMobsi("MOB_runemaker_GetCantString ...no Talent");
		return _STR_MESSAGE_MOBSI_Rune_TAL;
	}
	else
	{
		if (Npc_HasItems(self, ItMi_Pliers) < 1)
		{
			PrintDebugMobsi("MOB_runemaker_GetCantString... no Tool");
			return _STR_MESSAGE_MOBSI_Rune_TOOL;
		}
		else
		{
			if (hero.attribute[ATR_MANA] < Mana_Rune)
			{
				PrintDebugMobsi("MOB_runemaker_GetCantString no Mana");
				return _STR_MESSAGE_MOBSI_Rune_MANA;
			}
			else
			{
				PrintDebugMobsi("MOB_runemaker_GetCantString no Material");
				return _STR_MESSAGE_MOBSI_Runemaker_MAT;
			};
		};
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi RUNEMAKER - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Runemaker_CONDITION()
{
	PrintDebugMobsi("MOB_runemaker_CONDITION");
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_runemaker;

	if (Npc_IsPlayer(self))
	{
		if (MOB_runemaker_CanProduce())
		{
			PrintDebugMobsi("MOB_runemaker_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_runemaker_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("MOB_runemaker_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		PrintDebugMobsi("MOB_runemaker_CONDITION...TRUE");
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_RUNEMAKER_S1()
{
	PrintDebugMobsi("MOB_rune_S1");

	if (B_CompareNpcInstance(self, hero))
	{
		PrintDebugMobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;
		self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_RUNEMAKER;

		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Pliers);

		AI_ProcessInfos(self);
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi RUNEMAKER - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////////////////
instance MOB_RUNEMAKER_EXIT(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_RUNEMAKER_EXIT_Condition;
	information		= MOB_RUNEMAKER_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int MOB_RUNEMAKER_EXIT_Condition()
{
	return(hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_RUNEMAKER);
};

func void MOB_RUNEMAKER_EXIT_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	_ = AI_UseMob(self, SCEMENAME_RUNEMAKER, -1);
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_RuneMaker_AutoExit()
{
	PrintDebugMobsi("MOB_Runemaker_AutoExit");

	if (!MOB_Runemaker_CanProduce())
	{
		MOB_Runemaker_Exit_Info();
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi RUNEMAKER - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Light
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Light(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneLight;
	information		= MOB_PRODUCE_Light_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Light, NAME_Rune, ManaPerm_RuneLight);
} else {
	description		= B_BuildRunemakerString(NAME_Light, NAME_Rune, ManaPerm_RuneLight);
}
};

func void MOB_PRODUCE_Light_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneLight,
	ConcatStrings(NAME_Light, NAME_RunePostfix),
	1,
	ItAr_RuneBlank,
	1,
	ItAr_ScrollLight);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneLight;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Firebolt
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Firebolt(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneFirebolt;
	information		= MOB_PRODUCE_Firebolt_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Firebolt, NAME_Rune, ManaPerm_RuneFirebolt);
} else {
	description		= B_BuildRunemakerString(NAME_Firebolt, NAME_Rune, ManaPerm_RuneFirebolt);
}
};

func void MOB_PRODUCE_Firebolt_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneFirebolt,
	ConcatStrings(NAME_Firebolt, NAME_RunePostfix),
	1,
	ItAr_RuneBlank,
	1,
	ItAr_ScrollFirebolt);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneFirebolt;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Heal
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Heal(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneHeal;
	information		= MOB_PRODUCE_Heal_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Heal, NAME_Rune, ManaPerm_RuneHeal);
} else {
	description		= B_BuildRunemakerString(NAME_Heal, NAME_Rune, ManaPerm_RuneHeal);
}
};

func void MOB_PRODUCE_Heal_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneHeal,
	ConcatStrings(NAME_Heal, NAME_RunePostfix),
	1,
	ItAr_RuneBlank,
	1,
	ItAr_ScrollHeal);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneHeal;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Thunderbolt
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Thunderbolt(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneThunderbolt;
	information		= MOB_PRODUCE_Thunderbolt_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Thunderbolt, NAME_Rune, ManaPerm_RuneThunderbolt);
} else {
	description		= B_BuildRunemakerString(NAME_Thunderbolt, NAME_Rune, ManaPerm_RuneThunderbolt);
}
};

func void MOB_PRODUCE_Thunderbolt_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneThunderbolt,
	ConcatStrings(NAME_Thunderbolt, NAME_RunePostfix),
	1,
	ItAr_RuneBlank,
	1,
	ItAr_ScrollThunderbolt);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneThunderbolt;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Windfist
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Windfist(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneWindfist;
	information		= MOB_PRODUCE_Windfist_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Windfist, NAME_Rune, ManaPerm_RuneWindfist);
} else {
	description		= B_BuildRunemakerString(NAME_Windfist, NAME_Rune, ManaPerm_RuneWindfist);
}
};

func void MOB_PRODUCE_Windfist_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneWindfist,
	ConcatStrings(NAME_Windfist, NAME_RunePostfix),
	1,
	ItAr_RuneBlank,
	1,
	ItAr_ScrollWindfist);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneWindfist;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Sleep
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Sleep(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneSleep;
	information		= MOB_PRODUCE_Sleep_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Sleep, NAME_Rune, ManaPerm_RuneSleep);
} else {
	description		= B_BuildRunemakerString(NAME_Sleep, NAME_Rune, ManaPerm_RuneSleep);
}
};

func void MOB_PRODUCE_Sleep_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneSleep,
	ConcatStrings(NAME_Sleep, NAME_RunePostfix),
	1,
	ItAr_RuneBlank,
	1,
	ItAr_ScrollSleep);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneSleep;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Charm
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Charm(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneCharm;
	information		= MOB_PRODUCE_Charm_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Charm, NAME_Rune, ManaPerm_RuneCharm);
} else {
	description		= B_BuildRunemakerString(NAME_Charm, NAME_Rune, ManaPerm_RuneCharm);
}
};

func void MOB_PRODUCE_Charm_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneCharm,
	ConcatStrings(NAME_Charm, NAME_RunePostfix),
	1,
	ItAr_BloodRuneBlank,
	1,
	ItAr_ScrollCharm);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneCharm;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Thunderball
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Thunderball(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneThunderball;
	information		= MOB_PRODUCE_Thunderball_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Thunderball, NAME_Rune, ManaPerm_RuneThunderball);
} else {
	description		= B_BuildRunemakerString(NAME_Thunderball, NAME_Rune, ManaPerm_RuneThunderball);
}
};

func void MOB_PRODUCE_Thunderball_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneThunderball,
	ConcatStrings(NAME_Thunderball, NAME_RunePostfix),
	1,
	ItAr_BloodRuneBlank,
	1,
	ItAr_ScrollThunderball);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneThunderball;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Icecube
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Icecube(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneIcecube;
	information		= MOB_PRODUCE_Icecube_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Icecube, NAME_Rune, ManaPerm_RuneIcecube);
} else {
	description		= B_BuildRunemakerString(NAME_Icecube, NAME_Rune, ManaPerm_RuneIcecube);
}
};

func void MOB_PRODUCE_Icecube_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneIceCube,
	ConcatStrings(NAME_Icecube, NAME_RunePostfix),
	1,
	ItAr_BloodRuneBlank,
	1,
	ItAr_ScrollIceCube);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneIcecube;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Pyrokinesis
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Pyrokinesis(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRunePyrokinesis;
	information		= MOB_PRODUCE_Pyrokinesis_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Pyrokinesis, NAME_Rune, ManaPerm_RunePyrokinesis);
} else {
	description		= B_BuildRunemakerString(NAME_Pyrokinesis, NAME_Rune, ManaPerm_RunePyrokinesis);
}
};

func void MOB_PRODUCE_Pyrokinesis_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RunePyrokinesis,
	ConcatStrings(NAME_Pyrokinesis, NAME_RunePostfix),
	1,
	ItAr_BloodRuneBlank,
	1,
	ItAr_ScrollPyrokinesis);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RunePyrokinesis;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	DestroyUndead
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_DestroyUndead(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneDestroyUndead;
	information		= MOB_PRODUCE_DestroyUndead_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Destroyundead, NAME_Rune, ManaPerm_RuneDestroyUndead);
} else {
	description		= B_BuildRunemakerString(NAME_Destroyundead, NAME_Rune, ManaPerm_RuneDestroyUndead);
}
};

func void MOB_PRODUCE_DestroyUndead_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneDestroyUndead,
	ConcatStrings(NAME_Destroyundead, NAME_RunePostfix),
	1,
	ItAr_BloodRuneBlank,
	1,
	ItAr_ScrollDestroyUndead);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneDestroyUndead;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Chainlightning
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Chainlightning(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneChainlightning;
	information		= MOB_PRODUCE_Chainlightning_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Chainlightning, NAME_Rune, ManaPerm_RuneChainlightning);
} else {
	description		= B_BuildRunemakerString(NAME_Chainlightning, NAME_Rune, ManaPerm_RuneChainlightning);
}
};

func void MOB_PRODUCE_Chainlightning_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneChainLightning,
	ConcatStrings(NAME_Chainlightning, NAME_RunePostfix),
	1,
	ItAr_BloodRuneBlank,
	1,
	ItAr_ScrollChainLightning);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneChainlightning;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Stormfist
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Stormfist(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneStormfist;
	information		= MOB_PRODUCE_Stormfist_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Stormfist, NAME_Rune, ManaPerm_RuneStormfist);
} else {
	description		= B_BuildRunemakerString(NAME_Stormfist, NAME_Rune, ManaPerm_RuneStormfist);
}
};

func void MOB_PRODUCE_Stormfist_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneStormfist,
	ConcatStrings(NAME_Stormfist, NAME_RunePostfix),
	1,
	ItAr_BloodRuneBlank,
	1,
	ItAr_ScrollStormfist);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneStormfist;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Telekinesis
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Telekinesis(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneTelekinesis;
	information		= MOB_PRODUCE_Telekinesis_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Telekinesis, NAME_Rune, ManaPerm_RuneTelekinesis);
} else {
	description		= B_BuildRunemakerString(NAME_Telekinesis, NAME_Rune, ManaPerm_RuneTelekinesis);
}
};

func void MOB_PRODUCE_Telekinesis_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneTelekinesis,
	ConcatStrings(NAME_Telekinesis, NAME_RunePostfix),
	1,
	ItAr_BloodRuneBlank,
	1,
	ItAr_ScrollTelekinesis);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneTelekinesis;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Fireball
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Fireball(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneFireball;
	information		= MOB_PRODUCE_Fireball_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Fireball, NAME_Rune, ManaPerm_RuneFireball);
} else {
	description		= B_BuildRunemakerString(NAME_Fireball, NAME_Rune, ManaPerm_RuneFireball);
}
};

func void MOB_PRODUCE_Fireball_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneFireball,
	ConcatStrings(NAME_Fireball, NAME_RunePostfix),
	1,
	ItAr_BloodRuneBlank,
	1,
	ItAr_ScrollFireball);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneFireball;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	FireStorm
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_FireStorm(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneFireStorm;
	information		= MOB_PRODUCE_FireStorm_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_FireStorm, NAME_Rune, ManaPerm_RuneFireStorm);
} else {
	description		= B_BuildRunemakerString(NAME_FireStorm, NAME_Rune, ManaPerm_RuneFireStorm);
}
};

func void MOB_PRODUCE_FireStorm_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneFirestorm,
	ConcatStrings(NAME_FireStorm, NAME_RunePostfix),
	1,
	ItAr_BloodRuneBlank,
	1,
	ItAr_ScrollFirestorm);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneFireStorm;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Control
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Control(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneControl;
	information		= MOB_PRODUCE_Control_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Control, NAME_Rune, ManaPerm_RuneControl);
} else {
	description		= B_BuildRunemakerString(NAME_Control, NAME_Rune, ManaPerm_RuneControl);
}
};

func void MOB_PRODUCE_Control_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneControl,
	ConcatStrings(NAME_Control, NAME_RunePostfix),
	1,
	ItAr_BloodRuneBlank,
	1,
	ItAr_ScrollControl);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneControl;

	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	BreathOfDeath
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_BreathOfDeath(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneBreathOfDeath;
	information		= MOB_PRODUCE_BreathOfDeath_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_BreathOfDeath, NAME_Rune, ManaPerm_RuneBreathOfDeath);
} else {
	description		= B_BuildRunemakerString(NAME_BreathOfDeath, NAME_Rune, ManaPerm_RuneBreathOfDeath);
}
};

func void MOB_PRODUCE_BreathOfDeath_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneBreathOfDeath,
	ConcatStrings(NAME_BreathOfDeath, NAME_RunePostfix),
	1,
	ItAr_DarkRuneBlank,
	1,
	ItAr_ScrollBreathOfDeath);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneBreathOfDeath;
	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Icewave
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Icewave(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneIcewave;
	information		= MOB_PRODUCE_Icewave_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Icewave, NAME_Rune, ManaPerm_RuneIcewave);
} else {
	description		= B_BuildRunemakerString(NAME_Icewave, NAME_Rune, ManaPerm_RuneIcewave);
}
};

func void MOB_PRODUCE_Icewave_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneIceWave,
	ConcatStrings(NAME_Icewave, NAME_RunePostfix),
	1,
	ItAr_DarkRuneBlank,
	1,
	ItAr_ScrollIceWave);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneIcewave;
	MOB_RUNEMAKER_AutoExit();
};

///////////////////////////////////////////////////////////////////////////////////
//	Firerain
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Runemaker_Firerain(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Runemaker_CanProduceRuneFirerain;
	information		= MOB_PRODUCE_Firerain_RUNE;
	permanent		= TRUE;
#if comp_time {
	description		= B_BuildRunemakerString!(NAME_Firerain, NAME_Rune, ManaPerm_RuneFirerain);
} else {
	description		= B_BuildRunemakerString(NAME_Firerain, NAME_Rune, ManaPerm_RuneFirerain);
}
};

func void MOB_PRODUCE_Firerain_RUNE()
{
	B_ProduceItem2(1,
	ItAr_RuneFireRain,
	ConcatStrings(NAME_Firerain, NAME_RunePostfix),
	1,
	ItAr_DarkRuneBlank,
	1,
	ItAr_ScrollFireRain);

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - ManaPerm_RuneFirerain;

	MOB_RUNEMAKER_AutoExit();
};
