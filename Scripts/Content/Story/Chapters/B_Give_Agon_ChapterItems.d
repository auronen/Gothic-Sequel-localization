func void B_Give_Agon_ChapterItems(var int storyChapter)
{
	var C_Npc Agon;
	Agon = Hlp_GetNpc(WRK_225_Agon);

	if (storyChapter == 1)
	{
		//FOOD
		CreateInvItems(Agon, ItMi_Salt, 100);

		CreateInvItems(Agon, ItAt_Meatbug, 20);
		CreateInvItems(Agon, ItAt_MoleratGrease, 20);
		CreateInvItems(Agon, ItPl_Swampweed, 20);
		CreateInvItems(Agon, ItPl_CaveMushroom, 20);
		CreateInvItems(Agon, ItFo_Mutton, 20);

		CreateInvItems(Agon, ItFo_Loaf, 30);
		CreateInvItems(Agon, ItFo_Cheese, 30);
		CreateInvItems(Agon, ItFo_Ham, 30);

		CreateInvItems(Agon, ItFo_Apple, 5);
		CreateInvItems(Agon, ItFo_Grapes, 3);

		//MISC
		CreateInvItems(Agon, ItLsTorch, 20);
		CreateInvItems(Agon, ItMi_Pliers, 2);
		CreateInvItems(Agon, ItMw_Sledgehammer, 2);

		CreateInvItems(Agon, ItMi_OreNugget, 20);
		CreateInvItems(Agon, ItMi_BloodOreNugget, 2);

		//POTIONS
		CreateInvItems(Agon, ItFo_Potion_Health_01, 6);
		CreateInvItems(Agon, ItFo_Potion_Mana_01, 6);
		CreateInvItems(Agon, ItFo_Potion_Health_02, 3);
		CreateInvItems(Agon, ItFo_Potion_Mana_02, 3);

		//SILBER
		CreateInvItems(Agon, ItMi_Silver, 400);
	};
};
