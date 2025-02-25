/*******************************************
*          NSC Sägt nen Baum klein         *
*******************************************/

func void ZS_SawWood()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_SawWood");

	B_SetPerception(self);

	if (self.aivar[AIV_DONTUSEMOB] == 1)
	{
		self.aivar[AIV_DONTUSEMOB] = 0;
	}
	else
	{
		B_StartUseMob(self, SCEMENAME_SAW);
		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	};
};

func int ZS_SawWood_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_SawWood_Loop");

	var int randomizer;
	randomizer = Hlp_Random(20);

	if (Npc_GetStateTime(self) >= 100 + randomizer)
	{
		B_InterruptMob(SCEMENAME_SAW);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_SawWood_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_SawWood_End");

	B_StopUseMob(self, SCEMENAME_SAW);
};
