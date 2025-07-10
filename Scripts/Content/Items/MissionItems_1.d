//---------------------------------------------------------------------
//	Missionsmünzen, damit Leichen liegenbleiben
//---------------------------------------------------------------------
instance ItMi_Coin(C_Item)
{
	name						= "alte Münze";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_Stuff_OldCoin_01.3DS";
	material					= MAT_METAL;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

//---------------------------------------------------------------------
//	Botschaft von Xardas (versiegelt)
//---------------------------------------------------------------------
instance ItWr_Xardas_Letter_Sealed(C_Item)
{
	name						= "Botschaft von Xardas";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_Xardas_Letter_Sealed;

	value						= 0;

	description					= name;
	text[0]						= "Dies ist die Borschaft, die mir Xardas";		count[0] = 0;
	text[1]						= "für Diego mitgab.";							count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "Sie ist versiegelt!";						count[3] = 0;
};

const string Xardas_Letter_1 = "Diego";
const string Xardas_Letter_2 = "Die dämonischen Mächte bereiten die Rückkehr des Schläfers vor! Verschanzt in der Bergfeste, mit den Paladinen und dem König, wollen die Feuermagier die Gefahr abzuwenden. Doch sie haben nichts bewirkt. Grenzenloser Hochmut macht sie blind.";
const string Xardas_Letter_3 = "Wie du siehst, ist der Zerstörer der Barriere nicht tot. Er war im Tempel verschüttet, ohne Bewusstsein, lange Zeit. Schwach und untrainiert habe ich ihn zu dir geschickt. Ein Schatten seiner selbst. Doch ist er unsere einzige Hoffnung den Schläfer endgültig zu vernichten!";
const string Xardas_Letter_4 = "Schicke ihn mit dieser Nachricht zu den Feuermagiern, sobald er bereit ist. Er wird ihnen helfen, den richtigen Weg zu erkennen!";
const string Xardas_Letter_5 = "               Xardas";

func void Use_Xardas_Letter()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);

	Doc_SetPage(nDocID, 0, "letters.TGA", 0);

				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID, 0, Xardas_Letter_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Xardas_Letter_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Xardas_Letter_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Xardas_Letter_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Xardas_Letter_5);

	Doc_Show(nDocID);

	Diego_LetterRead = TRUE;
};

func void Use_Xardas_Letter_Sealed()
{
	CreateInvItem(hero, ItWr_Xardas_Letter);

	Use_Xardas_Letter();
};

//---------------------------------------------------------------------
//	Botschaft von Xardas (geöffnet)
//---------------------------------------------------------------------
instance ItWr_Xardas_Letter(C_Item)
{
	name						= "Botschaft von Xardas";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Xardas_Letter;

	value						= 0;

	description					= name;
	text[0]						= "Dies ist die Borschaft, die mir Xardas";		count[0] = 0;
	text[1]						= "für Diego mitgab.";							count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "Das Siegel ist gebrochen!";					count[3] = 0;
};

/*******************************************************************************************/
// Teleport4(nur Scrolls)

instance ItArScrollTeleport4(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItAr_Scroll_39.3DS";	//lila Punkt + gelber Punkt
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TELEPORT;
	spell						= SPL_TELEPORT4;

	description					= "Teleport zum Lager";
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TELEPORT;
};

// Buch der Diebe: Schlösser
instance ItWr_Book_Thief_01(C_Item)
{
	name						= "Diebeskunst";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_01.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Book_Thief_01;

	value						= 200;

	description					= "Über Schlösser und Mechanismen";
	//text[5]					= ;
	//count[5]					= ;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string ItWr_Book_Thief_01_1 = "Schlösser und Mechanismen ";
const string ItWr_Book_Thief_01_2 = "Von M. Fingers ";
const string ItWr_Book_Thief_01_3 = "5 Jahre Meister der Diebesgilde";
const string ItWr_Book_Thief_01_4 = "Derweil werden verschiedene Mechaniken, ausgeklügelte Systematiken und raffinierte Kombinatorik verwendet, um Schlösser sicher zu machen gegen fremden Eingriff. Eine der immer noch gängigsten Methoden der Kombinatorik ist die Multimechanik. Besonders bekannt bei Türen und Truhen, sorgen sie mit offensichtlich simplem System dafür, das der Zugang nur dem gestattet ist, der auch rechtmäßigen Zugang besitzt. ";
const string ItWr_Book_Thief_01_5 = "Während die Öffnung durch ein Links/Rechts System verschlossen ist, dem sich der entsprechende Schüssel automatisch anpasst, so sorgen Gewinde, Fassungen und kleine Rädchen dafür, das ein fremder Gegenstand bei einer Bewegung in die falsche Richtung abbricht. Eine solche Rechts/Links Kombiantion besteht in der Regel aus entweder vier, sechs, acht oder sogar zehn Richtungsbewegungen. Nur ein guter Dieb wird seine Dietriche bewahren. Weniger gute Diebe bleiben jedoch immer auf der Suche nach neuen Dietrichen, weil durch ihre fehlerhafte Arbeit immer wieder Dietriche abbrechen. ";

func void UseItWr_Book_Thief_01()
{
	var int nDocID;

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Thief_01_1);
																		// -1 -> all pages

				Doc_PrintLine	(nDocID, 0, ItWr_Book_Thief_01_2);
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Thief_01_3);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_Thief_01_4);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)

				Doc_PrintLines	(nDocID, 1, ItWr_Book_Thief_01_5);

	Doc_Show(nDocID);
};

