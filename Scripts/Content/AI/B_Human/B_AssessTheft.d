// ******************** für AIV_ITEMSCHWEIN *********************

func void B_GuardItemsAssessTheft()
{
	PrintDebugNpc(PD_ZS_CHECK, "B_GuardItemsAssessTheft");

	if (Npc_IsPlayer(other))
	{
		if (Hlp_IsValidItem(item) && !Hlp_IsValidNpc(victim)) // KEIN TASCHENDIEBSTAHL
		{
			if (Npc_CanSeeNpcFreeLOS(self, other))
			{
				B_SayOverlay(self, other, "$HANDSOFF");
				Npc_SendPassivePerc(self, PERC_ASSESSWARN, self, other);

				if (C_AmIStronger(self, other))
				{
					AI_StandUp(self);
					AI_StartState(self, ZS_CatchThief, 0, "");
				};
			};
		};
	};
};

// ************ B_AssessTheft *************

func void B_AssessTheft()
// 8.5.00 Inklusive Gildenbesitzflag umgesetzt
{
	// MH: Itemschweine behmen IMMER DIEBSTAHL AN (wenn nicht Taschendiebstahl)
	if (self.aivar[AIV_ITEMSCHWEIN] == TRUE)
	{
		B_GuardItemsAssessTheft();
	};

	PrintDebugNpc(PD_ZS_CHECK, "B_AssessTheft");

	var int other_guild;
	var int self_guild;
	var int item_ownerguild;

	other_guild = other.guild;
	self_guild = self.guild;
	// JP: Es gibt keinen Diebstahl von Nsc´s, nur das Aufheben von Items verursacht eine Theft-Wn, die hierdurch abgefangen wird und außerdem verhindert, daß zwei Leute ein Item aufheben

	if (!Npc_IsPlayer(other))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...anderer Nsc hat ein Item aufgehoben");
		return;
	};

	AI_QuickLook(self, other);
	if (Npc_CanSeeNpc /*FreeLOS*/ (self, other))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...NSC kann den Dieb sehen!");
		if (Hlp_IsValidItem(item) && !Hlp_IsValidNpc(victim))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Item wurde aufgehoben!");
			item_ownerguild = item.ownerguild;
			if (Npc_OwnedByNpc(item, self))
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Item gehört NSC!");
				Npc_ClearAIQueue(self);
				C_LookAtNpc(self, other);
				AI_StartState(self, ZS_CatchThief, 0, "");
				return;
			}
			else if (Wld_GetGuildAttitude(self_guild, item_ownerguild) == ATT_FRIENDLY && Wld_GetGuildAttitude(self_guild, other_guild) != ATT_FRIENDLY)
			{
				B_FullStop(self);
				PrintDebugNpc(PD_ZS_CHECK, "Gilden-Bes.");
				C_LookAtNpc(self, other);
				AI_StartState(self, ZS_CatchThief, 0, "");
				return;
			}
			else if (C_IsWantedItem(self, item))
			{
				B_FullStop(self);
				PrintDebugNpc(PD_ZS_CHECK, "Wanted Item");
				if (C_AmIStronger(self, other) && (!Wld_DetectItem(self, ITEM_MULTI)))
				{
					AI_StartState(self, ZS_ObservePerson, 0, "");
				}
				else
				{
					Npc_ClearAIQueue(self);
					AI_QuickLook(self, other);
					B_Say(self, other, "$YOUCANKEEPTHECRAP");
					AI_ContinueRoutine(self);
				};
			};
		}
		else // ist dann automatisch Taschendiebstahl
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Taschendiebstahl!");
			if (C_NpcIsHuman(victim)
			&& !C_NpcIsDown(victim)
			&& (Wld_GetGuildAttitude(self.guild, victim.guild) == ATT_FRIENDLY
			|| Wld_GetGuildAttitude(self.guild, victim.guild) == ATT_NEUTRAL
			|| Npc_GetPermAttitude(self, other) == ATT_ANGRY)) // JP: !!! Wenn auch Diebstahl beim zweiten mal PErm Hostile auslösen soll hier Abfrage	trennen
			{
				PrintDebugNpc(PD_ZS_CHECK, "...Opfer FRIENDLY/NEUTRAL oder Dieb ANGRY");
				B_FullStop(self);
				C_LookAtNpc(self, other);
				B_PointAndShout(self, other, "$BEHINDYOU");

				Npc_SendPassivePerc(self, PERC_ASSESSWARN, victim, other); // Im Auge behalten, ob SinglePerc reicht um den Dieb durch Bewegung (CAtchThief in AssessWarn) den Dieb mitzubekommen
				AI_StartState(self, ZS_ObservePerson, 0, "");
				return;
			};
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_CHECK, "...NSC kann den Dieb NICHT sehen!");
	};
};
