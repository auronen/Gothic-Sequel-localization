instance Wrk_201_Gordian_Exit(C_Info)
{
	npc				= Wrk_201_Gordian;
	nr				= 999;
	condition		= Wrk_201_Gordian_Exit_Condition;
	information		= Wrk_201_Gordian_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Wrk_201_Gordian_Exit_Condition()
{
	return TRUE;
};

func void Wrk_201_Gordian_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance Wrk_201_Gordian_HI(C_Info)
{
	npc				= Wrk_201_Gordian;
	condition		= Wrk_201_Gordian_HI_Condition;
	information		= Wrk_201_Gordian_HI_Info;
	important		= TRUE;
};

func int Wrk_201_Gordian_HI_Condition()
{
	return TRUE;
};

func void Wrk_201_Gordian_HI_Info()
{
	AI_Output(self, hero, "Wrk_201_HI_09_01"); //Äh, oh,... was willst du von mir?
};

//-------------------------------------------------------------------------
instance Wrk_201_Gordian_FIRST(C_Info)
{
	npc				= Wrk_201_Gordian;
	nr				= 10;
	condition		= Wrk_201_Gordian_FIRST_Condition;
	information		= Wrk_201_Gordian_FIRST_Info;
	description		= "Wer bist du?";
};

func int Wrk_201_Gordian_FIRST_Condition()
{
	return TRUE;
};

func void Wrk_201_Gordian_FIRST_Info()
{
	AI_Output(other, self, "Wrk_201_Gordian_FIRST_Info_15_01"); //Wer bist du?
	AI_Output(self, other, "Wrk_201_Gordian_FIRST_Info_09_02"); //Mein Name ist Gordian. Schriftgelehrter und Schreiber. Ich erstelle Abschriften.
};

//#####################################################################
//
//
//		Rezeptur für Talamon
//
//
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info POSSESSEDRECIPE
///////////////////////////////////////////////////////////////////////
instance Wrk_201_Gordian_POSSESSEDRECIPE(C_Info)
{
	npc				= Wrk_201_Gordian;
	nr				= 5;
	condition		= Wrk_201_Gordian_POSSESSEDRECIPE_Condition;
	information		= Wrk_201_Gordian_POSSESSEDRECIPE_Info;
	description		= "Ich suche eine Rezeptur für die Heiler";
};

func int Wrk_201_Gordian_POSSESSEDRECIPE_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_RECIPEFORMONEY)
	&& !Npc_KnowsInfo(hero, HLR_501_Talamon_HASRECIPE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_201_Gordian_POSSESSEDRECIPE_Info()
{
	AI_Output(hero, self, "Wrk_201_POSSESSEDRECIPE_15_01");	//Ich suche eine Rezeptur für die Heiler
	AI_Output(self, hero, "Wrk_201_POSSESSEDRECIPE_09_02");	//Talamon hat Dich geschickt, was? Er ist zu ungeduldig!
	AI_Output(self, hero, "Wrk_201_POSSESSEDRECIPE_09_03");	//Ich hab mir schon viele Nächte um die Ohren geschlagen, um Hinweise darüber zu entdecken!
	AI_Output(hero, self, "Wrk_201_POSSESSEDRECIPE_15_04");	//Was hast du herausgefunden?
	AI_Output(self, hero, "Wrk_201_POSSESSEDRECIPE_09_05");	//Für diese Informationen scheinen mir 15 Silber angemessen zu sein. Ich hatte schließlich viel Arbeit!
};

///////////////////////////////////////////////////////////////////////
//	Info PAYFORINFO
///////////////////////////////////////////////////////////////////////
instance Wrk_201_Gordian_PAYFORINFO(C_Info)
{
	npc				= Wrk_201_Gordian;
	nr				= 5;
	condition		= Wrk_201_Gordian_PAYFORINFO_Condition;
	information		= Wrk_201_Gordian_PAYFORINFO_Info;
	permanent		= TRUE;
	description		= "(15 Silber für die Information bezahlen)";
};

func int Wrk_201_Gordian_PAYFORINFO_Condition()
{
	if (Npc_KnowsInfo(hero, Wrk_201_Gordian_POSSESSEDRECIPE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_201_Gordian_PAYFORINFO_Info()
{
	if (Npc_HasItems(hero, ItMi_Silver) >= 15)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, 15);
		AI_Output(hero, self, "Wrk_201_PAYFORINFO_15_01");	//Na gut, erzähl mir was du weisst.
		AI_Output(self, hero, "Wrk_201_PAYFORINFO_09_02");	//Die Feuermagier haben an einer Rezeptur, wie Talamon sie sucht, gearbeitet.
		AI_Output(self, hero, "Wrk_201_PAYFORINFO_09_03");	//Ich habe die gesamte Bibliothek im Magierhaus auf den Kopf gestellt.
		AI_Output(self, hero, "Wrk_201_PAYFORINFO_09_04");	//Aber alle Bücher drehen sich um irgendwelche abstrusen Themen, die ...äusserst... mystisch formuliert sind!
		AI_Output(self, hero, "Wrk_201_PAYFORINFO_09_05");	//Ts ts, Magier halt. Es ist zum Verzweifeln, aber ich werde aus diesen Büchern einfach nicht schlau.
		AI_Output(hero, self, "Wrk_201_PAYFORINFO_15_06");	//(ungläubig) Das ist alles ???
		AI_Output(self, hero, "Wrk_201_PAYFORINFO_09_07");	//Ist vielleicht nicht viel, aber es war harte Arbeit das herauszufinden.

		Wrk_201_Gordian_PAYFORINFO.permanent = FALSE;
		B_LogEntry(CH1_LearnAlchemy, CH1_LearnAlchemy_10);
	}
	else
	{
		B_Say(self, hero, "$NotEnoughSilver");
		AI_StopProcessInfos(self);
	};
};

//#####################################################################
//
//
//		Abschrift von Talamons Alchemiebuch
//
//
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info WriteBook
///////////////////////////////////////////////////////////////////////
instance Wrk_201_Gordian_WRITEBOOK(C_Info)
{
	npc				= Wrk_201_Gordian;
	nr				= 5;
	condition		= Wrk_201_Gordian_WRITEBOOK_Condition;
	information		= Wrk_201_Gordian_WRITEBOOK_Info;
	permanent		= TRUE;
	description		= "Ich brauche eine Abschrift dieses Buches";
};

func int Wrk_201_Gordian_WRITEBOOK_Condition()
{
	if (Npc_KnowsInfo(other, HLR_501_Talamon_LEARNALCHEMY)
	&& !int_BookWritten)
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_201_Gordian_WRITEBOOK_Info()
{
	AI_Output(hero, self, "Wrk_201_WRITEBOOK_15_01"); //Ich brauche eine Abschrift dieses Buches.
	AI_Output(self, hero, "Wrk_201_WRITEBOOK_09_02"); //Kein Problem. Das kostet 15 Silber.
	Info_ClearChoices(Wrk_201_Gordian_WRITEBOOK);
	Info_AddChoice(Wrk_201_Gordian_WRITEBOOK, "(15 Silber geben)", Wrk_201_Gordian_WRITEBOOK_Yes);
	Info_AddChoice(Wrk_201_Gordian_WRITEBOOK, "Ich überleg's mir.", Wrk_201_Gordian_WRITEBOOK_No);
};

func void Wrk_201_Gordian_WRITEBOOK_No()
{
	AI_Output(hero, self, "Wrk_201_WRITEBOOK_No_15_01"); //Ich überleg's mir.
	AI_StopProcessInfos(self);
};

func void Wrk_201_Gordian_WRITEBOOK_Yes()
{
	AI_Output(hero, self, "Wrk_201_WRITEBOOK__15_01"); //Der Preis klingt angemessen.

	if (Npc_HasItems(hero, ItMi_Silver) >= 15)
	{
		if (Npc_HasItems(hero, ItWr_Book_HealingPotions) >= 1)
		{
			AI_Output(self, hero, "Wrk_201_WRITEBOOK__09_02"); //Hier ist deine Abschrift.
			int_BookWritten = TRUE;
			CreateInvItem(self, ItWr_Book_HealingPotions);
			B_GiveInvItems(hero, self, ItMi_Silver, 15);
			B_GiveInvItems(self, hero, ItWr_Book_HealingPotions, 1);
		}
		else
		{
			AI_Output(self, hero, "Wrk_201_WRITEBOOK_09_03"); //Wenn Du kein Buch hast, kann ich auch keine Abschrift anfertigen.
		};
	}
	else
	{
		AI_Output(self, hero, "Wrk_201_WRITEBOOK_09_04"); //Komm wieder, wenn Du genug Geld hast
	};

	AI_StopProcessInfos(self);
};
