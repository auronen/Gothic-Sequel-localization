instance Infos_Thf_5_Exit(C_Info)
{
	nr				= 999;
	condition		= Infos_Thf_5_Exit_Condition;
	information		= Infos_Thf_5_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Infos_Thf_5_Exit_Condition()
{
	return TRUE;
};

func void Infos_Thf_5_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance Infos_Thf_5_HI(C_Info)
{
	nr				= 0;
	condition		= Infos_Thf_5_HI_Condition;
	information		= Infos_Thf_5_HI_Info;
	permanent		= TRUE;
	description		= "Wie läufts?";
};

func int Infos_Thf_5_HI_Condition()
{
	return TRUE;
};

func void Infos_Thf_5_HI_Info()
{
	AI_Output(other, self, "Infos_Thf_5_HI_Info_15_01"); //Wie läufts?
	AI_Output(self, other, "Infos_Thf_5_HI_Info_01_02"); //Mach es wie ich, lebe in den Tag!
	AI_Output(other, self, "Infos_Thf_5_HI_Info_15_03"); //Du scheinst ja richtig gut drauf zu sein.
	AI_Output(self, other, "Infos_Thf_5_HI_Info_01_04"); //Denn jeder Tag könnte dein letzter sein! Wer weiß ob nicht morgen schon die Orks angreifen?
};

///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
/*
instance Infos_Thf_5_STORY(C_Info)
{
	nr				= 0;
	condition		= Infos_Thf_5_STORY_Condition;
	information		= Infos_Thf_5_STORY_Info;
	permanent		= TRUE;
	description		= "Was gibt's Neues?";
};

func int Infos_Thf_5_STORY_Condition()
{
	return TRUE;
};

func void Infos_Thf_5_STORY_Info()
{
	AI_Output(other, self, "Infos_Thf_5_STORY_Info_15_01"); //Was gibt's Neues?
	AI_Output(self, other, "Infos_Thf_5_STORY_Info_05_02"); //Die Orks haben das Tal umzingelt aber warum greifen sie nicht an?
	AI_Output(self, other, "Infos_Thf_5_STORY_Info_05_03"); //Sie haben bestimmt Angst vor der Lichtsäule.
	AI_Output(self, other, "Infos_Thf_5_STORY_Info_05_04"); //Solange die Lichtsäule da ist, werden sie nicht angreifen. Hoffe ich zumindest...
};
*/
///////////////////////////////////////////////////////////////////////
//	Info CAMP
///////////////////////////////////////////////////////////////////////
instance Infos_Thf_5_CAMP(C_Info)
{
	nr				= 0;
	condition		= Infos_Thf_5_CAMP_Condition;
	information		= Infos_Thf_5_CAMP_Info;
	permanent		= TRUE;
	description		= "Wie siehts im Lager aus?";
};

func int Infos_Thf_5_CAMP_Condition()
{
	return TRUE;
};

func void Infos_Thf_5_CAMP_Info()
{
	AI_Output(other, self, "Infos_Thf_5_CAMP_Info_15_01"); //Wie siehts im Lager aus?
	AI_Output(self, other, "Infos_Thf_5_CAMP_Info_01_02"); //Die einzige Abwechslung die es hier gibt sind die abendlichen Arenakämpfe.
	AI_Output(self, other, "Infos_Thf_5_CAMP_Info_01_03"); //Den Rest wirst du schon mit der Zeit selber rausfinden.

	var C_Npc Nicolos; Nicolos = Hlp_GetNpc(WRK_206_Nicolos);
	Nicolos.aivar[AIV_FINDABLE] = TRUE;
};

instance Infos_Thf_5_BOSS(C_Info)
{
	nr				= 0;
	condition		= Infos_Thf_5_BOSS_Condition;
	information		= Infos_Thf_5_BOSS_Info;
	description		= "Wer hat hier das Sagen?";
};

func int Infos_Thf_5_BOSS_Condition()
{
	return TRUE;
};

func void Infos_Thf_5_BOSS_Info()
{
	AI_Output(other, self, "Infos_Thf_5_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output(self, other, "Infos_Thf_5_BOSS_Info_01_02"); //Unterschiedlich. Die Arbeiter lassen sich nur was vom Baumeister sagen, die Miliz von ihrem Hauptmann, und der Rest lässt sich von keinem was sagen.
};

// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_Thf_5(var C_Npc slf)
{
	B_AssignFindNpc_WRK(slf);

	Infos_Thf_5_Exit.npc = Hlp_GetInstanceID(slf);
	Infos_Thf_5_HI.npc = Hlp_GetInstanceID(slf);
	Infos_Thf_5_CAMP.npc = Hlp_GetInstanceID(slf);
	Infos_Thf_5_BOSS.npc = Hlp_GetInstanceID(slf);
};
