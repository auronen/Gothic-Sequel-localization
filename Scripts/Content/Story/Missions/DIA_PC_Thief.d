// 			EXIT

instance PC_Thief_Exit(C_Info)
{
	npc				= PC_Thief;
	nr				= 999;
	condition		= PC_Thief_Exit_Condition;
	information		= PC_Thief_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int PC_Thief_Exit_Condition()
{
	return TRUE;
};

func void PC_Thief_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##					KAPITEL 1 (Begrüssung)
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance PC_Thief_WELCOME(C_Info)
{
	npc				= PC_Thief;
	nr				= 1;
	condition		= PC_Thief_WELCOME_Condition;
	information		= PC_Thief_WELCOME_Info;
	important		= TRUE;
	//description		= "(Startsatz)";
};

func int PC_Thief_WELCOME_Condition()
{
	if (chapter == 1)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_WELCOME_Info()
{
	AI_Output(self, hero, "PC_Thief_WELCOME_11_01"); //Hey, bist du es wirklich!? Ich dachte du wärst tot!
	AI_Output(hero, self, "PC_Thief_WELCOME_15_02"); //Ja, wäre ich auch beinahe gewesen. Als der Tempel einstürzte, wurde ich unter den Steinen begraben.
	AI_Output(hero, self, "PC_Thief_WELCOME_15_03"); //Aber Xardas hat mich rausgeholt.
	AI_Output(self, hero, "PC_Thief_WELCOME_11_04"); //Der Dämonenbeschwörer also. Immerhin war er es auch, der dich in die Sache reingezogen hat.
	//AI_Output(self, hero, "PC_Thief_WELCOME_11_05"); //Falls du vorhast abzuhauen, das solltest du schnell wieder vergessen. Aus diesem Tal kommt niemand mehr raus. Die Orks haben uns umzingelt.

	B_SetAttitude(self, ATT_FRIENDLY);

	subChapter = CH1_BEFORE_DIEGO;
};

///////////////////////////////////////////////////////////////////////
//	Info FLEE
///////////////////////////////////////////////////////////////////////
instance PC_Thief_FLEE(C_Info)
{
	npc				= PC_Thief;
	nr				= 3;
	condition		= PC_Thief_FLEE_Condition;
	information		= PC_Thief_FLEE_Info;
	description		= "Warum bist du nicht geflohen nachdem die Barriere gefallen ist?";
};

func int PC_Thief_FLEE_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_WELCOME)
	&& (chapter == 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_FLEE_Info()
{
	AI_Output(hero, self, "PC_Thief_FLEE_15_01"); //Warum bist du nicht geflohen nachdem die Barriere gefallen ist?
	AI_Output(self, hero, "PC_Thief_FLEE_11_02"); //Weil ich nachgedacht habe.
	AI_Output(self, hero, "PC_Thief_FLEE_11_03"); //Ohne das magische Erz bekommt der König keine Waffen mehr. Und ohne Waffen ...
	AI_Output(hero, self, "PC_Thief_FLEE_15_04"); //...kann er den Krieg gegen die Orcs nicht gewinnen.
	AI_Output(self, hero, "PC_Thief_FLEE_11_05"); //Du sagst es. Die Orks ziehen seitdem plündernd durchs Königreich.
	AI_Output(self, hero, "PC_Thief_FLEE_11_06"); //Die Minenkolonie haben sie komplett umstellt.
};

///////////////////////////////////////////////////////////////////////
//	Info QUESTION
///////////////////////////////////////////////////////////////////////
instance PC_Thief_QUESTION(C_Info)
{
	npc				= PC_Thief;
	nr				= 20;
	condition		= PC_Thief_QUESTION_Condition;
	information		= PC_Thief_QUESTION_Info;
	permanent		= TRUE;
	description		= "Ich habe einige Fragen...";
};

func int PC_Thief_QUESTION_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_WELCOME)
	&& (Npc_GetDistToWP(self, DIEGO_WP_THRONE) < 500)
	&& (chapter == 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_QUESTION_Info()
{
	AI_Output(hero, self, "PC_Thief_QUESTION_15_01"); //Ich habe einige Fragen...
	AI_Output(self, hero, "PC_Thief_QUESTION_11_02"); //Lass hören.

	Info_ClearChoices(PC_Thief_QUESTION);

	Info_AddChoice(PC_Thief_QUESTION, DIALOG_BACK, PC_Thief_QUESTION_BACK);
	Info_AddChoice(PC_Thief_QUESTION, "Was gibt's Neues?", PC_Thief_QUESTION_NEWS);
	Info_AddChoice(PC_Thief_QUESTION, "Wie sieht's im Lager aus?", PC_Thief_QUESTION_CAMP);

	if (Diego_Answer)
	{
		Info_AddChoice(PC_Thief_QUESTION, "Ich brauche einen Überblick über das Lager.", PC_Thief_QUESTION_LOOKAROUND);
		Info_AddChoice(PC_Thief_QUESTION, "Was sind die Regeln?", PC_Thief_QUESTION_RULES);
	};
};

func void PC_Thief_QUESTION_BACK()
{
	Info_ClearChoices(PC_Thief_QUESTION);
};

func void PC_Thief_QUESTION_CAMP()
{
	Info_ClearChoices(PC_Thief_QUESTION);

	AI_Output(hero, self, "PC_Thief_QUESTION_CAMP_15_01"); //Wie sieht's im Lager aus?
	AI_Output(self, hero, "PC_Thief_QUESTION_CAMP_11_02"); //Ein paar Gefangene sind hiergeblieben, so wie ich. Und es sind auch jede Menge neue Leute angekommen.
	AI_Output(self, hero, "PC_Thief_QUESTION_CAMP_11_03"); //Flüchtlinge vor den Orcs, Arbeiter, Herumtreiber, Händler...
	AI_Output(self, hero, "PC_Thief_QUESTION_CAMP_11_04"); //Seitdem bin ich so'ne Art Führungskraft.
	AI_Output(self, hero, "PC_Thief_QUESTION_CAMP_11_05"); //Ich habe eine Miliz auf die Beine gestellt. Die kümmert sich darum, daß die Regeln eingehalten werden.

	Diego_Answer = TRUE;

	Info_AddChoice(PC_Thief_QUESTION, DIALOG_BACK, PC_Thief_QUESTION_BACK);
	Info_AddChoice(PC_Thief_QUESTION, "Was gibt's Neues?", PC_Thief_QUESTION_NEWS);
	Info_AddChoice(PC_Thief_QUESTION, "Wie sieht's im Lager aus?", PC_Thief_QUESTION_CAMP);

	if (Diego_Answer)
	{
		Info_AddChoice(PC_Thief_QUESTION, "Ich brauche einen Überblick über das Lager.", PC_Thief_QUESTION_LOOKAROUND);
		Info_AddChoice(PC_Thief_QUESTION, "Was sind die Regeln hier im Lager?", PC_Thief_QUESTION_RULES);
	};
};

func void PC_Thief_QUESTION_NEWS()
{
	Info_ClearChoices(PC_Thief_QUESTION);

	AI_Output(hero, self, "PC_Thief_QUESTION_NEWS_15_01"); //Was gibt's Neues?
	AI_Output(self, hero, "PC_Thief_QUESTION_NEWS_11_02"); //Nach dem Zusammenbruch der Barriere, bevor die Orcs alles abgeriegelt hatten, ist der König ins Tal gekommen.
	AI_Output(self, hero, "PC_Thief_QUESTION_NEWS_11_03"); //Zusammen mit seinen Paladinen und Magiern hat er sich in der Felsenfestung eingenistet.
	AI_Output(hero, self, "PC_Thief_QUESTION_NEWS_15_04"); //Was will Er hier?
	AI_Output(self, hero, "PC_Thief_QUESTION_NEWS_11_05"); //Keine Ahnung was er vorhat. Aber dieses Lager will er nicht. In seinen Augen sind wir hier Futter für die Orks.

	Info_AddChoice(PC_Thief_QUESTION, DIALOG_BACK, PC_Thief_QUESTION_BACK);
	Info_AddChoice(PC_Thief_QUESTION, "Was gibt's Neues?", PC_Thief_QUESTION_NEWS);
	Info_AddChoice(PC_Thief_QUESTION, "Wie sieht's im Lager aus?", PC_Thief_QUESTION_CAMP);

	if (Diego_Answer)
	{
		Info_AddChoice(PC_Thief_QUESTION, "Ich brauche einen Überblick über das Lager.", PC_Thief_QUESTION_LOOKAROUND);
		Info_AddChoice(PC_Thief_QUESTION, "Was sind die Regeln hier im Lager?", PC_Thief_QUESTION_RULES);
	};
};

func void PC_Thief_QUESTION_LOOKAROUND()
{
	Info_ClearChoices(PC_Thief_QUESTION);

	AI_Output(hero, self, "PC_Thief_QUESTION_LOOKAROUND_15_01"); //Ich brauche einen Überblick über das Lager.
	AI_Output(self, hero, "PC_Thief_QUESTION_LOOKAROUND_11_02"); //Igaraz kann dir alles zeigen. Der hat sowieso den ganzen Tag nichts zu tun.
	AI_Output(self, hero, "PC_Thief_QUESTION_LOOKAROUND_11_03"); //Meistens treibt er sich am Eingang des Lagers herum.

	Knows_Igaraz = TRUE;

	Info_AddChoice(PC_Thief_QUESTION, DIALOG_BACK, PC_Thief_QUESTION_BACK);
	Info_AddChoice(PC_Thief_QUESTION, "Was gibt's Neues?", PC_Thief_QUESTION_NEWS);
	Info_AddChoice(PC_Thief_QUESTION, "Wie sieht's im Lager aus?", PC_Thief_QUESTION_CAMP);

	if (Diego_Answer)
	{
		Info_AddChoice(PC_Thief_QUESTION, "Ich brauche einen Überblick über das Lager.", PC_Thief_QUESTION_LOOKAROUND);
		Info_AddChoice(PC_Thief_QUESTION, "Was sind die Regeln hier im Lager?", PC_Thief_QUESTION_RULES);
	};
};

func void PC_Thief_QUESTION_RULES()
{
	Info_ClearChoices(PC_Thief_QUESTION);

	AI_Output(hero, self, "PC_Thief_QUESTION_RULES_15_01"); //Was sind die Regeln hier im Lager?
	AI_Output(self, hero, "PC_Thief_QUESTION_RULES_11_02"); //Die Miliz achtet darauf, daß hier alles ruhig bleibt. Keine Kämpfe, kein Faustrecht! Wir brauchen jeden Mann!
	AI_Output(self, hero, "PC_Thief_QUESTION_RULES_11_03"); //Wird jemand beim Klauen oder Morden erwischt, wird er bestraft.
	AI_Output(self, hero, "PC_Thief_QUESTION_RULES_11_04"); //Die Zeiten, als ich mir selbst noch die Taschen gefüllt habe, sind vorbei! Jetzt geht es um andere Dinge!

	Info_AddChoice(PC_Thief_QUESTION, DIALOG_BACK, PC_Thief_QUESTION_BACK);
	Info_AddChoice(PC_Thief_QUESTION, "Was gibt's Neues?", PC_Thief_QUESTION_NEWS);
	Info_AddChoice(PC_Thief_QUESTION, "Wie sieht's im Lager aus?", PC_Thief_QUESTION_CAMP);

	if (Diego_Answer)
	{
		Info_AddChoice(PC_Thief_QUESTION, "Ich brauche einen Überblick über das Lager.", PC_Thief_QUESTION_LOOKAROUND);
		Info_AddChoice(PC_Thief_QUESTION, "Was sind die Regeln hier im Lager?", PC_Thief_QUESTION_RULES);
	};
};

//////////////////////////////////////////////////////////////////////
//	Info ROOM
///////////////////////////////////////////////////////////////////////
instance PC_Thief_ROOM(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_ROOM_Condition;
	information		= PC_Thief_ROOM_Info;
	description		= "Kann ich hier irgendwo pennen?";
};

func int PC_Thief_ROOM_Condition()
{
	if (Diego_Answer
	&& (chapter == 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_ROOM_Info()
{
	AI_Output(hero, self, "PC_Thief_ROOM_15_01"); //Kann ich hier irgendwo pennen?
	AI_Output(self, hero, "PC_Thief_ROOM_11_02"); //Im Erzbaronhaus ist genug Platz, auch ich wohne jetzt da.
	AI_Output(self, hero, "PC_Thief_ROOM_11_03"); //Wie klingt das?
	AI_Output(hero, self, "PC_Thief_ROOM_15_04"); //Klingt verdammt gut.
	AI_Output(self, hero, "PC_Thief_ROOM_11_05"); //Die Miliz beansprucht auch ein paar Räume.
	AI_Output(self, hero, "PC_Thief_ROOM_11_06"); //Du wirst schon rausfinden, wo du pennen kannst.
};

//#####################################################################
//##
//##
//##					TRAINING
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info NEEDTRAINING
///////////////////////////////////////////////////////////////////////
instance PC_Thief_NEEDTRAINING(C_Info)
{
	npc				= PC_Thief;
	nr				= 5;
	condition		= PC_Thief_NEEDTRAINING_Condition;
	information		= PC_Thief_NEEDTRAINING_Info;
	description		= "Ich muss meine Fähigkeiten trainieren";
};

func int PC_Thief_NEEDTRAINING_Condition()
{
	return TRUE;
};

func void PC_Thief_NEEDTRAINING_Info()
{
	Log_CreateTopic(GE_TeacheroC, LOG_NOTE);

	AI_Output(other, self, "PC_Thief_NEEDTRAINING_Info_15_01"); //Ich muss meine Fähigkeiten trainieren.
	AI_Output(self, other, "PC_Thief_NEEDTRAINING_Info_11_02"); //Ich kann dir helfen, was Geschicklichkeit und Bogenschiessen angeht.
	B_LogEntry(GE_TeacheroC, GE_TeacheroC_1);
	AI_Output(self, other, "PC_Thief_NEEDTRAINING_Info_11_03"); //Magie ist Lesters Spezialität. Er experimentiert im alten Magierhaus in der Burg herum.
	B_LogEntry(GE_TeacheroC, GE_TeacheroC_2);
	AI_Output(self, other, "PC_Thief_NEEDTRAINING_Info_11_04"); //Und dann ist da noch Cassian, der Leutnant der Miliz. Er wird dir mit Freuden alle Kampftechniken einprügeln.
	AI_Output(self, other, "PC_Thief_NEEDTRAINING_Info_11_05"); //Tagsüber trainiert er im Burginnenhof die Soldaten der Miliz.
	B_LogEntry(GE_TeacheroC, GE_TeacheroC_3);

	AI_Output(self, other, "PC_Thief_NEEDTRAINING_Info_11_06"); //Wie ich sehe, brauchst du auch eine neue Ausrüstung.
	AI_Output(self, other, "PC_Thief_NEEDTRAINING_Info_11_07"); //Nimm erstmal dieses Schwert. Bessere Waffen wirst du schon alleine auftreiben.

	B_GiveInvItems(self, hero, ItMw_RustySword, 1);
	_ = AI_EquipBestMeleeWeapon(hero);

	AI_Output(self, other, "PC_Thief_NEEDTRAINING_Info_11_08"); //Ich geb dir auch etwas Silber. Das ist die neue Währung hier, seit die Barriere weg ist.
	B_GiveInvItems(self, hero, ItMi_Silver, 30);

	AI_Output(self, other, "PC_Thief_NEEDTRAINING_Info_11_09"); //Es gibt hier viele Möglichkeiten etwas zu verdienen.
};

///////////////////////////////////////////////////////////////////////
//	Info WHYBOW
///////////////////////////////////////////////////////////////////////
instance PC_Thief_WHYBOW(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_WHYBOW_Condition;
	information		= PC_Thief_WHYBOW_Info;
	description		= "Wofür brauche ich Bogentalent?";
};

func int PC_Thief_WHYBOW_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_NEEDTRAINING))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_WHYBOW_Info()
{
	AI_Output(hero, self, "PC_Thief_WHYBOW_15_01"); //Wofür brauche ich Bogentalent?
	AI_Output(self, hero, "PC_Thief_WHYBOW_11_02"); //Je mehr Talent du im Umgang mit dieser Waffe erlernst, desto schneller kannst du Pfeile abfeuern.
	AI_Output(self, hero, "PC_Thief_WHYBOW_11_03"); //Ausserdem kann nur ein talentierter Bogenschütze ungeschütze Stellen treffen und so manchmal tiefere Wunden verursachen.
};

///////////////////////////////////////////////////////////////////////
//	Info WHYDEX
///////////////////////////////////////////////////////////////////////
instance PC_Thief_WHYDEX(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_WHYDEX_Condition;
	information		= PC_Thief_WHYDEX_Info;
	description		= "Wofür brauche ich Geschicklichkeit?";
};

func int PC_Thief_WHYDEX_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_NEEDTRAINING))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_WHYDEX_Info()
{
	AI_Output(hero, self, "PC_Thief_WHYDEX_15_01"); //Wofür brauche ich Geschicklichkeit?
	AI_Output(self, hero, "PC_Thief_WHYDEX_11_02"); //Je geschickter du bist, desto häufiger triffst du ein Ziel mit dem Bogen.
	AI_Output(self, hero, "PC_Thief_WHYDEX_11_03"); //Besonders ungeschickte Bogenschützen geben manchmal ein halbes Dutzend Schüsse ab, ohne ihr Ziel auch nur ein einziges Mal zu treffen.
	AI_Output(self, hero, "PC_Thief_WHYDEX_11_04"); //Die besseren Bögen sind darüberhinaus so schwer zu handhaben, dass nur sehr geschickte Schützen überhaupt damit umgehen können.
};

///////////////////////////////////////////////////////////////////////
//	Info STARTRAINING
///////////////////////////////////////////////////////////////////////
instance PC_Thief_STARTRAINING(C_Info)
{
	npc				= PC_Thief;
	nr				= 4;
	condition		= PC_Thief_STARTRAINING_Condition;
	information		= PC_Thief_STARTRAINING_Info;
	permanent		= TRUE;
	description		= "Ich will trainieren";
};

func int PC_Thief_STARTRAINING_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_NEEDTRAINING))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_STARTRAINING_Info()
{
	AI_Output(other, self, "PC_Thief_STARTRAINING_Info_15_01"); //Ich will trainieren.

	Info_ClearChoices(PC_Thief_STARTRAINING);
	Info_AddChoice(PC_Thief_STARTRAINING, DIALOG_BACK, PC_Thief_STARTRAINING_BACK);
	Info_AddChoice(PC_Thief_STARTRAINING, "Ich will geschickter werden", PC_Thief_STARTRAINING_DEX);
	if (Npc_GetTalentSkill(other, NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice(PC_Thief_STARTRAINING, B_BuildLearnString(NAME_LearnBow_1, LPCOST_TALENT_BOW_1, 0), PC_Thief_STARTRAINING_BOW1);
	};

	//-------- Bogenschiessen Talent 2 --------
	if ((LearnBow_1 == LOG_SUCCESS)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_BOW) == 1))
	{
		Info_AddChoice(PC_Thief_STARTRAINING, B_BuildLearnString(NAME_LearnBow_2, LPCOST_TALENT_BOW_2, 0), PC_Thief_STARTRAINING_BOW2);
	};
};

