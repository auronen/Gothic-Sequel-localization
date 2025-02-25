///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance THF_401_Huldrych_EXIT(C_Info)
{
	npc				= THF_401_Huldrych;
	nr				= 999;
	condition		= THF_401_Huldrych_EXIT_Condition;
	information		= THF_401_Huldrych_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int THF_401_Huldrych_EXIT_Condition()
{
	return TRUE;
};

func void THF_401_Huldrych_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance THF_401_Huldrych_HI(C_Info)
{
	npc				= THF_401_Huldrych;
	nr				= 1;
	condition		= THF_401_Huldrych_HI_Condition;
	information		= THF_401_Huldrych_HI_Info;
	permanent		= TRUE;
	description		= "Was machst du hier?";
};

func int THF_401_Huldrych_HI_Condition()
{
	if (!Cassian_BeatHudrych)
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_401_Huldrych_HI_Info()
{
	AI_Output(hero, self, "THF_401_HI_15_01"); //Was machst du hier?
	AI_Output(self, hero, "THF_401_HI_05_02"); //Ich sorge dafür, daß ich am Leben bleibe und was warmes zu Essen bekomme.
	AI_Output(hero, self, "THF_401_HI_15_03"); //Warum arbeitest du nicht mit am Aussenwall?
	AI_Output(self, hero, "THF_401_HI_05_04"); //Warum sollte ich? Ich habe den Wall nicht kaputtgemacht.
	AI_Output(self, hero, "THF_401_HI_05_05"); //Ausserdem was bringt das? Falls die Orks wirklich angreifen, wird der Wall sie nicht aufhalten.
};

///////////////////////////////////////////////////////////////////////
//	Info YOUTHF
///////////////////////////////////////////////////////////////////////
instance THF_401_Huldrych_YOUTHF(C_Info)
{
	npc				= THF_401_Huldrych;
	nr				= 0;
	condition		= THF_401_Huldrych_YOUTHF_Condition;
	information		= THF_401_Huldrych_YOUTHF_Info;
	description		= "Du hast Agon bestohlen!";
};

func int THF_401_Huldrych_YOUTHF_Condition()
{
	if (!Npc_KnowsInfo(hero, WRK_225_Agon_WAREZ)
	&& (Cassian_BeatHudrych == LOG_RUNNING))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_401_Huldrych_YOUTHF_Info()
{
	AI_Output(hero, self, "THF_401_YOUTHF_15_01"); //Du hast Agon bestohlen!
	AI_Output(self, hero, "THF_401_YOUTHF_05_02"); //Tatsächlich? Und was habe ich ihm gestohlen?

	Info_AddChoice(THF_401_Huldrych_YOUTHF, "Das werde ich noch herausfinden!", THF_401_Huldrych_YOUTHF_LATER);
	Info_AddChoice(THF_401_Huldrych_YOUTHF, "Sein Schwert!", THF_401_Huldrych_YOUTHF_SWORD);
	Info_AddChoice(THF_401_Huldrych_YOUTHF, "Einen Schinken!", THF_401_Huldrych_YOUTHF_HAM);
};

func void THF_401_Huldrych_YOUTHF_HAM()
{
	AI_Output(hero, self, "THF_401_YOUTHF_HAM_15_01"); //Einen Schinken!
	AI_Output(self, hero, "THF_401_YOUTHF_HAM_05_02"); //HAHAHA einen Schinken? Das ist gut! Du bist echt witzig!

	if (Npc_HasItems(self, ItMi_Silver) >= HULDRYCH_STOLENSILVER)
	{
		_ = Npc_RemoveInvItems(self, ItMi_Silver, HULDRYCH_STOLENSILVER);
		Mob_CreateItems("OCR_HUT_78", ItMi_Silver, HULDRYCH_STOLENSILVER);
	};

	B_LogEntry(CH1_Train1h, CH1_Train1h_6);
	AI_StopProcessInfos(self);
};

func void THF_401_Huldrych_YOUTHF_SWORD()
{
	AI_Output(hero, self, "THF_401_YOUTHF_SWORD_15_01"); //Sein Schwert!
	AI_Output(self, hero, "THF_401_YOUTHF_SWORD_05_02"); //Warst du zu lange im Krankenviertel? Jeder hier weiß doch, das Agon kein Schwert besitzt.

	if (Npc_HasItems(self, ItMi_Silver) >= HULDRYCH_STOLENSILVER)
	{
		_ = Npc_RemoveInvItems(self, ItMi_Silver, HULDRYCH_STOLENSILVER);
		Mob_CreateItems("OCR_HUT_78", ItMi_Silver, HULDRYCH_STOLENSILVER);
	};

	B_LogEntry(CH1_Train1h, CH1_Train1h_6);
	AI_StopProcessInfos(self);
};

func void THF_401_Huldrych_YOUTHF_LATER()
{
	AI_Output(hero, self, "THF_401_YOUTHF_LATER_15_01"); //Das werde ich noch herausfinden!
	AI_Output(self, hero, "THF_401_YOUTHF_LATER_05_02"); //Wenn du nichts besseres zu tun hast.

	if (Npc_HasItems(self, ItMi_Silver) >= HULDRYCH_STOLENSILVER)
	{
		_ = Npc_RemoveInvItems(self, ItMi_Silver, HULDRYCH_STOLENSILVER);
		Mob_CreateItems("OCR_HUT_78", ItMi_Silver, HULDRYCH_STOLENSILVER);
	};

	B_LogEntry(CH1_Train1h, CH1_Train1h_6);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TOOSLOW
///////////////////////////////////////////////////////////////////////
instance THF_401_Huldrych_TOOSLOW(C_Info)
{
	npc				= THF_401_Huldrych;
	nr				= 66;
	condition		= THF_401_Huldrych_TOOSLOW_Condition;
	information		= THF_401_Huldrych_TOOSLOW_Info;
	description		= "Du hast Agon hundert Silberstücke gestohlen!";
};

func int THF_401_Huldrych_TOOSLOW_Condition()
{
	if (Npc_KnowsInfo(hero, THF_401_Huldrych_YOUTHF)
	&& Npc_KnowsInfo(hero, WRK_225_Agon_WAREZ))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_401_Huldrych_TOOSLOW_Info()
{
	AI_Output(hero, self, "THF_401_TOOSLOW_15_01"); //Du hast Agon hundert Silberstücke gestohlen!
	AI_Output(self, hero, "THF_401_TOOSLOW_05_02"); //Wie willst du das beweisen? Selbst wenn ich das Silber hätte, glaubst du ich trage es mit mir herum?
	AI_Output(self, hero, "THF_401_TOOSLOW_05_03"); //Also geh mir nicht auf den Sack!
	AI_TurnAway(hero, self);
	AI_Output(hero, self, "THF_401_TOOSLOW_15_04"); //Ich glaube mit Worten komme ich hier nicht weiter.

	B_LogEntry(CH1_Train1h, CH1_Train1h_7);
};

///////////////////////////////////////////////////////////////////////
//	Info AFTERBEAT
///////////////////////////////////////////////////////////////////////
instance THF_401_Huldrych_AFTERBEAT(C_Info)
{
	npc				= THF_401_Huldrych;
	condition		= THF_401_Huldrych_AFTERBEAT_Condition;
	information		= THF_401_Huldrych_AFTERBEAT_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int THF_401_Huldrych_AFTERBEAT_Condition()
{
	var C_Npc Huldrych;
	Huldrych = Hlp_GetNpc(THF_401_Huldrych);

	if (Npc_KnowsInfo(hero, THF_401_Huldrych_YOUTHF)
	&& Npc_KnowsInfo(hero, THF_401_Huldrych_TOOSLOW)
	&& C_NPCisinvincible(Huldrych))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_401_Huldrych_AFTERBEAT_Info()
{
	AI_Output(self, hero, "THF_401_AFTERBEAT_05_01"); //Lass mich in Ruhe! Geh jemand anders auf'n Sack!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GIVEMESILVER
///////////////////////////////////////////////////////////////////////
instance THF_401_Huldrych_GIVEMESILVER(C_Info)
{
	npc				= THF_401_Huldrych;
	nr				= 23;
	condition		= THF_401_Huldrych_GIVEMESILVER_Condition;
	information		= THF_401_Huldrych_GIVEMESILVER_Info;
	description		= "Sagst du mir jetzt wo das Silber ist?";
};

func int THF_401_Huldrych_GIVEMESILVER_Condition()
{
	var C_Npc Huldrych;
	Huldrych = Hlp_GetNpc(THF_401_Huldrych);

	if (Npc_KnowsInfo(hero, THF_401_Huldrych_TOOSLOW)
	&& Huldrych.aivar[AIV_WASDEFEATEDBYSC])
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_401_Huldrych_GIVEMESILVER_Info()
{
	AI_Output(hero, self, "THF_401_GIVEMESILVER_15_01"); //Sagst du mir jetzt wo das Silber ist?
	AI_Output(self, hero, "THF_401_GIVEMESILVER_05_02"); //ICH HAB ES NICHT MEHR!
	AI_Output(hero, self, "THF_401_GIVEMESILVER_15_03"); //Was hast du damit gemacht?
	AI_Output(self, hero, "THF_401_GIVEMESILVER_05_04"); //Meine Schulden bei verschiedenen Leuten bezahlt. Willst du mich jetzt nochmal schlagen?
	AI_Output(hero, self, "THF_401_GIVEMESILVER_15_05"); //Wenn du noch mal jemanden beklaust, komme ich wieder.
	AI_Output(self, hero, "THF_401_GIVEMESILVER_05_06"); //OK, OK. Ich habs kapiert! Aber lass mich jetzt bitte in Ruhe.
};

///////////////////////////////////////////////////////////////////////
//	Info INSPECTOR
///////////////////////////////////////////////////////////////////////
instance THF_401_Huldrych_INSPECTOR(C_Info)
{
	npc				= THF_401_Huldrych;
	nr				= 15;
	condition		= THF_401_Huldrych_INSPECTOR_Condition;
	information		= THF_401_Huldrych_INSPECTOR_Info;
	description		= "Agon wurden hundert Silberstücke gestohlen!";
};

func int THF_401_Huldrych_INSPECTOR_Condition()
{
	var C_Npc Huldrych;
	Huldrych = Hlp_GetNpc(THF_401_Huldrych);

	if ((Cassian_BeatHudrych == LOG_RUNNING)
	&& !Huldrych.aivar[AIV_WASDEFEATEDBYSC]
	&& !Npc_KnowsInfo(hero, THF_401_Huldrych_YOUTHF)
	&& Npc_KnowsInfo(hero, WRK_225_Agon_WAREZ))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_401_Huldrych_INSPECTOR_Info()
{
	AI_Output(hero, self, "THF_401_INSPECTOR_15_01"); //Agon wurden hundert Silberstücke gestohlen!
	AI_Output(self, hero, "THF_401_INSPECTOR_05_02"); //Was habe ich damit zu tun?
	AI_Output(hero, self, "THF_401_INSPECTOR_15_03"); //DU hast sie gestohlen.
	AI_Output(self, hero, "THF_401_INSPECTOR_05_04"); //Woher willst du das wissen?
	AI_Output(hero, self, "THF_401_INSPECTOR_15_05"); //Agon hat dich gesehen. Und ich möchte wetten, du trägst das Silber noch mit dir herum.
	AI_Output(self, hero, "THF_401_INSPECTOR_05_06"); //Und was hast du jetzt vor?

	Info_AddChoice(THF_401_Huldrych_INSPECTOR, "Ganz einfach, wir teilen", THF_401_Huldrych_INSPECTOR_SHARE);
	Info_AddChoice(THF_401_Huldrych_INSPECTOR, "Ich werde dir eine Lektion erteilen", THF_401_Huldrych_INSPECTOR_lesson);
};

func void THF_401_Huldrych_INSPECTOR_lesson()
{
	AI_Output(hero, self, "THF_401_INSPECTOR_lesson_15_01"); //Ich werde dir eine Lektion erteilen!
	AI_Output(self, hero, "THF_401_INSPECTOR_lesson_05_02"); //Versuch es, wenn du kannst!
	AI_StopProcessInfos(self);
	//B_SetAttitude(self, ATT_HOSTILE);
	Npc_SetTarget(self, hero);
	AI_StartState(self, ZS_ATTACK, 1, "");
};

func void THF_401_Huldrych_INSPECTOR_SHARE()
{
	AI_Output(hero, self, "THF_401_INSPECTOR_SHARE_15_01"); //Ganz einfach, wir teilen
	AI_Output(self, hero, "THF_401_INSPECTOR_SHARE_05_02"); //hmm...verstehe. Aber woher weiß ich, daß du es ernst meinst?
	AI_Output(hero, self, "THF_401_INSPECTOR_SHARE_15_03"); //Du musst mir vertrauen.

	if (Npc_HasItems(self, ItMi_Silver) >= HULDRYCH_STOLENSILVER)
	{
		AI_Output(self, hero, "THF_401_INSPECTOR_SHARE_05_04"); //hmm...fünfzig Silberstücke für dich...
		B_GiveInvItems(self, hero, ItMi_Silver, HULDRYCH_STOLENSILVER / 2);
		AI_Output(self, hero, "THF_401_INSPECTOR_SHARE_05_05"); //Und du sorgst dafür, das Agon und die Miliz mich nicht mehr belästigen!
		AI_Output(hero, self, "THF_401_INSPECTOR_SHARE_15_06"); //Abgemacht!
		Huldrych_Away = TRUE;
		AI_StopProcessInfos(self);
	};

	if (Npc_HasItems(self, ItMi_Silver) < HULDRYCH_STOLENSILVER)
	{
		AI_Output(self, hero, "THF_401_INSPECTOR_SHARE_05_07"); //Ich habe das Silber nicht mehr! Es ist mir abgenommen worden.
		AI_Output(self, hero, "THF_401_INSPECTOR_SHARE_05_08"); //Warte mal, habe ich dich nicht schon irgendwo gesehen...? Du warst das! Du hast mir das Silber abgenommen!
		AI_Output(hero, self, "THF_401_INSPECTOR_SHARE_15_09"); //Ich glaube, ich geh mal wieder.
		AI_Output(self, hero, "THF_401_INSPECTOR_SHARE_05_10"); //Nicht so schnell, Freundchen!

		AI_StopProcessInfos(self);
		Npc_SetTarget(self, other);
		AI_StartState(self, ZS_ATTACK, 1, "");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info NOWFIGHT
///////////////////////////////////////////////////////////////////////
instance THF_401_Huldrych_NOWFIGHT(C_Info)
{
	npc				= THF_401_Huldrych;
	condition		= THF_401_Huldrych_NOWFIGHT_Condition;
	information		= THF_401_Huldrych_NOWFIGHT_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int THF_401_Huldrych_NOWFIGHT_Condition()
{
	var C_Npc Huldrych;
	Huldrych = Hlp_GetNpc(THF_401_Huldrych);

	if (Npc_KnowsInfo(hero, THF_401_Huldrych_INSPECTOR)
	&& Huldrych.aivar[AIV_WASDEFEATEDBYSC]
	&& C_NPCisinvincible(hero))
	{
		return TRUE;
	};

	return FALSE;
};

func void THF_401_Huldrych_NOWFIGHT_Info()
{
	if (Huldrych_Away)
	{
		AI_Output(self, hero, "THF_401_NOWFIGHT_05_01"); //Du hinterhältiger Drecksack! Ich habe dir vertraut!
		AI_Output(self, hero, "THF_401_NOWFIGHT_05_02"); //Irgendwann, wenn du nicht damit rechnest, wenn du tief in der Scheisse sitzt, dann werde ich da sein!
		AI_Output(self, hero, "THF_401_NOWFIGHT_05_03"); //...und dann rechne ich mit dir ab!
	}
	else
	{
		B_GiveXP(XP_BeatedUpHuldrych);

		AI_Output(hero, self, "THF_401_NOWFIGHT_15_04"); //(bedrohlich) Lass dir das eine Lehre sein, andere Leute um ihre ehrlich verdienten Silberstücke zu bringen, du elender Dieb!
		AI_Output(hero, self, "THF_401_NOWFIGHT_15_05"); //Wenn ich nocheinmal von so einer Aktion höre, besuche ich dich wieder, hast du das verstanden?
		AI_Output(self, hero, "THF_401_NOWFIGHT_05_06"); //(ängstlich) Ja, ist klar, wird nicht wieder vorkommen. Ehrlich!
	};

	AI_StopProcessInfos(self);
};
