// *************************************************************************
// 									FIND NPC
// *************************************************************************

instance Info_FindNPC_MIL(C_Info)
{
	nr				= 900;
	condition		= Info_FindNPC_MIL_Condition;
	information		= Info_FindNPC_MIL_Info;
	permanent		= TRUE;
	description		= "Wo finde ich...";
};

func int Info_FindNPC_MIL_Condition()
{
	if ((Npc_KnowsInfo(hero, Infos_Mil_4_BOSS))
	|| (Npc_KnowsInfo(hero, Infos_Mil_6_BOSS))
	|| (Npc_KnowsInfo(hero, Infos_Mil_7_BOSS))
	|| (Npc_KnowsInfo(hero, Infos_Mil_9_BOSS))) // Info erscheint erst, wenn der Spieler den Namen schon mal gehört hat
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_FindNPC_MIL_Info()
{
	Info_ClearChoices(Info_FindNPC_MIL);
	Info_AddChoice(Info_FindNPC_MIL, DIALOG_BACK, Info_FindNPC_MIL_BACK);

	var C_Npc Berengar; Berengar = Hlp_GetNpc(MIL_103_Berengar);
	if (Berengar.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_MIL, "...Berengar?", Info_FindNPC_MIL_Berengar);
	};

	var C_Npc Brutus; Brutus = Hlp_GetNpc(MIL_121_Brutus);
	if (Brutus.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_MIL, "...Brutus?", Info_FindNPC_MIL_Brutus);
	};

	var C_Npc Halvor; Halvor = Hlp_GetNpc(MIL_100_Halvor);
	if (Halvor.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_MIL, "...Halvor?", Info_FindNPC_MIL_Halvor);
	};

	var C_Npc Cassian; Cassian = Hlp_GetNpc(MIL_119_Cassian);
	if (Cassian.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_MIL, "...Cassian?", Info_FindNPC_MIL_Cassian);
	};
};

func void Info_FindNPC_MIL_BACK()
{
	Info_ClearChoices(Info_FindNPC_MIL);
};

// **********************
// 			Berengar
// **********************

func void Info_FindNPC_MIL_Berengar()
{
	AI_Output(other, self, "Info_FindNPC_Berengar_15_00"); //Wo finde ich Berengar?

	var C_Npc Berengar; Berengar = Hlp_GetNpc(MIL_103_Berengar);

	if ((self.guild == GIL_MILITIA)
	&& (self.npcType == NpcType_Guard))
	{
		if (self.voice == 4)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Berengar_04_01"); //Tagsüber im Burginnenhof. Allerdings solltest du ihm lieber fernbleiben. Er ist leicht reizbar!
		}
		else if (self.voice == 6)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Berengar_06_01"); //Tagsüber im Burginnenhof. Allerdings solltest du ihm lieber fernbleiben. Er ist leicht reizbar!
		}
		else if (self.voice == 7)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Berengar_07_01"); //Tagsüber im Burginnenhof. Allerdings solltest du ihm lieber fernbleiben. Er ist leicht reizbar!
		}
		else if (self.voice == 9)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Berengar_09_01"); //Tagsüber im Burginnenhof. Allerdings solltest du ihm lieber fernbleiben. Er ist leicht reizbar!
		};
	};

	Info_ClearChoices(Info_FindNPC_MIL);
};

func void Info_FindNPC_MIL_Brutus()
{
	AI_Output(other, self, "Info_FindNPC_Brutus_15_00"); //Wo finde ich Brutus?

	var C_Npc Brutus; Brutus = Hlp_GetNpc(MIL_121_Brutus);

	if ((self.guild == GIL_MILITIA)
	&& (self.npcType == NpcType_Guard))
	{
		if (self.voice == 4)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Brutus_04_01"); //Er hängt die meiste Zeit bei der Arena rum. Er trägt auch Kämpfe aus.
		}
		else if (self.voice == 6)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Brutus_06_01"); //Er hängt die meiste Zeit bei der Arena rum. Er trägt auch Kämpfe aus.
		}
		else if (self.voice == 7)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Brutus_07_01"); //Er hängt die meiste Zeit bei der Arena rum. Er trägt auch Kämpfe aus.
		}
		else if (self.voice == 9)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Brutus_09_01"); //Er hängt die meiste Zeit bei der Arena rum. Er trägt auch Kämpfe aus.
		};
	};

	Info_ClearChoices(Info_FindNPC_MIL);
};

func void Info_FindNPC_MIL_Halvor()
{
	AI_Output(other, self, "Info_FindNPC_Halvor_15_00"); //Wo finde ich Halvor?

	var C_Npc Halvor; Halvor = Hlp_GetNpc(MIL_100_Halvor);

	if ((self.guild == GIL_MILITIA)
	&& (self.npcType == NpcType_Guard))
	{
		if (self.voice == 4)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Halvor_04_01"); //Im Burghof ganz rechts ist die Küche. Das ist sein Reich.
		}
		else if (self.voice == 6)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Halvor_06_01"); //Im Burghof ganz rechts ist die Küche. Das ist sein Reich.
		}
		else if (self.voice == 7)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Halvor_07_01"); //Im Burghof ganz rechts ist die Küche. Das ist sein Reich.
		}
		else if (self.voice == 9)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Halvor_09_01"); //Im Burghof ganz rechts ist die Küche. Das ist sein Reich.
		};
	};

	Info_ClearChoices(Info_FindNPC_MIL);
};

func void Info_FindNPC_MIL_Cassian()
{
	AI_Output(other, self, "Info_FindNPC_Halvor_15_00"); //Wo finde ich Cassian?

	var C_Npc Cassian; Cassian = Hlp_GetNpc(MIL_119_Cassian);

	if ((self.guild == GIL_MILITIA)
	&& (self.npcType == NpcType_Guard))
	{
		if (self.voice == 4)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Cassian_04_01"); //Tagsüber trainiert er im Burghof.
		}
		else if (self.voice == 6)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Cassian_06_01"); //Tagsüber trainiert er im Burghof.
		}
		else if (self.voice == 7)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Cassian_07_01"); //Tagsüber trainiert er im Burghof.
		}

		else if (self.voice == 9)
		{
			AI_Output(self, other, "Info_FindNPC_MIL_Cassian_09_01"); //Tagsüber trainiert er im Burghof.
		};
	};

	Info_ClearChoices(Info_FindNPC_MIL);
};

// *************************************************************************
// 									ZUWEISUNG
// *************************************************************************

func void B_AssignFindNPC_MIL(var C_Npc slf)
{
	Info_FindNPC_MIL.npc = Hlp_GetInstanceID(slf);
};
