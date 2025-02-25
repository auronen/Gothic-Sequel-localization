///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_Exit(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 999;
	condition		= Info_Gotmar_Exit_Condition;
	information		= Info_Gotmar_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Info_Gotmar_Exit_Condition()
{
	return TRUE;
};

func void Info_Gotmar_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##						KAPITEL 1
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info GREETINGS
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_GREETINGS(C_Info)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_GREETINGS_Condition;
	information		= Info_Gotmar_GREETINGS_Info;
	important		= TRUE;
};

func int Info_Gotmar_GREETINGS_Condition()
{
	if (((Npc_GetDistToNpc(self, hero) < 300) 						// nur wenn SC näher als 3m
	|| C_NpcIsInvincible(hero))
	&& (Npc_IsInRoutine(self, ZS_Smith_Fire)
	|| Npc_IsInRoutine(self, ZS_Smith_Anvil)
	|| Npc_IsInRoutine(self, ZS_Smith_Cool)
	|| Npc_IsInRoutine(self, ZS_Smith_Sharp)))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_GREETINGS_Info()
{
	AI_Output(self, hero, "Info_Gotmar_GREETINGS_04_01"); //Steh nicht im Weg rum, Mann! Hier wird gearbeitet!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TIRESOME
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_TIRESOME(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_TIRESOME_Condition;
	information		= Info_Gotmar_TIRESOME_Info;
	description		= "Sieht sehr anstrengend aus, deine Arbeit!";
};

func int Info_Gotmar_TIRESOME_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_GREETINGS))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_TIRESOME_Info()
{
	AI_Output(hero, self, "Info_Gotmar_TIRESOME_15_01"); //Sieht anstrengend aus, deine Arbeit!
	AI_Output(self, hero, "Info_Gotmar_TIRESOME_04_02"); //Und es ist ehrliche Arbeit! Das kann nicht jeder hier von seinem Beruf behaupten.
	AI_Output(hero, self, "Info_Gotmar_TIRESOME_15_03"); //Wie meinst du das?
	AI_Output(self, hero, "Info_Gotmar_TIRESOME_04_04"); //Schau dich mal um. Schmarotzer, Bettler, Diebe... Nicht jeder hier verdient sich sein Brot auf ehrliche Weise!
	AI_Output(self, hero, "Info_Gotmar_TIRESOME_04_05"); //Wenn wir Handwerker nicht wären, wäre das Lager noch ein riesiger Schutthaufen!
};

///////////////////////////////////////////////////////////////////////
//	Info DEBRIS
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_DEBRIS(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_DEBRIS_Condition;
	information		= Info_Gotmar_DEBRIS_Info;
	description		= "Das Lager war zerstört?";
};

func int Info_Gotmar_DEBRIS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_TIRESOME))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_DEBRIS_Info()
{
	AI_Output(hero, self, "Info_Gotmar_DEBRIS_15_01"); //Das Lager war zerstört?
	AI_Output(self, hero, "Info_Gotmar_DEBRIS_04_02"); //Ja Mann! Bei der Zerstörung der Barriere ist hier einiges zu Bruch gegangen!
	AI_Output(self, hero, "Info_Gotmar_DEBRIS_04_03"); //Vorher soll es hier anders ausgesehen haben, sagt Diego.

	Info_ClearChoices(Info_Gotmar_DEBRIS);
	Info_AddChoice(Info_Gotmar_DEBRIS, "Kann schon sein!", Info_Gotmar_DEBRIS_MAYBE);
	Info_AddChoice(Info_Gotmar_DEBRIS, "Es sah... ANDERS aus!", Info_Gotmar_DEBRIS_INDEED);
};

func void Info_Gotmar_DEBRIS_MAYBE()
{
	AI_Output(hero, self, "Info_Gotmar_DEBRIS_MAYBE_15_01"); //Kann schon sein!
	AI_Output(self, hero, "Info_Gotmar_DEBRIS_MAYBE_04_02"); //Naja, genau wissen das nur ehemalige Gefangene, wie Diego.

	Info_ClearChoices(Info_Gotmar_DEBRIS);
};

func void Info_Gotmar_DEBRIS_INDEED()
{
	AI_Output(hero, self, "Info_Gotmar_DEBRIS_INDEED_15_01"); //Es sah...
	AI_PlayAni(hero, "T_SEARCH");
	AI_Output(hero, self, "Info_Gotmar_DEBRIS_INDEED_15_02"); //...ANDERS aus!
	AI_Output(self, hero, "Info_Gotmar_DEBRIS_INDEED_04_03"); //Woher willst DU das denn wissen?
	AI_Output(self, hero, "Info_Gotmar_DEBRIS_INDEED_04_04"); //Vor der Zerstörung war dieses Gebiet ein riesiges Gefängnis!
	AI_Output(hero, self, "Info_Gotmar_DEBRIS_INDEED_15_05"); //Ich war einer der Gefangenen und kenne Diego noch aus dieser Zeit!
	AI_Output(self, hero, "Info_Gotmar_DEBRIS_INDEED_04_06"); //(misstrauisch) Was du nicht sagst...

	Info_ClearChoices(Info_Gotmar_DEBRIS);
};

///////////////////////////////////////////////////////////////////////
//	Info SELL
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_SELL(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_SELL_Condition;
	information		= Info_Gotmar_SELL_Info;
	description		= "Verkaufst du Waffen?";
};

func int Info_Gotmar_SELL_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_TIRESOME))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_SELL_Info()
{
	AI_Output(hero, self, "Info_Gotmar_SELL_15_01"); //Verkaufst du Waffen?
	AI_Output(self, hero, "Info_Gotmar_SELL_04_02"); //Nicht an dich. Ich liefere ausschliesslich an die Miliz.
	AI_Output(self, hero, "Info_Gotmar_SELL_04_03"); //Wenn du Waffen haben willst, mußt du lernen sie selbst zu schmieden.
	AI_Output(self, hero, "Info_Gotmar_SELL_04_04"); //Wenn der Preis stimmt, dann kannst du ein paar Dinge von mir haben, die man fürs Schmieden braucht.

	Log_CreateTopic(GE_TraderOC, LOG_NOTE);
	B_LogEntry(GE_TraderOC, GE_TraderOC_6);
};

///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_TRADE(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 10;
	condition		= Info_Gotmar_TRADE_Condition;
	information		= Info_Gotmar_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "Zeig mir deine Waren";
};

func int Info_Gotmar_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_SELL))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_TRADE_Info()
{
	AI_Output(hero, self, "Info_Gotmar_TRADE_15_01"); //Zeig mir deine Waren!
	AI_Output(self, hero, "Info_Gotmar_TRADE_04_02"); //Was soll's denn sein?
};

///////////////////////////////////////////////////////////////////////
//	Info LEARNSMITH
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_LEARNSMITH(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_LEARNSMITH_Condition;
	information		= Info_Gotmar_LEARNSMITH_Info;
	description		= "Zeig mir, wie man Waffen schmiedet.";
};

