/*************************************************************************
** 																		**
** 		C_Functions.D													**
** 		============= 													**
** 																		**
** 		Enthält eine Reihe von Checks für die Master - AI				**
** 																		**
*************************************************************************/

//////////////////////////////////////////////////////////////////////////
//	C_AmIStronger
//	=============
//	Überfrüft, ob der NSC 'slf' stärker als der NSC 'oth' ist. Diese
//	Funktion ist genau das gegenteil von C_AmIWeaker().
//////////////////////////////////////////////////////////////////////////
func int C_AmIStronger(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_AmIStronger");

	if ((2 * slf.level) > oth.level)
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...yes");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...no");
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//	C_AmIWeaker
//	===========
//	Überfrüft, ob der NSC 'slf' schwächer als der NSC 'oth' ist. Diese
//	Funktion ist genau das gegenteil von C_AmIStronger().
//////////////////////////////////////////////////////////////////////////
func int C_AmIWeaker(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_AmIWeaker");

	if ((2 * slf.level) <= oth.level)
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...yes");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...no");
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//
//	C_NpcHasFullPower
//	=================
//	Überprüft ob die momentanen Hitpoints den maximalen entsprechen
//	und liefert true, wenn dem so ist
//////////////////////////////////////////////////////////////////////////
func int C_NpcHasFullPower(var C_Npc pow)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcHasFullPower");

	if (pow.attribute[ATR_HITPOINTS] == pow.attribute[ATR_HITPOINTS_MAX])
	{
		PrintDebugNpc(PD_ZS_DETAIL, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "FALSE");
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//
//	C_NpcHasFullMana
//	================
//	Überprüft ob die momentanen Manapoints den maximalen entsprechen
//	und liefert true, wenn dem so ist
//////////////////////////////////////////////////////////////////////////
func int C_NpcHasFullMana(var C_Npc man)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcHasFullMana");

	if (man.attribute[ATR_MANA] == man.attribute[ATR_MANA_MAX])
	{
		PrintDebugNpc(PD_ZS_DETAIL, "TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "FALSE");
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//	C_NpcIsInFightMode
//	==================
//	Überfrüft, ob der SC/NSC eine Waffe bzw. einen aggresiven Zauber
//	in der Hand hält. (Durchgangswachen interpretieren auch die sonst
//	neutralen Zauber CHARME und SLEEP als feindlich)
//////////////////////////////////////////////////////////////////////////
func int C_NpcIsInFightMode(var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_CHECK, "C_NpcIsInFightMode");
	if (Npc_IsInFightMode(oth, FMODE_FAR) || Npc_IsInFightMode(oth, FMODE_MELEE) || Npc_IsInFightMode(oth, FMODE_FIST))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...true");
		return TRUE;
	}
	else if (Npc_IsInFightMode(oth, FMODE_MAGIC))
	{
		if (Npc_GetActiveSpellCat(oth) == SPELL_BAD)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...true");
			return TRUE;
		}
		else if ((Npc_IsInState(self, ZS_GuardPassage) || Npc_WasInState(self, ZS_GuardPassage))
		&& ((Npc_GetActiveSpell(oth) == SPL_SLEEP) || (Npc_GetActiveSpell(oth) == SPL_CHARM)))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...true");
			return TRUE;
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "...false");
		return FALSE;
	};

	return FALSE;
};

/*
//////////////////////////////////////////////////////////////////////////
//	C_NpcIsInNeutralSpellMode
//	=========================
//	Überfrüft, ob der SC/NSC einen neutralen oder benevolenten Zauber
//	in der Hand hält.
//////////////////////////////////////////////////////////////////////////
func int C_NpcIsInNeutralSpellMode(var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_CHECK, "C_NpcIsInNeutralSpellMode");
	if (Npc_IsInFightMode(oth, FMODE_MAGIC) && (Npc_GetActiveSpellCat(oth) == SPELL_GOOD || Npc_GetActiveSpellCat(oth) == SPELL_NEUTRAL))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "...false");
		return FALSE;
	};
};
*/

