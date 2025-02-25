// ---------------------------------------------------------
// NPC 'WRK_223_Ruga'
// ---------------------------------------------------------

instance WRK_223_Ruga(C_Npc)
{
	// -------- primary data --------
	name							= "Ruga";
	npcType							= NpcType_Trd_Ambient;
	guild							= GIL_WORKER;
	level							= 8;

	voice							= 9;
	id								= 223;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 75;
	attribute[ATR_DEXTERITY]		= 50;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 200;
	attribute[ATR_HITPOINTS]		= 200;
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
	Mdl_SetVisualBody(self,	"hum_body_naked0",		2,		1,			"Hum_Head_Bald",	71,			4,			-1);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 1);

	// -------- inventory --------
	CreateInvItems(self, ItMi_Silver, 50);
	CreateInvItems(self, ItFo_MeatbugPie, 3);
	CreateInvItems(self, ItFo_Wine, 4);
	EquipItem(self, ItMw_NotchedMace);

	// -------- daily routine --------
	daily_routine = Rtn_start_223;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_223()
{
	TA_ArmorMaker(08, 00, 20, 00, "OCR_HUT_45");
	TA_Sleep(20, 00, 08, 00, "OCR_HUT_45");
};
