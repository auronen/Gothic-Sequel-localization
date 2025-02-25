instance KDF_1103_Nereus(Npc_Default)
{
	// -------- primary data --------
	name							= "Nereus";
	npcType							= NpcType_Main;
	guild							= GIL_KDF;
	level							= 28;

	voice							= 13;
	id								= 1103;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 40;
	attribute[ATR_DEXTERITY]		= 35;
	attribute[ATR_MANA_MAX]			= 90;
	attribute[ATR_MANA]				= 90;
	attribute[ATR_HITPOINTS_MAX]	= 376;
	attribute[ATR_HITPOINTS]		= 376;

	// -------- protection --------

	// -------- visuals --------
	Mdl_SetModelFatness(self, 0);
	Mdl_SetVisual(self, "HUMANS.MDS");
	Mdl_ApplyOverlayMDS(self, "Humans_Mage.mds");
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_Naked0",		0,		0,			"Hum_Head_Thief",	4,			0,			KDF_ARMOR_L);

	B_Scale(self);

	// -------- ai --------
	aivar[AIV_IMPORTANT]			= TRUE;

	fight_tactic = FAI_HUMAN_MAGE;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_MAGE, 6);

	// -------- inventory --------

	// -------- daily routine --------
	daily_routine = Rtn_start_1103;
};

func void Rtn_start_1103()
{
	TA_ReadBook(18, 50, 07, 10, "BF_MAGE2_BOOK_1");
	TA_ReadBook(07, 10, 18, 50, "BF_MAGE2_BOOK_1");
};
