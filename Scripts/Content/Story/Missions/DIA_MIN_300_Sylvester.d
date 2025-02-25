///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance Info_Sylvester_EXIT(C_Info)
{
	npc				= MIN_300_Sylvester;
	nr				= 999;
	condition		= Info_Sylvester_EXIT_Condition;
	information		= Info_Sylvester_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Info_Sylvester_EXIT_Condition()
{
	return TRUE;
};

func void Info_Sylvester_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##						KAPITEL 1
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance MIN_300_Sylvester_HOWDY(C_Info)
{
	npc				= MIN_300_Sylvester;
	nr				= 10;
	condition		= MIN_300_Sylvester_HOWDY_Condition;
	information		= MIN_300_Sylvester_HOWDY_Info;
	permanent		= TRUE;
	description		= "Wie geht es so?";
};

func int MIN_300_Sylvester_HOWDY_Condition()
{
	return TRUE;
};

func void MIN_300_Sylvester_HOWDY_Info()
{
	AI_Output(hero, self, "MIN_300_HOWDY_15_01"); //Wie geht es so?

	if (Npc_KnowsInfo(hero, Info_Sylvester_CAVE))
	{
		if (Sylvester_Friend)
		{
			AI_Output(self, hero, "MIN_300_HOWDY_03_02"); //Dank dir kann ich nun endlich wieder mein Essen selbst verdienen!
		}
		else
		{
			AI_Output(self, hero, "MIN_300_HOWDY_03_03"); //Naja, ich kann jetzt weiss ich zwar wo eine neue Erzader ist, aber du hast mich ganz schön dafür bluten lassen!
		};
	}
	else
	{
		AI_Output(self, hero, "MIN_300_HOWDY_03_04"); //Schlecht! Ich habe zur Zeit keine Arbeit! Und jetzt lass mich in Ruhe!
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PICK
///////////////////////////////////////////////////////////////////////
instance Info_Sylvester_PICK(C_Info)
{
	npc				= MIN_300_Sylvester;
	nr				= 8;
	condition		= Info_Sylvester_PICK_Condition;
	information		= Info_Sylvester_PICK_Info;
	description		= "Nette Spitzhacke, die du da hast!";
};

func int Info_Sylvester_PICK_Condition()
{
	if (Npc_HasItems(self, ItMw_Pickaxe)
	&& Npc_KnowsInfo(hero, Info_Gotmar_PICK2))
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Sylvester_PICK_Info()
{
	AI_Output(hero, self, "Info_Sylvester_PICK_15_01"); //Nette Spitzhacke, die du da hast!
	AI_Output(self, hero, "Info_Sylvester_PICK_03_02"); //Pah! Wenn ich blos Verwendung dafür hätte...
	AI_Output(hero, self, "Info_Sylvester_PICK_15_03"); //Wie meinst du das?
	AI_Output(self, hero, "Info_Sylvester_PICK_03_04"); //Der einzige Ort, wo ich meine Silber verdienen kann ist die Mine im Norden.
	AI_Output(self, hero, "Info_Sylvester_PICK_03_05"); //Aber meine Kumpels haben den Eingang verrammelt, wegen der Orks die sich da rumtreiben.
	AI_Output(self, hero, "Info_Sylvester_PICK_03_06"); //Jetzt sitze ich hier und kann zusehen, wo ich mein Mittagessen herbekomme.

	Info_ClearChoices(Info_Sylvester_PICK);
	Info_AddChoice(Info_Sylvester_PICK, "Ich kenne einen anderen Ort, an dem du Erz finden kannst.", Info_Sylvester_PICKCAVE);
	Info_AddChoice(Info_Sylvester_PICK, "Dann könntest du mir ja deine Spitzhacke überlassen.", Info_Sylvester_PICKGIVE);
};

func void Info_Sylvester_PICKGIVE()
{
	AI_Output(hero, self, "Info_Sylvester_PICKGIVE_15_01"); //Dann könntest du mir ja deine Spitzhacke überlassen.
	AI_Output(self, hero, "Info_Sylvester_PICKGIVE_03_02"); //Ich bin zwar ohne Arbeit aber nicht ohne Verstand.
	AI_Output(self, hero, "Info_Sylvester_PICKGIVE_03_03"); //Wenn du meine Spitzhacke haben willst, will ich Silber sehen!

	Info_ClearChoices(Info_Sylvester_PICK);

	Sylvester_BuyPick = TRUE;
};

func void Info_Sylvester_PICKCAVE()
{
	AI_Output(hero, self, "Info_Sylvester_PICKCAVE_15_01"); //Ich kenne einen anderen Ort, an dem du Erz finden kannst.
	AI_Output(self, hero, "Info_Sylvester_PICKCAVE_03_02"); //Was sagst du da? Eine neue Erzader? Wo kann ich sie finden?

	Info_ClearChoices(Info_Sylvester_PICK);
	Info_AddChoice(Info_Sylvester_PICK, "Das kostet dich aber 'ne Kleinigkeit", Info_Sylvester_PICKCOST);
	Info_AddChoice(Info_Sylvester_PICK, "Komm mit, ich führe dich hin.", Info_Sylvester_PICKCOME);
};

func void Info_Sylvester_PICKCOME()
{
	AI_Output(hero, self, "Info_Sylvester_PICKCOME_15_01"); //Komm mit, ich führe dich hin.
	AI_Output(self, hero, "Info_Sylvester_PICKCOME_03_02"); //Du bist echt in Ordnung. Nichts wie los!

	B_FollowPC(self, "FOLLOW");
	AI_StopProcessInfos(self);

	Sylvester_Friend = TRUE;
};

func void Info_Sylvester_PICKCOST()
{
	AI_Output(hero, self, "Info_Sylvester_PICKCOST_15_01"); //Das kostet dich aber 'ne Kleinigkeit
	AI_Output(self, hero, "Info_Sylvester_PICKCOST_03_02"); //Du bist ein echt eigennütziger Kerl.
	AI_Output(self, hero, "Info_Sylvester_PICKCOST_03_03"); //Aber ich habe keine Wahl.
	AI_Output(self, hero, "Info_Sylvester_PICKCOST_03_04"); //Wenn ich nicht bald eine neue Erzader finde, kann ich mich zu dem bettelnden Lumpenpack gesellen.
	AI_Output(hero, self, "Info_Sylvester_PICKCOST_15_05"); //Tja, jeder ist sich selbst der nächste!
	AI_Output(self, hero, "Info_Sylvester_PICKCOST_03_06"); //OK. wenn du mir die Erzader zeigst, geb ich dir meine Spitzhacke.
	AI_Output(self, hero, "Info_Sylvester_PICKCOST_03_07"); //Hab' noch eine Reservehacke im Rucksack.

	Info_ClearChoices(Info_Sylvester_PICK);
	Info_AddChoice(Info_Sylvester_PICK, "Also wenn du keine Wahl hast, kannst du auch noch was drauflegen!", Info_Sylvester_PICKCOSTNO);
	Info_AddChoice(Info_Sylvester_PICK, "Die Spitzhacke ist OK.", Info_Sylvester_PICKCOSTYES);
};

func void Info_Sylvester_PICKCOSTYES()
{
	AI_Output(hero, self, "Info_Sylvester_PICKCOSTYES_15_01"); //Die Spitzhacke ist OK.
	AI_Output(self, hero, "Info_Sylvester_PICKCOSTYES_03_02"); //Hier, und nun zeig mir den Weg zur Ader.

	B_GiveInvItems(self, hero, ItMw_Pickaxe, 1);
	B_FollowPC(self, "FOLLOW");
	AI_StopProcessInfos(self);
};

func void Info_Sylvester_PICKCOSTNO()
{
	AI_Output(hero, self, "Info_Sylvester_PICKCOSTNO_15_01"); //Also wenn du keine Wahl hast, kannst du auch noch was drauflegen!

	Sylvester_Silver = Npc_HasItems(self, ItMi_Silver);
	if (Sylvester_Silver > 0)
	{
		AI_Output(self, hero, "Info_Sylvester_PICKCOSTNO_03_02"); //Ich seh schon, du bist auch nicht besser als die anderen Halsabschneider hier.
		AI_Output(self, hero, "Info_Sylvester_PICKCOSTNO_03_03"); //OK, OK, ich kann dir noch das bischen Silber dazugeben, dass ich habe.

		Info_ClearChoices(Info_Sylvester_PICK);
		Info_AddChoice(Info_Sylvester_PICK, "Vergiss es. Ich bin nicht interessiert!", Info_Sylvester_PICKCOSTNONO);
		Info_AddChoice(Info_Sylvester_PICK, "Behalt dein Silber. Die Spitzhacke reicht.", Info_Sylvester_PICKCOSTYES);
		Info_AddChoice(Info_Sylvester_PICK, "OK, das Geschäft gilt!", Info_Sylvester_PICKCOSTNOSILVER);
	}
	else
	{
		AI_Output(self, hero, "Info_Sylvester_PICKCOSTNO_03_04"); //Ich besitzte sonst nichts von Wert.
		AI_Output(self, hero, "Info_Sylvester_PICKCOSTNO_03_05"); //Zeigst du mir die Ader trotzdem?

		Info_ClearChoices(Info_Sylvester_PICK);
		Info_AddChoice(Info_Sylvester_PICK, "Vergiss es. Ich bin nicht interessiert!", Info_Sylvester_PICKCOSTNONO);
		Info_AddChoice(Info_Sylvester_PICK, "Die Spitzhacke ist OK. Ich führ dich zur Ader.", Info_Sylvester_PICKCOSTYES);
	};
};

func void Info_Sylvester_PICKCOSTNOSILVER()
{
	AI_Output(hero, self, "Info_Sylvester_PICKCOSTNOSILVER_15_01"); //OK, das Geschäft gilt!
	AI_Output(self, hero, "Info_Sylvester_PICKCOSTNOSILVER_03_02"); //Du bist ein übler Gauner! Ich sollte die anderen Leute hier vor dir warnen.
	AI_Output(self, hero, "Info_Sylvester_PICKCOSTNOSILVER_03_03"); //Hier ist meine Spitzhacke.
	B_GiveInvItems(self, hero, ItMw_Pickaxe, 1);
	AI_Output(self, hero, "Info_Sylvester_PICKCOSTNOSILVER_03_04"); //Nun führe mich wie abgemacht zur Erzader, dort bekommst du dann das Silber.

	Sylvester_Blackmailer = TRUE;
	B_AddDarkPoints(1);

	B_FollowPC(self, "FOLLOW");
	AI_StopProcessInfos(self);
};

func void Info_Sylvester_PICKCOSTNONO()
{
	AI_Output(hero, self, "Info_Sylvester_PICKCOSTNONO_15_01"); //Vergiss es. Ich bin nicht interessiert!
	AI_Output(self, hero, "Info_Sylvester_PICKCOSTNONO_03_02"); //Immer diese Aufschneider. Wahrscheinlich gibt es die Ader überhaupt nicht.
	AI_Output(self, hero, "Info_Sylvester_PICKCOSTNONO_03_03"); //Ist wohl ohnehin besser, wenn ich meine Hacke behalte. Wer weiss wann die Orks sich von der Mine verziehen.
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BUYPICK
///////////////////////////////////////////////////////////////////////
instance Info_Sylvester_BUYPICK(C_Info)
{
	npc				= MIN_300_Sylvester;
	nr				= 10;
	condition		= Info_Sylvester_BUYPICK_Condition;
	information		= Info_Sylvester_BUYPICK_Info;
	permanent		= TRUE;
	description		= B_BuildBuyString!(NAME_Pickaxe, SYLVESTER_PRICEPICKAXE);
};

func int Info_Sylvester_BUYPICK_Condition()
{
	if (Npc_HasItems(self, ItMw_Pickaxe)
	&& Sylvester_BuyPick)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Sylvester_BUYPICK_Info()
{
	if (Npc_HasItems(hero, ItMi_Silver) >= SYLVESTER_PRICEPICKAXE)
	{
		AI_Output(self, hero, "Info_Sylvester_BUYPICK_03_01"); //OK, hier hast du die Hacke. Konnte die mühselige Schürferei eh nie leiden.

		B_GiveInvItems(hero, self, ItMi_Silver, SYLVESTER_PRICEPICKAXE);
		B_GiveInvItems(self, hero, ItMw_Pickaxe, 1);
		Info_Sylvester_BUYPICK.permanent = FALSE;
	}
	else
	{
		AI_Output(self, hero, "Info_Sylvester_BUYPICK_03_02"); //Verarsch mich nicht! Besorg erst das Silber, dann kannst du auch die Hacke haben.
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info CAVE
///////////////////////////////////////////////////////////////////////
instance Info_Sylvester_CAVE(C_Info)
{
	npc				= MIN_300_Sylvester;
	condition		= Info_Sylvester_CAVE_Condition;
	information		= Info_Sylvester_CAVE_Info;
	important		= TRUE;
};

func int Info_Sylvester_CAVE_Condition()
{
	if (Npc_GetDistToWP(hero, "OW_CAVE1_OREWOLF_4") < 400)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Sylvester_CAVE_Info()
{
	AI_GotoNpc(self, hero);

	AI_Output(self, hero, "Info_Sylvester_CAVE_03_01"); //Unglaublich, hier gibt es tatsächlich Erz.

	if (Sylvester_Friend)
	{
		AI_Output(self, hero, "Info_Sylvester_CAVE_03_02"); //Danke nochmal. Leute wie dich gibt es hier sehr wenige.
		AI_Output(self, hero, "Info_Sylvester_CAVE_03_03"); //Wenn du etwas Erz brauchst, komm vorbei. Ich kann bestimmt mal ein paar Brocken abzweigen.

		B_SetAttitude(self, ATT_FRIENDLY);
		Sylvester_LastOre = Wld_GetDay() - 1;
		B_AddFame(1);
		B_GiveXP(XP_Sylvester_OreCave_Friendly);
		B_LogEntry(CH1_LearnSmith, CH1_LearnSmith_1);
	}
	else
	{
		if (Sylvester_Blackmailer)
		{
			AI_Output(self, hero, "Info_Sylvester_CAVE_03_04"); //Hier ist das Silber! Hoffentlich erstickst du daran, du Erpresser!
			B_GiveInvItems(self, hero, ItMi_Silver, Sylvester_Silver);
		};

		B_GiveXP(XP_Sylvester_OreCave_selfish);
	};

	if (Npc_IsInRoutine(self, ZS_PickOre))
	{
		AI_Output(self, hero, "Info_Sylvester_CAVE_03_05"); //Dann werde ich mich mal gleich an die Arbeit machen.
	}
	else
	{
		AI_Output(self, hero, "Info_Sylvester_CAVE_03_06"); //Es ist schon spät. Ich werde mich noch etwas ausruhen und mich morgen früh dann an die Arbeit machen.
	};

	B_LeavePC(self, "PICK");
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GIVEORE
///////////////////////////////////////////////////////////////////////
instance Info_Sylvester_GIVEORE(C_Info)
{
	npc				= MIN_300_Sylvester;
	nr				= 15;
	condition		= Info_Sylvester_GIVEORE_Condition;
	information		= Info_Sylvester_GIVEORE_Info;
	permanent		= TRUE;
	description		= "Hast du etwas Erz übrig?";
};

func int Info_Sylvester_GIVEORE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Sylvester_CAVE)
	&& Sylvester_Friend)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Sylvester_GIVEORE_Info()
{
	AI_Output(hero, self, "Info_Sylvester_GIVEORE_15_01"); //Hast du etwas Erz übrig?

	if (Sylvester_LastOre != Wld_GetDay())
	{
		AI_Output(self, hero, "Info_Sylvester_GIVEORE_03_02"); //Klar. Kannst ein paar Brocken haben, hier!

		B_GiveInvItems(self, hero, ItMi_OreNugget, SYLVESTER_DAILYORE);
		Sylvester_LastOre = Wld_GetDay();
	}
	else
	{
		AI_Output(self, hero, "Info_Sylvester_GIVEORE_03_03"); //Kann heute leider nichts mehr entbehren, aber vielleicht morgen wieder!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BUYPICKFRIEND
///////////////////////////////////////////////////////////////////////
instance Info_Sylvester_BUYPICKFRIEND(C_Info)
{
	npc				= MIN_300_Sylvester;
	nr				= 12;
	condition		= Info_Sylvester_BUYPICKFRIEND_Condition;
	information		= Info_Sylvester_BUYPICKFRIEND_Info;
	description		= "Hast du eine Spitzhacke für mich?";
};

func int Info_Sylvester_BUYPICKFRIEND_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Sylvester_CAVE)
	&& Sylvester_Friend)
	{
		return TRUE;
	};

	return FALSE;
};

func void Info_Sylvester_BUYPICKFRIEND_Info()
{
	AI_Output(hero, self, "Info_Sylvester_BUYPICKFRIEND_15_01"); //Hast du eine Spitzhacke für mich?

	if (Npc_HasItems(self, ItMw_Pickaxe) >= 2)
	{
		AI_Output(self, hero, "Info_Sylvester_BUYPICKFRIEND_03_02"); //Ich hab noch eine Reservehacke, die kannst du haben. Hier nimm!

		B_GiveInvItems(self, hero, ItMw_Pickaxe, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Sylvester_BUYPICKFRIEND_03_03"); //Ich habe nur noch diese eine Hacke. Tut mir leid!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BLOODORE
///////////////////////////////////////////////////////////////////////
instance MIN_300_Sylvester_BLOODORE(C_Info)
{
	npc				= MIN_300_Sylvester;
	nr				= 1;
	condition		= MIN_300_Sylvester_BLOODORE_Condition;
	information		= MIN_300_Sylvester_BLOODORE_Info;
	description		= "Ich bin auf der Suche nach Bluterz!";
};

func int MIN_300_Sylvester_BLOODORE_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Psionic_FINDBLOODORE))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIN_300_Sylvester_BLOODORE_Info()
{
	AI_Output(hero, self, "MIL_101_BLOODORE_15_01"); //Ich bin auf der Suche nach Bluterz!
	AI_Output(self, hero, "MIL_101_BLOODORE_03_02"); //In der Mine gibt es eine Bluterzader. Allerdings ist dieses besondere Erz sehr selten. Warum willst du das wissen?
	AI_Output(hero, self, "MIL_101_BLOODORE_15_03"); //Ich brauche Bluterz, um einen Runenstein zu gießen.
	AI_Output(self, hero, "MIL_101_BLOODORE_03_04"); //Damit kenne ich mich nicht aus, aber ich besitze noch ein paar Brocken.
	AI_Output(self, hero, "MIL_101_BLOODORE_03_05"); //Ich schlage dir ein Geschäft vor.
	AI_Output(hero, self, "MIL_101_BLOODORE_15_06"); //Was für ein Geschäft?
	AI_Output(self, hero, "MIL_101_BLOODORE_03_07"); //Ich brauche eine bessere Waffe, eines dieser handlichen Kurzschwerter!
	AI_Output(self, hero, "MIL_101_BLOODORE_03_08"); //Aber Gotmar verkauft seine Waffen nur an die Miliz.
	AI_Output(self, hero, "MIL_101_BLOODORE_03_09"); //Wenn du mir ein Kurzschwert besorgst, bekommst du mein Bluterz.

	Info_AddChoice(MIN_300_Sylvester_BLOODORE, "Vergiss es!", MIN_300_Sylvester_BLOODORE_NO);
	Info_AddChoice(MIN_300_Sylvester_BLOODORE, "Ich schau mal, ob ich ein Kurzschwert bekomme", MIN_300_Sylvester_BLOODORE_YES);
	Info_AddChoice(MIN_300_Sylvester_BLOODORE, "Ich überlege es mir", MIN_300_Sylvester_BLOODORE_MAYBE);
};

func void MIN_300_Sylvester_BLOODORE_MAYBE()
{
	AI_Output(hero, self, "MIL_101_BLOODORE_MAYBE_15_01"); //Ich überlege es mir.
	AI_Output(self, hero, "MIL_101_BLOODORE_MAYBE_03_02"); //Wenn du ein Kurzschwert hast, tausche ich es gegen mein Bluterz.

	Sylvester_Sword = LOG_RUNNING;

	B_LogEntry(CH1_Bloodore, CH1_Bloodore_1);

	Info_ClearChoices(MIN_300_Sylvester_BLOODORE);
};

func void MIN_300_Sylvester_BLOODORE_YES()
{
	AI_Output(hero, self, "MIL_101_BLOODORE_YES_15_01"); //Ich schau mal, ob ich ein Kurzschwert bekomme
	AI_Output(self, hero, "MIL_101_BLOODORE_YES_03_02"); //Gut, wenn du eins hast, bekommst du mein Bluterz.

	Sylvester_Sword = LOG_RUNNING;

	B_LogEntry(CH1_Bloodore, CH1_Bloodore_1);

	Info_ClearChoices(MIN_300_Sylvester_BLOODORE);
};

func void MIN_300_Sylvester_BLOODORE_NO()
{
	AI_Output(hero, self, "MIL_101_BLOODORE_NO_15_01"); //Vergiss es!
	AI_Output(self, hero, "MIL_101_BLOODORE_NO_03_02"); //Dann gibt's auch kein Bluterz!

	Sylvester_Sword = LOG_OBSOLETE;

	Info_ClearChoices(MIN_300_Sylvester_BLOODORE);
};

///////////////////////////////////////////////////////////////////////
//	Info SWORD
///////////////////////////////////////////////////////////////////////
instance MIL_101_Sylvester_Sword(C_Info)
{
	npc				= MIN_300_Sylvester;
	nr				= 23;
	condition		= MIL_101_Sylvester_Sword_Condition;
	information		= MIL_101_Sylvester_Sword_Info;
	description		= "Ich habe ein Kurzschwert für dich";
};

func int MIL_101_Sylvester_Sword_Condition()
{
	if ((Sylvester_Sword == LOG_RUNNING)
	&& Npc_HasItems(hero, ItMw_Shortsword))
	{
		return TRUE;
	};

	return FALSE;
};

func void MIL_101_Sylvester_Sword_Info()
{
	AI_Output(hero, self, "MIL_101_SWORD_15_01"); //Ich habe ein Kurzschwert für dich.

	B_GiveInvItems(hero, self, ItMw_Shortsword, 1);
	B_GiveInvItems(self, hero, ItMi_BloodOreNugget, 30);

	AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMw_Shortsword);
	AI_PlayAni(self, "T_1HSINSPECT");
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");

	_ = AI_EquipBestMeleeWeapon(self); //Kurzschwert anlegen

	AI_Output(self, hero, "MIL_101_SWORD_03_02"); //Ausgezeichnet. Hier, nimm mein Bluterz. Wenn du noch mehr brauchst, dann sprich mal mit Wylfern.
	AI_Output(self, hero, "MIL_101_SWORD_03_03"); //Er ist Rekrut bei der Miliz und war vorher auch in der Mine.

	_ = Npc_RemoveInvItems(self, ItMi_BloodOreNugget, 30);

	B_LogEntry(CH1_Bloodore, CH1_Bloodore_2);

	Sylvester_Sword = LOG_SUCCESS;
};
