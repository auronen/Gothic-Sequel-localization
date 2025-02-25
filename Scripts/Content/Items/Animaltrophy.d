// ************************************************************************************************
// Wert von Tiertrophäen
// ************************************************************************************************

// Werte der Trophäen
const int Value_Bugmeat						= 1; const int HP_Bugmeat = 10;
const int Value_MoleratGrease				= 3;
const int Value_Zaehne						= 5;
const int Value_Krallen						= 7;
const int Value_Wolfsfell					= 5;
const int Value_Orkhundfell					= 7;
const int Value_Panzerplatte				= 25;
const int Value_Crawlerzangen				= 5;
const int Value_Shadowbeastfell				= 50;
const int Value_Lurkerklaue					= 7;
const int Value_Lurkerhaut					= 12;
const int Value_Sumpfhaihaut				= 100;
const int Value_Trollfell					= 150;
const int Value_Fuegel						= 7;	// Bloodfly
const int Value_Stachel						= 12;	// Bloodfly
const int Value_DemonSting					= 25;	// Dämonische tiere

// Durch Ulu-Mulu freigeschaltet
// bei Auftragsvergabe werden je 3 neue Monster gespawnt
const int Value_Feuerzunge					= 200;
const int Value_Sumpfhaizaehne				= 200;
const int Value_Shadowbeasthorn				= 200;
const int Value_Trollhauer					= 200;

// Golems beim Dämonenbeschwörer
const int Value_Steinherz					= 400;
const int Value_Feuerherz					= 400;
const int Value_Eisherz						= 400;
const int Value_Eistueck					= 50;

/*
So in der Tasche
----------------
ItAt_Meatbug 			//Meatbug			Körper (Essen)		(Item-Instanz in Food.d)
ItFo_MuttonRaw			//Scavenger			2 Bollen			OK
						//Molerats			2 Bollen			OK
						//Shadowbeast		4 Bollen			OK

ItAt_BloodflyWings 		//Bloodfly			Flügel				OK

Durch Jäger freigeschaltet (noch nicht verteilt)
//--------------------------------------------------------------
ItAt_Teeth 				//Wolf				2 Zähne				OK
						//Schwarzer Wolf	2 Zähne				OK
						//Snapper			10 Zähne			OK
						//Orcbiter			2 Zähne				OK
						//Shadowbeast		4 Zähne				OK
						//Bloodhound		4 Zähne				OK
//--------------------------------------------------------------
ItAt_Claws 				//Waran				4 Klauen			OK
						//Feuerechse		4 Klauen			OK
						//Snapper			3 Klauen			OK
						//Razor				3 Klauen			OK
						//Beisser			2 Klauen			OK
ItAt_LurkerClaw 		//Lurker 			2 Klauen			OK
//--------------------------------------------------------------
ItAt_Wolf 				//Wolf	 			Wolfsfell			OK
ItAt_Wolf_02 			//Orkhund	 		Orkhundfell			OK
ItAt_ShadowFur 			//Shadowbeast		Shadowbeast-Fell	OK
ItAt_TrollFur 			//Troll				Trollfell			OK
//--------------------------------------------------------------
ItAt_SwampsharkSkin 	//Sumpfhai			Haut des Sumpfhais	OK
ItAt_LurkerSkin 		//Lurker			Haut des Lurkers	OK

Durch Templer / Kalom freigeschaltet (noch nicht verteilt)
------------------------------------
ItAt_MandiblesCrawler 	//Crawler		 	Zangen				OK
ItAt_BloodflySting 		//Bloodfly			Stachel				OK

Durch ORG_855_Wolf freigeschaltet
------------------------
ItAt_PlatesCrawler		//Crawler			Panzerplatten		OK

Durch Ulu-Mulu freigeschaltet
-----------------------------
ItAt_Waran				//Feuerechse		Flammenzunge		OK
ItAt_SwampsharkTeeth 	//Sumpfhai			Zähne des Sumpfhais	OK
ItAt_ShadowHorn 		//Shadowbeast		Horn				OK
ItAt_TrollTheeth 		//Troll				Hauer				OK
*/

/******************************************************************************************/
instance ItAt_Meatbug(C_Item)
{
	name						= NAME_MeatBug;

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Meatbug_01.3DS";
	material					= MAT_LEATHER;

	change_atr[0]				= ATR_HITPOINTS; change_value[0] = HP_Bugmeat;

	scemeName					= "FOOD";
	on_state[0]					= UseBugmeat;

	value						= Value_Bugmeat;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Bugmeat;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_Bugmeat;
};

func void UseBugmeat()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Bugmeat);
};

