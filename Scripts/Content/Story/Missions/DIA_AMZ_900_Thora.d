///////////////////////////////////////////////

instance AMZ_900_Thora_Exit(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 999;
	condition		= AMZ_900_Thora_Exit_Condition;
	information		= AMZ_900_Thora_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int AMZ_900_Thora_Exit_Condition()
{
	return TRUE;
};

func void AMZ_900_Thora_Exit_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##					KAPITEL 1 (Erste Begegnung)
//##
//##
//#####################################################################

instance AMZ_900_Thora_GREETING(C_Info)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_GREETING_Condition;
	information		= AMZ_900_Thora_GREETING_Info;
	important		= TRUE;
	//description		= "(Startsatz)";
};

func int AMZ_900_Thora_GREETING_Condition()
{
	if (subChapter < CH1_ARRIVED_AT_OC)
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_GREETING_Info()
{
	AI_Output(self, hero, "AMZ_900_GREETING_16_01"); //Verdammt, woher kommst du so plötzlich? Wer bist du?
	AI_Output(self, hero, "AMZ_900_GREETING_16_02"); //Beinahe hätte ich Dich niedergeschlagen!
	Npc_ExchangeRoutine(self, "ArenaWait");
};

instance AMZ_900_Thora_WHO(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 0;
	condition		= AMZ_900_Thora_WHO_Condition;
	information		= AMZ_900_Thora_WHO_Info;
	description		= "Immer langsam! Sag mir doch erstmal wer du bist.";
};

func int AMZ_900_Thora_WHO_Condition()
{
	if (!Npc_KnowsInfo(hero, AMZ_900_Thora_TRAINING)
	&& (subChapter < CH1_ARRIVED_AT_OC))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_WHO_Info()
{
	AI_Output(hero, self, "AMZ_900_Thora_WHO_Info_15_01"); //Immer langsam! Sag mir doch erstmal wer du bist.
	AI_Output(self, hero, "AMZ_900_Thora_WHO_Info_16_02"); //Ich bin Thora. Und ich frage mich, wo du so plötzlich herkommst!
	Info_AddChoice(AMZ_900_Thora_WHO, "Ich bin vom Himmel gefallen!", AMZ_900_Thora_WHO_SKY);
	Info_AddChoice(AMZ_900_Thora_WHO, "Das kann ich dir leider nicht sagen.", AMZ_900_Thora_WHO_CANTSAY);
};

func void AMZ_900_Thora_WHO_SKY()
{
	AI_Output(hero, self, "AMZ_900_Thora_WHO_SKY_Info_15_01"); //Ich bin vom Himmel gefallen!
	AI_Output(self, hero, "AMZ_900_Thora_WHO_SKY_Info_16_02"); //Wirklich wahr? Dann sieh mal zu, daß du wieder heil nach oben kommst, mein Vögelchen!
	AI_Output(self, hero, "AMZ_900_Thora_WHO_SKY_Info_16_03"); //Und falls du mal wieder landest, solltest du etwas freundlicher sein!

	Info_ClearChoices(AMZ_900_Thora_WHO);
	AI_StopProcessInfos(self);
};

func void AMZ_900_Thora_WHO_CANTSAY()
{
	AI_Output(hero, self, "AMZ_900_Thora_WHO_CANTSAY_Info_15_01"); //Das kann ich dir leider nicht sagen.
	AI_Output(self, hero, "AMZ_900_Thora_WHO_CANTSAY_Info_16_02"); //Das war doch ein Teleport-Zauber, aber wie ein Magier siehst du nicht gerade aus.

	Info_ClearChoices(AMZ_900_Thora_WHO);
	Info_AddChoice(AMZ_900_Thora_WHO, "Beurteilst du jeden nach dem Äusseren?", AMZ_900_Thora_WHO_JUDGE);
};

func void AMZ_900_Thora_WHO_JUDGE()
{
	AI_Output(other, self, "AMZ_900_Thora_WHO_JUDGE_Info_15_01"); //Beurteilst du jeden nach dem Äusseren?
	AI_Output(self, other, "AMZ_900_Thora_WHO_JUDGE_Info_16_02"); //Nicht jeden. Nur die, die nichts zu sagen haben!
	AI_Output(self, other, "AMZ_900_Thora_WHO_JUDGE_Info_16_03"); //Was hast du denn hier vor?

	Info_AddChoice(AMZ_900_Thora_WHO, "Sagst du mir auch, was Du hier machst?", AMZ_900_Thora_WHO_WHAT);
	Info_AddChoice(AMZ_900_Thora_WHO, "Was ich hier vorhabe, kann ich dir nicht erzählen.", AMZ_900_Thora_WHO_SECRET);
	Info_AddChoice(AMZ_900_Thora_WHO, "Ich will ins Lager.", AMZ_900_Thora_WHO_WHATELSE);
};

func void AMZ_900_Thora_WHO_WHAT()
{
	AI_Output(other, self, "AMZ_900_Thora_WHO_WHAT_Info_15_01"); //Sagst du mir auch, was Du hier machst?
	AI_Output(self, other, "AMZ_900_Thora_WHO_WHAT_Info_16_02"); //...also gerade versuche ich etwas über dich zu erfahren.
	AI_Output(other, self, "AMZ_900_Thora_WHO_WHAT_Info_15_03"); //und sonst?
	AI_Output(self, other, "AMZ_900_Thora_WHO_WHAT_Info_16_04"); //Ich bin Kämpferin.

	//Info_ClearChoices(AMZ_900_Thora_WHO);
	Info_AddChoice(AMZ_900_Thora_WHO, "Eine Frau als Kämpferin?", AMZ_900_Thora_WHO_FIGHTER);
};

func void AMZ_900_Thora_WHO_SECRET()
{
	AI_Output(hero, self, "AMZ_900_Thora_WHO_SECRET_Info_15_01"); //Was ich hier vorhabe, kann ich dir nicht erzählen.
	AI_Output(self, hero, "AMZ_900_Thora_WHO_SECRET_Info_16_02"); //Na dann!

	Info_ClearChoices(AMZ_900_Thora_WHO);
	AI_StopProcessInfos(self);
};

func void AMZ_900_Thora_WHO_WHATELSE()
{
	AI_Output(other, self, "AMZ_900_Thora_WHO_WHATELSE_Info_15_01"); //Ich will ins Lager.
	AI_Output(self, other, "AMZ_900_Thora_WHO_WHATELSE_Info_16_02"); //Das hast du schon fast geschafft. Da hinten ist es.
	Info_ClearChoices(AMZ_900_Thora_WHO);
};

func void AMZ_900_Thora_WHO_FIGHTER()
{
	AI_Output(other, self, "AMZ_900_Thora_WHO_FIGHTER_Info_15_01"); //Eine Frau als Kämpferin?
	AI_Output(self, other, "AMZ_900_Thora_WHO_FIGHTER_Info_16_02"); //Auch Du solltest nicht nach dem Äusseren urteilen.
	AI_Output(self, other, "AMZ_900_Thora_WHO_FIGHTER_Info_16_03"); //Einige hier mussten das erst schmerzvoll lernen!
	//Info_ClearChoices(AMZ_900_Thora_WHO);
};

////////////////////////////////////////////////
instance AMZ_900_Thora_TRAINING(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 0;
	condition		= AMZ_900_Thora_TRAINING_Condition;
	information		= AMZ_900_Thora_TRAINING_Info;
	description		= "Ich bin hier um zu trainieren und zu lernen.";
};

func int AMZ_900_Thora_TRAINING_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_WHO)
	&& (Npc_GetDistToWP(self, THORA_WP_OUT) < 300)
	&& !Wld_IsTime(THORA_OUT_H, THORA_OUT_M + 30, THORA_IN_H, THORA_IN_M))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_TRAINING_Info()
{
	AI_Output(other, self, "AMZ_900_Thora_TRAINING_Info_15_01"); //Ich bin hier um zu trainieren und zu lernen.
	AI_Output(self, other, "AMZ_900_Thora_TRAINING_Info_16_02"); //Sieht so aus, als ob du das auch nötig hast!

	Info_ClearChoices(AMZ_900_Thora_TRAINING);
	Info_AddChoice(AMZ_900_Thora_TRAINING, "Mit dir werde ich auch ohne Training fertig!", AMZ_900_Thora_TRAINING_HOSTILE);
	Info_AddChoice(AMZ_900_Thora_TRAINING, "Wer hat dich denn um deine Meinung gefragt?", AMZ_900_Thora_TRAINING_ANGRY);
	Info_AddChoice(AMZ_900_Thora_TRAINING, "Ich war wirklich schon mal besser in Form.", AMZ_900_Thora_TRAINING_FRIENDLY);
};

