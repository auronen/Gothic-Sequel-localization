// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************
	const string MOBNAME_BACKPACK_1						= "";
	const string MOBNAME_CRATE							= "Kiste";
	const string MOBNAME_CHEST							= "Truhe";
	const string MOBNAME_BED							= "Bett";
	const string MOBNAME_DOOR							= "Tür";
	const string MOBNAME_CAMP							= "";
	const string MOBNAME_TORCH							= "";
	const string MOBNAME_TORCHHOLDER					= "";
	const string MOBNAME_BARBQ_SCAV						= "";
	const string MOBNAME_BARRELO_OC						= "";
	const string MOBNAME_BENCH							= "";
	const string MOBNAME_ANVIL							= "Amboss";
	const string MOBNAME_BUCKET							= "Wassereimer";
	const string MOBNAME_FORGE							= "Schmiedefeuer";
	const string MOBNAME_GRINDSTONE						= "Schleifstein";
	const string MOBNAME_MELTER							= "Schmelzofen";
	const string MOBNAME_WHEEL							= "Winde";
	const string MOBNAME_LAB							= "Alchemietisch";
	const string MOBNAME_BOOK							= "Foliant";
	const string MOBNAME_CHAIR							= "";
	const string MOBNAME_CAULDRON						= "Kessel";
	const string MOBNAME_THRONE							= "";
	const string MOBNAME_PAN							= "Pfanne";
	const string MOBNAME_REPAIR							= "";
	const string MOBNAME_WATERPIPE						= "Wasserpfeife";
	const string MOBNAME_LADDER							= "Leiter";
	const string MOBNAME_SWITCH							= "Schalter";
	const string MOBNAME_LEVER							= "Hebel";
	const string MOBNAME_BARONSTHRONE					= "";
	const string MOBNAME_ORE							= "Erzader";
	const string MOBNAME_ROPEWAY						= "";
	const string MOBNAME_STOMPER						= "";
	const string MOBNAME_STONEMILL						= "";
	const string MOBNAME_ORC_MUMMY						= "Mumie";
	const string MOBNAME_PILLAR							= "Säule";
	const string MOBNAME_BASKET_RICE					= "";
	const string MOBNAME_DRUM							= "";
	const string MOBNAME_GROUND_SLOT					= "n/a";
	const string MOBNAME_HERB_PSI						= "Krautstampfer";
	const string MOBNAME_IDOL							= "Statuette";
	const string MOBNAME_LEAN_WALL						= "";
	const string MOBNAME_ORCDRUM						= "";
	const string MOBNAME_TARGETSTONE					= "Zielscheibe";
	const string MOBNAME_SHRINE							= "Orkischer Herzschrein";
	const string MOBNAME_SWORDSTONE						= "Sonderbarer Stein";
	const string MOBNAME_RUNEMELTER						= "Runenschmelzer";
	const string MOBNAME_RUNEMAKER						= "Runenkreisel";
	const string MOBNAME_PHOENIX9						= "!!! DIE WIDERAUFERSTEHUNG DES PHOENIX !!!";

// ********************************************************************************
//	Schemanamen für Mobsis
// ********************************************************************************
	const string SCEMENAME_LAB							= "LAB";
	const string SCEMENAME_BOW							= "BOGENMACHER";
	const string SCEMENAME_FLETCHER						= "SCHNITZER";
	const string SCEMENAME_ANVIL						= "BSANVIL";
	const string SCEMENAME_ARENABENCH					= "ARENABENCH";
	const string SCEMENAME_ARMORSTAND					= "ARMORSTAND";
	const string SCEMENAME_BED							= "BED";
	const string SCEMENAME_BEDHIGH						= "BEDHIGH";
	const string SCEMENAME_BEDLOW						= "BEDLOW";
	const string SCEMENAME_BOOK							= "BOOK";
	const string SCEMENAME_CAULDRON						= "CAULDRON";
	const string SCEMENAME_COOL							= "BSCOOL";
	const string SCEMENAME_FIRE							= "BSFIRE";
	const string SCEMENAME_MELTER						= "BSMELTER";
	const string SCEMENAME_ORE							= "ORE";
	const string SCEMENAME_RUNEMELTER					= "RMELTER";
	const string SCEMENAME_RUNEMAKER					= "RMAKER";
	const string SCEMENAME_SAW							= "BAUMSAEGE";
	const string SCEMENAME_SHARP						= "BSSHARP";
	const string SCEMENAME_STOMPER						= "STOMPER";
	const string SCEMENAME_STONE						= "STEINMETZ";
	const string SCEMENAME_WATERPIPE					= "SMOKE";
	const string SCEMENAME_WOOD							= "WOOD";
	const string SCEMENAME_REPAIR						= "REPAIR";
	const string SCEMENAME_BENCH						= "BENCH";
	const string SCEMENAME_HERB							= "HERB";
	const string SCEMENAME_PAN							= "PAN";

// *****************************************************************************************
// Gildennamen
// *****************************************************************************************
const string TXT_GUILDS[GIL_MAX] = {
	// - Charakterblatt (Text der Spielergilde)
	// - Debuganzeige (Taste "G")
	"(keine)",
	"Milizsoldat",
	"Arbeiter",
	"Minenarbeiter",
	"Medikus",
	"Dieb",
	"Aussätziger",
	"Bettler",
	"Dämonenanbeter",
	"Amazone",
	"Paladin",																					// 10
	"Sturmjäger-Klan",
	"Bluterde-Klan",
	"Dämonenjäger",
	"",
	"",
	"",
	"Waran",																					// 17
	"",
	"Goblin",
	"Troll",
	"Snapper",
	"Minecrawler",
	"Fleischwanze",
	"Scavenger",
	"Dämon",
	"Wolf",
	"Schattenläufer",
	"Bloodfly",
	"Sumpfhai",																					// 30
	"Zombie",
	"Zombie	Orc",
	"Skelett",
	"Ork-Hund",
	"Molerat",
	"Golem",
	"Lurker",
	"",																							// 38
	"Orc Schamane",
	"Orc Krieger",
	"Orc Späher",
	"Orc Sklave"
};

// *****************************************************************************************
// Zauberspruchnamen
// *****************************************************************************************
// Die im TXT_SPELLS[]-Array angegebenen Namen für die Zauber werden ausschliesslich vom
// Programmcode verwendet. Für die Verwendung im Skript, folgt diesem Array eine Reihe
// von einzelnen String-Konstanten, mit gleichem Inhalt:
// -----------------------------------------------------------------------------------------
// WICHTIG: Wird in diesem Array eine Änderung vorgenommen, so muss diese Änderung auch
//			in der entsprechenden Stringkonstante NAMA_<Zaubername> erfolgen
// -----------------------------------------------------------------------------------------
const string TXT_SPELLS[MAX_SPELL] = {
	"Licht",																					// SPL_LIGHT		= 0;
	"Feuerball",																				// SPL_FIREBALL		= 1;
	"n/a",																						// SPL_TRANSFORM	= 2;
	"Angst",																					// SPL_FEAR			= 3;
	"Heilung",																					// SPL_HEAL			= 4;
	"n/a",																						// SPL_LIGHTNING	= 5;
	"Dämon beschwören",																			// SPL_SUMMONDEMON	= 6;
	"Skelette beschwören",																		// SPL_SUMMONSKELETON= 7;
	"n/a",																						// SPL_FORGET		= 8;
	"Windfaust",																				// SPL_WINDFIST		= 9;
	"Telekinese",																				// SPL_TELEKINESIS	= 10;
	"Charme",																					// SPL_CHARM		= 11;
	"Schlaf",																					// SPL_SLEEP		= 12;
	"Pyrokinese",																				// SPL_PYROKINESIS	= 13;
	"Todesring",																				// SPL_MASSDEATH	= 14;
	"Kontrolle",																				// SPL_CONTROL		= 15;
	"Untote vernichten",																		// SPL_DESTROYUNDEAD= 16;
	"Feuerpfeil",																				// SPL_FIREBOLT		= 17;
	"Feuersturm",																				// SPL_FIRESTORM	= 18;
	"Feuerregen",																				// SPL_FIRERAIN		= 19;
	"n/a",																						// SPL_SPEED		= 20;
	"merkwürdiger Teleportzauber",																// SPL_TELEPORT1	= 21;
	"Teleport Wassermagier",																	// SPL_TELEPORT2	= 22;
	"Teleport Dämonenbeschwörer",																// SPL_TELEPORT3	= 23;
	"Teleport Lager",																			// SPL_TELEPORT4	= 24;
	"Teleport Sumpflager",																		// SPL_TELEPORT5	= 25;
	"Verwandlung Blutfliege",																	// SPL_TRF_BLOODFLY	= 26;
	"n/a",																						// SPL_TRF_BLOODHOUND= 27;
	"Verwandlung Minecrawler",																	// SPL_TRF_CRAWLER	= 28;
	"Verwandlung Lurker",																		// SPL_TRF_LURKER	= 29;
	"Verwandlung Fleischwanze",																	// SPL_TRF_MEATBUG	= 30;
	"Verwandlung Molerat",																		// SPL_TRF_MOLERAT	= 31;
	"Verwandlung Orc-Hund",																		// SPL_TRF_ORCDOG	= 32;
	"n/a",																						// SPL_TRF_RAZOR	= 33;
	"Verwandlung Scavenger",																	// SPL_TRF_SCAVENGER= 34;
	"n/a",																						// SPL_TRF_SCAVENGER2= 35;
	"Verwandlung Schattenläufer",																// SPL_TRF_SHADOWBEAST= 36;
	"Verwandlung Snapper",																		// SPL_TRF_SNAPPER	= 37;
	"Verwandlung Waran",																		// SPL_TRF_WARAN	= 38;
	"Verwandlung Wolf",																			// SPL_TRF_WOLF		= 39;
	"Blitz",																					// SPL_CHAINLIGHTNING= 40;
	"Eispfeil",																					// SPL_THUNDERBOLT	= 41;
	"Kugelblitz",																				// SPL_THUNDERBALL	= 42;
	"Eisblock",																					// SPL_ICECUBE		= 43;
	"Eiswelle",																					// SPL_ICEWAVE		= 44;
	"Golem beschwören",																			// SPL_SUMMONGOLEM	= 45;
	"Armee der Finsternis",																		// SPL_ARMYOFDARKNESS= 46;
	"Sturmfaust",																				// SPL_STORMFIST	= 47;
	"n/a",																						// SPL_TELEKINESIS2	= 48;
	"Todeshauch",																				// SPL_BREATHOFDEATH= 49;
	"Schrumpfen",																				// SPL_SHRINK		= 50;
	"n/a",																						// SPL_UNDRESS		= 51;
	"n/a",																						// SPL_DANCE		= 52;
	"Raserei",																					// SPL_BERZERK		= 53;
	"Zorn des URIZIEL",																			// SPL_NEW1			= 17;
	"New2",																						// SPL_NEW2			= 18;
	"New3",																						// SPL_NEW3			= 19;
	"New4",																						// SPL_NEW4			= 20;
	"New5"																						// SPL_NEW5			= 21;
};

