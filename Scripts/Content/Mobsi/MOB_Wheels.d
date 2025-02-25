//////////////////////////////////////////////////////////////////////////
//	MOB_Wheels
//	==========
//	Sperrt die Drehkreuze für die Tore des alten Lagers
//////////////////////////////////////////////////////////////////////////
func int MOB_OCWHEEL_CONDITION()
{
	PrintDebugCh(PD_ITEM_MOBSI, "### MOB_OCWHEEL_CONDITION");
	PrintGlobals(PD_ITEM_MOBSI);

	AI_PlayAni(self, "T_DONTKNOW");
	_ = PrintScreen(_STR_MESSAGE_WHEEL_JAMMED, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
	return FALSE;
};

func void MOB_OCWHEEL_S0()
{
	PrintDebugCh(PD_ITEM_MOBSI, "### MOB_OCWHEEL_S0");
};

func void MOB_OCWHEEL_S1()
{
	PrintDebugCh(PD_ITEM_MOBSI, "### MOB_OCWHEEL_S1");
};
