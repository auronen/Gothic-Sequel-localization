//---------------------------------------------------------------------
//	herausgereichte Engine-Konstanten
//---------------------------------------------------------------------
const int NPC_MINIMAL_DAMAGE				= 2;

//---------------------------------------------------------------------
//	Spielstart-Konstanten
//---------------------------------------------------------------------
const int HERO_START_LP						= 50;

//---------------------------------------------------------------------
//	LERNPUNKT-KOSTEN
//---------------------------------------------------------------------
const int LPCOST_ATTRIBUTE_STRENGTH			= 1;
const int LPCOST_ATTRIBUTE_DEXTERITY		= 1;
const int LPCOST_ATTRIBUTE_MANA				= 1;

const int LPCOST_TALENT_MAGE_1				= 10;
const int LPCOST_TALENT_MAGE_2				= 15;
const int LPCOST_TALENT_MAGE_3				= 20;
const int LPCOST_TALENT_MAGE_4				= 25;
const int LPCOST_TALENT_MAGE_5				= 30;
const int LPCOST_TALENT_MAGE_6				= 40;

const int LPCOST_TALENT_1H_1				= 10;
const int LPCOST_TALENT_1H_2				= 20;
const int LPCOST_TALENT_2H_1				= 30;
const int LPCOST_TALENT_2H_2				= 40;
const int LPCOST_TALENT_STAFF_1				= 50;
const int LPCOST_TALENT_STAFF_2				= 60;

const int LPCOST_TALENT_BOW_1				= 10;
const int LPCOST_TALENT_BOW_2				= 20;
const int LPCOST_TALENT_CROSSBOW_1			= 10;
const int LPCOST_TALENT_CROSSBOW_2			= 20;

const int LPCOST_TALENT_ACROBAT				= 10;
const int LPCOST_TALENT_SNEAK				= 10;
const int LPCOST_TALENT_PICKLOCK_1			= 10;
const int LPCOST_TALENT_PICKLOCK_2			= 20;
const int LPCOST_TALENT_PICKPOCKET_1		= 10;
const int LPCOST_TALENT_PICKPOCKET_2		= 20;

//--------- Schmieden --------------------------
const int LPCOST_TALENT_SMITH_1				= 5;
const int LPCOST_TALENT_SMITH_2				= 10;
const int LPCOST_TALENT_SMITH_3				= 20;

const int LPCOST_KNOWLEDGE_LONGSWORD		= 1;
const int LPCOST_KNOWLEDGE_BROADSWORD		= 2;
const int LPCOST_KNOWLEDGE_BASTARDSWORD		= 5;
const int LPCOST_KNOWLEDGE_2HSWORD			= 10;
const int LPCOST_KNOWLEDGE_ORCSWORD			= 20;
const int LPCOST_KNOWLEDGE_HATCHET			= 2;
const int LPCOST_KNOWLEDGE_BATTLEAXE		= 5;
const int LPCOST_KNOWLEDGE_DOUBLEBLADEDAXE	= 10;
const int LPCOST_KNOWLEDGE_BERSERKAXE		= 20;
const int LPCOST_KNOWLEDGE_ORCAXE			= 40;
const int LPCOST_KNOWLEDGE_IRONCLUB			= 5;
const int LPCOST_KNOWLEDGE_MACE				= 10;
const int LPCOST_KNOWLEDGE_MORNINGSTAR		= 20;
const int LPCOST_KNOWLEDGE_WARHAMMER		= 30;
const int LPCOST_KNOWLEDGE_ORCHAMMER		= 40;

//--------- Kochen --------------------------
const int LPCOST_TALENT_COOK_1				= 5;
const int LPCOST_TALENT_COOK_2				= 10;
const int LPCOST_TALENT_COOK_3				= 20;

//--------- Alchemie --------------------------
const int LPCOST_TALENT_ALCHEMY_1			= 5;
const int LPCOST_TALENT_ALCHEMY_2			= 10;
const int LPCOST_TALENT_ALCHEMY_3			= 20;

//--------- Thaumaturgy -----------------------
const int LPCOST_TALENT_THAUMATURGY_1		= 5;
const int LPCOST_TALENT_THAUMATURGY_2		= 10;
const int LPCOST_TALENT_THAUMATURGY_3		= 20;

