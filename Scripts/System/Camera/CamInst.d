/*********************************************
**	Camera Instanzen				**
*********************************************/

/* Standard Camera loaded at beginning */
// minRange besser nicht unter 1.5



INSTANCE CamModRun(CCamSys_Def)
{
	bestRange 			= 2.5 ;  
	minRange  			= 1.4 ;  
	maxRange  			= 6.0 ;  
	bestElevation		= 25.0 ;
	minElevation		= 0.0;
	maxElevation		= 89.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 20.0;   
	rotOffsetY			= 0.0;  
};

INSTANCE CamModLookBack(CCamSys_Def)
{
	bestRange 			= 0.5 ;  
	minRange  			= 1.0 ;  
	maxRange  			= 6.0 ;  
	bestElevation			= 35.0 ;
	minElevation			= 0.0;
	maxElevation			= 89.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 20.0;   
	rotOffsetY			= 180.0;  
	veloRot 			= 5.0;
};

/* Tombraider Style - Azimuth Grenzen 0/0/0 - Rotations-Stop-Geschw. langsam, Offset X -15 Grad */

INSTANCE CAMMODNORMAL (CCAMSYS_DEF)
{
     bestrange = 2.5;
     minrange = 2.0;
     maxrange = 6.0;
     bestelevation = 25.0;
     maxelevation = 90.000000000;
     minazimuth = -90.000000000;
     maxazimuth = 90.000000000;
     rotoffsetx = 20.0;
};


INSTANCE CamModDialog(CCamSys_Def)
{
	bestRange 			= 3.0 ;
	minRange  			= 2.5 ;
	maxRange  			= 3.5 ;
	bestElevation		= 10.0 ;
	minElevation		= 0.0;
	maxElevation		= 90.0;
	bestAzimuth			= 45.0;
	minAzimuth			= -45.0;  
	maxAzimuth			= 45.0;   
	rotOffsetX			= 0.0;
	rotOffsetY			= -20.0;
};


INSTANCE CamModInventory(CCamSys_Def)
{
	bestrange = 2.200000000;
    minrange = 2.900000095;
    maxrange = 3.099999905;
    bestelevation = 20.000000000;
    maxelevation = 90.000000000;
    bestazimuth = 0.000000000;
    minazimuth = -90.000000000;
    maxazimuth = 90.000000000;
    rotoffsetx = 0.000000000;
    rotoffsety = 0.000000000;
};


INSTANCE CAMMODMELEE (CCAMSYS_DEF)
{
	bestRange 			= 2.5 ;  
	minRange  			= 1.4 ;  
	maxRange  			= 6.0 ;  
	bestElevation		= 35.0 ;
	minElevation		= 0.0;
	maxElevation		= 89.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 20.0;   
	rotOffsetY			= 0.0;  
};

INSTANCE CamModMeleeMult(CCamSys_Def)
{
	bestRange 			= 6.0 ;
	minRange  			= 2.5 ;
	maxRange  			= 10.0 ;
	bestElevation		= 15.0 ;
	minElevation		= 0.0;
	maxElevation		= 89.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
};


INSTANCE CamModRanged(CCamSys_Def)
{
	bestRange 			= 3.5 ; 
	minRange  			= 2.0 ; 
	maxRange  			= 4.5 ; 
	bestElevation		= 45.0 ;
	minElevation		= 0.0;
	maxElevation		= 90.0; 
	bestAzimuth			= 30.0;  
	minAzimuth			= -30.0;
	maxAzimuth			= 30.0; 
	rotOffsetX			= 20.0; 
	rotOffsetY			= 0.0;  
};


INSTANCE CamModMagic(CCamSys_Def)
{
	bestRange 			= 2.5 ;  
	minRange  			= 1.4 ;  
	maxRange  			= 6.0 ;  
	bestElevation		= 35.0 ;
	minElevation		= 0.0;
	maxElevation		= 89.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 20.0;   
	rotOffsetY			= 0.0;  
};


INSTANCE CamModSwim(CCamSys_Def)
{
	bestRange 			= 3.0 ;
	minRange  			= 2.9 ;
	maxRange  			= 3.1 ;
	bestElevation		= 20.0 ;
	minElevation		= 10.0;
	maxElevation		= 45.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -45.0;
	maxAzimuth			= 45.0;
	rotOffsetX			= 15.0;
	rotOffsetY			= 0.0;
};


