//////////////////////////////////////////////////////////////////////////
//	B_AssessBody
//	============
//	NEU: Diese Funktion wird in der Human-AI nicht mehr durch eine
//	Wahrnehmung, sonder AUSSCHLIEßLICH am Ende eines Kampfes aufgerufen.
//	Nur der "Defeater"/"Murderer" checkt den bewußtlosen/toten Körper
//	seines Opfers. Alle anderen ignorieren den Körper. Folgende Elemente
//	die ohnehin nicht sehr transparent waren, wurden entfernt:
//	- Streit mehrerer NSC um das Plündern des bewußtlosen/toten Körpers
//	- Checken der "Wichtig-Gilden" auf gestohlene Items im/am Körper
//	- Erzeugen einer MURDER-News mit Täter "unbekannt" (bei Leichen)
//	- Bedauern von Toten Kameraden (bei Leichen)
//	- NSCs wecken bewutlose Freunde auf
//////////////////////////////////////////////////////////////////////////
func void B_AssessBody()
{
	PrintDebugNpc(PD_ZS_FRAME, "B_AssessBody");
	PrintGlobals(PD_ZS_CHECK);

	if (Npc_GetDistToNpc(self, other) < 1000)
	{
		PrintDebugNpc(PD_ZS_CHECK, "...Körper näher als 10m!");
		B_FullStop(self);
		AI_StartState(self, ZS_AssessBody, 0, "");
	};
};
