//////////////////////////////////////////////////////////////////////////
//	ZS_ProclaimAndPunish
//	====================
//	Wird angesprungen von:
//
//	- ZS_AssessEnemy
//	- B_AssessFightSound
//	- ZS_AssessDefeat
//	- ZS_AssessMurder
//
//	Folgende Voraussetzungen müssen erfüllt sein:
//
//	- zu Bestrafender muß der Spiele sein ('hero' wird verwendet!)
//	- NSC muß bereits eine passende Waffe gezogen haben!
//
//	Macht folgendes:
//	1.	Zum Ziel 'hero' hinlaufen, falls zu weit weg
//	2.	Den Grund des Angriffs verkünden
//	3.	Angreifen
//////////////////////////////////////////////////////////////////////////
func void ZS_ProclaimAndPunish()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_ProclaimAndPunish");

	Npc_PercEnable(self, PERC_ASSESSDAMAGE, B_CombatReactToDamage);
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_PercEnable(self, PERC_ASSESSMURDER, B_CombatAssessMurder);
	Npc_PercEnable(self, PERC_ASSESSDEFEAT, B_CombatAssessDefeat);
	Npc_PercEnable(self, PERC_MOVENPC, B_StopGotoHero);

	//-------- NSC will mit Fernkampfwaffe 'bestrafen' und steht weiter weg ! --------
	if ((Npc_IsInFightMode(self, FMODE_FAR) || Npc_IsInFightMode(self, FMODE_MAGIC)) && (Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG))
	{
		B_AttackQuick(self, hero);			// sofortiges Angreifen ohne 'Proclaim'
	};

	AI_SetWalkMode(self, NPC_RUN);
};

func int ZS_ProclaimAndPunish_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP, "ZS_ProclaimAndPunish_Loop");

	if (Npc_GetStateTime(self) > HAI_TIME_PURSUIT)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Verfolgung dauert schon zu lange!");
		AI_ContinueRoutine(self);
	}
	else if (Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...noch NICHT in Dialogreichweite!");
		AI_GotoNpc(self, hero);
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "...IN Dialogreichweite!");
		B_FullStop(self);
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_ProclaimAndPunish_End()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_ProclaimAndPunish_End");

	//-------- SC mittlerweile bewußtlos/tot ? --------
	if (C_NpcIsDown(hero))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...SC mittlerweile am Boden!");
		return;
	};

	//-------- Zu sprechenden Satz ermitteln ! --------
	//Möglichkeiten:
	// - ZS_ReactToDamage/ZS_AssessEnemy		-> $NowWait (bei SC-Defeat: $YouStillNotHaveEnough)
	// - ZS_CatchThief/ZS_AssessEnemy			-> $DirtyThief
	// - NEWS_THEFT								-> $DirtyThief
	// - hat Schützling/Freund des NSCs getötet	-> $YouKilledOneOfUs
	// - greift Schützling an					-> $YouAttackedMyCharge
	// - permHostile durch Gildentabelle		-> $DieMortalEnemy
	if (Npc_WasInState(self, ZS_AssessEnemy))
	{
		//-------- SC ist Todfeind durch Gildentabelle ! --------
		if (Wld_GetGuildAttitude(self.guild, hero.guild) == ATT_HOSTILE)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC ist Todfeind!");
			B_SayOverlay(self, hero, "$DieMortalEnemy");
		}

		//-------- SC klaut oder hat geklaut ! --------
		else if (self.aivar[AIV_Theftwittness])
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC hat vom NSC geklaut!");
			B_SayOverlay(self, hero, "$DIRTYTHIEF");
		}

		//-------- Normaler Angriff (SC wurde noch nicht besiegt) --------
		else
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Normaler Angriff (SC wurde noch nicht besiegt)!");
			B_SayOverlay(self, hero, "$NowWait");
		};
	}
	else
	{
		//-------- SC hat Durchgang durchbrochen ! --------
		if (C_GetAttackReason(self) == AIV_AR_INTRUDER)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC hat Durchgang durchbrochen!");
			B_SayOverlay(self, hero, "$NowWaitIntruder");
		}

		//-------- SC hat Arenakampf unterbrochen ! --------
		if (C_GetAttackReason(self) == AIV_AR_DISTURBEDARENA)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC hat Arenakampf unterbrochen !");
			B_SayOverlay(self, hero, "$YouDisturbedArenaFight");
		}

		//-------- SC hat in Arena gemordet ! --------
		if (C_GetAttackReason(self) == AIV_AR_MURDEREDINARENA)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC hat in Arena gemordet !");
			B_SayOverlay(self, hero, "$YouMurderedInArena");
		}

		//-------- SC kämpft in Arena mit Fernkampfwaffe! --------
		if (C_GetAttackReason(self) == AIV_AR_ARENABOW)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC kämpft in Arena mit Fernkampfwaffe!");
			B_SayOverlay(self, hero, "$NoBowInArena");
		}

		//-------- SC kämpft in Arena mit Magie! --------
		if (C_GetAttackReason(self) == AIV_AR_ARENAMAGIC)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC kämpft in Arena mit Magie!");
			B_SayOverlay(self, hero, "$NoMagicInArena");
		}

		//-------- SC greift Schützling einer Wache an ! --------
		else
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC greift Schützling einer Wache an !");
			B_SayOverlay(self, hero, "$YouAttackedMyCharge");
		};
	};

	//-------- Nun gibt's endlich Haue ! --------
	B_AttackQuick(self, hero);
};