INSTANCE CamModDive(CCamSys_Def)
{
	bestRange 			= 3.0 ;
	minRange  			= 3.0 ;
	maxRange  			= 3.0 ;
	bestElevation		= -20.0 ;
	minElevation		= -60.0;
	maxElevation		= -10.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -45.0;
	maxAzimuth			= 45.0;
	rotOffsetX			= -10.0;
	rotOffsetY			= 0.0;
};


INSTANCE CamModJump(CCamSys_Def)
{
	bestRange 			= 2.0 ; 
	minRange  			= 1.0 ; 
	maxRange  			= 2.5 ; 
	bestElevation		= 35.0 ;
	minElevation		= 0.0;
	maxElevation		= 90.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
};


INSTANCE CamModJumpUp(CCamSys_Def)
{
	bestRange 			= 2.0 ;
	minRange  			= 1.0 ;
	maxRange  			= 2.5 ;
	bestElevation		= -30.0 ;
	minElevation		= -90.0;
	maxElevation		= 0.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0;
};


INSTANCE CamModClimb(CCamSys_Def)
{
	bestRange 			= 2.0 ;
	minRange  			= 1.5 ;
	maxRange  			= 2.5 ;
	bestElevation		= 30.0 ;
	minElevation		= -90.0;
	maxElevation		= 90.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0;
};


INSTANCE CamModFall(CCamSys_Def)
{
	bestRange 			= 2.0 ;
	minRange  			= 1.5 ;
	maxRange  			= 2.5 ;
	bestElevation		= 60.0 ;
	minElevation		= 0.0;
	maxElevation		= 90.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -30.0;
	maxAzimuth			= 30.0;
	rotOffsetX			= -10.0;
	rotOffsetY			= 0.0;
};


INSTANCE CamModDeath(CCamSys_Def)
{
	bestRange 			= 3.0 ;
	minRange  			= 2.0 ;
	maxRange  			= 10.0 ;
	bestElevation		= 80.0 ;
	minElevation		= 0.0;
	maxElevation		= 90.0;
	bestAzimuth			= 180.0;
	minAzimuth			= -89.0;
	maxAzimuth			= 89.0;
	rotOffsetX			= 0.0;
	rotOffsetY			= 0.0;
};


INSTANCE CamModFocus(CCamSys_Def)
{
	bestRange 			= 2.5 ; 
	minRange  			= 1.9 ; 
	maxRange  			= 3.5 ; 
	bestElevation			= 25.0 ;
	minElevation			= 0.0;
	maxElevation			= 90.0; 
	bestAzimuth			= 45.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 0.0; 
	rotOffsetY			= 0.0;  
};

INSTANCE CamModAssassin(CCAMSYS_DEF)
{
     bestrange = 4.0;
     minrange = 2.0;
     maxrange = 6.0;
     bestelevation = 25.0;
     minelevation = 15.0;
     maxelevation = 45.0;
     maxelevation = 90.0;
     bestazimuth = 135.0;
     minazimuth = 90.0;
     maxazimuth = 180.0;
     rotoffsetx = -5.0;
     rotoffsety = -25.0;
     
     velotrans = 100.0;
     velorot   = 100.0;
};


// MOBSI Cam-Modes

// DEFAULT
INSTANCE CamModMOBDefault(CCamSys_Def)
{
	bestRange 			= 2.0 ; 
	minRange  			= 1.4 ; 
	maxRange  			= 3.0 ; 
	bestElevation		= 35.0 ;
	minElevation		= 15.0;
	maxElevation		= 90.0; 
	bestAzimuth			= 45.0;  
	minAzimuth			= 0.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 0.0; 
	rotOffsetY			= 5.0;  
};

// Tür aufziehen (FRONT)
INSTANCE CAMMODMOBDOOR_FRONT (CCAMSYS_DEF)
{
     bestrange = 1.250000000;
     minrange = 0.750000000;
     maxrange = 2.000000000;
     bestelevation = 40.000000000;
     maxelevation = 90.000000000;
     minelevation = 30.000000000;
     bestazimuth = 45.000000000;
     minazimuth = 30.000000000;
     maxazimuth = 60.000000000;
     rotoffsetx = 30.000000000;
     rotoffsety = -40.000000000;
};

