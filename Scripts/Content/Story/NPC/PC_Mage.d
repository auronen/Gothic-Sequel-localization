instance PC_Mage(C_Npc)
{
	// -------- primary data --------
	name							= "Milten";
	npcType							= NpcType_Friend;
	guild							= GIL_NONE;
	level							= 999;			// real 15, aber 999 damit er nicht flieht!
	flags							= NPC_FLAG_IMMORTAL;

	voice							= 2;
	id								= 2;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 30;
	attribute[ATR_DEXTERITY]		= 30;
	attribute[ATR_MANA_MAX]			= 150;
	attribute[ATR_MANA]				= 150;
	attribute[ATR_HITPOINTS_MAX]	= 250;
	attribute[ATR_HITPOINTS]		= 250;

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
	Mdl_ApplyOverlayMDS(self, "Humans_Mage.mds");
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_Naked0",		0,		1,			"Hum_Head_Bald",	76,			1,			KDF_ARMOR_L);

	// -------- ai --------
	aivar[AIV_IMPORTANT]			= TRUE;

	fight_tactic = FAI_HUMAN_MAGE;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_MAGE, 6);

	// -------- inventory --------
	CreateInvItem(self, ItAr_RuneFireball);
	CreateInvItems(self, ItFo_Wine, 3);
	CreateInvItems(self, ItFo_Potion_Health_02, 10);
	CreateInvItems(self, ItFo_Potion_Mana_02, 10);

	// -------- daily routine --------
	daily_routine = rtn_PreStart_2;
};

func void Rtn_PreStart_2()
{
	TA_Stay(00, 00, 12, 00, "BF_PLATEAU_3");
	TA_Stay(12, 00, 00, 00, "BF_PLATEAU_3");
};

func void Rtn_Start_2()
{
	TA_Meltrune(00, 00, 02, 00, "BF_MAGE1_MELTER");
	TA_MakeRune(02, 00, 04, 00, "BF_MAGE1_MAKER");
	TA_Meltrune(04, 00, 06, 00, "BF_MAGE1_MELTER");
	TA_MakeRune(06, 00, 08, 00, "BF_MAGE1_MAKER");
	TA_Meltrune(08, 00, 10, 00, "BF_MAGE1_MELTER");
	TA_MakeRune(10, 00, 12, 00, "BF_MAGE1_MAKER");
	TA_Meltrune(12, 00, 14, 00, "BF_MAGE1_MELTER");
	TA_MakeRune(14, 00, 16, 00, "BF_MAGE1_MAKER");
	TA_Meltrune(16, 00, 18, 00, "BF_MAGE1_MELTER");
	TA_MakeRune(18, 00, 20, 00, "BF_MAGE1_MAKER");
	TA_Meltrune(20, 00, 22, 00, "BF_MAGE1_MELTER");
	TA_MakeRune(22, 00, 00, 00, "BF_MAGE1_MAKER");
};
