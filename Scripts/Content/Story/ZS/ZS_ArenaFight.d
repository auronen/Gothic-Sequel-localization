func void ZS_ArenaFight()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaFight");

	Npc_PercEnable(self, PERC_ASSESSFIGHTER, B_Arena_AssessFighter);
	Npc_PercEnable(self, PERC_ASSESSPLAYER, B_Arena_AssessSC);
	B_SetArenaPerception(self);

	B_Arena_ResetGladiator(Hlp_GetInstanceID(self));
};

func int ZS_ArenaFight_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_ArenaFight_Loop");

	var C_Npc master;
	master = Hlp_GetNpc(MIL_122_Arenamaster);

	if (!Arena_FightRunning
	&& !Arena_FightSelected)
	{
		return LOOP_END;
	};

	if (Npc_IsOnFP(self, "FP_ARENA_START"))
	{
		if ((Npc_GetDistToWP(master, ARENA_WP_THRONE) < 300)
		&& C_BodyStateContains(master, BS_SIT)
		&& ((Npc_GetDistToWP(hero, ARENA_WP_RIGHT_START) < 100) ||
		(Npc_GetDistToWP(hero, ARENA_WP_LEFT_START) < 100))
		&& (Npc_GetDistToNpc(self, hero) > 500)
		&& !C_NpcIsDown(hero)
		&& Npc_IsInFightMode(hero, FMODE_MELEE))
		{
			AI_TurnToNpc(self, hero);
			B_Arena_Greetings(self);
			AI_TurnToNpc(hero, self);
			B_Arena_Greetings(hero);
			AI_Wait(self, 2);
			Arena_PlayerHasCome = TRUE;

			Npc_SetTarget(self, hero);
			AI_StartState(self, ZS_AttackArena, 1, "");

			return LOOP_END;
		};
	}
	else
	{
		B_RuntoNearWP(self, self.wp);
		B_RuntoFP(self, "FP_ARENA_START");
		B_DrawWeapon(self, hero);
	};

	AI_Wait(self, 1);

	return LOOP_CONTINUE;
};

func void ZS_ArenaFight_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaFight_End");
};
