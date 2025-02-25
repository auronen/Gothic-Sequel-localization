///////////////////////////////////////////////////////////////////////////////////////////
//	B_AddDarkPoints
//	===============
//	Jedesmal, wenn der Spieler eine "miese" Tat macht, bekommt er einen Darkpoint (DP):
//
//	Verwendung:
//	- Sylvesters missliche Lage ausnutzen und alles Silber aus ihm herauspressen (1 DP)
//	- (Fall 1)
//	- (Fall 2)
//	- ...
///////////////////////////////////////////////////////////////////////////////////////////
func void B_AddDarkPoints(var int amount)
{
	PrintDebugNpc(PD_ZS_FRAME, "B_AddDarkPoints");

	//-------- Anhebung --------
	Hero_DarkPoints = Hero_DarkPoints + amount;

	//-------- Bildschirmausgabe --------
	//PrintScreen(_STR_MESSAGE_ADDDARKPOINTS, -1, _YPOS_MESSAGE_ADDDARKPOINTS, FONT_OLD_SMALL, _TIME_MESSAGE_ADDDARKPOINTS);
};
