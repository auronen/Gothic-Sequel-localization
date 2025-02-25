/*************************************************************************
**	Wolf Demon Prototype												**
*************************************************************************/

prototype Mst_Default_WolfDemon(C_Npc)
{
	// -------- primary data --------
	name							= "Wolf-Dämon";
	guild							= GIL_WOLF;
	level							= 9;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 40;
	attribute[ATR_DEXTERITY]		= 40;
	attribute[ATR_HITPOINTS_MAX]	= 80;
	attribute[ATR_HITPOINTS]		= 80;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;

	// -------- protection --------
	protection[PROT_BLUNT]			= 20;
	protection[PROT_EDGE]			= 20;
	protection[PROT_POINT]			= 10;
	protection[PROT_FIRE]			= 10;
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
	aivar[AIV_MM_REAL_ID]			= ID_WOLF;
	aivar[AIV_MM_Behaviour]			= PACKHUNTER;
	aivar[AIV_MM_PercRange]			= 1500;
	aivar[AIV_MM_DrohRange]			= 1200;
	aivar[AIV_MM_AttackRange]		= 500;
	aivar[AIV_MM_DrohTime]			= 3;
	aivar[AIV_MM_FollowTime]		= 10;
	aivar[AIV_MM_FollowInWater]		= TRUE;
	aivar[AIV_MM_RoamStart]			= OnlyRoutine;

	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;		//30m

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------

	// -------- daily routine --------
	start_aistate = ZS_MM_AllScheduler;
};

//-----------------------------------------------------------
func void Set_WolfDemon_Visuals()
{
	Mdl_SetVisual(self, "Wolf_Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody(self,	"Wol_Body_Demon",		DEFAULT,DEFAULT,	"",					DEFAULT,	DEFAULT,	-1);
};

/*************************************************************************
**	Wolf-Dämon															**
*************************************************************************/

instance WolfDemon(Mst_Default_WolfDemon)
{
	// -------- primary data --------

	// -------- abilities --------

	// -------- protection --------

	// -------- visuals --------
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Set_WolfDemon_Visuals();

	// -------- ai --------
	Npc_SetToFistMode(self);

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------

	// -------- daily routine --------
};
