//***************************************************************************************
//			TA_Stay Ansteurung
//***************************************************************************************


//**********************************************************************************************
//			Globaler String, damit man an WP kommt, den man einem Nsc im TA_Stay mitgeben möchte
//**********************************************************************************************

var string string_staywp;

INSTANCE DIA_Prototype_EXIT (C_INFO)
{
	npc			= APrototype;
	nr			= 3999;
	condition	= DIA_Prototype_EXIT_Condition;
	information	= DIA_Prototype_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Prototype_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Prototype_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


INSTANCE DIA_Prototype_SetToFollow (C_INFO)
{
	npc			= APrototype;
	nr			= 3998;
	condition	= DIA_Prototype_SetToFollow_Condition;
	information	= DIA_Prototype_SetToFollow_Info;
	permanent	= 1;
	description = "HIermit läuft der Nsc mir nach";
};                       

FUNC INT DIA_Prototype_SetToFollow_Condition()
{
	return 1;
};

func void Rtn_Prototype_SetToFollow_3999 ()
{
	PrintDebugNpc	( PD_ZS_FRAME, "Prototype_SetToFollow");
	self.aivar[AIV_PARTYMEMBER] =1;
	
	string_staywp = Npc_GetNearestWP ( self);
	
	// TestFall Npc führt den Spieler

	TA_GuidePC		( 00, 00, 12, 00, "TEST4");
	TA_GuidePC		( 12, 00, 00, 00, "TEST4");

	
	// TestFall Npc folgt dem Spieler
	/*
	TA_FollowMode		( 00, 00, 12, 00, string_staywp);
	TA_FollowMode		( 12, 00, 00, 00, string_staywp);
	*/
};


FUNC VOID DIA_Prototype_SetToFollow_Info()
{	
	Npc_ExchangeRoutine	( self, "PROTOTYPE_SETTOFOLLOW");
};



INSTANCE DIA_Prototype_SetToTA_Stay (C_INFO)
{
	npc			= APrototype;
	nr			= 3999;
	condition	= DIA_Prototype_SetToTA_Stay_Condition;
	information	= DIA_Prototype_SetToTA_Stay_Info;
	permanent	= 1;
	description = "DIA_Prototype_SetToTA_Guide";
};

func int DIA_Prototype_SetToTA_Stay_Condition ()
{
	// Hier muß dann rein, ob der Nsc sich in Stay oder Follow befindet, nur bei TA_Follow ausführbar
	
	return 1;
};

func void Rtn_Prototype_SetWaitingWP_3999 ()
{
	PrintDebugNpc	( PD_ZS_FRAME, "Prototype_SetWaitingWP");
	PrintDebugNpc	( PD_ZS_FRAME, string_staywp);
	TA_Stand 	(  0, 0, 12, 00, string_staywp);
	TA_Stand	( 12, 0,  0, 00, string_staywp);
};




func void DIA_Prototype_SetToTA_Stay_Info ()
{

	string_staywp = Npc_GetNearestWP ( self);
	
	// Hier wird der Partymodestatus wieder gelöscht, ist aber an dieser Stelle nur zum testen, weil es a) in der Story passiert und 
	//b) ein wartender Partymember von der Logik her natürlich immer noch ein Partymeber ist
	
	self.aivar[AIV_PARTYMEMBER] =0;
	
	PrintDebugNpc	( PD_ZS_FRAME, string_staywp);
	B_Say	( self, other, "DIA_PROTOTYPE_SETTOTASTAY_11_00"); // Ich werde mir mal ne gemütlich Stelle in der Nähe suchen und da auf Dich warten
	Npc_ExchangeRoutine	( self, "PROTOTYPE_SETWAITINGWP");
	
};
