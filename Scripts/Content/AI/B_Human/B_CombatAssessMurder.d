func void B_CombatAssessMurder()
// 9.5. Fertig bis auf Perm Attitude --> Mike
{
	PrintDebugNpc(PD_ZS_FRAME, "B_CombatAssessMurder");
	PrintGlobals(PD_ZS_CHECK);
	// JP: Morde merken und Zähler erhöhen
	if (C_NpcIsHuman(victim)
	&& (C_NpcIsHuman(other)))
	{
		int_Murderid1 = Hlp_GetInstanceID(victim);
		PrintDebugInt(PD_ZS_CHECK, "MurderID1 ", int_MurderId1);
		PrintDebugInt(PD_ZS_CHECK, "MurderID2 ", int_MurderId2);
		//JP: Wenn ein Nsc getötet worden ist, wird das gemerkt, nicht wenn der Spieler getötet wurde
		if (!B_CompareNpcInstance(victim, hero))
		{
			PrintDebugNpc(PD_ZS_CHECK, "B_CombatAssessMurder seen // victim is not Hero");
			B_Say(self, other, "$HEKILLEDHIM");	//MH: von B_AssessAndMemorize hierhin kopiert, weil sonst IMMER der Spruch kam! JP: Nur bei Mord vom SPieler kommt ein Kommentar
		};

		if (int_MurderId1 != int_MurderId2)
		{
			int_MurderId2 = int_MurderId1;
			PrintDebugNpc(PD_ZS_CHECK, "Anderer Mord");
			int_Murdercount = int_Murdercount + 1;
		}
		else
		{
			int_Murderid2 = Hlp_GetInstanceID(victim);
			PrintDebugInt(PD_ZS_CHECK, "MurderID2 nach Tausch ", int_MurderId2);
		};
	};

	if (Npc_CanSeeNpc(self, other))
	{
		PrintDebugNpc(PD_ZS_CHECK, "B_CombatAssessMurder seen");
		if (C_NpcIsHuman(other) && C_NpcIsHuman(victim))
		{
			PrintDebugNpc(PD_ZS_CHECK, "B_CombatAssessMurder seen // Both human");
			//JP: Wenn ein Nsc getötet worden ist, wird das gemerkt, nicht wenn der Spieler getötet wurde
			if (!B_CompareNpcInstance(victim, hero))
			{
				PrintDebugNpc(PD_ZS_CHECK, "B_CombatAssessMurder seen // victim is not Hero");
			};

			//-------- evtl. Zielanlauf stoppen --------
			if (Npc_IsInState(self, ZS_ProclaimAndPunish))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...NSC ist in ZS_ProclaimAndPunish!");
				if (B_CompareNpcInstance(victim, hero))
				{
					PrintDebugNpc(PD_ZS_CHECK, "...Getöteter ist auch eigenes Ziel!");
					B_FullStop(self);
					AI_ContinueRoutine(self);
				};
			};
		};

		/****************************************************************************
		// Monster dürfen bei Tod die Attitüde der Nsc´s zum Spieler nicht verändern deshalb der Part ab &&
		/****************************************************************************/
		if (Npc_GetTempAttitude(self, victim) == ATT_FRIENDLY && (!C_NpcIsHuman(victim)))
		{
			PrintDebugNpc(PD_ZS_CHECK, "B_CombatAssessMurder seen // friendly to victim ::");
			Npc_SetTempAttitude(self, ATT_HOSTILE);
		};
	}
	//JP: auch wenn der Täter nicht gesehen wird, sollten nur bei menschlichen Opfern Murder_News gemerkt werden
	else if (C_NpcIsHuman(other) && C_NpcIsHuman(victim))
	{
		PrintDebugNpc(PD_ZS_CHECK, "B_CombatAssessMurder // only heard");

		//JP: Wenn ein Nsc getötet worden ist, wird das gemerkt, nicht wenn der Spieler getötet wurde
		if (!B_CompareNpcInstance(victim, hero))
		{
			PrintDebugNpc(PD_ZS_CHECK, "B_CombatAssessMurder seen // victim is not Hero");
		};
	};
};
