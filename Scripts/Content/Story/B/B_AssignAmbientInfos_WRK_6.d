instance Infos_Wrk_6_Exit(C_Info)
{
	nr				= 999;
	condition		= Infos_Wrk_6_Exit_Condition;
	information		= Infos_Wrk_6_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Infos_Wrk_6_Exit_Condition()
{
	return TRUE;
};

func void Infos_Wrk_6_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_6_HI(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_6_HI_Condition;
	information		= Infos_Wrk_6_HI_Info;
	permanent		= TRUE;
	description		= "Wie läufts?";
};

func int Infos_Wrk_6_HI_Condition()
{
	return TRUE;
};

func void Infos_Wrk_6_HI_Info()
{
	AI_Output(other, self, "Infos_Wrk_6_HI_Info_15_01"); //Wie läufts?
	AI_Output(self, other, "Infos_Wrk_6_HI_Info_06_02"); //Viel Arbeit, wenig Schlaf. Wenigstens haben wir noch Bier.
};

///////////////////////////////////////////////////////////////////////
//	Info CAMP
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_6_CAMP(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_6_CAMP_Condition;
	information		= Infos_Wrk_6_CAMP_Info;
	permanent		= TRUE;
	description		= "Wie siehts im Lager aus?";
};

func int Infos_Wrk_6_CAMP_Condition()
{
	return TRUE;
};

func void Infos_Wrk_6_CAMP_Info()
{
	AI_Output(other, self, "Infos_Wrk_6_CAMP_Info_15_01"); //Wie siehts im Lager aus?
	AI_Output(self, other, "Infos_Wrk_6_CAMP_Info_06_02"); //Wir Arbeiter verstärken den Wall. Wir sorgen dafür das die Orks hier nicht reinspazieren werden.
	AI_Output(self, other, "Infos_Wrk_6_CAMP_Info_06_03"); //Und wenn sie es versuchen sollten, wird ihnen die Miliz ganz schön einheizen.
	AI_Output(self, other, "Infos_Wrk_6_CAMP_Info_06_04"); //Die Heiler kümmern sich um die Aussätzigen. Und wenn du was brauchst, das Händlerviertel ist hinter der Arena.
};

/* //////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_6_STORY(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_6_STORY_Condition;
	information		= Infos_Wrk_6_STORY_Info;
	permanent		= TRUE;
	description		= "Erzähl mir was über den König";
};

func int Infos_Wrk_6_STORY_Condition()
{
	return TRUE;
};

func void Infos_Wrk_6_STORY_Info()
{
	AI_Output(other, self, "Infos_Wrk_6_STORY_Info_15_01"); //Erzähl mir was über den König.
	AI_Output(self, other, "Infos_Wrk_6_STORY_Info_06_02"); //Der König hat die Hosen voll! Sitzt in der Felsenfestung anstatt mit seinen Paladinen hier ins Lager zu kommen.
	AI_Output(self, other, "Infos_Wrk_6_STORY_Info_06_03"); //Gemeinsam hätten wir eine Chance gegen die Orks, aber so wie es aussieht, werden die Orks einfach das ganze Tal überrennen!
};
*/

///////////////////////////////////////////////////////////////////////
//	Info BOSS
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_6_BOSS(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_6_BOSS_Condition;
	information		= Infos_Wrk_6_BOSS_Info;
	description		= "Wer hat hier das Sagen?";
};

func int Infos_Wrk_6_BOSS_Condition()
{ var C_Npc Dyrian; Dyrian = Hlp_GetNpc(WRK_202_DYRIAN);

	var C_Npc Bromor; Bromor = Hlp_GetNpc(WRK_203_BROMOR);
	if ((Bromor.aivar[AIV_FINDABLE] == FALSE)
	&& (Dyrian.aivar[AIV_FINDABLE] == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Infos_Wrk_6_BOSS_Info()
{
	AI_Output(other, self, "Infos_Wrk_6_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output(self, other, "Infos_Wrk_6_BOSS_Info_06_02"); //Bromor und Dyrian. Der Baumeister und der Zimmermann. Die beiden kümmern sich um uns und das Lager.

	var C_Npc Bromor; Bromor = Hlp_GetNpc(WRK_203_BROMOR);
	Bromor.aivar[AIV_FINDABLE] = TRUE;

	var C_Npc Dyrian; Dyrian = Hlp_GetNpc(WRK_202_DYRIAN);
	Dyrian.aivar[AIV_FINDABLE] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	 Zuweisung
///////////////////////////////////////////////////////////////////////

func void B_AssignAmbientInfos_Wrk_6(var C_Npc slf)
{
	B_AssignFindNpc_WRK(slf);

	Infos_Wrk_6_Exit.npc = Hlp_GetInstanceID(slf);

	Infos_Wrk_6_HI.npc = Hlp_GetInstanceID(slf);
	Infos_Wrk_6_CAMP.npc = Hlp_GetInstanceID(slf);
	Infos_Wrk_6_BOSS.npc = Hlp_GetInstanceID(slf);
	//Infos_Wrk_6_STORY.npc = Hlp_GetInstanceID(slf);
};
