// ---------------------------------------------------------
// NPC 'THF_401_Huldrych'
// ---------------------------------------------------------

instance THF_401_Huldrych(C_Npc)
{
	// -------- primary data --------
	name							= "Huldrych";
	npcType							= NpcType_Main;
	guild							= GIL_THIEF;
	level							= 20;

	voice							= 5;
	id								= 401;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 20;
	attribute[ATR_DEXTERITY]		= 75;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 80;
	attribute[ATR_HITPOINTS]		= 80;
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
	Mdl_ApplyOverlayMDS(self, "Humans_Relaxed.mds"); 			// overlay animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		0,		1,			"Hum_Head_Fighter",	55,			2,			VLK_ARMOR_L);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------
	CreateInvItems(self, ItAm_Arrow, 20);
	CreateInvItems(self, ItMi_Silver, 10);
	CreateInvItems(self, ItFo_HerbSoup, 3);
	CreateInvItems(self, ItFo_Apple, 2);
	CreateInvItems(self, ItFo_Wine, 2);
	EquipItem(self, ItMw_Nailmace);
	EquipItem(self, ItRw_ShortBow);

	// -------- daily routine --------
	daily_routine = Rtn_start_401;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_401()
{
	TA_StandAround(08, 00, 12, 00, "OCR_OUTSIDE_HUT_78");
	TA_StandAround(12, 00, 22, 00, "OCR_OUTSIDE_HUT_78");
	TA_Sleep(22, 00, 08, 00, "OCR_HUT_78");
};
