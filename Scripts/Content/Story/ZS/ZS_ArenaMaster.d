//////////////////////////////////////////////////////////////////////////////////////
//	ZS_ArenaMasterBooth
//	---------------------
//	Arenameister wartet hinter seinem Wettstand auf den Spieler
//////////////////////////////////////////////////////////////////////////////////////
func void ZS_ArenaMasterBooth()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaMasterBooth");

	B_SetPerception(self);

	B_Arena_FinishFight();
	B_Arena_UnselectFight();

	//-----------------------------------
	AI_StartState(self, ZS_Stand, 1, "");
};

//////////////////////////////////////////////////////////////////////////////////////
//	ZS_ArenaMasterSendNpc
//	---------------------
//	Arenameister schickt eine Kombination von NSC-Gladiatoren in die Arena
//////////////////////////////////////////////////////////////////////////////////////
func void ZS_ArenaMasterNpcSend()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaMasterNpcSend");

	B_SetPerception(self);

	B_Arena_FinishFight();
	B_Arena_UnselectFight();
	B_Arena_SelectFight();

	//-----------------------------------
	AI_StartState(self, ZS_Stand, 1, "");
};

//////////////////////////////////////////////////////////////////////////////////////
//	ZS_ArenaMasterNpc
//	-----------------
//	TA des Arenameisters, wenn er einen Arena-Kampf zwischen zwei NSCs beaufsichtigt
//////////////////////////////////////////////////////////////////////////////////////
func void ZS_ArenaMasterNpc()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaMasterNpc");

	//  Wahrnehmungen aktiv
	Npc_PercEnable(self, PERC_ASSESSENEMY, B_AssessEnemy);
	Npc_PercEnable(self, PERC_ASSESSPLAYER, B_Arena_AssessSC);
	Npc_SetPercTime(self, 1);

	// Wahrnehmungen passiv
	Npc_PercEnable(self, PERC_ASSESSDAMAGE, ZS_ReactToDamage);
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_PercEnable(self, PERC_ASSESSCASTER, B_ArenaMaster_AssessCaster);
	Npc_PercEnable(self, PERC_ASSESSMURDER, B_ArenaMaster_AssessMurder);
	Npc_PercEnable(self, PERC_ASSESSDEFEAT, B_ArenaMaster_AssessDefeat);
	Npc_PercEnable(self, PERC_ASSESSTALK, B_AssessTalk);

	B_Arena_FinishFight();
	B_Arena_UnselectFight();
	B_Arena_SelectFight();

	AI_SetWalkMode(self, NPC_WALK);

	B_Arena_StartFight();
};

func int ZS_ArenaMasterNpc_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_ArenaMasterNpc_Loop");

	//-------- Sitzgelegenheit suchen ! --------
	if (!C_BodyStateContains(self, BS_SIT))
	{
		PrintDebugNpc(PD_TA_CHECK, "...NSC sitzt noch nicht!");
		if ((Wld_IsMobAvailable(self, SCEMENAME_BENCH))
		&& (Npc_GetDistToWP(self, self.wp) < 600))
		{
			PrintDebugNpc(PD_TA_CHECK, "...kl. Thron gefunden!");
			_ = AI_UseMob(self, SCEMENAME_BENCH, 1);			// Benutze den Mob einmal bis zum angegebenen State
		}
		else
		{
			B_GotoNearWP(self, self.wp);
			_ = AI_UseMob(self, "CHAIR", 1);			// Benutze den Mob einmal bis zum angegebenen State
		};
	}

	//-------- Zufalls-Animationen spielen ! --------
	else
	{
		var int sitreaktion;
		sitreaktion = Hlp_Random(100);
		PrintDebugInt(PD_TA_DETAIL, "...Zufallsani-Wurf: ", sitreaktion);
		if (sitreaktion >= 75)
		{
			AI_PlayAniBS(self, "R_BENCH_RANDOM_1", BS_SIT);
		}
		else if (sitreaktion >= 50)
		{
			AI_PlayAniBS(self, "R_BENCH_RANDOM_2", BS_SIT);
		}
		else if (sitreaktion >= 25)
		{
			AI_PlayAniBS(self, "R_BENCH_RANDOM_3", BS_SIT);
		}
		else
		{
			AI_PlayAniBS(self, "R_BENCH_RANDOM_4", BS_SIT);
		};
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_ArenaMasterNpc_End()
{
	PrintDebugNpc(PD_TA_frame, "ZS_ArenaMasterNpc_End");

	_ = AI_UseMob(self, "SMALL THRONE", -1);
};

//////////////////////////////////////////////////////////////////////////////////////
//	ZS_ArenaMasterSleep
//	-------------------
//	Schlaf-TA des Arenameisters. Er schickt vorher die NSC-Arenakämpfer nach hause
//////////////////////////////////////////////////////////////////////////////////////
func void ZS_ArenaMasterSleep()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaMasterSleep");

	B_SetPerception(self);
	Npc_PercEnable(self, PERC_ASSESSFIGHTER, B_ArenaMaster_AssessFighter);
	Npc_PercEnable(self, PERC_DRAWWEAPON, B_ArenaMaster_AssessFighter);

	B_Arena_FinishFight();
	B_Arena_UnselectFight();

	//-----------------------------------
	AI_SetWalkMode(self, NPC_WALK);
	AI_GotoWP(self, self.wp);
	AI_StartState(self, ZS_Sleep, 1, "");
};

