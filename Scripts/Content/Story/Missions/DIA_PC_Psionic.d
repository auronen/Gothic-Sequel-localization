///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_Exit(C_Info)
{
	npc				= PC_Psionic;
	nr				= 999;
	condition		= PC_Psionic_Exit_Condition;
	information		= PC_Psionic_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int PC_Psionic_Exit_Condition()
{
	return TRUE;
};

func void PC_Psionic_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##						BEGRÜSSUNG
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info HALLOAGAIN
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_HALLOAGAIN(C_Info)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_HALLOAGAIN_Condition;
	information		= PC_Psionic_HALLOAGAIN_Info;
	important		= TRUE;
};

func int PC_Psionic_HALLOAGAIN_Condition()
{
	return TRUE;
};

func void PC_Psionic_HALLOAGAIN_Info()
{
	AI_Output(self, hero, "PC_Psionic_HALLOAGAIN_23_01"); //Hey, ich dachte du wärst tot!
	AI_Output(hero, self, "PC_Psionic_HALLOAGAIN_15_02"); //Das kommt mir bekannt vor.
	AI_Output(self, hero, "PC_Psionic_HALLOAGAIN_23_03"); //Was ist geschehen?
	AI_Output(hero, self, "PC_Psionic_HALLOAGAIN_15_04"); //Der Kampf gegen den Schläfer hat mich geschwächt. Das bedeutet ich muss wieder 'ne Menge lernen.
	AI_Output(self, hero, "PC_Psionic_HALLOAGAIN_23_05"); //Ich kann dir zeigen, wie du deine magische Kraft steigerst und dir die Kreise der Magie lehren.

	B_SetAttitude(self, ATT_FRIENDLY);
};

///////////////////////////////////////////////////////////////////////
//	Info FORTRESS
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_FORTRESS(C_Info)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= PC_Psionic_FORTRESS_Condition;
	information		= PC_Psionic_FORTRESS_Info;
	description		= "Wolltest Du nicht von der Felsenfestung Besitz nehmen?";
};

func int PC_Psionic_FORTRESS_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_HALLOAGAIN))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_FORTRESS_Info()
{
	AI_Output(hero, self, "PC_Psionic_FORTRESS_15_01"); //Wolltest Du nicht von der Felsenfestung Besitz nehmen?
	AI_Output(self, hero, "PC_Psionic_FORTRESS_23_02"); //Das wollte ich, aber dann tauchte plätzlich König Rhobar mit seinen Paladinen dort auf, und machte sich in 'meiner' Festung breit.
};

///////////////////////////////////////////////////////////////////////
//	Info KINGHERE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_KINGHERE(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_KINGHERE_Condition;
	information		= PC_Psionic_KINGHERE_Info;
	description		= "König Rhobar ist hier?";
};

func int PC_Psionic_KINGHERE_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_FORTRESS))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_KINGHERE_Info()
{
	AI_Output(hero, self, "PC_Psionic_KINGHERE_15_01"); //König Rhobar ist hier?
	AI_Output(self, hero, "PC_Psionic_KINGHERE_23_02"); //Es ist noch garnicht so lange her, da stand er plötzlich mit seinen Paladinen vor dem Alten Lager.
	AI_Output(self, hero, "PC_Psionic_KINGHERE_23_03"); //Einige düster dreinblickende Magier befanden sich ebenfalls in seinem Gefolge. Nur die Götter wissen, was die hier verloren haben.
	AI_Output(self, hero, "PC_Psionic_KINGHERE_23_04"); //Er nahm kurzerhand die Felsenfestung in Besitz und richtete dort sein Hauptquartier ein!
	AI_Output(self, hero, "PC_Psionic_KINGHERE_23_05"); //Angeblich sucht er irgendetwas hier in der Gegend!
};

///////////////////////////////////////////////////////////////////////
//	Info KINGWHAT
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_KINGWHAT(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_KINGWHAT_Condition;
	information		= PC_Psionic_KINGWHAT_Info;
	description		= "Weisst du WAS der König hier sucht?";
};

func int PC_Psionic_KINGWHAT_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_KINGHERE))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_KINGWHAT_Info()
{
	AI_Output(hero, self, "PC_Psionic_KINGWHAT_15_01"); //Weisst du WAS der König hier sucht?
	AI_Output(self, hero, "PC_Psionic_KINGWHAT_23_02"); //Nein. Sie haben den Zugang zur Felsenfestung regelrecht abgeriegelt.
	AI_Output(self, hero, "PC_Psionic_KINGWHAT_23_03"); //Was immer Rhobar hier sucht, er glaubt es offensichtlich dort zu finden!
	AI_Output(hero, self, "PC_Psionic_KINGWHAT_15_04"); //Merkwürdig...
};

///////////////////////////////////////////////////////////////////////
//	Info YOUHERE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_YOUHERE(C_Info)
{
	npc				= PC_Psionic;
	nr				= 8;
	condition		= PC_Psionic_YOUHERE_Condition;
	information		= PC_Psionic_YOUHERE_Info;
	description		= "Was tust du hier?";
};

func int PC_Psionic_YOUHERE_Condition()
{
	return TRUE;
};

func void PC_Psionic_YOUHERE_Info()
{
	AI_Output(hero, self, "PC_Psionic_YOUHERE_15_01"); //Was tust du hier?
	AI_Output(self, hero, "PC_Psionic_YOUHERE_23_02"); //Ich forsche nach dem alten Wissen der Feuermagier.
	AI_Output(self, hero, "PC_Psionic_YOUHERE_23_03"); //Sie haben zu Zeiten der Barriere schliesslich hier gelebt.
};

///////////////////////////////////////////////////////////////////////
//	Info IREMEMBER
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_IREMEMBER(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_IREMEMBER_Condition;
	information		= PC_Psionic_IREMEMBER_Info;
	description		= "Wie laufen deine Forschungen?";
};