func void AMZ_900_Thora_TRAINING_FRIENDLY()
{
	AI_Output(other, self, "AMZ_900_Thora_TRAINING_FRIENDLY_Info_15_01"); //Ich war wirklich schon mal besser in Form.
	AI_Output(self, other, "AMZ_900_Thora_TRAINING_FRIENDLY_Info_16_02"); //Im Lager gibt es viel zu lernen. Du kannst dich sicher irgendwo nützlich machen!
	AI_Output(self, other, "AMZ_900_Thora_TRAINING_FRIENDLY_Info_16_03"); //Ich muß los, wir sehen uns bestimmt später noch.

	AI_StopProcessInfos(self);
};

func void AMZ_900_Thora_TRAINING_ANGRY()
{
	AI_Output(other, self, "AMZ_900_Thora_TRAINING_ANGRY_Info_15_01"); //Wer hat dich denn um deine Meinung gefragt?
	AI_Output(self, other, "AMZ_900_Thora_TRAINING_ANGRY_Info_16_02"); //Du scheinst einen schlechten Tag zu haben.
	AI_Output(self, other, "AMZ_900_Thora_TRAINING_ANGRY_Info_16_03"); //Wenn du mal Hilfe brauchst, solltest du etwas freundlicher sein!

	AI_StopProcessInfos(self);
};

func void AMZ_900_Thora_TRAINING_HOSTILE()
{
	AI_Output(other, self, "AMZ_900_Thora_TRAINING_HOSTILE_Info_15_01"); //Mit dir werde ich auch ohne Training fertig!
	AI_Output(self, other, "AMZ_900_Thora_TRAINING_HOSTILE_Info_16_02"); //Tatsächlich? Dann zeig doch mal, was du kannst!

	AI_StopProcessInfos(self);

	Npc_SetTarget(self, other);
	AI_StartState(self, ZS_ATTACK, 1, "");
};

