// ---------------------------------------------------------
// NPC 'THF_408_Thief'
// ---------------------------------------------------------

instance THF_408_Thief(C_Npc)
{
	// -------- primary data --------
	name							= NAME_Thief;
	npcType							= NpcType_Ambient;
	guild							= GIL_THIEF;
	level							= 15;

	voice							= 10;
	id								= 408;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 40;
	attribute[ATR_DEXTERITY]		= 100;
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
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		0,		1,			"Hum_Head_Fighter",	55,			2,			VLK_ARMOR_L);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 1);
	Npc_SetTalentSkill(self, NPC_TALENT_BOW, 1);

	// -------- inventory --------
	CreateInvItems(self, ItFo_Cheese, 3);
	CreateInvItems(self, ItMi_Silver, 2);
	CreateInvItems(self, ItFo_HerbSoup, 2);
	CreateInvItems(self, ItFo_Apple, 3);
	EquipItem(self, ItMw_Shortsword);

	// -------- daily routine --------
	daily_routine = Rtn_start_408;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_408()
{
	TA_StandAround(08, 00, ARENAEND_H, ARENAEND_M, "OCR_OUTSIDE_HUT_26");
	TA_Sleep(ARENAEND_H, ARENAEND_M, 08, 00, "OCR_HUT_33");
};

func void Rtn_ArenaSpectator_408()
{
	TA_ArenaSpectator(08, 00, 20, 00, "OCR_ARENA_01");
	TA_ArenaSpectator(20, 00, 08, 00, "OCR_ARENA_01");
};