func int PC_Psionic_IREMEMBER_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_YOUHERE))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_IREMEMBER_Info()
{
	AI_Output(hero, self, "PC_Psionic_IREMEMBER_15_01"); //Wie laufen deine Forschungen?
	AI_Output(self, hero, "PC_Psionic_IREMEMBER_23_02"); //Der Zusammenbruch der magischen Barriere hat fast alle magischen Artefakte zerstört. Auch die Runen!
	AI_Output(self, hero, "PC_Psionic_IREMEMBER_23_03"); //Aber ich habe einen Weg gefunden, neue Runen herzustellen!
	AI_Output(self, hero, "PC_Psionic_IREMEMBER_23_04"); //Ich sammle das Wissen über die Zaubersprüche der Feuer- und Wassermagier und binde sie in neue Runensteine!
};

///////////////////////////////////////////////////////////////////////
//	Info TRAINBASIC
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_TRAINBASIC(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_TRAINBASIC_Condition;
	information		= PC_Psionic_TRAINBASIC_Info;
	description		= "Erkläre mir die Gesetze der Magie ";
};

func int PC_Psionic_TRAINBASIC_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_IREMEMBER))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_TRAINBASIC_Info()
{
	AI_Output(hero, self, "PC_Psionic_TRAINBASIC_Info_15_01"); //Erkläre mir die Gesetze der Magie.
	AI_Output(self, hero, "PC_Psionic_TRAINBASIC_Info_23_02"); //Es ist so, wie du es von früher kennst! Du brauchst entweder eine Spruchrolle oder eine Rune!
	AI_Output(self, hero, "PC_Psionic_TRAINBASIC_Info_23_03"); //Die Benutzung von Spruchrollen und Runen kostet deine magische Kraft. Dein MANA. Die Lebensquelle deiner Sprüche!
	AI_Output(hero, self, "PC_Psionic_TRAINBASIC_Info_15_04"); //Und weiter?
	AI_Output(self, hero, "PC_Psionic_TRAINBASIC_Info_23_05"); //Spruchrollen kann jeder verwenden, der Mana besitzt. Allerding können sie nur einmal verwendet werden und lösen sich danach auf!
	AI_Output(self, hero, "PC_Psionic_TRAINBASIC_Info_23_06"); //Eine Rune dagegen kann man unendlich oft benutzen, allerdings musst du dafür die hohe Kunst der magischen Kreise erlernen!
	AI_Output(self, hero, "PC_Psionic_TRAINBASIC_Info_23_07"); //Das Benutzen von mächtigeren Runen erfordern das Wissen eines höheren Kreises der Magie!
};

///////////////////////////////////////////////////////////////////////
//	Info MAKERUNES
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_MAKERUNES(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_MAKERUNES_Condition;
	information		= PC_Psionic_MAKERUNES_Info;
	description		= "Wie stellst du die Runensteine her?";
};

func int PC_Psionic_MAKERUNES_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_IREMEMBER))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_MAKERUNES_Info()
{
	AI_Output(hero, self, "PC_Psionic_MAKERUNES_15_01"); //Wie stellst du die Runensteine her?
	AI_Output(self, hero, "PC_Psionic_MAKERUNES_23_02"); //Es hat mich viel Zeit gekostet. Ich habe Apparaturen nachgebaut, die ich in alten Büchern beschrieben fand!
};

///////////////////////////////////////////////////////////////////////
//	Info SLEEPERMAGIC
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_SLEEPERMAGIC(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_SLEEPERMAGIC_Condition;
	information		= PC_Psionic_SLEEPERMAGIC_Info;
	description		= "Was ist aus der Magie des Schläfers geworden?";
};

func int PC_Psionic_SLEEPERMAGIC_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_IREMEMBER))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_SLEEPERMAGIC_Info()
{
	AI_Output(hero, self, "PC_Psionic_SLEEPERMAGIC_15_01"); //Was ist aus der Magie des Schläfers geworden?
	AI_Output(self, hero, "PC_Psionic_SLEEPERMAGIC_23_02"); //Diese Magie ist mit dem Schläfer zusammen verschwunden, doch ich bin sicher, seine Zauber können auch ohne seine dämonische Kraft funktionieren.
	AI_Output(self, hero, "PC_Psionic_SLEEPERMAGIC_23_03"); //Ich versuche zur Zeit eine Rune der Telekinese herzustellen, suche aber noch nach einer entsprechenden Spruchrolle.
};

//#####################################################################
//##
//##
//##						MANA & KREISE LERNEN
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_TEACH(C_Info)
{
	npc				= PC_Psionic;
	nr				= 10;
	condition		= PC_Psionic_TEACH_Condition;
	information		= PC_Psionic_TEACH_Info;
	permanent		= TRUE;
	description		= "Ich will meine alten Kräfte wiedergewinnen!";
};

func int PC_Psionic_TEACH_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_TRAINBASIC)
	&& Npc_KnowsInfo(hero, PC_Thief_NEEDTRAINING))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_TEACH_Info()
{
	AI_Output(hero, self, "PC_Psionic_TEACH_Info_15_01"); //Ich will meine alten Kräfte wiedergewinnen!
	AI_Output(hero, self, "PC_Psionic_TEACH_Info_15_02"); //Diego sagt, du könntest mir dabei helfen.
	AI_Output(self, hero, "PC_Psionic_TEACH_Info_23_03"); //Warum nicht, lass uns gleich beginnen.

	Info_ClearChoices(PC_Psionic_TEACH);
	Info_AddChoice(PC_Psionic_TEACH, DIALOG_BACK, PC_Psionic_TEACH_BACK);
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 2)
	{
		//Info_AddChoice(PC_Psionic_TEACH, B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3, 0), PC_Psionic_TEACH_CIRCLE3);
	};

	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 1)
	&& Npc_KnowsInfo(hero, PC_Psionic_FOUNDHEALSCROLL))
	{
		Info_AddChoice(PC_Psionic_TEACH, B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2, 0), PC_Psionic_TEACH_CIRCLE2);
	};

	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 0)
	{
		Info_AddChoice(PC_Psionic_TEACH, B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1, 0), PC_Psionic_TEACH_CIRCLE1);
	};

	Info_AddChoice(PC_Psionic_TEACH, "(Mana steigern)", PC_Psionic_TEACH_MAN);
};

