///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance MIL_104_Hyglas_EXIT(C_Info)
{
	npc				= MIL_104_Hyglas;
	nr				= 999;
	condition		= MIL_104_Hyglas_EXIT_Condition;
	information		= MIL_104_Hyglas_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int MIL_104_Hyglas_EXIT_Condition()
{
	return TRUE;
};

func void MIL_104_Hyglas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance MIL_104_Hyglas_HI(C_Info)
{
	npc				= MIL_104_Hyglas;
	nr				= 33;
	condition		= MIL_104_Hyglas_HI_Condition;
	information		= MIL_104_Hyglas_HI_Info;
	description		= "Wie läuft's?";
};

func int MIL_104_Hyglas_HI_Condition()
{
	return TRUE;
};

func void MIL_104_Hyglas_HI_Info()
{
	AI_Output(hero, self, "MIL_104_HI_15_01"); //Wie läuft's?
	AI_Output(self, hero, "MIL_104_HI_08_02"); //Die Magier sind an allem schuld. Erst errichten sie eine riesige Barriere und sie wird größer als sie planen.
	AI_Output(self, hero, "MIL_104_HI_08_03"); //Das muss man sich mal vorstellen! Ich meine, die pfuschen mit Mächten herum, die sie nicht mal verstehen!
	AI_Output(self, hero, "MIL_104_HI_08_04"); //Und nicht genug damit, dann sprengen sie das Teil und alles wird zerstört! Und wieder einmal pfuschen sie mit Mächten herum, die sie nicht verstehen!
	//AI_Output(self, hero, "MIL_104_HI_08_05"); //Draussen im Tal erhebt sich eine riesige Lichtsäule in den Himmel. Und wer pfuscht da wieder dran rum? Die Magier des Königs!
	AI_Output(self, hero, "MIL_104_HI_08_06"); //Die werden uns noch alle umbringen.
	AI_Output(self, hero, "MIL_104_HI_08_07"); //Du sagst ja gar nichts. Wie siehst du das denn?

	Info_AddChoice(MIL_104_Hyglas_HI, "Die Frage ist doch, was machst du mit diesem Wissen?", MIL_104_Hyglas_HI_WHAT);
	Info_AddChoice(MIL_104_Hyglas_HI, "Du bist ein Spinner", MIL_104_Hyglas_HI_IDIOT);
	Info_AddChoice(MIL_104_Hyglas_HI, "Du hast Recht! Die Magier sind an allem Schuld! ", MIL_104_Hyglas_HI_MAGE);
	Info_AddChoice(MIL_104_Hyglas_HI, "Das interessiert mich nicht", MIL_104_Hyglas_HI_DONTKNOW);
};

func void MIL_104_Hyglas_HI_DONTKNOW()
{
	AI_Output(hero, self, "MIL_104_HI_DONTKNOW_15_01"); //Das interessiert mich nicht.
	AI_Output(self, hero, "MIL_104_HI_DONTKNOW_08_02"); //Oh, ... na dann steck deinen Kopf in den Sand und verharre solange, bis du stirbst
	AI_StopProcessInfos(self);
};

func void MIL_104_Hyglas_HI_MAGE()
{
	AI_Output(hero, self, "MIL_104_HI_MAGE_15_01"); //Du hast Recht! Die Magier sind an allem Schuld!
	AI_Output(self, hero, "MIL_104_HI_MAGE_08_02"); //Was ich sage. Denk daran wenn du einen Magier triffst, denn es geht um unser aller Leben!
	AI_StopProcessInfos(self);
};

func void MIL_104_Hyglas_HI_IDIOT()
{
	AI_Output(hero, self, "MIL_104_HI_IDIOT_15_01"); //Du bist ein Spinner.
	AI_Output(self, hero, "MIL_104_HI_IDIOT_08_02"); //Ich hätte dich für schlauer gehalten.
	AI_StopProcessInfos(self);
};

func void MIL_104_Hyglas_HI_WHAT()
{
	AI_Output(hero, self, "MIL_104_HI_WHAT_15_01"); //Die Frage ist doch, was machst du mit diesem Wissen?
	AI_Output(self, hero, "MIL_104_HI_WHAT_08_02"); //Genau. Das ist die entscheidene Frage. Was tun wir?
	AI_Output(self, hero, "MIL_104_HI_WHAT_08_03"); //Sie alle umbringen? Das kann nicht der Weg sein.

	Info_ClearChoices(MIL_104_Hyglas_HI);
	Info_AddChoice(MIL_104_Hyglas_HI, "Ich habe keine Ahnung", MIL_104_Hyglas_HI_WHAT_DONTKNOW);
	Info_AddChoice(MIL_104_Hyglas_HI, "Zuerst mal müssen wir an sie rankommen", MIL_104_Hyglas_HI_WHAT_FIRST);
	Info_AddChoice(MIL_104_Hyglas_HI, "Wir sollten sie alle umbringen!", MIL_104_Hyglas_HI_WHAT_KILLEMALL);
};

func void MIL_104_Hyglas_HI_WHAT_KILLEMALL()
{
	AI_Output(hero, self, "MIL_104_HI_WHAT_KILLEMALL_15_01"); //Wir sollten sie alle umbringen!
	AI_Output(self, hero, "MIL_104_HI_WHAT_KILLEMALL_08_02"); //Das ist 'ne geniale Idee. Die ist so genial, die sollte man eigentlich in Gold aufwiegen.
	AI_Output(self, hero, "MIL_104_HI_WHAT_KILLEMALL_08_03"); //Nur für den Fall das du es versuchen solltest, es war nett dich gekannt zu haben.
	AI_StopProcessInfos(self);
};

func void MIL_104_Hyglas_HI_WHAT_FIRST()
{
	AI_Output(hero, self, "MIL_104_Hyglas_HI_WHAT_FIRST_15_01"); //Zuerst mal müssen wir an sie rankommen.
	AI_Output(self, hero, "MIL_104_Hyglas_HI_WHAT_FIRST_08_02"); //Ja, aber dahin zu gehen kann ziemlich gefährlich sein.
	AI_Output(hero, self, "MIL_104_Hyglas_HI_WHAT_FIRST_15_03"); //Ich denke, die Wege der Magier und mein Weg werden sich bald kreuzen, deshalb werde ich mich um sie kümmern.
	AI_Output(self, hero, "MIL_104_Hyglas_HI_WHAT_FIRST_08_04"); //Wenn du Hilfe brauchst, du kannst auf mich zählen!

	B_GiveXP(XP_Hyglas);
	Log_CreateTopic(CH1_Hyglas, LOG_MISSION);
	Log_SetTopicStatus(CH1_Hyglas, LOG_RUNNING);
	B_LogEntry(CH1_Hyglas, CH1_Hyglas_1);
	B_SetAttitude(self, ATT_FRIENDLY);

	AI_StopProcessInfos(self);
};

func void MIL_104_Hyglas_HI_WHAT_DONTKNOW()
{
	AI_Output(hero, self, "MIL_104_HI_WHAT_DONTKNOW_15_01"); //Ich habe keine Ahnung.
	AI_Output(self, hero, "MIL_104_HI_WHAT_DONTKNOW_08_02"); //Tja, dann werde ich mich wohl alleine darum kümmern.
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info MILITIA
///////////////////////////////////////////////////////////////////////
instance MIL_104_Hyglas_MILITIA(C_Info)
{
	npc				= MIL_104_Hyglas;
	nr				= 23;
	condition		= MIL_104_Hyglas_MILITIA_Condition;
	information		= MIL_104_Hyglas_MILITIA_Info;
	permanent		= TRUE;
	description		= "Wodurch zeichnet sich ein guter Soldat aus?";
};

func int MIL_104_Hyglas_MILITIA_Condition()
{
	return TRUE;
};

func void MIL_104_Hyglas_MILITIA_Info()
{
	AI_Output(hero, self, "MIL_104_MILITIA_15_01"); //Wodurch zeichnet sich ein guter Soldat aus?
	AI_Output(self, hero, "MIL_104_MILITIA_08_02"); //Ein Soldat ist ein Kämpfer. Er ist Beschützer derer, die nicht kämpfen.
	AI_Output(self, hero, "MIL_104_MILITIA_08_03"); //Soldat zu sein, bedeutet mehr, als eine zeitlang eine Waffe zu tragen. Es ist der Weg des Lebens, den du wählst.
	AI_Output(self, hero, "MIL_104_MILITIA_08_04"); //Und wenn du dein Leben danach ausrichtest, wirst du ein guter Soldat.
	AI_Output(self, hero, "MIL_104_MILITIA_08_05"); //Ausserdem kann man gegen eine Menge Leute kämpfen!
};
