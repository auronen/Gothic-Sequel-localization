//////////////////////////////////////////////////////////////////////////
//	B_Arena_SelectFight
//	===================
//	Wählt die Gladiatoren für den heutigen Arenakampf aus und schickt
//	sie in die Arena
//	Schickt die Zuschauer in die Arena.
//////////////////////////////////////////////////////////////////////////
func void B_Arena_SelectFight()
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_SelectFight");

	var C_Npc npc1;
	var C_Npc npc2;

	//-------- heute schon selected? --------
	if (Arena_FightSelected)
	{
		PrintDebugNpc(PD_TA_FRAME, "...für heute wurde bereits ein Kampf angesetzt!");
		return;
	};

	var int today;
	today = B_GetDay();
	if (Arena_SelectDay == today)
	{
		PrintDebugNpc(PD_TA_FRAME, "...heute gab es bereits einen Kampf!");
		return;
	};

	//-------- Spielerkampf vorbereiten --------
	if (Arena_PlayerFight)
	{
		if (Grim_Challenged)
		{
			B_ExchangeRoutine(MIN_306_Grim, "PreChamber");
			npc1 = Hlp_GetNpc(MIN_306_Grim);
			npc1.aivar[AIV_ARENA_POINTS] = 0;
		};

		if (Goliath_Challenged)
		{
			B_ExchangeRoutine(WRK_216_Goliath, "PreChamber");
			npc1 = Hlp_GetNpc(WRK_216_Goliath);
			npc1.aivar[AIV_ARENA_POINTS] = 0;
		};

		if (Brutus_Challenged)
		{
			B_ExchangeRoutine(MIL_121_Brutus, "PreChamber");
			npc1 = Hlp_GetNpc(MIL_121_Brutus);
			npc1.aivar[AIV_ARENA_POINTS] = 0;
		};

		if (Malgar_Challenged)
		{
			B_ExchangeRoutine(DMH_1302_Malgar, "PreChamber");
			npc1 = Hlp_GetNpc(DMH_1302_Malgar);
			npc1.aivar[AIV_ARENA_POINTS] = 0;
		};

		if (Thora_Challenged)
		{
			B_ExchangeRoutine(AMZ_900_Thora, "PreChamber");
			npc1 = Hlp_GetNpc(AMZ_900_Thora);
			npc1.aivar[AIV_ARENA_POINTS] = 0;
		};

		hero.aivar[AIV_ARENA_POINTS] = 0;
	}

	//-------- NSC-Kampf vorbereiten --------
	else
	{
		// Arenakämfper in die Arena schicken
		var int thisDay;
		var int moduloDay;
		thisDay = Wld_GetDay();
		moduloDay = thisDay % 4;
		PrintDebugInt(PD_TA_DETAIL, "thisDay = ", thisDay);
		PrintDebugInt(PD_TA_DETAIL, "moduloDay = ", moduloDay);

		if (moduloDay == 0) 					// jeder 0te Tag?
		{
			npc1 = Hlp_GetNpc(MIN_306_Grim);
			npc2 = Hlp_GetNpc(WRK_216_Goliath);
			if (Npc_IsDead(npc1) || Npc_IsDead(npc2) || Gotmar_GoliathReturned) { return; };
			B_ExchangeRoutine(MIN_306_Grim, "PreChamber");
			npc1.aivar[AIV_ARENA_POINTS] = 0;

			B_ExchangeRoutine(WRK_216_Goliath, "PreChamber");
			npc2.aivar[AIV_ARENA_POINTS] = 0;

			Arena_NpcCombo = AC_GRIM_GOLIATH;
		}
		else if (moduloDay == 1) 					// jeder 1te Tag?
		{
			npc1 = Hlp_GetNpc(WRK_216_Goliath);
			npc2 = Hlp_GetNpc(MIL_121_Brutus);
			if (Npc_IsDead(npc1) || Npc_IsDead(npc2) || Gotmar_GoliathReturned) { return; };
			B_ExchangeRoutine(WRK_216_Goliath, "PreChamber");
			npc1.aivar[AIV_ARENA_POINTS] = 0;

			B_ExchangeRoutine(MIL_121_Brutus, "PreChamber");
			npc2.aivar[AIV_ARENA_POINTS] = 0;

			Arena_NpcCombo = AC_GOLIATH_BRUTUS;
		}
		else if (moduloDay == 2) 					// jeder 2te Tag?
		{
			npc1 = Hlp_GetNpc(MIL_121_Brutus);
			npc2 = Hlp_GetNpc(DMH_1302_Malgar);
			if (Npc_IsDead(npc1) || Npc_IsDead(npc2)) { return; };
			B_ExchangeRoutine(MIL_121_Brutus, "PreChamber");
			npc1.aivar[AIV_ARENA_POINTS] = 0;

			B_ExchangeRoutine(DMH_1302_Malgar, "PreChamber");
			npc2.aivar[AIV_ARENA_POINTS] = 0;

			Arena_NpcCombo = AC_BRUTUS_MALGAR;
		}
		else if (moduloDay == 3) 					// jeder 3te Tag?
		{
			npc1 = Hlp_GetNpc(DMH_1302_Malgar);
			npc2 = Hlp_GetNpc(AMZ_900_Thora);
			if (Npc_IsDead(npc1) || Npc_IsDead(npc2) || (subChapter < CH2_THORA_CONVINCED)) { return; };
			B_ExchangeRoutine(DMH_1302_Malgar, "PreChamber");
			npc1.aivar[AIV_ARENA_POINTS] = 0;

			B_ExchangeRoutine(AMZ_900_Thora, "PreChamber");
			npc2.aivar[AIV_ARENA_POINTS] = 0;

			Arena_NpcCombo = AC_MALGAR_THORA;
		};

		Arena_NpcFight = TRUE;
	};

	//-------- Zuschauer in die Arena schicken --------
	// VORSICHT: nur bei NSCs, die auch "Start" als Standard-TA haben (siehe B_Arena_UnselectFight.d) !!!
	B_ExchangeRoutine(THF_405_Thief, "ArenaSpectator");
	B_ExchangeRoutine(THF_407_Thief, "ArenaSpectator");
	B_ExchangeRoutine(THF_408_Thief, "ArenaSpectator");
	B_ExchangeRoutine(THF_409_Pyro, "ArenaSpectator");

	B_ExchangeRoutine(WRK_206_Nicolos, "ArenaSpectator");

	B_ExchangeRoutine(THF_402_Karras, "ArenaSpectator");
	B_ExchangeRoutine(THF_406_Thief, "ArenaSpectator");
	B_ExchangeRoutine(BEG_705_Beggar, "ArenaSpectator");

	PrintDebugNpc(PD_TA_CHECK, "...Gladiatoren und Zuschauer in die Arena geschickt!");

	//-------- Flags setzen --------
	Arena_PlayerHasCome = FALSE;

	Arena_FightSelected = TRUE;
	Arena_SelectDay = B_GetDay();
};
