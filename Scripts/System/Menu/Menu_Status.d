instance MENU_STATUS(C_MENU_DEF) 
{
	//
	// Spielername und Gilde		
	//
	items[0]	= "MENU_ITEM_PLAYERGUILD_TITLE";		
	items[1]	= "MENU_ITEM_PLAYERGUILD";					
			
	//
	// Level und Erfahrung
	//
	items[2]	= "MENU_ITEM_LEVEL_TITLE";
	items[3]	= "MENU_ITEM_EXP_TITLE";
	items[4]	= "MENU_ITEM_LEVEL_NEXT_TITLE";
	items[5]	= "MENU_ITEM_LEARN_TITLE";

	items[6]	= "MENU_ITEM_LEVEL";
	items[7]	= "MENU_ITEM_EXP";
	items[8]	= "MENU_ITEM_LEVEL_NEXT";
	items[9]	= "MENU_ITEM_LEARN";

	//
	// Attribute
	//
	items[10]	= "MENU_ITEM_ATTRIBUTE_HEADING";
				   
	items[11]	= "MENU_ITEM_ATTRIBUTE_1_TITLE";
	items[12]	= "MENU_ITEM_ATTRIBUTE_2_TITLE";
	items[13]	= "MENU_ITEM_ATTRIBUTE_3_TITLE";
	items[14]	= "MENU_ITEM_ATTRIBUTE_4_TITLE";
	
	items[15]	= "MENU_ITEM_ATTRIBUTE_1";
	items[16]	= "MENU_ITEM_ATTRIBUTE_2";
	items[17]	= "MENU_ITEM_ATTRIBUTE_3";
	items[18]	= "MENU_ITEM_ATTRIBUTE_4";

	//
	// Schutz
	//	
	items[19]	= "MENU_ITEM_ARMOR_HEADING";
	
	items[20]	= "MENU_ITEM_ARMOR_1_TITLE";
	items[21]	= "MENU_ITEM_ARMOR_2_TITLE";
	items[22]	= "MENU_ITEM_ARMOR_3_TITLE";
	items[23]	= "MENU_ITEM_ARMOR_4_TITLE";
	
	items[24]	= "MENU_ITEM_ARMOR_1";
	items[25]	= "MENU_ITEM_ARMOR_2";
	items[26]	= "MENU_ITEM_ARMOR_3";
	items[27]	= "MENU_ITEM_ARMOR_4";
	
	//
	// Waffentalente
	//
	
	// Ueberschriften
	items[28]	= "MENU_ITEM_TALENTS_WEAPON_HEADING";
	items[29]	= "MENU_ITEM_TALENTS_THIEF_HEADING";
	items[30]	= "MENU_ITEM_TALENTS_MAGIC_HEADING";
	
	// Talent-Liste
	items[31]	= "MENU_ITEM_TALENT_1_TITLE";
	items[32]	= "MENU_ITEM_TALENT_1_SKILL";
	items[33]	= "MENU_ITEM_TALENT_1";
	
	items[34]	= "MENU_ITEM_TALENT_2_TITLE";
	items[35]	= "MENU_ITEM_TALENT_2_SKILL";
	items[36]	= "MENU_ITEM_TALENT_2";
	
	items[37]	= "MENU_ITEM_TALENT_3_TITLE";
	items[38]	= "MENU_ITEM_TALENT_3_SKILL";
	items[39]	= "MENU_ITEM_TALENT_3";
	
	items[40]	= "MENU_ITEM_TALENT_4_TITLE";
	items[41]	= "MENU_ITEM_TALENT_4_SKILL";
	items[42]	= "MENU_ITEM_TALENT_4";
	
	items[43]	= "MENU_ITEM_TALENT_5_TITLE";
	items[44]	= "MENU_ITEM_TALENT_5_SKILL";
	items[45]	= "MENU_ITEM_TALENT_5";
	
	items[46]	= "MENU_ITEM_TALENT_6_TITLE";
	items[47]	= "MENU_ITEM_TALENT_6_SKILL";
	items[48]	= "MENU_ITEM_TALENT_6";
	
	items[49]	= "MENU_ITEM_TALENT_7_TITLE";
	items[50]	= "MENU_ITEM_TALENT_7_SKILL";
	
	items[51]	= "MENU_ITEM_TALENT_8_TITLE";
	items[52]	= "MENU_ITEM_TALENT_8_SKILL";

	items[53]	= "MENU_ITEM_TALENT_9_TITLE";
	items[54]	= "MENU_ITEM_TALENT_9_SKILL";
	
	items[55]	= "MENU_ITEM_TALENT_10_TITLE";
	items[56]	= "MENU_ITEM_TALENT_10_SKILL";
	
	items[57]	= "MENU_ITEM_TALENT_11_TITLE";
	items[58]	= "MENU_ITEM_TALENT_11_SKILL";
	
	items[59]	= "MENU_ITEM_TALENT_12_TITLE";
	items[60]	= "MENU_ITEM_TALENT_12_SKILL";
	
	items[61]	= "MENU_ITEM_TALENT_13_TITLE";
	items[62]	= "MENU_ITEM_TALENT_13_SKILL";

	items[63]	= "MENU_ITEM_TALENT_14_TITLE";
	items[64]	= "MENU_ITEM_TALENT_14_SKILL";
	
	items[65]	= "MENU_ITEM_TALENT_15_TITLE";
	items[66]	= "MENU_ITEM_TALENT_15_SKILL";

	items[67]	= "MENU_ITEM_TALENTS_WORK_HEADING";

	//
	// Eigenschaften
	//
		
	dimx		= 8192;
	dimy		= 8192;
	flags		= flags | MENU_OVERTOP|MENU_NOANI;	
	backPic		= STAT_BACK_PIC;
};

