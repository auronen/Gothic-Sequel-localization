//////////////////////////////////////////////////////////////////////////
//	C_IsArenaFight.d
//	================
//	Überprüft, ob sich die beiden SC/NSCs 'attacker' und 'defender' im
//	Arenakampf befiden und gibt TRUE zurück, wenn das so ist.
//////////////////////////////////////////////////////////////////////////
func int C_IsArenaFight(var C_Npc attacker, var C_Npc defender)
{
	PrintDebugNpc(PD_ZS_FRAME, "C_IsArenaFight");

	if (Arena_FightRunning)
	{
		if (Arena_NpcFight
		&& Npc_IsInRoutine(attacker, ZS_ArenaNpc)
		&& Npc_IsInRoutine(defender, ZS_ArenaNpc))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...ja, NSC gegen NSC!");
			return TRUE;
		};

		if (Arena_PlayerFight
		&& ((Npc_IsPlayer(attacker) && Npc_IsInRoutine(defender, ZS_ArenaFight)) ||
		(Npc_IsPlayer(defender) && Npc_IsInRoutine(attacker, ZS_ArenaFight))))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...ja, SC gegen NSC!");
			return TRUE;
		};

		PrintDebugNpc(PD_ZS_CHECK, "...nein, obwohl ein Arenakampf läuft!");
		return FALSE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "...nein, es läuft kein Arenakampf!");
		return FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//	C_IsGladiator.d
//	================
//	Überprüft, ob sich der angegebene SC/NSCs 'npc' im
//	Arenakampf befiden und gibt TRUE zurück, wenn das so ist.
//////////////////////////////////////////////////////////////////////////
func int C_IsGladiator(var C_Npc npc)
{
	PrintDebugNpc(PD_ZS_FRAME, "C_IsArenaFight");

	if (Arena_FightRunning)
	{
		if (Arena_NpcFight
		&& Npc_IsInRoutine(npc, ZS_ArenaNpc))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...ja, NSC gegen NSC!");
			return TRUE;
		};

		if (Arena_PlayerFight
		&& (Npc_IsPlayer(npc) || Npc_IsInRoutine(npc, ZS_ArenaFight)))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...ja, SC gegen NSC!");
			return TRUE;
		};

		PrintDebugNpc(PD_ZS_CHECK, "...nein, obwohl ein Arenakampf läuft!");
		return FALSE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "...nein, es läuft kein Arenakampf!");
		return FALSE;
	};
};
