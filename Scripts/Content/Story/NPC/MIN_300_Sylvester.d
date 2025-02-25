// ---------------------------------------------------------
// NPC 'MIN_300_Sylvester'
// ---------------------------------------------------------

instance MIN_300_Sylvester(C_Npc)
{
	// -------- primary data --------
	name							= "Sylvester";
	npcType							= NpcType_Ambient;
	guild							= GIL_MINER;
	level							= 15;

	voice							= 3;
	id								= 300;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 75;
	attribute[ATR_DEXTERITY]		= 50;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 250;
	attribute[ATR_HITPOINTS]		= 250;
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
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		2,		1,			"Hum_Head_Thief",	71,			0,			VLK_ARMOR_M);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_2H, 1);

	// -------- inventory --------
	CreateInvItem(self, ItMw_Pickaxe);
	CreateInvItem(self, ItFo_Beer);
	CreateInvItems(self, ItMi_Silver, 5);
	CreateInvItems(self, ItFo_MeatbugSoup, 2);
	CreateInvItems(self, ItFo_HerbSoup, 2);
	CreateInvItems(self, ItMi_BloodOreNugget, 30);
	CreateInvItems(self, ItMi_OreNugget, 10);
	CreateInvItems(self, ItFo_MushroomSoup, 1);
	CreateInvItems(self, ItLsTorch, 5);
	EquipItem(self, ItMw_Pickaxe);

	// -------- daily routine --------
	daily_routine = Rtn_start_300;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_Start_300()
{
	TA_SitAround(08, 00, 20, 00, "OCR_OUTSIDE_ARENA_BENCH1");
	TA_SitAround(20, 00, 08, 00, "OCR_OUTSIDE_ARENA_BENCH1");
};

func void Rtn_Follow_300()
{
	TA_FollowPC(08, 00, 20, 00, "OCR_OUTSIDE_ARENA_BENCH1");
	TA_FollowPC(20, 00, 08, 00, "OCR_OUTSIDE_ARENA_BENCH1");
};

func void Rtn_Pick_300()
{
	TA_PickOre(08, 00, 20, 00, "OW_CAVE1_OREWOLF_4");
	TA_SitAround(20, 00, 08, 00, "OCR_OUTSIDE_ARENA_BENCH1");
};
