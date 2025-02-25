//#############################################################################################
//
//	AI-Custom-Konstanten
//	-----------------------------
//	Allerlei selbst definierte Konstanten, um Zahlen in den Skripten weitgehend zu vermeiden
//
//#############################################################################################
//#############################################################################################

//-------- Kennungen der AI-Variablen --------
	const int AIV_WANTEDITEM							= 0;
	const int AIV_PCISSTRONGER							= 1;
	const int AIV_BEENATTACKED							= 2;
	const int AIV_FINDABLE								= 3;									// MH: Für Info_FindNPC
	const int AIV_PLUNDERED								= 4;									// wird gesetzt sobald der Körper geplündert wurde und gelöscht, wenn der NSC ohnmächtig/tot wird
	const int AIV_LASTHITBYRANGEDWEAPON					= 5;									// SN: Merkt sich, ob der letzte erlittene Schaden durch eine Fernkampfwaffe/Magie verursacht wurde. Wird für einen intelligenten Abbruch des ZS_Attack benötigt.
	const int AIV_HASBEENDEFEATEDINPORTALROOM			= 6;
	const int AIV_HANGAROUNDSTATUS						= 7;
	const int AIV_GUARDITERATOR							= 8;
	const int AIV_FIGHTSPEACHFLAG						= 9;
	const int AIV_ITEMSTATUS							= 10;
	const int AIV_ITEMFREQ								= 11;
	const int AIV_WASDEFEATEDBYSC						= 12;
	const int AIV_HASDEFEATEDSC							= 13;
	const int AIV_ISLOOKING								= 14;
	const int AIV_IMPORTANT								= 15;
	const int AIV_MOVINGMOB								= 16;

	const int AIV_OBSERVEINTRUDER						= 17;									// SN: wird nur für ZS_Orc_ObserveIntruder.d verwendet
	const int AIV_WARNTARGET							= 18;									// SN: wird nur für ZS_Orc_ObserveIntruder.d verwendet