instance ItKe_Smith_01(C_Item)
{
	name						= "Schlüssel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	owner						= MIL_103_Berengar;
	//owner						= ;
	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= "Schmiedelager";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

instance ItWr_RECIPE_01(C_Item)
{
	name						= "Rezept";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Rezept";										count[1] = 0;
	text[2]						= "zur Herstellung";							count[2] = 0;
	text[3]						= "heilender und kräftigender";					count[3] = 0;
	text[4]						= "Essenzen";									count[4] = 0;
};

instance ItWr_Smith_Art_01(C_Item)
{
	name						= "Schmiedekunst";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_04.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Ein Buch über";								count[1] = 0;
	text[2]						= " die Kunst des Schmiedens ";					count[2] = 0;
	text[3]						= "von H. Mer";									count[3] = 0;
};

instance ItMi_Miss_Candel_01(C_Item)
{
	name						= "Kerzenständer";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_Stuff_Candel_01.3DS";
	material					= MAT_METAL;

	value						= 20;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

instance ItWr_Book_Thief_02(C_Item)
{
	name						= "Geheimnisse der Nacht";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_01.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Book_Thief_02;

	value						= 200;

	description					= name;
	//text[5]					= ;
	//count[5]					= ;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string ItWr_Book_Thief_02_1 = "Geheimnisse der Nacht ";
const string ItWr_Book_Thief_02_2 = "Der Ring der Gewandtheit";
const string ItWr_Book_Thief_02_3 = "Die Macht des Ringes wurde gestärkt mit der Kraft des Windes, der Stille der Nacht und der Beweglichkeit des Schattens. Ein Wunderwerk aus feiner Schmiedekunst und  Zauberei . Geschmiedet in den Höhlen von Nordmar, verzaubert in den Hallen der Weisheit, gewährt der Ring seinem Träger eine höhere Geschicklichkeit. ";
const string ItWr_Book_Thief_02_4 = "Getragen wurde es bisher von:";
const string ItWr_Book_Thief_02_5 = "Nantanuel Gildenmeister von Khorinis";
const string ItWr_Book_Thief_02_6 = "Tomas 3 Finger";
const string ItWr_Book_Thief_02_7 = "Ilgur Silberauge";
const string ItWr_Book_Thief_02_8 = "Michal Meister der Hände";
const string ItWr_Book_Thief_02_9 = "Raul die Katze";
const string ItWr_Book_Thief_02_10 = "M. Fingers Gefangener in der Barriere";
const string ItWr_Book_Thief_02_11 = "Diego";
const string ItWr_Book_Thief_02_12 = "Edo Flinkhand";

func void UseItWr_Book_Thief_02()
{
	var int nDocID;

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Thief_02_1);
																		// -1 -> all pages

				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Book_Thief_02_2);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_Thief_02_3);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)

				Doc_PrintLines	(nDocID, 1, ItWr_Book_Thief_02_4);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Thief_02_5);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Thief_02_6);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Thief_02_7);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Thief_02_8);
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Thief_02_9);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, ItWr_Book_Thief_02_10);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Thief_02_11);
				Doc_PrintLine	(nDocID, 1, ItWr_Book_Thief_02_12);

	Doc_Show(nDocID);
};

