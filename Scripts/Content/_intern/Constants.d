// *********************
//      Constants
//    Phoenix V0.67
// *********************

//
//	NPC ATTRIBUTES
//
	const int ATR_HITPOINTS								= 0;									// Lebenspunkte
	const int ATR_HITPOINTS_MAX							= 1;									// Max. Lbenspunkte
	const int ATR_MANA									= 2;									// Mana Mana
	const int ATR_MANA_MAX								= 3;									// Mana Max

	const int ATR_STRENGTH								= 4;									// Stärke
	const int ATR_DEXTERITY								= 5;									// Geschick
	const int ATR_REGENERATEHP							= 6;									// Regenerierung von HP alle x sekunden
	const int ATR_REGENERATEMANA						= 7;									// Regenerierung von Mana alle x sekunden

	const int ATR_INDEX_MAX								= 8;

//
//	NPC FLAGS
//
	const int NPC_FLAG_FRIEND							= 1 << 0;
	const int NPC_FLAG_IMMORTAL							= 1 << 1;

//
//	FIGHT MODES
//
	const int FMODE_NONE								= 0;
	const int FMODE_FIST								= 1;
	const int FMODE_MELEE								= 2;
	const int FMODE_FAR									= 6;
	const int FMODE_MAGIC								= 8;

//
//	WALK MODES
//
	const int NPC_RUN									= 0;
	const int NPC_WALK									= 1;
	const int NPC_SNEAK									= 2;
	const int NPC_RUN_WEAPON							= 0 + 128;
	const int NPC_WALK_WEAPON							= 1 + 128;
	const int NPC_SNEAK_WEAPON							= 2 + 128;

//
//	ARMOR FLAGS
//
	const int WEAR_TORSO								= 1;									//	Oberkoerper	( Brustpanzer )
	const int WEAR_HEAD									= 2;									//	Kopf		( Helm )

//
//	INVENTORY CATEGORIES
//
	const int INV_WEAPON								= 1;
	const int INV_ARMOR									= 2;
	const int INV_RUNE									= 3;
	const int INV_MAGIC									= 4;
	const int INV_FOOD									= 5;
	const int INV_POTION								= 6;
	const int INV_DOC									= 7;
	const int INV_MISC									= 8;
	const int INV_CAT_MAX								= 9;

//
//	INVENTORY CAPACITIES
//
	const int INV_MAX_WEAPONS							= 6;
	const int INV_MAX_ARMORS							= 2;
	const int INV_MAX_RUNES								= 1000;									//	virtually infinite
	const int INV_MAX_FOOD								= 15;
	const int INV_MAX_DOCS								= 1000;									//	virtually infinite
	const int INV_MAX_POTIONS							= 1000;									//	virtually infinite
	const int INV_MAX_MAGIC								= 1000;									//	virtually infinite
	const int INV_MAX_MISC								= 1000;

//
//	ITEM TEXTS
//
	const int ITM_TEXT_MAX								= 6;

//
//	ITEM CATEGORIES
//
	const int ITEM_KAT_NONE								= 1 <<  0;								//	Sonstiges
	const int ITEM_KAT_NF								= 1 <<  1;								//	Alle Nahkampfwaffen
	const int ITEM_KAT_FF								= 1 <<  2;								//	Alle Fernkampfwaffen
	const int ITEM_KAT_MUN								= 1 <<  3;								//	Jede Art von Munition (->MultiSlot)
	const int ITEM_KAT_ARMOR							= 1 <<  4;								//	Rüstungen und Helme
	const int ITEM_KAT_FOOD								= 1 <<  5;								//	Alle Nahrungsmittel (->MultiSlot)
	const int ITEM_KAT_DOCS								= 1 <<  6;								//	Alle Dokumente
	const int ITEM_KAT_POTIONS							= 1 <<  7;								//	Traenke
	const int ITEM_KAT_LIGHT							= 1 <<  8;								//	Alle Lichtquellen
	const int ITEM_KAT_RUNE								= 1 <<  9;								//	Runen und Scrolls
	const int ITEM_KAT_MAGIC							= 1 << 31;								//	Ringe und Amulette
	const int ITEM_KAT_KEYS								= ITEM_KAT_NONE;

