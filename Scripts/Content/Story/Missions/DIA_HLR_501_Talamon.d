///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_EXIT(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 999;
	condition		= HLR_501_Talamon_EXIT_Condition;
	information		= HLR_501_Talamon_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int HLR_501_Talamon_EXIT_Condition()
{
	return TRUE;
};

func void HLR_501_Talamon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##					Kapitel 1  -  Begrüssung
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_HI(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 0;
	condition		= HLR_501_Talamon_HI_Condition;
	information		= HLR_501_Talamon_HI_Info;
	description		= "Bist du einer der Heiler?";
};

func int HLR_501_Talamon_HI_Condition()
{
	return TRUE;
};

func void HLR_501_Talamon_HI_Info()
{
	AI_Output(hero, self, "HLR_501_HI_15_01"); //Bist du einer der Heiler?
	AI_Output(self, hero, "HLR_501_HI_08_02"); //Ja. Zusammen mit Palgur und Isgar helfe ich den Kranken hier im Viertel.
	AI_Output(hero, self, "HLR_501_HI_15_03"); //Was ist das für eine Krankheit?
	AI_Output(self, hero, "HLR_501_HI_08_04"); //Die Kranken essen kaum noch und reden wirres Zeug. Schau sie dir an, ein wirklich elender Anblick!
	AI_Output(self, hero, "HLR_501_HI_08_05"); //Wir kennen die Ursache noch nicht. Aber wir forschen unermüdlich um mehr über die Krankheit zu erfahren.
};

///////////////////////////////////////////////////////////////////////
//	Info WANTTOLEARN
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_WANTTOLEARN(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 0;
	condition		= HLR_501_Talamon_WANTTOLEARN_Condition;
	information		= HLR_501_Talamon_WANTTOLEARN_Info;
	description		= "Kannst du mir zeigen, wie man magische Tränke braut?";
};

func int HLR_501_Talamon_WANTTOLEARN_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_WANTTOLEARN_Info()
{
	AI_Output(hero, self, "HLR_501_WANTTOLEARN_15_01"); //Kannst du mir zeigen, wie man magische Tränke braut?
	AI_Output(self, hero, "HLR_501_WANTTOLEARN_08_02"); //Ich bin zu beschäftigt, um dich in der Alchemie zu unterweisen.

	Log_CreateTopic(CH1_LearnAlchemy, LOG_MISSION);
	Log_SetTopicStatus(CH1_LearnAlchemy, LOG_RUNNING);
	B_LogEntry(CH1_LearnAlchemy, CH1_LearnAlchemy_1);
};

///////////////////////////////////////////////////////////////////////
//	Info WHATDOYODO
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_WHATDOYODO(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 2;
	condition		= HLR_501_Talamon_WHATDOYODO_Condition;
	information		= HLR_501_Talamon_WHATDOYODO_Info;
	description		= "Was ist es, was dich so sehr beschäftigt?";
};

func int HLR_501_Talamon_WHATDOYODO_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_WANTTOLEARN))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_WHATDOYODO_Info()
{
	AI_Output(hero, self, "HLR_501_WHATDOYODO_15_01"); //Was ist es, was dich so sehr beschäftigt?
	AI_Output(self, hero, "HLR_501_WHATDOYODO_08_02"); //Wir suchen nach einem Mittel, das den Verstand der Kranken aufklärt. So könnten wir die Armen Teufel befragen und mehr über diese Krankheit erfahren.
	AI_Output(self, hero, "HLR_501_WHATDOYODO_08_03"); //Vor langer Zeit haben sich die Feuermagier mit einer solchen Rezeptur beschäftigt.
	AI_Output(hero, self, "HLR_501_WHATDOYODO_15_04"); //Gibt es denn Feuermagier hier im Alten Lager?
	AI_Output(self, hero, "HLR_501_WHATDOYODO_08_05"); //Nein, schon lange nicht mehr. Wir haben ihr Magierhaus in der Burg durchsucht, aber keine Hinweise auf die Rezeptur gefunden.
	AI_Output(self, hero, "HLR_501_WHATDOYODO_08_06"); //Wenn sie wirklich existiert... wenn wir sie finden würden... wenn sie tatsächlich wirksam wäre...
	AI_Output(hero, self, "HLR_501_WHATDOYODO_15_07"); //...schon klar! Hab verstanden!
};

