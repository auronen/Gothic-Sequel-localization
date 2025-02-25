//////////////////////////////////////////////////////////////////////////
//	B_Arena_NpcScore
//	===================
//	Unterroutine für B_Arena_FinishFight. Ermittelt, ob 'npcInstance1'
//	oder 'npcInstance2' gewonnen hat und zählt den Punktezähler des
//	Siegers um eins nach oben.
//////////////////////////////////////////////////////////////////////////
func void B_Arena_NpcScore(var int npcInstance1, var int npcInstance2)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_Arena_NpcScore");

	var C_Npc npc1;
	var C_Npc npc2;

	npc1 = Hlp_GetNpc(npcInstance1);
	npc2 = Hlp_GetNpc(npcInstance2);

	if (npc1.aivar[AIV_ARENA_POINTS] > npc2.aivar[AIV_ARENA_POINTS])
	{
		npc1.aivar[AIV_ARENA_VICTORIES] = npc1.aivar[AIV_ARENA_VICTORIES] + 1;
	};

	if (npc2.aivar[AIV_ARENA_POINTS] > npc1.aivar[AIV_ARENA_POINTS])
	{
		npc2.aivar[AIV_ARENA_VICTORIES] = npc2.aivar[AIV_ARENA_VICTORIES] + 1;
	};
};
