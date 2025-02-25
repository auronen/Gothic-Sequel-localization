/////////////////////////////////////////////////////////////////////////////////////
//	ZS_CatchThief
//	=============
//	Wird von der Wahrnehmung CatchThief angesprungen (Nsc bemerkt er wird beklaut)
// 	Was passiert
//	1. Es wird geprüft, ob das ganze in einem Portalraum stattgefunden hat und
//	wenn das zutrifft wird die PLAYERISINROOM-Var auf true gesetzt, dasist wichtig, falls
//	schlafende Nscs beklaut werden
//	2. Die Attitüde für den Nsc wird geseztz
//	3. AssessEnemy wird gestartet um Vergeltung üben zu können
////////////////////////////////////////////////////////////////////////////////////////
func void ZS_CatchThief()
{
	PrintDebugNpc(PD_ZS_CHECK, "ZS_CatchThief");
	PrintGlobals(PD_ZS_CHECK);
	C_ZSInit();

	Npc_PercEnable(self, PERC_ASSESSDAMAGE, ZS_ReactToDamage);
	Npc_PercEnable(self, PERC_OBSERVEINTRUDER, B_ObserveIntruder);
	Npc_PercEnable(self, PERC_ASSESSFIGHTSOUND, B_AssessFightSound);
	Npc_PercEnable(self, PERC_ASSESSWARN, B_AssessWarn);
	Npc_PercEnable(self, PERC_ASSESSTALK, B_AssessTalk);
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	// Checken ob der Sc sich in einem Portalraum befindet, wenn ja merken
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	PrintGuild(PD_ZS_CHECK, portalguild);
	if (portalguild != GIL_NONE)
	{
		self.aivar[AIV_PLAYERISINROOM] = TRUE;
	};

	if (self.aivar[AIV_ITEMSCHWEIN] == FALSE)
	{
		B_FullStop(self);
		B_WhirlAround(self, other);

		B_GuildAssignTheft();
	};

	B_Say(self, other, "$YOUSTOLEFROMME");
	AI_StartState(self, ZS_AssessEnemy, 0, "");
};
