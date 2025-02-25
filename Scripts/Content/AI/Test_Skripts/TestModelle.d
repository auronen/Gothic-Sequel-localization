/*********************************************************************
**			Testprototyp											**
*********************************************************************/
// ****************
// Neuer NSC
// ****************

prototype Npc_TestDefault (C_NPC)
{
	//-------- primary data --------
	name =							"Prototype";
	guild =							GIL_NONE;
	level =							1;




	//-------- abilities --------
	attribute[ATR_STRENGTH] =		5;
	attribute[ATR_DEXTERITY] =		5;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;

	protection	[PROT_EDGE]		=		5;
	protection	[PROT_BLUNT]	=		5;
	protection	[PROT_POINT]	=		5;
	protection	[PROT_FIRE]		=		5;
	protection	[PROT_MAGIC]	=		5;

	attribute[ATR_HITPOINTS_MAX] 	=	5;
	attribute[ATR_HITPOINTS] 		=	5;

	// talents	=						0;

	//-------- senses --------
	senses			=	SENSE_HEAR | SENSE_SEE ;
	senses_range	=	4000;

	////Npc_LearnTalent	(self,TAL_SNEAK);
	////Npc_LearnTalent	(self,TAL_STEAL);
	////Npc_LearnTalent	(self,TAL_PICKLOCK);
	////Npc_LearnTalent	(self,TAL_ACROBAT);

	////Npc_LearnTalent	(self,TAL_HEAL);
	////Npc_LearnTalent	(self,TAL_MANA);
	////Npc_LearnTalent	(self,TAL_IRONWILL);

};



instance ATestmodell (Npc_Default)
{
	//-------- primary data --------

	name =							"ATestmodell";
	slot =							" der Kühne";
	guild =							GIL_NONE;
	level =							10;
	voice =							11;//4
	id =							3001;



	//-------- abilities --------
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", DEFAULT,  DEFAULT,-1);



	//Npc_LearnFightTalent	(self,TAL_1H_SWORD2);


	Npc_SetAttitude (self,ATT_FRIENDLY);

	//-------- inventory --------

	CreateInvItem (self, ItMi_Scoop);
	//CreateInvItem (self, ItMwPoker01);
	EquipItem	(self, Helmet);

	// FAI

	fight_tactic = FAI_HUMAN_COWARD;

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3001;
	//start_aistate	=	ZS_Firespit;


};

FUNC VOID Rtn_start_3001 ()
{
	TA_MakeRune	( 0,0,12,0, "PT_RUNEMELTER");
	TA_MakeRune	( 12,0,0,0, "PT_RUNEMELTER");
};


instance BTestmodell (Npc_TestDefault)
{
	//-------- primary data --------

	name =							"BTestmodell";
   	guild =							GIL_WORKER;
	level =							20;

	voice =							12;//7;
	id =							3002;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	30;
	attribute[ATR_HITPOINTS] =		30;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", DEFAULT,  DEFAULT, EBR_ARMOR_H);




	//Npc_LearnTalent	(self,TAL_1H_SWORD3);
	//Npc_LearnTalent	(self,TAL_1H_AXE2);
	//Npc_LearnTalent	(self,TAL_2H_SWORD2);
	//Npc_LearnTalent	(self,TAL_2H_AXE);
	//Npc_LearnTalent	(self,TAL_BOW2);
	//Npc_LearnTalent	(self,TAL_CROSSBOW2);
	//Npc_LearnTalent	(self,TAL_HEAL);

	//-------- inventory --------

	//createinvitem (self, ItMw1hAxe01);
	//createinvitem (self, ItMwPoker01);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3002;

	fight_tactic = FAI_HUMAN_COWARD;
};

FUNC VOID Rtn_start_3002 ()
{
	TA_StandAround	( 0,0,12,0, "PT_ANVIL");
	TA_StandAround	( 12,0,0,0, "PT_ANVIL");
};

