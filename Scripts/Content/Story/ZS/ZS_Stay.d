//////////////////////////////////////////////////////////////////////////
//	ZS_Stay
//	=======
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP
//////////////////////////////////////////////////////////////////////////
func void ZS_Stay()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Stay");

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
	AI_GotoWP(self, self.wp);						// Gehe zum Tagesablaufstart
	AI_AlignToWP(self);
};

func void ZS_Stay_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Stay_Loop");

	AI_Wait(self, 1);
};

func void ZS_Stay_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Stay_End");
	self.senses = hero.senses;

	C_StopLookAt(self);
};

////////////////////////////////////////////////////////////////////////
//	ZS_Stay()-Vorschaltung für Gladiatoren!
////////////////////////////////////////////////////////////////////////
func void ZS_ArenaStay()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArenaStay");

	B_SetPerception(self);

	B_Arena_RegainDroppedWeapon(Hlp_GetInstanceID(self));

	AI_StartState(self, ZS_Stay, 1, "");
};
