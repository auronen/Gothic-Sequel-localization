instance Reparation(C_Info)
{
	nr				= 10;
	condition		= Reparation_Condition;
	information		= Reparation_Info;
	permanent		= TRUE;
	important		= TRUE;
	description		= "Reparationsauftragslösung";
};

func int Reparation_Condition()
{
	PrintDebugNpc(PD_ZS_CHECK, "Reparation_Condition");
	if (int_ReparationRunning
	&& C_NpcIsInvincible(hero)
	&& B_ReperationDone())
	{
		PrintDebugNpc(PD_ZS_CHECK, "Reparation_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void Reparation_Info()
{
	Info_ClearChoices(Reparation);

	B_Say(self, other, "$REGRETACCEPTED");
	int_Murdercount = 0;
	AI_StopProcessInfos(self);
};

func void B_AssignReparationDialog(var C_Npc this)
{
	PrintDebugNpc(PD_ZS_CHECK, "AssignReparationInfos");

	Reparation.npc = Hlp_GetInstanceID(this);
};
