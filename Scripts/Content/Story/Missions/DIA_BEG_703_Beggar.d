///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance BEG_703_BEGGAR_EXIT(C_Info)
{
	npc				= BEG_703_BEGGAR;
	nr				= 999;
	condition		= BEG_703_BEGGAR_EXIT_Condition;
	information		= BEG_703_BEGGAR_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int BEG_703_BEGGAR_EXIT_Condition()
{
	return TRUE;
};

func void BEG_703_BEGGAR_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BEG
///////////////////////////////////////////////////////////////////////
instance BEG_703_BEGGAR_BEG(C_Info)
{
	npc				= BEG_703_BEGGAR;
	nr				= 1;
	condition		= BEG_703_BEGGAR_BEG_Condition;
	information		= BEG_703_BEGGAR_BEG_Info;
	important		= TRUE;
};

func int BEG_703_BEGGAR_BEG_Condition()
{
	if (Npc_GetDistToNpc(self, hero) <= 600)
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_703_BEGGAR_BEG_Info()
{
	AI_GotoNpc(self, hero);
	AI_Output(self, hero, "BEG_703_BEG_00_01"); //Hast du vielleicht ein bisschen Silber?

	Info_ClearChoices(BEG_703_BEGGAR_BEG);
	Info_AddChoice(BEG_703_BEGGAR_BEG, "Nein, verpiss dich!", BEG_703_BEGGAR_BEG_NO);

	if (Npc_HasItems(hero, ItMi_Silver) >= 1)
	{
		Info_AddChoice(BEG_703_BEGGAR_BEG, "(1 Silbersück geben)", BEG_703_BEGGAR_BEG_ONE);
	};

	if (Npc_HasItems(hero, ItMi_Silver) >= 5)
	{
		Info_AddChoice(BEG_703_BEGGAR_BEG, "(5 Silberstücke geben)", BEG_703_BEGGAR_BEG_FIVE);
	};

	Info_AddChoice(BEG_703_BEGGAR_BEG, "Ich habe gerade leider kein Silber dabei", BEG_703_BEGGAR_BEG_SORRY);
};

func void BEG_703_BEGGAR_BEG_NO()
{
	AI_Output(hero, self, "BEG_703_BEG_NO_15_01"); //Nein, verpiss dich!

	Beggars_Secrets = Beggars_Secrets - 1;
	Info_ClearChoices(BEG_703_BEGGAR_BEG);
	AI_StopProcessInfos(self);
};

func void BEG_703_BEGGAR_BEG_FIVE()
{
	AI_Output(hero, self, "BEG_703_BEG_FIVE_15_01"); //Reichen diese 5 Silberstücke?
	B_GiveInvItems(hero, self, ITMI_Silver, 5);
	AI_Output(self, hero, "BEG_703_BEG_FIVE_00_02"); //Das ist weit mehr als genug, danke! Wenn du Neuigkeiten erfahren willst, sei weiterhin so großzügig!

	Beggars_Secrets = Beggars_Secrets + 1;
	Info_ClearChoices(BEG_703_BEGGAR_BEG);
	AI_StopProcessInfos(self);
};

func void BEG_703_BEGGAR_BEG_SORRY()
{
	AI_Output(hero, self, "BEG_703_BEG_SORRY_15_01"); //Ich habe gerade leider kein Silber dabei.
	Info_ClearChoices(BEG_703_BEGGAR_BEG);
	AI_StopProcessInfos(self);
};

func void BEG_703_BEGGAR_BEG_ONE()
{
	AI_Output(hero, self, "BEG_703_BEG_ONE_15_01"); //Nimm erstmal dieses Silberstück.
	B_GiveInvItems(hero, self, ITMI_Silver, 1);
	AI_Output(self, hero, "BEG_703_BEG_ONE_00_02"); //Wer ein Silber nicht ehrt..jaja ich kenne die Sprüche.

	Info_ClearChoices(BEG_703_BEGGAR_BEG);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BEG2 (nach einmaligen Ansprechen durch die Bettler kann der Spieler die Bettler immer wieder von sich aus ansprechen
///////////////////////////////////////////////////////////////////////
instance BEG_703_BEGGAR_BEG2(C_Info)
{
	npc				= BEG_703_BEGGAR;
	nr				= 1;
	condition		= BEG_703_BEGGAR_BEG2_Condition;
	information		= BEG_703_BEGGAR_BEG2_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int BEG_703_BEGGAR_BEG2_Condition()
{
	if (C_NPCisinvincible(hero)
	&& Npc_KnowsInfo(hero, BEG_703_BEGGAR_BEG))
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_703_BEGGAR_BEG2_Info()
{
	AI_GotoNpc(self, hero);
	AI_Output(self, hero, "BEG_703_BEG_00_01"); //Hast du vielleicht ein bisschen Silber?
	Info_ClearChoices(BEG_703_BEGGAR_BEG);
	Info_AddChoice(BEG_703_BEGGAR_BEG2, "Nein, verpiss dich!", BEG_703_BEGGAR_BEG_NO);

	if (Npc_HasItems(hero, ItMi_Silver) >= 1)
	{
		Info_AddChoice(BEG_703_BEGGAR_BEG2, "(1 Silbersück geben)", BEG_703_BEGGAR_BEG_ONE);
	};

	if (Npc_HasItems(hero, ItMi_Silver) >= 5)
	{
		Info_AddChoice(BEG_703_BEGGAR_BEG2, "(5 Silberstücke geben)", BEG_703_BEGGAR_BEG_FIVE);
	};

	Info_AddChoice(BEG_703_BEGGAR_BEG2, "Ich habe gerade leider kein Silber dabei", BEG_703_BEGGAR_BEG_SORRY);
};
