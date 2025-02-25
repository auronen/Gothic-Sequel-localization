// Jochen : says hallo check out
// *************************
// Globalvariablen für Story
// *************************

//---------------------------------------------------------------------
//	Stand des Storyplots
//---------------------------------------------------------------------
	var int chapter;
	var int subChapter;																			// enthält stets eine der folgenden Konstanten

	const int CH1_START									= 10;									// WICHTIG: folgende Konstanten müssen aufsteigend sortiert sein !!!
	const int CH1_ARRIVED_AT_OC							= 11;
	const int CH1_BEFORE_DIEGO							= 12;

	const int CH2_START									= 20;
	const int CH2_THORA_CONVINCED						= 21;
	const int CH2_ENTERED_BF							= 22;

	const int CH3_START									= 30;

	const int CH4_START									= 40;

//---------------------------------------------------------------------
//	allgemeine Spielervariablen
//---------------------------------------------------------------------
	var int Hero_Fame;																			// Gibt den Bekanntheitgrad des Spielers an. Je höher, desto bekannter ist er bei den NSCs.
																								// Es wird einige (DIALOG) Schlüsselstellen geben, bei denen der Spieler entscheiden kann, ob er bekannt werden will. Beides hat Vor- und Nachteile.
	var int Hero_DarkPoints;																	// Jede Verwendung von dämonischen Kräften bringt den Spieler der "dunklen Seite" etwas näher
	var int Hero_Name;																			// Spieler bekommt die Möglichkeit geboten einen Namen zu tragen. Nimmt er den Namen an, wird er im Laufe des Spiels mit dem Namen angesprochen.

	var int int_ReparationRunning;																// ist gesetzt, wenn der Spieler grade einen Auftrag hat um sich für seine Morde zu rehabilitieren
	const int int_DiegoRep								= 1;
	const int int_MiltenRep								= 2;
	const int int_LesterRep								= 3;
	const int int_GornRep								= 4;

	var int int_PlayerHasMyWeapon;

//---------------------------------------------------------------------
//	KAPITEL 1
//---------------------------------------------------------------------
	var int Diego_LetterRead;
	var int Diego_Answer;																		// für Abfrage eienr Addchoice
	const string DIEGO_WP_THRONE						= "OCC_BARONS_GREATHALL_THRONE";

	var int Calgor_Search;
	var int Wylfern_Search;
	var int Wylfern_Silver;
	var int Wylfern_Again;

	var int Cassian_BeatHudrych;
	var int Huldrych_Away;
	const int HULDRYCH_STOLENSILVER						= 100;

	var int Knows_Igaraz;
	var int Cassian_Info;
	var int Knows_Gods;

	var int Num_Arrows;
	var int Given_Arrows;
	const int Enough_Arrows								= 50;

	var int Bromor_ShadowHorn;
	var int Bromor_ShadowFur;

	var int Knows_Rassmuson;

	const string IGARAZ_WP								= "OCR_MAINGATE_SQUARE";

//---------------------------------------------------------------------
//	Diebes-Tutorial
//---------------------------------------------------------------------
	var int LearnSneak;

	var int LearnPicklock_1;
	var int LearnPicklock_2;

	var int LearnPickPocket_1;
	var int LearnPickPocket_2;

	var int LearnBow_1;
	var int LearnBow_2;

	var int Gerion_Dealer;
	const string GERION_WP								= "OCR_HUT_79";

//---------------------------------------------------------------------
//	Alchemie-Tutorial
//---------------------------------------------------------------------
	var int int_BookWritten;
	var int int_Talamon_CanIHelp;
	var int int_TalamonGetReceipe;
	var int int_TalamonRecipeForMoney;
	var int Talamon_ElexirDay;

//---------------------------------------------------------------------
//	Akrobatik-Tutorial
//---------------------------------------------------------------------
	const int Pyro_CostAcrobat							= 100;
	var int Pyro_KnowsPlaces;

//---------------------------------------------------------------------
//	Ruge der Rüstungsmacher
//---------------------------------------------------------------------
	var int int_RugaAngry;
	var int int_RugaCalm;
	var int int_PlayerKnows_RugaNoTrade;
	var int int_RugaWantsMeal;
	var int int_PlayerHasRugasMeal;

	var int Circle_1;
	var int Circle_2;
	var int Circle_3;

