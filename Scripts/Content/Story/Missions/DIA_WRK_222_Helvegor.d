///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance WRK_222_Helvegor_EXIT(C_Info)
{
	npc				= WRK_222_Helvegor;
	nr				= 999;
	condition		= WRK_222_Helvegor_EXIT_Condition;
	information		= WRK_222_Helvegor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int WRK_222_Helvegor_EXIT_Condition()
{
	return TRUE;
};

func void WRK_222_Helvegor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance WRK_222_Helvegor_HI(C_Info)
{
	npc				= WRK_222_Helvegor;
	nr				= 1;
	condition		= WRK_222_Helvegor_HI_Condition;
	information		= WRK_222_Helvegor_HI_Info;
	description		= "Du bist der Bogenmacher?";
};

func int WRK_222_Helvegor_HI_Condition()
{
	return TRUE;
};

func void WRK_222_Helvegor_HI_Info()
{
	AI_Output(hero, self, "WRK_222_HI_15_01"); //Du bist der Bogenmacher?
	AI_Output(self, hero, "WRK_222_HI_00_02"); //Ja. Bei mir bekommst du die besten Bögen im Lager - und die einzigen...

	Log_CreateTopic(GE_TraderOC, LOG_NOTE);
	B_LogEntry(GE_TraderOC, GE_TraderOC_7);
};

///////////////////////////////////////////////////////////////////////
//	Info TRADEBOW
///////////////////////////////////////////////////////////////////////
instance WRK_222_Helvegor_TRADEBOW(C_Info)
{
	npc				= WRK_222_Helvegor;
	nr				= 1;
	condition		= WRK_222_Helvegor_TRADEBOW_Condition;
	information		= WRK_222_Helvegor_TRADEBOW_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= DIALOG_TRADE;
};

func int WRK_222_Helvegor_TRADEBOW_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_222_Helvegor_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_222_Helvegor_TRADEBOW_Info()
{
	AI_Output(hero, self, "WRK_222_TRADEBOW_15_01"); //Zeig mir deine Ware.
};
