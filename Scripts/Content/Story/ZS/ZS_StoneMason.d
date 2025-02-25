/********************************************
*          NSC kloppt 'nen Stein kaputt		*
********************************************/

func void ZS_StoneMason()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_StoneMason");

	B_SetPerception(self);

	if (self.aivar[AIV_DONTUSEMOB] == 1)
	{
		self.aivar[AIV_DONTUSEMOB] = 0;
	}
	else
	{
		B_StartUseMob(self, SCEMENAME_STONE);
		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	};
};

func int ZS_StoneMason_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_StoneMason_Loop");

	// Ani nur abspielen, wenn auch am Mobsi, weil sonst die Ani in der Luft gemacht wird
	if (Wld_GetInteractMobState(self, SCEMENAME_STONE) == 1)
	{
		PrintDebugNpc(PD_TA_LOOP, "ZS_SToneMason_Loop ...Mob state");
		var int int_random;
		int_random = Hlp_Random(10);
		if (int_random == 1)
		{
			AI_PlayAni(self, "T_STEINMETZ_RANDOM_1");
		};

		if (int_random == 2)
		{
			AI_PlayAni(self, "T_STEINMETZ_RANDOM_2");
		};
	};

	var int randomizer;
	randomizer = Hlp_Random(20);

	if (Npc_GetStateTime(self) >= 100 + randomizer)
	{
		B_InterruptMob(SCEMENAME_STONE);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_StoneMason_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_StoneMason_End");

	B_StopUseMob(self, SCEMENAME_STONE);
};
