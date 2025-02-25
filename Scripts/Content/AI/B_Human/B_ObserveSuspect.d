func void B_ObserveSuspect()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_ObserveSuspect");
	//-------- Beobachter ist NPCTYPE_FRIEND ! --------
	if ((self.npcType == NpcType_Friend)
	|| (Npc_GetAttitude(self, other) == ATT_FRIENDLY))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...NSC ist NpcType_Friend oder ATT_FRIENDLY");
		return;
	};

	if (Npc_CanSeeNpc(self, other))
	{
		PrintDebugNpc(PD_ZS_FRAME, "...CanSee");
		Npc_SendPassivePerc(self, PERC_ASSESSWARN, self, other);
		Npc_SetTarget(self, other);

		_ = Npc_GetTarget(self);
		AI_StartState(self, ZS_ObserveSuspect, 1, "");
	};
};
