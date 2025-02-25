///////////////////////////////////////////////////////////////////////////////////////////
// Gilden
// Aufnahmebedingungen
// Lernprogramme
///////////////////////////////////////////////////////////////////////////////////////////

// ********************************************************************************************************************
// Gruppenattitüden
// ********************************************************************************************************************

const int TAB_ANZAHL = 16 * 16;

const int GIL_ATTITUDES [TAB_ANZAHL] =// JP: Gildentabelle von den Bezeichnungen auf Sequel Angepaßt
{
//				None			Militia			Worker			Miner			Healer 				Thief 							Possessed		Beggar 			Demonic 		Amazon 			Paladin 							KDF 			Bloodearth 		Demonhunter 					Rsvd_2			Rsvd_3
/*Non*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,		ATT_NEUTRAL,	/*Non*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Non*/				ATT_NEUTRAL,	ATT_HOSTILE,	ATT_NEUTRAL,	/*Non*/			ATT_NEUTRAL,	ATT_NEUTRAL,

/*Militia*/		ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,		ATT_FRIENDLY,	/*Militia*/		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	/*Militia*/			ATT_NEUTRAL,	ATT_HOSTILE,	ATT_NEUTRAL,	/*Militia*/		ATT_NEUTRAL,	ATT_NEUTRAL,
/*Worker*/		ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,		ATT_FRIENDLY,	/*Worker*/		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	/*Worker*/			ATT_NEUTRAL,	ATT_HOSTILE,	ATT_NEUTRAL,	/*Worker*/		ATT_NEUTRAL,	ATT_NEUTRAL,
/*Miner*/		ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,		ATT_FRIENDLY,	/*Miner*/		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	/*Miner*/			ATT_NEUTRAL,	ATT_HOSTILE,	ATT_NEUTRAL,	/*Miner*/		ATT_NEUTRAL,	ATT_NEUTRAL,
/*Healer*/		ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,		ATT_FRIENDLY,	/*Healer*/		ATT_FRIENDLY,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	/*Healer*/			ATT_NEUTRAL,	ATT_HOSTILE,	ATT_ANGRY,		/*Healer*/		ATT_FRIENDLY,	ATT_NEUTRAL,
/*Thief*/		ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,		ATT_FRIENDLY,	/*Thief*/		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	/*Thief*/			ATT_NEUTRAL,	ATT_HOSTILE,	ATT_NEUTRAL,	/*Thief*/		ATT_NEUTRAL,	ATT_NEUTRAL,

/*Possessed*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,		ATT_NEUTRAL,	/*Possessed*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Possessed*/		ATT_ANGRY,		ATT_HOSTILE,	ATT_NEUTRAL,	/*Possessed*/	ATT_FRIENDLY,	ATT_NEUTRAL,
/*Beggar*/		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,			ATT_ANGRY,		/*Beggar*/		ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	/*Beggar*/			ATT_ANGRY,		ATT_HOSTILE,	ATT_NEUTRAL,	/*Beggar*/		ATT_NEUTRAL,	ATT_NEUTRAL,
/*Demonic*/		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,			ATT_ANGRY,		/*Demonic*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_HOSTILE,	/*Demonic*/			ATT_HOSTILE,	ATT_HOSTILE,	ATT_NEUTRAL,	/*Demonic*/		ATT_NEUTRAL,	ATT_NEUTRAL,
/*Amazon*/		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,			ATT_ANGRY,		/*Amazon*/		ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Amazon*/			ATT_FRIENDLY,	ATT_HOSTILE,	ATT_NEUTRAL,	/*Amazon*/		ATT_NEUTRAL,	ATT_NEUTRAL,
/*Paladin*/		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,			ATT_ANGRY,		/*Paladin*/		ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Paladin*/			ATT_FRIENDLY,	ATT_HOSTILE,	ATT_NEUTRAL,	/*Paladin*/		ATT_NEUTRAL,	ATT_NEUTRAL,

/*KDF		*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,		ATT_NEUTRAL,	/*KDF	*/		ATT_ANGRY,		ATT_ANGRY,		ATT_HOSTILE,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*KDF*/				ATT_FRIENDLY,	ATT_HOSTILE,	ATT_NEUTRAL,	/*KDF		*/	ATT_HOSTILE,	ATT_HOSTILE,
/*Bloodearth*/	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,		ATT_HOSTILE,	/*Bloodearth*/	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Bloodearth*/		ATT_HOSTILE,	ATT_FRIENDLY,	ATT_HOSTILE,	/*Bloodearth*/	ATT_HOSTILE,	ATT_HOSTILE,
/*Demonhunter*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_ANGRY,			ATT_NEUTRAL,	/*Demonhunter*/	ATT_ANGRY,		ATT_NEUTRAL,	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Demonhunter*/		ATT_NEUTRAL,	ATT_HOSTILE,	ATT_FRIENDLY,	/*Demonhunter*/	ATT_NEUTRAL,	ATT_NEUTRAL,

/*Rsvd_2*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,		ATT_NEUTRAL,	/*Rsvd_2*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	/*Rsvd_2*/			ATT_NEUTRAL,	ATT_HOSTILE,	ATT_NEUTRAL,	/*Rsvd_2*/		ATT_FRIENDLY,	ATT_NEUTRAL,
/*Rsvd_3*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,		ATT_NEUTRAL,	/*Rsvd_3*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Rsvd_3*/			ATT_NEUTRAL,	ATT_HOSTILE,	ATT_NEUTRAL,	/*Rsvd_3*/		ATT_NEUTRAL,	ATT_FRIENDLY
};

