///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance PAL_1046_Prinzessin_EXIT(C_Info)
{
	npc				= PAL_1046_Prinzessin;
	nr				= 999;
	condition		= PAL_1046_Prinzessin_EXIT_Condition;
	information		= PAL_1046_Prinzessin_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int PAL_1046_Prinzessin_EXIT_Condition()
{
	return TRUE;
};

func void PAL_1046_Prinzessin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance PAL_1046_Prinzessin_HI(C_Info)
{
	npc				= PAL_1046_Prinzessin;
	nr				= 1;
	condition		= PAL_1046_Prinzessin_HI_Condition;
	information		= PAL_1046_Prinzessin_HI_Info;
	important		= TRUE;
};

func int PAL_1046_Prinzessin_HI_Condition()
{
	return TRUE;
};

func void PAL_1046_Prinzessin_HI_Info()
{
	AI_Output(self, hero, "PAL_1046_HI_16_01"); //Ich bin eine Prinzessin!
	AI_Output(self, hero, "PAL_1046_HI_16_02"); //Tatsächlich?
	AI_Output(self, hero, "PAL_1046_HI_16_03"); //Oh ein junger stürmischer Krieger -TRIEF-
	AI_Output(hero, self, "PAL_1046_HI_15_04"); //Noch so abgetakelte mitt-40erin die keinen mehr abgekriegt hat
	AI_Output(self, hero, "PAL_1046_HI_16_05"); //Kann ich was für dich tun - KLIMPER- KLIMPER-
};

///////////////////////////////////////////////////////////////////////
//	Info BATH
///////////////////////////////////////////////////////////////////////
instance PAL_1046_Prinzessin_BATH(C_Info)
{
	npc				= PAL_1046_Prinzessin;
	nr				= 2;
	condition		= PAL_1046_Prinzessin_BATH_Condition;
	information		= PAL_1046_Prinzessin_BATH_Info;
	description		= "Geh baden!";
};

func int PAL_1046_Prinzessin_BATH_Condition()
{
	return TRUE;
};

func void PAL_1046_Prinzessin_BATH_Info()
{
	AI_Output(hero, self, "PAL_1046_BATH_15_01"); //Geh baden!
	AI_Output(self, hero, "PAL_1046_BATH_16_02"); //Oh Jaaa, ich bin so schmutzig! Willst du mir nicht beim Baden zusehen??
	AI_Output(self, hero, "PAL_1046_BATH_16_03"); //BITTE (Winsel)
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "BATH");
};

///////////////////////////////////////////////////////////////////////
//	Info LOVE
///////////////////////////////////////////////////////////////////////
instance PAL_1046_Prinzessin_LOVE(C_Info)
{
	npc				= PAL_1046_Prinzessin;
	nr				= 1;
	condition		= PAL_1046_Prinzessin_LOVE_Condition;
	information		= PAL_1046_Prinzessin_LOVE_Info;
	description		= "Zieh dich aus und leg dich hin!";
};

func int PAL_1046_Prinzessin_LOVE_Condition()
{
	return TRUE;
};

func void PAL_1046_Prinzessin_LOVE_Info()
{
	AI_Output(hero, self, "PAL_1046_LOVE_15_01"); //Zieh dich aus und leg dich hin!
	AI_Output(self, hero, "PAL_1046_LOVE_16_02"); //Nichts würde ich lieber, du Starker, aber das Bett ist nicht gemacht...
	AI_Output(hero, self, "PAL_1046_LOVE_15_03"); //Scheisse!
};

///////////////////////////////////////////////////////////////////////
//	Info SUICIDE
///////////////////////////////////////////////////////////////////////
instance PAL_1046_Prinzessin_SUICIDE(C_Info)
{
	npc				= PAL_1046_Prinzessin;
	nr				= 3;
	condition		= PAL_1046_Prinzessin_SUICIDE_Condition;
	information		= PAL_1046_Prinzessin_SUICIDE_Info;
	description		= "Du bist über, Bitch! ";
};

func int PAL_1046_Prinzessin_SUICIDE_Condition()
{
	return TRUE;
};

func void PAL_1046_Prinzessin_SUICIDE_Info()
{
	AI_Output(hero, self, "PAL_1046_SUICIDE_15_01"); //Du bist über, Bitch!
	AI_Output(self, hero, "PAL_1046_SUICIDE_16_02"); //Oh - nein, du liebst mich nicht (dramatisch)
	AI_Output(self, hero, "PAL_1046_SUICIDE_16_03"); //Dann stürze ich mich jetzt zu Tode!!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "SUICIDE");
};