//////////////////////////////////////////////////////////////////////////
//	C_NpcIs...
//	==========
//	Stellt fest, ob ein Nsc Mensch/Monster/Ork... ist
//////////////////////////////////////////////////////////////////////////
func int C_NpcIsDown(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsDown");

	if (Npc_IsInState(slf, ZS_Unconscious)
	|| Npc_IsInState(slf, ZS_MagicSleep)
	|| Npc_IsDead(slf))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...false");
		return FALSE;
	};
};

func int C_NpcIsHuman(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsHuman");
	PrintDebugString(PD_ZS_DETAIL, "...name: ", slf.name);

	if (slf.guild < GIL_SEPERATOR_HUM)
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...false");
		return FALSE;
	};
};

func int C_NpcIsMonster(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsMonster");
	PrintDebugString(PD_ZS_DETAIL, "...name: ", slf.name);

	if ((slf.guild > GIL_SEPERATOR_HUM) && (slf.guild < GIL_SEPERATOR_ORC))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...false");
		return FALSE;
	};
};

func int C_NpcIsDangerousMonster(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsDangerousMonster");

	if ((C_NpcIsMonster(oth))
	&& (Wld_GetGuildAttitude(oth.guild, slf.guild) == ATT_HOSTILE)
	&& (!oth.aivar[AIV_MM_PARTYMEMBER])
	&& !C_NpcIsDown(oth))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...true");
		return TRUE;
	};

	PrintDebugNpc(PD_ZS_DETAIL, "...false");
	return FALSE;
};

func int C_NpcIsOrc(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsOrc");

	if (slf.guild > GIL_SEPERATOR_ORC)
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...false");
		return FALSE;
	};
};

func int C_NpcIsMonsterMage(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsMonsterMage");

	if ((slf.fight_tactic == FAI_HUMAN_MAGE)
	&& ((slf.guild == GIL_DEMON) || 				// Skelett-Mage (hat aus SPECIES.D-technischen Gründen Dämonen-Gilde!)
		(slf.guild == GIL_ORCSHAMAN) || 			// Ork-Shamane
		(slf.guild == GIL_UNDEADORC) || 			// Untoter Ork-Priester
		(slf.guild == GIL_GOLEM))) 					// Eisgolem der einen "Ice-Cube"-Angriff hat
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...false");
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//	Npc_Get/Set...Attitude
//	======================
//	Funktionen, die direkt die Npc_...-Funktionen der Skriptsprache
//	aufrufen, um dem Begriffschaos zu entgehen.
//////////////////////////////////////////////////////////////////////////
func void Npc_SetPermAttitude(var C_Npc slf, var int att)
{
	PrintDebugNpc(PD_ZS_DETAIL, "Npc_SetPermAttitude()");
	Npc_SetAttitude(slf, att);
};

func int Npc_GetTempAttitude(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL, "Npc_GetTempAttitude()");
	return Npc_GetAttitude(slf, oth);
};

