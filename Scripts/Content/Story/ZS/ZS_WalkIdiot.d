/****************************************************************
* NSC läuft immer zwischen FP-WALK_A und						*
* FP-WALK_B hin und her und wird zwischenzeitlich wahnsinnig	*
****************************************************************/

func void ZS_WalkIdiot()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_WalkIdiot");

	B_SetPossessedDefaultPerceptions();

	AI_SetWalkMode(self, NPC_WALK);		// Walkmode für den Zustand
	AI_GotoWP(self, self.wp);
};

func int ZS_WalkIdiot_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_WalkIdiot_Loop");

	var int IdiotTime;
	IdiotTime = Hlp_Random(100);

	if (Npc_IsOnFP(self, "WALK_A_") && Wld_IsFPAvailable(self, "WALK_B_"))
	{
		if (IdiotTime < 75)
		{
			B_GotoFP(self, "WALK_B_");
			PrintDebugNpc(PD_TA_LOOP, "Gehe zu FP B");
		};

		if (IdiotTime < 80)
		{
			AI_PlayAni(self, "T_STAND_2_MAD");
			AI_PlayAni(self, "S_MAD");
			AI_PlayAni(self, "T_MAD_2_STAND");

			PrintDebugNpc(PD_TA_LOOP, "Spiele MAD 1 Ani");
		};

		if (IdiotTime < 90)
		{
			//AI_PlayAni(self, "T_MAD_2_MADDOWN");
			//AI_PlayAni(self, "S_MADDOWN");

			//PrintDebugNpc(PD_TA_LOOP, "Spiele MAD 2 Ani");
		};

		if (IdiotTime < 95)
		{
			AI_PlayAni(self, "T_STAND_2_MAD");
			AI_PlayAni(self, "S_MAD");
			AI_PlayAni(self, "T_MAD_2_MADDOWN");
			AI_PlayAni(self, "S_MADDOWN");
			AI_PlayAni(self, "T_MADDOWN_2_STAND");
			AI_PlayAni(self, "T_MAD_2_STAND");

			PrintDebugNpc(PD_TA_LOOP, "Spiele MAD 3 Ani");
		};

		if (IdiotTime < 100)
		{
			//AI_PlayAni(self, "T_MADDOWN_2_STAND");
			//PrintDebugNpc(PD_TA_LOOP, "Spiele MAD 4 Ani");
		};
	}
	else if (Npc_IsOnFP(self, "WALK_B_") && Wld_IsFPAvailable(self, "WALK_A_"))
	{
		if (IdiotTime < 75)
		{
			B_GotoFP(self, "WALK_A_");
			PrintDebugNpc(PD_TA_LOOP, "Gehe zu FP A");
		};

		if (IdiotTime < 80)
		{
			AI_PlayAni(self, "T_STAND_2_MAD");
			AI_PlayAni(self, "S_MAD");
			AI_PlayAni(self, "T_MAD_2_STAND");

			PrintDebugNpc(PD_TA_LOOP, "Spiele MAD Ani");
		};

		if (IdiotTime < 90)
		{
			//AI_PlayAni(self, "T_MAD_2_MADDOWN");
			//AI_PlayAni(self, "S_MADDOWN");

			//PrintDebugNpc(PD_TA_LOOP, "Spiele MAD 2 Ani");
		};

		if (IdiotTime < 95)
		{
			AI_PlayAni(self, "T_STAND_2_MAD");
			AI_PlayAni(self, "S_MAD");
			AI_PlayAni(self, "T_MAD_2_MADDOWN");
			AI_PlayAni(self, "S_MADDOWN");
			AI_PlayAni(self, "T_MADDOWN_2_STAND");
			AI_PlayAni(self, "T_MAD_2_STAND");

			PrintDebugNpc(PD_TA_LOOP, "Spiele MAD 3 Ani");
		};

		if (IdiotTime < 100)
		{
			//AI_PlayAni(self, "T_MADDOWN_2_STAND");
			//PrintDebugNpc(PD_TA_LOOP, "Spiele MAD 4 Ani");
		};
	}
	else
	{
		B_GotoFP(self, "WALK_A_");
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_WalkIdiot_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Walk_End");
};
