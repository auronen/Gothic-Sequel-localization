func void B_GuildGreetings()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_GuilGreetings");

	if (Npc_GetTempAttitude(self, other) == ATT_FRIENDLY)
	{
		PrintDebugNpc(PD_ZS_CHECK, "B_GuilGreetings friend");
		B_Say(self, other, "$FRIENDLYGREETINGS");
	};
};