// Geschicklichkeit, Bogenschiessen
func void PC_Thief_STARTRAINING_BACK()
{
	Info_ClearChoices(PC_Thief_STARTRAINING);
};

func void PC_Thief_STARTRAINING_DEX()
{
	AI_Output(hero, self, "PC_Thief_STARTRAINING_DEX_15_01"); //Ich will geschickter werden.

	Info_ClearChoices(PC_Thief_STARTRAINING);
	Info_AddChoice(PC_Thief_STARTRAINING, DIALOG_BACK, PC_Thief_STARTRAINING_DEX_BACK);
	Info_AddChoice(PC_Thief_STARTRAINING, B_BuildLearnString(NAME_LearnDexterity_5, 5 * LPCOST_ATTRIBUTE_DEXTERITY, 0), PC_Thief_STARTRAINING_DEX_DEX_5);
	Info_AddChoice(PC_Thief_STARTRAINING, B_BuildLearnString(NAME_LearnDexterity_1, LPCOST_ATTRIBUTE_DEXTERITY, 0), PC_Thief_STARTRAINING_DEX_DEX_1);
};

func void PC_Thief_STARTRAINING_DEX_BACK()
{
	Info_ClearChoices(PC_Thief_STARTRAINING);
};

func void PC_Thief_STARTRAINING_DEX_DEX_1()
{
	B_BuyAttributePoints(hero, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(PC_Thief_STARTRAINING);
	Info_AddChoice(PC_Thief_STARTRAINING, DIALOG_BACK, PC_Thief_STARTRAINING_DEX_BACK);
	Info_AddChoice(PC_Thief_STARTRAINING, B_BuildLearnString(NAME_LearnDexterity_5, 5 * LPCOST_ATTRIBUTE_DEXTERITY, 0), PC_Thief_STARTRAINING_DEX_DEX_5);
	Info_AddChoice(PC_Thief_STARTRAINING, B_BuildLearnString(NAME_LearnDexterity_1, LPCOST_ATTRIBUTE_DEXTERITY, 0), PC_Thief_STARTRAINING_DEX_DEX_1);
};

func void PC_Thief_STARTRAINING_DEX_DEX_5()
{
	B_BuyAttributePoints(hero, ATR_DEXTERITY, 5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(PC_Thief_STARTRAINING);
	Info_AddChoice(PC_Thief_STARTRAINING, DIALOG_BACK, PC_Thief_STARTRAINING_DEX_BACK);
	Info_AddChoice(PC_Thief_STARTRAINING, B_BuildLearnString(NAME_LearnDexterity_5, 5 * LPCOST_ATTRIBUTE_DEXTERITY, 0), PC_Thief_STARTRAINING_DEX_DEX_5);
	Info_AddChoice(PC_Thief_STARTRAINING, B_BuildLearnString(NAME_LearnDexterity_1, LPCOST_ATTRIBUTE_DEXTERITY, 0), PC_Thief_STARTRAINING_DEX_DEX_1);
};

func void PC_Thief_STARTRAINING_BOW1()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{
		AI_Output(other, self, "PC_Thief_STARTRAINING_BOW1_15_01"); //Zeig mir den Umgang mit dem Bogen.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW1_11_02"); //Zunächst die Haltung. Es ist wichtig dass du sicheren Stand hast, wenn du ruhig schiessen willst.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW1_11_03"); //Visiere dein Ziel über den gestreckten Arm an.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW1_11_04"); //Dann spanne den Bogen mit ganzer Kraft. Lass das Ziel dabei nicht aus den Augen.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW1_11_05"); //Du wirst nicht mit jedem Schuss treffen. Aber je talentierter du bist, desto öfter triffst du.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW1_11_06"); //Soviel zur Theorie. Mal sehen, wie gut du mit dem Bogen umgehst.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW1_11_07"); //Draussen im Burghof ist die Mauer gebrochen. Auf dem Wehrgang und auf dem Vordach der Schmiede haben sich FLEISCHWANZEN eingenistet.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW1_11_08"); //Die Mistviecher machen die Mauern kaputt. Suche dir eine gute Position und erledige mindestens 5 Stück.

		// Auftrags "Monster" setzen
		Wld_InsertNpc(Acid_Meatbug_1, "FP_MEATBUG_SPAWN_05");
		Wld_InsertNpc(Acid_Meatbug_2, "FP_MEATBUG_SPAWN_06");
		Wld_InsertNpc(Acid_Meatbug_3, "FP_MEATBUG_SPAWN_06");
		Wld_InsertNpc(Acid_Meatbug_4, "FP_MEATBUG_SPAWN_13");
		Wld_InsertNpc(Acid_Meatbug_5, "FP_MEATBUG_SPAWN_14");
		Wld_InsertNpc(Acid_Meatbug_6, "FP_MEATBUG_SPAWN_15");
		Wld_InsertNpc(Acid_Meatbug_7, "FP_MEATBUG_SPAWN_13");
		Wld_InsertNpc(Acid_Meatbug_8, "FP_MEATBUG_SPAWN_14");
		Wld_InsertNpc(Acid_Meatbug_9, "FP_MEATBUG_SPAWN_15");

		// Log initialisieren und füllen : CH1_TrainBow_1

		LearnBow_1 = LOG_RUNNING;
		Log_CreateTopic(CH1_TrainBow_1, LOG_MISSION);
		Log_SetTopicStatus(CH1_TrainBow_1, LOG_RUNNING);
		B_LogEntry(CH1_TrainBow_1, CH1_TrainBow_1_1);
	};
};

//------------------------------------------------------------------------------------------------------------- //
instance PC_Thief_BOW1RUNNING(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_BOW1RUNNING_Condition;
	information		= PC_Thief_BOW1RUNNING_Info;
	description		= "Ich habe noch keinen Bogen";
};

func int PC_Thief_BOW1RUNNING_Condition()
{
	if (LearnBow_1 == LOG_RUNNING)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_BOW1RUNNING_Info()
{
	AI_Output(other, self, "PC_Thief_BOW1RUNNING_Info_15_01"); //Ich habe noch keinen Bogen. Womit soll ich sie erledigen?
	AI_Output(self, other, "PC_Thief_BOW1RUNNING_Info_11_02"); //Geh zu Helvegor am Marktplatz. Er kann dir bestimmt einen Bogen verkaufen.

	Log_CreateTopic(GE_TraderOC, LOG_NOTE);
	B_LogEntry(GE_TraderOC, GE_TraderOC_4);
};

//------------------------------------------------------------------------------------------------------------- //
// Genug MEatbugs für den Bogenauftrag sind tot
instance PC_Thief_BOW1SUCCESS(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_BOW1SUCCESS_Condition;
	information		= PC_Thief_BOW1SUCCESS_Info;
	permanent		= TRUE;
	description		= "Die Fleischwanzen knabbern nichts mehr an.";
};

func int PC_Thief_BOW1SUCCESS_Condition()
{
	// Meatbugs für den Auftrag initialisieren und Abfragen ob sie tot sind
	var C_Npc meatbug_1;
	meatbug_1 = Hlp_GetNpc(Acid_Meatbug_1);

	var C_Npc meatbug_2;
	meatbug_2 = Hlp_GetNpc(Acid_Meatbug_2);

	var C_Npc meatbug_3;
	meatbug_3 = Hlp_GetNpc(Acid_Meatbug_3);

	var C_Npc meatbug_4;
	meatbug_4 = Hlp_GetNpc(Acid_Meatbug_4);

	var C_Npc meatbug_5;
	meatbug_5 = Hlp_GetNpc(Acid_Meatbug_5);

	var C_Npc meatbug_6;
	meatbug_6 = Hlp_GetNpc(Acid_Meatbug_6);

	var C_Npc meatbug_7;
	meatbug_7 = Hlp_GetNpc(Acid_Meatbug_7);

	var C_Npc meatbug_8;
	meatbug_8 = Hlp_GetNpc(Acid_Meatbug_8);

	var C_Npc meatbug_9;
	meatbug_9 = Hlp_GetNpc(Acid_Meatbug_9);

	var int int_deadcounter;
	int_Deadcounter = 0;

	if (Npc_IsDead(meatbug_1))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_2))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_3))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_4))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_5))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_6))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_7))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_8))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_9))
	{
		int_deadcounter += 1;
	};

	// Genug Meatbugs tot und die Mission läuft
	if ((LearnBow_1 == LOG_RUNNING)
	&& (int_deadcounter >= 5))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_BOW1SUCCESS_Info()
{
	Info_ClearChoices(PC_Thief_BOW1SUCCESS);

	AI_Output(other, self, "PC_Thief_BOW1SUCCESS_Info_Ready_15_01"); //Die Fleischwanzen knabbern nichts mehr an.
	AI_Output(self, other, "PC_Thief_BOW1SUCCESS_Info_Ready_11_02"); //Ausgezeichnet.

	// Loghandling : CH1_TrainBow_1 / Experience vergeben / Mission auf erfüllt setzen
	LearnBow_1 = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_TrainBow_1, LOG_SUCCESS);
	B_LogEntry(CH1_TrainBow_1, CH1_TrainBow_1_2);
	B_GiveXP(XP_Bow1);
};