//--------- Bogenmachen -----------------------
const int LPCOST_TALENT_BOWMAKER_1			= 5;
const int LPCOST_TALENT_BOWMAKER_2			= 10;
const int LPCOST_TALENT_BOWMAKER_3			= 20;

//---------------------------------------------------------------------
//	ERFAHRUNGSPUNKTE FÜR MISSIONEN
//---------------------------------------------------------------------

//--------- Kapitel 1 -----------------------
// Schmieden
const int XP_Sylvester_OreCave_Friendly		= 600;
const int XP_Sylvester_OreCave_Selfish		= 200;
const int XP_BroughtFirstOre				= 200;
const int XP_FirstRawIron					= 100;
const int XP_FirstHotRawIron				= 200;
const int XP_FirstHotSwordblade				= 300;
const int XP_FirstSwordblade				= 400;
const int XP_FirstShortsword				= 600;
const int XP_MadeShortswords				= 800;

const int XP_Goliath_Persuade				= 1000;
const int XP_Gotmar_GoliathReturned			= 2000;

// Arena
const int XP_Arena_WonGrimFight				= 400;
const int XP_Arena_WonGoliathFight			= 800;
const int XP_Arena_WonBrutusFight			= 2000;
const int XP_Arena_WonMalgarFight			= 4000;
const int XP_Arena_WonThoraFight			= 8000;

// Kochen lernen
const int XP_Snaf_GaveRecipe				= 1000;

// Zaubern/Runenschmieden lernen

const int XP_Lester_HaveOre					= 200;
const int XP_Lester_HaveScroll				= 200;
const int XP_Lester_MadeRunestone			= 400;
const int XP_Lester_MadeRune				= 800;
const int XP_Lester_FoundThunderbolt		= 600;
const int XP_Lester_FoundHeal				= 600;
const int XP_GotBloodOre					= 2000;

// Kampftalente und -Missionen M.F.
const int XP_BeatedUpHuldrych				= 300;
const int XP_HuldrychLektion				= 400; // Auftrag erfüllt
const int XP_AgonSilverSelf					= 200; // Agon 100 Silber gegeben
const int XP_AgonSilver						= 200; // Agon 100 Silber gegeben
const int XP_HuldrychDeal					= 200; // Mit Huldrych geteilt

// Bogentalente
const int XP_Bow1							= 200; // + 3xMeatbug  XP!
const int XP_Bow2							= 600; // + CrawlerXP !

// Diebestalente
const int XP_LearnPicklock					= 600; // Von Lakarus Sumpfkraut besorgt

// Alchemie
const int XP_Talamon_BringFormula			= 600;
const int XP_Talamon_ElexirRegs				= 1000;
const int XP_Talamon_GotElexir				= 1000;

// Spur des Phoenix
const int XP_Phoenix2						= 200;
const int XP_Phoenix3						= 300;
const int XP_Phoenix4						= 400;
const int XP_Phoenix5						= 600;
const int XP_Phoenix6						= 800;
const int XP_Phoenix7						= 1000;
const int XP_Phoenix8						= 1200;
const int XP_Phoenix9						= 2000;

// sonstiges
const int XP_Hyglas							= 100;
const int XP_KnowsGods						= 100;

// Hauptmissionen
const int XP_Potion_Brought					= 2000;
const int XP_Rune_Brought					= 2000;
const int XP_Sword_Brought					= 2000;
const int XP_RuneswordComplete				= 4000;
const int XP_DTEscaped						= 1000;

//---------------------------------------------------------------------
//	XP für Exploration
//---------------------------------------------------------------------

//-------- Old Camp --------
const int XP_EXPLO_Roof_1					= 2000;	// Dach Gardistenhaus
const int XP_EXPLO_Roof_2					= 2000;	// Dach Burgschmiede
const int XP_EXPLO_Roof_3					= 3000;	// Dach Kapelle
const int XP_EXPLO_Roof_4					= 3000;	// Dach Erzbaronhaus
const int XP_EXPLO_Roof_5					= 1000;	// Dach Hausruine OCC

//-------- Surface --------
const int XP_EXPLO_Beaverlodge				= 2000;