//---------------------------------------------------------------------
//	Edo's Schlüssel
//---------------------------------------------------------------------
instance ItKe_Edo(C_Item)
{
	name						= "Edo's Schlüssel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	owner						= MIL_103_Berengar;
	//owner						= ;
	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "Dieser Schlüssel öffnet die Truhe in";		count[0] = 0;
	text[1]						= "Edo's Hütte.";								count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

//---------------------------------------------------------------------
//	Bartok's Schlüssel
//---------------------------------------------------------------------
instance ItKe_Bartok(C_Item)
{
	name						= "Bartok's Schlüssel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "Dieser Schlüssel öffnet die große Truhe";	count[0] = 0;
	text[1]						= "in der Burgschmiede des Alten Lagers.";		count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

instance ItAr_ScrollHeal_Copy(C_Item)
{
	name						= "Zauber der Heilung";

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItAr_Scroll_01.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_HEALING_HP_PER_MP;

	on_state[0]					= UseItAr_ScrollHeal_Copy;

	value						= 50;

	description					= "Heilung";
	//text	[0]					= NAME_Mag_Circle;								count	[0] = mag_circle;
	//text[3]					= "";											count[3] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= "Heilung pro Mana";							count[1] = SPL_HEALING_HP_PER_MP;
	text[2]						= NAME_Mana_needed;								count[2] = SPL_HEALING_HP_PER_MP;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Invest;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseItAr_ScrollHeal_Copy()
{
	_ = PrintScreen(PRINT_Scroll_Copy, -1, -1, FONT_OLD_BIG, 2);
};

instance ItAr_ScrollLight_Copy(C_Item)
{
	name						= "Zauber des Lichts";

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItAr_Scroll_32.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_LIGHT;

	on_state[0]					= UseItAr_ScrollLight_Copy;

	value						= 5;

	description					= "Licht";
	//text	[0]					= NAME_Mag_Circle;								count	[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_LIGHT;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseItAr_ScrollLight_Copy()
{
	_ = PrintScreen(PRINT_Scroll_Copy, -1, -1, FONT_OLD_BIG, 2);
};

//---------------------------------------------------------------------
//	Halvor's Rezept
//---------------------------------------------------------------------
instance ItWr_HalvorRecipe(C_Item)
{
	name						= "Halvor's Kochbuch";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	owner						= MIL_100_Halvor;
	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Recipe_Meat;

	value						= Value_RecipeMeat;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Halvor's Kochbuch mit einer";				count[1] = 0;
	text[2]						= "Reihe schmackhafter Rezepte";				count[2] = 0;
	text[3]						= "aus Fleisch.";								count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//---------------------------------------------------------------------
//	Halvor's Schlüssel
//---------------------------------------------------------------------
instance ItKe_Halvor(C_Item)
{
	name						= "Halvor's Schlüssel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "Dieser Schlüssel öffnet die Zutatentruhe in";count[0] = 0;
	text[1]						= "Halvor's Küche.";							count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

//---------------------------------------------------------------------
//	Kerkerschlüssel
//---------------------------------------------------------------------
instance ItKe_Jail(C_Item)
{
	name						= "Kerkerschlüssel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "Der Schlüssel für die ";						count[0] = 0;
	text[1]						= "Kerkerzellen ";								count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

//---------------------------------------------------------------------
//	Müffelsalz
//---------------------------------------------------------------------
const int Value_StinkingSalt = 50;
//---------------------------------------------------------------------

instance ItMi_StinkingSalt(C_Item)
{
	name						= "Müffelsalz";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_Alchemy_Salt_01.3DS";
	material					= MAT_CLAY;

	value						= Value_StinkingSalt;

	description					= name;
	text[0]						= "Ein wirklich übelriechendes";				count[0] = 0;
	text[1]						= "bräunliches Salz.";							count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

//---------------------------------------------------------------------
//	Bessesene Heilen Schriftrolle
//---------------------------------------------------------------------

instance ItAr_ScrollHealPossessed(C_Item)
{
	name						= "alte Rezeptur";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_STONE;

	value						= 500;

	description					= "versiegelte Schriftrolle";
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "Sie ist versiegelt, aber";					count[0] = 0;
	text[1]						= "es scheint die Rezeptur zu";					count[1] = 0;
	text[2]						= "sein die Talamon sucht";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//---------------------------------------------------------------------
//	Schlafwein THF Mission
//---------------------------------------------------------------------
instance ItFo_SleepWine(C_Item)
{
	name						= "Schlafwein";

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItFo_Wine_01.3ds";
	material					= MAT_LEATHER;

	scemeName					= "POTION";
	on_state[0]					= UseSleepWine;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

func void UseSleepWine()
{
};

//---------------------------------------------------------------------
//	Tagebuchseite von Nefarius
//---------------------------------------------------------------------
instance ItWr_Nefarius_Diary(C_Item)
{
	name						= "Tagebuch-Seite";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Nefarius_Diary;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Eine stark verwitterte Seite, deren Schrift man";count[1] = 0;
	text[2]						= "kaum noch entziffern kann.";					count[2] = 0;
	text[3]						= "Der ehemalige Besitzer scheint Nefarius der";count[3] = 0;
	text[4]						= "Wassermagier gewesen zu sein.";				count[4] = 0;
};

const string Nefarius_Diary_1 = "107. Tag";
const string Nefarius_Diary_2 = "Milten und unser einstiger Held haben uns heute schmählich verraten! Sie haben hinter unserem Rücken die magische Energie aus dem grossen Erzhaufen in irgendein altes Artefakt gesaugt. All unsere Hoffnungen auf ein Entkommen aus der Barriere sind jetzt endgültig zerstört!";
const string Nefarius_Diary_3 = "129. Tag";
const string Nefarius_Diary_4 = "Das Unglück ist über uns hereingebrochen! Obwohl die magische Barriere plötzlich verschwand, wurde unser Lager von schwersten Beben fast zerstört. Alle hier haben den Verstand verloren und massakrieren sich gegenseitig. Ich muss weg von hier...";
const string Nefarius_Diary_5 = "130. Tag";
const string Nefarius_Diary_6 = "Wir werden heute nacht bei Cavelorn in seiner Hütte bleiben, und morgen weiterziehen. Ich hoffe nur, dass keine Orkhorden mehr durch diese Gegend ziehen...";

func void Use_Nefarius_Diary()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);

				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);
				Doc_PrintLine	(nDocID, 0, Nefarius_Diary_1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLines	(nDocID, 0, Nefarius_Diary_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);
				Doc_PrintLine	(nDocID, 0, Nefarius_Diary_3);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLines	(nDocID, 0, Nefarius_Diary_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);
				Doc_PrintLine	(nDocID, 0, Nefarius_Diary_5);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLines	(nDocID, 0, Nefarius_Diary_6);

	Doc_Show(nDocID);
};

//---------------------------------------------------------------------
//	Notiz von Bullit
//---------------------------------------------------------------------
instance ItWr_Bullit_Note(C_Item)
{
	name						= "Notiz von Bullit";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Bullit_Note;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Eine stark verwitterte Seite, deren Schrift man";count[1] = 0;
	text[2]						= "kaum noch entziffern kann.";					count[2] = 0;
	text[3]						= "Der ehemalige Besitzer scheint ein Gardist";	count[3] = 0;
	text[4]						= "Namens Bullit gewesen zu sein.";				count[4] = 0;
};

const string Bullit_Note_1 = "Notiz";
const string Bullit_Note_2 = "Gomez ist wahnsinnig geworden! Er will doch tatsächlich,dass wir Gardisten alle Feuermagier hinterrücks umbringen, nur weil Corristo, dieser Narr von Erzmagier, sich offen gegen ihn ausgesprochen hat.";
const string Bullit_Note_3 = "Besser ich schaffe einige Vorräte beiseite. Für schlechte Zeiten. Man kann nie wissen was kommt.";

func void Use_Bullit_Note()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);

	Doc_SetPage(nDocID, 0, "letters.TGA", 0);

				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);
				Doc_PrintLine	(nDocID, 0, Bullit_Note_1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLines	(nDocID, 0, Bullit_Note_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Bullit_Note_3);

	Doc_Show(nDocID);
};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 1
//---------------------------------------------------------------------
instance ItWr_Phoenix1(C_Item)
{
	name						= "Die Spur des Phoenix";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Phoenix1;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Ein vergilbtes Buch mit brüchigen Seiten.";	count[1] = 0;
	text[2]						= "Sein Verfasser scheint ein Feuermagier";		count[2] = 0;
	text[3]						= "mit Namen Corristo gewesen zu sein.";		count[3] = 0;
};

const string Phoenix1_1 = "Spur des Phoenix";
const string Phoenix1_2 = "Der Sturm zieht auf. Ich weiss es und kann doch nicht dagegen ankämpfen. Ich selbst verhalf einst dem Sturm zu seiner Macht und sonnte mich in seinem Glanz. Doch nun ist der Bund mit dem Sturm zum Pakt mit dem Teufel geworden und meine Seele ist verloren.";
const string Phoenix1_3 = "Doch das Feuer wird weiterbestehen, muss weiterbestehen. Sein  Wissen wird sich erheben wie ein Phoenix aus der Asche. Derjenige, der gewillt ist, der Spur des Phoenix zu folgen, wird die Wiederauferstehung des Wissens über das Feuer erleben.";
const string Phoenix1_4 = "Die Spur des Phoenix beginnt in den tiefsten Tiefen seines runden Hortes. Dort, wo der Bund mit dem Sturm begann liegt die Asche des Phoenix begraben.";

func void Use_Phoenix1()
{
	var int nDocID;
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, Phoenix1_1);
				Doc_PrintLine	(nDocID, 0, "------------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLines	(nDocID, 0, Phoenix1_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix1_3);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Phoenix1_4);

	Doc_Show(nDocID);

	if (Phoenix_State == 0)
	{
		Log_CreateTopic(CH1_Phoenix, LOG_MISSION);
		Log_SetTopicStatus(CH1_Phoenix, LOG_RUNNING);
		B_LogEntry(CH1_Phoenix, CH1_Phoenix_1);
		Wld_InsertItem(ItWr_Phoenix2, "FP_SPAWN_PHOENIX_2");

		Phoenix_State = 1;
	};
};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 2
//---------------------------------------------------------------------
instance ItWr_Phoenix2(C_Item)
{
	name						= "Die Asche des Phoenix";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Phoenix2;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Dies ist der zweite Teil der";				count[1] = 0;
	text[2]						= "rätselhaften Spur des Phoenix";				count[2] = 0;
	text[3]						= "die Corristo verfasst hat.";					count[3] = 0;
};

const string Phoenix2_1 = "Die Asche des";
const string Phoenix2_2 = "Phoenix";
const string Phoenix2_3 = "Einst, als ich den Kindern des Sturmes zur Macht verhalf, fegten sie ihre Unterdrücker hinweg. Doch ihre Grausamkeit stand der, der Unterdrücker in nichts nach.";
const string Phoenix2_4 = "Sie raubten, mordeten und trieben die Schwachen zu unwürdiger Arbeit.";
const string Phoenix2_5 = "Was einst felsenfest verbunden war, brach durch die Macht des Sturms entzwei. An dieser Stelle beginnt der Aufstieg der Macht des Feuers, gleich dem Aufstieg des Phoenix. Doch der Phoenix hat an der Stelle des Bruches eine Feder hinterlassen. Die Feder des Phoenix.";

func void Use_Phoenix2()
{
	var int nDocID;
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, Phoenix2_1);
				Doc_PrintLine	(nDocID, 0, Phoenix2_2);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix2_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix2_4);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Phoenix2_5);

	Doc_Show(nDocID);

	if (Phoenix_State == 1)
	{
		B_GiveXP(XP_Phoenix2);
		B_LogEntry(CH1_Phoenix, CH1_Phoenix_2);
		Wld_InsertItem(ItWr_Phoenix3, "FP_SPAWN_PHOENIX_3");

		Phoenix_State = 2;
	};
};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 3
//---------------------------------------------------------------------
instance ItWr_Phoenix3(C_Item)
{
	name						= "Die Feder des Phoenix";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Phoenix3;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Der dritte Teil der Spur des";				count[1] = 0;
	text[2]						= "Phoenix von Corristo dem";					count[2] = 0;
	text[3]						= "obersten Feuermagier.";						count[3] = 0;
};

const string Phoenix3_1 = "Die Feder des";
const string Phoenix3_2 = "Phoenix";
const string Phoenix3_3 = "Die Kinder des Sturms wurden zu den neuen Unterdrückern und die Macht des Feuers stärkte sie. Nichts war vor der Gier des Sturms sicher.";
const string Phoenix3_4 = "Schon bald versammelten sich die Unzufriedenen und verliessen den Hort. Sie wurden von der Weisheit des Wassers hinfortgetragen und von seiner Macht beschützt.";
const string Phoenix3_5 = "Dort, wo die Macht des Wassers den Hort verlässt, findest du die Wellen des Phoenix.";

func void Use_Phoenix3()
{
	var int nDocID;
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, Phoenix3_1);
				Doc_PrintLine	(nDocID, 0, Phoenix3_2);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix3_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix3_4);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Phoenix3_5);

	Doc_Show(nDocID);

	if (Phoenix_State == 2)
	{
		B_GiveXP(XP_Phoenix3);
		B_LogEntry(CH1_Phoenix, CH1_Phoenix_3);
		Wld_InsertItem(ItWr_Phoenix4, "FP_SPAWN_PHOENIX_4");

		Phoenix_State = 3;
	};
};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 4
//---------------------------------------------------------------------
instance ItWr_Phoenix4(C_Item)
{
	name						= "Die Wellen des Phoenix";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Phoenix4;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Der vierte Teil der Spur des";				count[1] = 0;
	text[2]						= "Phoenix von Corristo dem";					count[2] = 0;
	text[3]						= "obersten Feuermagier.";						count[3] = 0;
};

