func void B_Give_Gotmar_ChapterWeapons(var int storyChapter)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(WRK_200_Gotmar);

	if (storyChapter == 1)
	{
		//-------- Schmiedezubehör --------
		CreateInvItems(npc, ItMi_Pliers, 2);
		CreateInvItems(npc, ItMw_Sledgehammer, 2);

		//-------- Zwischenprodukte --------
		CreateInvItems(npc, ItMi_RawIron, 10);

		//-------- Geld --------
		CreateInvItems(npc, ItMi_Silver, 250);

		CreateInvItems(npc, ItMi_BloodOreNugget, 5); //MF:storyrelevant !
	}
	else if (storyChapter == 2)
	{
		//-------- Schmiedezubehör --------
		CreateInvItems(npc, ItMi_Pliers, 1);
		CreateInvItems(npc, ItMw_Sledgehammer, 1);

		//-------- Zwischenprodukte --------
		CreateInvItems(npc, ItMi_RawIron, 25);

		//-------- Geld --------
		CreateInvItems(npc, ItMi_Silver, 750);
	}
	else if (storyChapter == 3)
	{
	}
	else if (storyChapter == 4)
	{
	};
};