func void B_ArenaMaster_AssessFighter()
{
	PrintDebugNpc(PD_TA_FRAME, "B_ArenaMaster_AssessFighter");

	if (Wld_IsTime(ARENAEND_H, ARENAEND_M, ARENAEND_H, ARENAEND_M + 15))
	{
		return;
	}
	else
	{
		B_AssessFighter();
	};
};

func void B_ArenaMaster_AssessMurder()
{
	PrintDebugNpc(PD_TA_FRAME, "B_ArenaMaster_AssessMurder");

	if (Npc_IsInRoutine(victim, ZS_ArenaFight))
	{
		PrintDebugNpc(PD_ZS_FRAME, "...Mord an Co-Gladiator!");
		B_Arena_AbortFight(AF_PLAYERKILLED);
	}
	else
	{
		PrintDebugNpc(PD_ZS_FRAME, "...normaler Mord!");
		B_FullStop(self);
		AI_StartState(self, ZS_AssessMurder, 0, "");
	};
};

func void B_ArenaMaster_AssessDefeat()
{
	PrintDebugNpc(PD_TA_FRAME, "B_ArenaMaster_AssessDefeat");
};

func void B_ArenaMaster_AssessCaster()
{
	PrintDebugNpc(PD_TA_FRAME, "B_ArenaMaster_AssessCaster");

	if (Npc_IsInRoutine(victim, ZS_ArenaFight))
	{
		PrintDebugNpc(PD_ZS_FRAME, "...Magie während Arenakampf!");
		B_Arena_AbortFight(AF_PLAYERUSEDMAGIC);
	}
	else
	{
		PrintDebugNpc(PD_ZS_FRAME, "...normale Magiebenutzung!");
		B_FullStop(self);
		B_AssessCaster();
	};
};

//////////////////////////////////////////////////////////////////////////////////////
//	ZS_ArenaMasterStartFight
//	------------------------
//	Arenameister bewegt sich zu seinem Platz in der Arena, wartet bis der Spieler
//	ungültige Bereiche verlassen hat. Dann
//	- schliesst er das Tor
//	- Hält seine Eröffnungsrede
//	- setzt sich auf seinen Thron
//////////////////////////////////////////////////////////////////////////////////////
func int B_Arena_IsPlayerPositionValid()
{
	//-------- SC kämpft --------
	if (Arena_PlayerFight)
	{
		if (((Grim_Challenged || Brutus_Challenged || Thora_Challenged) && (Npc_GetDistToWP(hero, ARENA_WP_LEFT_START) < 200))
		|| ((Goliath_Challenged || Malgar_Challenged) && (Npc_GetDistToWP(hero, ARENA_WP_RIGHT_START) < 200)))
		{
			return TRUE;
		};
	}

	//-------- NSCs kämpfen --------
	else
	{
		if (((Npc_GetDistToWP(hero, ARENA_WP_CENTER) > ARENA_CENTER_AREA) || (Npc_GetDistToWP(hero, ARENA_WP_THRONE) < ARENA_THRONE_AREA))
		&& (Npc_GetDistToWP(hero, ARENA_WP_CHAMBERS) > ARENA_CHAMBERS_AREA)
		&& (Npc_GetDistToWP(hero, ARENA_WP_PREAREA) > ARENA_PREAREA_AREA))
		{
			return TRUE;
		};
	};

	return FALSE;
};

func void ZS_ArenaMasterStartFight()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_ArenaMasterStartFight");

	B_SetArenaPerception(self);

	B_GotoNearWP(self, self.wp);
};

func int ZS_ArenaMasterStartFight_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP, "ZS_ArenaMasterStartFight_Loop");

	if (B_Arena_IsPlayerPositionValid())
	{
		return LOOP_END;
	};

	AI_Wait(self, 1);

	return LOOP_CONTINUE;
};

func void ZS_ArenaMasterStartFight_End()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_ArenaMasterStartFight_End");

	if (B_Arena_IsPlayerPositionValid())
	{
		AI_StandUp(self);
		_ = AI_UseMob(self, "VWHEEL", 1);
		_ = AI_UseMob(self, "VWHEEL", 0);
		_ = AI_UseMob(self, "VWHEEL", -1);

		AI_SetWalkMode(self, NPC_WALK);
		AI_GotoWP(self, ARENA_WP_THRONE);
		AI_GotoFP(self, "MASTER");	//VORSICHT: Npc_IsOnFP("MASTER")-Abfrage für die Kampferöffnung!!!
		AI_AlignToFP(self);

		AI_Wait(self, 1);
		B_Arena_ProclaimStart(self);
		AI_Wait(self, 1);
	};
};
