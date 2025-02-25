///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_EXIT(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 999;
	condition		= Info_Arenamaster_EXIT_Condition;
	information		= Info_Arenamaster_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Info_Arenamaster_EXIT_Condition()
{
	return TRUE;
};

func void Info_Arenamaster_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##						ARENA-KAMPF
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info NICEFIGHT
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_NICEFIGHT(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 2;
	condition		= Info_Arenamaster_NICEFIGHT_Condition;
	information		= Info_Arenamaster_NICEFIGHT_Info;
	important		= TRUE;
};

func int Info_Arenamaster_NICEFIGHT_Condition()
{
	if (Arenamaster_Teased
	&& Npc_IsInRoutine(self, ZS_ArenaMasterNpc)
	&& (Npc_GetDistToWP(self, ARENA_WP_THRONE) < 300)
	&& (Npc_GetDistToNpc(self, hero) < PERC_DIST_DIALOG))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Arenamaster_NICEFIGHT_Info()
{
	if (Npc_KnowsInfo(hero, Info_Arenamaster_SOUNDSGOOD))
	{
		AI_Output(self, hero, "Info_Arenamaster_NICEFIGHT_12_01"); //Ahh,	da bist	du ja!
	}
	else
	{
		Arenamaster_FirstDay = B_GetDay();
		Log_CreateTopic(CH1_Arena, LOG_MISSION);
		Log_SetTopicStatus(CH1_Arena, LOG_RUNNING);
	};

	AI_Output(hero, self, "Info_Arenamaster_NICEFIGHT_15_02"); //Netter Kampf!
	AI_Output(self, hero, "Info_Arenamaster_NICEFIGHT_12_03"); //Allerdings! Die Arenakämpfe sind	der	Höhepunkt in diesem	flohzerfressenen Lager.
	AI_Output(self, hero, "Info_Arenamaster_NICEFIGHT_12_04"); //Wenn	du hier	etwas werden willst, bleibt	dir	im Grunde garnichts	anderes	übrig, als Gladiator zu	werden.
	AI_Output(self, hero, "Info_Arenamaster_NICEFIGHT_12_05"); //Würdest du dich trauen, dich	selbst einmal in die Arena zu stellen und in die Augen eines anderen Gladiatoren zu	blicken?

	Info_ClearChoices(Info_Arenamaster_NICEFIGHT);
	Info_AddChoice(Info_Arenamaster_NICEFIGHT, "Ich kämpfe	nicht zur Belustigung anderer!", Info_Arenamaster_NICEFIGHT_NO);
	Info_AddChoice(Info_Arenamaster_NICEFIGHT, "Was springt für mich dabei	raus?", Info_Arenamaster_NICEFIGHT_WHAT);
	Info_AddChoice(Info_Arenamaster_NICEFIGHT, "Warum nicht! Was die können, kann ich auch!", Info_Arenamaster_NICEFIGHT_YES);
};

func void Info_Arenamaster_NICEFIGHT_YES()
{
	Info_ClearChoices(Info_Arenamaster_NICEFIGHT);
	AI_Output(hero, self, "Info_Arenamaster_NICEFIGHT_YES_15_01"); //Warum nicht!	Was	die	können,	kann ich auch!
	AI_Output(self, hero, "Info_Arenamaster_NICEFIGHT_YES_12_02"); //Sehr	gut! Am	besten du forderst gleich einen	der	anderen	Gladiatoren	heraus.
	AI_Output(self, hero, "Info_Arenamaster_NICEFIGHT_YES_12_03"); //Komm	dann zurück	zu mir und wir regeln alles	weitere.

	Arenamaster_Accepted = TRUE;
	B_LogEntry(CH1_Arena, CH1_Arena_1);

	AI_StopProcessInfos(self);
};

func void Info_Arenamaster_NICEFIGHT_WHAT()
{
	Info_ClearChoices(Info_Arenamaster_NICEFIGHT);
	AI_Output(hero, self, "Info_Arenamaster_NICEFIGHT_WHAT_15_01"); //Was	springt	für	mich dabei raus?
	AI_Output(self, hero, "Info_Arenamaster_NICEFIGHT_WHAT_12_02"); //Ahhh...	ein	Kaufmann...! Nunja,	wenn du	dich in	der	Arena geschickt	anstellst, kannst du dir eine goldene Nase verdienen.
	AI_Output(self, hero, "Info_Arenamaster_NICEFIGHT_WHAT_12_03"); //Fordere	einen der anderen Arenakämpfer heraus und komme	dann zu	mir	zurück.

	Arenamaster_Accepted = TRUE;
	B_LogEntry(CH1_Arena, CH1_Arena_2);

	AI_StopProcessInfos(self);
};

func void Info_Arenamaster_NICEFIGHT_NO()
{
	Info_ClearChoices(Info_Arenamaster_NICEFIGHT);
	AI_Output(hero, self, "Info_Arenamaster_NICEFIGHT_NO_15_01");	//Ich kämpfe nicht zur Belustigung anderer!
	AI_Output(self, hero, "Info_Arenamaster_NICEFIGHT_NO_12_02");	//Schade. Einen	Mann wie dich würde	ich	gerne in der Arena sehen!
	AI_Output(self, hero, "Info_Arenamaster_NICEFIGHT_NO_12_03");	//Naja,	komm wieder	wenn du	deine Meinung geändert hast!

	B_LogEntry(CH1_Arena, CH1_Arena_3);

	Arenamaster_Failed = TRUE;

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NEWBIE
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_NEWBIE(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 1;
	condition		= Info_Arenamaster_NEWBIE_Condition;
	information		= Info_Arenamaster_NEWBIE_Info;
	important		= TRUE;
};

func int Info_Arenamaster_NEWBIE_Condition()
{
	if (Wld_IsTime(ARENASTAND_H, ARENASTAND_M, ARENAEND_H, ARENAEND_M)
	&& (Npc_GetDistToNpc(self, hero) < PERC_DIST_DIALOG))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Arenamaster_NEWBIE_Info()
{
	AI_Output(self, hero, "Info_Arenamaster_NEWBIE_12_01"); //HEY	DU!
	AI_Output(hero, self, "Info_Arenamaster_NEWBIE_15_02"); //Wer	ich?
	AI_Output(self, hero, "Info_Arenamaster_NEWBIE_12_03"); //Du siehst kräftig aus. Bist	du an Ruhm und Ehre	interessiert?

	Info_ClearChoices(Info_Arenamaster_NEWBIE);
	Info_AddChoice(Info_Arenamaster_NEWBIE, "Such dir einen	anderen	Trottel", Info_Arenamaster_NEWBIE_FOOL);
	Info_AddChoice(Info_Arenamaster_NEWBIE, "Silber	wäre mir lieber!", Info_Arenamaster_NEWBIE_SILVER);
	Info_AddChoice(Info_Arenamaster_NEWBIE, "Ruhm und Ehre?	Warum nicht!", Info_Arenamaster_NEWBIE_YES);

	Arenamaster_FirstDay = B_GetDay();
};

func void Info_Arenamaster_NEWBIE_YES()
{
	Info_ClearChoices(Info_Arenamaster_NEWBIE);

	AI_Output(hero, self, "Info_Arenamaster_NEWBIE_YES_15_01"); //Ruhm und Ehre? Warum nicht!
	AI_Output(self, hero, "Info_Arenamaster_NEWBIE_YES_12_02"); //Dann solltest du dich für die Arenakämpfe anmelden!
	AI_Output(self, hero, "Info_Arenamaster_NEWBIE_YES_12_03"); //In der Arena wirst du große	Proben für deinen Mut und deine	Stärke finden!
	AI_Output(self, hero, "Info_Arenamaster_NEWBIE_YES_12_04"); //Die	Menge wird dir zujubeln	und	dich anfeuern!
	AI_Output(self, hero, "Info_Arenamaster_NEWBIE_YES_12_05"); //Als	siegreicher	Gladiator warten Ruhm und Ehre auf dich!

	Arenamaster_Teased = TRUE;

	if (Info_Arenamaster_NICEFIGHT_Condition())
	{
		AI_StopProcessInfos(self);
	};
};

func void Info_Arenamaster_NEWBIE_SILVER()
{
	Info_ClearChoices(Info_Arenamaster_NEWBIE);

	AI_Output(hero, self, "Info_Arenamaster_NEWBIE_SILVER_15_01"); //Silber wäre mir lieber!
	AI_Output(self, hero, "Info_Arenamaster_NEWBIE_SILVER_12_02"); //Dann	bist du	hier genau richtig,	denn Silber	kannst du hier zuhauf verdienen.
	AI_Output(self, hero, "Info_Arenamaster_NEWBIE_SILVER_12_03"); //Melde dich für die Arenakämpfe und der Reichtum eines siegreichen Gladiators	kann schon bald	dein sein!

	Arenamaster_Teased = TRUE;

	if (Info_Arenamaster_NICEFIGHT_Condition())
	{
		AI_StopProcessInfos(self);
	};
};

func void Info_Arenamaster_NEWBIE_FOOL()
{
	Info_ClearChoices(Info_Arenamaster_NEWBIE);

	AI_Output(hero, self, "Info_Arenamaster_NEWBIE_FOOL_15_01"); //Such dir einen	anderen	Trottel!
	AI_Output(self, hero, "Info_Arenamaster_NEWBIE_FOOL_12_02"); //Kein Grund	unfreundlich zu	werden,	ich	wollte dir nur ein Angebot unterbreiten!

	Log_CreateTopic(CH1_Arena, LOG_MISSION);
	Log_SetTopicStatus(CH1_Arena, LOG_RUNNING);
	B_LogEntry(CH1_Arena, CH1_Arena_4);

	Arenamaster_Failed = TRUE;

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SOUNDSGOOD
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_SOUNDSGOOD(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 0;
	condition		= Info_Arenamaster_SOUNDSGOOD_Condition;
	information		= Info_Arenamaster_SOUNDSGOOD_Info;
	description		= "Hört	sich gut an. Was muss ich tun?";
};

func int Info_Arenamaster_SOUNDSGOOD_Condition()
{
	var int niceFight;
	niceFight = Info_Arenamaster_NICEFIGHT_Condition();

	if (((Arenamaster_Teased && !niceFight)
	|| Npc_KnowsInfo(hero, MIL_122_Arenamaster_ASKAGAIN))
	&& !Arenamaster_Accepted)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Arenamaster_SOUNDSGOOD_Info()
{
	AI_Output(hero, self, "Info_Arenamaster_SOUNDSGOOD_15_01"); //Hört sich gut an. Was muss ich tun?
	AI_Output(self, hero, "Info_Arenamaster_SOUNDSGOOD_12_02"); //Besuche	mich einfach mal beim Arenakampf. Dann unterhalten wir uns weiter!
	AI_StopProcessInfos(self);

	Arenamaster_FirstDay = B_GetDay();
	Log_CreateTopic(CH1_Arena, LOG_MISSION);
	Log_SetTopicStatus(CH1_Arena, LOG_RUNNING);
	B_LogEntry(CH1_Arena, CH1_Arena_5);
};

///////////////////////////////////////////////////////////////////////
//	Info ASKAGAIN
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_ASKAGAIN(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 0;
	condition		= MIL_122_Arenamaster_ASKAGAIN_Condition;
	information		= MIL_122_Arenamaster_ASKAGAIN_Info;
	permanent		= TRUE;
	description		= "Wegen deinem Angebot...";
};

func int MIL_122_Arenamaster_ASKAGAIN_Condition()
{
	if (Arenamaster_Failed
	&& !Arenamaster_Teased)
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_122_Arenamaster_ASKAGAIN_Info()
{
	AI_Output(hero, self, "MIL_122_ASKAGAIN_15_01");	//Wegen	deinem Angebot...
	AI_Output(self, hero, "MIL_122_ASKAGAIN_12_02");	//Hast es dir wohl anders überlegt was?
	AI_Output(self, hero, "MIL_122_ASKAGAIN_12_03");	//Na, ich will mal nicht so	sein. Wenn du jetzt	interessiert bist, dann	gilt mein Angebot noch.

	Arenamaster_Teased = TRUE;
	Arenamaster_Failed = FALSE;

	if (Npc_KnowsInfo(hero, Info_Arenamaster_NICEFIGHT))
	{
		AI_Output(self, hero, "MIL_122_ASKAGAIN_12_04"); //Fordere einen der anderen Arenakämpfer heraus und komme dann zu mir zurück.
		Arenamaster_Accepted = TRUE;
		B_LogEntry(CH1_Arena, CH1_Arena_6);

		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BANNED
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_BANNED(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 20;
	condition		= Info_Arenamaster_BANNED_Condition;
	information		= Info_Arenamaster_BANNED_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int Info_Arenamaster_BANNED_Condition()
{
	if (Arena_PlayerBanned
	&& C_NpcIsInvincible(hero))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Arenamaster_BANNED_Info()
{
	if (Arena_PlayerKilled)
	{
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_01"); //DU	hast in	der	Arena getötet!
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_02"); //NIEMAND tötet in der Arena, das ist Regel Nummer 1!
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_03"); //Selbst	Typen wie Brutus kapieren das!
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_04"); //Und jetzt verschwinde!
	};

	if (Arena_PlayerUsedBow)
	{
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_05"); //Du	kanntest die Regeln. Keine Fernkampfwaffen in der Arena!
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_06"); //Du	bist kein Gladiator	mehr! Geh jetzt!
	};

	if (Arena_PlayerUsedMagic)
	{
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_07"); //Du	kanntest die Regeln! Keine Magie in	der	Arena!
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_08"); //Ich werde dich	für	keinen Kampf mehr aufstellen.
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_09"); //Du	hast deine Chance vertan!
	};

	if (Arena_PlayerStoleWeapon)
	{
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_10"); //Du	hast Regel Nummer 3	verletzt: Finger weg von der Waffe des anderen!
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_11"); //Ich will dich hier	nicht mehr sehen!
	};

	if (Arena_PlayerShirked)
	{
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_12"); //(laut) Du hast dich	wie	eine feige Ratte vor deinem	letzen Kampf gedrückt!
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_13"); //(lauter) Du	hast mich vor dem gesamten Lager blamiert!!!
		AI_Output(self, hero, "Info_Arenamaster_BANNED_12_14"); //(brüllt) GEH MIR AUS DEN AUGEN !!!!
	};

	Info_AddChoice(Info_Arenamaster_BANNED, "Mir doch egal!", Info_Arenamaster_BANNED_NO);

	if (Npc_HasItems(hero, ItMi_Silver) >= ARENAMASTER_CALM_SILVER)
	{
		Info_AddChoice(Info_Arenamaster_BANNED, "Tut mir leid, das wird nicht wiedervorkommen (500 Silber anbieten).", Info_Arenamaster_BANNED_SORRY);
	};
};

func void Info_Arenamaster_BANNED_SORRY()
{
	Info_ClearChoices(Info_Arenamaster_BANNED);
	AI_Output(hero, self, "Info_Arenamaster_BANNED_SORRY_15_01"); //Tut mir leid, das wird nicht wiedervorkommen.
	B_GiveInvItems(hero, self, ItMi_Silver, ARENAMASTER_CALM_SILVER);
	AI_Output(self, hero, "Info_Arenamaster_BANNED_SORRY_12_02"); //Das will ich hoffen. Solche Fehltritte gefährden den Ruf der ganzen Arena!
	AI_Output(self, hero, "Info_Arenamaster_BANNED_SORRY_12_03"); //Also denk beim nächsten Mal besser VORHER nach.
	Arena_PlayerBanned = FALSE;
	B_SetAttitude(self, Arenamaster_OldAttitude);
	AI_StopProcessInfos(self);
};

func void Info_Arenamaster_BANNED_NO()
{
	Info_ClearChoices(Info_Arenamaster_BANNED);
	AI_Output(hero, self, "Info_Arenamaster_BANNED_NO_15_01"); //Mir doch egal!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NEXTFIGHT
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_NEXTFIGHT(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 20;
	condition		= Info_Arenamaster_NEXTFIGHT_Condition;
	information		= Info_Arenamaster_NEXTFIGHT_Info;
	permanent		= TRUE;
	description		= "Wann	ist	der	nächste	Arenakampf?";
};

func int Info_Arenamaster_NEXTFIGHT_Condition()
{
	if ((!(Npc_IsInRoutine(self, ZS_ArenaMasterNpc) && (Npc_GetDistToWP(self, ARENA_WP_THRONE) < 300)))
	|| Npc_KnowsInfo(hero, Info_Arenamaster_NICEFIGHT))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Arenamaster_NEXTFIGHT_Info()
{
	AI_Output(hero, self, "Info_Arenamaster_NEXTFIGHT_15_01"); //Wann	ist	der	nächste	Arenakampf?

	if (Npc_IsInRoutine(self, ZS_ArenaMasterSleep))
	{
		AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_02"); //(erbost)	Jetzt nicht, du	Idiot!!! Und in	meiner Hütte schon gleich garnicht!!!
		AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_03"); //(etwas ruhiger) Komm	morgen zu meinem Stand!
		AI_StopProcessInfos(self);
	}

	else if (Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M))
	{
		AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_04"); //Heute abend.	Du hast	noch reichlich Zeit.

		if (Arena_PlayerFight)
		{
			AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_05"); //...und vergiss nicht: Du	kämpfst	heute abend	SELBST!!!
		};
	}

	else if (Npc_IsInRoutine(self, ZS_ArenaMasterNpcSend)
	|| Npc_IsInRoutine(self, ZS_ArenaMasterNpc))
	{
		if (Npc_GetDistToWP(self, ARENA_WP_THRONE) > 300)
		{
			if (Arena_PlayerFight)
			{
				AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_06"); //Du solltst längst in	deiner Arenakammer sitzen und dich auf den Kampf vorbereiten!
				AI_StopProcessInfos(self);
			}
			else
			{
				if (Npc_IsInRoutine(self, ZS_ArenaMasterNpcSend))
				{
					AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_07"); //Das	Vorprogramm	läuft schon	und	die	Gladiatoren	haben sich bereits in ihre Kammern zurückgezogen. Der Kampf	beginnt	bald.
				}
				else
				{
					AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_08"); //Sie zu, dass	du einen guten Platz auf der Tribüne bekommst.
					AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_09"); //Der Kampf fängt gleich an!
				};
			};
		}
		else
		{
			if (Arena_PlayerFight)
			{
				AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_10"); //Was tust	du hier	oben! Dein Platz ist unten in der Arena! Die Leute warten darauf das es	losgehen kann!!!
			}
			else
			{
				AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_11"); //Schau mal in	die	Arena runter! Was siehst du	da...?
				AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_12"); //(belehrend)...einen Kampf!
				AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_13"); //Und jetzt nerv mich nicht länger!
			};

			AI_StopProcessInfos(self);
		};
	}

	else if (Wld_IsTime(ARENAEND_H, ARENAEND_M, 23, 59))
	{
		AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_14"); //Du kommst zu	spät, der Kampf	ist	bereits	vorrüber.
		AI_Output(self, hero, "Info_Arenamaster_NEXTFIGHT_12_15"); //Komm	morgen wieder!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info AGAIN
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_AGAIN(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 0;
	condition		= Info_Arenamaster_AGAIN_Condition;
	information		= Info_Arenamaster_AGAIN_Info;
	permanent		= TRUE;
	description		= "Ich habe	mir	den	gestrigen Arenakampf angesehen!";
};

func int Info_Arenamaster_AGAIN_Condition()
{
	if ((Arenamaster_FirstDay < B_GetDay())
	&& !Arenamaster_Failed
	&& !Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENAEND_H, ARENAEND_M)
	&& !Arena_PlayerHasCome
	&& !Arena_PlayerFight
	&& !Arena_FightSelected)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Arenamaster_AGAIN_Info()
{
	AI_Output(hero, self, "Info_Arenamaster_AGAIN_15_01"); //Ich habe	mir	den	gestrigen Arenakampf angesehen!

	if (Npc_IsInRoutine(self, ZS_ArenaMasterSleep))
	{
		AI_Output(self, hero, "OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst	du mir mitten in der Nacht sagen? Komm morgen an meinem	Stand vorbei!
		AI_StopProcessInfos(self);
	};

	Arenamaster_FirstDay = B_GetDay();

	if (Arena_NpcComboLast == AC_GRIM_GOLIATH)
	{
		AI_Output(self, hero, "Info_Arenamaster_AGAIN_12_03"); //Grim	und	Goliath	sind noch sehr unerfahren. Aber	vielleicht machen sie sich ja noch.
	}
	else if (Arena_NpcComboLast == AC_GOLIATH_BRUTUS)
	{
		AI_Output(self, hero, "Info_Arenamaster_AGAIN_12_04"); //Brutus ist Gewalt pur! Goliath ist zwar stark wie ein Bär, hat aber trotzdem	oft	das	Nachsehen.
	}
	else if (Arena_NpcComboLast == AC_BRUTUS_MALGAR)
	{
		AI_Output(self, hero, "Info_Arenamaster_AGAIN_12_05"); //Brutus gegen	Malgar!	Immer spannend!	Stumpfe	Gewalt gegen tödliche Finesse! Dass	die	Finesse	meistens siegt bringt mich immer wieder	zum	Jubeln!
	}
	else if (Arena_NpcComboLast == AC_MALGAR_THORA)
	{
		AI_Output(self, hero, "Info_Arenamaster_AGAIN_12_06"); //Dann	hast du	das	echte Finale erlebt. Thora und Malgar sind die besten Kämpfer in der Arena.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info RANKING
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_RANKING(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 30;
	condition		= MIL_122_Arenamaster_RANKING_Condition;
	information		= MIL_122_Arenamaster_RANKING_Info;
	permanent		= TRUE;
	description		= "Wie sieht die Rangliste aus?";
};

func int MIL_122_Arenamaster_RANKING_Condition()
{
	if (Npc_IsInRoutine(self, ZS_ArenaMasterBooth)
	&& Arenamaster_Accepted)
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_122_Arenamaster_RANKING_Info()
{
	AI_Output(hero, self, "MIL_122_RANKING_15_01"); //Wie sieht die Rangliste aus?

	B_Arena_PrintRankingList();
};

///////////////////////////////////////////////////////////////////////
//	Info GLADIATOR
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_GLADIATOR(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 30;
	condition		= MIL_122_Arenamaster_GLADIATOR_Condition;
	information		= MIL_122_Arenamaster_GLADIATOR_Info;
	permanent		= TRUE;
	description		= "Wie bewertest du...";
};

func int MIL_122_Arenamaster_GLADIATOR_Condition()
{
	if (Npc_IsInRoutine(self, ZS_ArenaMasterBooth)
	&& Arenamaster_Accepted)
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_122_Arenamaster_GLADIATOR_Info()
{
	Info_ClearChoices(MIL_122_Arenamaster_GLADIATOR);
	Info_AddChoice(MIL_122_Arenamaster_GLADIATOR, "...Thora?", MIL_122_Arenamaster_GLADIATOR_THORA);
	Info_AddChoice(MIL_122_Arenamaster_GLADIATOR, "...Malgar?", MIL_122_Arenamaster_GLADIATOR_MALGAR);
	Info_AddChoice(MIL_122_Arenamaster_GLADIATOR, "...Brutus?", MIL_122_Arenamaster_GLADIATOR_BRUTUS);
	Info_AddChoice(MIL_122_Arenamaster_GLADIATOR, "...Goliath?", MIL_122_Arenamaster_GLADIATOR_GOLIATH);
	Info_AddChoice(MIL_122_Arenamaster_GLADIATOR, "...Grim?", MIL_122_Arenamaster_GLADIATOR_GRIM);
	Info_AddChoice(MIL_122_Arenamaster_GLADIATOR, "...Mich?", MIL_122_Arenamaster_GLADIATOR_ME);
};

func void MIL_122_Arenamaster_GLADIATOR_ME()
{
	Info_ClearChoices(MIL_122_Arenamaster_GLADIATOR);
	AI_Output(hero, self, "MIL_122_GLADIATOR_ME_15_01"); //Wie bewertest du mich?

	if (B_Arena_GetGladiatorRanking(PC_Hero) == 6)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_ME_12_02");	//Du liegst	auf	dem	letzten	Platz, bist	aber auch erst kürzlich	dazugestossen.
		AI_Output(self, hero, "MIL_122_GLADIATOR_ME_12_03");	//Du wirst dich	schon noch hochkämpfen,	da bin ich mir sicher.
	};

	if (B_Arena_GetGladiatorRanking(PC_Hero) == 5)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_ME_12_04");	//Du hast dich auf den fünften Platz hochgearbeitet. Nicht schlecht!
	};

	if (B_Arena_GetGladiatorRanking(PC_Hero) == 4)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_ME_12_05");	//Du belegst jetzt schon den vierten Platz.	Mach weiter	so und du wirst	noch ganz an die Spitze	kommen.
	};

	if (B_Arena_GetGladiatorRanking(PC_Hero) == 3)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_ME_12_06");	//Du liegst	heute schon	auf	dem	dritten	Platz. Nur noch	zwei Gladiatoren trennen dich vom Titel	des	Champions.
	};

	if (B_Arena_GetGladiatorRanking(PC_Hero) == 2)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_ME_12_07");	//Du hast es geschafft,	dich auf den zweiten Platz hochzuarbeiten.
		AI_Output(self, hero, "MIL_122_GLADIATOR_ME_12_08");	//Noch nie habe	ich	einen Gladiator	gesehen, der sich so schnell nach oben gearbeitet hat. Der Titel des Champion ist nun zum Greifen nahe.
	};

	if (B_Arena_GetGladiatorRanking(PC_Hero) == 1)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_ME_12_09");	//Du hast es geschafft!	Du bist	der	neue Arena-Champion!
		AI_Output(self, hero, "MIL_122_GLADIATOR_ME_12_10");	//Niemand der anderen Gladiatoren kann deinen Waffenkünsten	paroli bieten. Ich verneige	mich vor dir.
	};
};

func void MIL_122_Arenamaster_GLADIATOR_GRIM()
{
	Info_ClearChoices(MIL_122_Arenamaster_GLADIATOR);
	AI_Output(hero, self, "MIL_122_GLADIATOR_GRIM_15_01"); //Wie bewertest du Grim?

	if (B_Arena_GetGladiatorRanking(MIN_306_Grim) == 6)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GRIM_12_02"); //Grim war noch nie gut. Jetzt ist er	sogar auf den letzten Platz	abgerutscht. Ein hoffnungsloser	Fall.
	};

	if (B_Arena_GetGladiatorRanking(MIN_306_Grim) == 5)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GRIM_12_03"); //Grim behauptet sich	auf	seinem fünften Platz. Er war noch nie gut, aber	zumindest wird er auch nicht schlechter.
	};

	if (B_Arena_GetGladiatorRanking(MIN_306_Grim) == 4)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GRIM_12_04"); //Grim hat entgegen aller	Erwartungen	auf	den	4 Platz	verbessert.	Es stecken doch	noch Überraschungen	in ihm.
	};

	if (B_Arena_GetGladiatorRanking(MIN_306_Grim) == 3)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GRIM_12_05"); //Grim überrascht	mich immer mehr. Einst das Schlußlicht,	liegt er heute auf dem dritten Platz.
	};

	if (B_Arena_GetGladiatorRanking(MIN_306_Grim) == 2)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GRIM_12_06"); //Grim überrascht	das	ganze Lager. Niemand versteht, wie dieser unbegabte	Kämpfer	sich auf Platz 2 hocharbeiten konnte.
	};

	if (B_Arena_GetGladiatorRanking(MIN_306_Grim) == 1)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GRIM_12_07"); //Grim's sonderbare Wendung ist schon	fast verdächtig. Dieser	nichtsnutzige Gladiator	der	früher keinen Kampf	gewonnen hat ist heute Champion. Wenn ich herausfinde, wer da nachgeholfen hat,	dann gibt es saures!
	};
};

func void MIL_122_Arenamaster_GLADIATOR_GOLIATH()
{
	Info_ClearChoices(MIL_122_Arenamaster_GLADIATOR);
	AI_Output(hero, self, "MIL_122_GLADIATOR_GOLIATH_15_01"); //Wie bewertest du Goliath?

	if (B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 6)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_02"); //Goliath hat nachgelassen. Früher	war	er besser als Grim.	Heute ist er das Schlußlicht.
	};

	if (B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 5)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_03"); //Goliath liegt auf dem fünften Platz.	Früher war er besser, aber am Ende ist er halt doch	nur	ein	einfacher Schmiedegehilfe
	};

	if (B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 4)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_04"); //Goliath hat seinen vierten Platz	gehalten. Ich glaube allerdings	auch nicht,	dass er	sich verbessern	kann.
	};

	if (B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 3)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_05"); //Goliath hat sich	doch tatsächlich auf den dritten Platz vorgeschoben. Das hätte wirklich	niemand	gedacht.
	};

	if (B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 2)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_06"); //Goliath stellt Rätsel auf. Einst	ein	Schmiedegehilfe	auf	dem	vorletzten Platz, heute	schon der Vizechampion.
	};

	if (B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 1)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_07"); //Goliath hat das unmögliche wahrgemacht. Allein mit seinem Schmiedehammer	hat	er sich	selbst zum Championtitel verholfen.
	};
};