func void PC_Psionic_TEACH_MAN()
{
	Info_ClearChoices(PC_Psionic_TEACH);
	Info_AddChoice(PC_Psionic_TEACH, DIALOG_BACK, PC_Psionic_TEACH_BACK);
	Info_AddChoice(PC_Psionic_TEACH, B_BuildLearnString(NAME_LearnMANA_5, 5 * LPCOST_ATTRIBUTE_MANA, 0), PC_Psionic_TEACH_MAN_5);
	Info_AddChoice(PC_Psionic_TEACH, B_BuildLearnString(NAME_LearnMANA_1, LPCOST_ATTRIBUTE_MANA, 0), PC_Psionic_TEACH_MAN_1);
};

func void PC_Psionic_TEACH_MAN_1()
{
	B_BuyAttributePoints(hero, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(PC_Psionic_TEACH);
	Info_AddChoice(PC_Psionic_TEACH, DIALOG_BACK, PC_Psionic_TEACH_BACK);
	Info_AddChoice(PC_Psionic_TEACH, B_BuildLearnString(NAME_LearnMANA_5, 5 * LPCOST_ATTRIBUTE_MANA, 0), PC_Psionic_TEACH_MAN_5);
	Info_AddChoice(PC_Psionic_TEACH, B_BuildLearnString(NAME_LearnMANA_1, LPCOST_ATTRIBUTE_MANA, 0), PC_Psionic_TEACH_MAN_1);
};

func void PC_Psionic_TEACH_MAN_5()
{
	B_BuyAttributePoints(hero, ATR_MANA_MAX, 5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(PC_Psionic_TEACH);
	Info_AddChoice(PC_Psionic_TEACH, DIALOG_BACK, PC_Psionic_TEACH_BACK);
	Info_AddChoice(PC_Psionic_TEACH, B_BuildLearnString(NAME_LearnMANA_5, 5 * LPCOST_ATTRIBUTE_MANA, 0), PC_Psionic_TEACH_MAN_5);
	Info_AddChoice(PC_Psionic_TEACH, B_BuildLearnString(NAME_LearnMANA_1, LPCOST_ATTRIBUTE_MANA, 0), PC_Psionic_TEACH_MAN_1);
};

func void PC_Psionic_TEACH_BACK()
{
	Info_ClearChoices(PC_Psionic_TEACH);
};

func void PC_Psionic_TEACH_CIRCLE1()
{
	AI_Output(hero, self, "PC_Psionic_TEACH_CIRCLE1_15_01"); //Ich will den ersten Kreis der Magie erlernen.

	if (B_GiveSkill(hero, NPC_TALENT_MAGE, 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_02"); //Es ist mir bereits gelungen, zwei Zauber aus diesem Kreise in Runen zu binden.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_03"); //Der Lichtzauber erhellt die Dunkelheit stockfinsterer Orte und ist zuverlässiger als jede Fackel.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_04"); //Der Feuerpfeil ist eine Angriffsrune die Ziele in Brand stecken kann.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_05"); //Leider sind das die einzigen Zauberformeln der Feuermagier, die ich bisher auftreiben konnte.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_06"); //Soviel ich weiss, gab es einen Zauberspruch der Wassermagier, der mit dem Feuerpfeil verwandt ist: Der Eispfeil.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_07"); //Leider habe ich nirgendwo eine Spruchrolle darüber auftreiben können.
	};
};

func void PC_Psionic_TEACH_CIRCLE2()
{
	AI_Output(hero, self, "PC_Psionic_TEACH_CIRCLE2_15_01"); //Ich will den zweiten Kreis der Magie erlernen.

	if (B_GiveSkill(hero, NPC_TALENT_MAGE, 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE2_23_02"); //Nun da wir mit dem Zauber HEILUNG eine Spruchrolle des zweiten Kreises in Händen halten, erklärt sich das magische Gefüge schon fast von selbst.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE2_23_03"); //Sprich diesen Zauber auf dich selbst, und deine Wunden werden sich wieder verschliessen. Je länger du diesen Zauber aufrechterhälst, desto grösser ist die Heilwirkung, die eintritt.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE2_23_04"); //Hast Du HEILUNG erst einmal verstanden, werden auch andere Zauberformeln des zweiten Kreises kein Hindernis mehr für dich darstellen.
	};
};

func void PC_Psionic_TEACH_CIRCLE3()
{
	AI_Output(hero, self, "PC_Psionic_TEACH_CIRCLE3_15_01"); //Ich will den dritten Kreis der Magie erlernen.

	if (B_GiveSkill(hero, NPC_TALENT_MAGE, 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_02"); //Mit dem dritten Kreis kannst du fünf weitere Zauber sprechen.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_03"); //Freundlich stimmen, Feuerball, Telekinese, Eisblock und Pyrokinese.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_04"); //Feuerball und Pyrokinese sind weitere machtvolle Angriffssprüche.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_05"); //Telekinese ermöglicht es dir kleine Gegenstände über Entfernung zu bewegen.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_06"); //Mit Eisblock kannst du einen Gegner einfrieren. Dadurch wird er bewegungsunfähig.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_07"); //Mit dem Zauber Freundlich stimmen, kannst du einen verägerten Feind wieder zur Ruhe bringen.
		AI_Output(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_08"); //Auch Leute die im Begriff sind dich anzugreifen, werden davon ablassen. Versteht sich von selbst, das der Zauber nur auf Menschen wirkt.
	};
};

//#####################################################################
//##
//##
//##						TUTORIAL-MISSIONEN
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info TEACHRUNEMAKING
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_TEACHRUNEMAKING(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_TEACHRUNEMAKING_Condition;
	information		= PC_Psionic_TEACHRUNEMAKING_Info;
	permanent		= TRUE;
	description		= "Kannst du mir zeigen, wie man Runen herstellt?";
};

func int PC_Psionic_TEACHRUNEMAKING_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_MAKERUNES)
	&& !Lester_LearnRunemaking)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_TEACHRUNEMAKING_Info()
{
	AI_Output(hero, self, "PC_Psionic_TEACHRUNEMAKING_15_01"); //Kannst du mir zeigen, wie man Runen herstellt?
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 0)
	{
		AI_Output(self, hero, "PC_Psionic_TEACHRUNEMAKING_23_02"); //Du musst zumindest das Wissen über den ersten Kreis der Magie haben, sonst kannst du mit den Runen nichts anfangen.
	}
	else
	{
		AI_Output(self, hero, "PC_Psionic_TEACHRUNEMAKING_23_03"); //Sehr gerne. Nun, da du den ersten Kreis der Magie beherrschst, sollte es nicht allzu schwer sein!

		Lester_LearnRunemaking = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LEARNTHAUMATURGY1
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_LEARNTHAUMATURGY1(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_LEARNTHAUMATURGY1_Condition;
	information		= PC_Psionic_LEARNTHAUMATURGY1_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LearnThaumaturgy_1, LPCOST_TALENT_THAUMATURGY_1, 0);
};

func int PC_Psionic_LEARNTHAUMATURGY1_Condition()
{
	if (Lester_LearnRunemaking
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_thaumaturgy) == 0))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_LEARNTHAUMATURGY1_Info()
{
	if (B_GiveSkill(hero, NPC_TALENT_thaumaturgy, 1, LPCOST_TALENT_THAUMATURGY_1))
	{
		AI_Output(self, hero, "PC_Psionic_LEARNTHAUMATURGY1_23_01"); //Runen werden in zwei Stufen hergestellt.
		AI_Output(self, hero, "PC_Psionic_LEARNTHAUMATURGY1_23_02"); //Zuerst musst du am Runenschmelzer  -der kleine Ofen da hinten-  einen leeren Runenstein anfertigen.
		AI_Output(self, hero, "PC_Psionic_LEARNTHAUMATURGY1_23_03"); //In der zweiten Stufe, bindest du die magischen Kräfte einer Zauberspruchrolle in den vorbereiteten Runenstein und erhälst so eine fertige Zauberrune.

		Log_CreateTopic(CH1_LearnRuneMaking, LOG_MISSION);
		Log_SetTopicStatus(CH1_LearnRuneMaking, LOG_RUNNING);
		B_LogEntry(CH1_LearnRuneMaking, CH1_LearnRuneMaking_1);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info RUNESTONE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_RUNESTONE(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_RUNESTONE_Condition;
	information		= PC_Psionic_RUNESTONE_Info;
	description		= "Wie stelle ich einen solchen Runenstein her?";
};

func int PC_Psionic_RUNESTONE_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_thaumaturgy) == 1)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_RUNESTONE_Info()
{
	AI_Output(hero, self, "PC_Psionic_RUNESTONE_15_01"); //Wie stelle ich einen solchen Runenstein her?
	AI_Output(self, hero, "PC_Psionic_RUNESTONE_23_02"); //Nehme das Erz und halte sie mit einer Schmiedezange in das Feuer. Das flüssige Erz läuft dann in die Form und schon hast du einen leeren Runenstein.

	B_LogEntry(CH1_LearnRuneMaking, CH1_LearnRuneMaking_2);
};

