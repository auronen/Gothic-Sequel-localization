///////////////////////////////////////////////////////////////////////
//	Info WAIT
///////////////////////////////////////////////////////////////////////
instance MIL_116_Militia_WAIT(C_Info)
{
	npc				= MIL_116_Militia;
	nr				= 12;
	condition		= MIL_116_Militia_WAIT_Condition;
	information		= MIL_116_Militia_WAIT_Info;
	important		= TRUE;
};

func int MIL_116_Militia_WAIT_Condition()
{
	if (subChapter < CH1_ARRIVED_AT_OC)
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_116_Militia_WAIT_Info()
{
	AI_Output(self, hero, "MIL_116_WAIT_06_01"); //Hey, wo willst du hin?

	Info_AddChoice(MIL_116_Militia_WAIT, "Ich suche meinen alten Freund Diego.", MIL_116_Militia_WAIT_TROUBLE);
	Info_AddChoice(MIL_116_Militia_WAIT, "Ich will ins Lager.", MIL_116_Militia_WAIT_CAMP);
};

func void MIL_116_Militia_WAIT_CAMP()
{
	AI_Output(hero, self, "MIL_116_WAIT_CAMP_15_01"); //Ich will ins Lager.
	AI_Output(self, hero, "MIL_116_WAIT_CAMP_06_02"); //Auf der Flucht vor den Orks , wie?
	AI_Output(self, hero, "MIL_116_WAIT_CAMP_06_03"); //Damit das eine mal klar ist, hier drin wird gearbeitet und trainiert.
	AI_Output(self, hero, "MIL_116_WAIT_CAMP_06_04"); //Wenn du vorhast Ärger zu machen, kannst du direkt wieder gehen.

	subChapter = CH1_ARRIVED_AT_OC;

	AI_StopProcessInfos(self);
};

func void MIL_116_Militia_WAIT_TROUBLE()
{
	AI_Output(hero, self, "MIL_116_WAIT_TROUBLE_15_01"); //Ich suche meinen alten Freund Diego.
	AI_Output(self, hero, "MIL_116_WAIT_TROUBLE_06_02"); //Schon wieder einer, der meint ein Freund von Diego zu sein.
	AI_Output(self, hero, "MIL_116_WAIT_TROUBLE_06_03"); //Damit das klar ist, Bürschchen. Diego ist hier der Boss im Lager und er hat bestimmt keine Zeit, mit jedem dahergelaufenen Penner zu reden.
	AI_Output(hero, self, "MIL_116_WAIT_TROUBLE_15_04"); //Und wo finde ich nun ...euren Boss?
	AI_Output(self, hero, "MIL_116_WAIT_TROUBLE_06_05"); //Er hält Rat im alten Erzbaronhaus innerhalb der Burg. Und nun zieh Leine!

	subChapter = CH1_ARRIVED_AT_OC;

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DEFEAT
///////////////////////////////////////////////////////////////////////
instance MIL_116_Militia_DEFEAT(C_Info)
{
	npc				= MIL_116_Militia;
	nr				= 12;
	condition		= MIL_116_Militia_DEFEAT_Condition;
	information		= MIL_116_Militia_DEFEAT_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int MIL_116_Militia_DEFEAT_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_116_Militia_WAIT)
	&& (self.aivar[AIV_HASDEFEATEDSC] == TRUE)
	&& C_NPCisinvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_116_Militia_DEFEAT_Info()
{
	AI_Output(self, hero, "MIL_116_DEFEAT_06_01"); //Willst du noch 'ne Runde?
};

///////////////////////////////////////////////////////////////////////
//	Info ORECAVE
///////////////////////////////////////////////////////////////////////
instance MIL_116_Militia_ORECAVE(C_Info)
{
	npc				= MIL_116_Militia;
	nr				= 1;
	condition		= MIL_116_Militia_ORECAVE_Condition;
	information		= MIL_116_Militia_ORECAVE_Info;
	description		= "Weisst du was von einer Molerat-Höhle hier in der Nähe?";
};

func int MIL_116_Militia_ORECAVE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gotmar_WHEREORE3))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_116_Militia_ORECAVE_Info()
{
	AI_Output(hero, self, "MIL_116_ORECAVE_15_01"); //Weisst du was von einer Molerat-Höhle hier in der Nähe?
	AI_Output(self, hero, "MIL_116_ORECAVE_06_02"); //Siehst du da drüben die Brücke über den Fluss?
	AI_Output(hero, self, "MIL_116_ORECAVE_15_03"); //Ja!
	AI_Output(self, hero, "MIL_116_ORECAVE_06_04"); //Links davon ist eine Höhle in der sich solche Biester eingenistet haben.
	AI_Output(self, hero, "MIL_116_ORECAVE_06_05"); //Diese Viecher sind ziemlich hinterhältig. Beobachten einen nur und beissen genau in dem Moment zu, in dem man selbst zum Schlag ausholen will.
};