///////////////////////////////////////////////////////////////////////
//	Info RECIPEFORMONEY
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_RECIPEFORMONEY(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 1;
	condition		= HLR_501_Talamon_RECIPEFORMONEY_Condition;
	information		= HLR_501_Talamon_RECIPEFORMONEY_Info;
	description		= "Dann hilfst du mir, wenn ich die Rezeptur finde?";
};

func int HLR_501_Talamon_RECIPEFORMONEY_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_WHATDOYODO))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_RECIPEFORMONEY_Info()
{
	AI_Output(hero, self, "HLR_501_RECIPEFORMONEY_15_01"); //Dann hilfst du mir, wenn ich die Rezeptur finde?
	AI_Output(self, hero, "HLR_501_RECIPEFORMONEY_08_02"); //So sei es!
	AI_Output(hero, self, "HLR_501_RECIPEFORMONEY_15_03"); //Gut, ich werde die Rezeptur suchen.
	AI_Output(self, hero, "HLR_501_RECIPEFORMONEY_08_04"); //Wir haben Gordian ebenfalls mit der Suche beauftragt. Er besitzt noch alte Schriften aus der Zeit der Barriere.
	AI_Output(self, hero, "HLR_501_RECIPEFORMONEY_08_05"); //Aber er hat die Rezeptur immer noch nicht gefunden.
	AI_Output(self, hero, "HLR_501_RECIPEFORMONEY_08_06"); //Ich hoffe, daß du erfolgreicher bist!

	B_LogEntry(CH1_LearnAlchemy, CH1_LearnAlchemy_2);
};

///////////////////////////////////////////////////////////////////////
//	Info WhereIsGordian
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_WHEREISGORDIAN(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 6;
	condition		= HLR_501_Talamon_WHEREISGORDIAN_Condition;
	information		= HLR_501_Talamon_WHEREISGORDIAN_Info;
	description		= "Wo finde ich diesen Gordian?";
};

func int HLR_501_Talamon_WHEREISGORDIAN_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_RECIPEFORMONEY))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_WHEREISGORDIAN_Info()
{
	AI_Output(hero, self, "HLR_501_WHEREISGORDIAN_15_01"); //Wo finde ich diesen Gordian?
	AI_Output(self, hero, "HLR_501_WHEREISGORDIAN_08_02"); //Er hat eine Hütte am Marktplatz.

	B_LogEntry(CH1_LearnAlchemy, CH1_LearnAlchemy_3);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info RecipeRunning
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_RECIPERUNNING(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 12;
	condition		= HLR_501_Talamon_RECIPERUNNING_Condition;
	information		= HLR_501_Talamon_RECIPERUNNING_Info;
	permanent		= TRUE;
	description		= "Ich habe die Rezeptur noch nicht!";
};

func int HLR_501_Talamon_RECIPERUNNING_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_WHEREISGORDIAN)
	&& (Npc_HasItems(hero, ItAr_ScrollHealPossessed) < 1)
	&& !Npc_KnowsInfo(hero, HLR_501_Talamon_HASRECIPE))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_RECIPERUNNING_Info()
{
	AI_Output(hero, self, "HLR_501_RECIPERUNNING_15_01"); //Ich habe die Rezeptur noch nicht!
	AI_Output(self, hero, "HLR_501_RECIPERUNNING_08_02"); //Komm wieder, wenn Du sie gefunden hast. Dann werde ich dir bei deinen Anliegen behilflich sein.
};

