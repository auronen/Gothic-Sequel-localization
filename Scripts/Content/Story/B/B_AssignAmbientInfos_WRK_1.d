///////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_1_Exit(C_Info)
{
	nr				= 999;
	condition		= Infos_Wrk_1_Exit_Condition;
	information		= Infos_Wrk_1_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Infos_Wrk_1_Exit_Condition()
{
	return TRUE;
};

func void Infos_Wrk_1_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Special für Gerüstjungs
///////////////////////////////////////////////////////////////////////
instance Wrk_207_Worker_STEP(C_Info)
{
	npc				= Wrk_207_Worker;
	condition		= Wrk_207_Worker_STEP_Condition;
	information		= Wrk_207_Worker_STEP_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int Wrk_207_Worker_STEP_Condition()
{
	if (C_NPCisinvincible(self)
	&& (Npc_GetDistToWP(self, "OCR_PALISADE_WALK_51B") <= 500))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_207_Worker_STEP_Info()
{
	AI_Output(self, other, "Wrk_207_Worker_STEP_Info_15_01"); //Pass auf, das du nicht runterfällst!
};

///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_1_HI(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_1_HI_Condition;
	information		= Infos_Wrk_1_HI_Info;
	permanent		= TRUE;
	description		= "Wie läufts?";
};

func int Infos_Wrk_1_HI_Condition()
{
	return TRUE;
};

func void Infos_Wrk_1_HI_Info()
{
	AI_Output(other, self, "Infos_Wrk_1_HI_Info_15_01"); //Wie läufts?
	AI_Output(self, other, "Infos_Wrk_1_HI_Info_01_02"); //Es gibt viel zu tun. Wir müssen vorbereitet sein, falls die Orks kommen.
	AI_Output(other, self, "Infos_Wrk_1_HI_Info_15_03"); //Was meinst du mit Vorbereiten?
	AI_Output(self, other, "Infos_Wrk_1_HI_Info_01_04"); //Einen stabilen Wallschutz aufbauen, Waffen schmieden und Vorräte anlegen. Wir müssen in jeder Hinsicht vorbereitet sein. Jeder von uns. Du solltest dich auch vorbereiten.
};

///////////////////////////////////////////////////////////////////////
//	Info CAMP
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_1_CAMP(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_1_CAMP_Condition;
	information		= Infos_Wrk_1_CAMP_Info;
	permanent		= TRUE;
	description		= "Wie siehts im Lager aus?";
};

func int Infos_Wrk_1_CAMP_Condition()
{
	return TRUE;
};

func void Infos_Wrk_1_CAMP_Info()
{
	AI_Output(other, self, "Infos_Wrk_1_CAMP_Info_15_01"); //Wie siehts im Lager aus?
	AI_Output(self, other, "Infos_Wrk_1_CAMP_Info_01_02"); //Es könnte besser laufen, wenn mehr Leute arbeiten würden.  Es gibt einfach zuviel Gesindel.
	AI_Output(self, other, "Infos_Wrk_1_CAMP_Info_01_03"); //Das sie faul sind ist eine Sache, aber die sind auch feige. Und damit werden sie für uns völlig wertlos.
	AI_Output(other, self, "Infos_Wrk_1_CAMP_Info_15_04"); //Verstehe. Gerade jetzt ist jeder Mann wichtig.
	AI_Output(self, other, "Infos_Wrk_1_CAMP_Info_01_05"); //Die nicht! Dieses Diebespack, diese faulen Hunde, soll Beliar sie alle holen!
};

/* //////////////////////////////////////////////////////////////////////
//	Info STORY
///-
instance Infos_Wrk_1_STORY(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_1_STORY_Condition;
	information		= Infos_Wrk_1_STORY_Info;
	permanent		= TRUE;
	description		= "Erzähl mir was über...";
};

func int Infos_Wrk_1_STORY_Condition()
{
	return TRUE;
};

func void Infos_Wrk_1_STORY_Info()
{
	AI_Output(other, self, "Infos_Wrk_1_STORY_Info_15_01"); //Erzähl mir was über den König.
	AI_Output(self, other, "Infos_Wrk_1_STORY_Info_01_02"); //Der König sitzt mit seinen Paladinen in der Felsenfestung.
	AI_Output(self, other, "Infos_Wrk_1_STORY_Info_01_03"); //Er hat uns im Stich gelassen. Es ist ihm egal ob wir leben oder sterben.
};
*/

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance Infos_Wrk_1_BOSS(C_Info)
{
	nr				= 0;
	condition		= Infos_Wrk_1_BOSS_Condition;
	information		= Infos_Wrk_1_BOSS_Info;
	description		= "Wer hat hier das Sagen?";
};

func int Infos_Wrk_1_BOSS_Condition()
{
	var C_Npc Bromor; Bromor = Hlp_GetNpc(WRK_203_Bromor);
	if (Bromor.aivar[AIV_FINDABLE] == FALSE)
	{
		return TRUE;
	};

	return FALSE;
};

func void Infos_Wrk_1_BOSS_Info()
{
	AI_Output(other, self, "Infos_Wrk_1_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output(self, other, "Infos_Wrk_1_BOSS_Info_01_02"); //Bromor. Er ist der Baumeister. Sprich mit ihm, wenn du was willst.

	var C_Npc Bromor; Bromor = Hlp_GetNpc(WRK_203_Bromor);
	Bromor.aivar[AIV_FINDABLE] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Zuweisung
///////////////////////////////////////////////////////////////////////

func void B_AssignAmbientInfos_Wrk_1(var C_Npc slf)
{
	B_AssignFindNpc_WRK(slf);

	Infos_Wrk_1_Exit.npc = Hlp_GetInstanceID(slf);

	//Infos_Wrk_1_STORY.npc = Hlp_GetInstanceID(slf);
	Infos_Wrk_1_HI.npc = Hlp_GetInstanceID(slf);
	Infos_Wrk_1_CAMP.npc = Hlp_GetInstanceID(slf);
	Infos_Wrk_1_BOSS.npc = Hlp_GetInstanceID(slf);
};
