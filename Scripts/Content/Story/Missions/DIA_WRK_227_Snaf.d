///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_EXIT(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 999;
	condition		= WRK_227_Snaf_EXIT_Condition;
	information		= WRK_227_Snaf_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int WRK_227_Snaf_EXIT_Condition()
{
	return TRUE;
};

func void WRK_227_Snaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info MEETAGAIN
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_MEETAGAIN(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 1;
	condition		= WRK_227_Snaf_MEETAGAIN_Condition;
	information		= WRK_227_Snaf_MEETAGAIN_Info;
	important		= TRUE;
};

func int WRK_227_Snaf_MEETAGAIN_Condition()
{
	return TRUE;
};

func void WRK_227_Snaf_MEETAGAIN_Info()
{
	AI_Output(self, hero, "WRK_227_MEETAGAIN_09_01"); //Ja ist das denn möglich!?
	AI_Output(self, hero, "WRK_227_MEETAGAIN_09_02"); //Ich kenn dich doch!

	Info_AddChoice(WRK_227_Snaf_MEETAGAIN, "Du kennst mich? Ich wüsste nicht woher!", WRK_227_Snaf_MEETAGAIN_DONTKNOW);
	Info_AddChoice(WRK_227_Snaf_MEETAGAIN, "Snaf...? Snaf, der Koch!", WRK_227_Snaf_MEETAGAIN_SNAF);
};

func void WRK_227_Snaf_MEETAGAIN_SNAF()
{
	Info_ClearChoices(WRK_227_Snaf_MEETAGAIN);
	AI_Output(hero, self, "WRK_227_MEETAGAIN_SNAF_15_01"); //Snaf...? Snaf, der Koch!
	AI_Output(self, hero, "WRK_227_MEETAGAIN_SNAF_09_02"); //Ja Mann! Wo hast du dich die letzten Monate rumgetrieben?
	AI_Output(hero, self, "WRK_227_MEETAGAIN_SNAF_15_03"); //Ich war... unpässlich!
	AI_Output(self, hero, "WRK_227_MEETAGAIN_SNAF_09_04"); //Konntest wohl mein Fleischwanzenragout nicht mehr ertragen, was? (lacht)
	Info_AddChoice(WRK_227_Snaf_MEETAGAIN, "Dein Ragout war wirklich eklig, aber daran lag's nicht!", WRK_227_Snaf_MEETAGAIN_SNAF_BAD);
	Info_AddChoice(WRK_227_Snaf_MEETAGAIN, "Hey, ich steh auf dein Fleischwanzenragout, ehrlich!", WRK_227_Snaf_MEETAGAIN_SNAF_GOOD);
};

func void WRK_227_Snaf_MEETAGAIN_SNAF_GOOD()
{
	Info_ClearChoices(WRK_227_Snaf_MEETAGAIN);
	AI_Output(hero, self, "WRK_227_MEETAGAIN_SNAF_GOOD_15_01"); //Hey, ich steh auf dein Fleischwanzenragout, ehrlich!
	AI_Output(self, hero, "WRK_227_MEETAGAIN_SNAF_GOOD_09_02"); //Dann schmeckt dir bestimmt auch mein neues Rezept. Fleischwanzensuppe!
	AI_Output(self, hero, "WRK_227_MEETAGAIN_SNAF_GOOD_09_03"); //Für meine Freunde hab ich immer etwas davon übrig!
	Snaf_DailyRagout = TRUE;
};

func void WRK_227_Snaf_MEETAGAIN_SNAF_BAD()
{
	Info_ClearChoices(WRK_227_Snaf_MEETAGAIN);
	AI_Output(hero, self, "WRK_227_MEETAGAIN_SNAF_BAD_15_01"); //Dein Ragout ist wirklich eklig, aber danan lag's nicht!
	AI_Output(self, hero, "WRK_227_MEETAGAIN_SNAF_BAD_09_02"); //Eklig? Du findest es eklig?? Pah!
};