///////////////////////////////////////////////////////////////////////
//	Info AGON
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_AGON(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 0;
	condition		= HLR_501_Talamon_AGON_Condition;
	information		= HLR_501_Talamon_AGON_Info;
	description		= "Ich weiss, wo die Rezeptur ist!";
};

func int HLR_501_Talamon_AGON_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_WHEREISGORDIAN)
	&& Npc_KnowsInfo(hero, WRK_225_Agon_HAVERECIPE)
	&& !Npc_HasItems(hero, ItAr_ScrollHealPossessed)
	&& !Agon_BoughtFormula)
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_AGON_Info()
{
	AI_Output(hero, self, "HLR_501_AGON_15_01"); //Ich weiss, wo die Rezeptur ist!
	AI_Output(self, hero, "HLR_501_AGON_08_02"); //Wirklich?
	AI_Output(hero, self, "HLR_501_AGON_15_03"); //Agon der Händler hat sie. Aber er will 500 Silber dafür haben.
	AI_Output(self, hero, "HLR_501_AGON_08_04"); //Das ist typisch Agon. Er ist ein richtiger Raffzahn.
	AI_Output(self, hero, "HLR_501_AGON_08_05"); //Ein harter Brocken, aber er hat eine Schwäche. Seine panische Angst vor der Krankheit.
};

///////////////////////////////////////////////////////////////////////
//	Info ANTIDOTE
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_ANTIDOTE(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 0;
	condition		= HLR_501_Talamon_ANTIDOTE_Condition;
	information		= HLR_501_Talamon_ANTIDOTE_Info;
	description		= "Mir kommt da eine Idee...";
};

func int HLR_501_Talamon_ANTIDOTE_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_RECIPEFORMONEY)
	&& Npc_KnowsInfo(hero, HLR_501_Talamon_AGON)
	&& !Npc_HasItems(hero, ItAr_ScrollHealPossessed)
	&& !Agon_BoughtFormula)
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_ANTIDOTE_Info()
{
	AI_Output(hero, self, "HLR_501_ANTIDOTE_15_01"); //Mir kommt da eine Idee...
	AI_Output(hero, self, "HLR_501_ANTIDOTE_15_02"); //Hast du einen Trank, der wie ein Heilmittel gegen die Krankheit aussehen könnte?
	AI_Output(self, hero, "HLR_501_ANTIDOTE_08_03"); //Vielleicht erinnerst du dich, dass wir nach einem solchen Mittel suchen...
	AI_Output(hero, self, "HLR_501_ANTIDOTE_15_04"); //Er muss nur _AUSSEHEN_ als ob er heilt!
	AI_Output(self, hero, "HLR_501_ANTIDOTE_08_05"); //Hmmm... vielleicht tut es diese Tinktur hier, die bei einem missglückten Experiment herausgekommen ist.
	B_GiveInvItems(self, hero, ItFo_Placebo, 1);
	AI_Output(hero, self, "HLR_501_ANTIDOTE_15_06"); //Wir werden sehen.
};

///////////////////////////////////////////////////////////////////////
//	Info HasRecipe
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_HASRECIPE(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 4;
	condition		= HLR_501_Talamon_HASRECIPE_Condition;
	information		= HLR_501_Talamon_HASRECIPE_Info;
	description		= "Ich habe die Rezeptur!";
};

