// ************************ EXIT **************************

instance DMC_800_Xardas_Exit(C_Info)
{
	npc				= DMC_800_Xardas;
	nr				= 999;
	condition		= DMC_800_Xardas_Exit_Condition;
	information		= DMC_800_Xardas_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DMC_800_Xardas_Exit_Condition()
{
	return TRUE;
};

func void DMC_800_Xardas_Exit_Info()
{
	if (chapter == 1)
	{
		Npc_ExchangeRoutine(self, "START");
	};

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##					KAPITEL 1 (Startszene)
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info BACK
///////////////////////////////////////////////////////////////////////
instance DMC_800_Xardas_BACK(C_Info)
{
	npc				= DMC_800_Xardas;
	nr				= 1;
	condition		= DMC_800_Xardas_BACK_Condition;
	information		= DMC_800_Xardas_BACK_Info;
	//important		= TRUE;
	description		= "(Startsatz)";
};

func int DMC_800_Xardas_BACK_Condition()
{
	if (subChapter < CH1_ARRIVED_AT_OC)
	{
		return TRUE;
	};

	return FALSE;
};

func void DMC_800_Xardas_BACK_Info()
{
	B_Story_PrintStart();

	B_SetAttitude(self, ATT_FRIENDLY);

	AI_Output(self, hero, "DMC_800_BACK_14_01"); //...und das ist alles was passiert ist, seit du verschüttet wurdest.
	AI_Output(hero, self, "DMC_800_BACK_15_02"); //Du warst doch auch im Tempel, als ich gegen den Schläfer kämpfte.
	AI_Output(self, hero, "DMC_800_BACK_14_03"); //Ich konnte mit letzter Kraft entkommen, bevor der Tempel einstürzte.
	AI_Output(self, hero, "DMC_800_BACK_14_04"); //Seitdem habe ich nach dir gesucht.

	Info_AddChoice(DMC_800_Xardas_BACK, "Jetzt wird das Tal also von den Orcs belagert.", DMC_800_Xardas_BACK_PROBLEM);
};

func void DMC_800_Xardas_BACK_PROBLEM()
{
	AI_Output(hero, self, "DMC_800_BACK_PROBLEM_15_01"); //Jetzt wird das Tal also von den Orcs belagert und wir sitzen immer noch fest.
	AI_Output(self, hero, "DMC_800_BACK_PROBLEM_14_02"); //So ist es. Aber das ist leider noch nicht unser schlimmstes Problem.

	Info_ClearChoices(DMC_800_Xardas_BACK);
};

///////////////////////////////////////////////////////////////////////
//	Info QUEST
///////////////////////////////////////////////////////////////////////
instance DMC_800_Xardas_QUEST(C_Info)
{
	npc				= DMC_800_Xardas;
	nr				= 2;
	condition		= DMC_800_Xardas_QUEST_Condition;
	information		= DMC_800_Xardas_QUEST_Info;
	description		= "Von welchem Problem sprichst du?";
};

func int DMC_800_Xardas_QUEST_Condition()
{
	if (Npc_KnowsInfo(hero, DMC_800_Xardas_BACK))
	{
		return TRUE;
	};

	return FALSE;
};

func void DMC_800_Xardas_QUEST_Info()
{
	AI_Output(hero, self, "DMC_800_QUEST_15_01"); //Von welchem Problem sprichst du?
	AI_Output(self, hero, "DMC_800_QUEST_14_02"); //Der Schläfer versucht von der Dämonenwelt in unsere Welt zurückzukehren. Wenn ihm das gelingt wird er ein ganzes Heer von Dämonen mit sich führen.
	AI_Output(hero, self, "DMC_800_QUEST_15_03"); //Aber wie? Das Tor zur Dämonenwelt ist zerstört.
	AI_Output(self, hero, "DMC_800_QUEST_14_04"); //Das magische Gefüge der Kolonie wurde durch die Zerstörung der Barriere geschwächt.
	AI_Output(self, hero, "DMC_800_QUEST_14_05"); //Schon bald könnte das gesamte Tal ein Tor zur Dämonenwelt sein!

	Info_AddChoice(DMC_800_Xardas_QUEST, "Was können wir dagegen tun?", DMC_800_Xardas_QUEST_STOP);

	Log_CreateTopic(CH1_Demonthreat, LOG_MISSION);
	Log_SetTopicStatus(CH1_Demonthreat, LOG_RUNNING);
	B_LogEntry(CH1_Demonthreat, CH1_DemonThreat_3);
};

func void DMC_800_Xardas_QUEST_STOP()
{
	AI_Output(hero, self, "DMC_800_QUEST_STOP_15_01"); //Was können wir dagegen tun?
	AI_Output(self, hero, "DMC_800_QUEST_STOP_14_02"); //Was wir auch schon zuvor getan haben. Uns den Dämonen entgegestellen!
	AI_Output(self, hero, "DMC_800_QUEST_STOP_14_03"); //Aber zuvor musst du wieder an Kraft gewinnen und verlernte Fähigkeiten zurückerlangen.
	AI_Output(self, hero, "DMC_800_QUEST_STOP_14_04"); //Begib dich ins Alte Lager. Dort ist der geeignete Ort dafür.
	AI_Output(hero, self, "DMC_800_QUEST_STOP_15_05"); //Aber warum ausgerechnet ich?
	AI_Output(self, hero, "DMC_800_QUEST_STOP_14_06"); //Niemand ist besser geeignet als Du. Vertrau mir!

	B_LogEntry(CH1_Demonthreat, CH1_DemonThreat_4);
};

///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance DMC_800_Xardas_WHERE(C_Info)
{
	npc				= DMC_800_Xardas;
	nr				= 5;
	condition		= DMC_800_Xardas_WHERE_Condition;
	information		= DMC_800_Xardas_WHERE_Info;
	description		= "Wann und wo werden die Dämonen durchbrechen?";
};

func int DMC_800_Xardas_WHERE_Condition()
{
	if (Npc_KnowsInfo(hero, DMC_800_Xardas_QUEST))
	{
		return TRUE;
	};

	return FALSE;
};

func void DMC_800_Xardas_WHERE_Info()
{
	AI_Output(hero, self, "DMC_800_WHERE_15_01"); //Wann und wo werden die Dämonen durchbrechen?
	AI_Output(self, hero, "DMC_800_WHERE_14_02"); //Es kann überall im Tal passieren. Ich weiß noch nichts genaues.
	AI_Output(self, hero, "DMC_800_WHERE_14_03"); //Aber ich werde Ort und Zeitpunkt herausfinden.
};

///////////////////////////////////////////////////////////////////////
//	Info LEAVING
///////////////////////////////////////////////////////////////////////
instance DMC_800_Xardas_LEAVING(C_Info)
{
	npc				= DMC_800_Xardas;
	nr				= 6;
	condition		= DMC_800_Xardas_LEAVING_Condition;
	information		= DMC_800_Xardas_LEAVING_Info;
	description		= "Wie kann ich deinen Turm verlassen? ";
};

func int DMC_800_Xardas_LEAVING_Condition()
{
	if (Npc_KnowsInfo(hero, DMC_800_Xardas_QUEST))
	{
		return TRUE;
	};

	return FALSE;
};

func void DMC_800_Xardas_LEAVING_Info()
{
	AI_Output(hero, self, "DMC_800_LEAVING_15_01"); //Wie kann ich deinen Turm verlassen? Du hast nicht zufällig eine Treppe einbauen lassen?
	AI_Output(self, hero, "DMC_800_LEAVING_14_02"); //Ich werde dich zum Alten Lager teleportieren. Sag mir, wenn du bereit bist.
	AI_Output(self, hero, "DMC_800_LEAVING_14_03"); //Aber sei vorsichtig. Es ist sehr gefährlich ausserhalb des Lagers.
};

///////////////////////////////////////////////////////////////////////
//	Info TELEPORT
///////////////////////////////////////////////////////////////////////
instance DMC_800_Xardas_TELEPORT(C_Info)
{
	npc				= DMC_800_Xardas;
	nr				= 5;
	condition		= DMC_800_Xardas_TELEPORT_Condition;
	information		= DMC_800_Xardas_TELEPORT_Info;
	permanent		= TRUE;
	description		= "Ich bin bereit für die Teleportation.";
};

func int DMC_800_Xardas_TELEPORT_Condition()
{
	if (Npc_KnowsInfo(hero, DMC_800_Xardas_LEAVING))
	{
		return TRUE;
	};

	return FALSE;
};

func void DMC_800_Xardas_TELEPORT_Info()
{
	AI_Output(hero, self, "DMC_800_TELEPORT_15_01"); //Ich bin bereit für die Teleportation.

	AI_Output(self, hero, "DMC_800_TELEPORT_14_02"); //Ich gebe dir eine Botschaft für Diego, deinen alten Weggefährten, mit. Er ist mittlerweile der Anführer der Flüchtlinge im Alten Lager.
	B_GiveInvItems(self, hero, ItWr_Xardas_Letter_Sealed, 1);
	AI_Output(self, hero, "DMC_800_TELEPORT_14_03"); //Übergebe ihm das Schriftstück und folge seinem Rat. Er wird wissen, was zu tun ist.
	AI_Output(self, hero, "DMC_800_TELEPORT_14_04"); //Mache dich nun bereit.
	AI_Output(hero, self, "DMC_800_TELEPORT_15_05"); //Wir sehen uns wieder!

	B_LogEntry(CH1_DemonThreat, CH1_DemonThreat_5);

	// Spieler wird vors Alte Lager teleportiert
	AI_StopProcessInfos(self);

	AI_PlayAni(hero, "T_STAND_2_TELEPORT");
	//AI_Snd_Play(hero, "MFX_Heal_Cast");
	AI_Wait(hero, 3);
	AI_Teleport(hero, TELEPORT4_WP);
	AI_PlayAni(hero, "T_TELEPORT_2_STAND");

	self.aivar[AIV_INVINCIBLE] = FALSE;	// SN:Workaround, da dieses Flag durch die Teleportation nicht mehr gelöscht wird!
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};
