// ---------------------------------------------------------
// NPC 'MIN_302_Miner'
// ---------------------------------------------------------

instance MIN_302_Miner(C_Npc)
{
	// -------- primary data --------
	name							= NAME_Miner;
	npcType							= NpcType_Ambient;
	guild							= GIL_MINER;
	level							= 8;

	voice							= 9;
	id								= 302;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 75;
	attribute[ATR_DEXTERITY]		= 50;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 150;
	attribute[ATR_HITPOINTS]		= 150;
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
	Mdl_SetVisualBody(self,	"hum_body_naked0",		3,		1,			"Hum_Head_Thief",	71,			0,			VLK_ARMOR_M);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_2H, 1);

	// -------- inventory --------
	CreateInvItems(self, ItFo_Loaf, 3);
	CreateInvItems(self, ItMi_Silver, 9);
	CreateInvItems(self, ItFo_Beer, 1);
	CreateInvItems(self, ItLsTorch, 6);
	CreateInvItems(self, ItMi_OreNugget, 3);
	CreateInvItems(self, ItFo_MushroomSoup, 1);
	EquipItem(self, ItMw_Pickaxe);

	// -------- daily routine --------
	daily_routine = Rtn_start_302;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_302()
{
	TA_StandAround(08, 00, 20, 00, "OW_E6_14");
	TA_StandAround(20, 00, 08, 00, "OW_E6_14");
};
