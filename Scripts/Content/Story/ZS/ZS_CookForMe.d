/*******************************************
*          NSC benutzt Bratpfanne          *
*******************************************/

func void ZS_CookForMe()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_CookForMe");

	B_SetPerception(self);

	if (!C_BodyStateContains(self, BS_MOBINTERACT))
	{
		AI_SetWalkMode(self, NPC_WALK);		// Walkmode für den Zustand
		if ((Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == 0))
		{
			AI_GotoWP(self, self.wp);
		};

		_ = AI_UseMob(self, "PAN", 1);			// Benutze den Mob einmal bis zum angegebenen State
	};
};

func int ZS_CookForMe_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_CookForMe_Loop");

	var int randomizer;
	randomizer = Hlp_Random(20);
	if (Npc_GetStateTime(self) >= 100 + randomizer)
	{
		B_InterruptMob("PAN");
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_CookForMe_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_CookForMe_End");

	_ = AI_UseMob(self, "PAN", -1);			// Stell die Pfanne weg
	AI_UseItem(self, ItFo_Mutton);
};
