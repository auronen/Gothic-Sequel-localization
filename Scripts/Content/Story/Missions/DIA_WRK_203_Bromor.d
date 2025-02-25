instance WRK_203_Bromor_Exit(C_Info)
{
	npc				= WRK_203_Bromor;
	nr				= 999;
	condition		= WRK_203_Bromor_Exit_Condition;
	information		= WRK_203_Bromor_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int WRK_203_Bromor_Exit_Condition()
{
	return TRUE;
};

func void WRK_203_Bromor_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------------------
instance WRK_203_Bromor_HI(C_Info)
{
	npc				= WRK_203_Bromor;
	nr				= 0;
	condition		= WRK_203_Bromor_HI_Condition;
	information		= WRK_203_Bromor_HI_Info;
	description		= "Was machst du hier?";
};

func int WRK_203_Bromor_HI_Condition()
{
	return TRUE;
};

func void WRK_203_Bromor_HI_Info()
{
	AI_Output(other, self, "WRK_203_Bromor_HI_Info_15_01"); //Was machst du hier?
	AI_Output(self, other, "WRK_203_Bromor_HI_Info_00_02"); //Ich bin der Baumeister. Ich muss mich um die Arbeiter und die Organisation kümmern.
	AI_Output(self, other, "WRK_203_Bromor_HI_Info_00_03"); //Zur Zeit arbeiten wir am Aussenwall. Das ist das Wichtigste. Suchst du Arbeit?

	Info_ClearChoices(WRK_203_Bromor_HI);
	Info_AddChoice(WRK_203_Bromor_HI, "Nein, ich bin nur interessiert", WRK_203_Bromor_HI_NO);
	Info_AddChoice(WRK_203_Bromor_HI, "Ja, ich suche Arbeit", WRK_203_Bromor_HI_YES);
};

func void WRK_203_Bromor_HI_YES()
{
	AI_Output(other, self, "WRK_203_Bromor_HI_YES_Info_15_01"); //Ja, ich suche Arbeit.
	AI_Output(self, other, "WRK_203_Bromor_HI_YES_Info_00_02"); //Im Moment habe ich keine Arbeit für dich. Frag mal Diego. Oder die Jungs von der Miliz. So einen wie dich können die bestimmt brauchen.
	Info_ClearChoices(WRK_203_Bromor_HI);
};

func void WRK_203_Bromor_HI_NO()
{
	AI_Output(other, self, "WRK_203_Bromor_HI_NO_Info_15_01"); //Nein, ich bin nur interessiert.
	AI_Output(self, other, "WRK_203_Bromor_HI_NO_Info_00_02"); //Als wir hier ankamen, lag das halbe Lager in Schutt und Asche.
	AI_Output(self, other, "WRK_203_Bromor_HI_NO_Info_00_03"); //Aber wir haben nicht die Hände in den Schoß gelegt, sondern Material beschafft und losgelegt.
	AI_Output(self, other, "WRK_203_Bromor_HI_NO_Info_00_04"); //Ja, wir haben schon eine ganze Menge geschafft.
	Info_ClearChoices(WRK_203_Bromor_HI);
};

///////////////////////////////////////////////////////////////////////
//	Info HOW
///////////////////////////////////////////////////////////////////////
instance WRK_203_Bromor_HOW(C_Info)
{
	npc				= WRK_203_Bromor;
	nr				= 12;
	condition		= WRK_203_Bromor_HOW_Condition;
	information		= WRK_203_Bromor_HOW_Info;
	permanent		= TRUE;
	description		= "Wie kommt ihr voran?";
};

func int WRK_203_Bromor_HOW_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_203_Bromor_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_203_Bromor_HOW_Info()
{
	AI_Output(hero, self, "WRK_203_HOW_15_01"); //Wie kommt ihr voran?
	AI_Output(self, hero, "WRK_203_HOW_09_02"); //Es ist zum Kotzen! Wir hinken unserem Zeitplan um drei Wochen hinterher!
	AI_Output(self, hero, "WRK_203_HOW_09_03"); //Jedem Arbeiter muss ich genau sagen, was er machen soll, sonst bringen die es fertig und reissen den Wall ein, anstatt ihn aufzubauen!
	AI_Output(self, hero, "WRK_203_HOW_09_04"); //Die meisten hier halten mich für einen 'Sklaventreiber'. Aber die Arbeit muss gemacht werden und die Jungs arbeiten.
};

///////////////////////////////////////////////////////////////////////
//	Info TROPHYS
///////////////////////////////////////////////////////////////////////
instance WRK_203_Bromor_TROPHYS(C_Info)
{
	npc				= WRK_203_Bromor;
	nr				= 23;
	condition		= WRK_203_Bromor_TROPHYS_Condition;
	information		= WRK_203_Bromor_TROPHYS_Info;
	description		= "Ich hörte, du sammelst Trophäen?";
};

func int WRK_203_Bromor_TROPHYS_Condition()
{
	if (Npc_KnowsInfo(hero, BEG_701_Jose_NEWS))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_203_Bromor_TROPHYS_Info()
{
	AI_Output(hero, self, "WRK_203_TROPHYS_15_01"); //Ich hörte, du sammelst Trophäen?
	AI_Output(self, hero, "WRK_203_TROPHYS_09_02"); //Das stimmt. Aber nicht dieses Wolfs- und Scavenger Zeug. Davon habe ich schon genug.
	AI_Output(self, hero, "WRK_203_TROPHYS_09_03"); //Aber wenn du mir ein SchattenläuferHorn oder -Fell bringst, dafür zahle ich hundert Silberstücke!
};

///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance WRK_203_Bromor_TRADE(C_Info)
{
	npc				= WRK_203_Bromor;
	nr				= 44;
	condition		= WRK_203_Bromor_TRADE_Condition;
	information		= WRK_203_Bromor_TRADE_Info;
	permanent		= TRUE;
	description		= "Ich habe hier was für dich";
};

func int WRK_203_Bromor_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_203_Bromor_TROPHYS)
	&& ((Bromor_ShadowHorn == FALSE) || (Bromor_ShadowFur == FALSE))
	&& ((Npc_HasItems(hero, ItAt_ShadowFur) >= 1) || (Npc_HasItems(hero, ItAt_ShadowHorn) >= 1)))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_203_Bromor_TRADE_Info()
{
	AI_Output(hero, self, "WRK_203_TRADE_15_01"); //Ich habe hier was für dich.

	if (Bromor_ShadowFur == FALSE)
	{
		Info_AddChoice(WRK_203_Bromor_TRADE, "Fell geben", WRK_203_Bromor_TRADE_FUR);
	};

	if (Bromor_ShadowHorn == FALSE)
	{
		Info_AddChoice(WRK_203_Bromor_TRADE, "Horn geben", WRK_203_Bromor_TRADE_HORN);
	};
};