func void WRK_227_Snaf_MEETAGAIN_DONTKNOW()
{
	Info_ClearChoices(WRK_227_Snaf_MEETAGAIN);
	AI_Output(hero, self, "WRK_227_MEETAGAIN_DONTKNOW_15_01"); //Du kennst mich? Ich wüsste nicht woher!
	AI_Output(self, hero, "WRK_227_MEETAGAIN_DONTKNOW_09_02"); //Oh, dann hab ich dich wohl verwechselt!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DAILYRAGOUT
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_DAILYRAGOUT(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 10;
	condition		= WRK_227_Snaf_DAILYRAGOUT_Condition;
	information		= WRK_227_Snaf_DAILYRAGOUT_Info;
	permanent		= TRUE;
	description		= "Hast du etwas von der Fleischwanzensuppe für mich?";
};

func int WRK_227_Snaf_DAILYRAGOUT_Condition()
{
	if (Snaf_DailyRagout)
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_DAILYRAGOUT_Info()
{
	AI_Output(hero, self, "WRK_227_DAILYRAGOUT_15_01"); //Hast du etwas Fleischwanzensuppe für mich?

	if ((Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= 1)
	&& Knows_RecipeMeatbug)
	{
		AI_Output(self, hero, "WRK_227_DAILYRAGOUT_09_02"); //Du weisst doch jetzt selbst wie man sie zubereitet!
		if (Npc_KnowsInfo(hero, WRK_227_Snaf_HAVERECIPE))
		{
			AI_Output(self, hero, "WRK_227_DAILYRAGOUT_09_03"); //Ausserdem werde ich ab sofort das neue Rezept Fleischeintopf zubereiten.
			Snaf_RagoutDay = B_GetDay() - 1;	// Damit der Fleischeintopf gleich rausgerückt wird!
		};

		WRK_227_Snaf_DAILYRAGOUT.permanent = FALSE;
		AI_StopProcessInfos(self);
		return;
	};

	if (Snaf_RagoutDay < B_GetDay())
	{
		AI_Output(self, hero, "WRK_227_DAILYRAGOUT_09_04"); //Hier nimm 3 Portionen und lass es dir schmecken!
		B_GiveInvItems(self, hero, ItFo_MeatbugSoup, 3);
		Snaf_RagoutDay = B_GetDay();
	}
	else
	{
		AI_Output(self, hero, "OUMULTI_NOMORE_09_00"); //Heute kann ich nicht mehr abgeben. Muss ja schliesslich auch noch was verkaufen.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SMELLSGOOD
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_SMELLSGOOD(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 0;
	condition		= WRK_227_Snaf_SMELLSGOOD_Condition;
	information		= WRK_227_Snaf_SMELLSGOOD_Info;
	description		= "Das riecht lecker!";
};

func int WRK_227_Snaf_SMELLSGOOD_Condition()
{
	return TRUE;
};

func void WRK_227_Snaf_SMELLSGOOD_Info()
{
	AI_Output(hero, self, "WRK_227_SMELLSGOOD_15_01"); //Das riecht lecker!
	AI_Output(self, hero, "WRK_227_SMELLSGOOD_09_02"); //Ahhh... Du weisst offensichtlich rustikale Küche zu schätzen.
	AI_Output(self, hero, "WRK_227_SMELLSGOOD_09_03"); //Ich mache Fleischwanzensuppe!
	AI_Output(self, hero, "WRK_227_SMELLSGOOD_09_04"); //Die ist sehr nahrhaft und hat sogar heilsame Wirkung!
	AI_Output(self, hero, "WRK_227_SMELLSGOOD_09_05"); //Ist bei den Arenakämpfern sehr beliebt. Die Jungs müssen ständig Schnitte und Beulen auskurieren.
};

///////////////////////////////////////////////////////////////////////
//	Info WANTLEARN
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WANTLEARN(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 1;
	condition		= WRK_227_Snaf_WANTLEARN_Condition;
	information		= WRK_227_Snaf_WANTLEARN_Info;
	description		= "Zeig mir, wie man Fleischwanzensuppe macht.";
};

func int WRK_227_Snaf_WANTLEARN_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_227_Snaf_SMELLSGOOD))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_WANTLEARN_Info()
{
	AI_Output(hero, self, "WRK_227_WANTLEARN_15_01"); //Zeig mir, wie man Fleischwanzensuppe macht.
	AI_Output(self, hero, "WRK_227_WANTLEARN_09_02"); //(Tiefes, langes Lachen)
	AI_Output(self, hero, "WRK_227_WANTLEARN_09_03"); //Ich lebe davon, dass die Leute bei mir Schlange stehen.
	AI_Output(self, hero, "WRK_227_WANTLEARN_09_04"); //Warum sollte ich meine besten Rezepte weitergeben?
};

///////////////////////////////////////////////////////////////////////
//	Info WANTFAVOR
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WANTFAVOR(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 1;
	condition		= WRK_227_Snaf_WANTFAVOR_Condition;
	information		= WRK_227_Snaf_WANTFAVOR_Info;
	description		= "Naja, ich sehe hier niemanden Schlange stehen.";
};

func int WRK_227_Snaf_WANTFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_227_Snaf_WANTLEARN))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_WANTFAVOR_Info()
{
	AI_Output(hero, self, "WRK_227_WANTFAVOR_15_01"); //Naja...
	AI_PlayAni(hero, "T_SEARCH");
	AI_Output(hero, self, "WRK_227_WANTFAVOR_15_02"); //...ich sehe hier niemanden Schlange stehen.
	AI_Output(self, hero, "WRK_227_WANTFAVOR_09_03"); //(zerknirscht) Hast ja recht, in letzter Zeit läuft es nicht so gut bei mir.
	AI_Output(self, hero, "WRK_227_WANTFAVOR_09_04"); //Aber mir kommt da gerade eine Idee!
	AI_Output(hero, self, "WRK_227_WANTFAVOR_15_05"); //Erzähl.
	AI_Output(self, hero, "WRK_227_WANTFAVOR_09_06"); //Kennst Du Halvor?
	Info_AddChoice(WRK_227_Snaf_WANTFAVOR, "Halvor? Nie gehört.", WRK_227_Snaf_WANTFAVOR_NO);
	Info_AddChoice(WRK_227_Snaf_WANTFAVOR, "Ja, den kenne ich.", WRK_227_Snaf_WANTFAVOR_YES);
};

