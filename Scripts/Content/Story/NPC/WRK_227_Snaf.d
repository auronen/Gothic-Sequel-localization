// ---------------------------------------------------------
// NPC 'WRK_227_Snaf'
// ---------------------------------------------------------

instance WRK_227_Snaf(C_Npc)
{
	// -------- primary data --------
	name							= "Snaf";
	npcType							= NpcType_Main;
	guild							= GIL_WORKER;
	level							= 10;

	voice							= 9;
	id								= 227;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 75;
	attribute[ATR_DEXTERITY]		= 50;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 300;
	attribute[ATR_HITPOINTS]		= 300;
	attribute[ATR_REGENERATEMANA]	= 0;
	attribute[ATR_REGENERATEHP]		= 0;

	// -------- protection --------
	protection[PROT_EDGE]			= 20;
	protection[PROT_BLUNT]			= 20;
	protection[PROT_POINT]			= 0;
	protection[PROT_FIRE]			= 0;
	protection[PROT_MAGIC]			= 0;
	protection[PROT_FALL]			= 0;
	protection[PROT_FLY]			= 0;
	protection[PROT_BARRIER]		= 0;

	// -------- visuals --------
	Mdl_SetModelFatness(self, 2);
	Mdl_SetVisual(self, "HUMANS.MDS"); 					// basic animation file
	Mdl_ApplyOverlayMDS(self, "Humans_Relaxed.mds"); 			// overlay animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"Hum_Body_CookSmith",	0,		1,			"Hum_Head_Fighter",	81,			1,			-1);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_STRONG;
	senses_range = 2000;
	//WARNING! This NPC has no senses!

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 1);

	// -------- inventory --------
	CreateInvItem(self, ItFo_Beer);
	CreateInvItems(self, ItMi_Silver, 10);
	CreateInvItems(self, ItFo_MeatbugSoup, 2);
	EquipItem(self, ItMw_Ironclub);

	// -------- daily routine --------
	daily_routine = Rtn_start_227;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_227()
{
	TA_Cook(08, 00, 22, 00, "OCR_COOK01_01");
	TA_Sleep(22, 00, 08, 00, "OCR_HUT_35");
};
