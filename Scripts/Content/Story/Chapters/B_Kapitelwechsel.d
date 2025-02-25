// **************
// Kapitelwechsel
// **************

func void B_Kapitelwechsel(var int new_chapter)
{
	//-------- checken, ob Kapitel bereits initialisiert wurde ? --------
	if (chapter == new_chapter)
	{
		return;
	};

	//-------- Kapitelvariable setzen --------
	chapter = new_chapter;

	//***************************************************************************
	//KAPITEL 1
	//***************************************************************************
	if (new_chapter == 1)
	{
		PrintDebugNpc(PD_MISSION, "---=== DAS ERSTE KAPITEL ===---");

		//-------- Org --------
		IntroduceChapter("Kapitel 1", "Die Rückkehr", "chapter1.tga", "levelup.wav", 5000);
		subChapter = CH1_START;

		//-------- Händler befüllen --------
		B_Give_Agon_ChapterItems(new_chapter);
		B_Give_Gerion_ChapterItems(new_chapter);
		B_Give_Gotmar_ChapterWeapons(new_chapter);
		B_Give_Helvegor_ChapterItems(new_chapter);
		B_Give_Isgar_ChapterItems(new_chapter);
		B_Give_Lakarus_ChapterItems(new_chapter);
	};

	//***************************************************************************
	//KAPITEL 2
	//***************************************************************************
	if (new_chapter == 2)
	{
		PrintDebugNpc(PD_MISSION, "---=== DAS ZWEITE KAPITEL ===---");

		//-------- Org --------
		IntroduceChapter("Kapitel 2", "Der Aufbruch", "chapter2.tga", "levelup.wav", 5000);
		subChapter = CH2_START;

		//-------- Händler befüllen --------
		B_Give_Agon_ChapterItems(new_chapter);
		B_Give_Gerion_ChapterItems(new_chapter);
		B_Give_Gotmar_ChapterWeapons(new_chapter);
		B_Give_Helvegor_ChapterItems(new_chapter);
		B_Give_Isgar_ChapterItems(new_chapter);
		B_Give_Lakarus_ChapterItems(new_chapter);
	};
};
