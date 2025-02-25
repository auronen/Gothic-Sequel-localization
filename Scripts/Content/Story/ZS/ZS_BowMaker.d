///////////////////////////////////////////////////////////////////////////////////////
// Bogenmachertisch von Nsc bedienen lassen
//////////////////////////////////////////////////////////////////////////////////////

func void ZS_BowMaker()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_BowMaker");

	B_SetPerception(self);

	if (self.aivar[AIV_DONTUSEMOB] == 1)
	{
		self.aivar[AIV_DONTUSEMOB] = 0;
	}
	else
	{
		B_StartUseMob(self, SCEMENAME_BOW);
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_BowWood);
	};
};

func int ZS_BowMaker_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_BowMaker_Loop");

	var int randomizer;
	randomizer = Hlp_Random(20);
	if (Wld_GetInteractMobState(self, SCEMENAME_BOW) == 1)
	{
		PrintDebugNpc(PD_TA_LOOP, "ZS_BowMaker_Loop ...Mob state");
		AI_PlayAni(self, "T_BOGENMACHER_RANDOM_1");
	};

	if (Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_BOW);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_BowMaker_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Bogenmacher_End");
	B_StopUseMob(self, SCEMENAME_BOW);
};
