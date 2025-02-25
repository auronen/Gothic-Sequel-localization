//////////////////////////////////////////////////////////////////////////
//	B_Arena_ProclaimStart
//	===================
//	Gibt die Eröffnungssätze des Arenameisters am beginn eines Arena-
//	kampfes aus!
//	'arenamaster' enthält die Instanz des Verkündenden
//////////////////////////////////////////////////////////////////////////
func void B_Arena_ProclaimStart(var C_Npc arenamaster)
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_ProclaimStart");

	var C_Npc target;

	if (Arena_PlayerFight)
	{
		target = Hlp_GetNpc(PC_Hero);
	};

	AI_PlayAni(arenamaster, "T_GREETARENA");
	AI_Output(arenamaster, target, "MIL_122_ProclaimStart_12_01"); //(theatralisch) ICH GRÜSSE EUCH, GLADIATOREN!
	AI_PlayAni(arenamaster, "T_BEGINFIGHT");
	AI_Output(arenamaster, target, "MIL_122_ProclaimStart_12_02"); //KAMPFT NACH DEN REGELN UND KÄMPFT GUT!
	AI_Output(arenamaster, target, "MIL_122_ProclaimStart_12_03"); //MÖGE DER BESSERE GEWINNEN!
};
