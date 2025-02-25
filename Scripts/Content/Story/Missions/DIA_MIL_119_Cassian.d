instance Mil_119_Cassian_Exit(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 999;
	condition		= Mil_119_Cassian_Exit_Condition;
	information		= Mil_119_Cassian_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Mil_119_Cassian_Exit_Condition()
{
	return TRUE;
};

func void Mil_119_Cassian_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TRAIN
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_HI(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 12;
	condition		= Mil_119_Cassian_HI_Condition;
	information		= Mil_119_Cassian_HI_Info;
	description		= "Was machst du hier?";
};

func int Mil_119_Cassian_HI_Condition()
{
	return TRUE;
};

func void Mil_119_Cassian_HI_Info()
{
	AI_Output(hero, self, "Mil_119_HI_15_01"); //Was machst du hier?
	AI_Output(self, hero, "Mil_119_HI_08_02"); //Ich bin Cassian, erster Leutnant der Miliz.
	AI_Output(self, hero, "Mil_119_HI_08_03"); //Ich sorge dafür, das niemand die Reglen des Lagers bricht.
	AI_Output(self, hero, "Mil_119_HI_08_04"); //Und ich sorge dafür das die, die es doch tun, es nie wieder tun werden.
};

///////////////////////////////////////////////////////////////////////
//	Info BEGINTRAIN
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_BEGINTRAIN(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 0;
	condition		= Mil_119_Cassian_BEGINTRAIN_Condition;
	information		= Mil_119_Cassian_BEGINTRAIN_Info;
	description		= "Diego sagte mir, du trainierst Kämpfer?";
};

func int Mil_119_Cassian_BEGINTRAIN_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_NEEDTRAINING)
	&& Npc_KnowsInfo(hero, Mil_119_Cassian_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_BEGINTRAIN_Info()
{
	if (Npc_KnowsInfo(hero, MIL_103_Berengar_ABOUT))
	{
		AI_Output(hero, self, "Mil_119_BEGINTRAIN_15_01"); //Hauptmann Berengar sagte mir, du trainierst Kämpfer?
	}
	else
	{
		AI_Output(hero, self, "Mil_119_BEGINTRAIN_15_02"); //Diego sagte mir, du trainierst Kämpfer?
	};

	AI_Output(self, hero, "Mil_119_BEGINTRAIN_08_03"); //Das ist richtig. Ich sorge dafür, dass die Milizsoldaten kräftig genug sind, wenn die Orks kommen.
	AI_Output(self, hero, "Mil_119_BEGINTRAIN_08_04"); //Und sie werden kommen...
	AI_Output(self, hero, "Mil_119_BEGINTRAIN_08_05"); //Ich kann auch dir zeigen wie du deine Stärke und dein Talent im Umgang mit dem Einhänder verbesserst.
	AI_Output(self, hero, "Mil_119_BEGINTRAIN_08_06"); //Aber im Gegenzug wirst du einige Aufgaben für mich erledigen. Wenn du einverstanden bist, können wir gleich loslegen.
};

///////////////////////////////////////////////////////////////////////
//	Info WHYSTR
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_WHYSTR(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 0;
	condition		= Mil_119_Cassian_WHYSTR_Condition;
	information		= Mil_119_Cassian_WHYSTR_Info;
	description		= "Wofür benötige ich Stärke?";
};

func int Mil_119_Cassian_WHYSTR_Condition()
{
	if (Npc_KnowsInfo(hero, Mil_119_Cassian_BEGINTRAIN))
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_WHYSTR_Info()
{
	AI_Output(hero, self, "Mil_119_WHYSTR_15_01"); //Wofür benötige ich Stärke?
	AI_Output(self, hero, "Mil_119_WHYSTR_08_02"); //Je stärker du bist, desto tiefere Wunden verursachst du mit Nahkampfwaffen.
	AI_Output(self, hero, "Mil_119_WHYSTR_08_03"); //Wenn dir erst einmal ein gut gerüsteter Ork gegenübersteht, dann wirst du ihn nur mit grosser Stärke verwunden können.
	AI_Output(self, hero, "Mil_119_WHYSTR_08_04"); //Dazu kommt, dass vor allem die grösseren Nahkampfwaffen so schwer sind, dass du sie nur mit hoher Stärke schwingen kannst.
};

///////////////////////////////////////////////////////////////////////
//	Info WHY1HAND
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_WHY1HAND(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 0;
	condition		= Mil_119_Cassian_WHY1HAND_Condition;
	information		= Mil_119_Cassian_WHY1HAND_Info;
	description		= "Was nützt mir Talent im Umgang mit Einhändern?";
};

func int Mil_119_Cassian_WHY1HAND_Condition()
{
	if (Npc_KnowsInfo(hero, Mil_119_Cassian_BEGINTRAIN))
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_WHY1HAND_Info()
{
	AI_Output(hero, self, "Mil_119_WHY1HAND_15_01"); //Was nützt mir Talent im Umgang mit Einhändern?
	AI_Output(self, hero, "Mil_119_WHY1HAND_08_02"); //Je mehr Talent du erlernt hast, desto schneller kannst du mit solchen Waffen zuschlagen.
	AI_Output(self, hero, "Mil_119_WHY1HAND_08_03"); //Talentierte Kämfper können ihre Gegner mit blitzschnellen Schlagkombinationen derart bedrängen, dass diese nicht mehr mal zum Parrieren geschweige denn zum Angreifen kommen.
	AI_Output(self, hero, "Mil_119_WHY1HAND_08_04"); //Ausserdem wissen nur talentierte Kämpfer, wie sie ungeschütze stellen des Gegners treffen, und so manchmal viel tiefere Wunden reissen als sonst.
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_Teach(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 10;
	condition		= Mil_119_Cassian_Teach_Condition;
	information		= Mil_119_Cassian_Teach_Info;
	permanent		= TRUE;
	description		= "Ich will stärker werden";
};

func int Mil_119_Cassian_Teach_Condition()
{
	if (Npc_KnowsInfo(other, Mil_119_Cassian_BEGINTRAIN))
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_Teach_Info()
{
	AI_Output(other, self, "Mil_119_Cassian_Teach_15_01"); //Ich will stärker werden.

	Info_ClearChoices(Mil_119_Cassian_Teach);
	Info_AddChoice(Mil_119_Cassian_Teach, DIALOG_BACK, Mil_119_Cassian_Teach_BACK);
	Info_AddChoice(Mil_119_Cassian_Teach, B_BuildLearnString(NAME_LearnStrength_5, 5 * LPCOST_ATTRIBUTE_STRENGTH, 0), Mil_119_Cassian_Teach_STR_5);
	Info_AddChoice(Mil_119_Cassian_Teach, B_BuildLearnString(NAME_LearnStrength_1, LPCOST_ATTRIBUTE_STRENGTH, 0), Mil_119_Cassian_Teach_STR_1);
};

func void Mil_119_Cassian_Teach_BACK()
{
	Info_ClearChoices(Mil_119_Cassian_Teach);
};

func void Mil_119_Cassian_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Mil_119_Cassian_Teach);
	Info_AddChoice(Mil_119_Cassian_Teach, DIALOG_BACK, Mil_119_Cassian_Teach_BACK);
	Info_AddChoice(Mil_119_Cassian_Teach, B_BuildLearnString(NAME_LearnStrength_5, 5 * LPCOST_ATTRIBUTE_STRENGTH, 0), Mil_119_Cassian_Teach_STR_5);
	Info_AddChoice(Mil_119_Cassian_Teach, B_BuildLearnString(NAME_LearnStrength_1, LPCOST_ATTRIBUTE_STRENGTH, 0), Mil_119_Cassian_Teach_STR_1);
};

func void Mil_119_Cassian_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Mil_119_Cassian_Teach);
	Info_AddChoice(Mil_119_Cassian_Teach, DIALOG_BACK, Mil_119_Cassian_Teach_BACK);
	Info_AddChoice(Mil_119_Cassian_Teach, B_BuildLearnString(NAME_LearnStrength_5, 5 * LPCOST_ATTRIBUTE_STRENGTH, 0), Mil_119_Cassian_Teach_STR_5);
	Info_AddChoice(Mil_119_Cassian_Teach, B_BuildLearnString(NAME_LearnStrength_1, LPCOST_ATTRIBUTE_STRENGTH, 0), Mil_119_Cassian_Teach_STR_1);
};

///////////////////////////////////////////////////////////////////////
//	Info TRAIN
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_TRAIN(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 10;
	condition		= Mil_119_Cassian_TRAIN_Condition;
	information		= Mil_119_Cassian_TRAIN_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1, 0);
};

