/////////////////////////////////////////////////////////////////
//	B_MurderTeller(JP)
//	===================
//
//	-MurderTeller sind die Charactere, die auf Mord ebzug nehmen
//	sollen, wenn der Spieler sie anspricht, die Funktion liefert True,
//	wenn einer der storymäßigen "Mordbewerter" die self.instnce ist
//	-bisher wird die Funktion in ZS_Talk verwendet, um den Dialog für
//	Morde nur bei den Nscs zuzulassen, wenn sie bezug nehmen sollen
///////////////////////////////////////////////////////////////////

func int B_MurderTeller()
{
	PrintDebugNpc(PD_ZS_CHECK, "B_MurderTeller");
	if (Hlp_StrCmp(self.name, "Milten"))
	{
		PrintDebugNpc(PD_ZS_CHECK, "B_MurderTeller ... Milten");
		return TRUE;
	};

	if (Hlp_StrCmp(self.name, "Lester"))
	{
		PrintDebugNpc(PD_ZS_CHECK, "B_MurderTeller ...Lester");
		return TRUE;
	};

	if (Hlp_StrCmp(self.name, "Gorn"))
	{
		PrintDebugNpc(PD_ZS_CHECK, "B_MurderTeller ... Gorn");
		return TRUE;
	};

	if (Hlp_StrCmp(self.name, "Diego"))
	{
		PrintDebugNpc(PD_ZS_CHECK, "B_MurderTeller ...Diego");
		return TRUE;
	};

	return FALSE;
};
