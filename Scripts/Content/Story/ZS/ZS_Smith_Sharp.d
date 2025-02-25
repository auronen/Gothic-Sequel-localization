/*******************************************
*      Schmied benutzt Schleifstein        *
*******************************************/

func void ZS_Smith_Sharp()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Smith_Sharp");

	B_SetPerception(self);

	B_StartUseMob(self, SCEMENAME_SHARP);
};

func int ZS_Smith_Sharp_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Smith_Sharp_Loop");

	if ((self.aivar[AIV_ACTIVEMOBSI] != AIV_AM_SHARP)
	&& !C_BodyStateContains(self, BS_MOBINTERACT))
	{
		PrintDebugNpc(PD_TA_LOOP, "...falsches oder kein Mobsi");
		return LOOP_END;
	};

	var int randomizer;
	randomizer = Hlp_Random(20);

	if (Npc_GetStateTime(self) >= 5 + randomizer)
	{
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_Swordblade);
		AI_PlayAni(self, "T_BSSHARP_RANDOM_1");

		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMw_MilitiaSword);
		AI_PlayAni(self, "T_BSSHARP_RANDOM_2");
	};

	if (Npc_GetStateTime(self) >= 50 + randomizer)
	{
		B_InterruptMob(SCEMENAME_SHARP);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_Smith_Sharp_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Smith_Sharp_End");

	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");

	B_StopUseMob(self, SCEMENAME_SHARP);
};

////////////////////////////////////////////////////////////////////////
//	ZS_Smith_Sharp()-Vorschaltung für Gladiatoren!
////////////////////////////////////////////////////////////////////////
func void ZS_ArenaSmith_Sharp()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaSmith_Sharp");

	B_SetPerception(self);

	B_Arena_RegainDroppedWeapon(Hlp_GetInstanceID(self));

	AI_StartState(self, ZS_Smith_Sharp, 1, "");
};