// -----------------------------------------------------------------------------------------
// WORKAROUND:	Da im Skript der Ausdruck TXT_SPELLS[SPL_LIGHT] nicht zulässig ist
//				und in einem konstanten String-Array keine String-Konstanten verwendet
//				werden können, müssen alle Namen der Zauber hier ein zweites Mal
//				angegeben werden!
// -----------------------------------------------------------------------------------------
	const string NAME_Light								= "Licht";								// SPL_LIGHT		= 0;
	const string NAME_Fireball							= "Feuerball";							// SPL_FIREBALL		= 1;
	const string NAME_Transform							= "n/a";								// SPL_TRANSFORM	= 2;
	const string NAME_Fear								= "Angst";								// SPL_FEAR			= 3;
	const string NAME_Heal								= "Heilung";							// SPL_HEAL			= 4;
	const string NAME_Lightning							= "n/a";								// SPL_LIGHTNING	= 5;
	const string NAME_Summondemon						= "Dämon beschwören";					// SPL_SUMMONDEMON	= 6;
	const string NAME_Summonskeleton					= "Skelette beschwören";				// SPL_SUMMONSKELETON= 7;
	const string NAME_Forget							= "n/a";								// SPL_FORGET		= 8;
	const string NAME_Windfist							= "Windfaust";							// SPL_WINDFIST		= 9;
	const string NAME_Telekinesis						= "Telekinese";							// SPL_TELEKINESIS	= 10;
	const string NAME_Charm								= "Charme";								// SPL_CHARM		= 11;
	const string NAME_Sleep								= "Schlaf";								// SPL_SLEEP		= 12;
	const string NAME_Pyrokinesis						= "Pyrokinese";							// SPL_PYROKINESIS	= 13;
	const string NAME_Massdeath							= "Todesring";							// SPL_MASSDEATH	= 14;
	const string NAME_Control							= "Kontrolle";							// SPL_CONTROL		= 15;
	const string NAME_Destroyundead						= "Untote vernichten";					// SPL_DESTROYUNDEAD= 16;
	const string NAME_Firebolt							= "Feuerpfeil";							// SPL_FIREBOLT		= 17;
	const string NAME_Firestorm							= "Feuersturm";							// SPL_FIRESTORM	= 18;
	const string NAME_Firerain							= "Feuerregen";							// SPL_FIRERAIN		= 19;
	const string NAME_Speed								= "n/a";								// SPL_SPEED		= 20;
	const string NAME_Teleport1							= "merkwürdiger Teleportzauber";		// SPL_TELEPORT1	= 21;
	const string NAME_Teleport2							= "Teleport Wassermagier";				// SPL_TELEPORT2	= 22;
	const string NAME_Teleport3							= "Teleport Xardas";					// SPL_TELEPORT3	= 23;
	const string NAME_Teleport4							= "Teleport Altes Lager";				// SPL_TELEPORT4	= 24;
	const string NAME_Teleport5							= "Teleport Sumpflager";				// SPL_TELEPORT5	= 25;
	const string NAME_Trf_Bloodfly						= "Verwandlung Blutfliege";				// SPL_TRF_BLOODFLY	= 26;
	const string NAME_Trf_Bloodhound					= "n/a";								// SPL_TRF_BLOODHOUND= 27;
	const string NAME_Trf_Crawler						= "Verwandlung Minecrawler";			// SPL_TRF_CRAWLER	= 28;
	const string NAME_Trf_Lurker						= "Verwandlung Lurker";					// SPL_TRF_LURKER	= 29;
	const string NAME_Trf_Meatbug						= "Verwandlung Fleischwanze";			// SPL_TRF_MEATBUG	= 30;
	const string NAME_Trf_Molerat						= "Verwandlung Molerat";				// SPL_TRF_MOLERAT	= 31;
	const string NAME_Trf_Orcdog						= "Verwandlung Orc-Hund";				// SPL_TRF_ORCDOG	= 32;
	const string NAME_Trf_Razor							= "n/a";								// SPL_TRF_RAZOR	= 33;
	const string NAME_Trf_Scavenger						= "Verwandlung Scavenger";				// SPL_TRF_SCAVENGER= 34;
	const string NAME_Trf_Scavenger2					= "n/a";								// SPL_TRF_SCAVENGER2= 35;
	const string NAME_Trf_Shadowbeast					= "Verwandlung Schattenläufer";			// SPL_TRF_SHADOWBEAST= 36;
	const string NAME_Trf_Snapper						= "Verwandlung Snapper";				// SPL_TRF_SNAPPER	= 37;
	const string NAME_Trf_Waran							= "Verwandlung Waran";					// SPL_TRF_WARAN	= 38;
	const string NAME_Trf_Wolf							= "Verwandlung Wolf";					// SPL_TRF_WOLF		= 39;
	const string NAME_Chainlightning					= "Blitz";								// SPL_CHAINLIGHTNING= 40;
	const string NAME_Thunderbolt						= "Eispfeil";							// SPL_THUNDERBOLT	= 41;
	const string NAME_Thunderball						= "Kugelblitz";							// SPL_THUNDERBALL	= 42;
	const string NAME_Icecube							= "Eisblock";							// SPL_ICECUBE		= 43;
	const string NAME_Icewave							= "Eiswelle";							// SPL_ICEWAVE		= 44;
	const string NAME_Summongolem						= "Golem beschwören";					// SPL_SUMMONGOLEM	= 45;
	const string NAME_Armyofdarkness					= "Armee der Finsternis";				// SPL_ARMYOFDARKNESS= 46;
	const string NAME_Stormfist							= "Sturmfaust";							// SPL_STORMFIST	= 47;
	const string NAME_Telekinesis2						= "n/a";								// SPL_TELEKINESIS2	= 48;
	const string NAME_Breathofdeath						= "Todeshauch";							// SPL_BREATHOFDEATH= 49;
	const string NAME_Shrink							= "Schrumpfen";							// SPL_SHRINK		= 50;
	const string NAME_Undress							= "n/a";								// SPL_UNDRESS		= 51;
	const string NAME_Dance								= "n/a";								// SPL_DANCE		= 52;
	const string NAME_Berzerk							= "Raserei";							// SPL_BERZERK		= 53;
	const string NAME_New1								= "Zorn des URIZIEL";					// SPL_NEW1			= 17;
	const string NAME_New2								= "New2";								// SPL_NEW2			= 18;
	const string NAME_New3								= "New3";								// SPL_NEW3			= 19;
	const string NAME_New4								= "New4";								// SPL_NEW4			= 20;
	const string NAME_New5								= "New5";								// SPL_NEW5			= 21;

// *****************************************************************************************
// Kampf-Talente
// *****************************************************************************************
const string TXT_TALENTS[NPC_TALENT_MAX] = {
	"",
	"Einhänder",																				// NPC_TALENT_1H
	"Zweihänder",																				// NPC_TALENT_2H
	"Kampfstab",																				// NPC_TALENT_STAFF
	"Bogen",																					// NPC_TALENT_BOW
	"Armbrust",																					// NPC_TALENT_CROSSBOW
	"Schloss knacken",																			// NPC_TALENT_PICKLOCK
	"Diebstahl",																				// NPC_TALENT_PICKPOCKET
	"Zaubern",																					// NPC_TALENT_MAGE
	"Schleichen",																				// NPC_TALENT_SNEAK
	"Schmieden",																				// NPC_TALENT_SMITH
	"Kochen",																					// NPC_TALENT_COOK
	"Akrobatik",																				// NPC_TALENT_ACROBAT
	"Runen erschaffen",																			// NPC_TALENT_THAUMATURGY
	"Bognerei",																					// NPC_TALENT_BOWMAKER
	"Alchemie",																					// NPC_TALENT_ALCHEMY
	"Tiere zähmen",																				// NPC_TALENT_ANIMALTAMING
	"UserDef5",
	"UserDef6",
	"UserDef7",
	"UserDef8",
	"UserDef9",
	"UserDef10"
};