//////////////////////////////////////////////////////////////////////////
//	C_BodyStateContains
//	===================
//	Eine 'sichere' Abfrage auf Bodystates. Bitte NICHT die BuildIn
//	'Npc_GetBodyState' direkt benutzen, denn Vergleiche wie
//
//		if (Npc_GetBodyState(self) == BS_SIT)
//	werden false ergeben, wenn zusätzlich zu BS_SIT auch noch
//	BS_MOD_BURNING oder andere gesetzt sind (Charakter sitzt UND brennt)
//	Abfragen auf Bodystates müssen also so aussehen:
//		if (C_BodyStateContains(self, BS_SIT))
func int C_BodyStateContains(var C_Npc slf, var int bodystate)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_BodyStateContains()");

	//PrintDebugInt(PD_ZS_DETAIL, "bodystate: ", bodystate);
	//PrintDebugInt(PD_ZS_DETAIL, "bodystate&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS): ", bodystate & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS));
	//PrintDebugInt(PD_ZS_DETAIL, "Npc_GetBodyState(slf): ", Npc_GetBodyState(slf));
	//PrintDebugInt(PD_ZS_DETAIL, "Npc_GetBodyState(slf)&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS): ", Npc_GetBodyState(slf) & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS));

	//SN: Finger weg von dieser Formel!!! Ich weiß genau was ich tue!
	if ((Npc_GetBodyState(slf) & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS)) == (bodystate & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS))) 			// sowohl bei der Abfrage als auch beim Vergleichswert die höhren Bits ausmaskieren!
	{	// ...ja!

		PrintDebugNpc(PD_ZS_DETAIL, "...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...false");
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//	C_NpcTypeIsFriend
//	=================
//	Ermittelt, ob der NSC vom Typ FRIEND und 'other' der Spieler ist
//	Ist 'other' nicht der Spieler, so ist es auch unwichtig ob der
//	NSC einen NPCTYPE_FRIEND hat und es wird FALSE zurückgegeben.
//////////////////////////////////////////////////////////////////////////
func int C_NpcTypeIsFriend(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcTypeIsFriend()");

	if (Npc_IsPlayer(oth) && slf.npcType == NpcType_Friend)
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...false");
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//
//	C_NpcIsInvincible
//	=================
//	Überprüft ob der Nsc unsichtbar ist, ist z.B.wichtig für die
//	Abarbeitung des ZS_Talk und Verwandet Zustände
// 	Kriterium: --> Das Invincible flag ist gesetzt
//////////////////////////////////////////////////////////////////////////
func int C_NpcIsInvincible(var C_Npc kandidat)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsInvincible");

	if (kandidat.aivar[AIV_INVINCIBLE] == TRUE)
	{
		PrintDebugNpc(PD_ZS_DETAIL, "True");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "FALSE");
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//	C_NpcIsGuard
//	=============
//	Ermittelt, ob der NSC eine Wache ist. Kriterium:
//	->	NPCTYPE_GUARD -> TRUE
//	->	eine der typischen "Wach-Gilden" -> TRUE
//	->	ABER: wenn NSC eine Fernkampfwache ist -> FALSE!!!
//////////////////////////////////////////////////////////////////////////
func int C_NpcIsGuard(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsGuard");

	if ((slf.npcType == NpcType_Guard)
	//|| (slf.npcType == NpcType_OW_Guard)
	|| (slf.npcType == NpcType_Mine_Guard)
	|| (((slf.npcType == NpcType_Main) || (slf.npcType == NpcType_Friend)) && (slf.guild == GIL_MILITIA)))
	{
		if (slf.fight_tactic != FAI_HUMAN_RANGED)
		{
			PrintDebugNpc(PD_ZS_DETAIL, "...true!");
			return TRUE;
		};
	};

	PrintDebugNpc(PD_ZS_DETAIL, "...false!");
	return FALSE;
};

//////////////////////////////////////////////////////////////////////////
//	C_NpcIsGuardArcher
//	==================
//	Ermittelt, ob der NSC eine Wache ist, die nur im Fernkampf-Modus
//	kämpfen und dabei den eigenen Posten nicht verlassen soll
//////////////////////////////////////////////////////////////////////////
func int C_NpcIsGuardArcher(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsGuardArcher");

	if ((slf.npcType == NpcType_Guard)
	//|| (slf.npcType == NpcType_OW_Guard)
	|| (slf.npcType == NpcType_Mine_Guard)
	|| (((slf.npcType == NpcType_Main) || (slf.npcType == NpcType_Friend)) && (slf.guild == GIL_MILITIA)))
	{
		if (slf.fight_tactic == FAI_HUMAN_RANGED)
		{
			PrintDebugNpc(PD_ZS_DETAIL, "...true!");
			return TRUE;
		};
	};

	PrintDebugNpc(PD_ZS_DETAIL, "...false!");
	return FALSE;
};

//////////////////////////////////////////////////////////////////////////
//	C_NpcIsBoss
//	===========
//	Ermittelt, ob der NSC zu einer der BOSS-Gilden gehört:
//	- Erzbarone
//	- Feuermagier
//	- Wassermagier
//	- Gurus
//////////////////////////////////////////////////////////////////////////
func int C_NpcIsBoss(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsBoss");

	/*if ((slf.guild == GIL_EBR) ||
	(slf.guild == GIL_KDF) ||
	(slf.guild == GIL_KDW) ||
	(slf.guild == GIL_GUR))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...false");
		*/
		return FALSE;
		/*
	};
	*/
};

//////////////////////////////////////////////////////////////////////////
//	C_NpcIsWorker
//	=============
//	Ermittelt, ob der NSC zu einer der Arbeiter-Gilden gehört:
//	- Altes Lager: Buddler, Schatten
//	- Neues Lager: Schürfer, Bauern, Banditen
//	- Sektentempel: Novizen
//////////////////////////////////////////////////////////////////////////
func int C_NpcIsWorker(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsWorker");

	/*
	if ((slf.guild == GIL_VLK) ||
	(slf.guild == GIL_STT) ||
	(slf.guild == GIL_BAU) ||
	(slf.guild == GIL_SFB) ||
	(slf.guild == GIL_ORG) ||
	(slf.guild == GIL_NOV))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...false");
		*/
		return FALSE;
	//};
};

//////////////////////////////////////////////////////////////////////////
//	C_NpcIsMage
//	===========
//	Ermittelt, ob der NSC über Magie verfügt
//////////////////////////////////////////////////////////////////////////
func int C_NpcIsMage(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsMage");

	if (slf.attribute[ATR_MANA_MAX] > 0)
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...false");
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//	C_ChargeWasAttacked
//	===================
//	Ermittelt, ob ein Schützling der NSC-Wache attackiert wurde.
//////////////////////////////////////////////////////////////////////////
func int C_ChargeWasAttacked(var C_Npc guard, var C_Npc charge, var C_Npc attacker)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_ChargeWasAttacked");

	if (C_NpcIsGuard(guard)
	|| C_NpcIsGuardArcher(guard)
	|| (guard.npcType == NpcType_Guard)
	|| (guard.npcType == NpcType_Mine_Guard))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...NSC ist Wache oder FK-Wache!");

		if ((Npc_GetAttitude(guard, charge) == ATT_FRIENDLY)
		&& (Npc_GetAttitude(guard, attacker) != ATT_FRIENDLY))
		{
			PrintDebugNpc(PD_ZS_DETAIL, "...true");
			return TRUE;
		};
	};

	PrintDebugNpc(PD_ZS_DETAIL, "...false");
	return FALSE;
};

//////////////////////////////////////////////////////////////////////////
//	C_NpcHasSpell
//	=============
//	Überfrüft, ob der angegebene NSC den Zauberspruch 'spell'
//	im Inventory hat.
//////////////////////////////////////////////////////////////////////////
func int C_NpcHasSpell(var C_Npc slf, var int spell)
{
	return Npc_HasSpell(slf, spell);
};

//////////////////////////////////////////////////////////////////////////
//	C_NpcHasAmmo
//	============
//	Überfrüft, ob der angegebene NSC Munition der angegebenen Kategorie
//	im Inventory hat.
//	->	'category' kann sein : ItAm_Arrow oder ItAm_Bolt
//	->	return: Anzahl der gefundenen Geschosse (0, wenn keine gefunden)
//////////////////////////////////////////////////////////////////////////
func int C_NpcHasAmmo(var C_Npc slf, var int category)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcHasAmmo");

	var int count;

	//-------- Sicherheitsabfrage --------
	if (category != ItAm_Arrow && category != ItAm_Bolt)
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...ungültige Kategorie !!!");
		return 0;
	};

	//-------- die 6 Waffenslots durchsuchen --------
	//Slot 1
	count = Npc_GetInvItemBySlot(slf, INV_WEAPON, 1);
	if (Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL, "...gefundene Anzahl: ", count);
		if (Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL, "...Munitionstyp: ", item.name);
			return count;
		};
	};

	//Slot 2
	count = Npc_GetInvItemBySlot(slf, INV_WEAPON, 2);
	if (Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL, "...gefundene Anzahl: ", count);
		if (Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL, "...Munitionstyp: ", item.name);
			return count;
		};
	};

	//Slot 3
	count = Npc_GetInvItemBySlot(slf, INV_WEAPON, 3);
	if (Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL, "...gefundene Anzahl: ", count);
		if (Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL, "...Munitionstyp: ", item.name);
			return count;
		};
	};

	//Slot 4
	count = Npc_GetInvItemBySlot(slf, INV_WEAPON, 4);
	if (Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL, "...gefundene Anzahl: ", count);
		if (Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL, "...Munitionstyp: ", item.name);
			return count;
		};
	};

	//Slot 5
	count = Npc_GetInvItemBySlot(slf, INV_WEAPON, 5);
	if (Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL, "...gefundene Anzahl: ", count);
		if (Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL, "...Munitionstyp: ", item.name);
			return count;
		};
	};

	//Slot 6
	count = Npc_GetInvItemBySlot(slf, INV_WEAPON, 6);
	if (Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL, "...gefundene Anzahl: ", count);
		if (Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL, "...Munitionstyp: ", item.name);
			return count;
		};
	};

	return 0;	// Keine passende Munition gefunden!
};

