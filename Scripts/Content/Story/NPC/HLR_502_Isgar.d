// ---------------------------------------------------------
// NPC 'HLR_502_Isgar'
// ---------------------------------------------------------

instance HLR_502_Isgar(C_Npc)
{
	// -------- primary data --------
	name							= "Isgar";
	npcType							= NpcType_Main;
	guild							= GIL_HEALER;
	level							= 40;

	voice							= 8;
	id								= 502;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 50;
	attribute[ATR_DEXTERITY]		= 75;
	attribute[ATR_MANA_MAX]			= 150;
	attribute[ATR_MANA]				= 150;
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
	Mdl_ApplyOverlayMDS(self, "Humans_Mage.mds"); 				// overlay animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		0,		0,			"Hum_Head_Psionic",	8,			1,			HLRM_ARMOR);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_MAGE;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_MAGE, 4);

	// -------- inventory --------
	CreateInvItem(self, ItFo_Potion_Health_02);
	CreateInvItem(self, ItFo_Potion_Mana_02);
	CreateInvItems(self, ItMi_Silver, 20);
	CreateInvItems(self, ItFo_Potion_Health_01, 3);
	CreateInvItems(self, ItFo_Potion_Mana_01, 3);
	CreateInvItems(self, ItFo_Ham, 3);
	CreateInvItems(self, ItMi_Salt, 10);
	CreateInvItems(self, ItPl_Swampweed, 3);
	CreateInvItems(self, ItPl_Stoneroot, 3);
	CreateInvItems(self, ItPl_OrcLeaf, 3);
	CreateInvItems(self, ItPl_MountainMoss, 3);
	EquipItem(self, ItAr_RuneSleep);

	// -------- daily routine --------
	daily_routine = Rtn_start_502;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_502()
{
	TA_Sleep(00, 00, 07, 00, "OCR_MEDICUS_4_BED1");
	TA_PotionAlchemy(07, 00, 00, 00, "OCR_HUT_55");
};