const string TXT_TALENTS_SKILLS[NPC_TALENT_MAX] = {
	"",
	"ungeübt|ausgebildet|gemeistert",															// NPC_TALENT_1H
	"ungeübt|ausgebildet|gemeistert",															// NPC_TALENT_2H
	"ungeübt|ausgebildet|gemeistert",															// NPC_TALENT_STAFF
	"ungeübt|ausgebildet|gemeistert",															// NPC_TALENT_BOW
	"ungeübt|ausgebildet|gemeistert",															// NPC_TALENT_CROSSBOW
	"ungeübt|ausgebildet|gemeistert",															// NPC_TALENT_PICKLOCK
	"ungeübt|ausgebildet|gemeistert",															// NPC_TALENT_PICKPOCKET
	"-|1.Kreis|2.Kreis|3.Kreis|4.Kreis|5.Kreis|6.Kreis",										// NPC_TALENT_MAGE
	"-|ausgebildet",																			// NPC_TALENT_SNEAK
	"-|normales Erz|Bluterz|Dunkelerz",															// NPC_TALENT_SMITH
	"-|Lehrling|Geselle|Meister",																// NPC_TALENT_COOK
	"-|ausgebildet",																			// NPC_TALENT_ACROBAT
	"-|Lehrling|Geselle|Meister",																// NPC_TALENT_THAUMATURGY
	"-|Lehrling|Geselle|Meister",																// NPC_TALENT_BOWMAKER
	"-|Lehrling|Geselle|Meister",																// NPC_TALENT_ALCHEMY
	"-|Lehrling|Geselle|Meister",																// NPC_TALENT_ANIMALTAMING
	"UserDef5",
	"UserDef6",
	"UserDef7",
	"UserDef8",
	"UserDef9",
	"UserDef10"
};

// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************
const string TXT_INV_CAT[INV_CAT_MAX] = {
	"",
	"Waffen",
	"Rüstungen",
	"Magie",
	"Artefakte",
	"Nahrung",
	"Tränke",
	"Schriften",
	"Verschiedenes"
};

// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************
	const string NAME_Militia							= "Milizsoldat";
	const string NAME_Worker							= "Arbeiter";
	const string NAME_Miner								= "Minenarbeiter";
	const string NAME_Thief								= "Herumtreiber";
	const string NAME_Healer							= "Medikus";
	const string NAME_Possessed							= "Aussätziger";
	const string NAME_Beggar							= "Bettler";
	const string NAME_Demonic							= "Dämonenanbeter";
	const string NAME_Torwache							= "Torwache";
	const string NAME_Brueckenwache						= "Brückenwache";
	const string NAME_Schuetze							= "Armbrustschütze";
	const string NAME_Amazon							= "Amazone";
	const string NAME_Paladin							= "Wache";
	const string Name_Auxiliary							= "Soldat der Hilfstruppen";
	const string NAME_KDF								= "Feuermagier";
	const string NAME_Bloodearth						= "Bluterde-Klan";
	const string NAME_Demonhunter						= "Dämonenjäger";
	const string NAME_Trader							= "Händler";

// *************************************************************
// DIALOG OPTIONEN
// *************************************************************
	const string DIALOG_ENDE							= "ENDE";
	const string DIALOG_BACK							= "ZURÜCK";
	const string DIALOG_TRADE							= "(Tauschen)";
	const string PD_TRUE								= "...TRUE";
	const string PD_FALSE								= "...FALSE";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************
	const string NAME_Ring								= "Ring";
	const string NAME_Amulett							= "Amulett";
	const string NAME_Trank								= "Trank";
	const string NAME_Rune								= "Rune";
	const string NAME_Spruchrolle						= "Spruchrolle";

// *************************************************************
// TEXTE FÜR ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************
	const string NAME_Value								= "Wert:";

	const string NAME_Mag_Circle						= "Kreis:";
	const string NAME_Manakosten						= "Manakosten:";
	const string NAME_ManakostenMax						= "Manakosten (max.):";
	const string NAME_ManaPerSec						= "Mana pro Sec.";
	const string NAME_Duration							= "Dauer (Minuten)";

	const string NAME_Mana_needed						= "benötigtes Mana:";
	const string NAME_Str_needed						= "benötigte Stärke:";
	const string NAME_Dex_needed						= "benötigte Geschicklichkeit:";

	const string NAME_Spell_Load						= "Aufladbarer Zauber";
	const string NAME_Spell_Invest						= "Aufrechterhaltungs-Zauber";

	const string NAME_Dam_Edge							= "Waffenschaden";
	const string NAME_Dam_Point							= "Pfeilschaden";
	const string NAME_Dam_Fire							= "Feuerschaden";
	const string NAME_Dam_Magic							= "Magieschaden";
	const string NAME_Dam_Fly							= "Wirbelschaden";

	const string NAME_Bonus_Edge						= "Rüstschutzbonus Waffen";
	const string NAME_Bonus_Point						= "Rüstschutzbonus Pfeil";
	const string NAME_Bonus_Fire						= "Rüstschutzbonus Feuer";
	const string NAME_Bonus_Magic						= "Rüstschutzbonus Magie";

	const string NAME_Damage							= "Schaden";
	const string NAME_PerMana							= " (pro Mana)";
	const string NAME_DamagePerSec						= "Schaden pro Sec.";

	const string NAME_Prot_Edge							= "Schutz vor Waffen:";
	const string NAME_Prot_Point						= "Schutz vor Pfeilen:";
	const string NAME_Prot_Fire							= "Schutz vor Feuer:";
	const string NAME_Prot_Magic						= "Schutz vor Magie:";

	const string NAME_Bonus_HP							= "Lebensenergie-Bonus:";
	const string NAME_Bonus_Mana						= "Mana-Bonus:";

	const string NAME_Bonus_HpMax						= "Bonus für maximale Lebensenergie:";
	const string NAME_Bonus_ManaMax						= "Bonus für maximales Mana:";

	const string NAME_Bonus_Dex							= "Geschicklichkeits-Bonus:";
	const string NAME_Bonus_Str							= "Stärke-Bonus:";

	const string NAME_TypeOneHanded						= "Waffentyp: Einhänder";
	const string NAME_TypeTwoHanded						= "Waffentyp: Zweihänder";
	const string NAME_TypeStaff							= "Waffentyp: Kampfstab";
	const string NAME_TypeBow							= "Waffentyp: Bogen";
	const string NAME_TypeCrossbow						= "Waffentyp: Armbrust";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
	const string NAME_XPGained							= "Erfahrung + ";						// bei jedem Erfahrungsgewinn
	const string NAME_LevelUp							= "Stufe gestiegen!";					// beim Stufenaufstieg

	const string NAME_LPGained							= "Lernpunkte + ";						// bei jedem Erfahrungsgewinn

	const string NAME_NewLogEntry						= "neuer Tagebucheintrag";

	const string PRINT_LEARN_Onehanded					= "Lerne: Kampf mit Einhandwaffen";
	const string PRINT_LEARN_Twohanded					= "Lerne: Kampf mit Zweihandwaffen";
	const string PRINT_LEARN_Staff						= "Lerne: Kampf mit Stabwaffe";
	const string PRINT_LEARN_Bow						= "Lerne: Bogenschießen";
	const string PRINT_LEARN_Crossbow					= "Lerne: Armbrustschießen";
	const string PRINT_LEARN_Locks						= "Lerne: Schlösser knacken";
	const string PRINT_IMPROVE_Locks					= "Steigere: Schlösser knacken";
	const string PRINT_LEARN_PickPocket					= "Lerne: Taschendiebstahl";
	const string PRINT_IMPROVE_PickPocket				= "Steigere: Taschendiebstahl";
	const string PRINT_LEARN_MagicCircle				= "Lerne: Nächster Kreis der Magie";
	const string PRINT_LEARN_Acrobatics					= "Lerne: Akrobatik";
	const string PRINT_LEARN_Sneak						= "Lerne: Schleichen";

	const string PRINT_LEARN_Smithing					= "Lerne: Schmieden";
	const string PRINT_IMPROVE_Smithing					= "Steigere: Schmieden";
	const string PRINT_LEARN_Cooking					= "Lerne: Kochen";
	const string PRINT_IMPROVE_Cooking					= "Steigere: Kochen";
	const string PRINT_LEARN_Alchemy					= "Lerne: Alchemie";
	const string PRINT_IMPROVE_Alchemy					= "Steigere: Alchemie";
	const string PRINT_LEARN_Runes						= "Lerne: Runen erschaffen";
	const string PRINT_IMPROVE_Runes					= "Steigere: Runen erschaffen";
	const string PRINT_LEARN_BowMaking					= "Lerne: Bogenmachen";
	const string PRINT_IMPROVE_BowMaking				= "Steigere: Bogenmachen";

	const string PRINT_LEARN_Stinger					= "Lerne: Stachel entfernen";
	const string PRINT_LEARN_Teeth						= "Lerne: Zähne nehmen";
	const string PRINT_LEARN_Fur						= "Lerne: Fell abziehen";
	const string PRINT_LEARN_Claws						= "Lerne: Krallen abziehen";
	const string PRINT_LEARN_Skin						= "Lerne: Echsen häuten";
	const string PRINT_LEARN_CrawlerPlates				= "Lerne: Panzerplatten herausschneiden";
	const string PRINT_LEARN_CrawlerMandibles1			= "Lerne: Minecrawlerzangen nehmen";
	const string PRINT_LEARN_CrawlerMandibles2			= "Lerne: Minecrawlerzangen rausschneiden";
	const string PRINT_LEARN_Regen						= "Steigere Regenerationsrate";