func void WRK_227_Snaf_WANTFAVOR_YES()
{
	Info_ClearChoices(WRK_227_Snaf_WANTFAVOR);
	AI_Output(hero, self, "WRK_227_WANTFAVOR_YES_15_01"); //Ja, den kenne ich.
	AI_Output(self, hero, "WRK_227_WANTFAVOR_YES_09_02"); //Wir sind gewissermassen... Konkurrenten.
	AI_Output(self, hero, "WRK_227_WANTFAVOR_YES_09_03"); //Irgendwie scheint er es zu schaffen, mir meine Kundschaft abspenstig zu machen!
};

func void WRK_227_Snaf_WANTFAVOR_NO()
{
	Info_ClearChoices(WRK_227_Snaf_WANTFAVOR);
	AI_Output(hero, self, "WRK_227_WANTFAVOR_NO_15_01"); //Halvor? Nie gehört.
	AI_Output(self, hero, "WRK_227_WANTFAVOR_NO_09_02"); //Er ist der Koch in der Burgküche.
	AI_Output(self, hero, "WRK_227_WANTFAVOR_NO_09_03"); //Sogar einige meiner Stammgäste kaufen sich jetzt ihr Essen bei ihm!
};

///////////////////////////////////////////////////////////////////////
//	Info WHYNOTYOU
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WHYNOTYOU(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 1;
	condition		= WRK_227_Snaf_WHYNOTYOU_Condition;
	information		= WRK_227_Snaf_WHYNOTYOU_Info;
	description		= "Warum gehst du der Sache nicht auf den Grund?";
};

