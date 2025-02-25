//#################################################################################
//#################################################################################
//
//	Mobsi BROKEN - Objekte die optisch defekt sind und nicht benutzt werden können
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_BROKEN_CONDITION()
{
	PrintDebugMobsi("MOB_BROKEN_CONDITION");
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_CAULDRON;

	if (Npc_IsPlayer(self))
	{
		_ = PrintScreen(_STR_MESSAGE_MOBSI_BROKEN, -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
		AI_PlayAni(self, "T_DONTKNOW");
		PrintDebugMobsi("...FALSE");
		return FALSE;
	}
	else
	{
		PrintDebugMobsi(PD_TRUE);
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_BROKEN_S0()
{
	PrintDebugMobsi("MOB_BROKEN_S0");
};

func void MOB_BROKEN_S1()
{
	PrintDebugMobsi("MOB_BROKEN_S1");
};
