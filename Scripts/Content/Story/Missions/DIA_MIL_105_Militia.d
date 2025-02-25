/*
instance MIL_105_Militia_Exit(C_Info)
{
	npc				= MIL_105_Militia;
	nr				= 999;
	condition		= MIL_105_Militia_Exit_Condition;
	information		= MIL_105_Militia_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int MIL_105_Militia_Exit_Condition()
{
	return 1;
};

func void MIL_105_Militia_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance MIL_105_Militia_CRAWLERINSIDE(C_Info)
{
	npc				= MIL_105_Militia;
	condition		= MIL_105_Militia_CRAWLERINSIDE_Condition;
	information		= MIL_105_Militia_CRAWLERINSIDE_Info;
	important		= TRUE;
};

func int MIL_105_Militia_CRAWLERINSIDE_Condition()
{
	if (LearnBow_2 == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void MIL_105_Militia_CRAWLERINSIDE_Info()
{
	AI_Output(self, other, "MIL_105_Wache_CRAWLERINSIDE_Info_00_01"); //Warte! Willst du runter in den Keller gehen?
	AI_Output(other, self, "MIL_105_Wache_CRAWLERINSIDE_Info_15_02"); //Hatte ich eigentlich vor.
	AI_Output(self, other, "MIL_105_Wache_CRAWLERINSIDE_Info_00_03"); //Das ist keine gute Idee. Da unten hat sich ein Crawler eingenistet. Der hat schon einen von uns zerstückelt.
	AI_Output(other, self, "MIL_105_Wache_CRAWLERINSIDE_Info_15_04"); //Deshalb gehe ich da runter. Ich töte das Biest.
	AI_Output(self, other, "MIL_105_Wache_CRAWLERINSIDE_Info_00_05"); //Du? Weißt du überhaupt wie so ein Crawler aussieht?
	AI_Output(other, self, "MIL_105_Wache_CRAWLERINSIDE_Info_15_06"); //Ja, ich habe schon mal ein paar gesehen.
	AI_Output(self, other, "MIL_105_Wache_CRAWLERINSIDE_Info_00_07"); //Na dann hoffe ich, das die Götter dir einen schnellen Tod schenken. Klingen verletzen das Vieh nämlich nicht.
	AI_Output(other, self, "MIL_105_Wache_CRAWLERINSIDE_Info_15_08"); //Fang schon mal an zu beten. Ich töte inzwischen den Crawler.
};

instance MIL_105_Militia_CRAWLERDEAD(C_Info)
{
	npc				= MIL_105_Militia;
	nr				= 0;
	condition		= MIL_105_Militia_CRAWLERDEAD_Condition;
	information		= MIL_105_Militia_CRAWLERDEAD_Info;
	description		= "Der Crawler wird niemanden mehr angreifen";
};

func int MIL_105_Militia_CRAWLERDEAD_Condition()
{
	var C_Npc Crawler;
	Crawler = Hlp_GetNpc(OC_Minecrawler);

	if (Npc_IsDead(Crawler))
	{
		return 1;
	};
};

func void MIL_105_Militia_CRAWLERDEAD_Info()
{
	AI_Output(other, self, "MIL_105_Wache_CRAWLERDEAD_Info_15_01"); //Der Crawler wird niemanden mehr angreifen.
	AI_Output(self, other, "MIL_105_Wache_CRAWLERDEAD_Info_00_02"); //Du hast in besiegt ?! Wegen dem schnellen Tod, das war nicht so gemeint. Freut mich das du noch lebst.

	Info_ClearChoices(MIL_105_MiLitia_CRAWLERDEAD);
	Info_AddChoice(MIL_105_MiLitia_CRAWLERDEAD, "Geht mir auch so", MIL_105_MiLitia_CRAWLERDEAD_friendly);
	Info_AddChoice(MIL_105_MiLitia_CRAWLERDEAD, "Geh mir aus den Augen, Feigling!", MIL_105_MiLitia_CRAWLERDEAD_bastard);
};

func void MIL_105_Militia_CRAWLERDEAD_friendly()
{
	AI_Output(other, self, "MIL_105_Wache_CRAWLERDEAD_friendly_Info_15_01"); //Geht mir auch so.
	AI_Output(self, other, "MIL_105_Wache_CRAWLERDEAD_friendly_Info_00_02"); //Trink einen auf das Wohl des Gefallenen. Wenn du mal Hilfe brauchst, ich kenne die Jungs von der Miliz.

	CreateInvItems(self, ItFo_Beer, 1);
	B_GiveInvItems(self, other, ItFo_Beer, 1);

	AI_Output(other, self, "MIL_105_Wache_CRAWLERDEAD_friendly_Info_15_03"); //Ich werde darauf zurückkommen. Hast du auch einen Namen?
	AI_Output(self, other, "MIL_105_Wache_CRAWLERDEAD_friendly_Info_00_04"); //Nenn mich Pablo.

	self.name = "PABLO";
};

func void MIL_105_Militia_CRAWLERDEAD_bastard()
{
	AI_Output(other, self, "MIL_105_Wache_CRAWLERDEAD_bastard_Info_15_01"); //Geh mir aus den Augen, Feigling!
	AI_Output(self, other, "MIL_105_Wache_CRAWLERDEAD_bastard_Info_00_02"); //Du nennst mich einen Feigling? Du schaffst dir keine Freunde hier. Aber die braucht jemand wie du auch nicht.
};
*/
