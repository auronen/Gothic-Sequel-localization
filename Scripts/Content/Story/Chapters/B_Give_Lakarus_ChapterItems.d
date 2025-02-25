func void B_Give_Lakarus_ChapterItems(var int storyChapter)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(BEG_704_Lakarus);

	if (storyChapter == 1)
	{
		//-------- Verkaufsgüter --------
		CreateInvItems(npc, ItPl_Swampweed, 5);

		//-------- Geld --------
		CreateInvItems(npc, ItMi_Silver, 5);
	}
	else if (storyChapter == 2)
	{
		//-------- Verkaufsgüter --------
		CreateInvItems(npc, ItPl_Swampweed, 12);

		//-------- Geld --------
		CreateInvItems(npc, ItMi_Silver, 10);
	}
	else if (storyChapter == 3)
	{
	}
	else if (storyChapter == 4)
	{
	};
};
