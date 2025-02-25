//////////////////////////////////////////////////////////////////////////
//	ZS_AssessQuietSound
//	===================
//	(nicht mehr benötigt!)
//////////////////////////////////////////////////////////////////////////
func void ZS_AssessQuietSound()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_AssessQuietSound");
	C_ZSInit();

	Npc_PercEnable(self, PERC_ASSESSDAMAGE, ZS_ReactToDamage);
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_PercEnable(self, PERC_ASSESSSURPRISE, ZS_AssessSurprise);
	Npc_PercEnable(self, PERC_ASSESSENEMY, B_AssessEnemy);
	Npc_PercEnable(self, PERC_ASSESSFIGHTER, B_AssessFighter);
	Npc_PercEnable(self, PERC_ASSESSTHREAT, B_AssessFighter);
	Npc_PercEnable(self, PERC_ASSESSWARN, B_AssessWarn);
	Npc_PercEnable(self, PERC_ASSESSMURDER, ZS_AssessMurder);
	Npc_PercEnable(self, PERC_ASSESSDEFEAT, ZS_AssessDefeat);
	Npc_PercEnable(self, PERC_ASSESSFIGHTSOUND, B_AssessFightSound);
	Npc_PercEnable(self, PERC_CATCHTHIEF, ZS_CatchThief);
	Npc_PercEnable(self, PERC_ASSESSTHEFT, B_AssessTheft);
	Npc_PercEnable(self, PERC_ASSESSTALK, B_RefuseTalk);
	Npc_PercEnable(self, PERC_ASSESSENTERROOM, B_AssessEnterRoom);
	Npc_PercEnable(self, PERC_ASSESSUSEMOB, B_AssessUseMob);

	AI_TurnToNpc(self, other);
};
