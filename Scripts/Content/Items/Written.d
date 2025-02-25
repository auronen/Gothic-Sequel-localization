/******************************************************************************************/
instance ItWr_Book_Circle_01(C_Item)
{
	name						= "Der erste Kreis";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Book_Circle_01;

	value						= 50;

	description					= "Der erste Kreis der Magie";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Book_Circle_01_1 = "Erster Kreis";
const string ItWr_Book_Circle_01_2 = "Als die Götter den Menschen die Fähigkeit zur Magie schenkten, schenkten sie ihnen auch das Wissen magische Runen herzustellen. Die Diener der Götter haben die ehrenvolle Aufgabe übernommen, diese Artefakte göttlicher Macht zu erschaffen und zu benutzen, wobei der Kreis des Magiers bestimmt, welche Zauber er in der Lage ist zu verstehen und anzuwenden. ";
const string ItWr_Book_Circle_01_3 = "Licht";
const string ItWr_Book_Circle_01_4 = "Das erste Geschenk Innos an die Menschen.Eine hell strahlende Kugel wird über dem Magier erzeugt.";
const string ItWr_Book_Circle_01_5 = "Eispfeil";
const string ItWr_Book_Circle_01_6 = "Ein Geschoss aus magischer Energie.";
const string ItWr_Book_Circle_01_7 = "Feuerpfeil";
const string ItWr_Book_Circle_01_8 = "Ein Geschoss aus magischem Feuer.";

func void UseItWr_Book_Circle_01()
{
	var int nDocID;
	var string Text;
	Text = ConcatStrings(NAME_Manakosten, IntToString(SPL_SENDCAST_LIGHT));
	var string Text_1;
	Text_1 = ConcatStrings(NAME_Manakosten, IntToString(SPL_SENDCAST_THUNDERBOLT));
	var string Text_2;
	Text_2 = ConcatStrings(NAME_Manakosten, IntToString(SPL_SENDCAST_FIREBOLT));

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Circle_01_1);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_Circle_01_2);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_01_3);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_01_4);
				Doc_PrintLine	(nDocID, 1, Text);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_01_5);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_01_6);
				Doc_PrintLine	(nDocID, 1, Text_1);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_01_7);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_01_8);
				Doc_PrintLine	(nDocID, 1, Text_2);

	Doc_Show(nDocID);
};

/******************************************************************************************/

instance ItWr_Book_Circle_02(C_Item)
{
	name						= "Der zweite Kreis";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Book_Circle_02;

	value						= 100;

	description					= "Der zweiter Kreis der Magie";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Book_Circle_02_1 = "Zweiter Kreis";
const string ItWr_Book_Circle_02_2 = "Alle Zauber werden durch die magische Energie des Anwenders ausgelöst.Der Anwender wird als Magier bezeichnet.";
const string ItWr_Book_Circle_02_3 = "Jede Aktivierung eines Zaubers kostet den Magier einen Teil seiner Kraft. diese Kraft wird als Mana bezeichnet.";
const string ItWr_Book_Circle_02_4 = "Heilung";
const string ItWr_Book_Circle_02_5 = "Adanos sah, das die Menschen starben und das es der Wille Beliars war.Und er sprach:Stelle ich mich auch nicht gegen den Willen Beliars,gebe ich den Menschen jedoch die Macht der Heilung.";
const string ItWr_Book_Circle_02_6 = "Dieser Zauber birgt die Macht, den Magier zu heilen.";
const string ItWr_Book_Circle_02_7 = "Investierungszauber";

func void UseItWr_Book_Circle_02()
{
	var int nDocID;

	var string Text_1;
	Text_1 = ConcatStrings(NAME_Manakosten, IntToString(SPL_HEALING_HP_PER_MP));

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Circle_02_1);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_Circle_02_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_Circle_02_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_02_4);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_02_5);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_02_6);
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_02_7);
				Doc_PrintLine	(nDocID, 1, Text_1);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");

	Doc_Show(nDocID);
};

