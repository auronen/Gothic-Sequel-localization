// ************************ EXIT **************************

instance Pos_603_Gonker_Exit(C_Info)
{
	npc				= Pos_603_Gonker;
	nr				= 999;
	condition		= Pos_603_Gonker_Exit_Condition;
	information		= Pos_603_Gonker_Exit_Info;
	permanent		= TRUE;
	description		= Dialog_ENDE;
};

func int Pos_603_Gonker_Exit_Condition()
{
	return TRUE;
};

func void Pos_603_Gonker_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info CRAZY
///////////////////////////////////////////////////////////////////////
instance Pos_603_Gonker_CRAZY(C_Info)
{
	npc				= Pos_603_Gonker;
	nr				= 1;
	condition		= Pos_603_Gonker_CRAZY_Condition;
	information		= Pos_603_Gonker_CRAZY_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int Pos_603_Gonker_CRAZY_Condition()
{
	if (C_NPCisinvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void Pos_603_Gonker_CRAZY_Info()
{
	if (Gonker_Crazy == 0)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_01"); //Ist dir einer gefolgt?
		Gonker_Crazy = 1;
		AI_PlayAni(self, "T_SEARCH");
		AI_StopProcessInfos(self);
		return;
	};

	if (Gonker_Crazy == 1)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_02"); //Haben sie dich geschickt?
		Gonker_Crazy = 2;
		AI_PlayAni(self, "T_STAND_2_MAD");
		AI_StopProcessInfos(self);
		return;
	};

	if (Gonker_Crazy == 2)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_03"); //Sie sind hinter mir her, ich weiß es.
		Gonker_Crazy = 3;
		AI_PlayAni(self, "T_FORGETIT");
		AI_StopProcessInfos(self);
		return;
	};

	if (Gonker_Crazy == 3)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_04"); //Sie werden mich finden, sie finden jeden.
		Gonker_Crazy = 4;
		AI_PlayAni(self, "T_STAND_2_MAD");
		AI_StopProcessInfos(self);
		return;
	};

	if (Gonker_Crazy == 4)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_05"); //Hast du sie gesehen? Ich habe sie schon oft gesehen.
		Gonker_Crazy = 0;
		AI_PlayAni(self, "T_SEARCH");
		AI_StopProcessInfos(self);
		return;
	};

	if (Gonker_Crazy == 4)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_06"); //Sie kommen in der Nacht, wenn wir schlafen
		Gonker_Crazy = 0;
		AI_PlayAni(self, "T_STAND_2_MAD");
		AI_StopProcessInfos(self);
		return;
	};

	if (Gonker_Crazy == 4)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_07"); //Irgendwann kriegen sie dich und dann nehmen sie dich mit.
		Gonker_Crazy = 0;
		AI_PlayAni(self, "T_DONTKNOW");
		AI_StopProcessInfos(self);
		return;
	};

	if (Gonker_Crazy == 4)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_08"); //Sie stecken dich in einen Käfig und fügen dir Schmerzen zu.
		Gonker_Crazy = 0;
		AI_PlayAni(self, "T_STAND_2_MAD");
		AI_StopProcessInfos(self);
		return;
	};

	if (Gonker_Crazy == 4)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_09"); //Sie machen schreckliche Dinge mit dir. Sie qäulen dich.
		Gonker_Crazy = 0;
		AI_PlayAni(self, "T_IGETYOU");
		AI_StopProcessInfos(self);
		return;
	};if (Gonker_Crazy == 4)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_10"); //Ich war schon bei ihnen, aber ich bin ihnen entkommen!
		Gonker_Crazy = 0;
		AI_PlayAni(self, "T_STAND_2_MAD");
		AI_StopProcessInfos(self);
		return;
	};

	if (Gonker_Crazy == 4)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_11"); //Wenn sie mich noch einmal erwischen, werden sie mich töten.
		Gonker_Crazy = 0;
		AI_PlayAni(self, "T_YES");
		AI_StopProcessInfos(self);
		return;
	};

	if (Gonker_Crazy == 4)
	{
		AI_Output(self, hero, "Pos_603_CRAZY_00_12"); //Es sind viele. sie sind überall und sie beobachten alles.
		Gonker_Crazy = 0;
		AI_PlayAni(self, "T_NO");
		AI_StopProcessInfos(self);
		return;
	};
};

