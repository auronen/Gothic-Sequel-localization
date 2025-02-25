// ---------------------------------------------------------
// NPC 'PAL_1003_Garwog'
// ---------------------------------------------------------

instance PAL_1003_Garwog(C_Npc)
{
	// -------- primary data --------
	name							= "Garwog";
	npcType							= NpcType_Main;
	guild							= GIL_PALADIN;
	level							= 20;

	voice							= 8;
	id								= 1003;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 100;
	attribute[ATR_DEXTERITY]		= 75;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 400;
	attribute[ATR_HITPOINTS]		= 400;
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
	Mdl_SetVisualBody(self,	"hum_body_naked0",		0,		1,			"hum_head_fighter",	51,			2,			PALS_ARMOR);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 2);
	Npc_SetTalentSkill(self, NPC_TALENT_2H, 2);

	// -------- inventory --------
	CreateInvItems(self, ItAm_Bolt, 100);
	EquipItem(self, ItMw_PaladinSword);
	EquipItem(self, ItRw_HeavyCrossBow);

	// -------- daily routine --------
	daily_routine = Rtn_start_1003;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_1003()
{
	TA_Boss(00, 00, 12, 00, "BF_GARWOG_OUT");
	TA_Boss(12, 00, 00, 00, "BF_GARWOG_OUT");
};

func void Rtn_ReportFromThora_1003()
{
	TA_SmallTalk(00, 00, 12, 00, "BF_GARWOG_IN");
	TA_SmallTalk(12, 00, 00, 00, "BF_GARWOG_IN");
};
