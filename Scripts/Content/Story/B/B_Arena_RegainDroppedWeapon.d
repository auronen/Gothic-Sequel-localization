//////////////////////////////////////////////////////////////////////////
//	B_Arena_RegainDroppedWeapon
//	======================
//	Sollte der Gladiator seine persönliche Waffe NICHT haben, dann
//	sucht er sie im Umkreis und (falls gefunden) hebt sie auf.
//////////////////////////////////////////////////////////////////////////
func void B_Arena_RegainDroppedWeapon(var int npcInstance)
{
	PrintDebugNpc(PD_TA_FRAME, "B_Arena_RegainDroppedWeapon");

	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);

	//---- Fallengelassene Waffe aufheben ----
	if (((npcInstance == MIN_306_Grim) && !Npc_HasItems(npc, ItMw_Grim_Pickaxe))
	|| ((npcInstance == WRK_216_Goliath) && !Npc_HasItems(npc, ItMw_Goliath_Sledgehammer))
	|| ((npcInstance == MIL_121_Brutus) && !Npc_HasItems(npc, ItMw_Brutus_Longsword))
	|| ((npcInstance == DMH_1302_Malgar) && !Npc_HasItems(npc, ItMw_Malgar_Broadsword))
	|| ((npcInstance == AMZ_900_Thora) && !Npc_HasItems(npc, ItMw_Thora_Battlestaff)))
	{
		B_RegainDroppedWeapon(npc);
	};
};
