//////////////////////////////////////////////////////////////////////////
//	B_AssessSC
//	==========
//	Wird angesprungen durch:
//	- PERC_ASSESSPLAYER
//	- B_AssessQuietSound (kann Geräuschverursacher nicht sehen)
//
//	1.	SC steckt im Körper eines NSCs (Zauber)	->	Angriff
//	2. 	IMPORTANT-Infos für den SC vorhanden	->	Dialog
//	3.	SC im Kampfmodus						->	B_AssessFighter
//	4.	SC ist nahe								->	NSC dreht sich zum SC
//	5.	SC trägt Waffen des NSCs				->	ZS_GetBackBelongings
//	5. 	Nsc ist eine Wache und der SC ist bis auf 5m rangekommen
//	--> ZS_ObserveIntruder
//////////////////////////////////////////////////////////////////////////
func void B_AssessSc()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_AssessSc");

	if (Npc_CanSeeNpcFreeLOS(self, other)
	|| self.aivar[AIV_FEMALE]) //SN: Story-Hack, weil Npc_CanSeeNpcFreeLOS() durch Gitter nicht hindurchsehen kann!
	{
		PrintDebugNpc(PD_ZS_CHECK, "...SC sichtbar!");

		//----------- Übernommene NSCs werden von GateGuards geplättet!------------------
		var C_Npc her; her = Hlp_GetNpc(PC_Hero);

		if (!B_CompareNpcInstance(her, hero)
		&& Npc_IsInState(self, ZS_GuardPassage))
		//Npc_IsInState(other, ZS_Controlled) funzt nicht!
		{
			if (Wld_GetGuildAttitude(self.guild, other.guild) != ATT_FRIENDLY)
			{
				B_FullStop(self);
				B_Say(self, other, "$NOWWAIT");
				B_IntruderAlert(self, other);
				B_SetAttackReason(self, AIV_AR_INTRUDER);
				B_AttackProper(self, other);
			};
		};

		//-------- Auf geklaute Waffen checken --------
		if (Npc_GetDistToNpc(self, other) < PERC_DIST_DIALOG)
		{
			B_CheckStolenEquipment();
		};

		//-------- Auf Vergabe von Infos & Missionen checken --------
		if (Npc_GetDistToNpc(self, other) < PERC_DIST_DIALOG)
		{
			_ = B_CheckForImportantInfo(self, other);
		};

		//-------- SC im Kampfmodus ? --------
		if (C_NpcIsInFightMode(other))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC im Kampfmodus!");
			B_AssessFighter();
			return;
		};

		//-------- Zum Spieler drehen --------
		if (!C_BodyStateContains(other, BS_SNEAK))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...SC schleicht NICHT!");
			// Wachen sind von Natur aus mißtrauischer und gucken nach was de Spieler in ihrer Nähe macht
			if ((Npc_IsInRoutine(self, ZS_GuardWP)
			|| Npc_IsInRoutine(self, ZS_GuardFP))
			&& (Npc_GetDistToNpc(self, other) < HAI_DIST_GUARDOBSERVEINTRUDER))
			{
				AI_StartState(self, ZS_ObserveIntruder, 1, "");
				return;
			};

			if (Npc_GetDistToNpc(self, other) < HAI_DIST_OBSERVEINTRUDER)
			{
				PrintDebugNpc(PD_ZS_CHECK, "...SC in ObserveIntruder-Reichweite!");
				B_ObserveIntruder();
				return;
			}
			else
			{
				PrintDebugNpc(PD_ZS_CHECK, "...SC außerhalb ObserveIntruder-Reichweite!");
			};
		};
	};

	//-------- Durchgangswachen resetten ! --------
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN)
	|| (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...SC wurde von Durchgangswachen verwarnt!");
		PrintDebugInt(PD_ZS_CHECK, "hero.aivar[AIV_GUARDPASSAGE_STATUS] = ", hero.aivar[AIV_GUARDPASSAGE_STATUS]);

		if (Npc_IsInState(self, ZS_GuardPassage) && (Npc_GetDistToNpc(self, hero) > HAI_DIST_GUARDPASSAGE_RESET))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Status für Durchgangswachen zurücksetzen!");
			hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
		};
	};
};