const string Phoenix4_1 = "Die Wellen des";
const string Phoenix4_2 = "Phoenix";
const string Phoenix4_3 = "So errichteten Die Kinder des Sturmes um sich herum hohe Dämme um sich vor den Wogen des Wassers zu schützen. Sie hielten Ausschau nach ihren einstigen Leidensgenossen und trieben die Verbliebenen erbarmungslos zu harter Arbeit.";
const string Phoenix4_4 = "Der anfänglich so reine Sturm der Gerechtigkeit wandelte sein Gesicht und wurde schlimmer als das, was er einst ersetzte.";
const string Phoenix4_5 = "Beschreite den Damm und halte nach den Wogen des Wassers Ausschau. Dann wirst du vielleicht auch die Sehnsucht des Phoenix erblicken können.";

func void Use_Phoenix4()
{
	var int nDocID;
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, Phoenix4_1);
				Doc_PrintLine	(nDocID, 0, Phoenix4_2);
				Doc_PrintLine	(nDocID, 0, "----------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix4_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix4_4);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Phoenix4_5);

	Doc_Show(nDocID);

	if (Phoenix_State == 3)
	{
		B_GiveXP(XP_Phoenix4);
		B_LogEntry(CH1_Phoenix, CH1_Phoenix_4);
		Wld_InsertItem(ItWr_Phoenix5, "FP_SPAWN_PHOENIX_5");

		Phoenix_State = 4;
	};
};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 5
//---------------------------------------------------------------------
instance ItWr_Phoenix5(C_Item)
{
	name						= "Die Sehnsucht des Phoenix";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Phoenix5;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Der fünfte Teil der Spur des";				count[1] = 0;
	text[2]						= "Phoenix verfasst von Corristo.";				count[2] = 0;
};