///////////////////////////////////////////////////////////////////////
//	Info ORE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_ORE(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_ORE_Condition;
	information		= PC_Psionic_ORE_Info;
	description		= "Wie komme ich an Erz?";
};

func int PC_Psionic_ORE_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_RUNESTONE)
	&& (Npc_HasItems(hero, ItMi_OreNugget) < Amnt_Rune))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_ORE_Info()
{
	AI_Output(hero, self, "PC_Psionic_ORE_15_01"); //Wie komme ich an Erz?
	AI_Output(self, hero, "PC_Psionic_ORE_23_02"); //Ich habe es bei Bartok gekauft, gegenüber in der Burgschmiede.
	AI_Output(self, hero, "PC_Psionic_ORE_23_03"); //Doch nun hat auch ihn die Krankheit erwischt!

	if (Npc_KnowsInfo(hero, Info_Gotmar_OTHERSMITH)
	|| Npc_KnowsInfo(hero, Info_Julius_SMITH))
	{
		AI_Output(hero, self, "PC_Psionic_ORE_15_04"); //Ich hörte bereits davon!
	};

	B_LogEntry(CH1_LearnRuneMaking, CH1_LearnRuneMaking_3);
};

///////////////////////////////////////////////////////////////////////
//	Info PLAGUE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_PLAGUE(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_PLAGUE_Condition;
	information		= PC_Psionic_PLAGUE_Info;
	description		= "Was für eine Krankheit?";
};

func int PC_Psionic_PLAGUE_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_ORE)
	&& !Npc_KnowsInfo(hero, Info_Gotmar_OTHERSMITH)
	&& !Npc_KnowsInfo(hero, Info_Julius_SMITH))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_PLAGUE_Info()
{
	AI_Output(hero, self, "PC_Psionic_PLAGUE_15_01"); //Was für eine Krankheit?
	AI_Output(self, hero, "PC_Psionic_PLAGUE_23_02"); //Die Opfer verwandeln sich in lebende Tote und reden nur noch wirres Zeug!
	AI_Output(self, hero, "PC_Psionic_PLAGUE_23_03"); //Zwischen dem Arbeiter- und dem Händlerviertel ist das Krankenviertel.
	AI_Output(self, hero, "PC_Psionic_PLAGUE_23_04"); //Bartok wurde auch dort hingebracht. Aber vielleicht findest du in seiner Schmiede noch Erz.

	B_LogEntry(CH1_LearnRuneMaking, CH1_LearnRuneMaking_4);
};

///////////////////////////////////////////////////////////////////////
//	Info HAVEORE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_HAVEORE(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_HAVEORE_Condition;
	information		= PC_Psionic_HAVEORE_Info;
	description		= "Ich habe genug Erz!";
};

