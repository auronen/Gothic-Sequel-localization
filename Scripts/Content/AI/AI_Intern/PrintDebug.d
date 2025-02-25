//########################################################################
//##
//##		PrintDebug-System
//##
//########################################################################

//-------- PrintDebug-Kanäle --------
	const int PD_TA_FRAME								= 1;
	const int PD_TA_LOOP								= 2;
	const int PD_TA_CHECK								= 3;
	const int PD_TA_DETAIL								= 4;

	const int PD_ZS_FRAME								= 6;
	const int PD_ZS_LOOP								= 7;
	const int PD_ZS_CHECK								= 8;
	const int PD_ZS_DETAIL								= 9;

	const int PD_MST_FRAME								= 11;
	const int PD_MST_LOOP								= 12;
	const int PD_MST_CHECK								= 13;
	const int PD_MST_DETAIL								= 14;

	const int PD_ORC_FRAME								= 16;
	const int PD_ORC_LOOP								= 17;
	const int PD_ORC_CHECK								= 18;
	const int PD_ORC_DETAIL								= 19;

	const int PD_MISSION								= 21;
	const int PD_CUTSCENE								= 22;
	const int PD_SPELL									= 23;
	const int PD_ITEM_MOBSI								= 24;
	const int PD_MAGIC									= 25;

//////////////////////////////////////////////////////////////////////////
//	PrintDebugNpc
//	-------------
//	Gibt eine Debug-Meldung im zSpy aus. Dabei muß in 'type' ein
//	Debug-Channel und in 'text' der eigentliche Meldungstext übergeben
//	werden.
//	Die Meldung erscheint im Format:
//
//		"U:Skript: ### <NSC-Name> ### -> <Meldung>
//
//	also zum Beispiel
//
//		U:Skript: ### Snapper ### -> ZS_MONSTER_AssessThreat
//
//////////////////////////////////////////////////////////////////////////
func void PrintDebugNpc(var int type, var string text)
{
	var string pipe;
	var int instance_id;
	instance_id = self.id;
	var string inst_id;
	inst_id = IntToString(instance_id);

	pipe = ConcatStrings("### ", self.name);
	pipe = ConcatStrings(pipe, "(");
	pipe = ConcatStrings(pipe, inst_id);
	pipe = ConcatStrings(pipe, ")");
	pipe = ConcatStrings(pipe, " ### -> ");
	pipe = ConcatStrings(pipe, text);

	PrintDebugInstCh(type, pipe);
};

//////////////////////////////////////////////////////////////////////////
//	PrintDebugMobsi
//	---------------
//	Gibt 'text' als Debug-Meldung im zSpy aus. Die Meldung erscheint
//	im Format:
//
//		"U:Skript: ### <Benutzer> ### -> <Meldung>
//
//	also zum Beispiel
//
//		U:Skript: ### PC_Hero ### -> Benutzt Esse
//
//////////////////////////////////////////////////////////////////////////
func void PrintDebugMobsi(var string text)
{
	var string pipe;
	var int instance_id;
	instance_id = self.id;
	var string inst_id;
	inst_id = IntToString(instance_id);

	pipe = ConcatStrings("### ", self.name);
	pipe = ConcatStrings(pipe, "(");
	pipe = ConcatStrings(pipe, inst_id);
	pipe = ConcatStrings(pipe, ")");
	pipe = ConcatStrings(pipe, " ### -> ");
	pipe = ConcatStrings(pipe, text);

	PrintDebugCh(PD_ITEM_MOBSI, pipe);
};

//////////////////////////////////////////////////////////////////////////
//	PrintGlobals
//	------------
//	Gibt die aktuellen Globals auf dem zSpy aus
//////////////////////////////////////////////////////////////////////////
func void PrintGlobals(var int channel)
{
	var string pipe;
	PrintDebugNpc(channel, "PrintGlobals");
	//-------- global 'self' --------
	if (Hlp_IsValidNpc(self))
	{
		pipe = ConcatStrings("...self:   ", self.name);
		PrintDebugNpc(channel, pipe);
	};

	//-------- global 'other' --------
	if (Hlp_IsValidNpc(other))
	{
		pipe = ConcatStrings("...other:  ", other.name);
		PrintDebugNpc(channel, pipe);
	};

	//-------- global 'victim' --------
	if (Hlp_IsValidNpc(victim))
	{
		pipe = ConcatStrings("...victim: ", victim.name);
		PrintDebugNpc(channel, pipe);
	};

	//-------- global 'hero' --------
	if (Hlp_IsValidNpc(hero))
	{
		pipe = ConcatStrings("...hero:   ", hero.name);
		PrintDebugNpc(channel, pipe);
	};

	//-------- global 'item' --------
	if (Hlp_IsValidItem(item))
	{
		pipe = ConcatStrings("...item:   ", item.name);
		PrintDebugNpc(channel, pipe);
	};
};