//
//	ITEM FLAGS
//
	const int ITEM_BURN									= 1 << 10;								//	Brennbar
	const int ITEM_MISSION								= 1 << 12;								//	Missionsgegenstand
	const int ITEM_MULTI								= 1 << 21;
	const int ITEM_TORCH								= 1 << 28;								//	Wie eine Fackel behandeln
	const int ITEM_THROW								= 1 << 29;								//	Gegenstand kann geworfen werden

//
//	ITEM WEAPON FLAGS
//
	const int ITEM_SWD									= 1 << 14;								//	Waffe wird wie ein Schwert behandelt
	const int ITEM_AXE									= 1 << 15;								//	Waffe wird wie eine Axt behandelt
	const int ITEM_2HD_SWD								= 1 << 16;								//	Waffe wird wie ein Zweihänder behandelt
	const int ITEM_STAFF								= 1 << 23;								//	Kampfstab NEU seit Version 1.10
	const int ITEM_2HD_AXE								= 1 << 17;								//	Waffe wird wie eine Streitaxt behandelt
	const int ITEM_BOW									= 1 << 19;								//	Waffe wird wie ein Bogen behandelt
	const int ITEM_CROSSBOW								= 1 << 20;								//	Waffe wird wie eine Armbrust behandelt
	const int ITEM_AMULET								= 1 << 22;
	const int ITEM_RING									= 1 << 11;

//
//	DAMAGE TYPES v2.0
//
	const int DAM_INVALID								= 0;									//	  0 - 0x00 - nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden )
	const int DAM_BARRIER								= 1;									//	  1 - 0x01 - nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden )
	const int DAM_BLUNT									= DAM_BARRIER	<< 1;					//	  2 - 0x02 - blunt ist das bit links von barrier
	const int DAM_EDGE									= DAM_BLUNT		<< 1;					//	  4 - 0x04 - edge 	ist das bit links von blunt
	const int DAM_FIRE									= DAM_EDGE		<< 1;					//	  8 - 0x08 - fire 	ist das bit links von edge
	const int DAM_FLY									= DAM_FIRE		<< 1;					//	 16 - 0x10 - fly 	ist das bit links von fire
	const int DAM_MAGIC									= DAM_FLY		<< 1;					//	 32 - 0x20 - magic	ist das bit links von fly
	const int DAM_POINT									= DAM_MAGIC		<< 1;					//	 64 - 0x40 - point	ist das bit links von magic
	const int DAM_FALL									= DAM_POINT		<< 1;					//	128 - 0x80 - nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden )

//
//	DAMAGE TYPE ARRAY INDICES	( !!! DAM_XXX = 1 << DAM_INDEX_XXX !!! )
//
	const int DAM_INDEX_BARRIER							= 0;									//	nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden )
	const int DAM_INDEX_BLUNT							= DAM_INDEX_BARRIER + 1;
	const int DAM_INDEX_EDGE							= DAM_INDEX_BLUNT	+ 1;
	const int DAM_INDEX_FIRE							= DAM_INDEX_EDGE	+ 1;
	const int DAM_INDEX_FLY								= DAM_INDEX_FIRE	+ 1;
	const int DAM_INDEX_MAGIC							= DAM_INDEX_FLY		+ 1;
	const int DAM_INDEX_POINT							= DAM_INDEX_MAGIC	+ 1;
	const int DAM_INDEX_FALL							= DAM_INDEX_POINT	+ 1;				//	nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden )
	const int DAM_INDEX_MAX								= DAM_INDEX_FALL	+ 1;

//
//	OTHER DAMAGE CONSTANTS
//
	const int NPC_ATTACK_FINISH_DISTANCE				= 180;
	const int NPC_BURN_TICKS_PER_DAMAGE_POINT			= 100;
	const int DAM_CRITICAL_MULTIPLIER					= 2;