func void MIL_122_Arenamaster_GLADIATOR_BRUTUS()
{
	Info_ClearChoices(MIL_122_Arenamaster_GLADIATOR);
	AI_Output(hero, self, "MIL_122_GLADIATOR_BRUTUS_15_01"); //Wie bewertest du Brutus?

	if (B_Arena_GetGladiatorRanking(MIL_121_Brutus) == 6)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_02");	//Brutus war immer ein recht guter Kämpfer.
		AI_Output(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_03");	//Das er heute auf dem letzten Platz liegt,	versteht keiner.
	};

	if (B_Arena_GetGladiatorRanking(MIL_121_Brutus) == 5)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_04");	//Brutus hat nachgelassen. Früher drittbester ist er heute auf Platz 5.
	};

	if (B_Arena_GetGladiatorRanking(MIL_121_Brutus) == 4)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_05");	//Brutus liegt heute nur noch auf Platz	4. Offensichtlich ist rohe Gewalt doch nicht alles!
	};

	if (B_Arena_GetGladiatorRanking(MIL_121_Brutus) == 3)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_06");	//Brutus ist und bleibt	die	Nummer drei. Wer in	die	Spitzengruppe aufsteigen will, muß an ihm vorbei.
	};

	if (B_Arena_GetGladiatorRanking(MIL_121_Brutus) == 2)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_07");	//Brutus hat sich doch tatsächlich auf den zweiten Platz hocharbeiten können. Vielleicht steckt	in ihm doch	mehr als rohe Gewalt.
	};

	if (B_Arena_GetGladiatorRanking(MIL_121_Brutus) == 1)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_08");	//Brutus rohe Kampfgewalt hat es geschafft,	selbst so elegante Kämpfer wie Thora und Malgar	in den Schatten	zu stellen.	Eine neue Ära im Arenakampf	bricht an.
	};
};

