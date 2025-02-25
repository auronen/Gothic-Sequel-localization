// *************************************************************************
// 									FIND NPC
// *************************************************************************

instance Info_FindNPC_WRK(C_Info)
{
	nr				= 900;
	condition		= Info_FindNPC_WRK_Condition;
	information		= Info_FindNPC_WRK_Info;
	permanent		= TRUE;
	description		= "Wo finde ich...";
};

func int Info_FindNPC_WRK_Condition()
{
	if ((Npc_KnowsInfo(hero, Infos_Wrk_1_BOSS))
	|| (Npc_KnowsInfo(hero, Infos_Wrk_6_BOSS))
	|| (Npc_KnowsInfo(hero, Infos_Wrk_11_BOSS))) // Info erscheint erst, wenn der Spieler den Namen schon mal gehört hat
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_FindNPC_WRK_Info()
{
	Info_ClearChoices(Info_FindNPC_WRK);
	Info_AddChoice(Info_FindNPC_WRK, DIALOG_BACK, Info_FindNPC_WRK_BACK);

	var C_Npc Bromor; Bromor = Hlp_GetNpc(WRK_203_Bromor);
	if (Bromor.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_WRK, "...Bromor?", Info_FindNPC_WRK_Bromor);
	};

	var C_Npc Gotmar; Gotmar = Hlp_GetNpc(WRK_200_Gotmar);
	if (Gotmar.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_WRK, "...Gotmar?", Info_FindNPC_WRK_Gotmar);
	};
};

func void Info_FindNPC_WRK_BACK()
{
	Info_ClearChoices(Info_FindNPC_WRK);
};

// **********************
// 			Bromor
// **********************

func void Info_FindNPC_WRK_Bromor()
{
	AI_Output(other, self, "Info_FindNPC_Bromor_15_00"); //Wo finde ich Bromor?

	var C_Npc Bromor; Bromor = Hlp_GetNpc(WRK_203_Bromor);

	if ((self.guild == GIL_WORKER)
	&& (self.npcType == NpcType_Ambient))
	{
		if (self.voice == 1)
		{
			AI_Output(self, other, "Info_FindNPC_WRK_Bromor_01_01"); //Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
		};

		if (self.voice == 2)
		{
			AI_Output(self, other, "Info_FindNPC_WRK_Bromor_02_01"); //Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
		};

		if (self.voice == 6)
		{
			AI_Output(self, other, "Info_FindNPC_WRK_Bromor_06_01"); //Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
		};

		if (self.voice == 11)
		{
			AI_Output(self, other, "Info_FindNPC_WRK_Bromor_11_01"); //Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
		};
	};

	Info_ClearChoices(Info_FindNPC_WRK);
};

func void Info_FindNPC_WRK_Gotmar()
{
	AI_Output(other, self, "Info_FindNPC_Gotmar_15_00"); //Wo finde ich Gotmar?

	var C_Npc Gotmar; Gotmar = Hlp_GetNpc(WRK_200_Gotmar);

	if ((self.guild == GIL_WORKER)
	&& (self.npcType == NpcType_Ambient))
	{
		if (self.voice == 1)
		{
			AI_Output(self, other, "Info_FindNPC_WRK_Gotmar_01_01"); //Wenn du ins Lager reinkommst, ist auf der rechten Seite die Schmiede. Gotmar ist dort den ganzen Tag beschäftigt.
		};

		if (self.voice == 2)
		{
			AI_Output(self, other, "Info_FindNPC_WRK_Gotmar_02_01"); //Wenn du ins Lager reinkommst, ist auf der rechten Seite die Schmiede. Gotmar ist dort den ganzen Tag beschäftigt.
		};

		if (self.voice == 6)
		{
			AI_Output(self, other, "Info_FindNPC_WRK_Gotmar_06_01"); //Vorne am Lagereingang steht die Schmiede. Folge einfach dem Lärm.
		};

		if (self.voice == 11)
		{
			AI_Output(self, other, "Info_FindNPC_WRK_Gotmar_11_01"); //Neben dem Haupteingang ist die Schmiede. Und wo die Schmiede ist, ist der Schmied nicht fern.
		};
	};

	Info_ClearChoices(Info_FindNPC_WRK);
};

// *************************************************************************
// 									ZUWEISUNG
// *************************************************************************

func void B_AssignFindNpc_WRK(var C_Npc slf)
{
	Info_FindNPC_WRK.npc = Hlp_GetInstanceID(slf);
};