/*
//********************************** Permanent *************************************************

instance Pos_603_Gonker_HALLO2(C_Info)
{
	npc				= Pos_603_Gonker;
	nr				= 1;
	condition		= Pos_603_Gonker_HALLO2_Condition;
	information		= Pos_603_Gonker_HALLO2_Info;
	permanent		= TRUE;
	description		= "Du erinnerst Dich noch an mich";
};

func int Pos_603_Gonker_HALLO2_Condition()
{
	if (Npc_KnowsInfo(hero, Pos_603_Gonker_HALLO))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void Pos_603_Gonker_HALLO2_Info()
{
	AI_Output(other, self, "Pos_603_Gonker_HALLO2_Info_15_01"); //Laß Dich beim Feuer machen nicht stören.
	AI_Output(self, other, "Pos_603_Gonker_HALLO2_Info_00_02"); //Ja, ich sollte weiter machen, damit die anderen es warm haben.
};

//**************************************  Hallo  *************************************************

instance Pos_603_Gonker_HALLO(C_Info)
{
	npc				= Pos_603_Gonker;
	nr				= 1;
	condition		= Pos_603_Gonker_HALLO_Condition;
	information		= Pos_603_Gonker_HALLO_Info;
	description		= "Hallo";
};

func int Pos_603_Gonker_HALLO_Condition()
{
	return TRUE;
};

func void Pos_603_Gonker_HALLO_Info()
{
	AI_Output(other, self, "Pos_603_Gonker_HALLO_Info_15_01"); //Hallo...
	AI_Output(self, other, "Pos_603_Gonker_HALLO_Info_00_02"); //Hallo. Darf ich Dir helfen.
	AI_Output(other, self, "Pos_603_Gonker_HALLO_Info_15_03"); //Ja. Wie erklär mir wie Du zu einem Besessenen geworden bist.
	AI_Output(self, other, "Pos_603_Gonker_HALLO_Info_00_04"); //Gern. Ich war mit ein paar Freunden unterwegs, als wir von Dämonen überfallen wurden.
	AI_Output(self, other, "Pos_603_Gonker_HALLO_Info_00_05"); //Die anderen haben sich mit den großen Biestern rumgeschlagen und ich bin noch nicht einmal mit dem kleinen fertig geworden.
	AI_Output(other, self, "Pos_603_Gonker_HALLO_Info_15_06"); //Was ist passiert?
	AI_Output(self, other, "Pos_603_Gonker_HALLO_Info_00_07"); //Er hat mich gebissen und dann bin ich zu dem geworden was ich jetzt bin.
	AI_Output(other, self, "Pos_603_Gonker_HALLO_Info_15_09"); //Wo sind Deine Freunde jetzt?
	AI_Output(self, other, "Pos_603_Gonker_HALLO_Info_00_10"); //Ich weiß nicht.
	AI_Output(other, self, "Pos_603_Gonker_HALLO_Info_15_11"); //Wird Dir geholfen?
	AI_Output(self, other, "Pos_603_Gonker_HALLO_Info_00_12"); //Ja ich bekomme jeden Tag Medizin, aber die hilft nicht wirklich.
	AI_Output(other, self, "Pos_603_Gonker_HALLO_Info_15_13"); //Was denkst du würde helfen?
	AI_Output(self, other, "Pos_603_Gonker_HALLO_Info_00_14"); //Nichts. Mein Sinn besteht nur noch darin den anderen das Ende so angenehm wie möglich zu machen.

	Info_ClearChoices(Pos_603_Gonker_HALLO);

	Info_AddChoice(Pos_603_Gonker_HALLO, "Ich glaube die anderen brauchen noch was.", Pos_603_Gonker_Brauchen);
	Info_AddChoice(Pos_603_Gonker_HALLO, "Das machst Du gut", Pos_603_Gonker_Gut);
};

//*************************************Hallo - Brauchen******************************************
func void Pos_603_Gonker_Brauchen()
{
	AI_Output(other, self, "Pos_603_Gonker_Brauchen_15_01");	//Ich glaube die anderen brauchen noch was.
	AI_Output(self, other, "Pos_603_Gonker_Brauchen_00_02");	//Ahh. dann werde ich mal nachsehen.

	AI_StopProcessInfos(self);
};

//*************************************Hallo - Gut****************************************

func void Pos_603_Gonker_Gut()
{
	Info_ClearChoices(Pos_603_Gonker_HALLO);

	AI_Output(other, self, "Pos_603_Gonker_Gut_15_01");	//Das machst Du gut. Die anderen haben mir schon von Deiner Hilfe erzählt.
	AI_Output(self, other, "Pos_603_Gonker_Gut_00_02");	//Das ist kein Wunder. Ich stehe jeden Morgen früher auf und bereite schon alles vor. Dann, wenn alle......
	AI_Output(self, other, "Pos_603_Gonker_Gut_00_03");	//... und spät abends gehe ich als letzter zu Bett.
	AI_Output(other, self, "Pos_603_Gonker_Gut_15_04");	//Prima ich gehe mal weiter.
	AI_Output(self, other, "Pos_603_Gonker_Gut_00_05");	//Kann ich Dir noch irgendwie helfen.
	AI_Output(other, self, "Pos_603_Gonker_Gut_15_06");	//Nein geht schon, die anderen brauchen Dich dringender.
	AI_Output(self, other, "Pos_603_Gonker_Gut_00_07");	//(Traurig)Wahrscheinlich. Ja, ich werde gebraucht. Bis dann

	AI_StopProcessInfos(self);
};
*/