func void WRK_203_Bromor_TRADE_HORN()
{
	AI_Output(hero, self, "WRK_203_TRADE_HORN_15_01"); //Hier ist das Horn eines Schattenläufers.
	B_GiveInvItems(hero, self, ItAt_ShadowHorn, 1);
	AI_Output(self, hero, "WRK_203_TRADE_HORN_09_02"); //Weißt du eigentlich, wie lange ich danach suche?
	AI_Output(self, hero, "WRK_203_TRADE_HORN_09_03"); //Hier ist dein Silber, du hast es dir verdient!
	B_GiveInvItems(self, hero, ItMi_Silver, 100);
	Bromor_ShadowHorn = TRUE;
};

func void WRK_203_Bromor_TRADE_FUR()
{
	AI_Output(hero, self, "WRK_203_TRADE_FUR_15_01"); //Ich habe hier das Fell eines Schattenläufers.
	B_GiveInvItems(hero, self, ItAt_ShadowFur, 1);
	AI_Output(self, hero, "WRK_203_TRADE_FUR_09_02"); //Ausgezeichnet. Dann sollst du auch dein Silber bekommen.
	B_GiveInvItems(self, hero, ItMi_Silver, 100);
	Bromor_ShadowFur = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info RASSMUSON
///////////////////////////////////////////////////////////////////////
instance WRK_203_Bromor_RASSMUSON(C_Info)
{
	npc				= WRK_203_Bromor;
	nr				= 12;
	condition		= WRK_203_Bromor_RASSMUSON_Condition;
	information		= WRK_203_Bromor_RASSMUSON_Info;
	description		= "Rassmuson will abhauen!";
};

func int WRK_203_Bromor_RASSMUSON_Condition()
{
	if ((Knows_Rassmuson == TRUE)
	|| Npc_KnowsInfo(hero, Wrk_212_Rassmuson_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_203_Bromor_RASSMUSON_Info()
{
	AI_Output(hero, self, "WRK_203_RASSMUSON_15_01"); //Rassmuson will abhauen!
	AI_Output(self, hero, "WRK_203_RASSMUSON_09_02"); //Warum erzähslt du mir das? Willst du dich mit mir gut stellen?
	AI_Output(self, hero, "WRK_203_RASSMUSON_09_03"); //Glaubst du etwa, ich sehe nicht, das er nicht arbeitet?
	AI_Output(self, hero, "WRK_203_RASSMUSON_09_04"); //Hast du geglaubt, ich würde dich belohnen, wenn du mir das erzählst?
	AI_Output(self, hero, "WRK_203_RASSMUSON_09_05"); //Manche nennen mich einen Sklaventreiber. Vielleicht bin ich manchmal zu hart mit den Jungs.
	AI_Output(self, hero, "WRK_203_RASSMUSON_09_06"); //Aber Typen wie du, bringen mich zum Kotzen! Du hast keinen Anstand, kein Ehrgefühl und keinen Stolz.
	AI_Output(self, hero, "WRK_203_RASSMUSON_09_07"); //Geh mir aus den Augen, du schmieriger Wicht!

	B_SetAttitude(self, ATT_ANGRY);
};
