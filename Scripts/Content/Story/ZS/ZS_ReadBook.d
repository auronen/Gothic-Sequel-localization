/*******************************************
*       NSC liest Buch an Stehtisch        *
*******************************************/

func void ZS_ReadBook()
//Buch auf Stehtisch,
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ReadBook");

	B_SetPerception(self);
	AI_SetWalkMode(self, NPC_WALK);						// Walkmode für den Zustand
	if (!C_BodyStateContains(self, BS_MOBINTERACT))
	{
		AI_GotoWP(self, self.wp);
		_ = AI_UseMob(self, SCEMENAME_BOOK, 1);			// Benutze den Mob einmal bis zum angegebenen State
	};
};

func int ZS_ReadBook_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_ReadBook_Loop");

	var int randomizer;
	randomizer = Hlp_Random(20);
	if (Npc_GetStateTime(self) >= 100 + randomizer)
	{
		B_InterruptMob(SCEMENAME_BOOK);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_ReadBook_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ReadBook_End");

	_ = AI_UseMob(self, SCEMENAME_BOOK, -1);			// Nimm den Verlassen State ein
};
