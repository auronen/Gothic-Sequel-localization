func void ZS_ArenaSpectator()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaSpectator");

	//  Wahrnehmungen aktiv
	Npc_PercEnable(self, PERC_ASSESSENEMY, B_AssessEnemy);
	Npc_PercEnable(self, PERC_ASSESSPLAYER, B_AssessSC);
	Npc_SetPercTime(self, 1);

	// * Wahrnehmungen passiv *
	Npc_PercEnable(self, PERC_ASSESSDAMAGE, ZS_ReactToDamage);
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_PercEnable(self, PERC_ASSESSCASTER, B_Spectator_AssessCaster);
	Npc_PercEnable(self, PERC_ASSESSMURDER, B_Spectator_AssessMurder);
	Npc_PercEnable(self, PERC_ASSESSDEFEAT, B_Spectator_AssessDefeat);
	Npc_PercEnable(self, PERC_ASSESSTALK, B_AssessTalk);

	AI_SetWalkMode(self, NPC_WALK);
	AI_GotoWP(self, self.wp);
	B_GotoFP(self, "SPECTATOR");
};

func int ZS_ArenaSpectator_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_ArenaSpectator_Loop");

	Npc_PerceiveAll(self);

	if (Wld_DetectNpc(self, -1, ZS_AttackArena, -1))
	{
		//-------- Random Jubel --------
		var int jubel;
		jubel = Hlp_Random(100);
		if (jubel < 20)
		{
			PrintDebugNpc(PD_ZS_CHECK, "");
			AI_TurnToNpc(self, other);
			B_Say(self, NULL, "$HEYHEYHEY");
		};

		//-------- Random Anim --------
		var int anim;
		anim = Hlp_Random(100);
		var int wait;
		wait = Hlp_Random(2);
		var float waitF;
		waitF = IntToFloat(wait);

		if (anim < 10) { AI_Wait(self, waitF); AI_PlayAni(self, "T_WATCHFIGHTRANDOM1"); }
		else if (anim < 20) { AI_Wait(self, waitF); AI_PlayAni(self, "T_WATCHFIGHTRANDOM2"); }
		else if (anim < 30) { AI_Wait(self, waitF); AI_PlayAni(self, "T_WATCHFIGHTRANDOM3"); }
		else if (anim < 40) { AI_Wait(self, waitF); AI_PlayAni(self, "T_WATCHFIGHTRANDOM4"); }
		else if (anim < 60) { AI_Wait(self, waitF); AI_PlayAni(self, "T_WATCHFIGHTRANDOM6"); };	// alte InExtremo-Applaudier-Ani
	};

	AI_Wait(self, 1);

	return LOOP_CONTINUE;
};

func void ZS_ArenaSpectator_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaSpectator_End");
};

func void B_Spectator_AssessMurder()
{
	PrintDebugNpc(PD_TA_FRAME, "B_Spectator_AssessMurder");
};

func void B_Spectator_AssessDefeat()
{
	PrintDebugNpc(PD_TA_FRAME, "B_Spectator_AssessDefeat");
};

func void B_Spectator_AssessCaster()
{
	PrintDebugNpc(PD_TA_FRAME, "B_Spectator_AssessCaster");
};
