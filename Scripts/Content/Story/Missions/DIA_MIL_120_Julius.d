///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance Info_Julius_Exit(C_Info)
{
	npc				= MIL_120_Julius;
	nr				= 999;
	condition		= Info_Julius_Exit_Condition;
	information		= Info_Julius_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Info_Julius_Exit_Condition()
{
	return TRUE;
};

func void Info_Julius_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##						KAPITEL 7
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info SMITH
///////////////////////////////////////////////////////////////////////
instance Info_Julius_SMITH(C_Info)
{
	npc				= MIL_120_Julius;
	nr				= 20;
	condition		= Info_Julius_SMITH_Condition;
	information		= Info_Julius_SMITH_Info;
	description		= "Die Schmiede sieht verlassen aus!";
};

func int Info_Julius_SMITH_Condition()
{
	return TRUE;
};

func void Info_Julius_SMITH_Info()
{
	AI_Output(hero, self, "Info_Julius_SMITH_15_01"); //Die Schmiede sieht verlassen aus!
	AI_Output(self, hero, "Info_Julius_SMITH_00_02"); //Ja, ja. Den alten Bartok haben sie vor ein paar Tagen abgeholt.
	AI_Output(hero, self, "Info_Julius_SMITH_15_03"); //Abgeholt?
	AI_Output(self, hero, "Info_Julius_SMITH_00_04"); //Er hat die Krankheit. Armer Kerl! Sie haben ihn in das Aussätzigen-Viertel gebracht.
};

///////////////////////////////////////////////////////////////////////
//	Info CHEST
///////////////////////////////////////////////////////////////////////
instance Info_Julius_CHEST(C_Info)
{
	npc				= MIL_120_Julius;
	nr				= 20;
	condition		= Info_Julius_CHEST_Condition;
	information		= Info_Julius_CHEST_Info;
	description		= "Wo sind seine Werkzeuge?";
};

func int Info_Julius_CHEST_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Julius_SMITH))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Julius_CHEST_Info()
{
	AI_Output(hero, self, "Info_Julius_CHEST_15_01"); //Wo sind seine Werkzeuge?
	AI_Output(self, hero, "Info_Julius_CHEST_00_02"); //Er hat den ganzen Schmiede-Krempel gehütet wie seinen Augapfel.
	AI_Output(self, hero, "Info_Julius_CHEST_00_03"); //Hat alles in seiner Kiste aufbewahrt. Den Schlüssel trug er immer bei sich.

	Log_CreateTopic(CH1_Bartok, LOG_MISSION);
	Log_SetTopicStatus(CH1_Bartok, LOG_RUNNING);
	B_LogEntry(CH1_Bartok, CH1_Bartok_2);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info STILLHERE
///////////////////////////////////////////////////////////////////////
instance MIL_120_Julius_STILLHERE(C_Info)
{
	npc				= MIL_120_Julius;
	nr				= 10;
	condition		= MIL_120_Julius_STILLHERE_Condition;
	information		= MIL_120_Julius_STILLHERE_Info;
	permanent		= TRUE;
	description		= "Immer noch hier?";
};

func int MIL_120_Julius_STILLHERE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Julius_CHEST))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_120_Julius_STILLHERE_Info()
{
	AI_Output(hero, self, "MIL_120_STILLHERE_15_01"); //Immer noch hier?
	AI_Output(self, hero, "MIL_120_STILLHERE_00_02"); //Jaja! Ist zwar nicht der interessanteste Job, auf eine verlassene Schmiede aufzupassen, aber Hauptsache ich bekomme jede Woche meinen Sold!
	AI_StopProcessInfos(self);
};
