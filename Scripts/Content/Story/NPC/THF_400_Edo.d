// ---------------------------------------------------------
// NPC 'THF_400_Edo'
// ---------------------------------------------------------

instance THF_400_Edo(C_Npc)
{
	// -------- primary data --------
	name							= "Edo";
	npcType							= NpcType_Main;
	guild							= GIL_THIEF;
	level							= 20;

	voice							= 10;
	id								= 400;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 50;
	attribute[ATR_DEXTERITY]		= 150;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 250;
	attribute[ATR_HITPOINTS]		= 250;
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
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		0,		1,			"Hum_Head_Fighter",	55,			2,			VLK_ARMOR_L);

	B_Scale(self); 								//auto-matching scale with strength

	// -------- ai --------
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 1);

	// -------- inventory --------
	CreateInvItem(self, ItMi_Stomper);
	CreateInvItem(self, ItMi_Lute);
	CreateInvItems(self, ItMi_Hammer, 3);
	CreateInvItems(self, ItMi_Scoop, 2);
	CreateInvItems(self, ItMi_Flask, 4);
	CreateInvItems(self, ItMiJoint_1, 10);
	CreateInvItems(self, ItAm_Arrow, 20);
	CreateInvItems(self, ItMi_Silver, 30);
	CreateInvItems(self, ItFo_HerbSoup, 3);
	CreateInvItems(self, ItFo_Apple, 2);
	CreateInvItems(self, ItFo_Wine, 2);
	CreateInvItems(self, ItMi_OreNugget, EDO_STOLENORE);
	EquipItem(self, ItMw_Shortsword);
	EquipItem(self, ItRw_ShortBow);

	// -------- daily routine --------
	daily_routine = Rtn_start_400;
};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_400()
{
	TA_Sleep(22, 30, 07, 30, "OCR_HUT_46");
	TA_SitAround(07, 30, 22, 30, "OCR_HUT_46C");
};

func void Rtn_deal_400()
{
	TA_Sleep(22, 30, 07, 30, EDO_WP_SELL);
	TA_Stay(07, 30, 22, 30, EDO_WP_SELL);
};