func void MIL_122_Arenamaster_GLADIATOR_MALGAR()
{
	Info_ClearChoices(MIL_122_Arenamaster_GLADIATOR);
	AI_Output(hero, self, "MIL_122_GLADIATOR_MALGAR_15_01"); //Wie bewertest du Malgar?

	if (B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 6)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_MALGAR_12_02");	//Malgar ist am	Ende. Einst	der	zweitbeste,	heute ein Wrack	auf	dem	letzten	Platz der Rangliste.
	};

	if (B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 5)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_MALGAR_12_03");	//Malgar ist stark nachgelassen. Er	ist	heute auf Platz	5.
	};

	if (B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 4)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_MALGAR_12_04");	//Malgar hat ganz schön	an Boden verloren. Früher zweitbester, heute nur noch auf Platz	4.
	};

	if (B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 3)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_MALGAR_12_05");	//Malgar hat an	Boden verloren.	Er muss	sich heute mit den dritten Platz zufrieden geben.
	};

	if (B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 2)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_MALGAR_12_06");	//Malgar hält souverän den zweiten Platz. Niemand kämpft gegen den Champion, ohne ihn zu besiegen.
	};

	if (B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 1)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_MALGAR_12_07");	//Malgar war schon immer ein fantastischer Kämfper,	heute liegt	er sogar auf Platz 1 und ist damit der neue	Champion.
	};
};

