// ---------------------------------------------------------
// NPC 'WRK_221_Worker'
// ---------------------------------------------------------

instance WRK_221_Worker(C_Npc)
{
	// -------- primary data --------
	name							= NAME_Worker;
	npcType							= NpcType_Ambient;
	guild							= GIL_WORKER;
	level							= 8;

	voice							= 6;
	id								= 221;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 50;
	attribute[ATR_DEXTERITY]		= 50;
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
	Mdl_SetVisualBody(self,	"hum_body_naked0",		2,		1,			"Hum_Head_Bald",	71,			4,			VLK_ARMOR_L);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 1);

	// -------- inventory --------
	CreateInvItem(self, ItFo_Beer);
	CreateInvItems(self, ItMi_Silver, 3);
	CreateInvItems(self, ItFo_MeatbugSoup, 1);

	// -------- daily routine --------
	daily_routine = Rtn_start_221;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_221()
{
	TA_SawWood(08, 00, 11, 00, "OCR_OUTSIDE_HUT_77_INSERT");
	TA_SitCampfire(11, 00, 14, 00, "OCR_CAMPFIRE_A_MOVEMENT2");
	TA_SawWood(14, 00, 18, 00, "OCR_OUTSIDE_HUT_77_INSERT");
	TA_SitCampfire(18, 00, 00, 00, "OCR_CAMPFIRE_A_MOVEMENT2");
	TA_Sleep(00, 00, 08, 00, "OCR_HUT_7_B");
};
