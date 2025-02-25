//***********************************************************************************************
//
//	B_LookAround
//	------------
//
//	wird von ZS_Flee aufgerufen, damit der Nsc sich noch mal umsieht und per aktiver Wahrnehmung
//	eventuelle Feinde oder Gefahren erkennt
//
//***********************************************************************************************/

func void B_LookAround()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_LookAround");
	Npc_SetPercTime(self, 0.5);
	AI_StandUp(self);
	AI_PlayAni(self, "T_SEARCH");
};