//////////////////////////////////////////////////////////////////////////
//	PrintGuild
//	----------
//	Gibt den Namen der Angegebenen Gilde auf dem zSpy aus
//////////////////////////////////////////////////////////////////////////
func void PrintGuild(var int channel, var int guild)
{
	PrintDebugNpc(channel, "PrintGuild");

	if (guild == GIL_NONE) { PrintDebugNpc(channel, "...Gilde: GIL_NONE"); };
	if (guild == GIL_MILITIA) { PrintDebugNpc(channel, "...Gilde: GIL_MILITIA"); };
	if (guild == GIL_WORKER) { PrintDebugNpc(channel, "...Gilde: GIL_WORKER"); };
	if (guild == GIL_HEALER) { PrintDebugNpc(channel, "...Gilde: GIL_HEALER"); };
	if (guild == GIL_THIEF) { PrintDebugNpc(channel, "...Gilde: GIL_THIEF"); };
	if (guild == GIL_POSSESSED) { PrintDebugNpc(channel, "...Gilde: GIL_POSSESSED"); };
	if (guild == GIL_BEGGAR) { PrintDebugNpc(channel, "...Gilde: GIL_BEGGAR"); };
	if (guild == GIL_DEMONIC) { PrintDebugNpc(channel, "...Gilde: GIL_DEMONIC"); };
	if (guild == GIL_AMAZON) { PrintDebugNpc(channel, "...Gilde: GIL_AMAZON"); };
	if (guild == GIL_PALADIN) { PrintDebugNpc(channel, "...Gilde: GIL_PALADIN"); };
	if (guild == GIL_KDF) { PrintDebugNpc(channel, "...Gilde: GIL_KDF		"); };
	if (guild == GIL_BLOODEARTH) { PrintDebugNpc(channel, "...Gilde: GIL_BLOODEARTH"); };
	if (guild == GIL_MINER) { PrintDebugNpc(channel, "...Gilde: GIL_MINER"); };
};

//////////////////////////////////////////////////////////////////////////
//	PrintAttitudes
//	--------------
//	Gibt die Attitüden von 'self' auf dem zSpy aus
//////////////////////////////////////////////////////////////////////////
func void PrintAttitudes(var int channel)
{
	PrintDebugNpc(channel, "PrintAttitudes");

	// Initialisierung der lokalen Hilfsvariablen
	var int temp_attitude;
	var int perm_attitude;

	// Zuweisung der Variablen
	temp_attitude = Npc_GetAttitude(self, hero);
	perm_attitude = Npc_GetPermAttitude(self, hero);

	// Check Block auf temporäre Attitüde des Nsc´s
	if (temp_attitude == ATT_HOSTILE)
	{
		PrintDebugNpc(channel, "TempAttitude == ATT_HOSTILE");
	};

	if (temp_attitude == ATT_ANGRY)
	{
		PrintDebugNpc(channel, "TempAttitude == ATT_ANGRY");
	};

	if (temp_attitude == ATT_NEUTRAL)
	{
		PrintDebugNpc(channel, "TempAttitude == ATT_NEUTRAL");
	};

	if (temp_attitude == ATT_FRIENDLY)
	{
		PrintDebugNpc(channel, "TempAttitude == ATT_FRIENDLY");
	};

	if (perm_attitude == ATT_HOSTILE)
	{
		PrintDebugNpc(channel, "PermAttitude == ATT_HOSTILE");
	};

	if (perm_attitude == ATT_ANGRY)
	{
		PrintDebugNpc(channel, "PermAttitude == ATT_ANGRY");
	};

	if (perm_attitude == ATT_NEUTRAL)
	{
		PrintDebugNpc(channel, "PermAttitude == ATT_NEUTRAL");
	};

	if (perm_attitude == ATT_FRIENDLY)
	{
		PrintDebugNpc(channel, "PermAttitude == ATT_FRIENDLY");
	};
};

