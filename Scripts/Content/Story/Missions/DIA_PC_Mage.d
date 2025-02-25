///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance PC_Mage_EXIT(C_Info)
{
	npc				= PC_Mage;
	nr				= 999;
	condition		= PC_Mage_EXIT_Condition;
	information		= PC_Mage_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int PC_Mage_EXIT_Condition()
{
	return TRUE;
};

func void PC_Mage_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance PC_Mage_WELCOME(C_Info)
{
	npc				= PC_Mage;
	nr				= 1;
	condition		= PC_Mage_WELCOME_Condition;
	information		= PC_Mage_WELCOME_Info;
	important		= TRUE;
};

func int PC_Mage_WELCOME_Condition()
{
	return TRUE;
};

func void PC_Mage_WELCOME_Info()
{
	AI_Output(self, hero, "PC_Mage_WELCOME_15_01"); //Hey, ich dachte du wärst tot!
	AI_Output(hero, self, "PC_Mage_WELCOME_15_02"); //Da bist du nicht der einzige.
	AI_Output(self, hero, "PC_Mage_WELCOME_02_03"); //Wie ist es dir seit unserem letzten Treffen ergangen?
	AI_Output(hero, self, "PC_Mage_WELCOME_15_04"); //Naja, ich hab den Schläfer verbannt, lag ein halbes Jahr unter Felstrümmern begraben,
	AI_Output(hero, self, "PC_Mage_WELCOME_15_05"); //und als ich schliesslich gerettet werde, erfahre ich, das wir von Orks umzingelt sind und Dämonen unterwegs sind.
	AI_Output(self, hero, "PC_Mage_WELCOME_02_06"); //Du steckst mal wieder mittendrin.
	AI_Output(hero, self, "PC_Mage_WELCOME_15_07"); //So sieht's aus. Und jetzt brauche ich deine Hilfe.
	AI_Output(self, hero, "PC_Mage_WELCOME_02_08"); //Was kann ich für dich tun?
};

///////////////////////////////////////////////////////////////////////
//	Info DEMONS
///////////////////////////////////////////////////////////////////////
instance PC_Mage_DEMONS(C_Info)
{
	npc				= PC_Mage;
	nr				= 2;
	condition		= PC_Mage_DEMONS_Condition;
	information		= PC_Mage_DEMONS_Info;
	description		= "Was weißt du über die Dämonen? ";
};

func int PC_Mage_DEMONS_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Mage_WELCOME))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Mage_DEMONS_Info()
{
	AI_Output(hero, self, "PC_Mage_DEMONS_15_01"); //Was weißt du über die Dämonen?
	AI_Output(self, hero, "PC_Mage_DEMONS_02_02"); //Nun, sie können sich an jedem Ort im Tal manifestieren.
	AI_Output(hero, self, "PC_Mage_DEMONS_15_03"); //Was noch?
	AI_Output(self, hero, "PC_Mage_DEMONS_02_04"); //Hmmm... sie sind weitaus stärker als ihre natürlichen Abbilder.
	AI_Output(hero, self, "PC_Mage_DEMONS_15_05"); //Aber wir können sie mit unseren Waffen töten.
	AI_Output(self, hero, "PC_Mage_DEMONS_02_06"); //Und es werden mehr. Das ist alles was ich weiß.
	AI_Output(hero, self, "PC_Mage_DEMONS_15_07"); //Immerhin ein Anfang.
};

///////////////////////////////////////////////////////////////////////
//	Info KDF
///////////////////////////////////////////////////////////////////////
instance PC_Mage_KDF(C_Info)
{
	npc				= PC_Mage;
	nr				= 2;
	condition		= PC_Mage_KDF_Condition;
	information		= PC_Mage_KDF_Info;
	description		= "Ich muss mit den Feuermagiern sprechen";
};