func int WRK_227_Snaf_WHYNOTYOU_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_227_Snaf_WANTFAVOR))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_WHYNOTYOU_Info()
{
	AI_Output(hero, self, "WRK_227_WHYNOTYOU_15_01"); //Warum gehst du der Sache nicht auf den Grund?
	AI_Output(self, hero, "WRK_227_WHYNOTYOU_09_02"); //Der Mistkerl lässt mich nichtmal in die Nähe seiner Küche!
	AI_Output(self, hero, "WRK_227_WHYNOTYOU_09_03"); //Aber wenn du mein Problem löst, zeig ich dir, wie man Fleischwanzensuppe zubereitet!
	AI_Output(hero, self, "WRK_227_WHYNOTYOU_15_04"); //Verstehe!
};

///////////////////////////////////////////////////////////////////////
//	Info IGO
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_IGO(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 1;
	condition		= WRK_227_Snaf_IGO_Condition;
	information		= WRK_227_Snaf_IGO_Info;
	description		= "Ich werde mich um dein Problem kümmern!";
};

func int WRK_227_Snaf_IGO_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_227_Snaf_WHYNOTYOU))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_IGO_Info()
{
	AI_Output(hero, self, "WRK_227_IGO_15_01"); //Ich kümmere mich darum!
	AI_Output(self, hero, "WRK_227_IGO_09_02"); //Dann haben wir eine Absprache?
	AI_Output(hero, self, "WRK_227_IGO_15_03"); //Haben wir!

	Log_CreateTopic(CH1_LearnCooking, LOG_MISSION);
	Log_SetTopicStatus(CH1_LearnCooking, LOG_RUNNING);
	B_LogEntry(CH1_LearnCooking, CH1_LearnCooking_7);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUNDOUT
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_FOUNDOUT(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 0;
	condition		= WRK_227_Snaf_FOUNDOUT_Condition;
	information		= WRK_227_Snaf_FOUNDOUT_Info;
	description		= "Ich weiss jetzt, warum alle bei Halvor essen gehen.";
};

func int WRK_227_Snaf_FOUNDOUT_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_227_Snaf_IGO)
	&& Npc_KnowsInfo(hero, MIL_100_Halvor_SNAF)
	&& ((Snaf_MilitiaBribed + Snaf_MilitiaFrightened) < SNAF_NEW_CUSTOMERS))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_FOUNDOUT_Info()
{
	AI_Output(hero, self, "WRK_227_FOUNDOUT_15_01"); //Ich weiss jetzt, warum alle bei Halvor essen gehen.
	AI_Output(self, hero, "WRK_227_FOUNDOUT_09_02"); //Sag es mir! ich muss es wissen!
	AI_Output(hero, self, "WRK_227_FOUNDOUT_15_03"); //Er bereitet seinen Fleischeintopf nach einem neuen Rezept zu.
	AI_Output(hero, self, "WRK_227_FOUNDOUT_15_04"); //Sieht so aus, als ob es bei Halvor einfach besser schmeckt, als bei dir!
	AI_Output(self, hero, "WRK_227_FOUNDOUT_09_05"); //Verdammt! Wie kriege ich meine Kundschaft wieder?
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NOTHINGNEW
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_NOTHINGNEW(C_Info)
{
	npc				= WRK_227_Snaf;
	condition		= WRK_227_Snaf_NOTHINGNEW_Condition;
	information		= WRK_227_Snaf_NOTHINGNEW_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int WRK_227_Snaf_NOTHINGNEW_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_227_Snaf_FOUNDOUT)
	&& ((Snaf_MilitiaBribed + Snaf_MilitiaFrightened) < SNAF_NEW_CUSTOMERS)
	&& !Npc_HasItems(hero, ItWr_HalvorRecipe)
	&& !Snaf_CustomerQuestSolved
	&& C_NpcIsInvincible(self)
	&& !C_NpcIsDead(MIL_100_Halvor))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_NOTHINGNEW_Info()
{
	AI_Output(self, hero, "WRK_227_NOTHINGNEW_09_01"); //Bitte, du musst dich um mein Problem kümmern!
	AI_Output(self, hero, "WRK_227_NOTHINGNEW_09_02"); //Frag doch mal bei den Milizsoldaten vor Halvor's Küche herum!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALVORDEAD
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_HALVORDEAD(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 0;
	condition		= WRK_227_Snaf_HALVORDEAD_Condition;
	information		= WRK_227_Snaf_HALVORDEAD_Info;
	description		= "Halvor ist tot. Dein Problem ist gelöst!";
};

func int WRK_227_Snaf_HALVORDEAD_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_227_Snaf_FOUNDOUT)
	&& C_NpcIsDead(MIL_100_Halvor))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_HALVORDEAD_Info()
{
	AI_Output(hero, self, "WRK_227_HALVORDEAD_15_01"); //Halvor ist tot. Dein Problem ist gelöst!
	AI_Output(self, hero, "WRK_227_HALVORDEAD_09_02"); //Bist du von allen guten Geistern verlassen. Du solltest meine Kunden zurückholen und keinen Kreig im Lager anfangen.
	AI_Output(self, hero, "WRK_227_HALVORDEAD_09_03"); //Als ob die Orks da draussen nicht schon genug Probleme wären.
	AI_Output(self, hero, "WRK_227_HALVORDEAD_09_04"); //Ich will nichts mehr mit dir zu tun haben.

	B_SetAttitude(self, ATT_ANGRY);

	B_LogEntry(CH1_LearnCooking, CH1_LearnCooking_8);
	Log_SetTopicStatus(CH1_LearnCooking, LOG_FAILED);
};

