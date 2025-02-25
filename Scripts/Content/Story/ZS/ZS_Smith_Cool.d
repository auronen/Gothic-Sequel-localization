/*******************************************
*       Schmied benutzt Wassereimer        *
*******************************************/

func void ZS_Smith_Cool()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Smith_Cool");

	B_SetPerception(self);

	B_StartUseMob(self, SCEMENAME_COOL);
};

func int ZS_Smith_Cool_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Smith_Cool_Loop");

	if ((self.aivar[AIV_ACTIVEMOBSI] != AIV_AM_COOL)
	&& !C_BodyStateContains(self, BS_MOBINTERACT))
	{
		PrintDebugNpc(PD_TA_LOOP, "...falsches oder kein Mobsi");
		return LOOP_END;
	};

	var int randomizer;
	randomizer = Hlp_Random(20);

	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_HotSwordblade);
	AI_PlayAni(self, "T_BSCOOL_RANDOM_1");

	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_Swordblade);
	AI_PlayAni(self, "T_BSCOOL_RANDOM_2");

	if (Npc_GetStateTime(self) >= 50 + randomizer)
	{
		B_InterruptMob(SCEMENAME_COOL);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_Smith_Cool_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Smith_Cool_End");

	B_StopUseMob(self, SCEMENAME_COOL);
};
