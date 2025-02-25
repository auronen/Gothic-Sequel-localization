// ---------------------------------------------------------
// NPC 'BEG_705_Beggar'
// ---------------------------------------------------------

instance BEG_705_Beggar(C_Npc)
{
	// -------- primary data --------
	name							= NAME_Beggar;
	npcType							= NpcType_Ambient;
	guild							= GIL_BEGGAR;
	level							= 10;

	voice							= 2;
	id								= 705;

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
	Mdl_SetVisualBody(self,	"hum_body_naked0",		2,		2,			"Hum_Head_Bald",	5,			1,			BEG_ARMOR);

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
	daily_routine = Rtn_start_705;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_705()
{
	TA_SitAround(08, 00, 20, 00, "OCR_HUT_27");
	TA_Sleep(20, 00, 08, 00, "OCR_HUT_24");
};

func void Rtn_ArenaSpectator_705()
{
	TA_ArenaSpectator(08, 00, 20, 00, "OCR_ARENA_06");
	TA_ArenaSpectator(20, 00, 08, 00, "OCR_ARENA_06");
};
