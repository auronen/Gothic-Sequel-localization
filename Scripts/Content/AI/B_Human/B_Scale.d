func void B_Scale(var C_Npc npc)
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Scale");

	if (npc.attribute[ATR_STRENGTH] < 30)												{ Mdl_SetModelScale(npc, 0.9, 1, 1); } else
	if ((npc.attribute[ATR_STRENGTH] >= 30) && (npc.attribute[ATR_STRENGTH] < 100))		{ Mdl_SetModelScale(npc, 1.0, 1, 1); } else
	if ((npc.attribute[ATR_STRENGTH] >= 100) && (npc.attribute[ATR_STRENGTH] < 150))	{ Mdl_SetModelScale(npc, 1.1, 1, 1); } else
																						{ Mdl_SetModelScale(npc, 1.2, 1, 1); };
};
