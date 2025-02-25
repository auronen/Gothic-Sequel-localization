//MISSION ITEMS_2

instance ItWr_Morogh_List(C_Item)
{
	name						= "Liste von Morogh";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ItWr_Morogh_List;

	value						= 0;

	description					= name;
	text[0]						= "Liste mit Zutaten ";							count[0] = 0;
	text[1]						= "die Morogh benötigt";						count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
};

const string ItWr_Morogh_List_1 = "Folgende Zutaten werden alsbald gebraucht:";
const string ItWr_Morogh_List_2 = "9 Fläschchen reinster klarer Alkohol ";
const string ItWr_Morogh_List_3 = "7 Gewächse von der Art der Nachtschatten";
const string ItWr_Morogh_List_4 = "8 frische Steinwurzeln";

func void Use_ItWr_Morogh_List()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);

	Doc_SetPage(nDocID, 0, "letters.TGA", 0);

				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);

				Doc_PrintLine	(nDocID, 0, ItWr_Morogh_List_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Morogh_List_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Morogh_List_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Morogh_List_4);

	Doc_Show(nDocID);
};
