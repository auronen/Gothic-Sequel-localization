//////////////////////////////////////////////////////////////////////////
//	B_Arena_FinishFight
//	===================
//	Macht alle mit B_Arena_StartFight() getätigten Aktionen wieder
//	rückgängig !
//////////////////////////////////////////////////////////////////////////
func void B_Arena_FinishFight()
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_FinishFight");

	var C_Npc arenamaster;
	arenamaster = Hlp_GetNpc(MIL_122_Arenamaster);

	//-------- läuft ein Kampf? --------
	if (!Arena_FightRunning) // es läuft garkein Kampf
	{
		PrintDebugNpc(PD_TA_CHECK, "...es läuft garkein Kampf!");
		return;
	};

	//-------- wurde Kampf bereits beendet? --------
	if ((Arena_FightDay == B_GetDay())
	&& Npc_IsInRoutine(arenamaster, ZS_ArenaMasterNpc)
	&& !Arena_AbortFight)
	{
		PrintDebugNpc(PD_TA_CHECK, "...es läuft immer noch der heutige Kampf!");
		return;
	};

	//-------- Arenameister schon im richtigen TA? --------
	if (Hlp_StrCmp(arenamaster.wp, ARENA_WP_THRONE))
	{
		PrintDebugNpc(PD_TA_CHECK, "...Exchange Arenamaster-TA to START!");
		Npc_ExchangeRoutine(arenamaster, "start");
		AI_ContinueRoutine(arenamaster);
		return;
	};

	//-------- Gladiatoren wieder auf "ArenaWait" setzen --------
	PrintArenaStatus(PD_TA_CHECK);

	if ((Arena_PlayerFight && Grim_Challenged)
	|| (Arena_NpcFight && (Arena_NpcCombo == AC_GRIM_GOLIATH)))
	{
		B_Arena_ResetGladiator(MIN_306_Grim);
		B_Arena_Wait(MIN_306_Grim);
		B_ExchangeRoutine(MIN_306_Grim, "ArenaWait");
		B_ChangeGuild(MIN_306_Grim, GIL_MINER);
	};

	if ((Arena_PlayerFight && Goliath_Challenged)
	|| (Arena_NpcFight && (Arena_NpcCombo == AC_GRIM_GOLIATH))
	|| (Arena_NpcFight && (Arena_NpcCombo == AC_GOLIATH_BRUTUS)))
	{
		B_Arena_ResetGladiator(WRK_216_Goliath);
		B_Arena_Wait(WRK_216_Goliath);
		B_ExchangeRoutine(WRK_216_Goliath, "ArenaWait");
		B_ChangeGuild(WRK_216_Goliath, GIL_WORKER);
	};

	if ((Arena_PlayerFight && Brutus_Challenged)
	|| (Arena_NpcFight && (Arena_NpcCombo == AC_GOLIATH_BRUTUS))
	|| (Arena_NpcFight && (Arena_NpcCombo == AC_BRUTUS_MALGAR)))
	{
		B_Arena_ResetGladiator(MIL_121_Brutus);
		B_Arena_Wait(MIL_121_Brutus);
		B_ExchangeRoutine(MIL_121_Brutus, "ArenaWait");
		B_ChangeGuild(MIL_121_Brutus, GIL_MILITIA);
	};

	if ((Arena_PlayerFight && Malgar_Challenged)
	|| (Arena_NpcFight && (Arena_NpcCombo == AC_BRUTUS_MALGAR))
	|| (Arena_NpcFight && (Arena_NpcCombo == AC_MALGAR_THORA)))
	{
		B_Arena_ResetGladiator(DMH_1302_Malgar);
		B_Arena_Wait(DMH_1302_Malgar);
		B_ExchangeRoutine(DMH_1302_Malgar, "ArenaWait");
		B_ChangeGuild(DMH_1302_Malgar, GIL_DEMONHUNTER);
	};

	if ((Arena_PlayerFight && Thora_Challenged)
	|| (Arena_NpcFight && (Arena_NpcCombo == AC_MALGAR_THORA)))
	{
		B_Arena_ResetGladiator(AMZ_900_Thora);
		B_Arena_Wait(AMZ_900_Thora);
		B_ExchangeRoutine(AMZ_900_Thora, "ArenaWait");
		B_ChangeGuild(AMZ_900_Thora, GIL_AMAZON);
	};

	//-------- SC Waffe wegstecken lassen --------
	if (Arena_PlayerFight
	&& Npc_HasReadiedMeleeWeapon(hero))
	{
		AI_RemoveWeapon(hero);
		AI_TurnToNpc(hero, arenamaster);
	};

	//-------- Arenameister beendet formal den Kampf! --------
	if (Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M + 30))
	{
		B_GotoFP(arenamaster, "MASTER");
		AI_Wait(arenamaster, 1);
		B_Arena_ProclaimFinish(arenamaster);
		AI_Wait(arenamaster, 1);
	};

	//-------- Tore wieder öffnen --------
	if (Arena_GatesClosed)
	{
		PrintDebugNpc(PD_TA_CHECK, "...open ArenaGates!");
		AI_StandUp(arenamaster);
		_ = AI_UseMob(arenamaster, "VWHEEL", 1);
		_ = AI_UseMob(arenamaster, "VWHEEL", 0);
		_ = AI_UseMob(arenamaster, "VWHEEL", -1);
	};

	//-------- Flags bereinigen --------
	Arena_FightRunning = FALSE;
	Arena_AbortFight = FALSE;
};