func int PC_Psionic_HAVEORE_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_RUNESTONE)
	&& (Npc_HasItems(hero, ItMi_OreNugget) >= Amnt_Rune)
	&& !Npc_KnowsInfo(hero, PC_Psionic_MADERUNESTONE)
	&& !Npc_HasItems(hero, ItAr_RuneBlank))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_HAVEORE_Info()
{
	AI_Output(hero, self, "PC_Psionic_HAVEORE_15_01"); //Ich habe genug Erz.
	if (Npc_HasItems(hero, ItMi_Pliers))
	{
		AI_Output(self, hero, "OUMULTI_HAVEALL_23_00"); //Sehr gut, nun gehe zum Runenschmelzer und stelle eine leere Rune her.
	}
	else
	{
		AI_Output(self, hero, "PC_Psionic_HAVEORE_23_03"); //Dann brauchst du nur noch die Schmiedezange.
	};

	B_GiveXP(XP_Lester_HaveOre);
};

///////////////////////////////////////////////////////////////////////
//	Info HAVEPLIERS
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_HAVEPLIERS(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_HAVEPLIERS_Condition;
	information		= PC_Psionic_HAVEPLIERS_Info;
	description		= "Ich habe eine Schmiedezange!";
};

func int PC_Psionic_HAVEPLIERS_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_RUNESTONE)
	&& Npc_HasItems(hero, ItMi_Pliers)
	&& !Npc_KnowsInfo(hero, PC_Psionic_MADERUNESTONE)
	&& !Npc_HasItems(hero, ItAr_RuneBlank))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_HAVEPLIERS_Info()
{
	AI_Output(hero, self, "PC_Psionic_HAVEPLIERS_15_01"); //Ich habe eine Schmiedezange.
	if (Npc_HasItems(hero, ItMi_OreNugget) >= Amnt_Rune)
	{
		AI_Output(self, hero, "OUMULTI_HAVEALL_23_02"); //Sehr gut, nun gehe zum Runenschmelzer und stelle eine leere Rune her.
	}
	else
	{
		AI_Output(self, hero, "PC_Psionic_HAVEPLIERS_23_03"); //Gut, nun brauchst du nur noch genügend Erz.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MADERUNESTONE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_MADERUNESTONE(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_MADERUNESTONE_Condition;
	information		= PC_Psionic_MADERUNESTONE_Info;
	description		= "Hier ist mein erster leerer Runenstein!";
};

func int PC_Psionic_MADERUNESTONE_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_RUNESTONE)
	&& Npc_HasItems(hero, ItAr_RuneBlank))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_MADERUNESTONE_Info()
{
	AI_Output(hero, self, "PC_Psionic_MADERUNESTONE_15_01"); //Hier ist mein erster leerer Runenstein.
	AI_Output(self, hero, "PC_Psionic_MADERUNESTONE_23_02"); //Du kannst immer wieder neue herstellen, wenn du genug Erz hast.

	if (Npc_HasItems(hero, ItAr_ScrollLight)
	|| Npc_HasItems(hero, ItAr_ScrollFirebolt))
	{
		AI_Output(self, hero, "PC_Psionic_MADERUNESTONE_23_03"); //Jetzt fehlt dir nur noch eine Spruchrolle.
	}
	else
	{
		AI_Output(self, hero, "PC_Psionic_MADERUNESTONE_23_04"); //Jetzt kannst du deine erste Rune herstellen.
	};

	if (Npc_KnowsInfo(hero, PC_Psionic_HAVEORE))
	{
		B_GiveXP(XP_Lester_MadeRunestone);
	}
	else
	{
		B_GiveXP(XP_Lester_MadeRunestone + XP_Lester_HaveOre);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SCROLL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_SCROLL(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_SCROLL_Condition;
	information		= PC_Psionic_SCROLL_Info;
	description		= "Eine Spruchrolle?";
};

func int PC_Psionic_SCROLL_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_thaumaturgy) == 1)
	&& !Npc_HasItems(hero, ItAr_ScrollLight)
	&& !Npc_HasItems(hero, ItAr_ScrollFirebolt))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_SCROLL_Info()
{
	AI_Output(hero, self, "PC_Psionic_SCROLL_15_01"); //Eine Spruchrolle?
	AI_Output(self, hero, "PC_Psionic_SCROLL_23_02"); //Such mal in den Bücherregalen und Kisten hier herum. Es müssten noch eine Spruchrollen der Feuermagier vorhanden sein.
	AI_Output(self, hero, "PC_Psionic_SCROLL_23_03"); //Leider habe ich bisher keine Spruchrollen der Wassermagier gefunden.
};

///////////////////////////////////////////////////////////////////////
//	Info WHATWITHSTONE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_WHATWITHSTONE(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_WHATWITHSTONE_Condition;
	information		= PC_Psionic_WHATWITHSTONE_Info;
	permanent		= TRUE;
	description		= "Was mache ich nun mit dem leeren Runenstein?";
};

func int PC_Psionic_WHATWITHSTONE_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_MADERUNESTONE)
	&& !Npc_HasItems(hero, ItAr_ScrollLight)
	&& !Npc_HasItems(hero, ItAr_ScrollFirebolt)
	&& !Npc_KnowsInfo(hero, PC_Psionic_HAVESCROLL)
	&& !Npc_KnowsInfo(hero, PC_Psionic_MADERUNE))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_WHATWITHSTONE_Info()
{
	AI_Output(hero, self, "PC_Psionic_WHATWITHSTONE_15_01"); //Was mache ich nun mit dem leeren Runenstein?
	AI_Output(self, hero, "PC_Psionic_WHATWITHSTONE_23_02"); //Nun benötigst du eine Spruchrolle. Stöber etwas in den Regalen und Kisten Herum
	AI_Output(self, hero, "PC_Psionic_WHATWITHSTONE_23_03"); //Dort solltest du noch einige einfache Feuerzauber finden.
};

///////////////////////////////////////////////////////////////////////
//	Info HAVESCROLL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_HAVESCROLL(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_HAVESCROLL_Condition;
	information		= PC_Psionic_HAVESCROLL_Info;
	description		= "Ich habe eine Spruchrolle!";
};

