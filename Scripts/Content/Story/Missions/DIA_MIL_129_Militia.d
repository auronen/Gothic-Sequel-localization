///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////

// Haben keine Exit,weil schon AmbientInfos vorhanden sind!

///////////////////////////////////////////////////////////////////////
//	Info STOP
///////////////////////////////////////////////////////////////////////
instance MIL_129_Militia_STOP(C_Info)
{
	npc				= MIL_129_Militia;
	nr				= 1;
	condition		= MIL_129_Militia_STOP_Condition;
	information		= MIL_129_Militia_STOP_Info;
	important		= TRUE;
};

func int MIL_129_Militia_STOP_Condition()
{
	if (Npc_IsInRoutine(self, ZS_GuardFP)
	&& (Npc_GetDistToWP(self, "OCR_OUTSIDE_CAMPFIRE_D_1") <= 700)
	&& !Npc_KnowsInfo(hero, MIL_130_Militia_STOP))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_129_Militia_STOP_Info()
{
	AI_Output(self, hero, "MIL_129_STOP_00_01"); //HALT! Du betrittst jetzt das Viertel der Kranken!
	AI_Output(hero, self, "MIL_129_STOP_15_02"); //Ja und?
	AI_Output(self, hero, "MIL_129_STOP_00_03"); //Niemand weiß, was es mit der Krankheit auf sich hat. Besser du hälst dich fern von diesen Gestalten!
	AI_Output(hero, self, "MIL_129_STOP_15_04"); //Ich bin vorsichtig.
	AI_StopProcessInfos(self);
};
