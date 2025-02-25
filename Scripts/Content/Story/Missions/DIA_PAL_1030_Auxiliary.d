//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============
//	NSC:		PAL_1030_Auxiliary
//	Lager:		Bergfestung
//	Durchgang:	Äusseres Tor (linke Wache)
//	Uhrzeit:	24h
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	Nähert der SC sich trotzdem wieder, wird er angegriffen.
//////////////////////////////////////////////////////////////////////////
const string Pal_1030_CHECKPOINT = "VP_PLATEAU_3";

instance PAL_1030_FirstWarn(C_Info)
{
	npc				= PAL_1030_Auxiliary;
	nr				= 1;
	condition		= PAL_1030_FirstWarn_Condition;
	information		= PAL_1030_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int PAL_1030_FirstWarn_Condition()
{
	if (((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetAttitude(self, hero) != ATT_FRIENDLY)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	&& !B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1030_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);

	AI_Output(self, hero, "PAL_1030_FirstWarn_Info_07_01"); //HEH DU DA!
	AI_Output(hero, self, "PAL_1030_FirstWarn_Info_15_02"); //Äh ich?
	AI_Output(self, hero, "PAL_1030_FirstWarn_Info_07_03"); //Du gehörst nicht zum Gefolge des Königs!
	AI_Output(self, hero, "PAL_1030_FirstWarn_Info_07_04"); //Also ziehe Leine, sonst mach ich dir Beine!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero, Pal_1030_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance PAL_1030_LastWarn(C_Info)
{
	npc				= PAL_1030_Auxiliary;
	nr				= 1;
	condition		= PAL_1030_LastWarn_Condition;
	information		= PAL_1030_LastWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int PAL_1030_LastWarn_Condition()
{
	if (((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetAttitude(self, hero) != ATT_FRIENDLY)
	&& (Npc_GetDistToWP(hero, Pal_1030_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	&& !B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1030_LastWarn_Info()
{
	AI_Output(self, hero, "PAL_1030_LastWarn_07_01"); 		//KEINEN SCHRITT WEITER!
	AI_Output(self, hero, "PAL_1030_LastWarn_07_02"); 		//Oder du siehst die Radieschen von unten!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero, Pal_1030_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance PAL_1030_Attack(C_Info)
{
	npc				= PAL_1030_Auxiliary;
	nr				= 1;
	condition		= PAL_1030_Attack_Condition;
	information		= PAL_1030_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int PAL_1030_Attack_Condition()
{
	if (((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetAttitude(self, hero) != ATT_FRIENDLY)
	&& (Npc_GetDistToWP(hero, Pal_1030_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	&& !B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1030_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;

	B_FullStop(self);
	AI_StopProcessInfos(self);					//dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert(self, other);
	B_SetAttackReason(self, AIV_AR_INTRUDER);
	Npc_SetTarget(self, hero);
	AI_StartState(self, ZS_Attack, 1, "");
};

//------------------------------------------------------------------------
//	EXIT
//------------------------------------------------------------------------
instance PAL_1030_EXIT(C_Info)
{
	npc				= PAL_1030_Auxiliary;
	nr				= 999;
	condition		= PAL_1030_EXIT_Condition;
	information		= PAL_1030_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int PAL_1030_EXIT_Condition()
{
	return TRUE;
};

func void PAL_1030_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##					Einlass ohne Thora
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info WANTIN
///////////////////////////////////////////////////////////////////////
instance PAL_1030_Auxiliary_WANTIN(C_Info)
{
	npc				= PAL_1030_Auxiliary;
	nr				= 10;
	condition		= PAL_1030_Auxiliary_WANTIN_Condition;
	information		= PAL_1030_Auxiliary_WANTIN_Info;
	permanent		= TRUE;
	description		= "Ich möchte in die Festung!";
};

func int PAL_1030_Auxiliary_WANTIN_Condition()
{
	if (!B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1030_Auxiliary_WANTIN_Info()
{
	AI_Output(hero, self, "PAL_1030_WANTIN_15_01"); //Ich möchte in die Festung!
	AI_Output(self, hero, "PAL_1030_WANTIN_07_02"); //Sprich mit Osraed, er hat am Tor das Sagen!
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##					Einlass mit Thora
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info HALTTHORA
///////////////////////////////////////////////////////////////////////
instance PAL_1030_Auxiliary_HALTTHORA(C_Info)
{
	npc				= PAL_1030_Auxiliary;
	condition		= PAL_1030_Auxiliary_HALTTHORA_Condition;
	information		= PAL_1030_Auxiliary_HALTTHORA_Info;
	important		= TRUE;
};

func int PAL_1030_Auxiliary_HALTTHORA_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_OUTERGATE)
	&& B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1030_Auxiliary_HALTTHORA_Info()
{
	AI_Output(self, hero, "PAL_1030_HALTTHORA_07_01"); //HEH DU DA!
	AI_Output(self, hero, "PAL_1030_HALTTHORA_07_02"); //(misstrauisch) Thoras Kamerad, wie?
	AI_Output(self, hero, "PAL_1030_HALTTHORA_07_03"); //OK, kannst passieren!
	AI_StopProcessInfos(self);
};
