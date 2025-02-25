// ************************ EXIT **************************

instance POS_602_Halbert_Exit(C_Info)
{
	npc				= POS_602_Halbert;
	nr				= 999;
	condition		= POS_602_Halbert_Exit_Condition;
	information		= POS_602_Halbert_Exit_Info;
	permanent		= TRUE;
	description		= Dialog_ENDE;
};

func int POS_602_Halbert_Exit_Condition()
{
	return TRUE;
};

func void POS_602_Halbert_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info CRAZY
///////////////////////////////////////////////////////////////////////
instance POS_602_Halbert_CRAZY(C_Info)
{
	npc				= POS_602_Halbert;
	nr				= 1;
	condition		= POS_602_Halbert_CRAZY_Condition;
	information		= POS_602_Halbert_CRAZY_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int POS_602_Halbert_CRAZY_Condition()
{
	if (C_NPCisinvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void POS_602_Halbert_CRAZY_Info()
{
	if (Halbert_Crazy == 0
	&& Wld_IsTime(04, 00, 20, 00))
	{
		AI_Output(self, hero, "POS_602_CRAZY_00_01"); //Des Tages Licht ist meine Agonie.
		Halbert_Crazy = 1;
		AI_StopProcessInfos(self);
		return;
	};

	if (Halbert_Crazy == 1
	&& Wld_IsTime(04, 00, 20, 00))
	{
		AI_Output(self, hero, "POS_602_CRAZY_00_02"); //Der Tag ist eine ewige Qual.
		Halbert_Crazy = 2;
		AI_StopProcessInfos(self);
		return;
	};

	if (Halbert_Crazy == 2
	&& Wld_IsTime(04, 00, 20, 00))
	{
		AI_Output(self, hero, "POS_602_CRAZY_00_03"); //Stunde um Stunde Schmerz um Schmerz.
		Halbert_Crazy = 0;
		AI_StopProcessInfos(self);
		return;
	};

	if (Halbert_Night == 0
	&& Wld_IsTime(20, 00, 04, 00))
	{
		AI_Output(self, hero, "POS_602_CRAZY_00_04"); //Siehst du die Sternbilder?
		AI_Output(self, hero, "POS_602_CRAZY_00_05"); //Sie waren schon da bevor wir waren und sie werden immer sein, wenn wir längst vergangen sind
		Halbert_Night = 1;
		AI_StopProcessInfos(self);
		return;
	};

	if (Halbert_Night == 1
	&& Wld_IsTime(20, 00, 04, 00))
	{
		AI_Output(self, hero, "POS_602_CRAZY_00_06"); //Spürst du die Nacht? Sie währt bereits ewig und sieht niemals das Licht der Sonne.
		Halbert_Night = 2;
		AI_StopProcessInfos(self);
		return;
	};

	if (Halbert_Night == 2
	&& Wld_IsTime(20, 00, 04, 00))
	{
		AI_Output(self, hero, "POS_602_CRAZY_00_07"); //Fühlst du die Dunkelheit?
		AI_Output(self, hero, "POS_602_CRAZY_00_08"); //Sie ist überall, schön und friedlich. Aber die Dunkelheit in dir, nennst du Angst und Zweifel.
		Halbert_Night = 0;
		AI_StopProcessInfos(self);
		return;
	};
};

/*
//********************************** Permanent *************************************************

instance POS_602_Halbert_HALLO2(C_Info)
{
	npc				= POS_602_Halbert;
	nr				= 1;
	condition		= POS_602_Halbert_HALLO2_Condition;
	information		= POS_602_Halbert_HALLO2_Info;
	permanent		= TRUE;
	description		= "Du erinnerst Dich noch an mich";
};

func int POS_602_Halbert_HALLO2_Condition()
{
	if (Npc_KnowsInfo(hero, POS_602_Halbert_HALLO))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void POS_602_Halbert_HALLO2_Info()
{
	AI_Output(other, self, "POS_602_Halbert_HALLO2_Info_15_01"); //Du erinnerst Dich noch an mich?
	AI_Output(self, other, "POS_602_Halbert_HALLO2_Info_00_02"); //Ja,ja.
};

//**************************************  Hallo  *************************************************

instance POS_602_Halbert_HALLO(C_Info)
{
	npc				= POS_602_Halbert;
	nr				= 1;
	condition		= POS_602_Halbert_HALLO_Condition;
	information		= POS_602_Halbert_HALLO_Info;
	description		= "Hallo";
};

func int POS_602_Halbert_HALLO_Condition()
{
	return TRUE;
};

func void POS_602_Halbert_HALLO_Info()
{
	AI_Output(other, self, "POS_602_Halbert_HALLO_Info_15_01"); //Hallo...
	AI_Output(self, other, "POS_602_Halbert_HALLO_Info_00_02"); //Was, wer,...?
	AI_Output(other, self, "POS_602_Halbert_HALLO_Info_15_03"); //Ich bin der Auserwählte.
	AI_Output(self, other, "POS_602_Halbert_HALLO_Info_00_04"); //Ahh, aus dem neuen Lager.

	Info_ClearChoices(POS_602_Halbert_HALLO);

	Info_AddChoice(POS_602_Halbert_HALLO, "Nein ich gehörte ursprünglich zum Alten Lager", POS_602_Halbert_AL);
	Info_AddChoice(POS_602_Halbert_HALLO, "Nein ich gehörte ursprünglich zum Sektenlager", POS_602_Halbert_SL);
	Info_AddChoice(POS_602_Halbert_HALLO, "Ja ich war Mitglied von Lares.", POS_602_Halbert_NL);
	Info_AddChoice(POS_602_Halbert_HALLO, "Nein ich bin neu hier.", POS_602_Halbert_Neu);
};

//*************************************Hallo - AL******************************************
func void POS_602_Halbert_AL()
{
	AI_Output(other, self, "POS_602_Halbert_AL_15_01");	//Nein ich gehörte ursprünglich zum Alten Lager.
	AI_Output(self, other, "POS_602_Halbert_AL_00_02");	//(Schreit) Hilfe....

	AI_StopProcessInfos(self);
};

//*************************************Hallo - SL****************************************

func void POS_602_Halbert_SL()
{
	Info_ClearChoices(POS_602_Halbert_HALLO);

	AI_Output(other, self, "POS_602_Halbert_SL_15_01");	//Nein ich gehörte ursprünglich zum Sektenlager.
	AI_Output(self, other, "POS_602_Halbert_SL_00_02");	//Noch einer der mich vergiften will mit seinen Kräutern. Von wegen liberal.

	Info_AddChoice(POS_602_Halbert_HALLO, Dialog_Back, POS_602_Halbert_Back);
	Info_AddChoice(POS_602_Halbert_HALLO, "Was ist aus dem Sektenlager geworden?", POS_602_Halbert_SLNow);
	Info_AddChoice(POS_602_Halbert_HALLO, "Wieso will dich jemand mit den Kräutern vergiften", POS_602_Halbert_SLtot);
	Info_AddChoice(POS_602_Halbert_HALLO, "Das Sektenlager war nie parteiisch", POS_602_Halbert_Partei);
};

//*** Back ***
func void POS_602_Halbert_Back()
{
	Info_ClearChoices(POS_602_Halbert_HALLO);
};

//*** Kraeuter ***
func void POS_602_Halbert_SLtot()
{
	AI_Output(other, self, "POS_602_Halbert_SLtot_15_01");	//Wieso will dich jemand mit den Kräutern vergiften?
	AI_Output(self, other, "POS_602_Halbert_SLtot_00_02");	//Ich will das Gift nicht. (Schreit) Hilfe...

	AI_StopProcessInfos(self);
};

//*** Partei ***
func void POS_602_Halbert_Partei()
{
	Info_ClearChoices(POS_602_Halbert_HALLO);

	AI_Output(other, self, "POS_602_Halbert_Partei_15_01");	//Das Sektenlager war nie parteiisch.
	AI_Output(self, other, "POS_602_Halbert_Partei_00_02");	//Damit sie Ihr gift an alle verteilen konnten.

	Info_AddChoice(POS_602_Halbert_HALLO, "Konnten? Das heißt es gibt das Sektenlager nicht mehr?", POS_602_Halbert_SLhin);
	Info_AddChoice(POS_602_Halbert_HALLO, "Wir haben kein Gift hergestellt.", POS_602_Halbert_NoGift);
};

func void POS_602_Halbert_SLhin()
{
	AI_Output(other, self, "POS_602_Halbert_SLhin_15_01");	//Konnten? das heißt es gibt das Sektenlager nicht mehr?
	AI_Output(self, other, "POS_602_Halbert_SLhin_00_02");	//Nein. Und jetzt laß mich in Ruhe oder ich schreie um Hilfe.

	AI_StopProcessInfos(self);
};

func void POS_602_Halbert_NoGift()
{
	AI_Output(other, self, "POS_602_Halbert_NoGift_15_01");	//Wir haben kein Gift hergestellt.
	AI_Output(self, other, "POS_602_Halbert_NoGift_00_02");	//Das sagen sie hier auch (Schreit) Hilfe...

	AI_StopProcessInfos(self);
};

//*** SLNow ***
func void POS_602_Halbert_SLNow()
{
	Info_ClearChoices(POS_602_Halbert_HALLO);

	AI_Output(other, self, "POS_602_Halbert_SLNow_15_01");	//Was ist aus dem Sektenlager geworden?
	AI_Output(self, other, "POS_602_Halbert_SLNow_00_02");	//Nein ich will keine Kräuter, das ist sowieso alles Gift und ich habe so schon genug Halluzinationen.

	Info_AddChoice(POS_602_Halbert_HALLO, Dialog_Back, POS_602_Halbert_Back);
	Info_AddChoice(POS_602_Halbert_HALLO, "Ich wollte doch nur wissen, was aus dem Sektenlager geworden ist?", POS_602_Halbert_SLFinal);
	Info_AddChoice(POS_602_Halbert_HALLO, "Du hast Halluzinationen?", POS_602_Halbert_Hallus);
	Info_AddChoice(POS_602_Halbert_HALLO, "Wir haben kein Gift hergestellt!", POS_602_Halbert_NoGift);
};

func void POS_602_Halbert_SLFinal()
{
	AI_Output(other, self, "POS_602_Halbert_SLFinal_15_01"); //Ich wollte doch nur wissen..
	AI_Output(self, other, "POS_602_Halbert_SLFinal_00_02"); //Ich will das Gift nicht. (Schreit) Hilfe...

	AI_StopProcessInfos(self);
};

func void POS_602_Halbert_Hallus()
{
	AI_Output(other, self, "POS_602_Halbert_Hallus_15_01");	//Du hast Halluzinationen.
	AI_Output(self, other, "POS_602_Halbert_Hallus_00_02");	//Ja aber das kennst du ja. Jetzt lass mich in Ruhe.

	AI_StopProcessInfos(self);
};

//**********************Hallo - NL****************
func void POS_602_Halbert_NL()
{
	Info_ClearChoices(POS_602_Halbert_HALLO);

	AI_Output(other, self, "POS_602_Halbert_NL_15_01");	//Ja ich war Mitglied von Lares.
	AI_Output(self, other, "POS_602_Halbert_NL_00_02");	//Gut. Ich warne Dich. Hier versuchen Sie alle ehemaligen Mitglieder des neuen Lagers zu vergiften. Sieh Dir die armen Gestallten hier an.
	AI_Output(self, other, "POS_602_Halbert_NL_00_03");	//Die meisten haben sogar schon vergessen, dass wie sie hergekommen sind. Sie phantasieren und glauben an Dämonen.Pah.

	Info_AddChoice(POS_602_Halbert_HALLO, "Ja das haben sie mir auch alle erzählt", POS_602_Halbert_Erzaehlt);
	Info_AddChoice(POS_602_Halbert_HALLO, "Du bist ja verrückt", POS_602_Halbert_Wirr);
	Info_AddChoice(POS_602_Halbert_HALLO, "Kannst du mir helfen?", POS_602_Halbert_Helfen);
};

func void POS_602_Halbert_Wirr()
{
	AI_Output(other, self, "POS_602_Halbert_Wirr_15_01");	//Du bist ja verrückt.
	AI_Output(self, other, "POS_602_Halbert_Wirr_00_02");	//Nein. Ich habe die Sache durchschaut. Bitte nimm nichts mehr von der Medizin, die verwirrt Dich nur.
	AI_Output(self, other, "POS_602_Halbert_Wirr_00_03");	//Ich habe wichtiges zu tun. Bis bald.

	AI_StopProcessInfos(self);
};

//*** Erzählt ***
func void POS_602_Halbert_Erzaehlt()
{
	Info_ClearChoices(POS_602_Halbert_HALLO);

	AI_Output(other, self, "POS_602_Halbert_Erzaehlt_15_01");	//Ja das haben sie mir auch alle erzählt.
	AI_Output(self, other, "POS_602_Halbert_Erzaehlt_00_02");	//Die armen Seelen. Ich glaube, das neue Lager steht kurz vor einem Angriff auf das Alte Lager und dann werden wir befreit.

	Info_AddChoice(POS_602_Halbert_HALLO, "Hoffentlich", POS_602_Halbert_Hoffentlich);
	Info_AddChoice(POS_602_Halbert_HALLO, "Das neue Lager existiert gar nicht mehr.", POS_602_Halbert_NLtot);
};

func void POS_602_Halbert_Hoffentlich()
{
	AI_Output(other, self, "POS_602_Halbert_Hoffentlich_15_01");	//Hoffentlich. Aber nun werde ich weitergehen. Danke für die Warnung.
	AI_Output(self, other, "POS_602_Halbert_Hoffentlich_00_02");	//Paß auf dich auf

	AI_StopProcessInfos(self);
};

func void POS_602_Halbert_NLtot()
{
	AI_Output(other, self, "POS_602_Halbert_NLtot_15_01");	//Das neue Lager existiert gar nicht mehr.
	AI_Output(self, other, "POS_602_Halbert_NLtot_00_02");	//Oh mist. Dann werden wir von innen aktiv werden müssen. Danke für die Information.
	AI_Output(self, other, "POS_602_Halbert_NLtot_00_03");	//Ich muß die anderen .... hmmm... bis später. (Versingt in Gedanken)

	AI_StopProcessInfos(self);
};

//*** Helfen ***
func void POS_602_Halbert_Helfen()
{
	Info_ClearChoices(POS_602_Halbert_HALLO);

	AI_Output(other, self, "POS_602_Halbert_Helfen_15_01");	//Kannst du mir helfen.
	AI_Output(self, other, "POS_602_Halbert_Helfen_00_02");	//Hier kommt niemand raus. Das haben schon viele versucht. Aber sie sind alle gestorben und glaube mir ich bin scho nlange hier.

	Info_AddChoice(POS_602_Halbert_HALLO, "Nein ich meine wegen der Besessenen", POS_602_Halbert_Besessenen);
	Info_AddChoice(POS_602_Halbert_HALLO, "Das neue Lager wird es schaffen", POS_602_Halbert_Schaffen);
};

func void POS_602_Halbert_Besessenen()
{
	AI_Output(other, self, "POS_602_Halbert_Besessenen_15_01");	//Nein ich meine...
	AI_Output(self, other, "POS_602_Halbert_Besessenen_00_02");	//Vergiß es. Du bist ja ien Spinner. Laß mich in Ruhe. Bis dann.

	AI_StopProcessInfos(self);
};

func void POS_602_Halbert_Schaffen()
{
	AI_Output(other, self, "POS_602_Halbert_Schaffen_15_01");	//Das neue Lager wird es schaffen.
	AI_Output(self, other, "POS_602_Halbert_Schaffen_00_02");	//Ja auf jeden Fall. Wir müssen nur warten und dürfen diese Medizin nicht zu uns nehmen.
	AI_Output(self, other, "POS_602_Halbert_Schaffen_15_03");	//Ja bis dann.
	AI_Output(self, other, "POS_602_Halbert_Schaffen_00_04");	//Bleib wachsam.

	AI_StopProcessInfos(self);
};

//*******************************************Neu******************************************************
func void POS_602_Halbert_Neu()
{
	Info_ClearChoices(POS_602_Halbert_HALLO);

	AI_Output(other, self, "POS_602_Halbert_Neu_15_01");	//Nein ich bin neu hier.
	AI_Output(self, other, "POS_602_Halbert_Neu_00_02");	//Ah gerade erst durch die Barriere hier reingekommen.
	AI_Output(self, other, "POS_602_Halbert_Neu_00_03");	//Dann laß Dir sagen, dass die Erzbarone mit Ihrem alten Lager eingemeiner Haufen sind.Laß die Finger davon.
	AI_Output(self, other, "POS_602_Halbert_Neu_00_04");	//Wir im Neuen Lager sind Kumpel. Wenn wir hier raus sind solltest Du Lares besuchen.
	AI_Output(other, self, "POS_602_Halbert_Neu_15_05");	//Ich glaube das ist eine alte Geschichte. Danke, aber ich werde lieber weitergehen.
};
*/
