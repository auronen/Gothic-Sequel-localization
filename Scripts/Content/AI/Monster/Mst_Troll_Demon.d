/*************************************************************************
**	Troll Prototype														**
*************************************************************************/

prototype Mst_Default_TrollDemon(C_Npc)
{
	// -------- primary data --------
	name							= "Troll-Dämon";
	guild							= GIL_TROLL;
	level							= 200;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 160;
	attribute[ATR_DEXTERITY]		= 20;
	attribute[ATR_HITPOINTS_MAX]	= 1000;
	attribute[ATR_HITPOINTS]		= 1000;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;

	// -------- protection --------
	protection[PROT_BLUNT]			= 150;
	protection[PROT_EDGE]			= 150;
	protection[PROT_POINT]			= 9999;	//immun
	protection[PROT_FIRE]			= 110;
	protection[PROT_FLY]			= 9999;	//immun
	protection[PROT_MAGIC]			= 100;

	// -------- damage --------
	damageType						= DAM_FLY;
	//damage[DAM_INDEX_BLUNT]		= 0;
	//damage[DAM_INDEX_EDGE]		= 0;
	//damage[DAM_INDEX_POINT]		= 0;
	//damage[DAM_INDEX_FIRE]		= 0;
	//damage[DAM_INDEX_FLY]			= 0;
	//damage[DAM_INDEX_MAGIC]		= 0;

	// -------- visuals --------
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor

	// -------- ai --------
	aivar[AIV_MM_REAL_ID]			= ID_TROLL;
	aivar[AIV_MM_Behaviour]			= PASSIVE;
	aivar[AIV_MM_PercRange]			= 1500;
	aivar[AIV_MM_DrohRange]			= 1300;
	aivar[AIV_MM_AttackRange]		= 700;
	aivar[AIV_MM_DrohTime]			= 5;
	aivar[AIV_MM_FollowTime]		= 10;
	aivar[AIV_MM_FollowInWater]		= FALSE;
	aivar[AIV_MM_RestStart]			= OnlyRoutine;

	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------

	// -------- daily routine --------
	start_aistate = ZS_MM_AllScheduler;
};

//-------------------------------------------------------------

func void Set_TrollDemon_Visuals()
{
	Mdl_SetVisual(self, "Troll_Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody(self,	"Tro_Body_Demon",		DEFAULT,DEFAULT,	"",					DEFAULT,	DEFAULT,	-1);
};

/*************************************************************************
**	Troll-Dämon 														**
*************************************************************************/
instance TrollDemon(Mst_Default_TrollDemon)
{
	// -------- primary data --------

	// -------- abilities --------

	// -------- protection --------

	// -------- visuals --------
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Set_TrollDemon_Visuals();

	// -------- ai --------
	Npc_SetToFistMode(self);

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------

	// -------- daily routine --------
};