// Es sind noch nicht Genug MEatbugs für den Bogenauftrag tot
instance PC_Thief_BOW1RunningMeatBug(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_BOW1RunningMeatBug_Condition;
	information		= PC_Thief_BOW1RunningMeatBug_Info;
	permanent		= TRUE;
	description		= "Wo treiben sich die Meatbugs nochmal rum?";
};

func int PC_Thief_BOW1RunningMeatBug_Condition()
{
	// Meatbugs für den Auftrag initialisieren und Abfragen ob sie tot sind
	var C_Npc meatbug_1; meatbug_1 = Hlp_GetNpc(Acid_Meatbug_1);

	var C_Npc meatbug_2; meatbug_2 = Hlp_GetNpc(Acid_Meatbug_2);

	var C_Npc meatbug_3; meatbug_3 = Hlp_GetNpc(Acid_Meatbug_3);

	var C_Npc meatbug_4; meatbug_4 = Hlp_GetNpc(Acid_Meatbug_4);

	var C_Npc meatbug_5; meatbug_5 = Hlp_GetNpc(Acid_Meatbug_5);

	var C_Npc meatbug_6; meatbug_6 = Hlp_GetNpc(Acid_Meatbug_6);

	var C_Npc meatbug_7; meatbug_7 = Hlp_GetNpc(Acid_Meatbug_7);

	var C_Npc meatbug_8; meatbug_8 = Hlp_GetNpc(Acid_Meatbug_8);

	var C_Npc meatbug_9; meatbug_9 = Hlp_GetNpc(Acid_Meatbug_9);

	// Zähler für die toten Meatbugs
	var int int_deadcounter;
	int_Deadcounter = 0;

	if (Npc_IsDead(meatbug_1))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_2))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_3))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_4))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_5))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_6))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_7))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_8))
	{
		int_deadcounter += 1;
	};

	if (Npc_IsDead(meatbug_9))
	{
		int_deadcounter += 1;
	};

	// Zu wenig Meatbugs tot und die Mission läuft
	if ((LearnBow_1 == LOG_RUNNING)
	&& (int_deadcounter < 5))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_BOW1RunningMeatBug_Info()
{
	AI_Output(other, self, "PC_Thief_BOW1SUCCESS_Info_Running_15_01"); //Wo treiben sich die Meatbugs nochmal rum?
	AI_Output(self, other, "PC_Thief_BOW1SUCCESS_Info_Running_11_02"); //Hörst Du mir überhaupt zu? Auf dem Vordach der Schmiede und dem Wehrgang.
	AI_StopProcessInfos(self);
};