instance CTestmodell (Npc_TestDefault)
{
	//-------- primary data --------

	name =							"CTestmodell";
   	guild =							GIL_HEALER;
	level =							6;
	voice =							11;//7;
	id =							3003;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	30;
	attribute[ATR_HITPOINTS] =		30;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", DEFAULT,  DEFAULT, EBR_ARMOR_H);


	self.aivar[AIV_HAENDLER]	=	AIV_H_HEAL;

	//Npc_LearnFightTalent	(self,TAL_1H_SWORD3);
	//Npc_LearnFightTalent	(self,TAL_1H_AXE2);
	//Npc_LearnFightTalent	(self,TAL_2H_SWORD2);
	//Npc_LearnFightTalent	(self,TAL_2H_AXE);
	////Npc_LearnTalent	(self,TAL_BOW2);
	////Npc_LearnTalent	(self,TAL_CROSSBOW2);
	////Npc_LearnTalent	(self,TAL_HEAL);

	//-------- inventory --------

	CreateInvItem (self, ItMw_club);
	CreateInvItem (self, ItMw_IronClub);
	CreateInvItem (self, ItMw_club);
	CreateInvItem (self, DMC_ARMOR);
	CreateInvItem (self, ItFo_Potion_Health_01);
	CreateInvItem (self, ItFo_Potion_Health_01);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3003;

	fight_tactic	= FAI_HUMAN_COWARD;
};


FUNC VOID Rtn_start_3003 ()
{
	TA_StandAround	( 0,0,12,0, "TEST1");
	TA_StandAround	( 12,0,0,0, "TEST3");
};

instance DTestmodell (Npc_TestDefault)
{
	//-------- primary data --------
	name =							"DTestmodell";
	slot =							"Guru";
	guild =							GIL_NONE;
	level =							6;
	voice =							11;//120;
	id =							3004;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_DEXTERITY] =		0;
	attribute[ATR_MANA_MAX] =		10;
	attribute[ATR_MANA] =			10;
	attribute[ATR_HITPOINTS_MAX] =	30;
	attribute[ATR_HITPOINTS] =		30;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody	(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", DEFAULT, DEFAULT, GUR_ARMOR_H);



	//Waffentalente //Weitere Talente



	//createinvitem(self,ItFo_Rice);
	//createinvitem(self,ItFo_Beer);
	//createinvitem(self,ItMw1hSword01);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3004;

	fight_tactic	=FAI_HUMAN_COWARD;
};

FUNC VOID Rtn_start_3004 ()
{
	/*
	TA_Smoke 			(0,00,1,00,		"WP_CAVE_12");
	TA_PickOre 			(1,00,2,00, 	"WP_ORE");
	TA_SitAround 		(2,00,3,00,		"WP_CHAIR");
	TA_CookForMe 		(3,00,4,00,		"WP_PAN");
	TA_Ebr_HangAround 	(4,00,5,00,		"WP_THRONE");
	TA_Cook 			(5,00,6,00,		"WP_CAULDRON");
	TA_HerbAlchemy 		(6,00,7,00,		"WP_HERB");
	TA_Smith_Sharp 		(7,00,8,00,		"WP_BSSHARP");
	TA_Sleep 			(8,00,9,00,		"WP_BEDLOW");
	TA_Smith_Fire 		(9,00,10,00,	"WP_BSFIRE");
	TA_Smith_Anvil 		(10,00,11,00,	"WP_BSANVIL");
	TA_Smith_Cool 		(11,00,12,00,	"WP_BSCOOL");
	*/
	TA_RoastScavenger	(12,00,13,00,	"OCR_OUTSIDE_ARENA_01");
	TA_RoastScavenger	(13,00,12,00,	"OCR_OUTSIDE_ARENA_01");
	/*
	TA_ReadBook 		(13,00,14,00,	"WP_BOOK");
	TA_Sleep 			(14,00,15,00,	"WP_BED");
	TA_PotionAlchemy	(15,00,16,00,	"WP_LAB");
	TA_Pray 			(16,00,17,00,	"WP_IDOL");
	TA_HerbAlchemy 		(17,00,18,00,	"WP_HERB");
	TA_RepairHut 		(18,00,19,00,	"WP_REPAIR");
	TA_StandAround 	(19,00,0,00,	"WP_BSANVIL");
	//TA_SitAround (0,0,"WP_RUNNER_1");
	*/
};

