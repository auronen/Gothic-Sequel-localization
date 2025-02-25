///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance MIL_101_Wylfern_EXIT(C_Info)
{
	npc				= MIL_101_Wylfern;
	nr				= 999;
	condition		= MIL_101_Wylfern_EXIT_Condition;
	information		= MIL_101_Wylfern_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int MIL_101_Wylfern_EXIT_Condition()
{
	return TRUE;
};

func void MIL_101_Wylfern_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NEUTRAL
///////////////////////////////////////////////////////////////////////
instance MIL_101_Wylfern_NEUTRAL(C_Info)
{
	npc				= MIL_101_Wylfern;
	nr				= 33;
	condition		= MIL_101_Wylfern_NEUTRAL_Condition;
	information		= MIL_101_Wylfern_NEUTRAL_Info;
	permanent		= TRUE;
	description		= "Was machst du hier?";
};

func int MIL_101_Wylfern_NEUTRAL_Condition()
{
	return TRUE;
};

func void MIL_101_Wylfern_NEUTRAL_Info()
{
	AI_Output(hero, self, "MIL_101_NEUTRAL_15_01"); //Was machst du hier?
	AI_Output(self, hero, "MIL_101_NEUTRAL_08_02"); //Ich bin Wylfern, Rekrut der Miliz.
	AI_Output(self, hero, "MIL_101_NEUTRAL_08_03"); //Als angehender Milizsoldat hat man immer viel zu tun. Wenn man nicht gerade Wache hält, muss man trainieren.
	AI_Output(self, hero, "MIL_101_NEUTRAL_08_04"); //Wir kümmern uns um alles, was für die anderen zu gefährlich ist.
	AI_Output(self, hero, "MIL_101_NEUTRAL_08_05"); //Ja, es ist ganz schön hart, aber ich bin stolz dabeisein zu dürfen!
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance MIL_101_Wylfern_HI(C_Info)
{
	npc				= MIL_101_Wylfern;
	nr				= 12;
	condition		= MIL_101_Wylfern_HI_Condition;
	information		= MIL_101_Wylfern_HI_Info;
	description		= "Du warst in der Mine?";
};

func int MIL_101_Wylfern_HI_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_200_Gotmar_NEEDBLOODORE)
	|| Npc_KnowsInfo(hero, MIL_101_Sylvester_Sword))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_101_Wylfern_HI_Info()
{
	AI_Output(hero, self, "MIL_101_HI_15_01"); //Du warst in der Mine?
	AI_Output(self, hero, "MIL_101_HI_08_02"); //Ja, das ist richtig. Ich hab bis vor ein paar Wochen in der Mine gearbeitet.
	AI_Output(self, hero, "MIL_101_HI_08_03"); //Aber dann bekam ich den Auftrag zwei Schürfer zum Lager zu bringen.
	AI_Output(self, hero, "MIL_101_HI_08_04"); //Wir haben uns auf den Weg gemacht, aus Vorsicht sind wir Nachts gegangen.
	AI_Output(self, hero, "MIL_101_HI_08_05"); //Kurz vor dem Lager haben uns die Orks überfallen. Sie kamen wie aus dem Nichts,... wir hatten keine Chance.
	AI_Output(self, hero, "MIL_101_HI_08_06"); //Nur Sylvester und ich konnten uns retten. Aber Pedro haben sie erwischt.
};

///////////////////////////////////////////////////////////////////////
//	Info RUSH
///////////////////////////////////////////////////////////////////////
instance MIL_101_Wylfern_RUSH(C_Info)
{
	npc				= MIL_101_Wylfern;
	nr				= 11;
	condition		= MIL_101_Wylfern_RUSH_Condition;
	information		= MIL_101_Wylfern_RUSH_Info;
	description		= "Wo hat der Überfall stattgefunden?";
};

func int MIL_101_Wylfern_RUSH_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_101_Wylfern_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_101_Wylfern_RUSH_Info()
{
	AI_Output(hero, self, "MIL_101_RUSH_15_01"); //Wo hat der Überfall stattgefunden?
	AI_Output(self, hero, "MIL_101_RUSH_08_02"); //Am Waldrand. Willst du dahin?
	AI_Output(hero, self, "MIL_101_RUSH_15_03"); //Ja, ich brauche unbedingt Bluterz. Vielleicht finde ich da noch was.
	AI_Output(self, hero, "MIL_101_RUSH_08_04"); //Du wirst die Stelle alleine nicht finden.
	AI_Output(hero, self, "MIL_101_RUSH_15_05"); //Deshalb wirst du mich begleiten.
	AI_Output(self, hero, "MIL_101_RUSH_08_06"); //Was ich? Nein, vergiss es. Ich gehe dort nicht mehr hin!

	Info_ClearChoices(MIL_101_Wylfern_RUSH);
	Info_AddChoice(MIL_101_Wylfern_RUSH, "Dann beschreib mir wenigstens den Weg", MIL_101_Wylfern_RUSH_WAY);
	Info_AddChoice(MIL_101_Wylfern_RUSH, "Du bist halt ein Feigling...", MIL_101_Wylfern_RUSH_FEAR);
	Info_AddChoice(MIL_101_Wylfern_RUSH, "Ich zahl dir dreissig Silberstücke", MIL_101_Wylfern_RUSH_30);
	Info_AddChoice(MIL_101_Wylfern_RUSH, "Ich zahl dir zehn Silberstücke", MIL_101_Wylfern_RUSH_10);
};

