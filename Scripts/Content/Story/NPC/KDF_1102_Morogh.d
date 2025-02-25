instance KDF_1102_Morogh(Npc_Default)
{
	// -------- primary data --------
	name							= "Morogh";
	npcType							= NpcType_Main;
	guild							= GIL_KDF;
	level							= 30;
	flags							= NPC_FLAG_IMMORTAL;

	voice							= 14;
	id								= 1102;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 30;
	attribute[ATR_DEXTERITY]		= 40;
	attribute[ATR_MANA_MAX]			= 100;
	attribute[ATR_MANA]				= 100;
	attribute[ATR_HITPOINTS_MAX]	= 400;
	attribute[ATR_HITPOINTS]		= 400;

	// -------- protection --------

	// -------- visuals --------
	Mdl_SetModelFatness(self, 0);
	Mdl_SetVisual(self, "HUMANS.MDS");
	Mdl_ApplyOverlayMDS(self, "Humans_Mage.mds");
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_Naked0",		0,		1,			"Hum_Head_Pony",	84,			1,			KDF_ARMOR_H);

	B_Scale(self);

	// -------- ai --------
	aivar[AIV_IMPORTANT]			= TRUE;

	fight_tactic = FAI_HUMAN_MAGE;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_MAGE, 6);

	// -------- inventory --------

	// -------- daily routine --------
	daily_routine = Rtn_start_1102;
};

func void Rtn_start_1102()
{
	TA_PotionAlchemy(19, 05, 06, 55, "BF_MAGE1_POTION");
	TA_PotionAlchemy(06, 55, 19, 05, "BF_MAGE1_POTION");
};