instance FTestmodell (Npc_TestDefault)
{
	//-------- primary data --------
	name =							"FTestmodell";
	slot =							"Gardist";
	guild =							GIL_NONE;
	level =							5;
	voice =							11;//11;
	id =							3006;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		0;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	15;
	attribute[ATR_HITPOINTS] =		15;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	// 				body mesh,			head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", DEFAULT,  DEFAULT, GRD_ARMOR_M);



	//Waffentalente //Weitere Talente

	//Npc_LearnFightTalent	(self,TAL_1H_SWORD2);
	//Npc_LearnFightTalent	(self,TAL_1H_AXE3);
	//Npc_LearnFightTalent	(self,TAL_2H_SWORD2);
	//Npc_LearnTalent	(self,TAL_STEAL);
	//Npc_LearnTalent	(self,TAL_PICKLOCK);



	//-------- inventory --------

	//createinvitem (self, ItMw2hSword01);
	//createinvitem (self, ItMw1hAxe01);
	////createinvitem (self, ItMwPoker01);




	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3006;

	fight_tactic	=1;
};

FUNC VOID Rtn_start_3006 ()
{
	TA_GuardFP (0,0,23,59,"WP_STEALWITNESS_2");
};

instance GTestmodell (Npc_TestDefault)
{
	//-------- primary data --------

	name =							"GTestmodell";
	guild =							GIL_NONE;
	level =							6;
	voice =							11;//1;
	id =							3007;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		7;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		15;
	attribute[ATR_MANA] =			15;
	attribute[ATR_HITPOINTS_MAX] =	20;
	attribute[ATR_HITPOINTS] =		20;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", DEFAULT,  DEFAULT, KDF_ARMOR_L);



	////Npc_LearnTalent	(self,TAL_BOW);

	//-------- inventory --------

	//createinvitem (self, ItFo_Wine);
	//createinvitem (self, ItFo_Loaf);
	//createinvitems(self, ItFoHealingPotion, 5);
	//createinvitems(self, ItFoManaPotion, 5);
	//createinvitems(self, ItFoHolyWater, 2);

	//createinvitem (self, ItMw2hSword01);
	//createinvitem (self, ItMw1hAxe01);
	////createinvitem (self, ItMwPoker01);



	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3007;

	fight_tactic	=1;
};

FUNC VOID Rtn_start_3007 ()
{
	TA_SitAround (0,0,23,59,"WP_STEALWITNESS_1");
};





instance HTestmodell (Npc_TestDefault)
{
	//-------- primary data --------

	name =							"HTestmodell";
	guild =							GIL_NONE;
	level =							6;
	voice =							11;//10;
	id =							3008;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		5;
	attribute[ATR_DEXTERITY] =		6;
	attribute[ATR_MANA_MAX] =		15;
	attribute[ATR_MANA] =			15;
	attribute[ATR_HITPOINTS_MAX] =	20;
	attribute[ATR_HITPOINTS] =		20;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", DEFAULT,  DEFAULT, KDF_ARMOR_L);


	//-------- inventory --------
	//createinvitem (self, ItFo_Wine);

	//createinvitem (self, ItFo_Cheese);
	//createinvitems(self, ItFoHealingPotion, 5);
	//createinvitems(self, ItFoManaPotion, 5);
	//createinvitems(self, ItFoHolyWater, 3);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3008;
	fight_tactic	=1;
	// MISSION[0] = Mis_BringItArRunesword;
};

