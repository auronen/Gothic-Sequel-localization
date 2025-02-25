// 			EXIT

instance KDF_1103_Nereus_Exit(C_Info)
{
	npc				= KDF_1103_Nereus;
	nr				= 999;
	condition		= KDF_1103_Nereus_Exit_Condition;
	information		= KDF_1103_Nereus_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int KDF_1103_Nereus_Exit_Condition()
{
	return TRUE;
};

func void KDF_1103_Nereus_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
//Die Sphärischen Strömungen müssen neu kalibriert werden.
//Die Dichte der magischen Konverter muss konfiguriert werden.
//Ich muss noch die Symbolik in der Runenmatrix justieren.
instance KDF_1103_Nereus_WELCOME(C_Info)
{
	npc				= KDF_1103_Nereus;
	nr				= 1;
	condition		= KDF_1103_Nereus_WELCOME_Condition;
	information		= KDF_1103_Nereus_WELCOME_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int KDF_1103_Nereus_WELCOME_Condition()
{
	if (C_NPCisinvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void KDF_1103_Nereus_WELCOME_Info()
{
	AI_Output(self, hero, "KDF_1103_Nereus_WELCOME_00_01"); //Störe mich nicht bei meinen Untersuchungen.
};