func int Info_Gotmar_LEARNSMITH_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_SELL))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_LEARNSMITH_Info()
{
	AI_Output(hero, self, "Info_Gotmar_LEARNSMITH_15_01"); //Zeig mir, wie man Waffen schmiedet.
	AI_Output(self, hero, "Info_Gotmar_LEARNSMITH_04_02"); //Mann, ich muß hier auch noch meine Arbeit machen!
	AI_Output(self, hero, "Info_Gotmar_LEARNSMITH_04_03"); //Aber wenn Du mir einen Gefallen tust, werde ich mir die Zeit nehmen!
};

///////////////////////////////////////////////////////////////////////
//	Info DOFAVOR
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_DOFAVOR(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_DOFAVOR_Condition;
	information		= Info_Gotmar_DOFAVOR_Info;
	description		= "Was für ein Gefallen?";
};

func int Info_Gotmar_DOFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_LEARNSMITH))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_DOFAVOR_Info()
{
	AI_Output(hero, self, "Info_Gotmar_DOFAVOR_15_01"); //Was für ein Gefallen?
	AI_Output(self, hero, "Info_Gotmar_DOFAVOR_04_02"); //Ich muß noch einige Waffen schmieden, aber mein Erz ist knapp geworden.
	AI_Output(self, hero, "Info_Gotmar_DOFAVOR_04_03"); //Wenn du mir 40 Brocken Erz besorgst, zeige ich dir wie man Waffen schmiedet.

	Log_CreateTopic(CH1_LearnSmith, LOG_MISSION);
	Log_SetTopicStatus(CH1_LearnSmith, LOG_RUNNING);
	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_2);
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREORE
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_WHEREORE(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_WHEREORE_Condition;
	information		= Info_Gotmar_WHEREORE_Info;
	description		= "Woher bekomme ich Erz?";
};

func int Info_Gotmar_WHEREORE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_DOFAVOR)
	|| Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_WHEREORE_Info()
{
	AI_Output(hero, self, "Info_Gotmar_WHEREORE_15_01"); //Woher bekomme ich Erz?
	AI_Output(self, hero, "Info_Gotmar_WHEREORE_04_02"); //Du kannst das Erz zurückholen, das mir abhanden gekommen ist.
	AI_Output(hero, self, "Info_Gotmar_WHEREORE_15_03"); //Wie meinst du das?
	AI_Output(self, hero, "Info_Gotmar_WHEREORE_04_04"); //Habe ich schon erwähnt, dass wir von Dieben und Schmarotzer umgeben sind? Wahrscheinlich hat dieser Gauner Edo sich an meinem Erz bedient.
	AI_Output(hero, self, "Info_Gotmar_WHEREORE_15_05"); //Wo finde ich diesen Edo?
	AI_Output(self, hero, "Info_Gotmar_WHEREORE_04_06"); //Er hängt meistens am Marktplatz herum.

	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_3);
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREORE2
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_WHEREORE2(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_WHEREORE2_Condition;
	information		= Info_Gotmar_WHEREORE2_Info;
	description		= "Wie kann ich sonst noch an Erz kommen?";
};

func int Info_Gotmar_WHEREORE2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_WHEREORE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_WHEREORE2_Info()
{
	AI_Output(hero, self, "Info_Gotmar_WHEREORE2_15_01"); //Wie kann ich sonst noch an Erz kommen?
	AI_Output(self, hero, "Info_Gotmar_WHEREORE2_04_02"); //Normalerweise in der Mine.
	AI_Output(hero, self, "Info_Gotmar_WHEREORE2_15_03"); //Mine? Welche Mine?
	AI_Output(self, hero, "Info_Gotmar_WHEREORE2_04_04"); //Diego sagt, dass diese Mine zur Zeit der magischen Barriere verlassen und gesperrt war.
	AI_Output(self, hero, "Info_Gotmar_WHEREORE2_04_05"); //Dort wurden neue Erzadern gefunden. Aber seit ein paar Tagen treiben sich Orks dort herum und die Bergleute haben sich in der Mine verschanzt.
	AI_Output(self, hero, "Info_Gotmar_WHEREORE2_04_06"); //Die werden zur Zeit niemand in die Mine lassen!
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREORE3
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_WHEREORE3(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_WHEREORE3_Condition;
	information		= Info_Gotmar_WHEREORE3_Info;
	description		= "Gibt's sonst keine Möglichkeit an Erz zu kommen?";
};

func int Info_Gotmar_WHEREORE3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_WHEREORE2))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_WHEREORE3_Info()
{
	AI_Output(hero, self, "Info_Gotmar_WHEREORE3_15_01"); //Gibt's sonst keine Möglichkeit an Erz zu kommen?
	AI_Output(self, hero, "Info_Gotmar_WHEREORE3_04_02"); //Da wäre noch eine....
	AI_Output(hero, self, "Info_Gotmar_WHEREORE3_15_03"); //WELCHE??
	AI_Output(self, hero, "Info_Gotmar_WHEREORE3_04_04"); //Kleinere Erzadern findet man auch in manchen Höhlen. In der Nähe des Haupttores gibt es eine.
	AI_Output(self, hero, "Info_Gotmar_WHEREORE3_04_05"); //Es ist leider ne Molerat-Höhle, sonst hätte ich mir das Erz schon selbst geholt.
	AI_Output(self, hero, "Info_Gotmar_WHEREORE3_04_06"); //Aber vielleicht kannst du die Viecher ja vertreiben.

	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_4);
};

///////////////////////////////////////////////////////////////////////
//	Info PICK
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_PICK(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_PICK_Condition;
	information		= Info_Gotmar_PICK_Info;
	description		= "Ich werde mir diese Höhle mal anschauen!";
};

func int Info_Gotmar_PICK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_WHEREORE3))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_PICK_Info()
{
	AI_Output(hero, self, "Info_Gotmar_PICK_15_01"); //Ich werde mir die Höhle mal anschauen!
	AI_Output(self, hero, "Info_Gotmar_PICK_04_02"); //Mann, das ist gut! Vergiss nicht, eine Spitzhacke mitzunehmen.
};

///////////////////////////////////////////////////////////////////////
//	Info PICK2
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_PICK2(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_PICK2_Condition;
	information		= Info_Gotmar_PICK2_Info;
	description		= "Kannst du mir ne Spitzhacke geben?";
};

func int Info_Gotmar_PICK2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_PICK))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_PICK2_Info()
{
	AI_Output(hero, self, "Info_Gotmar_PICK2_15_01"); //Kannst du mir ne Spitzhacke geben?
	AI_Output(self, hero, "Info_Gotmar_PICK2_04_02"); //Ich bin Schmied und kein Erzschürfer.
	AI_Output(self, hero, "Info_Gotmar_PICK2_04_03"); //Frag die Schürfer am Arenaplatz.
	AI_Output(self, hero, "Info_Gotmar_PICK2_04_04"); //Ich könnte mir vorstellen, daß Sylvester seine Hacke verkauft.

	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_5);
};