// Talentstufe 2 Bogenschießen
//	------- Die Scavengerfalle ---------

func void PC_Thief_STARTRAINING_BOW2()
{
	AI_Output(other, self, "PC_Thief_STARTRAINING_BOW2_15_01"); //Ich will Meister des Bogenschiessens werden.

	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW2_11_02"); //Sehr gut! Die Grundlagen kennst du ja schon. Kommen wir als zu den Feinheiten.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW2_11_03"); //Den ersten Schuss solltest du aus großer Entfernung abgeben, damit Du mehrere Treffer landen kannst, bevor der Gegner dich erreicht.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW2_11_04"); //Um auch weiter entfernte Ziele zu treffen, musst du höher zielen. Bewegt sich das Ziel seitlich, musst Du ausserdem vorhalten, damit es in deinen Schuss reinläuft.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW2_11_05"); //Wenn du das beachtest, wirst du ab jetzt viel öfter treffen.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW2_11_06"); //Ich hab auch eine Idee, wie du das Ganze üben kannst.
		AI_Output(self, other, "PC_Thief_STARTRAINING_BOW2_11_07"); //Vor dem Lager, in der Nähe der Brücke, treiben sich oft Molerats herum. Versuche 5 zu erlegen und bring mir das Fleisch.
		AI_Output(other, self, "PC_Thief_STARTRAINING_BOW2_15_08"); //Dann werd ich mich mal um die Biester kümmern.
		LearnBow_2 = LOG_RUNNING;

		// Auftragsmonster spawnen
		Wld_InsertNpc(Molerat, "OW_PATH_193");
		Wld_InsertNpc(Molerat, "OW_PATH_193");
		Wld_InsertNpc(Molerat, "OW_PATH_193");
		Wld_InsertNpc(Molerat, "OW_PATH_193");
		Wld_InsertNpc(Molerat, "OW_PATH_193");
		Wld_InsertNpc(Molerat, "OW_PATH_193");

		// Log für die Mission : CH1_TrainBow_2
		Log_CreateTopic(CH1_TrainBow_2, LOG_MISSION);
		Log_SetTopicStatus(CH1_TrainBow_2, LOG_RUNNING);
		B_LogEntry(CH1_TrainBow_2, CH1_TrainBow_2_1);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Bow2Running
