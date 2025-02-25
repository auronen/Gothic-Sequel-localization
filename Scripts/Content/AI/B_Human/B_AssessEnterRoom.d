/////////////////////////////////////////////////////////////////////////////////////
//	B_AssessEnterRoom
//	=================
//
//	Vorschaltfunktion, in der geprüft wird ob der Nsc den Zustand wechselt oder nicht
//	Wichtig ist, daß das ganze im Sichtbereich des bewertenden Nsc passiert
//	- War es ein Monster, daß den Raum betritt wird ZS_AssessMonster gestartet
//	- War es nicht der Spieler , wird die Wahrnehmung ignoriert und Nsc bleibt in seinem
//	  momentanen Zustand
//  - Ist der Nsc dem Spieler freundlich gesinnt wird die WN auch ignoriert
//	- Betritt der Spieler einen Raum ignorieren ihn BogenWachen
//	- Betritt der Spieler einen Raum gehen Wachen in den ZS_ClearRoom, wenn sie freundlich
//	  zum Besitzter des Raumes oder dessen Gilde sind und nah genug sind
//	- Nsc´s verhalten sich wie Wachen, wenn es Ihr Raum ist oder sie freundlich zur Gilde
//	  des Raumbesitzers sind
//	- Beim Verlassen des Raumes wird der Sc, von Nscs die nah genug sind, darauf angesprochen
//	  was er in dem Raum verloren hatte
////////////////////////////////////////////////////////////////////////////////////////
func void B_AssessEnterRoom()
// JP: Auch hier sind die Nsc´s nah genug ( PerceptionRange) --> kein ZS_WarnANdPunish
{
	PrintDebugNpc(PD_ZS_FRAME, "B_AssessEnterRoom");

	var int self_guild;
	self_guild = self.guild;

	PrintGlobals(PD_ZS_CHECK);

	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	PrintGuild(PD_ZS_CHECK, portalguild);

	var int formerportalguild;
	formerportalguild = Wld_GetFormerPlayerPortalGuild();
	PrintGuild(PD_ZS_CHECK, formerportalguild);

	//-------- Monster betritt Raum ! --------
	if (!C_NpcIsHuman(other))
	{
		PrintDebugNpc(PD_ZS_CHECK, "Monster betritt Raum!");
		B_FullStop(self);
		AI_StartState(self, ZS_AssessMonster, 0, "");
	};

	//-------- NSC betritt Raum ! --------
	if (!Npc_IsPlayer(other))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...NSC betritt Raum!");
		return;
	};

	//-------- Beobachter ist NPCTYPE_FRIEND ! --------
	if ((C_NpcTypeIsFriend(self, other))
	|| (Npc_GetAttitude(self, other) == ATT_FRIENDLY))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...NSC ist NpcType_Friend oder ATT_FRIENDLY");
		return;
	};

	if (Npc_CanSeeNpcFreeLOS(self, other)
	// JP: Nur noch Sicht ist relevant (klappt so nicht)
	|| (!C_BodyStateContains(other, BS_SNEAK) && (Npc_GetDistToNpc(self, other) < HAI_DIST_HEARROOMINTRUDER)))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Nsc sieht/hört Eindringling!");

		if (C_NpcIsGuard(self))
		{
			//-------- NSC ist Wache --------
			PrintDebugNpc(PD_ZS_CHECK, "...Nsc ist Wache!");

			if ((portalguild != GIL_NONE)
			&& (Wld_GetGuildAttitude(self_guild, portalguild) == ATT_FRIENDLY))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...betretener Portalraum gehört Schützling-Gilde!");
				B_FullStop(self);
				AI_StartState(self, ZS_ClearRoom, 0, "");
			}
			else if ((formerportalguild != GIL_NONE)
			&& (Wld_GetGuildAttitude(self_guild, formerportalguild) == ATT_FRIENDLY))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...verlassener Portalraum gehört Schützling-Gilde!");
				B_FullStop(self);
				B_WhirlAround(self, other);
				B_PointAndShout(self, other, "$HEYYOU");
				Npc_PercDisable(self, PERC_MOVENPC);
				AI_SetWalkMode(self, NPC_RUN);
				AI_GotoNpc(self, other);
				B_Say(self, other, "$WHATDIDYOUINTHERE");
			};
		}
		else if (C_NpcIsGuardArcher(self))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...ich bin Fernkampfwache und ignoriere Räume betreten grundsätzlich!");
			Npc_PercEnable(self, PERC_OBSERVEINTRUDER, B_ObserveIntruder);
			AI_ContinueRoutine(self);
		}
		else
		{
			//-------- NSC ist KEINE Wache --------
			PrintDebugNpc(PD_ZS_CHECK, "...Nsc ist KEINE Wache!");

			if ((Npc_GetDistToNpc(self, other) < HAI_DIST_CLEARROOM)
			&& (portalguild != GIL_NONE)
			&& ((self_guild == portalguild) || (Wld_GetGuildAttitude(self_guild, portalguild) == ATT_FRIENDLY)))
			{
				//---- Raum wurde betreten ----
				PrintDebugNpc(PD_ZS_CHECK, "...SC nah & betretener Portalraum gehört Gilde des NSCs");
				B_FullStop(self);
				AI_StartState(self, ZS_ClearRoom, 0, "");
				return;
			};

			if ((Npc_GetDistToNpc(self, other) < HAI_DIST_CLEARROOM)
			&& (formerportalguild != GIL_NONE)
			&& ((self_guild == formerportalguild) || (Wld_GetGuildAttitude(self_guild, formerportalguild) == ATT_FRIENDLY)))
			{
				//---- Raum wurde verlassen ----
				PrintDebugNpc(PD_ZS_CHECK, "...SC nah & SC verläßt eigenen Portalraum");
				B_FullStop(self);
				B_WhirlAround(self, other);
				B_PointAndShout(self, other, "$HEYYOU");
				Npc_PercDisable(self, PERC_MOVENPC);
				AI_SetWalkMode(self, NPC_RUN);
				AI_GotoNpc(self, other);
				B_Say(self, other, "$WHATDIDYOUINTHERE");
			};
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "...NSC kann den Eindringling weder sehen noch hören!");
	};
};
