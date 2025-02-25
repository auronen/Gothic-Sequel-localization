//////////////////////////////////////////////////////////////////////////
//	B_Arena_PlayerVictory
//	=====================
//	Hat der Spieler den Arenakampf gewonnen, wird diese Funktion hier
//	ausgeführt.
//////////////////////////////////////////////////////////////////////////
func void B_Arena_PlayerVictory()
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_PlayerVictory");

	//-------- Rankliste modifizieren --------
	//Arena_LastPCRanking	= B_GetGladiatorRanking(PC_Hero);
	hero.aivar[AIV_ARENA_VICTORIES] = hero.aivar[AIV_ARENA_VICTORIES] + 1;

	Arena_PlayerHasWonToday = TRUE;
	Arena_AbortFight = TRUE;

	if (Grim_Challenged)
	{
		B_GiveXP(XP_Arena_WonGrimFight);
	};

	if (Goliath_Challenged)
	{
		Brutus_PlayerWonBefore = TRUE;
		B_GiveXP(XP_Arena_WonGoliathFight);
	};

	if (Brutus_Challenged)
	{
		Brutus_PlayerWonBefore = TRUE;
		B_GiveXP(XP_Arena_WonBrutusFight);
	};

	if (Malgar_Challenged)
	{
		Malgar_PlayerWonBefore = TRUE;
		B_GiveXP(XP_Arena_WonMalgarFight);
	};

	if (Thora_Challenged)
	{
		Thora_PlayerWonBefore = TRUE;
		B_GiveXP(XP_Arena_WonThoraFight);
	};

	_ = PrintScreen(_STR_MESSAGE_ARENAPLAYERVICTORY, -1, _YPOS_MESSAGE_ARENARESULT, FONT_OLD_BIG, _TIME_MESSAGE_ARENARESULT);
};
