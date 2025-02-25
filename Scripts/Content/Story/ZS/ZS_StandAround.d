//////////////////////////////////////////////////////////////////////////
//	ZS_StandAround
//	==============
//	Der NSC sucht sich für diesen Tagesablauf-Zustand  einen FP 'STAND'
//	und führt eine große Anzahl an zufälligen Ambient-Aktionen durch:
//	->	Essen
//	->	Trinken
//	->	Rauchen
//	->	Pinkeln gehen
//	->	Gelangweilt-Animationen
//////////////////////////////////////////////////////////////////////////
//	ToDo:
//	-----
//	- Manche Übergänge von T_..._RANDOM_X nach S_..._S0 poppen unschön
////////////////////////////////////////////////////////////////////////////
func void ZS_StandAround()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_StandAround");

	//-------- Wahrnehmungen --------
	// R$ückkehr in ZS_SmallTalk wird enabled

	B_SetPerception(self);
	if (Npc_WasInState(self, ZS_Smalltalk))
	{
		Npc_PercEnable(self, PERC_NPCCOMMAND, B_SmallTalk);
	};

	//-------- Vorbereitungen --------
	AI_SetWalkMode(self, NPC_WALK);
	B_ClearItem(self);

	//-------- Grobpositionierung --------
	if (!Npc_IsOnFP(self, "CAMPFIRE"))
	//&& !Npc_IsOnFP(self, "SMALLTALK"))
	{
		PrintDebugNpc(PD_TA_CHECK, "...nicht auf FP!");
		AI_GotoWP(self, self.wp);							// Gehe zum Tagesablaufstart
	};
};

func int ZS_StandAround_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_StandAround_Loop");

	//-------- Suche nach Smalltalk-Partner ! --------
	if (Npc_WasInState(self, ZS_Smalltalk))
	{
		Npc_PerceiveAll(self);
		_ = Wld_DetectNpc(self, -1, ZS_Smalltalk, -1);		//initialisiert 'other'

		if (Wld_DetectNpc(self, -1, ZS_Smalltalk, -1) && (Npc_GetDistToNpc(self, other) < HAI_DIST_SMALLTALK))
		{
			B_FullStop(self);
			AI_ContinueRoutine(self);
			return LOOP_END;
		};
	}

	//-------- Suche nach Platz am Lagerfeuer ! --------
	else
	{
		if (Wld_IsFPAvailable(self, "CAMPFIRE"))
		{
			PrintDebugNpc(PD_TA_DETAIL, "...Lagerfeuer gefunden");
			B_GotoFP(self, "CAMPFIRE");
			AI_AlignToFP(self);				//Richte Dich aus
		}
		else
		{
			Npc_PerceiveAll(self);
			if (Wld_DetectNpcEx(self, -1, NOFUNC, -1, 0)) //other = Nearest Npc (0=Spieler ignorieren!)
			{
				PrintDebugNpc(PD_TA_DETAIL, "...anderer NSC gefunden");
				if (Npc_CanSeeNpc(self, other)
				&& (Npc_GetDistToNpc(self, other) < PERC_DIST_DIALOG))
				{
					PrintDebugNpc(PD_TA_DETAIL, "...und in Dialogreichweite");
					AI_TurnToNpc(self, other);
				};
			};
		};
	};

	//-------- Zufallsaktionen... --------
	var int choice;
	choice = Hlp_Random(100);
	PrintDebugInt(PD_TA_DETAIL, "...Zufallsani-Wurf: ", choice);

	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_NONE)
	{
		if (choice < 2) { B_ChooseApple(self); }
		else if (choice < 4) { B_ChooseLoaf(self); }
		else if (choice < 6) { B_ChooseCheese(self); }
		else if (choice < 8) { B_ChooseBeer(self); }
		else if (choice < 10) { B_ChooseMeat(self); }
		else if (choice < 12) { B_ChooseMeatBugSoup(self); }
		else if (choice < 14) { B_ChooseWine(self); }
		else if (choice < 16) { B_ChooseBooze(self); }
		else if (choice < 18) { B_ChooseJoint(self); }
		else if (choice < 20) { B_ChooseSoup(self); }
		else if (choice < 30) { B_Pee(self); }
		else if (choice < 40) { B_Bored(self); };
	}
	else
	{
		if (choice < 20)
		{
			B_ClearItem(self);
		};
	};

	B_PlayItemRandoms(self);

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_StandAround_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_StandAround_End");

	C_StopLookAt(self);
	B_ClearItem(self);
};

func void B_SmallTalk()
{
	PrintDebugNpc(PD_TA_FRAME, "B_SmallTalk");

	if (Npc_IsInState(other, ZS_StandAround)
	&& Npc_IsOnFP(other, "SMALLTALK")
	&& (Npc_GetDistToNpc(self, other) < HAI_DIST_SMALLTALK))
	{
		PrintDebugNpc(PD_TA_CHECK, "...'other' geeigneter SmallTalk-Partner!");

		Npc_PercDisable(other, PERC_ASSESSPLAYER);
		Npc_PercDisable(other, PERC_OBSERVEINTRUDER);
		B_FullStop(other);
		Npc_SetTarget(other, self);

		_ = Npc_GetTarget(self);
		AI_StartState(other, ZS_Smalltalk, 1, "");

		Npc_PercDisable(self, PERC_ASSESSPLAYER);
		Npc_PercDisable(self, PERC_OBSERVEINTRUDER);
		B_FullStop(self);
		Npc_SetTarget(self, other);

		_ = Npc_GetTarget(self);
		AI_StartState(self, ZS_Smalltalk, 1, "");
	};
};
