//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	Reaktionen der NSC-Gladiatoren während des Arenakampfes
//
//////////////////////////////////////////////////////////////////////////////////////////////////////
func void B_Arena_AssessSC()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Arena_AssessSC");

	//-------- hat der SC die Waffe des NSCs? (Important-Info) --------
	_ = B_CheckForImportantInfo(self, other);
};

func void B_Arena_AssessSC_Npc()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Arena_AssessSC_Npc");

	//-------- hat der SC die Waffe des NSCs? (Important-Info) --------
	_ = B_CheckForImportantInfo(self, other);

	//-------- ist der NSC in der Arena? --------
	if ((Npc_GetDistToWP(hero, ARENA_WP_CENTER) < ARENA_CENTER_AREA)
	&& (Npc_GetDistToWP(hero, ARENA_WP_THRONE) > ARENA_THRONE_AREA))
	{
		B_FullStop(self);
		AI_StartState(self, ZS_Arena_ObserveIntruder, 0, "");
	};
};

func void B_Arena_AssessFighter()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Arena_AssessFighter");

	if (Npc_IsInFightMode(other, FMODE_FAR))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Fernkampfwaffe!");
		B_FullStop(self);
		B_Say(self, other, "$NoBowInArena");
		Npc_SetTarget(self, other);
		AI_StartState(self, ZS_AssessFighter, 0, "");
		return;
	};

	if (Npc_IsInFightMode(other, FMODE_MAGIC))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Zauberspruch!");
		B_FullStop(self);
		B_Say(self, other, "$NoMagicInArena");
		Npc_SetTarget(self, other);
		AI_StartState(self, ZS_AssessFighter, 0, "");
		return;
	};

	if (Npc_IsPlayer(other))
	{
		B_Arena_AssessSC();
	};
};

func void B_Arena_AssessDefeat()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Arena_AssessDefeat");

	if (Npc_IsInRoutine(other, ZS_ArenaNpc)
	|| (Npc_IsInRoutine(self, ZS_ArenaFight) && Npc_IsPlayer(other)))
	{
		B_Say(self, other, "$PointForMe");
	};
};

func void B_Arena_AssessCaster()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Arena_AssessCaster");

	if (Npc_IsPlayer(other))
	{
		// Spieler beginnt als unbeteiligter zu Zaubern
		if (Npc_IsInRoutine(self, ZS_ArenaNpc))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...NSC kämpft gegen anderen NSC!");
			B_FullStop(self);
			B_Punish(self, other, AIV_AR_DISTURBEDARENA);
		};

		// Spieler beginnt als Gladiator zu Zaubern
		if (Npc_IsInRoutine(self, ZS_ArenaFight))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...NSC kämfpt gegen Spieler!");
			B_FullStop(self);
			//B_Punish(self, other, AIV_AR_ARENAMAGIC);

			B_Arena_AbortFight(AF_PLAYERUSEDMAGIC);
		};
	};
};

func void B_Arena_ReactToDamage()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Arena_ReactToDamage");

	// Spieler verletzt Gladiator in einem NSC-NSC-Kampf
	if (Npc_IsPlayer(other)
	&& Npc_IsInRoutine(self, ZS_ArenaNpc))
	{
		B_FullStop(self);
		B_Punish(self, other, AIV_AR_DISTURBEDARENA);
		return;
	};

	// Spieler verletzt Gladiator mit unerlaubter Fernkampfwaffe
	if (Npc_IsInFightMode(other, FMODE_FAR))
	{
		B_FullStop(self);
		B_Say(self, other, "$NoBowInArena");
		//B_Punish(self, other, AIV_AR_ARENABOW);

		B_Arena_AbortFight(AF_PLAYERUSEDBOW);
		return;
	};

	// Spieler verletzt Gladiator mit unerlaubter Fernkampfwaffe
	if (Npc_IsInFightMode(other, FMODE_MAGIC))
	{
		B_FullStop(self);
		B_Say(self, other, "$NoMagicInArena");
		//B_Punish(self, other, AIV_AR_ARENAMAGIC);

		B_Arena_AbortFight(AF_PLAYERUSEDMAGIC);
		return;
	};

	//if !Npc_IsInState(self, ZS_AttackArena)
	//{
		//B_FullStop(self);
		//AI_StartState(self, ZS_AttackArena, 0, "");
	//};
};

func void B_Arena_FightSound()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Arena_FightSound");

	// Spieler verletzt anderen Gladiator in einem NSC-NSC-Kampf
	if (Npc_IsInRoutine(victim, ZS_ArenaNpc)
	&& Npc_IsPlayer(other))
	{
		B_FullStop(self);
		B_Punish(self, other, AIV_AR_DISTURBEDARENA);
		return;
	};

	// Spieler verletzt Gladiator mit unerlaubter Fernkampfwaffe
	if (Npc_IsInRoutine(victim, ZS_ArenaNpc)
	&& Npc_IsInFightMode(other, FMODE_FAR))
	{
		B_FullStop(self);
		B_Say(self, other, "$NoBowInArena");
		B_Punish(self, other, AIV_AR_ARENABOW);
	};

	// Spieler verletzt Gladiator mit unerlaubter Fernkampfwaffe
	if (Npc_IsInRoutine(victim, ZS_ArenaNpc)
	&& Npc_IsInFightMode(other, FMODE_MAGIC))
	{
		B_FullStop(self);
		B_Say(self, other, "$NoMagicInArena");
		B_Punish(self, other, AIV_AR_ARENAMAGIC);
	};
};

func void B_Arena_AssessMurder()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Arena_AssessMurder");

	if (Npc_IsInRoutine(victim, ZS_ArenaFight))
	{
		PrintDebugNpc(PD_ZS_FRAME, "...Mord an Co-Gladiator!");
		B_Say(self, other, "$Buh");
	}
	else
	{
		PrintDebugNpc(PD_ZS_FRAME, "...normaler Mord!");
		B_FullStop(self);
		AI_StartState(self, ZS_AssessMurder, 0, "");
	};
};
