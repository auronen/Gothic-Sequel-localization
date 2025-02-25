///////////////////////////////////////////////////////////////////////
//	B_LunchTimeAtHalvors
//	--------------------
//	Ermittelt, ob der NSC gerade in der Burgküche isst!
///////////////////////////////////////////////////////////////////////
func int B_LunchTimeAtHalvors()
{
	PrintDebugNpc(PD_ZS_DETAIL, "B_LunchTimeAtHalvors");

	if (Npc_KnowsInfo(hero, WRK_227_Snaf_IGO) 					// Auftrag von Snaf erhalten!
	&& !Snaf_CustomerQuestSolved								// ...aber noch nicht erledigt
	&& (Npc_GetDistToWP(self, "OCC_CONVOY_01") < 1000))
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "...FALSE");
		return FALSE;
	};
};