///////////////////////////////////////////////////////////////////////
//	Info TOFEWORE
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_TOOFEWORE(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_TOOFEWORE_Condition;
	information		= Info_Gotmar_TOOFEWORE_Info;
	permanent		= TRUE;
	description		= "Ich habe hier etwas Erz.";
};

func int Info_Gotmar_TOOFEWORE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_DOFAVOR)
	&& !Npc_KnowsInfo(hero, Info_Gotmar_ENOUGHORE)
	&& (Npc_HasItems(hero, ItMi_OreNugget) >= 1)
	&& (Npc_HasItems(hero, ItMi_OreNugget) < GOTMAR_FAVOR_ORE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_TOOFEWORE_Info()
{
	AI_Output(hero, self, "Info_Gotmar_TOOFEWORE_15_01"); //Ich habe hier etwas Erz.
	AI_Output(self, hero, "Info_Gotmar_TOOFEWORE_04_02"); //Das ist zu wenig, Mann! Komm wieder wenn du 40 Brocken hast!
};

///////////////////////////////////////////////////////////////////////
//	Info ENOUGHORE
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_ENOUGHORE(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_ENOUGHORE_Condition;
	information		= Info_Gotmar_ENOUGHORE_Info;
	description		= "Ich habe deine 40 Brocken Erz, hier nimm!";
};

func int Info_Gotmar_ENOUGHORE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_DOFAVOR)
	&& (Npc_HasItems(hero, ItMi_OreNugget) >= GOTMAR_FAVOR_ORE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_ENOUGHORE_Info()
{
	AI_Output(hero, self, "Info_Gotmar_ENOUGHORE_15_01"); //Ich habe deine 40 Brocken Erz, hier nimm!
	B_GiveInvItems(hero, self, ItMi_OreNugget, GOTMAR_FAVOR_ORE);
	AI_Output(self, hero, "Info_Gotmar_ENOUGHORE_04_02"); //Verdammt gut, Mann!
	AI_Output(self, hero, "Info_Gotmar_ENOUGHORE_04_03"); //Du hast mir einiges an Arbeit erspart.

	B_GiveXP(XP_BroughtFirstOre);
};

///////////////////////////////////////////////////////////////////////
//	Info EDO
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_EDO(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 30;
	condition		= Info_Gotmar_EDO_Condition;
	information		= Info_Gotmar_EDO_Info;
	description		= "Edo sagt, du sollst vorsichtiger mit deinen Äußerungen sein.";
};

func int Info_Gotmar_EDO_Condition()
{
	if (Gotmar_SCBetrayed)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_EDO_Info()
{
	AI_Output(hero, self, "Info_Gotmar_EDO_15_01"); //Edo sagt, du sollst vorsichtiger mit deinen Äußerungen sein.
	AI_Output(self, hero, "Info_Gotmar_EDO_04_02"); //Du Trottel hast ihm gesagt, daß ich ihn für einen Dieb halte?!
	AI_Output(self, hero, "Info_Gotmar_EDO_04_03"); //Kannst wohl garnichts für dich behalten, was? Wir sind geschiedene Leute, Mann!

	Gotmar_OldAttitude = Npc_GetPermAttitude(self, hero);
	B_SetAttitude(self, ATT_ANGRY);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BETRAYED
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_BETRAYED(C_Info)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_BETRAYED_Condition;
	information		= Info_Gotmar_BETRAYED_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int Info_Gotmar_BETRAYED_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_EDO)
	&& Gotmar_SCBetrayed
	&& C_NpcIsInvincible(hero))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_BETRAYED_Info()
{
	AI_Output(self, hero, "Info_Gotmar_BETRAYED_04_01"); //Ich will nichts mehr mit dir zu tun haben!

	Info_AddChoice(Info_Gotmar_BETRAYED, "Dann eben nicht!", Info_Gotmar_BETRAYED_NO);
	if (Npc_HasItems(hero, ItMi_Silver) >= 50)
	{
		Info_AddChoice(Info_Gotmar_BETRAYED, "Hey, das mit Edo war wirklich keine Absicht (50 Silber anbieten)", Info_Gotmar_BETRAYED_SORRY);
	};
};

func void Info_Gotmar_BETRAYED_SORRY()
{
	Info_ClearChoices(Info_Gotmar_BETRAYED);
	AI_Output(hero, self, "Info_Gotmar_BETRAYED_SORRY_15_01"); //Hey, das mit Edo war wirklich keine Absicht
	B_GiveInvItems(hero, self, ItMi_Silver, 50);
	AI_Output(self, hero, "Info_Gotmar_BETRAYED_SORRY_04_02"); //Mann, pass in Zukunft besser auf, was du anderen Leuten über mich erzählst!
	Gotmar_SCBetrayed = FALSE;
	B_SetAttitude(self, Gotmar_OldAttitude);
	AI_StopProcessInfos(self);
};

func void Info_Gotmar_BETRAYED_NO()
{
	Info_ClearChoices(Info_Gotmar_BETRAYED);
	AI_Output(hero, self, "Info_Gotmar_BETRAYED_NO_15_01"); //Dann eben nicht!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHBELLOW
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_TEACHBELLOW(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_TEACHBELLOW_Condition;
	information		= Info_Gotmar_TEACHBELLOW_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LearnSmith_1, LPCOST_TALENT_SMITH_1, 0);
};

func int Info_Gotmar_TEACHBELLOW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_ENOUGHORE)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) < 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_TEACHBELLOW_Info()
{
	if (B_GiveSkill(hero, NPC_TALENT_SMITH, 1, LPCOST_TALENT_SMITH_1))
	{
		AI_Output(self, hero, "Info_Gotmar_TEACHBELLOW_04_01"); //Also gut, ich werde dir zeigen wie man schmiedet.
		AI_Output(self, hero, "Info_Gotmar_TEACHBELLOW_04_02"); //Aber zuerst brauchst du einige Werkzeuge. Eine Zange und einen Schmiedehammer.
		AI_Output(hero, self, "Info_Gotmar_TEACHBELLOW_15_03"); //Wo bekomme ich die her?
		AI_Output(self, hero, "Info_Gotmar_TEACHBELLOW_04_04"); //Ich kann die Werkzeuge verkaufen, aber das ist nicht billig.

		Gotmar_TeachSmith = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HAMMER
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_HAMMER(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_HAMMER_Condition;
	information		= Info_Gotmar_HAMMER_Info;
	description		= "Kannst du mir die Werkzeuge nicht ausleihen?";
};

func int Info_Gotmar_HAMMER_Condition()
{
	if (Gotmar_TeachSmith
	&& (!Npc_HasItems(hero, ItMi_Pliers) || !Npc_HasItems(hero, ItMw_Sledgehammer)))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_HAMMER_Info()
{
	AI_Output(hero, self, "Info_Gotmar_HAMMER_15_01"); //Kannst du mir die Werkzeuge nicht ausleihen?
	AI_Output(self, hero, "Info_Gotmar_HAMMER_04_02"); //Mann, du bist gut. In einem Lager voller Diebe und Betrüger verleihe ich mit Sicherheit nichts.
	AI_Output(self, hero, "Info_Gotmar_HAMMER_04_03"); //Probier es doch mal bei Bartok in der Burgschmiede.
	AI_Output(self, hero, "Info_Gotmar_HAMMER_04_04"); //Er ist der zweite Schmied hier im Lager... oder besser gesagt, er WAR der zweite Schmied.
};

///////////////////////////////////////////////////////////////////////
//	Info OTHERSMITH
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_OTHERSMITH(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_OTHERSMITH_Condition;
	information		= Info_Gotmar_OTHERSMITH_Info;
	description		= "Was ist mit ihm passiert?";
};

func int Info_Gotmar_OTHERSMITH_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_HAMMER))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_OTHERSMITH_Info()
{
	Gotmar_TeachSmith = TRUE;

	AI_Output(hero, self, "Info_Gotmar_OTHERSMITH_15_01"); //Was ist mit ihm passiert?
	AI_Output(self, hero, "Info_Gotmar_OTHERSMITH_04_02"); //Die Krankheit hat ihn erwischt. Jetzt ist er bei den Heilern im Viertel der Kranken.
	AI_Output(self, hero, "Info_Gotmar_OTHERSMITH_04_03"); //Ich kann mir nicht vorstellen, daß er seine Werkzeuge dorthin mitgenommen hat.

	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_6);
};

