///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance BEG_705_BEGGAR_EXIT(C_Info)
{
	npc				= BEG_705_BEGGAR;
	nr				= 999;
	condition		= BEG_705_BEGGAR_EXIT_Condition;
	information		= BEG_705_BEGGAR_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int BEG_705_BEGGAR_EXIT_Condition()
{
	return TRUE;
};

func void BEG_705_BEGGAR_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BEG
///////////////////////////////////////////////////////////////////////
instance BEG_705_BEGGAR_BEG(C_Info)
{
	npc				= BEG_705_BEGGAR;
	nr				= 1;
	condition		= BEG_705_BEGGAR_BEG_Condition;
	information		= BEG_705_BEGGAR_BEG_Info;
	important		= TRUE;
};

func int BEG_705_BEGGAR_BEG_Condition()
{
	if (Npc_GetDistToNpc(self, hero) <= 600)
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_705_BEGGAR_BEG_Info()
{
	AI_GotoNpc(self, hero);
	AI_Output(self, hero, "BEG_705_BEG_00_01"); //Hey, du hast doch bestimmt ein bisschen Silber für mich...!?

	Info_ClearChoices(BEG_705_BEGGAR_BEG);
	Info_AddChoice(BEG_705_BEGGAR_BEG, "Nein, verpiss dich!", BEG_705_BEGGAR_BEG_NO);

	if (Npc_HasItems(hero, ItMi_Silver) >= 1)
	{
		Info_AddChoice(BEG_705_BEGGAR_BEG, "(1 Silbersück geben)", BEG_705_BEGGAR_BEG_ONE);
	};

	if (Npc_HasItems(hero, ItMi_Silver) >= 5)
	{
		Info_AddChoice(BEG_705_BEGGAR_BEG, "(5 Silberstücke geben)", BEG_705_BEGGAR_BEG_FIVE);
	};

	Info_AddChoice(BEG_705_BEGGAR_BEG, "Ich habe gerade leider kein Silber dabei", BEG_705_BEGGAR_BEG_SORRY);
};

func void BEG_705_BEGGAR_BEG_NO()
{
	AI_Output(hero, self, "BEG_700_BEG_NO_15_01"); //Nein, verpiss dich!
	Info_ClearChoices(BEG_705_BEGGAR_BEG);
	AI_StopProcessInfos(self);
};

func void BEG_705_BEGGAR_BEG_FIVE()
{
	AI_Output(hero, self, "BEG_700_BEG_FIVE_15_01"); //Hier, nimm diese 5 Silberstücke.
	B_GiveInvItems(hero, self, ITMI_Silver, 5);
	AI_Output(self, hero, "BEG_700_BEG_FIVE_00_02"); //Danke Mann, vielleicht können wir Bettler dir ja auch mal helfen...

	Beggars_Secrets = Beggars_Secrets + 1;
	Info_ClearChoices(BEG_705_BEGGAR_BEG);
	AI_StopProcessInfos(self);
};

func void BEG_705_BEGGAR_BEG_SORRY()
{
	AI_Output(hero, self, "BEG_700_BEG_SORRY_15_01"); //Ich habe gerade leider kein Silber dabei.

	AI_StopProcessInfos(self);
};

func void BEG_705_BEGGAR_BEG_ONE()
{
	AI_Output(hero, self, "BEG_700_BEG_ONE_15_01"); //Hier, nimm dieses Silberstück.
	B_GiveInvItems(hero, self, ITMI_Silver, 1);
	AI_Output(self, hero, "BEG_700_BEG_ONE_00_02"); //Damit hast du mir wirklich geholfen.

	Info_ClearChoices(BEG_705_BEGGAR_BEG);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BEG2 (nach einmaligen Ansprechen durch die Bettler kann der Spieler die Bettler immer wieder von sich aus ansprechen
///////////////////////////////////////////////////////////////////////
instance BEG_705_BEGGAR_BEG2(C_Info)
{
	npc				= BEG_705_BEGGAR;
	nr				= 1;
	condition		= BEG_705_BEGGAR_BEG2_Condition;
	information		= BEG_705_BEGGAR_BEG2_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int BEG_705_BEGGAR_BEG2_Condition()
{
	if (C_NPCisinvincible(hero)
	&& Npc_KnowsInfo(hero, BEG_705_BEGGAR_BEG))
	{
		return TRUE;
	};

	return FALSE;
};

func void BEG_705_BEGGAR_BEG2_Info()
{
	AI_GotoNpc(self, hero);
	AI_Output(self, hero, "BEG_705_BEG_00_01"); //Hey, du hast doch bestimmt ein bisschen Silber für mich...!?
	Info_ClearChoices(BEG_705_BEGGAR_BEG);
	Info_AddChoice(BEG_705_BEGGAR_BEG2, "Nein, verpiss dich!", BEG_705_BEGGAR_BEG_NO);

	if (Npc_HasItems(hero, ItMi_Silver) >= 1)
	{
		Info_AddChoice(BEG_705_BEGGAR_BEG2, "(1 Silbersück geben)", BEG_705_BEGGAR_BEG_ONE);
	};

	if (Npc_HasItems(hero, ItMi_Silver) >= 5)
	{
		Info_AddChoice(BEG_705_BEGGAR_BEG2, "(5 Silberstücke geben)", BEG_705_BEGGAR_BEG_FIVE);
	};

	Info_AddChoice(BEG_705_BEGGAR_BEG2, "Ich habe gerade leider kein Silber dabei", BEG_705_BEGGAR_BEG_SORRY);
};
