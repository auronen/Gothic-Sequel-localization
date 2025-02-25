instance DMC_800_Xardas(C_Npc)
{
	// -------- primary data --------
	name							= "Xardas";
	npcType							= NpcType_Friend;
	guild							= GIL_DEMONIC;
	level							= 30;
	flags							= NPC_FLAG_IMMORTAL;

	voice							= 14;
	id								= 800;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 10;
	attribute[ATR_DEXTERITY]		= 10;
	attribute[ATR_MANA_MAX]			= 100;
	attribute[ATR_MANA]				= 100;
	attribute[ATR_HITPOINTS_MAX]	= 400;
	attribute[ATR_HITPOINTS]		= 400;

	// -------- protection --------
	protection[PROT_EDGE]			= 0;
	protection[PROT_EDGE]			= 0;
	protection[PROT_BLUNT]			= 0;
	protection[PROT_POINT]			= 0;
	protection[PROT_FIRE]			= 0;
	protection[PROT_MAGIC]			= 0;

	// -------- visuals --------
	Mdl_SetModelFatness(self, 0);
	Mdl_SetVisual(self, "HUMANS.MDS");
	Mdl_ApplyOverlayMDS(self, "Humans_Mage.mds");
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_Naked0",		0,		1,			"Hum_Head_Bald",	82,			1,			DMB_ARMOR_M);

	// -------- ai --------
	fight_tactic = FAI_HUMAN_MAGE;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_MAGE, 6);

	// -------- inventory --------
	CreateInvItem(self, ItAr_RuneWindfist);

	// -------- daily routine --------
	daily_routine = Rtn_prestart_800;
};

func void Rtn_prestart_800()
{
	TA_Stay(06, 00, 08, 00, "DT_LABOURY");
	TA_Stay(08, 00, 06, 00, "DT_LABOURY");
};

func void Rtn_start_800()
{
	TA_PotionAlchemy(06, 00, 08, 00, "DT_E2_05");
	TA_PotionAlchemy(08, 00, 06, 00, "DT_E2_05");
};

func void Rtn_Reading_800()
{
	TA_ReadBook(06, 00, 08, 00, "DT_E3_07");
	TA_ReadBook(08, 00, 06, 00, "DT_E3_07");
};

func void Rtn_Escaped_800()
{
	TA_Stay(06, 00, 08, 00, "nowhere");	// Xardas wird erstmal aus dem Spiel genommen, kommt aber später wieder zurück
	TA_Stay(08, 00, 06, 00, "nowhere");
};
