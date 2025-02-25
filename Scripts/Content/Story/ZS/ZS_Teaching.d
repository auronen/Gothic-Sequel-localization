//////////////////////////////////////////////////////////////////////////
//	ZS_Teaching
//	===========
//	Der NSC stellt sich auf einen "TEACHING"-Freepoint und gestikuliert
//////////////////////////////////////////////////////////////////////////
func void ZS_Teaching()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Teaching");

	B_SetPerception(self);
	AI_SetWalkMode(self, NPC_WALK);

	B_GotoFP(self, "TEACHING");
};

func void ZS_Teaching_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Teaching_Loop");

	B_GotoFP(self, "TEACHING");

	/*
	var int talktime;
	talktime = Hlp_Random(200);

	if (talktime < 5) { B_Say(self, NULL, "$SMALLTALK01"); AI_PlayAni(self, "T_DIALOGGESTURE_11"); }
	else if (talktime < 10) { B_Say(self, NULL, "$SMALLTALK02"); AI_PlayAni(self, "T_DIALOGGESTURE_11"); }
	else if (talktime < 15) { B_Say(self, NULL, "$SMALLTALK03"); AI_PlayAni(self, "T_DIALOGGESTURE_11"); }
	else if (talktime < 20) { B_Say(self, NULL, "$SMALLTALK04"); AI_PlayAni(self, "T_DIALOGGESTURE_11"); }
	else if (talktime < 25) { B_Say(self, NULL, "$SMALLTALK05"); AI_PlayAni(self, "T_DIALOGGESTURE_11"); }
	else if (talktime < 30) { B_Say(self, NULL, "$SMALLTALK06"); AI_PlayAni(self, "T_DIALOGGESTURE_11"); }
	else if (talktime < 35) { B_Say(self, NULL, "$SMALLTALK07"); AI_PlayAni(self, "T_DIALOGGESTURE_11"); }
	else if (talktime < 40) { B_Say(self, NULL, "$SMALLTALK08"); AI_PlayAni(self, "T_DIALOGGESTURE_11"); }
	else if (talktime < 45) { B_Say(self, NULL, "$SMALLTALK09"); }
	else if (talktime < 50) { B_Say(self, NULL, "$SMALLTALK10"); }
	else if (talktime < 55) { B_Say(self, NULL, "$SMALLTALK11"); }
	else if (talktime < 60) { B_Say(self, NULL, "$SMALLTALK12"); }
	else if (talktime < 65) { B_Say(self, NULL, "$SMALLTALK13"); }
	else if (talktime < 70) { B_Say(self, NULL, "$SMALLTALK14"); }
	else if (talktime < 75) { B_Say(self, NULL, "$SMALLTALK15"); }
	else if (talktime < 80) { B_Say(self, NULL, "$SMALLTALK16"); }
	else if (talktime < 85) { B_Say(self, NULL, "$SMALLTALK17"); }
	else if (talktime < 90) { B_Say(self, NULL, "$SMALLTALK18"); }
	else if (talktime < 95) { B_Say(self, NULL, "$SMALLTALK19"); }
	else if (talktime < 100) { B_Say(self, NULL, "$SMALLTALK20"); }
	else if (talktime < 105) { B_Say(self, NULL, "$SMALLTALK21"); }
	else if (talktime < 110) { B_Say(self, NULL, "$SMALLTALK22"); }
	else if (talktime < 115) { B_Say(self, NULL, "$SMALLTALK23"); }
	else if (talktime < 120) { B_Say(self, NULL, "$SMALLTALK24"); };
	*/
	var int guardreaktion;
	guardreaktion = Hlp_Random(1000);

	if (guardreaktion >= 900)
	{
		AI_PlayAni(self, "T_DIALOGGESTURE_11");
	}
	else if (guardreaktion >= 800)
	{
		AI_PlayAni(self, "T_DIALOGGESTURE_15");
	}
	else if (guardreaktion >= 700)
	{
		AI_PlayAni(self, "T_DIALOGGESTURE_16");
	}
	else if (guardreaktion >= 600)
	{
		AI_PlayAni(self, "T_DIALOGGESTURE_18");
	}
	else if (guardreaktion >= 500)
	{
		AI_PlayAni(self, "T_DIALOGGESTURE_21");
	}
	else if (guardreaktion >= 400)
	{
		AI_PlayAni(self, "T_DIALOGGESTURE_20");
	};

	AI_Wait(self, 1);
};

func void ZS_Teaching_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Teaching_End");
};