func int Mil_119_Cassian_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero, Mil_119_Cassian_BEGINTRAIN)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0))
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_TRAIN_Info()
{
	AI_Output(other, self, "Mil_119_Cassian_TRAIN_15_01"); //Zeig mir den Kampf mit einhändigen Waffen.

	if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
	{
		AI_Output(self, other, "Mil_119_Cassian_TRAIN_08_02"); //Zunächst halte die Waffe mit einer Hand. Dadurch kannst du schneller zuschlagen.
		AI_Output(self, other, "Mil_119_Cassian_TRAIN_08_03"); //Mit weiten Seitenhieben kannst du dir gefährliche Gegner vom Hals halten.
		AI_Output(self, other, "Mil_119_Cassian_TRAIN_08_04"); //Und mit einer Kombination von Schlägen kannst du gezielte Attacken durchführen.
		AI_Output(self, other, "Mil_119_Cassian_TRAIN_08_05"); //Das wichtigste ist, das du Kampferfahrung sammelst. Da habe ich auch direkt die erste Gelegenheit für dich.
		AI_Output(other, self, "Mil_119_Cassian_TRAIN_15_06"); //Lass hören.
		AI_Output(self, other, "Mil_119_Cassian_TRAIN_08_07"); //Du mußt wissen, das es hier im Lager einige Herumtreiber gibt. Faule Hunde, die sich einen Dreck um die Gemeinschaft des Lagers scheren.
		AI_Output(self, other, "Mil_119_Cassian_TRAIN_08_08"); //Huldrych ist einer von ihnen. Er wurde beobachtet, wie er sich an den Vorräten des Händlers Agon bedient hat.
		AI_Output(other, self, "Mil_119_Cassian_TRAIN_15_09"); //Und meine Aufgabe ist ...
		AI_Output(self, other, "Mil_119_Cassian_TRAIN_08_10"); //Deine Aufgabe ist es, Huldrych das gestohlene Zeug wieder abzunehmen. Verpass ihm eine Lektion. Aber LASS IHM AM LEBEN!

		Log_CreateTopic(CH1_Train1h, LOG_MISSION);
		Log_SetTopicStatus(CH1_Train1h, LOG_RUNNING);
		B_LogEntry(CH1_Train1h, CH1_Train1h_1);

		Cassian_BeatHudrych = LOG_RUNNING;

		// Diebesgut Huldrych in die Tasche stecken
		var C_Npc Huldrych;
		Huldrych = Hlp_GetNpc(THF_401_Huldrych);
		CreateInvItems(Huldrych, ItMi_Silver, 100);
		Huldrych.guild = GIL_NONE;

		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WHILEHULDRYCH
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_WHILEHULDRYCH(C_Info)
{
	npc				= Mil_119_Cassian;
	condition		= Mil_119_Cassian_WHILEHULDRYCH_Condition;
	information		= Mil_119_Cassian_WHILEHULDRYCH_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int Mil_119_Cassian_WHILEHULDRYCH_Condition()
{
	if (Cassian_BeatHudrych == LOG_RUNNING
	&& C_NPCisinvincible(hero)
	&& !Npc_KnowsInfo(hero, WRK_225_Agon_STOLEN))
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_WHILEHULDRYCH_Info()
{
	AI_Output(self, hero, "Mil_119_Cassian_WHILEHULDRYCH_08_01"); //Vielleicht solltest du zuerst mit Agon sprechen, bevor du zu Huldrych gehst.

	B_LogEntry(CH1_Train1h, CH1_Train1h_2);
	Info_ClearChoices(Mil_119_Cassian_WHILEHULDRYCH);
};

///////////////////////////////////////////////////////////////////////
//	Info FIRSTMISSION
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_FIRSTMISSION(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 0;
	condition		= Mil_119_Cassian_FIRSTMISSION_Condition;
	information		= Mil_119_Cassian_FIRSTMISSION_Info;
	description		= "Huldrych hat seine Lektion erhalten";
};

func int Mil_119_Cassian_FIRSTMISSION_Condition()
{
	var C_Npc Huldrych;
	Huldrych = Hlp_GetNpc(THF_401_Huldrych);

	if ((Huldrych.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	&& Cassian_BeatHudrych == LOG_RUNNING
	&& !Npc_IsDead(Huldrych))
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_FIRSTMISSION_Info()
{
	AI_Output(other, self, "Mil_119_Cassian_FIRSTMISSION_Info_15_01"); //Huldrych hat seine Lektion erhalten
	AI_Output(self, other, "Mil_119_Cassian_FIRSTMISSION_Info_08_02"); //Saubere Arbeit. Hoffentlich lernt er daraus.

	var C_Npc Huldrych;
	Huldrych = Hlp_GetNpc(THF_401_Huldrych);

	Cassian_BeatHudrych = LOG_SUCCESS;
	Huldrych.guild = GIL_THIEF;

	B_GiveXP(XP_HuldrychLektion);

	Log_SetTopicStatus(CH1_Train1h, LOG_SUCCESS);
	B_LogEntry(CH1_Train1h, CH1_Train1h_3);
};

///////////////////////////////////////////////////////////////////////
//	Info HULDRYCHDEAD
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_HULDRYCHDEAD(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 0;
	condition		= Mil_119_Cassian_HULDRYCHDEAD_Condition;
	information		= Mil_119_Cassian_HULDRYCHDEAD_Info;
	description		= "Huldrych hat...äh seine Lektion endgültig verstanden";
};

func int Mil_119_Cassian_HULDRYCHDEAD_Condition()
{
	var C_Npc Huldrych;
	Huldrych = Hlp_GetNpc(THF_401_Huldrych);

	if (Npc_IsDead(Huldrych)
	&& Cassian_BeatHudrych == LOG_RUNNING)
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_HULDRYCHDEAD_Info()
{
	AI_Output(other, self, "Mil_119_Cassian_HULDRYCHDEAD_Info_15_01"); //Huldrych hat...äh seine Lektion endgültig verstanden.
	AI_Output(self, other, "Mil_119_Cassian_HULDRYCHDEAD_Info_08_02"); //Du hast ihn umgebracht. Hatte ich dir nicht gesagt, du sollst ihn nicht umbringen?
	AI_Output(self, other, "Mil_119_Cassian_HULDRYCHDEAD_Info_08_03"); //Das oberste Gesetz hier im Lager lautete: KEIN MORD! Ein Mord ist ein Grund jemanden aus dem Lager zu verweisen!
	AI_Output(self, other, "Mil_119_Cassian_HULDRYCHDEAD_Info_08_04"); //Wenn du noch einmal jemanden tötest, dann kann dir keiner helfen. Nicht mal Diego, Lester oder ich. Bei aller Freundschaft nicht.

	Cassian_BeatHudrych = LOG_FAILED;
	Log_SetTopicStatus(CH1_Train1h, LOG_FAILED);
	B_LogEntry(CH1_Train1h, CH1_Train1h_4);
};

///////////////////////////////////////////////////////////////////////
//	Info AGONSSILVER
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_AGONSSILVER(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 0;
	condition		= Mil_119_Cassian_AGONSSILVER_Condition;
	information		= Mil_119_Cassian_AGONSSILVER_Info;
	description		= "Agon hat sein Silber wieder";
};

func int Mil_119_Cassian_AGONSSILVER_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_225_Agon_100))
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_AGONSSILVER_Info()
{
	AI_Output(other, self, "Mil_119_Cassian_AGONSSILVER_Info_15_01"); //Agon hat sein Silber wieder.
	AI_Output(self, other, "Mil_119_Cassian_AGONSSILVER_Info_08_02"); //Gut gemacht. Da wird der knausrige Kerl sich aber freuen.
	B_GiveXP(XP_AgonSilver);
};

///////////////////////////////////////////////////////////////////////
//	Info HULDRYCHDEAL
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_HULDRYCHDEAL(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 15;
	condition		= Mil_119_Cassian_HULDRYCHDEAL_Condition;
	information		= Mil_119_Cassian_HULDRYCHDEAL_Info;
	description		= "Huldrych hat bekommen, was er verdient!";
};

func int Mil_119_Cassian_HULDRYCHDEAL_Condition()
{
	var C_Npc Huldrych;
	Huldrych = Hlp_GetNpc(THF_401_Huldrych);

	if (!Huldrych.aivar[AIV_WASDEFEATEDBYSC]
	&& (Cassian_BeatHudrych == LOG_RUNNING)
	&& !Npc_IsDead(Huldrych)
	&& Huldrych_Away)
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_HULDRYCHDEAL_Info()
{
	AI_Output(hero, self, "Mil_119_Cassian_HULDRYCHDEAL_15_01"); //Huldrych hat bekommen, was er verdient!
	AI_Output(self, hero, "Mil_119_Cassian_HULDRYCHDEAL_08_02"); //Ich hoffe du hast ihn nicht zu hart rangenommen.
	AI_Output(hero, self, "Mil_119_Cassian_HULDRYCHDEAL_15_03"); //Er hat es verstanden.
	AI_Output(self, hero, "Mil_119_Cassian_HULDRYCHDEAL_08_04"); //Und du weißt jetzt auch, wie die Dinge hier laufen.

	var C_Npc Huldrych;
	Huldrych = Hlp_GetNpc(THF_401_Huldrych);

	Cassian_BeatHudrych = LOG_SUCCESS;
	Huldrych.guild = GIL_THIEF;

	B_GiveXP(XP_HuldrychDeal);

	Log_SetTopicStatus(CH1_Train1h, LOG_SUCCESS);
	B_LogEntry(CH1_Train1h, CH1_Train1h_5);
};

///////////////////////////////////////////////////////////////////////
//	Info LEARN1HST2
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_LEARN1HST2(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 0;
	condition		= Mil_119_Cassian_LEARN1HST2_Condition;
	information		= Mil_119_Cassian_LEARN1HST2_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2, 0);
};

func int Mil_119_Cassian_LEARN1HST2_Condition()
{
	if (((Cassian_BeatHudrych == LOG_SUCCESS) || (Cassian_BeatHudrych == LOG_FAILED))
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_LEARN1HST2_Info()
{
	AI_Output(hero, self, "Mil_119_Cassian_LEARN1HST2_15_01"); //Zeig mir mehr über den Kampf mit einhändigen Waffen.

	if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
	{
		AI_Output(self, hero, "Mil_119_Cassian_LEARN1HST2_08_02"); //Durch die Meisterschaft des einhändigen Kampfes schlägst du schneller und härter zu.
		AI_Output(self, hero, "Mil_119_Cassian_LEARN1HST2_08_03"); //Deine Angriffskombinationen werden geschikter und präziser.
		AI_Output(self, hero, "Mil_119_Cassian_LEARN1HST2_08_04"); //Und die Chance einen kritischen Treffer zu landen wird größer.
		AI_Output(self, hero, "Mil_119_Cassian_LEARN1HST2_08_05"); //Aber es ist der Verstand, der einen guten von einem schlechten Kämpder unterscheidet.
		AI_Output(self, hero, "Mil_119_Cassian_LEARN1HST2_08_06"); //Erkenne die Situation, bewahre einen kühlen Kopf und handel umsichtig.
		AI_Output(self, hero, "Mil_119_Cassian_LEARN1HST2_08_07"); //Denn nur wer die Situation versteht, kann sie lenken und kontrollieren.

		Mil_119_Cassian_LEARN1HST2.permanent = FALSE;
		Cassian_Info = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_JOB(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 33;
	condition		= Mil_119_Cassian_JOB_Condition;
	information		= Mil_119_Cassian_JOB_Info;
	description		= "Hast du noch eine Aufgabe für mich?";
};

func int Mil_119_Cassian_JOB_Condition()
{
	if (Cassian_Info)
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_JOB_Info()
{
	AI_Output(hero, self, "Mil_119_JOB_15_01"); //Hast du noch eine Aufgabe für mich?
	AI_Output(self, hero, "Mil_119_JOB_08_02"); //Ich nicht, aber Agon hat braucht einen Kämpfer, der ihn beschützt.
	AI_Output(self, hero, "Mil_119_JOB_08_03"); //Wir versuchen das Gebiet um das Lager herum besetzt zu halten, aber es gibt immer wieder Monster die verdammt nah ans Lager heran kommen.
	AI_Output(self, hero, "Mil_119_JOB_08_04"); //
};

///////////////////////////////////////////////////////////////////////
//	Info BRUTUS
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_BRUTUS(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 0;
	condition		= Mil_119_Cassian_BRUTUS_Condition;
	information		= Mil_119_Cassian_BRUTUS_Info;
	description		= "Brutus lässt dir was ausrichten...";
};

func int Mil_119_Cassian_BRUTUS_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_121_Brutus_CASSIAN))
	{
		return TRUE;
	};

	return FALSE;
};

func void Mil_119_Cassian_BRUTUS_Info()
{
	AI_Output(hero, self, "Mil_119_BRUTUS_15_01"); //Brutus lässt dir was ausrichten. Er fordert dich auf, gegen ihn in der Arena zu kämpfen.
	AI_Output(self, hero, "Mil_119_BRUTUS_08_02"); //Brutus sollte sich mehr um seine Pflichten als Leutnant der Miliz kümmern.
	AI_Output(self, hero, "Mil_119_BRUTUS_08_03"); //Er hängt den ganzen Tag nur vor der Arena herum und reisst grosse Sprüche.
	AI_Output(self, hero, "Mil_119_BRUTUS_08_04"); //Er sollte seine Kraft lieber für die Orks aufheben, oder sich um die Milizsoldaten kümmern.
	AI_Output(self, hero, "Mil_119_BRUTUS_08_05"); //Wenn er so weiter macht, wird ihn Berengar über kurz oder lang rausschmeissen.
};

/*

instance Mil_119_Cassian_JOIN(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 0;
	condition		= Mil_119_Cassian_JOIN_Condition;
	information		= Mil_119_Cassian_JOIN_Info;
	permanent		= TRUE;
	description		= "Ich will der Miliz beitreten";
};

func int Mil_119_Cassian_JOIN_Condition()
{
	if ((Npc_KnowsInfo(hero, Infos_Mil_4_JOIN))
	|| (Npc_KnowsInfo(hero, Infos_Mil_6_JOIN))
	|| (Npc_KnowsInfo(hero, Infos_Mil_7_JOIN))
	|| (Npc_KnowsInfo(hero, Infos_Mil_9_JOIN)))
	{
		return TRUE;
	};
};

func void Mil_119_Cassian_JOIN_Info()
{
	AI_Output(other, self, "Mil_119_Cassian_JOIN_Info_15_01"); //Ich will der Miliz beitreten.

	if ((other.attribute[ATR_STRENGTH] >= 35) // Spieler erfüllt die Bedingung
	&& (Npc_GetTalentSkill(other, NPC_TALENT_1H) >= 1))
	{
		AI_Output(self, other, "Mil_119_Cassian_JOIN_Info_00_02"); //Gut, deine Fähigkeiten sind ausreichend  für den Eintritt in die Miliz. Aber du musst noch eine Prüfung ablegen. Sag mir Bescheid, wenn du bereit bist.
		Info_ClearChoices(Mil_119_Cassian_JOIN);
		// 1 und nicht True, weil die Variable noch weiter hochgezählt wird
		Mil_119_Cassian_JOIN.permanent = FALSE;
	}
	else if ((other.attribute[ATR_STRENGTH] < 35) // Spieler hat weder die erforderliche Stärke, noch das Talent
	&& (Npc_GetTalentSkill(other, NPC_TALENT_1H) == 0))
	{
		AI_Output(self, other, "Mil_119_Cassian_JOIN_Info_00_03"); //Komm wieder, wenn du stärker geworden bist und ein Kampftalent beherrscht.
	}
	else if ((other.attribute[ATR_STRENGTH] < 35) // Spieler hat das Talent, aber nicht die Stärke
	&& (Npc_GetTalentSkill(other, NPC_TALENT_1H) >= 1))
	{
		AI_Output(self, other, "Mil_119_Cassian_JOIN_Info_00_04"); //Du beherrscht den Umgang mit Waffen, aber du bist noch nicht stark genug.
	}
	else if ((other.attribute[ATR_STRENGTH] >= 35) // Spieler hat die Stärke, aber nicht das Talent
	&& (Npc_GetTalentSkill(other, NPC_TALENT_1H) < 1))
	{
		AI_Output(self, other, "Mil_119_Cassian_JOIN_Info_00_05"); //Du bist stark genug, aber du beherrscht noch kein Kampftalent.
	};
};

instance Mil_119_Cassian_GUARDTEST(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 0;
	condition		= Mil_119_Cassian_GUARDTEST_Condition;
	information		= Mil_119_Cassian_GUARDTEST_Info;
	description		= "Ich bin bereit für die Prüfung";
};

func int Mil_119_Cassian_GUARDTEST_Condition()
{
	if (Militia_FIRST == TRUE)
	{
		return TRUE;
	};
};

func void Mil_119_Cassian_GUARDTEST_Info()
{
	AI_Output(other, self, "Mil_119_Cassian_GUARDTEST_Info_15_01"); //Ich bin bereit für die Prüfung.
	AI_Output(self, other, "Mil_119_Cassian_GUARDTEST_Info_00_02"); //Gut. Die Hauptaufgabe der Miliz besteht darin das Lager zu bewachen.
	AI_Output(self, other, "Mil_119_Cassian_GUARDTEST_Info_00_03"); //Du wirst mit Soldat Osbert eine Nacht Wache am hinteren Tor schieben.
	AI_Output(self, other, "Mil_119_Cassian_GUARDTEST_Info_00_04"); //Melde dich bei ihm. Er wird dich über alles weitere informieren.
};

instance Mil_119_Cassian_LASTTEST(C_Info)
{
	npc				= Mil_119_Cassian;
	nr				= 0;
	condition		= Mil_119_Cassian_LASTTEST_Condition;
	information		= Mil_119_Cassian_LASTTEST_Info;
	description		= "Ich habe Wache gehalten";
};

func int Mil_119_Cassian_LASTTEST_Condition()
{
	return TRUE;
};

func void Mil_119_Cassian_LASTTEST_Info()
{
	AI_Output(other, self, "Mil_119_Cassian_LASTTEST_Info_15_01"); //Ich habe Wache gehalten.
	AI_Output(self, other, "Mil_119_Cassian_LASTTEST_Info_00_02"); //Gut. Osbert hat mir ausrichten lassen, das du deine Sache ganz gut gemacht hast.
	AI_Output(self, other, "Mil_119_Cassian_LASTTEST_Info_00_03"); //Damit kommen wir dann zu der zweiten Prüfung.(Nachdrücklich) Ein Kampf.
	AI_Output(self, other, "Mil_119_Cassian_LASTTEST_Info_00_04"); //Gegen wen?
	AI_Output(self, other, "Mil_119_Cassian_LASTTEST_Info_00_05"); //Du wirst in der Arena gegen Wylfern antreten. Sprich mit ihm, wenn du soweit bist.
};
*/