func void MIL_101_Wylfern_RUSH_10()
{
	AI_Output(hero, self, "MIL_101_RUSH_20_15_01"); //Ich zahl dir zehn Silberstücke.
	AI_Output(self, hero, "MIL_101_RUSH_20_08_02"); //Nicht für alles Geld des Lagers würde ich da wieder hingehen!
	Info_ClearChoices(MIL_101_Wylfern_RUSH);
	Wylfern_Again = LOG_RUNNING;
};

func void MIL_101_Wylfern_RUSH_30()
{
	AI_Output(hero, self, "MIL_101_RUSH_30_15_01"); //Ich zahl dir dreissig Silberstücke.
	AI_Output(self, hero, "MIL_101_RUSH_30_08_02"); //Hmmm.. okay, wenn du mir das Silber gibst, bringe ich dich hin.
	Wylfern_Silver = LOG_RUNNING;
	Info_ClearChoices(MIL_101_Wylfern_RUSH);
};

func void MIL_101_Wylfern_RUSH_FEAR()
{
	AI_Output(hero, self, "MIL_101_RUSH_FEAR_15_01"); //Du bist halt ein Feigling...
	AI_Output(self, hero, "MIL_101_RUSH_FEAR_08_02"); //Was, du nennst mich einen Feigling? Ich bin Rekrut der Miliz. Ich bin nicht feige!
	AI_Output(hero, self, "MIL_101_RUSH_FEAR_15_03"); //Dann bring mich zum Ort des Überfalls!
	AI_Output(self, hero, "MIL_101_RUSH_FEAR_08_04"); // 		-SEUFZ-
	AI_Output(self, hero, "MIL_101_RUSH_FEAR_08_05"); //Na gut, ich werde dich hinbringen.
	Wylfern_Search = LOG_RUNNING;
	Info_ClearChoices(MIL_101_Wylfern_RUSH);
};

func void MIL_101_Wylfern_RUSH_WAY()
{
	AI_Output(hero, self, "MIL_101_RUSH_WAY_15_01"); //Dann beschreib mir wenigstens den Weg.
	AI_Output(self, hero, "MIL_101_RUSH_WAY_08_02"); //Verlasse das Lager durch den Haupteingang und wende ich nach rechts.
	AI_Output(self, hero, "MIL_101_RUSH_WAY_08_03"); //Folge dem Weg, bis du zum Wald kommst.
	AI_Output(self, hero, "MIL_101_RUSH_WAY_08_04"); //Dort verlässt du den Weg und folgst rechterhand dem Waldrand, bis du im Wald den Hügel siehst.
	AI_Output(self, hero, "MIL_101_RUSH_WAY_08_05"); //Hinter dem Hügel, da haben sie uns angegriffen!
	Info_ClearChoices(MIL_101_Wylfern_RUSH);
};

///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance MIL_101_Wylfern_WAREZ(C_Info)
{
	npc				= MIL_101_Wylfern;
	nr				= 12;
	condition		= MIL_101_Wylfern_WAREZ_Condition;
	information		= MIL_101_Wylfern_WAREZ_Info;
	description		= "Hattet ihr Erz dabei?";
};

func int MIL_101_Wylfern_WAREZ_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_101_Wylfern_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_101_Wylfern_WAREZ_Info()
{
	AI_Output(hero, self, "MIL_101_WAREZ_15_01"); //Hattet ihr Erz dabei?
	AI_Output(self, hero, "MIL_101_WAREZ_08_02"); //Sylvester und Pedro hatten beide Erz dabei.
};

///////////////////////////////////////////////////////////////////////
//	Info AGAIN
///////////////////////////////////////////////////////////////////////
instance MIL_101_Wylfern_AGAIN(C_Info)
{
	npc				= MIL_101_Wylfern;
	nr				= 23;
	condition		= MIL_101_Wylfern_AGAIN_Condition;
	information		= MIL_101_Wylfern_AGAIN_Info;
	description		= "Dann beschreib mir wenigstens den Weg";
};