// Entfernung für Meuchelmord mit 1h
	const int NPC_ATTACK_ASSASSIN_RANGE					= 100;
	const int NPC_ATTACK_1HSASSASIN_DISTANCE			= 75;

	const int BLOOD_SIZE_DIVISOR						= 1000;
	const int BLOOD_DAMAGE_MAX							= 200;

	const int DAMAGE_FLY_CM_MAX							= 2000;
	const int DAMAGE_FLY_CM_MIN							= 300;
	const int DAMAGE_FLY_CM_PER_POINT					= 5;

	const int NPC_DAM_DIVE_TIME							= 100;

//
//	PROTECTION TYPES v2.0
//
	const int PROT_BARRIER								= DAM_INDEX_BARRIER;
	const int PROT_BLUNT								= DAM_INDEX_BLUNT;
	const int PROT_EDGE									= DAM_INDEX_EDGE;
	const int PROT_FIRE									= DAM_INDEX_FIRE;
	const int PROT_FLY									= DAM_INDEX_FLY;
	const int PROT_MAGIC								= DAM_INDEX_MAGIC;
	const int PROT_POINT								= DAM_INDEX_POINT;
	const int PROT_FALL									= DAM_INDEX_FALL;
	const int PROT_INDEX_MAX							= DAM_INDEX_MAX;

//
// Talents
//

	const int NPC_TALENT_UNKNOWN						= 0;
// Skilled Talents
	const int NPC_TALENT_1H								= 1;
	const int NPC_TALENT_2H								= 2;
	const int NPC_TALENT_STAFF							= 3;									// neu ab Version 1.10
	const int NPC_TALENT_BOW							= 4;
	const int NPC_TALENT_CROSSBOW						= 5;
	const int NPC_TALENT_PICKLOCK						= 6;
	const int NPC_TALENT_PICKPOCKET						= 7;
	const int NPC_TALENT_MAGE							= 8;
// Special-Talents
	const int NPC_TALENT_SNEAK							= 9;
	const int NPC_TALENT_SMITH							= 10;
	const int NPC_TALENT_COOK							= 11;
	const int NPC_TALENT_ACROBAT						= 12;
	const int NPC_TALENT_THAUMATURGY					= 13;
	const int NPC_TALENT_BOWMAKER						= 14;
	const int NPC_TALENT_ALCHEMY						= 15;

// by Markus wg. V 1.09, 10 neue User defined Talente
	const int NPC_TALENT_ANIMALTAMING					= 16;
	const int NPC_TALENT_BATTLESTAFF					= 17;
	const int NPC_TAL_USERDEF_6							= 18;
	const int NPC_TAL_USERDEF_7							= 19;
	const int NPC_TAL_USERDEF_8							= 20;
	const int NPC_TAL_USERDEF_9							= 21;
	const int NPC_TAL_USERDEF_10						= 22;

	const int NPC_TALENT_MAX							= 23;

//
//	PERCEPTIONS	( ACTIVE )
//
	const int PERC_ASSESSPLAYER							= 1;
	const int PERC_ASSESSENEMY							= 2;
	const int PERC_ASSESSFIGHTER						= 3;
	const int PERC_ASSESSBODY							= 4;
	const int PERC_ASSESSITEM							= 5;

//
//	SENSES
//
	const int SENSE_SEE									= 1 << 0;
	const int SENSE_HEAR								= 1 << 1;
	const int SENSE_SMELL								= 1 << 2;

//
//	PERCEPTIONS	( PASSIVE )
//
	const int PERC_ASSESSMURDER							= 6;
	const int PERC_ASSESSDEFEAT							= 7;
	const int PERC_ASSESSDAMAGE							= 8;
	const int PERC_ASSESSOTHERSDAMAGE					= 9;
	const int PERC_ASSESSTHREAT							= 10;
	const int PERC_ASSESSREMOVEWEAPON					= 11;
	const int PERC_OBSERVEINTRUDER						= 12;
	const int PERC_ASSESSFIGHTSOUND						= 13;
	const int PERC_ASSESSQUIETSOUND						= 14;
	const int PERC_ASSESSWARN							= 15;
	const int PERC_CATCHTHIEF							= 16;
	const int PERC_ASSESSTHEFT							= 17;
	const int PERC_ASSESSCALL							= 18;
	const int PERC_ASSESSTALK							= 19;
	const int PERC_ASSESSGIVENITEM						= 20;
	const int PERC_ASSESSFAKEGUILD						= 21;
	const int PERC_MOVEMOB								= 22;
	const int PERC_MOVENPC								= 23;
	const int PERC_DRAWWEAPON							= 24;
	const int PERC_OBSERVESUSPECT						= 25;
	const int PERC_NPCCOMMAND							= 26;
	const int PERC_ASSESSMAGIC							= 27;
	const int PERC_ASSESSSTOPMAGIC						= 28;
	const int PERC_ASSESSCASTER							= 29;
	const int PERC_ASSESSSURPRISE						= 30;
	const int PERC_ASSESSENTERROOM						= 31;
	const int PERC_ASSESSUSEMOB							= 32;