FUNC VOID Rtn_start_3008 ()
{
	TA_SitAround		(0,0,23,59,"WP_STEAL_1");
};

instance ITestmodell (Npc_TestDefault)
{
	//-------- primary data --------

	name =					"ITestmodell";
	guild =					GIL_NONE;
	level =					3;
	voice =					11;//18;// Babe 1;
	id =					3009;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		7;
	attribute[ATR_DEXTERITY] =		11;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =		13;
	attribute[ATR_HITPOINTS] =		13;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"BABE.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"Bab_body_Naked0",DEFAULT, DEFAULT ,"Bab_Head_Amazone", DEFAULT ,  DEFAULT, -1);





	//-------- inventory --------


		//createinvitems(self, ItFo_Wine, 4);
		//createinvitem (self, ItMi_Brush);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3009;
};

FUNC VOID Rtn_start_3009 ()
{
	TA_Babe_Sweep	(0,00,20,00,"OCC_BARONS_GREATHALL_CENTER_LEFT");		//Luftzufächeln?
	TA_Babe_Sweep	(20,00,9,00,"OCC_BARONS_GREATHALL_CENTER_LEFT");		//Luftzufächeln?
	/*
	TA_Sleep		(23,00,04,00,"WP_CHAIRSNBEDS"); 	//Bei Gomez
	TA_SitAround	(04,00,06,00,"WP_REPAIR");//###Was macht sie da? Da steht Scar
	TA_StandAround	(06,00,08,00,"WP_IDOL");
	TA_WashSelf		(08,00,09,00,"WP_REPAIR");	//Bei Gomez
	TA_Babe_Sweep	(09,00,20,00,"WP_LAB");		//Luftzufächeln?
	TA_SitAround	(20,00,23,00,"WP_IDOL");		//Später Tanz
	*/
};

instance JTestmodell (Npc_TestDefault)
{
	//-------- primary data --------

	name =							"JTestmodell";
	guild =							GIL_NONE;
	level =							2;
	voice =							11;//19 Babe 2;
	id =							3010;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		6;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	10;
	attribute[ATR_HITPOINTS] =		10;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"Babe.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"Bab_body_Naked0",DEFAULT, DEFAULT ,"Bab_Head_Hair2", DEFAULT ,  DEFAULT,-1);



	//Npc_LearnTalent	(self,TAL_PICKLOCK);


	//-------- inventory --------


	//createinvitem (self, ItFo_Beer);

	//createinvitem (self, ItFo_Apple);
	//createinvitem (self, ItFo_Loaf);
	//createinvitem (self, ItFo_Mutton);
	//createinvitem (self, ItFo_Cheese);
	//createinvitem (self, ItFo_Wine);
	//createinvitem (self, ItMi_Lute);
	//createinvitem (self, ItMi_Brush);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3010;
};

FUNC VOID Rtn_start_3010 ()
{
	TA_Babe_Sweep	(00,00,23,59,"WP_HALLYWAY_2");		//Roscoe
};

func void B_SayTest ()
{
	//B_Say (other, self, "$SC_HEYTURNAROUND");
	if (Wld_IsFPAvailInRange (self,"SMALLTALK", 100))
	{
		Print	("FP in einem Meter Entfernung");
	};
	if (Wld_IsFPAvailInRange (self,"SMALLTALK",200))
	{
		Print	("FP in zwei Metern Entfernung");
	};
	if (Wld_IsFPAvailInRange (self,"SMALLTALK",300))
	{
		Print	("FP in drei Metern Entfernung");
	};
	if (Wld_IsFPAvailInRange (self,"SMALLTALK",400))
	{
		Print	("FP in vier Metern Entfernung");
	};
	if (Wld_IsFPAvailInRange (self,"SMALLTALK",500))
	{
		Print	("FP in fünf Metern Entfernung");
	};
};
func void ZS_TestMe()
{
	Npc_PercEnable	(self, PERC_ASSESSTALK, B_SAYTEST);
	
};

