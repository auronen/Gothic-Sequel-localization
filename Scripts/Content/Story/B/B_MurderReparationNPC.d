func int B_MurderReparationNpc()
{
	PrintDebugNpc(PD_ZS_CHECK, "ReparationReceiver_Condition");
	var C_Npc talamon;
	talamon = Hlp_GetNpc(Hlr_501_talamon);
	if (B_CompareNpcInstance(self, talamon))
	{
		return TRUE;
	};

	return FALSE;
};
