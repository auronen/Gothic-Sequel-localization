///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance BEG_701_Jose_EXIT(C_Info)
{
	npc				= BEG_701_Jose;
	nr				= 999;
	condition		= BEG_701_Jose_EXIT_Condition;
	information		= BEG_701_Jose_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int BEG_701_Jose_EXIT_Condition()
{
	return TRUE;
};

func void BEG_701_Jose_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance BEG_701_Jose_HI(C_Info)
{
	npc				= BEG_701_Jose;
	nr				= 1;
	condition		= BEG_701_Jose_HI_Condition;
	information		= BEG_701_Jose_HI_Info;
	permanent		= TRUE;
	description		= "Was machst du hier?";
};

func int BEG_701_Jose_HI_Condition()
{
	return TRUE;
};

func void BEG_701_Jose_HI_Info()
{
	AI_Output(hero, self, "BEG_701_HI_15_01"); //Was machst du hier?
	AI_Output(self, hero, "BEG_701_HI_02_02"); //Ich schau mir an wer hier ein und ausgeht. Die Soldaten achten nicht auf alles. Ich schon.
	AI_Output(hero, self, "BEG_701_HI_15_03"); //Und warum?
	AI_Output(self, hero, "BEG_701_HI_02_04"); //Es gibt immer jemanden der bereit ist, für Neuigkeiten zu bezahlen.
};

///////////////////////////////////////////////////////////////////////
//	Info NEWS
///////////////////////////////////////////////////////////////////////
instance BEG_701_Jose_NEWS(C_Info)
{
	npc				= BEG_701_Jose;
	nr				= 13;
	condition		= BEG_701_Jose_NEWS_Condition;
	information		= BEG_701_Jose_NEWS_Info;
	description		= "Und, gibt's was Neues?";
};

func int BEG_701_Jose_NEWS_Condition()
{
	if (Npc_KnowsInfo(hero, BEG_701_Jose_HI)
	&& (Beggars_Secrets >= 3))
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_701_Jose_NEWS_Info()
{
	AI_Output(hero, self, "BEG_701_NEWS_15_01"); //Und, gibt's was Neues?
	AI_Output(self, hero, "BEG_701_NEWS_02_02"); //Es gibt immer was Neues. Bei so viel Verrückten hier...
	AI_Output(hero, self, "BEG_701_NEWS_15_03"); //Wie meinst du das?
	AI_Output(self, hero, "BEG_701_NEWS_02_04"); //Zum Beispiel Bromor. Der Baumeister sammelt Trophäen von Tieren.
	AI_Output(self, hero, "BEG_701_NEWS_02_05"); //Und die meisten anderen trauen sich selber nicht über den Weg. Alles Verrückte!
	AI_Output(self, hero, "BEG_701_NEWS_02_06"); //Und ich bin mittendrin und krieg alles mit. Das ist besser als Arenakämpfe ansehen.
};
