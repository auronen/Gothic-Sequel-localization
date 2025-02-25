// ************************ EXIT **************************

instance POS_601_Paskara_Exit(C_Info)
{
	npc				= POS_601_Paskara;
	nr				= 999;
	condition		= POS_601_Paskara_Exit_Condition;
	information		= POS_601_Paskara_Exit_Info;
	permanent		= TRUE;
	description		= Dialog_ENDE;
};

func int POS_601_Paskara_Exit_Condition()
{
	return TRUE;
};

func void POS_601_Paskara_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info CRAZY
///////////////////////////////////////////////////////////////////////
instance POS_601_Paskara_CRAZY(C_Info)
{
	npc				= POS_601_Paskara;
	nr				= 1;
	condition		= POS_601_Paskara_CRAZY_Condition;
	information		= POS_601_Paskara_CRAZY_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int POS_601_Paskara_CRAZY_Condition()
{
	if (C_NPCisinvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void POS_601_Paskara_CRAZY_Info()
{
	if (Paskara_Crazy == 0)
	{
		AI_Output(self, hero, "POS_601_CRAZY_00_01"); //Ist das Leben nicht beschissen?
		Paskara_Crazy = 1;
		AI_StopProcessInfos(self);
		return;
	};

	if (Paskara_Crazy == 1)
	{
		AI_Output(self, hero, "POS_601_CRAZY_00_02"); //Das Leben ist nur eine Qual bis zum Tod. Und danach kommt nichts mehr.
		Paskara_Crazy = 2;
		AI_StopProcessInfos(self);
		return;
	};

	if (Paskara_Crazy == 2)
	{
		AI_Output(self, hero, "POS_601_CRAZY_00_03"); //Alles vergeht. Alles verschimmelt. Alles verdorrt. Alles leidet. Alles stirbt.
		Paskara_Crazy = 3;
		AI_StopProcessInfos(self);
		return;
	};

	if (Paskara_Crazy == 3)
	{
		AI_Output(self, hero, "POS_601_CRAZY_00_04"); //Dasein des Schmerzes    Tot geborener Mensch
		Paskara_Crazy = 4;
		AI_StopProcessInfos(self);
		return;
	};

	if (Paskara_Crazy == 4)
	{
		AI_Output(self, hero, "POS_601_CRAZY_00_05"); //Kaltes Fleisch         Geqäulter Geist       Tote Seele
		Paskara_Crazy = 0;
		AI_StopProcessInfos(self);
		return;
	};
};

/*************************** Permanent *************************************************/
/*
instance POS_601_Paskara_HALLO2(C_Info)
{
	npc				= POS_601_Paskara;
	nr				= 1;
	condition		= POS_601_Paskara_HALLO2_Condition;
	information		= POS_601_Paskara_HALLO2_Info;
	permanent		= TRUE;
	description		= "Ahh, der Königskrieger";
};

func int POS_601_Paskara_HALLO2_Condition()
{
	if (Npc_KnowsInfo(hero, POS_601_Paskara_HALLO))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void POS_601_Paskara_HALLO2_Info()
{
	AI_Output(other, self, "POS_601_Paskara_HALLO2_Info_15_01"); //Ahh, der Königkrieger. Noch nicht gerettet worden?
	AI_Output(self, other, "POS_601_Paskara_HALLO2_Info_00_02"); //Ich weiß er wird mich retten.
};

/*************************** Hallo *************************************************/
/*

instance POS_601_Paskara_HALLO(C_Info)
{
	npc				= POS_601_Paskara;
	nr				= 1;
	condition		= POS_601_Paskara_HALLO_Condition;
	information		= POS_601_Paskara_HALLO_Info;
	description		= "Hallo";
};

func int POS_601_Paskara_HALLO_Condition()
{
	return TRUE;
};

func void POS_601_Paskara_HALLO_Info()
{
	AI_Output(other, self, "POS_601_Paskara_HALLO_Info_15_01"); //Hallo...
	AI_Output(self, other, "POS_601_Paskara_HALLO_Info_00_02"); //(Ängstlich)Haben sie Dich geschickt?

	Info_ClearChoices(POS_601_Paskara_HALLO);
	Info_AddChoice(POS_601_Paskara_HALLO, "Bis bald", POS_601_Paskara_Exit_Info);

	Info_AddChoice(POS_601_Paskara_HALLO, "Wie, wer hat mich geschickt?", POS_601_Paskara_Geschickt);
	Info_AddChoice(POS_601_Paskara_HALLO, "Nein, ich wollte nur ein wenig mit Dir reden.", POS_601_Paskara_Reden);
};

//*******************************************************************************
func void POS_601_Paskara_Geschickt()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Geschickt_15_01");	//Wie, wer hat mich geschickt?
	AI_Output(self, other, "POS_601_Paskara_Geschickt_00_02");	//Die Dämonen. Laß mich in Ruhe, denn die Armee des Königs sucht mich bereits.

	Info_AddChoice(POS_601_Paskara_HALLO, "Welche Dämone?", POS_601_Paskara_Daemonen);
	Info_AddChoice(POS_601_Paskara_HALLO, "Was hast du mit der Armee des Königs zu tun,...", POS_601_Paskara_Koenig1);
};

func void POS_601_Paskara_Daemonen()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Daemonen_15_01");	//Welche Dämonen?
	AI_Output(self, other, "POS_601_Paskara_Daemonen_00_02");	//Nein aus mir wirst Du nichts rausbekommen.

	AI_StopProcessInfos(self);
};

func void POS_601_Paskara_Koenig1()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_PaskaraKoenig1_15_01");	//Was hast du mit der Armee des Königs zu tun, dass Du denkst Sie würden Dich retten?
	AI_Output(self, other, "POS_601_PaskaraKoenig1_00_02");	//Ich bin einer von Ihnen. (Stolz) Ja ich bin in den Diensten des Königs.
	AI_Output(other, self, "POS_601_PaskaraKoenig1_15_03");	//Eigentlich wollte ich wissen, wie Du ein Besessener geworden bist.
	AI_Output(self, other, "POS_601_PaskaraKoenig1_00_04");	//Sie haben Dich also doch geschickt. Vergiss es, ich werde nicht mehr mit Dir reden.

	AI_StopProcessInfos(self);
};

//*****************************Reden****************************************

func void POS_601_Paskara_Reden()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Reden_15_01");	//Nein, ich wollte nur ein wenig mit Dir reden.
	AI_Output(self, other, "POS_601_Paskara_Reden_00_02");	//Gut Du mußt nämlich wissen, dass ich für den König gekämpft habe. Der wird mich retten lassen.
	AI_Output(other, self, "POS_601_Paskara_Reden_15_03");	//Wovor wird er Dich retten?
	AI_Output(self, other, "POS_601_Paskara_Reden_00_04");	//Ich habe mir im Kampf für den König eine todbringende Wunde zugezogen. Hier kann mir niemand helfen. Aber der König wird kommen.
	AI_Output(other, self, "POS_601_Paskara_Reden_15_05");	//Wie bist du an diese Wunde gekommen?
	AI_Output(self, other, "POS_601_Paskara_Reden_00_06");	//Ich habe den König mit meinem Leben verteidigt und bin einem Dämon zu nahe gekommen.

	Info_AddChoice(POS_601_Paskara_HALLO, "Du bist ihm nur zu nahe gekommen und das hat gereicht?", POS_601_Paskara_Nahe);
	Info_AddChoice(POS_601_Paskara_HALLO, "Wow vielleicht kann ich noch etwas von Dir lernen.", POS_601_Paskara_Lernen);
};

func void POS_601_Paskara_Nahe()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Nahe_15_01");	//Du bist ihm nur zu nahe gekommen und das hat gereicht?
	AI_Output(self, other, "POS_601_Paskara_Nahe_00_02");	//Du bist gekommen um mich auszuspionieren, oder?
	AI_Output(other, self, "POS_601_Paskara_Nahe_15_03");	//Nein.
	AI_Output(self, other, "POS_601_Paskara_Nahe_00_04");	//Vergiß es ich werde nicht mit einem Spion sprechen.

	AI_StopProcessInfos(self);
};

func void POS_601_Paskara_Lernen()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Lernen_15_01");	//Wow vielleicht kann ich noch etwas von Dir lernen.
	AI_Output(self, other, "POS_601_Paskara_Lernen_00_02");	//Gerne. Was willst du wissen

	Info_AddChoice(POS_601_Paskara_HALLO, Dialog_Back, POS_601_Paskara_Back);
	Info_AddChoice(POS_601_Paskara_HALLO, "Wie kämpfen die Dämonen?", POS_601_Paskara_Kampf);
	Info_AddChoice(POS_601_Paskara_HALLO, "Mit welchen Waffen kannst Du umgehen?", POS_601_Paskara_Waffen);
	Info_AddChoice(POS_601_Paskara_HALLO, "Wie versucht man Dir hier zu helfen?", POS_601_Paskara_Helfen);
};

func void POS_601_Paskara_Back()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);
};

func void POS_601_Paskara_Kampf()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Kampf_15_01");	//Wie kämpfen die Dämonen.
	AI_Output(self, other, "POS_601_Paskara_Kampf_00_02");	//Es sind immer viele und sie versuchen Dich zu beißen.
};

//**********************Helfen****************
func void POS_601_Paskara_Helfen()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Helfen_15_01");	//Wie versucht man Dir hier zu helfen?
	AI_Output(self, other, "POS_601_Paskara_Helfen_00_02");	//Gar nicht. Hier warten alle nur darauf zu sterben.

	Info_AddChoice(POS_601_Paskara_HALLO, "Und was machst Du?", POS_601_Paskara_Du);
	Info_AddChoice(POS_601_Paskara_HALLO, "Na da ist es ja gut, dass Du bald gerettet wirst", POS_601_Paskara_Bald);
};

func void POS_601_Paskara_Du()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Du_15_01");	//Und was machst Du?
	AI_Output(self, other, "POS_601_Paskara_Du_00_02");	//Was willst Du damit sagen? Nein sprich nicht weiter, ich habe Dir schon viel zu viel erzählt.

	AI_StopProcessInfos(self);
};

func void POS_601_Paskara_Bald()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Bald_15_01");	//Na da ist es ja gut, dass Du bald gerettet wirst
	AI_Output(self, other, "POS_601_Paskara_Bald_00_02");	//Ja ich warte jeden Tag. Aber jetzt laß ich in Ruhe.

	AI_StopProcessInfos(self);
};

//*****************Waffen****************
func void POS_601_Paskara_Waffen()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Waffen_15_01");	 //Mit welchen Waffen kannst Du umgehen.
	AI_Output(self, other, "POS_601_Paskara_Waffen_00_02");	//Mit allen ein wenig. Das reichte mir immer. Ich bin eigentlich...hmmm... ein Spion des Königs. Ich kann mich besonders gut tarnen.

	Info_AddChoice(POS_601_Paskara_HALLO, "Das scheint ja nicht geklappt zu haben bei den Dämonen.", POS_601_Paskara_Geklappt);
	Info_AddChoice(POS_601_Paskara_HALLO, "Bei Kampf gegen die Dämonen bist Du aber doch im direkten Zweikampf gewesen.", POS_601_Paskara_Zweikampf);
};

func void POS_601_Paskara_Geklappt()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Geklappt_15_01");	//Das scheint ja nicht geklappt zu haben bei den Dämonen.
	AI_Output(self, other, "POS_601_Paskara_Geklappt_00_02");	//Nein. Die nehmen einen nicht mit Augen oder Ohren wahr. Eigentlich hätte ich gar nicht gesehen werden können.
};

func void POS_601_Paskara_Zweikampf()
{
	Info_ClearChoices(POS_601_Paskara_HALLO);

	AI_Output(other, self, "POS_601_Paskara_Zweikampf_15_01");	//Bei Kampf gegen die Dämonen bist Du aber doch im direkten Zweikampf gewesen?
	AI_Output(self, other, "POS_601_Paskara_Zweikampf_00_02");	//Nein die hatte mich umzingelt. es waren viele.
};

//*****************************************************************************
*/