///////////////////////////////////////////////////////////////////////
instance PC_Thief_BOW2RUNNING(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_BOW2RUNNING_Condition;
	information		= PC_Thief_BOW2RUNNING_Info;
	permanent		= TRUE;
	description		= "Gibt es noch etwas, daß ich über die Molerats wissen muß?";
};

func int PC_Thief_BOW2RUNNING_Condition()
{
	// Mission läuft und der Spieler hat noch nicht genug Fleisch ?
	if ((LearnBow_2 == LOG_RUNNING)
	&& (Npc_HasItems(other, ItFo_MuttonRaw) < 10))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_BOW2RUNNING_Info()
{
	AI_Output(hero, self, "PC_Thief_BOW2RUNNING_15_01"); //Gibt es noch etwas, daß ich über die Molerats wissen muß?
	AI_Output(self, hero, "PC_Thief_BOW2RUNNING_11_02"); //Sie sind langsam und können nicht klettern. Sollte nicht so schwer werden, ein paar zu erlegen, wenn Du vorsichtig bist.
};

//------------------------------------------------------------------------------------------------------------- //
// Der Spieler hat das Fleisch der Molerats besorgt
instance PC_Thief_BOW2SUCCESS(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_BOW2SUCCESS_Condition;
	information		= PC_Thief_BOW2SUCCESS_Info;
	description		= "Ich hab das Fleisch der Molerats";
};

func int PC_Thief_BOW2SUCCESS_Condition()
{
	// Das Fleisch (der Molerats) ist vorhanden und die Mission läuft ?
	if ((LearnBow_2 == LOG_RUNNING)
	&& (Npc_HasItems(other, ItFo_MuttonRaw) >= 10))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_BOW2SUCCESS_Info()
{
	AI_Output(other, self, "PC_Thief_BOW2SUCCESS_Info_15_01"); //Ich hab das Fleisch der Molerats
	AI_Output(self, other, "PC_Thief_BOW2SUCCESS_Info_11_02"); //Gute Arbeit. Du bist schon wieder besser in Form!
	AI_Output(other, self, "PC_Thief_BOW2SUCCESS_Info_15_03"); //Wenn ich mit meinem Trainig fertig bin, kann ich überall als Kammerjäger anheuern.

	B_GiveInvItems(other, self, ItFo_MuttonRaw, 10);
	// Loghandling : CH1_TrainBow_2 / Experience vergeben / Mission auf erfüllt setzen
	LearnBow_2 = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_TrainBow_2, LOG_SUCCESS);
	B_LogEntry(CH1_TrainBow_2, CH1_TrainBow_2_2);
	B_GiveXP(XP_Bow2);
};

//------------------------------------------------------------------------------------------------------------- //
instance PC_Thief_STARTRAINING_THIEF(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_STARTRAINING_THIEF_Condition;
	information		= PC_Thief_STARTRAINING_THIEF_Info;
	description		= "Ich möchte Diebes-Talente lernen.";
};

func int PC_Thief_STARTRAINING_THIEF_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_NEEDTRAINING))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_STARTRAINING_THIEF_Info()
{
	AI_Output(other, self, "PC_Thief_STARTRAINING_THIEF_Info_15_01"); //Ich möchte Diebes-Talente lernen.
	AI_Output(self, other, "PC_Thief_STARTRAINING_THIEF_Info_11_02"); //Schleichen, Schlösser knacken, Taschendiebstahl? Aus der Nummer bin ich raus. Muß dafür sorgen, daß hier im Lager ein paar Regeln eingehalten werden.
	AI_Output(self, other, "PC_Thief_STARTRAINING_THIEF_Info_11_03"); //Es gibt aber jemanden, der dir weiterhelfen könnte. Gerion. Du findest ihn irgendwo in der Gegend des hinteren Tores.

	Log_CreateTopic(GE_TeacheroC, LOG_NOTE);
	B_LogEntry(GE_TeacheroC, GE_TeacheroC_4);
};