///////////////////////////////////////////////////////////////////////

	var int Sylvester_Sword;

//---------------------------------------------------------------------
//	Schmiede-Tutorial
//---------------------------------------------------------------------
	var int Gotmar_SCPossessed;
	var int Gotmar_TeachSmith;
	var int Gotmar_SCBetrayed;
	const int GOTMAR_FAVOR_ORE							= 40;									// VORSICHT: Steht noch an einigen Stellen im Gotmar-Dialog (nach "Brocken" suchen)
	var int Gotmar_LearnDay;
	const int GOTMAR_WAIT_LONGSWORD						= 1;
	const int GOTMAR_WAIT_BROADSWORD					= 2;
	const int GOTMAR_WAIT_BASTARDSWORD					= 3;
	var int Gotmar_AskedForLongsword;
	var int Gotmar_LearnLongsword;
	var int Gotmar_AskedForBroadsword;
	var int Gotmar_LearnBroadsword;
	var int Gotmar_LearnBastardsword;
	const int GOTMAR_ORE_LONGSWORD						= 80;
	var int Gotmar_GoliathReturned;
	const string GOTMAR_WP_FORGE						= "OCR_HUT_77";
	const string GOTMAR_WP_WAIT							= "OCR_HUT_77_STRAW";
	var int Gotmar_OldAttitude;

	var int Edo_IsDealer;
	var int Edo_CalledThief;
	const int EDO_STOLENORE								= 80;
	const string EDO_WP_SELL							= "OCR_HUT_47B";

	var int Sylvester_BuyPick;
	const int SYLVESTER_PRICEPICKAXE					= 20;
	var int Sylvester_Friend;
	var int Sylvester_Silver;
	var int Sylvester_LastOre;
	const int SYLVESTER_DAILYORE						= 10;
	var int Sylvester_Blackmailer;

///////////////////////////////////////////////////////////////////////

	var int Igaraz_Name;																		// Abfrage für eine Info,weil perm. Info nicht abfragbar M.F.
	var int Igaraz_Exit;																		// Abfrage einer perm. Info M.F.
	var int Militia_Answer;																		// Abfrage für Wachen Ambient Infos (6) M.F.
	var int Rank;																				// 0 == Spieler gehört nicht zur Miliz 1 == Spieler ist Rekrut 2 == Spieler ist Soldat 3 == Spieler ist Seargent 4 == Spieler ist Leutnant 5== Spieler ist Hauptmann
	const int Militia_FIRST								= 1;									// wenn Spieler die Bedingung (str 35 + 1hst1)für die erste Prüfung erfüllt= TRUE
	const int Militia_SECOND							= 2;									// Für Nachtwache
	const int Militia_THIRD								= 3;

	const int RANK_NONE									= 0;
	const int RANK_RECRUIT								= 1;
	const int RANK_SOLDIER								= 2;
	const int RANK_SERGEANT								= 3;
	const int RANK_LIEUTENANT							= 4;
	const int RANK_CAPTAIN								= 5;

	var int Starthour;																			// für Wache

	var int Gordian_Light;																		// Mission Gordian
	var int Gordian_Heal;																		// Mission Gordian
	var int Lighttime;																			// Gordian benötigt 2 Tage für die Kopie einer Lichtrolle
	var int Healtime;																			// Gordian braucht 2 Tage für eine Healscroll
	var int ScrollCopy_Wontwork;																// kopierte Scroll funzt nicht M.F.

	var int Jurgi_Crazy;																		// Dialoge der Besessenen M.F.
	var int Halbert_Crazy;
	var int Halbert_Night;
	var int Pos_Crazy;
	var int Paskara_Crazy;
	var int Gonker_Crazy;
	var int Bartok_Crazy;

	var int Beggars_Secrets;																	// für Bettler Geheimdienst Infos M.F.

	var int Nabor_10;																			// Abfrage für Deal mit Nabor 10 oder 20 Silberstücke M.F.
	var int Nabor_20;

	var int Lakarus_Hehler;

	var int Hero_KnowsRecipe;

