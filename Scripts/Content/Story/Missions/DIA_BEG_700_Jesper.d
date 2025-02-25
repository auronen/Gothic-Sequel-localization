///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance BEG_700_Jesper_EXIT(C_Info)
{
	npc				= BEG_700_Jesper;
	nr				= 999;
	condition		= BEG_700_Jesper_EXIT_Condition;
	information		= BEG_700_Jesper_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int BEG_700_Jesper_EXIT_Condition()
{
	return TRUE;
};

func void BEG_700_Jesper_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance BEG_700_Jesper_JOB(C_Info)
{
	npc				= BEG_700_Jesper;
	nr				= 1;
	condition		= BEG_700_Jesper_JOB_Condition;
	information		= BEG_700_Jesper_JOB_Info;
	permanent		= TRUE;
	description		= "Was machst du hier?";
};

func int BEG_700_Jesper_JOB_Condition()
{
	return TRUE;
};

func void BEG_700_Jesper_JOB_Info()
{
	AI_Output(hero, self, "BEG_700_JOB_15_01"); //Was machst du hier?
	AI_Output(self, hero, "BEG_700_JOB_02_02"); //Ich bin Jesper. War früher mal Soldat. Jetzt bin ich Bettler.
	AI_Output(hero, self, "BEG_700_JOB_15_03"); //Was ist geschehen?
	AI_Output(self, hero, "BEG_700_JOB_02_04"); //Drei Offiziere haben sich einen hübschen jungen Rekruten vorgenommen. Darauf hin habe ich sie mir vorgenommen.
	AI_Output(self, hero, "BEG_700_JOB_02_05"); //Innerhalb einer Minute waren sie alle tot. Und das war das Ende meiner Karriere. Seitdem hangel ich mich so durch.
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance BEG_700_Jesper_HI(C_Info)
{
	npc				= BEG_700_Jesper;
	nr				= 1;
	condition		= BEG_700_Jesper_HI_Condition;
	information		= BEG_700_Jesper_HI_Info;
	important		= TRUE;
};

func int BEG_700_Jesper_HI_Condition()
{
	return TRUE;
};

func void BEG_700_Jesper_HI_Info()
{
	AI_Output(self, hero, "BEG_700_HI_02_01"); //Hey, ich hab dich hier noch nie gesehen. Bringst du Neuigkeiten mit?

	Info_AddChoice(BEG_700_Jesper_HI, "Der alte Tempel ist eingestürzt", BEG_700_Jesper_HI_TEMPLE);
	Info_AddChoice(BEG_700_Jesper_HI, "Ich hörte das Orks in der Gegend sind.", BEG_700_Jesper_HI_ORK);
	Info_AddChoice(BEG_700_Jesper_HI, "Nein, aber kennst du Neuigkeiten? ", BEG_700_Jesper_HI_NO);
};

func void BEG_700_Jesper_HI_NO()
{
	AI_Output(hero, self, "BEG_700_HI_NO_15_01"); //Nein, aber kennst du Neuigkeiten?
	AI_Output(self, hero, "BEG_700_HI_NO_02_02"); //Ich kriege einiges mit. Wenn du etwas wissen willst, bin ich dein Mann.
	Info_ClearChoices(BEG_700_Jesper_HI);
};

func void BEG_700_Jesper_HI_ORK()
{
	AI_Output(hero, self, "BEG_700_HI_ORK_15_01"); //Ich hörte das Orks in der Gegend sind.
	AI_Output(self, hero, "BEG_700_HI_ORK_02_02"); //Ach was? Tatsächlich? Sag mal hast du die letzten Monate geschlafen?
	AI_Output(hero, self, "BEG_700_HI_ORK_15_03"); //Naja, geschlafen trifft es nicht unbedingt...
	AI_Output(self, hero, "BEG_700_HI_ORK_02_04"); //Junge, wenn du Information suchst, dann bist du bei mir genau richtig.
	Info_ClearChoices(BEG_700_Jesper_HI);
};

func void BEG_700_Jesper_HI_TEMPLE()
{
	AI_Output(hero, self, "BEG_700_HI_TEMPLE_15_01"); //Der alte Tempel ist eingestürzt
	AI_Output(self, hero, "BEG_700_HI_TEMPLE_02_02"); //Tempel? Welcher Tempel?
	AI_Output(hero, self, "BEG_700_HI_TEMPLE_15_03"); //Der alte Ork Tempel in dem der Erzdämon tausend Jahre geschlafen hat.
	AI_Output(self, hero, "BEG_700_HI_TEMPLE_02_04"); //Was... ein Tempel? Dämon... Orks? Damit kann ich nichts anfangen. Aber wenn du Neuigkeiten suchst, bist du bei mir richtig.
	Info_ClearChoices(BEG_700_Jesper_HI);
};

///////////////////////////////////////////////////////////////////////
//	Info NEWS
///////////////////////////////////////////////////////////////////////
instance BEG_700_Jesper_NEWS(C_Info)
{
	npc				= BEG_700_Jesper;
	nr				= 1;
	condition		= BEG_700_Jesper_NEWS_Condition;
	information		= BEG_700_Jesper_NEWS_Info;
	permanent		= TRUE;
	description		= "Hast Du Neuigkeiten?";
};

func int BEG_700_Jesper_NEWS_Condition()
{
	if (Beggars_Secrets < 3)
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_700_Jesper_NEWS_Info()
{
	AI_Output(hero, self, "BEG_700_NEWS_15_01"); //Hast Du Neuigkeiten?
	AI_Output(self, hero, "BEG_700_NEWS_02_02"); //Das Wasser ist nass, die Miliz schläft im Dienst, die Bettler haben kein Silber, alles ist ruhig.
};

///////////////////////////////////////////////////////////////////////
//	Info GIVENEWS
///////////////////////////////////////////////////////////////////////
instance BEG_700_Jesper_GIVENEWS(C_Info)
{
	npc				= BEG_700_Jesper;
	nr				= 1;
	condition		= BEG_700_Jesper_GIVENEWS_Condition;
	information		= BEG_700_Jesper_GIVENEWS_Info;
	permanent		= TRUE;
	description		= "(Neuigkeit erwerben über...)";
};

func int BEG_700_Jesper_GIVENEWS_Condition()
{
	if (Beggars_Secrets >= 3)
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_700_Jesper_GIVENEWS_Info()
{
	Info_AddChoice(BEG_700_Jesper_GIVENEWS, DIALOG_BACK, BEG_700_Jesper_GIVENEWS_BACK);
	Info_AddChoice(BEG_700_Jesper_GIVENEWS, "Herumtreiber (2 Silber)", BEG_700_Jesper_GIVENEWS_LOAFER);
	Info_AddChoice(BEG_700_Jesper_GIVENEWS, "Miliz (2 Silber)", BEG_700_Jesper_GIVENEWS_MILITIA);
	Info_AddChoice(BEG_700_Jesper_GIVENEWS, "Heiler (2 Silber)", BEG_700_Jesper_GIVENEWS_HEALER);
	Info_AddChoice(BEG_700_Jesper_GIVENEWS, "Arbeiter (2 Silber)", BEG_700_Jesper_GIVENEWS_WORKER);
};

func void BEG_700_Jesper_GIVENEWS_WORKER()
{
	if (Npc_HasItems(hero, ItMi_Silver) >= 2)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, 2);
		AI_Output(hero, self, "BEG_700_GIVENEWS_WORKER_15_01"); //Erzähl mir was über die Arbeiter!
		AI_Output(self, hero, "BEG_700_GIVENEWS_WORKER_02_02"); //Einige der Arbeiter sind unzufrieden, weil Bromor ein Sklaventreiber ist.
		AI_Output(self, hero, "BEG_700_GIVENEWS_WORKER_02_03"); //Einer von ihnen, Rassmuson, will sogar abhauen.
		AI_Output(hero, self, "BEG_700_GIVENEWS_WORKER_15_04"); //Na, und?
		AI_Output(self, hero, "BEG_700_GIVENEWS_WORKER_02_05"); //Nun, wenn du das Bromor erzähslt, springt vielleicht was für dich raus.
		AI_Output(self, hero, "BEG_700_GIVENEWS_WORKER_02_06"); //Und wenn du dich auf die Seite von Rassmuson stellst, kannst du vielleicht bei ihm ewas rausschlagen.
		AI_Output(self, hero, "BEG_700_GIVENEWS_WORKER_02_07"); //Wie auch immer, es ist deine Entscheidung...
		Knows_Rassmuson = TRUE;
	}
	else //if !Npc_HasItems (hero,ItMi_Silver) >= 2
	{
		AI_Output(self, hero, "BEG_700_NOMONEY_02_04"); //Besorge dir Silber, dann bekommst du Informationen.
		AI_StopProcessInfos(self);
	};
};

func void BEG_700_Jesper_GIVENEWS_HEALER()
{
	if (Npc_HasItems(hero, ItMi_Silver) >= 2)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, 2);
		AI_Output(hero, self, "BEG_700_GIVENEWS_HEALER_15_01"); //Erzähl mir was über die Heiler!
		AI_Output(self, hero, "BEG_700_GIVENEWS_HEALER_02_02"); //Angeblich gibt es ein Rezept für ein Mittel, das den Kranken für eine Weile einen klaren Verstand verschafft.
		AI_Output(self, hero, "BEG_700_GIVENEWS_HEALER_02_03"); //Aber niemand weiß wo dieses Rezept zu finden ist.
		AI_Output(self, hero, "BEG_700_GIVENEWS_HEALER_02_04"); //Sie werden sich bestimmt erkenntlich zeigen, wenn jemand das Rezept findet...
		Hero_KnowsRecipe = TRUE;
	}
	else //if !Npc_HasItems (hero,ItMi_Silver) >= 2
	{
		AI_Output(self, hero, "BEG_700_NOMONEY_02_04"); //Besorge dir Silber, dann bekommst du Informationen.
		AI_StopProcessInfos(self);
	};
};

