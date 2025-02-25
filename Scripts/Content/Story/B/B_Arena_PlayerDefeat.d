//////////////////////////////////////////////////////////////////////////
//	B_Arena_PlayerDefeat
//	====================
//	Hat der Spieler den Arenakampf verloren, wird diese Funktion hier
//	ausgeführt.
//////////////////////////////////////////////////////////////////////////
func void B_Arena_PlayerDefeat()
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_PlayerDefeat");

	//-------- Rankliste modifizieren --------
	var C_Npc npc;

	if (Grim_Challenged) { npc = Hlp_GetNpc(MIN_306_Grim); };
	if (Goliath_Challenged) { npc = Hlp_GetNpc(WRK_216_Goliath); };
	if (Brutus_Challenged) { npc = Hlp_GetNpc(MIL_121_Brutus); };
	if (Malgar_Challenged) { npc = Hlp_GetNpc(DMH_1302_Malgar); };
	if (Thora_Challenged) { npc = Hlp_GetNpc(AMZ_900_Thora); };
	//Arena_LastPCRanking	= B_GetGladiatorRanking(PC_Hero);
	npc.aivar[AIV_ARENA_VICTORIES] = npc.aivar[AIV_ARENA_VICTORIES] + 1;

	//-------- Flags anpassen --------
	Arena_AbortFight = TRUE;

	//-------- Textmeldung nun ausgeben --------
	_ = PrintScreen(_STR_MESSAGE_ARENAPLAYERDEFEAT, -1, _YPOS_MESSAGE_ARENARESULT, FONT_OLD_BIG, _TIME_MESSAGE_ARENARESULT);
};
