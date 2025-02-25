instance BEG_704_Lakarus_Exit(C_Info)
{
	npc				= BEG_704_Lakarus;
	nr				= 999;
	condition		= BEG_704_Lakarus_Exit_Condition;
	information		= BEG_704_Lakarus_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int BEG_704_Lakarus_Exit_Condition()
{
	return TRUE;
};

func void BEG_704_Lakarus_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance BEG_704_Lakarus_HI(C_Info)
{
	npc				= BEG_704_Lakarus;
	nr				= 1;
	condition		= BEG_704_Lakarus_HI_Condition;
	information		= BEG_704_Lakarus_HI_Info;
	description		= "Was machst du hier?";
};

func int BEG_704_Lakarus_HI_Condition()
{
	return TRUE;
};

func void BEG_704_Lakarus_HI_Info()
{
	AI_Output(hero, self, "BEG_704_HI_15_01"); //Was machst du hier?
	AI_Output(self, hero, "BEG_704_HI_00_02"); //Ich verkaufe Sumpfkraut. Schönes frisches Sumpfkraut.

	Log_CreateTopic(GE_TraderOC, LOG_NOTE);
	B_LogEntry(GE_TraderOC, GE_TraderOC_1);
};

///////////////////////////////////////////////////////////////////////
//	Info WHATHERB
///////////////////////////////////////////////////////////////////////
instance BEG_704_Lakarus_WHATHERB(C_Info)
{
	npc				= BEG_704_Lakarus;
	nr				= 2;
	condition		= BEG_704_Lakarus_WHATHERB_Condition;
	information		= BEG_704_Lakarus_WHATHERB_Info;
	description		= "Was kann ich mit Sumpfkraut machen?";
};

func int BEG_704_Lakarus_WHATHERB_Condition()
{
	if (Npc_KnowsInfo(hero, BEG_704_Lakarus_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_704_Lakarus_WHATHERB_Info()
{
	AI_Output(hero, self, "BEG_704_WHATHERB_15_01"); //Was kann ich mit Sumpfkraut machen?
	AI_Output(self, hero, "BEG_704_WHATHERB_00_02"); //Du kannst es rauchen. Entweder unbehandelt in eine Wasserpfeife stopfen oder stampfen, drehen und dann rauchen.
	AI_Output(self, hero, "BEG_704_WHATHERB_00_03"); //Es gibt nichst vergleichbares, das dich so entspannt und beruhigt. Du solltest es unbedingt probieren.
};

///////////////////////////////////////////////////////////////////////
//	Info TRADEHERB
///////////////////////////////////////////////////////////////////////
instance BEG_704_Lakarus_TRADEHERB(C_Info)
{
	npc				= BEG_704_Lakarus;
	nr				= 5;
	condition		= BEG_704_Lakarus_TRADEHERB_Condition;
	information		= BEG_704_Lakarus_TRADEHERB_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "Zeig mir deine Ware";
};

func int BEG_704_Lakarus_TRADEHERB_Condition()
{
	if (Npc_KnowsInfo(hero, BEG_704_Lakarus_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_704_Lakarus_TRADEHERB_Info()
{
	AI_Output(hero, self, "BEG_704_TRADEHERB_15_01"); //Zeig mir deine Ware
	AI_Output(self, hero, "BEG_704_TRADEHERB_00_02"); //Bei mir bekommst du nur frische Ware.
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREHERB
///////////////////////////////////////////////////////////////////////
instance BEG_704_Lakarus_WHEREHERB(C_Info)
{
	npc				= BEG_704_Lakarus;
	nr				= 33;
	condition		= BEG_704_Lakarus_WHEREHERB_Condition;
	information		= BEG_704_Lakarus_WHEREHERB_Info;
	description		= "Woher bekommst du das Sumpfkraut?";
};

func int BEG_704_Lakarus_WHEREHERB_Condition()
{
	if (Npc_KnowsInfo(hero, BEG_704_Lakarus_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_704_Lakarus_WHEREHERB_Info()
{
	AI_Output(hero, self, "BEG_704_WHEREHERB_15_01"); //Woher bekommst du das Sumpfkraut?
	AI_Output(self, hero, "BEG_704_WHEREHERB_00_02"); //Wie der Name schon sagt wächst es nur im Sumpf. Aber ich bin nicht so wahnsinnig und gehe in dorthin.
	AI_Output(self, hero, "BEG_704_WHEREHERB_00_03"); //Niemand der klaren Verstandes ist geht dorthin. Nur ein paar Jäger trauen sich in die Sumpfgebiete.
	AI_Output(self, hero, "BEG_704_WHEREHERB_00_04"); //Die Jäger kommen ab und zu ins Lager. Und von denen kaufe ich das Kraut.
};

///////////////////////////////////////////////////////////////////////
//	Info SWAMP
///////////////////////////////////////////////////////////////////////
instance BEG_704_Lakarus_SWAMP(C_Info)
{
	npc				= BEG_704_Lakarus;
	nr				= 22;
	condition		= BEG_704_Lakarus_SWAMP_Condition;
	information		= BEG_704_Lakarus_SWAMP_Info;
	description		= "Warum ist es im Sumpf so gefährlich?";
};

func int BEG_704_Lakarus_SWAMP_Condition()
{
	if (Npc_KnowsInfo(hero, BEG_704_Lakarus_WHEREHERB))
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_704_Lakarus_SWAMP_Info()
{
	AI_Output(hero, self, "BEG_704_SWAMP_15_01"); //Warum ist es im Sumpf so gefährlich?
	AI_Output(self, hero, "BEG_704_SWAMP_00_02"); //Dort gibt es Blutfliegen....und Sumpfhaie. Aber das ist noch nicht das schlimmste.
	AI_Output(hero, self, "BEG_704_SWAMP_15_03"); //Ja, und? Was ist das 'Schlimmste'?
	AI_Output(self, hero, "BEG_704_SWAMP_00_04"); //Als die Barriere noch den Himmel überzog, war der Sumpf das Gebiet einer Bruderschaft die einen Dämon abeteten!
	AI_Output(hero, self, "BEG_704_SWAMP_15_05"); //Ja, und?
	AI_Output(self, hero, "BEG_704_SWAMP_00_06"); //...die verdammten Seelen der Toten spuken dort...
	AI_Output(self, hero, "BEG_704_SWAMP_00_07"); //...Untote feiern blutige Rituale...
	AI_Output(self, hero, "BEG_704_SWAMP_00_08"); //...und Skelette staken durch das Sumpfwasser...
	AI_Output(hero, self, "BEG_704_SWAMP_15_09"); //Kann es sein das du zuviel rauchst?
};
