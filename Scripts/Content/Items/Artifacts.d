/*******************************************************************************************
**		Feuermagier (Runensteine und Scrolls) 											  **
*******************************************************************************************/

// Light (Scrolls und Runen)
instance ItAr_RuneLight(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_42.3ds";
	material					= MAT_STONE;

	spell						= SPL_LIGHT;
	mag_circle					= 1;

	value						= 300;

	description					= NAME_Light;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_LIGHT;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollLight(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_32.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_LIGHT;
	spell						= SPL_LIGHT;

	value						= 5;

	description					= NAME_Light;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
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

/*******************************************************************************************/
// Firebolt alias MagicMissile (Scrolls und Runen)

instance ItAr_RuneFirebolt(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_23.3ds";
	material					= MAT_STONE;

	spell						= SPL_FIREBOLT;
	mag_circle					= 1;

	value						= 300;

	description					= NAME_Firebolt;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_FIREBOLT;
	text[2]						= NAME_Dam_Fire;								count[2] = SPL_DAMAGE_FIREBOLT;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollFirebolt(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_35.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_FIREBOLT;
	spell						= SPL_FIREBOLT;

	value						= 30;

	description					= NAME_Firebolt;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_FIREBOLT;
	text[2]						= NAME_Dam_Fire;								count[2] = SPL_DAMAGE_FIREBOLT;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Fireball (Scrolls und Runen)

instance ItAr_RuneFireball(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_26.3ds";
	material					= MAT_STONE;

	spell						= SPL_FIREBALL;
	mag_circle					= 3;

	value						= 700;

	description					= NAME_Fireball;
	//text[3]					= "";											count[3] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_ManakostenMax;							count[1] = SPL_SENDCAST_FIREBALL;
	text[2]						= ConcatStrings(NAME_Dam_Fire, NAME_PerMana);	count[2] = SPL_DAMAGE_FIREBALL;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Load;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollFireball(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_27.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_FIREBALL;
	spell						= SPL_FIREBALL;

	value						= 70;

	description					= NAME_Fireball;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_ManakostenMax;							count[1] = SPL_SENDCAST_FIREBALL;
	text[2]						= ConcatStrings(NAME_Dam_Fire, NAME_PerMana);	count[2] = SPL_DAMAGE_FIREBALL;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Load;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Firestorm (Scrolls und Runen)

instance ItAr_RuneFirestorm(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_24.3ds";
	material					= MAT_STONE;

	spell						= SPL_FIRESTORM;
	mag_circle					= 4;

	value						= 1100;

	description					= NAME_Firestorm;
	//text[3]					= "";											count[3] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_ManakostenMax;							count[1] = SPL_SENDCAST_FIRESTORM;
	text[2]						= ConcatStrings(NAME_Dam_Fire, NAME_PerMana);	count[2] = SPL_DAMAGE_FIRESTORM;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Load;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollFirestorm(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_28.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_FIRESTORM;
	spell						= SPL_FIRESTORM;

	value						= 110;

	description					= NAME_Firestorm;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_ManakostenMax;							count[1] = SPL_SENDCAST_FIRESTORM;
	text[2]						= ConcatStrings(NAME_Dam_Fire, NAME_PerMana);	count[2] = SPL_DAMAGE_FIRESTORM;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Load;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// FireRain (Scrolls und Runen)

instance ItAr_RuneFireRain(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_25.3ds";
	material					= MAT_STONE;

	spell						= SPL_FIRERAIN;
	mag_circle					= 5;

	value						= 1300;

	description					= NAME_Firerain;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_FIRERAIN;
	text[2]						= NAME_Dam_Fire;								count[2] = SPL_DAMAGE_FIRERAIN;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollFireRain(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_36.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_FIRERAIN;
	spell						= SPL_FIRERAIN;

	value						= 130;

	description					= NAME_Firerain;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_FIRERAIN;
	text[2]						= NAME_Dam_Fire;								count[2] = SPL_DAMAGE_FIRERAIN;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Teleport1 (Scrolls und Runen)

instance ItAr_RuneTeleport1(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_38.3ds";	//rote Rune
	material					= MAT_STONE;

	spell						= SPL_TELEPORT1;

	description					= NAME_Teleport1;
	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItAr_ScrollTeleport1(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_38.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TELEPORT;
	spell						= SPL_TELEPORT1;

	description					= NAME_Teleport1;
	text[0]						= NAME_Manakosten;								count[0] = 0;
	text[1]						= "";											count[1] = SPL_SENDCAST_TELEPORT;
	text[2]						= "Dieser Teleportzauber ist nicht wie andere.";count[2] = 0;
	text[3]						= "Er scheint mehr als nur Mana zu benötigen!";	count[3] = 0;
};

/*******************************************************************************************/
// Teleport2 (Scrolls und Runen)

instance ItAr_RuneTeleport2(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_40.3ds"; //blaue Rune
	material					= MAT_STONE;

	spell						= SPL_TELEPORT2;
	//mag_circle				= 4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description					= NAME_Teleport2;
	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItAr_ScrollTeleport2(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_37.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TELEPORT;
	spell						= SPL_TELEPORT2;

	description					= NAME_Teleport2;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TELEPORT;
};

/*******************************************************************************************/
// Teleport3 (Scrolls und Runen)

instance ItAr_RuneTeleport3(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_41.3ds"; //lila Rune
	material					= MAT_STONE;

	spell						= SPL_TELEPORT3;
	//mag_circle				= 4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description					= NAME_Teleport3;	//blaue Rune
	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TELEPORT;
	text[2]						= "";											count[2] = 0;
	text[3]						= "Diese Rune teleportiert direkt in den";		count[3] = 0;
	text[4]						= "Turm von Xardas dem Dämonenbeschwörer.";		count[4] = 0;
};

instance ItAr_ScrollTeleport3(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_40.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TELEPORT;
	spell						= SPL_TELEPORT3;

	description					= NAME_Teleport3;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TELEPORT;
};

// TELEPORT 4 ist im Missionitems_1 File // M.F.

/*******************************************************************************************/
// Teleport5 (Scrolls und Runen)

instance ItAr_RuneTeleport5(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_39.3ds";	//grüne Rune
	material					= MAT_STONE;

	spell						= SPL_TELEPORT5;
	//mag_circle				= 4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description					= NAME_Teleport4;	//lila Rune
	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItAr_ScrollTeleport5(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_39.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TELEPORT;
	spell						= SPL_TELEPORT5;

	description					= NAME_Teleport4;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TELEPORT;
};

/*******************************************************************************************
**		Wassermagier (Runensteine und Scrolls) 											  **
*******************************************************************************************/

// Heal (Scrolls und Runen)

instance ItAr_RuneHeal(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_27.3ds";
	material					= MAT_STONE;

	spell						= SPL_HEAL;
	mag_circle					= 2;

	value						= 500;

	description					= NAME_Heal;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= "Heilung pro Mana";							count[1] = SPL_HEALING_HP_PER_MP;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Invest;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollHeal(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_01.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_HEALING_HP_PER_MP;
	spell						= SPL_HEAL;

	value						= 50;

	description					= NAME_Heal;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= "Heilung pro Mana";							count[1] = SPL_HEALING_HP_PER_MP;
	text[2]						= NAME_Mana_needed;								count[2] = SPL_HEALING_HP_PER_MP;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Invest;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/

// Verwandlung(nur Scrolls)

instance ItAr_ScrollTrfBloodfly(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_01.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TRF_BLOODFLY;
	spell						= SPL_TRF_BLOODFLY;

	value						= 100;

	description					= NAME_Trf_Bloodfly;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TRF_BLOODFLY;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollTrfCrawler(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_04.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TRF_CRAWLER;
	spell						= SPL_TRF_CRAWLER;

	value						= 100;

	description					= NAME_Trf_Crawler;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TRF_CRAWLER;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollTrfLurker(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_02.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TRF_LURKER;
	spell						= SPL_TRF_LURKER;

	value						= 100;

	description					= NAME_Trf_Lurker;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TRF_LURKER;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollTrfMeatbug(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_03.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TRF_MEATBUG;
	spell						= SPL_TRF_MEATBUG;

	value						= 100;

	description					= NAME_Trf_Meatbug;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TRF_MEATBUG;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollTrfMolerat(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_05.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TRF_MOLERAT;
	spell						= SPL_TRF_MOLERAT;

	value						= 100;

	description					= NAME_Trf_Molerat;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TRF_MOLERAT;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollTrfOrcdog(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_11.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TRF_ORCDOG;
	spell						= SPL_TRF_ORCDOG;

	value						= 200;

	description					= NAME_Trf_Orcdog;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TRF_ORCDOG;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollTrfScavenger(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_07.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TRF_SCAVENGER;
	spell						= SPL_TRF_SCAVENGER;

	value						= 100;

	description					= NAME_Trf_Scavenger;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TRF_SCAVENGER;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollTrfShadowbeast(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_06.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TRF_SHADOWBEAST;
	spell						= SPL_TRF_SHADOWBEAST;

	value						= 200;

	description					= NAME_Trf_Shadowbeast;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TRF_SHADOWBEAST;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollTrfSnapper(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_01.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TRF_SNAPPER;
	spell						= SPL_TRF_SNAPPER;

	value						= 150;

	description					= NAME_Trf_Snapper;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TRF_SNAPPER;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollTrfWaran(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_10.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TRF_WARAN;
	spell						= SPL_TRF_WARAN;

	value						= 100;

	description					= NAME_Trf_Waran;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TRF_WARAN;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollTrfWolf(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_09.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_TRF_WOLF;
	spell						= SPL_TRF_WOLF;

	value						= 100;

	description					= NAME_Trf_Wolf;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_TRF_WOLF;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Chain-Lightning (Scrolls und Runen)

instance ItAr_RuneChainLightning(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_18.3ds";
	material					= MAT_STONE;

	spell						= SPL_CHAINLIGHTNING;
	mag_circle					= 4;

	value						= 700;

	description					= NAME_Chainlightning;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_DamagePerSec;							count[1] = SPL_ZAPPED_DAMAGE_PER_SEC;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Invest;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollChainLightning(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_20.3DS";
	material					= MAT_STONE;

	spell						= SPL_CHAINLIGHTNING;
	//mag_circle				= 3;

	value						= 70;

	description					= NAME_Chainlightning;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_DamagePerSec;							count[1] = SPL_ZAPPED_DAMAGE_PER_SEC;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Invest;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Thunderbolt (Scrolls und Runen)

instance ItAr_RuneThunderbolt(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_19.3ds";
	material					= MAT_STONE;

	spell						= SPL_THUNDERBOLT;
	mag_circle					= 1;

	value						= 500;

	description					= NAME_Thunderbolt;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	// FIXME: kann man die DAMAGE_PER_LEVEL-Werte der Spells aus der Spells_Params hier für Manakosten einsetzen??
	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_THUNDERBOLT;
	text[2]						= NAME_Dam_Magic;								count[2] = SPL_DAMAGE_THUNDERBOLT;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollThunderbolt(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_41.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_THUNDERBOLT;
	spell						= SPL_THUNDERBOLT;

	value						= 50;

	description					= NAME_Thunderbolt;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_THUNDERBOLT;
	text[2]						= NAME_Dam_Magic;								count[2] = SPL_DAMAGE_THUNDERBOLT;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Thunderball (Scrolls und Runen)

instance ItAr_RuneThunderball(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_20.3ds";
	material					= MAT_STONE;

	spell						= SPL_THUNDERBALL;
	mag_circle					= 3;		//SN: von 4 auf 3 geändert!

	value						= 900;

	description					= NAME_Thunderball;
	//text[3]					= "";											count[3] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_ManakostenMax;							count[1] = SPL_SENDCAST_THUNDERBALL;
	text[2]						= ConcatStrings(NAME_Dam_Magic, NAME_PerMana);	count[2] = SPL_DAMAGE_THUNDERBALL;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Load;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollThunderball(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_01.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_THUNDERBALL;
	spell						= SPL_THUNDERBALL;

	value						= 90;

	description					= NAME_Thunderball;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_ManakostenMax;							count[1] = SPL_SENDCAST_THUNDERBALL;
	text[2]						= ConcatStrings(NAME_Dam_Magic, NAME_PerMana);	count[2] = SPL_DAMAGE_THUNDERBALL;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Load;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// IceCube (Scrolls und Runen)

instance ItAr_RuneIceCube(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_21.3ds";
	material					= MAT_STONE;

	spell						= SPL_ICECUBE;
	mag_circle					= 3;

	value						= 700;

	description					= NAME_Icecube;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_ICECUBE;
	text[2]						= "Schaden";									count[2] = SPL_FREEZE_DAMAGE;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollIceCube(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_25.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_ICECUBE;
	spell						= SPL_ICECUBE;

	value						= 70;

	description					= NAME_Icecube;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_ICECUBE;
	text[2]						= "Schaden";									count[2] = SPL_FREEZE_DAMAGE;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// IceWave (Scrolls und Runen)

instance ItAr_RuneIceWave(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_22.3ds";
	material					= MAT_STONE;

	spell						= SPL_ICEWAVE;
	mag_circle					= 5;

	value						= 1100;

	description					= NAME_Icewave;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_ICEWAVE;
	text[2]						= "Schaden";									count[2] = SPL_FREEZE_DAMAGE;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollIceWave(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_30.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_ICEWAVE;
	spell						= SPL_ICEWAVE;

	value						= 110;

	description					= NAME_Icewave;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_ICEWAVE;
	text[2]						= "Schaden";									count[2] = SPL_FREEZE_DAMAGE;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************
**		Dämonenbeschwörer (Runensteine und Scrolls) 									  **
*******************************************************************************************/

// Summon Demon (Scrolls)

instance ItAr_ScrollSummonDemon(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_18.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_SUMMONDEMON;
	spell						= SPL_SUMMONDEMON;

	value						= 550;

	description					= NAME_SummonDemon;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_SUMMONDEMON;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Summon Skeletons (Scrolls)

instance ItAr_ScrollSummonSkeletons(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_23.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_SUMMONSKELETON;
	spell						= SPL_SUMMONSKELETON;

	value						= 350;

	description					= NAME_SummonSkeleton;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_SUMMONSKELETON;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Summon Golem (Scrolls)

instance ItAr_ScrollSummonGolem(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_23.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_SUMMONGOLEM;
	spell						= SPL_SUMMONGOLEM;

	value						= 450;

	description					= NAME_SummonGolem;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_SUMMONGOLEM;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Army of Darkness (Scrolls)

instance ItAr_ScrollArmyOfDarkness(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_29.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_ARMYOFDARKNESS;
	spell						= SPL_ARMYOFDARKNESS;

	value						= 666;

	description					= NAME_ArmyOfDarkness;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_ARMYOFDARKNESS;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Destroy Undead (Scrolls und Runen)

instance ItAr_RuneDestroyUndead(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_15.3ds";
	material					= MAT_STONE;

	spell						= SPL_DESTROYUNDEAD;
	mag_circle					= 4;

	value						= 1100;

	description					= NAME_DestroyUndead;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_DESTROYUNDEAD;
	text[2]						= NAME_Dam_Magic;								count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollDestroyUndead(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_26.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_DESTROYUNDEAD;
	spell						= SPL_DESTROYUNDEAD;

	value						= 110;

	description					= NAME_DestroyUndead;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_DESTROYUNDEAD;
	text[2]						= NAME_Dam_Magic;								count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************
**		PSI-Sprüche (Runensteine und Scrolls) 											  **
*******************************************************************************************/

// Windfist (Scrolls und Runen)

instance ItAr_RuneWindfist(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_06.3ds";
	material					= MAT_STONE;

	spell						= SPL_WINDFIST;
	mag_circle					= 2;

	value						= 500;

	description					= NAME_Windfist;
	//text[3]					= "";											count[3] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_ManakostenMax;							count[1] = SPL_SENDCAST_WINDFIST;
	text[2]						= ConcatStrings(NAME_Dam_Fly, NAME_PerMana);	count[2] = SPL_DAMAGE_WINDFIST;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Load;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollWindfist(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_12.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_WINDFIST;
	spell						= SPL_WINDFIST;

	value						= 50;

	description					= NAME_Windfist;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_ManakostenMax;							count[1] = SPL_SENDCAST_WINDFIST;
	text[2]						= ConcatStrings(NAME_Dam_Fly, NAME_PerMana);	count[2] = SPL_DAMAGE_WINDFIST;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Load;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Stormfist (Scrolls und Runen)

instance ItAr_RuneStormfist(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_07.3ds";
	material					= MAT_STONE;

	spell						= SPL_STORMFIST;
	mag_circle					= 4;

	value						= 900;

	description					= NAME_Stormfist;
	//text[3]					= "";											count[3] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_ManakostenMax;							count[1] = SPL_SENDCAST_STORMFIST;
	text[2]						= ConcatStrings(NAME_Dam_Fly, NAME_PerMana);	count[2] = SPL_DAMAGE_STORMFIST;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Load;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollStormfist(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_17.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_STORMFIST;
	spell						= SPL_STORMFIST;

	value						= 90;

	description					= NAME_Stormfist;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_ManakostenMax;							count[1] = SPL_SENDCAST_STORMFIST;
	text[2]						= ConcatStrings(NAME_Dam_Fly, NAME_PerMana);	count[2] = SPL_DAMAGE_STORMFIST;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Load;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Telekinesis (Scrolls und Runen)

instance ItAr_RuneTelekinesis(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_05.3ds";
	material					= MAT_STONE;

	spell						= SPL_TELEKINESIS;
	mag_circle					= 3;

	value						= 700;

	description					= NAME_Telekinesis;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_ManaPerSec;								count[1] = 1;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Invest;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollTelekinesis(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_13.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= 10;
	spell						= SPL_TELEKINESIS;

	value						= 70;

	description					= NAME_Telekinesis;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[3]					= "";											count[3] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_ManaPerSec;								count[1] = 1;
	text[2]						= NAME_Mana_needed;								count[2] = cond_value[2];
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Invest;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Charm (Scrolls und Runen)

instance ItAr_RuneCharm(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_10.3ds";
	material					= MAT_STONE;

	spell						= SPL_CHARM;
	mag_circle					= 3;

	value						= 700;

	description					= NAME_Charm;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_CHARM;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollCharm(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_19.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_CHARM;
	spell						= SPL_CHARM;

	value						= 70;

	description					= NAME_Charm;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_CHARM;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Sleep (Scrolls)

instance ItAr_RuneSleep(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_09.3ds";
	material					= MAT_STONE;

	spell						= SPL_SLEEP;
	mag_circle					= 2;

	value						= 500;

	description					= NAME_Sleep;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_SLEEP;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollSleep(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_16.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_SLEEP;
	spell						= SPL_SLEEP;

	value						= 50;

	description					= NAME_Sleep;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_SLEEP;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Pyrokinesis (Scrolls und Runen)

instance ItAr_RunePyrokinesis(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_04.3ds";
	material					= MAT_STONE;

	spell						= SPL_PYROKINESIS;
	mag_circle					= 3;

	value						= 700;

	description					= NAME_Pyrokinesis;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_DamagePerSec;							count[1] = SPL_PYRO_DAMAGE_PER_SEC;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Invest;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollPyrokinesis(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_33.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= 10;
	spell						= SPL_PYROKINESIS;

	value						= 70;

	description					= NAME_Pyrokinesis;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_DamagePerSec;							count[1] = SPL_PYRO_DAMAGE_PER_SEC;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Spell_Invest;							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Control (Scrolls und Runen)

instance ItAr_RuneControl(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_02.3ds";
	material					= MAT_STONE;

	spell						= SPL_CONTROL;
	mag_circle					= 4;

	value						= 900;

	description					= NAME_Control;
	//text[1]					= NAME_Manakosten;								count[1] = SPL_SENDCAST_SLEEP;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollControl(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_08.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= 30;
	spell						= SPL_CONTROL;

	value						= 90;

	description					= NAME_Control;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[1]					= NAME_Manakosten;								count[1] = ;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Fear (nur Scrolls)

instance ItAr_ScrollFear(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_34.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_FEAR;
	spell						= SPL_FEAR;

	value						= 250;

	description					= NAME_Fear;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_FEAR;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
// Berzerk (nur Scrolls)

instance ItAr_ScrollBerzerk(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_22.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_BERZERK;
	spell						= SPL_BERZERK;

	value						= 200;

	description					= NAME_Berzerk;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_BERZERK;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Breath of Death (!!! JP: Gab es in Gothic nur als Rune wird jetzt aber als Scroll gebraucht, weil sie für eine Rezeptur ist )

instance ItAr_RuneBreathOfDeath(C_Item)
{
	name						= NAME_Rune;

	mainflag					= ITEM_KAT_RUNE;
	flags						= 0;

	visual						= "ItAr_Rune_21.3ds";
	material					= MAT_STONE;

	spell						= SPL_BREATHOFDEATH;
	mag_circle					= 6;

	value						= 1500;

	description					= NAME_BreathOfDeath;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= NAME_Mag_Circle;								count[0] = mag_circle;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_BREATHOFDEATH;
	text[2]						= NAME_Dam_Magic;								count[2] = SPL_DAMAGE_BREATHOFDEATH;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItAr_ScrollBreathOfDeath(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_22.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_BREATHOFDEATH;
	spell						= SPL_BREATHOFDEATH;

	value						= 200;

	description					= NAME_BreathOfDeath;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_BERZERK;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
// Shrink (nur Scrolls)

instance ItAr_ScrollShrink(C_Item)
{
	name						= NAME_Spruchrolle;

	mainflag					= ITEM_KAT_RUNE;
	flags						= ITEM_MULTI;

	visual						= "ItAr_Scroll_15.3DS";
	material					= MAT_STONE;

	cond_atr[2]					= ATR_MANA_MAX;
	cond_value[2]				= SPL_SENDCAST_SHRINK;
	spell						= SPL_SHRINK;

	value						= 1000;

	description					= NAME_Shrink;
	//text[0]					= NAME_Mag_Circle;								count[0] = mag_circle;
	//text[2]					= "";											count[2] = ;
	//text[3]					= "";											count[3] = ;
	//text[4]					= "";											count[4] = ;

	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Manakosten;								count[1] = SPL_SENDCAST_SHRINK;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/*******************************************************************************************/