///////////////////////////////////////////////////////////////////////
//	Info PLAGUE
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_PLAGUE(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_PLAGUE_Condition;
	information		= Info_Gotmar_PLAGUE_Info;
	description		= "Was ist das für eine Krankheit?";
};

func int Info_Gotmar_PLAGUE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_OTHERSMITH))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_PLAGUE_Info()
{
	AI_Output(hero, self, "Info_Gotmar_PLAGUE_15_01"); //Was ist das für eine Krankheit?
	AI_Output(self, hero, "Info_Gotmar_PLAGUE_04_02"); //Die armen Kerle magern total ab und reden wirres Zeug.
	AI_Output(self, hero, "Info_Gotmar_PLAGUE_04_03"); //Zwischen dem Arbeiterviertel hier und dem Händlerviertel, sind ein paar Hütten für sie aufgestellt worden.
	AI_Output(self, hero, "Info_Gotmar_PLAGUE_04_04"); //Dort gibt es ein paar Heiler, die die Krankheit erforschen.
	AI_Output(self, hero, "Info_Gotmar_PLAGUE_04_05"); //Aber halte dich besser fern von ihnen. Ein vernünftiger Mann hat dort nichts zu schaffen!
};

///////////////////////////////////////////////////////////////////////
//	Info AFTERBELLOW
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_AFTERBELLOW(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_AFTERBELLOW_Condition;
	information		= Info_Gotmar_AFTERBELLOW_Info;
	description		= "Ich habe nun die Schmiedewerkzeuge. Wie geht es weiter?";
};

func int Info_Gotmar_AFTERBELLOW_Condition()
{
	if (Gotmar_TeachSmith
	&& Npc_HasItems(hero, ItMi_Pliers)
	&& Npc_HasItems(hero, ItMw_Sledgehammer))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_AFTERBELLOW_Info()
{
	AI_Output(hero, self, "Info_Gotmar_AFTERBELLOW_15_01"); //Ich habe nun die Schmiedewerkzeuge. Wie geht es weiter?
	AI_Output(self, hero, "Info_Gotmar_AFTERBELLOW_04_02"); //Geh rüber zum Schmelzofen. Halte dort genügend Erzbrocken mit der Zange hinein.
	AI_Output(self, hero, "Info_Gotmar_AFTERBELLOW_04_03"); //So stellst du Roheisen her, den du dann weiterverarbeiten kannst.

	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_7);
};

///////////////////////////////////////////////////////////////////////
//	Info RAWIRON
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_RAWIRON(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_RAWIRON_Condition;
	information		= Info_Gotmar_RAWIRON_Info;
	description		= "Ich habe das Roheisen!";
};

func int Info_Gotmar_RAWIRON_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW)
	&& Npc_HasItems(hero, ItMi_RawIron))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_RAWIRON_Info()
{
	Gotmar_TeachSmith = TRUE;

	AI_Output(hero, self, "Info_Gotmar_RAWIRON_15_01"); //Ich habe das Roheisen!
	AI_Output(self, hero, "Info_Gotmar_RAWIRON_04_02"); //Zeig mal her.

	AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_RawIron);
	AI_PlayAni(self, "T_1HSINSPECT");
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");

	AI_Output(self, hero, "Info_Gotmar_RAWIRON_04_03"); //Sehr gut! Damit können wir weitermachen!
	AI_Output(self, hero, "Info_Gotmar_RAWIRON_04_04"); //Wenn du später zweihändige Waffen schmiedest, musst du mehr Erz verwenden und ein langes Roheisen herstellen.
	AI_Output(self, hero, "Info_Gotmar_RAWIRON_04_05"); //Aber nun zurück zu deinem Roheisen.

	B_GiveXP(XP_FirstRawIron);
};

///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_FIRE(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_FIRE_Condition;
	information		= Info_Gotmar_FIRE_Info;
	description		= "Was mache ich jetzt mit dem Roheisen?";
};

