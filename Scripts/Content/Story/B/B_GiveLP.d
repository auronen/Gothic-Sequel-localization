func void B_GiveLP(var int add_lp)
{
	PrintDebugNpc(PD_ZS_FRAME, "B_GiveLP");

	//----------------------------------------------------------------------------
	hero.LP = hero.LP + add_lp;

	//----------------------------------------------------------------------------
	var string msg;
	msg = NAME_LPGained;
	msg = ConcatStrings(msg, IntToString(add_lp));
	_ = AI_PrintScreen(self, msg, -1, _YPOS_MESSAGE_LPGAINED, FONT_OLD_SMALL, _TIME_MESSAGE_LPGAINED, TEXT_COLOR_WHITE);
};