func int HLR_501_Talamon_HASRECIPE_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_RECIPEFORMONEY)
	&& Npc_HasItems(other, ItAr_ScrollHealPossessed))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_HASRECIPE_Info()
{
	AI_Output(hero, self, "HLR_501_HASRECIPE_15_01"); //Ich habe die Rezeptur!
	AI_Output(self, hero, "HLR_501_HASRECIPE_08_02"); //Endlich! Zeig her!
	B_GiveInvItems(hero, self, ItAr_ScrollHealPossessed, 1);
	B_UseFakeScroll();
	AI_Output(self, hero, "HLR_501_HASRECIPE_08_03"); //Das ist sie. Du hast uns einen grossen Dienst erwiesen, ich danke dir.

	B_LogEntry(CH1_LearnAlchemy, CH1_LearnAlchemy_4);
	B_GiveXP(XP_Talamon_BringFormula);

	// Phoenix-Rätsel plazieren, nachdem der Spieler sich im Magierhaus umgesehen hat.
	Wld_InsertItem(ItWr_Phoenix1, "FP_SPAWN_PHOENIX_1");	//am umgefallenen Bücherregal
};

//#####################################################################
//##
//##
//##					ALCHEMIE - Tutorial
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info LearnAlchemy
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_LEARNALCHEMY(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 11;
	condition		= HLR_501_Talamon_LEARNALCHEMY_Condition;
	information		= HLR_501_Talamon_LEARNALCHEMY_Info;
	description		= "Zeige mir nun, wie man Tränke braut.";
};

func int HLR_501_Talamon_LEARNALCHEMY_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_HASRECIPE))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_LEARNALCHEMY_Info()
{
	AI_Output(hero, self, "HLR_501_LEARNALCHEMY_15_01"); //Zeige mir nun, wie man Tränke braut.
	AI_Output(self, hero, "HLR_501_LEARNALCHEMY_08_02"); //Du hast uns geholfen, also werden ich es dir zeigen.
	AI_Output(self, hero, "HLR_501_LEARNALCHEMY_08_03"); //Jeder alchemistische Trank erfordert als Grundlage reinsten Alkohol. Er extrahiert die Wirkstoffe aus den anderen Reagenzien und bringt sie zur Wirkung.
	AI_Output(self, hero, "HLR_501_LEARNALCHEMY_08_04"); //Für einen einfachen Heiltrank brauchst dazu noch Bergmoos und Orkblatt, zwei Pflanzen.
	AI_Output(self, hero, "HLR_501_LEARNALCHEMY_08_05"); //Ich leihe dir mein Rezeptbuch für Heiltränke und Gordian wird eine Abschrift anfertigen
	B_GiveInvItems(self, hero, ItWr_Book_HealingPotions, 1);
	AI_Output(hero, self, "HLR_501_LEARNALCHEMY_15_06"); //Gut.

	B_LogEntry(CH1_LearnAlchemy, CH1_LearnAlchemy_5);
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREHEALREGS
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_WHEREHEALREGS(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 0;
	condition		= HLR_501_Talamon_WHEREHEALREGS_Condition;
	information		= HLR_501_Talamon_WHEREHEALREGS_Info;
	description		= "Wo kann ich diese Reagenzien finden?";
};

func int HLR_501_Talamon_WHEREHEALREGS_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_LEARNALCHEMY))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_WHEREHEALREGS_Info()
{
	AI_Output(hero, self, "HLR_501_WHEREHEALREGS_15_01"); //Wo kann ich diese Reagenzien finden?
	AI_Output(self, hero, "HLR_501_WHEREHEALREGS_08_02"); //Bergmoos wächst auf hohen Bergen und Felsen. Meistens muss man diese Orte mühsam erklettern.
	AI_Output(self, hero, "HLR_501_WHEREHEALREGS_08_03"); //Orkblatt findest du ebenfalls in bergiger Gegend, aber oft wächst diese Pflanze schon am Fuss von Felsen.
	AI_Output(self, hero, "HLR_501_WHEREHEALREGS_08_04"); //Reiner Alkohol kann nur von Alchemisten hergestellt werden. Isgar, mein Heiler-Kamerad im Händlerviertel verkauft diese grundlegende Reagenz.
	AI_Output(self, hero, "HLR_501_WHEREHEALREGS_08_05"); //Er hat auch viele pflanzlichen Reagenzien auf Lager, so dass du dir die anstrengenden Klettertouren wahrscheinich ersparen kannst.

	B_LogEntry(CH1_LearnAlchemy, CH1_LearnAlchemy_6);

	B_LearnMountainMoss();
	B_LearnOrcLeaf();
};