//////////////////////////////////////////////////////////////////////////
//	C_NpcHasWeapon
//	==============
//	Überfrüft, ob der angegebene NSC eine Waffe der angegebenen Kategorie
//	im Inventory hat. Wird nach einer Fernkampfwaffe gefragt, so wird
//	nur "ja" zurückgegeben, wenn auch passende Munition vorhanden ist
//	- category kann sein : ITEM_KAT_NF oder ITEM_KAT_FF
//////////////////////////////////////////////////////////////////////////
func int C_NpcHasWeapon(var C_Npc slf, var int category)
{
	PrintDebugNpc(PD_ZS_FRAME, "C_NpcHasWeapon");

	//-------- Sicherheitsabfrage --------
	if (category != ITEM_KAT_NF && category != ITEM_KAT_FF)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...ungültige Kategorie !!!");
		return FALSE;
	};

	//-------- die 6 Waffenslots durchsuchen --------
	//Slot 1
	_ = Npc_GetInvItemBySlot(slf, INV_WEAPON, 1);
	if (Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Waffe in Slot 1 !!!");
		if (category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else
		{
			if (C_NpcHasAmmo(slf, item.munition))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				return TRUE;
			};
		};
	};

	//Slot 2
	_ = Npc_GetInvItemBySlot(slf, INV_WEAPON, 2);
	if (Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Waffe in Slot 2 !!!");
		if (category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else
		{
			if (C_NpcHasAmmo(slf, item.munition))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				return TRUE;
			};
		};
	};

	//Slot 3
	_ = Npc_GetInvItemBySlot(slf, INV_WEAPON, 3);
	if (Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Waffe in Slot 3 !!!");
		if (category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else
		{
			if (C_NpcHasAmmo(slf, item.munition))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				return TRUE;
			};
		};
	};

	//Slot 4
	_ = Npc_GetInvItemBySlot(slf, INV_WEAPON, 4);
	if (Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Waffe in Slot 4 !!!");
		if (category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else
		{
			if (C_NpcHasAmmo(slf, item.munition))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				return TRUE;
			};
		};
	};

	//Slot 5
	_ = Npc_GetInvItemBySlot(slf, INV_WEAPON, 5);
	if (Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Waffe in Slot 5 !!!");
		if (category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else
		{
			if (C_NpcHasAmmo(slf, item.munition))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				return TRUE;
			};
		};
	};

	//Slot 6
	_ = Npc_GetInvItemBySlot(slf, INV_WEAPON, 6);
	if (Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Waffe in Slot 6 !!!");
		if (category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else
		{
			if (C_NpcHasAmmo(slf, item.munition))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				return TRUE;
			};
		};
	};

	return FALSE; // Keine Waffe der Kategorie 'category' (oder nur eine Fernkampfwaffe ohne Munition) gefunden!
};