//
//	NEWS SPREAD MODE
//
	const int NEWS_DONT_SPREAD							= 0;
	const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_VICTIM	= 1;
	const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_WITNESS	= 2;
	const int NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_OFFENDER	= 3;
	const int NEWS_SPREAD_NPC_SAME_GUILD_VICTIM			= 4;

//
//	NEWS CONSTANTS
//
	const int IMPORTANT									= 1;

//
//	INFO STATUS
//
	const int INF_TELL									= 0;
	const int INF_UNKNOWN								= 2;

//
//	MISSION STATUS
//
	const int LOG_RUNNING								= 1;									//	Mission läuft gerade
	const int LOG_SUCCESS								= 2;									//	Mission erfolgreich beendet
	const int LOG_FAILED								= 3;									//	Mission wurde abgebrochen
	const int LOG_OBSOLETE								= 4;									//	Mission ist hinfaellig

//
//	ATTITUDES
//
	const int ATT_FRIENDLY								= 3;
	const int ATT_NEUTRAL								= 2;
	const int ATT_ANGRY									= 1;
	const int ATT_HOSTILE								= 0;

//
//	HUMAN GUILDS
//
	const int GIL_NONE									= 0;									//	gildenlose
	const int GIL_HUMAN									= 1;									//	Special Guild -> Set Constants for all Human Guilds
	const int GIL_MILITIA								= 1;									//	die Lager-Miliz
	const int GIL_WORKER								= 2;									//	die Arbeiter des Lagers
	const int GIL_MINER									= 3;									//	die "neuen" Minenarbeiter
	const int GIL_HEALER								= 4;									//	die Heiler
	const int GIL_THIEF									= 5;									//	die Diebe
	const int GIL_POSSESSED								= 6;									//	die von Dämonen besessenen
	const int GIL_BEGGAR								= 7;									//	die Bettler
	const int GIL_DEMONIC								= 8;									//	die Bösen dämonischen
	const int GIL_AMAZON								= 9;									//	die Amazonen
	const int GIL_PALADIN								= 10;									//	der König und seine Paladine
	const int GIL_KDF									= 11;									//	die Feuermagier
	const int GIL_BLOODEARTH							= 12;									//	der orkische Bluterde-Stamm
	const int GIL_DEMONHUNTER							= 13;									//
	const int GIL_RSVD_2								= 14;									//
	const int GIL_RSVD_3								= 15;									//

	const int GIL_SEPERATOR_HUM							= 16;
	const int MAX_GUILDS								= 16;

	const int GIL_WARAN									= 17;									//	Waran
	const int GIL_SLF									= 18;									//	Schläfer
	const int GIL_GOBBO									= 19;									//	Gobbo (Höhlen und Oberwelt)
	const int GIL_TROLL									= 20;									//	Troll
	const int GIL_SNAPPER								= 21;									//	Snapper (neu)
	const int GIL_MINECRAWLER							= 22;									//	Minecrawler & Queen
	const int GIL_MEATBUG								= 23;									//	Meatbugs
	const int GIL_SCAVENGER								= 24;									//	Attack Chicken
	const int GIL_DEMON									= 25;									//	der Geflügel(te) Dämon
	const int GIL_WOLF									= 26;									//	Oberwelt Wolf
	const int GIL_SHADOWBEAST							= 27;									//	Unsere Miezekatz'
	const int GIL_BLOODFLY								= 28;									//	Scorpionlibelle
	const int GIL_SWAMPSHARK							= 29;									//	Sumpfhai
	const int GIL_ZOMBIE								= 30;									//	"Menschen" Zombies
	const int GIL_UNDEADORC								= 31;									//	Untote Orcs (Krieger & Hohepriester)
	const int GIL_SKELETON								= 32;									//	"Menschen" Skelette
	const int GIL_ORCDOG								= 33;									//	Orc-Wachhund (Zähne auf Beinen)
	const int GIL_MOLERAT								= 34;									//	Der Nacktmole
	const int GIL_GOLEM									= 35;									//	Lapidor
	const int GIL_LURKER								= 36;

	const int GIL_SEPERATOR_ORC							= 37;

	const int GIL_ORCSHAMAN								= 38;
	const int GIL_ORCWARRIOR							= 39;
	const int GIL_ORCSCOUT								= 40;
	const int GIL_ORCSLAVE								= 41;

	const int GIL_MAX									= 42;

