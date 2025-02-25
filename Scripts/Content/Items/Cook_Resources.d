//#################################################################################################
//##
//##	Heilwirkung und Kosten von Kochprodukten
//##
//#################################################################################################

// Endprodukte Suppen
const int Value_MeatbugSoup			= 10; const int HP_MeatbugSoup			= 60;
const int Value_MoleratSoup			= 10; const int HP_MoleratSoup			= 60;
const int Value_HerbSoup			= 12; const int HP_HerbSoup				= 70;
const int Value_MushroomSoup		= 12; const int HP_MushroomSoup			= 70;
const int Value_MeatSoup			= 15; const int HP_MeatSoup				= 80;

// Endprodukte Eintöpfe
const int Value_MeatbugStew			= 20; const int HP_MeatbugStew			= 120;
const int Value_MoleratStew			= 20; const int HP_MoleratStew			= 120;
const int Value_HerbStew			= 22; const int HP_HerbStew				= 140;
const int Value_MushroomStew		= 22; const int HP_MushroomStew			= 140;
const int Value_MeatStew			= 25; const int HP_MeatStew				= 160;

// Endprodukte Ragout
const int Value_MeatbugPie			= 40; const int HP_MeatbugPie			= 240;
const int Value_MoleratPie			= 40; const int HP_MoleratPie			= 240;
const int Value_HerbPie				= 45; const int HP_HerbPie				= 280;
const int Value_MushroomPie			= 45; const int HP_MushroomPie			= 280;
const int Value_MeatPie				= 50; const int HP_MeatPie				= 320;

// Kochrezepte
const int Value_RecipeMeatbug		= 250;
const int VAlue_RecipeMolerat		= 250;
const int Value_RecipeHerb			= 350;
const int Value_RecipeMushroom		= 350;
const int Value_RecipeMeat			= 500;

//#################################################################################################
//##
//##	Kochprodukte
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Meatbug-Suppe
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatbugSoup(C_Item)
{
	name						= NAME_MeatbugSoup;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MeatbugSoup.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MeatbugSoup;

	scemeName					= "RICE";
	on_state[0]					= Use_MeatbugSoup;

	value						= Value_MeatbugSoup;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MeatbugSoup;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MeatbugSoup()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MeatbugSoup);
};

//////////////////////////////////////////////////////////////////////////////////
//	Molerat-Suppe
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MoleratSoup(C_Item)
{
	name						= NAME_MoleratSoup;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MoleratSoup.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MoleratSoup;

	scemeName					= "RICE";
	on_state[0]					= Use_MoleratSoup;

	value						= Value_MoleratSoup;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MoleratSoup;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MoleratSoup()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MoleratSoup);
};

//////////////////////////////////////////////////////////////////////////////////
//	Kräuter-Suppe
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_HerbSoup(C_Item)
{
	name						= NAME_HerbSoup;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_HerbSoup.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_HerbSoup;

	scemeName					= "RICE";
	on_state[0]					= Use_HerbSoup;

	value						= Value_HerbSoup;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_HerbSoup;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_HerbSoup()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_HerbSoup);
};

//////////////////////////////////////////////////////////////////////////////////
//	Pilz-Suppe
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MushroomSoup(C_Item)
{
	name						= NAME_MushroomSoup;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MushroomSoup.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MushroomSoup;

	scemeName					= "RICE";
	on_state[0]					= Use_MushroomSoup;

	value						= Value_MushroomSoup;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MushroomSoup;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MushroomSoup()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MushroomSoup);
};

//////////////////////////////////////////////////////////////////////////////////
//	Fleisch-Suppe
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatSoup(C_Item)
{
	name						= NAME_MeatSoup;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MeatSoup.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MeatSoup;

	scemeName					= "RICE";
	on_state[0]					= Use_MeatSoup;

	value						= Value_MeatSoup;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MeatSoup;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MeatSoup()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MeatSoup);
};

//////////////////////////////////////////////////////////////////////////////////
//	Meatbug-Eintopf
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatbugStew(C_Item)
{
	name						= NAME_MeatbugStew;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MeatbugStew.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MeatbugStew;

	scemeName					= "RICE";
	on_state[0]					= Use_MeatbugStew;

	value						= Value_MeatbugStew;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MeatbugStew;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MeatbugStew()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MeatbugStew);
};

