func void B_Arena_PrintScore()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Arena_PrintScore");

	var string msg;
	var C_Npc npc1;
	var C_Npc npc2;

	if (Arena_PlayerFight)
	{
		if (Grim_Challenged) { npc2 = Hlp_GetNpc(MIN_306_Grim); };
		if (Goliath_Challenged) { npc2 = Hlp_GetNpc(WRK_216_Goliath); };
		if (Brutus_Challenged) { npc2 = Hlp_GetNpc(MIL_121_Brutus); };
		if (Malgar_Challenged) { npc2 = Hlp_GetNpc(DMH_1302_Malgar); };
		if (Thora_Challenged) { npc2 = Hlp_GetNpc(AMZ_900_Thora); };
		msg = ConcatStrings(hero.name, " : ");
		msg = ConcatStrings(msg, IntToString(hero.aivar[AIV_ARENA_POINTS]));
		msg = ConcatStrings(msg, "     -     ");
		msg = ConcatStrings(msg, npc2.name);
		msg = ConcatStrings(msg, " : ");
		msg = ConcatStrings(msg, IntToString(npc2.aivar[AIV_ARENA_POINTS]));
	}

	else if (Arena_NpcFight)
	{
		//-------- kann der Spieler die Gladiatoren sehen ? --------
		if (Npc_GetDistToWP(hero, ARENA_WP_CENTER) > 1000)
		{
			return;
		};

		if (Arena_NpcCombo == AC_GRIM_GOLIATH) { npc1 = Hlp_GetNpc(WRK_216_Goliath); npc2 = Hlp_GetNpc(MIN_306_Grim); };
		if (Arena_NpcCombo == AC_GOLIATH_BRUTUS) { npc1 = Hlp_GetNpc(MIL_121_Brutus); npc2 = Hlp_GetNpc(WRK_216_Goliath); };
		if (Arena_NpcCombo == AC_BRUTUS_MALGAR) { npc1 = Hlp_GetNpc(DMH_1302_Malgar); npc2 = Hlp_GetNpc(MIL_121_Brutus); };
		if (Arena_NpcCombo == AC_MALGAR_THORA) { npc1 = Hlp_GetNpc(AMZ_900_Thora); npc2 = Hlp_GetNpc(DMH_1302_Malgar); };
		msg = ConcatStrings(npc1.name, " : ");
		msg = ConcatStrings(msg, IntToString(npc1.aivar[AIV_ARENA_POINTS]));
		msg = ConcatStrings(msg, "     -     ");
		msg = ConcatStrings(msg, npc2.name);
		msg = ConcatStrings(msg, " : ");
		msg = ConcatStrings(msg, IntToString(npc2.aivar[AIV_ARENA_POINTS]));
	}

	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "...kein laufender Arenakampf!");
		return;
	};

	//-------- Textmeldung nun ausgeben --------
	_ = AI_PrintScreen(self, msg, -1, -1, FONT_OLD_BIG, 3, TEXT_COLOR_WHITE);
};
