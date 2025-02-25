/*************************************************************************
** 																		**
** 		B_Functions.D													**
** 		============= 													**
** 																		**
** 		Enthält kleinere, universell verwendbare Befehle für die		**
** 		Master - AI														**
** 																		**
*************************************************************************/

//////////////////////////////////////////////////////////////////////////
//	B_GotoWPNextToNpc
//	=================
//	slf wird auf den Wp geschickt, der dem oth am nächsten ist
//
//////////////////////////////////////////////////////////////////////////
func void B_GotoWPNextToNpc(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_GotoWPNextToNpc");

	var string waypoint;
	waypoint = Npc_GetNextWP(oth);
	AI_GotoWP(slf, waypoint);
};

// ------------------------------------------------------------------- //
// ---- Ruft AI_LookAtNpc auf wenn der slf nicht in AIV_ISLOOKING ---- //
// ------------------------------------------------------------------- //

//19.09.00 (SN): VORSICHT, ich habe die Abfrage auf AI-Variable herausgenommen, da das a) Probleme bereitete, und b) nach einem Bugfix auch nicht mehr nötig ist! -> getestet und funktioniert!!!
func void C_LookAtNpc(var C_Npc slf, var C_Npc oth)
{
	//if (!slf.aivar[AIV_ISLOOKING])
	//{
		AI_LookAtNpc(slf, oth);
		//PrintDebugNpc(PD_ZS_DETAIL, "C_LookAtNpc");					// ...dann, glotzen lassen...
		//slf.aivar[AIV_ISLOOKING] = 1;									// ...und merken, daß es glotzt
		//return 1;
	//};
	//return 0;
};

// ---------------------------------------------------------------- //
// ---- Stopt AI_LookAtNpc wenn der slf nicht in AIV_ISLOOKING ---- //
// ---------------------------------------------------------------- //

func void C_StopLookAt(var C_Npc slf)
{
	//if (slf.aivar[AIV_ISLOOKING]) 								// schaut das Monster überhaupt?
	//{																// ...ja!

		AI_StopLookAt(slf);
		//PrintDebugNpc(PD_ZS_DETAIL, "C_StopLookAt");				// ...dann aufhören lassen...
		//slf.aivar[AIV_ISLOOKING] = 0;								// ...und merken, daß es aufgehört hat!
		//return 1;
	//};
	//return 0;
};

//////////////////////////////////////////////////////////////////////////
//	B_SmartTurnToNpc
//	================
//	Der NSC versucht erst zum Ziel hinzusehen. Wenn ds Ziel nicht im
//	Blickwinkel liegt, dreht sich der NSC richtig zum Ziel.
//////////////////////////////////////////////////////////////////////////
func void B_SmartTurnToNpc(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_SmartTurnToNpc");

	if (!(C_BodyStateContains(slf, BS_SIT)
	|| C_BodyStateContains(slf, BS_ITEMINTERACT)
	|| C_BodyStateContains(slf, BS_MOBINTERACT)
	|| C_BodyStateContains(slf, BS_MOBINTERACT_INTERRUPT)))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...sitzt nicht und ist nicht am Mobsi");
		if (!Npc_CanSeeNpc(slf, oth))
		{
			PrintDebugNpc(PD_ZS_DETAIL, "...kann Ziel nicht sehen!");
			AI_TurnToNpc(slf, oth);
		}
		else
		{
			C_LookAtNpc(slf, oth);
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_Say
//	=====
//	Läßt den Nsc 'slf' einen SVM-Satz 'text' zum Nsc 'oth' sagen. Der
//	Sprecher sieht den Gesprächspartner dabei an, bzw. dreht sich, falls
//	er den Hals zu sehr verrenken müsste.
//////////////////////////////////////////////////////////////////////////
func void B_Say(var C_Npc slf, var C_Npc oth, var string text)
{
	var string pipe;

	pipe = ConcatStrings("B_Say: ", text);
	PrintDebugNpc(PD_ZS_FRAME, pipe);

	// JP : Hier muß der Hero abgefangen werden, da es sonst vorkommen kann, daß der Hero sich zu einem Nsc ausrichten will
	// das ist aber der Fall und der Nsc bleibt dann mit dem Rücken zum Spieler stehen (z.B. manchmal in ZS_Talk)
	if (B_CompareNpcInstance(slf, hero))
	{
		B_SmartTurnToNpc(oth, slf);
	}
	else
	{
		B_SmartTurnToNpc(slf, oth);
	};

	AI_OutputSVM(slf, oth, text);
};

//////////////////////////////////////////////////////////////////////////
//	B_SayOverlay
//	===========
//	Wie B_Say() benutzt allerdings AI_OutputSVMOverlay(), welches mit
//	der Ausführung der folgenden AI-Befehle NICHT wartet, bis der Satz
//	zu Ende gesprochen wurde.
//////////////////////////////////////////////////////////////////////////
func void B_SayOverlay(var C_Npc slf, var C_Npc oth, var string text)
{
	var string pipe;

	pipe = ConcatStrings("B_SayOverlay: ", text);
	PrintDebugNpc(PD_ZS_FRAME, pipe);

	B_SmartTurnToNpc(slf, oth);

	//SN: VORSICHT: Bug #3046, würgt das SVM-Sample beim Zustandswechsel ab. Soll in v1.01 behoben sein.
	AI_OutputSVM_Overlay(slf, oth, text);
};

//////////////////////////////////////////////////////////////////////////
//	B_StandUp
//	=========
//	Beendet alle möglichen Sitzstellungen.
//////////////////////////////////////////////////////////////////////////
func void B_StandUp(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_StandUp");

	//if C_BodyStateContains(slf, BS_SIT)
	//{
		if (slf.aivar[AIV_HangAroundStatus] == 1)
		{
			PrintDebugNpc(PD_ZS_DETAIL, "...Ground");
			AI_PlayAni(slf, "T_SIT_2_STAND");
			slf.aivar[AIV_HangAroundStatus] = 0;
		}
		else if (slf.aivar[AIV_HangAroundStatus] == 4)
		{
			PrintDebugNpc(PD_ZS_DETAIL, "Throne");
			_ = AI_UseMob(slf, "SMALL THRONE", -1);
			slf.aivar[AIV_HangAroundStatus] = 0;
		}
		else if (slf.aivar[AIV_HangAroundStatus] == 2)
		{
			PrintDebugNpc(PD_ZS_DETAIL, "Bench");
			_ = AI_UseMob(slf, SCEMENAME_BENCH, -1);
			slf.aivar[AIV_HangAroundStatus] = 0;
		}
		else if (slf.aivar[AIV_HangAroundStatus] == 3)
		{
			PrintDebugNpc(PD_ZS_DETAIL, "Chair");
			_ = AI_UseMob(slf, "CHAIR", -1);
			slf.aivar[AIV_HangAroundStatus] = 0;
		};
	//};
};

//////////////////////////////////////////////////////////////////////////
//	B_CallComrades
//	==============
//	Ruft die in der Nähe befindlichen Kameraden heran.
//////////////////////////////////////////////////////////////////////////
func void B_CallComrades()
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_CallComrades");

	B_SayOverlay(self, NULL, "$COMRADESHELP");
	Npc_SendPassivePerc(self, PERC_ASSESSWARN, self, other);
};

//////////////////////////////////////////////////////////////////////////
//	B_CallGuards
//	============
//	Ruft die in der Nähe befindlichen Wachen heran.
//////////////////////////////////////////////////////////////////////////
func void B_CallGuards()
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_CallGuards");

	B_SayOverlay(self, NULL, "$HELP");
	Npc_SendPassivePerc(self, PERC_ASSESSWARN, self, other);
};

