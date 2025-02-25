func void B_Give_Isgar_ChapterItems(var int storyChapter)
{
	var C_Npc Isgar;
	Isgar = Hlp_GetNpc(HLR_502_Isgar);

	if (storyChapter == 1)
	{
		//PLANTS

		CreateInvItems(Isgar, ItPl_MountainMoss, 20);
		CreateInvItems(Isgar, ItPl_BloodThistle, 20);
		CreateInvItems(Isgar, ItPl_Stoneroot, 20);
		CreateInvItems(Isgar, ItPl_OrcLeaf, 20);
		CreateInvItems(Isgar, ItPl_Ravenherb, 10);
		CreateInvItems(Isgar, ItPl_Nightshade, 5);
		CreateInvItems(Isgar, ItMi_Alcohol, 50);

		//FOOD

		//POTIONS
		CreateInvItems(Isgar, ItFo_Potion_Health_01, 8);
		CreateInvItems(Isgar, ItFo_Potion_Mana_01, 8);

		CreateInvItems(Isgar, ItFo_Potion_Health_02, 4);
		CreateInvItems(Isgar, ItFo_Potion_Mana_02, 4);

		CreateInvItems(Isgar, ItFo_Potion_Health_03, 2);
		CreateInvItems(Isgar, ItFo_Potion_Mana_03, 2);

		CreateInvItems(Isgar, ItFo_Potion_Health_Perma_01, 2);

		//SILBER
		CreateInvItems(Isgar, ItMi_Silver, 250);
	};
};