//////////////////////////////////////////////////////////////////////////
//	PrintDebugInt
//	-------------
//	Gibt eine INT-Variable 'value' und einen einleitenden Text 'preText'
//	auf dem zSpy (Kanal 'channel') aus.
//////////////////////////////////////////////////////////////////////////
func void PrintDebugInt(var int channel, var string preText, var int value)
{
	var string printText;
	printText = IntToString(value);
	printText = ConcatStrings(preText, printText);
	PrintDebugNpc(channel, printText);
};

//////////////////////////////////////////////////////////////////////////
//	PrintDebugString
//	----------------
//	Gibt eine STRING-Variable 'text' und einen einleitenden Text 'preText'
//	auf dem zSpy (Kanal 'channel') aus.
//////////////////////////////////////////////////////////////////////////
func void PrintDebugString(var int channel, var string preText, var string text)
{
	PrintDebugNpc(channel, ConcatStrings(preText, text));
};

//////////////////////////////////////////////////////////////////////////
//	PrintArenaStatus
//	----------------
//	Gibt die aktuellen Globals auf dem zSpy aus
//////////////////////////////////////////////////////////////////////////
func void PrintArenaStatus(var int channel)
{
	var string pipe;
	PrintDebugNpc(channel, "PrintArenaStatus");

	PrintDebugInt(channel, "...Grim_Challenged: ", Grim_Challenged);
	PrintDebugInt(channel, "...Goliath_Challenged: ", Goliath_Challenged);
	PrintDebugInt(channel, "...Brutus_Challenged: ", Brutus_Challenged);
	PrintDebugInt(channel, "...Malgar_Challenged: ", Malgar_Challenged);
	PrintDebugInt(channel, "...Thora_Challenged: ", Thora_Challenged);
	PrintDebugInt(channel, "...Arenamaster_FirstDay: ", Arenamaster_FirstDay);
	PrintDebugInt(channel, "...Arenamaster_Accepted: ", Arenamaster_Accepted);
	PrintDebugInt(channel, "...Arena_NpcFight: ", Arena_NpcFight);
	PrintDebugInt(channel, "...Arena_NpcCombo: ", Arena_NpcCombo);
	PrintDebugInt(channel, "...Arena_NpcComboLast: ", Arena_NpcComboLast);
	PrintDebugInt(channel, "...Arena_PlayerFight: ", Arena_PlayerFight);
	PrintDebugInt(channel, "...Arena_PlayerHasCome: ", Arena_PlayerHasCome);
	PrintDebugInt(channel, "...Arena_PlayerPrize: ", Arena_PlayerPrize);
	PrintDebugInt(channel, "...Arena_PlayerHasWonToday: ", Arena_PlayerHasWonToday);
	PrintDebugInt(channel, "...Arena_PrizeBefore: ", Arena_PrizeBefore);
	PrintDebugInt(channel, "...Arena_FightSelected: ", Arena_FightSelected);
	PrintDebugInt(channel, "...Arena_FightDay: ", Arena_FightDay);
	PrintDebugInt(channel, "...Arena_FightRunning: ", Arena_FightRunning);
	PrintDebugInt(channel, "...Arena_SelectDay: ", Arena_SelectDay);
	PrintDebugInt(channel, "...Arena_AbortFight: ", Arena_AbortFight);
	PrintDebugInt(channel, "...Arena_PlayerShirked: ", Arena_PlayerShirked);
	PrintDebugInt(channel, "...Arena_PlayerStoleWeapon: ", Arena_PlayerStoleWeapon);
	PrintDebugInt(channel, "...Arena_PlayerUsedMagic: ", Arena_PlayerUsedMagic);
	PrintDebugInt(channel, "...Arena_PlayerUsedBow: ", Arena_PlayerUsedBow);
	PrintDebugInt(channel, "...Arena_PlayerKilled: ", Arena_PlayerKilled);
	PrintDebugInt(channel, "...Arena_PlayerBanned: ", Arena_PlayerBanned);
	PrintDebugInt(channel, "...Arena_GatesClosed: ", Arena_PlayerUsedBow);
};