//////////////////////////////////////////////////////////////////////////////////
//	Moleratfett
//////////////////////////////////////////////////////////////////////////////////
instance ItAt_MoleratGrease(C_Item)
{
	name						= NAME_MoleratGrease;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Alchemy_Moleratlubric_01.3DS";
	material					= MAT_CLAY;

	value						= Value_MoleratGrease;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_Teeth(C_Item)
{
	name						= NAME_Teeth;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Teeth_01.3DS";
	material					= MAT_LEATHER;

	value						= Value_Zaehne;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_Wolf(C_Item)
{
	name						= NAME_WolfFur;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Wolf_01.3DS";
	material					= MAT_LEATHER;

	value						= Value_Wolfsfell;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_Wolf_02(C_Item)
{
	name						= NAME_OrkDogFur;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Wolf_02.3DS";
	material					= MAT_LEATHER;

	value						= Value_Orkhundfell;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_Waran(C_Item)
{
	name						= NAME_WaranTongue;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Waran_01.3DS";
	material					= MAT_LEATHER;

	value						= Value_Feuerzunge;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_Claws(C_Item)
{
	name						= NAME_Claws;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Claws_01.3DS";
	material					= MAT_LEATHER;

	value						= Value_Krallen;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_PlatesCrawler(C_Item)
{
	name						= NAME_CrawlerPlates;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItAt_Crawler_02.3DS";
	material					= MAT_WOOD;

	value						= Value_Panzerplatte;

	description					= "Die Panzerplatte eines Minecrawler Kriegers";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_MandiblesCrawler(C_Item)
{
	name						= NAME_CrawlerMandibles;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Crawler_01.3DS";
	material					= MAT_LEATHER;

	value						= Value_Crawlerzangen;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_ShadowFur(C_Item)
{
	name						= NAME_ShadowFur;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Shadowbeast_01.3DS";
	material					= MAT_LEATHER;

	value						= Value_Shadowbeastfell;

	description					= "Fell eines Schattenläufers";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_ShadowHorn(C_Item)
{
	name						= NAME_ShadowHorn;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Shadowbeast_02.3DS";
	material					= MAT_LEATHER;

	value						= Value_Shadowbeasthorn;

	description					= "Horn eines Schattenläufers";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_LurkerClaw(C_Item)
{
	name						= NAME_LurkerClaw;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Lurker_01.3DS";
	material					= MAT_LEATHER;

	value						= Value_Lurkerklaue;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_LurkerSkin(C_Item)
{
	name						= NAME_LurkerSkin;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Lurker_02.3DS";
	material					= MAT_LEATHER;

	value						= Value_Lurkerhaut;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_TrollTheeth(C_Item)
{
	name						= NAME_TrollTeeth;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Troll_02.3DS";
	material					= MAT_LEATHER;

	value						= Value_Trollhauer;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_TrollFur(C_Item)
{
	name						= NAME_TrollFur;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Troll_01.3DS";
	material					= MAT_LEATHER;

	value						= Value_Trollfell;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_SwampsharkSkin(C_Item)
{
	name						= NAME_SwampsharkSkin;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Swampshark_01.3DS";
	material					= MAT_LEATHER;

	value						= Value_Sumpfhaihaut;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_SwampsharkTeeth(C_Item)
{
	name						= NAME_SwampsharkTeeth;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Swampshark_02.3DS";
	material					= MAT_LEATHER;

	value						= Value_Sumpfhaizaehne;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_BloodflyWings(C_Item)
{
	name						= NAME_BloodflyWings;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Bloodfly_01.3DS";
	material					= MAT_LEATHER;

	value						= Value_Fuegel;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_BloodflySting(C_Item)
{
	name						= NAME_BloodflySting;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Bloodfly_02.3DS";
	material					= MAT_LEATHER;

	value						= Value_Stachel;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_DemonSting(C_Item)
{
	name						= NAME_DemonSting;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItAt_Bloodfly_02.3DS";
	material					= MAT_LEATHER;

	value						= Value_DemonSting;

	description					= name;
	text[0]						= "Diese messerscharfen Dornen";				count[0] = 0;
	text[1]						= "sind auf allen von Dämonen";					count[1] = 0;
	text[2]						= "besessenen Tieren zu finden.";				count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

/******************************************************************************************/
instance ItAt_StoneGolemHeart(C_Item)
{
	name						= NAME_StonegolemHeart;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MISSION;

	visual						= "ItAt_StoneGolem_01.3DS";
	material					= MAT_STONE;

	spell						= SPL_WINDFIST;

	value						= Value_Steinherz;

	description					= name;
	text[0]						= "Dieses Herz stammt aus den Überresten";		count[0] = 0;
	text[1]						= "eines besiegten Steingolems.";				count[1] = 0;
	text[2]						= "Es hat die Kraft, einen Gegner";				count[2] = 0;
	text[3]						= "durch die Luft zu schleudern.";				count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItAt_FireGolemHeart(C_Item)
{
	name						= NAME_FiregolemHeart;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MISSION;

	visual						= "ItAt_FireGolem_01.3DS";
	material					= MAT_STONE;

	spell						= SPL_FIREBALL;

	value						= Value_Feuerherz;

	description					= name;
	text[0]						= "Dieses Herz stammt aus den Überresten";		count[0] = 0;
	text[1]						= "eines besiegten Feuergolems.";				count[1] = 0;
	text[2]						= "Es hat die Kraft, einen Gegner";				count[2] = 0;
	text[3]						= "in Flammen aufgehen zu lassen.";				count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItAt_IceGolemHeart(C_Item)
{
	name						= NAME_IcegolemHeart;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MISSION;

	visual						= "ItAt_IceGolem_01.3DS";
	material					= MAT_STONE;

	spell						= SPL_ICECUBE;

	value						= Value_Eisherz;

	description					= name;
	text[0]						= "Dieses Herz stammt aus den Überresten";		count[0] = 0;
	text[1]						= "eines besiegten Eisgolems.";					count[1] = 0;
	text[2]						= "Es hat die Kraft, einen Gegner";				count[2] = 0;
	text[3]						= "zu Eis erstarren zu lassen.";				count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItAt_IceGolemPiece(C_Item)
{
	name						= NAME_IcegolemPiece;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAt_IceGolem_01.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= 500;
	spell						= SPL_THUNDERBOLT;

	value						= Value_Eistueck;

	description					= name;
	text[0]						= "Dieses Stück stammt aus den Überresten";		count[0] = 0;
	text[1]						= "eines besiegten Eisgolems.";					count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};
