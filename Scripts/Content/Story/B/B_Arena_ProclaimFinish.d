//////////////////////////////////////////////////////////////////////////
//	B_Arena_ProclaimFinish
//	======================
//	Gibt die Eröffnungssätze des Arenameisters am beginn eines Arena-
//	kampfes aus!
//	'arenamaster' enthält die Instanz des Verkündenden
//////////////////////////////////////////////////////////////////////////
func void B_Arena_ProclaimFinish(var C_Npc arenamaster)
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_ProclaimFinish");

	//-------- zu spät? --------
	if (!Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H + 1, ARENAEND_M))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...zu spät!");
		return;
	};

	//-------- lokale Variablen --------
	var C_Npc target;
	var C_Npc npc;
	var int GrimPoints;
	var int GoliathPoints;
	var int BrutusPoints;
	var int MalgarPoints;
	var int ThoraPoints;

	//-------- Punkte ermitteln --------
	npc = Hlp_GetNpc(MIN_306_Grim); GrimPoints = npc.aivar[AIV_ARENA_POINTS];
	npc = Hlp_GetNpc(WRK_216_Goliath); GoliathPoints = npc.aivar[AIV_ARENA_POINTS];
	npc = Hlp_GetNpc(MIL_121_Brutus); BrutusPoints = npc.aivar[AIV_ARENA_POINTS];
	npc = Hlp_GetNpc(DMH_1302_Malgar); MalgarPoints = npc.aivar[AIV_ARENA_POINTS];
	npc = Hlp_GetNpc(AMZ_900_Thora); ThoraPoints = npc.aivar[AIV_ARENA_POINTS];

	//-------- Ziel-Instanz ermitteln --------
	if (Arena_PlayerFight)
	{
		target = Hlp_GetNpc(PC_Hero);
		PrintDebugString(PD_ZS_CHECK, "...target: ", target.name);
	};

	//-------- Siegsätze ermitteln ermitteln --------
	AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_01"); //(theatralisch) DIE WÜRFEL SIND GEFALLEN.

	if (Arena_PlayerFight && Arena_PlayerHasWonToday)
	{
		if ((Arena_PCRanking == 1)
		&& (Arena_LastPCRanking == 2))
		{
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_02"); //WIR ABEN EINEN NEUEN CHAMPION !!!
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_03"); //!!! DU !!! ...BIST DER NEUE CHAMPION DIESER ARENA!
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_04"); //!!! DU !!! ...BIST DER BESTE KÄMPFER WEIT UND BREIT!
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_05"); //WIR VERNEIGEN UNS VOR DIR!
		}
		else
		{
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_06"); //DER SIEGER DES HEUTIGEN KAMPFES...
			AI_TurnToNpc(arenamaster, hero);
			AI_Output(arenamaster, hero, "MIL_122_ProclaimFinish_12_07"); //...bist DU !!!
		};
	}
	else
	{
		AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_08"); //DER SIEGER DES HEUTIGEN KAMPFES IST...

		if (Arena_PlayerFight
		&& !Arena_PlayerHasWonToday
		&& ((Grim_Challenged && (GrimPoints < ARENA_POINTSFORVICTORY))
		|| (Goliath_Challenged && (GoliathPoints < ARENA_POINTSFORVICTORY))
		|| (Brutus_Challenged && (BrutusPoints < ARENA_POINTSFORVICTORY))
		|| (Malgar_Challenged && (MalgarPoints < ARENA_POINTSFORVICTORY))
		|| (Thora_Challenged && (ThoraPoints < ARENA_POINTSFORVICTORY)))
		&& !Arena_PlayerBanned)
		{
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_09"); //NIEMAND !!!
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_10"); //Kein Gladiator hat 10 Punkte erringen können.
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_11"); //Somit ist der heutige Kampf unentschieden!
		};

		if ((Arena_PlayerFight && Grim_Challenged && !Arena_PlayerHasWonToday && (GrimPoints >= ARENA_POINTSFORVICTORY))
		|| (Arena_PlayerFight && Grim_Challenged && Arena_PlayerBanned)
		|| (Arena_NpcFight && (Arena_NpcCombo == AC_GRIM_GOLIATH) && (GrimPoints > GoliathPoints)))
		{
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_12"); //!!!   G R I M   !!!!
		};

		if ((Arena_PlayerFight && Goliath_Challenged && !Arena_PlayerHasWonToday && (GoliathPoints >= ARENA_POINTSFORVICTORY))
		|| (Arena_PlayerFight && Goliath_Challenged && Arena_PlayerBanned)
		|| (Arena_NpcFight && (Arena_NpcCombo == AC_GRIM_GOLIATH) && (GrimPoints <= GoliathPoints))
		|| (Arena_NpcFight && (Arena_NpcCombo == AC_GOLIATH_BRUTUS) && (GoliathPoints > BrutusPoints)))
		{
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_13"); //!!!   G O L I A T H   !!!!
		};

		if ((Arena_PlayerFight && Brutus_Challenged && !Arena_PlayerHasWonToday && (BrutusPoints >= ARENA_POINTSFORVICTORY))
		|| (Arena_PlayerFight && Brutus_Challenged && Arena_PlayerBanned)
		|| (Arena_NpcFight && (Arena_NpcCombo == AC_GOLIATH_BRUTUS) && (GoliathPoints <= BrutusPoints))
		|| (Arena_NpcFight && (Arena_NpcCombo == AC_BRUTUS_MALGAR) && (BrutusPoints > MalgarPoints)))
		{
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_14"); //!!!   B R U T U S   !!!!
		};

		if ((Arena_PlayerFight && Malgar_Challenged && !Arena_PlayerHasWonToday && (MalgarPoints >= ARENA_POINTSFORVICTORY))
		|| (Arena_PlayerFight && Malgar_Challenged && Arena_PlayerBanned)
		|| (Arena_NpcFight && (Arena_NpcCombo == AC_BRUTUS_MALGAR) && (BrutusPoints <= MalgarPoints))
		|| (Arena_NpcFight && (Arena_NpcCombo == AC_MALGAR_THORA) && (MalgarPoints > ThoraPoints)))
		{
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_15"); //!!!   M A L G A R   !!!!
		};

		if ((Arena_PlayerFight && Thora_Challenged && !Arena_PlayerHasWonToday && (ThoraPoints >= ARENA_POINTSFORVICTORY))
		|| (Arena_PlayerFight && Thora_Challenged && Arena_PlayerBanned)
		|| (Arena_NpcFight && (Arena_NpcCombo == AC_MALGAR_THORA) && (MalgarPoints <= ThoraPoints)))
		{
			AI_Output(arenamaster, target, "MIL_122_ProclaimFinish_12_16"); //!!!   T H O R A   !!!!
		};
	};
};
