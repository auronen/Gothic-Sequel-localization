instance PC_Psionic(C_Npc)
// PlayerInstanz
{
	// -------- primary data --------
	name							= "Lester";
	npcType							= NpcType_Friend;
	guild							= GIL_NONE;
	level							= 999;			// real 15, aber 999 damit er nicht vor dem Brückegolem flieht!
	flags							= NPC_FLAG_IMMORTAL;

	voice							= 23;
	id								= 4;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 45;
	attribute[ATR_DEXTERITY]		= 35;
	attribute[ATR_MANA_MAX]			= 50;
	attribute[ATR_MANA]				= 50;
	attribute[ATR_HITPOINTS_MAX]	= 220;
	attribute[ATR_HITPOINTS]		= 220;

	// -------- protection --------
	protection[PROT_FIRE]			= 1000;
	protection[PROT_EDGE]			= 0;
	protection[PROT_EDGE]			= 0;
	protection[PROT_BLUNT]			= 0;
	protection[PROT_POINT]			= 0;
	protection[PROT_FIRE]			= 0;
	protection[PROT_MAGIC]			= 0;

	// -------- visuals --------
	Mdl_SetVisual(self, "HUMANS.MDS");
	Mdl_ApplyOverlayMDS(self, "Humans_Mage.mds");	// overlay animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_Naked0",		1,		0,			"Hum_Head_Bald",	17,			2,			NOV_ARMOR_M);

	// -------- ai --------
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1500;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 2);

	// -------- inventory --------

	// -------- daily routine --------
	daily_routine = Rtn_start_4;
};

func void Rtn_start_4()
{
	TA_PotionAlchemy(00, 00, 12, 00, "OCC_CHAPEL_RIGHT_ROOM");
	TA_PotionAlchemy(12, 00, 00, 00, "OCC_CHAPEL_RIGHT_ROOM");
};

func void Rtn_study_4()
{
	TA_ReadBook(00, 00, 12, 00, "OCC_CHAPEL_UPSTAIRS_RIGHT");
	TA_ReadBook(12, 00, 00, 00, "OCC_CHAPEL_UPSTAIRS_RIGHT");
};