///////////////////////////////////////////////////////////////////////
//	Info DEADAGAIN
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_DEADAGAIN(C_Info)
{
	npc				= WRK_227_Snaf;
	condition		= WRK_227_Snaf_DEADAGAIN_Condition;
	information		= WRK_227_Snaf_DEADAGAIN_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int WRK_227_Snaf_DEADAGAIN_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_227_Snaf_HALVORDEAD)
	&& C_NpcIsInvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_DEADAGAIN_Info()
{
	AI_Output(self, hero, "WRK_227_DEADAGAIN_09_01"); //Ich will nichts mehr mit dir zu tun haben, du Mörder!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HAVERECIPE
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_HAVERECIPE(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 0;
	condition		= WRK_227_Snaf_HAVERECIPE_Condition;
	information		= WRK_227_Snaf_HAVERECIPE_Info;
	description		= "Ich habe Halvor's Kochbuch  ...ähm... organisiert!";
};

func int WRK_227_Snaf_HAVERECIPE_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_227_Snaf_FOUNDOUT)
	&& Npc_HasItems(hero, ItWr_HalvorRecipe))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_HAVERECIPE_Info()
{
	AI_Output(hero, self, "WRK_227_HAVERECIPE_15_01"); //Ich habe Halvor's Kochbuch ...ähm... organisiert!
	B_GiveInvItems(hero, self, ItWr_HalvorRecipe, 1);
	AI_Output(self, hero, "WRK_227_HAVERECIPE_09_02"); //Mann, das ist klasse! Will garnicht wissen, wie du das geschafft hast!
	AI_Output(self, hero, "WRK_227_HAVERECIPE_09_03"); //Wenn ich auch Fleisch-Eintopf anbiete, werden bald wieder alle bei MIR schlange stehen!

	B_GiveXP(XP_Snaf_GaveRecipe);
	B_Snaf_NewRecipe();
	Snaf_CustomerQuestSolved = TRUE;
	B_SetAttitude(self, ATT_FRIENDLY);
};

///////////////////////////////////////////////////////////////////////
//	Info NEWCUSTOMERS
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_NEWCUSTOMERS(C_Info)
{
	npc				= WRK_227_Snaf;
	condition		= WRK_227_Snaf_NEWCUSTOMERS_Condition;
	information		= WRK_227_Snaf_NEWCUSTOMERS_Info;
	important		= TRUE;
};

