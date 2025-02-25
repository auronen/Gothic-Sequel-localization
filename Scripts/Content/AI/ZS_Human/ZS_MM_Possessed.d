/////////////////////////////////////////////////////////////////////////////////////
// 	Possessed AI
// 	============
// 	Damit die Bessessenen sich nicht wie alle anderen Nsc´s verhalten und so
//	z.B. das Krankenlager verlassen, oder den Spieler mit normalen Svm´s ansprechen
//	Zu diesem Zweck werden bei den Bessessenen nur wenige Wahrnehmungen aktiviert.
//	Das Verhalten ist eigentlich nur ein bis zwei spezial Svm´s zu starten und vor
//	dem Spieler zu fliehen, wobei das Fluchtverhalten nicht über das normale AI_Flee
//	behandelt werden darf, weil dann das Krankenlager verlassen wird und das nicht
//	passieren darf.
//////////////////////////////////////////////////////////////////////////////////////
func void B_SetPossessedDefaultPerceptions()
// 	Begrenztes Wahrnemungsset, daß erst mal nur auf Ansprechen Schaden und Waffe ziehen
//	reagiert
{
	Npc_PercEnable(self, PERC_ASSESSTALK, ZS_Talk);
	//Npc_PercEnable(self, PERC_ASSESSPLAYER, B_Possessed_AssessPlayer);

	Npc_PercEnable(self, PERC_ASSESSDAMAGE, ZS_Possessed_Flee);
	Npc_PercEnable(self, PERC_DRAWWEAPON, ZS_Possessed_Flee);
	//Npc_PercEnable(self, PERC_ASSESSMAGIC, ZS_Possessed_Flee);

	//Npc_PercEnable(self, PERC_ASSESSOTHERSDAMAGE, ZS_Possessed_Flee);
	//Npc_PercEnable(self, PERC_ASSESSTHREAT, ZS_Possessed_Flee);
	//Npc_PercEnable(self, PERC_ASSESSWARN, ZS_Possessed_Flee);

	//Npc_PercEnable(self, PERC_OBSERVEINTRUDER, B_Possessed_ObserveIntruder);
	//Npc_PercEnable(self, PERC_OBSERVESUSPECT, ZS_Possessed_Flee);
	//Npc_PercEnable(self, PERC_ASSESSSURPRISE, ZS_Possessed_Flee);
};

func void B_Possessed_RefuseTalk()
// Achtung gewünschte Gespräche dürfen nicht abgebrochen werden
// unverständlich Brabbeln beim angesprochen werden
// wird erst mal über ZS_Talk geregelt, wenn es noch Problem geben sollte
// kann die Funktion aber wieder aktiviert und erweitert werden
{
	AI_LookAtNpc(self, other);
	PrintDebugNpc(PD_ZS_FRAME, "B_Possessed_RefuseTalk");

	B_Say(self, other, "$POSSESSED1");
	AI_StopLookAt(self);
};

func void ZS_Possessed_Flee()
// Damit die Bessessenen nicht das Krankenlager verlassen werden sie bei der Flucht
// auf einen festen WP geschickt und von dem aus noch zu zwei anderen, damit sie nicht
// direkt neben dem Spieler stehen bleiben, falls er sich grade an einem der Wp´s, die
// von den fliehenden angelaufen werden daneben benimmt
{
	B_FullStop(self);
	PrintDebugNpc(PD_ZS_FRAME, "ZS_Possessed_Flee");
	B_SetPossessedDefaultPerceptions();
	AI_SetWalkMode(self, NPC_RUN);
	B_Say(self, NULL, "$POSSESSED2");
	if (!Hlp_IsValidNpc(other))
	{
		PrintDebugNpc(PD_ZS_CHECK, "Other nicht Valid.");
		AI_ContinueRoutine(self);
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "Ich hau lieber ab.");
		AI_GotoWP(self, "OCR_MEDICUS_TENT_02");
	};
};

func int ZS_Possessed_Flee_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP, "ZS_Possessed_Flee_Loop");
	// zweiten WP anlaufen, wenn der Sc noch zu Nahe ist
	if (Npc_GetDistToNpc(self, other) <= HAI_DIST_ABORT_FLEE)
	{
		AI_GotoWP(self, "OCR_GHETTO_13");
	}
	else
	{
		AI_ContinueRoutine(self);
	};

	//max. 10 Sekunden rumlaufen
	if (Npc_GetStateTime(self) >= 10)
	{
		PrintDebugNpc(PD_ZS_LOOP, "Die Zeit zum fliehen ist vorbei");
		AI_ContinueRoutine(self);
	};

	return LOOP_CONTINUE;
};

func void ZS_Possessed_Flee_End()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_Possessed_Flee_End");
	// Wenn der Spieler in der Nähe meines üblichen Tagesablaufpunktes ist verpisse ich mich und warte dort
	B_Say(self, other, "$POSSESSED2");
	if (Hlp_StrCmp(Npc_GetNearestWP(hero), self.wp))
	{
		AI_GotoWP(self, "OCR_GHETTO_14");
		AI_Wait(self, 20);
	};
};

/////////////////////////////////////////////////
//             Bessesser benutzt Bett,         //
// wenn kein Bett da, macht er ZS_WalkIdiot    //
/////////////////////////////////////////////////

func void ZS_PossessedSleep()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_PossessedSleep");

	B_SetPossessedDefaultPerceptions();
	AI_SetWalkMode(self, NPC_WALK);
	if (!C_BodyStateContains(self, BS_MOBINTERACT))
	{
		if (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == 0)
		{
			AI_GotoWP(self, self.wp);
		};
	};
};

func int ZS_PossessedSleep_Loop()
{
	return LOOP_END;
};

func void ZS_PossessedSleep_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_PossessedSleep_End");
	AI_StartState(self, ZS_PossessedSleepBed, 1, "");
};

func int ZS_PossessedSleepBed()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_PossessedSleepBed");

	B_SetPossessedDefaultPerceptions();
	// JP: Für die Bessessenen gibt es nur die flachen Betten
	if (Wld_IsMobAvailable(self, SCEMENAME_BEDLOW))
	{
		_ = AI_UseMob(self, SCEMENAME_BEDLOW, 1);
	}
	else
	{
		AI_StartState(self, ZS_WalkIdiot, 1, "");
	};

	return LOOP_CONTINUE;
};

func int ZS_PossessedSleepBed_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_PossessedSleepBed_Loop");

	// Die Jungs reagieren nicht logisch, da reicht es auch wenn es mal etwas länger dauert und es entastel etwas den Rechner
	AI_Wait(self, 10);
	return LOOP_CONTINUE;
};

func void ZS_PossessedSleepBed_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_PossessedSleepBed_End");
	_ = AI_UseMob(self, SCEMENAME_BEDLOW, -1);
	// JP: Schlafen soll die Nsc´s voll regenerieren
	Npc_ChangeAttribute(self, ATR_HITPOINTS,(self.attribute[ATR_HITPOINTS_MAX] - self.attribute[ATR_HITPOINTS]));
};
