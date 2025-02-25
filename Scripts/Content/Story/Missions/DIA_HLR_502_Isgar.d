///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance HLR_502_Isgar_EXIT(C_Info)
{
	npc				= HLR_502_Isgar;
	nr				= 999;
	condition		= HLR_502_Isgar_EXIT_Condition;
	information		= HLR_502_Isgar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int HLR_502_Isgar_EXIT_Condition()
{
	return TRUE;
};

func void HLR_502_Isgar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance HLR_502_Isgar_JOB(C_Info)
{
	npc				= HLR_502_Isgar;
	nr				= 1;
	condition		= HLR_502_Isgar_JOB_Condition;
	information		= HLR_502_Isgar_JOB_Info;
	description		= "Was ist deine Aufgabe hier?";
};

func int HLR_502_Isgar_JOB_Condition()
{
	return TRUE;
};

func void HLR_502_Isgar_JOB_Info()
{
	AI_Output(hero, self, "HLR_502_JOB_15_01"); //Was ist deine Aufgabe hier?
	AI_Output(self, hero, "HLR_502_JOB_00_02"); //Ich stelle Tränke her, die ich verkaufe.

	Log_CreateTopic(GE_TraderOC, LOG_NOTE);
	B_LogEntry(GE_TraderOC, GE_TraderOC_2);
};

///////////////////////////////////////////////////////////////////////
//	Info TRADER
///////////////////////////////////////////////////////////////////////
instance HLR_502_Isgar_TRADER(C_Info)
{
	npc				= HLR_502_Isgar;
	nr				= 12;
	condition		= HLR_502_Isgar_TRADER_Condition;
	information		= HLR_502_Isgar_TRADER_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "Lass uns handeln";
};

func int HLR_502_Isgar_TRADER_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_502_Isgar_JOB))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_502_Isgar_TRADER_Info()
{
	AI_Output(hero, self, "HLR_502_TRADER_15_01"); //Lass uns handeln.
};

///////////////////////////////////////////////////////////////////////
//	Info WINE
///////////////////////////////////////////////////////////////////////
instance HLR_502_Isgar_WINE(C_Info)
{
	npc				= HLR_502_Isgar;
	nr				= 23;
	condition		= HLR_502_Isgar_WINE_Condition;
	information		= HLR_502_Isgar_WINE_Info;
	description		= "Gerion schickt mich";
};

func int HLR_502_Isgar_WINE_Condition()
{
	if (Npc_KnowsInfo(hero, THF_403_Gerion_GOTHERB)
	&& (Npc_HasItems(hero, ItPl_Swampweed) >= 20))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_502_Isgar_WINE_Info()
{
	AI_Output(hero, self, "HLR_502_WINE_15_01"); //Gerion schickt mich.
	B_GiveInvItems(hero, self, ItPl_Swampweed, 20);
	AI_Output(self, hero, "HLR_502_WINE_00_02"); //Ah, du bringst das Sumpfkraut. Der Wein ist fertig. Was hat Gerion denn damit vor?
	B_GiveInvItems(self, hero, ItFo_SleepWine, 1);
	AI_Output(hero, self, "HLR_502_WINE_15_03"); //Keine Ahnung. Ich hol ihn nur ab.
};
