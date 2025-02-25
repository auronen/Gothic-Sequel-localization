////////////////////////////////////////////////////////////////////
// Nur Nscs dürfen die Säge benutzen
////////////////////////////////////////////////////////////////////
func int MOB_SAW_Condition()
{
	if (Npc_IsPlayer(self))
	{
		AI_PlayAni(self, "T_DONTKNOW");
		return FALSE;
	}
	else
	{
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////
//	Triggerfunktionen
//	=================
//	Auch wenn der Sc das Mobsi nicht benutzen kann werden hier für
//	den Nsc die Notwendigen Items verteilt
//////////////////////////////////////////////////////////////////
func void MOB_SAW_S0()
{
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");

	PrintDebugMobsi("MOB_SAW_S0");
};

func void MOB_SAW_S1()
{
	if (Npc_IsPlayer(self))
	{
	}
	else
	{
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Saw);
	};

	PrintDebugMobsi("MOB_SAW_S1");
};
