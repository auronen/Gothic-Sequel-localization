instance KDF_1100_Catmaol(Npc_Default)
{
	// -------- primary data --------
	name							= "Catmaol";
	npcType							= NpcType_Main;
	guild							= GIL_KDF;
	level							= 25;

	voice							= 12;
	id								= 1100;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 45;
	attribute[ATR_DEXTERITY]		= 35;
	attribute[ATR_MANA_MAX]			= 90;
	attribute[ATR_MANA]				= 90;
	attribute[ATR_HITPOINTS_MAX]	= 340;
	attribute[ATR_HITPOINTS]		= 340;

	// -------- protection --------

	// -------- visuals --------
	Mdl_SetModelFatness(self, 0);
	Mdl_SetVisual(self, "HUMANS.MDS");
	Mdl_ApplyOverlayMDS(self, "Humans_Mage.mds");
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_Naked0",		0,		0,			"Hum_Head_Pony",	6,			1,			KDF_ARMOR_H);

	B_Scale(self);

	// -------- ai --------
	aivar[AIV_IMPORTANT]			= TRUE;

	fight_tactic = FAI_HUMAN_MAGE;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_MAGE, 6);

	// -------- inventory --------

	// -------- daily routine --------
	daily_routine = Rtn_start_1100;
};

func void Rtn_start_1100()
{
	TA_Stay(22, 00, 07, 00, "BF_THRONE_MAGE");
	TA_Stay(07, 00, 22, 00, "BF_THRONE_MAGE");
};
