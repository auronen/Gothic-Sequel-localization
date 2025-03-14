/************************************************
*   Babe sucht FAN-FP und beginnt Luftzufächeln *
************************************************/

func void ZS_Babe_Fan()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Babe_Fan");

	// falls noch die Nacktrüstung angezogen ist, ausziehen!
	AI_UnequipArmor(self);

	B_SetBabeDefaultPerceptions();
	AI_SetWalkMode(self, NPC_WALK);	// Walkmode für den Zustand

	if (Npc_HasItems(self, ItMi_Wedel) < 1)
	{
		CreateInvItem(self, ItMi_Wedel);
	};

	if (Wld_IsFPAvailable(self, "FAN"))
	{
		B_GotoFp(self, "FAN");
		AI_AlignToFP(self);				//Richte Dich aus
		AI_UseItemToState(self, ItMi_Wedel, 1);

		// Spiele Random-Ani dazu ab
		Mdl_ApplyRandomAni(self, "s_COOLAIR_S1", "t_COOLAIR_RANDOM_1");
		Mdl_ApplyRandomAniFreq(self, "s_COOLAIR_S1", 5);
	}
	else
	{
		AI_GotoWP(self, self.wp);
		AI_AlignToWP(self);
	};
};

func void ZS_Babe_Fan_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Babe_Fan_Loop");
};

func void ZS_Babe_Fan_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Babe_Fan_End");

	AI_UseItemToState(self, ItMi_Wedel, -1);
};
