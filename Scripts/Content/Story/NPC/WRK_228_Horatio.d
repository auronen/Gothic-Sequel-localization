// ---------------------------------------------------------
// NPC 'WRK_228_Horatio'
// ---------------------------------------------------------

instance WRK_228_Horatio(C_Npc)
{
	// -------- primary data --------
	name							= "Horatio";
	npcType							= NpcType_Main;
	guild							= GIL_WORKER;
	level							= 8;

	voice							= 9;
	id								= 228;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 120;
	attribute[ATR_DEXTERITY]		= 30;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 300;
	attribute[ATR_HITPOINTS]		= 300;
	attribute[ATR_REGENERATEMANA]	= 0;
	attribute[ATR_REGENERATEHP]		= 0;

	// -------- protection --------
	protection[PROT_EDGE]			= 10;
	protection[PROT_BLUNT]			= 10;
	protection[PROT_POINT]			= 0;
	protection[PROT_FIRE]			= 0;
	protection[PROT_MAGIC]			= 0;
	protection[PROT_FALL]			= 0;
	protection[PROT_FLY]			= 0;
	protection[PROT_BARRIER]		= 0;

	// -------- visuals --------
	Mdl_SetModelFatness(self, 0);
	Mdl_SetVisual(self, "HUMANS.MDS"); 					// basic animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_Naked0",		2,		1,			"Hum_Head_Fighter",	99,			2,			-1);

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------
	CreateInvItem(self, ItFo_Beer);
	CreateInvItems(self, ItMi_Silver, 10);
	CreateInvItems(self, ItFo_MeatbugSoup, 2);

	// -------- daily routine --------
	daily_routine = Rtn_start_228;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_228()
{
	TA_StoneMason(08, 00, 12, 00, "OCR_STONE_03");
	TA_SitCampfire(12, 00, 15, 00, "OCR_CAMPFIRE_A_MOVEMENT1");
	TA_StoneMason(15, 00, 18, 00, "OCR_STONE_03");
	TA_SitCampfire(18, 00, 00, 00, "OCR_CAMPFIRE_A_MOVEMENT1");
	TA_Sleep(00, 00, 08, 00, "OCR_HUT_6_A");
};