const string Phoenix5_1 = "Die Sehnsucht";
const string Phoenix5_2 = "des Phoenix";
const string Phoenix5_3 = "Zuerst versteckten sich die Kinder des Wassers, die aus dem Hort flohen. Sie suchten Zuflucht in versteckten Höhlen, doch schon bald fanden sie einen eigenen Hort, der sie vor dem Zorn des Sturms schützte. ";
const string Phoenix5_4 = "Nicht alle Höhlen kann man trockenen Fusses betreten. Doch genau diese Höhlen sind oft die besten Verstecke. Der feurige Phoenix hasst solche Höhlen, hat er doch Angst vor dem fliessenden Element. Solche Höhlen sind der Alptraum des Phoenix.";

func void Use_Phoenix5()
{
	var int nDocID;
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, Phoenix5_1);
				Doc_PrintLine	(nDocID, 0, Phoenix5_2);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix5_3);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Phoenix5_4);

	Doc_Show(nDocID);

	if (Phoenix_State == 4)
	{
		B_GiveXP(XP_Phoenix5);
		B_LogEntry(CH1_Phoenix, CH1_Phoenix_5);
		Wld_InsertItem(ItWr_Phoenix6, "FP_SPAWN_PHOENIX_6");

		Phoenix_State = 5;
	};
};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 6
//---------------------------------------------------------------------
instance ItWr_Phoenix6(C_Item)
{
	name						= "Der Alptraum des Phoenix";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Phoenix6;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Der sechste Teil der Spur des";				count[1] = 0;
	text[2]						= "Phoenix verfasst von Corristo.";				count[2] = 0;
};

