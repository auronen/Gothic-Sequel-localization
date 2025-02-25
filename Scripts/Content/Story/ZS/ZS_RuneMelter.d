/*******************************************
*          NSC benutzt den Runenschmelzer  *
*******************************************/

func void ZS_MeltRune()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_MeltRune");

	B_SetPerception(self);

	if (self.aivar[AIV_DONTUSEMOB] == 1)
	{
		self.aivar[AIV_DONTUSEMOB] = 0;
	}
	else
	{
		B_StartUseMob(self, SCEMENAME_RUNEMELTER);
		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Pliers);
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_OreNugget);
	};
};

func int ZS_MeltRune_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_MeltRune_Loop");

	if ((self.aivar[AIV_ACTIVEMOBSI] != AIV_AM_RUNEMELTER)
	&& !C_BodyStateContains(self, BS_MOBINTERACT))
	{
		PrintDebugNpc(PD_TA_LOOP, "...falsches oder kein Mobsi");
		return LOOP_END;
	};

	var int randomizer;
	randomizer = Hlp_Random(20);

	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_OreNugget);
	AI_PlayAni(self, "T_RMAKER_RANDOM_1");
	AI_Wait(self, 1);
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItAr_RuneBlank);
	AI_PlayAni(self, "T_RMAKER_RANDOM_2");

	if (Npc_GetStateTime(self) >= 50 + randomizer)
	{
		B_InterruptMob(SCEMENAME_RUNEMELTER);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_MeltRune_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_MeltRune_End");

	B_StopUseMob(self, SCEMENAME_RUNEMELTER);
};
