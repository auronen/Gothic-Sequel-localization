///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_EXIT(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 999;
	condition		= THF_403_Gerion_EXIT_Condition;
	information		= THF_403_Gerion_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int THF_403_Gerion_EXIT_Condition()
{
	return TRUE;
};

func void THF_403_Gerion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info 23
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_23(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 45;
	condition		= THF_403_Gerion_23_Condition;
	information		= THF_403_Gerion_23_Info;
	permanent		= TRUE;
	description		= "Was machst du hier?";
};

func int THF_403_Gerion_23_Condition()
{
	return TRUE;
};

func void THF_403_Gerion_23_Info()
{
	AI_Output(hero, self, "THF_403_23_15_01"); //Was machst du hier?
	AI_Output(self, hero, "THF_403_23_11_02"); //Ich bin Gerion aus Khorinis. Vor einigen Wochen habe ich die Stadt verlassen.
	AI_Output(self, hero, "THF_403_23_11_03"); //Was eine gute Entscheidung war, denn kurz darauf kamen die Orks.
	AI_Output(self, hero, "THF_403_23_11_04"); //Jetzt bin ich hier. Aber ich weiß nicht, ob das auch ne gute Entscheidung war, denn hier haben die Orks alles abgeriegelt.
};

///////////////////////////////////////////////////////////////////////
//	Info DIEGO
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_DIEGO(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 13;
	condition		= THF_403_Gerion_DIEGO_Condition;
	information		= THF_403_Gerion_DIEGO_Info;
	description		= "Ich will die Kunst der Diebe lernen.";
};

func int THF_403_Gerion_DIEGO_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_STARTRAINING_THIEF))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_DIEGO_Info()
{
	AI_Output(hero, self, "THF_403_DIEGO_15_01"); //Ich will die Kunst der Diebe lernen.
	AI_Output(self, hero, "THF_403_DIEGO_11_02"); //Warum schreist du nicht noch lauter, damit es auch wirklich JEDER mitkriegt!?
	AI_Output(self, hero, "THF_403_DIEGO_11_03"); //Ausserdem weiß ich gar nicht wovon du redest.
};

///////////////////////////////////////////////////////////////////////
//	Info BERENGAR
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_TELLDIEGO(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 0;
	condition		= THF_403_Gerion_TELLDIEGO_Condition;
	information		= THF_403_Gerion_TELLDIEGO_Info;
	description		= "Dann kann ich also Diego von deinen Raubzügen erzählen?";
};

