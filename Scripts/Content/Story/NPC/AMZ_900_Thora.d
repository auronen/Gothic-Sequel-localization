// ---------------------------------------------------------
// NPC 'AMZ_900_Thora'
// ---------------------------------------------------------

instance AMZ_900_Thora(C_Npc)
{
	// -------- primary data --------
	name							= "Thora";
	npcType							= NpcType_Female;
	guild							= GIL_AMAZON;
	level							= 35;

	voice							= 16;
	id								= 900;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 100;
	attribute[ATR_DEXTERITY]		= 100;
	attribute[ATR_MANA_MAX]			= 300;
	attribute[ATR_MANA]				= 300;
	attribute[ATR_HITPOINTS_MAX]	= 400;
	attribute[ATR_HITPOINTS]		= 400;
	attribute[ATR_REGENERATEMANA]	= 0;
	attribute[ATR_REGENERATEHP]		= 0;

	// -------- protection --------
	protection[PROT_EDGE]			= 100;
	protection[PROT_BLUNT]			= 100;
	protection[PROT_POINT]			= 50;
	protection[PROT_FIRE]			= 50;
	protection[PROT_MAGIC]			= 50;
	protection[PROT_FALL]			= 0;
	protection[PROT_FLY]			= 0;
	protection[PROT_BARRIER]		= 0;

	// -------- visuals --------
	Mdl_SetModelFatness(self, 0);
	Mdl_SetVisual(self, "babe.mds"); 					// basic animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"Bab_Body_Naked2",		3,		1,			"Bab_Head_Amazone.mms",4,		0,			-1);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	//-- not identified by flex ----
	aivar[AIV_FEMALE]				= TRUE;
	//aivar[AIV_TALENT_STAFF]		= TALENT_STAFF_2;
	aivar[AIV_ARENA_VICTORIES]		= THORA_VICTORIES_START;

	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_STAFF, 2);

	// -------- inventory --------
	EquipItem(self, ItMw_Thora_Battlestaff);

	// -------- daily routine --------
	daily_routine = Rtn_Start_900;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_Start_900()
{
	TA_Stay(06, 00, 08, 00, THORA_WP_OUT);
	TA_Stay(08, 00, 06, 00, THORA_WP_OUT);
};

func void Rtn_ArenaWait_900()
{
	TA_Stay(THORA_OUT_H, THORA_OUT_M, THORA_IN_H, THORA_IN_M, THORA_WP_OUT);
	TA_SitAround(THORA_IN_H, THORA_IN_M, THORA_OUT_H, THORA_OUT_M, "OCR_ARENABATTLE_BENCH");
};

func void Rtn_PreChamber_900()
{
	TA_SitAround(00, 00, 12, 00, ARENA_WP_RIGHT_CHAMBER);
	TA_SitAround(12, 00, 00, 00, ARENA_WP_RIGHT_CHAMBER);
};

func void Rtn_ArenaFight_900()
{
	TA_ArenaFight(00, 00, 12, 00, ARENA_WP_RIGHT_START);
	TA_ArenaFight(12, 00, 00, 00, ARENA_WP_RIGHT_START);
};

func void Rtn_ArenaNpc_900()
{
	TA_ArenaNpc(00, 00, 12, 00, ARENA_WP_RIGHT_START);
	TA_ArenaNpc(12, 00, 00, 00, ARENA_WP_RIGHT_START);
};

//------------------------------------------------------------------------------------------
// Kapitel 2 - Weg zur Bergfestung

func void Rtn_GuideToBF_900()
{
	TA_GuidePC(00, 00, 12, 00, "OCR_ARENABATTLE_BENCH");
	TA_GuidePC(12, 00, 00, 00, "OCR_ARENABATTLE_BENCH");
};

func void Rtn_ReportToGarwog_900()
{
	TA_SmallTalk(00, 00, 12, 00, "BF_GARWOG_IN");
	TA_SmallTalk(12, 00, 00, 00, "BF_GARWOG_IN");
};
