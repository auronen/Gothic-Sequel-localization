/*******************************************
*          NSC benutzt das Alarmhorn								   *
*******************************************/

func void ZS_Horn()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Smoke");

	B_SetPerception(self);
	AI_SetWalkMode(self, NPC_WALK);					// Walkmode für den Zustand
	AI_GotoWP(self, self.wp);						// Gehe zum Tagesablaufstart
	AI_AlignToWP(self);								// Richte Dich aus

	if (!(Npc_HasItems(self, ItMi_Alarmhorn) >= 1)) // Check ob der NSC ein Alarmhorn hat
	{
		CreateInvItem(self, ItMi_Alarmhorn);		// wenn nicht dann erzeuge ihm eins
	};
};

func int ZS_Horn_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Horn_Loop");

	AI_UseItem(self, ItMi_Alarmhorn);
	AI_Wait(self, 4);

	return LOOP_CONTINUE;
};

func void ZS_Horn_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Horn_End");

	AI_UseItemToState(self, ItMi_Alarmhorn, -1);
};
