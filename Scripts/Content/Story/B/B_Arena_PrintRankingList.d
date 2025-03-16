func void B_Arena_PrintGladiator(var int gladiatorInstance, var int gladiatorRanking)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_Arena_PrintGladiator");

	//-------- Gladiator-Instanz holen --------
	var C_Npc gladiator;
	gladiator = Hlp_GetNpc(gladiatorInstance);

	//-------- Zeile zusammenbauen --------
	var string msg_rank;
	msg_rank = ConcatStrings(_STR_MESSAGE_ARENARANK, IntToString(gladiatorRanking));

	var string msg_victories;
	msg_victories = IntToString(gladiator.aivar[AIV_ARENA_VICTORIES]);
	if (gladiator.aivar[AIV_ARENA_VICTORIES] != 1)
	{
		msg_victories = ConcatStrings(msg_victories, _STR_MESSAGE_ARENAVICTORIES);
	}
	else
	{
		msg_victories = ConcatStrings(msg_victories, _STR_MESSAGE_ARENAVICTORY);
	};

	//-------- Zeile ausgeben --------
	_ = PrintScreen(msg_rank,
	_XPOS_MESSAGE_ARENARANK,
	_YPOS_MESSAGE_ARENARANKING + _YPOS_MESSAGE_ARENARANKINGROW * gladiatorRanking,
	FONT_OLD_SMALL,
	_TIME_MESSAGE_ARENARANKING);

	_ = PrintScreen(gladiator.name,
	_XPOS_MESSAGE_ARENANAME,
	_YPOS_MESSAGE_ARENARANKING + _YPOS_MESSAGE_ARENARANKINGROW * gladiatorRanking,
	FONT_OLD_SMALL,
	_TIME_MESSAGE_ARENARANKING);

	_ = PrintScreen(msg_victories,
	_XPOS_MESSAGE_ARENAVICTORIES,
	_YPOS_MESSAGE_ARENARANKING + _YPOS_MESSAGE_ARENARANKINGROW * gladiatorRanking,
	FONT_OLD_SMALL,
	_TIME_MESSAGE_ARENARANKING);
};

// ermittelt den Ranglisten-Platz, wobei bei gleicher Anzahl Siege, auch zwei gleiche Plätze zurückgegeben werden
func int B_Arena_GetGladiatorVictoryRanking(var int gladiatorInstance)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_Arena_GetGladiatorVictoryRanking");

	var int g1_vic;
	var int g2_vic;
	var int g3_vic;
	var int g4_vic;
	var int g5_vic;
	var int pl_vic;
	var int gl_vic;

	//-------- Siege der Gladiatoren holen --------
	var C_Npc gladiator;
	pl_vic = hero.aivar[AIV_ARENA_VICTORIES];
	gladiator = Hlp_GetNpc(AMZ_900_Thora); g1_vic = gladiator.aivar[AIV_ARENA_VICTORIES];
	gladiator = Hlp_GetNpc(DMH_1302_Malgar); g2_vic = gladiator.aivar[AIV_ARENA_VICTORIES];
	gladiator = Hlp_GetNpc(MIL_121_Brutus); g3_vic = gladiator.aivar[AIV_ARENA_VICTORIES];
	gladiator = Hlp_GetNpc(WRK_216_Goliath); g4_vic = gladiator.aivar[AIV_ARENA_VICTORIES];
	gladiator = Hlp_GetNpc(MIN_306_Grim); g5_vic = gladiator.aivar[AIV_ARENA_VICTORIES];
	gladiator = Hlp_GetNpc(gladiatorInstance); gl_vic = gladiator.aivar[AIV_ARENA_VICTORIES];

	var int worse;
	worse = 0;

	//-------- Vergleich --------
	if (gl_vic < pl_vic) { worse = worse + 1; };
	if (gl_vic < g1_vic) { worse = worse + 1; };
	if (gl_vic < g2_vic) { worse = worse + 1; };
	if (gl_vic < g3_vic) { worse = worse + 1; };
	if (gl_vic < g4_vic) { worse = worse + 1; };
	if (gl_vic < g5_vic) { worse = worse + 1; };
	PrintDebugString(PD_ZS_DETAIL, "...Gladiator: ", gladiator.name);
	PrintDebugInt(PD_ZS_DETAIL, "...schlechter als wieviel andere: ", worse);

	return(worse + 1);
};

