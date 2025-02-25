func int B_ReperationDone()
{
	PrintDebugNpc(PD_ZS_CHECK, "ReparationDone");
	var C_Npc talamon;
	talamon = Hlp_GetNpc(HLR_501_Talamon);
	if (int_ReparationRunning == int_MiltenRep)
	{
		if (Npc_HasItems(talamon, ItFo_Potion_Health_01) >= 5)
		{
			return TRUE;
		};

		return FALSE;
	};

	if (int_ReparationRunning == int_GornRep)
	{
		if (Npc_HasItems(talamon, ItFo_Potion_Health_01) >= 5)
		{
			return TRUE;
		};

		return FALSE;
	};

	if (int_ReparationRunning == int_LesterRep)
	{
		if (Npc_HasItems(talamon, ItFo_Potion_Health_01) >= 5)
		{
			return TRUE;
		};

		return FALSE;
	};

	if (int_ReparationRunning == int_DiegoRep)
	{
		if (Npc_HasItems(talamon, ItFo_Potion_Health_01) >= 5)
		{
			return TRUE;
		};

		return FALSE;
	};

	return FALSE;
};
