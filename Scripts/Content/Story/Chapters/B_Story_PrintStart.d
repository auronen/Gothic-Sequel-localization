//////////////////////////////////////////////////////////////////////////
//	B_Story_PrintStart.d
//	====================
//	Gibt eine Bildschirmausgabe aus, die den Start des Spieles einleitet.
//
//	Verwendung z.B. um spezielle Zwischenreleases und Demo-Versionen
//	zu kennzeichnen
//////////////////////////////////////////////////////////////////////////
func void B_Story_PrintStart()
{
	_ = AI_PrintScreen(self, _STR_MESSAGE_GAMESTART, -1, -1, FONT_OLD_BIG, _TIME_MESSAGE_GAMESTART, TEXT_COLOR_WHITE);
};
