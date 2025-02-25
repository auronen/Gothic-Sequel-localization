///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance MIL_123_Osbert_EXIT(C_Info)
{
	npc				= MIL_123_Osbert;
	nr				= 999;
	condition		= MIL_123_Osbert_EXIT_Condition;
	information		= MIL_123_Osbert_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int MIL_123_Osbert_EXIT_Condition()
{
	return TRUE;
};

func void MIL_123_Osbert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GOTCHA
///////////////////////////////////////////////////////////////////////
instance MIL_123_Osbert_GOTCHA(C_Info)
{
	npc				= MIL_123_Osbert;
	condition		= MIL_123_Osbert_GOTCHA_Condition;
	information		= MIL_123_Osbert_GOTCHA_Info;
	important		= TRUE;
};

func int MIL_123_Osbert_GOTCHA_Condition()
{
	if ((!Npc_HasItems(hero, ItKe_Jail) >= 1)
	&& !Npc_KnowsInfo(hero, MIL_123_Osbert_THIEF)
	&& Npc_KnowsInfo(hero, PC_Thief_STARTRAINING_THIEF))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_123_Osbert_GOTCHA_Info()
{
	AI_Output(self, hero, "MIL_123_GOTCHA_00_01"); //Halt! Was hast du hier zu suchen?
	AI_Output(hero, self, "MIL_123_GOTCHA_15_02"); //Ich seh mich nur mal um.
	AI_Output(self, hero, "MIL_123_GOTCHA_00_03"); //Umsehen- okay. Aber halt die Flossen still. Wenn du versuchst irgendwas mitgehen zu lassen, dann bekommst du Ärger.
	AI_Output(hero, self, "MIL_123_GOTCHA_15_04"); //Kein Problem, ich steck schon nichts ein...
	AI_TurnAway(hero, self);
	AI_Output(hero, self, "MIL_123_GOTCHA_15_05"); //(halblaut) ...und wenn, dann würdest du es sowieso nicht mitkriegen...

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info THIEF
///////////////////////////////////////////////////////////////////////
instance MIL_123_Osbert_THIEF(C_Info)
{
	npc				= MIL_123_Osbert;
	condition		= MIL_123_Osbert_THIEF_Condition;
	information		= MIL_123_Osbert_THIEF_Info;
	important		= TRUE;
};

func int MIL_123_Osbert_THIEF_Condition()
{
	if (Npc_HasItems(hero, ItKe_Jail))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_123_Osbert_THIEF_Info()
{
	AI_GotoNpc(self, hero);
	AI_Output(self, hero, "MIL_123_THIEF_00_01"); //Hab ich dich erwischt! Du hast doch bestimmt was mitgenommen!
	B_GiveInvItems(hero, self, Itke_Jail, 1);
	AI_Output(self, hero, "MIL_123_THIEF_00_02"); //Aha! Der Kerkerschlüssel, wußte ich es doch! Der bleibt hier! Und du verschwindest jetzt besser!

	B_LogEntry(CH1_TrainSneak, CH1_TrainSneak_1);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance MIL_123_Osbert_HI(C_Info)
{
	npc				= MIL_123_Osbert;
	nr				= 23;
	condition		= MIL_123_Osbert_HI_Condition;
	information		= MIL_123_Osbert_HI_Info;
	permanent		= TRUE;
	description		= "Was gibt's Neues?";
};

func int MIL_123_Osbert_HI_Condition()
{
	return TRUE;
};

func void MIL_123_Osbert_HI_Info()
{
	AI_Output(hero, self, "MIL_123_HI_15_01"); //Was gibt's Neues?
	AI_Output(self, hero, "MIL_123_HI_07_02"); //Pass auf Bürschchen, mag ja sein das du ein Freund von Diego bist,...
	AI_Output(self, hero, "MIL_123_HI_07_03"); //...aber wenn ich dich beim Rumschnüffeln erwische, dann bist du dran!
};
