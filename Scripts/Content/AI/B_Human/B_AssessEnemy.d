//////////////////////////////////////////////////////////////////////////
//	B_AssessEnemy
//	=============
//	Wird durch folgende Ereignisse angesprungen:
//
//	- PERC_ASSESSENEMY
//	- B_MoveNpc				(wenn hostile zum Kollisionspartner)
//	- B_ObserveIntruder		(wenn hostile zum Eindringling)
//	- ZS_AssessDefeat		(wenn hostile zum Sieger)
//	- ZS_AssessMurder		(wenn hostile zum Mörder)
//	- ZS_AssessSurprise		(wenn hostile zum Zurückverwandelten)
//	- ZS_AssessThreat		(wenn permAngry zum Droher -> jetzt hostile)
//	- ZS_ObserveSuspect		(wenn hostile zum Schleichenden)
//	- ZS_ReactToCall		(wenn hostile zum Rufenden)
//
//	Die primäre Aufgabe von B_AssessEnemy ist es, festzustellen
//	ob der entdeckte Feind ein Monster ein Mensch oder aber garnicht
//	zu bekämpfen ist:
//
//	1.	Fighter ist MENSCH
//		- Ignorieren wenn NPCTYPE_FRIEND oder ATT_FRIENDLY
//		- Ignorieren Cutscene-Teilnehmer
//		- Ignorieren, wenn Enemy gerade im Dialog
//		- wenn AIV_TALKBEFOREATTACK: auf Important-Info checken
//		-> ZS_AssessEnemy
//	2. 	Enemy ist MONSTER
//		-> ZS_AssessMonster
//////////////////////////////////////////////////////////////////////////
func void B_AssessEnemy()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_AssessEnemy");
	PrintGlobals(PD_ZS_CHECK);
	if (Npc_CanSeeNpcFreeLOS(self, other))
	{
		//######## Ist Enemy ein MENSCH ? ########
		if (C_NpcIsHuman(other))
		{
			PrintDebugNpc(PD_ZS_FRAME, "...Feind ist Mensch!");

			//-------- Important-Info ! --------
			if (self.aivar[AIV_TALKBEFOREATTACK]) 							// Hat der NSC eine "letzte Nachricht" für den Feind?
			{
				PrintDebugNpc(PD_ZS_CHECK, "...'letzte Nachricht' für den Feind!");
				if (B_CheckForImportantInfo(self, other))
				{
					return;
				};
			};

			//-------- NpcTypeFriends ignorieren das HOSTILE --------
			if (C_NpcTypeIsFriend(self, other) || (Npc_GetAttitude(self, other) == ATT_FRIENDLY))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...NSC ist NpcType_Friend oder ATT_FRIENDLY!");
				return;
			};

			//--------Feind wird toleriert --------
			if (C_OtherIsToleratedEnemy(self, other))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Feind wird toleriert!");
				B_TolerateEnemy(self, other);
				return;
			};

			//-------- Enemy spricht gerade --------
			if (C_NpcIsInvincible(other))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Feind spricht gerade!");
				AI_ContinueRoutine(self);
				return;
			};

			//-------- Cutscene-Teilnehmer wird das Waffeziehen verziehen --------
			if (Npc_IsInCutscene(other)) 									// Befindet sich der Feind in einer Cutscene?
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Feind ist in Cutscene!");
				return;														//... dann verzeihen wir ihm natürlich -> Abbruch des Checks
			};

			//-------- Also doch ein ganz ordinärer Feind! --------
			B_FullStop(self);
			AI_StartState(self, ZS_AssessEnemy, 0, "");
		}

		//######## ...dann muß der Enemy ein MONSTER sein ########
		else
		{
			PrintDebugNpc(PD_ZS_CHECK, "... 'enemy' ist Monster/Orc!");

			if ((Npc_GetDistToNpc(self, other) < HAI_DIST_ASSESS_MONSTER)
			&& C_NpcIsDangerousMonster(self, other))
			{
				B_FullStop(self);
				AI_StartState(self, ZS_AssessMonster, 0, "");
				return;
			};
		};
	};
};
