func void ZS_AttackArena()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_AttackArena");

	Npc_PercEnable(self, PERC_ASSESSFIGHTER, B_Arena_AssessFighter);
	Npc_PercEnable(self, PERC_ASSESSPLAYER, B_Arena_AssessSC);
	B_SetArenaPerception(self);

	_ = Npc_GetTarget(self);

	//-------- Gegnercheck --------
	if (!C_NpcIsDown(other)
	&& Hlp_IsValidNpc(other)
	&& Arena_FightRunning)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Ziel ist kampffähig, gültig und Kampf läuft!");

		B_WhirlAround(self, other);
		AI_UnequipWeapons(self);
		_ = AI_EquipBestMeleeWeapon(self);
		AI_ReadyMeleeWeapon(self);

		AI_SetWalkMode(self, NPC_RUN);		// Walkmode für den Zustand
	};
};

func int ZS_AttackArena_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP, "ZS_AttackArena_Loop");

	_ = Npc_GetTarget(self);
	PrintGlobals(PD_ZS_DETAIL);

	//-------- Wenn Gegner Bewußtlos oder Tod... --------
	if (C_NpcIsDown(other)
	|| !Hlp_IsValidNpc(other)
	|| !Arena_FightRunning)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Ziel ist kampf-unfähig oder ungültig oder Kampf vorbei!");

		B_RemoveWeapon(self);
		AI_ContinueRoutine(self);
		return LOOP_END;
	};

	/* -------- eigentliches Anwerfen der FAI -------- */
	if (!C_NpcIsInvincible(other)) // wird z.B. im Dialog auf True gesetzt, d.h. verfolgter SC kann sich unterhalten, ohne von aNSC angegriffen zu werden
	//&& Npc_HasReadiedMeleeWeapon(other) 		// Gladiator greift nur an, wenn der andere seine Waffe wieder in der Hand hat
	{
		AI_Attack(self);
	}
	else
	{
		AI_Wait(self, 0.5);
	};

	return LOOP_CONTINUE;
};

func void ZS_AttackArena_End()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_AttackArena_End");
};
