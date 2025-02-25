instance ReparationReceiver(C_Info)
{
	nr				= 10;
	condition		= ReparationReceiver_Condition;
	information		= ReparationReceiver_Info;
	permanent		= TRUE;
	important		= TRUE;
	description		= "Reparationsauftragsempfänger";
};

func int ReparationReceiver_Condition()
{
	PrintDebugNpc(PD_ZS_CHECK, "ReparationReceiver_Condition");
	if (int_ReparationRunning
	&& C_NpcIsInvincible(hero))
	{
		PrintDebugNpc(PD_ZS_CHECK, "ReparationReceiver_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void ReparationReceiver_Info()
{
	Info_ClearChoices(Reparation);

	B_Say(self, other, "$WHATDOYOUWANT");
	if (Npc_HasItems(other, ItFo_Potion_Health_01) >= 5)
	{
		Info_AddChoice(ReparationReceiver, "Ich bin geschickt worden, dir Heiltränke zu überreichen", ReparationReceiver_Lieb);
	}
	else
	{
		Info_AddChoice(ReparationReceiver, "Keine fünf Heiltränke, zum Entschuldigen", ReparationReceiver_NoGiveAway);
	};
};

func void ReparationReceiver_Lieb()
{
	B_Say(other, self, "$IWANTTOREGRET");

	CreateInvItems(self, ItFo_Potion_Health_01, 5);
	_ = Npc_RemoveInvItems(other, ItFo_Potion_Health_01, 5);
	AI_StopProcessInfos(self);
};

func void ReparationReceiver_NoGiveAway()
{
	AI_StopProcessInfos(self);
};

func void B_AssignReparationReceiver(var C_Npc this)
{
	PrintDebugNpc(PD_ZS_CHECK, "ReparationReceiver_Condition");
	ReparationReceiver.npc = Hlp_GetInstanceID(this);
};
