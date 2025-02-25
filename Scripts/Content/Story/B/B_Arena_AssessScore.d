//////////////////////////////////////////////////////////////////////////
//	B_Arena_AssessScore
//	===================
//	Wird aus ZS_Unconscious() heraus aufgerufen, wenn es sich um einen
//	Arenakampf handelt. Macht folgendes:
//	- erhöhte den Punktezähler des DEFEATers
//	- Gibt den neuen Punktestand auf dem Screen aus
//	- Wenn SC-Beteiligung: Überprüft den Punktestand des Arenakampfes
//	  und ruft bei Bedarf die Sieg-/Niederlagefunktion auf.
//////////////////////////////////////////////////////////////////////////
func void B_Arena_AssessScore()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Arena_AssessScore");

	//-------- Punktezähler des Gewinners eins hochsetzen --------
	if (Npc_WasInState(self, ZS_AttackArena)
	|| Npc_IsPlayer(self))
	{
		other.aivar[AIV_ARENA_POINTS] = other.aivar[AIV_ARENA_POINTS] + 1;
	}
	else
	{
		_ = AI_PrintScreen(self, _STR_MESSAGE_ARENAPENALTY1, -1, _YPOS_MESSAGE_ARENAPENALTY1, FONT_OLD_BIG, _TIME_MESSAGE_ARENAPENALTY, TEXT_COLOR_RED);
		_ = PrintScreenColored(_STR_MESSAGE_ARENAPENALTY2, -1, _YPOS_MESSAGE_ARENAPENALTY2, FONT_OLD_SMALL, _TIME_MESSAGE_ARENAPENALTY, TEXT_COLOR_RED);
		other.aivar[AIV_ARENA_POINTS] = other.aivar[AIV_ARENA_POINTS] - 1;	//Niederschlag vor Beginn der Runde!
	};

	//-------- Kämpfen NSCs untereinander? --------
	if (Arena_NpcFight)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...NSC-Kampf!");
		B_Arena_PrintScore();
		return;
	};

	//-------- Ermittlung der Punkte --------
	var C_Npc npc2;

	if (Grim_Challenged) { npc2 = Hlp_GetNpc(MIN_306_Grim); };
	if (Goliath_Challenged) { npc2 = Hlp_GetNpc(WRK_216_Goliath); };
	if (Brutus_Challenged) { npc2 = Hlp_GetNpc(MIL_121_Brutus); };
	if (Malgar_Challenged) { npc2 = Hlp_GetNpc(DMH_1302_Malgar); };
	if (Thora_Challenged) { npc2 = Hlp_GetNpc(AMZ_900_Thora); };
	if (hero.aivar[AIV_ARENA_POINTS] >= ARENA_POINTSFORVICTORY)
	{
		B_Arena_PlayerVictory();
		B_Arena_FinishFight();
		//B_Arena_UnselectFight();
	};

	if (npc2.aivar[AIV_ARENA_POINTS] >= ARENA_POINTSFORVICTORY)
	{
		B_Arena_PlayerDefeat();
		B_Arena_FinishFight();
		//B_Arena_UnselectFight();
	};

	if ((hero.aivar[AIV_ARENA_POINTS] < ARENA_POINTSFORVICTORY)
	&& (npc2.aivar[AIV_ARENA_POINTS] < ARENA_POINTSFORVICTORY))
	{
		B_Arena_PrintScore();
	};
};
