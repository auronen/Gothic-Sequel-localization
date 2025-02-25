func void B_Give_Gerion_ChapterItems(var int storyChapter)
{
	var C_Npc Gerion;
	Gerion = Hlp_GetNpc(THF_403_Gerion);

	if ((Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) > 0)
	|| (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) > 0))
	{
		if (storyChapter == 1)
		{
			CreateInvItems(Gerion, ItKe_Lockpick, 20);
			CreateInvItems(Gerion, ItAm_Arrow, 200);
			CreateInvItems(Gerion, ItMi_Silver, 500);
		};

		if (storyChapter == 2)
		{
			CreateInvItems(Gerion, ItKe_Lockpick, 30);
			CreateInvItems(Gerion, ItAm_Arrow, 300);
			CreateInvItems(Gerion, ItMi_Silver, 750);
		};
	};
};
