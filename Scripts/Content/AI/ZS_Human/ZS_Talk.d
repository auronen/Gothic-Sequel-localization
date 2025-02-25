func void B_RefuseTalk()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_RefuseTalk");
	B_SmartTurnToNpc(self, other);
	B_Say(self, other, "$NOTNOW");
	C_StopLookAt(self);
};

// **********************************************************

func void ZS_Talk()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_Talk");

	//-------- Verhindern von Mehrfachansprechen der NSCs --------
	if (C_NpcIsInvincible(other))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...SC spricht schon!");
		AI_ContinueRoutine(self);
		return;
	};

	C_ZSInit();
	B_SetFaceExpression(self, other); //Attitüde bestimmt Gesichtsausdruck

	self.aivar[AIV_INVINCIBLE] = TRUE;
	other.aivar[AIV_INVINCIBLE] = TRUE;

	//Npc_PercEnable(self, PERC_ASSESSDAMAGE, ZS_ReactToDamage);
	//Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	//Npc_PercEnable(self, PERC_ASSESSSURPRISE, ZS_AssessSurprise);
	//Npc_PercEnable(self, PERC_ASSESSENEMY, B_AssessEnemy);
	//Npc_PercEnable(self, PERC_ASSESSFIGHTER, B_AssessFighter);
	//Npc_PercEnable(self, PERC_ASSESSTHREAT, B_AssessFighter);
	//Npc_PercEnable(self, PERC_ASSESSWARN, B_AssessWarn);
	//Npc_PercEnable(self, PERC_ASSESSMURDER, ZS_AssessMurder);
	//Npc_PercEnable(self, PERC_ASSESSDEFEAT, ZS_AssessDefeat);
	//Npc_PercEnable(self, PERC_ASSESSFIGHTSOUND, B_AssessFightSound);
	//Npc_PercEnable(self, PERC_CATCHTHIEF, ZS_CatchThief);
	//Npc_PercEnable(self, PERC_ASSESSTHEFT, B_AssessTheft);

	// SC zu nah dran
	if (Npc_GetDistToNpc(other, self) < 80)
	{
		AI_Dodge(other);
	};

	// KEIN DIALOG: NSC ist feindlich
	if ((Npc_GetTempAttitude(self, other) == ATT_HOSTILE)
	&& (self.aivar[AIV_TALKBEFOREATTACK] == FALSE))
	{
		Npc_SetTarget(self, other);
		B_AssessEnemy();
	};

	// AMBIENT-INFOS werden nur Ambient-NSCs (Nicht-Main-NSCs) zugeordnet,
	// die KEINE anderen Infos/Aufträge haben
	//if ((self.npcType != NpcType_Main) && (self.npcType != NpcType_Friend) && (!NPC_CheckInfo(self, 0)) && (!Npc_CheckInfo(self, 1)))
	//{
		//B_AssignAmbientInfos(self);
	//};

	B_FullStop(hero);

	// DIALOG geht los, NSC dreht sich zu dir
	if ((!C_BodystateContains(self, BS_SIT)) || (!Npc_CanSeeNpc(self, hero)))
	{
		AI_StandUp(self);
		AI_TurnToNpc(self, hero);
	};

	AI_TurnToNpc(hero, self); // SC dreht sich zum Npc

	// NSC begrüßt dich, wenn der Spieler ihn angesprochen hat
	if (!hero.aivar[AIV_IMPORTANT])
	{
		B_GuildGreetings();
	};

	// Equipment gestohlen?
	// SN: auskommentiert, da es sonst mit individuell-dialogbasierten Diebstahlchecks kollidiert. Wird ausserdem durch B_AssessSC oft genug angesprungen!!!
	//B_CheckStolenEquipment();

	// KenneSC-Flag auf TRUE setzen, wenn Main-NSC. (SC-Verkleidung dabei EGAL)
	if ((self.npcType == NpcType_Main) || (self.npcType == NpcType_Friend))
	{
		Npc_SetKnowsPlayer(self, other);
	};

	// NEWS checken, wenn der Spieler ihn angesprochen hat
	//if (!hero.aivar[AIV_IMPORTANT])
	//{
		//B_ReactToMemory();
	//};

	//AMBIENT INFOS
	B_AssignAmbientInfos(self);

	// News -Bezug auf Diebstahl nehmen (Nsc der beklaut wurde himself)
	if ((self.aivar[AIV_THEFTWITTNESS] > AIV_NODEED)
	&& (Npc_GetPermAttitude(self, other) == ATT_ANGRY))
	{
		PrintDebugNpc(PD_ZS_FRAME, "NEws ANGRY");
		B_AssignTheftInfos(self);
	};

	if (B_MurderTeller())
	{
		B_AssignMurderInfos(self);
		/*
		if (int_ReparationRunning)
		{
			PrintDebugNpc(PD_ZS_FRAME, "NEws ANGRY");
			B_AssignReparationDialog(self);
		};
		*/
	};

	if (self.aivar[AIV_PLAYERHASMYWEAPON] == TRUE)
	{
		B_GetBAckPersonalWeapon(self);
	};

	if (self.aivar[AIV_BEENATTACKED] > AIV_NODEED)
	{
		B_AssignDamageInfos(self);
	};

	/* 	//Im Augenblick testen wir ob es reicht die Nsc-Attitüden zu ändern und Reparation für Mord ganz sein zu lassen
	if (B_MurderReparationNpc())
	{
		B_AssignReparationReceiver(self);
	};
	*/
	// Kenne SC (wird für FindNSC-Infos gebraucht)
	self.aivar[AIV_FINDABLE] = TRUE;

	// START Multiple Choice Dialog
	AI_ProcessInfos(self);
};

func int ZS_Talk_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP, "ZS_Talk_Loop");

	if (C_BodyStateContains(self, BS_SIT))
	{
		if (self.aivar[AIV_HANGAROUNDSTATUS] <= 1) //sitzt auf Boden, NICHT auf Bank, etc.
		{
			AI_LookAtNpc(self, other);
		};
	};

	if (InfoManager_HasFinished())
	{
		PrintDebugNpc(PD_ZS_CHECK, "...InfoManager beendet!");
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		//AI_StopLookAt(self); // sitzende NSCs glotzen dem SC nach dem Dialog nach.
		B_ResetFaceExpression(self);
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_Talk_End()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_Talk_End");
};
