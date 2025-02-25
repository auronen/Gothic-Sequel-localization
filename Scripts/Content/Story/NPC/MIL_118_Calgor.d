// ---------------------------------------------------------
// NPC 'MIL_118_Calgor'
// ---------------------------------------------------------

instance MIL_118_Calgor(C_Npc)
{
	// -------- primary data --------
	name							= "Calgor";
	npcType							= NpcType_Guard;
	guild							= GIL_MILITIA;
	level							= 10;

	voice							= 8;
	id								= 118;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 40;
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
	Mdl_ApplyOverlayMDS(self, "humans_militia.mds"); 			// overlay animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		0,		1,			"hum_head_fighter",	51,			2,			GRD_ARMOR_L);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 1);

	// -------- inventory --------
	CreateInvItems(self, ItMi_Silver, 11);
	CreateInvItems(self, ItFo_Potion_Health_01, 1);
	CreateInvItems(self, ItFo_MeatStew, 2);
	EquipItem(self, ItMw_MilitiaSword);

	// -------- daily routine --------
	daily_routine = Rtn_start_118;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_118()
{
	TA_Stand(06, 00, 10, 00, "OCR_TO_HUT_22");
	TA_SitAround(10, 00, 12, 00, "OCR_COOK01_01");
	TA_Stand(13, 00, ARENAPRE_H, ARENAPRE_M, "OCR_OUTSIDE_HUT_29");
	TA_GuardFP(ARENAPRE_H, ARENAPRE_M, ARENAEND_H, ARENAEND_M, "OCR_ARENA_02");
	TA_SitAround(ARENAEND_H, ARENAEND_M, 06, 00, "OCR_OUTSIDE_ARENA_HANGAROUND");
};
