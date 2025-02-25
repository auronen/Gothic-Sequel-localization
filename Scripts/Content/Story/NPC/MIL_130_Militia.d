// ---------------------------------------------------------
// NPC 'MIL_130_Militia'
// ---------------------------------------------------------

instance MIL_130_Militia(C_Npc)
{
	// -------- primary data --------
	name							= NAME_Militia;
	npcType							= NpcType_Guard;
	guild							= GIL_MILITIA;
	level							= 10;

	voice							= 4;
	id								= 130;

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
	CreateInvItems(self, ItFo_MeatStew, 1);
	CreateInvItems(self, ItFo_Loaf, 2);
	CreateInvItems(self, ItFo_Wine, 1);
	CreateInvItems(self, ItLsTorch, 1);
	EquipItem(self, ItMw_MilitiaSword);

	// -------- daily routine --------
	daily_routine = Rtn_start_130;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_130()
{
	TA_GuardFP(07, 30, 20, 00, "OCR_TO_GHETTO_2");
	TA_GuardFP(20, 00, 07, 30, "OCR_TO_GHETTO_2");
};
