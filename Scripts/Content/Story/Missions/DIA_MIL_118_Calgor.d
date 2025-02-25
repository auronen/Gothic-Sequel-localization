instance MIL_118_Calgor_Exit(C_Info)
{
	npc				= MIL_118_Calgor;
	nr				= 999;
	condition		= MIL_118_Calgor_Exit_Condition;
	information		= MIL_118_Calgor_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int MIL_118_Calgor_Exit_Condition()
{
	return TRUE;
};

func void MIL_118_Calgor_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance MIL_118_Calgor_HI(C_Info)
{
	npc				= MIL_118_Calgor;
	nr				= 12;
	condition		= MIL_118_Calgor_HI_Condition;
	information		= MIL_118_Calgor_HI_Info;
	permanent		= TRUE;
	description		= "Was machst du hier?";
};

func int MIL_118_Calgor_HI_Condition()
{
	return TRUE;
};

func void MIL_118_Calgor_HI_Info()
{
	AI_Output(hero, self, "MIL_118_HI_15_01"); //Was machst du hier?
	AI_Output(self, hero, "MIL_118_HI_08_02"); //Ich bin Calgor, Soldat der ... dieses Haufens.
	AI_Output(self, hero, "MIL_118_HI_08_03"); //Hier im Lager wimmelt es nur so von Halsabschneidern und Dieben.
	AI_Output(self, hero, "MIL_118_HI_08_04"); //Aber niemand tut was dagegen. Ja, wenn der König hier wäre, er würde hier Ordnung und Disziplin reinbringen.
	AI_Output(self, hero, "MIL_118_HI_08_05"); //Aber der weiß schon, warum er nicht hier ist, er hat sich um wichtigeres zu kümmern, als um diesen Haufen Gesindel!
};