func int PC_Mage_KDF_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Mage_WELCOME))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Mage_KDF_Info()
{
	AI_Output(hero, self, "PC_Mage_KDF_15_01"); //Ich muss mit den Feuermagiern sprechen.
	AI_Output(self, hero, "PC_Mage_KDF_02_02"); //Was willst du von ihnen?
	AI_Output(hero, self, "PC_Mage_KDF_15_03"); //Ich muss herausfinden was sie vorhaben.
	AI_Output(self, hero, "PC_Mage_KDF_02_04"); //Sie forschen zur Zeit nach einer Möglichkeit die Dämonen aufzuhalten.
	AI_Output(hero, self, "PC_Mage_KDF_15_05"); //Genau deshalb will ich mit ihnen sprechen. Ich muss wissen was sie planen.
	AI_Output(self, hero, "PC_Mage_KDF_02_06"); //Dann solltest du mit Catmaol sprechen, dem Berater des Königs. Er hält sich im Thronsaal auf.
	AI_Output(self, hero, "PC_Mage_KDF_02_07"); //Aber nur wer sich als loyal und fähig erwiesen hat, bekommt das Recht den Thronsaal zu betreten.
};

///////////////////////////////////////////////////////////////////////
//	Info TODO
///////////////////////////////////////////////////////////////////////
instance PC_Mage_TODO(C_Info)
{
	npc				= PC_Mage;
	nr				= 3;
	condition		= PC_Mage_TODO_Condition;
	information		= PC_Mage_TODO_Info;
	description		= "Dann werde ich mir dieses Recht verschaffen";
};

func int PC_Mage_TODO_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Mage_KDF))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Mage_TODO_Info()
{
	AI_Output(hero, self, "PC_Mage_TODO_15_01"); //Dann werde ich mir dieses Recht wohl verschaffen müssen.
	AI_Output(self, hero, "PC_Mage_TODO_02_02"); //Gut. Wenn du die anderen Magier von deinen Fähigkeiten überzeugen kannst, wirst du Zugang zum Thronsaal bekommen.
	AI_Output(self, hero, "PC_Mage_TODO_02_03"); //Ich werde dich dabei unterstützen.
	AI_Output(self, hero, "PC_Mage_TODO_02_04"); //Um das Vertrauen der Magier zu gewinnen, ist es hilfreich das ich weiß, was du bisher gelernt hast.
	AI_Output(self, hero, "PC_Mage_TODO_02_05"); //Verschwenden wir keine Zeit. Also, was hast du aus dem Bereich der Magie gelernt?
	Info_ClearChoices(PC_Mage_TODO);

	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(PC_Mage_TODO, "Erster Kreis der Magie", PC_Mage_TODO_Mage_1);
	};

	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(PC_Mage_TODO, "Zweiter Kreis der Magie", PC_Mage_TODO_Mage_2);
	};

	if (Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY) >= 1)
	{
		Info_AddChoice(PC_Mage_TODO, "Alchimie", PC_Mage_TODO_Alchemy);
	};

	if (Npc_GetTalentSkill(hero, NPC_TALENT_THAUMATURGY) >= 1)
	{
		Info_AddChoice(PC_Mage_TODO, "Runen herstellen", PC_Mage_TODO_THAUMATURGY);
	};

	if (!(Npc_GetTalentSkill(hero, NPC_TALENT_THAUMATURGY) >= 1)
	&& !(Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY) >= 1)
	&& !(Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) >= 1))
	{
		Info_AddChoice(PC_Mage_TODO, "Kein magisches Talent", PC_Mage_TODO_Nothing);
	};
};

func void PC_Mage_TODO_Mage_1()
{
	AI_Output(hero, self, "PC_Mage_TODO_Mage_1_15_01"); //Ich beherrsche den ersten Kreis der Magie.
	AI_Output(self, hero, "PC_Mage_TODO_Mage_1_02_02"); //Der erste Schritt auf einem lohnenden Weg. Ja, das ist nützlich.

	Mage_Trust = Mage_Trust + 1;
};

func void PC_Mage_TODO_Mage_2()
{
	AI_Output(hero, self, "PC_Mage_TODO_Mage_2_15_01"); //Ich beherrsche den zweiten Kreis der Magie.
	AI_Output(self, hero, "PC_Mage_TODO_Mage_2_02_02"); //Sehr gut, du hast die wenige Zeit bisher sinnvoll genutzt.

	Mage_Trust = Mage_Trust + 2;
};

