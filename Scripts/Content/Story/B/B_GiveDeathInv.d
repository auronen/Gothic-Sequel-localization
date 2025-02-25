func void B_GiveDeathInv()
{
	//-------- Abfragen, ob die Trophy schon mal verteilt wurde --------
	if (self.aivar[AIV_MM_DEATHINVGIVEN])
	{
		return;
	};

	//-------- Trophy ins Inventory packen --------
	if (Knows_GetTeeth == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID] == ID_WOLF) { CreateInvItems(self, ItAt_Teeth, 2); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_BLACKWOLF) { CreateInvItems(self, ItAt_Teeth, 2); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_SNAPPER) { CreateInvItems(self, ItAt_Teeth, 4); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_ORCBITER) { CreateInvItems(self, ItAt_Teeth, 2); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST) { CreateInvItems(self, ItAt_Teeth, 4); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_BLOODHOUND) { CreateInvItems(self, ItAt_Teeth, 4); };
	};

	if (Knows_GetClaws == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID] == ID_WARAN) { CreateInvItems(self, ItAt_Claws, 4); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) { CreateInvItems(self, ItAt_Claws, 4); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_SNAPPER) { CreateInvItems(self, ItAt_Claws, 1); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_RAZOR) { CreateInvItems(self, ItAt_Claws, 3); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_ORCBITER) { CreateInvItems(self, ItAt_Claws, 2); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_LURKER) { CreateInvItems(self, ItAt_LurkerClaw, 2); };
	};

	if (Knows_GetFur == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID] == ID_WOLF) { CreateInvItems(self, ItAt_Wolf, 1); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_BLACKWOLF) { CreateInvItems(self, ItAt_Wolf_02, 1); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST) { CreateInvItems(self, ItAt_ShadowFur, 1); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_TROLL) { CreateInvItems(self, ItAt_TrollFur, 1); };
	};

	if (Knows_GetHide == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID] == ID_LURKER) { CreateInvItems(self, ItAt_LurkerSkin, 1); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK) { CreateInvItems(self, ItAt_SwampsharkSkin, 1); };
	};

	if (Knows_GetMCMandibles == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER) { CreateInvItems(self, ItAt_MandiblesCrawler, 1); };
		if (self.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR) { CreateInvItems(self, ItAt_MandiblesCrawler, 1); };
	};

	if (Knows_GetMCPlates == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR) { CreateInvItems(self, ItAt_PlatesCrawler, 2); };
	};

	if (Knows_GetBFSting == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY) { CreateInvItems(self, ItAt_BloodflySting, 1); };
	};

	if (Knows_GetUluMulu == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) { CreateInvItems(self, ItAt_Waran, 1); };				//Zunge eines Feuerwarans
		if (self.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST) { CreateInvItems(self, ItAt_ShadowHorn, 1); };		//Horn eines Shadowbeasts
		if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK) { CreateInvItems(self, ItAt_SwampsharkTeeth, 3); };	//Zähne eines Sumpfhais
		if (self.aivar[AIV_MM_REAL_ID] == ID_TROLL) { CreateInvItems(self, ItAt_TrollTheeth, 2); };				//Hauer eines Trolls
	};

	//-------- Merken --------
	self.aivar[AIV_MM_DEATHINVGIVEN] = TRUE;
};
