func void ZS_ArenaNpc()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaNpc");

	Npc_PercEnable(self, PERC_ASSESSPLAYER, B_Arena_AssessSC_Npc);
	Npc_PercEnable(self, PERC_ASSESSFIGHTER, B_Arena_AssessFighter);
	B_SetArenaPerception(self);
	Npc_PercEnable(self, PERC_ASSESSTHEFT, B_AssessTheft);

	B_Arena_ResetGladiator(Hlp_GetInstanceID(self));
};

func int ZS_ArenaNpc_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_ArenaNpc_Loop");

	var C_Npc master;
	master = Hlp_GetNpc(MIL_122_Arenamaster);

	if (Npc_IsOnFP(self, "FP_ARENA_START"))
	{
		Npc_PerceiveAll(self);
		_ = Wld_DetectNpc(self, -1, ZS_ArenaNpc, -1);		//initialisiert 'other'

		if (Wld_DetectNpc(self, -1, ZS_ArenaNpc, -1)
		&& (Npc_GetDistToWP(master, ARENA_WP_THRONE) < 300)
		&& C_BodyStateContains(master, BS_SIT)
		&& Npc_IsOnFP(other, "FP_ARENA_START"))
		{
			AI_TurnToNpc(self, other);
			B_Arena_Greetings(self);
			B_DrawWeapon(self, other);
			AI_Wait(self, 2);

			Npc_SetTarget(self, other);
			AI_StartState(self, ZS_AttackArena, 1, "");
			return LOOP_END;
		};
	}
	else
	{
		AI_SetWalkMode(self, NPC_RUN);
		AI_GotoWP(self, self.wp);
		B_RuntoFP(self, "FP_ARENA_START");
	};

	AI_Wait(self, 0.2);

	return LOOP_CONTINUE;
};

func void ZS_ArenaNpc_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaNpc_End");
};
