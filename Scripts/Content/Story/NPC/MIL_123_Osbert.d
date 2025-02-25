// ---------------------------------------------------------
// NPC 'MIL_123_Osbert'
// ---------------------------------------------------------

instance MIL_123_Osbert(C_Npc)
{
	// -------- primary data --------
	name							= "Osbert";
	npcType							= NpcType_Main;
	guild							= GIL_MILITIA;
	level							= 10;

	voice							= 7;
	id								= 123;

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
	Mdl_ApplyOverlayMDS(self, "humans_arrogance.mds"); 		// overlay animation file
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
	CreateInvItems(self, ItMi_Silver, 16);
	CreateInvItems(self, ItFo_Potion_Health_01, 3);
	CreateInvItems(self, ItFo_MeatStew, 3);
	CreateInvItems(self, ItFo_Wine, 2);
	EquipItem(self, ItMw_MilitiaSword);

	// -------- daily routine --------
	daily_routine = Rtn_GUARDEBR_123;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_123()
{
	TA_Boss(08, 00, 10, 00, "OCR_TO_MAINGATE");
	TA_Listen(10, 00, 13, 00, "OCC_SHADOWS_CORNER_02");
	TA_SitCampfire(13, 00, 14, 00, "OCC_CENTER_4_PATH2");
	TA_Boss(14, 00, 08, 00, "OCR_TO_MAINGATE");
};

func void Rtn_GUARDEBR_123()
{
	TA_GuardWP(08, 00, 14, 00, "OCC_BARONS_CENTER");
	TA_GuardWP(14, 00, 20, 00, "OCC_BARONS_CENTER");
	TA_GuardWP(20, 00, 02, 00, "OCC_BARONS_CENTER");
	TA_GuardWP(02, 00, 08, 00, "OCC_BARONS_CENTER");
};
