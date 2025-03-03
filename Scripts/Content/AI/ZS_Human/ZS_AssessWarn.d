////////////////////////////////////////////////////////////////////////////////////////
//
//	ZS_AssessWarn
//	=============
//	Der (menschliche) NSC wird von einem anderen (menschlichen) NSC vor einem Dritten
//	gewarnt.
//	- self:		Empfänger der Warnung
//	- victim:	Sender der Warnung
//	- other:	der Dritte, vor dem gewarnt wird
//
//	Folgende Fälle können zu einer Warnung zwischen Menschen führen:
//	1.	B_AssessFighter()	-> 	der Spieler wird mit gezogener Waffe entdeckt
//	2.	B_AssessTheft()		-> 	ein NSC wird vom Spieler beklaut (Taschendiebstahl)
//	3.	ZS_AlarmAll()		-> 	nach AssessEnemy/Murder eines Freundes/Kameraden
//	4.	ZS_ObserveSuspect()
//	5.	B_AssessEnterRoom()	-> 	der Spieler hat einen verbotenen Raum verlassen
//	6.	ZS_ClearRoom()		-> 	der Spieler hat die Aufforderung, den Raum zu
//								verlassen nicht befolgt
//  7. 	ZS_GuardPassage()	->  Spieler hat verbotenen Durchgang durchschritten
////////////////////////////////////////////////////////////////////////////////////////
func void ZS_AssessWarn()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_AssessWarn");
	PrintGlobals(PD_ZS_CHECK);
	C_ZSInit();

	var string nextWP;

	Npc_PercEnable(self, PERC_ASSESSDAMAGE, ZS_ReactToDamage);
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_PercEnable(self, PERC_ASSESSENEMY, B_AssessEnemy);
	Npc_PercEnable(self, PERC_ASSESSFIGHTER, B_AssessFighter);
	Npc_PercEnable(self, PERC_ASSESSTHREAT, B_AssessFighter);
	Npc_PercEnable(self, PERC_DRAWWEAPON, B_AssessFighter);
	Npc_PercEnable(self, PERC_ASSESSMURDER, ZS_AssessMurder);
	Npc_PercEnable(self, PERC_ASSESSDEFEAT, ZS_AssessDefeat);
	Npc_PercEnable(self, PERC_CATCHTHIEF, ZS_CatchThief);
	Npc_PercEnable(self, PERC_ASSESSTHEFT, B_AssessTheft);
	Npc_PercEnable(self, PERC_OBSERVEINTRUDER, B_ObserveIntruder);
	Npc_PercEnable(self, PERC_ASSESSTALK, B_AssessTalk); // evtl. raus wg. Verarschen (vars werden neu initialisiert
	Npc_PercEnable(self, PERC_ASSESSENTERROOM, B_AssessEnterRoom);
	Npc_SetPercTime(self, 1);

	// ----------------- MH: für ItemSchweine (EBR-Haus. Lares, etc) ------------------
	if ((victim.aivar[AIV_ITEMSCHWEIN] == TRUE)
	&& (Npc_GetAttitude(self, victim) == ATT_FRIENDLY))
	{
		B_AttackQuick(self, other);
	};

	//-------- Fall 5/6: der Spieler im verbotenen Raum --------
	if (C_NpcIsGuard(self)
	&& ((Npc_IsInState(victim, ZS_CallGuardsOnEnterRoom)) || (Npc_WasInState(victim, ZS_CallGuardsOnEnterRoom)))
	&& !Npc_IsInState(self, ZS_GuardPassage)
	&& (Npc_GetAttitude(self, victim) == ATT_FRIENDLY))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...verlassener Portalraum gehört Schützling-Gilde!");
		Npc_PercEnable(self, PERC_ASSESSENTERROOM, B_ClearRoomEnterRoom);
		B_WhirlAround(self, other);
		B_PointAndShout(self, other, "$HEYYOU");
		Npc_PercDisable(self, PERC_MOVENPC);
		AI_SetWalkMode(self, NPC_RUN);
		AI_GotoNpc(self, other);
		B_Say(self, other, "$WHATDIDYOUINTHERE");
	};

	if (C_NpcIsGuardArcher(self)
	&& Npc_IsInState(victim, ZS_CallGuardsOnEnterRoom)
	&& (Npc_GetAttitude(self, victim) == ATT_FRIENDLY))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Warnung von Schützling, dessen Raum betreten/verlassen wurde!");
		if (other.aivar[AIV_HASBEENDEFEATEDINPORTALROOM] == FALSE)
		{
			B_WhirlAround(self, hero);
			B_PointAndShout(self, other, "$HEYYOU");
			B_DrawWeapon(self, other);
			B_Say(self, hero, "$GETOUTOFHERE");
			B_AttackQuick(self, hero);
		}
		else
		{
			PrintDebugNpc(PD_ZS_CHECK, "Eindringling ist schon bestraft worden");
		};
	};

	//-------- Fall 7: Spieler hat verbotenen Durchgang durchschritten --------
	if ((C_NpcIsGuard(self) || C_NpcIsGuardArcher(self) || C_NpcIsBoss(self))
	&& (Npc_WasInState(victim, ZS_GuardPassage) || Npc_IsInState(victim, ZS_GuardPassage))
	&& (Npc_GetAttitude(self, victim) == ATT_FRIENDLY))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Warnung von Torwache, deren Durchgang durchbrochen worde");

		B_WhirlAround(self, hero);
		B_DrawWeapon(self, other);
		B_SetAttackReason(self, AIV_AR_INTRUDER);
		Npc_SetTarget(self, hero);

		_ = Npc_GetTarget(self);
		AI_StartState(self, ZS_ProclaimAndPunish, 0, "");
	};

	//-------- Fall 8: Feind entdeckt --------
	if (Npc_IsInState(victim, ZS_AssessEnemy)
	&& (C_NpcIsGuard(self) || C_NpcIsGuardArcher(self))
	&& (Npc_GetAttitude(self, victim) == ATT_FRIENDLY)
	&& (Npc_GetAttitude(self, other) != ATT_FRIENDLY)
	&& !(Npc_IsPlayer(other) && (self.npcType == NpcType_Friend))
	&& (Npc_GetDistToNpc(self, victim) < HAI_DIST_HELPATTACKEDCHARGES))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Warnung vor Feind!");
		AI_StartState(self, ZS_AssessEnemy, 0, "");
	};

	//-------- Schleicher finden -------------------
	if ((Npc_GetWalkMode(other) == NPC_SNEAK))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Spieler schleicht rum ");
		if (Npc_GetDistToNpc(self, other) < PERC_DIST_INTERMEDIAT)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Spieler schleicht rum und ich bin gewarnt worden");
			Npc_SetTarget(self, other);

			_ = Npc_GetTarget(self);
			AI_StartState(self, ZS_ObserveSuspect, 0, "");
		};
	};

	//-------- Default-Reaktion auf Warnung --------
	//else
	//{ 	//SN: keine Default-Reaktion!!!
		//AI_Wait(self, 1.0);		//Reaktionszeit
		//B_WhirlAround(self, other);
	//};
};

