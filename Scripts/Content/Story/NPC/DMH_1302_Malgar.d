instance DMH_1302_Malgar(C_Npc)
// PlayerInstanz
{
	// -------- primary data --------
	name							= "Malgar";
	npcType							= NpcType_Main;
	guild							= GIL_DEMONHUNTER; // VORSICHT: Muß auch in der B_Arena_UnselectFight() geändert werden!!!
	level							= 30;
	flags							= 0;

	voice							= 11;
	id								= 1302;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 80;
	attribute[ATR_DEXTERITY]		= 75;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 250;
	attribute[ATR_HITPOINTS]		= 250;

	// -------- protection --------
	protection[PROT_EDGE]			= 0;
	protection[PROT_BLUNT]			= 0;
	protection[PROT_POINT]			= 0;
	protection[PROT_FIRE]			= 0;
	protection[PROT_MAGIC]			= 0;

	// -------- visuals --------
	Mdl_SetModelFatness(self, 2);						// limb	fatness
	Mdl_SetVisual(self, "humans.mds");			// basic animation file
	Mdl_ApplyOverlayMDS(self, "humans_militia.mds");	// overlay animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		0,		1,			"hum_head_fighter",	50,			2,			DHTM_ARMOR);

	B_Scale(self);							// body	width according	to strength	of character

	// -------- ai --------
	aivar[AIV_ARENA_VICTORIES]		= MALGAR_VICTORIES_START;

	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 2);
	Npc_SetTalentSkill(self, NPC_TALENT_2H, 1);

	// -------- inventory --------
	EquipItem(self, ItMw_Malgar_Broadsword);
	//!!! SN: sonst, leeres	Inventory, da Arenakämpfer !!!

	// -------- daily routine --------
	daily_routine = Rtn_ArenaWait_1302;
};

func void Rtn_ArenaWait_1302()
{
	// sitzt vor dem Arenaeingang und wartet auf die Herausforderung des SCs
	TA_ArenaSitCampfire(06, 00, 22, 00, "OCR_CAMPFIRE_I_2");
	TA_ArenaStay(22, 00, 06, 00, "CONSTRUCT_UP_03");
};

func void Rtn_PreChamber_1302()
{
	// Warten auf den Kampf in der Vorbereitungskammer
	TA_ArenaSitAround(00, 00, 12, 00, ARENA_WP_LEFT_CHAMBER);
	TA_ArenaSitAround(12, 00, 00, 00, ARENA_WP_LEFT_CHAMBER);
};

func void Rtn_ArenaFight_1302()
{
	// Arenakampf gegen	den	Spieler
	TA_ArenaFight(00, 00, 12, 00, ARENA_WP_LEFT_START);
	TA_ArenaFight(12, 00, 00, 00, ARENA_WP_LEFT_START);
};

func void Rtn_ArenaNpc_1302()
{
	// Arenakampf gegen	einen NSC
	TA_ArenaNpc(00, 00, 12, 00, ARENA_WP_LEFT_START);
	TA_ArenaNpc(12, 00, 00, 00, ARENA_WP_LEFT_START);
};
