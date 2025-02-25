///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance HLR_500_Palgur_EXIT(C_Info)
{
	npc				= HLR_500_Palgur;
	nr				= 999;
	condition		= HLR_500_Palgur_EXIT_Condition;
	information		= HLR_500_Palgur_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int HLR_500_Palgur_EXIT_Condition()
{
	return TRUE;
};

func void HLR_500_Palgur_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info _POS
///////////////////////////////////////////////////////////////////////
instance HLR_500_Palgur_POS(C_Info)
{
	npc				= HLR_500_Palgur;
	nr				= 1;
	condition		= HLR_500_Palgur_POS_Condition;
	information		= HLR_500_Palgur_POS_Info;
	description		= "Was für eine Krankheit haben diese Leute?";
};

func int HLR_500_Palgur_POS_Condition()
{
	if (!Npc_KnowsInfo(hero, HLR_501_Talamon_HASRECIPE))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_500_Palgur_POS_Info()
{
	AI_Output(hero, self, "HLR_500__POS_15_01"); //Was für eine Krankheit haben diese Gestalten?
	AI_Output(self, hero, "HLR_500__POS_08_02"); //Die Kranken verlieren ihren Verstand und ihr Körper geht jämmerlich zugrunde.
	AI_Output(self, hero, "HLR_500__POS_08_03"); //Wir haben bisher noch keine Aufzeichnungen darüber gefunden.
};

///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance HLR_500_Palgur_JOB(C_Info)
{
	npc				= HLR_500_Palgur;
	nr				= 1;
	condition		= HLR_500_Palgur_JOB_Condition;
	information		= HLR_500_Palgur_JOB_Info;
	permanent		= TRUE;
	description		= "Was ist deine Aufgabe hier?";
};

func int HLR_500_Palgur_JOB_Condition()
{
	return TRUE;
};

func void HLR_500_Palgur_JOB_Info()
{
	AI_Output(hero, self, "HLR_500_JOB_15_01"); //Was ist deine Aufgabe hier?
	AI_Output(self, hero, "HLR_500_JOB_08_02"); //Ich erforsche verschiedene Rezepturen, um ein Heilmittel zu finden
	AI_Output(self, hero, "HLR_500_JOB_08_03"); //Wir haben herausgefunden, daß die Kranken durch SUMPFKRAUT beruhigt werden.
	AI_Output(hero, self, "HLR_500_JOB_15_04"); //Das ist alles?
	AI_Output(self, hero, "HLR_500_JOB_08_05"); //... alles? Wir verzeichnen das als den ersten großen Fortschritt.
};

///////////////////////////////////////////////////////////////////////
//	Info _POS
///////////////////////////////////////////////////////////////////////
instance HLR_500_Palgur_RECIPE(C_Info)
{
	npc				= HLR_500_Palgur;
	nr				= 1;
	condition		= HLR_500_Palgur_RECIPE_Condition;
	information		= HLR_500_Palgur_RECIPE_Info;
	description		= "Wie geht die Arbeit voran?";
};

func int HLR_500_Palgur_RECIPE_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_HASRECIPE))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_500_Palgur_RECIPE_Info()
{
	AI_Output(hero, self, "HLR_500_RECIPE_15_01"); //Wie geht die Arbeit voran?
	AI_Output(self, hero, "HLR_500_RECIPE_08_02"); //Dank der Rezeptur, die du uns besorgt hast, können wir unsere Forschungen gezielter durchführen.
	AI_Output(self, hero, "HLR_500_RECIPE_08_03"); //Trotzdem ist es noch ein langer Weg, bis wir ein Heilmittel gefunden haben.
};
