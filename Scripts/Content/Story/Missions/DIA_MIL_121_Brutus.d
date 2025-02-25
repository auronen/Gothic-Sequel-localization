///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_EXIT(C_Info)
{
	npc				= MIL_121_Brutus;
	nr				= 999;
	condition		= MIL_121_Brutus_EXIT_Condition;
	information		= MIL_121_Brutus_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int MIL_121_Brutus_EXIT_Condition()
{
	return TRUE;
};

func void MIL_121_Brutus_EXIT_Info()
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
//	Info MYWEAPON
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_MYWEAPON(C_Info)
{
	npc				= MIL_121_Brutus;
	nr				= 1;
	condition		= MIL_121_Brutus_MYWEAPON_Condition;
	information		= MIL_121_Brutus_MYWEAPON_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int MIL_121_Brutus_MYWEAPON_Condition()
{
	if (Npc_HasItems(hero, ItMw_Brutus_Longsword))
	{
		if (Arena_FightRunning
		&& Arena_PlayerFight
		&& Grim_Challenged
		&& !Arena_PlayerStoleWeapon)
		{
			return TRUE;
		}
		else
		{
			//self.aivar[AIV_PLAYERHASMYWEAPON] = TRUE;
			return FALSE;
		};
	};

	return FALSE;
};

func void MIL_121_Brutus_MYWEAPON_Info()
{
	AI_SetWalkMode(self, NPC_RUN);
	AI_GotoNpc(self, hero);
	AI_Output(self, hero, "MIL_121_MYWEAPON_Info_06_01"); //Rück mein Schwert raus, oder ich mach dich platt!

	Info_ClearChoices(MIL_121_Brutus_MYWEAPON);
	Info_AddChoice(MIL_121_Brutus_MYWEAPON, "Das Schwert gefällt mir. Ich behalte es!", MIL_121_Brutus_MYWEAPON_TAKEN);
	Info_AddChoice(MIL_121_Brutus_MYWEAPON, "Bleib locker, hier ist dein Schwert.", MIL_121_Brutus_MYWEAPON_GIVEBACK);
};

func void MIL_121_Brutus_MYWEAPON_GIVEBACK()
{
	Info_ClearChoices(MIL_121_Brutus_MYWEAPON);
	AI_Output(hero, self, "MIL_121_MYWEAPON_GIVEBACK_15_01"); //Bleib locker, hier ist dein Schwert.
	B_GiveInvItems(hero, self, ItMw_Brutus_Longsword, 1);
	AI_Output(self, hero, "MIL_121_MYWEAPON_GIVEBACK_06_02"); //(bedrohlich) dann lass mal sehen, wieviel Durchhaltevermögen du hast..
	AI_StopProcessInfos(self);
};

func void MIL_121_Brutus_MYWEAPON_TAKEN()
{
	Info_ClearChoices(MIL_121_Brutus_MYWEAPON);
	AI_Output(hero, self, "MIL_121_MYWEAPON_TAKEN_15_01"); //Das Schwert gefällt mir. Ich behalte es!
	AI_Output(self, hero, "MIL_121_MYWEAPON_TAKEN_06_02"); //Regel Nummer 3, du Trottel! Jetzt habe ich den Kampf gewonnen, Har Har Har!
	AI_StopProcessInfos(self);

	B_Arena_AbortFight(AF_PLAYERSTOLEWEAPON);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGED
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_CHALLENGED(C_Info)
{
	npc				= MIL_121_Brutus;
	nr				= 2;
	condition		= MIL_121_Brutus_CHALLENGED_Condition;
	information		= MIL_121_Brutus_CHALLENGED_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int MIL_121_Brutus_CHALLENGED_Condition()
{
	if (Brutus_Challenged
	&& Arena_PlayerFight
	&& C_NpcIsInvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_121_Brutus_CHALLENGED_Info()
{
	if (Wld_IsTime(0, 0, ARENABEGIN_H, ARENABEGIN_M))
	{
		if (Npc_GetDistToWP(self, ARENA_WP_RIGHT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
			AI_Output(self, hero, "MIL_121_CHALLENGED_06_01"); //Wir sehen uns in der Arena, Kleiner! Heute Abend!
		}
		else
		{
			AI_Output(self, hero, "MIL_121_CHALLENGED_06_02"); //Verschwinde in deine eigene Kammer!
		};

		AI_StopProcessInfos(self);
		return;
	};

	if (Npc_IsInRoutine(self, ZS_ArenaFight))
	{
		AI_Output(self, hero, "MIL_121_CHALLENGED_06_03"); //(bedrohlich) Ich mach dich platt!!!
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		AI_Output(self, hero, "MIL_121_CHALLENGED_06_04"); //Wir sehen uns in der Arena, Kleiner! Morgen Abend!
		AI_StopProcessInfos(self);
		return;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PRENPC
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_PRENPC(C_Info)
{
	npc				= MIL_121_Brutus;
	condition		= MIL_121_Brutus_PRENPC_Condition;
	information		= MIL_121_Brutus_PRENPC_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int MIL_121_Brutus_PRENPC_Condition()
{
	if (Arena_NpcFight
	&& ((Arena_NpcCombo == AC_GOLIATH_BRUTUS) || (Arena_NpcCombo == AC_BRUTUS_MALGAR))
	&& Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	&& C_NpcIsInvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_121_Brutus_PRENPC_Info()
{
	AI_Output(self, hero, "MIL_121_PRENPC_06_01"); //Verschwinde! Dieser Raum ist nur für Gladiatoren vor dem Kampf!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GLADIATOR
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_GLADIATOR(C_Info)
{
	npc				= MIL_121_Brutus;
	nr				= 1;
	condition		= MIL_121_Brutus_GLADIATOR_Condition;
	information		= MIL_121_Brutus_GLADIATOR_Info;
	description		= "Du bist bestimmt einer der Gladiatoren!";
};

func int MIL_121_Brutus_GLADIATOR_Condition()
{
	return TRUE;
};

func void MIL_121_Brutus_GLADIATOR_Info()
{
	AI_Output(hero, self, "MIL_121_GLADIATOR_15_01"); //Du bist bestimmt einer der Gladiatoren!
	AI_Output(self, hero, "MIL_121_GLADIATOR_06_02"); //Woher willst du das wissen, Kleiner?

	Info_ClearChoices(MIL_121_Brutus_GLADIATOR);
	Info_AddChoice(MIL_121_Brutus_GLADIATOR, "Ich habe geraten.", MIL_121_Brutus_GLADIATOR_NOONE);
	Info_AddChoice(MIL_121_Brutus_GLADIATOR, "Was ist dein Problem?", MIL_121_Brutus_GLADIATOR_PROVOKE);
};

func void MIL_121_Brutus_GLADIATOR_PROVOKE()
{
	Info_ClearChoices(MIL_121_Brutus_GLADIATOR);

	AI_Output(hero, self, "MIL_121_GLADIATOR_PROVOKE_15_01"); //Was ist dein Problem?
	if (Npc_HasItems(self, ItMw_Brutus_Longsword))
	{
		AI_ReadyMeleeWeapon(self);
	};

	AI_Output(self, hero, "MIL_121_GLADIATOR_PROVOKE_06_02"); //Wenn du nicht deine Fresse hältst, hast DU ein Problem, Kleiner!
	AI_Output(self, hero, "MIL_121_GLADIATOR_PROVOKE_06_03"); //Vorlaute Spinner wie dich mach ich besonders gerne platt!

	if (Npc_HasItems(self, ItMw_Brutus_Longsword))
	{
		AI_RemoveWeapon(self);
	};
};

func void MIL_121_Brutus_GLADIATOR_NOONE()
{
	Info_ClearChoices(MIL_121_Brutus_GLADIATOR);

	AI_Output(hero, self, "MIL_121_GLADIATOR_NOONE_15_01"); //Ich habe geraten.
	AI_Output(self, hero, "MIL_121_GLADIATOR_NOONE_06_02"); //Und ich rate dir mich nicht zu nerven, sonst mach ich dich platt!
};

///////////////////////////////////////////////////////////////////////
//	Info YOUMILITIA
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_YOUMILITIA(C_Info)
{
	npc				= MIL_121_Brutus;
	nr				= 0;
	condition		= MIL_121_Brutus_YOUMILITIA_Condition;
	information		= MIL_121_Brutus_YOUMILITIA_Info;
	description		= "Du siehst aber eher aus wie ein Milizsoldat!";
};

func int MIL_121_Brutus_YOUMILITIA_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_121_Brutus_GLADIATOR)
	&& !self.aivar[AIV_FINDABLE])
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_121_Brutus_YOUMILITIA_Info()
{
	AI_Output(hero, self, "MIL_121_YOUMILITIA_15_01"); //Du siehst aber eher aus wie ein Milizsoldat!
	AI_Output(self, hero, "MIL_121_YOUMILITIA_06_02"); //Hör zu Kleiner, falls du es noch nicht gemerkt hast...
	AI_Output(self, hero, "MIL_121_YOUMILITIA_06_03"); //Du sprichst mit LEUTNANT Brutus, dem zweiten Mann in der Miliz gleich nach diesem verbitterten Arsch von Berengar.
	AI_Output(self, hero, "MIL_121_YOUMILITIA_06_04"); //Also zeig gefälligst ein bischen mehr Respekt oder ich mach dich platt!
};

///////////////////////////////////////////////////////////////////////
//	Info YOULIEUTENANT
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_YOULIEUTENANT(C_Info)
{
	npc				= MIL_121_Brutus;
	nr				= 0;
	condition		= MIL_121_Brutus_YOULIEUTENANT_Condition;
	information		= MIL_121_Brutus_YOULIEUTENANT_Info;
	description		= "Bist du nicht einer dieser beiden Leutnants der Miliz?";
};

func int MIL_121_Brutus_YOULIEUTENANT_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_121_Brutus_GLADIATOR)
	&& self.aivar[AIV_FINDABLE])
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_121_Brutus_YOULIEUTENANT_Info()
{
	AI_Output(hero, self, "MIL_121_YOULIEUTENANT_15_01"); //Bist du nicht einer dieser beiden Leutnants der Miliz?
	AI_Output(self, hero, "MIL_121_YOULIEUTENANT_06_02"); //Das bin ich, Kleiner. Und deshalb solltest du gut aufpassen, wie du mir mir redest!
};

///////////////////////////////////////////////////////////////////////
//	Info CASSIAN
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_CASSIAN(C_Info)
{
	npc				= MIL_121_Brutus;
	nr				= 0;
	condition		= MIL_121_Brutus_CASSIAN_Condition;
	information		= MIL_121_Brutus_CASSIAN_Info;
	description		= "Ich habe gehört, Cassian ist ebenfalls Miliz-Leutnant!";
};

func int MIL_121_Brutus_CASSIAN_Condition()
{
	var C_Npc cassian;
	cassian = Hlp_GetNpc(MIL_119_Cassian);

	if ((Npc_KnowsInfo(hero, MIL_121_Brutus_YOUMILITIA) || Npc_KnowsInfo(hero, MIL_121_Brutus_YOULIEUTENANT))
	&& (Npc_KnowsInfo(hero, Mil_119_Cassian_HI) || cassian.aivar[AIV_FINDABLE]))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_121_Brutus_CASSIAN_Info()
{
	AI_Output(hero, self, "MIL_121_CASSIAN_15_01"); //Ich habe gehört, Cassian ist ebenfalls Miliz-Leutnant!
	AI_Output(self, hero, "MIL_121_CASSIAN_06_02"); //(aggressiv)Cassian, ist ein Weichling! Eine Memme.
	AI_Output(self, hero, "MIL_121_CASSIAN_06_03"); //Der weiss schon garnicht mehr, wie sich ein Schwert überhaupt anfühlt.
	AI_Output(self, hero, "MIL_121_CASSIAN_06_04"); //Steht den ganzen Tag im Burghof, und gibt besserwisserische Kommentare an die Rekruten.
	AI_Output(self, hero, "MIL_121_CASSIAN_06_05"); //Der sollte sich liebermal hier in die Arena herunterwagen, dann werde ich ihm schon zeigen, wie man kämfpt.
	AI_Output(hero, self, "MIL_121_CASSIAN_15_06"); //(grins) Wenn ich ihn sehe, werde ich es ihm ausrichten.
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGE
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_CHALLENGE(C_Info)
{
	npc				= MIL_121_Brutus;
	nr				= 0;
	condition		= MIL_121_Brutus_CHALLENGE_Condition;
	information		= MIL_121_Brutus_CHALLENGE_Info;
	permanent		= TRUE;
	description		= "Laß uns in der Arena klären, wer hier wen plattmacht!";
};

func int MIL_121_Brutus_CHALLENGE_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_121_Brutus_GLADIATOR)
	&& !Grim_Challenged
	&& !Goliath_Challenged
	&& !Brutus_Challenged
	&& !Malgar_Challenged
	&& !Thora_Challenged
	&& Arenamaster_Accepted
	&& Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_121_Brutus_CHALLENGE_Info()
{
	AI_Output(hero, self, "MIL_121_CHALLENGE_15_01"); //Laß uns in der Arena klären, wer hier wen plattmacht!

	if (!Npc_HasItems(self, ItMw_Brutus_Longsword))
	{
		AI_Output(self, hero, "MIL_121_CHALLENGE_06_02"); //Irgend so ein Witzbold hat sich mein Schwert unter den Nagel gerissen. Wenn ich den erwische, mach ich ihn platt...

		if (Npc_HasItems(hero, ItMw_Brutus_Longsword))
		{
			Info_ClearChoices(MIL_121_Brutus_CHALLENGE);
			Info_AddChoice(MIL_121_Brutus_CHALLENGE, "Ich habe deine Waffe... ähem... gefunden! Hier!", MIL_121_Brutus_CHALLENGE_FOUND);
		};

		return;
	};

	if (Arena_PlayerBanned)
	{
		AI_Output(self, hero, "MIL_121_CHALLENGE_06_03"); //Sehr gerne!
		AI_Output(self, hero, "MIL_121_CHALLENGE_06_04"); //Aber der Arenameister wird dich nicht kämpfen lassen, weil du Scheisse gebaut hast
	}
	else
	{
		if (B_Arena_GetGladiatorRanking(PC_Hero) > (B_Arena_GetGladiatorRanking(MIL_121_Brutus) + 1))
		{
			AI_Output(self, hero, "MIL_121_CHALLENGE_06_05"); //(verächtlich) PAHHHH!!! Ich mach meine Klinge doch nicht an Würstchen wie dir stumpf!
			AI_Output(self, hero, "MIL_121_CHALLENGE_06_06"); //Komm wieder wenn du Grim und Goliath ein paar Mal die Fresse poliert hast!

			return;
		};

		if (B_Arena_GetGladiatorRanking(PC_Hero) <= (B_Arena_GetGladiatorRanking(MIL_121_Brutus) - 2))
		{
			AI_Output(self, hero, "MIL_121_CHALLENGE_06_07"); //Such dir jemand anderen!
			AI_Output(hero, self, "MIL_121_CHALLENGE_15_08"); //Was ein Held du doch bist... Ein MAUL...held!

			return;
		};

		//else
		AI_Output(self, hero, "MIL_121_CHALLENGE_06_09"); //Mit dem grössten Vergnügen, Kleiner!
		AI_Output(self, hero, "MIL_121_CHALLENGE_06_10"); //Wenn du dich damit zum Arenameister traust, kann es heute abend losgehen.
		AI_Output(self, hero, "MIL_121_CHALLENGE_06_11"); //Har, har, har!

		Brutus_Challenged = TRUE;
	};
};

func void MIL_121_Brutus_CHALLENGE_FOUND()
{
	Info_ClearChoices(MIL_121_Brutus_CHALLENGE);
	AI_Output(hero, self, "MIL_121_Brutus_CHALLENGE_FOUND_15_01"); //Ich habe deine Waffe... ähem... gefunden! Hier!
	B_GiveInvItems(hero, self, ItMw_Brutus_Longsword, 1);
	AI_Output(self, hero, "MIL_121_Brutus_CHALLENGE_FOUND_06_02"); //Kann nur für dich hoffen, dass du es wirklich GEFUNDEN hast.
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_WEAPON(C_Info)
{
	npc				= MIL_121_Brutus;
	nr				= 0;
	condition		= MIL_121_Brutus_WEAPON_Condition;
	information		= MIL_121_Brutus_WEAPON_Info;
	description		= "Ist das da deine Waffe?";
};

func int MIL_121_Brutus_WEAPON_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_121_Brutus_GLADIATOR))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_121_Brutus_WEAPON_Info()
{
	AI_Output(hero, self, "MIL_121_WEAPON_15_01"); //Ist das da deine Waffe?

	if (Npc_HasItems(self, ItMw_Brutus_Longsword))
	{
		AI_ReadyMeleeWeapon(self);
	};

	AI_Output(self, hero, "MIL_121_WEAPON_06_02"); //Das ist das schärfste Schwert im ganzen Lager!
	AI_Output(self, hero, "MIL_121_WEAPON_06_03"); //Ich schleife es täglich... extra für Spinner wie dich!
	if (Npc_HasItems(self, ItMw_Brutus_Longsword))
	{
		AI_RemoveWeapon(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info VICTORIES
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_VICTORIES(C_Info)
{
	npc				= MIL_121_Brutus;
	nr				= 0;
	condition		= MIL_121_Brutus_VICTORIES_Condition;
	information		= MIL_121_Brutus_VICTORIES_Info;
	description		= "Du hast bestimmt schon oft gewonnen, oder?";
};

func int MIL_121_Brutus_VICTORIES_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_121_Brutus_GLADIATOR))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_121_Brutus_VICTORIES_Info()
{
	AI_Output(hero, self, "MIL_121_VICTORIES_15_01"); //Du hast bestimmt schon oft gewonnen, oder?
	AI_Output(self, hero, "MIL_121_VICTORIES_06_02"); //Ich bin einer der besten Gladiatoren hier!
	AI_Output(self, hero, "MIL_121_VICTORIES_06_03"); //Und jetzt verzieh dich.
	AI_TurnAway(hero, self);
	AI_Output(hero, self, "MIL_121_VICTORIES_15_04"); //(zu sich selbst) Was ein Arsch!
	AI_Output(self, hero, "MIL_121_VICTORIES_06_05"); //Das hab ich gehört, Kleiner!

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_HOWDY(C_Info)
{
	npc				= MIL_121_Brutus;
	nr				= 0;
	condition		= MIL_121_Brutus_HOWDY_Condition;
	information		= MIL_121_Brutus_HOWDY_Info;
	permanent		= TRUE;
	description		= "Na, ist deine Klinge noch schön scharf?";
};

func int MIL_121_Brutus_HOWDY_Condition()
{
	if (Npc_KnowsInfo(hero, MIL_121_Brutus_WEAPON)
	&& Npc_KnowsInfo(hero, MIL_121_Brutus_VICTORIES)
	&& !MIL_121_Brutus_CHALLENGE_Condition())
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_121_Brutus_HOWDY_Info()
{
	AI_Output(hero, self, "MIL_121_HOWDY_15_01"); //Na, ist deine Klinge noch schön scharf?
	AI_Output(self, hero, "MIL_121_HOWDY_06_02"); //...wenn du nicht aufhörst mir dumm zu kommen, dann...
	AI_Output(hero, self, "MIL_121_HOWDY_15_03"); //(spöttisch)...machst du mich platt? Wir werden sehen!
	AI_StopProcessInfos(self);
};