const int STAT_DY =  300;


//
// Spiel- und Spielerdaten
//

const int STAT_PLY_Y  = 900;
const int STAT_ATR_Y  = 2700;
const int STAT_ARM_Y  = 4800;
const int STAT_TAL_Y  = 900;


const int STAT_A_X1 =  700;
const int STAT_A_X2 = 1500;
const int STAT_A_X3 = 2500;
const int STAT_B_X1 = 3500;
const int STAT_B_X2 = 5700;
const int STAT_B_X3 = 7200;

instance MENU_ITEM_PLAYERGUILD_TITLE(C_MENU_ITEM_DEF)
{
	text[0]	 = "Gilde:";
	posx	 = STAT_A_X1;	posy = STAT_PLY_Y+STAT_DY*0;	fontName = STAT_FONT_TITLE;
	flags		=	flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_PLAYERGUILD(C_MENU_ITEM_DEF)
{
	posx =	STAT_A_X2;	posy = STAT_PLY_Y+STAT_DY*0;
	dimx =  STAT_B_X1 - STAT_A_X2;
	dimy =  STAT_DY;
	fontName	=	STAT_FONT_DEFAULT;
	flags		=	flags & ~IT_SELECTABLE;
};


//
// Sonderattribute-Werte
//

// Texte
INSTANCE MENU_ITEM_LEVEL_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;	posy = STAT_PLY_Y + 1*STAT_DY;
	text[0]	= "Stufe";										fontName = STAT_FONT_TITLE;		
	flags	= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_EXP_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;	posy = STAT_PLY_Y + 3*STAT_DY;	
	text[0]	= "Erfahrung"; 									fontName = STAT_FONT_DEFAULT;	
	flags	= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_LEVEL_NEXT_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;	posy = STAT_PLY_Y + 4*STAT_DY;	
	text[0]	= "Nächste Stufe";								fontName = STAT_FONT_DEFAULT;
	flags	= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_LEARN_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;	posy = STAT_PLY_Y + 5*STAT_DY;	
	text[0]	= "Lernpunkte";									fontName = STAT_FONT_DEFAULT;
	flags	= flags & ~IT_SELECTABLE;
};

