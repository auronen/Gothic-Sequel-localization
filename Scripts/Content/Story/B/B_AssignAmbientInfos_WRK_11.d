instance Infos_Wrk_11_Exit(C_Info)
{
	nr				= 999;
	condition		= Infos_Wrk_11_Exit_Condition;
	information		= Infos_Wrk_11_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Infos_Wrk_11_Exit_Condition()
{
	return TRUE;
};

func void Infos_Wrk_11_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_11_HI(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_11_HI_Condition;
	information		= Infos_Wrk_11_HI_Info;
	permanent		= TRUE;
	description		= "Wie läufts?";
};

func int Infos_Wrk_11_HI_Condition()
{
	return TRUE;
};

func void Infos_Wrk_11_HI_Info()
{
	AI_Output(other, self, "Infos_Wrk_11_HI_Info_15_01"); //Wie läufts?
	AI_Output(self, other, "Infos_Wrk_11_HI_Info_11_02"); //Gut. Es gibt zwar noch genug Arbeit, aber wir haben schon eine starke Verteidigung.
	AI_Output(self, other, "Infos_Wrk_11_HI_Info_11_03"); //Das gibt den Männern Mut. Und den werden sie brauchen, falls die Orks angreifen.
	AI_Output(other, self, "Infos_Wrk_11_HI_Info_15_04"); //Und werden die Orks angreifen?
	AI_Output(self, other, "Infos_Wrk_11_HI_Info_11_05"); //Wenn es soweit ist, werden wir es wissen.
};

///////////////////////////////////////////////////////////////////////
//	Info CAMP
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_11_CAMP(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_11_CAMP_Condition;
	information		= Infos_Wrk_11_CAMP_Info;
	permanent		= TRUE;
	description		= "Wie siehts im Lager aus?";
};

func int Infos_Wrk_11_CAMP_Condition()
{
	return TRUE;
};

func void Infos_Wrk_11_CAMP_Info()
{
	AI_Output(other, self, "Infos_Wrk_11_CAMP_Info_15_01"); //Wie siehts im Lager aus?
	AI_Output(self, other, "Infos_Wrk_11_CAMP_Info_11_02"); //Seit unserer Ankunft hier sind wir damit beschäftigt das Lager wieder aufzubauen.
	AI_Output(self, other, "Infos_Wrk_11_CAMP_Info_11_03"); //Und die Arbeit geht voran. Die Orks werden sich ihre Schädel am Wall einrennen!
	AI_Output(other, self, "Infos_Wrk_11_CAMP_Info_15_04"); //Glaubst du, sie werden bald angreifen?
	AI_Output(self, other, "Infos_Wrk_11_CAMP_Info_11_05"); //Natürlich. Wozu machen wir uns sonst die ganze Arbeit?
};

/* //////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_11_STORY(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_11_STORY_Condition;
	information		= Infos_Wrk_11_STORY_Info;
	permanent		= TRUE;
	description		= "Erzähl mir was über den König";
};

func int Infos_Wrk_11_STORY_Condition()
{
	return TRUE;
};

func void Infos_Wrk_11_STORY_Info()
{
	AI_Output(other, self, "Infos_Wrk_11_STORY_Info_15_01"); //Erzähl mir was über den König.
	AI_Output(self, other, "Infos_Wrk_11_STORY_Info_11_02"); //Der König hat bestimmt einen Plan.
	AI_Output(self, other, "Infos_Wrk_11_STORY_Info_11_03"); //Der ist nicht hier, weil er vor den Orks geflohen ist, sondern weil er weiß, das er sie hier besiegen kann.
	AI_Output(self, other, "Infos_Wrk_11_STORY_Info_11_04"); //Der König wird uns schon alle beschützen!
};
*/
///////////////////////////////////////////////////////////////////////
//	Info BOSS
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_11_BOSS(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_11_BOSS_Condition;
	information		= Infos_Wrk_11_BOSS_Info;
	description		= "Wer hat hier das Sagen?";
};

func int Infos_Wrk_11_BOSS_Condition()
{
	var C_Npc Bromor; Bromor = Hlp_GetNpc(WRK_203_BROMOR);
	var C_Npc Dyrian; Dyrian = Hlp_GetNpc(WRK_202_DYRIAN);

	if ((Bromor.aivar[AIV_FINDABLE] == FALSE)
	&& (Dyrian.aivar[AIV_FINDABLE] == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Infos_Wrk_11_BOSS_Info()
{
	AI_Output(other, self, "Infos_Wrk_11_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output(self, other, "Infos_Wrk_11_BOSS_Info_11_02"); //Gotmar der Schmied und Bromor der Baumeister. Die beiden haben das Kommando.

	var C_Npc Bromor; Bromor = Hlp_GetNpc(WRK_203_BROMOR);
	Bromor.aivar[AIV_FINDABLE] = TRUE;

	var C_Npc Gotmar; Gotmar = Hlp_GetNpc(WRK_200_GOTMAR);
	Gotmar.aivar[AIV_FINDABLE] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Zuweisung
///////////////////////////////////////////////////////////////////////

func void B_AssignAmbientInfos_Wrk_11(var C_Npc slf)
{
	B_AssignFindNpc_WRK(slf);

	Infos_Wrk_11_Exit.npc = Hlp_GetInstanceID(slf);
	//Infos_Wrk_11_STORY.npc = Hlp_GetInstanceID(slf);

	Infos_Wrk_11_HI.npc = Hlp_GetInstanceID(slf);
	Infos_Wrk_11_CAMP.npc = Hlp_GetInstanceID(slf);
	Infos_Wrk_11_BOSS.npc = Hlp_GetInstanceID(slf);
};