func int Info_Gotmar_FIRE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_RAWIRON))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_FIRE_Info()
{
	Gotmar_TeachSmith = TRUE;

	AI_Output(hero, self, "Info_Gotmar_FIRE_15_01"); //Was mache ich jetzt mit dem Roheisen?
	AI_Output(self, hero, "Info_Gotmar_FIRE_04_02"); //Bevor du das Eisen schmieden kannst, muss es zum Glühen gebracht werden.
	AI_Output(self, hero, "Info_Gotmar_FIRE_04_03"); //Geh rüber zum Schmiedefeuer und fache es mit dem Blasebalg an.
	AI_Output(self, hero, "Info_Gotmar_FIRE_04_04"); //Dann kannst du das Roheisen zum Glühen bringen.

	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_8);

	TA_BeginOverlay(self);
	TA_Stay(00, 00, 00, 30, GOTMAR_WP_WAIT);
	TA_EndOverlay(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOTIRON
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_HOTIRON(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_HOTIRON_Condition;
	information		= Info_Gotmar_HOTIRON_Info;
	description		= "Ich habe das Roheisen erhitzt, was jetzt?";
};

func int Info_Gotmar_HOTIRON_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW)
	&& !Npc_KnowsInfo(hero, Info_Gotmar_SWORDBLADE)
	&& !Npc_KnowsInfo(hero, Info_Gotmar_SHARP)
	&& !Npc_KnowsInfo(hero, Info_Gotmar_SHORTSWORD)
	&& Npc_HasItems(hero, ItMi_HotIron))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_HOTIRON_Info()
{
	Gotmar_TeachSmith = TRUE;

	AI_Output(hero, self, "Info_Gotmar_HOTIRON_15_01"); //Ich habe das Roheisen erhitzt, was jetzt?
	AI_Output(self, hero, "Info_Gotmar_HOTIRON_04_02"); //Sehr gut, nun kommt der schwierige Teil.
	AI_Output(self, hero, "Info_Gotmar_HOTIRON_04_03"); //Lege das glühende Roheisen auf den Amboss da drüben, besorg dir einen Schmiedehammer und hämmere es zu einer flachen, zweischneidigen Klinge.

	B_GiveXP(XP_FirstHotRawIron);
	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_9);

	TA_BeginOverlay(self);
	TA_Stay(00, 00, 00, 30, GOTMAR_WP_WAIT);
	TA_EndOverlay(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SWORDBLADE
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_SWORDBLADE(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_SWORDBLADE_Condition;
	information		= Info_Gotmar_SWORDBLADE_Info;
	description		= "Ich habe eine Schwertklinge geschmiedet!";
};

func int Info_Gotmar_SWORDBLADE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW)
	&& !Npc_KnowsInfo(hero, Info_Gotmar_SHARP)
	&& !Npc_KnowsInfo(hero, Info_Gotmar_SHORTSWORD)
	&& Npc_HasItems(hero, ItMi_HotSwordblade))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_SWORDBLADE_Info()
{
	AI_Output(hero, self, "Info_Gotmar_SWORDBLADE_15_01"); //Ich habe eine Schwertklinge geschmiedet!
	AI_Output(self, hero, "Info_Gotmar_SWORDBLADE_04_02"); //Ahhhh...
	AI_Output(self, hero, "Info_Gotmar_SWORDBLADE_04_03"); //Das sieht doch schon fast wie eine richtige Waffe aus.
	AI_Output(self, hero, "Info_Gotmar_SWORDBLADE_04_04"); //Aber das Eisen ist noch zu weich. Du musst es härten.
	AI_Output(self, hero, "Info_Gotmar_SWORDBLADE_04_05"); //Steck die glühende Schwertklinge in den Wassereimer dort drüben.
	AI_Output(self, hero, "Info_Gotmar_SWORDBLADE_04_06"); //Das kühlt die Waffe ab, und gibt ihr die nötige Härte!

	B_GiveXP(XP_FirstHotSwordblade);
	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_10);

	TA_BeginOverlay(self);
	TA_Stay(00, 00, 00, 30, GOTMAR_WP_WAIT);
	TA_EndOverlay(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SHARP
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_SHARP(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_SHARP_Condition;
	information		= Info_Gotmar_SHARP_Info;
	description		= "Ich habe die Schwertklinge abgekühlt!";
};

func int Info_Gotmar_SHARP_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW)
	&& !Npc_KnowsInfo(hero, Info_Gotmar_SHORTSWORD)
	&& Npc_HasItems(hero, ItMi_Swordblade))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_SHARP_Info()
{
	AI_Output(hero, self, "Info_Gotmar_SHARP_15_01"); //Ich habe die Schwertklinge abgekühlt!
	AI_Output(self, hero, "Info_Gotmar_SHARP_04_02"); //Sieht gut aus!
	AI_Output(self, hero, "Info_Gotmar_SHARP_04_03"); //Der letzte Arbeitsschritt findet am Schleifstein statt.
	AI_Output(self, hero, "Info_Gotmar_SHARP_04_04"); //Hier wird die Klinge geschärft. Sei vorsichtig damit, sonst versaust du den ganzen Rohling.

	B_GiveXP(XP_FirstSwordblade);
	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_11);

	TA_BeginOverlay(self);
	TA_Stay(00, 00, 00, 30, GOTMAR_WP_WAIT);
	TA_EndOverlay(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SHORTSWORD
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_SHORTSWORD(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_SHORTSWORD_Condition;
	information		= Info_Gotmar_SHORTSWORD_Info;
	description		= "FERTIG! Hier ist mein erstes Schwert.";
};

func int Info_Gotmar_SHORTSWORD_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW)
	&& Npc_HasItems(hero, ItMw_Shortsword))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_SHORTSWORD_Info()
{
	AI_Output(hero, self, "Info_Gotmar_SHORTSWORD_15_01"); //FERTIG! Hier ist mein erstes Schwert.
	AI_Output(self, hero, "Info_Gotmar_SHORTSWORD_04_02"); //Laß mich mal sehen...

	AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMw_Shortsword);
	AI_PlayAni(self, "T_1HSINSPECT");
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");

	AI_Output(self, hero, "Info_Gotmar_SHORTSWORD_04_03"); //Ganz passabel!
	//---- XP-Ausgleich falls der Spieler sich keine Einzelanweisungen geholt hat!
	var int xp;
	if (!Npc_KnowsInfo(hero, Info_Gotmar_RAWIRON)) { xp = xp + XP_FirstRawIron; };
	if (!Npc_KnowsInfo(hero, Info_Gotmar_HOTIRON)) { xp = xp + XP_FirstHotRawIron; };
	if (!Npc_KnowsInfo(hero, Info_Gotmar_SWORDBLADE)) { xp = xp + XP_FirstHotSwordblade; };
	if (!Npc_KnowsInfo(hero, Info_Gotmar_SHARP)) { xp = xp + XP_FirstSwordblade; };
	B_GiveXP(xp + XP_FirstShortsword);
	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_12);

	AI_Output(self, hero, "Info_Gotmar_SHORTSWORD_04_04"); //Nun weisst du, wie man Kurzschwerter herstellt.
	AI_Output(self, hero, "Info_Gotmar_SHORTSWORD_04_05"); //Man kann aus einem Waffenrohling natürlich auch andere Schwerter, Äxte oder Stumpfwaffen herstellen.
	AI_Output(self, hero, "Info_Gotmar_SHORTSWORD_04_06"); //Das Prinzip bleibt immer das gleiche.

	Gotmar_LearnDay = B_GetDay();
};

///////////////////////////////////////////////////////////////////////
//	Info WANTLONGSWORD
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_WANTLONGSWORD(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_WANTLONGSWORD_Condition;
	information		= Info_Gotmar_WANTLONGSWORD_Info;
	permanent		= TRUE;
	description		= "Wie schmiedet man andere Waffen?";
};

