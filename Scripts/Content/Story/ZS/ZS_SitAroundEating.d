//////////////////////////////////////////////////////////////////////////
//	ZS_SitAroundEating
//	==================
//	Der NSC geht zu seinem TA-Startpunkt und sucht sich eine
//	Sitzgelegenheit. Er sucht nach:
//	->	Mob "CHAIR"
//	->	Mob "BENCH"
//	->	Mob "SMALL THRONE"
//	->	FP "SIT"
//////////////////////////////////////////////////////////////////////////
//	ToDo:
//	-----
//	- Manche Übergänge von T_..._RANDOM_X nach S_..._S0 poppen unschön
//////////////////////////////////////////////////////////////////////////
func void ZS_SitAroundEating()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_SitAroundEating");

	B_SetPerception(self);

	//-------- Grobpositionierung --------
	if ((Npc_GetDistToWP(self, self.wp) > 500)
	&& (!C_BodyStateContains(self, BS_SIT)))
	{
		PrintDebugNpc(PD_TA_CHECK, "...zu weit weg vom TA-Startpunkt!");
		AI_StandUp(self);
		AI_SetWalkMode(self, NPC_WALK);
		AI_GotoWP(self, self.wp);              							// Gehe zum Tagesablaufstart
	};
};

func int ZS_SitAroundEating_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_SitAroundEating_Loop");

	//-------- Sitzgelegenheit suchen ! --------
	if (!C_BodyStateContains(self, BS_SIT))
	{
		PrintDebugNpc(PD_TA_CHECK, "...NSC sitzt noch nicht!");
		if (Wld_IsMobAvailable(self, SCEMENAME_BENCH))
		{
			PrintDebugNpc(PD_TA_CHECK, "...Bank gefunden!");
			_ = AI_UseMob(self, SCEMENAME_BENCH, 1);					// Benutze den Mob einmal bis zum angegebenen State
			self.aivar[AIV_HangAroundStatus] = 2;
		}
		else if (Wld_IsMobAvailable(self, "CHAIR"))
		{
			PrintDebugNpc(PD_TA_CHECK, "...Stuhl gefunden!");
			_ = AI_UseMob(self, "CHAIR", 1);							// Benutze den Mob einmal bis zum angegebenen State
			self.aivar[AIV_HangAroundStatus] = 3;
		}
		else if (Wld_IsMobAvailable(self, "SMALL THRONE"))
		{
			PrintDebugNpc(PD_TA_CHECK, "...kl. Thron gefunden!");
			_ = AI_UseMob(self, "SMALL THRONE", 1);						// Benutze den Mob einmal bis zum angegebenen State
			self.aivar[AIV_HangAroundStatus] = 4;
		}
		else if (Wld_IsFPAvailable(self, "SIT"))
		{
			PrintDebugNpc(PD_TA_CHECK, "...FP 'SIT' gefunden!");
			B_GotoFP(self, "SIT");
			AI_AlignToFP(self);											// Richte Dich aus
			AI_PlayAniBS(self, "T_STAND_2_SIT", BS_SIT);
			self.aivar[AIV_HangAroundStatus] = 1;
		}
		else
		{
			PrintDebugNpc(PD_TA_CHECK, "...keine Sitzgelegenheit gefunden!");
			AI_StartState(self, ZS_StandAround, 1, "");					// ...also stehen wir!
			return LOOP_CONTINUE;
		};
	}

	//-------- Zufalls-Animationen spielen ! --------
	else
	{
		var int choice;
		choice = Hlp_Random(100);
		PrintDebugInt(PD_TA_DETAIL, "...Zufallsani-Wurf: ", choice);

		if (self.aivar[AIV_ITEMSTATUS] == TA_IT_NONE)
		{
			if ((choice >= 0) && (choice < 100)) { B_ChooseApple(self); };
			/*
			if ((choice >= 5) && (choice < 10)) { B_ChooseLoaf(self); };
			if ((choice >= 10) && (choice < 15)) { B_ChooseCheese(self); };
			if ((choice >= 15) && (choice < 20)) { B_ChooseBeer(self); };
			if ((choice >= 20) && (choice < 30)) { B_ChooseMeat(self); };
			if ((choice >= 30) && (choice < 40)) { B_ChooseMeatBugSoup(self); };
			if ((choice >= 40) && (choice < 80)) { B_ChooseSoup(self); };
			*/
			B_PlayItemRandoms(self);
		}
		else
		{
			if (choice < 10)
			{
				B_ClearItem(self);
			}
			else
			{
				B_PlayItemRandoms(self);
			};
		};
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_SitAroundEating_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_SitAroundEating_End");

	C_StopLookAt(self);
	B_ClearItem(self);

	if (self.aivar[AIV_HangAroundStatus] == 1)
	{
		AI_PlayAni(self, "T_SIT_2_STAND");
		self.aivar[AIV_HangAroundStatus] = 0;
	}
	else if (self.aivar[AIV_HangAroundStatus] == 4)
	{
		_ = AI_UseMob(self, "SMALL THRONE", -1);
		self.aivar[AIV_HangAroundStatus] = 0;
	}
	else if (self.aivar[AIV_HangAroundStatus] == 2)
	{
		_ = AI_UseMob(self, SCEMENAME_BENCH, -1);
		self.aivar[AIV_HangAroundStatus] = 0;
	}
	else if (self.aivar[AIV_HangAroundStatus] == 3)
	{
		_ = AI_UseMob(self, "CHAIR", -1);
		self.aivar[AIV_HangAroundStatus] = 0;
	};
};
