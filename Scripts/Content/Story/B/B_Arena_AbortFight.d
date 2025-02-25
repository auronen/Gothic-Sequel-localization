//////////////////////////////////////////////////////////////////////////
//	B_Arena_AbortFight
//	===================
//	Wird ausgeführt, wenn der Kampf wegen Regelverletzungen abgebrochen
//	werden muss!
//////////////////////////////////////////////////////////////////////////
func void B_Arena_AbortFight(var int reason)
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Arena_AbortFight");

	if (reason == AF_PLAYERSTOLEWEAPON)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...player stole weapon!");

		Arena_PlayerStoleWeapon = TRUE;
		Arena_AbortFight = TRUE;

		return;
	};

	if (reason == AF_PLAYERUSEDMAGIC)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...player used magic!");

		Arena_PlayerUsedMagic = TRUE;
		Arena_AbortFight = TRUE;

		return;
	};

	if (reason == AF_PLAYERUSEDBOW)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...player used ranged weapon!");

		Arena_PlayerUsedBow = TRUE;
		Arena_AbortFight = TRUE;

		return;
	};

	if (reason == AF_PLAYERKILLED)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...player killed!");

		Arena_PlayerKilled = TRUE;
		Arena_AbortFight = TRUE;

		return;
	};
};