func void PC_Mage_TODO_Alchemy()
{
	AI_Output(hero, self, "PC_Mage_TODO_Alchemy_15_01"); //Ich besitze alchimistische Kenntnisse.
	AI_Output(self, hero, "PC_Mage_TODO_Alchemy_02_02"); //Gut, das wird Morogh unser Alchimist zu schätzen wissen.

	Mage_Trust = Mage_Trust + 1;
};

func void PC_Mage_TODO_THAUMATURGY()
{
	AI_Output(hero, self, "PC_Mage_TODO_THAUMATURGY_15_01"); //Ich kann Runen herstellen.
	AI_Output(self, hero, "PC_Mage_TODO_THAUMATURGY_02_02"); //Ausgezeichnet. Damit verdienst du ihren Respekt.

	Mage_Trust = Mage_Trust + 1;
};

func void PC_Mage_TODO_Nothing()
{
	AI_Output(hero, self, "PC_Mage_TODO_Nothing_15_01"); //Ich beherrsche kein magisches Talent.
	AI_Output(self, hero, "PC_Mage_TODO_Nothing_02_02"); //Das ist keine gute Voraussetzung.
};

///////////////////////////////////////////////////////////////////////
//	Info ABOUT
///////////////////////////////////////////////////////////////////////
instance PC_Mage_ABOUT(C_Info)
{
	npc				= PC_Mage;
	nr				= 2;
	condition		= PC_Mage_ABOUT_Condition;
	information		= PC_Mage_ABOUT_Info;
	description		= "Und, wie geht's jetzt weiter? (WORKINPROGRESS)";
};

func int PC_Mage_ABOUT_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Mage_TODO))
	{
		return TRUE;
	};

	return FALSE;
};

func void PC_Mage_ABOUT_Info()
{
	AI_Output(hero, self, "PC_Mage_ABOUT_15_01"); //Und, wie geht's jetzt weiter? (WORKINPROGRESS)
	AI_Output(self, hero, "PC_Mage_ABOUT_02_02"); //Das kommt darauf an. Wen willst du überzeugen?

	Info_ClearChoices(PC_Mage_ABOUT);

	Info_AddChoice(PC_Mage_ABOUT, "Morogh (Alchimist)", PC_Mage_ABOUT_Morogh);
	Info_AddChoice(PC_Mage_ABOUT, "Nereus (Magietheoretiker)", PC_Mage_ABOUT_Nereus);
	Info_AddChoice(PC_Mage_ABOUT, "Feoras (Runen Hersteller)", PC_Mage_ABOUT_Feoras);
	Info_AddChoice(PC_Mage_ABOUT, DIALOG_BACK, PC_Mage_ABOUT_BACK);
};

func void PC_Mage_ABOUT_BACK()
{
	Info_ClearChoices(PC_Mage_ABOUT);
};

func void PC_Mage_ABOUT_Morogh()
{
	AI_Output(hero, self, "PC_Mage_ABOUT_Morogh_15_01"); //Morogh den Alchimisten.
	AI_Output(self, hero, "PC_Mage_ABOUT_Morogh_02_02"); //Er untersucht die Konzentrationen von magischen Tränken.
	AI_Output(self, hero, "PC_Mage_ABOUT_Morogh_02_03"); //Vielleicht kann er deine Hilfe gebrauchen.
};

func void PC_Mage_ABOUT_Nereus()
{
	AI_Output(hero, self, "PC_Mage_ABOUT_Nerues_15_01"); //Nerues den Magietheoretiker.
	AI_Output(self, hero, "PC_Mage_ABOUT_Nerues_02_02"); //Er beschäftigt sich mit der Manipulation des magischen Gefüges.
	AI_Output(self, hero, "PC_Mage_ABOUT_Nerues_02_03"); //Vielleicht kann er deine Hilfe gebrauchen.
};

func void PC_Mage_ABOUT_Feoras()
{
	AI_Output(hero, self, "PC_Mage_ABOUT_Feoras_15_01"); //Feoras den Runenhersteller.
	AI_Output(self, hero, "PC_Mage_ABOUT_Feoras_02_02"); //Er sucht nach Artefakten udn Reliquien verschiedenster Art.
	AI_Output(self, hero, "PC_Mage_ABOUT_Feoras_02_03"); //Vielleicht kann er deine Hilfe gebrauchen.
};
