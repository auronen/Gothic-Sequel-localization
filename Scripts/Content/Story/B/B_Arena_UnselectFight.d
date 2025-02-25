//////////////////////////////////////////////////////////////////////////
//	B_Arena_UnselectFight
//	=====================
//	Macht alle mit B_Arena_SelectFight getätigten Aktionen wieder
//	rückgängig !
//////////////////////////////////////////////////////////////////////////
func void B_Arena_UnselectFight()
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_UnselectFight");

	var C_Npc arenamaster;
	arenamaster = Hlp_GetNpc(MIL_122_Arenamaster);

	//-------- Muss kampf erst beendet werden? --------
	if (Arena_FightRunning)
	{
		PrintDebugNpc(PD_TA_CHECK, "...Kampf muss erst beendet werden!");
		return;
	};

	//-------- wurde ein Kampf ausgewählt? --------
	if (!Arena_FightSelected) // es wurde garkein Kampf ausgewählt
	{
		PrintDebugNpc(PD_TA_CHECK, "...es wurde garkein Kampf ausgewählt!");
		return;
	};

	//-------- wurde der Kampf heute ausgewählt? --------
	if ((Arena_SelectDay == B_GetDay())
	&& ((Arena_FightDay < B_GetDay()) || Arena_FightRunning))
	{
		PrintDebugNpc(PD_TA_CHECK, "...der Kampf ist für heute ausgewählt!");
		return;
	};

	//-------- Zuschauer nach Hause schicken --------
	// VORSICHT: nur bei NSCs, die auch "Start" als Standard-TA haben!!!
	B_ExchangeRoutine(THF_405_Thief, "Start");
	B_ExchangeRoutine(THF_407_Thief, "Start");
	B_ExchangeRoutine(THF_408_Thief, "Start");
	B_ExchangeRoutine(THF_409_Pyro, "Start");

	B_ExchangeRoutine(WRK_206_Nicolos, "Start");

	B_ExchangeRoutine(THF_402_Karras, "Start");
	B_ExchangeRoutine(THF_406_Thief, "Start");
	B_ExchangeRoutine(BEG_705_Beggar, "Start");

	PrintDebugNpc(PD_TA_CHECK, "...Zuschauer nach Hause geschickt!");

	//-------- Flags bereinigen --------
	Arena_FightSelected = FALSE;

	if (Arena_PlayerFight)
	{
		Arena_PlayerFight = FALSE;

		Grim_Challenged = FALSE;
		Goliath_Challenged = FALSE;
		Brutus_Challenged = FALSE;
		Malgar_Challenged = FALSE;
		Thora_Challenged = FALSE;

		if (!Arena_PlayerHasCome)
		{
			Arena_PlayerShirked = TRUE;		// merken, daß sich der Spieler vor dem Arenakampf gedrückt hat
		};
	}
	else if (Arena_NpcFight)
	{
		if (Arena_NpcCombo == AC_GRIM_GOLIATH) { B_Arena_NpcScore(MIN_306_Grim, WRK_216_Goliath); };
		if (Arena_NpcCombo == AC_GOLIATH_BRUTUS) { B_Arena_NpcScore(MIL_121_Brutus, WRK_216_Goliath); };
		if (Arena_NpcCombo == AC_BRUTUS_MALGAR) { B_Arena_NpcScore(DMH_1302_Malgar, MIL_121_Brutus); };
		if (Arena_NpcCombo == AC_MALGAR_THORA) { B_Arena_NpcScore(AMZ_900_Thora, DMH_1302_Malgar); };

		Arena_NpcFight = FALSE;
		Arena_NpcComboLast = Arena_NpcCombo;
		Arena_NpcCombo = AC_NONE;
	};
};