// Werte
INSTANCE MENU_ITEM_LEVEL(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X3;	posy = STAT_PLY_Y + 1*STAT_DY;		fontName = STAT_FONT_DEFAULT;
	flags	= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_EXP(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X3;	posy = STAT_PLY_Y + 3*STAT_DY;		fontName = STAT_FONT_DEFAULT;
	flags	= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_LEVEL_NEXT(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X3;	posy = STAT_PLY_Y + 4*STAT_DY;		fontName = STAT_FONT_DEFAULT;
	flags	= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_LEARN(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X3;	posy = STAT_PLY_Y + 5*STAT_DY;		fontName = STAT_FONT_DEFAULT;
	flags	= flags & ~IT_SELECTABLE;
};


//
// Attribute
//


// Titel
INSTANCE MENU_ITEM_ATTRIBUTE_HEADING(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;	posy = STAT_ATR_Y + 1*STAT_DY;
	text[0]		=  "Attribute:";							fontName = STAT_FONT_TITLE;
	flags		= flags & ~IT_SELECTABLE;
};

// Texte
INSTANCE MENU_ITEM_ATTRIBUTE_1_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;	posy = STAT_ATR_Y + 2*STAT_DY;
	text[0]		= 	"Stärke";								fontName = STAT_FONT_DEFAULT;
	flags		= 	flags & ~IT_SELECTABLE;
};
INSTANCE MENU_ITEM_ATTRIBUTE_2_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;	posy = STAT_ATR_Y + 3*STAT_DY;
	text[0]		=	"Geschick";								fontName = STAT_FONT_DEFAULT;
	flags		=	flags & ~IT_SELECTABLE;
};
INSTANCE MENU_ITEM_ATTRIBUTE_3_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;	posy = STAT_ATR_Y + 4*STAT_DY;
	text[0]		=	"Mana";									fontName = STAT_FONT_DEFAULT;
	flags		=	flags & ~IT_SELECTABLE;
};
INSTANCE MENU_ITEM_ATTRIBUTE_4_TITLE(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X1;	posy = STAT_ATR_Y + 5*STAT_DY;
	text[0]		=	"Gesundheit";							fontName =	STAT_FONT_DEFAULT;
	flags		=	flags & ~IT_SELECTABLE;
};

// Werte
INSTANCE MENU_ITEM_ATTRIBUTE_1(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X3 - 300;	posy = STAT_ATR_Y + 2*STAT_DY;		fontName =	STAT_FONT_DEFAULT;	
	flags		=	flags & ~IT_SELECTABLE;
};
INSTANCE MENU_ITEM_ATTRIBUTE_2(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X3 - 300;	posy = STAT_ATR_Y + 3*STAT_DY;		fontName =	STAT_FONT_DEFAULT;	
	flags		=	flags & ~IT_SELECTABLE;
};
INSTANCE MENU_ITEM_ATTRIBUTE_3(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X3 - 300;	posy = STAT_ATR_Y + 4*STAT_DY;		fontName =	STAT_FONT_DEFAULT;	
	flags		=	flags & ~IT_SELECTABLE;
};
INSTANCE MENU_ITEM_ATTRIBUTE_4(C_MENU_ITEM_DEF)
{
	posx = STAT_A_X3 - 300;	posy = STAT_ATR_Y + 5*STAT_DY;		fontName =	STAT_FONT_DEFAULT;	
	flags		=	flags & ~IT_SELECTABLE;
};


//
// Schutz
//

