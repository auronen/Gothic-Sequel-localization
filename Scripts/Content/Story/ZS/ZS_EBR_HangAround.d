/*******************************************
*      NSC setzt sich auf Erzbaronthron    *
*******************************************/

func void ZS_Ebr_HangAround()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Ebr_HangAround");

	ObservingPerception();
	if (!C_BodyStateContains(self, BS_SIT))
	{
		AI_SetWalkMode(self, NPC_WALK);		// Walkmode für den Zustand
		if ((Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == 0))
		{
			AI_GotoWP(self, self.wp);
		};

		_ = AI_UseMob(self, "THRONE", 1);		// Benutze den Mob einmal bis zum angegebenen State
	};
};

func int ZS_Ebr_HangAround_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Ebr_HangAround_Loop");

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_Ebr_HangAround_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Ebr_HangAround_End");

	_ = AI_UseMob(self, "THRONE", -1);
};