// ***************************************************************************************
// Waffennamen
// ***************************************************************************************
	const string NAME_Club								= "Keule";
	const string NAME_Poker								= "Schürhaken";
	const string NAME_Sickle							= "Sichel";
	const string NAME_Pickaxe							= "Spitzhacke";
	const string NAME_Sledgehammer						= "Schmiedehammer";
	const string NAME_Scythe							= "Sense";

	const string NAME_Shortsword						= "Kurzschwert";
	const string NAME_Longsword							= "Langschwert";
	const string NAME_Broadsword						= "Breitschwert";
	const string NAME_Bastardsword						= "Bastardschwert";
	const string NAME_2HSword							= "Zweihänder";
	const string NAME_OrcSword							= "Krush Varrok";
	const string NAME_Hatchet							= "Beil";
	const string NAME_Battleaxe							= "Streitaxt";
	const string NAME_DoublebladedAxe					= "Doppelblattaxt";
	const string NAME_BerserkAxe						= "Berserkeraxt";
	const string NAME_OrcAxe							= "Krush BrokDar";
	const string NAME_IronClub							= "Eisenkeule";
	const string NAME_Mace								= "Streitkolben";
	const string NAME_Morningstar						= "Morgenstern";
	const string NAME_Warhammer							= "Kriegshammer";
	const string NAME_OrcHammer							= "Krush Karrok";

	const string NAME_Battlestaff						= "Kampfstab";

	const string NAME_MilitiaSword						= "Milizschwert";
	const string NAME_PaladinSword						= "Paladinschwert";
	const string NAME_DemonhunterAxe					= "Dämonenjäger-Axt";
	const string NAME_AuxiliaryMace						= "Streitkolben der Hilfstruppen";

//////////////////////////////////////////////////////////////////////////////////////////
// Nahrungsnamen
//////////////////////////////////////////////////////////////////////////////////////////
	const string NAME_Apple								= "Apfel";
	const string NAME_Grapes							= "Weintrauben";
	const string NAME_Loaf								= "Brot";
	const string NAME_Mutton							= "gebratenes Fleisch";
	const string NAME_MuttonRaw							= "rohes Fleisch";
	const string NAME_Ham								= "Schinken";
	const string NAME_Cheese							= "Käse";
	const string NAME_Soup								= "Wurzelsuppe";
	const string NAME_MeatBugRagout						= "Fleischwanzenragout";
	const string NAME_CrawlerSoup						= "Minecrawlersuppe";
	const string NAME_Beer								= "Bier";
	const string NAME_Wine								= "Wein";
	const string NAME_Booze								= "Reisschnaps";

//////////////////////////////////////////////////////////////////////////////////////////
// Animaltrophis
//////////////////////////////////////////////////////////////////////////////////////////
	const string NAME_MeatBug							= "Wanzenfleisch";
	const string NAME_MoleratGrease						= "Moleratfett";
	const string NAME_Teeth								= "Zähne";
	const string NAME_WolfFur							= "Wolfsfell";
	const string NAME_OrkDogFur							= "Orkhundfell";
	const string NAME_WaranTongue						= "Flammenzunge";
	const string NAME_Claws								= "Krallen";
	const string NAME_CrawlerPlates						= "Panzerplatte";
	const string NAME_CrawlerMandibles					= "Crawlerzangen";
	const string NAME_ShadowFur							= "Fell";
	const string NAME_ShadowHorn						= "Horn";
	const string NAME_LurkerClaw						= "Lurkerklaue";
	const string NAME_LurkerSkin						= "Lurkerhaut";
	const string NAME_TrollTeeth						= "Trollhauer";
	const string NAME_TrollFur							= "Trollfell";
	const string NAME_SwampsharkSkin					= "Sumpfhaihaut";
	const string NAME_SwampsharkTeeth					= "Sumpfhaizähne";
	const string NAME_BloodflyWings						= "Flügel";
	const string NAME_BloodflySting						= "Blutfliegenstachel";
	const string NAME_DemonSting						= "dämonischer Stachel";
	const string NAME_StonegolemHeart					= "Herz eines Steingolems";
	const string NAME_FiregolemHeart					= "Herz eines Feuergolems";
	const string NAME_IcegolemHeart						= "Herz eines Eisgolems";
	const string NAME_IcegolemPiece						= "Stück eines Eisgolems";

//////////////////////////////////////////////////////////////////////////////////////////
// Rüstungen
//////////////////////////////////////////////////////////////////////////////////////////
	const string NAME_ArmorKing							= "King_Armor";
	const string NAME_HeavyArmorDemonhunter				= "schwere Demonhunterrüstung";
	const string NAME_MediumArmorDemonhunter			= "mittlere Demonhunterrüstung";
	const string NAME_LightArmorDemonhunter				= "leichte Demonhunterrüstung";
	const string NAME_HeavyArmorDemonhunter2			= "schwere Demonhunterrüstung2";
	const string NAME_MediumArmorDemonhunter2			= "mittlere Demonhunterrüstung2";
	const string NAME_HeavyArmorPaladin					= "schwere Paladinrüstung";
	const string NAME_MediumArmorPaladin				= "mittlere Paladinrüstung";
	const string NAME_LightArmorPaladin					= "leichte Paladinrüstung";
	const string NAME_HighArmorHealer					= "Schweres Heilergewand";
	const string NAME_MediumArmorHealer					= "Heilergewand";
	const string NAME_ArmorDemonfollower				= "Dämonenanbeter-Gewand";
	const string NAME_ArmorBeggar						= "Bettler-Lumpen";
	const string NAME_ArmorVLk_L						= "Leichte Buddlerhose";
	const string NAME_ArmorVLk_M						= "Buddlerhose";
	const string NAME_ArmorSFB_L						= "Schürferklamotten";

//////////////////////////////////////////////////////////////////////////////////////////
// Misc
//////////////////////////////////////////////////////////////////////////////////////////
	const string NAME_Lockpick							= "Dietrich";
	const string NAME_Key								= "Schlüssel";
	const string NAME_Stomper							= "Krautstampfer";
	const string NAME_Hammer							= "Hammer";
	const string NAME_Scoop								= "Kochlöffel";
	const string NAME_LabFlask							= "Laborflasche";
	const string NAME_TorchFirespit						= "Fackel";
	const string NAME_Lute								= "Laute";
	const string NAME_Whisk								= "Palm wedel";
	const string NAME_Brush								= "Bürste";
	const string NAME_Joint1							= "Grüner Novize";
	const string NAME_Joint2							= "Schwarzer Weiser";
	const string NAME_Joint3							= "Traumruf";
	const string NAME_Torch								= "Fackel";
	const string NAME_BurningTorch						= "Brennende Fackel";
	const string NAME_TorchBurned						= "Fackel";
	const string NAME_Swampweed							= "Sumpfkraut";
	const string NAME_Sulphur							= "Schwefel";
	const string NAME_Quicksilver						= "Quecksilber";
	const string NAME_Salt								= "Salz";
	const string NAME_SyrianOil							= "Syrianisches Öl";
	const string NAME_Alcohol							= "Reiner Alkohol";
	const string NAME_FakeScroll						= "Brief";
	const string NAME_AlarmHorn							= "Horn";
	const string NAME_WorldMap							= "Karte der Kolonie";
	const string NAME_StinkingSalt						= "Müffelsalz";

//////////////////////////////////////////////////////////////////////////////////////////
// Ranged Weapons
//////////////////////////////////////////////////////////////////////////////////////////
	const string NAME_ShortBow							= "Kurzbogen";
	const string NAME_RiderBow							= "Reiterbogen";
	const string NAME_FieldBow							= "Feldbogen";
	const string NAME_HuntingBow						= "Jagdbogen";
	const string NAME_LongBow							= "Langbogen";
	const string NAME_HedgeBow							= "Heckenbogen";
	const string NAME_YewBow							= "Eibenbogen";
	const string NAME_ArmyBow							= "Armeebogen";
	const string NAME_WarBow							= "Kriegsbogen";
	const string NAME_StormBow							= "Sturmbogen";

	const string NAME_LightCrossBow						= "Leichte Armbrust";
	const string NAME_CrossBow							= "Armbrust";
	const string NAME_HeavyCrossBow						= "Schwere Armbrust";
	const string NAME_WarCrossBow						= "Kriegs-Armbrust";

	const string NAME_Arrow								= "Pfeil";
	const string NAME_Bolt								= "Bolzen";

	const string NAME_WolfBow							= "Wolfsfetzer";
	const string NAME_WindBreaker						= "Windbrecher";
	const string NAME_Nimrod							= "Nimroder";
	const string NAME_OrkHunter							= "Orkhetzer";
	const string NAME_DemonBow							= "Dämonenbogen";
	const string NAME_DeathBringer						= "Todbringer";

