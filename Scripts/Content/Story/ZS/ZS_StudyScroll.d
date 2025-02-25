/********************************************
*          NSC benutzt die Fakescroll		*
********************************************/

func void ZS_StudyScroll()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_StudyScroll");

	B_SetPerception(self);
	AI_SetWalkMode(self, NPC_WALK);	// Walkmode für den Zustand
	AI_GotoWP(self, self.wp);		// Gehe zum Tagesablaufstart
	AI_AlignToWP(self);				// Richte Dich aus
};

func int ZS_StudyScroll_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_StudyScroll_Loop");

	B_UseFakeScroll();

	var int Studyscratch;
	Studyscratch = Hlp_Random(100);

	if (StudyScratch >= 80)
	{
		AI_PlayAni(self, "R_SCRATCHHEAD");
		AI_Wait(self, 1);
	}
	else if (StudyScratch >= 60)
	{
		AI_PlayAni(self, "R_LEGSHAKE");
		AI_Wait(self, 1);
	}
	else if (StudyScratch >= 40)
	{
		AI_PlayAni(self, "R_SCRATCHLSHOULDER");
		AI_Wait(self, 1);
	}
	else if (StudyScratch >= 20)
	{
		AI_PlayAni(self, "R_SCRATCHEGG");
		AI_Wait(self, 1);
	}
	else
	{
		AI_PlayAni(self, "R_SCRATCHRSHOULDER");
		AI_Wait(self, 1);
	};

	return LOOP_CONTINUE;
};

func void ZS_StudyScroll_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_StudyScroll_End");
};