///////////////////////////////////////////////////////////////////////
//	Info LearnAlchemyHasBasics
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_LEARNALCHEMYHASBASICS(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 12;
	condition		= HLR_501_Talamon_LEARNALCHEMYHASBASICS_Condition;
	information		= HLR_501_Talamon_LEARNALCHEMYHASBASICS_Info;
	description		= "Ich habe alle Reagenzien und die Abschrift des Buchs.";
};

func int HLR_501_Talamon_LEARNALCHEMYHASBASICS_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_LEARNALCHEMY)
	&& (Npc_HasItems(hero, ItMi_Alcohol) >= 1)
	&& (Npc_HasItems(hero, ItPl_MountainMoss) >= 1)
	&& (Npc_HasItems(hero, ItPl_OrcLeaf) >= 1)
	&& (Npc_HasItems(hero, ItWr_Book_HealingPotions) >= 2))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_LEARNALCHEMYHASBASICS_Info()
{
	AI_Output(hero, self, "HLR_501_LEARNALCHEMYHASBASICS_15_01"); //Ich habe alle Reagenzien und die Abschrift des Buchs.
	AI_Output(self, hero, "HLR_501_LEARNALCHEMYHASBASICS_08_02"); //Gut, aber ich brauche mein Orginal-Buch zurück, dann kann es losgehen.
	AI_Output(hero, self, "HLR_501_LEARNALCHEMYHASBASICS_15_03"); //Hier ist es.
	B_GiveInvItems(other, self, ItWr_Book_HealingPotions, 1);
	B_UseFakeBook(self);
	AI_Output(self, hero, "HLR_501_LEARNALCHEMYHASBASICS_08_04"); //Gut!
};

///////////////////////////////////////////////////////////////////////
//	Info LearnAlchemieRunning
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_LEARNALCHEMIERUNNING(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 12;
	condition		= HLR_501_Talamon_LEARNALCHEMIERUNNING_Condition;
	information		= HLR_501_Talamon_LEARNALCHEMIERUNNING_Info;
	permanent		= TRUE;
	description		= "Kannst Du mir jetzt zeigen wie man Tränke braut?";
};

