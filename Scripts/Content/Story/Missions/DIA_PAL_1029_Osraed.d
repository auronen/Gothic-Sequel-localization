//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============
//	NSC:		PAL_1029_Osraed
//	Lager:		Bergfestung
//	Durchgang:	Äusseres Tor (rechte Wache)
//	Uhrzeit:	24h
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt(aggressiver mit Waffe ziehen)
//	3.	Nähert der SC sich trotzdem wieder, wird er angegriffen.
//////////////////////////////////////////////////////////////////////////
const string Pal_1029_CHECKPOINT = "VP_PLATEAU_3";

instance PAL_1029_FirstWarn(C_Info)
{
	npc				= PAL_1029_Osraed;
	nr				= 1;
	condition		= PAL_1029_FirstWarn_Condition;
	information		= PAL_1029_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int PAL_1029_FirstWarn_Condition()
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

func void PAL_1029_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);

	AI_Output(self, hero, "PAL_1029_FirstWarn_Info_06_01"); //HALT!
	AI_Output(hero, self, "PAL_1029_FirstWarn_Info_15_02"); //Was ist?
	AI_Output(self, hero, "PAL_1029_FirstWarn_Info_06_03"); //Hier dürfen nur Gefolgsleute des Königs passieren!
	AI_Output(self, hero, "PAL_1029_FirstWarn_Info_06_04"); //Also verschwinde!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero, Pal_1029_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance PAL_1029_LastWarn(C_Info)
{
	npc				= PAL_1029_Osraed;
	nr				= 1;
	condition		= PAL_1029_LastWarn_Condition;
	information		= PAL_1029_LastWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int PAL_1029_LastWarn_Condition()
{
	if (((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetAttitude(self, hero) != ATT_FRIENDLY)
	&& (Npc_GetDistToWP(hero, Pal_1029_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	&& !B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1029_LastWarn_Info()
{
	AI_Output(self, hero, "PAL_1029_LastWarn_06_01"); 		//Noch einen Schritt weiter und wir machen Kleinholz aus dir!

	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero, Pal_1029_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;

	AI_StopProcessInfos(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance PAL_1029_Attack(C_Info)
{
	npc				= PAL_1029_Osraed;
	nr				= 1;
	condition		= PAL_1029_Attack_Condition;
	information		= PAL_1029_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int PAL_1029_Attack_Condition()
{
	if (((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_GetAttitude(self, hero) != ATT_FRIENDLY)
	&& (Npc_GetDistToWP(hero, Pal_1029_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)))
	&& !B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1029_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;

	B_FullStop(self);
	AI_StopProcessInfos(self);					//dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert(self, hero);
	B_SetAttackReason(self, AIV_AR_INTRUDER);
	Npc_SetTarget(self, hero);
	AI_StartState(self, ZS_Attack, 1, "");
};

//------------------------------------------------------------------------
//	EXIT
//------------------------------------------------------------------------
instance PAL_1029_EXIT(C_Info)
{
	npc				= PAL_1029_Osraed;
	nr				= 999;
	condition		= PAL_1029_EXIT_Condition;
	information		= PAL_1029_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int PAL_1029_EXIT_Condition()
{
	return FALSE;
};

func void PAL_1029_EXIT_Info()
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

//------------------------------------------------------------------------
//	Info SOLDIER
//------------------------------------------------------------------------
instance PAL_1029_SOLDIER(C_Info)
{
	npc				= PAL_1029_Osraed;
	nr				= 1;
	condition		= PAL_1029_SOLDIER_Condition;
	information		= PAL_1029_SOLDIER_Info;
	description		= "Lass mich rein, ich möchte Soldat des Königs werden!";
};

func int PAL_1029_SOLDIER_Condition()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1029_SOLDIER_Info()
{
	AI_Output(hero, self, "PAL_1029_SOLDIER_15_01"); //Lass mich rein, ich möchte Soldat des Königs werden!
	AI_Output(self, hero, "PAL_1029_SOLDIER_06_02"); //Die zwei Spinner da vorne am Lagerfeuer möchten auch Soldat werden.
	AI_Output(self, hero, "PAL_1029_SOLDIER_06_03"); //(spöttisch) Fällt dir nichts besseres ein?
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BRIBE
///////////////////////////////////////////////////////////////////////
instance PAL_1029_Osraed_BRIBE(C_Info)
{
	npc				= PAL_1029_Osraed;
	nr				= 0;
	condition		= PAL_1029_Osraed_BRIBE_Condition;
	information		= PAL_1029_Osraed_BRIBE_Info;
	description		= "Lass mich rein, es soll nicht dein Schaden sein!";
};

func int PAL_1029_Osraed_BRIBE_Condition()
{
	if (Npc_KnowsInfo(hero, PAL_1029_SOLDIER)
	&& (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1029_Osraed_BRIBE_Info()
{
	AI_Output(hero, self, "PAL_1029_BRIBE_15_01"); //Lass mich rein, es soll nicht dein Schaden sein!
	AI_Output(self, hero, "PAL_1029_BRIBE_06_02"); //(bedrohlich) Soso, du willst mich also bestechen!

	Info_AddChoice(PAL_1029_Osraed_BRIBE, "Wieviel?", PAL_1029_Osraed_BRIBE_YES);
	Info_AddChoice(PAL_1029_Osraed_BRIBE, "Nein, du musst mich missverstanden haben!", PAL_1029_Osraed_BRIBE_NO);
};

func void PAL_1029_Osraed_BRIBE_NO()
{
	Info_ClearChoices(PAL_1029_Osraed_BRIBE);
	AI_Output(hero, self, "PAL_1029_BRIBE_NO_15_01"); //Nein, du musst mich missverstanden haben!
	AI_Output(self, hero, "PAL_1029_BRIBE_NO_06_02"); //Pah! Erst das Maul aufreissen, dann den Schwanz einkneifen.
	AI_StopProcessInfos(self);
};

func void PAL_1029_Osraed_BRIBE_YES()
{
	Info_ClearChoices(PAL_1029_Osraed_BRIBE);
	AI_Output(hero, self, "PAL_1029_BRIBE_YES_15_01"); //Wieviel?
	AI_Output(self, hero, "PAL_1029_BRIBE_YES_06_02"); //100 Silber, darunter läuft nichts!
	BF_OuterGateBribable = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info GIVESILVER
///////////////////////////////////////////////////////////////////////
instance PAL_1029_Osraed_GIVESILVER(C_Info)
{
	npc				= PAL_1029_Osraed;
	nr				= 0;
	condition		= PAL_1029_Osraed_GIVESILVER_Condition;
	information		= PAL_1029_Osraed_GIVESILVER_Info;
	permanent		= TRUE;
	description		= "(100 Silber geben)";
};

func int PAL_1029_Osraed_GIVESILVER_Condition()
{
	if (BF_OuterGateBribable
	&& !BF_OuterGate_Bribed)
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1029_Osraed_GIVESILVER_Info()
{
	if (Npc_HasItems(hero, ItMi_Silver) >= BF_BRIBE_OUTERGATE)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, BF_BRIBE_OUTERGATE);
		AI_Output(hero, self, "PAL_1029_GIVESILVER_15_01"); //Ich sagte doch, es soll nicht dein Schaden sein.
		AI_Output(self, hero, "PAL_1029_GIVESILVER_06_02"); //Wenn du jemanden hiervon erzählst bist du tot!
		AI_Output(self, hero, "PAL_1029_GIVESILVER_06_03"); //Jetzt mach dass du rein kommst und mach keinen Ärger!

		// Wachen auf "Passieren" schalten
		self.aivar[AIV_PASSGATE] = TRUE;
		var C_Npc comrade;
		comrade = Hlp_GetNpc(PAL_1030_Auxiliary);
		comrade.aivar[AIV_PASSGATE] = TRUE;
		BF_OuterGate_Bribed = TRUE;
	}
	else
	{
		B_Say(self, hero, "$NotEnoughSilver");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDYBRIBED
///////////////////////////////////////////////////////////////////////
instance PAL_1029_Osraed_HOWDYBRIBED(C_Info)
{
	npc				= PAL_1029_Osraed;
	nr				= 0;
	condition		= PAL_1029_Osraed_HOWDYBRIBED_Condition;
	information		= PAL_1029_Osraed_HOWDYBRIBED_Info;
	permanent		= TRUE;
	description		= "Gib mir meine 100 Silber zurück!";
};

func int PAL_1029_Osraed_HOWDYBRIBED_Condition()
{
	if (BF_OuterGate_Bribed
	&& BF_InnerGate_Attacked)
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1029_Osraed_HOWDYBRIBED_Info()
{
	AI_Output(hero, self, "PAL_1029_HOWDYBRIBED_15_01"); //Gib mir meine 100 Silber zurück!
	AI_Output(self, hero, "PAL_1029_HOWDYBRIBED_06_02"); //(gekünstelt) Ich weiss nicht wovon du sprichst. Zieh Leine!
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
instance PAL_1029_Osraed_HALTTHORA(C_Info)
{
	npc				= PAL_1029_Osraed;
	condition		= PAL_1029_Osraed_HALTTHORA_Condition;
	information		= PAL_1029_Osraed_HALTTHORA_Info;
	important		= TRUE;
};

func int PAL_1029_Osraed_HALTTHORA_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_OUTERGATE)
	&& B_NpcIsNear(hero, AMZ_900_Thora))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1029_Osraed_HALTTHORA_Info()
{
	var C_Npc thora;
	thora = Hlp_GetNpc(AMZ_900_Thora);

	AI_Output(self, hero, "PAL_1029_HALTTHORA_06_01"); //HALT! Hier ist kein...

	AI_TurnToNpc(self, thora);
	AI_Output(self, hero, "PAL_1029_HALTTHORA_06_02"); //(schmierig) Ah, Thora...! Mein Einladung zu einer Flasche Wein steht immer noch.!
	AI_TurnToNpc(thora, self);
	AI_Output(thora, hero, "PAL_1029_HALTTHORA_06_03"); //(kalt) Träum weiter, Schmierlocke!
	AI_TurnToNpc(self, hero);

	AI_Output(self, hero, "PAL_1029_HALTTHORA_06_04"); //Gut du kannst passieren!
	AI_Output(self, hero, "PAL_1029_HALTTHORA_06_05"); //Ach nochwas...
	AI_Output(hero, self, "PAL_1029_HALTTHORA_15_06"); //Was?
	AI_Output(self, hero, "PAL_1029_HALTTHORA_06_07"); //(leise) Nur das das klar ist. Finger weg von Thora, sie gehört mir (krankes Lachen)!

	// Wachen auf "Passieren" schalten
	self.aivar[AIV_PASSGATE] = TRUE;
	var C_Npc comrade;
	comrade = Hlp_GetNpc(PAL_1030_Auxiliary);
	comrade.aivar[AIV_PASSGATE] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info FODDER
///////////////////////////////////////////////////////////////////////
instance PAL_1029_Osraed_FODDER(C_Info)
{
	npc				= PAL_1029_Osraed;
	nr				= 0;
	condition		= PAL_1029_Osraed_FODDER_Condition;
	information		= PAL_1029_Osraed_FODDER_Info;
	description		= "Ihr seid also das billige Orkfutter der Paladine?";
};

func int PAL_1029_Osraed_FODDER_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_OUTERGATE))
	{
		return TRUE;
	};

	return FALSE;
};

func void PAL_1029_Osraed_FODDER_Info()
{
	AI_Output(hero, self, "PAL_1029_FODDER_15_01"); //Ihr seid also das billige Orkfutter der Paladine?
	if (B_NpcIsNear(hero, AMZ_900_Thora))
	{
		AI_Output(self, hero, "PAL_1029_FODDER_06_02"); //(gepresst) Wenn du nicht mit Thora hier angekommen wärst, dann würde ich dich jetzt einen Kopf kürzer machen.
	}
	else
	{
		AI_Output(self, hero, "PAL_1029_FODDER_06_03"); //Na warte, diese Beleidigung wirst du mit Deinem Leben bezahlen!
		B_SetAttitude(self, ATT_HOSTILE);
	};

	AI_StopProcessInfos(self);
};