func void ZS_TEstMe_loop ()
{
};

func void ZS_TestMe_end ()
{
};

instance SLD1_Testmodell (Npc_TestDefault)
{
	//-------- primary data --------

	name =							"SLD1_Testmodell";
	guild =							GIL_NONE;
	level =							4;
	voice =							4;//8;
	id =							1707;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		9;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_HITPOINTS_MAX] =		18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fighter", 51,  DEFAULT,VLK_ARMOR_L);


	Mdl_SetModelFatness (self, 0);

	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------

	//Npc_LearnFightTalent (self, TAL_1H_AXE2);
	//Npc_LearnFightTalent (self, TAL_2H_AXE);
	//Npc_LearnFightTalent (self, TAL_2H_SWORD);

	//Npc_LearnTalent		( self, TAL_SNEAK);

	//-------- inventory --------

	////createinvitem (self, ItMw2hAxe02);
	//createinvitem (self, ItFo_Booze);
	//createinvitem (self, ItFo_Apple);
	//createinvitem (self, ItFoHealingPotion);
	//createinvitems (self, ItMiNugget, 10);
	//createinvitem (self, ItRwLongbow);


	//Npc_SetAttitude	( self, ATT_ANGRY  );

	//-------------Daily Routine-------------



	Wld_AssignRoomToNpc	( "T2", self);

	Wld_AssignRoomToGuild	( "T4", GIL_NONE);
	//-------------Missions------------------

	//----------------------------------------------------------------
	//------------------------------------------------------------- AI
	//----------------------------------------------------------------

	//--------------------------------------- HABBITS
//	Npc_SetPermAttitude	( self, ATT_FRIENDLY );

	START_AISTATE 	= 	ZS_TestMe;
//	START_AISTATE 	= 	ZS_TestObstacle;
//	DAILY_ROUTINE 	=	Rtn_start_SLD1_Testmodell;

	//-------------------------------------- MISSIONS
//	MISSION[0]	=	Mission_Test_Empty;
//	MISSION[1]	=	Mission_Test_Default;
};


func void Rtn_start_SLD1_Testmodell ()
{
	TA_TestHangAround (0,00,13,00, "x");
	TA_TestHangAround (13,00,00,00, "x");

	/*TA_TestGotoWP (0,00,13,00, "WP_RUNNER_8");
	TA_TestGotoWP (13,00,13,05, "WP_RUNNER_9");
	TA_TestGotoWP (13,05,13,10, "WP_RUNNER_8");
	TA_TestGotoWP (13,10,13,15, "WP_RUNNER_9");
	TA_TestGotoWP (13,15,13,20, "WP_RUNNER_8");
	TA_TestGotoWP (13,20,13,25, "WP_RUNNER_9");
	TA_TestGotoWP (13,25,13,30, "WP_RUNNER_8");
	TA_TestGotoWP (13,30,0,00, "WP_RUNNER_8");*/
};

instance SLD2_Testmodell (NPC_TestDefault)
{

//----------------------------------------------------------------
	//------------------------------------------------- IDENTIFIACTION
	//----------------------------------------------------------------
	name =							"SLD2_Testmodell";
	guild =							GIL_NONE;
	level =							3;
	voice =							4;//8;
	id =							2707;
	//----------------------------------------------------------------
	//----------------------------------------------------- ATTRIBUTES
	//----------------------------------------------------------------

	//------------------------------------- MAXIMA
		attribute[ATR_STRENGTH] =		9;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_HITPOINTS_MAX] =		18;
	attribute[ATR_HITPOINTS] =		18;
	attribute[ATR_MANA_MAX] =		10;
	attribute[ATR_MANA] =			10;



	//----------------------------------------------------------------
	//----------------------------------------------------- APPEARANCE
	//----------------------------------------------------------------

	Mdl_SetVisual		(self,"HUMANS.MDS");

	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fighter", 51,  DEFAULT,SLD_ARMOR_H);

	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	Mdl_SetModelFatness (self, 0);

	//----------------------------------------------------------------
	//------------------------------------------------------ ABITILIES
	//----------------------------------------------------------------


	//Npc_LearnFightTalent (self, TAL_1H_AXE2);
	//Npc_LearnFightTalent (self, TAL_2H_AXE);
	//Npc_LearnFightTalent (self, TAL_2H_SWORD);
	//Npc_LearnFightTalent 	( self, TAL_BOW3 		);
	//Npc_LearnFightTalent 	( self, TAL_CROSSBOW3 	);


