///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_EXIT(C_Info)
{
	npc				= WRK_223_Ruga;
	nr				= 999;
	condition		= WRK_223_Ruga_EXIT_Condition;
	information		= WRK_223_Ruga_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int WRK_223_Ruga_EXIT_Condition()
{
	return TRUE;
};

func void WRK_223_Ruga_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Start
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_START(C_Info)
{
	npc				= WRK_223_Ruga;
	nr				= 12;
	condition		= WRK_223_Ruga_START_Condition;
	information		= WRK_223_Ruga_START_Info;
	description		= "Wer bist Du?";
};

func int WRK_223_Ruga_START_Condition()
{
	if (!Npc_KnowsInfo(hero, WRK_223_Ruga_ARMORPRICE))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_223_Ruga_START_Info()
{
	AI_Output(hero, self, "WRK_223_START_15_01"); //Wer bist Du?
	AI_Output(self, hero, "WRK_223_START_09_02"); //Man nennt mich Ruga. Ich bin der Rüstungsmacher.
	Log_CreateTopic(GE_TraderOC, LOG_NOTE);
	B_LogEntry(GE_TraderOC, GE_TraderOC_8);
};

///////////////////////////////////////////////////////////////////////
//	Info ARMORPRICE
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_ARMORPRICE(C_Info)
{
	npc				= WRK_223_Ruga;
	nr				= 5;
	condition		= WRK_223_Ruga_ARMORPRICE_Condition;
	information		= WRK_223_Ruga_ARMORPRICE_Info;
	description		= "Wie teuer sind deine Rüstungen?";
};

func int WRK_223_Ruga_ARMORPRICE_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_223_Ruga_START))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_223_Ruga_ARMORPRICE_Info()
{
	AI_Output(hero, self, "WRK_223_ARMORPRICE_15_01"); //Wie teuer sind deine Rüstungen?
	AI_Output(self, hero, "WRK_223_ARMORPRICE_09_02"); //Kommt darauf an welche du haben willst!
};

///////////////////////////////////////////////////////////////////////
//	Info ARMORSELECTION
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_ARMORSELECTION(C_Info)
{
	npc				= WRK_223_Ruga;
	nr				= 5;
	condition		= WRK_223_Ruga_ARMORSELECTION_Condition;
	information		= WRK_223_Ruga_ARMORSELECTION_Info;
	description		= "Welche Rüstungen verkaufst du?";
};

func int WRK_223_Ruga_ARMORSELECTION_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_223_Ruga_START))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_223_Ruga_ARMORSELECTION_Info()
{
	AI_Output(hero, self, "WRK_223_ARMORSELECTION_15_01"); //Welche Rüstungen verkaufst du?
	AI_Output(self, hero, "WRK_223_ARMORSELECTION_09_02"); //Kommt darauf an, wieviel du ausgeben willst!
};

///////////////////////////////////////////////////////////////////////
//	Info NOANSWER
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_NOANSWER(C_Info)
{
	npc				= WRK_223_Ruga;
	nr				= 6;
	condition		= WRK_223_Ruga_NOANSWER_Condition;
	information		= WRK_223_Ruga_NOANSWER_Info;
	description		= "Irgendwie kommen wir so nicht weiter!";
};

func int WRK_223_Ruga_NOANSWER_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_223_Ruga_ARMORPRICE)
	&& (Npc_KnowsInfo(hero, WRK_223_Ruga_ARMORSELECTION)))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_223_Ruga_NOANSWER_Info()
{
	AI_Output(hero, self, "WRK_223_NOANSWER_15_01"); //Irgendwie kommen wir so nicht weiter!
	AI_Output(self, hero, "WRK_223_NOANSWER_09_02"); //Irgendwie glaube ich auch nicht, daß du genug Silber hast, um dir ne Rüstung zu kaufen!
	Info_AddChoice(WRK_223_Ruga_NOANSWER, "Wenn das so ist, steck dir die Rüstungen doch sonstwohin!", WRK_223_Ruga_NOANSWER_End);
	Info_AddChoice(WRK_223_Ruga_NOANSWER, "Sag mir doch einfach, was die Dinger kosten.", WRK_223_Ruga_NOANSWER_Ok);
};

func void WRK_223_Ruga_NOANSWER_Ok()
{
	AI_Output(hero, self, "WRK_223_NOANSWER_Ok_15_01"); //Sag mir doch einfach, was die Dinger kosten.
	AI_Output(self, hero, "WRK_223_NOANSWER_Ok_09_02"); //Na gut, du scheinst ja wirklich interessiert zu sein.
	AI_Output(self, hero, "WRK_223_NOANSWER_Ok_09_03"); //Ich hasse es, stundenlang zu reden, wenn dann doch nichts gekauft wird!
	Info_ClearChoices(WRK_223_Ruga_NOANSWER);
	int_RugaCalm = TRUE;
};

