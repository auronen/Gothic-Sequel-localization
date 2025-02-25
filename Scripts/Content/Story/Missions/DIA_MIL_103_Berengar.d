instance MIL_103_Berengar_Exit(C_Info)
{
	npc				= MIL_103_Berengar;
	nr				= 999;
	condition		= MIL_103_Berengar_Exit_Condition;
	information		= MIL_103_Berengar_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int MIL_103_Berengar_Exit_Condition()
{
	return TRUE;
};

func void MIL_103_Berengar_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info KINGANGRY
///////////////////////////////////////////////////////////////////////
instance MIL_103_Berengar_KINGANGRY(C_Info)
{
	npc				= MIL_103_Berengar;
	condition		= MIL_103_Berengar_KINGANGRY_Condition;
	information		= MIL_103_Berengar_KINGANGRY_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int MIL_103_Berengar_KINGANGRY_Condition()
{
	if (C_NPCisinvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_103_Berengar_KINGANGRY_Info()
{
	AI_Output(self, hero, "MIL_103_KINGANGRY_08_01"); //Was willst DU von mir? (aggresiv)
};

///////////////////////////////////////////////////////////////////////
//	Info WHOAREYOU
///////////////////////////////////////////////////////////////////////
instance MIL_103_Berengar_WHOAREYOU(C_Info)
{
	npc				= MIL_103_Berengar;
	nr				= 0;
	condition		= MIL_103_Berengar_WHOAREYOU_Condition;
	information		= MIL_103_Berengar_WHOAREYOU_Info;
	description		= "Wer bist du?";
};

func int MIL_103_Berengar_WHOAREYOU_Condition()
{
	return TRUE;
};

func void MIL_103_Berengar_WHOAREYOU_Info()
{
	AI_Output(hero, self, "MIL_103_WHOAREYOU_15_01"); //Wer bist du?
	AI_Output(self, hero, "MIL_103_WHOAREYOU_08_02"); //(aggressiv) Was für eine dämliche Frage!
	AI_Output(self, hero, "MIL_103_WHOAREYOU_08_03"); //Jeder weis doch, dass ich der Hauptmann der Miliz bin.
	AI_Output(self, hero, "MIL_103_WHOAREYOU_08_04"); //Und ich bin niemandem Rechenschaft schuldig, schon garnicht diesem nichtsnutzigen König Rhobar.
	AI_Output(self, hero, "MIL_103_WHOAREYOU_08_05"); //Ist das klar!
};

///////////////////////////////////////////////////////////////////////
//	Info KING
///////////////////////////////////////////////////////////////////////
instance MIL_103_Berengar_KING(C_Info)
{
	npc				= MIL_103_Berengar;
	nr				= 1;
	condition		= MIL_103_Berengar_KING_Condition;
	information		= MIL_103_Berengar_KING_Info;
	description		= "Kannst du mir was über den König erzählen?";
};

func int MIL_103_Berengar_KING_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_103_Berengar_WHOAREYOU))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_103_Berengar_KING_Info()
{
	AI_Output(hero, self, "MIL_103_KING_15_01"); //Kannst du mir was über den König erzählen?
	AI_Output(self, hero, "MIL_103_KING_08_02"); //(laut) Du willst was über den König wissen?...VON MIR?
	AI_Output(self, hero, "MIL_103_KING_08_03"); //Dann will ich dir was über den König sagen.
	AI_Output(self, hero, "MIL_103_KING_08_04"); //Der taucht hier mit seinen gestriegelten Affen auf und steckt seinen Kopf mitsamt seiner Krone ganz tief in den Sand!
	AI_Output(self, hero, "MIL_103_KING_08_05"); //Der soll mir mal im Dunkeln begegnen, der König! Den werde ich noch ganz woanders reinstecken den König!
};

///////////////////////////////////////////////////////////////////////
//	Info ABOUT
///////////////////////////////////////////////////////////////////////
instance MIL_103_Berengar_ABOUT(C_Info)
{
	npc				= MIL_103_Berengar;
	nr				= 13;
	condition		= MIL_103_Berengar_ABOUT_Condition;
	information		= MIL_103_Berengar_ABOUT_Info;
	permanent		= TRUE;
	description		= "Kannst du mich im Kampf trainieren?";
};

func int MIL_103_Berengar_ABOUT_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_103_Berengar_WHOAREYOU))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_103_Berengar_ABOUT_Info()
{
	AI_Output(hero, self, "MIL_103_ABOUT_15_01"); //Kannst du mich im Kampf trainieren?
	AI_Output(self, hero, "MIL_103_ABOUT_08_02"); //(laut) NEIN, ich bin beschäftigt, siehst du das nicht?
	AI_Output(self, hero, "MIL_103_ABOUT_08_03"); //Besorg dir eine Waffe und wende dich an Cassian. Er kümmert sich um Typen wie dich!
};

///////////////////////////////////////////////////////////////////////
//	Info WHERECASSIAN
///////////////////////////////////////////////////////////////////////
instance MIL_103_Berengar_WHERECASSIAN(C_Info)
{
	npc				= MIL_103_Berengar;
	nr				= 0;
	condition		= MIL_103_Berengar_WHERECASSIAN_Condition;
	information		= MIL_103_Berengar_WHERECASSIAN_Info;
	description		= "Wo finde ich diesen Cassian?";
};

func int MIL_103_Berengar_WHERECASSIAN_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_103_Berengar_ABOUT)
	&& !Npc_KnowsInfo(hero, Mil_119_Cassian_HI))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_103_Berengar_WHERECASSIAN_Info()
{
	AI_Output(hero, self, "MIL_103_WHERECASSIAN_15_01"); //Wo finde ich diesen Cassian?
	AI_Output(self, hero, "MIL_103_WHERECASSIAN_08_02"); //Bei den Rekruten im Burghof. Kannst ihn nicht verfehlen, er trägt eine sehr auffällige Rüstung.
};
