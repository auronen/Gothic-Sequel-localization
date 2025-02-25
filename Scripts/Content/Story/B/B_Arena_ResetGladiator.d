//////////////////////////////////////////////////////////////////////////
//	B_Arena_ResetGladiator
//	======================
//	Sorgt dafür, dass der Gladiator 'npc' nach einem Arenakampf sowohl
//	mit seiner Waffe, als auch mit vollen Lebenspunkte wieder herauskommt
//////////////////////////////////////////////////////////////////////////
func void B_Arena_ResetGladiator(var int npcInstance)
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_ResetGladiator");

	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);

	//---- Bei Bewußtlosigkeit garnichts machen ----
	if (Npc_IsInState(npc, ZS_Unconscious)
	|| Npc_IsInState(npc, ZS_Dead))
	{
		PrintDebugNpc(PD_TA_FRAME, "...Gladiator bewusstlos oder tot!");
		return;
	};

	//---- Unterbrechen der bisherigen Tätigkeit ----
	B_FullStop(npc);
	AI_RemoveWeapon(npc);

	//---- eventuelles Waffen-Zurückfordern! ----
	_ = B_CheckForImportantInfo(npc, hero);

	//---- Schummel-Heilung auf Maximum, mit Drinkanimation ----
	if (npc.attribute[ATR_HITPOINTS] < npc.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItem(npc, ItFo_Potion_Health_03);
		AI_StandUp(npc);
		AI_UseItem(npc, ItFo_Potion_Health_03);
	};

	//---- eventuell fallengelassene Waffe aufheben ----
	B_Arena_RegainDroppedWeapon(npcInstance);
};