func void WRK_223_Ruga_NOANSWER_End()
{
	AI_Output(hero, self, "WRK_223_NOANSWER_End_15_01"); //Wenn das so ist, steck dir die Rüstungen doch sonstwohin!
	AI_Output(self, hero, "WRK_223_NOANSWER_End_09_02"); //Hab ich erwähnt, daß ich hier der EINZIGE Rüstungsmacher bin, Klugscheisser?
	int_RugaAngry = TRUE;
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NoTrade
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_NOTRADE(C_Info)
{
	npc				= WRK_223_Ruga;
	nr				= 1;
	condition		= WRK_223_Ruga_NOTRADE_Condition;
	information		= WRK_223_Ruga_NOTRADE_Info;
	permanent		= TRUE;
	description		= "Ich möchte doch gerne ne Rüstung kaufen!";
};

func int WRK_223_Ruga_NOTRADE_Condition()
{
	if (int_RugaAngry
	&& (!int_RugaWantsMeal))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_223_Ruga_NOTRADE_Info()
{
	Info_ClearChoices(WRK_223_Ruga_NOTRADE);
	AI_Output(hero, self, "WRK_223_NOTRADE_15_01"); //Ich möchte doch gerne ne Rüstung kaufen!
	AI_Output(self, hero, "WRK_223_NOTRADE_09_02"); //Ach ja? Dann musst du mir einen kleinen Gefallen tun.
	AI_Output(self, hero, "WRK_223_NOTRADE_09_03"); //Ich hätte gerne was warmes zu essen. Aber ich lasse mein Geschäft ungern allein.
	AI_Output(self, hero, "WRK_223_NOTRADE_09_04"); //Wenn du mir ne Meatbugsuppe bringst, sind wir wieder im Geschäft!
	Info_AddChoice(WRK_223_Ruga_NOTRADE, "Ich bin doch nicht dein Laufbursche!", WRK_223_Ruga_NOTRADE_WhatCanIDo_Bring1);
	Info_AddChoice(WRK_223_Ruga_NOTRADE, "Ich bring dir die Suppe.", WRK_223_Ruga_NOTRADE_WhatCanIDo_Meal);
};

func void WRK_223_Ruga_NOTRADE_WhatCanIDo_Meal()
{
	AI_Output(hero, self, "WRK_223_NOTRADE_WhatCanIDo_Meal_15_01"); //Ich bring dir die Suppe.
	AI_Output(self, hero, "WRK_223_NOTRADE_WhatCanIDo_Meal_09_02"); //Das klingt doch vernünftig.
	int_RugaWantsMeal = TRUE;
	Log_CreateTopic(CH1_RugaWantsMeal, LOG_MISSION);
	Log_SetTopicStatus(CH1_RugaWantsMeal, LOG_RUNNING);
	B_LogEntry(CH1_RugaWantsMeal, CH1_RugaWantsMeal_1);
	AI_StopProcessInfos(self);
};

func void WRK_223_Ruga_NOTRADE_WhatCanIDo_Bring1()
{
	Info_ClearChoices(WRK_223_Ruga_NOTRADE);
	AI_Output(hero, self, "WRK_223_NOTRADE_WhatCanIDo_Bring1_15_01"); //Ich bin doch nicht dein Laufbursche!
	AI_Output(self, hero, "WRK_223_NOTRADE_WhatCanIDo_Bring1_09_02"); //So bekommst Du nie eine Rüstung von mir!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TradeArmor
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_TRADEARMOR(C_Info)
{
	npc				= WRK_223_Ruga;
	nr				= 2;
	condition		= WRK_223_Ruga_TRADEARMOR_Condition;
	information		= WRK_223_Ruga_TRADEARMOR_Info;
	permanent		= TRUE;
	description		= "Welche Rüstungen hast du?";
};

func int WRK_223_Ruga_TRADEARMOR_Condition()
{
	if (int_RugaCalm)
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_223_Ruga_TRADEARMOR_Info()
{
	Info_ClearChoices(WRK_223_Ruga_TradeArmor);
	AI_Output(hero, self, "WRK_223_TRADEARMOR_15_01"); //Welche Rüstungen hast du?
	//AI_Output(self, hero, "WRK_223_TRADEARMOR_09_04"); //Welche willst du?

	if (Npc_HasItems(hero, ItMi_Silver) < 250)
	{
		AI_Output(self, hero, "WRK_223_TRADEARMOR_09_02"); //Für 250 Silber bekommst du ne leichte Buddlerhose oder Schürferklamotten. Für 500 eine vernünftige Buddlerhose.
		AI_Output(self, hero, "WRK_223_TRADEARMOR_09_03"); //Komm wieder, wenn Du genug Silber hast.

		AI_StopProcessInfos(self);
	};

	Info_AddChoice(WRK_223_Ruga_TRADEARMOR, DIALOG_ENDE, WRK_223_Ruga_EXIT_Info);

	if (Npc_HasItems(hero, ItMi_Silver) >= 250)
	{
		Info_AddChoice(WRK_223_Ruga_TRADEARMOR, B_BuildBuyArmorString!(VLK_ARMOR_L), WRK_223_Ruga_TRADEARMOR_ArmorVlk_L);
	};

	if (Npc_HasItems(hero, ItMi_Silver) >= 500)
	{
		Info_AddChoice(WRK_223_Ruga_TRADEARMOR, B_BuildBuyArmorString!(VLK_ARMOR_M), WRK_223_Ruga_TRADEARMOR_VlkArmor_M);
	};

	if (Npc_HasItems(hero, ItMi_Silver) >= 250)
	{
		Info_AddChoice(WRK_223_Ruga_TRADEARMOR, B_BuildBuyArmorString!(SFB_ARMOR_L), WRK_223_Ruga_TRADEARMOR_SfbArmor_L);
	};
};

func void WRK_223_Ruga_TRADEARMOR_SfbArmor_L()
{
	B_GiveInvItems(hero, self, ItMi_Silver, SFB_ARMOR_L.value);
	AI_Output(self, hero, "WRK_223_TRADEARMOR_SfbArmor_L_09_01"); //Hier ist deine Ware.
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	AI_StopProcessInfos(self);
};

func void WRK_223_Ruga_TRADEARMOR_VlkArmor_M()
{
	B_GiveInvItems(hero, self, ItMi_Silver, VLK_ARMOR_M.value);
	AI_Output(self, hero, "WRK_223_TRADEARMOR_VlkArmor_M_09_01"); //Ich hoffe, du wirst glücklich damit.
	B_GiveInvItems(self, hero, VLK_ARMOR_M, 1);
	AI_StopProcessInfos(self);
};

func void WRK_223_Ruga_TRADEARMOR_ArmorVlk_L()
{
	B_GiveInvItems(hero, self, ItMi_Silver, VLK_ARMOR_L.value);
	AI_Output(self, hero, "WRK_223_TRADEARMOR_ArmorVlk_L_09_01"); //Eine gute Wahl.
	B_GiveInvItems(self, hero, VLK_ARMOR_L, 1);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BringMeal
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_BRINGMEAL(C_Info)
{
	npc				= WRK_223_Ruga;
	nr				= 6;
	condition		= WRK_223_Ruga_BRINGMEAL_Condition;
	information		= WRK_223_Ruga_BRINGMEAL_Info;
	permanent		= TRUE;
	description		= "Ich hab deine Suppe.";
};

func int WRK_223_Ruga_BRINGMEAL_Condition()
{
	if (int_RugaWantsMeal
	&& (Npc_HasItems(hero, ItFo_MeatBugSoup) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_223_Ruga_BRINGMEAL_Info()
{
	AI_Output(hero, self, "WRK_223_BRINGMEAL_15_01"); //Ich hab deine Suppe.
	B_GiveInvItems(self, hero, ItFo_MeatBugSoup, 1);
	AI_Output(self, hero, "WRK_223_BRINGMEAL_09_02"); //Immer her damit!

	int_RugaWantsMeal = FALSE;
	int_RugaAngry = FALSE;
	int_RugaCalm = TRUE;
	Log_SetTopicStatus(CH1_RugaWantsMeal, LOG_SUCCESS);
	B_LogEntry(CH1_RugaWantsMeal, CH1_RugaWantsMeal_2);
};

///////////////////////////////////////////////////////////////////////
//	Info BringMealNotReady
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_BRINGMEALNOTREADY(C_Info)
{
	npc				= WRK_223_Ruga;
	nr				= 7;
	condition		= WRK_223_Ruga_BRINGMEALNOTREADY_Condition;
	information		= WRK_223_Ruga_BRINGMEALNOTREADY_Info;
	description		= "Welches Essen soll ich dir bringen?";
};

func int WRK_223_Ruga_BRINGMEALNOTREADY_Condition()
{
	if (int_RugaWantsMeal
	&& (Npc_HasItems(hero, ItFo_MeatBugSoup) < 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_223_Ruga_BRINGMEALNOTREADY_Info()
{
	AI_Output(hero, self, "WRK_223_BRINGMEALNOTREADY_15_01"); //Welches Essen soll ich dir bringen?
	AI_Output(self, hero, "WRK_223_BRINGMEALNOTREADY_09_02"); //Meatbugsuppe! Das solltest selbst du dir merken können!
	AI_StopProcessInfos(self);
};
