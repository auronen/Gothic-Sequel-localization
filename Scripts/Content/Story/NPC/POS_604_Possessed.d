instance POS_604_Possessed(C_Npc)
{
	// -------- primary data --------
	name							= NAME_Possessed;
	npcType							= NpcType_Ambient;
	guild							= GIL_POSSESSED;
	level							= 1;

	voice							= 2;
	id								= 604;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 10;
	attribute[ATR_DEXTERITY]		= 10;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 40;
	attribute[ATR_HITPOINTS]		= 40;

	// -------- protection --------
	protection[PROT_EDGE]			= 0;
	protection[PROT_EDGE]			= 0;
	protection[PROT_BLUNT]			= 0;
	protection[PROT_POINT]			= 0;
	protection[PROT_FIRE]			= 0;
	protection[PROT_MAGIC]			= 0;

	// -------- visuals --------
	Mdl_SetModelFatness(self, 0);					// limb fatness
	Mdl_SetVisual(self, "humans.mds");			// basic animation file
	Mdl_ApplyOverlayMDS(self, "Humans_Tired.mds");	// overlay animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_possessed",	0,		0,			"Hum_Head_Bald",	22,			3,			-1);

	B_Scale(self);							// body width according to strength of character

	// -------- ai --------
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------
	CreateInvItems(self, ItFo_Booze, 1);

	// -------- daily routine --------
	daily_routine = Rtn_start_604;
};

func void Rtn_start_604()
{
	TA_WalkIdiot(08, 00, 20, 00, "OC_MOAT_20");
	TA_PossessedSleep(20, 00, 08, 00, "OCR_GHETTO_HUT_05");
};
