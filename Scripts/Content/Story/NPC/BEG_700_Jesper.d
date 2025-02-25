// ---------------------------------------------------------
// NPC 'BEG_700_Jesper'
// ---------------------------------------------------------

instance BEG_700_Jesper(C_Npc)
{
	// -------- primary data --------
	name							= "Jesper";
	npcType							= NpcType_Main;
	guild							= GIL_BEGGAR;
	level							= 10;

	voice							= 2;
	id								= 700;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 50;
	attribute[ATR_DEXTERITY]		= 75;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 100;
	attribute[ATR_HITPOINTS]		= 100;
	attribute[ATR_REGENERATEMANA]	= 0;
	attribute[ATR_REGENERATEHP]		= 0;

	// -------- protection --------
	protection[PROT_EDGE]			= 0;
	protection[PROT_BLUNT]			= 0;
	protection[PROT_POINT]			= 0;
	protection[PROT_FIRE]			= 0;
	protection[PROT_MAGIC]			= 0;
	protection[PROT_FALL]			= 0;
	protection[PROT_FLY]			= 0;
	protection[PROT_BARRIER]		= 0;

	// -------- visuals --------
	Mdl_SetModelFatness(self, 0);
	Mdl_SetVisual(self, "humans.mds"); 					// basic animation file
	Mdl_ApplyOverlayMDS(self, "Humans_Tired.mds"); 			// overlay animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		2,		0,			"Hum_Head_Bald",	5,			1,			BEG_ARMOR);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------
	CreateInvItem(self, ItFo_MoleratSoup);
	CreateInvItem(self, ItFo_Booze);
	CreateInvItems(self, ItMi_Silver, 3);

	// -------- daily routine --------
	daily_routine = Rtn_start_700;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_700()
{
	TA_StandAround(08, 00, 20, 00, "OCR_HUT_Z5_SIT4");
	TA_Sleep(20, 00, 08, 00, "OCR_HUT_18");
};
