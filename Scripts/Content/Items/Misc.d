// ************************************************************************************************
// Wert von Kram
// ************************************************************************************************

// Items für Objektbenutzung und Item-Interaktion...
// z.B. Krautstampfer, Hammer, Kochöffel, Laborflasche, Roheisen (Schmiede)
const int Value_MobsiItem			= 3;

const int Value_Silver				= 1;

const int Value_Pliers				= 50;

const int Value_Dietrich			= 10;
const int Value_Schluessel			= 3;

const int Value_Joint1				= 8;
const int Value_Joint2				= 15;
const int Value_Joint3				= 20;
const int Value_Laute				= 10;

const int Value_Fackel				= 2;

const int Value_Sumpfkraut			= 8;

//////////////////////////////////////////////////////////////////////////////////
//	Silbermünze
//////////////////////////////////////////////////////////////////////////////////
instance ItMi_Silver(C_Item)
{
	name						= NAME_Silver;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Stuff_OldCoin_01.3DS";
	material					= MAT_METAL;

	value						= Value_Silver;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Schmiedezange
//////////////////////////////////////////////////////////////////////////////////
instance ItMi_Pliers(C_Item)
{
	name						= NAME_Pliers;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Zange.3DS";
	material					= MAT_METAL;

	value						= Value_Pliers;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************
**	Items für Mobsi-Benutzung               					  		  				  **
*******************************************************************************************/

/******************************************************************************************/
//	Dietrich
instance ItKe_Lockpick(C_Item)
{
	name						= NAME_Lockpick;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItKe_Lockpick_01.3ds";
	material					= MAT_METAL;

	value						= Value_Dietrich;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = Value_Dietrich;
};

/******************************************************************************************/
//	Schlüssel

// FIXME: aussagekräftigere Schlüsselnamen?
instance ItKe_Key1(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Schluessel;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = Value_Schluessel;
};

/******************************************************************************************/
instance ItKe_Key2(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Schluessel;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = Value_Schluessel;
};

/******************************************************************************************/
instance ItKe_Key3(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Schluessel;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = Value_Schluessel;
};

/******************************************************************************************/
instance ItKe_Key4(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItKe_Key_04.3ds";
	material					= MAT_METAL;

	value						= Value_Schluessel;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = Value_Schluessel;
};

/******************************************************************************************/

/******************************************************************************************/
// Krautstampfen
instance ItMi_Stomper(C_Item)
{
	name						= NAME_Stomper;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Stomper_01.3DS";
	material					= MAT_METAL;

	value						= Value_MobsiItem;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = Value_MobsiItem;
};

/******************************************************************************************/
// Reparieren
instance ItMi_Hammer(C_Item)
{
	name						= NAME_Hammer;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Hammer_01.3DS";
	material					= MAT_WOOD;

	value						= Value_MobsiItem;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = Value_MobsiItem;
};

/******************************************************************************************/
// im Topf rühren
instance ItMi_Scoop(C_Item)
{
	name						= NAME_Scoop;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Scoop_01.3DS";
	material					= MAT_WOOD;

	value						= Value_MobsiItem;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = Value_MobsiItem;
};

/******************************************************************************************/
// Labor benutzen
// Fixme: wird dabei ein anderes Item generiert?
instance ItMi_Flask(C_Item)
{
	name						= NAME_LabFlask;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Potion_Mana_02.3ds";
	material					= MAT_GLAS;

	value						= Value_MobsiItem;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = Value_MobsiItem;
};

/*******************************************************************************************
**	Items für Item-Interaktionen (ohne Mobsi benutzbar)               		 		  	  **
*******************************************************************************************/

// für Feuerspucker
instance ItLs_TorchFirespit(C_Item)
{
	name						= NAME_TorchFirespit;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_BURN | ITEM_TORCH;

	visual						= "ItLsTorchBURNING.ZEN";
	material					= MAT_WOOD;

	scemeName					= "FIRESPIT";

	value						= Value_MobsiItem;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
// zum Rumklimpern
instance ItMi_Lute(C_Item)
{
	name						= NAME_Lute;

	mainflag					= ITEM_KAT_NONE;

	visual						= "ItMi_Lute_01.3DS";
	material					= MAT_WOOD;

	scemeName					= "LUTE";
	on_state[0]					= UseLute;

	value						= Value_Laute;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

func void UseLute()
{
};

/******************************************************************************************/
// Für Babe-Luftzufächeln
instance ItMi_Wedel(C_Item)
{
	name						= NAME_Whisk;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Wedel_01.3ds";
	material					= MAT_LEATHER;

	scemeName					= "COOLAIR";

	value						= Value_MobsiItem;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
// Für Babe-Putzen
instance ItMi_Brush(C_Item)
{
	name						= NAME_Brush;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Brush_01.3ds";
	material					= MAT_GLAS;

	scemeName					= "BRUSH";

	value						= Value_MobsiItem;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItMiJoint_1(C_Item)
{
	name						= NAME_Joint1;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Joint_01.3ds";
	material					= MAT_WOOD;

	scemeName					= "JOINT";
	on_state[0]					= UseItMiJoint_1;

	value						= Value_Joint1;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

func void UseItMiJoint_1()
{
};

/******************************************************************************************/

instance ItMiJoint_2(C_Item)
{
	name						= NAME_Joint2;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Joint_01.3ds";
	material					= MAT_WOOD;

	scemeName					= "JOINT";
	on_state[0]					= UseItMiJoint_2;

	value						= Value_Joint2;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

func void UseItMiJoint_2()
{
};

/******************************************************************************************/

instance ItMiJoint_3(C_Item)
{
	name						= NAME_Joint3;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Joint_01.3ds";
	material					= MAT_WOOD;

	scemeName					= "JOINT";
	on_state[0]					= UseItMiJoint_3;

	value						= Value_Joint3;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

func void UseItMiJoint_3()
{
};

/******************************************************************************************/
//	Fackel

instance ItLsTorch(C_Item)
{
	name						= NAME_Torch;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_BURN | ITEM_TORCH | ITEM_MULTI;

	visual						= "ItLs_Torch_01.3ds";
	material					= MAT_WOOD;

	value						= Value_Fackel;

	description					= name;
	text[0]						= "Bringt Licht in die dunkelsten Ecken!";		count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItLsTorchburning(C_Item)
{
	name						= NAME_BurningTorch;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_BURN | ITEM_TORCH;

	visual						= "ItLsTorchBURNING.ZEN";
	material					= MAT_WOOD;

	value						= 0;

	description					= name;
	//	text[4]					= NAME_Value;									count[4] = Value_Schluessel;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

/******************************************************************************************/
instance ItLsTorchburned(C_Item)
{
	name						= NAME_TorchBurned;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_BURN | ITEM_TORCH | ITEM_MULTI;

	visual						= "ItLs_Torchburned_01.3ds";
	material					= MAT_WOOD;

	value						= 0;

	description					= name;
	//	text[4]					= NAME_Value;									count[4] = Value_Schluessel;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

/******************************************************************************************/
// STUFF
/******************************************************************************************/

//---------------------------------------------------------------------
//	Fakescroll(Bergfestung)
//---------------------------------------------------------------------
instance Fakescroll(C_Item)
{
	name						= NAME_FakeScroll;

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	hp							= 5;
	hp_max						= 5;
	weight						= 1;

	visual						= "ItWr_Scroll_01.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItMi_Alarmhorn(C_Item)
{
	name						= NAME_AlarmHorn;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Alarmhorn_01.3DS";
	material					= MAT_WOOD;

	scemeName					= "HORN";

	value						= 9;

	description					= name;
	//text[0]					= "";
	//count[0]					= ;
	//text[1]					= "";
	//count[1]					= ;
	//text[2]					= "";
	//count[2]					= ;
	//text[3]					= "";
	//count[3]					= ;
	//text[4]					= "";
	//count[4]					= ;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItWr_Worldmap(C_Item)
{
	name						= NAME_WorldMap;

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseWorldmap;

	value						= 50;

	description					= name;
	text[0]						= "Leider fehlt darauf ein großes Gebiet";		count[0] = 0;
	text[1]						= "im Südwesten.";								count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseWorldmap()
{
	var int nDocID;

	nDocID = Doc_CreateMap();							//DocManager
	Doc_SetLevel(nDocID, "WORLD.ZEN");
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "Map_World.tga", 1);  //  1 -> DO NOT SCALE

	/*  		Doc_SetFont(nDocID, 0, FONT_BOOK_BIG); 	// -1 -> all pages
				Doc_SetMargins(nDocID, 0, 120, 80, 10, 10, 1);  //  0 -> Textrahmen (von den Ränder des TGAs aus, links-oben,rechts-unten)
				Doc_PrintLine	(nDocID, 0, "Karte der");
				Doc_PrintLine	(nDocID, 0, "Kolonie");

				// FIXME: mehrere Texte an verschiedenen Stellen für Location-Beschriftung funzen nicht.
				Doc_SetFont(nDocID, 0, FONT_BOOK_SMALL);
				Doc_SetMargins(nDocID, 0, 110, 300, 10, 10, 1);
				Doc_PrintLine	(nDocID, 0, "Neues Lager");

				Doc_SetMargins(nDocID, 0, 350, 200, 10, 10, 1);
				Doc_PrintLine	(nDocID, 0, "Altes Lager");

				Doc_SetMargins(nDocID, 0, 200, 420, 10, 10, 1);
				Doc_PrintLine	(nDocID, 0, "Dämonenbeschwörer");

				Doc_SetMargins(nDocID, 0, 510, 340, 10, 10, 1);
				Doc_PrintLine	(nDocID, 0, "Sekten-Lager");
	*/

	Doc_Show(nDocID);
};

/******************************************************************************************/
instance ItMi_Saw(C_Item)
{
	name						= "Säge";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Saege.3DS";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

instance FakeBook(C_Item)
{
	name						= "FakeBook";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	hp							= 5;
	hp_max						= 5;
	weight						= 1;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "Buch";

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItKe_Pos(C_Item) // Schlüssel für Truhe im Krankenviertel
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Schluessel;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = Value_Schluessel;
};

instance ItKe_Nabor(C_Item) // Schlüssel für Truhe von Nabor
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Schluessel;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = Value_Schluessel;
};
