// ---------------------------------------------------------
// NPC 'WRK_201_Gordian'
// ---------------------------------------------------------

instance WRK_201_Gordian(C_Npc)
{
	// -------- primary data --------
	name							= "Gordian";
	npcType							= NpcType_Main;
	guild							= GIL_WORKER;
	level							= 10;

	voice							= 9;
	id								= 201;

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
	Mdl_ApplyOverlayMDS(self, "Humans_Tired.mds"); 			// overlay animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		2,		1,			"Hum_Head_Bald",	71,			4,			VLK_ARMOR_L);

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
	CreateInvItems(self, ItMi_Silver, 20);
	CreateInvItems(self, ItFo_MeatbugSoup, 2);
	EquipItem(self, ItMw_Nailmace);

	// -------- daily routine --------
	daily_routine = Rtn_start_201;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_201()
{
	TA_Sleep(00, 00, 08, 00, "OCR_HUT_43");
	TA_SitAround(08, 00, 13, 00, "OCR_HUT_43");
	TA_ReadBook(13, 00, 16, 00, "OCR_HUT_43");
	TA_SitAround(16, 00, 20, 00, "OCR_HUT_43");
	TA_ReadBook(20, 00, 00, 00, "OCR_HUT_43");
};
