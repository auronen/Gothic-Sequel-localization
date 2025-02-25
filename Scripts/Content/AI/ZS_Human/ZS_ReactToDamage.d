//////////////////////////////////////////////////////////////////////////
//
//	ZS_ReactToDamage
//	================
//	Wird durch:
//
//	- PERC_ASSESSDAMAGE
//	- einige Magiezustände	(nachtragen, welche)
//
//	aufgerufen. Vorraussetzungen:
//
//	- keine
//
//	Es passiert folgendes:
//
//	1.	Angreifer ist ein MENSCH
//		->	FRIENDLY zu SC-Angreifer		-> "Was soll das?"	-> dann ZS_ReactToDamageWaitFriendly_End
//		-> 	NEUTRAL/ANGRY zu SC-Angreifer	-> dann HOSTILE		-> ZS_AssessEnemy
//		->	NSC-Angreifer					-> ZS_AssessEnemy
//	2.	Angreifer ist ein MONSTER
//		-> ZS_AssessMonster
//
//////////////////////////////////////////////////////////////////////////
func void ZS_ReactToDamage()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_ReactToDamage");
	PrintGlobals(PD_ZS_CHECK);
	C_ZSInit();

	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_PercEnable(self, PERC_ASSESSMURDER, B_CombatAssessMurder);
	Npc_PercEnable(self, PERC_ASSESSDEFEAT, B_CombatAssessDefeat);

	B_WhirlAround(self, other);

	//-------- spezielle Reaktionen im Kampf --------
	if (self.aivar[AIV_SPECIALCOMBATDAMAGEREACTION])
	{
		B_SpecialCombatDamageReaction();
	};

	//-------- Merken ob Schaden durch Fernkampfwaffe/Magie verursacht wurde --------
	if (Npc_IsInFightMode(other, FMODE_FAR) || Npc_IsInFightMode(other, FMODE_MAGIC))
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = TRUE;
	}
	else
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = FALSE;
	};

	//-------- Angreifer ist Mensch/Ork ! --------
	if (!C_NpcIsMonster(other))
	{
		if (Npc_IsPlayer(other))
		{
			if ((Npc_GetPermAttitude(self, other) == ATT_FRIENDLY)
			/* || (self.npcType == NpcType_Friend) */ )
			{
				PrintDebugNpc(PD_ZS_CHECK, "...NSC FRIENDLY zum Angreifer");
				C_LookAtNpc(self, other);
				B_Say(self, other, "$WHATAREYOUDOING");

				//!!! JP: Quickfix für die Betatester, hier muß noch mal Design drüber

				//B_SetAttitude(self, ATT_ANGRY);
				AI_StartState(self, ZS_ReactToDamageWait_Friendly, 0, "");
				return;
			}
			else
			{
				PrintDebugNpc(PD_ZS_CHECK, "...NSC nicht FRIENDLY zum Angreifer!");
				//!!! JP: Gehört eigentlich in den Kompletten Npc_IsPlayer Block, aber s.o.
				self.aivar[AIV_BEENATTACKED] = 1;
				if (Npc_GetPermAttitude(self, other) != ATT_HOSTILE)
				{
					B_SetAttitude(self, ATT_ANGRY);
				};

				Npc_SetTempAttitude(self, ATT_HOSTILE);
			};
		};

		AI_StartState(self, ZS_AssessEnemy, 0, "");
	}

	//-------- Angreifer ist Monster ! --------
	else
	{
		AI_StartState(self, ZS_AssessMonster, 0, "");
	};
};

func int ZS_ReactToDamage_Loop()
{
	return LOOP_END;
};

func void ZS_ReactToDamage_End()
{
};

/////////////////////////////////////////////////////////////////////////////////
//	ZS_ReactToDamageWait_Friendly()
//	================================
//
//	Wird aufgerufen von: ZS_ReactToDamage
//
//	In dieser Funktion warten freundliche Nsc´s, die sich grade vom Spieler aus
// 	heiterem Himmel eine gefangen haben, ob der Spieler sie innerhalb von fünf
//	Sekunden erneut schlägt, ist dieses der Fall wird der Spieler als Agressor gewertet
//	und angegriffen, damit von der Story benötigte Attitüden nicht verloren gehen
//	wird in diesem Fall die Attitüde nicht geändert.
//	D.H. der Kampf wird immer nur bis zum Niederschlag gehen und nicht bis zum
//	FinishingMove
//////////////////////////////////////////////////////////////////////////////////

func void ZS_ReactToDamageWait_Friendly()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_ReactToDamageWaitFriendly");
	PrintGlobals(PD_ZS_CHECK);
	C_ZSInit();

	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_PercEnable(self, PERC_ASSESSMURDER, B_CombatAssessMurder);
	Npc_PercEnable(self, PERC_ASSESSDEFEAT, B_CombatAssessDefeat);
	Npc_PercEnable(self, PERC_ASSESSDAMAGE, B_ReactToDamageWaitDamage);
};

func int ZS_ReactToDamageWait_Friendly_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP, "ZS_ReactToDamage_WaitFriedndlyLoop");
	var int int_wait;
	int_wait = 1;
	if (int_wait == 1)
	{
		AI_Wait(self, 5);
		int_wait = 0;
	};

	if (int_wait == 0)
	{
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_ReactToDamageWaitFriendly_End()
{
	AI_ContinueRoutine(self);
};

func void B_ReactToDamageWaitDamage()
{
	PrintDebugNpc(PD_ZS_CHECK, "B_ReactToDamageWaitDamage");
	B_FullStop(self);
	Npc_SetTarget(self, other);
	AI_StartState(self, ZS_Attack, 0, "");
};
