func void ZS_Unconscious()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_Unconscious");

	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);

	self.aivar[AIV_PLUNDERED] = FALSE;

	//SN 24.09.00: für die PublisherDemo auskommentiert, da die Animationen noch nicht toll sind (Absprache mit Alex) -> wenn bessere Animationen da sind, wieder einkommentieren!
	//Mdl_ApplyRandomAni(self, "S_WOUNDEDB", "T_WOUNDEDB_TRY");
	//Mdl_ApplyRandomAniFreq(self, "S_WOUNDEDB", 8);

	C_StopLookAt(self);
	AI_StopPointAt(self);
	// !!! JP: Quickhack für die Betatester, friendly Charactere werden sickig, wenn man sie Niederschlägt
	if (Npc_GetPermAttitude(self, other) == ATT_FRIENDLY
	&& B_CompareNpcInstance(other, hero))
	{
		B_SetAttitude(self, ATT_ANGRY);
	};

	if (C_BodyStateContains(self, BS_SWIM))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...NSC ertrinkt!");
		AI_StartState(self, ZS_Dead, 0, "");
		return;
	};

	//-------- Arenakämpfe --------
	if (Arena_FightRunning
	&& ((Arena_PlayerFight && (Npc_IsPlayer(self) || Npc_IsPlayer(other)))
	|| (Arena_NpcFight && (Npc_WasInState(self, ZS_AttackArena) || Npc_WasInState(other, ZS_AttackArena)))))
	{
		B_Arena_AssessScore();		// ermittelt, ob einer der Gladiatoren gewonnen hat!

		return;
	};

	//-------- Erfahrungspunkte für den Spieler ? --------
	if (Npc_IsPlayer(other)
	|| (C_NpcIsHuman(other) && other.aivar[AIV_PARTYMEMBER])
	|| (C_NpcIsMonster(other) && other.aivar[AIV_MM_PARTYMEMBER]))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...von SC oder Partymember besiegt!");
		B_UnconciousXP();
		self.aivar[AIV_WASDEFEATEDBYSC] = TRUE;
	};

	if (Npc_IsPlayer(self))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...SC besiegt!");
		other.aivar[AIV_HASDEFEATEDSC] = TRUE;
	};
};

func int ZS_Unconscious_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP, "ZS_Unconscious_Loop");
	if (Npc_GetStateTime(self) > HAI_TIME_UNCONSCIOUS)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Schleifen-Ende");
		return LOOP_END;
	};

	AI_Wait(self, 1.0);
	return LOOP_CONTINUE;
};

func void ZS_Unconscious_End()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_Unconscious_End");

	//-------- Bewußtloser ist ein ORK --------
	if (C_NpcIsOrc(self) && !Npc_IsPlayer(self))
	{
		PrintDebugNpc(PD_ZS_FRAME, "ZS_Unconscious_End: Me, Orc -> temp-HOSTILE");
		AI_StandUp(self);
		Npc_PerceiveAll(self);
		if (Wld_DetectItem(self, ITEM_KAT_NF) || Wld_DetectItem(self, ITEM_KAT_FF))
		{
			PrintDebugNpc(PD_ZS_CHECK, "ZS_Unconscious_End: Me, Orc -> Waffe aufheben");
			if (Npc_CanSeeItem(self, item))
			{
				AI_TakeItem(self, item);
			};
		};

		Npc_SetTempAttitude(self, ATT_HOSTILE);
		AI_ContinueRoutine(self);
		return;
	};

	//-------- Temporäre Attitüde werden wieder zurückgesetzt --------
	if (!Npc_IsPlayer(self))
	{
		B_ResetTempAttitude(self);
	};

	//-------- Aufstehen & Umsehen ! --------
	AI_StandUp(self);
	AI_StopLookAt(self);

	//-------- fallgelassene Waffe aufheben... --------
	B_RegainDroppedWeapon(self);

	//-------- Heilen ! --------
	AI_StartState(self, ZS_HealSelf, 1, "");
};
