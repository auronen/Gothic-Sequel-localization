///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_EXIT(C_Info)
{
	npc				= THF_409_Pyro;
	nr				= 999;
	condition		= THF_409_Pyro_EXIT_Condition;
	information		= THF_409_Pyro_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int THF_409_Pyro_EXIT_Condition()
{
	return TRUE;
};

func void THF_409_Pyro_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WHATSUP
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_WHATSUP(C_Info)
{
	npc				= THF_409_Pyro;
	nr				= 0;
	condition		= THF_409_Pyro_WHATSUP_Condition;
	information		= THF_409_Pyro_WHATSUP_Info;
	permanent		= TRUE;
	description		= "Was machst du den ganzen Tag?";
};

func int THF_409_Pyro_WHATSUP_Condition()
{
	if ((Npc_GetDistToWP(self, ARENA_WP_CENTER) >= ARENA_CENTER_AREA)
	&& !Npc_KnowsInfo(hero, THF_409_Pyro_PRETTYHOT))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_409_Pyro_WHATSUP_Info()
{
	AI_Output(hero, self, "THF_409_WHATSUP_15_01"); //Was machst du den ganzen Tag?
	AI_Output(self, hero, "THF_409_WHATSUP_05_02"); //Ich warte darauf, dass das Vorprogramm der Arenakämpfe anfängt.
	AI_Output(self, hero, "THF_409_WHATSUP_05_03"); //Dort unterhalte ich die Arenabesucher mit etwas Feuerspuckerei.
	AI_Output(self, hero, "THF_409_WHATSUP_05_04"); //Besuch mich doch mal während des Vorprogramms, wenn dich das interessiert.

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PRETTYHOT
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_PRETTYHOT(C_Info)
{
	npc				= THF_409_Pyro;
	nr				= 0;
	condition		= THF_409_Pyro_PRETTYHOT_Condition;
	information		= THF_409_Pyro_PRETTYHOT_Info;
	description		= "Sieht gefährlich aus, was du da machst!";
};

func int THF_409_Pyro_PRETTYHOT_Condition()
{
	if (Npc_GetDistToWP(self, ARENA_WP_CENTER) < ARENA_CENTER_AREA)
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_409_Pyro_PRETTYHOT_Info()
{
	AI_Output(hero, self, "THF_409_PRETTYHOT_15_01"); //Sieht gefährlich aus, was du da machst!
	AI_Output(self, hero, "THF_409_PRETTYHOT_05_02"); //Ist halb so schlimm wie es aussieht. Hab mir bisher erst einmal die Haare versengt!
	AI_Output(self, hero, "THF_409_PRETTYHOT_05_03"); //Die akrobatischen Tricks waren mir allerdings lieber.
	AI_Output(hero, self, "THF_409_PRETTYHOT_15_04"); //Akrobatische Tricks?
	AI_Output(self, hero, "THF_409_PRETTYHOT_05_05"); //Früher habe ich hier während des Vorprogramms etwas Artistik vorgeführt, aber das war den Zuschauern zu langweilig.
	AI_Output(self, hero, "THF_409_PRETTYHOT_05_06"); //Feuerspucken ist einfach dramatischer!
};

///////////////////////////////////////////////////////////////////////
//	Info WHATACROBAT
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_WHATACROBAT(C_Info)
{
	npc				= THF_409_Pyro;
	nr				= 0;
	condition		= THF_409_Pyro_WHATACROBAT_Condition;
	information		= THF_409_Pyro_WHATACROBAT_Info;
	description		= "Welche akrobatischen Tricks hast du vorgeführt?";
};

func int THF_409_Pyro_WHATACROBAT_Condition()
{
	if (Npc_KnowsInfo(hero, THF_409_Pyro_PRETTYHOT))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_409_Pyro_WHATACROBAT_Info()
{
	AI_Output(hero, self, "THF_409_WHATACROBAT_15_01"); //Welche akrobatischen Tricks hast du vorgeführt?
	AI_Output(self, hero, "THF_409_WHATACROBAT_05_02"); //Hechtrollen, Saltos und dergleichen...
};

///////////////////////////////////////////////////////////////////////
//	Info SHOWME
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_SHOWME(C_Info)
{
	npc				= THF_409_Pyro;
	nr				= 0;
	condition		= THF_409_Pyro_SHOWME_Condition;
	information		= THF_409_Pyro_SHOWME_Info;
	description		= "Kannst du mir diese akrobatischen Tricks auch beibringen?";
};

func int THF_409_Pyro_SHOWME_Condition()
{
	if (Npc_KnowsInfo(hero, THF_409_Pyro_WHATACROBAT))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_409_Pyro_SHOWME_Info()
{
	AI_Output(hero, self, "THF_409_SHOWME_15_01"); //Kannst du mir diese akrobatischen Tricks auch beibringen?
	AI_Output(self, hero, "THF_409_SHOWME_05_02"); //Ich muss für meinen Lebensunterhalt arbeiten. Also wenn du willst, dass ich dir meine alten Tricks zeige, dann kostet dich das Silber!
	AI_Output(hero, self, "THF_409_SHOWME_15_03"); //Wieviel?
};

///////////////////////////////////////////////////////////////////////
//	Info LEARNACROBAT
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_LEARNACROBAT(C_Info)
{
	npc				= THF_409_Pyro;
	nr				= 0;
	condition		= THF_409_Pyro_LEARNACROBAT_Condition;
	information		= THF_409_Pyro_LEARNACROBAT_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT, Pyro_CostAcrobat);
};

func int THF_409_Pyro_LEARNACROBAT_Condition()
{
	if (Npc_KnowsInfo(hero, THF_409_Pyro_SHOWME)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) == 0))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_409_Pyro_LEARNACROBAT_Info()
{
	AI_Output(hero, self, "THF_409_LEARNACROBAT_15_01"); //Zeig mir deine Akrobatischen Tricks!

	if (Npc_HasItems(hero, ItMi_Silver) < Pyro_CostAcrobat)
	{
		B_Say(self, hero, "$NotEnoughSilver");
		return;
	};

	if (B_GiveSkill(hero, NPC_TALENT_ACROBAT, 1, LPCOST_TALENT_ACROBAT))
	{
		B_GiveInvItems(hero, self, ItMi_Silver, Pyro_CostAcrobat);
		AI_Output(self, hero, "THF_409_LEARNACROBAT_05_02"); //Akrobatik ist äußerst vielseitig einsetzbar. Du kannst weiter springen und so Orte erreichen, die andere nicht erreichen können.
		AI_Output(self, hero, "THF_409_LEARNACROBAT_05_03"); //Es hilft dir auch aus einem Kampf schnell weg zu kommen oder die Stellung zu wechseln. So ein Sprung kann dir den Arsch retten.
		AI_Output(self, hero, "THF_409_LEARNACROBAT_05_04"); //Du kannst dich auch bei einem tiefen Sturz besser abfedern und nimmst so weniger Schaden.
		AI_Output(self, hero, "THF_409_LEARNACROBAT_05_05"); //Aber vergiss nicht, wer hoch springt, kann auch tief fallen und unverwundbar macht dich Akrobatik nicht!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WHATPLACES
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_WHATPLACES(C_Info)
{
	npc				= THF_409_Pyro;
	nr				= 0;
	condition		= THF_409_Pyro_WHATPLACES_Condition;
	information		= THF_409_Pyro_WHATPLACES_Info;
	permanent		= TRUE;
	description		= "Welche Orte meinst du damit?";
};

func int THF_409_Pyro_WHATPLACES_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) == 1)
	&& !Pyro_KnowsPlaces)
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_409_Pyro_WHATPLACES_Info()
{
	AI_Output(hero, self, "THF_409_WHATPLACES_15_01"); //Welche Orte meinst du damit?
	AI_Output(self, hero, "THF_409_WHATPLACES_05_02"); //Was ist dir diese Information wert?

	Info_ClearChoices(THF_409_Pyro_WHATPLACES);
	Info_AddChoice(THF_409_Pyro_WHATPLACES, "Garnichts, du wirst es mir so sagen sonst...", THF_409_Pyro_WHATPLACES_THREAT);
	Info_AddChoice(THF_409_Pyro_WHATPLACES, "100 Silber", THF_409_Pyro_WHATPLACES_100);
	Info_AddChoice(THF_409_Pyro_WHATPLACES, "50 Silber", THF_409_Pyro_WHATPLACES_50);
};

func void THF_409_Pyro_Info1()
{
	AI_Output(self, hero, "THF_409_WHATPLACES_Info1_05_01"); //Kennst du den Mauereinsturz bei der Burgschmiede?
	AI_Output(hero, self, "THF_409_WHATPLACES_Info1_15_02"); //Ja!
	AI_Output(self, hero, "THF_409_WHATPLACES_Info1_05_03"); //Niemand kann ohne akrobatische Tricks auf den Mauerrest am Schmiedehaus gelangen.

	Pyro_KnowsPlaces = TRUE;
};

func void THF_409_Pyro_Info2()
{
	AI_Output(self, hero, "THF_409_WHATPLACES_Info2_05_01"); //Treiben sich eine Menge Fleischwanzen dort herum, manchmal liegt dort auch anderer Krempel herum!
	AI_Output(self, hero, "THF_409_WHATPLACES_Info2_05_02"); //Gleichs gilt für die Dächer des Gardistenhauses und die Burgschmiede selbst.
	AI_Output(self, hero, "THF_409_WHATPLACES_Info2_05_03"); //Ich begehe diese Dächer von Zeit zu Zeit, denn Elstern lassen dort oben ab und zu mal interessante Dinge fallen, die sie irgendwo stibitzt haben.
};

func void THF_409_Pyro_WHATPLACES_50()
{
	Info_ClearChoices(THF_409_Pyro_WHATPLACES);

	AI_Output(hero, self, "THF_409_WHATPLACES_50_15_01"); //50 Silber

	if (Npc_HasItems(hero, ItMi_Silver) < 50)
	{
		B_Say(self, hero, "$NotEnoughSilver");
		return;
	};

	B_GiveInvItems(hero, self, ItMi_Silver, 50);

	THF_409_Pyro_Info1();
};

func void THF_409_Pyro_WHATPLACES_100()
{
	Info_ClearChoices(THF_409_Pyro_WHATPLACES);

	AI_Output(hero, self, "THF_409_WHATPLACES_100_15_01"); //100 Silber

	if (Npc_HasItems(hero, ItMi_Silver) < 100)
	{
		B_Say(self, hero, "$NotEnoughSilver");
		return;
	};

	B_GiveInvItems(hero, self, ItMi_Silver, 50);

	THF_409_Pyro_Info1();
	THF_409_Pyro_Info2();
};

func void THF_409_Pyro_WHATPLACES_THREAT()
{
	Info_ClearChoices(THF_409_Pyro_WHATPLACES);

	B_AddDarkPoints(1);

	B_DrawWeapon(hero, self);
	AI_Output(hero, self, "THF_409_WHATPLACES_THREAT_15_01"); //Garnichts, du wirst es mir so sagen sonst...
	AI_Output(self, hero, "THF_409_WHATPLACES_THREAT_05_02"); //OK, OK, werde nicht gleich ungemütlich! Ein Rüpel wie Brutus ist wirklich genug!
	B_RemoveWeapon(hero);
	AI_Output(hero, self, "THF_409_WHATPLACES_THREAT_15_03"); //Warum nicht gleich so!

	THF_409_Pyro_Info1();
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_HOWDY(C_Info)
{
	npc				= THF_409_Pyro;
	nr				= 0;
	condition		= THF_409_Pyro_HOWDY_Condition;
	information		= THF_409_Pyro_HOWDY_Info;
	permanent		= TRUE;
	description		= "Was macht die Feuerspuckerei?";
};

func int THF_409_Pyro_HOWDY_Condition()
{
	if (Npc_KnowsInfo(hero, THF_409_Pyro_PRETTYHOT))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_409_Pyro_HOWDY_Info()
{
	AI_Output(hero, self, "THF_409_HOWDY_15_01"); //Was macht die Feuerspuckerei?
	AI_Output(self, hero, "THF_409_HOWDY_05_02"); //Ich verdiene genug Silber mit einer einzigen Stunde Arbeit pro Tag. Da kann ich mich wirklich nicht beschweren!
	AI_StopProcessInfos(self);
};