//  FLAGS			= 	NPC_FLAG_IMMORTAL;
  	FIGHT_TACTIC	=	FAI_HUMAN_Strong;

//----------------------------------------------------------------
	//------------------------------------------------------ INVENTORY
	//----------------------------------------------------------------

	//createinvitem (self, ItFo_Rice);
//	//createinvitem (self, ItMw2hAxe02);
	//createinvitem (self, ItRwLongbow);
	//createinvitem (self, ItFo_Beer);
	//createinvitem (self, ItFo_Apple);
	//createinvitem (self, ItFoHealingPotion);
	//createinvitems (self, ItMiNugget, 10);
	//createinvitems		( self, ItAm_Arrow, 50 );
	//EquipItem	( self,ItRwLongbow);

	//----------------------------------------------------------------
	//------------------------------------------------------------- AI
	//----------------------------------------------------------------

	//--------------------------------------- HABBITS

	START_AISTATE 	= 	ZS_TestHangAround;
//	DAILY_ROUTINE 	=	DailyRoute_Test_Empty;

	//-------------------------------------- MISSIONS
//	MISSION[0]	=	Mission_Test_Empty;
//	MISSION[1]	=	Mission_Test_Default;
};


func void Rtn_start_SLD2_Testmodell ()
{
	TA_TestHangAround (0,00,13,00, "X");
	TA_TestHangAround (13,00,00,00, "X");
};

instance SLD3_Testmodell (Npc_TestDefault)
{
	//-------- primary data --------

	name =							"SLD3_Testmodell";
	guild =							GIL_NONE;
	level =							3;
	voice =							4;//8;
	id =							3707;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		9;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_HITPOINTS_MAX] =		18;
	attribute[ATR_HITPOINTS] =		10;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fighter", 51,  DEFAULT,SLD_ARMOR_H);


	Mdl_SetModelFatness (self, 0);

	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------

	//Npc_LearnFightTalent (self, TAL_1H_AXE2);
	//Npc_LearnFightTalent (self, TAL_2H_AXE);
	//Npc_LearnFightTalent (self, TAL_2H_SWORD);

	//-------- inventory --------

	//createinvitem (self, ItMw2hAxe02);
	//createinvitem (self, ItFo_Rice);
	//createinvitem (self, ItFo_Booze);
	//createinvitem (self, ItFo_Apple);
	//createinvitem (self, ItFoHealingPotion);
	//createinvitems (self, ItMiNugget, 10);

	//B_SetAttitude	( self, ATT_HOSTILE);

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_SLD3_Testmodell;

	//-------------Missions------------------
};


func void Rtn_start_SLD3_Testmodell ()
{
	TA_TestHangAround (0,00,13,00, "X");
	TA_TestHangAround (13,00,00,00, "X");

};

instance GRD1_Testmodell (Npc_TestDefault)
{
	//-------- primary data --------
	name =							"GRD1_Testmodell";
	guild =							GIL_NONE;
	level =							3;
	voice =							11;//15;
	id =							1221;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		9;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =		18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"HumanS_Relaxed.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, GRD_ARMOR_L);


    	Mdl_SetModelFatness(self,0);

    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------

	//Npc_LearnFightTalent (self, TAL_1H_SWORD2);
	//Npc_LearnFightTalent (self, TAL_1H_AXE2);

	//-------- inventory --------

	//createinvitem	(self, ItMw1hSword01);
	//createinvitem	(self, ItFo_Apple);
	//createinvitems	(self, ItMiNugget, 4);
	//createinvitem	(self, ItFoHealingPotion);

	Npc_SetAttitude (self,ATT_FRIENDLY);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_GRD1_Testmodell;

};

