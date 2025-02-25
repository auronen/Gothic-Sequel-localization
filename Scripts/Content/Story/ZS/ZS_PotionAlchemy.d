/*******************************************
*             NSC braut Trank              *
*******************************************/

func void ZS_PotionAlchemy()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_PotionAlchemy");

	B_SetPerception(self);

	if (self.aivar[AIV_DONTUSEMOB] == 1)
	{
		self.aivar[AIV_DONTUSEMOB] = 0;
	}
	else
	{
		B_StartUseMob(self, SCEMENAME_LAB);
		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Flask);
	};
};

func int ZS_PotionAlchemy_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_PotionAlchemy_Loop");
	if (Wld_GetInteractMobState(self, SCEMENAME_LAB) == 1)
	{
		PrintDebugNpc(PD_TA_LOOP, "ZS_PotionAlchemy_Loop ...Mob state");
		AI_PlayAni(self, "T_LAB_RANDOM_1");
	};

	var int randomizer;
	randomizer = Hlp_Random(20);
	// Von Zeit zu Zeit mal auflockern
	if (Npc_GetStateTime(self) >= 100 + randomizer)
	{
		B_InterruptMob(SCEMENAME_LAB);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_PotionAlchemy_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_PotionAlchemy_End");
	B_StopUseMob(self, SCEMENAME_LAB);
};
