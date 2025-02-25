//////////////////////////////////////////////////////////////////////////
//	ZS_AssessMurder
//	===============
//	Wird ausschließlich durch
//
//	- PERC_ASSESSMURDER
//
//	angesprungen. Folgende Voraussetzungen müssen erfüllt sein:
//
//	- keine!
//
//	Macht folgendes:
//	1.	Mord von Monster
//		->	ZS_AssessMonster
//	2.	Mord an Monster
//		->	ignorieren
//	3.	Mord ohne Monsterbeteiligung
//		->	News-Eintrag generieren
//		->	Wachen, deren Schützlinge besiegt wurden 	-> ZS_ProclaimAndPunish
//		->	war das Opfer ein Freund					-> B_AssessEnemy
//		->	Wenn ANGRY/HOSTILE zum Mordopfer 			-> spöttischer Kommentar
//////////////////////////////////////////////////////////////////////////
func void ZS_AssessMurder()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_AssessMurder");

	C_ZSInit();

	Npc_PercEnable(self, PERC_ASSESSENEMY, B_AssessEnemy);

	Npc_PercEnable(self, PERC_ASSESSDAMAGE, ZS_ReactToDamage);
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_PercEnable(self, PERC_ASSESSSURPRISE, ZS_AssessSurprise);

	PrintGlobals(PD_ZS_CHECK);
	PrintAttitudes(PD_ZS_CHECK);

	if (Npc_CanSeeNpcFreeLOS(self, other)
	|| Npc_CanSeeNpcFreeLOS(self, victim))
	{
		//-------- Mord an Monster ! --------
		if (!C_NpcIsHuman(victim))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Mord an Monster!");
			B_WhirlAround(self, victim);
			return;
		};

		//-------- Mord von Monster ! --------
		if (!C_NpcIsHuman(other))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...Mord von Monster!");
			Npc_SetTarget(self, other);

			_ = Npc_GetTarget(self);
			AI_StartState(self, ZS_AssessMonster, 0, "");
			return;
		};

		if (C_NpcIsHuman(victim)
		&& (C_NpcIsHuman(other))) 	// JP: Sollte eigentlich überflüssig sein, weil im Zweig oben die Funktion verlassen wird,
		//	ist aber leider vorgekommen, daß Monster als Mörder für den Spieler zählten, deshalb
		// zur Sicherheit nochmal diese Abfrage
		{
			int_Murderid1 = Hlp_GetInstanceID(victim);

			PrintDebugInt(PD_ZS_CHECK, "MurderID1 ", int_MurderId1);
			PrintDebugInt(PD_ZS_CHECK, "MurderID2 ", int_MurderId2);
			//JP: Wenn ein Nsc getötet worden ist, wird das gemerkt, nicht wenn der Spieler getötet wurde
			if (!B_CompareNpcInstance(victim, hero))
			{
				PrintDebugNpc(PD_ZS_CHECK, "B_CombatAssessMurder seen // victim is not Hero");
				B_Say(self, other, "$HEKILLEDHIM");	//MH: von B_AssessAndMemorize hierhin kopiert, weil sonst IMMER der Spruch kam! JP: Nur bei Mord vom SPieler kommt ein Kommentar
			};

			if (int_MurderId1 != int_MurderId2)
			{
				int_MurderId2 = int_MurderId1;
				PrintDebugNpc(PD_ZS_CHECK, "Anderer Mord");
				int_Murdercount = int_Murdercount + 1;
			}
			else
			{
				int_Murderid2 = Hlp_GetInstanceID(victim);
				PrintDebugInt(PD_ZS_CHECK, "MurderID2 nach Tausch ", int_MurderId2);
			};
		};

		PrintDebugInt(PD_ZS_CHECK, "Anzahl Morde Spieler ", int_MurderCount);

		PrintDebugNpc(PD_ZS_CHECK, "ZS_AssessMurder/Npc_CanSeeNpc");

		//-------- Morden Sehen & Merken ! --------
		B_WhirlAround(self, other);

		//-------- Schützling einer Wache wurde umgehauen ! --------
		if (C_ChargeWasAttacked(self, victim, other))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...NSC ist Wache und ein Schützling wurde gemordet!");
			B_DrawWeapon(self, other);
			AI_StartState(self, ZS_ProclaimAndPunish, 0, "");
			return;
		};

		//-------- führte Mordbewertung in B_AssessAndMemorize zu HOSTILE ? --------
		if (Npc_GetAttitude(self, other) == ATT_HOSTILE)
		{
			PrintDebugNpc(PD_ZS_CHECK, "...hostile zum Mörder!");
			B_AssessEnemy();
		};
	};
};