/******************************************************************************************/
instance ItWr_Book_Circle_03(C_Item)
{
	name						= "Der dritte Kreis";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Book_Circle_03;

	value						= 150;

	description					= "Der dritte Kreis der Magie";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Book_Circle_03_1 = "Dritter Kreis";
const string ItWr_Book_Circle_03_2 = "Manche Zauber können mit einer bestimmten größeren Anzahl von magischer Energie gespeist werden, diese werden auch Aufladungszauber genannt.";
const string ItWr_Book_Circle_03_3 = "Andere Zauber werden aufrechterhalten, solange der Magier sein Mana in dieses Spruch einfliessen lässt. Solche Zauber heissen Investierungszauber.";
const string ItWr_Book_Circle_03_4 = "Feuerball";
const string ItWr_Book_Circle_03_5 = "Das zweite Geschenk Innos an die Kinder des Feuers. Ein Ball aus Feuer, der sein Opfer verbrennt";
const string ItWr_Book_Circle_03_6 = "Auladbarer Zauber";
const string ItWr_Book_Circle_03_7 = "Eisblock";
const string ItWr_Book_Circle_03_8 = "Das Opfer wird in einen Eisblock eingefroren. Ein Zauber aus dem Tempel der Wassermagier";
const string ItWr_Book_Circle_03_9 = "Kugelblitz";
const string ItWr_Book_Circle_03_10 = "Eine Kugel, geschaffen aus magischer Energie.";

func void UseItWr_Book_Circle_03()
{
	var int nDocID;
	var string Text;
	Text = ConcatStrings(NAME_Manakosten, IntToString(SPL_SENDCAST_FIREBALL));
	var string Text_1;
	Text_1 = ConcatStrings(NAME_Manakosten, IntToString(SPL_SENDCAST_ICECUBE));
	var string Text_2;
	Text_2 = ConcatStrings(NAME_Manakosten, IntToString(SPL_SENDCAST_THUNDERBALL));

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Circle_03_1);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_Circle_03_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_Circle_03_3);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_03_4);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_03_5);
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_03_6);
				Doc_PrintLine	(nDocID, 1, Text);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_03_7);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_03_8);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, Text_1);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_03_9);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_03_10);
				Doc_PrintLine	(nDocID, 1, Text_2);
	Doc_Show(nDocID);
};

/******************************************************************************************/
instance ItWr_Book_Circle_04(C_Item)
{
	name						= "Der vierte Kreis";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Book_Circle_04;

	value						= 200;

	description					= "Der vierte Kreis der Magie";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Book_Circle_04_1 = "Vierter Kreis";
const string ItWr_Book_Circle_04_2 = "Die Magie ";
const string ItWr_Book_Circle_04_3 = "der Teleportation";
const string ItWr_Book_Circle_04_4 = "Das besondere an diesen magischen Formeln ist, das sie, obwohl als Runen geschaffen,von jedem der magische Energie in sich trägt gesprochen werden können.Die Magie die diese Formeln umgibt, kann sofort aktiviert werden. Es gibt keine Einschränkungen für Teleportationszauber.";
const string ItWr_Book_Circle_04_5 = "Feuersturm	";
const string ItWr_Book_Circle_04_6 = "Ähnlich dem Feuerball wirkt dieser Zauber auf einen Gegner, springt von dort aus jedoch auf weitere Gegner über.";
const string ItWr_Book_Circle_04_7 = "Aufladbarer Zauber";
const string ItWr_Book_Circle_04_8 = "Blitz";
const string ItWr_Book_Circle_04_9 = " Der Zauber springt auf mehrere Opfer über. Die Kraft des Blitzes ist schwer zu kontrollieren, so das der Magier selbst Opfer werden kann";
const string ItWr_Book_Circle_04_10 = "Untote vernichten";
const string ItWr_Book_Circle_04_11 = "Die Geschöpfe der Finsternis werden mit diesem Zauber verbannt.";

func void UseItWr_Book_Circle_04()
{
	var int nDocID;
	var string Text;
	Text = ConcatStrings(NAME_Manakosten, IntToString(SPL_SENDCAST_FIRESTORM));
	var string Text_1;
	Text_1 = ConcatStrings(NAME_Manakosten, IntToString(SPL_ZAPPED_DAMAGE_PER_SEC));
	var string Text_2;
	Text_2 = ConcatStrings(NAME_Manakosten, IntToString(SPL_SENDCAST_DESTROYUNDEAD));

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Circle_04_1);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Circle_04_2);
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Circle_04_3);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_Circle_04_4);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)

				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_04_5);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_04_6);
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_04_7);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, Text);
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_04_8);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_04_9);
				Doc_PrintLine	(nDocID, 1, Text_1);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_04_10);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_04_11);
				Doc_PrintLine	(nDocID, 1, Text_2);

	Doc_Show(nDocID);
};

