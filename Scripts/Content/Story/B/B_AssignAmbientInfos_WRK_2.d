///////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_2_Exit(C_Info)
{
	nr				= 999;
	condition		= Infos_Wrk_2_Exit_Condition;
	information		= Infos_Wrk_2_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Infos_Wrk_2_Exit_Condition()
{
	return TRUE;
};

func void Infos_Wrk_2_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_2_HI(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_2_HI_Condition;
	information		= Infos_Wrk_2_HI_Info;
	permanent		= TRUE;
	description		= "Wie läufts?";
};

func int Infos_Wrk_2_HI_Condition()
{
	return TRUE;
};

func void Infos_Wrk_2_HI_Info()
{
	AI_Output(other, self, "Infos_Wrk_2_HI_Info_15_01"); //Wie läufts?
	AI_Output(self, other, "Infos_Wrk_2_HI_Info_01_02"); //Wir müssen einen starken Wall bauen. Nur ein starker Wall kann die Orks aufhalten!
};

///////////////////////////////////////////////////////////////////////
//	Info CAMP
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_2_CAMP(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_2_CAMP_Condition;
	information		= Infos_Wrk_2_CAMP_Info;
	permanent		= TRUE;
	description		= "Wie siehts im Lager aus?";
};

func int Infos_Wrk_2_CAMP_Condition()
{
	return TRUE;
};

func void Infos_Wrk_2_CAMP_Info()
{
	AI_Output(other, self, "Infos_Wrk_2_CAMP_Info_15_01"); //Wie siehts im Lager aus?
	AI_Output(self, other, "Infos_Wrk_2_CAMP_Info_01_02"); //Die Miliz beschützt alle die arbeiten.
	AI_Output(self, other, "Infos_Wrk_2_CAMP_Info_01_03"); //Aber es gibt auch viele die nicht arbeiten. Die sollen selber zusehen wie sie klarkommen.
};

/* //////////////////////////////////////////////////////////////////////
//	Info STORY
///-
instance Infos_Wrk_2_STORY(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_2_STORY_Condition;
	information		= Infos_Wrk_2_STORY_Info;
	permanent		= TRUE;
	description		= "Erzähl mir was über den König";
};

func int Infos_Wrk_2_STORY_Condition()
{
	return TRUE;
};

func void Infos_Wrk_2_STORY_Info()
{
	AI_Output(other, self, "Infos_Wrk_2_STORY_Info_15_01"); //Erzähl mir was über den König.
	AI_Output(self, other, "Infos_Wrk_2_STORY_Info_02_02"); //Der König hat sich hier nur einmal im Lager blicken lassen. Weißt du was er uns gesagt hat?
	AI_Output(self, other, "Infos_Wrk_2_STORY_Info_02_03"); //Er hat gesagt wir sollen uns verstecken!
	AI_Output(self, other, "Infos_Wrk_2_STORY_Info_02_04"); //Wer sind wir denn? Figuren in einem Spiel?
}; */

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_2_BOSS(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_2_BOSS_Condition;
	information		= Infos_Wrk_2_BOSS_Info;
	description		= "Wer hat hier das Sagen?";
};

func int Infos_Wrk_2_BOSS_Condition()
{
	var C_Npc Bromor; Bromor = Hlp_GetNpc(WRK_203_Bromor);
	if (Bromor.aivar[AIV_FINDABLE] == FALSE)
	{
		return TRUE;
	};

	return FALSE;
};

func void Infos_Wrk_2_BOSS_Info()
{
	AI_Output(other, self, "Infos_Wrk_2_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output(self, other, "Infos_Wrk_2_BOSS_Info_01_02"); //Bromor. Er ist der Baumeister. Sprich mit ihm, wenn du was willst.

	var C_Npc Bromor; Bromor = Hlp_GetNpc(WRK_203_Bromor);
	Bromor.aivar[AIV_FINDABLE] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Zuweisung
///////////////////////////////////////////////////////////////////////

func void B_AssignAmbientInfos_Wrk_2(var C_Npc slf)
{
	B_AssignFindNpc_WRK(slf);

	Infos_Wrk_2_Exit.npc = Hlp_GetInstanceID(slf);

	//Infos_Wrk_2_STORY.npc = Hlp_GetInstanceID(slf);
	Infos_Wrk_2_HI.npc = Hlp_GetInstanceID(slf);
	Infos_Wrk_2_CAMP.npc = Hlp_GetInstanceID(slf);
	Infos_Wrk_2_BOSS.npc = Hlp_GetInstanceID(slf);
};
