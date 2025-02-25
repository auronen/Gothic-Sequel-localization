// ---------------------------------------------------------
// NPC 'WRK_209_Worker'
// ---------------------------------------------------------

instance WRK_209_Worker(C_Npc)
{
	// -------- primary data --------
	name							= NAME_Worker;
	npcType							= NpcType_Ambient;
	guild							= GIL_WORKER;
	level							= 8;

	voice							= 11;
	id								= 209;

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
	Mdl_SetVisualBody(self,	"hum_body_naked0",		0,		1,			"Hum_Head_Bald",	71,			4,			VLK_ARMOR_L);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 1);

	// -------- inventory --------
	CreateInvItem(self, ItMi_Hammer);
	CreateInvItem(self, ItFo_Beer);
	CreateInvItems(self, ItMi_Silver, 6);
	CreateInvItems(self, ItFo_MeatbugSoup, 1);
	EquipItem(self, ItMw_Nailmace);

	// -------- daily routine --------
	daily_routine = Rtn_start_209;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_209()
{
	TA_RepairHut(08, 00, 18, 00, "CONSTRUCT_UP_03");
	TA_SitAround(18, 00, 00, 00, "OCR_OUTSIDE_HUT_68_BENCH");
	TA_Sleep(00, 00, 08, 00, "OCR_HUT_69_B");
};