func int Info_Gotmar_WANTLONGSWORD_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_SHORTSWORD)
	&& !Gotmar_LearnLongsword)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_WANTLONGSWORD_Info()
{
	AI_Output(hero, self, "Info_Gotmar_WANTLONGSWORD_15_01"); //Wie schmiedet man andere Waffen?

	if (B_GetDay() < (Gotmar_LearnDay + GOTMAR_WAIT_LONGSWORD))
	{
		AI_Output(self, hero, "Info_Gotmar_WANTLONGSWORD_04_02"); //Ich habe heute noch viel zu tun. Komm an einem anderen Tag nochmal vorbei!
		if (!Gotmar_AskedForLongsword)
		{
			B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_13);
			Gotmar_AskedForLongsword = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, hero, "Info_Gotmar_WANTLONGSWORD_04_03"); //Heute sieht es gut aus. Aber wenn du wissen willst, wie man ein Langschwert schmiedet, musst du mir erst bei meiner Arbeit helfen.
		AI_Output(self, hero, "Info_Gotmar_WANTLONGSWORD_04_04"); //Mein Gehilfe ist mir vor einiger Zeit weggelaufen.

		Gotmar_LearnLongsword = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WORKFORLONGSWORD
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_WORKFORLONGSWORD(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_WORKFORLONGSWORD_Condition;
	information		= Info_Gotmar_WORKFORLONGSWORD_Info;
	description		= "Wie kann ich dir helfen?";
};

func int Info_Gotmar_WORKFORLONGSWORD_Condition()
{
	if (Gotmar_LearnLongsword
	&& !Knows_Longsword)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_WORKFORLONGSWORD_Info()
{
	AI_Output(hero, self, "Info_Gotmar_WORKFORLONGSWORD_15_01"); //Wie kann ich dir helfen?
	AI_Output(self, hero, "Info_Gotmar_WORKFORLONGSWORD_04_02"); //Hier hast du etwas Erz! Mein Bestand an Kurzschwertern ist sehr klein geworden.
	B_GiveInvItems(self, hero, ItMi_OreNugget, GOTMAR_ORE_LONGSWORD);
	AI_Output(self, hero, "Info_Gotmar_WORKFORLONGSWORD_04_03"); //Mach mir fünf dieser Waffen, dann zeige ich dir, wie man ein Langschwert herstellt.
	AI_Output(self, hero, "Info_Gotmar_WORKFORLONGSWORD_04_04"); //Ach nochwas!
	AI_Output(hero, self, "Info_Gotmar_WORKFORLONGSWORD_15_05"); //Was?
	AI_Output(self, hero, "Info_Gotmar_WORKFORLONGSWORD_04_06"); //Das Erz wird nicht ganz reichen. Den Rest musst zu irgendwo auftreiben.

	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_14);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SMITHHELPER
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_SMITHHELPER(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= WRK_200_Gotmar_SMITHHELPER_Condition;
	information		= WRK_200_Gotmar_SMITHHELPER_Info;
	description		= "Du hattest einen Gehilfen?";
};

func int WRK_200_Gotmar_SMITHHELPER_Condition()
{
	if (Gotmar_LearnLongsword)
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_200_Gotmar_SMITHHELPER_Info()
{
	AI_Output(hero, self, "WRK_200_SMITHHELPER_15_01"); //Du hattest einen Gehilfen?
	AI_Output(self, hero, "WRK_200_SMITHHELPER_04_02"); //Ja, eigentlich ein ordentlicher Kerl, mit dem Herz auf dem rechten Fleck.
	AI_Output(self, hero, "WRK_200_SMITHHELPER_04_03"); //Er will nicht bis zum Ende seines Lebens den Blasebalg treten, hat er mir gesagt.
	AI_Output(self, hero, "WRK_200_SMITHHELPER_04_04"); //Wollte lieber Gladiator werden und in der Arena kämpfen. Nutzlose Zeitverschwendung!
	AI_Output(self, hero, "WRK_200_SMITHHELPER_04_05"); //Wirklich schade, er war eine grosse Hilfe für mich!
};

///////////////////////////////////////////////////////////////////////
//	Info READYLONGSWORD
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_READYLONGSWORD(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_READYLONGSWORD_Condition;
	information		= Info_Gotmar_READYLONGSWORD_Info;
	description		= "Ich habe die fünf Kurzschwerter fertig!";
};

func int Info_Gotmar_READYLONGSWORD_Condition()
{
	if (Gotmar_LearnLongsword
	&& (Npc_HasItems(hero, ItMw_Shortsword) >= 5))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_READYLONGSWORD_Info()
{
	AI_Output(hero, self, "Info_Gotmar_READYLONGSWORD_15_01"); //Ich habe die fünf Kurzschwerter fertig!
	B_GiveInvItems(hero, self, ItMw_Shortsword, 5);
	AI_Output(self, hero, "Info_Gotmar_READYLONGSWORD_04_02"); //Gut, zeig mir mal eines...

	AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMw_Shortsword);
	AI_PlayAni(self, "T_1HSINSPECT");
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");

	AI_Output(self, hero, "Info_Gotmar_READYLONGSWORD_04_03"); //Das ist passable Arbeit. Keine Meisterstück, aber wie gesagt: passabel!

	B_GiveXP(XP_MadeShortswords);
};

///////////////////////////////////////////////////////////////////////
//	Info LONGSWORD
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_LONGSWORD(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_LONGSWORD_Condition;
	information		= Info_Gotmar_LONGSWORD_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_Longsword, LPCOST_KNOWLEDGE_LONGSWORD, 0);
};

func int Info_Gotmar_LONGSWORD_Condition()
{
	if (Gotmar_LearnLongsword
	&& !Knows_Longsword
	&& Npc_KnowsInfo(hero, Info_Gotmar_READYLONGSWORD))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_LONGSWORD_Info()
{
	AI_Output(hero, self, "Info_Gotmar_LONGSWORD_15_01"); //Zeige mir, wie man ein Langschwert herstellt!

	if (hero.LP >= LPCOST_KNOWLEDGE_LONGSWORD)
	{
		AI_Output(self, hero, "Info_Gotmar_LONGSWORD_04_02"); //Die Klinge muß etwa 1 Fuß länger sein, als beim Kurzschwert und etwa 2 fingerbreit schmaler.
		AI_Output(self, hero, "Info_Gotmar_LONGSWORD_04_03"); //Die Klinge muß in der Länge weniger und in der Breite mehr geschliffen werden.
		AI_Output(self, hero, "OUMULTI_Training_04_00");		//Versuch es mal! Übung macht den Meister.
		AI_Output(self, hero, "OUMULTI_BackToWork_04_00");	//Ich muß zurück an die Arbeit.

		B_LearnLongsword();
		hero.lp -= LPCOST_KNOWLEDGE_LONGSWORD;
		Gotmar_LearnDay = B_GetDay();

		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self, hero, "$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WANTBROADSWORD
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_WANTBROADSWORD(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_WANTBROADSWORD_Condition;
	information		= Info_Gotmar_WANTBROADSWORD_Info;
	permanent		= TRUE;
	description		= "Zeig mir, wie man ein besseres Schwert schmiedet!";
};

func int Info_Gotmar_WANTBROADSWORD_Condition()
{
	if (Knows_Longsword)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_WANTBROADSWORD_Info()
{
	AI_Output(hero, self, "Info_Gotmar_WANTBROADSWORD_15_01"); //Zeig mir, wie man ein besseres Schwert schmiedet!

	if (B_GetDay() < (Gotmar_LearnDay + GOTMAR_WAIT_BROADSWORD))
	{
		AI_Output(self, hero, "Info_Gotmar_WANTBROADSWORD_04_02"); //Ich habe heute noch viel zu tun. Komm an einem anderen Tag nochmal vorbei!
		if (!Gotmar_AskedForBroadsword)
		{
			B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_15);
			Gotmar_AskedForBroadsword = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, hero, "Info_Gotmar_WANTBROADSWORD_04_03"); //Heute zeige ich dir wie man ein Breitschwert schmiedet.
		AI_Output(self, hero, "Info_Gotmar_WANTBROADSWORD_04_04"); //Aber dafür musst du mir einen Gefallen tun.
		Info_Gotmar_WANTBROADSWORD.permanent = FALSE;
		Gotmar_LearnBroadsword = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WHATFAVOUR
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_WHATFAVOUR(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 1;
	condition		= WRK_200_Gotmar_WHATFAVOUR_Condition;
	information		= WRK_200_Gotmar_WHATFAVOUR_Info;
	description		= "Welchen Gefallen?";
};

func int WRK_200_Gotmar_WHATFAVOUR_Condition()
{
	if (Gotmar_LearnBroadsword)
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_200_Gotmar_WHATFAVOUR_Info()
{
	AI_Output(hero, self, "WRK_200_WHATFAVOUR_15_01"); //Welchen Gefallen?
	AI_Output(self, hero, "WRK_200_WHATFAVOUR_04_02"); //Ich habe dir doch von meinem Schmiedegehilfen erzählt...
	AI_Output(hero, self, "WRK_200_WHATFAVOUR_15_03"); //...der sich jetzt als Gladiator versucht?
	AI_Output(self, hero, "WRK_200_WHATFAVOUR_04_04"); //Genau, Mann! Goliath ist sein Name.
	AI_Output(self, hero, "WRK_200_WHATFAVOUR_04_05"); //Die Arbeit hier wächst mir über den Kopf. Ich brauche Goliath dringend wieder zurück.
};

///////////////////////////////////////////////////////////////////////
//	Info SMITHHELPER2
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_SMITHHELPER2(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= WRK_200_Gotmar_SMITHHELPER2_Condition;
	information		= WRK_200_Gotmar_SMITHHELPER2_Info;
	description		= "Warum holst du ihn nicht selbst zurück?";
};

func int WRK_200_Gotmar_SMITHHELPER2_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_200_Gotmar_SMITHHELPER)
	&& Npc_KnowsInfo(hero, WRK_200_Gotmar_WHATFAVOUR))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_200_Gotmar_SMITHHELPER2_Info()
{
	AI_Output(hero, self, "WRK_200_SMITHHELPER2_15_01"); //Warum holst du ihn nicht selbst zurück?
	AI_Output(self, hero, "WRK_200_SMITHHELPER2_04_02"); //Hab ich versucht, Mann!
	AI_Output(self, hero, "WRK_200_SMITHHELPER2_04_03"); //Aber er will Ruhm und Anerkennung!
	AI_Output(self, hero, "WRK_200_SMITHHELPER2_04_04"); //Als ob es nicht genug Anerkennung währe im Schweisse seines Angesichtes Stahl zu schmieden.
	AI_Output(self, hero, "WRK_200_SMITHHELPER2_04_05"); //Vielleicht kannst du ihm klarmachen, dass das Leben als Gladiator nicht das richtige für ihn ist.
};

///////////////////////////////////////////////////////////////////////
//	Info IFETCHGOLIATH
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_IFETCHGOLIATH(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= WRK_200_Gotmar_IFETCHGOLIATH_Condition;
	information		= WRK_200_Gotmar_IFETCHGOLIATH_Info;
	description		= "Ich werde mit Goliath sprechen!";
};

func int WRK_200_Gotmar_IFETCHGOLIATH_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_200_Gotmar_SMITHHELPER2))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_200_Gotmar_IFETCHGOLIATH_Info()
{
	AI_Output(hero, self, "WRK_200_IFETCHGOLIATH_15_01"); //Ich werde mit Goliath sprechen!

	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_16);
};

///////////////////////////////////////////////////////////////////////
//	Info GOLIATHSBACK
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_GOLIATHSBACK(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 1;
	condition		= WRK_200_Gotmar_GOLIATHSBACK_Condition;
	information		= WRK_200_Gotmar_GOLIATHSBACK_Info;
	important		= TRUE;
};

func int WRK_200_Gotmar_GOLIATHSBACK_Condition()
{
	if (Gotmar_GoliathReturned)
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_200_Gotmar_GOLIATHSBACK_Info()
{
	AI_Output(self, hero, "WRK_200_GOLIATHSBACK_04_01"); //(freudig-aufgeregt) Goliath arbeitet wieder bei mir!
	AI_Output(self, hero, "WRK_200_GOLIATHSBACK_04_02"); //Ich hab dir viel zu verdanken, Mann!
	AI_Output(self, hero, "WRK_200_GOLIATHSBACK_04_03"); //Wenn du willst, zeige ich dir jetzt, wie man ein Breitschwert schmiedet.

	B_GiveXP(XP_Gotmar_Goliathreturned);
	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_17);
	B_SetAttitude(self, ATT_FRIENDLY);
};

///////////////////////////////////////////////////////////////////////
//	Info BROADSWORD
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_BROADSWORD(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_BROADSWORD_Condition;
	information		= Info_Gotmar_BROADSWORD_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_BROADSWORD, LPCOST_KNOWLEDGE_BROADSWORD, 0);
};

func int Info_Gotmar_BROADSWORD_Condition()
{
	if (Gotmar_LearnBroadsword
	&& !Knows_Broadsword
	&& Npc_KnowsInfo(hero, WRK_200_Gotmar_GOLIATHSBACK))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_BROADSWORD_Info()
{
	AI_Output(hero, self, "Info_Gotmar_BROADSWORD_15_01"); //Zeige mir, wie man ein Breitschwert schmiedet!

	if (hero.LP >= LPCOST_KNOWLEDGE_BROADSWORD)
	{
		AI_Output(self, hero, "Info_Gotmar_BROADSWORD_04_02"); //Breitschwerter verursachen ihren Schaden durch die enorm wuchtige Klinge.
		AI_Output(self, hero, "Info_Gotmar_BROADSWORD_04_03"); //Deshalb darfst du die Klinge weder an Länge, noch an Breite kürzen.
		AI_Output(self, hero, "OUMULTI_Training_04_00");		//Versuch es mal! Übung macht den Meister.
		AI_Output(self, hero, "OUMULTI_BackToWork_04_00");	//Ich muß zurück an die Arbeit.

		B_LearnBroadsword();
		hero.lp -= LPCOST_KNOWLEDGE_BROADSWORD;
		Gotmar_LearnDay = B_GetDay();

		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self, hero, "$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WANTBASTARDSWORD
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_WANTBASTARDSWORD(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_WANTBASTARDSWORD_Condition;
	information		= Info_Gotmar_WANTBASTARDSWORD_Info;
	permanent		= TRUE;
	description		= "Zeig mir, wie man ein noch besseres Schwert schmiedet!";
};

func int Info_Gotmar_WANTBASTARDSWORD_Condition()
{
	if (Knows_Broadsword
	&& !Gotmar_LearnBastardsword)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_WANTBASTARDSWORD_Info()
{
	AI_Output(hero, self, "Info_Gotmar_WANTBASTARDSWORD_15_01"); //Zeig mir, wie man ein noch besseres Schwert schmiedet!

	if (B_GetDay() < (Gotmar_LearnDay + GOTMAR_WAIT_BASTARDSWORD))
	{
		AI_Output(self, hero, "Info_Gotmar_WANTBASTARDSWORD_04_02"); //Ich habe heute noch viel zu tun. Komm an einem anderen Tag nochmal vorbei!

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, hero, "Info_Gotmar_WANTBASTARDSWORD_04_03"); //Heute passt mir gut. Ich zeige dir gerne wie man ein Bastardschwert schmiedet.
		Gotmar_LearnBastardsword = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BASTARDSWORD
///////////////////////////////////////////////////////////////////////
instance Info_Gotmar_BASTARDSWORD(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= Info_Gotmar_BASTARDSWORD_Condition;
	information		= Info_Gotmar_BASTARDSWORD_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_BASTARDSWORD, LPCOST_KNOWLEDGE_BASTARDSWORD, 0);
};

func int Info_Gotmar_BASTARDSWORD_Condition()
{
	if (Gotmar_LearnBastardsword
	&& !Knows_Bastardsword)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Gotmar_BASTARDSWORD_Info()
{
	AI_Output(hero, self, "Info_Gotmar_BASTARDSWORD_15_01"); //Zeige mir, wie man ein Bastardschwert schmiedet!

	if (hero.LP >= LPCOST_KNOWLEDGE_BASTARDSWORD)
	{
		AI_Output(self, hero, "Info_Gotmar_BASTARDSWORD_04_02"); //In Grunde sind es die selben Arbeitsschritte wie beim Kurz- und Langschwert.
		AI_Output(self, hero, "Info_Gotmar_BASTARDSWORD_04_03"); //Allerdings darfst du nun am Schleifstein weder an Länge, noch an Breite kürzen.
		AI_Output(self, hero, "Info_Gotmar_BASTARDSWORD_04_04"); //Bastardschwerter verursachen ihren Schaden durch die enorm wuchtige Klinge.
		AI_Output(self, hero, "Info_Gotmar_BASTARDSWORD_04_05"); //Am besten du versuchst mal eine solche Waffe herzustellen. Übung macht den Meister.
		AI_Output(self, hero, "Info_Gotmar_BASTARDSWORD_04_06"); //So, ich muß wieder zurück an die Arbeit.

		B_LearnBroadsword();
		hero.lp -= LPCOST_KNOWLEDGE_BASTARDSWORD;

		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self, hero, "$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WANTMORE
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_WANTMORE(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= WRK_200_Gotmar_WANTMORE_Condition;
	information		= WRK_200_Gotmar_WANTMORE_Info;
	description		= "Kannst du mir zeigen, wie man noch bessere Waffen schmiedet?";
};

func int WRK_200_Gotmar_WANTMORE_Condition()
{
	if (Knows_Bastardsword)
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_200_Gotmar_WANTMORE_Info()
{
	AI_Output(hero, self, "WRK_200_WANTMORE_15_01"); //Kannst du mir zeigen, wie man noch bessere Waffen schmiedet?
	AI_Output(self, hero, "WRK_200_WANTMORE_04_02"); //Ich hab dir alles beigebracht, was ich weiss.
	AI_Output(self, hero, "WRK_200_WANTMORE_04_03"); //In der Felsenfestung, im Gefolge des Königs, gibt es bestimmt auch einen Waffenschmied.
	AI_Output(self, hero, "WRK_200_WANTMORE_04_04"); //Aber der König hat bisher nichts für unser Lager getan. Ich glaube nicht, daß er etwas für dich tut!

	B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_18);
	Log_SetTopicStatus(CH1_LearnSmith, LOG_SUCCESS);
};

///////////////////////////////////////////////////////////////////////
//	Info ROCKFORTRESS
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_ROCKFORTRESS(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 0;
	condition		= WRK_200_Gotmar_ROCKFORTRESS_Condition;
	information		= WRK_200_Gotmar_ROCKFORTRESS_Info;
	description		= "Wo kann ich diese Felsenfestung finden?";
};

func int WRK_200_Gotmar_ROCKFORTRESS_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_200_Gotmar_WANTMORE))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_200_Gotmar_ROCKFORTRESS_Info()
{
	AI_Output(hero, self, "WRK_200_ROCKFORTRESS_15_01"); //Wo kann ich die Felsenfestung finden?
	AI_Output(self, hero, "WRK_200_ROCKFORTRESS_04_02"); //Keine Ahnung, Mann.
	AI_Output(self, hero, "WRK_200_ROCKFORTRESS_04_03"); //Bin noch nie aus diesem gottverfluchten Lager herausgekommen, seit ich hier bin!
};

///////////////////////////////////////////////////////////////////////
//	Info NEEDBLOODORE
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_NEEDBLOODORE(C_Info)
{
	npc				= WRK_200_Gotmar;
	nr				= 12;
	condition		= WRK_200_Gotmar_NEEDBLOODORE_Condition;
	information		= WRK_200_Gotmar_NEEDBLOODORE_Info;
	description		= "Ich brauche Bluterz";
};

func int WRK_200_Gotmar_NEEDBLOODORE_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_FINDBLOODORE)
	&& (Npc_HasItems(self, ItMi_BloodOreNugget) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_200_Gotmar_NEEDBLOODORE_Info()
{
	AI_Output(hero, self, "WRK_200_NEEDBLOODORE_15_01"); //Ich brauche Bluterz.
	AI_Output(self, hero, "WRK_200_NEEDBLOODORE_04_02"); //Bluterz ist 'ne seltene Sache. Ich selber besitze nur ein paar Brocken. Die kannst du kaufen.
	AI_Output(self, hero, "WRK_200_NEEDBLOODORE_04_03"); //Wenn du mehr brauchst, dann solltest du vielleicht mal mit Wylfern reden. Er war bis vor kurzem noch in der Mine.
	AI_Output(hero, self, "WRK_200_NEEDBLOODORE_15_04"); //Wo finde ich diesen Wylfern?
	AI_Output(self, hero, "WRK_200_NEEDBLOODORE_04_05"); //Er ist ein Rekrut der Miliz und treibt sich normalerweise irgendwo im Innenhof der Burg herum.

	B_LogEntry(CH1_Bloodore, CH1_Bloodore_4);
};
