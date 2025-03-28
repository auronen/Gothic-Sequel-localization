func void B_AssessUseMob()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_AssessUseMob");

	var string detectedMob;
	detectedMob = Npc_GetDetectedMob(other);
	PrintDebugNpc(PD_ZS_CHECK, detectedMob);

	if (Npc_CanSeeNpcFreeLOS(self, other))
	{
		if (Npc_IsDetectedMobOwnedByNpc(other, self)
		|| Npc_IsDetectedMobOwnedByGuild(other, self.guild))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...MOB gehört NSC oder seiner Gilde!");
			if (Npc_GetPermAttitude(self, other) == ATT_FRIENDLY || self.guild == other.guild)
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Manipulator ist FRIENDLY oder in gleicher Gilde!");
				B_Say(self, other, "$HANDSOFF");
			}
			else
			{
				PrintGlobals(PD_ZS_CHECK);

				//---- Täter vermöbeln ----
				Npc_SetTempAttitude(self, ATT_HOSTILE);
				Npc_ClearAIQueue(self);
				B_WhirlAround(self, other);
				B_SayOverlay(self, other, "$HANDSOFF");
				// JP: Ist ein heikler Fall, eigentlich sollten die Nsc´s nah genug sein, evtl. aber noch auf ZS_WarnAndPunish umbauen
				AI_SetWalkMode(self, NPC_RUN);
				B_AttackQuick(self, other);
			};
		}
		else
		{
			PrintDebugNpc(PD_ZS_DETAIL, "not my MoB");
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL, "kann SC nicht sehen");
	};
};