const string Phoenix6_1 = "Der Alptraum";
const string Phoenix6_2 = "des Phoenix";
const string Phoenix6_3 = "Schon bald riss der Schnabel des Sturmes aufs neue Fleisch aus seiner eigenen Seite und dieses Fleisch wurde zu den Kindern des Geistes. Sie versteckten sich in felsigen Höhlen, bevor sie ein eigenen Hort inmitten von Schlamm und Ungeziefer gründeten.";
const string Phoenix6_4 = "Dies war die Geburts- stunde unseres eigenen Untergangs, denn die Macht des Geistes erschütterte das Gefüge der Welt.";
const string Phoenix6_5 = "Der Phoenix zieht seine Jungen in einem Felsennest in luftiger Höhe auf. Dort wo kein Weg hinführt, brennt das feurige Nest des Phoenix.";

func void Use_Phoenix6()
{
	var int nDocID;
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, Phoenix6_1);
				Doc_PrintLine	(nDocID, 0, Phoenix6_2);
				Doc_PrintLine	(nDocID, 0, "--------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix6_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix6_4);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Phoenix6_5);

	Doc_Show(nDocID);

	if (Phoenix_State == 5)
	{
		B_GiveXP(XP_Phoenix6);
		B_LogEntry(CH1_Phoenix, CH1_Phoenix_6);

		Wld_InsertItem(ItWr_Phoenix7, "FP_SPAWN_PHOENIX_7");
		Wld_SetObjectRoutine(00, 00, "FIRE_OW_PHOENIX_NEST", 1);
		Wld_SetObjectRoutine(12, 00, "FIRE_OW_PHOENIX_NEST", 1);

		Phoenix_State = 6;
	};
};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 7
//---------------------------------------------------------------------
instance ItWr_Phoenix7(C_Item)
{
	name						= "Das Nest des Phoenix";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Phoenix7;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Der siebente Teil der Spur des";				count[1] = 0;
	text[2]						= "Phoenix verfasst von Corristo.";				count[2] = 0;
};

const string Phoenix7_1 = "Das Nest";
const string Phoenix7_2 = "des Phoenix";
const string Phoenix7_3 = "So zogen die Jahre ins Land und der Zorn des Sturmes wetteiferte mit den Wogen des Wassers und den Kindern des Geistes. Das Feuer, dass einst den Sturm so eifrig ernährte, wurde immer schwächer und heute lodert es nur noch unbedeutend.";
const string Phoenix7_4 = "Vorkehrungen müssen getroffen werden, um das Wissen des Feuers zu bewahren.";
const string Phoenix7_5 = "Neigen sich die Tage eines Phoenix seinem Ende, so lässt er sich am höchsten Ort seines Hortes nieder und erwartet das Unausweichliche. Er erwartet dort den Tod des Phoenix.";

func void Use_Phoenix7()
{
	var int nDocID;
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, Phoenix7_1);
				Doc_PrintLine	(nDocID, 0, Phoenix7_2);
				Doc_PrintLine	(nDocID, 0, "-------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix7_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix7_4);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Phoenix7_5);

	Doc_Show(nDocID);

	if (Phoenix_State == 6)
	{
		B_GiveXP(XP_Phoenix7);
		B_LogEntry(CH1_Phoenix, CH1_Phoenix_7);

		Wld_InsertItem(ItWr_Phoenix8, "FP_SPAWN_PHOENIX_8");

		Phoenix_State = 7;
	};
};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 8
//---------------------------------------------------------------------
instance ItWr_Phoenix8(C_Item)
{
	name						= "Der Tod des Phoenix";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Phoenix8;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Der achte Teil der Spur des";				count[1] = 0;
	text[2]						= "Phoenix verfasst von Corristo.";				count[2] = 0;
};

const string Phoenix8_1 = "Der Tod des";
const string Phoenix8_2 = "Phoenix";
const string Phoenix8_3 = "Das Gefüge der Welt bebte. Erst langsam und schwach, dann immer öfter und immer heftiger. Das Ende ist nah, dessen bin ich mir sicher. Weder Sturm noch Wasser noch Geist erkennen es. Doch das Feuer weiss um die Wahrheit.";
const string Phoenix8_4 = "Es muss weiterbestehen. Es war immer so. Es wird immer so sein.";
const string Phoenix8_5 = "Das Leben des Phoenix ist ein immerwährender Kreislauf. Er kehrt stets dorthin zurück, wo er einst begonnen hat, um sich aus der Asche wieder zu neuem Leben zu erheben. Dies ist die Auferstehung des Phoenix.";

func void Use_Phoenix8()
{
	var int nDocID;
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, Phoenix8_1);
				Doc_PrintLine	(nDocID, 0, Phoenix8_2);
				Doc_PrintLine	(nDocID, 0, "-------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix8_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Phoenix8_4);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Phoenix8_5);

	Doc_Show(nDocID);

	if (Phoenix_State == 7)
	{
		B_GiveXP(XP_Phoenix8);
		B_LogEntry(CH1_Phoenix, CH1_Phoenix_8);

		Phoenix_State = 8;
	};
};