//
//	GUILD DESCRIPTIONS
//
class C_GILVALUES
{
	var int		WATER_DEPTH_KNEE						[GIL_MAX];
	var int		WATER_DEPTH_CHEST						[GIL_MAX];
	var int		JUMPUP_HEIGHT							[GIL_MAX];								//	DEFAULT = 200;
	//	var int		JUMPUP_FORCE							[GIL_MAX];							//	var int		JUMPUP_FORCE							[GIL_MAX];
	var int		SWIM_TIME								[GIL_MAX];
	var int		DIVE_TIME								[GIL_MAX];
	var int		STEP_HEIGHT								[GIL_MAX];
	var int		JUMPLOW_HEIGHT							[GIL_MAX];
	var int		JUMPMID_HEIGHT							[GIL_MAX];
	var int		SLIDE_ANGLE								[GIL_MAX];
	var int		SLIDE_ANGLE2							[GIL_MAX];
	var int		DISABLE_AUTOROLL						[GIL_MAX];								//	DEFAULT = 0					;  0 = Autoroll  enabled	/ 1 = Autoroll  disabled
	var int		SURFACE_ALIGN							[GIL_MAX];								//	DEFAULT = 0					;  0 = Alignment disabled	/ 1 = Alignment enabled
	var int		CLIMB_HEADING_ANGLE						[GIL_MAX];
	var int		CLIMB_HORIZ_ANGLE						[GIL_MAX];
	var int		CLIMB_GROUND_ANGLE						[GIL_MAX];
	var int		FIGHT_RANGE_BASE						[GIL_MAX];
	var int		FIGHT_RANGE_FIST						[GIL_MAX];
	var int		FIGHT_RANGE_1HS							[GIL_MAX];
	var int		FIGHT_RANGE_1HA							[GIL_MAX];
	var int		FIGHT_RANGE_2HS							[GIL_MAX];
	var int		FIGHT_RANGE_2HA							[GIL_MAX];
	var int		FALLDOWN_HEIGHT							[GIL_MAX];								//									Wie tief Fallen ohne Schaden ?
	var int		FALLDOWN_DAMAGE							[GIL_MAX];								//									Schaden für jeden weiteren angefangenen Meter.
	var int		BLOOD_DISABLED							[GIL_MAX];								//	DEFAULT = 0					;	Blut ganz ausschalten (z.B. bei Sekletten) ?
	var int		BLOOD_MAX_DISTANCE						[GIL_MAX];								//	DEFAULT = 1000				;	Wie weit spritzt das Blut (in cm) ?
	var int		BLOOD_AMOUNT							[GIL_MAX];								//	DEFAULT = 10				;	Wie viel Blut ?
	var int		BLOOD_FLOW								[GIL_MAX];								//	DEFAULT = 0					;	Soll es sich langsam ausbreiten ?
	var string  BLOOD_EMITTER							[GIL_MAX];								//	DEFAULT = "PFX_BLOOD"		;	Welcher Partikel-Emitter ?
	var string  BLOOD_TEXTURE							[GIL_MAX];								//	DEFAULT = "ZBLOODSPLAT2.TGA";	Welche Textur ?
	var int 	TURN_SPEED								[GIL_MAX];								//	DEFAULT = 150				;
};