///////////////////////////////////////////////////////////////////////
//	Info NOTENOUGH
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_NOTENOUGH(C_Info)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_NOTENOUGH_Condition;
	information		= AMZ_900_Thora_NOTENOUGH_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int AMZ_900_Thora_NOTENOUGH_Condition()
{
	if (self.aivar[AIV_HASDEFEATEDSC]
	&& (Npc_GetDistToWP(self, "OCR_ARENABATTLE_BENCH") >= 500)
	&& !Npc_KnowsInfo(hero, AMZ_900_Thora_GLADIATOR)
	&& C_NpcIsInvincible(hero)
	&& (subChapter < CH1_ARRIVED_AT_OC))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_NOTENOUGH_Info()
{
	AI_Output(self, hero, "AMZ_900_NOTENOUGH_16_01"); //(fröhlich) Na, ich kämpfe nicht so schlecht, oder?
	Info_AddChoice(AMZ_900_Thora_NOTENOUGH, "Ich hab dich gewinnen lassen. Hab garnicht richtig zugeschlagen!", AMZ_900_Thora_NOTENOUGH_YES);
	Info_AddChoice(AMZ_900_Thora_NOTENOUGH, "Stimmt. Wirklich nicht so schlecht!", AMZ_900_Thora_NOTENOUGH_NO);
};

func void AMZ_900_Thora_NOTENOUGH_NO()
{
	AI_Output(hero, self, "AMZ_900_NOTENOUGH_NO_15_01"); //Stimmt. Wirklich nicht so schlecht!
	AI_Output(self, hero, "AMZ_900_NOTENOUGH_NO_16_02"); //(freundlich) Na dann, bis später!

	Info_ClearChoices(AMZ_900_Thora_NOTENOUGH);
	AMZ_900_Thora_NOTENOUGH.permanent = FALSE;
	AI_StopProcessInfos(self);
};

func void AMZ_900_Thora_NOTENOUGH_YES()
{
	AI_Output(hero, self, "AMZ_900_NOTENOUGH_YES_15_01"); //Ich hab dich gewinnen lassen. Hab garnicht richtig zugeschlagen!
	AI_Output(self, hero, "AMZ_900_NOTENOUGH_YES_16_02"); //Na wenn das so ist... tu das besser jetzt, sonst schluckst du nochmal Staub!

	Info_ClearChoices(AMZ_900_Thora_NOTENOUGH);
	AI_StopProcessInfos(self);

	Npc_SetTarget(self, hero);
	AI_StartState(self, ZS_ATTACK, 1, "");
};

///////////////////////////////////////////////////////////////////////
//	Info SEEYA
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_SEEYA(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 0;
	condition		= AMZ_900_Thora_SEEYA_Condition;
	information		= AMZ_900_Thora_SEEYA_Info;
	description		= "Wohin gehst du?";
};

func int AMZ_900_Thora_SEEYA_Condition()
{
	if (Npc_IsInRoutine(self, ZS_SitAround)
	&& (Npc_GetDistToWP(self, "OCR_ARENABATTLE_BENCH") >= 500)
	&& (Npc_GetDistToWP(self, THORA_WP_OUT) >= 500)
	&& !Npc_KnowsInfo(hero, AMZ_900_Thora_GLADIATOR)
	&& Npc_KnowsInfo(hero, AMZ_900_Thora_WHO))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_SEEYA_Info()
{
	AI_Output(hero, self, "AMZ_900_SEEYA_15_01"); //Wohin gehst du?
	AI_Output(self, hero, "AMZ_900_SEEYA_16_02"); //Zur Arena. Ich kämpfe dort. Tagsüber bin ich meistens da.
};

///////////////////////////////////////////////////////////////////////
//	Info WHERENIGHT
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_WHERENIGHT(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 0;
	condition		= AMZ_900_Thora_WHERENIGHT_Condition;
	information		= AMZ_900_Thora_WHERENIGHT_Info;
	description		= "Und wo bist du... nachts?";
};

func int AMZ_900_Thora_WHERENIGHT_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_SEEYA))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_WHERENIGHT_Info()
{
	AI_Output(hero, self, "AMZ_900_WHERENIGHT_15_01"); //Und wo bist du... nachts?
	AI_Output(self, hero, "AMZ_900_WHERENIGHT_16_02"); //(Lacht) Du bist zwar schlecht in Form, aber dafür ganz schön dreist!

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HEYWAIT
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_HEYWAIT(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 0;
	condition		= AMZ_900_Thora_HEYWAIT_Condition;
	information		= AMZ_900_Thora_HEYWAIT_Info;
	permanent		= TRUE;
	description		= "Warte mal!";
};

func int AMZ_900_Thora_HEYWAIT_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_WHERENIGHT)
	&& (Npc_GetDistToWP(self, "OCR_ARENABATTLE_BENCH") >= 500)
	&& (Npc_GetDistToWP(self, THORA_WP_OUT) >= 500))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_HEYWAIT_Info()
{
	AI_Output(hero, self, "AMZ_900_HEYWAIT_15_01"); //Warte mal!
	AI_Output(self, hero, "AMZ_900_HEYWAIT_16_02"); //(fröhlich) Wir sehen uns später!

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##						STERNENGUCKEREI
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info NIGHT
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_NIGHT(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 0;
	condition		= AMZ_900_Thora_NIGHT_Condition;
	information		= AMZ_900_Thora_NIGHT_Info;
	description		= "Was tust du hier draussen?";
};

func int AMZ_900_Thora_NIGHT_Condition()
{
	if (Wld_IsTime(THORA_OUT_H, THORA_OUT_M + 30, THORA_IN_H, THORA_IN_M)
	&& (subChapter < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_NIGHT_Info()
{
	AI_Output(hero, self, "AMZ_900_NIGHT_15_01"); //Was tust du hier draussen?
	AI_Output(self, hero, "AMZ_900_NIGHT_16_02"); //Ich betrachte die Sterne. Sie sind erfüllt von der Macht des Feuers.
	AI_Output(self, hero, "AMZ_900_NIGHT_16_03"); //Das Feuer bestimmt mein Schicksal, so wie es das der Sterne bestimmt.
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NIGHTAGAIN
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_NIGHTAGAIN(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 0;
	condition		= AMZ_900_Thora_NIGHTAGAIN_Condition;
	information		= AMZ_900_Thora_NIGHTAGAIN_Info;
	permanent		= TRUE;
	description		= "Betrachtest du immer noch die Sterne?";
};

func int AMZ_900_Thora_NIGHTAGAIN_Condition()
{
	if (AMZ_900_Thora_NIGHT_Condition()
	&& Npc_KnowsInfo(hero, AMZ_900_Thora_NIGHT)
	&& (subChapter < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_NIGHTAGAIN_Info()
{
	AI_Output(hero, self, "AMZ_900_NIGHTAGAIN_15_01"); //Betrachtest du immer noch die Sterne?
	AI_Output(self, hero, "AMZ_900_NIGHTAGAIN_16_02"); //Die Sterne reflektieren das Feuer in mir. Ich liebe die Sterne.
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
instance AMZ_900_Thora_MYWEAPON(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 1;
	condition		= AMZ_900_Thora_MYWEAPON_Condition;
	information		= AMZ_900_Thora_MYWEAPON_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int AMZ_900_Thora_MYWEAPON_Condition()
{
	if (Npc_HasItems(hero, ItMw_Thora_Battlestaff))
	{
		if (Arena_FightRunning
		&& Arena_PlayerFight
		&& Thora_Challenged
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

func void AMZ_900_Thora_MYWEAPON_Info()
{
	AI_SetWalkMode(self, NPC_RUN);
	AI_GotoNpc(self, hero);
	AI_Output(self, hero, "AMZ_900_MYWEAPON_Info_16_01"); //(wütend) Gib mir den Kampfstab!

	Info_ClearChoices(AMZ_900_Thora_MYWEAPON);
	Info_AddChoice(AMZ_900_Thora_MYWEAPON, "Ich glaube, ich behalte ihn lieber.", AMZ_900_Thora_MYWEAPON_TAKEN);
	Info_AddChoice(AMZ_900_Thora_MYWEAPON, "Hier hast du das Ding zurück!", AMZ_900_Thora_MYWEAPON_GIVEBACK);
};

func void AMZ_900_Thora_MYWEAPON_GIVEBACK()
{
	Info_ClearChoices(AMZ_900_Thora_MYWEAPON);
	AI_Output(hero, self, "AMZ_900_MYWEAPON_GIVEBACK_15_01"); //Hier hast du das Ding zurück!
	B_GiveInvItems(hero, self, ItMw_Thora_Battlestaff, 1);
	AI_Output(self, hero, "AMZ_900_MYWEAPON_GIVEBACK_16_02"); //Dann zeig mal, ob du noch was anderes drauf hast, ausser Waffenstehlen.

	AI_StopProcessInfos(self);
};

func void AMZ_900_Thora_MYWEAPON_TAKEN()
{
	Info_ClearChoices(AMZ_900_Thora_MYWEAPON);
	AI_Output(hero, self, "AMZ_900_MYWEAPON_TAKEN_15_01"); //Ich glaube, ich behalte ihn lieber.
	AI_Output(self, hero, "AMZ_900_MYWEAPON_TAKEN_16_02"); //(wütender) Du kannst dich nicht mal in der Arena an die Regeln halten!
	AI_StopProcessInfos(self);

	B_Arena_AbortFight(AF_PLAYERSTOLEWEAPON);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGED
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_CHALLENGED(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 2;
	condition		= AMZ_900_Thora_CHALLENGED_Condition;
	information		= AMZ_900_Thora_CHALLENGED_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int AMZ_900_Thora_CHALLENGED_Condition()
{
	if (Thora_Challenged
	&& Arena_PlayerFight
	&& C_NpcIsInvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_CHALLENGED_Info()
{
	if (Wld_IsTime(0, 0, ARENABEGIN_H, ARENABEGIN_M))
	{
		if (Npc_GetDistToWP(self, ARENA_WP_RIGHT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
			AI_Output(self, hero, "AMZ_900_CHALLENGED_16_01"); //Bin gespannt, was du draufhast.
			AI_Output(self, hero, "AMZ_900_CHALLENGED_16_02"); //Wir sehen uns heute Abend in der Arena!
		}
		else
		{
			AI_Output(self, hero, "AMZ_900_CHALLENGED_16_03"); //Das ist MEINE Vorbereitungskammer.
			B_AttackProper(self, hero);
		};

		AI_StopProcessInfos(self);
		return;
	};

	if (Npc_IsInRoutine(self, ZS_ArenaFight))
	{
		AI_Output(self, hero, "AMZ_900_CHALLENGED_16_04"); //Bist du nervös, oder warum redest du soviel?
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		AI_Output(self, hero, "MIL_121_CHALLENGED_16_05"); //Wir sehen uns in der Arena. Morgen Abend!
		AI_StopProcessInfos(self);
		return;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PRENPC
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_PRENPC(C_Info)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_PRENPC_Condition;
	information		= AMZ_900_Thora_PRENPC_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int AMZ_900_Thora_PRENPC_Condition()
{
	if (Arena_NpcFight
	&& (Arena_NpcCombo == AC_MALGAR_THORA)
	&& Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	&& C_NpcIsInvincible(self))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_PRENPC_Info()
{
	AI_Output(self, hero, "AMZ_900_PRENPC_16_01"); //Du hast in meiner Vorbereitungskammer nichts zu suchen. Verschwinde!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GLADIATOR
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_GLADIATOR(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 5;
	condition		= AMZ_900_Thora_GLADIATOR_Condition;
	information		= AMZ_900_Thora_GLADIATOR_Info;
	description		= "Du kämpfst in der Arena?";
};

func int AMZ_900_Thora_GLADIATOR_Condition()
{
	if ((Npc_GetDistToWP(self, "OCR_ARENABATTLE_BENCH") < 500)
	&& (subChapter < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_GLADIATOR_Info()
{
	AI_Output(hero, self, "AMZ_900_GLADIATOR_15_01"); //(ungläubig) Du kämpfst in der Arena?

	if (self.aivar[AIV_HASDEFEATEDSC])
	{
		AI_Output(self, hero, "AMZ_900_GLADIATOR_16_02"); //(spöttisch)Du solltest wissen, daß ich mit Waffen umgehen kann.
		AI_Output(hero, self, "AMZ_900_GLADIATOR_15_03"); //ja... ich erinnere mich!
	}
	else
	{
		AI_Output(self, hero, "AMZ_900_GLADIATOR_16_04"); //Du glaubst wohl immer noch, daß nur Männer mit Waffen umgehen können!
		//AI_Output(self, hero, "AMZ_900_GLADIATOR_16_05"); //Ich kann dir beweisen, daß das nicht stimmt!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_WEAPON(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 5;
	condition		= AMZ_900_Thora_WEAPON_Condition;
	information		= AMZ_900_Thora_WEAPON_Info;
	description		= "Was hast du da für eine seltsame Waffe?";
};

func int AMZ_900_Thora_WEAPON_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_GLADIATOR)
	&& Npc_HasItems(self, ItMw_Thora_Battlestaff))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_WEAPON_Info()
{
	AI_Output(hero, self, "AMZ_900_WEAPON_15_01"); //Was hast du da für eine seltsame Waffe?

	AI_ReadyMeleeWeapon(self);
	AI_TurnToNpc(self, hero);

	AI_Wait(self, 0.5);
	AI_Output(self, hero, "AMZ_900_WEAPON_16_02"); //Einen thyrianischer Kampfstab.
	AI_Output(self, hero, "AMZ_900_WEAPON_16_03"); //Ist schnell wie ein Pfeil und hat eine grosse Reichweite.
	AI_Output(self, hero, "AMZ_900_WEAPON_16_04"); //Diese Waffe zu meistern ist sehr schwierig.

	AI_RemoveWeapon(self);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info VICTORIES
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_VICTORIES(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 5;
	condition		= AMZ_900_Thora_VICTORIES_Condition;
	information		= AMZ_900_Thora_VICTORIES_Info;
	description		= "Wieviele Arenakämpfe hast du gewonnen?";
};

func int AMZ_900_Thora_VICTORIES_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_GLADIATOR)
	&& (subChapter < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_VICTORIES_Info()
{
	AI_Output(hero, self, "AMZ_900_VICTORIES_15_01"); //Wieviele Arenakämpfe hast du gewonnen?
	AI_Output(self, hero, "AMZ_900_VICTORIES_16_02"); //Also bis jetzt... Alle.
	AI_Output(self, hero, "AMZ_900_VICTORIES_16_03"); //(gelangweilt) Die Kämpfer hier sind wirklich keine Gegner für mich!
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGE
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_CHALLENGE(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 5;
	condition		= AMZ_900_Thora_CHALLENGE_Condition;
	information		= AMZ_900_Thora_CHALLENGE_Info;
	permanent		= TRUE;
	description		= "Ich fordere dich zu einem Arenakampf heraus!";
};

func int AMZ_900_Thora_CHALLENGE_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_VICTORIES)
	&& !Grim_Challenged
	&& !Goliath_Challenged
	&& !Brutus_Challenged
	&& !Malgar_Challenged
	&& !Thora_Challenged
	&& Arenamaster_Accepted
	&& Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M)
	&& (subChapter < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_CHALLENGE_Info()
{
	AI_Output(hero, self, "AMZ_900_CHALLENGE_15_01"); //Ich fordere dich zu einem Arenakampf heraus!

	if (!Npc_HasItems(self, ItMw_Thora_Battlestaff))
	{
		AI_Output(self, hero, "AMZ_900_CHALLENGE_16_02"); //Sobald ich meinen Kampfstab wiederhabe, werde ich gegen dich antreten.

		if (Npc_HasItems(hero, ItMw_Thora_Battlestaff))
		{
			Info_ClearChoices(AMZ_900_Thora_CHALLENGE);
			Info_AddChoice(AMZ_900_Thora_CHALLENGE, "Ich habe deine Waffe... ähem... gefunden! Hier!", AMZ_900_Thora_CHALLENGE_FOUND);
		};

		return;
	};

	if (!Thora_PlayerWonBefore)
	{
		AI_Output(hero, self, "AMZ_900_CHALLENGE_15_03"); //Wird doch Zeit, daß du mal einen Kampf verlierst!
	};

	if (Arena_PlayerBanned)
	{
		AI_Output(self, hero, "AMZ_900_CHALLENGE_16_04"); //Du hast Mist gebaut, in der Arena.
		AI_Output(self, hero, "AMZ_900_CHALLENGE_16_05"); //Klär das mit dem Arenameister, sonst kann ich nicht gegen dich kämpfen!
		AI_StopProcessInfos(self);
	}
	else
	{
		if (!Malgar_PlayerWonBefore)
		{
			AI_Output(self, hero, "AMZ_900_CHALLENGE_16_06"); //Solange du nicht mal Malgar besiegt hast, kämpfe ich nicht gegen dich!
			AI_Output(self, hero, "AMZ_900_CHALLENGE_16_07"); //Er ist nach mir der zweitbeste Kämpfer hier.

			return;
		};

		//else
		AI_Output(self, hero, "AMZ_900_CHALLENGE_16_08"); //Es wird mir eine Freude sein, gegen dich zu kämpfen.
		AI_Output(self, hero, "AMZ_900_CHALLENGE_16_09"); //Gib dein Preisgeld beim Arenameister ab, dann können wir heute abend zusammen... (neckisch) TANZEN!!!

		Thora_Challenged = TRUE;
	};
};

func void AMZ_900_Thora_CHALLENGE_FOUND()
{
	Info_ClearChoices(AMZ_900_Thora_CHALLENGE);
	AI_Output(hero, self, "AMZ_900_CHALLENGE_FOUND_15_01"); //Ich habe deine Waffe... ähem... gefunden! Hier!
	B_GiveInvItems(hero, self, ItMw_Thora_Battlestaff, 1);
	AI_Output(self, hero, "AMZ_900_CHALLENGE_FOUND_16_02"); //Kann nur für dich hoffen, dass du sie wirklich GEFUNDEN hast.
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##						KAMPF-STAB
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info TEACHME
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_TEACHME(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 1;
	condition		= AMZ_900_Thora_TEACHME_Condition;
	information		= AMZ_900_Thora_TEACHME_Info;
	description		= "Kannst du mir den Umgang mit dem Kampfstab beibringen?";
};

func int AMZ_900_Thora_TEACHME_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_WEAPON))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_TEACHME_Info()
{
	AI_Output(hero, self, "AMZ_900_TEACHME_15_01"); //Kannst du mir den Umgang mit dem Kampfstab beibringen?
	AI_Output(self, hero, "AMZ_900_TEACHME_16_02"); //Ich könnte schon. Aber die Waffe ist schwer zu führen, nichts für Anfänger!
	AI_Output(self, hero, "AMZ_900_TEACHME_16_03"); //Solange Du kein gleichwertiger Gegner für mich bist, wäre das reine Zeitverschwendung!
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHWHAT
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_TEACHWHAT(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 1;
	condition		= AMZ_900_Thora_TEACHWHAT_Condition;
	information		= AMZ_900_Thora_TEACHWHAT_Info;
	permanent		= TRUE;
	description		= "Was muss ich tun, damit du mich am Kampfstab unterrichtest?";
};

func int AMZ_900_Thora_TEACHWHAT_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_TEACHME))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_TEACHWHAT_Info()
{
	AI_Output(hero, self, "AMZ_900_TEACHWHAT_15_01"); //Was muss ich tun, damit du mich am Kampfstab unterrichtest?
	AI_Output(self, hero, "AMZ_900_TEACHWHAT_16_02"); //Du musst dir meinen Respekt verdienen! Bisher hat das noch keiner der Gladiatoren hier geschafft.
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHNOW
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_TEACHNOW(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 1;
	condition		= AMZ_900_Thora_TEACHNOW_Condition;
	information		= AMZ_900_Thora_TEACHNOW_Info;
	description		= "Zeigst du mir jetzt den Umgang mit dem Kampfstab?";
};

func int AMZ_900_Thora_TEACHNOW_Condition()
{
	if (Thora_PlayerWonBefore)
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_TEACHNOW_Info()
{
	AI_Output(hero, self, "AMZ_900_TEACHNOW_15_01"); //Zeigst du mir jetzt den Umgang mit dem Kampfstab?
	if (B_Arena_GetGladiatorRanking(PC_Hero) == 1)
	{
		AI_Output(self, hero, "AMZ_900_TEACHNOW_16_02"); //Du hast mich in der Arena besiegt, aber vielleicht hast du nur Glück gehabt.
		AI_Output(self, hero, "AMZ_900_TEACHNOW_16_03"); //Wenn du es schaffst, mich als Champion abzulösen, werde dich in die Kunst des Kampfstabes einführen.
	}
	else
	{
		AI_Output(self, hero, "AMZ_900_TEACHNOW_16_04"); //Du hast es geschafft. Du bist Champion dieser Arena.
		AI_Output(self, hero, "AMZ_900_TEACHNOW_16_05"); //Wie versprochen werde ich dich nun im Stabkampf unterrichten. Sag mir, wenn du bereit dafür bist.
	};
};

//#####################################################################
//##
//##
//##				KAPITEL 2 (Weg zur Bergfestung)
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info NEEDTOFORTRESS
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_NEEDTOFORTRESS(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 0;
	condition		= AMZ_900_Thora_NEEDTOFORTRESS_Condition;
	information		= AMZ_900_Thora_NEEDTOFORTRESS_Info;
	permanent		= TRUE;
	description		= "Ich muss mit den Feuermagiern in der Bergfestung sprechen!";
};

func int AMZ_900_Thora_NEEDTOFORTRESS_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Thief_PROBLEM)
	&& (subChapter < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_NEEDTOFORTRESS_Info()
{
	AI_Output(hero, self, "AMZ_900_NEEDTOFORTRESS_15_01"); //Ich muss mit den Feuermagiern in der Bergfestung sprechen!
	AI_Output(self, hero, "AMZ_900_NEEDTOFORTRESS_16_02"); //Du bist ja ein Spassvogel, warum erzählst du mir das?

	Info_AddChoice(AMZ_900_Thora_NEEDTOFORTRESS, "Ich hörte, du bist eine Kundschafterin der Paladine!", AMZ_900_Thora_NEEDTOFORTRESS_NEAR);
	Info_AddChoice(AMZ_900_Thora_NEEDTOFORTRESS, "Kein Wort mehr Weib! Du wirst mich dorthinbringen.", AMZ_900_Thora_NEEDTOFORTRESS_INSULT);
	Info_AddChoice(AMZ_900_Thora_NEEDTOFORTRESS, "Diego schickt mich! Du sollst mich dorthinbringen.", AMZ_900_Thora_NEEDTOFORTRESS_DIEGO);
};

func void AMZ_900_Thora_NEEDTOFORTRESS_NEAR()
{
	Info_ClearChoices(AMZ_900_Thora_NEEDTOFORTRESS);

	AI_Output(hero, self, "AMZ_900_NEEDTOFORTRESS_NEAR_15_01"); //Ich hörte, du bist eine Kundschafterin der Paladine!
	AI_Output(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_02"); //Scheint sich ja mittlerweile herumgesprochen zu haben.
	AI_Output(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_03"); //Aber warum sollte ich dich zur Bergfestung bringen?
	AI_Output(hero, self, "AMZ_900_NEEDTOFORTRESS_NEAR_15_04"); //Es ist von grösster Wichtigkeit. Ich habe Informationen über die dämonische Bedrohung nach der die Feuermagier forschen.
	AI_StandUp(self);
	AI_TurnToNpc(self, hero);
	AI_TurnToNpc(hero, self);
	AI_Output(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_05"); //(überrascht) Was weist DU über die Dämonen?
	AI_Output(hero, self, "AMZ_900_NEEDTOFORTRESS_NEAR_15_06"); //Bringe mich zur Festung, es ist wichtig.
	AI_Output(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_07"); //Nun gut, ich werde dich an den Wachen vorbeibringen, aber ich kann dir nicht alle Türen öffnen. Du wirst allerhand Überzeugungsarbeit leisten müssen.
	B_LogEntry(CH1_DemonThreat, CH1_DemonThreat_1);
	subChapter = CH2_THORA_CONVINCED;
};

func void AMZ_900_Thora_NEEDTOFORTRESS_DIEGO()
{
	AI_Output(hero, self, "AMZ_900_NEEDTOFORTRESS_DIEGO_15_01"); //Diego schickt mich! Du sollst mich dorthinbringen.
	AI_Output(self, hero, "AMZ_900_NEEDTOFORTRESS_DIEGO_16_02"); //Ja und?? Diego hat mir garnichts zu sagen!
};

func void AMZ_900_Thora_NEEDTOFORTRESS_INSULT()
{
	Info_ClearChoices(AMZ_900_Thora_NEEDTOFORTRESS);

	AI_Output(hero, self, "AMZ_900_NEEDTOFORTRESS_INSULT_15_01"); //Kein Wort mehr Weib! Du wirst mich dorthinbringen.

	if (self.aivar[AIV_HASDEFEATEDSC])
	{
		AI_Output(self, hero, "AMZ_900_NEEDTOFORTRESS_INSULT_16_02"); //(seufzt) Sind die blauen Flecken, die ich dir verpasst habe etwa schon wieder verheilt?
		AI_Output(self, hero, "AMZ_900_NEEDTOFORTRESS_INSULT_16_03"); //Kein Problem, ich kann dir gerne ein paar neue verabreichen.
	}
	else
	{
		AI_Output(self, hero, "AMZ_900_NEEDTOFORTRESS_INSULT_16_04"); //(seufzt) Ich glaube du brauchst eine Lektion in guten Manieren.
	};

	AI_StopProcessInfos(self);
	B_AttackProper(self, hero);
};

///////////////////////////////////////////////////////////////////////
//	Info LETSGO
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_LETSGO(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 0;
	condition		= AMZ_900_Thora_LETSGO_Condition;
	information		= AMZ_900_Thora_LETSGO_Info;
	description		= "Dann lass uns zur Bergfestung aufbrechen.";
};

func int AMZ_900_Thora_LETSGO_Condition()
{
	if (subChapter >= CH2_THORA_CONVINCED)
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_LETSGO_Info()
{
	AI_Output(hero, self, "AMZ_900_LETSGO_15_01"); //Dann lass uns zur Bergfestung aufbrechen.
	AI_Output(self, hero, "AMZ_900_LETSGO_16_02"); //Ich bin bereit. Etwas Abwechslung ist mir ohnehin willkommen.
	AI_Output(self, hero, "AMZ_900_LETSGO_16_03"); //Sollten wir uns unterwegs verlieren, treffen wir uns wieder an der Arena, klar?
	AI_Output(hero, self, "AMZ_900_LETSGO_15_04"); //An der Arena! Klar!
	AI_Output(self, hero, "AMZ_900_LETSGO_16_05"); //Dann folge mir, wenn du es schaffst an mir dranzubleiben.
	B_LogEntry(CH1_DemonThreat, CH1_DemonThreat_2);

	AI_StopProcessInfos(self);
	B_SetAttitude(self, ATT_FRIENDLY);

	// 1. Abschnitt
	B_GuidePC(self, "GuideToBF", TOBF_SCAV);
	Wld_InsertNpc(Scavenger, "FP_ROAM_OW_WARAN_OC_PSI1");
	Wld_InsertNpc(Scavenger, "FP_ROAM_OW_WARAN_OC_PSI3");
	Wld_InsertNpc(Scavenger, "FP_ROAM_OW_WARAN_OC_PSI5");
};

///////////////////////////////////////////////////////////////////////
//	Info ONWAYTOBF
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_ONWAYTOBF(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 0;
	condition		= AMZ_900_Thora_ONWAYTOBF_Condition;
	information		= AMZ_900_Thora_ONWAYTOBF_Info;
	permanent		= TRUE;
	description		= "Von mir aus kanns weiter gehen!";
};

func int AMZ_900_Thora_ONWAYTOBF_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_LETSGO)
	&& !Npc_KnowsInfo(hero, AMZ_900_Thora_SQUARE))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_ONWAYTOBF_Info()
{
	AI_Output(hero, self, "AMZ_900_ONWAYTOBF_15_01"); //Von mir aus kanns weiter gehen!
	AI_Output(self, hero, "AMZ_900_ONWAYTOBF_16_02"); //Gut! Wir sind bald da!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info KILLEDSCAV
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_KILLEDSCAV(C_Info)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_KILLEDSCAV_Condition;
	information		= AMZ_900_Thora_KILLEDSCAV_Info;
	important		= TRUE;
};

func int AMZ_900_Thora_KILLEDSCAV_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_LETSGO)
	&& (Npc_GetDistToWP(self, TOBF_SCAV) < 500))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_KILLEDSCAV_Info()
{
	AI_Output(self, hero, "AMZ_900_KILLEDSCAV_16_01"); //Diese Scavanger sind wirklich lästig.
	AI_Output(self, hero, "AMZ_900_KILLEDSCAV_16_02"); //Die vermehren sich schneller, als man sie zu Essbarem verarbeiten kann.
	AI_StopProcessInfos(self);

	B_GuidePC(self, "GuideToBF", TOBF_DEMONSCAV);
	Wld_InsertNpc(ScavengerDemon, "SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
	Wld_InsertNpc(ScavengerDemon, "SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
};

///////////////////////////////////////////////////////////////////////
//	Info KILLEDDEMONSCAV
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_KILLEDDEMONSCAV(C_Info)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_KILLEDDEMONSCAV_Condition;
	information		= AMZ_900_Thora_KILLEDDEMONSCAV_Info;
	important		= TRUE;
};

func int AMZ_900_Thora_KILLEDDEMONSCAV_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_KILLEDSCAV)
	&& (Npc_GetDistToWP(self, TOBF_DEMONSCAV) < 500))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_KILLEDDEMONSCAV_Info()
{
	AI_Output(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_01"); //Verdammte dämonische Brut!
	AI_Output(hero, self, "AMZ_900_KILLEDDEMONSCAV_15_02"); //Was waren das für monströse Scavenger?
	AI_Output(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_03"); //Die Magier sagen, dies seien von Dämonen besessene Tiere.
	AI_Output(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_04"); //Viel stärker und widerstandsfähiger als normale Exemplare ihrer Art.
	AI_Output(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_05"); //Sie sollten bald was dagegen unternehmen, sonst werden sie uns noch überrollen.

	B_GuidePC(self, "GuideToBF", TOBF_RECCETOWER);
};

///////////////////////////////////////////////////////////////////////
//	Info WHATBRIDGE
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_WHATBRIDGE(C_Info)
{
	npc				= AMZ_900_Thora;
	nr				= 0;
	condition		= AMZ_900_Thora_WHATBRIDGE_Condition;
	information		= AMZ_900_Thora_WHATBRIDGE_Info;
	description		= "Was ist auf der anderen Seite der Brücke dort hinten.";
};

func int AMZ_900_Thora_WHATBRIDGE_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_KILLEDDEMONSCAV)
	&& (Npc_GetDistToWP(self, TOBF_DEMONSCAV) < 500))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_WHATBRIDGE_Info()
{
	AI_Output(hero, self, "AMZ_900_WHATBRIDGE_15_01"); //Was ist auf der anderen Seite der Brücke dort hinten.
	AI_Output(self, hero, "AMZ_900_WHATBRIDGE_16_02"); //Ein kleines Höhlensystem. Dort soll früher eine ganze Horde schwarzer Goblins gehaust haben.
	AI_Output(self, hero, "AMZ_900_WHATBRIDGE_16_03"); //Aber hüte dich vor der Höhle.
	AI_Output(hero, self, "AMZ_900_WHATBRIDGE_15_04"); //Warum?
	AI_Output(self, hero, "AMZ_900_WHATBRIDGE_16_05"); //Die untoten Gebeine dieser heimtückischen Geschöpfe streifen noch immer durch die Höhlenstollen.
	AI_Output(self, hero, "AMZ_900_WHATBRIDGE_16_06"); //Nun aber weiter.

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info RECCETOWER
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_RECCETOWER(C_Info)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_RECCETOWER_Condition;
	information		= AMZ_900_Thora_RECCETOWER_Info;
	important		= TRUE;
};

func int AMZ_900_Thora_RECCETOWER_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_KILLEDDEMONSCAV)
	&& (Npc_GetDistToWP(self, TOBF_RECCETOWER) < 500))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_RECCETOWER_Info()
{
	AI_Output(self, hero, "AMZ_900_RECCETOWER_16_01"); //Hier ist einer unserer Aussenposten.
	AI_Output(self, hero, "AMZ_900_RECCETOWER_16_02"); //Die Kundschafter halten nach Orks Ausschau und melden regelmässig alle Aktivitäten an die Paladine in der Bergfestung.
	AI_Output(hero, self, "AMZ_900_RECCETOWER_15_03"); //Euch scheint nichts zu entgehen!
	AI_Output(self, hero, "AMZ_900_RECCETOWER_16_04"); //Garwog hat noch mehr Kundschafter hier im Tal, auch ich bin einer von ihnen.
	AI_Output(hero, self, "AMZ_900_RECCETOWER_15_05"); //Wer ist Garwog?
	AI_Output(self, hero, "AMZ_900_RECCETOWER_16_06"); //Er ist der Paladin, der für die Kundschafter und Aussenposten verantwortlich ist.
	AI_Output(self, hero, "AMZ_900_RECCETOWER_16_07"); //Mein Auftraggeber, wenn du so willst.

	AI_StopProcessInfos(self);

	B_GuidePC(self, "GuideToBF", TOBF_OUTERGATE);
};

///////////////////////////////////////////////////////////////////////
//	Info OUTERGATE
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_OUTERGATE(C_Info)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_OUTERGATE_Condition;
	information		= AMZ_900_Thora_OUTERGATE_Info;
	important		= TRUE;
};

func int AMZ_900_Thora_OUTERGATE_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_RECCETOWER)
	&& (Npc_GetDistToWP(self, TOBF_OUTERGATE) < 500))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_OUTERGATE_Info()
{
	AI_Output(self, hero, "AMZ_900_OUTERGATE_16_01"); //Ab hier beginnt das abgeriegelte Gebiet der Felsenfestung. Nur Gefolgsleute des Königs dürfen es betreten.
	AI_Output(hero, self, "AMZ_900_OUTERGATE_15_02"); //Diese Torwachen dort... sind Soldaten des Königs ???
	AI_Output(self, hero, "AMZ_900_OUTERGATE_16_03"); //(zögerlich) Nicht wirklich... genau genommen sind es nur Hilfstruppen.
	AI_Output(self, hero, "AMZ_900_OUTERGATE_16_04"); //Billig angeworben und hastig ausgebildet, um den ersten Ansturm der Orks zu bremsen.
	AI_Output(self, hero, "AMZ_900_OUTERGATE_16_05"); //Sie wissen das selbst aber sie hören es nicht gerne. Also sprich sie nicht darauf an, wenn du Ärger vermeiden willst.
	AI_Output(hero, self, "AMZ_900_OUTERGATE_15_06"); //(zu sich selbst, sarkastisch) Das wird ein richtiger Spass werden.

	AI_StopProcessInfos(self);

	B_GuidePC(self, "GuideToBF", TOBF_SQUARE);
};

///////////////////////////////////////////////////////////////////////
//	Info SQUARE
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_SQUARE(C_Info)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_SQUARE_Condition;
	information		= AMZ_900_Thora_SQUARE_Info;
	important		= TRUE;
};

func int AMZ_900_Thora_SQUARE_Condition()
{
	if (Npc_KnowsInfo(hero, AMZ_900_Thora_OUTERGATE)
	&& (Npc_GetDistToWP(self, TOBF_SQUARE) < 500))
	{
		return TRUE;
	};

	return FALSE;
};

func void AMZ_900_Thora_SQUARE_Info()
{
	AI_Output(self, hero, "AMZ_900_SQUARE_16_01"); //Hier sind wir. Weiter kann ich dich nicht bringen, ab jetzt bist du auf dich allein gestellt.
	AI_Output(self, hero, "AMZ_900_SQUARE_16_02"); //Ich bin unten bei Garwog, meinen Bericht erstatten. du kannst mich dort finden, wenn du mich brauchst.

	B_LeavePC(self, "ReportToGarwog");
	B_ExchangeRoutine(PAL_1003_Garwog, "ReportFromThora");
};