// Tür aufstossen (BACK)
INSTANCE CAMMODMOBDOOR_BACK (CCAMSYS_DEF)
{
     bestrange = 1.250000000;
     minrange = 0.750000000;
     maxrange = 2.000000000;
     bestelevation = 40.000000000;
     maxelevation = 60.000000000;
     minelevation = 30.000000000;
     bestazimuth = -45.000000000;
     minazimuth = -30.000000000;
     maxazimuth = -60.000000000;
     rotoffsetx = 30.000000000;
     rotoffsety = 40.000000000;
};

// Leiterbenutzung
INSTANCE CAMMODMOBLADDERUP (CCAMSYS_DEF)
{
     bestrange = 2.0;
     minrange = 1.5;
     maxrange = 4.0;
     bestelevation = -60.0;
     minelevation = -45.0;
     maxelevation = -80.0;
     velotrans = 30.0;
     velorot = 2.0;
     translate = 2;
     rotate = 2;
     collision = 1;
};

INSTANCE CAMMODMOBLADDERDOWN (CCAMSYS_DEF)
{
     bestrange = 2.0;
     minrange = 1.5;
     maxrange = 4.0;
     bestelevation = 60.0;
     minelevation = 45.0;
     maxelevation = 60.0;
     velotrans = 30.0;
     velorot = 2.0;
     translate = 2;
     rotate = 2;
     collision = 1;
};

// Betten

// Schema: BED_FRONT)
INSTANCE CAMMODMOBBED_FRONT (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
     rotoffsetx = 0.000000000;
     rotoffsety = 0.000000000;
};
// Schema: BED_BACK)
INSTANCE CAMMODMOBBED_BACK (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
};

// Schema: BEDHIGH_FRONT
INSTANCE CAMMODMOBBEDHIGH_FRONT (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
};
// Schema: BEDHIGH_BACK
INSTANCE CAMMODMOBBEDHIGH_BACK (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
};

// Schema: BEDLOW_FRONT
INSTANCE CAMMODMOBBEDLOW_FRONT (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
};
// Schema: BEDLOW_BACK
INSTANCE CAMMODMOBBEDLOW_BACK (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
};

// auf Stuhl sitzen (CHAIR)
/*	[EDENFELD] Auskommentiert. Macht noch Probs...
INSTANCE CAMMODMOBCHAIR (CCAMSYS_DEF)
{
     bestrange = 1.50000000;
     minrange = 0.500000000;
     maxrange = 2.500000000;
     bestelevation = -10.000000000;
     minelevation = 30.000000000;
     maxelevation = 90.000000000;
     bestazimuth = 180.000000000;
     minazimuth = -180.000000000;
     maxazimuth = 180.000000000;
     rotoffsetx = 0.000000000;
};
*/
// auf Bank sitzen (BENCH)
INSTANCE CAMMODMOBBENCH (CCAMSYS_DEF)
{
     bestrange = 1.20000000;
     minrange = 0.500000000;
     maxrange = 1.900000000;
     bestelevation = 10.000000000;
     minelevation = 30.000000000;
     maxelevation = 90.000000000;
     bestazimuth = 0.000000000;
     minazimuth = -180.000000000;
     maxazimuth = 180.000000000;
     rotoffsetx = 0.000000000;
};

// im Faß verstecken
INSTANCE CAMMODMOBBARRELO (CCAMSYS_DEF)
{
     bestrange = 1.5000000;
     minrange = 0.500000000;
     maxrange = 3.000000000;
     bestelevation = 75.000000000;
     maxelevation = 90.000000000;
     minelevation = 0.000000000;
     bestazimuth = -30.000000000;
     minazimuth = -90.000000000;
     maxazimuth = 90.000000000;
     rotoffsetx = 20.000000000;
     rotoffsety = 0.000000000;
};

INSTANCE CAMMODMOBBSMELTER (CCAMSYS_DEF)
{
     bestrange = 2.0;
     minrange = 1.0;
     maxrange = 6.0;
     bestelevation = 25.0;
     maxelevation = 90.0;
     minazimuth = -90.0;
     bestazimuth = -45.0;
     maxazimuth = 0.0;
     rotoffsetx = 00.0;
     rotoffsety = 20.0;
     velotrans = 30.0;
     velorot = 2.0;
     translate = 1;
     rotate = 1;
     collision = 1;
};

