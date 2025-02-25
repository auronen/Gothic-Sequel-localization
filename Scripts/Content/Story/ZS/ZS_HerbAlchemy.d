/*******************************************
*          NSC benutzt Herbstomper         *
*******************************************/

func void ZS_HerbAlchemy()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_HerbAlchemy");

	B_SetPerception(self);

	if (self.aivar[AIV_DONTUSEMOB] == 1)
	{
		self.aivar[AIV_DONTUSEMOB] = 0;
	}
	else
	{
		B_StartUseMob(self, SCEMENAME_HERB);
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		PrintDebugNpc(PD_ZS_CHECK, "Hier sollte Item in Hand gehen");
		// Arbeitsmaterial für den Nsc in die Hand geben
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_Stomper);
	};

	/*
	if (!C_BodyStateContains(self, BS_MOBINTERACT))
	{
		AI_SetWalkMode(self, NPC_WALK);		// Walkmode für den Zustand
		if ((Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == 0))
		{
			AI_GotoWP(self, self.wp);
		};

		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");

		_ = AI_UseMob(self, SCEMENAME_HERB, 1);		// Benutze den Mob einmal bis zum angegebenen State

		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_Stomper);
	};
	*/
};

func int ZS_HerbAlchemy_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_HerbAlchemy_Loop");
	if (Wld_GetInteractMobState(self, SCEMENAME_HERB) == 1)
	{
		// Zwei Anis abspielen, stampfen(Random_1) ist häufiger, weil es dann besser aussieht
		var int int_helprandom;
		int_helprandom = Hlp_Random(11);
		if (int_helprandom < 8)
		{
			AI_PlayAni(self, "T_HERB_RANDOM_1");
		};

		if (int_helprandom > 8)
		{
			AI_PlayAni(self, "T_HERB_RANDOM_2");
		};
	};

	var int randomizer;
	randomizer = Hlp_Random(20);
	// Von Zeit zu Zeit mal auflockern
	if (Npc_GetStateTime(self) >= 100 + randomizer)
	{
		B_InterruptMob(SCEMENAME_STOMPER);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_HerbAlchemy_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_HerbAlchemy_End");
	B_StopUseMob(self, SCEMENAME_HERB);
};