///////////////////////////////////////////////////////////////////////
//	Info GERIONTHIEF
///////////////////////////////////////////////////////////////////////
instance PC_Thief_GERIONTHIEF(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_GERIONTHIEF_Condition;
	information		= PC_Thief_GERIONTHIEF_Info;
	description		= "Und wenn Gerion mir nicht helfen will?";
};

func int PC_Thief_GERIONTHIEF_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_STARTRAINING_THIEF))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_GERIONTHIEF_Info()
{
	var C_Npc Berengar; Berengar = Hlp_GetNpc(MIL_103_Berengar);

	AI_Output(hero, self, "PC_Thief_GERIONTHIEF_15_01"); //Und wenn Gerion mir nicht helfen will?
	AI_Output(self, hero, "PC_Thief_GERIONTHIEF_11_02"); //Sag ihm, daß du mir von seinen kleinen Raubzügen erzählen könntest, wenn er dir nicht hilft.
	AI_Output(hero, self, "PC_Thief_GERIONTHIEF_15_03"); //Du weißt, daß er ein Dieb ist?
	AI_Output(self, hero, "PC_Thief_GERIONTHIEF_11_04"); //Natürlich! Aber er weiß nicht, daß ich es weiß!
	AI_Output(self, hero, "PC_Thief_GERIONTHIEF_11_05"); //Manchmal ist es eben besser nichts zu unternehmen.
	AI_Output(hero, self, "PC_Thief_GERIONTHIEF_15_06"); //Stimmt, mir hast du damit geholfen!
	AI_Output(self, hero, "PC_Thief_GERIONTHIEF_11_07"); //Das ist aber kein Freibrief die Regeln zu brechen! Wenn du krumme Dinger machst, laß dich wenigstens nicht erwischen!
};

