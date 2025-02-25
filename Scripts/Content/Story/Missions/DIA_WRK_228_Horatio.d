///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance WRK_228_Horatio_EXIT(C_Info)
{
	npc				= WRK_228_Horatio;
	nr				= 999;
	condition		= WRK_228_Horatio_EXIT_Condition;
	information		= WRK_228_Horatio_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int WRK_228_Horatio_EXIT_Condition()
{
	return TRUE;
};

func void WRK_228_Horatio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HELLO
///////////////////////////////////////////////////////////////////////
instance WRK_228_Horatio_HELLO(C_Info)
{
	npc				= WRK_228_Horatio;
	condition		= WRK_228_Horatio_HELLO_Condition;
	information		= WRK_228_Horatio_HELLO_Info;
	important		= TRUE;
};

func int WRK_228_Horatio_HELLO_Condition()
{
	if (C_NpcIsInvincible(hero))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_228_Horatio_HELLO_Info()
{
	AI_Output(self, hero, "WRK_228_HELLO_09_01"); //Ich glaube meine müden Augen lassen mich im Stich, bist du es wirklich?
	AI_Output(hero, self, "WRK_228_HELLO_15_02"); //Wie geht es diesem Reislord und seinem Handlanger Lefty?
	AI_Output(self, hero, "WRK_228_HELLO_09_03"); //Keine Ahnung, aber du hast ihnen ja damals gezeigt, wo der Hammer hängt.
	AI_Output(self, hero, "WRK_228_HELLO_09_04"); //Seit dem Zusammenbruch der Barriere habe ich sie allerdings beide nicht mehr gesehen.
};

///////////////////////////////////////////////////////////////////////
//	Info NEWCAMP
///////////////////////////////////////////////////////////////////////
instance WRK_228_Horatio_NEWCAMP(C_Info)
{
	npc				= WRK_228_Horatio;
	nr				= 0;
	condition		= WRK_228_Horatio_NEWCAMP_Condition;
	information		= WRK_228_Horatio_NEWCAMP_Info;
	description		= "Warum bist du nicht mehr im Neuen Lager?";
};

func int WRK_228_Horatio_NEWCAMP_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_228_Horatio_HELLO))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_228_Horatio_NEWCAMP_Info()
{
	AI_Output(hero, self, "WRK_228_NEWCAMP_15_01"); //Warum bist du nicht mehr im Neuen Lager?
	AI_Output(self, hero, "WRK_228_NEWCAMP_09_02"); //Der Zusammenbruch der Barriere wurde von schwersten Beben begleitet.
	AI_Output(self, hero, "WRK_228_NEWCAMP_09_03"); //Banditen und Söldner verfielen in Panik und rannten entweder planlos umher oder gingen sich gegenseitig an die Gurgel.
	AI_Output(self, hero, "WRK_228_NEWCAMP_09_04"); //Nur sehr wenige entkamen diesem Hexenkessel an jenem Tag. Ich war einer davon!
	AI_Output(self, hero, "WRK_228_NEWCAMP_09_05"); //Hier fand ich, wie andere auch, einen einigermassen sicheren Zufluchtsort.
};

///////////////////////////////////////////////////////////////////////
//	Info WATERMAGES
///////////////////////////////////////////////////////////////////////
instance WRK_228_Horatio_WATERMAGES(C_Info)
{
	npc				= WRK_228_Horatio;
	nr				= 0;
	condition		= WRK_228_Horatio_WATERMAGES_Condition;
	information		= WRK_228_Horatio_WATERMAGES_Info;
	description		= "Wie ist es den Wassermagiern ergangen?";
};

func int WRK_228_Horatio_WATERMAGES_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_WHATNEXT)
	&& Npc_KnowsInfo(hero, WRK_228_Horatio_NEWCAMP))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_228_Horatio_WATERMAGES_Info()
{
	AI_Output(hero, self, "WRK_228_WATERMAGES_15_01"); //Wie ist es den Wassermagiern ergangen?
	AI_Output(self, hero, "WRK_228_WATERMAGES_09_02"); //Schwer zu sagen. Das neue Lager wurde grösstenteils verschüttet und es trieben sich überall eine Menge Orks herum.
	AI_Output(self, hero, "WRK_228_WATERMAGES_09_03"); //Aber ich weiss, dass der Wassermagier Nefarius mit einigen Söldnern versuchte, sich ebenfalls hier ins Alte Lager zu retten.
	AI_Output(self, hero, "WRK_228_WATERMAGES_09_04"); //Niemand hier im Lager hat je von ihm gehört also denke ich, dass es ihn unterwegs erwischt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info LOOKWHERE
///////////////////////////////////////////////////////////////////////
instance WRK_228_Horatio_LOOKWHERE(C_Info)
{
	npc				= WRK_228_Horatio;
	nr				= 0;
	condition		= WRK_228_Horatio_LOOKWHERE_Condition;
	information		= WRK_228_Horatio_LOOKWHERE_Info;
	description		= "Wo fange ich am besten an, nach Nefarius zu suchen?";
};

func int WRK_228_Horatio_LOOKWHERE_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_228_Horatio_WATERMAGES))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_228_Horatio_LOOKWHERE_Info()
{
	AI_Output(hero, self, "WRK_228_LOOKWHERE_15_01"); //Wo fange ich am besten an, nach Nefarius zu suchen?
	AI_Output(self, hero, "WRK_228_LOOKWHERE_09_02"); //Kennst du noch den Weg von hier ins Neue Lager?
	AI_Output(hero, self, "WRK_228_LOOKWHERE_15_03"); //Ja, von hier aus Richtung Westen durch die Talsenke. Immer den Weg entlang und vorbei an Cavelorns Hütte.
	AI_Output(self, hero, "WRK_228_LOOKWHERE_09_04"); //Richtig!

	B_Story_SetNefariusRemains();
	B_LogEntry(CH1_LearnRunemaking, CH1_LearnRuneMaking_11);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance WRK_228_Horatio_HOWDY(C_Info)
{
	npc				= WRK_228_Horatio;
	nr				= 0;
	condition		= WRK_228_Horatio_HOWDY_Condition;
	information		= WRK_228_Horatio_HOWDY_Info;
	permanent		= TRUE;
	description		= "Was machst du nun?";
};

func int WRK_228_Horatio_HOWDY_Condition()
{
	if (Npc_KnowsInfo(hero, WRK_228_Horatio_NEWCAMP))
	{
		return TRUE;
	};

	return FALSE;
};

func void WRK_228_Horatio_HOWDY_Info()
{
	AI_Output(hero, self, "WRK_228_HOWDY_15_01"); //Was machst du nun?
	AI_Output(self, hero, "WRK_228_HOWDY_09_02"); //Ich setze meine Kraft für friedliche und nützliche Dinge ein.
	AI_Output(self, hero, "WRK_228_HOWDY_09_03"); //Steineklopfen ist da genau das richtige für mich!
	AI_Output(self, hero, "WRK_228_HOWDY_09_04"); //Du solltest es auch mal versuchen!
};