func void BEG_700_Jesper_GIVENEWS_MILITIA()
{
	if (Npc_HasItems(hero, ItMi_Silver) >= 2)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, 2);
		AI_Output(hero, self, "BEG_700_GIVENEWS_MILITIA_15_01"); //Erzähl mir was über die Miliz!
		AI_Output(self, hero, "BEG_700_GIVENEWS_MILITIA_02_02"); //Brutus der Leutnant kämpft gerne in der Arena. Zu gerne. Denn damit verspielt er sich seine Chance auf den Rang des Hauptmanns, denn er vernachlässigt seine Pflichten.
	}
	else // if !Npc_HasItems (hero,ItMi_Silver) >= 2
	{
		AI_Output(self, hero, "BEG_700_NOMONEY_02_03"); //Besorge dir Silber, dann bekommst du Informationen.
		AI_StopProcessInfos(self);
	};
};

func void BEG_700_Jesper_GIVENEWS_LOAFER()
{
	if (Npc_HasItems(hero, ItMi_Silver) >= 2)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, 2);
		AI_Output(hero, self, "BEG_700_GIVENEWS_LOAFER_15_01"); //Erzähl mir was über die Herumtreiber!
		AI_Output(self, hero, "BEG_700_GIVENEWS_LOAFER_02_02"); //Ihre Position ist schlecht im Lager. Sie helfen nicht beim Aufbau des Lagers und kümmern sich nicht um die Versorgung.
		AI_Output(self, hero, "BEG_700_GIVENEWS_LOAFER_02_03"); //Vor allem den Arbeitern stinkt das gewaltig. Aber Diego hat klargemacht, das jeder hier im Lager Zuflucht findet und bleiben kann.
		AI_Output(self, hero, "BEG_700_GIVENEWS_LOAFER_02_04"); //Zudem ist jeder Mann bei einem möglichen Orkangriff wichtig.
	}
	else //if !Npc_HasItems (hero,ItMi_Silver) >= 2
	{
		AI_Output(self, hero, "BEG_700_NOMONEY_02_05"); //Besorge dir Silber, dann bekommst du Informationen.
		AI_StopProcessInfos(self);
	};
};

func void BEG_700_Jesper_GIVENEWS_BACK()
{
	Info_ClearChoices(BEG_700_Jesper_GIVENEWS);
};
