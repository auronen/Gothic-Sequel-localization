// B_ClearRoomRefuseTalk
// JP: Ist notwendig, damit die Nsc auf Ansprechen reagieren, aber nicht in ihren normalen Talk verfallen
func void B_ClearRoomRefuseTalk()
{
	B_Say(self, other, "$GETOUTOFHERE");
	AI_StopProcessInfos(self);
};

func void ZS_ClearRoom()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_ClearRoom");

	Npc_PercEnable(self, PERC_ASSESSDAMAGE, ZS_ReactToDamage);
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_PercEnable(self, PERC_ASSESSENTERROOM, B_ClearRoomEnterRoom);
	Npc_PercEnable(self, PERC_ASSESSUSEMOB, B_ClearRoomUseMob);
	//Npc_PercEnable(self, PERC_ASSESSFIGHTSOUND, B_AssessFightSound);
	Npc_PercEnable(self, PERC_MOVENPC, B_StopGotoHero);
	Npc_PercEnable(self, PERC_ASSESSTALK, B_ClearRoomRefuseTalk);
	C_ZSInit();
	B_WhirlAround(self, other);
	B_PointAndShout(self, other, "$HEYYOU");
	AI_SetWalkMode(self, NPC_RUN);
	Npc_SetTarget(self, other);
	self.aivar[AIV_PLAYERISINROOM] = TRUE;
};

func int ZS_ClearRoom_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP, "ZS_ClearRoom_Loop");

	_ = Npc_GetTarget(self);

	//-------- SC hat mittlerweile den Raum verlassen --------
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	PrintGuild(PD_ZS_CHECK, portalguild);

	if ((portalguild == GIL_NONE)
	|| (Wld_GetGuildAttitude(self.guild, portalguild) != ATT_FRIENDLY)
	|| (Npc_GetAttitude(self, other) == ATT_FRIENDLY))
	{
		B_FullStop(self);
		AI_ContinueRoutine(self);
		self.aivar[AIV_PLAYERISINROOM] = FALSE;
		return LOOP_END;
	};

	//-------- NSC hat den SC erreicht ! --------
	if (Npc_GetDistToNpc(self, other) < PERC_DIST_DIALOG
	&& Npc_CanSeeNpc(self, other))
	{
		B_FullStop(self);
		return LOOP_END;
	};

	AI_GotoNpc(self, other);
	AI_Wait(self, 0.5);

	return LOOP_CONTINUE;
};

func void ZS_ClearRoom_End()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_ClearRoom_End");

	AI_TurnToNpc(self, other);
	if (C_AmIStronger(self, other))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Nsc ist stärker!");
		B_Say(self, other, "$GETOUTOFHERE");
		AI_Wait(self, 3);
		AI_StartState(self, ZS_ClearRoomWait, 0, "");
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Nsc ist schwächer!");
		B_Say(self, other, "$GETOUTORICALLGUARDS");
		AI_Wait(self, 3);
		AI_StartState(self, ZS_ClearRoomWait, 0, "");
	};

	// JP: Hier noch mal warten, bevor in ZS_ClearRoomWait die Waffe gezogen wird und eine weitere Warnung ausgesprochen wird
};

func void ZS_ClearRoomWait()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_ClearRoomWait");

	Npc_PercEnable(self, PERC_ASSESSDAMAGE, ZS_ReactToDamage);
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_PercEnable(self, PERC_ASSESSENTERROOM, B_ClearRoomEnterRoom);
	Npc_PercEnable(self, PERC_ASSESSUSEMOB, B_ClearRoomUseMob);
	Npc_PercEnable(self, PERC_ASSESSFIGHTSOUND, B_AssessFightSound);
	Npc_PercEnable(self, PERC_ASSESSTALK, B_ClearRoomRefuseTalk);
	C_ZSInit();
	B_DrawWeapon(self, other);
	// JP: Hier iszt jetzt auch ein Warnen und Steigern System vorgesehen, aber Alex wollte erstmal altes Svm benutzt haben
	// !!! Fixme
	B_Say(self, other, "$GETOUTOFHERE");
};

func void ZS_ClearRoomWait_Loop()
{
	/*
	if (other.aivar[AIV_DIDWAITTOCLEARROOM] == 1)
	{
		other.aivar[AIV_DIDWAITTOCLEARROOM] = 0;
		AI_ContinueRoutine(self);
	};
	*/
	PrintDebugNpc(PD_ZS_LOOP, "ZS_ClearRoomWait_Loop");
	B_SmartTurnToNpc(self, other);
	if ((Wld_GetPlayerPortalGuild() == GIL_NONE)
	|| (Npc_GetAttitude(self, other) == ATT_FRIENDLY))
	{
		if (C_AmIStronger(self, other))
		{
			AI_TurnToNpc(self, other);
			B_Say(self, other, "$WISEMOVE");
		};

		self.aivar[AIV_PLAYERISINROOM] = FALSE;
		AI_ContinueRoutine(self);
	};

	AI_Wait(self, 1);
};

func void ZS_ClearRoomWait_End()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_ClearRoomWait_End");
};

func void B_ClearRoomEnterRoom()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_ClearRoomEnterRoom");
	B_FullStop(self);
	if (Npc_CanSeeNpc(self, other))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...NSC kann SC sehen!");
		if (Wld_GetPlayerPortalGuild() == GIL_NONE)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC nicht mehr im Raum!");
			if (C_AmIStronger(self, other))
			{
				AI_TurnToNpc(self, other);
				B_Say(self, other, "$WISEMOVE");
			};

			self.aivar[AIV_PLAYERISINROOM] = FALSE;
			AI_ContinueRoutine(self);
		};
	}
	// JP: Nsc´s die den Spieler den Raum nicht verlassen sehen sagen zwar nichts, aber brechen
	// trotzdem den ZS_ClearRoom ab, damit sie nicht bis zum entsprechenden Raum laufen um dann
	// erst da festzustellen, der Spieler ist ja gar nicht mehr im Raum
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "...SC nicht mehr im Raum!, kann es aber nicht sehen");
		if (Wld_GetPlayerPortalGuild() == GIL_NONE)
		{
			self.aivar[AIV_PLAYERISINROOM] = FALSE;
			AI_ContinueRoutine(self);
		};
	};
};

func void B_ClearRoomUseMob()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_ClearRoomUseMob");

	if (Npc_IsDetectedMobOwnedByNpc(other, self)
	|| Npc_IsDetectedMobOwnedByGuild(other, self.guild)
	// Damit sich Wachen etc einmischen, wenn der Spieler an einer Kiste in einer Hütte rumfummelt
	|| (Wld_GetGuildAttitude(self.guild, B_GetMobGuild(other)) == ATT_FRIENDLY))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...MOB gehört NSC oder seiner Gilde!");

		B_FullStop(self);
		Npc_PercDisable(self, PERC_ASSESSUSEMOB);
		// JP: An Kisten in Hütten gehen wird als Diebstahl bewertet und erfordert deshalb Attitüdenänderung und Variablenänderung
		B_GuildAssignTheft();

		if (C_AmIStronger(self, other))
		{
			B_Say(self, other, "$DIRTYTHIEF");
			B_AttackQuick(self, other);
		}
		else
		{
			AI_StartState(self, ZS_CallGuardsOnEnterRoom, 0, "");
		};
	};
};