//---------------------------------------------------------------------
//	Spur des Phoenix - Cheatbuch
//---------------------------------------------------------------------
instance ItWr_PhoenixCheat(C_Item)
{
	name						= "Der Cheat des Phoenix";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_PhoenixCheat;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Der achte Teil der Spur des";				count[1] = 0;
	text[2]						= "Phoenix verfasst von Corristo.";				count[2] = 0;
};

const string PhoenixCheat_1 = "Der Cheat";
const string PhoenixCheat_2 = "des Phoenix";
const string PhoenixCheat_3 = "Wer keine Lust hat, nach allen 8 Phoenix-Büchern zu suchen, der muss es auch nicht.";
const string PhoenixCheat_4 = "Dieses Buch schaltet die Geheime Kammer auch sofort frei.";
const string PhoenixCheat_5 = "BlaBlaBa";

func void Use_PhoenixCheat()
{
	var int nDocID;
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, PhoenixCheat_1);
				Doc_PrintLine	(nDocID, 0, PhoenixCheat_2);
				Doc_PrintLine	(nDocID, 0, "-------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, PhoenixCheat_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, PhoenixCheat_4);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, PhoenixCheat_5);

	Doc_Show(nDocID);

	Phoenix_State = 8;
};

//---------------------------------------------------------------------
//	Elexir des Geistes - für Xardas
//---------------------------------------------------------------------
instance ItPo_ElexirOfMind(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItFo_Potion_Mana_03.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= Use_ElexirOfMind;

	value						= 0;

	description					= "ELIXIER DES GEISTES";
	text[0]						= "Dies ist das Elixier, das Xardas benötigt";	count[0] = 0;
	text[1]						= "Ich weiss nicht wie es genau wirkt, aber";	count[1] = 0;
	text[2]						= "ich sollte es auf KEINEN Fall trinken";		count[2] = 0;
	text[3]						= "bevor ich mit Xardas gesprochen habe!";		count[3] = 0;
};

func void Use_ElexirOfMind()
{
	PrintDebugNpc(PD_ITEM_MOBSI, "Use_ElexirOfMind");

	Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
};

//---------------------------------------------------------------------
//	Placebo für Agon
//---------------------------------------------------------------------
instance ItFo_Placebo(C_Item)
{
	name						= "Klarer Trank";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItFo_Potion_Water_01.3ds";
	material					= MAT_GLAS;

	description					= name;
	text[0]						= "Diese flüssige Substanz ist so rein und klar";count[0] = 0;
	text[1]						= "dass man ihr alle möglichen Fähigkeiten";	count[1] = 0;
	text[2]						= "zutrauen könnte.";							count[2] = 0;
};

//---------------------------------------------------------------------
//	Brief über Steinwurzel
//---------------------------------------------------------------------
instance ItWr_BloodThistle(C_Item)
{
	name						= "Abschrift";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ItWr_BloodThistle;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Eine stark verwitterte Seite, deren Schrift man";count[1] = 0;
	text[2]						= "noch erstaunlich gut entziffern kann.";		count[2] = 0;
};

const string ItWr_BloodThistle_1 = "Das Kraut, das den Namen Blutdistel trägt, sucht sich zum Wachsen meist die großen Wasserpflanzen.";
const string ItWr_BloodThistle_2 = "In ihrem Schutz gedeihen sie reichlich an feuchten Ufern und sandigen Inseln, an Seen und Flüßen.";
const string ItWr_BloodThistle_3 = "Abschrift aus HEILKRAFT DER NATUR";
const string ItWr_BloodThistle_4 = "von Bota Niker";

func void Use_ItWr_BloodThistle()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);

	Doc_SetPage(nDocID, 0, "letters.TGA", 0);

				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_BloodThistle_1);
				Doc_PrintLines	(nDocID, 0, ItWr_BloodThistle_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_BloodThistle_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_BloodThistle_4);

	Doc_Show(nDocID);

	B_LearnBloodThistle();
};

//---------------------------------------------------------------------
//	Brief von Osric an Helvegor
//---------------------------------------------------------------------
instance ItWr_Helvegor(C_Item)
{
	name						= "Brief";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ItWr_Helvegor;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "ein Brief von Osric an Helvegor ";			count[1] = 0;
};

const string ItWr_Helvegor_1 = "HelvegoR, ";
const string ItWr_Helvegor_2 = "hier im lager wimmelt es nur so von dieben und gesindeL. du bist der einzige, dem ich noch vertraue.";
const string ItWr_Helvegor_3 = "falls mir etwas zustossen solLte, ich habe ein paar nützliche dinge in sichere verwahRung gebracht. erinnerst du dich noch an die zeit, als wir hier ankamen?";
const string ItWr_Helvegor_4 = "bevor wir für agon gearbeitet haben? Das gerüst ist Leer und verlassen, die aRbeiten sind eingestellt.";
const string ItWr_Helvegor_5 = "Die Kombination steckt mittendrin. ";
const string ItWr_Helvegor_6 = "osric";