//#####################################################################
//##
//##
//##		Botschaft von XARDAS  -> Übergang zum 2. Kapitel
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info XARDASLETTER
///////////////////////////////////////////////////////////////////////
instance PC_Thief_XARDASLETTER(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_XARDASLETTER_Condition;
	information		= PC_Thief_XARDASLETTER_Info;
	description		= "Xardas gab mir eine Botschaft für dich mit!";
};

func int PC_Thief_XARDASLETTER_Condition()
{
	if ((Npc_HasItems(hero, ItWr_Xardas_Letter_Sealed) || Npc_HasItems(hero, ItWr_Xardas_Letter))
	&& (chapter == 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_XARDASLETTER_Info()
{
	AI_Output(hero, self, "PC_Thief_XARDASLETTER_15_01"); //Xardas gab mir eine Botschaft für dich mit!
	AI_Output(self, hero, "PC_Thief_XARDASLETTER_11_02"); //Xardas...? Eine Botschaft...? Für mich...?
	AI_Output(hero, self, "PC_Thief_XARDASLETTER_15_03"); //Ja hier ist sie!
	if (Npc_HasItems(hero, ItWr_Xardas_Letter_Sealed))
	{
		B_GiveInvItems(hero, self, ItWr_Xardas_Letter_Sealed, 1);
		B_UseFakeScroll();
		AI_Output(self, hero, "PC_Thief_XARDASLETTER_11_04"); //Hmmm....
		AI_Output(self, hero, "PC_Thief_XARDASLETTER_11_05"); //Sieht verdammt übel aus. Hier, lies selbst!
		B_GiveInvItems(self, hero, ItWr_Xardas_Letter, 1);
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GiveInvItems(hero, self, ItWr_Xardas_Letter, 1);
		B_UseFakeScroll();
		AI_Output(self, hero, "PC_Thief_XARDASLETTER_11_06"); //Offenbar hast du die Nachricht schon gelesen! Dann weisst du ja Bescheid.
		B_GiveInvItems(self, hero, ItWr_Xardas_Letter, 1);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WHATNOW
///////////////////////////////////////////////////////////////////////
instance PC_Thief_WHATNOW(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_WHATNOW_Condition;
	information		= PC_Thief_WHATNOW_Info;
	description		= "Was meint Xardas mit ...wenn ich bereit bin... ?";
};

func int PC_Thief_WHATNOW_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_XARDASLETTER)
	&& Diego_LetterRead
	&& (chapter == 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_WHATNOW_Info()
{
	AI_Output(hero, self, "PC_Thief_WHATNOW_15_01"); //Was meint Xardas mit ...wenn ich bereit bin... ?

	if (hero.level < HERO_LEVEL_CH2)
	{
		AI_Output(self, hero, "PC_Thief_WHATNOW_11_02"); //Du musst erst mal wieder in Form kommen, sonst bist du Futter da draussen!
		AI_Output(self, hero, "PC_Thief_WHATNOW_11_03"); //Ich werde dich schon bald brauchen. Es gibt einfach zu wenig gute Leute hier!
		AI_Output(hero, self, "PC_Thief_WHATNOW_15_04"); //Und ich dachte, dieser ganze Mist sei endgültig vorbei!
		AI_Output(self, hero, "PC_Thief_WHATNOW_11_05"); //Wohl kaum! Erst die Orks und nun kommen auch noch Dämonen dazu! Schöne Scheisse!
		AI_Output(self, hero, "PC_Thief_WHATNOW_11_06"); //Wenn das durchsickert ist hier im Lager die Hölle los. Die Leute machen sich ja schon wegen der Orks in die Hose...
		AI_Output(self, hero, "PC_Thief_WHATNOW_11_07"); //Also schau zu, dass du wieder fit wirst und trainiere soviel du nur kannst.
		B_LogEntry(CH1_DemonThreat, CH1_DemonThreat_6);
	}
	else
	{
		AI_Output(self, hero, "PC_Thief_WHATNOW_11_08"); //Wie ich sehe, bist du gut in Form für jemanden der so lange tot und begraben war. Ich glaube du hast da draussen jetzt wieder eine Chance.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info ITSOK
///////////////////////////////////////////////////////////////////////
instance PC_Thief_ITSOK(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_ITSOK_Condition;
	information		= PC_Thief_ITSOK_Info;
	permanent		= TRUE;
	description		= "Bereit oder nicht! Ich kann dir helfen...";
};

func int PC_Thief_ITSOK_Condition()
{
	if ((Npc_KnowsInfo(hero, PC_Thief_WHATNOW) || (chapter == 2))
	&& (hero.level < HERO_LEVEL_CH2))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_ITSOK_Info()
{
	AI_Output(hero, self, "PC_Thief_ITSOK_15_01"); //Bereit oder nicht! Ich kann dir helfen...
	AI_Output(self, hero, "PC_Thief_ITSOK_11_02"); //Sie dich doch an. Du wirst ja nicht mal mehr mit einem Rudel Snapper fertig und wir werden es bald mit Dämonen zu tun bekommen.
	AI_Output(self, hero, "PC_Thief_ITSOK_11_03"); //Lerne und trainiere so viel wie möglich hier im Lager, sonst bist du nicht mehr als Futter für die Wölfe.
	AI_Output(self, hero, "PC_Thief_ITSOK_11_04"); //Wenn du erfahren genug bist, komm zu mir zurück.
	B_PrintLevelTooLow(HERO_LEVEL_CH2);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info IAMREADY
///////////////////////////////////////////////////////////////////////
instance PC_Thief_IAMREADY(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_IAMREADY_Condition;
	information		= PC_Thief_IAMREADY_Info;
	description		= "Ich bin wieder in Form. Es kann losgehen!";
};

func int PC_Thief_IAMREADY_Condition()
{
	if ((Npc_KnowsInfo(hero, PC_Thief_WHATNOW) || (chapter == 2))
	&& (hero.level >= HERO_LEVEL_CH2))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_IAMREADY_Info()
{
	AI_Output(hero, self, "PC_Thief_IAMREADY_15_01"); //Ich bin wieder in Form. Es kann losgehen!
	AI_Output(self, hero, "PC_Thief_IAMREADY_11_02"); //Gut, denn ich brauche dich jetzt!
	AI_Output(hero, self, "PC_Thief_IAMREADY_15_03"); //Worum geht es?
	AI_Output(self, hero, "PC_Thief_IAMREADY_11_05"); //Milten, unser alter Freund, ist bei den Feuermagiern in der Bergfestung.
	AI_Output(hero, self, "PC_Thief_IAMREADY_15_06"); //Milten ist hier?
	AI_Output(self, hero, "PC_Thief_IAMREADY_11_07"); //Ja! Wenn es stimmt, was Xardas schreibt, brauchen wir hier im Lager sehr bald seine Hilfe.
	AI_Output(self, hero, "PC_Thief_IAMREADY_11_04"); //Ich habe keine Ahnung von Dämonen und ausserdem kann ich auch nicht von hier weg.
	AI_Output(self, hero, "PC_Thief_IAMREADY_11_08"); //Geh in die Bergfestung und sprich mit Milten über Xardas' Warnung. Er wird dir zuhören.
	AI_Output(self, hero, "PC_Thief_IAMREADY_11_09"); //Du musst einen Weg finden, diese dämonische Brut aufzuhalten.

	Log_CreateTopic(CH1_Demonthreat, LOG_MISSION);
	Log_SetTopicStatus(CH1_Demonthreat, LOG_RUNNING);
	B_LogEntry(CH1_DemonThreat, CH1_DemonThreat_7);
};

///////////////////////////////////////////////////////////////////////
//	Info PROBLEM
///////////////////////////////////////////////////////////////////////
instance PC_Thief_PROBLEM(C_Info)
{
	npc				= PC_Thief;
	nr				= 0;
	condition		= PC_Thief_PROBLEM_Condition;
	information		= PC_Thief_PROBLEM_Info;
	description		= "Sieht aus, als ob ich meine alte Arbeit zurück habe!";
};

func int PC_Thief_PROBLEM_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_IAMREADY))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Thief_PROBLEM_Info()
{
	AI_Output(hero, self, "PC_Thief_PROBLEM_15_01"); //(sarkastisch) Sieht aus, als ob ich meine alte Arbeit zurück habe!
	AI_Output(self, hero, "PC_Thief_PROBLEM_11_02"); //(grinst) Das Leben ist hart und ungerecht...
	AI_Output(self, hero, "PC_Thief_PROBLEM_11_03"); //(wieder ernst) Allerdings gibt es da noch ein Problem!
	AI_Output(hero, self, "PC_Thief_PROBLEM_15_04"); //(ironisch) Wiese wundert mich das nicht?
	AI_Output(self, hero, "PC_Thief_PROBLEM_11_05"); //Rhobars' Paladine haben die Bergfestung völlig abgeschottet.
	AI_Output(self, hero, "PC_Thief_PROBLEM_11_06"); //Nicht mal eine Fleischwanze würde es schaffen, auch nur einen Fuss in das Gemäuer zu setzen.
	AI_Output(hero, self, "PC_Thief_PROBLEM_15_07"); //Wie komme ich dann hinein?
	AI_Output(self, hero, "PC_Thief_PROBLEM_11_08"); //Thora ist eine Kundschafterin der Paladine.
	AI_Output(self, hero, "PC_Thief_PROBLEM_11_09"); //Wenn dich jemand in die Festung bringen kann, dann ist sie es.
	AI_Output(hero, self, "PC_Thief_PROBLEM_15_10"); //Ich werde mit ihr sprechen. Wir sehen uns wieder!
	AI_Output(self, hero, "PC_Thief_PROBLEM_11_11"); //Viel Erfolg, mein Freund!

	B_LogEntry(CH1_DemonThreat, CH1_DemonThreat_8);

	B_KapitelWechsel(2);
};
