//****************************
// 		PC_Sleep
//****************************

func void PC_Sleep(var int t)
{
	AI_StopProcessInfos(self);		// [SK] ->muss hier stehen um das update zu gewährleisten
	self.aivar[AIV_INVINCIBLE] = FALSE;
	if (Wld_IsTime(00, 00, t, 00))
	{
		Wld_SetTime(t, 00);
	}
	else
	{
		t = t + 24;
		Wld_SetTime(t, 00);
	};

	_ = PrintScreen(_STR_MESSAGE_MOBSI_BED_SLEEP, -1, -1, FONT_OLD_BIG, 3);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];

	//-------- AssessEnterRoom-Wahrnehmung versenden --------
	PrintGlobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero, PERC_ASSESSENTERROOM, NULL, hero);		//...damit der Spieler dieses Feature nicht zum Hütteplündern ausnutzt!
};

func void SLEEPABIT_S1()
{
	if (B_CompareNpcInstance(self, hero))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_BED;

		AI_ProcessInfos(self);
	};
};

//-------------------- Gar nicht schlafen -------------------------

instance PC_NoSleep(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= PC_NoSleep_Condition;
	information		= PC_NoSleep_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int PC_NoSleep_Condition()
{
	if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BED)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_NoSleep_Info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

//---------------------- morgens --------------------------------------

instance PC_SleepTime_Morning(C_Info)
{
	npc				= PC_HERO;
	nr				= 0;
	condition		= PC_SleepTime_Morning_Condition;
	information		= PC_SleepTime_Morning_Info;
	permanent		= TRUE;
	description		= "Bis zum nächsten Morgen schlafen";
};

func int PC_SleepTime_Morning_Condition()
{
	if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BED)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_SleepTime_Morning_Info()
{
	PC_Sleep(8);	// SN: geändert, da um 7 Uhr noch keiner der NSCs wach ist!
};

//--------------------- mittags -----------------------------------------

instance PC_SleepTime_Noon(C_Info)
{
	npc				= PC_HERO;
	nr				= 0;
	condition		= PC_SleepTime_Noon_Condition;
	information		= PC_SleepTime_Noon_Info;
	permanent		= TRUE;
	description		= "Bis Mittags schlafen";
};

func int PC_SleepTime_Noon_Condition()
{
	if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BED)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_SleepTime_Noon_Info()
{
	PC_Sleep(12);
};

//---------------------- abend --------------------------------------

instance PC_SleepTime_Evening(C_Info)
{
	npc				= PC_HERO;
	nr				= 0;
	condition		= PC_SleepTime_Evening_Condition;
	information		= PC_SleepTime_Evening_Info;
	permanent		= TRUE;
	description		= "Bis zum nächsten Abend schlafen";
};

func int PC_SleepTime_Evening_Condition()
{
	if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BED)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_SleepTime_Evening_Info()
{
	PC_Sleep(18);
};

//------------------------ nacht -----------------------------------------

instance PC_SleepTime_Midnight(C_Info)
{
	npc				= PC_HERO;
	nr				= 0;
	condition		= PC_SleepTime_Midnight_Condition;
	information		= PC_SleepTime_Midnight_Info;
	permanent		= TRUE;
	description		= "Bis Mitternacht schlafen";
};

func int PC_SleepTime_Midnight_Condition()
{
	if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BED)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_SleepTime_Midnight_Info()
{
	PC_Sleep(0);
};