func void Use_ItWr_Helvegor()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);

	Doc_SetPage(nDocID, 0, "letters.TGA", 0);

				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID, 0, ItWr_Helvegor_1);
				Doc_PrintLines	(nDocID, 0, ItWr_Helvegor_2);
				Doc_PrintLines	(nDocID, 0, ItWr_Helvegor_3);
				Doc_PrintLines	(nDocID, 0, ItWr_Helvegor_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Helvegor_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Helvegor_6);
				Doc_PrintLine	(nDocID, 0, "");

	Doc_Show(nDocID);
};

//---------------------------------------------------------------------
//	Über die Götter
//---------------------------------------------------------------------
instance ItWr_Gods(C_Item)
{
	name						= "Über die Götter";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ItWr_Gods;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Sieht aus, wie eine Abschrift aus einem Buch";count[1] = 0;
};

const string ItWr_Gods_1 = "Innos der Gott des Feuers und der Gesetzes";
const string ItWr_Gods_2 = "Wahrer der Ordnung ";
const string ItWr_Gods_3 = "Adanos Gott des Wassers und der Gerechtigkeit";
const string ItWr_Gods_4 = "Waagschale der Menschheit ";
const string ItWr_Gods_5 = "Beliar Gott des Todes und der Dunkelheit";
const string ItWr_Gods_6 = "Herrscher der Nacht ";
const string ItWr_Gods_7 = "Zusammen bilden sie die göttliche Dreifaltigkeit ";
const string ItWr_Gods_8 = "Den Ursprung der Welt, ihren Weg und ihr Ende";

func void Use_ItWr_Gods()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);

	Doc_SetPage(nDocID, 0, "letters.TGA", 0);

				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Gods_1);
				Doc_PrintLines	(nDocID, 0, ItWr_Gods_2);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Gods_3);
				Doc_PrintLine	(nDocID, 0, ItWr_Gods_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Gods_5);
				Doc_PrintLine	(nDocID, 0, ItWr_Gods_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Gods_7);
				Doc_PrintLine	(nDocID, 0, ItWr_Gods_8);

	Doc_Show(nDocID);

	if (Knows_Gods == FALSE)
	{
		B_GiveXP(XP_KnowsGods);
		Knows_Gods = TRUE;
	};
};

//---------------------------------------------------------------------
//	Palgurs Notiz
//---------------------------------------------------------------------
instance ItWr_Palgur(C_Item)
{
	name						= "Seite";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ItWr_Palgur;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Ein einzelner Tagebuch Eintrag";				count[1] = 0;
};

const string ItWr_Palgur_1 = "Isgar hat seine Tränke herumstehen lassen. Wie unvorsichtig von ihm. Und wie gut, das es Diebe gibt, denen man es anhängen kann.";
const string ItWr_Palgur_2 = "Die Tränke habe ich dort versteckt, wo viele hergehen, aber niemand bleibt.";
const string ItWr_Palgur_3 = "Nur als reine Vorsichtsmassnahme. Wer weiß denn schon, was uns noch alles bevorsteht.";
const string ItWr_Palgur_4 = "Talamon ist viel zu sehr mit seinen Forschungen beschäftigt, und Isgar ist nur darauf aus Silber zu kassieren, ";
const string ItWr_Palgur_5 = " als das sie an Massnahmen für den Fall eines Angriffes denken.";

func void Use_ItWr_Palgur()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);

	Doc_SetPage(nDocID, 0, "letters.TGA", 0);

				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Palgur_1);
				Doc_PrintLines	(nDocID, 0, ItWr_Palgur_2);
				Doc_PrintLines	(nDocID, 0, ItWr_Palgur_3);
				Doc_PrintLines	(nDocID, 0, ItWr_Palgur_4);
				Doc_PrintLines	(nDocID, 0, ItWr_Palgur_5);

	Doc_Show(nDocID);
};

//---------------------------------------------------------------------
//	Brief eines Unbekannten
//---------------------------------------------------------------------
instance ItWr_Worker(C_Item)
{
	name						= "Brief";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ItWr_Worker;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Ein Teil eines Briefes";						count[1] = 0;
	text[2]						= "ohne erkennbaren Anfang oder Ende";			count[2] = 0;
};

const string ItWr_Worker_1 = "Es ist furchtbar. Die Orks ziehen durchs Land und plündern die Dörfer. Auf dem Weg ins Tal von Khorinis haben wir einen Zug anderer Flüchtender gesehen. ";
const string ItWr_Worker_2 = "Sie sind den Orks in die Hände gefallen. Bei Innos, die Orks haben schreckliche Dinge mit ihnen getan. ";
const string ItWr_Worker_3 = "Innos sei Dank, zumindest haben wir es ins Lager geschafft. Der König ist ebenfalls hier im Tal. Das gibt vielen hier Mut und Kraft. ";
const string ItWr_Worker_4 = "Aber es gibt noch viel zu tun. Wir müssen den Wall wieder aufbauen, um uns vor den Orks zu schützen.";

func void Use_ItWr_Worker()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);

	Doc_SetPage(nDocID, 0, "letters.TGA", 0);

				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Worker_1);
				Doc_PrintLines	(nDocID, 0, ItWr_Worker_2);
				Doc_PrintLines	(nDocID, 0, ItWr_Worker_3);
				Doc_PrintLines	(nDocID, 0, ItWr_Worker_4);
				Doc_PrintLines	(nDocID, 0, "");

	Doc_Show(nDocID);
};