// ***************************************************************************************
// Schmiedematerialien & Zwischenprodukte
// ***************************************************************************************
	const string NAME_Nugget							= "Erz";
	const string NAME_BloodNugget						= "Bluterz";
	const string NAME_DarkNugget						= "Dunkelerz";

	const string NAME_RawIron							= "Roheisen";
	const string NAME_RawLongIron						= "Lang-Roheisen";
	const string NAME_HotIron							= "glühendes Roheisen";
	const string NAME_HotLongIron						= "glühendes Lang-Roheisen";

	const string NAME_HotSwordBlade						= "glühende Schwertklinge";
	const string NAME_HotAxeBlade						= "glühende Axtblatt";
	const string NAME_HotStump							= "glühender Waffenstumpf";
	const string NAME_Hot2HSwordBlade					= "glühende 2H-Schwertklinge";
	const string NAME_Hot2HAxeBlade						= "glühende 2H-Axtblatt";
	const string NAME_Hot2HStump						= "glühender 2H-Waffenstumpf";

	const string NAME_SwordBlade						= "Schwertklinge";
	const string NAME_AxeBlade							= "Axtblatt";
	const string NAME_Stump								= "Waffenstumpf";
	const string NAME_2HSwordBlade						= "2H-Schwertklinge";
	const string NAME_2HAxeBlade						= "2H-Axtblatt";
	const string NAME_2HStump							= "2H-Waffenstumpf";

	const string NAME_Ore								= "";
	const string NAME_BloodOre							= " aus Bluterz";
	const string NAME_DarkOre							= " aus Dunkelerz";

	const string NAME_Smith_Melter						= " einschmelzen";
	const string NAME_Smith_Fire						= " erhitzen";
	const string NAME_Smith_Anvil						= " schmieden";
	const string NAME_Smith_Cool						= " abkühlen";
	const string NAME_Smith_Sharp						= " schleifen";

	const string NAME_Smith_Ore_Done					= " geschürft";
	const string NAME_Smith_Melter_Done					= " eingeschmolzen";
	const string NAME_Smith_Fire_Done					= " erhitzt";
	const string NAME_Smith_Anvil_Done					= " geschmiedet";
	const string NAME_Smith_Cool_Done					= " abgekühlt";
	const string NAME_Smith_Sharp_Done					= " geschliffen";

// ***************************************************************************************
// Kochprodukte
// ***************************************************************************************
	const string NAME_MeatbugSoup						= "Meatbug-Suppe";
	const string NAME_MushroomSoup						= "Pilz-Suppe";
	const string NAME_HerbSoup							= "Kraut-Suppe";
	const string NAME_MeatSoup							= "Fleisch-Suppe";
	const string NAME_MoleratSoup						= "Molerat-Suppe";

	const string NAME_MeatbugStew						= "Meatbug-Eintopf";
	const string NAME_MushroomStew						= "Pilz-Eintopf";
	const string NAME_HerbStew							= "Kraut-Eintopf";
	const string NAME_MeatStew							= "Fleisch-Eintopf";
	const string NAME_MoleratStew						= "Molerat-Eintopf";

	const string NAME_MeatbugPie						= "Meatbug-Ragout";
	const string NAME_MushroomPie						= "Pilz-Ragout";
	const string NAME_HerbPie							= "Kraut-Ragout";
	const string NAME_MeatPie							= "Fleisch-Ragout";
	const string NAME_MoleratPie						= "Molerat-Ragout";

	const string NAME_RecipeMeatbug						= "schmackhafte Wanzenrezepte";
	const string NAME_RecipeMolerat						= "ungewöhnliche Moleratgerichte";
	const string NAME_RecipeHerb						= "delikate Kräuterrezepte";
	const string NAME_RecipeMushroom					= "wunderliche Pilzgerichte";
	const string NAME_RecipeMeat						= "leckere Fleischzubereitung";

	const string NAME_CAULDRON_Done						= " zubereitet";

	const string NAME_Bow_Done							= " gespannt";
	const string NAME_RUNEMAKER_Done					= " aufgeladen";
	const string NAME_RUNEMELTER_Done					= " gegossen";
	const string NAME_WOOD_Done							= " geschnitten";
	const string NAME_STOMPER_DONE						= " gerollt";
	const string NAME_FLETCHER_DONE						= " geschnitzt";

	const string NAME_Ration							= " Portion ";
	const string NAME_Rations							= " Portionen ";

// ***************************************************************************************
// Pflanzen
// ***************************************************************************************
	const string 	NAME_MountainMoss					= "Bergmoos";
	const string 	NAME_Stoneroot						= "Steinwurzel";
	const string 	NAME_BloodThistle					= "Blutdistel";
	const string 	NAME_OrcLeaf						= "Orkblatt";
	const string 	NAME_RavenHerb						= "Rabenkraut";
	const string 	NAME_Nightshade						= "Nachtschatten";
	const string 	NAME_CaveMushroom					= "Höhlenpilz";
	const string 	NAME_Woodberry						= "Waldbeeren";
	const string 	NAME_Flameberry						= "Flammbeeren";
	const string 	NAME_Trollberry						= "Trollkirsche";

// ***************************************************************************************
// Alchemie
// ***************************************************************************************
	const string NAME_LAB_Done							= " gebraut";

	const string NAME_HealthPotion1						= "Essenz der Heilung";
	const string NAME_HealthPotion2						= "Extrakt der Heilung";
	const string NAME_HealthPotion3						= "Elixier der Heilung";
	const string NAME_HealthPotionAll					= "Trank völliger Genesung";
	const string NAME_ManaPotion1						= "Essenz der Magie";
	const string NAME_ManaPotion2						= "Extrakt der Magie";
	const string NAME_ManaPotion3						= "Elixier der Magie";
	const string NAME_ManaPotionAll						= "Trank der Magiewiderherstellung";
	const string NAME_SpeedPotion1						= "Essenz der Eile";
	const string NAME_SpeedPotion2						= "Extrakt der Eile";
	const string NAME_SpeedPotion3						= "Elixier der Eile";
	const string NAME_StrPotion1						= "Essenz der Stärke";
	const string NAME_StrPotion2						= "Extrakt der Stärke";
	const string NAME_StrPotion3						= "Elixier der Stärke";
	const string NAME_DexPotion1						= "Essenz der Geschicklichkeit";
	const string NAME_DexPotion2						= "Extrakt der Geschicklichkeit";
	const string NAME_DexPotion3						= "Elixier der Geschicklichkeit";
	const string NAME_StrDexPotion1						= "Trank der Macht";
	const string NAME_StrDexPotion2						= "Trank der Herrschaft";
	const string NAME_HealthPermaPotion1				= "Essenz des Lebens";
	const string NAME_HealthPermaPotion2				= "Extrakt des Lebens";
	const string NAME_HealthPermaPotion3				= "Elixier des Lebens";
	const string NAME_ManaPermaPotion1					= "Essenz des Geistes";
	const string NAME_ManaPermaPotion2					= "Extrakt des Geistes";
	const string NAME_ManaPermaPotion3					= "Elixier des Geistes";

	const string NAME_Essence							= "Essenz";
	const string NAME_Extract							= "Extrakt";
	const string NAME_Elixir							= "Elixier";

	const string NAME_BookHealingPotions				= "Rezepturen für Heiltränke";
	const string NAME_BookManaPotions					= "Rezepturen für Manatränke";
	const string NAME_BookSpeedPotions					= "Rezepturen für Tränke der Eile";

// ***************************************************************************************
// Runen erschaffen
// ***************************************************************************************
	const string NAME_BlankRune							= "leere Rune";
	const string NAME_BlankBloodRune					= "leere Blutrune";
	const string NAME_BlankDarkRune						= "leere Dunkelrune";
	const string NAME_RunePostfix						= "-Rune";

// ***************************************************************************************
// sonstige Gegenstände
// ***************************************************************************************
	const string NAME_Silver							= "Silber";
	const string NAME_Pliers							= "Schmiedezange";
	const string NAME_FletcherWood						= "Holz für Pfeile";
	const string NAME_FletcherKnife						= "Schnitzmesser";
	const string NAME_BowWood							= "Holz für Bogen";

// ***************************************************************************************
// Wissen - Knowledge.d
// ***************************************************************************************
	const string NAME_RecipesMeatbug					= "WANZEN-Rezepte: ";
	const string NAME_RecipesMolerat					= "MOLERAT-Rezepte: ";
	const string NAME_RecipesHerb						= "SUMPFKRAUT-Rezepte: ";
	const string NAME_RecipesMushroom					= "PILZ-Rezepte: ";
	const string NAME_RecipesMeat						= "FLEISCH-Rezepte: ";

	const string NAME_RecipePotionsHealing				= "Die Herstellung von HEILTRÄNKEN erfordert folgende Reagenzien: ";
	const string NAME_RecipePotionsMana					= "MANATRÄNKE benötigen für ihre Herstellung: ";
	const string NAME_RecipePotionsSpeed				= "Tränke der SCHNELLIGKEIT sind werden aus folgenden Reagenzien hergestellt: ";

	const string NAME_RecipeSoup						= "Soup";
	const string NAME_RecipeStew						= "Eintopf";
	const string NAME_RecipeRagout						= "Ragout";

	const string GE_AlchemieRecipies_Speed		= B_BuildAlchemieRecipeString!(NAME_RecipePotionsSpeed, NAME_BloodThistle);
	const string GE_AlchemieRecipies_Mana		= B_BuildAlchemieRecipeString!(NAME_RecipePotionsMana, NAME_StoneRoot);
	const string GE_AlchemieRecipies_HP			= B_BuildAlchemieRecipeString!(NAME_RecipePotionsHealing, NAME_MountainMoss);

	const string GE_BowMaker_Bow				= format!<"GE_BowMaker_Bow">("Kurzbögen jeder Bauart sind vom Bauplan her bekannt. Für den Kurzbogen werden {} Holz benötigt. Für den Reiterbogen werden {} Holz benötigt. Für den Feldbogen werden {} Holz benötigt. Für den Jagdbogen werden {} Holz benötigt.",
																			Amnt_ShortBow,
																			Amnt_RiderBow,
																			Amnt_FieldBow,
																			Amnt_HuntingBow,
																		);
	const string GE_BowMaker_LongBow			= format!<"GE_BowMaker_LongBow">("Langbögen jeder Bauart sind vom Bauplan her bekannt. Für den Langbogen werden {} Holz benötigt. Für den Heckenbogen werden {} Holz benötigt. Für den Weidenbogen werden {} Holz benötigt. Für den Armeebogen werden {} Holz benötigt. Für den Kriegsbogen werden {} Holz benötigt. Für den Sturmbogen werden {} Holz benötigt.",
																			Amnt_LongBow,
																			Amnt_HedgeBow,
																			Amnt_WillowBow,
																			Amnt_ArmyBow,
																			Amnt_WarBow,
																			Amnt_StormBow
																		);
	const string GE_BowMaker_CrossBow			= format!<"GE_BowMaker_CrossBow">("Armbrüste jeder Bauart sind vom Bauplan her bekannt. Für die leichte Armbrust werden {} Holz benötigt. Für die Armbrust werden {} Holz benötigt. Für die schwere Armbrust werden {} Holz benötigt. Für die Kriegsarmbrust werden {} Holz benötigt.",
																			Amnt_LightCrossBow,
																			Amnt_CrossBow,
																			Amnt_HeavyCrossBow,
																			Amnt_WarCrossBow,
																		);

	const string GE_CookingRecipies_Meatbug		= B_BuildCookRecipeString!(NAME_RecipesMeatbug, NAME_Meatbug);
	const string GE_CookingRecipies_Herb		= B_BuildCookRecipeString!(NAME_RecipesHerb, NAME_Swampweed);
	const string GE_CookingRecipies_Molerat		= B_BuildCookRecipeString!(NAME_RecipesMolerat, NAME_MoleratGrease);
	const string GE_CookingRecipies_Mushroom	= B_BuildCookRecipeString!(NAME_RecipesMushroom, Name_CaveMushroom);
	const string GE_CookingRecipies_Meat		= B_BuildCookRecipeString!(NAME_RecipesMeat, NAME_Mutton);