//////////////////////////////////////////////////////////////////////////
//	C_GetAttackReason
//	=================
//	Erfragt den Grund des Angriffs eines NSCs, damit später darauf
//	abgefragt werden kann.
//	Konstanten sind in AI_CONSTANTS.D zu finden
//////////////////////////////////////////////////////////////////////////
func int C_GetAttackReason(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_GetAttackReason");

	return slf.aivar[AIV_ATTACKREASON];
};

//////////////////////////////////////////////////////////////////////////
//	C_OtherIsToleratedEnemy
//	=======================
//	Stellt fest, ob der feindliche NSC aus irgendwelchen Gründen
//	zwar nicht angegriffen, wird.
//////////////////////////////////////////////////////////////////////////
func int C_OtherIsToleratedEnemy(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_OtherIsToleratedEnemy");

	//-------- Orkverfolger --------
	if (C_NpcIsOrc(slf))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...'self' ist Ork!");
	};

	PrintDebugNpc(PD_ZS_DETAIL, "...false!");
	return FALSE;
};

func void B_TolerateEnemy(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_TolerateEnemy");

	//-------- Orkverfolger --------
	if ((C_NpcIsOrc(slf))
	&& (Npc_GetDistToNpc(slf, oth) > HAI_DIST_ASSESSTOLERATEDENEMY))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...'self' ist Ork und nah genug dran!");

		var int npcInstance;
		npcInstance = Hlp_GetInstanceID(slf);

		//-------- Aufreger --------
		if ((npcInstance == OrcScout)
		|| (npcInstance == OrcWarrior1)
		|| (npcInstance == OrcWarrior2))
		{
			PrintDebugNpc(PD_ZS_DETAIL, "...'self' ist anderer Ork!");
			if (!Npc_IsInState(slf, ZS_Upset))
			{
				PrintDebugNpc(PD_ZS_DETAIL, "...'self' noch nicht in ZS_FollowPC");
				Npc_ClearAIQueue(slf);
				AI_StandUp(slf);
				AI_StartState(slf, ZS_Upset, 1, "");
			};
		}

		//-------- Verfolger --------
		else if (npcInstance == OrcWarrior3)
		{
			PrintDebugNpc(PD_ZS_DETAIL, "...'self' ist Ork Tempelkrieger!");
			if (!Npc_IsInState(slf, ZS_FollowPC))
			{
				PrintDebugNpc(PD_ZS_DETAIL, "...'self' noch nicht in ZS_FollowPC");
				Npc_ClearAIQueue(slf);
				AI_StandUp(slf);
				AI_StartState(slf, ZS_FollowPC, 1, "");
			};
		};
	};
};

////////////////////////////////////////////////////////////////////////////////
//
//	C_IsWantedItem
//	==============
//	Diese Funktion überprüft, ob ein gespeichertes item (self.aivar[wantedItem]
//	dem globalen Item entspricht, liefert TRUE zurück, wenn dem so ist
////////////////////////////////////////////////////////////////////////////////
func int C_IsWantedItem(var C_Npc owner, var C_Item it)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_IsWantedItem");

	if (owner.aivar[AIV_WANTEDITEM] == Hlp_GetInstanceID(it))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "TRUE");

		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "FALSE");
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////////////
//	C_NpcIsDead
//	===========
//	Überprüft, ob ein angegebener NSC tot ist.
//////////////////////////////////////////////////////////////////////////////////
func int C_NpcIsDead(var int npcInstance)
{
	PrintDebugNpc(PD_ZS_DETAIL, "C_NpcIsDead");

	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);

	return(Npc_IsDead(npc));
};
