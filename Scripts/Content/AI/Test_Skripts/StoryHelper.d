INSTANCE SH(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name 			= "StoryHelper";
	Npctype			= Npctype_Main;
	guild			= GIL_NONE;
	level			= 10;
	voice			= 15;
	id				= 0;


	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			-1);

	//-------- ai ----------
	start_aistate = ZS_SH_Hangaround;
};

func void ZS_SH_Hangaround ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"ZS_SH_Hangaround");

	Npc_PercEnable  	(self,	PERC_ASSESSTALK,	B_AssessTalk		);
};

func void ZS_SH_Hangaround_Loop ()
{
	PrintDebugNpc	(PD_ZS_LOOP,	"ZS_SH_Hangaround_Loop");
};

func void ZS_SH_Hangaround_End ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"ZS_SH_Hangaround_End");
};

//***************************************************************************
//	Rahmen-Infos
//***************************************************************************

instance  StoryHelper_Exit (C_INFO)
{
	npc			=  SH;
	nr			=  999;
	condition	=  StoryHelper_Exit_Condition;
	information	=  StoryHelper_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = "ENDE";
};

FUNC int  StoryHelper_Exit_Condition()
{
	return 1;
};

FUNC VOID  StoryHelper_Exit_Info()
{
	AI_StopProcessInfos	( self );
};



//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################
INSTANCE StoryHelper_INFO1 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO1_Condition;
	information		= StoryHelper_INFO1_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 1";
};

FUNC INT StoryHelper_INFO1_Condition()
{
	return TRUE;
};

func VOID StoryHelper_INFO1_Info()
{

	Info_ClearChoices	( StoryHelper_INFO1 );

	Info_AddChoice		( StoryHelper_INFO1, "ZURÜCK"			                			, StoryHelper_BACK1);
	Info_AddChoice		( StoryHelper_INFO1, "I: Bei Diego im Haus der Erzbarone"			, StoryHelper_Chapter1_BeforeDiego );
	Info_AddChoice		( StoryHelper_INFO1, "I: Am Alten Lager angekommen"					, StoryHelper_Chapter1_ArrivedAtOC );
};

//---------------------------------------------------------------------
//	Am Alten Lager angekommen
//---------------------------------------------------------------------
func void StoryHelper_Chapter1_ArrivedAtOC()
{
	//-------- Menü --------
	Info_ClearChoices			(StoryHelper_INFO1);
	AI_StopProcessInfos			(self);

	//-------- was davor geschah --------

	//-------- was neu geschieht --------
	CreateInvItem				(hero, ItWr_Xardas_Letter_Sealed);
	B_ExchangeRoutine 			(AMZ_900_Thora,"ArenaWait");
	SubChapter					= CH1_ARRIVED_AT_OC;
};


//---------------------------------------------------------------------
//	Bei Diego im Haus der Erzbarone
//---------------------------------------------------------------------
func void StoryHelper_Chapter1_BeforeDiego()
{
	//-------- Menü --------
	Info_ClearChoices			(StoryHelper_INFO1);
	AI_StopProcessInfos			(self);

	//-------- was davor geschah --------
	CreateInvItem				(hero, ItWr_Xardas_Letter_Sealed);
	B_ExchangeRoutine 			(AMZ_900_Thora,"ArenaWait");

	//-------- was neu geschieht --------
	SubChapter					= CH1_BEFORE_DIEGO;
};

//-------- ZURÜCK ---------
func void StoryHelper_BACK1()
{
	Info_ClearChoices			(StoryHelper_INFO1);
};


//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################
INSTANCE StoryHelper_INFO2 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO2_Condition;
	information		= StoryHelper_INFO2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 2";
};

FUNC INT StoryHelper_INFO2_Condition()
{
	return TRUE;
};

func VOID StoryHelper_INFO2_Info()
{

	Info_ClearChoices	( StoryHelper_INFO2 );

	Info_AddChoice		( StoryHelper_INFO2, "ZURÜCK"			                			, StoryHelper_BACK2);
	Info_AddChoice		( StoryHelper_INFO2, "II: In der Bergfestung"						, StoryHelper_Chapter2_EnteredBF );
	Info_AddChoice		( StoryHelper_INFO2, "II: Thora überzeugt"							, StoryHelper_Chapter2_ThoraConvinced );
};

//---------------------------------------------------------------------
//	Thora überzeugt
//---------------------------------------------------------------------
func void StoryHelper_Chapter2_ThoraConvinced()
{
	//-------- Menü --------
	Info_ClearChoices			(StoryHelper_INFO2);
	AI_StopProcessInfos			(self);

	//-------- was davor geschah --------
	CreateInvItem				(hero, ItWr_Xardas_Letter);
	B_ExchangeRoutine 			(AMZ_900_Thora,"ArenaWait");

	//-------- was neu geschieht --------
	B_Kapitelwechsel			(2);
	SubChapter					= CH2_THORA_CONVINCED;
};


//---------------------------------------------------------------------
//	In der Bergfestung
//---------------------------------------------------------------------
func void StoryHelper_Chapter2_EnteredBF()
{
	//-------- Menü --------
	Info_ClearChoices			(StoryHelper_INFO2);
	AI_StopProcessInfos			(self);

	//-------- was davor geschah --------
	CreateInvItem				(hero, ItWr_Xardas_Letter);
	B_Kapitelwechsel			(2);

	//-------- was neu geschieht --------
	B_ExchangeRoutine 			(AMZ_900_Thora,"ReportToGarwog");
	SubChapter					= CH2_ENTERED_BF;
};

//-------- ZURÜCK ---------
func void StoryHelper_BACK2()
{
	Info_ClearChoices			(StoryHelper_INFO2);
};