func void MIL_122_Arenamaster_GLADIATOR_THORA()
{
	Info_ClearChoices(MIL_122_Arenamaster_GLADIATOR);
	AI_Output(hero, self, "MIL_122_GLADIATOR_THORA_15_01"); //Wie bewertest du Thora?

	if (B_Arena_GetGladiatorRanking(AMZ_900_Thora) == 6)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_THORA_12_02"); //Thora ist hoffnungslos	abgesackt. Einst der Champion, ist sie heute kein Silberstück mehr wert.
	};

	if (B_Arena_GetGladiatorRanking(AMZ_900_Thora) == 5)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_THORA_12_03"); //Thora ist am Ende.	Wie	konnte der einstige	Champion auf den vorletzten	Platz sinken?
	};

	if (B_Arena_GetGladiatorRanking(AMZ_900_Thora) == 4)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_THORA_12_04"); //Thora ist gewaltig	abgesackt. Einst der Champion, heute nur noch Mittelmass auf Platz 4.
	};

	if (B_Arena_GetGladiatorRanking(AMZ_900_Thora) == 3)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_THORA_12_05"); //Thora ist schon lange nicht mehr der Champion.	Heute liegt	sie	nur	noch auf Platz 3.
	};

	if (B_Arena_GetGladiatorRanking(AMZ_900_Thora) == 2)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_THORA_12_06"); //Thora ist nicht mehr der Champion.	Wahrscheinlich sind	ihre grössten Tage als Gladiator gezählt.
	};

	if (B_Arena_GetGladiatorRanking(AMZ_900_Thora) == 1)
	{
		AI_Output(self, hero, "MIL_122_GLADIATOR_THORA_12_07"); //Thora ist und bleibt der Champion.	Ihre exotischen	Waffenkünste mit dem Kampfstab suchen ihresgleichen.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info RULES
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_RULES(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 20;
	condition		= MIL_122_Arenamaster_RULES_Condition;
	information		= MIL_122_Arenamaster_RULES_Info;
	description		= "Welche	Regeln gibt	es in der Arena?";
};

func int MIL_122_Arenamaster_RULES_Condition()
{
	if (Npc_IsInRoutine(self, ZS_ArenaMasterBooth)
	&& Arenamaster_Accepted)
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_122_Arenamaster_RULES_Info()
{
	AI_Output(hero, self, "MIL_122_RULES_Info_15_01"); //Welche Regeln gibt es in der Arena?
	AI_Output(self, hero, "MIL_122_RULES_Info_12_02"); //Regel Nummer 1 ...
	AI_Output(self, hero, "MIL_122_RULES_Info_12_03"); //KEIN Töten in der Arena!
	AI_Output(self, hero, "MIL_122_RULES_Info_12_04"); //Umhauen	ja,	Töten nein!
	AI_Output(self, hero, "MIL_122_RULES_Info_12_05"); //Regel Nummer 2 ...
	AI_Output(self, hero, "MIL_122_RULES_Info_12_06"); //Weder Bögen, noch Armbrüste	noch Magie in der Arena!
	AI_Output(self, hero, "MIL_122_RULES_Info_12_07"); //Es wird	nur	mit	Nahkampfwaffen gekämpft!
	AI_Output(self, hero, "MIL_122_RULES_Info_12_08"); //Regel Nummer 3 ...
	AI_Output(self, hero, "MIL_122_RULES_Info_12_09"); //Jeder behält seine eigenen Waffen! Solltest	du deinen Gegner umhauen, ist seine	Waffe tabu für dich, ist das klar!
	AI_Output(hero, self, "MIL_122_RULES_Info_15_10"); //Was	passiert, wenn es die Gladiatoren mit den Regeln nicht so genau	nehmen?
	AI_Output(self, hero, "MIL_122_RULES_Info_12_11"); //Regel Nummer 4 : Wer die Regeln	verletzt, verliert den Kampf und das Preisgeld!

	B_LogEntry(CH1_Arena, CH1_Arena_7);
};

///////////////////////////////////////////////////////////////////////
//	Info FLOWCHART
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_FLOWCHART(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 30;
	condition		= MIL_122_Arenamaster_FLOWCHART_Condition;
	information		= MIL_122_Arenamaster_FLOWCHART_Info;
	description		= "Wie läuft so	ein	Kampf ab?";
};

func int MIL_122_Arenamaster_FLOWCHART_Condition()
{
	if (Npc_IsInRoutine(self, ZS_ArenaMasterBooth)
	&& Arenamaster_Accepted)
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_122_Arenamaster_FLOWCHART_Info()
{
	AI_Output(hero, self, "MIL_122_FLOWCHART_Info_15_01"); //Wie	läuft so ein Kampf ab?
	AI_Output(self, hero, "MIL_122_FLOWCHART_Info_12_02"); //Es wird	solange	gekämpft, bis einer	zu Boden geht!
	AI_Output(self, hero, "MIL_122_FLOWCHART_Info_12_03"); //Wer	den	anderen	umhaut,	gewinnt	einen Punkt.
	AI_Output(self, hero, "MIL_122_FLOWCHART_Info_12_04"); //Es wird	mindestens gekämpft, bis einer 5 Punkte hat, manchmal aber	auch länger.
	AI_Output(hero, self, "MIL_122_FLOWCHART_Info_15_05"); //Wovon hängt	das	ab?
	AI_Output(self, hero, "MIL_122_FLOWCHART_Info_12_06"); //Davon, ob der Kampf	mir	gefällt	oder nicht.
	AI_Output(hero, self, "MIL_122_FLOWCHART_Info_15_07"); //Verstehe!
	AI_Output(self, hero, "MIL_122_FLOWCHART_Info_12_08"); //Werden bis zum Ende	der	Kampfzeit keine	5 Punkte erreicht,	verlieren beide	und	ich	behalte	alle Preisgelder.

	B_LogEntry(CH1_Arena, CH1_Arena_8);
};

instance MIL_122_Arenamaster_PLAYERCHEATED(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 1;
	condition		= MIL_122_Arenamaster_PLAYERCHEATED_Condition;
	information		= MIL_122_Arenamaster_PLAYERCHEATED_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int MIL_122_Arenamaster_PLAYERCHEATED_Condition()
{
	if ((Arena_PlayerStoleWeapon || Arena_PlayerUsedMagic || Arena_PlayerUsedBow || Arena_PlayerKilled)
	&& Arena_FightRunning
	&& !Arena_PlayerBanned)
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_122_Arenamaster_PLAYERCHEATED_Info()
{
	AI_StandUp(self);

	if (Arena_PlayerStoleWeapon)
	{
		AI_Output(self, hero, "MIL_122_PLAYERCHEATED_Info_12_09"); //DU HAST	REGEL NUMMER 3 VERLETZT.
		AI_Output(self, hero, "MIL_122_PLAYERCHEATED_Info_12_10"); //Finger weg,	von	den	Waffen der anderen Gladiatoren!
	};

	if (Arena_PlayerUsedMagic || Arena_PlayerUsedBow)
	{
		AI_Output(self, hero, "MIL_122_PLAYERCHEATED_Info_12_11"); //DU HAST	REGEL NUMMER 2 VERLETZT.
		AI_Output(self, hero, "MIL_122_PLAYERCHEATED_Info_12_12"); //Weder Fernkampfwaffen noch Magie in	der	Arena!
	};

	if (Arena_PlayerKilled)
	{
		AI_Output(self, hero, "MIL_122_PLAYERCHEATED_Info_12_13"); //DU HAST	REGEL NUMMER 1 VERLETZT.
		AI_Output(self, hero, "MIL_122_PLAYERCHEATED_Info_12_14"); //Kein Töten in der Arena!
	};

	AI_Output(self, hero, "MIL_122_PLAYERCHEATED_Info_12_15"); //HIERMIT	ERKLÄRE	ICH	DICH ZUM VERLIERER UND VERBANNE	DICH AUS DEN REIHEN	DER	GLADIATOREN.
	AI_Output(hero, self, "MIL_122_PLAYERCHEATED_Info_15_16"); //Aber...
	AI_Output(self, hero, "MIL_122_PLAYERCHEATED_Info_12_17"); //Nichts aber! Wer bescheisst	verliert.
	AI_Output(self, hero, "MIL_122_PLAYERCHEATED_Info_12_18"); //REGEL NUMMER 4 !!!
	AI_StopProcessInfos(self);

	Arenamaster_OldAttitude = Npc_GetPermAttitude(self, hero);
	B_SetAttitude(self, ATT_ANGRY);

	Arena_PlayerBanned = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info GETPRIZE
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_GETPRIZE(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 1;
	condition		= MIL_122_Arenamaster_GETPRIZE_Condition;
	information		= MIL_122_Arenamaster_GETPRIZE_Info;
	permanent		= TRUE;
	description		= "Ich will mein Preisgeld abzuholen!";
};

func int MIL_122_Arenamaster_GETPRIZE_Condition()
{
	if (Arena_PlayerHasWonToday
	&& Arena_PlayerPrize)
	//&& Npc_IsInRoutine(self, ZS_ArenaMasterBooth)
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_122_Arenamaster_GETPRIZE_Info()
{
	AI_Output(hero, self, "MIL_122_GETPRIZE_Info_15_01"); //Ich will	mein Preisgeld abzuholen
	AI_Output(self, hero, "MIL_122_GETPRIZE_Info_12_02"); //Du hast gut gekämpft!
	AI_Output(self, hero, "MIL_122_GETPRIZE_Info_12_03"); //Hier	ist	dein Preisgeld.	Die	anderthalbfache	Summe, die du gesetzt hast.

	B_GiveInvItems(self, hero, ItMi_Silver,((Arena_PlayerPrize * 3) / 2));

	if (!Arena_PrizeBefore)
	{
		AI_Output(hero, self, "MIL_122_GETPRIZE_Info_15_04"); //Du bekommst doch	von	beiden Kämpfern	die	gleiche	Summe!
		AI_Output(self, hero, "MIL_122_GETPRIZE_Info_12_05"); //Richtig!
		AI_Output(hero, self, "MIL_122_GETPRIZE_Info_15_06"); //Warum bekomme ich dann nicht	den	doppelten Einsatz zurück?
		AI_Output(self, hero, "MIL_122_GETPRIZE_Info_12_07"); //Was glaubst du eigentlich, warum	ich	mir	hier den ganzen	Tag	die	Füsse in den Bauch stehe?
		AI_Output(self, hero, "MIL_122_GETPRIZE_Info_12_08"); //Die Hälfte der Preisgelder wandert in meine Tasche. Davon muss ich auch noch	den	ganzen Arenabetrieb	hier organisieren!

		Arena_PrizeBefore = TRUE;
	};

	Arena_PlayerHasWonToday = FALSE;
	Arena_PlayerPrize = 0;

	if (!Arena_FirstVictory)
	{
		B_LogEntry(CH1_Arena, CH1_Arena_9);
		Arena_FirstVictory = TRUE;
	};

	if ((B_Arena_GetGladiatorRanking(PC_Hero) == 4)
	&& !Arena_FirstRank4)
	{
		B_LogEntry(CH1_Arena, CH1_Arena_10);
		Arena_FirstRank4 = TRUE;
	};

	if ((B_Arena_GetGladiatorRanking(PC_Hero) == 3)
	&& !Arena_FirstRank3)
	{
		B_LogEntry(CH1_Arena, CH1_Arena_11);
		Arena_FirstRank3 = TRUE;
	};

	if ((B_Arena_GetGladiatorRanking(PC_Hero) == 2)
	&& !Arena_FirstRank2)
	{
		B_LogEntry(CH1_Arena, CH1_Arena_12);
		Arena_FirstRank2 = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info STARTFIGHT
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_STARTFIGHT(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 20;
	condition		= MIL_122_Arenamaster_STARTFIGHT_Condition;
	information		= MIL_122_Arenamaster_STARTFIGHT_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int MIL_122_Arenamaster_STARTFIGHT_Condition()
{
	if (Arenamaster_StartFight
	&& Arena_GatesClosed
	&& Npc_IsOnFP(self, "MASTER")
	&& Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_122_Arenamaster_STARTFIGHT_Info()
{
	AI_Wait(self, 1);
	B_Arena_ProclaimStart(self);
	AI_Wait(self, 1);

	Arenamaster_StartFight = FALSE;

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FINISHFIGHT
///////////////////////////////////////////////////////////////////////
/*
instance MIL_122_Arenamaster_FINISHFIGHT(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 2;
	condition		= MIL_122_Arenamaster_FINISHFIGHT_Condition;
	information		= MIL_122_Arenamaster_FINISHFIGHT_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int MIL_122_Arenamaster_FINISHFIGHT_Condition()
{
	if (Arenamaster_FinishFight)
	{
		return TRUE;
	};
};

func void MIL_122_Arenamaster_FINISHFIGHT_Info()
{
	AI_Wait(self, 1);
	B_Arena_ProclaimFinish(self);
	AI_Wait(self, 1);

	Arena_LastPCRanking = Arena_PCRanking;
	Arena_PCRanking = B_Arena_GetGladiatorRanking(PC_Hero);

	Arenamaster_FinishFight = FALSE;

	AI_StopProcessInfos(self);
};
*/

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGEDGRIM
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_CHALLENGEDGRIM(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 0;
	condition		= Info_Arenamaster_CHALLENGEDGRIM_Condition;
	information		= Info_Arenamaster_CHALLENGEDGRIM_Info;
	permanent		= TRUE;
	description		= "Ich habe Grim herausgefordert!";
};

func int Info_Arenamaster_CHALLENGEDGRIM_Condition()
{
	if (Arenamaster_Accepted
	&& Grim_Challenged
	&& !Arena_PlayerFight
	&& !Arena_PlayerHasWonToday
	&& !Arena_NpcFight) //noch kein	NSC-Kampf angesetzt
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Arenamaster_CHALLENGEDGRIM_Info()
{
	AI_Output(hero, self, "Info_Arenamaster_CHALLENGEDGRIM_15_01"); //Ich	habe Grim herausgefordert!

	if (Npc_IsInRoutine(self, ZS_ArenaMasterSleep))
	{
		AI_Output(self, hero, "OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if (Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M))
	{
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDGRIM_12_03"); //OK,	wieviel	Preisgeld möchtest du setzen?

		Info_ClearChoices(Info_Arenamaster_CHALLENGEDGRIM);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDGRIM, B_BuildPrizeString!(GRIM_PRIZE_3), Info_Arenamaster_CHALLENGEDGRIM_PRIZE3);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDGRIM, B_BuildPrizeString!(GRIM_PRIZE_2), Info_Arenamaster_CHALLENGEDGRIM_PRIZE2);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDGRIM, B_BuildPrizeString!(GRIM_PRIZE_1), Info_Arenamaster_CHALLENGEDGRIM_PRIZE1);
	}

	else if (Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
	}

	else if (Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}

	else if (Wld_IsTime(ARENAEND_H, ARENAEND_M, 0, 0))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_StopProcessInfos(self);
	};
};

func void Info_Arenamaster_CHALLENGEDGRIM_PRIZE(var int prize)
{
	Info_ClearChoices(Info_Arenamaster_CHALLENGEDGRIM);

	if (Npc_HasItems(hero, ItMi_Silver) >= prize)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, prize);

		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_01");	//Gut, du trittst also heute abend gegen Grim an!
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_02");	//Finde	dich bei Beginn	des	Vorprogramms in	der	linken Arenakammer ein.

		Arena_PlayerPrize = prize;
		Arena_PlayerFight = TRUE;
		Arena_PlayerHasCome = FALSE;

		if (!Arena_FirstChallenge)
		{
			B_LogEntry(CH1_Arena, CH1_Arena_13);
			Arena_FirstChallenge = TRUE;
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_03"); //Besorge dir erst	mal	ausreichend	Silber.	Ohne Preisgeld gibt	es keinen Kampf!
	};
};

func void Info_Arenamaster_CHALLENGEDGRIM_PRIZE1()
{
	Info_Arenamaster_CHALLENGEDGRIM_PRIZE(GRIM_PRIZE_1);
};

func void Info_Arenamaster_CHALLENGEDGRIM_PRIZE2()
{
	Info_Arenamaster_CHALLENGEDGRIM_PRIZE(GRIM_PRIZE_2);
};

func void Info_Arenamaster_CHALLENGEDGRIM_PRIZE3()
{
	Info_Arenamaster_CHALLENGEDGRIM_PRIZE(GRIM_PRIZE_3);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGEDGOLIATH
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_CHALLENGEDGOLIATH(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 0;
	condition		= Info_Arenamaster_CHALLENGEDGOLIATH_Condition;
	information		= Info_Arenamaster_CHALLENGEDGOLIATH_Info;
	permanent		= TRUE;
	description		= "Ich habe	Goliath	herausgefordert!";
};

func int Info_Arenamaster_CHALLENGEDGOLIATH_Condition()
{
	if (Arenamaster_Accepted
	&& Goliath_Challenged
	&& !Arena_PlayerFight
	&& !Arena_PlayerHasWonToday
	&& !Arena_NpcFight) //noch kein	NSC-Kampf angesetzt
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Arenamaster_CHALLENGEDGOLIATH_Info()
{
	AI_Output(hero, self, "Info_Arenamaster_CHALLENGEDGOLIATH_15_01"); //Ich habe	Goliath	herausgefordert!

	if (Npc_IsInRoutine(self, ZS_ArenaMasterSleep))
	{
		AI_Output(self, hero, "OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if (Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M))
	{
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDGOLIATH_12_03"); //Wieviel Silber möchtest du als Preisgeld	setzen?

		Info_ClearChoices(Info_Arenamaster_CHALLENGEDGOLIATH);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDGOLIATH, B_BuildPrizeString!(GOLIATH_PRIZE_3), Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE3);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDGOLIATH, B_BuildPrizeString!(GOLIATH_PRIZE_2), Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE2);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDGOLIATH, B_BuildPrizeString!(GOLIATH_PRIZE_1), Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE1);
	}

	else if (Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
	}

	else if (Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}

	else if (Wld_IsTime(ARENAEND_H, ARENAEND_M, 0, 0))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_StopProcessInfos(self);
	};
};

func void Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE(var int prize)
{
	Info_ClearChoices(Info_Arenamaster_CHALLENGEDGOLIATH);

	if (Npc_HasItems(hero, ItMi_Silver) >= prize)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, prize);

		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_01"); //Schön,	schön. Du und Goliath also!
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_02"); //Gehe bei Beginn des Vorprogramms in die rechte	Arenakammer	und	sei	bereit wenn	der	Kampf beginnt.

		Arena_PlayerPrize = prize;
		Arena_PlayerFight = TRUE;
		Arena_PlayerHasCome = FALSE;
	}
	else
	{
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_03");	//Kein Silber, kein	Kampf! Komm	wieder,	wenn du	genug davon	hast.
	};
};

func void Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE1()
{
	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE(GOLIATH_PRIZE_1);
};

func void Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE2()
{
	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE(GOLIATH_PRIZE_2);
};

func void Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE3()
{
	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE(GOLIATH_PRIZE_3);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGEDBRUTUS
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_CHALLENGEDBRUTUS(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 0;
	condition		= Info_Arenamaster_CHALLENGEDBRUTUS_Condition;
	information		= Info_Arenamaster_CHALLENGEDBRUTUS_Info;
	permanent		= TRUE;
	description		= "Brutus wird gegen mich antreten!";
};

func int Info_Arenamaster_CHALLENGEDBRUTUS_Condition()
{
	if (Arenamaster_Accepted
	&& Brutus_Challenged
	&& !Arena_PlayerFight
	&& !Arena_PlayerHasWonToday
	&& !Arena_NpcFight) //noch kein	NSC-Kampf angesetzt
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Arenamaster_CHALLENGEDBRUTUS_Info()
{
	AI_Output(hero, self, "Info_Arenamaster_CHALLENGEDBRUTUS_15_01");	//Brutus wird gegen	mich antreten!

	if (Npc_IsInRoutine(self, ZS_ArenaMasterSleep))
	{
		AI_Output(self, hero, "OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if (Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M))
	{
		if (!Brutus_ChallengedBefore)
		{
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_03"); //Du bist in kurzer Zeit sehr gut geworden!
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_04"); //Brutus ist normalerweise	sehr wählerisch, wenn es um	neue Gladiatoren geht!
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_05"); //Aber	sei	vorsichtig.	Du bist	bisher noch	nicht gegen	einen Gegner dieser	Brutalität angetreten.
			Brutus_ChallengedBefore = TRUE;
		};

		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_06"); //Wie hoch	ist	dein Preisgeld gegen Brutus?

		Info_ClearChoices(Info_Arenamaster_CHALLENGEDBRUTUS);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDBRUTUS, B_BuildPrizeString!(BRUTUS_PRIZE_3), Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE3);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDBRUTUS, B_BuildPrizeString!(BRUTUS_PRIZE_2), Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE2);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDBRUTUS, B_BuildPrizeString!(BRUTUS_PRIZE_1), Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE1);

	}

	else if (Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
	}

	else if (Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}

	else if (Wld_IsTime(ARENAEND_H, ARENAEND_M, 0, 0))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_StopProcessInfos(self);
	};
};

func void Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE(var int prize)
{
	Info_ClearChoices(Info_Arenamaster_CHALLENGEDBRUTUS);

	if (Npc_HasItems(hero, ItMi_Silver) >= prize)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, prize);

		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_01"); //Dann wirst du heute	abend also gegen Brutus	kämpfen!
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_02"); //Ich	wünsch dir viel	Glück, du wirst	es brauchen!
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_03"); //Benutze	die	linke Arenavorkammer für deine Kampfvorbereitung!

		Arena_PlayerPrize = prize;
		Arena_PlayerFight = TRUE;
		Arena_PlayerHasCome = FALSE;
	}
	else
	{
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_04"); //Ich kann dich nur kämpfen lassen, wenn	du genug Silber	für	das	Preisgeld hast!
	};
};

func void Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE1()
{
	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE(BRUTUS_PRIZE_1);
};

func void Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE2()
{
	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE(BRUTUS_PRIZE_2);
};

func void Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE3()
{
	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE(BRUTUS_PRIZE_3);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGEDMALGAR
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_CHALLENGEDMALGAR(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 0;
	condition		= Info_Arenamaster_CHALLENGEDMALGAR_Condition;
	information		= Info_Arenamaster_CHALLENGEDMALGAR_Info;
	permanent		= TRUE;
	description		= "Ich werde gegen Malgar kämpfen!";
};

func int Info_Arenamaster_CHALLENGEDMALGAR_Condition()
{
	if (Arenamaster_Accepted
	&& Malgar_Challenged
	&& !Arena_PlayerFight
	&& !Arena_PlayerHasWonToday
	&& !Arena_NpcFight) //noch kein	NSC-Kampf angesetzt
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Arenamaster_CHALLENGEDMALGAR_Info()
{
	AI_Output(hero, self, "Info_Arenamaster_CHALLENGEDMALGAR_15_01");	//Ich werde	gegen Malgar kämpfen!

	if (Npc_IsInRoutine(self, ZS_ArenaMasterSleep))
	{
		AI_Output(self, hero, "OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if (Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M))
	{
		if (!Malgar_ChallengedBefore)
		{
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_03"); //Oho.... Ich hoffe du	weist, worauf du dich da einlässt.
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_04"); //Malgar ist einer	der	gefährlichsten Männer die ich kenne.
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_05"); //Er redet	zwar nicht viel, aber er ist blitzschnell und tödlich.
			Malgar_ChallengedBefore = TRUE;
		};

		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_06"); //Nun gut,	wieviel	Preisgeld möchtest du setzen?

		Info_ClearChoices(Info_Arenamaster_CHALLENGEDMALGAR);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDMALGAR, B_BuildPrizeString!(MALGAR_PRIZE_3), Info_Arenamaster_CHALLENGEDMALGAR_PRIZE3);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDMALGAR, B_BuildPrizeString!(MALGAR_PRIZE_2), Info_Arenamaster_CHALLENGEDMALGAR_PRIZE2);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDMALGAR, B_BuildPrizeString!(MALGAR_PRIZE_1), Info_Arenamaster_CHALLENGEDMALGAR_PRIZE1);
	}

	else if (Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
	}

	else if (Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}

	else if (Wld_IsTime(ARENAEND_H, ARENAEND_M, 0, 0))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_StopProcessInfos(self);
	};
};

func void Info_Arenamaster_CHALLENGEDMALGAR_PRIZE(var int prize)
{
	Info_ClearChoices(Info_Arenamaster_CHALLENGEDMALGAR);

	if (Npc_HasItems(hero, ItMi_Silver) >= prize)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, prize);

		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_01"); //Wie	du willst. Dann	findet der heutige Kampf zwischen dir und Malgar statt
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_02"); //Diesmal	ist	die	rechte Arenavorkammer deine.

		Arena_PlayerPrize = prize;
		Arena_PlayerFight = TRUE;
		Arena_PlayerHasCome = FALSE;
	}
	else
	{
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_03"); //Hör zu, du	musst das Silber für das Preisgeld schon dabeihaben, sonst kann	ich	dich für heute abend nicht aufstellen!
	};
};

func void Info_Arenamaster_CHALLENGEDMALGAR_PRIZE1()
{
	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE(MALGAR_PRIZE_1);
};

func void Info_Arenamaster_CHALLENGEDMALGAR_PRIZE2()
{
	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE(MALGAR_PRIZE_2);
};

func void Info_Arenamaster_CHALLENGEDMALGAR_PRIZE3()
{
	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE(MALGAR_PRIZE_3);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGEDTHORA
///////////////////////////////////////////////////////////////////////
instance Info_Arenamaster_CHALLENGEDTHORA(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 0;
	condition		= Info_Arenamaster_CHALLENGEDTHORA_Condition;
	information		= Info_Arenamaster_CHALLENGEDTHORA_Info;
	permanent		= TRUE;
	description		= "Thora hat meine Herausforderung angenommen!";
};

func int Info_Arenamaster_CHALLENGEDTHORA_Condition()
{
	if (Arenamaster_Accepted
	&& Thora_Challenged
	&& !Arena_PlayerFight
	&& !Arena_PlayerHasWonToday
	&& !Arena_NpcFight) //noch kein	NSC-Kampf angesetzt
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Arenamaster_CHALLENGEDTHORA_Info()
{
	AI_Output(hero, self, "Info_Arenamaster_CHALLENGEDTHORA_15_01"); //Thora hat meine Herausforderung angenommen!

	if (Npc_IsInRoutine(self, ZS_ArenaMasterSleep))
	{
		AI_Output(self, hero, "OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if (Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M))
	{
		if (!Thora_ChallengedBefore)
		{
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_03");	//Lass dich	von	ihr	nicht täuschen.
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_04");	//In der Arena kennt sie kein Erbarmen und sie ist viel	stärker, als sie aussieht.
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_05");	//Dann spürst du nur noch die harten Enden ihres Kampfstabes überall auf deinem	Körper.
		};

		if (!Thora_PlayerWonBefore)
		{
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_06");	//Denk daran: Thora	ist	der	ungeschlagene Champion.	Nimm den Kampf nicht auf die leichte Schulter!
		};

		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_07");	//Wie hoch soll	dein Einsatz sein?

		Info_ClearChoices(Info_Arenamaster_CHALLENGEDTHORA);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDTHORA, B_BuildPrizeString!(THORA_PRIZE_3), Info_Arenamaster_CHALLENGEDTHORA_PRIZE3);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDTHORA, B_BuildPrizeString!(THORA_PRIZE_2), Info_Arenamaster_CHALLENGEDTHORA_PRIZE2);
		Info_AddChoice(Info_Arenamaster_CHALLENGEDTHORA, B_BuildPrizeString!(THORA_PRIZE_1), Info_Arenamaster_CHALLENGEDTHORA_PRIZE1);
	}

	else if (Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
	}

	else if (Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}

	else if (Wld_IsTime(ARENAEND_H, ARENAEND_M, 0, 0))
	{
		AI_Output(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_StopProcessInfos(self);
	};
};

func void Info_Arenamaster_CHALLENGEDTHORA_PRIZE(var int prize)
{
	Info_ClearChoices(Info_Arenamaster_CHALLENGEDTHORA);

	if (Npc_HasItems(hero, ItMi_Silver) >= prize)
	{
		B_GiveInvItems(hero, self, ItMi_Silver, prize);

		if (B_Arena_GetGladiatorRanking(AMZ_900_Thora) == 1)
		{
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_01"); //Du hast dich	entschieden! Heute abend trittst du	gegen den Champion an!
		}
		else
		{
			AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_02"); //hast	dich entschieden! Heute	abend kämpfst du gegen Thora!
		};

		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_03"); //Nimm	die	linke Arenavorkammer, und lass Thora in	der	Vorbereitungszeit in Ruhe.
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_04"); //Auf Störungen in	dieser Zeit	reagiert sie äusserst ungehalten.

		Arena_PlayerPrize = prize;
		Arena_PlayerFight = TRUE;
		Arena_PlayerHasCome = FALSE;
	}
	else
	{
		AI_Output(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_05"); //Zu wenig Silber! Ohne Preisgeld	werde ich dich nicht aufstellen. Champion-Kampf	hin	oder her!
	};
};

func void Info_Arenamaster_CHALLENGEDTHORA_PRIZE1()
{
	Info_Arenamaster_CHALLENGEDTHORA_PRIZE(THORA_PRIZE_1);
};

func void Info_Arenamaster_CHALLENGEDTHORA_PRIZE2()
{
	Info_Arenamaster_CHALLENGEDTHORA_PRIZE(THORA_PRIZE_2);
};

func void Info_Arenamaster_CHALLENGEDTHORA_PRIZE3()
{
	Info_Arenamaster_CHALLENGEDTHORA_PRIZE(THORA_PRIZE_3);
};

///////////////////////////////////////////////////////////////////////
//	Info GREETCHAMPION
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_GREETCHAMPION(C_Info)
{
	npc				= MIL_122_Arenamaster;
	nr				= 10;
	condition		= MIL_122_Arenamaster_GREETCHAMPION_Condition;
	information		= MIL_122_Arenamaster_GREETCHAMPION_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int MIL_122_Arenamaster_GREETCHAMPION_Condition()
{
	if (C_NpcIsInvincible(hero)
	&& (B_Arena_GetGladiatorRanking(PC_Hero) == 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_122_Arenamaster_GREETCHAMPION_Info()
{
	AI_Output(self, hero, "MIL_122_GREETCHAMPION_12_01"); //CHAMPION, ich grüsse dich!
};