//	const int GIL_ATTITUDES [TAB_ANZAHL] =	// AL und  NL verärgert (Magier zueinander freundlich) ST neutral zu AL und NL (Magier verärgert zu ST)
//	{
//	//			None			EBr				Grd				Stt				KdF				Vlk 					KdW 			Sld				Org 			Bau 			SfB 					Gur 			Nov 			Tpl 					Däm 			Bab
//	/*Non*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Non*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Non*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Non*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//
//	/*Ebr*/		ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Ebr*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Ebr*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Ebr*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//	/*Grd*/		ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Grd*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Grd*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Grd*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//	/*Stt*/		ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Stt*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Stt*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Stt*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//	/*Kdf*/		ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Kdf*/	ATT_FRIENDLY,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Kdf*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Kdf*/	ATT_FRIENDLY,	ATT_NEUTRAL,
//	/*Vlk*/		ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Vlk*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Vlk*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Vlk*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//
//	/*Kdw*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	/*Kdw*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Kdw*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Kdw*/	ATT_FRIENDLY,	ATT_NEUTRAL,
//	/*Sld*/		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Sld*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Sld*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Sld*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//	/*Org*/		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Org*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Org*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Org*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//	/*Bau*/		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Bau*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Bau*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Bau*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//	/*Sfb*/		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Sfb*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Sfb*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Sfb*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//
//	/*Gur*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_ANGRY,		ATT_NEUTRAL,	/*Gur*/	ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Gur*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Gur*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//	/*Nov*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_ANGRY,		ATT_NEUTRAL,	/*Nov*/	ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Nov*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Nov*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//	/*Tpl*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_ANGRY,		ATT_NEUTRAL,	/*Tpl*/	ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Tpl*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Tpl*/	ATT_NEUTRAL,	ATT_NEUTRAL,
//
//	/*Dmb*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Dmb*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	/*Dmb*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Dmb*/	ATT_FRIENDLY,	ATT_NEUTRAL,
//	/*Bab*/		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Mst*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Mst*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Mst*/	ATT_NEUTRAL,	ATT_FRIENDLY
//	};

