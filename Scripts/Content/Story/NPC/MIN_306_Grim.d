instance MIN_306_Grim(C_Npc)
{
	// -------- primary data --------
	name							= "Grim";
	npcType							= NpcType_Main;
	guild							= GIL_MINER; // VORSICHT:	Muß	auch in	der	B_Arena_UnselectFight()	geändert werden!!!
	level							= 1;

	voice							= 10;
	id								= 306;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 20;
	attribute[ATR_DEXTERITY]		= 20;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 80;
	attribute[ATR_HITPOINTS]		= 80;

	// -------- protection --------
	protection[PROT_EDGE]			= 0;
	protection[PROT_BLUNT]			= 0;
	protection[PROT_POINT]			= 0;
	protection[PROT_FIRE]			= 0;
	protection[PROT_MAGIC]			= 0;

	// -------- visuals --------
	Mdl_SetModelFatness(self, 1);						// limb	fatness
	Mdl_SetVisual(self, "humans.mds");			// basic animation file
	Mdl_ApplyOverlayMDS(self, "Humans_Tired.mds");	// overlay animation file
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_naked0",		2,		1,			"Hum_Head_Bald",	61,			4,			SFB_ARMOR_L);

	B_Scale(self);							// body	width according	to strength	of character

	// -------- ai --------
	aivar[AIV_ARENA_VICTORIES]		= GRIM_VICTORIES_START;

	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_2H, 1);

	// -------- inventory --------
	EquipItem(self, ItMw_Grim_Pickaxe);
	//!!! SN: sonst, leeres	Inventory, da Arenakämpfer !!!

	// -------- daily routine --------
	daily_routine = Rtn_ArenaWait_306;
};

func void Rtn_ArenaWait_306()
{
	// steht vor dem Arenaeingang herum	und	wartet auf den nächsten	Kampf
	TA_ArenaSmallTalk(08, 00, 22, 00, "OCR_SMALLTALK_A_OC_ARENA");
	TA_ArenaSleep(22, 00, 08, 00, "OCR_HUT_32");
};

func void Rtn_PreChamber_306()
{
	// Warten auf den Kampf in der Vorbereitungskammer
	TA_ArenaSitAround(00, 00, 12, 00, ARENA_WP_RIGHT_CHAMBER);
	TA_ArenaSitAround(12, 00, 00, 00, ARENA_WP_RIGHT_CHAMBER);
};

func void Rtn_ArenaFight_306()
{
	// Arenakampf gegen	den	Spieler
	TA_ArenaFight(00, 00, 12, 00, ARENA_WP_RIGHT_START);
	TA_ArenaFight(12, 00, 00, 00, ARENA_WP_RIGHT_START);
};

func void Rtn_ArenaNpc_306()
{
	// Arenakampf gegen	einen NSC
	TA_ArenaNpc(00, 00, 12, 00, ARENA_WP_RIGHT_START);
	TA_ArenaNpc(12, 00, 00, 00, ARENA_WP_RIGHT_START);
};
