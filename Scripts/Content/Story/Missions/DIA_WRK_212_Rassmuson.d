///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance Wrk_212_Rassmuson_EXIT(C_Info)
{
	npc				= Wrk_212_Rassmuson;
	nr				= 999;
	condition		= Wrk_212_Rassmuson_EXIT_Condition;
	information		= Wrk_212_Rassmuson_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Wrk_212_Rassmuson_EXIT_Condition()
{
	return TRUE;
};

func void Wrk_212_Rassmuson_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance Wrk_212_Rassmuson_HI(C_Info)
{
	npc				= Wrk_212_Rassmuson;
	nr				= 12;
	condition		= Wrk_212_Rassmuson_HI_Condition;
	information		= Wrk_212_Rassmuson_HI_Info;
	description		= "Was machst du hier?";
};

func int Wrk_212_Rassmuson_HI_Condition()
{
	return TRUE;
};

func void Wrk_212_Rassmuson_HI_Info()
{
	AI_Output(hero, self, "WRK_212_HI_15_01"); //Was machst du hier?
	AI_Output(self, hero, "WRK_212_HI_01_02"); //Mir reicht's. Diese ewige Plockerei, die Orks, einfach alles.
	AI_Output(self, hero, "WRK_212_HI_01_03"); //Jeden Tag schuften wir uns den Arsch ab,und wofür? Wenn die Orks kommen, sind wir eh Futter!
	AI_Output(self, hero, "WRK_212_HI_01_04"); //Ich kann nicht mehr und ich will nicht mehr.
	AI_Output(hero, self, "WRK_212_HI_15_05"); //Und was willst du tun?
	AI_Output(self, hero, "WRK_212_HI_01_06"); //Ich werde mich absetzen,... aber wenn du das weitererzählst, mache ich dich fertig!
};

///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance Wrk_212_Rassmuson_WHERE(C_Info)
{
	npc				= Wrk_212_Rassmuson;
	nr				= 23;
	condition		= Wrk_212_Rassmuson_WHERE_Condition;
	information		= Wrk_212_Rassmuson_WHERE_Info;
	description		= "Wo willst du denn hin?";
};

func int Wrk_212_Rassmuson_WHERE_Condition()
{
	if (Npc_KnowsInfo(hero, Wrk_212_Rassmuson_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_212_Rassmuson_WHERE_Info()
{
	AI_Output(hero, self, "WRK_212_WHERE_15_01"); //Wo willst du denn hin?
	AI_Output(self, hero, "WRK_212_WHERE_01_02"); //Keine Ahnung. Ich werde mir ein paar Vorräte und einen Bogen mitnehmen und mich den Jägern anschliessen.
	AI_Output(self, hero, "WRK_212_WHERE_01_03"); //Irgendwo finde ich schon eine Höhle wo ich unterkommen kann, bis der ganze Scheiss hier vorbei ist!
	AI_Output(self, hero, "WRK_212_WHERE_01_04"); //Ich warte nur noch auf einen günstigen Augenblick...
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info AGAIN
///////////////////////////////////////////////////////////////////////
instance Wrk_212_Rassmuson_AGAIN(C_Info)
{
	npc				= Wrk_212_Rassmuson;
	nr				= 33;
	condition		= Wrk_212_Rassmuson_AGAIN_Condition;
	information		= Wrk_212_Rassmuson_AGAIN_Info;
	permanent		= TRUE;
	description		= "Na, immer noch da?";
};

func int Wrk_212_Rassmuson_AGAIN_Condition()
{
	if (Npc_KnowsInfo(hero, Wrk_212_Rassmuson_WHERE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_212_Rassmuson_AGAIN_Info()
{
	AI_Output(hero, self, "WRK_212_AGAIN_15_01"); //Na, immer noch da?
	AI_Output(self, hero, "WRK_212_AGAIN_01_02"); //Ja, gute Vorbereitungen brauchen ihre Zeit.
};
