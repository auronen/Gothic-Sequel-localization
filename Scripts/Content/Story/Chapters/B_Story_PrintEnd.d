//////////////////////////////////////////////////////////////////////////
//	B_Story_PrintEnd.d
//	==================
//	Gibt eine Bildschirmausgabe aus, die das Ende des Spieles kennzeichnen.
//
//	Verwendung z.B. um das (vorzeitige) Ende von speziellen
//	Zwischenreleases und Demo-Versionen zu kennzeichnen
//////////////////////////////////////////////////////////////////////////
func void B_Story_PrintEnd()
{
	_ = AI_PrintScreen(self, _STR_MESSAGE_GAMEEND, -1, -1, FONT_OLD_BIG, _TIME_MESSAGE_GAMEEND, TEXT_COLOR_WHITE);
};