//-------- Durchgangswachen --------
	const int AIV_GUARDPASSAGE_STATUS					= 19;									// Enthält den Status einer Durchgangswache
	const int	AIV_GPS_BEGIN							= 0;									// ...Anfang; SC noch nicht in der Nähe
	const int	AIV_GPS_FIRSTWARN						= 1;									// ...nach der ersten Warnung an den SC
	const int	AIV_GPS_LASTWARN						= 2;									// ...nach der zweiten Warnung an den SC
	const int	AIV_GPS_PUNISH							= 3;									// ...SC kam zum dritten Mal zu nahe -> Wache greift an!
	const int AIV_LASTDISTTOWP							= 20;									// enthält die Distanz zu einem Referenzpunkt hinter der Wache, die bei der letzten Verwarnung ermittelt wurde
	const int AIV_PASSGATE								= 21;									// für Durchgangswachen 0 = Wache hält SC auf, 1 = Wache lässt SC durch

	const int AIV_DIDWAITTOCLEARROOM					= 22;
	const int AIV_FOUNDPERSON							= 23;									// In einigen TAs wird mit Npc_PerceiveAll nach bestimmten Personen gesucht. Damit dies nicht ständig gemacht werden muß, wird hier gemerkt, ob diese Person schon gefunden wurde
	const int AIV_INVINCIBLE							= 24;									// MH: ist TRUE für beide Teilnehmer eines Dialogs (s. ZS_Talk)
	const int AIV_DONTUSEMOB							= 25;									// Sonst wird immer wieder der komplette StartBlock durchlaufen

	const int AIV_ATTACKREASON							= 26;									// SN: Grund des Angriffs
	const int	AIV_AR_NONE								= 0;
	const int	AIV_AR_INTRUDER							= 1;
	const int	AIV_AR_DISTURBEDARENA					= 2;
	const int	AIV_AR_MURDEREDINARENA					= 3;
	const int	AIV_AR_ARENABOW							= 4;
	const int	AIV_AR_ARENAMAGIC						= 5;

	const int AIV_PARTYMEMBER							= 27;									//SN: (begleitet den Spieler - für XP-Vergabe)
	const int AIV_SPECIALCOMBATDAMAGEREACTION			= 28;									//SN: verzweigt bei erlittenen Treffern in ein spezielles Reaktionsmodul
	const int AIV_LASTTARGET							= 29;									//SN: wird in ZS_Attack benötigt um das letzte Ziel zu merken
	const int AIV_TALKBEFOREATTACK						= 30;									//SN: ist dieses Flag gesetzt, so wird beim B_AssessEnemy auf eine Importantinfo abgefragt!
	const int AIV_DEALDAY								= 31;									//SN: wird für Ambient NSCs benutzt, um sich den Tag des letzten Deals zu merken (z.B.:Sumpfkraut für ORG oder Wasser für BAU)
	const int AIV_ITEMSCHWEIN							= 32;									//MH: NSCs, die dieses Flag auf TRUE haben, gehen IMMER, wenn im FreeLos der HERO ein Item nimmt (assessTheft-Wn) von DIEBSTAHL aus (--> ZS_CatchThief)

	const int AIV_ACTIVEMOBSI							= 33;
	const int	AIV_AM_NONE								= 0;
	const int	AIV_AM_BED								= 1;
	const int	AIV_AM_ORE								= 2;
	const int	AIV_AM_MELTER							= 3;
	const int	AIV_AM_FIRE								= 4;
	const int	AIV_AM_ANVIL							= 5;
	const int	AIV_AM_COOL								= 6;
	const int	AIV_AM_SHARP							= 7;
	const int	AIV_AM_CAULDRON							= 8;
	const int	AIV_AM_LAB								= 9;
	const int	AIV_AM_RUNEMELTER						= 10;
	const int	AIV_AM_RUNEMAKER						= 11;
	const int	AIV_AM_WOOD								= 12;
	const int	AIV_AM_BOW								= 13;
	const int	AIV_AM_FLETCHER							= 14;
	const int	AIV_AM_WATERPIPE						= 15;
	const int	AIV_AM_BOOK								= 16;
	const int	AIV_AM_STOMPER							= 17;
	const int	AIV_AM_ARENABENCH						= 18;
	const int	AIV_AM_PAN								= 19;

	const int AIV_HAENDLER								= 34;
	const int	AIV_H_HEAL								= 1;
	const int	AIV_H_WEAPON_NF_SWORD					= 2;
	const int	AIV_H_WEAPON_NF_AXE						= 3;
	const int	AIV_H_WEAPON_FF							= 4;
	const int	AIV_H_WEAPON_ARMOR						= 5;
	const int	AIV_H_FOOD								= 6;
	const int	AIV_H_THIEF								= 7;
	const int	AIV_H_MAGIC								= 8;

	const int AIV_MURDERWITTNESS						= 35;									// JP: Diese const ist frei, ich wollte sie nur nicht mittenraus löschen
																								// feel free to use
	const int AIV_THEFTWITTNESS							= 36;
	const int	AIV_NODEED								= 0;
	const int	AIV_FIRSTDEED							= 1;
	const int	AIV_SECONDDEED							= 2;
	const int AIV_FEMALE								= 37;
	const int AIV_TALENT_STAFF							= 38;
	const int	TALENT_STAFF_0							= 0;
	const int	TALENT_STAFF_1							= 1;
	const int	TALENT_STAFF_2							= 2;
	const int	TALENT_STAFF_3							= 3;
	const int AIV_ARENA_POINTS							= 39;
	const int AIV_ARENA_VICTORIES						= 40;
	const int AIV_STOLENWEAPON_HOUR						= 41;
	const int AIV_PLAYERHASMYWEAPON						= 42;
	const int AIV_PLAYERISINROOM						= 43;

/********************************************************************
**					NPC-Typ											*
********************************************************************/
	const int NpcType_Ambient							= 0;									// Ambient-Nscs In Den Lagern
	const int NpcType_Main								= 1;
	const int NpcType_Guard								= 2;									// wichtig für Wachen???
	const int NpcType_Friend							= 3;
	const int NpcType_Mine_Ambient						= 4;
	const int NpcType_Mine_Guard						= 5;
	const int NpcType_OW_Ambient						= 6;									// versteckte Flüchtlinge in der OW
	const int NpcType_Wrk_Ambient						= 7;									// Arbeiter im Sinne des Wortes
	const int NpcType_Rogue								= 8;									// Npcs im Banditenlager
	const int NpcType_Trd_Ambient						= 9;									// Händler
	const int NpcType_Female							= 10;									// Babes

/********************************************************************
**					Fight AI-Constanten								*
********************************************************************/

	const int FAI_MONSTER_MASTER						= 1;
	const int FAI_HUMAN_COWARD							= 2;
	const int FAI_HUMAN_STRONG							= 3;
	const int FAI_HUMAN_MASTER							= 4;
	const int FAI_MINECRAWLER							= 5;
	const int FAI_DEMON									= 6;
	const int FAI_GOBBO									= 7;
	const int FAI_GOLEM									= 8;
	const int FAI_LURKER								= 9;
	const int FAI_MONSTER_COWARD						= 10;									// Monster, die man auch als Newbie kleinkriegt
	const int FAI_MOLERAT								= 11;
	const int FAI_ORC									= 12;
	const int FAI_ORCDOG								= 13;
	const int FAI_ORCUNDEAD								= 14;
	const int FAI_SCAVENGER								= 15;
	const int FAI_SHADOWBEAST							= 16;
	const int FAI_SKELETON								= 17;
	const int FAI_SNAPPER								= 18;
	const int FAI_SWAMPSHARK							= 19;
	const int FAI_TROLL									= 20;
	const int FAI_WARAN									= 21;
	const int FAI_WOLF									= 22;
	const int FAI_ZOMBIE								= 23;
	const int FAI_BLOODFLY								= 24;
	const int FAI_HUMAN_MAGE							= 25;
	const int FAI_MONSTER_STRONG						= 26;
	const int FAI_MINECRAWLERQUEEN						= 27;
	const int FAI_SLEEPER								= 28;
	const int FAI_HUMAN_RANGED							= 29;