func int ZS_AssessWarn_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP, "ZS_AssessWarn_Loop");
	AI_Wait(self, 2);			// ...2 Sekunden alles beobachten...
	return LOOP_END;			// ...dann Abbruch!
};

func void ZS_AssessWarn_End()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_AssessWarn_End");
	if (Npc_CanSeeNpcFreeLOS(self, other))
	{
		PrintDebugNpc(PD_ZS_CHECK, "ZS_AssessWarn End // Free Los");
		//JP: Temp und Perm sind beide wichtig, ich habe Perm mal noch dazugenommen
		if ((Npc_GetTempAttitude(self, other) == ATT_HOSTILE) || (Npc_GetPermAttitude(self, other) == ATT_HOSTILE))
		{
			PrintDebugNpc(PD_ZS_CHECK, "ZS_AssessWarn End // Free Los //HOSTILE");
			Npc_SetTarget(self, other);

			_ = Npc_GetTarget(self);
			AI_StartState(self, ZS_AssessEnemy, 0, "");
			return;
		}
		else
		{
			PrintDebugNpc(PD_ZS_CHECK, "ZS_AssessWarn End // Free Los // Not HOSTILE");
			B_AssessSc();
			return;
		};

		return;
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "ZS_AssessWarn  End // Can´T See");
		return;
	};
};