INSTANCE MENU_ITEM_ARMOR_HEADING(C_MENU_ITEM_DEF)
{
	text[0]	= "Rüstungs-Schutz:";						fontName = STAT_FONT_TITLE;
	posx =  STAT_A_X1; posy = STAT_ARM_Y + 0*STAT_DY;
	flags = flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ARMOR_1_TITLE(C_MENU_ITEM_DEF)
{
	text[0]	= "Waffen";
	posx =  STAT_A_X1; posy = STAT_ARM_Y + 1*STAT_DY;	fontName = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ARMOR_2_TITLE(C_MENU_ITEM_DEF)
{
	text[0]	= "Geschosse";
	posx =  STAT_A_X1; posy = STAT_ARM_Y + 2*STAT_DY;	fontName = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ARMOR_3_TITLE(C_MENU_ITEM_DEF)
{
	text[0]	= "Feuer";
	posx =  STAT_A_X1; posy = STAT_ARM_Y + 3*STAT_DY;	fontName = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};


INSTANCE MENU_ITEM_ARMOR_4_TITLE(C_MENU_ITEM_DEF)
{
	text[0]	= "Magie";
	posx =  STAT_A_X1; posy = STAT_ARM_Y + 4*STAT_DY;	fontName = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};


INSTANCE MENU_ITEM_ARMOR_1(C_MENU_ITEM_DEF)
{
	posx =  STAT_A_X3; posy = STAT_ARM_Y + 1*STAT_DY;	fontName = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ARMOR_2(C_MENU_ITEM_DEF)
{
	posx =  STAT_A_X3; posy = STAT_ARM_Y + 2*STAT_DY;	fontName = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ARMOR_3(C_MENU_ITEM_DEF)
{
	posx =  STAT_A_X3; posy = STAT_ARM_Y + 3*STAT_DY;	fontName = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ARMOR_4(C_MENU_ITEM_DEF)
{
	posx =  STAT_A_X3; posy = STAT_ARM_Y + 4*STAT_DY;	fontName = STAT_FONT_DEFAULT;
	flags = flags & ~IT_SELECTABLE;
};


//
// Talente
//

// Headings
INSTANCE MENU_ITEM_TALENTS_WEAPON_HEADING(C_MENU_ITEM_DEF)
{
	text[0]	= "Waffentalente / Treffer-Chance:";
	posx	= STAT_B_X1; posy = STAT_TAL_Y + STAT_DY*0;			fontName = STAT_FONT_TITLE;	
	flags		=	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_TALENTS_THIEF_HEADING(C_MENU_ITEM_DEF)
{
	text[0]	= "Diebestalente / Erfolgs-Chance:";
	posx	= STAT_B_X1; posy = STAT_TAL_Y + STAT_DY*7;			fontName = STAT_FONT_TITLE;	
	flags		=	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_TALENTS_MAGIC_HEADING(C_MENU_ITEM_DEF)
{
	text[0]	= "Magie-Talente:";
	posx	= STAT_B_X1; posy = STAT_TAL_Y + STAT_DY*13; 		fontName = STAT_FONT_TITLE;
	flags		=	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_TALENTS_WORK_HEADING(C_MENU_ITEM_DEF)
{
	text[0]	= "Handwerks-Talente:";
	posx	= STAT_B_X1; posy = STAT_TAL_Y + STAT_DY*18; 		fontName = STAT_FONT_TITLE;
	flags		=	flags & ~IT_SELECTABLE;
};


//
// Liste der Talente
//


/////////////////////////
// Waffentalente...

// Talent 1 (Einhänder)
INSTANCE MENU_ITEM_TALENT_1_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  1*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_1_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  1*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_1(C_MENU_ITEM_DEF) 	   { posx = STAT_B_X3;posy = STAT_TAL_Y +  1*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 2 (Zweihänder)
INSTANCE MENU_ITEM_TALENT_2_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  2*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_2_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  2*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_2(C_MENU_ITEM_DEF) 	   { posx = STAT_B_X3;posy = STAT_TAL_Y +  2*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 3 (Kampfstab)
INSTANCE MENU_ITEM_TALENT_3_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  3*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_3_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  3*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_3(C_MENU_ITEM_DEF)       { posx = STAT_B_X3;posy = STAT_TAL_Y +  3*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 4 (Bogen)
INSTANCE MENU_ITEM_TALENT_4_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  4*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_4_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  4*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_4(C_MENU_ITEM_DEF)       { posx = STAT_B_X3;posy = STAT_TAL_Y +  4*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 5 (Armbrust)
INSTANCE MENU_ITEM_TALENT_5_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  5*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_5_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  5*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_5(C_MENU_ITEM_DEF) 	   { posx = STAT_B_X3;posy = STAT_TAL_Y +  5*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

////////////////////////////
// Diebestalente

// Talent 9 (Schleichen)
INSTANCE MENU_ITEM_TALENT_9_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  8*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_9_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  8*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 6 (Schlösser knacken)
INSTANCE MENU_ITEM_TALENT_6_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  9*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_6_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  9*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_6(C_MENU_ITEM_DEF)       { posx = STAT_B_X3;posy = STAT_TAL_Y +  9*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 7 (Taschendiebstahl)
INSTANCE MENU_ITEM_TALENT_7_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y + 10*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_7_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y + 10*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 12 (Akrobatik)
INSTANCE MENU_ITEM_TALENT_12_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y + 11*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_12_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y + 11*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

//////////////////////////
// Magie

// Talent 8 (Magiekreis)
INSTANCE MENU_ITEM_TALENT_8_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 14*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_8_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 14*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 13 (Runen erschaffen)
INSTANCE MENU_ITEM_TALENT_13_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y + 15*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_13_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y + 15*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 15 (Alchemie)
INSTANCE MENU_ITEM_TALENT_15_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y + 16*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_15_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y + 16*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

//////////////////////////
// Handwerk

// Talent 11 (Kochen)
INSTANCE MENU_ITEM_TALENT_11_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 19*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_11_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 19*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 10 (Schmieden)
INSTANCE MENU_ITEM_TALENT_10_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 20*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_10_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 20*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 14 (Bogenmachen)
INSTANCE MENU_ITEM_TALENT_14_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 21*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_14_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 21*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
