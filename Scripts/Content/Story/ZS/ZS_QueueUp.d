//////////////////////////////////////////////////////////////////////////
//	ZS_QueueUp
//	=======
//	Der NSC geht zum WP und sucht sich dort den nächsten Platz in einer
//	Warteschlange (FP_QUEUE)
//////////////////////////////////////////////////////////////////////////
func void ZS_QueueUp()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_QueueUp");

	//-------- Wahrnehmungen --------
	B_SetPerception(self);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;

	//-------- Vorbereitungen --------
	if (Npc_HasReadiedWeapon(self))
	{
		AI_SetWalkMode(self, NPC_RUN);
	}
	else
	{
		AI_SetWalkMode(self, NPC_WALK);
	};

	//-------- Grobpositionierung --------
	B_GotoNearWP(self, self.wp);						// Gehe zum Tagesablaufstart
};

func int ZS_QueueUp_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_QueueUp_Loop");

	B_GotoFP(self, "FP_QUEUE");

	var int zufall;
	zufall = Hlp_Random(100);

	if (zufall >= 90)
	{
		B_Bored(self);
	};

	AI_Wait(self, 1);

	return LOOP_CONTINUE;
};

func void ZS_QueueUp_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_QueueUp_End");
};