func int PC_Psionic_HAVESCROLL_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_MADERUNESTONE)
	&& (Npc_HasItems(hero, ItAr_ScrollLight) || Npc_HasItems(hero, ItAr_ScrollFirebolt)))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_HAVESCROLL_Info()
{
	AI_Output(hero, self, "PC_Psionic_HAVESCROLL_15_01"); //Ich habe eine Spruchrolle!
	AI_Output(self, hero, "PC_Psionic_HAVESCROLL_23_02"); //Sehr gut, dann kannst du dich jetzt am Runenkreisel versuchen. Er steht oben in der alten Kanzel.
	AI_Output(self, hero, "PC_Psionic_HAVESCROLL_23_03"); //Nimm den leeren Runenstein, lies den Zauber auf der Spruchrolle und fokussiere deine Gedanken dabei auf den Stein im Runenkreisel.
	AI_Output(self, hero, "PC_Psionic_HAVESCROLL_23_04"); //Ein Teil deiner eigenen Mana wird den Zauber in den Runenstein binden.
	AI_Output(self, hero, "PC_Psionic_HAVESCROLL_23_05"); //Allerdings gibt es da einen Effekt den du kennen solltest!
	AI_Output(hero, self, "PC_Psionic_HAVESCROLL_15_06"); //Welchen?
	AI_Output(self, hero, "PC_Psionic_HAVESCROLL_23_07"); //(rezitiert) Um dauerhaftes zu schaffen, muss dauerhaftes gegeben werden!
	AI_Output(hero, self, "PC_Psionic_HAVESCROLL_15_08"); //Was bedeutet das?
	AI_Output(self, hero, "PC_Psionic_HAVESCROLL_23_09"); //Das bedeutet, dass deine Mana, die du in den Runenstein fliessen lässt DAUERHAFT verloren ist!
	AI_Output(hero, self, "PC_Psionic_HAVESCROLL_15_10"); //Ich... verstehe!

	B_GiveXP(XP_Lester_HaveScroll);
	B_LogEntry(CH1_LearnRunemaking, CH1_LearnRuneMaking_5);
};

///////////////////////////////////////////////////////////////////////
//	Info MADERUNE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_MADERUNE(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_MADERUNE_Condition;
	information		= PC_Psionic_MADERUNE_Info;
	description		= "Hier ist meine erste Rune!";
};

func int PC_Psionic_MADERUNE_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_MADERUNESTONE)
	&& (Npc_HasItems(hero, ItAr_RuneLight) || Npc_HasItems(hero, ItAr_RuneFirebolt)))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_MADERUNE_Info()
{
	AI_Output(hero, self, "PC_Psionic_MADERUNE_15_01"); //Hier ist meine erste Rune!
	AI_Output(self, hero, "PC_Psionic_MADERUNE_23_02"); //Gute Arbeit.
	AI_Output(self, hero, "PC_Psionic_MADERUNE_23_03"); //Mehr weiss ich selbst auch nicht über das Herstellen von Runen. Ich bin immer noch am experimentieren.

	if (Npc_KnowsInfo(hero, PC_Psionic_HAVESCROLL))
	{
		B_GiveXP(XP_Lester_MadeRune);
	}
	else
	{
		B_GiveXP(XP_Lester_MadeRune + XP_Lester_HaveScroll);
	};

	B_LogEntry(CH1_LearnRunemaking, CH1_LearnRuneMaking_6);
};

///////////////////////////////////////////////////////////////////////
//	Info TOGETHER
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_TOGETHER(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_TOGETHER_Condition;
	information		= PC_Psionic_TOGETHER_Info;
	description		= "Lass uns die Herstellung der weiteren Runen gemeinsam angehen";
};

func int PC_Psionic_TOGETHER_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_MADERUNE))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_TOGETHER_Info()
{
	AI_Output(hero, self, "PC_Psionic_TOGETHER_15_01"); //Lass uns die Herstellung der weiteren Runen gemeinsam angehen.
	AI_Output(self, hero, "PC_Psionic_TOGETHER_23_02"); //Gut, zusammen werden wir schneller und besser vorankommen.
};

///////////////////////////////////////////////////////////////////////
//	Info WHATNEXT
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_WHATNEXT(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_WHATNEXT_Condition;
	information		= PC_Psionic_WHATNEXT_Info;
	description		= "Du erwähntest vorhin den Zauber EISPFEIL";
};

func int PC_Psionic_WHATNEXT_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_TOGETHER))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_WHATNEXT_Info()
{
	AI_Output(hero, self, "PC_Psionic_WHATNEXT_15_01"); //Du erwähntest vorhin den Zauber EISPFEIL
	AI_Output(self, hero, "PC_Psionic_WHATNEXT_23_02"); //Richtig.
	AI_Output(hero, self, "PC_Psionic_WHATNEXT_15_03"); //Ich werde eine Spruchrolle dieses Zaubers auftreiben, dann binden wir ihn in eine Rune.
	AI_Output(self, hero, "PC_Psionic_WHATNEXT_23_04"); //Ein guter Anfang für eine Suche, wäre es, nach dem Verbleib der Wassermagier zu forschen.
	AI_Output(self, hero, "PC_Psionic_WHATNEXT_23_05"); //Vielleicht weiss Horatio, was aus ihnen geworden ist.
	AI_Output(self, hero, "PC_Psionic_WHATNEXT_23_06"); //Er ist der einzige hier im Lager, der zur Zeit der Barriere im Lager der Wassermagier wohnte.

	B_LogEntry(CH1_LearnRunemaking, CH1_LearnRuneMaking_7);
};

///////////////////////////////////////////////////////////////////////
//	Info HORATIO
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_HORATIO(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_HORATIO_Condition;
	information		= PC_Psionic_HORATIO_Info;
	description		= "Wo finde ich diesen Horatio?";
};