//***************************************************************************************
// FONT-Konstanten
//***************************************************************************************
	const string FONT_OLD_BIG							= "FONT_OLD_20_WHITE.TGA";				// Farbe beige
	const string FONT_OLD_BIG_HI						= "FONT_OLD_20_WHITE_HI.TGA";			// Farbe weiss
	const string FONT_OLD_SMALL							= "FONT_OLD_10_WHITE.TGA";				// Farbe beige
	const string FONT_OLD_SMALL_HI						= "FONT_OLD_10_WHITE_HI.TGA";			// Farbe weiss

	const string FONT_BOOK_SMALL						= "FONT_10_BOOK.TGA";					// Farbe schwarz
	const string FONT_BOOK_BIG							= "FONT_15_BOOK.TGA";					// Farbe schwarz

// ***************************************************************************************
// Atitüde-Konstantent
// ***************************************************************************************
	const string PRINT_ATTITUDE_Friendly				= " ist freundlich.";
	const string PRINT_ATTITUDE_Neutral					= " ist neutral.";
	const string PRINT_ATTITUDE_Angry					= " ist verärgert.";
	const string PRINT_ATTITUDE_Hostile					= " ist feindlich.";

#if cs {
	const string PRINT_ATTITUDE_Friendly_F				= "";
	const string PRINT_ATTITUDE_Neutral_F				= "";
	const string PRINT_ATTITUDE_Angry_F					= "";
	const string PRINT_ATTITUDE_Hostile_F				= "";
}

//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
	const string _STR_INVALID							= "(Unbekannt)-";

	const string _STR_ATTRIBUTE_HITPOINTS				= "Lebens-";
	const string _STR_ATTRIBUTE_HITPOINTS_MAX			= "maximale Lebens-";
	const string _STR_ATTRIBUTE_MANA					= "Mana-";
	const string _STR_ATTRIBUTE_MANA_MAX				= "maximale Mana-";
	const string _STR_ATTRIBUTE_STRENGTH				= "Stärke-";
	const string _STR_ATTRIBUTE_DEXTERITY				= "Geschicklichkeits-";
	const string _STR_ATTRIBUTE_MAGIC_CIRCLE			= "magische Zauber-";

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, für die ihm Attributspunkte fehlen
	const string _STR_CANNOTUSE_PRE_PLAYER				= "es fehlen ";
	const string _STR_CANNOTUSE_POINTS					= "Punkte";
	const string _STR_CANNOTUSE_LEVELS					= "Stufen";
	const string _STR_CANNOTUSE_POST					= ", um diesen Gegenstand anzulegen";

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, für das Anlegen von Waffen hat (nur Debugzwecke!)
	const string _STR_CANNOTUSE_PRE_NPC					= " (";
	const string _STR_CANNOTUSE_POST_NPC				= ") fehlen ";

// Bidschrimausgabe zum Thema Schloß öffnen/knacken
	//const string _STR_MESSAGE_INTERACT_NO_KEY			= "kein Dietrich oder passender Schlüssel";
	const string _STR_MESSAGE_PICKLOCK_SUCCESS			= "das hörte sich gut an";
	const string _STR_MESSAGE_PICKLOCK_UNLOCK			= "das Schloß ist geknackt";
	const string _STR_MESSAGE_PICKLOCK_FAILURE			= "Mist.. wieder von vorne";
	const string _STR_MESSAGE_PICKLOCK_BROKEN			= "der Dietrich ist abgebrochen";

// Textausgabe für Mob-Benutzung
	const string _STR_MESSAGE_MOBSI_MISSING_KEY_OR_LOCKPICK= "weder Schlüssel noch Dietrich vorhanden!";
	const string _STR_MESSAGE_MOBSI_MISSING_KEY			= "kein Schlüssel vorhanden!";
	const string _STR_MESSAGE_MOBSI_MISSING_LOCKPICK	= "kein Dietrich vorhanden!";
	const string _STR_MESSAGE_MOBSI_NEVER_OPEN			= "fest verschlossen!";
	const string _STR_MESSAGE_MOBSI_MISSING_ITEM		= "fehlender Gegenstand!";
	const string _STR_MESSAGE_MOBSI_ANOTHER_IS_USING	= "wird gerade benutzt!";
	const string _STR_MESSAGE_MOBSI_TOO_FAR_AWAY		= "ist zu weit weg!";
	const string _STR_MESSAGE_MOBSI_WRONG_SIDE			= "falsche Seite!";

// Bidschrimausgabe zum Thema Hebel/Winden
	const string _STR_MESSAGE_OCLEVER_STUCKS			= "der Hebel bewegt sich kein Haarbreit";
	const string _STR_MESSAGE_WHEEL_STUCKS				= "die Winde klemmt";
	const string _STR_MESSAGE_ARENAWHEEL				= "die Winde darf nur vom Arenameister bedient werden";

// Bidschrimausgabe beim storybedingten Transfer von Items
	const string _STR_MESSAGE_ITEM_GIVEN				= " Gegenstand gegeben";				//SPACE davor wichtig, weil Trennzeichen
	const string _STR_MESSAGE_ITEMS_GIVEN				= " Gegenstände gegeben";
	const string _STR_MESSAGE_SILVER_GIVEN				= " Silber gegeben";
	const string _STR_MESSAGE_GOLD_GIVEN				= " Gold gegeben";
	const string _STR_MESSAGE_ITEM_TAKEN				= " Gegenstand erhalten";
	const string _STR_MESSAGE_ITEMS_TAKEN				= " Gegenstände erhalten";
	const string _STR_MESSAGE_SILVER_TAKEN				= " Silber erhalten";
	const string _STR_MESSAGE_GOLD_TAKEN				= " Gold erhalten";

// Bildschirmausgaben beim Plündern
	const string _STR_MESSAGE_PLUNDERED_MIDFIX			= " hat ";								//SPACE davor wichtig, weil Trennzeichen
	const string _STR_MESSAGE_ITEM_PLUNDERED			= " Gegenstand genommen";				//SPACE davor wichtig, weil Trennzeichen
	const string _STR_MESSAGE_ITEMS_PLUNDERED			= " Gegenstände genommen";
	const string _STR_MESSAGE_SILVER_PLUNDERED			= " Silber genommen";
	const string _STR_MESSAGE_GOLD_PLUNDERED			= " Gold gegeben";

// Bildschirmausgaben beim B_ExchangeMemoryAttitude
	const string _STR_MESSAGE_ATT_PAY_MIDFIX			= " nimmt sich ";
	const string _STR_MESSAGE_ATT_PAY_POSTFIX			= " Silber!";

// Bidschrimausgabe fürs Tausch-Fenster
	const string _STR_MESSAGE_TRADE_FAILURE				= "der Wert deiner Tauschware ist nicht hoch genug";

// GILDENAUFNAHMEBEDINGUNG (für die Funktion "B_PrintGuildCondition()" )
	const string _STR_MESSAGE_Joincamp					= "Voraussetzung für die Aufnahme: Stufe ";

// nicht beklaubare NSCs
	const string _STR_MESSAGE_CANNOTSTEAL				= "kann nicht beklaut werden";

