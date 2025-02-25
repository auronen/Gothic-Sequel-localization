// ---------------------------------------------------------
// NPC 'WRK_200_Gotmar'
// ---------------------------------------------------------

instance WRK_200_Gotmar(C_Npc)
{
	// -------- primary data --------
	name							= "Gotmar";
	npcType							= NpcType_Main;
	guild							= GIL_WORKER;
	level							= 10;

	voice							= 4;
	id								= 200;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 100;
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
	CreateInvItem(self, ItFo_Beer);
	CreateInvItems(self, ItMi_Silver, 40);
	CreateInvItems(self, ItFo_MeatbugSoup, 2);
	EquipItem(self, ItMw_Nailmace);

	// -------- daily routine --------
	daily_routine = Rtn_start_200;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_200()
{
	TA_Sleep(22, 00, 08, 00, "OCR_HUT_77_STRAW");
	TA_Smith_Fire(08, 00, 08, 10, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(08, 10, 08, 20, GOTMAR_WP_FORGE);
	TA_Smith_Cool(08, 20, 08, 30, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(08, 30, 08, 40, GOTMAR_WP_FORGE);
	TA_Smith_Fire(08, 40, 08, 50, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(08, 50, 09, 00, GOTMAR_WP_FORGE);
	TA_Smith_Cool(09, 00, 09, 10, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(09, 10, 09, 20, GOTMAR_WP_FORGE);
	TA_Smith_Fire(09, 20, 09, 30, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(09, 30, 09, 40, GOTMAR_WP_FORGE);
	TA_Smith_Cool(09, 40, 09, 50, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(09, 50, 10, 00, GOTMAR_WP_FORGE);
	TA_Smith_Fire(10, 00, 10, 10, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(10, 10, 10, 20, GOTMAR_WP_FORGE);
	TA_Smith_Cool(10, 20, 10, 30, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(10, 30, 10, 40, GOTMAR_WP_FORGE);
	TA_Smith_Fire(10, 40, 10, 50, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(10, 50, 11, 00, GOTMAR_WP_FORGE);
	TA_Smith_Cool(11, 00, 11, 10, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(11, 10, 11, 20, GOTMAR_WP_FORGE);
	TA_Smith_Fire(11, 20, 11, 30, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(11, 30, 11, 40, GOTMAR_WP_FORGE);
	TA_Smith_Cool(11, 40, 11, 50, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(11, 50, 12, 00, GOTMAR_WP_FORGE);
	TA_Smith_Fire(12, 00, 12, 10, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(12, 10, 12, 20, GOTMAR_WP_FORGE);
	TA_Smith_Cool(12, 20, 12, 30, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(12, 30, 12, 40, GOTMAR_WP_FORGE);
	TA_Smith_Fire(12, 40, 12, 50, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(12, 50, 13, 00, GOTMAR_WP_FORGE);
	TA_Smith_Cool(13, 00, 13, 10, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(13, 10, 13, 20, GOTMAR_WP_FORGE);
	TA_Smith_Fire(13, 20, 13, 30, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(13, 30, 13, 40, GOTMAR_WP_FORGE);
	TA_Smith_Cool(13, 40, 13, 50, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(13, 50, 14, 00, GOTMAR_WP_FORGE);
	TA_Smith_Fire(14, 00, 14, 10, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(14, 10, 14, 20, GOTMAR_WP_FORGE);
	TA_Smith_Cool(14, 20, 14, 30, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(14, 30, 14, 40, GOTMAR_WP_FORGE);
	TA_Smith_Fire(14, 40, 14, 50, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(14, 50, 15, 00, GOTMAR_WP_FORGE);
	TA_Smith_Cool(15, 00, 15, 10, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(15, 10, 15, 20, GOTMAR_WP_FORGE);
	TA_Smith_Fire(15, 20, 15, 30, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(15, 30, 15, 40, GOTMAR_WP_FORGE);
	TA_Smith_Cool(15, 40, 15, 50, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(15, 50, 16, 00, GOTMAR_WP_FORGE);
	TA_Smith_Fire(16, 00, 16, 10, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(16, 10, 16, 20, GOTMAR_WP_FORGE);
	TA_Smith_Cool(16, 20, 16, 30, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(16, 30, 16, 40, GOTMAR_WP_FORGE);
	TA_Smith_Fire(16, 40, 16, 50, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(16, 50, 17, 00, GOTMAR_WP_FORGE);
	TA_Smith_Cool(17, 00, 17, 10, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(17, 10, 17, 20, GOTMAR_WP_FORGE);
	TA_Smith_Fire(17, 20, 17, 30, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(17, 30, 17, 40, GOTMAR_WP_FORGE);
	TA_Smith_Cool(17, 40, 17, 50, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(17, 50, 18, 00, GOTMAR_WP_FORGE);
	TA_Smith_Fire(18, 00, 18, 10, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(18, 10, 18, 20, GOTMAR_WP_FORGE);
	TA_Smith_Cool(18, 20, 18, 30, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(18, 30, 18, 40, GOTMAR_WP_FORGE);
	TA_Smith_Fire(18, 40, 18, 50, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(18, 50, 19, 00, GOTMAR_WP_FORGE);
	TA_Smith_Cool(19, 00, 19, 10, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(19, 10, 19, 20, GOTMAR_WP_FORGE);
	TA_Smith_Fire(19, 20, 19, 30, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(19, 30, 19, 40, GOTMAR_WP_FORGE);
	TA_Smith_Cool(19, 40, 19, 50, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(19, 50, 20, 00, GOTMAR_WP_FORGE);
	TA_Smith_Fire(20, 00, 20, 10, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(20, 10, 20, 20, GOTMAR_WP_FORGE);
	TA_Smith_Cool(20, 20, 20, 30, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(20, 30, 20, 40, GOTMAR_WP_FORGE);
	TA_Smith_Fire(20, 40, 20, 50, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(20, 50, 21, 00, GOTMAR_WP_FORGE);
	TA_Smith_Cool(21, 00, 21, 10, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(21, 10, 21, 20, GOTMAR_WP_FORGE);
	TA_Smith_Fire(21, 20, 21, 30, GOTMAR_WP_FORGE);
	TA_Smith_Anvil(21, 30, 21, 40, GOTMAR_WP_FORGE);
	TA_Smith_Cool(21, 40, 21, 50, GOTMAR_WP_FORGE);
	TA_Smith_Sharp(21, 50, 22, 00, GOTMAR_WP_FORGE);
};
