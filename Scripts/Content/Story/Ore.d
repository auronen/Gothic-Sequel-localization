//##################################################################################
//
//	Erz-Mobsis mit begrenztem Inhalt
//	--------------------------------
//
//##################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Erzzähler definieren
///////////////////////////////////////////////////////////////////////////////////
var int ORE_OW_CAVE1_OREWOLF_4;			// Wolfshöhle vor dem OC-Haupteingang, rechter Klumpen
var int ORE_OW_CAVE1_OREWOLF_5;			// Wolfshöhle vor dem OC-Haupteingang, linker Klumpen
var int ORE_PT_ORE;						// Erzmobsi im PORTALTEST.ZEN

///////////////////////////////////////////////////////////////////////////////////
//	Füllfunktionen für den Spielstart
///////////////////////////////////////////////////////////////////////////////////
func void FillOre_Oldcamp()
{
};

func void FillOre_Surface()
{
	ORE_OW_CAVE1_OREWOLF_4 = 200;
	ORE_OW_CAVE1_OREWOLF_5 = 200;
};

func void FillOre_Portaltest()
{
	ORE_PT_ORE = 16;
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Ore_IsOreAvailable
//	----------------------
//	Ist das ORE-Mobsi in der Nähe eines angemeldeten Waypoints wird TRUE
//	zurückgegeben, sonst FALSE.
///////////////////////////////////////////////////////////////////////////////////
func int MOB_Ore_IsOreAvailable(var int amount)
{
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "OW_CAVE1_OREWOLF_4")) {	if (ORE_OW_CAVE1_OREWOLF_4 >= amount) { return TRUE; }; };
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "OW_CAVE1_OREWOLF_5")) {	if (ORE_OW_CAVE1_OREWOLF_5 >= amount) { return TRUE; }; };
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "PT_ORE")) {	if (ORE_PT_ORE >= amount) { return TRUE; }; };
	PrintDebugMobsi("MOB_Ore_IsOreAvailable ...FALSE");
	return FALSE;
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Ore_ReduceOre
//	-----------------
//	Verringert den zum ORE-Mobsi dazugehörigen Counter um die angegebene Anzahl
//	Erz.
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Ore_ReduceOre(var int amount)
{
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "OW_CAVE1_OREWOLF_4")) { ORE_OW_CAVE1_OREWOLF_4 = ORE_OW_CAVE1_OREWOLF_4 - amount; };
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "OW_CAVE1_OREWOLF_5")) { ORE_OW_CAVE1_OREWOLF_5 = ORE_OW_CAVE1_OREWOLF_5 - amount; };
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "PT_ORE")) { ORE_PT_ORE = ORE_PT_ORE - amount; };
	PrintDebugMobsi("MOB_Ore_ReduceOre...DONE");
};
