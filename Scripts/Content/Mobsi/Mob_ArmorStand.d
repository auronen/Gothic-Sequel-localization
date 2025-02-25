func int MOB_ArmorStand_Condition()
{
	return TRUE;
	/*
	if (Npc_IsPlayer(self))
	{
		AI_PlayAni(self, "T_DONTKNOW");
		return FALSE;
	}
	else
	{
		return TRUE;
	};
	*/
};
