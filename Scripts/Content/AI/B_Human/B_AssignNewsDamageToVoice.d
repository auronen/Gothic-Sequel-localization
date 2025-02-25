/////////////////////////////////////////////////////////////////
//	Verteilfunktionen für die Stimmen bei Angriff	(JP)
//	====================================================
//
//	- hier werden die Reaktionen auf Angriff für die einzelnen
//	Stimmnummern vorgenommen
//
//
///////////////////////////////////////////////////////////////////

instance Attacker_Exit(C_Info)
{
	nr				= 999;
	condition		= Attacker_Exit_Condition;
	information		= Attacker_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Attacker_Exit_Condition()
{
	if (self.aivar[AIV_BEENATTACKED] > AIV_NODEED)
	{
		return TRUE;
	};

	return FALSE;
};

func void Attacker_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// -------------------------------------------------------------------------
instance Attacker_ANGRY(C_Info)
{
	nr				= 10;
	condition		= Attacker_ANGRY_Condition;
	information		= Attacker_ANGRY_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int Attacker_ANGRY_Condition()
{
	PrintDebugNpc(PD_ZS_CHECK, "Attacker_ANGRY_Condition");
	if ((self.aivar[AIV_BEENATTACKED] > AIV_NODEED)
	&& (Npc_GetPermAttitude(self, other) == ATT_ANGRY)
	&& C_NpcIsInvincible(hero))
	{
		PrintDebugNpc(PD_ZS_CHECK, "Attacker_Angry_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void Attacker_ANGRY_Info()
{
	Info_ClearChoices(Attacker_ANGRY);

	B_Say(self, other, "$YOUATTACKEDME");

	var string string_buildChoice;

	string_buildChoice = ConcatStrings(NAME_ImSorry, B_SilverAmountToSatisfy_String());
	string_buildChoice = ConcatStrings(string_buildChoice, NAME_ImSorry_postfix);

	Info_AddChoice(Attacker_Angry, string_buildChoice, Attacker_Angry_Lieb);
	Info_AddChoice(Attacker_Angry, "(ignorieren)", Attacker_Angry_HauAb);
};

// -------------------------------------------------------------------------

func void B_AssignDamageInfos(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_CHECK, "AssignDamageInfos");
	Attacker_Exit.npc = Hlp_GetInstanceID(slf);
	Attacker_ANGRY.npc = Hlp_GetInstanceID(slf);
};

func void Attacker_Angry_Lieb()
{
	PrintDebugNpc(PD_ZS_CHECK, "Attacker_Angry_Lieb");

	if (B_HasPlayerSilverToSatisfy())
	{
		B_Say(self, other, "$LetsForgetOurLittleFight");
		B_ExchangeMemoryAttitude();
	}
	else
	{
		var string string_choice;
		string_choice = ConcatStrings(NAME_IwantMore, B_SilverAmountToSatisfy_String());
		_ = PrintScreen(string_choice, -1, _YPOS_MESSAGE_GIVEN, FONT_OLD_SMALL, _TIME_MESSAGE_GIVEN);
	};

	AI_StopProcessInfos(self);
};

func void Attacker_Angry_HauAb()
// Spieler wählt Hau Ab-Option, die Attitüde des Nsc ändert sich nicht und er drückt dem SPieler noch einen Spruch
{
	B_Say(self, other, "$YoullBeSorryForThis");

	AI_StopProcessInfos(self);
	AI_ContinueRoutine(self);
};

func void Attacker_Angry_NoMoney()
{
	AI_StopProcessInfos(self);
};