INSTANCE CAMMODMOBBSFIRE (CCAMSYS_DEF)
{
     bestrange = 2.0;
     minrange = 1.5;
     maxrange = 4.0;
     bestelevation = 20.0;
     minelevation = 0.0;
     maxelevation = 30.0;
     minazimuth =  -45.0;
     bestazimuth = -80.0;
     maxazimuth = -10.0;
     rotoffsetx = 20.0;
     velotrans = 30.0;
     velorot = 2.0;
     translate = 1;
     rotate = 1;
     collision = 1;
};

INSTANCE CamModMOBBSANVIL(CCamSys_Def)
{
	bestRange 			= 1.5 ; 
	minRange  			= 1.0 ; 
	maxRange  			= 3.0 ; 
	bestElevation		= 30.0 ;
	minElevation		= 0.0;
	maxElevation		= 60.0; 
	bestAzimuth			= -135.0;  
	minAzimuth			= -45.0;
	maxAzimuth			= -180.0; 
	rotOffsetX			= 20.0; 
	rotOffsetY			= 20.0;  
};

INSTANCE CamModMOBBSCOOL(CCamSys_Def)
{
	bestRange 			= 1.5 ; 
	minRange  			= 1.0 ; 
	maxRange  			= 3.0 ; 
	bestElevation		= 35.0 ;
	minElevation		= 15.0;
	maxElevation		= 90.0; 
	bestAzimuth			= 90.0;  
	minAzimuth			= 45.0;
	maxAzimuth			= 135.0; 
	rotOffsetX			= 10.0; 
	rotOffsetY			= 10.0;  
};

INSTANCE CamModMOBBSSHARP(CCamSys_Def)
{
	bestRange 			= 1.5 ; 
	minRange  			= 1.0 ; 
	maxRange  			= 3.0 ; 
	bestElevation		= 45.0 ;
	minElevation		= 15.0;
	maxElevation		= 60.0; 
	bestAzimuth			= -135.0;  
	minAzimuth			= -45.0;
	maxAzimuth			= -180.0; 
	rotOffsetX			= 10.0; 
	rotOffsetY			= 20.0;  
};

// internal Cameras. Change at own risk

// Firstperson Camera
// bis auf die Trägheitsconstanten indolenceTrans & indolenceHead sind die Vars irrelevant
// vielleicht sind auch noch andere Parameter sinnvoll

INSTANCE CamModFirstPerson(CCamSys_Def)
{
	bestRange 			= 2.0 ; 
	minRange  			= 1.5 ;
	maxRange  			= 2.5 ;
	bestElevation		= 0.0 ;
	minElevation		= -90.0;
	maxElevation		= 90.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -45.0;
	maxAzimuth			= 45.0;
	rotOffsetX			= 60.0;
	rotOffsetY			= 0.0;
};


INSTANCE CamModLook(CCamSys_Def)
{
	bestRange 			= 3.0 ; 
	minRange  			= 1.5 ; 
	maxRange  			= 6.5 ; 
	bestElevation		= 30.0 ;
	minElevation		= -55.0;
	maxElevation		= 80.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	veloTrans			= 5.0;
};


INSTANCE CamModRangedShort(CCamSys_Def)
{
	bestRange 			= 0.5 ;
	minRange  			= 0.4 ;
	maxRange  			= 1.2 ;
	bestElevation		= 60.0 ;
	minElevation		= 40.0;
	maxElevation		= 90.0;		// CHANGED
	bestAzimuth			= 34.0;
	minAzimuth			= 34.0;
	maxAzimuth			= 34.0;
	rotOffsetX			= 55.0;
	rotOffsetY			= -27.0;
};

INSTANCE CamModShoulder(CCamSys_Def)
{
	bestRange 			= 0.75 ;
	minRange  			= 0.4 ;
	maxRange  			= 1.2 ;
	bestElevation		= 80.0 ;
	minElevation		= 40.0;
	maxElevation		= 90.0;		// CHANGED
	bestAzimuth			= 90.0;
	minAzimuth			= 0.0;
	maxAzimuth			= 0.0;
};

