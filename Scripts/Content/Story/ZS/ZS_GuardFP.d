//////////////////////////////////////////////////////////////////////////
//	ZS_Guard
//	========
//	Dieser Tagesablauf wird allen NSCs gegeben, die einfach nur
//	imposant herumstehen und Wache halten sollen.
//
//	Es passiert folgendes:
//	1.	Wie in allen Wachzuständen werden nette Posen und Zufalls-
//		Animationen abgespielt.
//////////////////////////////////////////////////////////////////////////
func void ZS_GuardFP()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_GuardFP");

	GuardPerception();
	Npc_PercEnable(self, PERC_ASSESSPLAYER, B_AssessSC);

	AI_StandUp(self);
	AI_SetWalkMode(self, NPC_WALK);			// Walkmode für den Zustand
	if (!Npc_IsOnFP(self, "GUARD"))
	{
		AI_GotoWP(self, self.wp);			// Gehe zum Tagesablaufstart
	};

	B_InitArmor();
};

func void ZS_GuardFP_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_GuardFP_Loop");

	B_GotoFP(self, "GUARD");

	if ((Npc_GetDistToNpc(self, hero) < 800)
	&& Npc_CanSeeNpc(self, hero))
	{
		B_SmartTurnToNpc(self, hero);
	}
	else
	{
		AI_AlignToFP(self);
	};

	B_PlayArmor();

	AI_Wait(self, 0.5);
};

func void ZS_GuardFP_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_GuardFP_End");

	B_ExitArmor();
};
