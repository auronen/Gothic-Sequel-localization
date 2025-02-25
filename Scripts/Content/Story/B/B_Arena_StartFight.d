//////////////////////////////////////////////////////////////////////////
//	B_Arena_StartFight
//	===================
//	Schließt die Arenatoren, spricht einen Eröffnungssatz und setzt
//	interne Flags, um den eigentlichen Kampf eröffnen.
//	- 'self' muß der Arenameister sein!
//////////////////////////////////////////////////////////////////////////
func void B_Arena_StartFight()
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_StartFight");

	//-------- läuft der Kampf bereits? --------
	if (Arena_FightRunning
	&& Arena_GatesClosed)
	{
		PrintDebugNpc(PD_TA_CHECK, "...Kampf läuft bereits!");
		return;
	};

	//-------- wurde ein Kampf angesetzt? --------
	if (!Arena_FightSelected)
	{
		PrintDebugNpc(PD_TA_CHECK, "...garkein Kampf angesetzt!");
		return;
	};

	//-------- Arenameister schon im richtigen TA? --------
	if (!Hlp_StrCmp(self.wp, ARENA_WP_THRONE))
	{
		PrintDebugNpc(PD_TA_CHECK, "...Exchange Arenamaster-TA to ATTENDANCE!");
		Npc_ExchangeRoutine(self, "attendance");
		AI_ContinueRoutine(self);
		return;
	};

	//-------- Gladiatoren in die Arena schicken --------
	if (Arena_PlayerFight)
	{
		if (Grim_Challenged)
		{
			B_ExchangeRoutine(MIN_306_Grim, "ArenaFight");
			B_ChangeGuild(MIN_306_Grim, GIL_NONE);
		};

		if (Goliath_Challenged)
		{
			B_ExchangeRoutine(WRK_216_Goliath, "ArenaFight");
			B_ChangeGuild(WRK_216_Goliath, GIL_NONE);
		};

		if (Brutus_Challenged)
		{
			B_ExchangeRoutine(MIL_121_Brutus, "ArenaFight");
			B_ChangeGuild(MIL_121_Brutus, GIL_NONE);
		};

		if (Malgar_Challenged)
		{
			B_ExchangeRoutine(DMH_1302_Malgar, "ArenaFight");
			B_ChangeGuild(DMH_1302_Malgar, GIL_NONE);
		};

		if (Thora_Challenged)
		{
			B_ExchangeRoutine(AMZ_900_Thora, "ArenaFight");
			B_ChangeGuild(AMZ_900_Thora, GIL_NONE);
		};
	}
	else
	{
		if (Arena_NpcCombo == AC_GRIM_GOLIATH)
		{
			B_ExchangeRoutine(MIN_306_Grim, "ArenaNpc");
			B_ChangeGuild(MIN_306_Grim, GIL_NONE);
			B_ExchangeRoutine(WRK_216_Goliath, "ArenaNpc");
			B_ChangeGuild(WRK_216_Goliath, GIL_NONE);
		};

		if (Arena_NpcCombo == AC_GOLIATH_BRUTUS)
		{
			B_ExchangeRoutine(WRK_216_Goliath, "ArenaNpc");
			B_ChangeGuild(WRK_216_Goliath, GIL_NONE);
			B_ExchangeRoutine(MIL_121_Brutus, "ArenaNpc");
			B_ChangeGuild(MIL_121_Brutus, GIL_NONE);
		};

		if (Arena_NpcCombo == AC_BRUTUS_MALGAR)
		{
			B_ExchangeRoutine(MIL_121_Brutus, "ArenaNpc");
			B_ChangeGuild(MIL_121_Brutus, GIL_NONE);
			B_ExchangeRoutine(DMH_1302_Malgar, "ArenaNpc");
			B_ChangeGuild(DMH_1302_Malgar, GIL_NONE);
		};

		if (Arena_NpcCombo == AC_MALGAR_THORA)
		{
			B_ExchangeRoutine(DMH_1302_Malgar, "ArenaNpc");
			B_ChangeGuild(DMH_1302_Malgar, GIL_NONE);
			B_ExchangeRoutine(AMZ_900_Thora, "ArenaNpc");
			B_ChangeGuild(AMZ_900_Thora, GIL_NONE);
		};
	};

	//-------- Arenatore schliessen & Eröffnungssatz --------
	if (!Arena_GatesClosed)
	{
		PrintDebugNpc(PD_TA_CHECK, "...close ArenaGates!");

		AI_StartState(self, ZS_ArenaMasterStartFight, 1, "");
	};

	//-------- Flag setzen --------
	Arena_FightDay = B_GetDay();
	Arena_FightRunning = TRUE;
};