func int HLR_501_Talamon_LEARNALCHEMIERUNNING_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_LEARNALCHEMY)
	&& !Npc_KnowsInfo(hero, HLR_501_Talamon_LEARNALCHEMYHASBASICS)
	&& !HLR_501_Talamon_LEARNALCHEMYHASBASICS_Condition())
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_LEARNALCHEMIERUNNING_Info()
{
	AI_Output(hero, self, "HLR_501_LEARNALCHEMIERUNNING_15_01"); //Kannst Du mir jetzt zeigen wie man Tränke braut?

	if (Npc_HasItems(hero, ItWr_Book_HealingPotions) < 2)
	{
		AI_Output(self, hero, "HLR_501_LEARNALCHEMIERUNNING_08_02"); //Du brauchst die Abschrift des Buches von Gordian. Komm wieder, wenn du sie erhalten hast.
	};

	if ((Npc_HasItems(hero, ItMi_Alcohol) < 1)
	|| (Npc_HasItems(hero, ItPl_MountainMoss) < 1)
	|| (Npc_HasItems(hero, ItPl_OrcLeaf) < 1))
	{
		AI_Output(self, hero, "HLR_501_LEARNALCHEMIERUNNING_08_03"); //Ohne Reagenzien kann man den Trank nicht brauen. Komm wieder, wenn Du Alkohol, Bergmoos und Orkblatt hast.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LEARNALCHEMY1
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_LEARNALCHEMY1(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 0;
	condition		= HLR_501_Talamon_LEARNALCHEMY1_Condition;
	information		= HLR_501_Talamon_LEARNALCHEMY1_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LearnAlchemy_1, LPCOST_TALENT_ALCHEMY_1, 0);
};

func int HLR_501_Talamon_LEARNALCHEMY1_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_LEARNALCHEMYHASBASICS)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY) == 0))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_LEARNALCHEMY1_Info()
{
	if (B_GiveSkill(hero, NPC_TALENT_ALCHEMY, 1, LPCOST_TALENT_ALCHEMY_1))
	{
		AI_Output(self, hero, "HLR_501_LEARNALCHEMY1_08_01"); //Tränke werden am Alchemietisch hergestellt.
		AI_Output(self, hero, "HLR_501_LEARNALCHEMY1_08_02"); //Gebe die benötigten Reagenzien in den grossen Trog und koche sie.
		AI_Output(self, hero, "HLR_501_LEARNALCHEMY1_08_03"); //Fülle das Gemisch dann um in den kleinen Glaskolben und achte darauf, dass der Raffinierprozess genügend Zeit hat die wertvollen Bestandteile aus dem Gemisch zu extrahieren.
		AI_Output(self, hero, "HLR_501_LEARNALCHEMY1_08_04"); //Nach kurzer Zeit tropft das Resultat in die leere Glasphiole.

		B_LearnRecipeHealingPotions();

		B_LogEntry(CH1_LearnAlchemy, CH1_LearnAlchemy_7);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info CanIBrewAllPotions
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_CANIBREWALLPOTIONS(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 16;
	condition		= HLR_501_Talamon_CANIBREWALLPOTIONS_Condition;
	information		= HLR_501_Talamon_CANIBREWALLPOTIONS_Info;
	description		= "Ich möchte stärkere Tränke herstellen.";
};

func int HLR_501_Talamon_CANIBREWALLPOTIONS_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY) == 1)
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_CANIBREWALLPOTIONS_Info()
{
	AI_Output(hero, self, "HLR_501_CANIBREWALLPOTIONS_15_01"); //Ich möchte stärkere Tränke herstellen.
	AI_Output(self, hero, "HLR_501_CANIBREWALLPOTIONS_08_02"); //Ich habe dir gezeigt, wie wir unsere einfache Heiltränke herstellen.
	AI_Output(self, hero, "HLR_501_CANIBREWALLPOTIONS_08_03"); //Es gibt stärkere Heiltränke, aber uns Heilern ist nicht bekannt, wie sie hergestellt werden.
	AI_Output(self, hero, "HLR_501_CANIBREWALLPOTIONS_08_04"); //Vielleicht findest du irgendwann einen Alchemie-Meister, der dies beibringen kann.

	B_LogEntry(CH1_LearnAlchemy, CH1_LearnAlchemy_8);
	Log_SetTopicStatus(CH1_LearnAlchemy, LOG_SUCCESS);
};

///////////////////////////////////////////////////////////////////////
//	Info IsThereMoreToLearn
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_ISTHEREMORETOLEARN(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 18;
	condition		= HLR_501_Talamon_ISTHEREMORETOLEARN_Condition;
	information		= HLR_501_Talamon_ISTHEREMORETOLEARN_Info;
	permanent		= TRUE;
	description		= "Kannst du mir das Brauen anderer Tränke beibringen?";
};

