//#################################################################################################
//##
//##	Werte der Alchemistischen Gegenstände
//##
//#################################################################################################

// Rezeptur-Bücher
const int Value_BookHealingPotions			= 100;
const int Value_BookManaPotions				= 100;
const int Value_BookSpeedPotions			= 100;

// alchemistische Substanzen
const int Value_Sulphur						= 10;
const int Value_Quicksilver					= 12;
const int Value_SyrianOil					= 7;
const int Value_Alcohol						= 9;

//#################################################################################################
//##
//##	alchemistische Substanzen
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Schwefel
//////////////////////////////////////////////////////////////////////////////////
instance ItMi_Sulphur(C_Item)
{
	name						= NAME_Sulphur;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Alchemy_Sulphur_01.3DS";
	material					= MAT_CLAY;

	value						= Value_Sulphur;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Quecksilber
//////////////////////////////////////////////////////////////////////////////////
instance ItMi_Quicksilver(C_Item)
{
	name						= NAME_Quicksilver;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Alchemy_Quicksilver_01.3DS";
	material					= MAT_CLAY;

	value						= Value_Quicksilver;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Syrianisches Öl
//////////////////////////////////////////////////////////////////////////////////
instance ItMi_Syrianoil(C_Item)
{
	name						= NAME_SyrianOil;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Alchemy_Syrianoil_01.3DS";
	material					= MAT_CLAY;

	value						= Value_SyrianOil;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Alcohol
//////////////////////////////////////////////////////////////////////////////////
instance ItMi_Alcohol(C_Item)
{
	name						= NAME_Alcohol;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Alchemy_Alcohol_01.3DS";
	material					= MAT_CLAY;

	value						= Value_Alcohol;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

//#################################################################################################
//##
//##	Alchemie-Bücher
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Heilung
//////////////////////////////////////////////////////////////////////////////////
instance ItWr_Book_HealingPotions(C_Item)
{
	name						= NAME_BookHealingPotions;

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_04.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Book_HealingPotions;

	value						= Value_BookHealingPotions;

	description					= name;
	text[0]						= "Dieser Foliant enthält Rezepturen";			count[0] = 0;
	text[1]						= "mit welchen ein Alchemist alle";				count[1] = 0;
	text[2]						= "möglichen Sorten von Heiltränken";			count[2] = 0;
	text[3]						= "herstellen kann.";							count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Book_HealingPotions_1 = "Heiltränke";
const string ItWr_Book_HealingPotions_2 = "Die Heilung von Wunden, egal ob durch Schwerter, durch die Hauer eines wilden Tieres oder durch Magie verursacht ist eine langwierige Sache.";
const string ItWr_Book_HealingPotions_3 = "Doch kann dieser Prozess durch alchemistische Tränke erheblich beschleunigt werden.";
const string ItWr_Book_HealingPotions_4 = "Schon mit geringer Übung ist es möglich diese herzustellen. Die nötigen Reagenzien: ";
const string ItWr_Book_HealingPotions_5 = "Dieser stärkere Trank erfordert mehr Erfahrung: ";
const string ItWr_Book_HealingPotions_6 = "Nur Meister in Alchemie können ein Elixier herstellen. Die Rezeptur benötigt: ";

func void UseItWr_Book_HealingPotions()
{
	// SN: Hier storybedingt keine B_LearnRecipe...-Funktion !!!

	var int nDocID;

	//	!!! Hier noch die Zutaten in das Rezeptbuch eintragen
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Red_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Book_HealingPotions_1);
				Doc_PrintLine	(nDocID, 0, "------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_HealingPotions_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_HealingPotions_3);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, NAME_Essence);
				Doc_PrintLine	(nDocID, 1, "-------");

				var string string_Recipe;
				string_Recipe = B_BuildRecipeString3(ItWr_Book_HealingPotions_4,
													1,
													NAME_Alcohol,
													1,
													NAME_MountainMoss,
													1,
													NAME_OrcLeaf);
				Doc_PrintLines	(nDocID, 1, string_Recipe);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_Extract);
				Doc_PrintLine	(nDocID, 1, "--------");

				string_Recipe = B_BuildRecipeString3(ItWr_Book_HealingPotions_5,
													1,
													NAME_Alcohol,
													1,
													NAME_MountainMoss,
													1,
													NAME_RavenHerb);
				Doc_PrintLines	(nDocID, 1, string_Recipe);

				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_Elixir);
				Doc_PrintLine	(nDocID, 1, "--------");

				string_Recipe = B_BuildRecipeString3(ItWr_Book_HealingPotions_6,
													1,
													NAME_Alcohol,
													1,
													NAME_MountainMoss,
													1,
													NAME_Nightshade);
				Doc_PrintLines	(nDocID, 1, string_Recipe);
				Doc_PrintLine	(nDocID, 1, "");

	Doc_Show(nDocID);
};

//////////////////////////////////////////////////////////////////////////////////
//	Mana-Tränke
//////////////////////////////////////////////////////////////////////////////////
instance ItWr_Book_ManaPotions(C_Item)
{
	name						= Name_BookManaPotions;

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_04.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Book_ManaPotions;

	value						= Value_BookManaPotions;

	description					= name;
	text[0]						= "Dieser Foliant enthält Rezepturen";			count[0] = 0;
	text[1]						= "mit welchen ein Alchemist alle";				count[1] = 0;
	text[2]						= "möglichen Sorten von Manatränken";			count[2] = 0;
	text[3]						= "herstellen kann.";							count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Book_ManaPotions_1 = "Mana-Tränke";
const string ItWr_Book_ManaPotions_2 = "Jeder Zauber entzieht dem Wirkenden etwas magische Energie, die durch Alchemistische Tränke zurückgewonnen werden kann.";
const string ItWr_Book_ManaPotions_3 = "Schon mit geringem Talent in der Alchemie ist es möglich diese herzustellen. Die Reagenzien: ";
const string ItWr_Book_ManaPotions_4 = "Um dieses herzustellen ist ein geübter Alchemist von Nöten. Er benötigt: ";
const string ItWr_Book_ManaPotions_5 = "Nur ein Meister der Alchemie ist fähig ein Elixier zu erzeugen. Die Rezeptur bilden: ";

func void UseItWr_Book_ManaPotions()
{
	B_LearnRecipeManaPotions();
	var int nDocID;

	//	!!! Hier noch die Zutaten in das Rezeptbuch eintragen
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Red_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Book_ManaPotions_1);
				Doc_PrintLine	(nDocID, 0, "-----------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_ManaPotions_2);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_Essence);
				Doc_PrintLine	(nDocID, 1, "-------");

				var string string_Recipe;
				string_Recipe = B_BuildRecipeString3(ItWr_Book_ManaPotions_3,
													1,
													NAME_Alcohol,
													1,
													NAME_Stoneroot,
													1,
													NAME_OrcLeaf);
				Doc_PrintLines	(nDocID, 1, string_Recipe);

				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_Extract);
				Doc_PrintLine	(nDocID, 1, "--------");

				string_Recipe = B_BuildRecipeString3(ItWr_Book_ManaPotions_4,
													1,
													NAME_Alcohol,
													1,
													NAME_Stoneroot,
													1,
													NAME_RavenHerb);
				Doc_PrintLines	(nDocID, 1, string_Recipe);

				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_Elixir);
				Doc_PrintLine	(nDocID, 1, "--------");

				string_Recipe = B_BuildRecipeString3(ItWr_Book_ManaPotions_5,
													1,
													NAME_Alcohol,
													1,
													NAME_Stoneroot,
													1,
													NAME_Nightshade);
				Doc_PrintLines	(nDocID, 1, string_Recipe);

	Doc_Show(nDocID);
};

//////////////////////////////////////////////////////////////////////////////////
//	Schnelligkeits-Tränke
//////////////////////////////////////////////////////////////////////////////////
instance ItWr_Book_SpeedPotions(C_Item)
{
	name						= Name_BookSpeedPotions;

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_04.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_Book_SpeedPotions;

	value						= Value_BookSpeedPotions;

	description					= name;
	text[0]						= "Dieser Foliant enthält Rezepturen";			count[0] = 0;
	text[1]						= "für alchemistische Tränke, welche";			count[1] = 0;
	text[2]						= "die Spurtgeschwindigkeit gewaltig";			count[2] = 0;
	text[3]						= "anheben.";									count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ItWr_Book_SpeedPotions_1 = "Tränke der";
const string ItWr_Book_SpeedPotions_2 = "Eile";
const string ItWr_Book_SpeedPotions_3 = "Wer sich schnell wie ein Scavenger fortbewegen will, benötigt alchemistische Hilfe. Die Tränke der Eile verleihen dem Benutzer ungeahnte Spurtfähigkeiten. Doch leider sind sie nur von kurzer Dauer.";
const string ItWr_Book_SpeedPotions_4 = "Schon mit geringer Ausbildung  kann man diese herstellen. Nötige Reagenzien sind: ";
const string ItWr_Book_SpeedPotions_5 = "Um dieses zu zubereiten ist ein geübter Alchemist gefragt. Er benötigt: ";
const string ItWr_Book_SpeedPotions_6 = "Nur die besten Alchemisten vermögen diese Elixiere zuzubereiten. Inhaltsstoffe sind: ";

func void UseItWr_Book_SpeedPotions()
{
	B_LearnRecipeSpeedPotions();
	var int nDocID;

	//	!!! Hier noch die Zutaten in das Rezeptbuch eintragen
	nDocID = Doc_Create();												//DocManager
	Doc_SetPages(nDocID, 2);											//wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Red_R.tga", 0);

	//1.Seite
				Doc_SetFont		(nDocID, -1, FONT_BOOK_BIG);			// -1 -> all pages
				Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);		//  0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, ItWr_Book_SpeedPotions_1);
				Doc_PrintLine	(nDocID, 0, ItWr_Book_SpeedPotions_2);
				Doc_PrintLine	(nDocID, 0, "------------");
				Doc_SetFont		(nDocID, -1, FONT_BOOK_SMALL);			// -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Book_SpeedPotions_3);

	//2.Seite
				Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1);		//  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_Essence);
				Doc_PrintLine	(nDocID, 1, "-------");

				var string string_Recipe;
				string_Recipe = B_BuildRecipeString3(ItWr_Book_SpeedPotions_4,
													1,
													NAME_Alcohol,
													1,
													NAME_BloodThistle,
													1,
													NAME_OrcLeaf);
				Doc_PrintLines	(nDocID, 1, string_Recipe);

				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_Extract);
				Doc_PrintLine	(nDocID, 1, "--------");

				string_Recipe = B_BuildRecipeString3(ItWr_Book_SpeedPotions_5,
													1,
													NAME_Alcohol,
													1,
													NAME_BloodThistle,
													1,
													NAME_RavenHerb);
				Doc_PrintLines	(nDocID, 1, string_Recipe);

				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, NAME_Elixir);
				Doc_PrintLine	(nDocID, 1, "--------");

				string_Recipe = B_BuildRecipeString3(ItWr_Book_SpeedPotions_6,
													1,
													NAME_Alcohol,
													1,
													NAME_BloodThistle,
													1,
													Name_Nightshade);
				Doc_PrintLines	(nDocID, 1, string_Recipe);

	Doc_Show(nDocID);
};
