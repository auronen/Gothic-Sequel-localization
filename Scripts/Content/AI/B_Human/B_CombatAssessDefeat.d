/***********************************************************************************************
**
**	B_CombatAssessDefeat
**	--------------------
**
**	Reaction eines sich im Kampf befindenden Nsc´s auf das Niederschlagern eines anderen Nsc
**
***********************************************************************************************/

func void B_CombatAssessDefeat()
// 9.5.00 fertig
{
	PrintDebugNpc(PD_ZS_FRAME, "B_CombatAssessDefeat");
	// JP : Ich habe das mal auf FreeLOS geändert, weil es zwar logisch nicht ganz richtig ist, dem Spieler vom Feedback her aber verständlicher, als wenn er grade aus dem Augenwinkel nicht mehr gesehen wird
	if (Npc_CanSeeNpcFreeLOS(self, other))
	{
		if (C_NpcIsHuman(other) && C_NpcIsHuman(victim))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Mensch besiegt Mensch!");
			//-------- evtl. Zielanlauf stoppen --------
			if (Npc_IsInState(self, ZS_ProclaimAndPunish))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...NSC ist in ZS_ProclaimAndPunish!");
				if (B_CompareNpcInstance(victim, hero))
				{
					PrintDebugNpc(PD_ZS_CHECK, "...Besiegter ist auch eigenes Ziel!");
					B_FullStop(self);
					AI_ContinueRoutine(self);
				};
			};
		};
	};
};
