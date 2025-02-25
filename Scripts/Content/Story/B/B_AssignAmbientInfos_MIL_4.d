///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_4_Exit(C_Info)
{
	nr				= 999;
	condition		= Infos_Mil_4_Exit_Condition;
	information		= Infos_Mil_4_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Infos_Mil_4_Exit_Condition()
{
	return TRUE;
};

func void Infos_Mil_4_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_4_HI(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_4_HI_Condition;
	information		= Infos_Mil_4_HI_Info;
	permanent		= TRUE;
	description		= "Wie läufts?";
};

func int Infos_Mil_4_HI_Condition()
{
	return TRUE;
};

func void Infos_Mil_4_HI_Info()
{
	AI_Output(other, self, "Infos_Mil_4_HI_Info_15_01"); //Wie läufts?
	AI_Output(self, other, "Infos_Mil_4_HI_Info_04_02"); //Es ist immer dasselbe Spiel Jungchen. Auf der einen Seite stehen wir, auf der anderen der Feind.
	AI_Output(self, other, "Infos_Mil_4_HI_Info_04_03"); //Manchmal verlieren wir, manchmal gewinnen wir.
};

///////////////////////////////////////////////////////////////////////
//	Info FOODGOOD
///////////////////////////////////////////////////////////////////////
instance Info_Mil_4_FOODGOOD(C_Info)
{
	nr				= 0;
	condition		= Info_Mil_4_FOODGOOD_Condition;
	information		= Info_Mil_4_FOODGOOD_Info;
	permanent		= TRUE;
	description		= "Wie schmeckt das Essen hier?";
};

func int Info_Mil_4_FOODGOOD_Condition()
{
	if (B_LunchTimeAtHalvors()
	&& !Talamon_KnowStinkingSalt
	&& Npc_KnowsInfo(hero, MIL_100_Halvor_SNAF))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Mil_4_FOODGOOD_Info()
{
	AI_Output(hero, self, "Info_Mil_4_FOODGOOD_15_01"); //Wie schmeckt das Essen hier?
	AI_Output(self, hero, "Info_Mil_4_FOODGOOD_04_02"); //Halvors Frass kann man wirklich essen.
	AI_Output(self, hero, "Info_Mil_4_FOODGOOD_04_03"); //Aber nur, wenn nicht wieder einer der Jungs hier sich den üblichen Spass erlaubt!
	AI_Output(hero, self, "Info_Mil_4_FOODGOOD_15_04"); //Was für einen Spass?
	AI_Output(self, hero, "Info_Mil_4_FOODGOOD_04_05"); //Sie gehen zu Talamon, dem Alchemiesten und besorgen sich Müffelsalz.
	AI_Output(self, hero, "Info_Mil_4_FOODGOOD_04_06"); //Dann wenn Halvor nicht hinsieht, ab damit in den Kochkessel, und rein zufällig hat dann der Witzbold am diesem Tag überhaupt keinen Hunger!

	B_LogEntry(CH1_LearnCooking, CH1_LearnCooking_4);

	Talamon_KnowStinkingSalt = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info JOIN
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_4_JOIN(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_4_JOIN_Condition;
	information		= Infos_Mil_4_JOIN_Info;
	permanent		= TRUE;
	description		= "Könnt ihr noch einen Mann gebrauchen?";
};

func int Infos_Mil_4_JOIN_Condition()
{
	return TRUE;
};

func void Infos_Mil_4_JOIN_Info()
{
	AI_Output(other, self, "Infos_Mil_4_JOIN_Info_15_01"); //Könnt ihr noch einen Mann gebrauchen?
	AI_Output(self, other, "Infos_Mil_4_JOIN_Info_04_02"); //Das obliegt nicht meiner Entscheidung, Jungchen.
	AI_Output(self, other, "Infos_Mil_4_JOIN_Info_04_03"); //Unser Hauptmann Berengar entscheidet das. Aber ich kann dir sagen, was die Bedingungen für eine Aufnahme sind.
	var C_Npc Berengar; Berengar = Hlp_GetNpc(MIL_103_Berengar);
	Berengar.aivar[AIV_FINDABLE] = TRUE;

	Info_ClearChoices(Infos_Mil_4_JOIN);
	Info_AddChoice(Infos_Mil_4_JOIN, DIALOG_BACK, Infos_Mil_4_JOIN_BACK);
	Info_AddChoice(Infos_Mil_4_JOIN, "Was sind die Bedingungen?", Infos_Mil_4_JOIN_CONDI);
};

func void Infos_Mil_4_JOIN_BACK()
{
	Info_ClearChoices(Infos_Mil_4_JOIN);
};

func void Infos_Mil_4_JOIN_CONDI()
{
	AI_Output(other, self, "Infos_Mil_4_JOIN_CONDI_Info_15_01"); //Was sind die Bedingungen?
	AI_Output(self, other, "Infos_Mil_4_JOIN_CONDI_Info_04_02"); //Es gibt drei Bedingungen, die ein Mann erfüllen muss, um Rekrut bei der Miliz zu werden.
	AI_Output(self, other, "Infos_Mil_4_JOIN_CONDI_Info_04_03"); //Zunächst musst den Umgang mit einer Waffe beherrschen und einen kräftigen Arm haben. Vorher brauchst du nicht mal mit jemanden darüber sprechen.
	AI_Output(self, other, "Infos_Mil_4_JOIN_CONDI_Info_04_04"); //Wenn du dich dann zur Miliz meldest, wirst du zur Wache eingeteilt. Das kann alles mögliche bedeuten.
	AI_Output(self, other, "Infos_Mil_4_JOIN_CONDI_Info_04_05"); //Entweder ein Tor bewachen, Patrouillie gehen, auf der Pallisade stehen, es gibt einen ganzen Haufen Arbeit mit der du beschäftigt werden kannst.
	AI_Output(self, other, "Infos_Mil_4_JOIN_CONDI_Info_04_06"); //Schlägt dein Herz danach immer noch für die Miliz, dann darfst du gegen einen von uns antreten. Wenn du danach noch stehst, bist du dabei.
	AI_Output(self, other, "Infos_Mil_4_JOIN_CONDI_Info_04_07"); //Aber denke daran, wenn du zur Miliz gehörst, dann ist Schluss mit dem faulen Leben. Dann ist Disziplin gefordert! Jeden Tag Meldung machen!

	Info_ClearChoices(Infos_Mil_4_JOIN);
};

///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_4_STORY(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_4_STORY_Condition;
	information		= Infos_Mil_4_STORY_Info;
	permanent		= TRUE;
	description		= "Erzähl mir was über die Orks";
};

func int Infos_Mil_4_STORY_Condition()
{
	return TRUE;
};

func void Infos_Mil_4_STORY_Info()
{
	AI_Output(other, self, "Infos_Mil_4_STORY_Info_15_01"); //Erzähl mir was über die Orks.
	AI_Output(self, other, "Infos_Mil_4_STORY_Info_04_03"); //Ich habe schon oft gegen die Orks gekämpft.
	AI_Output(self, other, "Infos_Mil_4_STORY_Info_04_04"); //Früher bei den Grenzkriegen, da haben sie uns auch belagert. Genau wie jetzt.
	AI_Output(self, other, "Infos_Mil_4_STORY_Info_04_05"); //Sie werden auf einen günstigen Moment warten. Und wenn wir nicht damit rechnen, dann werden sei da sein!
};

///////////////////////////////////////////////////////////////////////
//	Info BOSS
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_4_BOSS(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_4_BOSS_Condition;
	information		= Infos_Mil_4_BOSS_Info;
	permanent		= TRUE;
	description		= "Wer hat hier das Sagen?";
};

func int Infos_Mil_4_BOSS_Condition()
{
	var C_Npc Berengar; Berengar = Hlp_GetNpc(MIL_103_Berengar);
	var C_Npc Cassian; Cassian = Hlp_GetNpc(MIL_119_Cassian);

	if ((Berengar.aivar[AIV_FINDABLE] == FALSE) || (Cassian.aivar[AIV_FINDABLE] == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Infos_Mil_4_BOSS_Info()
{
	AI_Output(other, self, "Infos_Mil_4_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output(self, other, "Infos_Mil_4_BOSS_Info_04_02"); //Berengar ist unser Hauptmann. Aber du solltest ihm aus dem Weg gehen, glaub mir.
	AI_Output(self, other, "Infos_Mil_4_BOSS_Info_04_03"); //Sprich lieber mit Cassian, das ist sein Leutnant.

	var C_Npc Berengar; Berengar = Hlp_GetNpc(MIL_103_Berengar);
	Berengar.aivar[AIV_FINDABLE] = TRUE;

	var C_Npc Cassian; Cassian = Hlp_GetNpc(MIL_119_Cassian);
	Cassian.aivar[AIV_FINDABLE] = TRUE;
};

// -------------------------------------------------------------------------
//	Weist die Ambient-Infos dem aktuellen NSC-Gesprächspartner zu
// -------------------------------------------------------------------------
func void B_AssignAmbientInfos_Mil_4(var C_Npc slf)
{
	B_AssignFindNpc_WRK(slf);

	Infos_Mil_4_Exit.npc = Hlp_GetInstanceID(slf);
	Infos_Mil_4_HI.npc = Hlp_GetInstanceID(slf);
	//Infos_Mil_4_JOIN.npc = Hlp_GetInstanceID(slf);
	Infos_Mil_4_STORY.npc = Hlp_GetInstanceID(slf);
	Infos_Mil_4_BOSS.npc = Hlp_GetInstanceID(slf);
	Info_Mil_4_FOODGOOD.npc = Hlp_GetInstanceID(slf);
};
