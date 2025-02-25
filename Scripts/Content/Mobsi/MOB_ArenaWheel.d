//////////////////////////////////////////////////////////////////////////
//	MOb_ArenaWheel
//	==============
//	Sperrt das Drehkreuz in der Arena für den Spieler
//////////////////////////////////////////////////////////////////////////
func int MOB_ARENAWHEEL_CONDITION()
{
	PrintDebugCh(PD_ITEM_MOBSI, "### MOB_ARENAWHEEL_CONDITION");
	PrintGlobals(PD_ITEM_MOBSI);

	if (Npc_IsPlayer(self))
	{
		PrintDebugCh(PD_ITEM_MOBSI, "### ...nur Arenameister");
		AI_PlayAni(self, "T_DONTKNOW");
		_ = PrintScreen(_STR_MESSAGE_ARENAWHEEL, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
		return FALSE;
	}
	else
	{
		PrintDebugCh(PD_ITEM_MOBSI, "### ...OK");
		return TRUE;
	};
};

func void MOB_ARENAWHEEL_S0()
{
	PrintDebugCh(PD_ITEM_MOBSI, "### MOB_ARENAWHEEL_S0");

	//Arena_GatesClosed = FALSE;
};

func void MOB_ARENAWHEEL_S1()
{
	PrintDebugCh(PD_ITEM_MOBSI, "### MOB_ARENAWHEEL_S1");

	if (Arena_GatesClosed)
	{
		Arena_GatesClosed = FALSE;
		PrintDebugCh(PD_ITEM_MOBSI, "### ...gates opened");
	}
	else
	{
		Arena_GatesClosed = TRUE;
		PrintDebugCh(PD_ITEM_MOBSI, "### ...gates closed");
	};
};
