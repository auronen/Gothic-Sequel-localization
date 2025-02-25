/*************************************************************************
**	Orc SCOUT Prototype													**
*************************************************************************/

prototype Mst_Default_OrcScout(C_Npc)
{
	// -------- primary data --------
	name							= "Orc Jäger";
	npcType							= NpcType_Guard;
	guild							= GIL_ORCSCOUT;
	level							= 20;

	voice							= 17;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 40;
	attribute[ATR_DEXTERITY]		= 40;
	attribute[ATR_HITPOINTS_MAX]	= 200;
	attribute[ATR_HITPOINTS]		= 200;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;

	// -------- protection --------
	protection[PROT_BLUNT]			= 50;
	protection[PROT_EDGE]			= 50;
	protection[PROT_POINT]			= 25;
	protection[PROT_FIRE]			= 25;
	protection[PROT_FLY]			= 0;
	protection[PROT_MAGIC]			= 0;

	// -------- damage --------
	damageType						= DAM_EDGE;
	//damage[DAM_INDEX_BLUNT]		= 0;
	//damage[DAM_INDEX_EDGE]		= 0;
	//damage[DAM_INDEX_POINT]		= 0;
	//damage[DAM_INDEX_FIRE]		= 0;
	//damage[DAM_INDEX_FLY]			= 0;
	//damage[DAM_INDEX_MAGIC]		= 0;

	// -------- visuals --------
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor

	// -------- ai --------
	aivar[AIV_MM_Behaviour]			= HUNTER;
	aivar[AIV_MM_PercRange]			= 1200;
	aivar[AIV_MM_DrohRange]			= 1000;
	aivar[AIV_MM_AttackRange]		= 700;
	aivar[AIV_MM_DrohTime]			= 5;
	aivar[AIV_MM_FollowTime]		= 10;
	aivar[AIV_MM_FollowInWater]		= FALSE;

	//	fight_tactic					=	FAI_ORC;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2500;

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------

	// -------- daily routine --------
	start_aistate = ZS_GuardPatrol;
};

//-------------------------------------------------------------
func void Set_OrcScout_Visuals()
{
	Mdl_SetVisual(self, "Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody(self,	"Orc_BodyScout",		DEFAULT,DEFAULT,	"Orc_HeadWarrior",	DEFAULT,	DEFAULT,	-1);
};

/*************************************************************************
**	Orc Scout    														**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

instance OrcScout(Mst_Default_OrcScout)
{
	// -------- primary data --------

	// -------- abilities --------

	// -------- protection --------

	// -------- visuals --------
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Set_OrcScout_Visuals();

	// -------- ai --------

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------
	//CreateInvItems(self, ItAm_Bolt, 30);
	EquipItem(self, ItMw_OrcSword);
	//EquipItem(self, ItRw_LightCrossBow);

	// -------- daily routine --------
};

/*************************************************************************
**	Orc_City - Essender Ork   														**
*************************************************************************/
instance OrcPeasantEatAndDrink(Mst_Default_OrcScout)
{
	// -------- primary data --------
	name							= "Ork";
	guild							= GIL_ORCSCOUT;

	// -------- abilities --------

	// -------- protection --------

	// -------- visuals --------
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Set_OrcScout_Visuals();

	// -------- ai --------

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------
	CreateInvItem(self, ItMw_OrcSword);

	// -------- daily routine --------
	start_aistate = ZS_Orc_EatAndDrink;
};

/*************************************************************************
** 	Graveyard Orc Scout    														**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

instance OrcScoutGYD(Mst_Default_OrcScout)
{
	// -------- primary data --------
	name							= "Orc Späher";
	level							= 18;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 30;	// SN: reguläre OrcScouts wären an dieser Stelle noch zu heftig!

	// -------- protection --------

	// -------- visuals --------
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Set_OrcScout_Visuals();

	// -------- ai --------
	aivar[AIV_MM_PercRange]			= 1500;
	aivar[AIV_MM_DrohRange]			= 1200;
	aivar[AIV_MM_AttackRange]		= 1000;
	aivar[AIV_MM_DrohTime]			= 0;
	aivar[AIV_MM_FollowTime]		= 10;
	aivar[AIV_MM_RoamStart]			= OnlyRoutine;

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------
	EquipItem(self, ItMw_OrcSword);

	// -------- daily routine --------
	start_aistate = ZS_MM_AllScheduler;		// Monster-AI
};