/********************************************************************
**					Gesichts-Texturen								*
********************************************************************/
	const int DEFAULT									= 0;

	const int FACE_NORMAL								= 0;
	const int FACE_MAGE									= 1;
	const int FACE_FIGHTER								= 2;
	const int FACE_THIEF								= 3;
	const int FACE_GURU									= 4;
	const int FACE_NOVICE								= 5;

/********************************************************************
**					Zeit-Konstanten									*
********************************************************************/
	const int NPC_ANGRY_TIME							= 120;									// Spielsekunden
	//const int NEWS_SPAWN_TIME							= ?;

/********************************************************************
**					ZS_RÜCKABEWERTE 							   **
********************************************************************/

	const int START_LOOP								= 1;
	const int START_NOLOOP								= 0;
	const int LOOP_CONTINUE								= 0;
	const int LOOP_END									= 1;

/********************************************************************
**					Allgemeine Konstanten						   **
********************************************************************/
	const int TRUE										= 1;
	const int FALSE										= 0;

// *************************************
// NSC - Wahrnehmungsreichweiten
// *************************************
	const int PERC_DIST_CLOSE							= 100;
	const int PERC_DIST_FLEE							= 300;
	const int PERC_DIST_DIALOG							= 500;
	const int PERC_DIST_WATCHFIGHT						= 600;
	const int PERC_DIST_INTERMEDIAT						= 1000;
	const int PERC_DIST_MAX								= 2000;

