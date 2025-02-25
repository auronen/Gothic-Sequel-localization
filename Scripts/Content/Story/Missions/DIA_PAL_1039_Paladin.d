//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============
//	NSC:		PAL_1039_Paladin
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
const string PAL_1039_CHECKPOINT = "BF_BRIDGE_02";

instance PAL_1039_FirstWarn(C_Info)
{
	npc				= PAL_1039_Paladin;
	nr				= 1;
	condition		= PAL_1039_FirstWarn_Condition;
	information		= PAL_1039_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int PAL_1039_FirstWarn_Condition()
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

func void PAL_1039_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);

	AI_Output(self, hero, "PAL_1039_FirstWarn_Info_07_01"); //HALT!
	AI_Output(hero, self, "PAL_1039_FirstWarn_Info_15_02"); //Kann ich passieren!
	AI_Output(SELF, HERO, "PAL_1039_FIRSTWARN_INFO_07_03"); //NEIN!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero, PAL_1039_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance PAL_1039_LastWarn(C_Info)
{
	npc				= PAL_1039_Paladin;
	nr				= 1;
	condition		= PAL_1039_LastWarn_Condition;
	information		= PAL_1039_LastWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int PAL_1039_LastWarn_Condition()
{
	if (((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetAttitude(self, hero) != ATT_FRIENDLY)
	&& (Npc_GetDistToWP(hero, PAL_1039_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	&& !B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1039_LastWarn_Info()
{
	AI_Output(self, hero, "PAL_1039_LastWarn_07_01"); 		//BLEIB SOFORT STEHEN!!!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero, PAL_1039_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance PAL_1039_Attack(C_Info)
{
	npc				= PAL_1039_Paladin;
	nr				= 1;
	condition		= PAL_1039_Attack_Condition;
	information		= PAL_1039_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int PAL_1039_Attack_Condition()
{
	if (((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetAttitude(self, hero) != ATT_FRIENDLY)
	&& (Npc_GetDistToWP(hero, PAL_1039_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	&& !B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1039_Attack_Info()
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
instance PAL_1039_EXIT(C_Info)
{
	npc				= PAL_1039_Paladin;
	nr				= 999;
	condition		= PAL_1039_EXIT_Condition;
	information		= PAL_1039_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int PAL_1039_EXIT_Condition()
{
	return TRUE;
};

func void PAL_1039_EXIT_Info()
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
instance PAL_1039_Paladin_WANTIN(C_Info)
{
	npc				= PAL_1039_Paladin;
	nr				= 10;
	condition		= PAL_1039_Paladin_WANTIN_Condition;
	information		= PAL_1039_Paladin_WANTIN_Info;
	permanent		= TRUE;
	description		= "Warum kann ich nicht in die Festung?";
};

func int PAL_1039_Paladin_WANTIN_Condition()
{
	if (!B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1039_Paladin_WANTIN_Info()
{
	AI_Output(hero, self, "PAL_1039_WANTIN_15_01"); //Warum kann ich nicht in die Festung?
	AI_Output(self, hero, "PAL_1039_WANTIN_07_02"); //Du siehst nicht aus wie ein Gefolgsmann des Königs!
	BF_InnerGate_Bribable = TRUE;
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BRIBE
///////////////////////////////////////////////////////////////////////
instance PAL_1039_Paladin_BRIBE(C_Info)
{
	npc				= PAL_1039_Paladin;
	nr				= 0;
	condition		= PAL_1039_Paladin_BRIBE_Condition;
	information		= PAL_1039_Paladin_BRIBE_Info;
	description		= "Vielleicht kann ein wenig Silber das ändern.";
};

func int PAL_1039_Paladin_BRIBE_Condition()
{
	if (BF_InnerGate_Bribable)
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1039_Paladin_BRIBE_Info()
{
	AI_Output(hero, self, "PAL_1039_BRIBE_15_01"); //Vielleicht kann ein wenig Silber das ändern.
	AI_Output(self, hero, "PAL_1039_BRIBE_08_02"); //(wütend) Soldat des Königs sind unbestechlich!
	AI_Output(self, hero, "PAL_1039_BRIBE_08_03"); //Ich werde dafür sorgen, dass du das nie vergisst!
	B_AttackProper(self, hero);
	BF_InnerGate_Attacked = TRUE;
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
instance PAL_1039_Paladin_HALTTHORA(C_Info)
{
	npc				= PAL_1039_Paladin;
	condition		= PAL_1039_Paladin_HALTTHORA_Condition;
	information		= PAL_1039_Paladin_HALTTHORA_Info;
	important		= TRUE;
};

func int PAL_1039_Paladin_HALTTHORA_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_OUTERGATE)
	&& B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1039_Paladin_HALTTHORA_Info()
{
	var C_Npc thora;
	thora = Hlp_GetNpc(AMZ_900_Thora);

	AI_TurnToNpc(self, thora);

	AI_Output(self, hero, "PAL_1039_HALTTHORA_07_01"); //Thora, du kannst passieren...mit Begleitung!

	AI_StopProcessInfos(self);
};
