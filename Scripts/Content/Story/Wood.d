//##################################################################################
//
//	Holz-Mobsis mit begrenztem Inhalt
//	--------------------------------
//
//##################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Erzzähler definieren
///////////////////////////////////////////////////////////////////////////////////
var int Wood_OW_CAVE1_WoodWOLF_4;			// Wolfshöhle vor dem OC-Haupteingang  !!! Es gibt noch kein Wood-Mobsi, deswegen sind die Vars und Wps noch CutCopyPaste
var int Wood_PT_Wood;						// Erzmobsi im PORTALTEST.ZEN

///////////////////////////////////////////////////////////////////////////////////
//	Füllfunktionen für den Spielstart
///////////////////////////////////////////////////////////////////////////////////
func void FillWood_Oldcamp()
{
};

func void FillWood_Surface()
{
	Wood_OW_CAVE1_WoodWOLF_4 = 500;
};

func void FillWood_Portaltest()
{
	Wood_PT_Wood = 16;
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Wood_IsWoodAvailable
//	----------------------
//	Ist das Wood-Mobsi in der Nähe eines angemeldeten Waypoints wird TRUE
//	zurückgegeben, sonst FALSE.
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Wood_IsWoodAvailable(var int amount)
{
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "OW_CAVE1_WoodWOLF_4")) {	if (Wood_OW_CAVE1_WoodWOLF_4 >= amount) { return TRUE; }; };
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "Test1_2")) {	if (Wood_PT_Wood >= amount) { return TRUE; } else { return FALSE; }; };
	PrintDebugMobsi("MOB_Wood_IsWoodAvailable ...FALSE");
	return FALSE;
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Wood_ReduceWood
//	-----------------
//	Verringert den zum Wood-Mobsi dazugehörigen Counter um die angegebene Anzahl
//	Erz.
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Wood_ReduceWood(var int amount)
{
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "OW_CAVE1_WoodWOLF_4")) { Wood_OW_CAVE1_WoodWOLF_4 = Wood_OW_CAVE1_WoodWOLF_4 - amount; }
	else if (Hlp_StrCmp(Npc_GetNearestWP(self), "Test1_2")) {Wood_PT_Wood = Wood_PT_Wood - amount; };
	PrintDebugMobsi("MOB_Wood_ReduceWood...DONE");
};
