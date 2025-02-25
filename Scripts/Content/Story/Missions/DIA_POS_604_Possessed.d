///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance POS_604_Possessed_EXIT(C_Info)
{
	npc				= POS_604_Possessed;
	nr				= 999;
	condition		= POS_604_Possessed_EXIT_Condition;
	information		= POS_604_Possessed_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int POS_604_Possessed_EXIT_Condition()
{
	return TRUE;
};

func void POS_604_Possessed_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info CRAZY
///////////////////////////////////////////////////////////////////////
instance POS_604_Possessed_CRAZY(C_Info)
{
	npc				= POS_604_Possessed;
	nr				= 1;
	condition		= POS_604_Possessed_CRAZY_Condition;
	information		= POS_604_Possessed_CRAZY_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int POS_604_Possessed_CRAZY_Condition()
{
	if (C_NPCisinvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void POS_604_Possessed_CRAZY_Info()
{
	if (Pos_Crazy == 0)
	{
		AI_Output(self, hero, "POS_604_CRAZY_00_01"); //Nein, nein geht weg, geht alle weg!
		Pos_Crazy = 1;
		AI_StopProcessInfos(self);
		return;
	};

	if (Pos_Crazy == 1)
	{
		AI_Output(self, hero, "POS_604_CRAZY_00_02"); //Lasst mich in Ruhe, verschwindet!
		Pos_Crazy = 2;
		AI_StopProcessInfos(self);
		return;
	};

	if (Pos_Crazy == 2)
	{
		AI_Output(self, hero, "POS_604_CRAZY_00_03"); //AUUUUUUUUUU !!!!
		Pos_Crazy = 3;
		AI_StopProcessInfos(self);
		return;
	};

	if (Pos_Crazy == 3)
	{
		AI_Output(self, hero, "POS_604_CRAZY_00_04"); //Was wollt ihr denn, ich habe euch nichts getan!
		Pos_Crazy = 4;
		AI_StopProcessInfos(self);
		return;
	};

	if (Pos_Crazy == 4)
	{
		AI_Output(self, hero, "POS_604_CRAZY_00_05"); //Seid still, oh dieser schreckliche Lärm!
		Pos_Crazy = 5;
		AI_StopProcessInfos(self);
		return;
	};

	if (Pos_Crazy == 5)
	{
		AI_Output(self, hero, "POS_604_CRAZY_00_06"); //(schreit)  RUHE RUHE ICH SAGTE RUUUUUUUHHÄÄÄÄÄÄÄÄ !!!!
		Pos_Crazy = 0;
		AI_StopProcessInfos(self);
		return;
	};
};