//////////////////////////////////////////////////////////////////////////////////
//	Molerat-Eintopf
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MoleratStew(C_Item)
{
	name						= NAME_MoleratStew;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MoleratStew.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MoleratStew;

	scemeName					= "RICE";
	on_state[0]					= Use_MoleratStew;

	value						= Value_MoleratStew;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MoleratStew;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MoleratStew()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MoleratStew);
};

//////////////////////////////////////////////////////////////////////////////////
//	Kräuter-Eintopf
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_HerbStew(C_Item)
{
	name						= NAME_HerbStew;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_HerbStew.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_HerbStew;

	scemeName					= "RICE";
	on_state[0]					= Use_HerbStew;

	value						= Value_HerbStew;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_HerbStew;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_HerbStew()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_HerbStew);
};

//////////////////////////////////////////////////////////////////////////////////
//	Pilz-Eintopf
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MushroomStew(C_Item)
{
	name						= NAME_MushroomStew;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MushroomStew.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MushroomStew;

	scemeName					= "RICE";
	on_state[0]					= Use_MushroomStew;

	value						= Value_MushroomStew;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MushroomStew;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MushroomStew()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MushroomStew);
};

//////////////////////////////////////////////////////////////////////////////////
//	Fleisch-Eintopf
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatStew(C_Item)
{
	name						= NAME_MeatStew;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MeatStew.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MeatStew;

	scemeName					= "RICE";
	on_state[0]					= Use_MeatStew;

	value						= Value_MeatStew;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MeatStew;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MeatStew()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MeatStew);
};

//////////////////////////////////////////////////////////////////////////////////
//	Meatbug-Ragout
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatbugPie(C_Item)
{
	name						= NAME_MeatbugPie;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MeatbugPie.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MeatbugPie;

	scemeName					= "RICE";
	on_state[0]					= Use_MeatbugPie;

	value						= Value_MeatbugPie;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MeatbugPie;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MeatbugPie()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MeatbugPie);
};

//////////////////////////////////////////////////////////////////////////////////
//	Molerat-Ragout
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MoleratPie(C_Item)
{
	name						= NAME_MoleratPie;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MoleratPie.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MoleratPie;

	scemeName					= "RICE";
	on_state[0]					= Use_MoleratPie;

	value						= Value_MoleratPie;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MoleratPie;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MoleratPie()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MoleratPie);
};

//////////////////////////////////////////////////////////////////////////////////
//	Kräuter-Ragout
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_HerbPie(C_Item)
{
	name						= NAME_HerbPie;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_HerbPie.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_HerbPie;

	scemeName					= "RICE";
	on_state[0]					= Use_HerbPie;

	value						= Value_HerbPie;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_HerbPie;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_HerbPie()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_HerbPie);
};

//////////////////////////////////////////////////////////////////////////////////
//	Pilz-Ragout
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MushroomPie(C_Item)
{
	name						= NAME_MushroomPie;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MushroomPie.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MushroomPie;

	scemeName					= "RICE";
	on_state[0]					= Use_MushroomPie;

	value						= Value_MushroomPie;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MushroomPie;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MushroomPie()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MushroomPie);
};

//////////////////////////////////////////////////////////////////////////////////
//	Fleisch-Ragout
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatPie(C_Item)
{
	name						= NAME_MeatPie;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_MeatPie.3ds";

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_MeatPie;

	scemeName					= "RICE";
	on_state[0]					= Use_MeatPie;

	value						= Value_MeatPie;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_MeatPie;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MeatPie()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_MeatPie);
};