// ermittelt den korrekten Ranglisten-Platz, wobei bei jeder Platz nur einmal vergeben ist (auch bei gleicher Anzahl Siege)
func int B_Arena_GetGladiatorRanking(var int gladiatorInstance)
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_Arena_GetGladiatorRanking");

	var int rank;
	rank = 0;

	if (B_Arena_GetGladiatorVictoryRanking(AMZ_900_Thora) == 1)		{ rank = rank + 1;if (gladiatorInstance == AMZ_900_Thora) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(DMH_1302_Malgar) == 1)	{ rank = rank + 1;if (gladiatorInstance == DMH_1302_Malgar) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIL_121_Brutus) == 1)	{ rank = rank + 1;if (gladiatorInstance == MIL_121_Brutus) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(WRK_216_Goliath) == 1)	{ rank = rank + 1;if (gladiatorInstance == WRK_216_Goliath) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIN_306_Grim) == 1)		{ rank = rank + 1;if (gladiatorInstance == MIN_306_Grim) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(PC_Hero) == 1)			{ rank = rank + 1;if (gladiatorInstance == PC_Hero) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(AMZ_900_Thora) == 2)		{ rank = rank + 1;if (gladiatorInstance == AMZ_900_Thora) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(DMH_1302_Malgar) == 2)	{ rank = rank + 1;if (gladiatorInstance == DMH_1302_Malgar) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIL_121_Brutus) == 2)	{ rank = rank + 1;if (gladiatorInstance == MIL_121_Brutus) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(WRK_216_Goliath) == 2)	{ rank = rank + 1;if (gladiatorInstance == WRK_216_Goliath) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIN_306_Grim) == 2)		{ rank = rank + 1;if (gladiatorInstance == MIN_306_Grim) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(PC_Hero) == 2)			{ rank = rank + 1;if (gladiatorInstance == PC_Hero) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(AMZ_900_Thora) == 3)		{ rank = rank + 1;if (gladiatorInstance == AMZ_900_Thora) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(DMH_1302_Malgar) == 3)	{ rank = rank + 1;if (gladiatorInstance == DMH_1302_Malgar) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIL_121_Brutus) == 3)	{ rank = rank + 1;if (gladiatorInstance == MIL_121_Brutus) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(WRK_216_Goliath) == 3)	{ rank = rank + 1;if (gladiatorInstance == WRK_216_Goliath) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIN_306_Grim) == 3)		{ rank = rank + 1;if (gladiatorInstance == MIN_306_Grim) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(PC_Hero) == 3)			{ rank = rank + 1;if (gladiatorInstance == PC_Hero) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(AMZ_900_Thora) == 4)		{ rank = rank + 1;if (gladiatorInstance == AMZ_900_Thora) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(DMH_1302_Malgar) == 4)	{ rank = rank + 1;if (gladiatorInstance == DMH_1302_Malgar) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIL_121_Brutus) == 4)	{ rank = rank + 1;if (gladiatorInstance == MIL_121_Brutus) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(WRK_216_Goliath) == 4)	{ rank = rank + 1;if (gladiatorInstance == WRK_216_Goliath) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIN_306_Grim) == 4)		{ rank = rank + 1;if (gladiatorInstance == MIN_306_Grim) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(PC_Hero) == 4)			{ rank = rank + 1;if (gladiatorInstance == PC_Hero) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(AMZ_900_Thora) == 5)		{ rank = rank + 1;if (gladiatorInstance == AMZ_900_Thora) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(DMH_1302_Malgar) == 5)	{ rank = rank + 1;if (gladiatorInstance == DMH_1302_Malgar) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIL_121_Brutus) == 5)	{ rank = rank + 1;if (gladiatorInstance == MIL_121_Brutus) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(WRK_216_Goliath) == 5)	{ rank = rank + 1;if (gladiatorInstance == WRK_216_Goliath) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIN_306_Grim) == 5)		{ rank = rank + 1;if (gladiatorInstance == MIN_306_Grim) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(PC_Hero) == 5)			{ rank = rank + 1;if (gladiatorInstance == PC_Hero) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(AMZ_900_Thora) == 6)		{ rank = rank + 1;if (gladiatorInstance == AMZ_900_Thora) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(DMH_1302_Malgar) == 6)	{ rank = rank + 1;if (gladiatorInstance == DMH_1302_Malgar) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIL_121_Brutus) == 6)	{ rank = rank + 1;if (gladiatorInstance == MIL_121_Brutus) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(WRK_216_Goliath) == 6)	{ rank = rank + 1;if (gladiatorInstance == WRK_216_Goliath) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(MIN_306_Grim) == 6)		{ rank = rank + 1;if (gladiatorInstance == MIN_306_Grim) { return rank; }; };
	if (B_Arena_GetGladiatorVictoryRanking(PC_Hero) == 6)			{ rank = rank + 1;if (gladiatorInstance == PC_Hero) { return rank; }; };
	return rank;
};

func void B_Arena_PrintRankingList()
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_Arena_PrintRankingList");

	var int rank;
	rank = 1;

	B_Arena_PrintGladiator(AMZ_900_Thora, B_Arena_GetGladiatorRanking(AMZ_900_Thora));
	B_Arena_PrintGladiator(DMH_1302_Malgar, B_Arena_GetGladiatorRanking(DMH_1302_Malgar));
	B_Arena_PrintGladiator(MIL_121_Brutus, B_Arena_GetGladiatorRanking(MIL_121_Brutus));
	B_Arena_PrintGladiator(WRK_216_Goliath, B_Arena_GetGladiatorRanking(WRK_216_Goliath));
	B_Arena_PrintGladiator(MIN_306_Grim, B_Arena_GetGladiatorRanking(MIN_306_Grim));
	B_Arena_PrintGladiator(PC_Hero, B_Arena_GetGladiatorRanking(PC_Hero));
};

/*
func C_NPC B_Arena_GetRankingGladiator(var int rank)
{
	if (B_Arena_GetGladiatorRanking(AMZ_900_Thora) == rank) { return AMZ_900_Thora; };
	if (B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == rank) { return DMH_1302_Malgar; };
	if (B_Arena_GetGladiatorRanking(MIL_121_Brutus) == rank) { return MIL_121_Brutus; };
	if (B_Arena_GetGladiatorRanking(WRK_216_Goliath) == rank) { return WRK_216_Goliath; };
	if (B_Arena_GetGladiatorRanking(MIN_306_Grim) == rank) { return MIN_306_Grim; };
	if (B_Arena_GetGladiatorRanking(PC_Hero) == rank) { return PC_Hero; };
	// return - 1;
};
*/