func int PC_Psionic_HORATIO_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_WHATNEXT))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_HORATIO_Info()
{
	AI_Output(hero, self, "PC_Psionic_HORATIO_15_01"); //Wo finde ich diesen Horatio?
	AI_Output(self, hero, "PC_Psionic_HORATIO_23_02"); //Er ist einer der Steinklopfer im Arbeiterviertel.

	B_LogEntry(CH1_LearnRunemaking, CH1_LearnRuneMaking_8);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUNDTHUNDERBOLTSCROLL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_FOUNDTHUNDERBOLTSCROLL(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_FOUNDTHUNDERBOLTSCROLL_Condition;
	information		= PC_Psionic_FOUNDTHUNDERBOLTSCROLL_Info;
	permanent		= TRUE;
	description		= "Ich habe eine Spruchrolle EISPFEIL gefunden";
};

func int PC_Psionic_FOUNDTHUNDERBOLTSCROLL_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_WHATNEXT)
	&& Npc_HasItems(hero, ItAr_ScrollThunderbolt)
	&& !Lester_GotThunderbolt)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_FOUNDTHUNDERBOLTSCROLL_Info()
{
	AI_Output(hero, self, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_15_01"); //Ich habe eine Spruchrolle EISPFEIL gefunden.
	AI_Output(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_23_02"); //Sehr gut. Dann sollten wir gleich loslegen eine Rune daraus zu machen.
	AI_Output(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_23_03"); //Gibst du mir eine deiner EISPFEIL-Spruchrollen?

	Info_ClearChoices(PC_Psionic_FOUNDTHUNDERBOLTSCROLL);
	Info_AddChoice(PC_Psionic_FOUNDTHUNDERBOLTSCROLL, "Vielleicht später...", PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO);
	Info_AddChoice(PC_Psionic_FOUNDTHUNDERBOLTSCROLL, "Hier nimm!", PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES);
};

func void PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES()
{
	Info_ClearChoices(PC_Psionic_FOUNDTHUNDERBOLTSCROLL);
	AI_Output(hero, self, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES_15_01"); //Hier nimm!
	B_GiveInvItems(hero, self, ItAr_ScrollThunderbolt, 1);
	AI_Output(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES_23_02"); //Danke. Jetzt kann jeder seine eigene EISPFEIL-Rune herstellen.

	B_GiveXP(XP_Lester_FoundThunderbolt);

	Lester_GotThunderbolt = TRUE;
};

func void PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO()
{
	Info_ClearChoices(PC_Psionic_FOUNDTHUNDERBOLTSCROLL);
	AI_Output(hero, self, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO_15_01"); //Vielleicht später...
	AI_Output(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO_23_02"); //Wie du meinst.
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUNDHEALSCROLL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_FOUNDHEALSCROLL(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_FOUNDHEALSCROLL_Condition;
	information		= PC_Psionic_FOUNDHEALSCROLL_Info;
	description		= "Ich habe eine Spruchrolle HEILUNG gefunden!";
};

func int PC_Psionic_FOUNDHEALSCROLL_Condition()
{
	if (Lester_GotThunderbolt
	&& Npc_HasItems(hero, ItAr_ScrollHeal))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_FOUNDHEALSCROLL_Info()
{
	AI_Output(hero, self, "PC_Psionic_FOUNDHEALSCROLL_15_01"); //Ich habe eine Spruchrolle HEILUNG gefunden!
	AI_Output(self, hero, "PC_Psionic_FOUNDHEALSCROLL_23_02"); //Sehr interessant, zeig mal her!
	B_UseFakeScroll();
	AI_Output(self, hero, "PC_Psionic_FOUNDHEALSCROLL_23_03"); //Dieser Zauber scheint komplexer als EISPFEIL zu sein! Um ihn in eine Rune binden zu können, musst du erst den zweiten Kreis der Magie erlernen!

	B_GiveXP(XP_Lester_FoundHeal);
	B_LogEntry(CH1_LearnRunemaking, CH1_LearnRuneMaking_9);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUNDTHUNDERBALLSCROLL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_FOUNDTHUNDERBALLSCROLL(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_FOUNDTHUNDERBALLSCROLL_Condition;
	information		= PC_Psionic_FOUNDTHUNDERBALLSCROLL_Info;
	description		= "Ich habe eine Spruchrolle KUGELBLITZ gefunden!";
};

func int PC_Psionic_FOUNDTHUNDERBALLSCROLL_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_FOUNDHEALSCROLL)
	&& Npc_HasItems(hero, ItAr_ScrollThunderball))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_FOUNDTHUNDERBALLSCROLL_Info()
{
	AI_Output(hero, self, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_15_01"); //Ich habe eine Spruchrolle KUGELBLITZ gefunden!
	AI_Output(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_02"); //Zeig mal her...
	B_GiveInvItems(hero, self, ItAr_ScrollThunderball, 1);
	B_UseFakeScroll();
	AI_Output(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_03"); //Aha! Verstehe!
	AI_Output(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_04"); //Jetzt wird es wirklich heftig! Dies ist ein Wasserzauber aus dem Dritten Kreis.
	AI_Output(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_05"); //Solch komplexe Zauber in eine Rune binden zu können erfordert nicht nur das Wissen über den Dritten Kreis sondern auch die Beherrschung der Runenerschaffung auf einer höheren Ebene.
	AI_Output(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_06"); //Ich werde in den Büchern über das Schmieden von Runen nachlesen.
	AI_Output(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_07"); //Besuche mich morgen wieder, bis dahin werde ich hoffentlich wissen, wie wir das anstellen müssen.
	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "study");

	Lester_LastDay = B_GetDay();
};

///////////////////////////////////////////////////////////////////////
//	Info THUNDERBALL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_THUNDERBALL(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_THUNDERBALL_Condition;
	information		= PC_Psionic_THUNDERBALL_Info;
	permanent		= TRUE;
	description		= "Hast du über den Zauber KUGELBLITZ etwas herausgefunden?";
};

func int PC_Psionic_THUNDERBALL_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_FOUNDTHUNDERBALLSCROLL)
	&& !Lester_KnowBloodore)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_THUNDERBALL_Info()
{
	AI_Output(hero, self, "PC_Psionic_THUNDERBALL_15_01"); //Hast du über den Zauber KUGELBLITZ etwas herausgefunden?

	if (Npc_HasItems(self, ItAr_ScrollThunderball))
	{
		if (B_GetDay() <= Lester_LastDay)
		{
			AI_Output(self, hero, "PC_Psionic_THUNDERBALL_23_02"); //Gib mir Zeit bis morgen, dann weiss ich vielleicht mehr!
		}
		else
		{
			AI_Output(self, hero, "PC_Psionic_THUNDERBALL_23_03"); //Ja, allerdings. Ich bin in einem Buch mit dem Titel THAUMATURGIE für Fortgeschrittene fündig geworden.
			AI_Output(self, hero, "PC_Psionic_THUNDERBALL_23_04"); //Der Prozess für Runen ab dem dritten magischen Kreis ist im Grunde der selbe, allerdings ändern sich die benötigten Materialien.
			AI_Output(self, hero, "PC_Psionic_THUNDERBALL_23_05"); //Leere Runensteine müssen das grössere Potential des Zaubers aufnehmen können und dafür genügt kein normales Erz mehr.
			AI_Output(self, hero, "PC_Psionic_THUNDERBALL_23_06"); //Das Buch spricht von sogenanntem Bluterz.
			AI_Output(self, hero, "PC_Psionic_THUNDERBALL_23_07"); //Ich fürchte wir brauchen etwas davon.
			Lester_KnowBloodore = TRUE;

			Npc_ExchangeRoutine(self, "start");
		};
	}
	else
	{
		AI_Output(self, hero, "PC_Psionic_THUNDERBALL_23_08"); //Irgendwie ist mir die Spruchrolle abhanden gekommen! Seltsam!
		Lester_LostThunderball = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info ANOTHERTHUNDERBALL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_ANOTHERTHUNDERBALL(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_ANOTHERTHUNDERBALL_Condition;
	information		= PC_Psionic_ANOTHERTHUNDERBALL_Info;
	description		= "Ich habe hier noch eine Spruchrolle KUGELBLITZ für dich!";
};

func int PC_Psionic_ANOTHERTHUNDERBALL_Condition()
{
	if (Lester_LostThunderball
	&& !Lester_KnowBloodore
	&& Npc_HasItems(hero, ItAr_ScrollThunderball))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_ANOTHERTHUNDERBALL_Info()
{
	AI_Output(hero, self, "PC_Psionic_ANOTHERTHUNDERBALL_15_01"); //Ich habe hier noch eine Spruchrolle KUGELBLITZ für dich!
	B_GiveInvItems(hero, self, ItAr_ScrollThunderball, 1);
	AI_Output(self, hero, "PC_Psionic_ANOTHERTHUNDERBALL_23_02"); //Ah, sehr gut.
};

///////////////////////////////////////////////////////////////////////
//	Info FINDBLOODORE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_FINDBLOODORE(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_FINDBLOODORE_Condition;
	information		= PC_Psionic_FINDBLOODORE_Info;
	description		= "Wo kann ich solches Bluterz finden?";
};

func int PC_Psionic_FINDBLOODORE_Condition()
{
	if (Lester_KnowBloodore)
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_FINDBLOODORE_Info()
{
	AI_Output(hero, self, "PC_Psionic_FINDBLOODORE_15_01"); //Wo kann ich solches Bluterz finden?
	AI_Output(self, hero, "PC_Psionic_FINDBLOODORE_23_02"); //Da habe ich nicht die geringste Ahnung.
	AI_Output(self, hero, "PC_Psionic_FINDBLOODORE_23_03"); //Waffenschmiede und Minenarbeiter haben normalerweise mit Erz zu tun.
	AI_Output(self, hero, "PC_Psionic_FINDBLOODORE_23_04"); //Vielleicht kommst du auf diesem Weg weiter.

	Npc_ExchangeRoutine(self, "start");

	B_LogEntry(CH1_LearnRuneMaking, CH1_LearnRuneMaking_10);

	Log_CreateTopic(CH1_Bloodore, LOG_MISSION);
	Log_SetTopicStatus(CH1_Bloodore, LOG_RUNNING);
	B_LogEntry(CH1_Bloodore, CH1_Bloodore_3);
};

//#####################################################################
//##
//##
//##					REZEPTUR FÜR TALAMON
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info SEARCHRECIPE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_SEARCHRECIPE(C_Info)
{
	npc				= PC_Psionic;
	nr				= 0;
	condition		= PC_Psionic_SEARCHRECIPE_Condition;
	information		= PC_Psionic_SEARCHRECIPE_Info;
	description		= "Ich suche nach einer Rezeptur...";
};

func int PC_Psionic_SEARCHRECIPE_Condition()
{
	if (Npc_KnowsInfo(hero, HLR_501_Talamon_RECIPEFORMONEY)
	&& !Npc_KnowsInfo(hero, HLR_501_Talamon_HASRECIPE))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Psionic_SEARCHRECIPE_Info()
{
	AI_Output(hero, self, "PC_Psionic_SEARCHRECIPE_15_01"); //Ich suche nach einer Rezeptur für ein Mittel gegen Wahnsinn.
	AI_Output(hero, self, "PC_Psionic_SEARCHRECIPE_15_02"); //Die Feuermagier sollen eine solche Rezeptur erforscht haben, aber ich kann hier im Magierhaus nichts finden!
	AI_Output(self, hero, "PC_Psionic_SEARCHRECIPE_23_03"); //Hmmm... ich kann mich dunkel an eine solche Rezeptur erinnern.
	AI_Output(self, hero, "PC_Psionic_SEARCHRECIPE_23_04"); //Aber ich habe sie nicht mehr.
	AI_Output(hero, self, "PC_Psionic_SEARCHRECIPE_15_05"); //Wer hat sie denn?
	AI_Output(self, hero, "PC_Psionic_SEARCHRECIPE_23_06"); //Ich habe alle Schriftstücke, die ich nicht brauchte an Agon den Händler verkauft, vielleicht hat er sie ja noch.

	if (!Npc_KnowsInfo(hero, WRK_225_Agon_WELCOME))
	{
		AI_Output(hero, self, "PC_Psionic_SEARCHRECIPE_15_07"); //Wo finde ich diesen Agon?
		AI_Output(self, hero, "PC_Psionic_SEARCHRECIPE_23_08"); //Er hat einen Stand im Händlerviertel. Im Aussenring. Aber sei vorsichtig, er ist ein ziemlich übler Kerl.
	};

	B_LogEntry(CH1_LearnAlchemy, CH1_LearnAlchemy_9);
};
