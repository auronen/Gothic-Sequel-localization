/*************************************************************************
**	Scavenger-Dämon Prototype											**
*************************************************************************/

prototype Mst_Default_ScavengerDemon(C_Npc)
{
	// -------- primary data --------
	name							= "dämonischer Scavenger";
	guild							= GIL_SCAVENGER;
	level							= 15;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 30;
	attribute[ATR_DEXTERITY]		= 30;
	attribute[ATR_HITPOINTS_MAX]	= 140;
	attribute[ATR_HITPOINTS]		= 140;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;

	// -------- protection --------
	protection[PROT_BLUNT]			= 30;
	protection[PROT_EDGE]			= 30;
	protection[PROT_POINT]			= 10;
	protection[PROT_FIRE]			= 15;
	protection[PROT_FLY]			= 0;
	protection[PROT_MAGIC]			= 0;

	// -------- damage --------
	damageType						= DAM_EDGE;
	//damage[DAM_INDEX_BLUNT]		= 0;
	//damage[DAM_INDEX_EDGE]		= 30;	//STR wird genommen, wenn Summe aller dam = 0
	//damage[DAM_INDEX_POINT]		= 0;
	//damage[DAM_INDEX_FIRE]		= 0;
	//damage[DAM_INDEX_FLY]			= 0;
	//damage[DAM_INDEX_MAGIC]		= 0;

	// -------- visuals --------
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor

	// -------- ai --------
	aivar[AIV_MM_REAL_ID]			= ID_SCAVENGER;
	aivar[AIV_MM_Behaviour]			= PASSIVE;
	aivar[AIV_MM_PercRange]			= 1200;
	aivar[AIV_MM_DrohRange]			= 1000;
	aivar[AIV_MM_AttackRange]		= 700;
	aivar[AIV_MM_DrohTime]			= 5;
	aivar[AIV_MM_FollowTime]		= 10;
	aivar[AIV_MM_FollowInWater]		= TRUE;
	aivar[AIV_MM_SleepStart]		= 22;
	aivar[AIV_MM_SleepEnd]			= 6;
	aivar[AIV_MM_EatGroundStart]	= 6;
	aivar[AIV_MM_EatGroundEnd]		= 22;

	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;		//30m

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------

	// -------- daily routine --------
	start_aistate = ZS_MM_AllScheduler;
};

//---------------------------------------------------------
func void Set_ScavengerDemon_Visuals()
{
	Mdl_SetVisual(self, "Scavenger_Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody(self,	"Sca_Body_Demon",		DEFAULT,DEFAULT,	"",					DEFAULT,	DEFAULT,	-1);
};

/*************************************************************************
**	Scavenger-Demon														**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

instance ScavengerDemon(Mst_Default_ScavengerDemon)
{
	// -------- primary data --------

	// -------- abilities --------

	// -------- protection --------

	// -------- visuals --------
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Set_ScavengerDemon_Visuals();

	// -------- ai --------
	Npc_SetToFistMode(self);

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------
	CreateInvItems(self, ItAt_DemonSting, 1);

	// -------- daily routine --------
};
