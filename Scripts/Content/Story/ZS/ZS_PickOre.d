/*******************************************
*          NSC kloppt an Erzmobsi          *
*******************************************/

func void ZS_PickOre()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_PickOre");

	B_SetPerception(self);

	if (self.aivar[AIV_DONTUSEMOB] == 1)
	{
		self.aivar[AIV_DONTUSEMOB] = 0;
	}
	else
	{
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMw_PickAxe);
		B_StartUseMob(self, SCEMENAME_ORE);
	};
};

func int ZS_PickOre_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_PickOre_Loop");
	PrintAttitudes(PD_TA_LOOP);

	var int randomizer;
	randomizer = Hlp_Random(20);
	// Ani nur abspielen, wenn auch am Mobsi, weil sonst die Ani in der Luft gemacht wird
	if (Wld_GetInteractMobState(self, SCEMENAME_ORE) == 1)
	{
		PrintDebugNpc(PD_TA_LOOP, "ZS_PickOre_Loop ...Mob state");
		AI_PlayAni(self, "T_ORE_RANDOM_1");
	};

	if (Npc_GetStateTime(self) >= 100 + randomizer)
	{
		B_InterruptMob(SCEMENAME_ORE);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_PickOre_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_PickOre_End");

	B_StopUseMob(self, SCEMENAME_ORE);
};
