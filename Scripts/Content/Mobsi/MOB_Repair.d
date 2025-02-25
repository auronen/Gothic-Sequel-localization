func int MOB_REPAIR_Condition()
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
func void MOB_REPAIR_S0()
{
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");

	PrintDebugMobsi("MOB_REPAIR_S0");
};

func void MOB_REPAIR_S1()
{
	if (Npc_IsPlayer(self))
	{
	}
	else
	{
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Hammer);
	};

	PrintDebugMobsi("MOB_REPAIR_S1");
};