//////////////////////////////////////////////////////////////////////////
//	B_IntruderAlert
//	===============
//	Warnt vor Eindringling und ruft die in der Nähe befindlichen
//	Kameraden heran.
//////////////////////////////////////////////////////////////////////////
func void B_IntruderAlert(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_IntruderAlert");

	B_SayOverlay(slf, NULL, "$IntruderAlert");
	Npc_SendPassivePerc(slf, PERC_ASSESSWARN, slf, oth);
};

//////////////////////////////////////////////////////////////////////////
//	B_FullStop
//	==========
//	Unterbricht jegliche Animation des NSCs. Hier wurde früher AI_Standup()
//	verwendet. Dieser Befehl ist in einigen Situationen jedoch zu träge
//	und wurde durch AI_StandUpQuick() ersetzt
//////////////////////////////////////////////////////////////////////////
func void B_FullStop(var C_Npc npc)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_FullStop");

	// SN: Test
	//RemoveItemFromSlot(npc, "ZS_LEFTHAND");
	//RemoveItemFromSlot(npc, "ZS_RIGHTHAND");
	// SN: wieder deaktiviert, da auch gezogene Waffen entfernt werden -> Crash

	Npc_ClearAIQueue(npc);
	// JP: Bevor der BUgfix gemacht is,daß AI_StandUp Mobsis vernünftig zurück spult hilft das nicht, ist aber im Hinblick auf den Bugfix schon mal angelegt
	if ((Wld_GetInteractMobState(self, SCEMENAME_BENCH) == 1)
	|| (Wld_GetInteractMobState(self, SCEMENAME_BED) == 1)
	|| (Wld_GetInteractMobState(self, SCEMENAME_BEDLOW) == 1)
	|| (Wld_GetInteractMobState(self, SCEMENAME_BEDHIGH) == 1))
	{
		AI_StandUp(npc);
	}
	else
	{
		AI_StandUpQuick(npc);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_ResetTempAttitude
//	===================
//	Setzt den Wert der Temporären Attitüde auf den der Permanenten!
//	Symbolisiert die Beruhigung des NSCs.
//
//	Voraussetzungen:
//	- 'slf' muß ein NSC sein
//////////////////////////////////////////////////////////////////////////
func void B_ResetTempAttitude(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_ResetTempAttitude");

	Npc_SetTempAttitude(slf, Npc_GetPermAttitude(slf, hero));
};

//////////////////////////////////////////////////////////////////////////
//	B_WhirlAround
//	=============
//	Wirbelt nur herum, wenn der NSC 'slf' das Ziel 'oth' nicht sehen kann.
//	Wenn er das Ziel sehen kann, wird nur ein einfacher AI_TurnTo ausgeführt.
//////////////////////////////////////////////////////////////////////////
func void B_WhirlAround(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_WhirlAround");

	if (Npc_CanSeeNpc(slf, oth))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...KANN Ziel sehen!");
		AI_TurnToNpc(slf, oth);
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...kann Ziel NICHT sehen!");
		AI_WhirlAround(slf, oth);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_DropWeapon
//	=============
//	Läßt die derzeit gezogene Waffe fallen. Wenn keine gezogen ist,
//	passiert nichts.
//////////////////////////////////////////////////////////////////////////
func void B_DropWeapon(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_DropWeapon");

	var C_Item itm;
	var int itemid;

	itm = Npc_GetReadiedWeapon(slf);
	if (Hlp_IsValidItem(itm))
	{
		itemid = Hlp_GetInstanceID(itm);
		PrintDebugNpc(PD_ZS_DETAIL, itm.name);
		AI_DropItem(slf, itemid);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_RegainDroppedWeapon
//	=====================
//	Guckt sich um und sammelt die Waffe, die am nächsten liegt wieder auf.
//	VORSICHT: Löscht die globale Variable 'item' !
//////////////////////////////////////////////////////////////////////////
func void B_RegainDroppedWeapon(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_RegainDroppedWeapon");

	//-------- fallgelassene Waffe aufheben... --------
	Npc_PerceiveAll(slf);
	if (Wld_DetectItem(slf, ITEM_KAT_NF) || Wld_DetectItem(slf, ITEM_KAT_FF))
	{
		PrintDebugString(PD_ZS_CHECK, "...Waffe entdeckt : ", item.name);
		if (!Npc_IsPlayer(slf)
		//&& Npc_CanSeeItemFreeLOS(slf, item)
		&& (Npc_GetDistToItem(slf, item) < HAI_DIST_REGAINDROPPEDWEAPON))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...NSC hebt seine Waffen wieder auf!");
			AI_TakeItem(slf, item);
			_ = AI_EquipBestMeleeWeapon(slf);
			_ = AI_EquipBestRangedWeapon(slf);
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_RegainDroppedArmor
//	=====================
//	Guckt sich um und sammelt die Rüstung, die am nächsten liegt wieder auf.
//	VORSICHT: Löscht die globale Variable 'item' !
//////////////////////////////////////////////////////////////////////////
func void B_RegainDroppedArmor(var C_Npc slf)
{
	//-------- fallgelassene Waffe aufheben... --------
	Npc_PerceiveAll(slf);
	if (Wld_DetectItem(slf, ITEM_KAT_ARMOR))
	{
		if (!Npc_IsPlayer(slf))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...NSC hebt seine Rüstung wieder auf!");
			AI_TakeItem(slf, item);
			AI_EquipBestArmor(slf);
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_GotoFP
//	========
//	Geht zum nächsten freien Freepoint. Checkt, ob der NSC nicht schon
//	dort steht!
//////////////////////////////////////////////////////////////////////////
func void B_GotoFP(var C_Npc slf, var string fp)
{
	PrintDebugNpc(PD_TA_LOOP, "B_GotoFP");

	if (!(Npc_IsOnFP(slf, fp)))
	{
		PrintDebugString(PD_TA_CHECK, "...nicht auf passendem Freepoint ", fp);

		if (Wld_IsFPAvailable(slf, fp))
		{
			PrintDebugString(PD_TA_CHECK, "Gehe zu Freepoint ", fp);
			AI_SetWalkMode(slf, NPC_WALK);
			AI_GotoFP(slf, fp);
			AI_AlignToFP(slf);
		}
		else
		{
			AI_SetWalkMode(slf, NPC_WALK);
			AI_GotoWP(slf, slf.wp);
			AI_GotoFP(slf, fp);
			AI_AlignToFP(slf);
		};
	}
	else
	{
		AI_AlignToFP(slf);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_RuntoFP
//	=========
//	Rennt zum nächsten freien Freepoint. Checkt, ob der NSC nicht schon
//	dort steht!
//////////////////////////////////////////////////////////////////////////
func void B_RuntoFP(var C_Npc slf, var string fp)
{
	PrintDebugNpc(PD_TA_LOOP, "B_RuntoFP");

	if (!Npc_IsOnFP(slf, fp))
	{
		PrintDebugString(PD_TA_CHECK, "...nicht auf passendem Freepoint: ", fp);

		if (Wld_IsNextFPAvailable(slf, fp))
		{
			PrintDebugString(PD_TA_CHECK, "Gehe zu Freepoint: ", fp);
			AI_SetWalkMode(slf, NPC_RUN);
			AI_GotoNextFP(slf, fp);
			AI_AlignToFP(slf);
		}
		else
		{
			AI_SetWalkMode(slf, NPC_RUN);
			AI_GotoWP(slf, slf.wp);
			AI_GotoNextFP(slf, fp);
			AI_AlignToFP(slf);
		};
	}
	else
	{
		AI_AlignToFP(slf);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_GotoNearWP
//	============
//	Geht zum angegebenen Waypoint. Checkt, ob der NSC nicht schon
//	in der Nähe steht!
//////////////////////////////////////////////////////////////////////////
func void B_GotoNearWP(var C_Npc slf, var string wp)
{
	PrintDebugNpc(PD_TA_LOOP, "B_GotoNearWP");

	if (Npc_GetDistToWP(slf, wp) > 400)
	{
		PrintDebugString(PD_TA_CHECK, "...zu weit weg von Waypoint: ", wp);

		AI_SetWalkMode(slf, NPC_WALK);
		AI_GotoWP(slf, wp);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_RuntoNearWP
//	=============
//	Rennt zum angegebenen Waypoint. Checkt, ob der NSC nicht schon
//	in der Nähe steht!
//////////////////////////////////////////////////////////////////////////
func void B_RuntoNearWP(var C_Npc slf, var string wp)
{
	PrintDebugNpc(PD_TA_LOOP, "B_RuntoNearWP");

	if (Npc_GetDistToWP(slf, wp) > 400)
	{
		PrintDebugString(PD_TA_CHECK, "...zu weit weg von Waypoint: ", wp);

		AI_SetWalkMode(slf, NPC_RUN);
		AI_GotoWP(slf, wp);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_StopGotoHero
//	==============
//	Diese Funktion kann benutzt werden um durch ein PERC_MOVENPC ein
//	AI_GotoNpc(self, hero) vorzeitig abzubrechen, bevor der NSC in den SC
//	hineinläuft !
//	- benutzt 'self' und 'hero'
//////////////////////////////////////////////////////////////////////////
func void B_StopGotoHero()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_StopGotoHero");

	if (Npc_IsPlayer(other))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...Kollision mit Spieler!");
		Npc_PercDisable(self, PERC_MOVENPC);
		B_FullStop(self);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_SetAttackReason
//	=================
//	Setzt den Grund des Angriffs eines NSCs, damit später darauf
//	abgefragt werden kann.
//	Konstanten sind in AI_CONSTANTS.D zu finden
//////////////////////////////////////////////////////////////////////////
func void B_SetAttackReason(var C_Npc slf, var int reason)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_SetAttackReason");

	slf.aivar[AIV_ATTACKREASON] = reason;
};

//////////////////////////////////////////////////////////////////////////
//	B_KillNpc
//	=========
//	Setzt die Lebenspunkte des angegebenen NSCs auf 0.
//////////////////////////////////////////////////////////////////////////
func void B_KillNpc(var int npcInstance)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_KillNpc");

	var C_Npc npc; npc = Hlp_GetNpc(npcInstance);
	var int itemInstance;

	npc.flags = 0;

	//CreateInvItem(npc, ItMi_Stuff_OldCoin_02);		// Mission-Item, das verhindert, daß die Toten entfernt werden

	Npc_ChangeAttribute(npc, ATR_HITPOINTS, -npc.attribute[ATR_HITPOINTS_MAX]);

	if (Npc_GetInvItemBySlot(npc, INV_WEAPON, 1))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...Waffe in Slot 1 gefunden!");
		itemInstance = Hlp_GetInstanceID(item);
		_ = Npc_RemoveInvItem(npc, itemInstance);
	};

	if (Npc_GetInvItemBySlot(npc, INV_WEAPON, 2))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...Waffe in Slot 2 gefunden!");
		itemInstance = Hlp_GetInstanceID(item);
		_ = Npc_RemoveInvItem(npc, itemInstance);
	};
};

// Visualisierung: Schriftstück lesen -> 'self' zieht ein Stück Pergament aus der Tasche und wirft einen Blick drauf
func void B_UseFakeScroll()
{
	if (C_BodystateContains(self, BS_SIT))
	{
		AI_StandUp(self);
		AI_TurnToNpc(self, hero);
	};

	CreateInvItem(self, Fakescroll);
	AI_UseItemToState(self, Fakescroll, 1);
	AI_Wait(self, 3);
	AI_UseItemToState(self, Fakescroll, -1);
};

func void B_UseFakeBook(var C_Npc user)
{
	if (C_BodystateContains(user, BS_SIT))
	{
		AI_StandUp(user);
		AI_TurnToNpc(user, hero);
	};

	CreateInvItem(user, FakeBook);
	AI_UseItemToState(user, FakeBook, 1);
	AI_Wait(user, 3);
	AI_UseItemToState(user, FakeBook, -1);
};

//////////////////////////////////////////////////////////////////////////
//	B_ChangeGuild
//	=============
//	Ändert die Gilde des angegebenen NSCs
//////////////////////////////////////////////////////////////////////////
func void B_ChangeGuild(var int npcInstance, var int newGuild)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_ChangeGuild");

	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);

	_ = Npc_SetTrueGuild(npc, newGuild);
	npc.guild = newGuild;
};

//////////////////////////////////////////////////////////////////////////
//	B_ExchangeRoutine
//	=================
//	Ändert den Tagesablauf des angegebenen NSCs
//
//	VORSICHT:	Auf KEINEN Fall für 'self' innerhalb eines Dialoges
//				benutzen, da AI_ContinueRoutine() den Dialog freezed!!!
//////////////////////////////////////////////////////////////////////////
func void B_ExchangeRoutine(var int npcInstance, var string newRoutine)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_ExchangeRoutine");

	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);

	var int selfInstance;
	selfInstance = Hlp_GetInstanceID(self);

	Npc_ExchangeRoutine(npc, newRoutine);

	//-------- Tagesablauf nur fortsetzen, wenn NICHT 'self' --------
	if ((npcInstance != selfInstance)
	&& !C_NPCisinvincible(npc))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...NICHT für 'self' ausgeführt!");
		AI_ContinueRoutine(npc);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_NpcIsNear
//	===========
//	Fragt ab, ob sich der Npc 'npcInstance' in der Nähe von 'slf' befindet
//////////////////////////////////////////////////////////////////////////
func int B_NpcIsNear(var C_Npc slf, var int npcInstance)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_NpcIsNear");

	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);

	if (Npc_GetDistToNpc(slf, npc) <= HAI_DIST_NPCISNEAR)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_LogEntry
//	==========
//	Kapselt die Funktion Log_AddEntry und gibt eine Bildschirmmeldung
//	aus.
//////////////////////////////////////////////////////////////////////////
func void B_LogEntry(var string topic, var string entry)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_LogEntry");

	Log_AddEntry(topic, entry);

	AI_Snd_Play(self, "LogEntry");
	_ = AI_PrintScreen(self, NAME_NewLogEntry, -1, _YPOS_MESSAGE_LOGENTRY, FONT_OLD_SMALL, _TIME_MESSAGE_LOGENTRY, TEXT_COLOR_WHITE);
};

//////////////////////////////////////////////////////////////////////////
//	B_SetImmortal
//	=============
//	Setzt das Immortal-Flag eines NPCs
//////////////////////////////////////////////////////////////////////////
func void B_SetImmortal(var int npcInstance)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_SetImmortal");

	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);

	npc.flags = npc.flags | NPC_FLAG_IMMORTAL;
};

//////////////////////////////////////////////////////////////////////////
//	B_ClearImmortal
//	===============
//	Löscht das Immortal-Flag eines NPCs
//////////////////////////////////////////////////////////////////////////
func void B_ClearImmortal(var int npcInstance)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_ClearImmortal");

	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);

	npc.flags = npc.flags - NPC_FLAG_IMMORTAL;
};

//////////////////////////////////////////////////////////////////////////
//	B_SetNpcType
//	============
//	Setzt den NpcTyp auf den angegebenen Wert
//////////////////////////////////////////////////////////////////////////
func void B_SetNpcType(var int npcInstance, var int newNpctype)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_SetNpcType");

	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);

	npc.npcType = newNpctype;
};

//////////////////////////////////////////////////////////////////////////
//	B_GiveInvItems
//	==============
//	Übergibt ein Item von 'giver' an 'taker' und gibt eine Meldung
//	auf dem Bildschirm aus.
//	Für 'giver' oder 'taker' kann auch NULL übergeben werden,
//	falls der Spieler einfach nur ein Item erhalten oder verlieren soll
//////////////////////////////////////////////////////////////////////////
func void B_GiveInvItems(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_GiveInvItems");

	//-------- Gegenstand übertragen --------
	if (Hlp_IsValidNpc(giver))
	{
		//JP: Weil Npc_RemoveItems nur klappt, wenn der Character _mindestens_: Anzahl remove Items hat
		// Wir hier für die Nsc´s so verfahren, daß geguckt wird, ob sie die Menge die gewünscht ist
		// haben, wenn nicht wird der Wert der übergeben werden soll mit dem Wert der übergeben
		// werden kann getauscht, damit wenigstens die gelöscht werden. Für den Spieler
		// ist das ohne unerwünschte Nebeneffekte so nicht möglich, so daß die Story dafür Sorge
		// tragen muß, das wenn der Spieler in diese Funktion kommt auch wirklich genug Übergabeitems hat

		if (Npc_IsPlayer(giver))
		{
			_ = Npc_RemoveInvItems(giver, itemInstance, amount);
		}
		else
		{
			var int int_ItemcountNsc;
			int_ItemcountNsc = Npc_HasItems(giver, itemInstance);

			if (Hlp_GetInstanceID(ItMi_Silver) == itemInstance)
			{
				PrintDebugNpc(PD_ZS_CHECK, "Silber");
			};

			_ = Npc_RemoveInvItems(giver, itemInstance, int_ItemcountNsc);
		};

		/*
		AI_CreateItemInSlot(giver, "ZS_RIGHTHAND", itemInstance);
		AI_PlayAni(giver, "C_STAND_2_IGET_2"); //hinstrecken
		AI_RemoveItemFromSlot(giver, "ZS_RIGHTHAND");
		AI_PlayAni(giver, "C_IGET_2_STAND_2"); //wegnehmen
		*/
	};

	if (Hlp_IsValidNpc(taker))
	{
		CreateInvItems(taker, itemInstance, amount);
		/*
		AI_PlayAni(giver, "C_STAND_2_IGET_2");
		AI_CreateItemInSlot(taker, "ZS_RIGHTHAND", itemInstance);
		AI_PlayAni(giver, "C_IGET_2_STAND_2"); //wegnehmen
		AI_RemoveItemFromSlot(taker, "ZS_RIGHTHAND"); KLÄGLICH GESCHEITERTER VERSUCH
		*/
	};

	//-------- Meldung ausgeben --------
	var string msg;

	if (Npc_IsPlayer(giver))
	{
		if (itemInstance == ItMi_Silver)
		{
			msg = ConcatStrings(IntToString(amount), _STR_MESSAGE_SILVER_GIVEN);
			_ = AI_PrintScreen(giver, msg, -1, _YPOS_MESSAGE_GIVEN, FONT_OLD_SMALL, _TIME_MESSAGE_GIVEN, TEXT_COLOR_WHITE);
		}
		else
		{
			if (amount == 1)
			{
				msg = ConcatStrings(IntToString(amount), _STR_MESSAGE_ITEM_GIVEN);
				_ = AI_PrintScreen(giver, msg, -1, _YPOS_MESSAGE_GIVEN, FONT_OLD_SMALL, _TIME_MESSAGE_GIVEN, TEXT_COLOR_WHITE);
			}
			else
			{
				msg = ConcatStrings(IntToString(amount), _STR_MESSAGE_ITEMS_GIVEN);
				_ = AI_PrintScreen(giver, msg, -1, _YPOS_MESSAGE_GIVEN, FONT_OLD_SMALL, _TIME_MESSAGE_GIVEN, TEXT_COLOR_WHITE);
			};
		};
	}
	else if (Npc_IsPlayer(taker))
	{
		if (itemInstance == ItMi_Silver)
		{
			msg = ConcatStrings(IntToString(amount), _STR_MESSAGE_SILVER_TAKEN);
			_ = AI_PrintScreen(giver, msg, -1, _YPOS_MESSAGE_TAKEN, FONT_OLD_SMALL, _TIME_MESSAGE_TAKEN, TEXT_COLOR_WHITE);
		}
		else
		{
			if (amount == 1)
			{
				msg = ConcatStrings(IntToString(amount), _STR_MESSAGE_ITEM_TAKEN);
				_ = AI_PrintScreen(giver, msg, -1, _YPOS_MESSAGE_TAKEN, FONT_OLD_SMALL, _TIME_MESSAGE_TAKEN, TEXT_COLOR_WHITE);
			}
			else
			{
				msg = ConcatStrings(IntToString(amount), _STR_MESSAGE_ITEMS_TAKEN);
				_ = AI_PrintScreen(giver, msg, -1, _YPOS_MESSAGE_TAKEN, FONT_OLD_SMALL, _TIME_MESSAGE_TAKEN, TEXT_COLOR_WHITE);
			};
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_PlunderInvItems
//	=================
//	Spezialfunktion für den Fall, daß Items dem am Boden liegenden Nsc
//	geklaut werden, da hier die Ausgabestrings etwas anders aussehen müssen
//////////////////////////////////////////////////////////////////////////
func void B_PunderInvItems(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount)
// Spieler.name hat [amonunt] genommen
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_PlunderInvItems");

	//-------- Gegenstand übertragen --------
	if (Hlp_IsValidNpc(giver))
	{
		_ = Npc_RemoveInvItems(giver, itemInstance, amount);
	};

	if (Hlp_IsValidNpc(taker))
	{
		CreateInvItems(taker, itemInstance, amount);
	};

	//-------- Meldung ausgeben --------
	var string msg;

	if (Npc_IsPlayer(giver))
	{
		if (itemInstance == ItMi_Silver)
		{
			msg = taker.name;
			msg = ConcatStrings(msg, _STR_MESSAGE_PLUNDERED_MIDFIX);
			msg = ConcatStrings(msg, IntToString(amount));
			msg = ConcatStrings(msg, _STR_MESSAGE_SILVER_PLUNDERED);
			_ = AI_PrintScreen(taker, msg, -1, _YPOS_MESSAGE_GIVEN, FONT_OLD_SMALL, _TIME_MESSAGE_GIVEN, TEXT_COLOR_WHITE);
		}
		else
		{
			if (amount == 1)
			{
				msg = taker.name;
				msg = ConcatStrings(msg, _STR_MESSAGE_PLUNDERED_MIDFIX);
				msg = ConcatStrings(msg, IntToString(amount));
				msg = ConcatStrings(msg, _STR_MESSAGE_ITEM_PLUNDERED);
				_ = AI_PrintScreen(taker, msg, -1, (_YPOS_MESSAGE_GIVEN - 10), FONT_OLD_SMALL, _TIME_MESSAGE_GIVEN, TEXT_COLOR_WHITE);
			}
			else
			{
				msg = taker.name;
				msg = ConcatStrings(msg, _STR_MESSAGE_PLUNDERED_MIDFIX);
				msg = ConcatStrings(msg, IntToString(amount));
				msg = ConcatStrings(msg, _STR_MESSAGE_ITEMS_PLUNDERED);
				_ = AI_PrintScreen(taker, msg, -1, (_YPOS_MESSAGE_GIVEN - 20), FONT_OLD_SMALL, _TIME_MESSAGE_GIVEN, TEXT_COLOR_WHITE);
			};
		};
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_CheckForImportantInfo
//	=======================
//	Startet eine Important-Info wenn:
//	- der NSC eine solche Info parat hat
//	- der SC in keinem unpäßlichen Bodystate ist
//	- der SC gerade ein Mensch ist
//	- der SC nicht gerade spricht
//////////////////////////////////////////////////////////////////////////
func int B_CheckForImportantInfo(var C_Npc slf, var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_FRAME, "B_CheckForImportantInfo");

	//-------- Auf Vergabe von Infos & Missionen checken --------
	if ((oth.aivar[AIV_INVINCIBLE] == FALSE)
	&& C_NpcIsHuman(oth)) 	//SC könnte verwandelt sein
	{
		PrintDebugNpc(PD_ZS_CHECK, "...SC spricht nicht!");

		//----------- SC ist ein HumanControlled-Npc ---------------
		var C_Npc her; her = Hlp_GetNpc(PC_Hero);

		if (Hlp_GetInstanceID(her) != Hlp_GetInstanceID(hero))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC steckt im Körper eines anderen!");
			return FALSE;
		};

		if (Npc_CheckInfo(slf, 1))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...wichtige Info zu vergeben!");
			//if (!C_BodyStateContains(oth, BS_JUMP))
			//|| Npc_IsInState(slf, ZS_GuardPassage)
			//|| Npc_WasInState(slf, ZS_GuardPassage)
			//{
				PrintDebugNpc(PD_ZS_CHECK, "...SC springt nicht oder NSC ist Durchgangswache!");
				if (!C_BodyStateContains(oth, BS_FALL))
				{
					PrintDebugNpc(PD_ZS_CHECK, "...fällt nicht!");
					if (!C_BodyStateContains(oth, BS_SWIM))
					{
						PrintDebugNpc(PD_ZS_CHECK, "...schwimmt nicht!");
						if (!C_BodyStateContains(oth, BS_DIVE))
						{
							PrintDebugNpc(PD_ZS_CHECK, "...taucht nicht!");
							hero.aivar[AIV_IMPORTANT] = TRUE; // Dialog KOMMT aufgrund einer Important-Info zustande
							B_FullStop(oth);

							if ((C_BodystateContains(slf, BS_SIT)) || (!Npc_CanSeeNpc(slf, oth)))
							{
								Npc_ClearAIQueue(slf);
								AI_StandUp(slf);
							}
							else
							{
								//B_FullStop(slf);
							};

							AI_StartState(slf, ZS_Talk, 1, "");
							Npc_PercDisable(slf, PERC_ASSESSFIGHTER);
							return TRUE;
						};
					};
				};
			//};
		};
	};

	return FALSE;
};

//////////////////////////////////////////////////////////////////////////
//	B_SetAttitude
//	=============
//	Setzt sowohl temporäre, als auch permanente Attitüde des NSCs 'slf'
//	gegenüber dem Spieler auf Attitüde 'att'
// 	JP: Hier wird jetzt auch noch eine Textausgabe gestartet, die angibt
//	Wessen (Npc.Name) Attitüde sich wohin ändert
//////////////////////////////////////////////////////////////////////////
func void B_SetAttitude(var C_Npc slf, var int att)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_SetAttitude");

	Npc_SetTempAttitude(slf, att);
	Npc_SetPermAttitude(slf, att);

	var string string_ScreenText;

	if (att == ATT_FRIENDLY)
	{
		string_ScreenText = slf.name;
		string_ScreenText = ConcatStrings(string_ScreenText, PRINT_ATTITUDE_Friendly);
		_ = PrintScreenColored(string_ScreenText, -1, _YPOS_MESSAGE_GIVEN + 2, FONT_OLD_SMALL, _TIME_MESSAGE_CHANGEATTITUDE, TEXT_COLOR_GREEN);
	};

	if (att == ATT_NEUTRAL)
	{
		string_ScreenText = slf.name;
		string_ScreenText = ConcatStrings(string_ScreenText, PRINT_ATTITUDE_Neutral);
		_ = PrintScreenColored(string_ScreenText, -1, _YPOS_MESSAGE_GIVEN + 2, FONT_OLD_SMALL, _TIME_MESSAGE_CHANGEATTITUDE, TEXT_COLOR_WHITE);
	};

	if (att == ATT_ANGRY)
	{
		string_ScreenText = slf.name;
		string_ScreenText = ConcatStrings(string_ScreenText, PRINT_ATTITUDE_Angry);
		_ = PrintScreenColored(string_ScreenText, -1, _YPOS_MESSAGE_GIVEN + 2, FONT_OLD_SMALL, _TIME_MESSAGE_CHANGEATTITUDE, TEXT_COLOR_YELLOW);
	};

	if (att == ATT_HOSTILE)
	{
		string_ScreenText = slf.name;
		string_ScreenText = ConcatStrings(string_ScreenText, PRINT_ATTITUDE_Hostile);
		_ = PrintScreenColored(string_ScreenText, -1, _YPOS_MESSAGE_GIVEN + 2, FONT_OLD_SMALL, _TIME_MESSAGE_CHANGEATTITUDE, TEXT_COLOR_RED);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_InitGuildAttitudes
//	====================
//	Setzt bzw. resettet die Attitüde unter den Menschengilden
//	und berücksichtigt dabei den Storyverlauf
//////////////////////////////////////////////////////////////////////////
func void B_InitGuildAttitudes()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_InitGuildAttitudes");

	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES");
};

//////////////////////////////////////////////////////////////////////////
//	B_PracticeCombat
//	================
//	Spielt eine Lernanimation am angegebenen Waypoint ab.
//	'hero': der lernende Spielercharakter
//	'self': der lehrende NSC
//////////////////////////////////////////////////////////////////////////
func void B_PracticeCombat(var string waypoint)
{
	PrintDebugNpc(PD_ZS_FRAME, "B_PracticeCombat");

	//SN: Manchmal ist die Kamera stur auf den Lehrer gerichtet und verliert den SC aus dem Bild -> sehr verwirrend, daher erst mal raus!
	/*
	if (Npc_GetDistToWP(self, waypoint) < 1000)
	{
		AI_SetWalkMode(hero, NPC_WALK);
		AI_GotoWP(hero, waypoint);
		AI_TurnToNpc(self, hero);
		_ = AI_EquipBestMeleeWeapon(hero);
		AI_DrawWeapon(hero);
		AI_PlayAni(hero, "T_1HSFREE");
		AI_RemoveWeapon(hero);
		AI_SetWalkMode(hero, NPC_WALK);
		AI_GotoNpc(hero, self);
		AI_TurnToNpc(self, hero);
	};
	*/
};

//////////////////////////////////////////////////////////////////////////
//	B_PrintLevelTooLow
//	=====================
//	Gibt eine Bildschirmmeldung mit der Mindeststufe aus.
//////////////////////////////////////////////////////////////////////////
func void B_PrintLevelTooLow(var int level)
{
	PrintDebugNpc(PD_ZS_FRAME, "B_PrintLevelTooLow");

	var string msg;

	msg = ConcatStrings(_STR_MESSAGE_LEVELTOOLOW, IntToString(level));

	_ = AI_PrintScreen(self, msg, -1, _YPOS_MESSAGE_LEVELTOOLOW, FONT_OLD_BIG, _TIME_MESSAGE_LEVELTOOLOW, TEXT_COLOR_WHITE);
};

//////////////////////////////////////////////////////////////////////////////////
//
//	B_PointAndShout
//	===============
//	Die Funktion richtet den Nsc aus zeigt auf einen Charakter ruft diesem etwas hinterher und
//	bricht dann das Zeigen wieder ab.
/////////////////////////////////////////////////////////////////////////////////
func void B_PointAndShout(var C_Npc pointer, var C_Npc pointedat, var string shout)
{
	AI_TurnToNpc(pointer, pointedat);
	AI_PointAtNpc(pointer, pointedat);
	B_Say(pointer, pointedat, shout);
	AI_StopPointAt(pointer);
};

//////////////////////////////////////////////////////////////////////////////////
//	B_Attack...
//	===========
//	Setzt das Target und startet in einem Aufwasch den ZS_Attack
//	, wobei Quick den momentanen Zustand abbricht und direkt startet, proper
//	beendet erst noch den aktuellen ZS korrekt
//////////////////////////////////////////////////////////////////////////////////
func void B_AttackQuick(var C_Npc me, var C_Npc enemy)
{
	Npc_SetTarget(me, enemy);
	AI_StartState(me, ZS_Attack, 0, "");
};

func void B_AttackProper(var C_Npc me, var C_Npc enemy)
{
	Npc_SetTarget(me, enemy);
	AI_StartState(me, ZS_Attack, 1, "");
};

//////////////////////////////////////////////////////////////////////////////////
//	B_Punish
//	========
//	Setzt den Grund des Angriffs eines NSCs, läuft zu ihm hin und verkündet ihn
//	abgefragt werden kann.
//	Konstanten sind in AI_CONSTANTS.D zu finden
//////////////////////////////////////////////////////////////////////////////////
func void B_Punish(var C_Npc me, var C_Npc enemy, var int reason)
{
	me.aivar[AIV_ATTACKREASON] = reason;

	Npc_SetTarget(me, enemy);
	AI_StartState(me, ZS_ProclaimAndPunish, 1, "");
};

//////////////////////////////////////////////////////////////////////////////////
//	B_Concat...Strings
//	==================
//	Gibt einen String zurück, der aus den drei Eingabestrings zusammengebastelt
//	wird.
//////////////////////////////////////////////////////////////////////////////////
func string B_ConcatThreeStrings(var string text1, var string text2, var string text3)
{
	var string msg;

	msg = ConcatStrings(text1, text2);
	msg = ConcatStrings(msg, text3);

	return msg;
};

func string B_ConcatFourStrings(var string text1, var string text2, var string text3, var string text4)
{
	var string msg;

	msg = ConcatStrings(text1, text2);
	msg = ConcatStrings(msg, text3);
	msg = ConcatStrings(msg, text4);

	return msg;
};

func string B_ConcatFiveStrings(var string text1, var string text2, var string text3, var string text4, var string text5)
{
	var string msg;

	msg = ConcatStrings(text1, text2);
	msg = ConcatStrings(msg, text3);
	msg = ConcatStrings(msg, text4);
	msg = ConcatStrings(msg, text5);

	return msg;
};

//////////////////////////////////////////////////////////////////////////////////
//	B_GetDay
//	========
//	Gibt den Tag passend zur Anzeige im Log-Screen (beginnend mit 1 nicht mit 0)
//	zurück.
//////////////////////////////////////////////////////////////////////////////////
func int B_GetDay()
{
	return(Wld_GetDay() + 1);
};