//
//	SOUND TYPES
//
	const int NPC_SOUND_DROPTAKE						= 1;
	const int NPC_SOUND_SPEAK							= 3;
	const int NPC_SOUND_STEPS							= 4;
	const int NPC_SOUND_THROWCOLL						= 5;
	const int NPC_SOUND_DRAWWEAPON						= 6;
	const int NPC_SOUND_SCREAM							= 7;
	const int NPC_SOUND_FIGHT							= 8;

//
//	MATERIAL TYPES
//
	const int MAT_WOOD									= 0;
	const int MAT_STONE									= 1;
	const int MAT_METAL									= 2;
	const int MAT_LEATHER								= 3;
	const int MAT_CLAY									= 4;
	const int MAT_GLAS									= 5;									// ??

//
//	LOG
//
	const int LOG_MISSION								= 0;
	const int LOG_NOTE									= 1;

//
//	TRADE MANAGER
//
	const string STR_INFO_TRADE_ACCEPT					= "Annehmen";
	const string STR_INFO_TRADE_RESET					= "Ablehnen";
	const string STR_INFO_TRADE_EXIT					= "Zurück";

//
//	OTHER CONSTANTS
//
	const int TIME_INFINITE								= -1000000 / 1000;
	const int NPC_VOICE_VARIATION_MAX					= 10;

//
// COLOR CONSTANTS
//
	const int TEXT_COLOR_WHITE							= 0;
	const int TEXT_COLOR_GRAY							= 1;
	const int TEXT_COLOR_RED							= 2;
	const int TEXT_COLOR_GREEN							= 3;
	const int TEXT_COLOR_BLUE							= 4;
	const int TEXT_COLOR_YELLOW							= 5;

//
// FONTS - Finger weg !!! - Wird vom Programm benutzt !!!
//

// Status-Screen, Auswahl-Screen, Log-Screen
	const string	TEXT_FONT_DEFAULT					= "font_old_10_white.tga";

// Kapitelwechsel-Screen
	const string	TEXT_FONT_10						= "font_old_10_white.tga";

// für die Zahlen im Inventory bei Multi-Items, !!!! MUSS NOCH RAUS für Version 1.12f
	const string	TEXT_FONT_15						= "font_old_10_white.tga";

// Überschrift für Kapitelwechsel
	const string	TEXT_FONT_20						= "font_old_20_white.tga";

// zwischen 4 und 9 dürften valide Bereiche sein
	const int 		TEXT_SPACING_WIDTH					= 6;

//
//	maximal zulässige Textbreiten
//
	const int	TEXT_WIDTH_AIOUTPUT						= 290;									// AI_Ouput()
	const int	TEXT_WIDTH_SVM							= 290;									// AI_OutputSVM()
	const int	TEXT_WIDTH_CINFODESCRIPTION				= 63;									// Multiple-Choice-Dialogzeilen C_Info.description
	const int	TEXT_WIDTH_INFOADDCHOICE				= 63;									// Multiple-Choice-Dialogzeilen Info_AddChoice()
	const int	TEXT_WIDTH_NAME							= 30;									// Name von NSCs, Items und Monstern c_npc.name bzw. c_item.name
	const int	TEXT_WIDTH_TEXT							= 41;									// C_Item.text[]
	const int	TEXT_WIDTH_TEXT_MENU_0					= 15;									// Länge der Hauptmenü-Punkte
	const int	TEXT_WIDTH_TEXT_MENU_1					= 40;									// Kommentar der Hauptmenü-Punkte
	const int	TEXT_WIDTH_DESCRIPTION					= 45;									// C_Item.description
	const int	TEXT_WIDTH_LOGCONSTANTS					= 35;									// Log-Konstanten, die zugleich auch die Missionsüberschriften sind (LOG_CONSTANTS.D)
	const int	TEXT_WIDTH_CONSTANTS					= 62;									// alle anderen Stringkonstanten (hauptsächlich TEXT.D)

// hack: symbol to dump unused return values
	const int _											= 0;

