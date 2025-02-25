/*****************************************
* NSC sucht PLAYTUNE-FP und spielt Laute *
*****************************************/

func void ZS_PlayTune()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_PlayTune");

	B_SetPerception(self);
	AI_SetWalkMode(self, NPC_WALK);
	if (!Npc_IsOnFP(self, "PLAYTUNE")
	|| (Npc_GetDistToWP(self, self.wp) > 300))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
};

func int ZS_PlayTune_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_PlayTune_Loop");

	if (Npc_HasItems(self, ItMi_Lute) <= 1)
	{
		CreateInvItem(self, ItMi_Lute);
	};

	B_GotoFP(self, "PLAYTUNE");
	AI_AlignToFP(self);							// Richte Dich aus

	if (!C_BodyStateContains(self, BS_ITEMINTERACT))
	{
		AI_UseItemToState(self, ItMi_Lute, 1);
	};

	if (C_BodyStateContains(self, BS_ITEMINTERACT))
	{
		var int tunereaktion;
		tunereaktion = Hlp_Random(100);

		if (tunereaktion >= 50)
		{
			AI_PlayAniBS(self, "T_LUTE_RANDOM_1", BS_ITEMINTERACT);
		}
		else if (tunereaktion >= 00)
		{
			AI_PlayAniBS(self, "T_LUTE_RANDOM_2", BS_ITEMINTERACT);
		};
	};

	AI_AlignToFP(self);
	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_PlayTune_End()
{
	AI_UseItemToState(self, ItMi_Lute, -1);

	PrintDebugNpc(PD_TA_FRAME, "ZS_PlayTune_End");
};
