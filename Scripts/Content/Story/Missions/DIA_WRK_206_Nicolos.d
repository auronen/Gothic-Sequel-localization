///////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////
instance WRK_206_Nicolos_Exit(C_Info)
{
	npc				= WRK_206_Nicolos;
	nr				= 999;
	condition		= WRK_206_Nicolos_Exit_Condition;
	information		= WRK_206_Nicolos_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int WRK_206_Nicolos_Exit_Condition()
{
	return TRUE;
};

func void WRK_206_Nicolos_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GOOD
///////////////////////////////////////////////////////////////////////
instance WRK_206_Nicolos_GOOD(C_Info)
{
	npc				= WRK_206_Nicolos;
	nr				= 1;
	condition		= WRK_206_Nicolos_GOOD_Condition;
	information		= WRK_206_Nicolos_GOOD_Info;
	permanent		= TRUE;
	description		= "Wie schmeckt dir das Essen hier?";
};

func int WRK_206_Nicolos_GOOD_Condition()
{
	return TRUE;
};

func void WRK_206_Nicolos_GOOD_Info()
{
	AI_Output(hero, self, "WRK_206_GOOD_15_01"); //Wie schmeckt dir das Essen hier?
	AI_Output(self, hero, "WRK_206_GOOD_00_02"); //Snaf ist der beste Koch hier im Lager. Seine Suppen sind erste Klasse!
};
