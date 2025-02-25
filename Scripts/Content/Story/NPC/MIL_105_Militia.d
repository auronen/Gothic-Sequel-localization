// ---------------------------------------------------------
// NPC 'MIL_105_Militia'
// ---------------------------------------------------------

instance MIL_105_Militia(C_Npc)
{
	// -------- primary data --------
	name							= NAME_Militia;
	npcType							= NpcType_Guard;
	guild							= GIL_MILITIA;
	level							= 10;

	voice							= 4;
	id								= 105;

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
	Mdl_ApplyOverlayMDS(self, "humans_militia.mds"); 			// overlay animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		0,		1,			"hum_head_fighter",	51,			2,			GRD_ARMOR_M);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 2);
	Npc_SetTalentSkill(self, NPC_TALENT_2H, 1);

	// -------- inventory --------
	CreateInvItems(self, ItMi_Silver, 10);
	CreateInvItems(self, ItFo_Potion_Health_01, 1);
	CreateInvItems(self, ItFo_MeatStew, 3);
	CreateInvItems(self, ItFo_Loaf, 2);
	CreateInvItems(self, ItFo_Wine, 2);
	CreateInvItems(self, ItLsTorch, 2);
	EquipItem(self, ItMw_MilitiaSword);

	// -------- daily routine --------
	daily_routine = Rtn_start_105;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_105()
{
	TA_Horn(07, 35, 07, 55, "OCR_TO_HUT_72");
	TA_Horn(07, 55, 08, 00, "OCR_OUTSIDE_HUT_68_BENCH2");
	TA_GuardFP(08, 00, 10, 00, "OCR_PALISADE_WALK_51");
	TA_GuardPalisade(10, 00, 12, 00, "OCR_PALISADE_WALK_51");
	TA_GuardPalisade(12, 00, 14, 00, "OCR_PALISADE_WALK_51_B");
	TA_GuardPalisade(14, 00, 16, 00, "OCR_PALISADE_WALK_29");
	TA_GuardPalisade(16, 00, 17, 40, "OCR_PALISADE_WALK_28");
	TA_Horn(17, 40, 17, 50, "OCR_PALISADE_WALK_51");
	TA_Horn(17, 50, 18, 00, "OCR_OUTSIDE_HUT_77_MOVEMENT");
	TA_GuardFP(18, 00, 20, 00, "OCR_PALISADE_WALK_51");
	TA_GuardFP(20, 00, 22, 00, "OCR_LAKE_2");
	TA_GuardFP(22, 00, 23, 00, "OCR_PALISADE_WALK_51");
	TA_GuardPalisade(23, 00, 00, 00, "OCR_PALISADE_WALK_51_B");
	TA_GuardPalisade(00, 00, 02, 00, "OCR_PALISADE_WALK_29");
	TA_GuardPalisade(02, 00, 04, 00, "OCR_PALISADE_WALK_28");
	TA_GuardFP(04, 00, 07, 35, "OCR_PALISADE_WALK_51");
};