INSTANCE TestInfo_001_07_700 (C_INFO)
{
	npc		= GRD1_Testmodell;
	nr		= 1;
	condition	= TestInfo_001_07_700_Condition;
	information	= TestInfo_001_07_700_Info;
	important	= 0;
};

FUNC INT Testinfo_001_07_700_Condition()
{
	return 1;//NPC_GetTrueGuild(other)==Gil_None;
};

FUNC VOID TestInfo_001_07_700_Info()
{
	B_SetAttitude	(self, ATT_FRIENDLY);
	
	AI_Output(self,other,"Global_001_07_00"); //Hey Frischling.
	AI_Output(self,other,"Global_001_07_01"); //Falls Du es noch nicht kapiert hast:
	AI_Output(self,other,"Global_001_07_02"); //Es gibt hier im Knast drei große Lager.
	AI_Output(self,other,"Global_001_07_03"); //Das Alte Lager, das Neue Lager und den Sektentempel.
	AI_Output(self,other,"Global_001_07_05"); //Wenn Du nicht den Erzbaronen im Alten Lager den Arsch abwischen willst, kommst Du zu uns.
};


func void Rtn_start_GRD1_Testmodell ()
{
	TA_StandAround (0,00,13,00, "X");
	TA_StandAround (13,00,00,00, "X");
};

instance GRD2_Testmodell (Npc_TestDefault)
{
	//-------- primary data --------
	name =							"GRD2_Testmodell";
	guild =							GIL_NONE;//GIL_NONE;
	level =							3;
	voice =							11;//15;
	id =							2221;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		9;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =		18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"HumanS_Relaxed.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, VLK_ARMOR_L);

    Mdl_SetModelFatness(self,0);

    fight_tactic	=	FAI_HUMAN_Strong;

    Npc_SetAttitude	( self, ATT_ANGRY);

	//-------- Talente --------

	////Npc_LearnFightTalent (self, TAL_1H_SWORD2);
	////Npc_LearnFightTalent (self, TAL_1H_AXE2);

	//-------- inventory --------

	//createinvitem	(self, ItMw1hSword01);
	//createinvitem	(self, ItFo_Apple);
	//createinvitems	(self, ItMiNugget, 4);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_GRD2_Testmodell;
};

func void Rtn_start_GRD2_Testmodell ()
{
	TA_TestHangAround (0,00,13,00, "X");
	TA_TestHangAround (13,00,00,00, "X");

};

instance GRD3_Testmodell (Npc_TestDefault)
{
	//-------- primary data --------
	name =							"GRD3_Testmodell";
	guild =							GIL_NONE;
	level =							3;
	voice =							11;//15;
	id =							3221;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		9;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =		18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"HumanS_Relaxed.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, EBR_ARMOR_H);


    	Mdl_SetModelFatness(self,0);

    	fight_tactic	=	FAI_HUMAN_Strong;

	//-------- Talente --------

	//Npc_LearnFightTalent (self, TAL_1H_SWORD2);
	//Npc_LearnFightTalent (self, TAL_1H_AXE2);

	//-------- inventory --------

	//createinvitem	(self, ItMw1hSword01);
	//createinvitem	(self, ItFo_Apple);
	//createinvitems	(self, ItMiNugget, 4);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_GRD3_Testmodell;
};

func void Rtn_start_GRD3_Testmodell ()
{
	TA_TestHangAround (0,00,13,00, "X");
	TA_TestHangAround (13,00,00,00, "X");

};


                                                                                                                                                                                                                                