// MOBSI-Fehlermeldungen
	const string _STR_MESSAGE_MOBSI_ORE_TOOL			= "keine Spitzhacke vorhanden!";
	const string _STR_MESSAGE_MOBSI_ORE_MAT				= "Erzader erschöpft!";
	const string _STR_MESSAGE_MOBSI_MELTER_TAL			= "Talent SCHMIEDEN nicht ausreichend!";
	const string _STR_MESSAGE_MOBSI_MELTER_MAT			= "zu wenig Erznuggets vorhanden!";
	const string _STR_MESSAGE_MOBSI_MELTER_TOOL			= "keine Schmiedezange vorhanden!";
	const string _STR_MESSAGE_MOBSI_FIRE_TAL			= "Talent SCHMIEDEN nicht ausreichend!";
	const string _STR_MESSAGE_MOBSI_FIRE_MAT			= "kein Roheisen vorhanden!";
	const string _STR_MESSAGE_MOBSI_ANVIL_TAL			= "Talent SCHMIEDEN nicht ausreichend!";
	const string _STR_MESSAGE_MOBSI_ANVIL_MAT			= "kein glühendes Roheisen vorhanden!";
	const string _STR_MESSAGE_MOBSI_ANVIL_TOOL			= "kein Schmiedehammer vorhanden!";
	const string _STR_MESSAGE_MOBSI_COOL_TAL			= "Talent SCHMIEDEN nicht ausreichend!";
	const string _STR_MESSAGE_MOBSI_COOL_MAT			= "kein glühender Waffenrohling vorhanden!";
	const string _STR_MESSAGE_MOBSI_SHARP_TAL			= "Talent SCHMIEDEN nicht ausreichend!";
	const string _STR_MESSAGE_MOBSI_SHARP_MAT			= "kein abgekühlter Waffenrohling vorhanden!";
	const string _STR_MESSAGE_MOBSI_PAN_MAT				= "kein Fleisch mehr vorhanden";

	const string _STR_MESSAGE_MOBSI_CAULDRON_TAL		= "Talent KOCHEN nicht ausreichend!";
	const string _STR_MESSAGE_MOBSI_CAULDRON_MAT		= "Keine Zutaten für eine Rezeptur vorhanden!";
	const string _STR_MESSAGE_MOBSI_CAULDRON_TOOL		= "kein Kochlöffel vorhanden!";
	const string _STR_MESSAGE_MOBSI_CAULDRON_HALVOR		= "Halvor kann dich sehen!";

	const string _STR_MESSAGE_MOBSI_LAB_MAT				= "Keine ausreichenden Zutaten für eine Rezeptur!";
	const string _STR_MESSAGE_MOBSI_LAB_TAL				= "Talent ALCHEMIE ist nicht ausreichend!";

	const string _STR_MESSAGE_MOBSI_RUNEMELTER_MAT		= "nicht genug Erz vorhanden!";
	const string _STR_MESSAGE_MOBSI_RUNEMAKER_MAT		= "kein leerer Runenstein oder Spruchrolle vorhanden!";
	const string _STR_MESSAGE_MOBSI_RUNE_TOOL			= "keine Schmiedezange vorhanden!";
	const string _STR_MESSAGE_MOBSI_RUNE_TAL			= "Talent RUNEN ERSCHAFFEN nicht ausreichend!";
	const string _STR_MESSAGE_MOBSI_RUNE_MANA			= "Nicht genug Mana für die Erschaffung!";

	const string _STR_MESSAGE_MOBSI_WOOD_TOOL			= "kein Holzmesser vorhanden!";
	const string _STR_MESSAGE_MOBSI_WOOD_MAT			= "Bogenholz ist abgeerntet!";

	const string _STR_MESSAGE_MOBSI_BOW_TAL				= "Talent BOGENMACHEN nicht ausreichend!";
	const string _STR_MESSAGE_MOBSI_BOW_MAT				= "Nicht genug Materialien vorhanden!";
	const string _STR_MESSAGE_MOBSI_BOW_TOOL			= "Kein Bogenmachermesser vorhanden!";
	const string _STR_MESSAGE_MOBSI_Bow_Book			= "Noch kein Rezept gelernt!";

	const string _STR_MESSAGE_MOBSI_FLETCHER_TAL		= "Talent BOGENMACHEN nicht ausreichend!";
	const string _STR_MESSAGE_MOBSI_FLETCHER_MAT		= "Nicht genug Materialien vorhanden!";
	const string _STR_MESSAGE_MOBSI_FLETCHER_TOOL		= "Kein Bogenmachermesser!";

	const string _STR_MESSAGE_MOBSI_WATERPIPE_MAT		= "Nicht genug Sumpfkraut dabei!";

	const string _STR_MESSAGE_MOBSI_STOMPER_MAT			= "Nicht genug Sumpfkraut dabei!";
	const string _STR_MESSAGE_MOBSI_STOMPER_TOOL		= "Kein Krautstamper vorhanden!";

	const string _STR_MESSAGE_MOBSI_ARENABENCH_GLADIATOR= "nur für die Kampfvorbereitung!";
	const string _STR_MESSAGE_MOBSI_ARENABENCH_CHAMBER	= "falsche Vorbereitungskammer!";

// Textausgabe für Steal
	const string _STR_MESSAGE_STEAL_NPC_IS_AWARE		= "mein Opfer beobachtet mich";
	const string _STR_MESSAGE_STEAL_NO_TALENT			= "kein Taschendiebstahl-Talent";
	const string _STR_MESSAGE_STEAL_NOT_IN_RANGE		= "zu weit weg!";
	const string _STR_MESSAGE_STEAL_NPC_IS_EMPTY		= "der hat nichts dabei!";

// Textausgabe für bereits geplünderte Leiche
	const string _STR_MESSAGE_PLUNDER_IS_EMPTY			= "da ist nichts mehr zu holen!";

// Textausgabe wenn Muntion alle ist
	const string _STR_MESSAGE_RANGED_NO_AMMO			= "keine Munition!";

// Lern-Meldungen
	const string _STR_MESSAGE_LEARNSMITH				= "Wissen über neue Waffe erlernt!";
	const string _STR_MESSAGE_LEARNCOOK					= "Wissen über neues Kochrezept erlernt!";
	const string _STR_MESSAGE_LEARNALCHEMIE				= "Wissen über neues Alchemierezept erlernt!";
	const string _STR_MESSAGE_LEARNthaumaturgy			= "Wissen über neue Rune erlernt!";
	const string _STR_MESSAGE_LEARNBOW					= "Wissen über das Bogenmachen erlernt!";
	const string _STR_MESSAGE_LEARNPLANTS				= "Wissen über Pflanzen erlernt!";

	const string _STR_MESSAGE_ADDDARKPOINTS				= "deine dunkle Seite wird stärker!";
	const string _STR_MESSAGE_ADDFAME					= "deine Bekanntheit wächst!";

	const string _STR_MESSAGE_ARENARANK					= "Platz ";
	const string _STR_MESSAGE_ARENAVICTORY				= " Sieg";
	const string _STR_MESSAGE_ARENAVICTORIES			= " Siege";
	const string _STR_MESSAGE_ARENAPENALTY1				= "Punktabzug!";
	const string _STR_MESSAGE_ARENAPENALTY2				= "(Gegner noch nicht bereit)";
	const string _STR_MESSAGE_ARENAPLAYERVICTORY		= "SIEG !!!";
	const string _STR_MESSAGE_ARENAPLAYERDEFEAT			= "NIEDERLAGE !!!";

	const string _STR_MESSAGE_EXPLO						= "Verborgener Ort entdeckt !";

	const string _STR_MESSAGE_PHOENIX_NOTYET			= "Merkwürdige Kiste! Lässt sich kein haarbreit bewegen!";
	const string _STR_MESSAGE_DTCELL_NOTYET				= "Der Hebel scheint magisch blockiert zu sein!";

	const string _STR_MESSAGE_DEATH0					= "Dies ist dein Ende!";
	const string _STR_MESSAGE_DEATH1					= "Du hast versagt!";
	const string _STR_MESSAGE_DEATH2					= "Deine Reise endet hier!";
	const string _STR_MESSAGE_DEATH3					= "Der Tod siegt immer!";
	const string _STR_MESSAGE_DEATH4					= "Dein Leben endet hier!";
	const string _STR_MESSAGE_DEATH5					= "Dein Tod ist die Freiheit der Dämonen!";
	const string _STR_MESSAGE_DEATH6					= "Du warst nicht gut genug!";
	const string _STR_MESSAGE_DEATH7					= "Die Dämonen werden siegen!";
	const string _STR_MESSAGE_DEATH8					= "Am Ende aller Dinge steht der Tod!";
	const string _STR_MESSAGE_DEATH9					= "Dämonen werden nun Einzug halten...!";
	const string _STR_MESSAGE_DEATH10					= "Du bist Tot!";
	const string _STR_MESSAGE_DEATH11					= "Dein Weg endet hier!";
	const string _STR_MESSAGE_DEATH12					= "Jeder muss einmal sterben!";

	const string _STR_MESSAGE_RUNEINACTIVE				= "Das magische Pentagramm wurde blockiert!";
	const string _STR_MESSAGE_SPELLWRONGPLACE			= "Der Zauber scheint hier nicht zu wirken!";
	const string _STR_MESSAGE_SPELLWRONG				= "Der Zauber benötigt noch irgendetwas...";

	const string _STR_MESSAGE_GAMESTART					= "Arbeitsversion der 2. Etappe !!!";
	const string _STR_MESSAGE_GAMEEND					= "Hier endet das Zwischen-Release !";

	const string _STR_MESSAGE_WHEEL_JAMMED				= "die Winde klemmt!";
	const string _STR_MESSAGE_MOBSI_BROKEN				= "nicht mehr zu gebrauchen!";

	const string _STR_MESSAGE_LEVELTOOLOW				= "benötigte Stufe: ";

// ***************************************************************************************
// Relative Y-Koordinaten für die Bildschirmausgabe (in % der aktuellen Bildhöhe)
// ***************************************************************************************
	const int _XPOS_MESSAGE_ARENARANK					= 35;
	const int _XPOS_MESSAGE_ARENANAME					= 47;
	const int _XPOS_MESSAGE_ARENAVICTORIES				= 60;