/********************************************************************
**					Konstanten für Distanzen					   **
**					    der Menschen-AI							   **
********************************************************************/
	const int HAI_DIST_MELEE							= 600;									// 1. Drunter wählen menschliche NSCs Nahkampf, drüber Fernkampf (B_SelectWeapon)
																								// 2. Innerhalb dieser Distanz fühlen sich NSCs von gezogenen Waffen bedroht (B_AssessFighter)
	const int HAI_DIST_RANGED							= 3000;									// 1. Innerhalb dieser Distanz fühlen sich NSCs von gezogenen Fernkampfwaffen/Kampfzaubern bedroht (B_AssessFighter)

	const int HAI_DIST_ABORT_MELEE						= HAI_DIST_MELEE + 400;					// NSC bricht einen Nahkampf ab, wenn die Distanz zum Ziel diesen Wert erreicht. '+X00' fungiert als Hysterese, damit nicht ständig der Kampf beginnt und wieder endet
	const int HAI_DIST_ABORT_RANGED						= HAI_DIST_RANGED + 500;				// NSC bricht einen Fernkampf ab, wenn die Distanz zum Ziel diesen Wert erreicht. '+X00' fungiert als Hysterese, damit nicht ständig der Kampf beginnt und wieder endet
	const int HAI_DIST_ABORT_FLEE						= 3000;

	const int HAI_DIST_ASSESSCASTER						= 2000;									// Ab dieser Entfernung reagieren NSCs auf das Zaubern eines SCs
	const int HAI_DIST_HELPATTACKEDCHARGES				= 2000;									// Wach-NSCs reagieren auf Angriffe auf beschützte NSCs innerhalb dieser Reichweite (gemessen am Opfer!)

	const int HAI_DIST_ASSESS_MONSTER					= 1000;									// Ab dieser Distanz zu einem herannahenden Monster reagiert der NSC darauf !
	const int HAI_DIST_ABORT_ASSESS_MONSTER				= HAI_DIST_ASSESS_MONSTER + 200;		// Ab dieser Distanz beendet ein NSC die Abwartende Haltung gegenüber einem sich entfernenden Monster!
	const int HAI_DIST_ATTACK_MONSTER					= 1000;									// Ab dieser Distanz greift ein abwartender NSC ein herannahendes Monster an!

	const int HAI_DIST_CATCHTHIEF						= 150;									// Ab dieser Distanz ist es möglich dem Nsc in die Tasche zu greifen
	const int HAI_DIST_ASSESSTHEFT						= 800;									// Auf diese Distanz stellen Nsc´s einen Diebstahl fest
	const int HAI_DIST_ABORTPURSUIT						= 1000;									// Auf diese Distanz brechen Durchgangswachen die Verfolgung ab
	const int HAI_DIST_ASSESSQUIETSOUND					= 500;									// Auf diese Distanz werden Schritte des SCs von anderen NSCs gehört

	const int HAI_DIST_ACTIONRANGE						= 1500;									// technische Reichweite von PERC_ASSESSENTERROOM
	const int HAI_DIST_CLEARROOM						= 700;									// innerhalb dieser Distanz reagieren nicht-Wachen auf das Betreten von unerlaubten Räumen (PERC_ASSESSENTERROOM)
	const int HAI_DIST_HEARROOMINTRUDER					= 700;									// innerhalb dieser Distanz wird der SC beim Betreten von unerlaubten Räumen auch entdeckt (gehört), wenn die Beobachter ihm den Rücken zudrehen (aber schleichen hilft wieder!)

	const int HAI_DIST_SMALLTALK						= 500;
	const int HAI_DIST_OBSERVEINTRUDER					= 100;
	const int HAI_DIST_GUARDOBSERVEINTRUDER				= 500;									// Wachen reagieren auf einen größerne Radius mit ObserveIntruder
	const int HAI_DIST_OBSERVEINTRUDER_STEPBACK			= 60;
	const int HAI_DIST_GUARDPASSAGE_RESET				= 1500;									// Durchgangswachen beruhigen sich wieder, wenn der SC diese Entfernung erreicht hat
	const int HAI_DIST_GUARDPASSAGE_ATTENTION			= 1200;									// innerhalb dieser Distanz drehen sich Durchgangswachen immer zum Spieler

	const int HAI_DIST_FOLLOWPC							= 500;									// NSC im TA-Zustand ZS_FollowPC entfernt sich höchstens bis zu dieser Distanz. Bei Überschreiten schließt er wieder auf
	const int HAI_DIST_GUIDEPC							= 1000;									// NSC im TA-Zustand ZS_GuidePC warten auf den SC, wenn er sich weiter als diese Distanz entfernt.
	const int HAI_DIST_ASSESSTOLERATEDENEMY				= 1000;									// Distanz innerhalb der auf einen geduldeten Feind reagiert wird (Fall 1)

	const int HAI_DIST_WATCH							= 1500;									// Innerhalb dieser Reichweite drehen sich Palisadenwachen zum SC (falls er nicht schleicht)
	const int HAI_DIST_DETECTUSEMOB						= 1500;									// Innerhalb dieser Reichweite wird die Benutzung von Objekten durch den SC entdeckt

	const int HAI_DIST_ARENANPC							= 300;									// maximale Distanz, die ein Arenakämpfer-NSC zum Mittelpunkt der Arena haben darf, bevor er gegen den anderen kämpft
	const int HAI_DIST_REGAINDROPPEDWEAPON				= 1500;									// maximale Entfernung einer Waffe, um von einem aus der Bewußtlosigkeit erwachenden NSC aufgehoben zu werden
	const int HAI_DIST_NPCISNEAR						= 700;									// Wird von B_NpcIsNear() benutzt

/********************************************************************
**					Konstanten für Zeiten						   **
**					    der Menschen-AI							   **
********************************************************************/
	const int HAI_TIME_PURSUIT							= 20;									// Zeit in Sekunden, nach der eine Verfolgung abgebrochen wird (ZS_ProclaimAndPunish)
	const int HAI_TIME_FOLLOW							= 10;									// Anzahl der 3s-Abschnitte die sich das Opfer des NSCs maximal in BS_RUN befinden darf, um noch weiter verfolgt zu werden
	const int HAI_TIME_UNCONSCIOUS						= 10;									// Zeit in Sekunden, die der SC und NSCs bewußtlos bleiben
	const int HAI_TIME_TURNAWAY							= 20;									// Zeit in Sekunden, die sich der feige Wach-NSC vor dem siegreichen SC (der gerade was anstellt) abdreht und ihn ignoriert

/////////////////////////////////////////////////////////////////////
// Talentstufen
/////////////////////////////////////////////////////////////////////
	const int TAL_STEP_1								= 1;
	const int TAL_STEP_2								= 2;
	const int TAL_STEP_3								= 3;
	const int TAL_STEP_4								= 4;
	const int TAL_STEP_5								= 5;
	const int TAL_STEP_6								= 6;

/////////////////////////////////////////////////////////////////////
//	AI_Globals	Globale Variablen, um bestimmte Werte über Funktions-
//	Grenzen hinweg zu erhalten
/////////////////////////////////////////////////////////////////////

	var int int_PlayerIsInBarrel;

	var int	int_Printhelper;

//---------------------------------------------------------------------
//	herausgereichte Engine-Konstanten
//---------------------------------------------------------------------
	const int NPC_MAX_NOISE_DIST						= 700;
	const int NPC_MAX_DLG_DIST							= 3000;									//SN: Sehr weit ist OK!

	const float NPC_MAX_FP_DIST							= 1000;
