// ---------------------------------------------------------
// NPC 'HLR_503_Odo'
// ---------------------------------------------------------

instance HLR_503_Odo(C_Npc)
{
	// -------- primary data --------
	name							= "Odo";
	npcType							= NpcType_Main;
	guild							= GIL_HEALER;
	level							= 20;

	voice							= 8;
	id								= 503;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 25;
	attribute[ATR_DEXTERITY]		= 35;
	attribute[ATR_MANA_MAX]			= 100;
	attribute[ATR_MANA]				= 100;
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
	Mdl_SetModelFatness(self, 1);
	Mdl_SetVisual(self, "humans.mds"); 					// basic animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		3,		1,			"Hum_Head_Psionic",	8,			1,			-1);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------
	CreateInvItem(self, ItMiJoint_3);
	CreateInvItems(self, ItMi_Silver, 10);
	CreateInvItems(self, ItFo_Potion_Health_01, 2);
	CreateInvItems(self, ItFo_Ham, 3);
	CreateInvItems(self, ItMi_Salt, 10);
	CreateInvItems(self, ItPl_Swampweed, 4);
	CreateInvItems(self, ItMiJoint_1, 3);
	CreateInvItems(self, ItMiJoint_2, 2);
	EquipItem(self, ItMw_Club);

	// -------- daily routine --------
	daily_routine = Rtn_start_503;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_503()
{
	TA_Stay(08, 00, 20, 00, "OCR_TO_GHETTO_3");
	TA_Stay(20, 00, 08, 00, "OCR_TO_GHETTO_3");
};
