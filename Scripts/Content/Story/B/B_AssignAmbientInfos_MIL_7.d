///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_7_Exit(C_Info)
{
	nr				= 999;
	condition		= Infos_Mil_7_Exit_Condition;
	information		= Infos_Mil_7_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Infos_Mil_7_Exit_Condition()
{
	return TRUE;
};

func void Infos_Mil_7_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_7_HI(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_7_HI_Condition;
	information		= Infos_Mil_7_HI_Info;
	permanent		= TRUE;
	description		= "Wie läufts?";
};

func int Infos_Mil_7_HI_Condition()
{
	return TRUE;
};

func void Infos_Mil_7_HI_Info()
{
	AI_Output(other, self, "Infos_Mil_7_HI_Info_15_01"); //Wie läufts?
	AI_Output(self, other, "Infos_Mil_7_HI_Info_07_02"); //(ärgerlich) Wie läuft was? Hast du nichts zu tun? Dann such dir Arbeit! Es gibt mehr als genug zu tun!

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOODGOOD
///////////////////////////////////////////////////////////////////////
instance Info_Mil_7_FOODGOOD(C_Info)
{
	nr				= 0;
	condition		= Info_Mil_7_FOODGOOD_Condition;
	information		= Info_Mil_7_FOODGOOD_Info;
	permanent		= TRUE;
	description		= "Du bist sicher, dass du Halvor's Frass hier essen willst?";
};

func int Info_Mil_7_FOODGOOD_Condition()
{
	if (B_LunchTimeAtHalvors()
	&& (self.aivar[AIV_DEALDAY] < B_GetDay())
	&& Npc_KnowsInfo(hero, MIL_100_Halvor_SNAF))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Mil_7_FOODGOOD_Info()
{
	AI_Output(hero, self, "Info_Mil_7_FOODGOOD_15_01"); //Du bist sicher, dass du Halvor's Frass hier essen willst?
	AI_Output(self, hero, "Info_Mil_7_FOODGOOD_07_02"); //Ähh... warum, was ist damit!
	AI_Output(hero, self, "Info_Mil_7_FOODGOOD_15_03"); //(konspirativ) Was meinst du wohl WAS für ein Fleisch in diesem Eintopf ist?
	AI_Output(self, hero, "Info_Mil_7_FOODGOOD_07_04"); //(irritiert) Ich habe nie danach gefragt?
	AI_Output(hero, self, "Info_Mil_7_FOODGOOD_15_05"); //(konspirativ) HAST Du dich jemals gefragt, warum im Aussätzigenlager zwar immer neue Leute ankommen, ab es dort trotzdem nicht voller wird?
	AI_Output(self, hero, "Info_Mil_7_FOODGOOD_07_06"); //Du meinst doch nicht etwa....
	AI_Output(hero, self, "Info_Mil_7_FOODGOOD_15_07"); //(unschuldig) Ich habe nichts gesagt! Aber bei Snaf, kann dir sowas nicht passieren!
	AI_Output(self, hero, "Info_Mil_7_FOODGOOD_07_08"); //Was für eine Sauerei! Hätte ich Halvor nicht zugetraut. Bei ihm esse ich jedenfalls nicht mehr!

	self.aivar[AIV_DEALDAY] = B_GetDay();

	Snaf_MilitiaFrightened = Snaf_MilitiaFrightened + 1;
	if ((Snaf_MilitiaBribed + Snaf_MilitiaFrightened) >= SNAF_NEW_CUSTOMERS)
	{
		B_Snaf_NewCustomers();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info JOIN
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_7_JOIN(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_7_JOIN_Condition;
	information		= Infos_Mil_7_JOIN_Info;
	permanent		= TRUE;
	description		= "Könnt ihr noch einen Mann gebrauchen?";
};

func int Infos_Mil_7_JOIN_Condition()
{
	return TRUE;
};

func void Infos_Mil_7_JOIN_Info()
{
	AI_Output(other, self, "Infos_Mil_4_JOIN_Info_15_01"); //Könnt ihr noch einen Mann gebrauchen?
	AI_Output(self, other, "Infos_Mil_4_JOIN_Info_07_02"); //Du willst zur Miliz? Das kannst du direkt vergessen! Wir nehmen nur fähige Kämpfer auf.
};

///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_7_STORY(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_7_STORY_Condition;
	information		= Infos_Mil_7_STORY_Info;
	permanent		= TRUE;
	description		= "Erzähl mir was über die Orks";
};

func int Infos_Mil_7_STORY_Condition()
{
	return TRUE;
};

func void Infos_Mil_7_STORY_Info()
{
	AI_Output(other, self, "Infos_Mil_7_STORY_ORK_Info_15_01"); //Erzähl mir was über die Orks.
	AI_Output(self, other, "Infos_Mil_7_STORY_ORK_Info_07_02"); //Die Orks haben alle Armeen des Königs aufgrieben. Sie haben alles niedergewalzt was ihnen im Weg stand.
	AI_Output(self, other, "Infos_Mil_7_STORY_ORK_Info_07_03"); //Jetzt lassen sie uns noch ein wenig zappeln und dann sind auch wir dran!
};

///////////////////////////////////////////////////////////////////////
//	Info BOSS
///////////////////////////////////////////////////////////////////////
instance Infos_Mil_7_BOSS(C_Info)
{
	nr				= 0;
	condition		= Infos_Mil_7_BOSS_Condition;
	information		= Infos_Mil_7_BOSS_Info;
	permanent		= TRUE;
	description		= "Wer hat bei euch das Sagen?";
};

func int Infos_Mil_7_BOSS_Condition()
{
	var C_Npc Berengar; Berengar = Hlp_GetNpc(MIL_103_Berengar);

	var C_Npc Brutus; Brutus = Hlp_GetNpc(MIL_121_Brutus);

	if ((Berengar.aivar[AIV_FINDABLE] == FALSE)
	|| (Brutus.aivar[AIV_FINDABLE] == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Infos_Mil_7_BOSS_Info()
{
	AI_Output(other, self, "Infos_Mil_7_BOSS_Info_15_01"); //Wer hat bei euch  das Sagen?
	AI_Output(self, other, "Infos_Mil_7_BOSS_Info_07_02"); //Berengar, der Hauptmann. Aber mit jemanden wie dir wird er nicht reden. Ihm untersteht Leutnant Brutus.

	var C_Npc Berengar; Berengar = Hlp_GetNpc(MIL_103_Berengar);
	Berengar.aivar[AIV_FINDABLE] = TRUE;

	var C_Npc Brutus; Brutus = Hlp_GetNpc(MIL_121_Brutus);
	Brutus.aivar[AIV_FINDABLE] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Zuweisung der Infos zum NSC
///////////////////////////////////////////////////////////////////////
func void B_AssignAmbientInfos_Mil_7(var C_Npc slf) // Sadist
{
	B_AssignFindNpc_WRK(slf);

	Infos_Mil_7_Exit.npc = Hlp_GetInstanceID(slf);
	Infos_Mil_7_HI.npc = Hlp_GetInstanceID(slf);
	//Infos_Mil_7_JOIN.npc = Hlp_GetInstanceID(slf);
	Infos_Mil_7_STORY.npc = Hlp_GetInstanceID(slf);
	Infos_Mil_7_BOSS.npc = Hlp_GetInstanceID(slf);
	Info_Mil_7_FOODGOOD.npc = Hlp_GetInstanceID(slf);
};