//---------------------------------------------------------------------
//	Koch-Tutorial
//---------------------------------------------------------------------
	var int Snaf_DailyRagout;
	var int Snaf_RagoutDay;
	const int SNAF_BRIBE_SUM							= 10;
	var int Snaf_MilitiaBribed;
	var int Snaf_MilitiaFrightened;
	const int SNAF_NEW_CUSTOMERS						= 5;
	var int Snaf_CustomerQuestSolved;
	const string SNAF_WP_QUEUE1							= "OCR_OUTSIDE_HUT_30";
	const string SNAF_WP_QUEUE2							= "OCR_OUTSIDE_HUT_35";

	var int Halvor_BoughtMeatStew;
	var int Halvor_StewSalted;
	const string HALVOR_WP_COOKING						= "OCC_KITCHEN_02";
	const int HALVOR_COOKING_AREA						= 500;
	const string HALVOR_WP_OUTSIDE						= "OCC_OUTSIDE_KITCHEN";

//---------------------------------------------------------------------
//	Alchemie-Tutorial
//---------------------------------------------------------------------
	var int Talamon_KnowStinkingSalt;
	var int Talamon_BuyStinkingSalt;
	const int AGON_FORMULA_PRICE						= 500;									// VORSICHT: Steht auch an einigen Textstellen im Agon- und Talamon-Dialog
	var int Agon_BoughtFormula;
	var int Agon_Blackmailed;

