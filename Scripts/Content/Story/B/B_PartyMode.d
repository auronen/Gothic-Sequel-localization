//////////////////////////////////////////////////////////////////////////
//	Enthält Funktionen, um den Partymode für NSCs ein- bzw. auszuleiten
//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
//	B_FollowPC
//	==========
//	Der NSC 'slf' schliesst sich dem Spieler als Partymitglied an und folgt ihm.
//	Verliert der Spieler den NSC aus den Augen, wartet der NSC am Treffpunkt
//	der im Tagesablauf 'ta' angegeben ist.
//////////////////////////////////////////////////////////////////////////////////
func void B_FollowPC(var C_Npc slf, var string TA)
{
	Npc_ExchangeRoutine(slf, TA);

	slf.aivar[AIV_PARTYMEMBER] = TRUE;
};

//////////////////////////////////////////////////////////////////////////////////
//	B_GuidePC
//	=========
//	Der NSC 'slf' schliesst sich dem Spieler als Partymitglied an und führt ihn
//	zum Wegpunkt 'dest'.
//	Verliert der Spieler den NSC aus den Augen, wartet der NSC am Treffpunkt
//	der im Tagesablauf 'ta' angegeben ist.
//////////////////////////////////////////////////////////////////////////////////
func void B_GuidePC(var C_Npc slf, var string TA, var string dest)
{
	PrintDebugString(PD_TA_DETAIL, "dest: ", dest);
	PrintDebugString(PD_TA_DETAIL, "GuidePC_Destination (davor): ", GuidePC_Destination);
	GuidePC_Destination = ConcatStrings(dest, "");			// Zielpunkt festlegen
	PrintDebugString(PD_TA_DETAIL, "GuidePC_Destination (danach): ", GuidePC_Destination);

	Npc_ExchangeRoutine(slf, TA);

	slf.aivar[AIV_PARTYMEMBER] = TRUE;
};

//////////////////////////////////////////////////////////////////////////////////
//	B_LeavePC
//	=========
//	Der NSC 'slf' verlässt die Party des Spielers, die mit B_FollowPC() oder
//	B_GuidePC() eingeleitet wurde und nimmt seinen Tagesablauf 'ta' auf.
//////////////////////////////////////////////////////////////////////////////////
func void B_LeavePC(var C_Npc slf, var string TA)
{
	Npc_ExchangeRoutine(slf, TA);

	slf.aivar[AIV_PARTYMEMBER] = FALSE;
};
