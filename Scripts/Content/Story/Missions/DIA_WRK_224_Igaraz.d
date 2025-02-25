instance Wrk_224_Igaraz_Exit(C_Info)
{
	npc				= Wrk_224_Igaraz;
	nr				= 999;
	condition		= Wrk_224_Igaraz_Exit_Condition;
	information		= Wrk_224_Igaraz_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Wrk_224_Igaraz_Exit_Condition()
{
	return TRUE;
};

func void Wrk_224_Igaraz_Exit_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NEW
///////////////////////////////////////////////////////////////////////
instance Wrk_224_Igaraz_NEW(C_Info)
{
	npc				= Wrk_224_Igaraz;
	nr				= 12;
	condition		= Wrk_224_Igaraz_NEW_Condition;
	information		= Wrk_224_Igaraz_NEW_Info;
	important		= TRUE;
};

func int Wrk_224_Igaraz_NEW_Condition()
{
	if (C_NPCisinvincible(hero))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_224_Igaraz_NEW_Info()
{
	AI_Output(self, hero, "Wrk_224_NEW_02_01"); //Hey, du bist neu hier, nicht wahr? Mein Name ist Igaraz.
	AI_Output(self, hero, "Wrk_224_NEW_02_02"); //Wenn du irgendwas über das Lager wissen willst, dann bist du bei mir genau richtig.
	AI_Output(self, hero, "Wrk_224_NEW_02_03"); //Ich bin schon ziemlich lange hier drin und kenne jeden Winkel und jede Ecke des Lagers.
};

///////////////////////////////////////////////////////////////////////
//	Info VISITE
///////////////////////////////////////////////////////////////////////
instance Wrk_224_Igaraz_VISITE(C_Info)
{
	npc				= Wrk_224_Igaraz;
	nr				= 13;
	condition		= Wrk_224_Igaraz_VISITE_Condition;
	information		= Wrk_224_Igaraz_VISITE_Info;
	description		= "Dann zeig mir mal das Lager";
};

func int Wrk_224_Igaraz_VISITE_Condition()
{
	if (Npc_KnowsInfo(hero, Wrk_224_Igaraz_NEW)
	&& Knows_Igaraz == FALSE)
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_224_Igaraz_VISITE_Info()
{
	AI_Output(hero, self, "Wrk_224_VISITE_15_01"); //Dann zeig mir mal das Lager.
	AI_Output(self, hero, "Wrk_224_VISITE_02_02"); //Das kostet dich allerdings 'ne Kleinigkeit... 20 Silberstücke.
	AI_Output(self, hero, "Wrk_224_VISITE_02_03"); //Sag mir Bescheid, wenn du bereit bist.
};

///////////////////////////////////////////////////////////////////////
//	Info PAY
///////////////////////////////////////////////////////////////////////
instance Wrk_224_Igaraz_PAY(C_Info)
{
	npc				= Wrk_224_Igaraz;
	nr				= 14;
	condition		= Wrk_224_Igaraz_PAY_Condition;
	information		= Wrk_224_Igaraz_PAY_Info;
	description		= "(20 Silber geben)";
};

func int Wrk_224_Igaraz_PAY_Condition()
{
	if (Npc_KnowsInfo(hero, Wrk_224_Igaraz_VISITE)
	&& Npc_HasItems(hero, ITMi_Silver) >= NAME_IgarazSilver)
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_224_Igaraz_PAY_Info()
{
	AI_Output(hero, self, "Wrk_224_PAY_15_01"); //Okay, hier ist das Silber
	B_GiveInvItems(hero, self, ItMi_Silver, NAME_IgarazSilver);
	AI_Output(self, hero, "Wrk_224_PAY_02_02"); //Ausgezeichnet. Ich stehe dir jederzeit zur Verfügung. Sag mir einfach Bescheid.
};

///////////////////////////////////////////////////////////////////////
//	Info DIEGO
///////////////////////////////////////////////////////////////////////
instance Wrk_224_Igaraz_DIEGO(C_Info)
{
	npc				= Wrk_224_Igaraz;
	nr				= 0;
	condition		= Wrk_224_Igaraz_DIEGO_Condition;
	information		= Wrk_224_Igaraz_DIEGO_Info;
	description		= "Diego schickt mich,...";
};

func int Wrk_224_Igaraz_DIEGO_Condition()
{
	if (Knows_Igaraz == TRUE)
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_224_Igaraz_DIEGO_Info()
{
	AI_Output(hero, self, "Wrk_224_DIEGO_15_01"); //Diego schickt mich , du kannst mir das Lager zeigen?
	AI_Output(self, hero, "Wrk_224_DIEGO_02_02"); //Oh, du bist ein Freund von Diego! Diegos Freunde sind auch meine Freunde.
	AI_Output(self, hero, "Wrk_224_DIEGO_02_03"); //Und es gibt einen besonderen Grund, warum er dich zu mir geschickt hat...
	AI_Output(hero, self, "Wrk_224_DIEGO_15_04"); //Weil du nichts anderes zu tun hast?
	AI_Output(self, hero, "Wrk_224_DIEGO_02_05"); //Nein, weil es keinen Besseren als mich gibt.
	AI_Output(self, hero, "Wrk_224_DIEGO_02_06"); //Ich stehe dir jederzeit zur Verfügung. Sag mir einfach Bescheid.
};

///////////////////////////////////////////////////////////////////////
//	Info GUIDE
///////////////////////////////////////////////////////////////////////
instance Wrk_224_Igaraz_GUIDE(C_Info)
{
	npc				= Wrk_224_Igaraz;
	nr				= 20;
	condition		= Wrk_224_Igaraz_GUIDE_Condition;
	information		= Wrk_224_Igaraz_GUIDE_Info;
	permanent		= TRUE;
	description		= "Bring mich zu...";
};

func int Wrk_224_Igaraz_GUIDE_Condition()
{
	if (Npc_KnowsInfo(hero, Wrk_224_Igaraz_DIEGO)
	|| Npc_KnowsInfo(hero, Wrk_224_Igaraz_PAY))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_224_Igaraz_GUIDE_Info()
{
	AI_Output(hero, self, "Wrk_224_GUIDE_15_01"); //Bring mich zu...

	Info_AddChoice(Wrk_224_Igaraz_GUIDE, DIALOG_BACK, Wrk_224_Igaraz_GUIDE_BACK);
	Info_AddChoice(Wrk_224_Igaraz_GUIDE, "...der Arena", Wrk_224_Igaraz_GUIDE_ARENA);
	Info_AddChoice(Wrk_224_Igaraz_GUIDE, "...den Händlern", Wrk_224_Igaraz_GUIDE_TRADE);
	Info_AddChoice(Wrk_224_Igaraz_GUIDE, "...den Heilern", Wrk_224_Igaraz_GUIDE_HEAL);
	Info_AddChoice(Wrk_224_Igaraz_GUIDE, "...den Arbeitern", Wrk_224_Igaraz_GUIDE_WORKER);
};

func void Wrk_224_Igaraz_GUIDE_BACK()
{
	Info_ClearChoices(Wrk_224_Igaraz_GUIDE);
};

func void Wrk_224_Igaraz_GUIDE_WORKER()
{
	AI_Output(hero, self, "Wrk_224_GUIDE_WORKER_15_01"); //...den Arbeitern.
	AI_Output(self, hero, "Wrk_224_GUIDE_WORKER_02_02"); //Es ist mir ein Vergnügen.

	GuidePC_Destination = "OCR_OUTSIDE_HUT_77_MOVEMENT";
	Npc_ExchangeRoutine(self, "GUIDEWORKER");
	AI_StopProcessInfos(self);
};

func void Wrk_224_Igaraz_GUIDE_HEAL()
{
	AI_Output(hero, self, "Wrk_224_GUIDE_HEAL_15_01"); //...den Heilern.
	AI_Output(self, hero, "Wrk_224_GUIDE_HEAL_02_02"); //Natürlich, sehr gerne.

	GuidePC_Destination = "OCR_GHETTO_13";
	Npc_ExchangeRoutine(self, "GUIDEHEALER");
	AI_StopProcessInfos(self);
};

func void Wrk_224_Igaraz_GUIDE_TRADE()
{
	AI_Output(hero, self, "Wrk_224_GUIDE_TRADE_15_01"); //...den Händlern.
	AI_Output(self, hero, "Wrk_224_GUIDE_TRADE_02_02"); //Eine meiner leichtesten Übungen.

	GuidePC_Destination = "OCR_WASH_8";
	Npc_ExchangeRoutine(self, "GUIDETRADER");
	AI_StopProcessInfos(self);
};

func void Wrk_224_Igaraz_GUIDE_ARENA()
{
	AI_Output(hero, self, "Wrk_224_GUIDE_ARENA_15_01"); //...der Arena.
	AI_Output(self, hero, "Wrk_224_GUIDE_ARENA_02_02"); //Wenn's weiter nichts ist.

	GuidePC_Destination = "OCR_OUTSIDE_ARENA_01";
	Npc_ExchangeRoutine(self, "GUIDEARENA");
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HEALER
///////////////////////////////////////////////////////////////////////
instance Wrk_224_Igaraz_HEALER(C_Info)
{
	npc				= Wrk_224_Igaraz;
	condition		= Wrk_224_Igaraz_HEALER_Condition;
	information		= Wrk_224_Igaraz_HEALER_Info;
	important		= TRUE;
};

func int Wrk_224_Igaraz_HEALER_Condition()
{
	if ((Npc_GetDistToWP(self, "OCR_GHETTO_13") <= 300)
	&& Npc_IsInRoutine(self, ZS_GuidePC))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_224_Igaraz_HEALER_Info()
{
	AI_Output(self, hero, "Wrk_224_HEALER_02_01"); //Hier ist das Viertel der Kranken. Niemand weiß was ihnen fehlt.
	AI_Output(self, hero, "Wrk_224_HEALER_02_02"); //Sie leiden alle an einer seltenen Krankheit. Sogar Die Heiler sind ratlos.
	AI_Output(self, hero, "Wrk_224_HEALER_02_03"); //Ich gehe zurück zum Haupteingang.
	Npc_ExchangeRoutine(self, "PRESTART");
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WORKER
///////////////////////////////////////////////////////////////////////
instance Wrk_224_Igaraz_WORKER(C_Info)
{
	npc				= Wrk_224_Igaraz;
	condition		= Wrk_224_Igaraz_WORKER_Condition;
	information		= Wrk_224_Igaraz_WORKER_Info;
	important		= TRUE;
};

func int Wrk_224_Igaraz_WORKER_Condition()
{
	if ((Npc_GetDistToWP(self, "OCR_OUTSIDE_HUT_77_MOVEMENT") <= 300)
	&& Npc_IsInRoutine(self, ZS_GuidePC))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_224_Igaraz_WORKER_Info()
{
	AI_Output(self, hero, "Wrk_224_WORKER_02_01"); //Hier sind die Arbeiter beschäftigt.
	AI_Output(self, hero, "Wrk_224_WORKER_02_02"); //Sie glauben, das sie es schaffen können, das Lager gegen die Orks zu verteidigen.
	AI_Output(self, hero, "Wrk_224_WORKER_02_03"); //Der Baumeister ist Bormor, ein unglaublich brutaler Kerl, halte dich besser fern von ihm...
	AI_Output(self, hero, "Wrk_224_WORKER_02_04"); //Wenn du mich wieder brauchst, ich bin am Haupteingang.

	Npc_ExchangeRoutine(self, "PRESTART");
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info ARENA
///////////////////////////////////////////////////////////////////////
instance Wrk_224_Igaraz_ARENA(C_Info)
{
	npc				= Wrk_224_Igaraz;
	condition		= Wrk_224_Igaraz_ARENA_Condition;
	information		= Wrk_224_Igaraz_ARENA_Info;
	important		= TRUE;
};

func int Wrk_224_Igaraz_ARENA_Condition()
{
	if ((Npc_GetDistToWP(self, "OCR_OUTSIDE_ARENA_01") <= 300)
	&& Npc_IsInRoutine(self, ZS_GuidePC))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_224_Igaraz_ARENA_Info()
{
	AI_Output(self, hero, "Wrk_224_ARENA_02_01"); //Die Arena ist der einzige Ort wo man ein wenig Abwechslung finden kann.
	AI_Output(self, hero, "Wrk_224_ARENA_02_02"); //Hier gibt es allabendlich gute  Kämpfe  zu sehen.
	AI_Output(self, hero, "Wrk_224_ARENA_02_03"); //Der beste Arenakämpfer ist übrigens eine fremde Schönheit namens Thora.
	AI_Output(self, hero, "Wrk_224_ARENA_02_04"); //Die Frau haut alle anderen Gladiatoren aus den Latschen (hihi)
	AI_Output(self, hero, "Wrk_224_ARENA_02_05"); //Wenn du mich wieder brauchst, ich bin am Haupteingang.

	Npc_ExchangeRoutine(self, "PRESTART");
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TRADER
///////////////////////////////////////////////////////////////////////
instance Wrk_224_Igaraz_TRADER(C_Info)
{
	npc				= Wrk_224_Igaraz;
	condition		= Wrk_224_Igaraz_TRADER_Condition;
	information		= Wrk_224_Igaraz_TRADER_Info;
	important		= TRUE;
};

func int Wrk_224_Igaraz_TRADER_Condition()
{
	if ((Npc_GetDistToWP(self, "OCR_WASH_8") <= 300)
	&& Npc_IsInRoutine(self, ZS_GuidePC))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_224_Igaraz_TRADER_Info()
{
	AI_Output(self, hero, "Wrk_224_TRADER_02_01"); //Hier sind wir bei den Händlern. Alle Händler arbeiten für Agon.
	AI_Output(self, hero, "Wrk_224_TRADER_02_02"); //Ruga, der Rüstungsmacher, Gordian der Schreiber, Helvegor der Rüstungsmacher, sie alle beziehen ihre Waren von Agon.
	AI_Output(self, hero, "Wrk_224_TRADER_02_03"); //Und dafür zahlen sie hohe Preise.
	AI_Output(self, hero, "Wrk_224_TRADER_02_04"); //Wenn du mich wieder brauchst, ich bin am Haupteingang.

	Npc_ExchangeRoutine(self, "PRESTART");
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info CASTLE
///////////////////////////////////////////////////////////////////////
instance Wrk_224_Igaraz_CASTLE(C_Info)
{
	npc				= Wrk_224_Igaraz;
	nr				= 33;
	condition		= Wrk_224_Igaraz_CASTLE_Condition;
	information		= Wrk_224_Igaraz_CASTLE_Info;
	description		= "Was gibt's in der Burg? ";
};

func int Wrk_224_Igaraz_CASTLE_Condition()
{
	if (Npc_KnowsInfo(hero, Wrk_224_Igaraz_DIEGO)
	|| Npc_KnowsInfo(hero, Wrk_224_Igaraz_PAY))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_224_Igaraz_CASTLE_Info()
{
	AI_Output(hero, self, "Wrk_224_CASTLE_15_01"); //Was gibt's in der Burg?
	AI_Output(self, hero, "Wrk_224_CASTLE_02_02"); //Zum einen das Haus der Erzbarone.
	AI_Output(self, hero, "Wrk_224_CASTLE_02_03"); //Als hier noch eine Kolonie der Gefangenen war, saßen dort die Männer die den Erzabbau und das Lager kontrollierten.
	AI_Output(self, hero, "Wrk_224_CASTLE_02_04"); //Jetzt hat sich Diego dort niedergelassen.
	AI_Output(self, hero, "Wrk_224_CASTLE_02_05"); //Ansonsten hat sich die Miliz in der Burg breitgemacht. Sie schlafen dort, haben eine eigene Schmiede und Küche.
	AI_Output(self, hero, "Wrk_224_CASTLE_02_06"); //Und dann gibt es noch das Haus der Magier. Die Magier sind alle dort gestorben . Und ich kenne die Wahrheit darüber...
};

///////////////////////////////////////////////////////////////////////
//	Info MAGE
///////////////////////////////////////////////////////////////////////
instance Wrk_224_Igaraz_MAGE(C_Info)
{
	npc				= Wrk_224_Igaraz;
	nr				= 34;
	condition		= Wrk_224_Igaraz_MAGE_Condition;
	information		= Wrk_224_Igaraz_MAGE_Info;
	description		= "Erzähl mir über die Feuermagier";
};

func int Wrk_224_Igaraz_MAGE_Condition()
{
	if (Npc_KnowsInfo(hero, Wrk_224_Igaraz_CASTLE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Wrk_224_Igaraz_MAGE_Info()
{
	AI_Output(hero, self, "Wrk_224_MAGE_15_01"); //Erzähl mir über die Feuermagier.
	AI_Output(self, hero, "Wrk_224_MAGE_02_02"); //Die Feuermagier haben einst eine magische Barriere um das gesamte Tal errichtet, damit die Minenarbeiter nicht fliehen konnten.
	AI_Output(self, hero, "Wrk_224_MAGE_02_03"); //Sie unterstanden Gomez, dem stärksten Kämpfer und mächtigsten Mann innerhalb der Barriere.
	AI_Output(self, hero, "Wrk_224_MAGE_02_04"); //Gomez forschte nach einem Weg, die Barriere zu sprengen, denn er wollte seine Freiheit zurück.
	AI_Output(self, hero, "Wrk_224_MAGE_02_05"); //Aber die Feuermagier waren dagegen. Deshalb erließ Gomez den Befehl, sie alle... umzubringen.
	AI_Output(self, hero, "Wrk_224_MAGE_02_06"); //Seine Handlanger warteten also bis die Magier schliefen und erschlugen sie.
	AI_Output(self, hero, "Wrk_224_MAGE_02_07"); //Schließlich wurde die Barriere gesprengt, doch an diesem Tag sind alle, die an der Ermordung der Magier beteiligt waren, gestorben.
	AI_Output(self, hero, "Wrk_224_MAGE_02_08"); //Nur Gomez selber, wurde seit diesem Tag nie wieder gesehen.
};

/*
instance Wrk_224_Igaraz_HI(C_Info)
{
	npc				= Wrk_224_Igaraz;
	condition		= Wrk_224_Igaraz_HI_Condition;
	information		= Wrk_224_Igaraz_HI_Info;
	//important		= TRUE;
	description		= "(Startsatz)";
};

func int Wrk_224_Igaraz_HI_Condition()
{
	if (Npc_GetDistToNpc(self, other) <= 600)
	{
		return TRUE;
	};
};

func void Wrk_224_Igaraz_HI_Info()
{
	AI_GotoNpc(self, other);
	AI_Output(self, other, "Wrk_224_Igaraz_HI_Info_02_01"); //(halblaut) Hey, ich habe dich noch nie gesehen. Bist du gerade angekommen? Bist du vor den Orks geflohen?

	Info_ClearChoices(Wrk_224_Igaraz_HI);
	Info_AddChoice(Wrk_224_Igaraz_HI, "Was willst du von mir?", Wrk_224_Igaraz_WHAT);
	Info_AddChoice(Wrk_224_Igaraz_HI, "Das ist eine lange Geschichte", Wrk_224_Igaraz_LONG);
};

func void Wrk_224_Igaraz_WHAT()
{
	AI_Output(other, self, "Wrk_224_Igaraz_HI_WHAT_Info_15_01"); //Was willst du von mir?
	AI_Output(self, other, "Wrk_224_Igaraz_HI_WHAT_Info_02_02"); //(schmeichelnd) Du siehst hungrig aus. Ich schenke dir einen Schinken. Was sagst du dazu? Einen fetten saftigen Schinken.
	AI_Output(self, other, "Wrk_224_Igaraz_HI_WHAT_Info_02_03"); //Mit freundlichen Grüßen vom Krämer Agon. Und ich kann dir noch ein mehr gute Sachen zeigen, wenn du willst.

	B_GiveInvItems(self, other, Itfo_Ham, 1);
	Info_ClearChoices(Wrk_224_Igaraz_HI);
};

func void Wrk_224_Igaraz_LONG()
{
	AI_Output(other, self, "Wrk_224_Igaraz_HI_LONG_Info_15_01"); //Das ist eine lange Geschichte.
	AI_Output(self, other, "Wrk_224_Igaraz_HI_LONG_Info_02_02"); //(verständnisvoll) Oh- nun gut, ich verstehe. Du willst nicht darüber reden. Vielen die her kommen, fällt es schwer über all ihre schrecklichen Erlebnisse zu sprechen.
	AI_Output(self, other, "Wrk_224_Igaraz_HI_LONG_Info_02_03"); //Manche mussten mit ansehen wie ihre Freunde und Familien von den Orks niedergemetzelt wurden.
	AI_Output(self, other, "Wrk_224_Igaraz_HI_LONG_Info_02_04"); //Ich kenne einen der mit angesehen hat, wie seine Frau...
	AI_Output(other, self, "Wrk_224_Igaraz_HI_LONG_Info_15_05"); //Das reicht jetzt!
	AI_Output(self, other, "Wrk_224_Igaraz_HI_LONG_Info_02_06"); //Oh - tut mir leid. Hier nimm dieses Bier. Ein Geschenk vom Krämer Agon. Ich kann dir noch mehr Sachen zeigen, wenn du willst.

	B_GiveInvItems(self, other, ItFo_Beer, 1);
	Info_ClearChoices(Wrk_224_Igaraz_HI);
};

instance Wrk_224_Igaraz_NAME(C_Info)
{
	npc				= Wrk_224_Igaraz;
	nr				= 0;
	condition		= Wrk_224_Igaraz_NAME_Condition;
	information		= Wrk_224_Igaraz_NAME_Info;
	description		= "Wie heisst du eigentlich?";
};

func int Wrk_224_Igaraz_NAME_Condition()
{
	if (Igaraz_Name == TRUE)
	{
		return TRUE;
	};
};

func void Wrk_224_Igaraz_NAME_Info()
{
	AI_Output(other, self, "Wrk_224_Igaraz_NAME_Info_15_01"); //Wie heisst du eigentlich?
	AI_Output(self, other, "Wrk_224_Igaraz_NAME_Info_00_02"); //(galant)Wie unhöflich von mir. Ich mich noch gar nicht vorgestellt. Mein Name ist Igaraz.
	AI_Output(self, other, "Wrk_224_Igaraz_NAME_Info_00_03"); //Ich bin der Gehilfe vom Krämer Agon. Wir bieten alles was das Herz begehrt. Zu günstigen Preisen.
	self.name = "Igaraz";
};

instance Wrk_224_Igaraz_TRADER(C_Info)
{
	npc				= Wrk_224_Igaraz;
	nr				= 0;
	condition		= Wrk_224_Igaraz_TRADER_Condition;
	information		= Wrk_224_Igaraz_TRADER_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "Zeig mir die guten Sachen";
};

func int Wrk_224_Igaraz_TRADER_Condition()
{
	if (Npc_KnowsInfo(hero, Wrk_224_Igaraz_HI))
	{
		return TRUE;
	};
};

func void Wrk_224_Igaraz_TRADER_Info()
{
	AI_Output(other, self, "Wrk_224_Igaraz_NORMAL_Info_15_01"); //Zeig mir die guten Sachen.
	AI_Output(self, other, "Wrk_224_Igaraz_NORMAL_Info_00_02"); //Ich habe Fleisch, Schinken, Bier und Wein.

	Igaraz_Name = TRUE;
};
*/