/******************************************************************************************/
instance ItWr_Book_Circle_05(C_Item)
{
	name						= "Der fünfte Kreis";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Book_Circle_05;

	value						= 250;

	description					= "Der fünfte Kreis der Magie";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Book_Circle_05_1 = "Fünfter Kreis";
const string ItWr_Book_Circle_05_2 = "Feuerregen";
const string ItWr_Book_Circle_05_3 = "Die Macht des göttlichen Feuers trifft jedes Lebewesen im Wirkungsbreich des Magiers.";
const string ItWr_Book_Circle_05_4 = "Eiswelle	";
const string ItWr_Book_Circle_05_5 = "Ein Feld aus magischem Eis erstreckt sich über alle Gegner und friert diese für einen kurzen Zeitraum ein. Während dieser Zeit sind die Opfer bewegungsunfähig und erleiden Schaden. ";
const string ItWr_Book_Circle_05_6 = "Ein Zauber aus dem Tempel der Wassermagier.";

func void UseItWr_Book_Circle_05()
{
	var int nDocID;
	var string Text_1;
	Text_1 = ConcatStrings(NAME_Manakosten, IntToString(SPL_SENDCAST_FIRERAIN));
	var string Text_2;
	Text_2 = ConcatStrings(NAME_Manakosten, IntToString(SPL_SENDCAST_ICEWAVE));

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Circle_05_1);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Circle_05_2);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_Circle_05_3);
				Doc_PrintLine	(nDocID, 0, Text_1);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_05_4);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_05_5);
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_05_6);
				Doc_PrintLine	(nDocID, 1, Text_2);

	Doc_Show(nDocID);
};

instance ItWr_Book_Circle_06(C_Item)
{
	name						= "Der sechste Kreis";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Book_Circle_06;

	value						= 300;

	description					= "Sechster Kreis der Magie";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Book_Circle_06_1 = "Sechster Kreis";
const string ItWr_Book_Circle_06_2 = "Todeshauch";
const string ItWr_Book_Circle_06_3 = "Der Atem Beliars. Eine Wolke aus Lebenverschlingendem Nichts, die jedes Wesen augenblicklich töten kann.";
const string ItWr_Book_Circle_06_4 = "Todesring";
const string ItWr_Book_Circle_06_5 = "Nicht viel ist überliefert über die Rune mit der Macht von URIZIEL ";
const string ItWr_Book_Circle_06_6 = "Es ist nur soviel bekannt, als das sie Beliars Mächte in sich birgt.";

func void UseItWr_Book_Circle_06()
{
	var int nDocID;
	var string Text;
	Text = ConcatStrings(NAME_Manakosten, IntToString(SPL_SENDCAST_BREATHOFDEATH));

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Circle_06_1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Circle_06_2);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_Circle_06_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Text);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Circle_06_4);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_06_5);
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Circle_06_6);
				Doc_PrintLine	(nDocID, 1, "");

	Doc_Show(nDocID);
};
