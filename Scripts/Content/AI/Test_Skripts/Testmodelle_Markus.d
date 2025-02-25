/**********************************************************
* Overlay Testmodell
**********************************************************/
instance PC_Mini (C_NPC)
{
	//-------- primary data --------

	name =							"Mini";
	guild =							GIL_NONE;
	level =							10;
	voice =							11;//4
	id =							3001;



	//-------- abilities --------
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		10;
	attribute[ATR_MANA] =			10;
	attribute[ATR_HITPOINTS_MAX] =	18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						body mesh     ,		bdytex,	skin,	head mesh     ,		headtex,	teethtex,	ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",	3,		1,		"Hum_Head_Pony", 	77,  		DEFAULT,	-1);

	//-------- inventory --------
	//Npc_LearnTalent		( self, TAL_SNEAK);

	// FAI

	fight_tactic = FAI_HUMAN_COWARD;

	//-------------Daily Routine-------------
//	daily_routine = Rtn_start_3001;
};

instance OverlayTestmodell (C_NPC)
{
	//-------- primary data --------

	name =							"ATestmodell";
	guild =							GIL_NONE;
	level =							10;
	voice =							11;//4
	id =							3001;



	//-------- abilities --------
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =		18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin
	Mdl_SetVisualBody (self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", DEFAULT,  DEFAULT,-1);

	Mdl_ApplyOverlayMds (self,"Humans_1hST1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_1hST2.mds");

	Mdl_ApplyOverlayMds (self,"Humans_2hST1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_2hST2.mds");

	Mdl_ApplyOverlayMds (self,"Humans_BowT1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_BowT2.mds");

	Mdl_ApplyOverlayMds (self,"Humans_CBowT1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_CBowT2.mds");

	Mdl_ApplyOverlayMds (self,"Humans_Acrobatic.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Arrogance.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Tired.mds");

	Mdl_ApplyOverlayMds (self,"Humans_drunken.mds");

	Mdl_ApplyOverlayMds (self,"Humans_Swim.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Sprint.mds");




	//-------- inventory --------


	// FAI

	fight_tactic = FAI_HUMAN_COWARD;

	//-------------Daily Routine-------------
//	daily_routine = Rtn_start_3001;
};

/**********************************************************
* Bade Babe
**********************************************************/
instance Bathbabe (C_NPC)
{
	//-------- primary data -----n
	name =					"Badenixe";
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
	//						body mesh     ,		bdytex,	skin,	head mesh     ,		headtex,	teethtex,	ruestung
	Mdl_SetVisualBody (self,"Bab_body_Naked0",	DEFAULT, 	1 ,	"Bab_Head_Hair1", 	3 ,  		DEFAULT, 	-1);

	//-------- inventory --------
	//CreateInvItems(self, ItFo_Wine, 4);
	//CreateInvItem (self, ItMi_Brush);

	//-------------Daily Routine-------------
	start_aistate	=	ZS_Bathing_Babe;

};

instance MK_CaptainItem (C_NPC)
{
	//-------- primary data --------
	name =							"Captain Item";
	guild =							GIL_NONE;
	level =							30;
	voice =							11;//4
	id =							3001;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		60;
	attribute[ATR_MANA] =			60;
	attribute[ATR_HITPOINTS_MAX] =	200;
	attribute[ATR_HITPOINTS] =		200;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						body mesh     ,		bdytex,	skin,	head mesh     ,		headtex,	teethtex,	ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",	3,		1,		"Hum_Head_Pony", 	77,  		DEFAULT,	-1);

	//Npc_LearnTalent		( self, TAL_SNEAK);

	//-------- inventory --------

	// Smith_Resources.d
	CreateInvItem ( self, ItMi_RawLongIron);
	CreateInvItem ( self, ItMi_BloodRawLongIron);
	CreateInvItem ( self, ItMi_DarkRawLongIron);

	CreateInvItem ( self, ItMi_HotIron);
	CreateInvItem ( self, ItMi_HotLongIron);
	CreateInvItem ( self, ItMi_BloodHotLongIron);
	CreateInvItem ( self, ItMi_DarkHotLongIron);

	CreateInvItem ( self, ItMi_HotSwordBlade);
	CreateInvItem ( self, ItMi_Hot2HSwordBlade);
	CreateInvItem ( self, ItMi_DarkHot2HSwordBlade);
	CreateInvItem ( self, ItMi_BloodHot2HSwordBlade);

	CreateInvItem ( self, ItMi_SwordBlade);
	CreateInvItem ( self, ItMi_2HSwordBlade);
	CreateInvItem ( self, ItMi_Dark2HSwordBlade);
	CreateInvItem ( self, ItMi_Blood2HSwordBlade);
};

instance MK_Mobber (C_NPC)
{
	//-------- primary data --------

	name =							"Mobber";
	guild =							GIL_NONE;
	level =							10;
	voice =							11;//4
	id =							3001;



	//-------- abilities --------
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		10;
	attribute[ATR_MANA] =			10;
	attribute[ATR_HITPOINTS_MAX] =	18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						body mesh     ,		bdytex,	skin,	head mesh     ,		headtex,	teethtex,	ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",	3,		1,		"Hum_Head_Pony", 	77,  		DEFAULT,	-1);

	//-------- inventory --------
	EquipItem			(self, Gewandtheitsamulett);

	// FAI

	fight_tactic = FAI_HUMAN_COWARD;

	//-------------Daily Routine-------------
	daily_routine = MK_MOBBER_01;
};

func void MK_MOBBER_01 ()
{
	TA_StandAround			(00,00 ,07,00,	"PT_1");

	TA_Cook					( 7,00 , 8,00,	"PT_CAULDRON");
	TA_Smith_Fire			( 8,00 , 8,30,	"PT_FIRE");
	TA_Smith_Anvil			( 8,30 , 9,00,	"PT_ANVIL");
	TA_Smith_Cool			( 9,00 , 9,30,	"PT_COOL");
	TA_Smith_Sharp			( 9,30 ,10,00,	"PT_SHARP");
	TA_ArmorMaker			(10,00 ,11,00,	"PT_ARMORSTAND");
	TA_SawWood				(11,00 ,12,00,	"PT_SAWWOOD");

	TA_Smoke				(12,00 ,12,30,	"PT_2");

	TA_StandAround			(12,30 ,00,00,	"PT_1");
};

///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance	Info_MKMOBBER_1 (C_INFO)
{
	npc				= MK_MOBBER;
	condition		= Info_MKMOBBER_1_Condition;
	information		= Info_MKMOBBER_1_Info;
	important		= FALSE;
	permanent		= TRUE;
	description		= "MK_MOBBER Test";
};

	func int	Info_MKMOBBER_1_Condition()
	{
		return TRUE;
	};

	func void	Info_MKMOBBER_1_Info()
	{
		Info_ClearChoices(	Info_MKMOBBER_1);

		Info_AddChoice( 	Info_MKMOBBER_1, "Ende",					Info_MKMOBBER_1_Ende);
		Info_AddChoice(		Info_MKMOBBER_1, "Hau dich hin!",			Info_MKMOBBER_1_Sleep);
		Info_AddChoice(		Info_MKMOBBER_1, "Gib mir all dein Gold",	Info_MKMOBBER_1_WldInsert);
		Info_AddChoice(		Info_MKMOBBER_1, "AI-PrintScreen",			Info_MKMOBBER_1_Print);
		Info_AddChoice(		Info_MKMOBBER_1, "Benutz Amulett",			Info_MKMOBBER_1_Equip);
		Info_AddChoice( 	Info_MKMOBBER_1, "Geh einen rauchen",		info_MKMOBBER_1_Smoke);
		Info_AddChoice( 	Info_MKMOBBER_1, "Benutze Labor",			Info_MKMOBBER_1_TAOverlay);
	};

func void	Info_MKMOBBER_1_Ende()
{
	AI_StopProcessInfos(self);
};

func void 	Info_MKMOBBER_1_TAOverlay()
{
	AI_StopProcessInfos(self);

	TA_BeginOverlay		(self);
//	TA_StandAround		(00,00,00,01,"PT_2");
	TA_PotionAlchemy	(00,00,00,10,"PT_LAB");
	TA_EndOverlay		(self);
};

func void	Info_MKMOBBER_1_Smoke()
{
	AI_StopProcessInfos(self);

	TA_BeginOverlay		(self);
	TA_Smoke			(00,00,00,05,"PT_CAULDRON");
	TA_EndOverlay		(self);
};

func void	Info_MKMOBBER_1_Equip()
{
	AI_StopProcessInfos(self);

	AI_DropItem (self, Gewandtheitsamulett);
};

func void	Info_MKMOBBER_1_Print()
{
	AI_StopProcessInfos(self);

	AI_PlayAni		(self, "R_LEGSHAKE");
	_ = AI_PrintScreen	(self, "Ich hab nen Krampf!",		-1,	_YPOS_MESSAGE_REFUSEACTION,	FONT_OLD_SMALL,	_TIME_MESSAGE_REFUSEACTION, TEXT_COLOR_GREEN);
	AI_PlayAni 		(self, "R_SCRATCHHEAD");

	_ = AI_PrintScreen	(self, "Das hat gejuckt!",			-1,	_YPOS_MESSAGE_REFUSEACTION+1,	FONT_OLD_SMALL,	_TIME_MESSAGE_REFUSEACTION, TEXT_COLOR_RED);
	AI_PlayAni		(self, "R_SCRATCHRSHOULDER");
	AI_Snd_Play 	(self, "LogEntry");
	AI_Dodge		(self);
	AI_Dodge		(self);
	AI_Dodge		(self);

	_ = AI_PrintScreen	(self, "Hier gibts zuviel Läuse!",	-1,	_YPOS_MESSAGE_REFUSEACTION+2,	FONT_OLD_SMALL,	_TIME_MESSAGE_REFUSEACTION, TEXT_COLOR_BLUE);
	AI_Snd_Play3D 	(self, self, "LogEntry");
};

func void Info_MKMOBBER_1_WldInsert()
{
	AI_StopProcessInfos(self);

	Wld_InsertItems	(ItMi_Silver, 10, "PT_1");
	Wld_InsertItems	(ItMi_Silver, 30, "PT_2");
};

func void Info_MKMOBBER_1_Sleep()
{
	AI_StopProcessInfos(self);
	
	TA_BeginOverlay	(self);
	TA_Sleep		(00,00,01,00,"PT_BED");
	TA_EndOverlay	(self);
};
	