//#################################################################################################
//##
//##	Koch-Bücher
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Meatbug-Rezepte
//////////////////////////////////////////////////////////////////////////////////
instance ItWr_Recipe_Meatbug(C_Item)
{
	name						= NAME_RecipeMeatbug;

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_02.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Recipe_Meatbug;

	value						= Value_RecipeMeatbug;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Recipe_Meatbug_1 = "Kochen mit";
const string ItWr_Recipe_Meatbug_2 = "Fleischwanzen";
const string ItWr_Recipe_Meatbug_3 = "Obwohl diese kleinen Mehrfüssler im allgemeinen sofort Ekel bis hin zum Erbrechen verursachen, so sollte man sich doch nicht von ihrer äusseren Erscheinung täuschen lassen.";
const string ItWr_Recipe_Meatbug_4 = "Der meisterhafte Koch, kann aus dem Fleisch dieser Schalentiere ganze Kunststücke zaubern.";
const string ItWr_Recipe_Meatbug_5 = "                  Snaf";
const string ItWr_Recipe_Meatbug_6 = "Man nehme etwas Salz, den Körper einer gut geschälten Fleischwanze, sowie ein Stück Brot, um das ganze anzudicken.";
const string ItWr_Recipe_Meatbug_7 = "Anstelle des Brotes verschafft ein ordentliches Stück Käse dem ganzen Eintopf so richtig Geschmack.";
const string ItWr_Recipe_Meatbug_8 = "Der gegarte Wanzenkörper wird mit einem Stück Schinken und einer Prise Salz zu einem leckeren Ragout.";

func void UseItWr_Recipe_Meatbug()
{
	B_LearnRecipeMeatbug();
	var int nDocID;

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Recipe_Meatbug_1);
				Doc_PrintLine	(nDocID, 0, ItWr_Recipe_Meatbug_2);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Recipe_Meatbug_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Recipe_Meatbug_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Recipe_Meatbug_5);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");

				Doc_PrintLine	(nDocID, 1, NAME_MeatbugSoup);
				Doc_PrintLine	(nDocID, 1, "----------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Meatbug_6);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_MeatbugStew);
				Doc_PrintLine	(nDocID, 1, "------------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Meatbug_7);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_MeatbugPie);
				Doc_PrintLine	(nDocID, 1, "-----------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Meatbug_8);

	Doc_Show(nDocID);
};

//////////////////////////////////////////////////////////////////////////////////
//	Molerat-Rezepte
//////////////////////////////////////////////////////////////////////////////////
instance ItWr_Recipe_Molerat(C_Item)
{
	name						= NAME_RecipeMolerat;

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_02.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Recipe_Molerat;

	value						= Value_RecipeMolerat;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Recipe_Molerat_1 = "Kochen mit";
const string ItWr_Recipe_Molerat_2 = "Moleratfett";
const string ItWr_Recipe_Molerat_3 = "Man sollte es wirklich nicht meinen, aber Molerats bestehen fast ausschliesslich aus purem Fett, dass sich zu sehr nahrhaften Mahlzeiten verkochen lässt.";
const string ItWr_Recipe_Molerat_4 = "Obwohl man es nicht unbedingt vermutet, kann Moleratfett, zusammen mit einem Leib Brot und einer Prise Salz eine nahrhafte Mahlzeit ergeben.";
const string ItWr_Recipe_Molerat_5 = "Verwendet man anstelle des Brotes ein Stück Käse, so erhält man dieses leckere Gericht.";
const string ItWr_Recipe_Molerat_6 = "Nur wer das Moleratfett mit Schinken und etwas Salz verkocht, gelangt an diese äusserst schmackhafte Mahlzeit.";

func void UseItWr_Recipe_Molerat()
{
	B_LearnRecipeMolerat();
	var int nDocID;

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Recipe_Molerat_1);
				Doc_PrintLine	(nDocID, 0, ItWr_Recipe_Molerat_2);
				Doc_PrintLine	(nDocID, 0, "-------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Recipe_Molerat_3);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_MoleratSoup);
				Doc_PrintLine	(nDocID, 1, "----------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Molerat_4);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_MoleratStew);
				Doc_PrintLine	(nDocID, 1, "------------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Molerat_5);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_MoleratPie);
				Doc_PrintLine	(nDocID, 1, "-----------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Molerat_6);

	Doc_Show(nDocID);
};

//////////////////////////////////////////////////////////////////////////////////
//	Kraut-Rezepte
//////////////////////////////////////////////////////////////////////////////////
instance ItWr_Recipe_Herb(C_Item)
{
	name						= NAME_RecipeHerb;

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_02.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Recipe_Herb;

	value						= Value_RecipeHerb;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Recipe_Herb_1 = "Kochen mit";
const string ItWr_Recipe_Herb_2 = "Kräutern";
const string ItWr_Recipe_Herb_3 = "Frische Kräuter aus dem Sumpf eigenen sich nicht nur zum Rauchen. Mit etwas Kochkunst kann man daraus eine ganze Reihe leckerer Gerichte zubereiten. ";
const string ItWr_Recipe_Herb_4 = "Sumpfkraut mit Brot und Salz kann zu einer nahrhaften Suppe zubereitet werden.";
const string ItWr_Recipe_Herb_5 = "Anstelle des Brotes kann auch ein Stück Käse hinzugefügt werden, und so entsteht ein leckerer Eintopf.";
const string ItWr_Recipe_Herb_6 = "Nichts geht über ein Stück Schinken, das auch dem Sumpfkraut den edelsten Geschmack verleiht. Das Salzen nicht vergessen!";

func void UseItWr_Recipe_Herb()
{
	B_LearnRecipeHerb();
	var int nDocID;

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Recipe_Herb_1);
				Doc_PrintLine	(nDocID, 0, ItWr_Recipe_Herb_2);
				Doc_PrintLine	(nDocID, 0, "---------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Recipe_Herb_3);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_HerbSoup);
				Doc_PrintLine	(nDocID, 1, "--------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Herb_4);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_HerbStew);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Herb_5);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_HerbPie);
				Doc_PrintLine	(nDocID, 1, "--------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Herb_6);

	Doc_Show(nDocID);
};

//////////////////////////////////////////////////////////////////////////////////
//	Pilz-Rezepte
//////////////////////////////////////////////////////////////////////////////////
instance ItWr_Recipe_Mushroom(C_Item)
{
	name						= NAME_RecipeMushroom;

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_02.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Recipe_Mushroom;

	value						= Value_RecipeMushroom;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Recipe_Mushroom_1 = "Kochen mit Pilzen";
const string ItWr_Recipe_Mushroom_2 = "Pilze gehören zu den meist unterschätzten Pflanzen. Sie eigenen sich hervorragen dazu einige sehr exquisite Gerichte daraus zuzubereiten.";
const string ItWr_Recipe_Mushroom_3 = "Ein Höhlenpilz, gut gesäubert und mit Brot und Salz gekocht.";
const string ItWr_Recipe_Mushroom_4 = "Mit einem Stück Käse und einer Prise Salz schmecken Pilze bedeutend besser.";
const string ItWr_Recipe_Mushroom_5 = "Die Krönung der Pilzgerichte wird mit einem Stück Schinken zubereitet. So entsteht mit Pilzen und einer Prise Salz ein schmackhaftes Ragout.";

func void UseItWr_Recipe_Mushroom()
{
	B_LearnRecipeMushroom();
	var int nDocID;

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Recipe_Mushroom_1);
				Doc_PrintLine	(nDocID, 0, "-----------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Recipe_Mushroom_2);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_MushroomSoup);
				Doc_PrintLine	(nDocID, 1, "------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Mushroom_3);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_MushroomStew);
				Doc_PrintLine	(nDocID, 1, "--------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Mushroom_4);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_MushroomPie);
				Doc_PrintLine	(nDocID, 1, "-------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Mushroom_5);

	Doc_Show(nDocID);
};

//////////////////////////////////////////////////////////////////////////////////
//	Fleisch-Rezepte
//////////////////////////////////////////////////////////////////////////////////
instance ItWr_Recipe_Meat(C_Item)
{
	name						= NAME_RecipeMeat;

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_02.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Recipe_Meat;

	value						= Value_RecipeMeat;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Recipe_Meat_1 = "Kochen mit Fleisch";
const string ItWr_Recipe_Meat_2 = "Richtiges Fleisch. Was kann es besseres im Kochtopf geben. Wird es vorher in einer Pfanne angebraten, so kann man daraus die wohl besten Mahlzeiten zubereiten, die man sich nur denken kann.";
const string ItWr_Recipe_Meat_3 = "                Halvor";
const string ItWr_Recipe_Meat_4 = "Ein Stück vorgebratenes Fleisch kann zusammen mit etwas Brot und einer Prise Salz zu einer schmackhaften Suppe zubereitet werden.";
const string ItWr_Recipe_Meat_5 = "Besser als das Brot eignet sich ein Stück Käse. So wird aus der Suppe ein Eintopf.";
const string ItWr_Recipe_Meat_6 = "Wer das beste aus dem Fleisch holen will, sollte ein Stück Schinken hinzufügen. Zusammen mit Salz ergibt es das allseits beliebte Fleisch-Ragout.";

func void UseItWr_Recipe_Meat()
{
	B_LearnRecipeMeat();
	var int nDocID;

	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Recipe_Meat_1);
				Doc_PrintLine	(nDocID, 0, "------------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Recipe_Meat_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Recipe_Meat_3);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_MeatSoup);
				Doc_PrintLine	(nDocID, 1, "---------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Meat_4);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_MeatStew);
				Doc_PrintLine	(nDocID, 1, "-----------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Meat_5);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_MeatPie);
				Doc_PrintLine	(nDocID, 1, "----------------");
				Doc_PrintLines	(nDocID, 1, ItWr_Recipe_Meat_6);

	Doc_Show(nDocID);
};