const int GIL_ATTITUDES_FMTAKEN [TAB_ANZAHL] =	// AL und NL feindlich
{
//				None			EBr				Grd				Stt				KdF				Vlk 					KdW 			Sld				Org 			Bau 			SfB 					Gur 			Nov 			Tpl 					Däm 			Bab
/*Non*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Non*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Non*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Non*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Ebr*/			ATT_HOSTILE,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_HOSTILE,	ATT_FRIENDLY,	/*Ebr*/	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Ebr*/	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Ebr*/	ATT_HOSTILE,	ATT_NEUTRAL,
/*Grd*/			ATT_HOSTILE,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_HOSTILE,	ATT_FRIENDLY,	/*Grd*/	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Grd*/	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Grd*/	ATT_HOSTILE,	ATT_NEUTRAL,
/*Stt*/			ATT_HOSTILE,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_HOSTILE,	ATT_NEUTRAL,	/*Stt*/	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Stt*/	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Stt*/	ATT_HOSTILE,	ATT_NEUTRAL,
/*Kdf*/			ATT_FRIENDLY,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_FRIENDLY,	ATT_NEUTRAL,	/*Kdf*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Kdf*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Kdf*/	ATT_FRIENDLY,	ATT_NEUTRAL,
/*Vlk*/			ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Vlk*/	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Vlk*/	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Vlk*/	ATT_HOSTILE,	ATT_NEUTRAL,

/*Kdw*/			ATT_FRIENDLY,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_FRIENDLY,	ATT_HOSTILE,	/*Kdw*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Kdw*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Kdw*/	ATT_FRIENDLY,	ATT_FRIENDLY,
/*Sld*/			ATT_FRIENDLY,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_FRIENDLY,	ATT_HOSTILE,	/*Sld*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Sld*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Sld*/	ATT_FRIENDLY,	ATT_FRIENDLY,
/*Org*/			ATT_FRIENDLY,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_FRIENDLY,	ATT_HOSTILE,	/*Org*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Org*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Org*/	ATT_FRIENDLY,	ATT_FRIENDLY,
/*Bau*/			ATT_FRIENDLY,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_FRIENDLY,	ATT_HOSTILE,	/*Bau*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Bau*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Bau*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Sfb*/			ATT_FRIENDLY,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_FRIENDLY,	ATT_HOSTILE,	/*Sfb*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Sfb*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Sfb*/	ATT_NEUTRAL,	ATT_NEUTRAL,

/*Gur*/			ATT_FRIENDLY,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_FRIENDLY,	ATT_NEUTRAL,	/*Gur*/	ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Gur*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Gur*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Nov*/			ATT_FRIENDLY,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_FRIENDLY,	ATT_NEUTRAL,	/*Nov*/	ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Nov*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Nov*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Tpl*/			ATT_FRIENDLY,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_FRIENDLY,	ATT_NEUTRAL,	/*Tpl*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Tpl*/	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/*Tpl*/	ATT_NEUTRAL,	ATT_NEUTRAL,

/*Dmb*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Dmb*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	/*Dmb*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Dmb*/	ATT_FRIENDLY,	ATT_NEUTRAL,
/*Bab*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Mst*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Mst*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Mst*/	ATT_NEUTRAL,	ATT_FRIENDLY
};

//#################################
//
//	SN 09.01.01: Alter Kram
//
//#################################

