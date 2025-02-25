func void B_Give_Helvegor_ChapterItems(var int storyChapter)
{
	var C_Npc Helvegor;
	Helvegor = Hlp_GetNpc(WRK_222_Helvegor);

	if (storyChapter == 1)
	{
		CreateInvItems(Helvegor, ItAM_Arrow, 300);
		CreateInvItems(Helvegor, ItRw_ShortBow, 3);
		CreateInvItems(Helvegor, ItRw_RiderBow, 2);
		CreateInvItems(Helvegor, ItRw_FieldBow, 1);
	};
};