func int HLR_501_Talamon_ISTHEREMORETOLEARN_Condition()
{
	if ((Npc_KnowsInfo(hero, HLR_501_Talamon_LEARNALCHEMYHASBASICS))
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY) == 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_ISTHEREMORETOLEARN_Info()
{
	AI_Output(hero, self, "HLR_501_ISTHEREMORETOLEARN_15_01"); //Kannst du mir das Brauen anderer Tränke beibringen?
	AI_Output(self, hero, "HLR_501_ISTHEREMORETOLEARN_08_02"); //Dafür benötigst du ein Alchemiebuch, doch dise sind selten und wertvoll.
};

//#####################################################################
//##
//##
//##				MUFFELSALZ für Halvors Eintopf
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info STINKINGSALT
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_STINKINGSALT(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 0;
	condition		= HLR_501_Talamon_STINKINGSALT_Condition;
	information		= HLR_501_Talamon_STINKINGSALT_Info;
	description		= "Ich habe gehört, du verkaufst Müffelsalz?";
};

func int HLR_501_Talamon_STINKINGSALT_Condition()
{
	if (Talamon_KnowStinkingSalt)
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_STINKINGSALT_Info()
{
	AI_Output(hero, self, "HLR_501_STINKINGSALT_15_01"); //Ich habe gehört, du verkaufst Müffelsalz?
	AI_Output(self, hero, "HLR_501_STINKINGSALT_08_02"); //Das stimmt, wofür brauchst du es?
	Info_ClearChoices(HLR_501_Talamon_STINKINGSALT);
	Info_AddChoice(HLR_501_Talamon_STINKINGSALT, "Um die Fleischwanzen aus meiner Hütte zu vertreiben", HLR_501_Talamon_STINKINGSALT_MEATBUGS);
	Info_AddChoice(HLR_501_Talamon_STINKINGSALT, "Um Halvor die Suppe zu versalzen", HLR_501_Talamon_STINKINGSALT_HALVOR);
};

func void HLR_501_Talamon_STINKINGSALT_HALVOR()
{
	Info_ClearChoices(HLR_501_Talamon_STINKINGSALT);
	AI_Output(hero, self, "HLR_501_STINKINGSALT_HALVOR_15_01"); //Um Halvor die Suppe zu versalzen.
	AI_Output(self, hero, "HLR_501_STINKINGSALT_HALVOR_08_02"); //Solcher Schabernack ist eines Alchimisten unwürdig!
	AI_StopProcessInfos(self);
};

func void HLR_501_Talamon_STINKINGSALT_MEATBUGS()
{
	Info_ClearChoices(HLR_501_Talamon_STINKINGSALT);
	AI_Output(hero, self, "HLR_501_STINKINGSALT_MEATBUGS_15_01"); //Um die Fleischwanzen aus meiner Hütte zu vertreiben.
	AI_Output(self, hero, "HLR_501_STINKINGSALT_MEATBUGS_08_02"); //Oh, ja dafür ist das Salz ganz hervorragend geeignet!

	Talamon_BuyStinkingSalt = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BUYSALT
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_BUYSALT(C_Info)
{
	npc				= HLR_501_Talamon;
	nr				= 0;
	condition		= HLR_501_Talamon_BUYSALT_Condition;
	information		= HLR_501_Talamon_BUYSALT_Info;
	permanent		= TRUE;
	description		= B_BuildBuyString!(NAME_StinkingSalt, Value_StinkingSalt);
};

func int HLR_501_Talamon_BUYSALT_Condition()
{
	if (Talamon_BuyStinkingSalt)
	{
		return TRUE;
	};

	return FALSE;
};

func void HLR_501_Talamon_BUYSALT_Info()
{
	if (Npc_HasItems(hero, ItMi_Silver) >= Value_StinkingSalt)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, Value_StinkingSalt);
		AI_Output(self, hero, "HLR_501_BUYSALT_08_01"); //Hier ist das Salz. Nimm nicht zuviel, sonst wirst du es in deiner Hütte selbst nicht mehr aushalten.
		B_GiveInvItems(self, hero, ItMi_StinkingSalt, 1);
		AI_Output(hero, self, "HLR_501_BUYSALT_15_02"); //(grins) Ich werde darauf achten.

		HLR_501_Talamon_BUYSALT.permanent = FALSE;
	}
	else
	{
		B_Say(self, hero, "$NotEnoughSilver");
	};
};