const int GIL_ATTITUDES_ORCASSAULT [TAB_ANZAHL] =			// von Steffen (so gelassen)
{
//				None			EBr				Grd				Stt				KdF				Vlk 					KdW 			Sld				Org 			Bau 			SfB 					Gur 			Nov 			Tpl 					Däm 			Mst
/*Non*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Non*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Non*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Non*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Ebr*/			ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Ebr*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Ebr*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Ebr*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Grd*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Grd*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Grd*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Grd*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Stt*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Stt*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Stt*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Stt*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Kdf*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	/*Kdf*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Kdf*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Kdf*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Vlk*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	/*Vlk*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Vlk*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Vlk*/	ATT_NEUTRAL,	ATT_NEUTRAL,

/*Kdw*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Kdw*/	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Kdw*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Kdw*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Sld*/			ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	/*Sld*/	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Sld*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Sld*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Org*/			ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	/*Org*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Org*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Org*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Bau*/			ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	/*Bau*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	/*Bau*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Bau*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Sfb*/			ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	/*Sfb*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	/*Sfb*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Sfb*/	ATT_NEUTRAL,	ATT_NEUTRAL,

/*Gur*/			ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Gur*/	ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_ANGRY,		/*Gur*/	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Gur*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Nov*/			ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Nov*/	ATT_NEUTRAL,	ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_ANGRY,		/*Nov*/	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	/*Nov*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Tpl*/			ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Tpl*/	ATT_NEUTRAL,	ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_ANGRY,		/*Tpl*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	/*Tpl*/	ATT_NEUTRAL,	ATT_NEUTRAL,

/*Dmb*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Dmb*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Dmb*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Dmb*/	ATT_FRIENDLY,	ATT_NEUTRAL,
/*Mst*/			ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Mst*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Mst*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Mst*/	ATT_NEUTRAL,	ATT_FRIENDLY
};

const int GIL_ATTITUDES_NEMESIS [TAB_ANZAHL] =				// von Steffen (so gelassen)
{
//				None			EBr				Grd				Stt				KdF				Vlk 					KdW 			Sld				Org 			Bau 			SfB 					Gur 			Nov 			Tpl 					Däm 			Mst
/*Non*/			ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Non*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Non*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Non*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Ebr*/			ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_ANGRY,		ATT_NEUTRAL,	ATT_ANGRY,		/*Ebr*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Ebr*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Ebr*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Grd*/			ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_ANGRY,		ATT_NEUTRAL,	ATT_ANGRY,		/*Grd*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Grd*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Grd*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Stt*/			ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		/*Stt*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Stt*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Stt*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Kdf*/			ATT_ANGRY,		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	ATT_ANGRY,		/*Kdf*/	ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Kdf*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Kdf*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Vlk*/			ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	/*Vlk*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Vlk*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Vlk*/	ATT_NEUTRAL,	ATT_NEUTRAL,

/*Kdw*/			ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Kdw*/	ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Kdw*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Kdw*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Sld*/			ATT_ANGRY,		ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Sld*/	ATT_ANGRY,		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Sld*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Sld*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Org*/			ATT_ANGRY,		ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Org*/	ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		/*Org*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Org*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Bau*/			ATT_ANGRY,		ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Bau*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	ATT_ANGRY,		/*Bau*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Bau*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Sfb*/			ATT_ANGRY,		ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/*Sfb*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	/*Sfb*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Sfb*/	ATT_NEUTRAL,	ATT_NEUTRAL,

/*Gur*/			ATT_ANGRY,		ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_ANGRY,		ATT_HOSTILE,	/*Gur*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Gur*/	ATT_NEUTRAL,	ATT_ANGRY,		ATT_ANGRY,		/*Gur*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Nov*/			ATT_ANGRY,		ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_ANGRY,		ATT_HOSTILE,	/*Nov*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Nov*/	ATT_ANGRY,		ATT_NEUTRAL,	ATT_ANGRY,		/*Nov*/	ATT_NEUTRAL,	ATT_NEUTRAL,
/*Tpl*/			ATT_ANGRY,		ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_ANGRY,		ATT_HOSTILE,	/*Tpl*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Tpl*/	ATT_ANGRY,		ATT_ANGRY,		ATT_NEUTRAL,	/*Tpl*/	ATT_NEUTRAL,	ATT_NEUTRAL,

/*Dmb*/			ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Dmb*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Dmb*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Dmb*/	ATT_FRIENDLY,	ATT_NEUTRAL,
/*Mst*/			ATT_ANGRY,		ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/*Mst*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Mst*/	ATT_ANGRY,		ATT_ANGRY,		ATT_ANGRY,		/*Mst*/	ATT_NEUTRAL,	ATT_FRIENDLY
};
