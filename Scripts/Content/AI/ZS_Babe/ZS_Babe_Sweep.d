/*********************************************
*  Babe sucht SWEEP-FP und beginnt zu putzen *
*********************************************/

func void ZS_Babe_Sweep()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Babe_Sweep");

	// falls noch die Nacktrüstung angezogen ist, ausziehen!
	AI_UnequipArmor(self);

	B_SetBabeDefaultPerceptions();
	AI_SetWalkMode(self, NPC_WALK);	// Walkmode für den Zustand

	if (Npc_HasItems(self, ItMi_Brush) < 1)
	{
		CreateInvItem(self, ItMi_Brush);
	};

	if (!(Npc_IsOnFP(self, "SWEEP")))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};

	if (Wld_IsFPAvailable(self, "SWEEP"))
	{
		B_GotoFp(self, "SWEEP");

		AI_UseItemToState(self, ItMi_Brush, 1);
	};
};

func void ZS_Babe_Sweep_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Babe_Sweep_Loop");
	AI_Wait(self, 1);
};

func void ZS_Babe_Sweep_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Babe_Sweep_End");
	AI_UseItemToState(self, ItMi_Brush, -1);
};
