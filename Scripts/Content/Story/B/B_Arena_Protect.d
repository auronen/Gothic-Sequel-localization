//////////////////////////////////////////////////////////////////////////
//	B_Arena_Protect
//	===============
//	Versieht Gladiatoren mit zusätzlichen Rüstungspunkten, damit die
//	kämpfe etwas länger dauern!
//////////////////////////////////////////////////////////////////////////
func void B_Arena_Protect(var int npcInstance)
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_Protect");

	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);

	//-------- schützen --------
	npc.protection[DAM_EDGE] = npc.protection[DAM_EDGE] + ARENA_PROTECTION;
};

//////////////////////////////////////////////////////////////////////////
//	B_Arena_Unprotect
//	=================
//	Löscht die zusätzlichen Rüstungspunkten der Gladiatoren wieder
//////////////////////////////////////////////////////////////////////////
func void B_Arena_Unprotect(var int npcInstance)
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_Unprotect");

	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);

	//-------- schützen --------
	npc.protection[DAM_EDGE] = npc.protection[DAM_EDGE] - ARENA_PROTECTION;
};