//---------------------------------------------------------------------
//	Arenakampf
//---------------------------------------------------------------------
	const int ARENASTAND_H								= 6;
	const int ARENASTAND_M								= 0;
	const int ARENAPRE_H								= 18;
	const int ARENAPRE_M								= 0;
	const int ARENABEGIN_H								= 19;
	const int ARENABEGIN_M								= 0;
	const int ARENAEND_H								= 22;
	const int ARENAEND_M								= 0;

	var int Grim_HeroKnowsPrizeMoney;
	var int Grim_Challenged;
	const int GRIM_VICTORIES_START						= 0;
	const int GRIM_PRIZE_1								= 100;
	const int GRIM_PRIZE_2								= 200;
	const int GRIM_PRIZE_3								= 300;

	var int Goliath_Challenged;
	var int Goliath_PlayerLied;
	const int GOLIATH_VICTORIES_START					= 3;
	const int GOLIATH_PRIZE_1							= 200;
	const int GOLIATH_PRIZE_2							= 300;
	const int GOLIATH_PRIZE_3							= 400;

	var int Brutus_Challenged;
	var int Brutus_ChallengedBefore;
	var int Brutus_PlayerWonBefore;
	const int BRUTUS_VICTORIES_START					= 5;
	const int BRUTUS_PRIZE_1							= 300;
	const int BRUTUS_PRIZE_2							= 400;
	const int BRUTUS_PRIZE_3							= 500;

	var int Malgar_Challenged;
	var int Malgar_ChallengedBefore;
	var int Malgar_PlayerWonBefore;
	const int MALGAR_VICTORIES_START					= 8;
	const int MALGAR_PRIZE_1							= 400;
	const int MALGAR_PRIZE_2							= 600;
	const int MALGAR_PRIZE_3							= 800;

	var int Thora_Challenged;
	var int Thora_ChallengedBefore;
	var int Thora_PlayerWonBefore;
	const int THORA_VICTORIES_START						= 12;
	const int THORA_PRIZE_1								= 500;
	const int THORA_PRIZE_2								= 750;
	const int THORA_PRIZE_3								= 1000;

	const string THORA_WP_OUT							= "THORA_SPAWN";
	const int THORA_OUT_H								= 22;									// Zeitraum der Sternenguckerei vor dem Lager
	const int THORA_OUT_M								= 0;
	const int THORA_IN_H								= 5;
	const int THORA_IN_M								= 0;

	var int Arenamaster_Teased;
	var int Arenamaster_FirstDay;
	var int Arenamaster_Accepted;																// ist TRUE, wenn der Arenameister den SC als Gladiator angenommen hat
	var int Arenamaster_Failed;																	// ist TRUE, wenn der SC dem Angebot des Arenameisters eine Abfuhr erteilt hat
	var int Arenamaster_StartFight;																// wenn TRUE, wird der Kampferöffnungssatz vom Arenameister gesprochen
	var int Arenamaster_FinishFight;															// wenn TRUE, wird der Kampfschlußsatz vom Arenameister gesprochen
	var int Arenamaster_OldAttitude;
	const int ARENAMASTER_CALM_SILVER					= 500;									// "Bussgeld" dass nach Regelverletzung fällig ist!

	var int Arena_FirstChallenge;																// Log-Variable
	var int Arena_FirstVictory;																	// Log-Variable
	var int Arena_FirstRank4;																	// Log-Variable
	var int Arena_FirstRank3;																	// Log-Variable
	var int Arena_FirstRank2;																	// Log-Variable

	var int Arena_NpcFight;																		// ist TRUE, wenn durch B_Arena_SelectFight() ein NSC-NSC-Kampf angesetzt wurde
	var int Arena_NpcCombo;																		// Kombination der beiden NSCs für den nächsten Arenakampf (Konstanten AC_...)
	var int Arena_NpcComboLast;																	// Kombination des letzten Tages
	const int AC_NONE									= 0;
	const int AC_GRIM_GOLIATH							= 1;
	const int AC_GOLIATH_BRUTUS							= 2;
	const int AC_BRUTUS_MALGAR							= 3;
	const int AC_MALGAR_THORA							= 4;

	var int Arena_PlayerFight;																	// ist TRUE, wenn der Spieler sein Preisgeld abgegeben hat!
	var int Arena_PlayerHasCome;
	var int Arena_PlayerPrize;
	var int Arena_PlayerHasWonToday;
	var int Arena_PrizeBefore;
	var int Arena_PCRanking;
	var int Arena_LastPCRanking;

	var int Arena_FightSelected;																// ist TRUE, wenn B_Arena_SelectFight() für den heutigen Tag ausgeführt wurde
	var int Arena_FightDay;																		// Tag des letzten Arenakampfes (mit B_GetDay() ermittelt)
	var int Arena_FightRunning;																	// ist TRUE, wenn B_Arena_StartFight() für den heutigen Tag ausgeführt wurde
	var int Arena_SelectDay;																	// enthält den mit B_GetDay() ermittelten Tag, des letzten Angesetzten Kampfes
	var int Arena_AbortFight;

	const int AF_PLAYERSTOLEWEAPON						= 1;
	const int AF_PLAYERUSEDMAGIC						= 2;
	const int AF_PLAYERUSEDBOW							= 3;
	const int AF_PLAYERKILLED							= 4;
	const int ARENA_PROTECTION							= 50;
	const int ARENA_POINTSFORVICTORY					= 5;

	var int Arena_PlayerShirked;																// der Spieler hat sich vor dem letzen Arenakampf gedrückt!
	var int Arena_PlayerStoleWeapon;
	var int Arena_PlayerUsedMagic;
	var int Arena_PlayerUsedBow;
	var int Arena_PlayerKilled;
	var int Arena_PlayerBanned;

	const int ARENA_DIST_PRECHAMBER						= 400;
	const string ARENA_WP_LEFT_CHAMBER					= "OCR_ARENA_VWHEEL";
	const string ARENA_WP_RIGHT_CHAMBER					= "OCR_ARENABATTLE_ROOM_01";
	const string ARENA_WP_LEFT_START					= "OCR_ARENABATTLE_START_2";
	const string ARENA_WP_RIGHT_START					= "OCR_ARENABATTLE_START_1";
	const string ARENA_WP_CENTER						= "OCR_ARENABATTLE";
	const int ARENA_CENTER_AREA							= 750;									// Wenn der SC näher an die Arenamitte herankommt, motzen die NSC-Gladiatoren
	const string ARENA_WP_CHAMBERS						= "OCR_ARENABATTLE_INSIDE";
	const int ARENA_CHAMBERS_AREA						= 400;
	const string ARENA_WP_PREAREA						= "OCR_ARENABATTLE_OUTSIDE";
	const int ARENA_PREAREA_AREA						= 600;
	const string ARENA_WP_THRONE						= "OCR_ARENA_MASTER_1";
	const int ARENA_THRONE_AREA							= 250;

	var int Arena_GatesClosed;

//---------------------------------------------------------------------
//	Magie-Tutorial
//---------------------------------------------------------------------
	var int Lester_LearnRunemaking;
	var int Lester_GotThunderbolt;
	var int Lester_LastDay;
	var int Lester_LostThunderball;
	var int Lester_KnowBloodore;

