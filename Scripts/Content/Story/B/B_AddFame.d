///////////////////////////////////////////////////////////////////////////////////////////
//	B_AddFame
//	=========
//	Für folgendes bekommt der Spieler Fame-Punkte (FP):
//	- Sylvester ohne Bezahlung zur Erzhöhle beim Alten Lager führen (1 FP)
//	- (Fall 2)
//	- ...
///////////////////////////////////////////////////////////////////////////////////////////
func void B_AddFame(var int amount)
{
	PrintDebugNpc(PD_ZS_FRAME, "B_AddFame");

	//-------- Anhebung --------
	Hero_Fame = Hero_Fame + amount;

	//-------- Bildschirmausgabe --------
	//PrintScreen(_STR_MESSAGE_ADDFAME, -1, _YPOS_MESSAGE_ADDFAME, FONT_OLD_SMALL, _TIME_MESSAGE_ADDFAME);
};
