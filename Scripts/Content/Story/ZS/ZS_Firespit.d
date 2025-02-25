func void ZS_Firespit()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_Firespit");
	B_SetPerception(self);
	AI_SetWalkMode(self, NPC_WALK);
	AI_GotoWP(self, self.wp);
	AI_AlignToWP(self);
	AI_RemoveWeapon(self);
};

func int ZS_Firespit_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP, "ZS_Firespit_Loop");

	if (Npc_HasItems(self, ItLs_TorchFirespit) <= 1)
	{
		CreateInvItem(self, ItLs_TorchFirespit);
	};

	var int spitreaktion;
	spitreaktion = Hlp_Random(100);

	if (spitreaktion >= 50)
	{
		AI_UseItemToState(self, ItLs_TorchFirespit, 4);
		AI_UseItemToState(self, ItLs_TorchFirespit, -1);
		//AI_AlignToWP(self);
	};

	AI_Wait(self, 1);

	return LOOP_CONTINUE;
};

func void ZS_Firespit_End()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_Firespit_End");
	AI_UseItemToState(self, ItLs_TorchFirespit, -1);
};
