/*******************************************
*          Schmied benutzt Amboss          *
*******************************************/

func void ZS_Smith_Anvil()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Smith_Anvil");

	// Item in Handslot erzeugen (Hammer)
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");

	B_SetPerception(self);
	B_StartUseMob(self, SCEMENAME_ANVIL);
	AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMw_SledgeHammer);
};

func int ZS_Smith_Anvil_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Smith_Anvil_Loop");
	//AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMw_SledgeHammer);
	if ((self.aivar[AIV_ACTIVEMOBSI] != AIV_AM_ANVIL)
	&& !C_BodyStateContains(self, BS_MOBINTERACT))
	{
		PrintDebugNpc(PD_TA_LOOP, "...falsches oder kein Mobsi");
		return LOOP_END;
	};

	var int randomizer;
	randomizer = Hlp_Random(20);

	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_HotIron);
	AI_PlayAni(self, "T_BSANVIL_RANDOM_1");

	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_HotSwordBlade);
	AI_PlayAni(self, "T_BSANVIL_RANDOM_2");

	if (Npc_GetStateTime(self) >= 50 + randomizer)
	{
		B_InterruptMob(SCEMENAME_ANVIL);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_Smith_Anvil_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Smith_Anvil_End");

	B_StopUseMob(self, SCEMENAME_ANVIL);
};