//---------------------------------------------------------------------
//	Spur des Phoenix
//---------------------------------------------------------------------
	var int Phoenix_State;

//---------------------------------------------------------------------
//	Teleportziele
//---------------------------------------------------------------------
	const string TELEPORT1_WP							= "OCC_CHAPEL_UPSTAIRS";
	const string TELEPORT2_WP							= "NC_KDW_CAVE_CENTER";
	const string TELEPORT3_WP							= "DT_E2_12";
	const string TELEPORT4_WP							= "PATH_OC_NC_28";
	const string TELEPORT5_WP							= "PSI_TEMPLE_COURT_GURU";

////////////////////////////////////////////////////////////////////////
//	Diebstahlzähler für den Spieler
////////////////////////////////////////////////////////////////////////

	var int int_Theft_Gil_None;
	var int int_Theft_Gil_Militia;
	var int int_Theft_Gil_Worker;
	var int int_Theft_Gil_Miner;
	var int int_Theft_Gil_Healer;
	var int int_Theft_Gil_Thief;
	var int int_Theft_Gil_Possessed;
	var int int_Theft_Gil_Beggar;
	var int int_Theft_Gil_Demonic;
	var int int_Theft_Gil_Amazon;
	var int int_Theft_Gil_Paladin;
	var int int_Theft_Gil_kdf;
	var int int_Theft_Gil_BloodEarth;
	var int int_Theft_Gil_DemonHunter;
	var int int_Theft_Gil_Rsvd2;
	var int int_Theft_Gil_Rsvd3;

////////////////////////////////////////////////////////////////////////
//	Opfer_ids um Mord einem oder mehreren Opfern zuweisen zu können
////////////////////////////////////////////////////////////////////////

	var int int_Murderid1;
	var int int_Murderid2;
	var int int_Murderid3;

////////////////////////////////////////////////////////////////////////
//	Mordzähler
////////////////////////////////////////////////////////////////////////
	var int int_Murdercount;

////////////////////////////////////////////////////////////////////////
//	Ziel-Waypoints für TA_GuidePC
////////////////////////////////////////////////////////////////////////
	var string GuidePC_Destination;

////////////////////////////////////////////////////////////////////////
//	Kapitel 2 - BERGFESTUNG
////////////////////////////////////////////////////////////////////////

// Hauptstory-Plot
	const int HERO_LEVEL_CH2							= 5;									// Mindestlevel, dass der SC erreicht haben muss, um von Diego zur Bergfestung geschickt zu werden

// Weg zur Bergfestung mit Thora
	const string TOBF_SCAV								= "LOCATION_14_04";
	const string TOBF_DEMONSCAV							= "SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01";
	const string TOBF_RECCETOWER						= "MOVEMENT_OW_WARAN_OC_PSI_GOBBOCAVE_01";
	const string TOBF_OUTLOOK							= "PATH_TO_PLATEAU02";
	const string TOBF_OUTERGATE							= "VP_PLATEAU_2";
	const string TOBF_BRIDGE							= "BF_BRIDGE_01";
	const string TOBF_SQUARE							= "BF_PLATEAU_1";

// Waypoints für den Schmied TA
	const string WULFGAR_WP_SHARP						= "BF_ROOM3_SHARP";
	const string WULFGAR_WP_MELTER						= "BF_ROOM3_MELTER";
	const string WULFGAR_WP_COOL						= "BF_ROOM3_COOL";
	const string WULFGAR_WP_FIRE						= "BF_ROOM3_FIRE";
	const string WULFGAR_WP_ANVIL						= "BF_ROOM3_ANVIL";

// Feuermagier Freischaltaufträge
	var int Mage_Trust;																			// == Summe aller Boni die am Ende den Weg zum Thronsaal öffnet
	var int Morogh_Trust;
	var int Feoras_Trust;
	var int Nereus_Trust;

// Bestech-Flags
	var int BF_OuterGateBribable;
	const int BF_BRIBE_OUTERGATE						= 100;									// VORSICHT: Steckt auch noch in Dialogtexten in "DIA_PAL_1029_Osraed.D"
	var int BF_OuterGate_Bribed;
	var int BF_InnerGate_Bribable;
	var int BF_InnerGate_Attacked;
