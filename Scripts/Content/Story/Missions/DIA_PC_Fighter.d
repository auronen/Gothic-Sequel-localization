///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance PC_Fighter_Exit(C_Info)
{
	npc				= PC_Fighter;
	nr				= 999;
	condition		= PC_Fighter_Exit_Condition;
	information		= PC_Fighter_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int PC_Fighter_Exit_Condition()
{
	return TRUE;
};

func void PC_Fighter_Exit_Info()
{
	AI_StopProcessInfos(self);
};

/*

instance PC_Fighter_TRAIN2(C_Info)
{
	npc				= PC_Fighter;
	nr				= 10;
	condition		= PC_Fighter_TRAIN2_Condition;
	information		= PC_Fighter_TRAIN2_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2, 0);
};

func int PC_Fighter_TRAIN2_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Fighter_FIRSTMISSION))
	{
		return 1;
	};
};

func void PC_Fighter_TRAIN2_Info()
{
	AI_Output(other, self, "PC_Fighter_TRAIN2_Info_15_00"); //Ich will den Kampf mit einhändigen Waffen perfekt beherrschen.

	if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
	{
		AI_Output(self, other, "PC_Fighter_TRAIN2_Info_22_01"); //Ein gute Absicht. Egal was du lernst, lerne es richtig.
		AI_Output(self, other, "PC_Fighter_TRAIN2_Info_22_02"); //Kampfhaltung und Schlag- Kombinationen wirst du mit der Zeit schon beherrschen.
		AI_Output(self, other, "PC_Fighter_TRAIN2_Info_22_03"); //Es gibt verschiedene Kampftechniken. Du kannst den Gegener ständig umkreisen und gezielt zuschlagen. Aber davon bin ich kein Freund.
		AI_Output(self, other, "PC_Fighter_TRAIN2_Info_22_04"); //Ich schlage zu und falls es notwendig ist, schlage ich nochmal. Bis er am Boden liegt. Dann den nächsten.
		AI_Output(self, other, "PC_Fighter_TRAIN2_Info_22_05"); //So kämpfe ich. Schnell und hart. Alles andere ist Frauentanz.
		AI_Output(self, other, "PC_Fighter_TRAIN2_Info_22_06"); //Zeig mir mal wie du die Keule schwingst. Es gibt zwei Jungs vonner Miliz, die schlagen sich zu gerne mit den Arbeitern. Verpasse ihnen eine Lektion!
		AI_Output(self, other, "PC_Fighter_TRAIN2_Info_22_07"); //Die beiden Typen heissen 106 und 107. Mach sie fertig, aber bring sie nicht um.
		CreateInvItem(self, ItFo_Beer);
		AI_UseItem(self, ItFo_Beer);

		PC_Fighter_TRAIN2.permanent = 0;
	};
};

// Kampf mit Zweihändigen Waffen

instance PC_Fighter_ZWEIHAND1(C_Info)
{
	npc				= PC_Fighter;
	nr				= 0;
	condition		= PC_Fighter_ZWEIHAND1_Condition;
	information		= PC_Fighter_ZWEIHAND1_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1, 0);
};

func int PC_Fighter_ZWEIHAND1_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_2H) < 1))
	{
		return 1;
	};
};

func void PC_Fighter_ZWEIHAND1_Info()
{
	AI_Output(other, self, "PC_Fighter_ZWEIHAND1_Info_15_01"); //Ich möchte den Umgang mit dem Zweihänder lernen.

	if (B_GiveSkill(other, NPC_TALENT_2H, 1, LPCOST_TALENT_2H_1))
	{
		AI_Output(self, other, "PC_Fighter_ZWEIHAND1_Info_09_02"); //Nun, dann will ich dir mal ein paar Takte erzählen.

		CreateInvItem(self, ItFo_Beer);
		AI_UseItem(self, ItFo_Beer);

		AI_Output(self, other, "PC_Fighter_ZWEIHAND1_Info_22_03"); //Zweihänder das sind die richtigen Waffen. Ich selber bevorzuge meine Axt, aber auch die Schwerter schneiden gute Wunden.
		AI_Output(self, other, "PC_Fighter_ZWEIHAND1_Info_22_04"); //Für so einen Zweihänder brauchst du ordentlich Stärke. Erst dann kannst du die tödlichen Schläge durchziehen.
		AI_Output(self, other, "PC_Fighter_ZWEIHAND1_Info_22_05"); //Ich habe schon viele Kerle gesehen die stolz einen Zweihänder trugen, aber nicht mal eine Kombination schlagen konnten.
		AI_Output(self, other, "PC_Fighter_ZWEIHAND1_Info_22_06"); //Klar, es geht auch ohne Kombinationen. Wenn du die Waffe nur seitlich schwingst, bremst du die Bewegungen deines Opfers.
		AI_Output(self, other, "PC_Fighter_ZWEIHAND1_Info_22_07"); //Drei, vier kräftige Schläge und jeder Mann geht zu Boden. Deshalb liebe ich diese Waffen.

		PC_Fighter_ZWEIHAND1.permanent = 0;
	};
};

//-------------------------------------------------------------------------
//				ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance PC_Fighter_ZWEIHAND2(C_Info)
{
	npc				= PC_Fighter;
	nr				= 0;
	condition		= PC_Fighter_ZWEIHAND2_Condition;
	information		= PC_Fighter_ZWEIHAND2_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2, 0);
};

func int PC_Fighter_ZWEIHAND2_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_2H) == 1)
	{
		return TRUE;
	};
};

func void PC_Fighter_ZWEIHAND2_Info()
{
	AI_Output(other, self, "PC_Fighter_ZWEIHAND2_Info_15_01"); //Ich möchte mehr über den zweihändigen Kampf lernen.

	if (B_GiveSkill(other, NPC_TALENT_2H, 2, LPCOST_TALENT_2H_2))
	{
		AI_Output(self, other, "PC_Fighter_ZWEIHAND2_Info_22_02"); //Das große Waffen großen Schaden machen weißt du ja bereits.
		AI_Output(self, other, "PC_Fighter_ZWEIHAND2_Info_22_03"); //Ich kannte mal einen Typen der konnte stundenlang von Kombinationen und Blockhaltungen sprechen.
		AI_Output(self, other, "PC_Fighter_ZWEIHAND2_Info_22_04"); //Eines Tages, als er wieder am Feuer saß und erzählte, stand einer auf und erschlug ihn.
		AI_Output(self, other, "PC_Fighter_ZWEIHAND2_Info_22_05"); //Sei immer vorbereitet und auf der Hut. Erwarte nichts und rechne mit allem.
		AI_Output(self, other, "PC_Fighter_ZWEIHAND2_Info_22_06"); //Lerne deine Waffe kennen und benutze sie dafür, wofür sie da ist.
		AI_Output(self, other, "PC_Fighter_ZWEIHAND2_Info_22_07"); //Und wenn du schon den Löffel abgibst, dann nimm soviele Bastarde mit, wie du kriegen kannst.
		AI_Output(self, other, "PC_Fighter_ZWEIHAND2_Info_22_08"); //Soviel dazu.

		CreateInvItem(self, ItFo_Beer);
		AI_UseItem(self, ItFo_Beer);

		PC_Fighter_ZWEIHAND2.permanent = 0;
	};
};
*/
/* ------------------------------------------------------------------------
ARMBRUST TALK
------------------------------------------------------------------------ */
/*
instance PC_Fighter_CROSSBOW(C_Info)
{
	npc				= PC_Fighter;
	nr				= 0;
	condition		= PC_Fighter_CROSSBOW_Condition;
	information		= PC_Fighter_CROSSBOW_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LearnCrossbow_1, LPCOST_TALENT_CROSSBOW_1, 0);
};

func int PC_Fighter_CROSSBOW_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_BOW) == 2)
	&& (Npc_KnowsInfo(other, PC_Fighter_NEEDTRAINING)))
	{
		return TRUE;
	};
};

func void PC_Fighter_CROSSBOW_Info()
{
	AI_Output(other, self, "PC_Fighter_CROSSBOW_OK_15_01"); //Zeig mir den Umgang mit der Armbrust.

	if (B_GiveSkill(other, NPC_TALENT_CROSSBOW, 1, LPCOST_TALENT_CROSSBOW_1))
	{
		AI_Output(self, other, "PC_Fighter_CROSSBOW_OK_09_02"); //Gut, fangen wir direkt an. Die Armbrust ist eine Waffe mit Zukunft.
		AI_Output(self, other, "PC_Fighter_CROSSBOW_OK_09_03"); //Die Mechanik macht es sogar einer Frau möglich, dir einen Bolzen durch den Schädel zu jagen.
		AI_Output(self, other, "PC_Fighter_CROSSBOW_OK_09_04"); //Allerdings haben die Frauen nicht die Kraft die Armbrust wieder zu spannen. HAHAHA
		AI_Output(self, other, "PC_Fighter_CROSSBOW_OK_09_05"); //Wie auch immer,es ist immer wieder der gleiche Vorgang: Spannen, Bolzen einlegen, zielen und durchziehen.
		AI_Output(self, other, "PC_Fighter_CROSSBOW_OK_09_06"); //Denk daran, die Armbrust ist eine Fernkampfwaffe. Setze sie nur ein, wenn deine Opfer in entsprechender Entfernung sind.
		AI_Output(self, other, "PC_Fighter_CROSSBOW_OK_09_07"); //Du kannst auch direkt mal was für mich tun.
		AI_Output(self, other, "PC_Fighter_CROSSBOW_OK_09_08"); //Mehrere Blutfliegen haben am hinteren Lagertor einen Arbeiter angegriffen. Erledige sie mit deinen Bolzen!

		PC_Fighter_CROSSBOW.permanent = 0;
	};
};

/* ------------------------------------------------------------------------
ARMBRUST TALENT2
------------------------------------------------------------------------ */
/*
instance PC_Fighter_CROSSBOW2(C_Info)
{
	npc				= PC_Fighter;
	nr				= 0;
	condition		= PC_Fighter_CROSSBOW2_Condition;
	information		= PC_Fighter_CROSSBOW2_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LearnCrossbow_2, LPCOST_TALENT_CROSSBOW_2, 0);
};

func int PC_Fighter_CROSSBOW2_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_CROSSBOW) == 1)
	{
		return TRUE;
	};
};

func void PC_Fighter_CROSSBOW2_Info()
{
	AI_Output(other, self, "PC_Fighter_CROSSBOW2_OK_15_01"); //Ich will die Meisterschaft mit der Armbrust lernen.

	if (B_GiveSkill(other, NPC_TALENT_CROSSBOW, 2, LPCOST_TALENT_CROSSBOW_2))
	{
		AI_Output(self, other, "PC_Fighter_CROSSBOW2_OK_09_02"); //So, du willst ein Meister werden?
		AI_Output(self, other, "PC_Fighter_CROSSBOW2_OK_09_03"); //Sieh zu das du nicht mit einer leichten Armbrust rumläufst, sondern besorge dir die Teile, die ordentlich Löcher reissen.
		AI_Output(self, other, "PC_Fighter_CROSSBOW2_OK_09_04"); //Wenn du gegen mehrere Gegner kämpfst, dann arbeite mit schnellen Zielwechseln. So kannst du sie aufhalten.
		AI_Output(self, other, "PC_Fighter_CROSSBOW2_OK_09_05"); //Und sorge dafür das du immer genug Bolzen hast. Wenn die ersten Schüsse nicht ausreichen, um dein Opfer zu töten, jage soviele hinterher, wie du brauchst.
		AI_Output(self, other, "PC_Fighter_CROSSBOW2_OK_09_06"); //Bolzen sind billig und deine Haut ist teuer. Denk daran wenn du im Wald stehst und keine Bolzen mehr hast. HAHAHA
		AI_Output(self, other, "PC_Fighter_CROSSBOW2_OK_09_07"); //Die Blutfliegen müssen irgendwo ein Nest haben. Finde es und lösche die gesamte Brut aus!
		CreateInvItem(self, ItFo_Beer);
		AI_UseItem(self, ItFo_Beer);
		PC_Fighter_CROSSBOW2.permanent = 0;
	};
};
*/
