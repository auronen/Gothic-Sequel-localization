//////////////////////////////////////////////////////////////////////////
//	ZS_AssessBody
//	=============
//	Diese Funktion wird von B_AssessBody aufgerufen und führt das
//	Plündern des Körpers 'other' durch.
//	Dabei versucht der NSC möglichst über das 'sichere' Wegnetz zu gehen
//	und nur letzte kleine Stückchen mit freier Wegsuche zurückzulegen
//	Nach dem Plündern wird ZS_HealSelf angesprungen, weil in ZS_Attack
//	viele Nsc´s gar nicht bis zu der Stelle kamen, an der ZS_HealSelf
//	angesprungen wurde
//////////////////////////////////////////////////////////////////////////
func void ZS_AssessBody()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_AssessBody");

	Npc_PercEnable(self, PERC_ASSESSDAMAGE, ZS_ReactToDamage);
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_PercEnable(self, PERC_ASSESSENEMY, B_AssessEnemy);
	Npc_PercEnable(self, PERC_ASSESSFIGHTER, B_AssessFighter);
	Npc_PercEnable(self, PERC_ASSESSMURDER, ZS_AssessMurder);
	Npc_PercEnable(self, PERC_ASSESSDEFEAT, ZS_AssessDefeat);
	Npc_PercEnable(self, PERC_ASSESSFIGHTSOUND, B_AssessFightSound);
	Npc_PercEnable(self, PERC_CATCHTHIEF, ZS_CatchThief);
	Npc_PercEnable(self, PERC_ASSESSTHEFT, B_AssessTheft);
	Npc_PercEnable(self, PERC_ASSESSTALK, B_RefuseTalk);

	//-------- Körper nahe genug dran ? --------
	if (Npc_GetDistToNpc(self, other) > PERC_DIST_INTERMEDIAT) 		// liegt der Körper etwas weiter weg...
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Körper zu weit weg!");
		AI_StartState(self, ZS_HealSelf, 0, "");
	};
};

func int ZS_AssessBody_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP, "ZS_AssessBody_Loop");

	B_FullStop(self);
	AI_GotoNpc(self, other);
	return LOOP_END;
};

func void ZS_AssessBody_End()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_AssessBody_End");
	//-------- Plündern --------
	if ((self.fight_tactic != FAI_HUMAN_RANGED) 			//Verhindern, daß Fernkampfwachen ihren Posten verlasen
	&& (self.npcType != NpcType_Friend) 					//NSC-Freunde plündern nicht
	&& (C_NpcIsHuman(self)
	&& (Npc_GetPermAttitude(self, other) == ATT_ANGRY)))	// JP: Alle Angry Charactere Plündern
	{
		PrintDebugNpc(PD_ZS_CHECK, "...kein purer Fernkämpfer und kein NSC-Freund!");
		AI_PlayAni(self, "T_PLUNDER");
		if (B_Plunder())
		{
			B_Say(self, other, "$ITookYourOre");
		}
		else
		{
			B_Say(self, other, "$ShitNoOre");
		};
	};

	AI_StartState(self, ZS_HealSelf, 1, "");
};
