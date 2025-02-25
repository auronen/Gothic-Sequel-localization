/**************************************
*  NSC soll auf Zielscheibe schiessen *
***************************************/

//### Skriptmethode noch einbauen, wenn sie für VoBs geht
func void ZS_PracticeBow()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_PracticeBow");

	B_SetPerception(self);
	AI_SetWalkMode(self, NPC_WALK);				// Walkmode für den Zustand
	if (!(Hlp_StrCmp(self.wp, Npc_GetNearestWP(self))))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};

	B_GotoFP(self, "PRACTICEBOW");
};

func void ZS_PracticeBow_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_PracticeBow_Loop");

	AI_Wait(self, 1);
};

func void ZS_PracticeBow_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_PracticeBow_End");
};