func int MIL_101_Wylfern_AGAIN_Condition()
{
	if (Wylfern_Again == LOG_RUNNING)
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_101_Wylfern_AGAIN_Info()
{
	AI_Output(hero, self, "MIL_101_AGAIN_15_01"); //Dann beschreibe mir wenigstens den Weg.
	AI_Output(self, hero, "MIL_101_AGAIN_08_02"); //Verlasse das Lager durch den Haupteingang und wende ich nach rechts.
	AI_Output(self, hero, "MIL_101_AGAIN_08_03"); //Folge dem Weg, bis du zum Wald kommst.
	AI_Output(self, hero, "MIL_101_AGAIN_08_04"); //Dort verlässt du den Weg und folgst rechterhand dem Waldrand, bis du im Wald den Hügel siehst.
	AI_Output(self, hero, "MIL_101_AGAIN_08_05"); //Hinter dem Hügel, da haben sie uns angegriffen!
};

///////////////////////////////////////////////////////////////////////
//	Info GUIDE
///////////////////////////////////////////////////////////////////////
instance MIL_101_Wylfern_GUIDE(C_Info)
{
	npc				= MIL_101_Wylfern;
	nr				= 12;
	condition		= MIL_101_Wylfern_GUIDE_Condition;
	information		= MIL_101_Wylfern_GUIDE_Info;
	description		= "Lass uns zum Ort des Überfalls gehen";
};

func int MIL_101_Wylfern_GUIDE_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_101_Wylfern_RUSH)
	&& (Wylfern_Search == LOG_RUNNING))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_101_Wylfern_GUIDE_Info()
{
	AI_Output(hero, self, "MIL_101_GUIDE_15_01"); //Lass uns zum Ort des Überfalls gehen.
	AI_Output(self, hero, "MIL_101_GUIDE_08_02"); //Gut, dann folge mir. Aber ich werde dich nur hinbringen, nichts weiter!
	AI_Output(self, hero, "MIL_101_GUIDE_08_03"); //Sollten wir uns unterwegs verlieren, treffen wir und am besten hier im Burghof wieder.

	B_GuidePC(self, "RUSH", "PATH_OC_FOGTOWER02");

	AI_StopProcessInfos(self);

	Wld_InsertNpc(Wolf, "FP_ROAM_OW_WOLF2_WALD_OC1");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_WOLF2_WALD_OC2");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_WOLF2_WALD_OC3");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_WOLF2_WALD_OC5");
};

///////////////////////////////////////////////////////////////////////
//	Info SILVERGUIDE
///////////////////////////////////////////////////////////////////////
instance MIL_101_Wylfern_SILVERGUIDE(C_Info)
{
	npc				= MIL_101_Wylfern;
	nr				= 23;
	condition		= MIL_101_Wylfern_SILVERGUIDE_Condition;
	information		= MIL_101_Wylfern_SILVERGUIDE_Info;
	description		= "Lass uns zum Ort des Überfalls gehen";
};

func int MIL_101_Wylfern_SILVERGUIDE_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_101_Wylfern_RUSH)
	&& (Wylfern_Silver == LOG_RUNNING))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_101_Wylfern_SILVERGUIDE_Info()
{
	AI_Output(hero, self, "MIL_101_SILVERGUIDE_15_01"); //Lass uns zum Ort des Überfalls gehen. Ich habe das Silber.
	if (Npc_HasItems(hero, ITMI_Silver) >= 30)
	{
		AI_Output(self, hero, "MIL_101_SILVERGUIDE_08_02"); //Alles klar, aber ich werde dich nur hinbringen, nichts weiter.

		B_GuidePC(self, "RUSH", "PATH_OC_FOGTOWER02");
		AI_StopProcessInfos(self);
		MIL_101_Wylfern_SILVERGUIDE.permanent = FALSE;
	};

	if (Npc_HasItems(hero, ITMI_Silver) < 30)
	{
		AI_Output(self, hero, "MIL_101_SILVERGUIDE_08_03"); //Komm wieder, wenn du dreissig Silberstücke hast!
		MIL_101_Wylfern_SILVERGUIDE.permanent = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info RUSHHOUR
///////////////////////////////////////////////////////////////////////
instance MIL_101_Wylfern_RUSHHOUR(C_Info)
{
	npc				= MIL_101_Wylfern;
	condition		= MIL_101_Wylfern_RUSHHOUR_Condition;
	information		= MIL_101_Wylfern_RUSHHOUR_Info;
	important		= TRUE;
};

func int MIL_101_Wylfern_RUSHHOUR_Condition()
{
	if (Npc_GetDistToWP(self, "PATH_OC_FOGTOWER02") <= 500
	&& Npc_IsInRoutine(self, ZS_GuidePC))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_101_Wylfern_RUSHHOUR_Info()
{
	AI_Output(self, hero, "MIL_101_RUSHHOUR_08_01"); //Okay, hier war es. Du solltest dich beeilen, es ist nicht sicher hier.
	AI_Output(self, hero, "MIL_101_RUSHHOUR_08_02"); //Ich gehe wieder zurück ins Lager.

	B_LeavePC(self, "START");
	AI_StopProcessInfos(self);
};
