/************************************************
*      NSC ohne Wahrnehmung benutzt Bett,       *
* wenn kein Bett da, macht der ZS_StandAround   *
*************************************************/

func void ZS_SleepNoSense()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_SleepNoSense");

	AI_SetWalkMode(self, NPC_WALK);
	if (!C_BodyStateContains(self, BS_MOBINTERACT))
	{
		if (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == 0)
		{
			AI_GotoWP(self, self.wp);
		};
	};

	AI_StartState(self, ZS_SleepBedNoSense, 1, "");
};

func void ZS_SleepBedNoSense()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_SleepBedNoSense");

	if (Wld_IsMobAvailable(self, SCEMENAME_BED))
	{
		_ = AI_UseMob(self, SCEMENAME_BED, 1);
	}
	else if (Wld_IsMobAvailable(self, SCEMENAME_BEDHIGH) || Wld_IsMobAvailable(self, SCEMENAME_BEDLOW))
	{
		_ = AI_UseMob(self, SCEMENAME_BEDHIGH, 1); //Mehrfache Mob-Benutzung okay, weil nachfolgende UseMobs ignoriert werden, wenn UseMob schon aktiv ist
		_ = AI_UseMob(self, SCEMENAME_BEDLOW, 1); // Mobs werden nur benutzt, wenn NSC sie sehen kann und wenn sie frei sind (sagt Ulf)
	}
	else
	{
		// JP: Muß ohne den Endzustand gemacht werden, da im End die Schlafregenerierung vorgenommen wird
		// ist auch kein Problem , da im End nur die Mobsis abgemeldet und eben HP voll gemacht werden
		AI_StartState(self, ZS_StandAround, 0, "");
	};
};

func int ZS_SleepBedNoSense_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_SleepBedNoSense_Loop");

	/* SN: Workaround dafür, daß Wld_IsMobAvailable() zwar TRUE geliefert hat, AI_UseMob() aber gescheitert ist !
	if (!C_BodyStateContains(self, BS_MOBINTERACT)
	&& (Npc_GetStateTime(self) > 3))
	{
		AI_StartState(self, ZS_SitAround, 1, "");
	}; */

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_SleepBedNoSense_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_SleepBedNoSense_End");

	if (Wld_IsTime(07, 00, 08, 30))
	{
		B_Say(self, NULL, "$AWAKE");
	};

	_ = AI_UseMob(self, SCEMENAME_BEDHIGH, -1);
	_ = AI_UseMob(self, SCEMENAME_BEDLOW, -1);
	_ = AI_UseMob(self, SCEMENAME_BED, -1);
	// JP: Schlafen soll die Nsc´s voll regenerieren
	Npc_ChangeAttribute(self, ATR_HITPOINTS,(self.attribute[ATR_HITPOINTS_MAX] - self.attribute[ATR_HITPOINTS]));
};
