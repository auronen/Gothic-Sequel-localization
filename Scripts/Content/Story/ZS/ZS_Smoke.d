/*******************************************
*            NSC benutzt Blubber           *
*  wenn keine Blubber da, raucht er Joint  *
*******************************************/

func void ZS_Smoke()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Smoke");

	B_SetPerception(self);
	AI_SetWalkMode(self, NPC_WALK);
	AI_GotoWP(self, self.wp);

	if (Wld_IsMobAvailable(self, SCEMENAME_WATERPIPE))
	{
		_ = AI_UseMob(self, SCEMENAME_WATERPIPE, 1);			// Benutze den Mob einmal bis zum angegebenen State
	}
	else
	{
		B_GotoFP(self, "STAND");
		B_ChooseJoint(self);
	};
};

func int ZS_Smoke_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Smoke_Loop");
	return LOOP_CONTINUE;
};

func void ZS_Smoke_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Smoke_End");

	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_JOINT)
	{
		AI_UseItemToState(self, ItMiJoint_1, -1);
	}
	else
	{
		_ = AI_UseMob(self, SCEMENAME_WATERPIPE, -1);			// Lösen vom Mobsi bei verlassen des Zustandes, wegen Zeit oder Reaktion
	};
};
