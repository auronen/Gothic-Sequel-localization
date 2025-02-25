func void ZS_Dead()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_Dead");
	PrintGlobals(PD_ZS_CHECK);

	C_ZSInit();

	self.aivar[AIV_PLUNDERED] = FALSE;

	//-------- Textausgabe --------
	if (Npc_IsPlayer(self))
	{
		var string msg;
		var int random;
		random = Hlp_Random(13);
		if (random == 0) { msg = _STR_MESSAGE_DEATH0; };
		if (random == 1) { msg = _STR_MESSAGE_DEATH1; };
		if (random == 2) { msg = _STR_MESSAGE_DEATH2; };
		if (random == 3) { msg = _STR_MESSAGE_DEATH3; };
		if (random == 4) { msg = _STR_MESSAGE_DEATH4; };
		if (random == 5) { msg = _STR_MESSAGE_DEATH5; };
		if (random == 6) { msg = _STR_MESSAGE_DEATH6; };
		if (random == 7) { msg = _STR_MESSAGE_DEATH7; };
		if (random == 8) { msg = _STR_MESSAGE_DEATH8; };
		if (random == 9) { msg = _STR_MESSAGE_DEATH9; };
		if (random == 10) { msg = _STR_MESSAGE_DEATH10; };
		if (random == 11) { msg = _STR_MESSAGE_DEATH11; };
		if (random == 12) { msg = _STR_MESSAGE_DEATH12; };
		_ = PrintScreen(msg, -1, -1, FONT_OLD_BIG, _TIME_MESSAGE_DEATH);
	};

	//-------- Erfahrungspunkte für den Spieler ? --------
	//SN: VORSICHT, auch in B_MagicHurtNpc() vorhanden!
	if (Npc_IsPlayer(other)
	|| (C_NpcIsHuman(other) && other.aivar[AIV_PARTYMEMBER])
	|| (C_NpcIsMonster(other) && other.aivar[AIV_MM_PARTYMEMBER]))
	{
		B_DeathXP();	// vergibt XP an SC
	};

	if (C_NpcIsMonster(self))
	{
		B_GiveDeathInv(); 	// für Monster
	};
};
