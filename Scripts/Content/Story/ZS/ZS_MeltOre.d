/*******************************************
*          NSC benutzt den Erzschmelzofen  *
*******************************************/

func void ZS_MeltOre()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_MeltOre");

	B_SetPerception(self);

	if (self.aivar[AIV_DONTUSEMOB] == 1)
	{
		self.aivar[AIV_DONTUSEMOB] = 0;
	}
	else
	{
		B_StartUseMob(self, SCEMENAME_MELTER);
		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_Pliers);
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_OreNugget);
	};
};

func int ZS_MeltOre_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_MeltOre_Loop");

	if ((self.aivar[AIV_ACTIVEMOBSI] != AIV_AM_MELTER)
	&& !C_BodyStateContains(self, BS_MOBINTERACT))
	{
		PrintDebugNpc(PD_TA_LOOP, "...falsches oder kein Mobsi");
		return LOOP_END;
	};

	var int randomizer;
	randomizer = Hlp_Random(20);

	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_OreNugget);
	AI_PlayAni(self, "T_BSMELTER_MELT_1");
	AI_Wait(self, 1);
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_HotIron);
	AI_PlayAni(self, "T_BSMELTER_MELT_2");

	if (Npc_GetStateTime(self) >= 50 + randomizer)
	{
		B_InterruptMob(SCEMENAME_MELTER);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_MeltOre_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_MeltOre_End");

	B_StopUseMob(self, SCEMENAME_MELTER);
};