// ***************************************************************************************
// Relative Y-Koordinaten für die Bildschirmausgabe (in % der aktuellen Bildhöhe)
// ***************************************************************************************
	const int _YPOS_MESSAGE_GIVEN						= 37;
	const int _YPOS_MESSAGE_TAKEN						= 40;
	const int _YPOS_MESSAGE_CHANGEATTITUDE				= 43;
	const int _YPOS_MESSAGE_LOGENTRY					= 45;
	const int _YPOS_MESSAGE_XPGAINED					= 50;
	const int _YPOS_MESSAGE_LPGAINED					= 50;
	const int _YPOS_MESSAGE_LEVELUP						= 55;
	const int _YPOS_MESSAGE_PICKLOCK_SUCCESS			= 6;
	const int _YPOS_MESSAGE_PICKLOCK_UNLOCK				= 9;
	const int _YPOS_MESSAGE_PICKLOCK_FAILURE			= 12;
	const int _YPOS_MESSAGE_PICKLOCK_BROKEN				= 15;
	const int _YPOS_MESSAGE_CANNOTSTEAL					= 6;
	const int _YPOS_MESSAGE_MOBSI						= 6;
	const int _YPOS_MESSAGE_LEARN						= 60;
	const int _YPOS_MESSAGE_PRODUCE						= 60;
	const int _YPOS_MESSAGE_ADDDARKPOINTS				= 60;
	const int _YPOS_MESSAGE_ADDFAME						= 60;
	const int _YPOS_MESSAGE_ARENARANKING				= 30;
	const int _YPOS_MESSAGE_ARENARANKINGROW				= 3;
	const int _YPOS_MESSAGE_ARENAPENALTY1				= 50;
	const int _YPOS_MESSAGE_ARENAPENALTY2				= 55;
	const int _YPOS_MESSAGE_ARENARESULT					= 42;
	const int _YPOS_MESSAGE_REFUSEACTION				= 6;
	const int _YPOS_MESSAGE_EXPLO						= 40;
	const int _YPOS_MESSAGE_LEVELTOOLOW					= 50;

// ***************************************************************************************
// Zeitdauer der Bildschirmausgabe (in Sekunden)
// ***************************************************************************************
	const int _TIME_MESSAGE_GIVEN						= 1;
	const int _TIME_MESSAGE_TAKEN						= 1;
	const int _TIME_MESSAGE_LOGENTRY					= 1;
	const int _TIME_MESSAGE_XPGAINED					= 1;
	const int _TIME_MESSAGE_LPGAINED					= 2;
	const int _TIME_MESSAGE_LEVELUP						= 2;
	const int _TIME_MESSAGE_RAISEATTRIBUTE				= 4;
	const int _TIME_MESSAGE_PICKLOCK					= 3;
	const int _TIME_MESSAGE_CANNOTSTEAL					= 2;
	const int _TIME_MESSAGE_MOBSI						= 2;
	const int _TIME_MESSAGE_LEARN						= 5;
	const int _TIME_MESSAGE_PRODUCE						= 1;
	const int _TIME_MESSAGE_ADDDARKPOINTS				= 2;
	const int _TIME_MESSAGE_ADDFAME						= 2;
	const int _TIME_MESSAGE_ARENARANKING				= 5;
	const int _TIME_MESSAGE_ARENAPENALTY				= 2;
	const int _TIME_MESSAGE_ARENARESULT					= 3;
	const int _TIME_MESSAGE_REFUSEACTION				= 1;
	const int _TIME_MESSAGE_EXPLO						= 2;
	const int _TIME_MESSAGE_DEATH						= 2;
	const int _TIME_MESSAGE_CHANGEATTITUDE				= 2;
	const int _TIME_MESSAGE_GAMESTART					= 7;
	const int _TIME_MESSAGE_GAMEEND						= 10;
	const int _TIME_MESSAGE_LEVELTOOLOW					= 3;

// ***************************************************************************************
// Sounds-Definitionen
// ***************************************************************************************
	const string _SOUND_PICKLOCK_SUCCESS				= "PICKLOCK_SUCCESS";
	const string _SOUND_PICKLOCK_FAILURE				= "PICKLOCK_FAILURE";
	const string _SOUND_PICKLOCK_UNLOCK					= "PICKLOCK_UNLOCK";
	const string _SOUND_PICKLOCK_BROKEN					= "PICKLOCK_BROKEN";

// ***************************************************************************************
// Zusammenbauen von Info_AddChoice()-Strings beim Kaufen/Lernen
// ***************************************************************************************
	const string NAME_ImSorry							= "Tut mir leid! (";
	const string NAME_ImSorry_postfix					= " Silber geben)";
	const string NAME_IwantMore							= "Nicht genug Silber, ich will ";

	const string NAME_LearnPrefix						= " (";
	const string NAME_LearnMidfix						= " Silber, ";
	const string NAME_LearnPostfixS						= " Lernpunkt)";
	const string NAME_LearnPostfixP						= " Lernpunkte)";

	const string NAME_LearnStrength_1					= "Stärke +1";
	const string NAME_LearnStrength_5					= "Stärke +5";
	const string NAME_LearnStrength_10					= "Stärke +10";
	const string NAME_LearnStrength_20					= "Stärke +20";

	const string NAME_LearnDexterity_1					= "Geschick +1";
	const string NAME_LearnDexterity_5					= "Geschick +5";
	const string NAME_LearnDexterity_10					= "Geschick +10";
	const string NAME_LearnDexterity_20					= "Geschick +20";

	const string NAME_LearnMana_1						= "Mana +1";
	const string NAME_LearnMana_5						= "Mana +5";
	const string NAME_LearnMana_10						= "Mana +10";
	const string NAME_LearnMana_20						= "Mana +20";

	const string NAME_Learn1h_1							= "Einhänder - Stufe 1";
	const string NAME_Learn1h_2							= "Einhänder - Stufe 2";
	const string NAME_Learn2h_1							= "Zweihänder - Stufe 1";
	const string NAME_Learn2h_2							= "Zweihänder - Stufe 2";
	const string NAME_LearnStaff_1						= "Kampfstab - Stufe 1";
	const string NAME_LearnStaff_2						= "Kampfstab - Stufe 2";

	const string NAME_LearnBow_1						= "Bogen - Stufe 1";
	const string NAME_LearnBow_2						= "Bogen - Stufe 2";
	const string NAME_LearnCrossbow_1					= "Armbrust - Stufe 1";
	const string NAME_LearnCrossbow_2					= "Armbrust - Stufe 2";

	const string NAME_LearnMage_1						= "1. Kreis der Magie";
	const string NAME_LearnMage_2						= "2. Kreis der Magie";
	const string NAME_LearnMage_3						= "3. Kreis der Magie";
	const string NAME_LearnMage_4						= "4. Kreis der Magie";
	const string NAME_LearnMage_5						= "5. Kreis der Magie";
	const string NAME_LearnMage_6						= "6. Kreis der Magie";

	const string NAME_LearnPickpocket_1					= "Taschendiebstahl - Stufe 1";
	const string NAME_LearnPickpocket_2					= "Taschendiebstahl - Stufe 2";
	const string NAME_LearnPicklock_1					= "Schlösser knacken - Stufe 1";
	const string NAME_LearnPicklock_2					= "Schlösser knacken - Stufe 2";

	const string NAME_LearnAcrobat						= "Akrobatik";
	const string NAME_LearnSneak						= "Schleichen";

	const string NAME_LearnSmith_1						= "Schmieden - Stufe 1";
	const string NAME_LearnSmith_2						= "Schmieden - Stufe 2";
	const string NAME_LearnSmith_3						= "Schmieden - Stufe 3";

	const string NAME_LearnCook_1						= "Kochen - Stufe 1";
	const string NAME_LearnCook_2						= "Kochen - Stufe 2";
	const string NAME_LearnCook_3						= "Kochen - Stufe 3";

	const string NAME_LearnAlchemy_1					= "Alchemie - Stufe 1";
	const string NAME_LearnAlchemy_2					= "Alchemie - Stufe 2";
	const string NAME_LearnAlchemy_3					= "Alchemie - Stufe 3";

	const string NAME_LearnThaumaturgy_1				= "Runen erschaffen -	Stufe 1";
	const string NAME_LearnThaumaturgy_2				= "Runen erschaffen -	Stufe 2";
	const string NAME_LearnThaumaturgy_3				= "Runen erschaffen -	Stufe 3";

	const string NAME_LearnBowmaker_1					= "Bogenmachen - Stufe 1";
	const string NAME_LearnBowmaker_2					= "Bogenmachen - Stufe 2";
	const string NAME_LearnBowmaker_3					= "Bogenmachen - Stufe 3";

	const string PRINT_MAX_100							= "Keine Steigerung über Maximum 100!";

	const string PRINT_NotEnoughSkillPoints				= "Zu wenig Lernpunkte!";

	const string NAME_RaiseStrength						= "Stärke +";
	const string NAME_RaiseDexterity					= "Geschicklichkeit +";
	const string NAME_RaiseMana							= "Mana +";
	const string NAME_RaiseStrDex						= "Stärke und Geschicklichkeit +";
	const string NAME_RaiseManaMax						= "maximale Mana +";
	const string NAME_RaiseHealthMax					= "maximale Lebensenergie +";

// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
	const string MENU_TEXT_NEEDS_APPLY					= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
	const string MENU_TEXT_NEEDS_RESTART				= "Einige Einstellungen werden erst nach einem Neustart aktiv";

// ***************************************************************************************
// Missionen-Konstanten
// ***************************************************************************************
	const int NAME_IgarazSilver							= 20;

	const string KapWechsel_1					= "Kapitel 1";
	const string KapWechsel_1_Text				= "Die Rückkehr";
	const string KapWechsel_2					= "Kapitel 2";
	const string KapWechsel_2_Text				= "Der Aufbruch";
	const string KapWechsel_3					= "Kapitel 3";
	const string KapWechsel_3_Text				= "Die Reise";
	const string KapWechsel_4					= "Kapitel 4";
	const string KapWechsel_4_Text				= "Die Entscheidung";