func int WRK_227_Snaf_NEWCUSTOMERS_Condition()
{
	if (((Snaf_MilitiaBribed + Snaf_MilitiaFrightened) >= SNAF_NEW_CUSTOMERS)
	|| Halvor_StewSalted)
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_NEWCUSTOMERS_Info()
{
	AI_SetWalkMode(self, NPC_RUN);
	AI_GotoNpc(self, hero);
	AI_Output(self, hero, "WRK_227_NEWCUSTOMERS_09_01"); //Hey, da bist du ja wieder!
	AI_Output(self, hero, "WRK_227_NEWCUSTOMERS_09_02"); //Ich weiss nicht WAS du gemacht hast, aber viele der Milizsoldaten essen wieder bei mir, statt bei Halvor!

	AI_Output(self, hero, "WRK_227_NEWCUSTOMERS_09_03"); //Sie stehen sogar wieder Schlange!

	B_LogEntry(CH1_LearnCooking, CH1_LearnCooking_9);

	Snaf_CustomerQuestSolved = TRUE;
	B_SetAttitude(self, ATT_FRIENDLY);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHCOOK
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_TEACHCOOK(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 0;
	condition		= WRK_227_Snaf_TEACHCOOK_Condition;
	information		= WRK_227_Snaf_TEACHCOOK_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LearnCook_1, LPCOST_TALENT_COOK_1, 0);
};

func int WRK_227_Snaf_TEACHCOOK_Condition()
{
	if (Snaf_CustomerQuestSolved
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_COOK) < 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_TEACHCOOK_Info()
{
	if (B_GiveSkill(hero, NPC_TALENT_COOK, 1, LPCOST_TALENT_COOK_1))
	{
		AI_Output(hero, self, "WRK_227_TEACHCOOK_15_01"); //Zeigst du mir jetzt wie man Fleischwanzensuppe zubereitet?
		AI_Output(self, hero, "WRK_227_TEACHCOOK_09_02"); //Gerne! Zuerst ein paar grundsätzliche Dinge:
		AI_Output(self, hero, "WRK_227_TEACHCOOK_09_03"); //Achte auf das Feuer. Die Suppe muß immer leicht köcheln.
		AI_Output(self, hero, "WRK_227_TEACHCOOK_09_04"); //Und du musst regelmässig mit dem Kochlöffel umrühren, damit sich der Geschmack richtig entfalten kann.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SCOOP
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_SCOOP(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 0;
	condition		= WRK_227_Snaf_SCOOP_Condition;
	information		= WRK_227_Snaf_SCOOP_Info;
	description		= "Kochlöffel? Hab ich nicht!";
};

func int WRK_227_Snaf_SCOOP_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= 1)
	&& !Npc_HasItems(hero, ItMi_Scoop))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_SCOOP_Info()
{
	AI_Output(hero, self, "WRK_227_SCOOP_15_01"); //Kochlöffel? Hab ich nicht!
	AI_Output(self, hero, "WRK_227_SCOOP_09_02"); //Nimm den hier, ich habe mehr als genug davon!

	B_GiveInvItems(self, hero, ItMi_Scoop, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info MEATBUGRECIPE
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_MEATBUGRECIPE(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 0;
	condition		= WRK_227_Snaf_MEATBUGRECIPE_Condition;
	information		= WRK_227_Snaf_MEATBUGRECIPE_Info;
	description		= "...und wie macht man nun die Suppe?";
};

func int WRK_227_Snaf_MEATBUGRECIPE_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= 1)
	&& !Knows_RecipeMeatbug)
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_MEATBUGRECIPE_Info()
{
	AI_Output(hero, self, "WRK_227_MEATBUGRECIPE_15_01"); //...und wie macht man nun die Suppe?
	AI_Output(self, hero, "WRK_227_MEATBUGRECIPE_09_02"); //Ah ja... richtig! Im Grunde ist es garnicht so schwierig.
	AI_Output(self, hero, "WRK_227_MEATBUGRECIPE_09_03"); //Schäle eine Fleischwanze vorsichtig aus ihrem Panzer, schneide das Fleisch klein und gib es nach und nach in das heisse Wasser.
	AI_Output(self, hero, "WRK_227_MEATBUGRECIPE_09_04"); //Gebe noch etwas Brot hinein, um die Suppe etwas anzudicken. Nun noch gut umrühren, und mit einer Prise Salz abschmecken und fertig ist die Suppe.

	B_LearnRecipeMeatbug();

	B_LogEntry(CH1_LearnCooking, CH1_LearnCooking_10);
	Log_SetTopicStatus(CH1_LearnCooking, LOG_SUCCESS);
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREBUGS
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WHEREBUGS(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 0;
	condition		= WRK_227_Snaf_WHEREBUGS_Condition;
	information		= WRK_227_Snaf_WHEREBUGS_Info;
	description		= "Wo finde ich solche Fleischwanzen?";
};

func int WRK_227_Snaf_WHEREBUGS_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_227_Snaf_MEATBUGRECIPE))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_WHEREBUGS_Info()
{
	AI_Output(hero, self, "WRK_227_WHEREBUGS_15_01"); //Wo finde ich solche Fleischwanzen?
	AI_Output(self, hero, "WRK_227_WHEREBUGS_09_02"); //Dieses kleine Krabbelgetier liebt Müll. Einfach unglaublich, dass sie so hervorragend schmecken!
	AI_Output(self, hero, "WRK_227_WHEREBUGS_09_03"); //Es gibt hier im Lager zwei Müllberge, dort findest du eigentlich immer ein paar von den Biestern!
};

///////////////////////////////////////////////////////////////////////
//	Info WHERESALTNLOAF
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WHERESALTNLOAF(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 0;
	condition		= WRK_227_Snaf_WHERESALTNLOAF_Condition;
	information		= WRK_227_Snaf_WHERESALTNLOAF_Info;
	description		= "Wo bekomme ich Brot und Salz her?";
};

func int WRK_227_Snaf_WHERESALTNLOAF_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_227_Snaf_MEATBUGRECIPE))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_WHERESALTNLOAF_Info()
{
	AI_Output(hero, self, "WRK_227_WHERESALTNLOAF_15_01"); //Wo bekomme ich Brot und Salz her?
	AI_Output(self, hero, "WRK_227_WHERESALTNLOAF_09_02"); //Ich hole mir die Zutaten immer von Agon im Händlerviertel.
	AI_Output(self, hero, "WRK_227_WHERESALTNLOAF_09_03"); //Er ist zwar eigentlich ein Gauner, aber seine Vorräte sind immer gut gefüllt.
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_HOWDY(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 0;
	condition		= WRK_227_Snaf_HOWDY_Condition;
	information		= WRK_227_Snaf_HOWDY_Info;
	permanent		= TRUE;
	description		= "Wie steht es um deine Kundschaft?";
};

func int WRK_227_Snaf_HOWDY_Condition()
{
	if (!WRK_227_Snaf_DAILYRAGOUT.permanent)
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_HOWDY_Info()
{
	AI_Output(hero, self, "WRK_227_HOWDY_15_01"); //Wie steht es um deine Kundschaft?

	if (Npc_KnowsInfo(hero, WRK_227_Snaf_HAVERECIPE))
	{
		AI_Output(self, hero, "WRK_227_HOWDY_09_02"); //Das neue Rezept ist ein voller Erfolg. Für den Fleisch-Eintopf stehen sie sogar wieder Schlange.
		AI_Output(self, hero, "WRK_227_HOWDY_09_03"); //Danke nochmal für deine Hilfe, obwohl du mir bis heute nicht erzählt hast, WIE du an Halvor's Kochbuch gekommen bist!
	}
	else
	{
		AI_Output(self, hero, "WRK_227_HOWDY_09_04"); //Ausgezeichnet. Sie stehen wieder jeden Tag Schlange und wollen etwas von meiner Fleischwanzensuppe haben!!
		AI_Output(self, hero, "WRK_227_HOWDY_09_05"); //Danke nochmal für deine Hilfe, obwohl du mir bis heute nicht erzählt hast, WIE du das angestellt hast!
	};

	AI_Output(hero, self, "WRK_227_HOWDY_15_06"); //(verschmitzt) Das willst du nicht wissen.
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WANTMEATSTEW
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WANTMEATSTEW(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 0;
	condition		= WRK_227_Snaf_WANTMEATSTEW_Condition;
	information		= WRK_227_Snaf_WANTMEATSTEW_Info;
	permanent		= TRUE;
	description		= "Hast du etwas Fleischeintopf für mich?";
};

func int WRK_227_Snaf_WANTMEATSTEW_Condition()
{
	if (!WRK_227_Snaf_DAILYRAGOUT.permanent
	&& Npc_KnowsInfo(hero, WRK_227_Snaf_HAVERECIPE))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_WANTMEATSTEW_Info()
{
	AI_Output(hero, self, "WRK_227_WANTMEATSTEW_15_01"); //Hast du etwas Fleischeintopf für mich?
	if (Snaf_RagoutDay < B_GetDay())
	{
		AI_Output(self, hero, "WRK_227_WANTMEATSTEW_09_02"); //Hier nimm 3 Portionen. Schliesslich habe ich das neue Rezept dir zu verdanken.
		B_GiveInvItems(self, hero, ItFo_MeatStew, 3);
		Snaf_RagoutDay = B_GetDay();
	}
	else
	{
		AI_Output(self, hero, "OUMULTI_NOMORE_09_00"); //Heute kann ich nicht mehr abgeben. Muss ja schliesslich auch noch was verkaufen.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info RugasMeal
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_RUGASMEAL(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 6;
	condition		= WRK_227_Snaf_RUGASMEAL_Condition;
	information		= WRK_227_Snaf_RUGASMEAL_Info;
	description		= "Kannst Du mir zwei Meatbugsuppen verkaufen?";
};

func int WRK_227_Snaf_RUGASMEAL_Condition()
{
	if (int_RugaWantsMeal
	&& (!int_PlayerHasRugasMeal))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_RUGASMEAL_Info()
{
	AI_Output(hero, self, "WRK_227_RUGASMEAL_15_01"); //Kannst Du mir zwei Meatbugsuppen verkaufen?
	AI_Output(self, hero, "WRK_227_RUGASMEAL_09_02"); //Zwei Suppen kosten für Dich heute nur 15.
};

///////////////////////////////////////////////////////////////////////
//	Info RugasMealNoMoney
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_RUGASMEALNOMONEY(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 8;
	condition		= WRK_227_Snaf_RUGASMEALNOMONEY_Condition;
	information		= WRK_227_Snaf_RUGASMEALNOMONEY_Info;
	permanent		= TRUE;
	description		= "(nicht genug Geld für Meatbugsuppe)";
};

func int WRK_227_Snaf_RUGASMEALNOMONEY_Condition()
{
	if (int_RugaWantsMeal
	&& (!int_PlayerHasRugasMeal)
	&& (Npc_HasItems(hero, ItMi_Silver) < 15)
	&& Npc_KnowsInfo(hero, WRK_227_Snaf_RUGASMEAL))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_RUGASMEALNOMONEY_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info RugasMealMoney
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_RUGASMEALMONEY(C_Info)
{
	npc				= WRK_227_Snaf;
	nr				= 5;
	condition		= WRK_227_Snaf_RUGASMEALMONEY_Condition;
	information		= WRK_227_Snaf_RUGASMEALMONEY_Info;
	permanent		= TRUE;
	description		= "Dann gib mir mal zwei Meatbugsuppen";
};

func int WRK_227_Snaf_RUGASMEALMONEY_Condition()
{
	if (int_RugaWantsMeal
	&& (!int_PlayerHasRugasMeal)
	&& (Npc_HasItems(hero, ItMi_Silver) >= 15)
	&& Npc_KnowsInfo(hero, WRK_227_Snaf_RUGASMEAL))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_227_Snaf_RUGASMEALMONEY_Info()
{
	B_GiveInvItems(hero, self, ItMi_Silver, 15);
	AI_Output(hero, self, "WRK_227_RUGASMEALMONEY_15_01"); //Dann gib mir mal zwei Meatbugsuppen
	B_GiveInvItems(self, hero, ItFo_MeatBugSoup, 2);
	AI_Output(self, hero, "WRK_227_RUGASMEALMONEY_09_02"); //Aber denk dran, ist ein Sonderpreis, nur für Dich.
	int_PlayerHasRugasMeal = TRUE;
	AI_StopProcessInfos(self);
};
