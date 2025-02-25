///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance BEG_702_Nabor_EXIT(C_Info)
{
	npc				= BEG_702_Nabor;
	nr				= 999;
	condition		= BEG_702_Nabor_EXIT_Condition;
	information		= BEG_702_Nabor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int BEG_702_Nabor_EXIT_Condition()
{
	return TRUE;
};

func void BEG_702_Nabor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TIP
///////////////////////////////////////////////////////////////////////
instance BEG_702_Nabor_TIP(C_Info)
{
	npc				= BEG_702_Nabor;
	nr				= 1;
	condition		= BEG_702_Nabor_TIP_Condition;
	information		= BEG_702_Nabor_TIP_Info;
	description		= "Was machst du hier?";
};

func int BEG_702_Nabor_TIP_Condition()
{
	return TRUE;
};

func void BEG_702_Nabor_TIP_Info()
{
	AI_Output(hero, self, "BEG_702_TIP_15_01"); //Was machst du hier?
	AI_Output(self, hero, "BEG_702_TIP_00_02"); //Ich sitze hier und frage mich, ob du der Richtige bist.
	AI_Output(hero, self, "BEG_702_TIP_15_03"); //Der Richtige? Wofür?
	AI_Output(self, hero, "BEG_702_TIP_00_04"); //Der richtige Mann, der eine wertvolle Information für wenig Silber kaufen will. Aber ich glaube, du bist es nicht. Oder doch?

	Info_AddChoice(BEG_702_Nabor_TIP, "Ich bin der Richtige. Her mit der Information.", BEG_702_Nabor_TIP_RIGHTMAN);
	Info_AddChoice(BEG_702_Nabor_TIP, "Wie teuer ist deine Information?", BEG_702_Nabor_TIP_HOWMUCH);
	Info_AddChoice(BEG_702_Nabor_TIP, "Ich glaube du willst nur schnell ein bisschen Silber abstauben. ", BEG_702_Nabor_TIP_TRICK);
};

func void BEG_702_Nabor_TIP_TRICK()
{
	AI_Output(hero, self, "BEG_702_TIP_TRICK_15_01"); //Ich glaube du willst nur schnell ein bisschen Silber abstauben.
	AI_Output(self, hero, "BEG_702_TIP_TRICK_00_02"); //Ich wußte doch das du nicht der Richtige bist.
	AI_StopProcessInfos(self);
};

func void BEG_702_Nabor_TIP_HOWMUCH()
{
	AI_Output(hero, self, "BEG_702_TIP_HOWMUCH_15_01"); //Wie teuer ist deine Information?
	AI_Output(self, hero, "BEG_702_TIP_HOWMUCH_00_02"); //Für dich nur 10 Silberstücke. Wenn du die hast, kommen wir ins Geschäft.
	Nabor_10 = TRUE;
	Info_ClearChoices(BEG_702_Nabor_TIP);
};

func void BEG_702_Nabor_TIP_RIGHTMAN()
{
	AI_Output(hero, self, "BEG_702_TIP_RIGHTMAN_15_01"); //Ich bin der Richtige. Her mit der Information.
	AI_Output(self, hero, "BEG_702_TIP_RIGHTMAN_00_02"); //Die kostet allerdings 20 Silberstücke. Kein Verhandeln. Kein Feilschen. Sprich mich an, wenn du das Geld hast.
	Nabor_20 = TRUE;
	Info_ClearChoices(BEG_702_Nabor_TIP);
};

///////////////////////////////////////////////////////////////////////
//	Info BUYINFO
///////////////////////////////////////////////////////////////////////
instance BEG_702_Nabor_BUYINFO(C_Info)
{
	npc				= BEG_702_Nabor;
	nr				= 1;
	condition		= BEG_702_Nabor_BUYINFO_Condition;
	information		= BEG_702_Nabor_BUYINFO_Info;
	description		= "Okay, hier ist dein Silber";
};

func int BEG_702_Nabor_BUYINFO_Condition()
{
	if (((Npc_HasItems(hero, ItMi_Silver) >= 20) && Nabor_20)
	|| ((Npc_HasItems(hero, ItMi_Silver) >= 10) && Nabor_10))
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_702_Nabor_BUYINFO_Info()
{
	if (Nabor_20)
	{
		AI_Output(hero, self, "BEG_702_BUYINFO_15_01"); //Okay, hier sind die 20 Silberstücke.
		B_GiveInvItems(hero, self, itMi_Silver, 20);
	};

	if (Nabor_10)
	{
		AI_Output(hero, self, "BEG_702_BUYINFO_15_02"); //Okay, hier sind die 10 Silberstücke.
		B_GiveInvItems(hero, self, itMi_Silver, 10);
	};

	AI_Output(self, hero, "BEG_702_BUYINFO_00_03"); //Okay, hier ist die Information. Also hör gut zu: Viele halten uns nur für Bettler. Und das ist gut so.
	AI_Output(self, hero, "BEG_702_BUYINFO_00_04"); //Aber wir sind die Augen und die Ohren dieses Lagers. Alles was hier passiert, jedes krumme Ding das gedreht wird...
	AI_Output(self, hero, "BEG_702_BUYINFO_00_05"); //Wir wissen es.
	AI_Output(self, hero, "BEG_702_BUYINFO_00_06"); //Und wir verwahren dieses Wissen. Und du bist der Mann, der davon profitieren kann.
	AI_Output(hero, self, "BEG_702_BUYINFO_15_07"); //Was meinst du damit?
	AI_Output(self, hero, "BEG_702_BUYINFO_00_08"); //Zeige dich den Bettlern dreimal großzügig. Dann suche Jesper. Er hat dir bestimmt interessante Dinge zu erzählen.
	AI_Output(hero, self, "BEG_702_BUYINFO_15_09"); //Warum erzählst du das gerade mir?
	AI_Output(self, hero, "BEG_702_BUYINFO_00_10"); //Weil du der richtige bist. Und weil wir ja auch davon profitieren , dir unser Wissen zu Verfügung zu stellen. Gegen ein kleines Entgelt...
};

///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance BEG_702_Nabor_WHERE(C_Info)
{
	npc				= BEG_702_Nabor;
	nr				= 1;
	condition		= BEG_702_Nabor_WHERE_Condition;
	information		= BEG_702_Nabor_WHERE_Info;
	permanent		= TRUE;
	description		= "Wo finde ich Jesper?";
};

func int BEG_702_Nabor_WHERE_Condition()
{
	if (Npc_KnowsInfo(hero, BEG_702_Nabor_BUYINFO))
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_702_Nabor_WHERE_Info()
{
	AI_Output(hero, self, "BEG_702_WHERE_15_01"); //Wo finde ich Jesper?
	AI_Output(self, hero, "BEG_702_WHERE_00_02"); //Du musst ihn schon alleine finden. Ich nehme an, das wird keine Herausforderung für dich sein.
};
