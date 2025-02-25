//////////////////////////////////////////////////////////////////////////
//	B_AssessQuietSound
//	==================
//	Wird aufgerufen durch:
//
//	- PERC_ASSESSQUIETSOUND
//
//	aufgerufen.
//
//	Funktion:
//	Schrittgeräusche des SCs und der SC nicht sichtbar	-> ZS_AssessQuietSound
//////////////////////////////////////////////////////////////////////////
func void B_AssessQuietSound()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_AssessQuietSound");

	PrintGlobals(PD_ZS_FRAME);

	if (Snd_IsSourceNpc(self))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Geräuschquelle ist SC!");

		if (other.guild == GIL_MEATBUG) 		//Gehörter SC gerade ein Meatbug?
		{
			return;
		};

		if (!Npc_CanSeeSource(self))
		{
			PrintDebugNpc(PD_ZS_CHECK, "...kann Geräuschquelle nicht sehen!");
			B_AssessSC();
		};
	};
};
