/////////////////////////////////////////////////////////////////////////////////////////
// B_UseMobItems(var C_npc, var string scemename)
// =============
// 	In der Funktion wird über den übergebenen Mobscemename nachgesehen welche Items das
//	Mobsi erfordert und dem übergebenen Nsc in die Hand gegeben
/////////////////////////////////////////////////////////////////////////////////////////
func void B_UseMobItems(var C_Npc user, var string mobname)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems");
	if (Hlp_StrCmp(mobname, SCEMENAME_LAB))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...Lab");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMI_Flask);
	};

	if (Hlp_StrCmp(mobname, SCEMENAME_STONE))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...StoneMason");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMI_Hammer);
	};

	if (Hlp_StrCmp(mobname, SCEMENAME_FLETCHER))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...Fletcher");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMI_FletcherKnife);
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMI_FletcherWood);
	};

	if (Hlp_StrCmp(mobname, SCEMENAME_BOW))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...Bow");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_BowWood);
	};

	if (Hlp_StrCmp(mobname, SCEMENAME_RUNEMAKER))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...Runemaker");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Pliers);
	};

	if (Hlp_StrCmp(mobname, SCEMENAME_RUNEMELTER))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...Runemelter");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMI_Flask);
	};

	if (Hlp_StrCmp(mobname, SCEMENAME_REPAIR))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...Repair");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMI_HAMMER);
	};

	if (Hlp_StrCmp(mobname, SCEMENAME_ORE))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...Ore");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMw_PickAxe);
	};

	if (Hlp_StrCmp(mobname, SCEMENAME_SAW))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...Saw");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMI_Saw);
	};

	if (Hlp_StrCmp(mobname, SCEMENAME_ANVIL))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...Smith_Anvil");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMw_SledgeHammer);
	};

	if (Hlp_StrCmp(mobname, SCEMENAME_FIRE))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...Smith_Fire");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_RawIron);
	};

	if (Hlp_StrCmp(mobname, SCEMENAME_CAULDRON))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_UseMobItems...Cook");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_Scoop);
	};
};
