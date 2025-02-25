///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_9_Exit(C_Info)
{
	nr				= 999;
	condition		= Infos_Mil_9_Exit_Condition;
	information		= Infos_Mil_9_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Infos_Mil_9_Exit_Condition()
{
	return TRUE;
};

func void Infos_Mil_9_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_9_HI(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_9_HI_Condition;
	information		= Infos_Mil_9_HI_Info;
	permanent		= TRUE;
	description		= "Wie läufts?";
};

func int Infos_Mil_9_HI_Condition()
{
	return TRUE;
};

func void Infos_Mil_9_HI_Info()
{
	AI_Output(other, self, "Infos_Mil_9_HI_Info_15_01"); //Wie läufts?
	AI_Output(self, other, "Infos_Mil_9_HI_Info_06_02"); //(brummig) jaja, läuft gut.
};

///////////////////////////////////////////////////////////////////////
//	Info FOODGOOD
///////////////////////////////////////////////////////////////////////
instance Info_Mil_9_FOODGOOD(C_Info)
{
	nr				= 0;
	condition		= Info_Mil_9_FOODGOOD_Condition;
	information		= Info_Mil_9_FOODGOOD_Info;
	permanent		= TRUE;
	description		= "Übles Essen hier! Willst du dir etwas Silber verdienen?";
};

func int Info_Mil_9_FOODGOOD_Condition()
{
	if (B_LunchTimeAtHalvors()
	&& (self.aivar[AIV_DEALDAY] < B_GetDay())
	&& Npc_KnowsInfo(hero, MIL_100_Halvor_SNAF))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Mil_9_FOODGOOD_Info()
{
	AI_Output(hero, self, "Info_Mil_9_FOODGOOD_15_01"); //Übles Essen hier! Willst du dir etwas Silber verdienen?

	if (Npc_HasItems(hero, ItMi_Silver) >= SNAF_BRIBE_SUM)
	{
		AI_Output(self, hero, "Info_Mil_9_FOODGOOD_09_03"); //Was muss ich dafür machen?
		AI_Output(hero, self, "Info_Mil_9_FOODGOOD_15_04"); //Kauf dein Mittagessen ab morgen bei Snaf im Aussenring!
		AI_Output(self, hero, "Info_Mil_9_FOODGOOD_09_05"); //Warum nicht, dort schmeckt es zwar nicht ganz so gut, aber Silber ist Silber!
		B_GiveInvItems(hero, self, ItMi_Silver, SNAF_BRIBE_SUM);

		self.aivar[AIV_DEALDAY] = B_GetDay();

		Snaf_MilitiaBribed = Snaf_MilitiaBribed + 1;
		if ((Snaf_MilitiaBribed + Snaf_MilitiaFrightened) >= SNAF_NEW_CUSTOMERS)
		{
			B_Snaf_NewCustomers();
		};
	}
	else
	{
		B_Say(self, hero, "$NotEnoughSilver");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info JOIN
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_9_JOIN(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_9_JOIN_Condition;
	information		= Infos_Mil_9_JOIN_Info;
	permanent		= TRUE;
	description		= "Könnt ihr noch einen Mann gebrauchen?";
};

func int Infos_Mil_9_JOIN_Condition()
{
	return TRUE;
};

func void Infos_Mil_9_JOIN_Info()
{
	AI_Output(other, self, "Infos_Mil_9_JOIN_Info_15_01"); //Könnt ihr noch einen Mann gebrauchen?

	AI_Output(self, other, "Infos_Mil_9_JOIN_Info_06_02"); //Das solltest du dir gut überlegen. Bei uns ist Disziplin gefordert.
	AI_Output(self, other, "Infos_Mil_9_JOIN_Info_06_03"); //Selbst wenn du keine Aufgaben hast, hast du Aufgaben. Jeden Tag musst du dich einmal melden.
	AI_Output(self, other, "Infos_Mil_9_JOIN_Info_06_04"); //Wenn du das wirklich willst, dann sprich mal mit Cassian. Er ist Leutnant und kümmert sich um die Neuen.
	Info_ClearChoices(Infos_Mil_9_JOIN);
};

///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_9_STORY(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_9_STORY_Condition;
	information		= Infos_Mil_9_STORY_Info;
	permanent		= TRUE;
	description		= "Erzähl mir was über die Orks";
};

func int Infos_Mil_9_STORY_Condition()
{
	return TRUE;
};

func void Infos_Mil_9_STORY_Info()
{
	AI_Output(other, self, "Infos_Mil_9_STORY_Info_15_01"); //Erzähl mir was über die Orks.
	AI_Output(self, other, "Infos_Mil_9_STORY_Info_09_02"); //Man darf nicht den Fehler machen, sie zu unterschätzen. Es sind keine Wilden, gegen die wir da kämpfen.
	AI_Output(self, other, "Infos_Mil_9_STORY_Info_09_03"); //Sie haben eine Kultur die wahrscheinlich älter ist, als die der Menschen.
	AI_Output(self, other, "Infos_Mil_9_STORY_Info_09_04"); //Aber das gefährliche ist, das sie leben um zu kämpfen. Und sie kämpfen um zu sterben.
};

///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_9_BOSS(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_9_BOSS_Condition;
	information		= Infos_Mil_9_BOSS_Info;
	permanent		= TRUE;
	description		= "Wer hat hier das Sagen?";
};

func int Infos_Mil_9_BOSS_Condition()
{
	var C_Npc Berengar; Berengar = Hlp_GetNpc(MIL_103_Berengar);

	var C_Npc Cassian; Cassian = Hlp_GetNpc(MIL_119_Cassian);

	var C_Npc Brutus; Brutus = Hlp_GetNpc(MIL_121_Brutus);

	if ((Berengar.aivar[AIV_FINDABLE] == FALSE)
	|| (Cassian.aivar[AIV_FINDABLE] == FALSE)
	|| (Brutus.aivar[AIV_FINDABLE] == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Infos_Mil_9_BOSS_Info()
{
	AI_Output(other, self, "Infos_Mil_9_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output(self, other, "Infos_Mil_9_BOSS_Info_09_02"); //Hauptmann Berengar führt das Kommando. Er hat zwei Leutnants die seine Befehle weitergeben, Cassian und Brutus.

	var C_Npc Berengar; Berengar = Hlp_GetNpc(MIL_103_Berengar);
	Berengar.aivar[AIV_FINDABLE] = TRUE;

	var C_Npc Cassian; Cassian = Hlp_GetNpc(MIL_119_Cassian);
	Cassian.aivar[AIV_FINDABLE] = TRUE;

	var C_Npc Brutus; Brutus = Hlp_GetNpc(MIL_121_Brutus);
	Brutus.aivar[AIV_FINDABLE] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Zuweisung der Infos zum NSC
///////////////////////////////////////////////////////////////////////
func void B_AssignAmbientInfos_Mil_9(var C_Npc slf)
{
	B_AssignFindNpc_MIL(slf);

	Infos_Mil_9_Exit.npc = Hlp_GetInstanceID(slf);
	Infos_Mil_9_HI.npc = Hlp_GetInstanceID(slf);
	//Infos_Mil_9_JOIN.npc = Hlp_GetInstanceID(slf);
	Infos_Mil_9_STORY.npc = Hlp_GetInstanceID(slf);
	Infos_Mil_9_BOSS.npc = Hlp_GetInstanceID(slf);
	Info_Mil_9_FOODGOOD.npc = Hlp_GetInstanceID(slf);
};
