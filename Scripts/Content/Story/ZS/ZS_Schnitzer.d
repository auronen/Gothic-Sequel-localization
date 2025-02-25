//////////////////////////////////////////////////////////////
// Zustand, der das Pfeilschnitzer Mobsi benutzt			//
//////////////////////////////////////////////////////////////
func void ZS_Schnitzer()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Schnitzer");

	B_SetPerception(self);
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");

	if (self.aivar[AIV_DONTUSEMOB] == 1)
	{
		self.aivar[AIV_DONTUSEMOB] = 0;
	}
	else
	{
		B_StartUseMob(self, SCEMENAME_FLETCHER);
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_FletcherWood);
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ITMI_FletcherKnife);
	};
};

func int ZS_Schnitzer_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Schnitzer_Loop");

	var int randomizer;
	randomizer = Hlp_Random(20);

	if (Wld_GetInteractMobState(self, SCEMENAME_FLETCHER) == 1)
	{
		// ANi Pfeilschnitzen
		AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
	};

	// Von Zeit zu Zeit mal auflockern
	if (Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_FLETCHER);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_Schnitzer_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Schnitzer_End");
	B_StopUseMob(self, SCEMENAME_FLETCHER);
};