func int THF_403_Gerion_TELLDIEGO_Condition()
{
	if (Npc_KnowsInfo(hero, THF_403_Gerion_DIEGO)
	&& Npc_KnowsInfo(hero, PC_Thief_GERIONTHIEF)
	&& !Npc_IsInRoutine(self, ZS_Sleep)
	&& !Npc_KnowsInfo(hero, THF_403_Gerion_TELLDIEGO2))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_TELLDIEGO_Info()
{
	AI_Output(hero, self, "THF_403_Gerion_TELLDIEGO_15_01"); //Dann kann ich also Diego von deinen kleinen Raubzügen erzählen?
	AI_Output(self, hero, "THF_403_Gerion_TELLDIEGO_11_02"); //Hey, nicht so laut! Laß uns woanders hingehen. Komm mit!

	GuidePC_Destination = GERION_WP;
	Npc_ExchangeRoutine(self, "GOTOHUT");
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info wenn Berengar bereits in seiner Hütte ist
///////////////////////////////////////////////////////////////////////

// FIXME: sollte raus!! Nachts Standard-AI, die den SC auffordert später wiederzukommen!
instance THF_403_Gerion_TELLDIEGO2(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 0;
	condition		= THF_403_Gerion_TELLDIEGO2_Condition;
	information		= THF_403_Gerion_TELLDIEGO2_Info;
	description		= "Ich könnte Diego von deinen Raubzügen erzählen!";
};

func int THF_403_Gerion_TELLDIEGO2_Condition()
{
	if (Npc_KnowsInfo(hero, THF_403_Gerion_DIEGO)
	&& Npc_KnowsInfo(hero, PC_Thief_GERIONTHIEF)
	&& Npc_IsInRoutine(self, ZS_Sleep)
	&& !Npc_KnowsInfo(hero, THF_403_Gerion_TELLDIEGO))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_TELLDIEGO2_Info()
{
	AI_Output(hero, self, "THF_403_Gerion_TELLDIEGO2_15_01"); //Ich könnte Diego von deinen kleinen Raubzügen erzählen!
	AI_Output(self, hero, "THF_403_Gerion_TELLDIEGO2_11_02"); //Ich schlag dir ein Geschäft vor!
	AI_Output(self, hero, "THF_403_Gerion_TELLDIEGO2_11_03"); //Du behältst das für dich und dafür zeige ich dir die Talente der Diebe.
	AI_Output(hero, self, "THF_403_Gerion_TELLDIEGO2_15_04"); //Ich wußte, das wir uns verstehen würden.
	AI_Output(self, hero, "THF_403_Gerion_TELLDIEGO2_11_05"); //Als erstes musst Du lernen, dich lautlos zu bewegen.
	AI_Output(self, hero, "THF_403_Gerion_TELLDIEGO2_11_06"); //Sag mir Bescheid, wenn du bereit bist.
};

///////////////////////////////////////////////////////////////////////
//	Info INSIDER
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_INSIDER(C_Info)
{
	npc				= THF_403_Gerion;
	condition		= THF_403_Gerion_INSIDER_Condition;
	information		= THF_403_Gerion_INSIDER_Info;
	important		= TRUE;
};

func int THF_403_Gerion_INSIDER_Condition()
{
	if (Npc_IsInRoutine(self, ZS_GuidePC)
	&& (Npc_GetDistToWP(self, "OCR_HUT_79") <= 200)
	&& Npc_KnowsInfo(hero, THF_403_Gerion_TELLDIEGO))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_INSIDER_Info()
{
	AI_Output(self, hero, "THF_403_INSIDER_11_01"); //Ich schlage dir ein Geschäft vor.
	AI_Output(hero, self, "THF_403_INSIDER_15_02"); //Nämlich?
	AI_Output(self, hero, "THF_403_INSIDER_11_03"); //Du verpfeifst mich nicht und dafür zeige ich dir die Talente der Diebe.
	AI_Output(hero, self, "THF_403_INSIDER_15_04"); //Ich wußte das wir uns verstehen würden.
	AI_Output(self, hero, "THF_403_INSIDER_11_05"); //Als erstes musst Du lernen, dich lautlos zu bewegen.
	AI_Output(self, hero, "THF_403_INSIDER_11_06"); //Sag mir Bescheid, wenn du bereit bist.

	Npc_ExchangeRoutine(self, "START");
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info LEARNSNEAK
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_LEARNSNEAK(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 23;
	condition		= THF_403_Gerion_LEARNSNEAK_Condition;
	information		= THF_403_Gerion_LEARNSNEAK_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LearnSneak, LPCOST_TALENT_SNEAK, 0);
};

func int THF_403_Gerion_LEARNSNEAK_Condition()
{
	if ((Npc_KnowsInfo(hero, THF_403_Gerion_INSIDER) || Npc_KnowsInfo(hero, THF_403_Gerion_TELLDIEGO2))
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_LEARNSNEAK_Info()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output(hero, self, "THF_403_LEARNSNEAK_15_01"); //Zeig mir, wie ich mich lautlos bewegen kann.
		AI_Output(self, hero, "THF_403_LEARNSNEAK_11_02"); //Das wichtigste ist, sein Körpergewicht optimal zu verteilen.
		AI_Output(self, hero, "THF_403_LEARNSNEAK_11_03"); //Dann hast du den Boden besser im Blick und deinen Körper besser unter Kontrolle.
		AI_Output(self, hero, "THF_403_LEARNSNEAK_11_04"); //Wenn du schleichst hört dich zwar niemand, aber du bist nicht unsichtbar. Paß auf, daß dich keiner beobachtet.
		AI_Output(self, hero, "THF_403_LEARNSNEAK_11_05"); //Wenn jemand dich herumschleichen sieht, wird er dich im Auge behalten!
		AI_Output(self, hero, "THF_403_LEARNSNEAK_11_06"); //Ich hab 'ne kleine Aufgabe für dich.
		AI_Output(self, hero, "THF_403_LEARNSNEAK_11_07"); //Im Haus der Erzbarone, im Obergeschoß gibt es einen Schlafraum. Dort liegt irgendwo ein Schlüssel. Den brauche ich.
		AI_Output(hero, self, "THF_403_LEARNSNEAK_15_08"); //Klingt einfach.
		AI_Output(self, hero, "THF_403_LEARNSNEAK_11_09"); //Ist es auch! Osbert bewacht zwar den Raum, aber du weisst ja jetzt, wie du unbemerkt an ihm vorbeikommst.

		Log_CreateTopic(CH1_TrainSneak, LOG_MISSION);
		Log_SetTopicStatus(CH1_TrainSneak, LOG_RUNNING);
		B_LogEntry(CH1_TrainSneak, CH1_TrainSneak_2);

		THF_403_Gerion_LEARNSNEAK.permanent = FALSE;
		LearnSneak = LOG_RUNNING;

		Mob_CreateItems("OCC_GOMEZROOM_THRONE_01", ItKe_Jail, 1);
		Mob_CreateItems("OCC_GOMEZROOM_THRONE_01", ItMi_Silver, 10);

		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info KEYRUNNING
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_KEYRUNNING(C_Info)
{
	npc				= THF_403_Gerion;
	condition		= THF_403_Gerion_KEYRUNNING_Condition;
	information		= THF_403_Gerion_KEYRUNNING_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int THF_403_Gerion_KEYRUNNING_Condition()
{
	if ((Npc_HasItems(hero, ITKE_Jail) == 0)
	&& LearnSneak == LOG_RUNNING
	&& !Npc_KnowsInfo(hero, MIL_123_Osbert_THIEF)
	&& C_NPCisinvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_KEYRUNNING_Info()
{
	AI_Output(self, hero, "THF_403_KEYRUNNING_11_01"); //Hast du den Schlüssel schon?
	AI_Output(self, hero, "THF_403_KEYRUNNING_11_02"); //Wenn du an Osbert vorbeischleichst, sollte das kein Problem sein.
};

///////////////////////////////////////////////////////////////////////
//	Info GOTKEY
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_GOTKEY(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 24;
	condition		= THF_403_Gerion_GOTKEY_Condition;
	information		= THF_403_Gerion_GOTKEY_Info;
	description		= "Ich habe den Schlüssel";
};

func int THF_403_Gerion_GOTKEY_Condition()
{
	if ((Npc_HasItems(hero, ITKE_Jail) >= 1)
	&& LearnSneak == LOG_RUNNING)
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_GOTKEY_Info()
{
	AI_Output(hero, self, "THF_403_GOTKEY_15_01"); //Ich habe den Schlüssel.
	B_GiveInvItems(hero, self, Itke_Jail, 1);
	AI_Output(self, hero, "THF_403_GOTKEY_11_02"); //Gute Arbeit! Vielleicht wird aus dir noch ein richtig guter Dieb.
	AI_Output(self, hero, "THF_403_GOTKEY_11_03"); //Ich kann dir noch etwas über TASCHENDIEBSTAHL und SCHLÖSSER KNACKEN beibringen.

	LearnSneak = LOG_SUCCESS;

	Log_SetTopicStatus(CH1_TrainSneak, LOG_SUCCESS);
	B_LogEntry(CH1_TrainSneak, CH1_TrainSneak_3);
};

///////////////////////////////////////////////////////////////////////
//	Info SNEAKFAILED
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_SNEAKFAILED(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 45;
	condition		= THF_403_Gerion_SNEAKFAILED_Condition;
	information		= THF_403_Gerion_SNEAKFAILED_Info;
	description		= "Wegen dem Schlüssel...";
};

func int THF_403_Gerion_SNEAKFAILED_Condition()
{
	if ((LearnSneak == LOG_RUNNING)
	&& Npc_KnowsInfo(hero, MIL_123_Osbert_THIEF)
	&& !Npc_HasItems(hero, ITKE_Jail))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_SNEAKFAILED_Info()
{
	AI_Output(hero, self, "THF_403_SNEAKFAILED_15_01"); //Wegen dem Schlüssel...
	AI_Output(self, hero, "THF_403_SNEAKFAILED_11_02"); //Hast du ihn?
	AI_Output(hero, self, "THF_403_SNEAKFAILED_15_03"); //Osbert hat ihn mir abgenommen.
	AI_Output(self, hero, "THF_403_SNEAKFAILED_11_04"); //Dann sehe ich jetzt drei Möglichkeiten.
	AI_Output(hero, self, "THF_403_SNEAKFAILED_15_05"); //Und welche?
	AI_Output(self, hero, "THF_403_SNEAKFAILED_11_06"); //Wir könnten die ganze Sache einfach vergessen und Du schminkst dir ab, weitere Diebestalente zu lernen.
	AI_Output(self, hero, "THF_403_SNEAKFAILED_11_07"); //Du könntest Osbert auch niederschlagen und ihm den Schlüssel abnehmen. Das dürfte aber sehr schwierig werden!
	AI_Output(hero, self, "THF_403_SNEAKFAILED_15_08"); //...oder?
	AI_Output(self, hero, "THF_403_SNEAKFAILED_11_09"); //Oder ich zeige dir den TASCHENDIEBSTAHL und du nimmst ihm den Schlüssel heimlich ab!

	Info_AddChoice(THF_403_Gerion_SNEAKFAILED, "Zeige mir den Taschendiebstahl", THF_403_Gerion_SNEAKFAILED_PICKPOCK);
	Info_AddChoice(THF_403_Gerion_SNEAKFAILED, "Ich werde Osbert niederschlagen", THF_403_Gerion_SNEAKFAILED_FIGHT);
	Info_AddChoice(THF_403_Gerion_SNEAKFAILED, "Gut, vergessen wir die Sache", THF_403_Gerion_SNEAKFAILED_NEVERTHF);
};

func void THF_403_Gerion_SNEAKFAILED_NEVERTHF()
{
	AI_Output(hero, self, "THF_403_SNEAKFAILED_NEVERTHF_15_01"); //Gut, vergessen wir die Sache.
	AI_Output(self, hero, "THF_403_SNEAKFAILED_NEVERTHF_11_02"); //Als Dieb taugst du wirklich nicht viel! Besser du lernst etwas anderes.

	LearnSneak = LOG_OBSOLETE;
	AI_StopProcessInfos(self);

	Log_SetTopicStatus(CH1_TrainSneak, LOG_OBSOLETE);
	B_LogEntry(CH1_TrainSneak, CH1_TrainSneak_4);
};

func void THF_403_Gerion_SNEAKFAILED_FIGHT()
{
	AI_Output(hero, self, "THF_403_SNEAKFAILED_FIGHT_15_01"); //Ich werde Osbert niederschlagen
	AI_Output(self, hero, "THF_403_SNEAKFAILED_FIGHT_11_02"); //Oder er Dich! Viel Glück! Wenn du es dir anders überlegst, sag mir Bescheid.

	LearnSneak = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void THF_403_Gerion_SNEAKFAILED_PICKPOCK()
{
	AI_Output(hero, self, "THF_403_SNEAKFAILED_PICKPOCK_15_01"); //Zeig mir den Taschendiebstahl.
	AI_Output(self, hero, "THF_403_SNEAKFAILED_PICKPOCK_11_02"); //Das ist die Antwort eines Diebes! Wir können sofort anfangen, wenn du bereit bist.

	Info_ClearChoices(THF_403_Gerion_SNEAKFAILED);
	LearnSneak = LOG_FAILED;
};

///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
func void THF_403_BuysWarez()
{
	if (!Gerion_Dealer)
	{
		AI_Output(self, hero, "THF_403_BUYSWAREZ_1_11_01"); //Ach... und nochwas!
		AI_Output(hero, self, "THF_403_BUYSWAREZ_1_15_02"); //Was?
		AI_Output(self, hero, "THF_403_BUYSWAREZ_1_11_03"); //Wenn du jemanden suchst, der dir organisierte Waren abnimmt... sprich mich an!
		AI_Output(hero, self, "THF_403_BUYSWAREZ_1_15_04"); //Werde es im Hinterkopf behalten.

		Gerion_Dealer = TRUE;

		B_Give_Gerion_ChapterItems(chapter);

		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC, GE_TraderOC_5);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PICKPOCKET_1
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_PICKPOCKET_1(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 33;
	condition		= THF_403_Gerion_PICKPOCKET_1_Condition;
	information		= THF_403_Gerion_PICKPOCKET_1_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LearnPickpocket_1, LPCOST_TALENT_PICKPOCKET_1, 0);
};

func int THF_403_Gerion_PICKPOCKET_1_Condition()
{
	if (((LearnSneak == LOG_FAILED) || (LearnSneak == LOG_SUCCESS))
	&& (Npc_GetTalentSkill(self, NPC_TALENT_PICKPOCKET) == 0))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_PICKPOCKET_1_Info()
{
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
	{
		AI_Output(hero, self, "THF_403_PICKPOCKET_1_15_01"); //Zeig mir den Taschendiebstahl.
		AI_Output(self, hero, "THF_403_PICKPOCKET_1_11_02"); //Die hohe Kunst der Diebe! Es ist viel riskanter einen Menschen zu bestehlen, als eine Truhe zu knacken.
		AI_Output(self, hero, "THF_403_PICKPOCKET_1_11_03"); //Du musst dich anschleichen, damit dein Opfer dich nicht bemerkt.
		AI_Output(self, hero, "THF_403_PICKPOCKET_1_11_04"); //Und paß auf, daß dich niemand beobachtet! Such dir jemanden aus, der alleine ist oder schläft.

		THF_403_Gerion_PICKPOCKET_1.permanent = FALSE;

		if (Npc_KnowsInfo(hero, THF_403_Gerion_SNEAKFAILED)
		&& (LearnSneak == LOG_FAILED)
		&& !Npc_HasItems(hero, ITKE_Jail))
		{
			AI_Output(self, hero, "THF_403_PICKPOCKET_1_11_05"); //jetzt kannst du ja versuchen, Osbert den Schlüssel aus der Tasche zu nehmen.
			AI_Output(self, hero, "THF_403_PICKPOCKET_1_11_06"); //Es wäre schlau es bei dem Schlüssel zu belassen. Je mehr du ihm wegnimmst, desto größer ist die Wahrscheinlichkeit, daß er dich erwischt!

			B_LogEntry(CH1_TrainSneak, CH1_TrainSneak_5);
		};

		if (LearnSneak == LOG_SUCCESS)
		{
			AI_Output(self, hero, "THF_403_PICKPOCKET_1_11_07"); //Wenn du dir noch was verdienen willst, hätte ich noch was zu tun für dich.
			AI_Output(hero, self, "THF_403_PICKPOCKET_1_15_08"); //Lass hören.
			AI_Output(self, hero, "THF_403_PICKPOCKET_1_11_09"); //Wylfern, ein Rekrut der Miliz, besitzt einen Ring. Der ist mir 250 Silberstücke wert.
			AI_Output(self, hero, "THF_403_PICKPOCKET_1_11_10"); //Du solltest es versuchen, wenn Wylfern alleine ist!

			LearnPickPocket_1 = LOG_RUNNING;
			Log_CreateTopic(CH1_TrainPickpocket_1, LOG_MISSION);
			Log_SetTopicStatus(CH1_TrainPickpocket_1, LOG_RUNNING);
			B_LogEntry(CH1_TrainPickpocket_1, CH1_TrainPickpocket_1_1);
		};

		THF_403_BuysWarez();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SECONDCHANCE
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_SECONDCHANCE(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 45;
	condition		= THF_403_Gerion_SECONDCHANCE_Condition;
	information		= THF_403_Gerion_SECONDCHANCE_Info;
	description		= "Ich habe den Schlüssel!";
};

func int THF_403_Gerion_SECONDCHANCE_Condition()
{
	if ((Npc_GetTalentSkill(self, NPC_TALENT_PICKPOCKET) == 1)
	&& (LearnSneak == LOG_FAILED)
	&& Npc_HasItems(hero, ITKE_Jail))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_SECONDCHANCE_Info()
{
	AI_Output(hero, self, "THF_403_SECONDCHANCE_15_01"); //Ich habe den Schlüssel!
	B_GiveInvItems(hero, self, Itke_Jail, 1);
	AI_Output(self, hero, "THF_403_SECONDCHANCE_11_02"); //Na also. Du bist ja doch zu gebrauchen. Wenn du noch SCHLÖSSER KNACKEN lernen willst, bin ich dein Mann.

	LearnSneak = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_TrainSneak, LOG_SUCCESS);
	B_LogEntry(CH1_TrainSneak, CH1_TrainSneak_6);
};

///////////////////////////////////////////////////////////////////////
//	Info OSBERTDOWN
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_OSBERTDOWN(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 13;
	condition		= THF_403_Gerion_OSBERTDOWN_Condition;
	information		= THF_403_Gerion_OSBERTDOWN_Info;
	description		= "Ich habe Osbert niedergeschlagen. Hier ist der Schlüssel.";
};

func int THF_403_Gerion_OSBERTDOWN_Condition()
{
	var C_Npc Osbert;
	Osbert = Hlp_GetNpc(MIL_123_Osbert);

	if (Osbert.aivar[AIV_WASDEFEATEDBYSC])
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_OSBERTDOWN_Info()
{
	AI_Output(hero, self, "THF_403_OSBERTDOWN_15_01"); //Ich habe Osbert niedergeschlagen.
	B_GiveInvItems(hero, self, Itke_Jail, 1);
	AI_Output(self, hero, "THF_403_OSBERTDOWN_11_02"); //Tatsächlich? Dir scheint ja der direkte Weg besser zu liegen als der elegante.
	AI_Output(self, hero, "THF_403_OSBERTDOWN_11_03"); //Ich löse Probleme auf andere Art. Mit dem Kopf, nicht mit der Waffe.
	AI_Output(self, hero, "THF_403_OSBERTDOWN_11_04"); //Zu einem guten Dieb gehört mehr, als nur das Aneignen von Besitz.

	LearnSneak = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_TrainSneak, LOG_SUCCESS);
	B_LogEntry(CH1_TrainSneak, CH1_TrainSneak_7);
};

///////////////////////////////////////////////////////////////////////
//	Info LOCKPICK_1
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_LOCKPICK_1(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 7;
	condition		= THF_403_Gerion_LOCKPICK_1_Condition;
	information		= THF_403_Gerion_LOCKPICK_1_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LearnPicklock_1, LPCOST_TALENT_PICKLOCK_1, 0);
};

func int THF_403_Gerion_LOCKPICK_1_Condition()
{
	if ((LearnSneak == LOG_SUCCESS)
	&& (Npc_GetTalentSkill(self, NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_LOCKPICK_1_Info()
{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(hero, self, "THF_403_LOCKPICK_1_15_01"); //Zeige mir, wie ich Schlösser öffnen kann.
		AI_Output(self, other, "THF_403_LOCKPICK_1_11_02"); //Du brauchst auf jeden Fall Dietriche dazu.
		AI_Output(self, other, "THF_403_LOCKPICK_1_11_03"); //Wenn du vorsichtig bist, wirst du weniger davon verbrauchen.
		AI_Output(self, other, "THF_403_LOCKPICK_1_11_04"); //Bewege den Dietrich nach links oder rechts bis das Schloß aufgeht.
		AI_Output(self, other, "THF_403_LOCKPICK_1_11_05"); //Bevor ich dir mehr beibringe, habe ich eine Aufgabe für dich.
		AI_Output(hero, self, "THF_403_LOCKPICK_1_15_06"); //Wer hätte das gedacht?
		AI_Output(self, other, "THF_403_LOCKPICK_1_11_07"); //Ich brauche 20 Stengel Sumpfkraut. Einer der Bettler, Lakarus, handelt damit. Er hat einen Vorrat in seiner Hütte.
		AI_Output(self, other, "THF_403_LOCKPICK_1_11_08"); //Warte auf einen günstigen Augenblick und besorge dir das Kraut.

		Log_CreateTopic(CH1_TrainLockpick_1, LOG_MISSION);
		Log_SetTopicStatus(CH1_TrainLockpick_1, LOG_RUNNING);
		B_LogEntry(CH1_TrainLockpick_1, CH1_TrainLockpick_1_1);
		LearnPicklock_1 = LOG_RUNNING;
		THF_403_Gerion_LOCKPICK_1.permanent = FALSE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREHUT
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_WHEREHUT(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 44;
	condition		= THF_403_Gerion_WHEREHUT_Condition;
	information		= THF_403_Gerion_WHEREHUT_Info;
	description		= "Wo hat Lakarus seine Hütte?";
};

func int THF_403_Gerion_WHEREHUT_Condition()
{
	if (Npc_KnowsInfo(hero, THF_403_Gerion_LOCKPICK_1))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_WHEREHUT_Info()
{
	AI_Output(hero, self, "THF_403_WHEREHUT_15_01"); //Wo hat Lakarus seine Hütte?
	AI_Output(self, hero, "THF_403_WHEREHUT_11_02"); //Oberhalb der Arena. Er sitzt die meiste Zeit davor...

	B_LogEntry(CH1_TrainLockpick_1, CH1_TrainLockpick_1_2);
};

///////////////////////////////////////////////////////////////////////
//	Info HERB
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_HERB(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 13;
	condition		= THF_403_Gerion_HERB_Condition;
	information		= THF_403_Gerion_HERB_Info;
	description		= "Was willst du mit dem Sumpfkraut?";
};

func int THF_403_Gerion_HERB_Condition()
{
	if (LearnPicklock_1 == LOG_RUNNING)
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_HERB_Info()
{
	AI_Output(hero, self, "THF_403_HERB_15_01"); //Was willst du mit dem Sumpfkraut?
	AI_Output(self, hero, "THF_403_HERB_11_02"); //Das sage ich dir, wenn du mir das Kraut gebracht hast.
};

///////////////////////////////////////////////////////////////////////
//	Info LOCKPICKER
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_LOCKPICKER(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 14;
	condition		= THF_403_Gerion_LOCKPICKER_Condition;
	information		= THF_403_Gerion_LOCKPICKER_Info;
	description		= "Woher bekomme ich Dietriche?";
};

func int THF_403_Gerion_LOCKPICKER_Condition()
{
	if (LearnPicklock_1 == LOG_RUNNING)
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_LOCKPICKER_Info()
{
	AI_Output(hero, self, "THF_403_LOCKPICKER_15_01"); //Woher bekomme ich Dietriche?
	AI_Output(self, hero, "THF_403_LOCKPICKER_11_02"); //Die sind sehr schwer zu kriegen.
	AI_Output(self, hero, "THF_403_LOCKPICKER_11_03"); //Ich gebe dir zwei Stück. Alle weiteren musst du dir selber besorgen.
	B_GiveInvItems(self, hero, ItKe_Lockpick, 2);
	AI_Output(self, hero, "THF_403_LOCKPICKER_11_04"); //Ich kann dir natürlich auch noch weitere Dietriche geben, aber das kostet dich dann eine Kleinigkeit.
	AI_Output(hero, self, "THF_403_LOCKPICKER_15_05"); //Verstehe!

	THF_403_BuysWarez();
};

///////////////////////////////////////////////////////////////////////
//	Info GOTHERB
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_GOTHERB(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 3;
	condition		= THF_403_Gerion_GOTHERB_Condition;
	information		= THF_403_Gerion_GOTHERB_Info;
	description		= "Ich habe das Sumpfkraut!";
};

func int THF_403_Gerion_GOTHERB_Condition()
{
	if ((Npc_HasItems(hero, ItPl_Swampweed) >= 20)
	&& (LearnPicklock_1 == LOG_RUNNING))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_GOTHERB_Info()
{
	AI_Output(hero, self, "THF_403_GOTHERB_15_01"); //Ich habe das Sumpfkraut!
	AI_Output(self, hero, "THF_403_GOTHERB_11_02"); //Gut gemacht! Bring es zu Isgar, dem Heiler.
	AI_Output(self, hero, "THF_403_GOTHERB_11_03"); //Sag ihm du willst den Wein abholen. Diesen Wein bringst du mir. Verstanden?
	AI_Output(hero, self, "THF_403_GOTHERB_15_04"); //Klar. Was ist das besondere an dem Wein?
	AI_Output(self, hero, "THF_403_GOTHERB_11_05"); //Es ist eine spezielle Mischung mit einer...einschläfernden Wirkung...

	B_LogEntry(CH1_TrainLockpick_1, CH1_TrainLockpick_1_3);
};

///////////////////////////////////////////////////////////////////////
//	Info SLEEPWINE
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_SLEEPWINE(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 12;
	condition		= THF_403_Gerion_SLEEPWINE_Condition;
	information		= THF_403_Gerion_SLEEPWINE_Info;
	description		= "Ich habe den Wein";
};

func int THF_403_Gerion_SLEEPWINE_Condition()
{
	if ((Npc_HasItems(hero, ItFo_SleepWine) == 1)
	&& (LearnPicklock_1 == LOG_RUNNING))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_SLEEPWINE_Info()
{
	AI_Output(hero, self, "THF_403_SLEEPWINE_15_01"); //Ich habe den Wein.
	AI_Output(self, hero, "THF_403_SLEEPWINE_11_02"); //Ausgezeichnet. Der wird uns später noch nützlich sein.

	LearnPicklock_1 = LOG_SUCCESS;
	B_GiveXP(XP_LearnPicklock);
	Log_SetTopicStatus(CH1_TrainLockpick_1, LOG_SUCCESS);
	B_LogEntry(CH1_TrainLockpick_1, CH1_TrainLockpick_1_4);
};

///////////////////////////////////////////////////////////////////////
//	Info GOTRING
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_GOTRING(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 3;
	condition		= THF_403_Gerion_GOTRING_Condition;
	information		= THF_403_Gerion_GOTRING_Info;
	description		= "Ich habe den Ring";
};

func int THF_403_Gerion_GOTRING_Condition()
{
	if ((Npc_HasItems(hero, ItPl_Swampweed) == 1)
	&& (LearnPickpocket_1 == LOG_RUNNING))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_GOTRING_Info()
{
	AI_Output(hero, self, "THF_403_GOTRING_15_01"); //Ich habe den Ring.
	B_GiveInvItems(hero, self, ItRi_Fire_01, 1);
	AI_Output(self, hero, "THF_403_GOTRING_11_02"); //Und ich habe hier 250 Silberstücke für dich!
	B_GiveInvItems(self, hero, ItMi_Silver, 250);

	LearnPickpocket_1 = LOG_SUCCESS;

	Log_SetTopicStatus(CH1_TrainPickpocket_1, LOG_SUCCESS);
	B_LogEntry(CH1_TrainPickpocket_1, CH1_TrainPickpocket_1_2);
};

///////////////////////////////////////////////////////////////////////
//	Info ALLIKNOW
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_ALLIKNOW(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 22;
	condition		= THF_403_Gerion_ALLIKNOW_Condition;
	information		= THF_403_Gerion_ALLIKNOW_Info;
	description		= "Ich möchte meine Diebeskünste verbessern!";
};

func int THF_403_Gerion_ALLIKNOW_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) >= 1)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) >= 1)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) >= 1)
	&& (LearnPickpocket_1 != LOG_RUNNING)
	&& (LearnPicklock_1 != LOG_RUNNING)
	&& (LearnSneak != LOG_RUNNING))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_ALLIKNOW_Info()
{
	AI_Output(hero, self, "THF_403_ALLIKNOW_15_01"); //Ich möchte meine Diebeskünste verbessern!
	AI_Output(self, hero, "THF_403_ALLIKNOW_11_02"); //Ich habe dir alles beigebracht, was sich weiß.
	AI_Output(self, hero, "THF_403_ALLIKNOW_11_03"); //Wenn du mehr lernen willst, musst du dir einen anderen Lehrer suchen.

	Log_CreateTopic(GE_TeacherOC, LOG_NOTE);
	B_LogEntry(GE_TeacherOC, GE_TeacheroC_5);
};

///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_TRADE(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 0;
	condition		= THF_403_Gerion_TRADE_Condition;
	information		= THF_403_Gerion_TRADE_Info;
	permanent		= TRUE;
	description		= "Ich hab' da ein paar Dinge...";
};

func int THF_403_Gerion_TRADE_Condition()
{
	if (Gerion_Dealer
	&& (Npc_GetDistToWP(self, GERION_WP) > 300))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_TRADE_Info()
{
	AI_Output(hero, self, "THF_403_TRADE_15_01"); //Ich hab' da ein paar Dinge...
	AI_Output(self, hero, "THF_403_TRADE_11_02"); //OK, aber nicht hier.
	AI_Output(self, hero, "THF_403_TRADE_11_03"); //Komm mit.
	AI_StopProcessInfos(self);

	TA_BeginOverlay(self);
	TA_Stay(00, 00, 00, 30, GERION_WP);
	TA_EndOverlay(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TRADENOW
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_TRADENOW(C_Info)
{
	npc				= THF_403_Gerion;
	nr				= 0;
	condition		= THF_403_Gerion_TRADENOW_Condition;
	information		= THF_403_Gerion_TRADENOW_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "Nun lass uns zum Geschäft kommen!";
};

func int THF_403_Gerion_TRADENOW_Condition()
{
	if (Gerion_Dealer
	&& (Npc_GetDistToWP(self, GERION_WP) <= 300))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_403_Gerion_TRADENOW_Info()
{
	AI_Output(hero, self, "THF_403_TRADENOW_15_01"); //Nun lass uns zum Geschäft kommen!
	AI_Output(self, hero, "THF_403_TRADENOW_11_02"); //Nichts lieber als das (hehe)
};
