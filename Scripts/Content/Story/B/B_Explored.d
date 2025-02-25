///////////////////////////////////////////////////////////////////////////////////////////
//	B_Explored
//	==========
//	Diese Funktion wird aufgerufen, wenn ein verborgener Ort vom Spieler entdeckt wurde
//	- Gibt eine Bildschirmmeldung aus
//	- spielt ein Jingle ab
//	- Addiert XP für den Spieler
///////////////////////////////////////////////////////////////////////////////////////////
func void B_Explored(var int xp)
{
	PrintDebugNpc(PD_ZS_FRAME, "B_Explored");

	//-------- Bildschirmausgabe --------
	_ = PrintScreen(_STR_MESSAGE_EXPLO, -1, _YPOS_MESSAGE_EXPLO, FONT_OLD_BIG, _TIME_MESSAGE_EXPLO);

	//-------- Jingle --------
	Snd_Play("Goodie");

	//-------- XPs für den Spieler --------
	B_GiveXP(xp);
};
