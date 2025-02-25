instance PC_Rockefeller(C_Npc)
// PlayerInstanz
{
	// -------- primary data --------
	name							= "Rockefeller";
	npcType							= NpcType_Main;
	guild							= GIL_NONE;
	level							= 30;

	voice							= 15;
	id								= 0;
	lp								= 100;

	// -------- abilities --------
	attribute[ATR_STRENGTH]			= 100;
	attribute[ATR_DEXTERITY]		= 100;
	attribute[ATR_MANA_MAX]			= 100;
	attribute[ATR_MANA]				= 100;
	attribute[ATR_HITPOINTS_MAX]	= 400;
	attribute[ATR_HITPOINTS]		= 400;

	// -------- protection --------
	protection[PROT_EDGE]			= 0;
	protection[PROT_EDGE]			= 0;
	protection[PROT_BLUNT]			= 0;
	protection[PROT_POINT]			= 0;
	protection[PROT_FIRE]			= 0;
	protection[PROT_MAGIC]			= 0;

	// -------- visuals --------
	Mdl_SetVisual(self, "HUMANS.MDS");
	//						body mesh,				bdytex,	skin,		head mesh,			headtex,	teethtex,	armor
	Mdl_SetVisualBody(self,	"hum_body_Naked0",		2,		1,			"Hum_Head_Pony",	9,			0,			EBR_ARMOR_H2);

	// -------- ai --------

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_PICKPOCKET, 1); Npc_SetTalentValue(self, NPC_TALENT_PICKPOCKET, 60);
	Npc_SetTalentSkill(self, NPC_TALENT_SNEAK, 1);
	Npc_SetTalentSkill(self, NPC_TALENT_PICKLOCK, 1); Npc_SetTalentValue(self, NPC_TALENT_PICKLOCK, 60);
	Npc_SetTalentSkill(self, NPC_TALENT_MAGE, 6);
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 2);
	Npc_SetTalentSkill(self, NPC_TALENT_2H, 2);
	Npc_SetTalentSkill(self, NPC_TALENT_BOW, 2);
	Npc_SetTalentSkill(self, NPC_TALENT_CROSSBOW, 2);
	Npc_SetTalentSkill(self, NPC_TALENT_SMITH, 3);
	Npc_SetTalentSkill(self, NPC_TALENT_COOK, 3);
	Npc_SetTalentSkill(self, NPC_TALENT_ALCHEMY, 3);
	Npc_SetTalentSkill(self, NPC_TALENT_THAUMATURGY, 3);
	Npc_SetTalentSkill(self, NPC_TALENT_BOWMAKER, 3);

	// -------- inventory --------

	//----------------------------------------
	//Armor.d
	//----------------------------------------

	// Sequel Armor
	CreateInvItem(self, KNG_ARMOR);

	CreateInvItem(self, DHTS_ARMOR);
	CreateInvItem(self, DHTM_ARMOR);
	CreateInvItem(self, DHTL_ARMOR);

	CreateInvItem(self, PALS_ARMOR);
	CreateInvItem(self, PALM_ARMOR);
	CreateInvItem(self, PALL_ARMOR);

	CreateInvItem(self, HLRS_ARMOR);
	CreateInvItem(self, HLRM_ARMOR);

	CreateInvItem(self, DMC_ARMOR);

	CreateInvItem(self, BEG_ARMOR);

	// GOTHIC Armor
	CreateInvItem(self, ORE_ARMOR_H);
	CreateInvItem(self, ORE_ARMOR_M);
	CreateInvItem(self, CRW_ARMOR_H);
	CreateInvItem(self, DMB_ARMOR_M);
	CreateInvItem(self, EBR_ARMOR_M);
	CreateInvItem(self, EBR_ARMOR_H);
	CreateInvItem(self, EBR_ARMOR_H2);
	CreateInvItem(self, GRD_ARMOR_L);
	CreateInvItem(self, GRD_ARMOR_M);
	CreateInvItem(self, GRD_ARMOR_H);
	CreateInvItem(self, GUR_ARMOR_H);
	CreateInvItem(self, GUR_ARMOR_M);
	CreateInvItem(self, KDF_ARMOR_L);
	CreateInvItem(self, KDF_ARMOR_H);
	CreateInvItem(self, KDW_ARMOR_L);
	CreateInvItem(self, KDW_ARMOR_H);
	CreateInvItem(self, NOV_ARMOR_L);
	CreateInvItem(self, NOV_ARMOR_M);
	CreateInvItem(self, NOV_ARMOR_H);
	CreateInvItem(self, ORG_ARMOR_L);
	CreateInvItem(self, ORG_ARMOR_M);
	CreateInvItem(self, ORG_ARMOR_H);
	CreateInvItem(self, SFB_ARMOR_L);
	CreateInvItem(self, SLD_ARMOR_L);
	CreateInvItem(self, SLD_ARMOR_M);
	CreateInvItem(self, SLD_ARMOR_H);
	CreateInvItem(self, STT_ARMOR_M);
	CreateInvItem(self, STT_ARMOR_H);
	CreateInvItem(self, TPL_ARMOR_L);
	CreateInvItem(self, TPL_ARMOR_M);
	CreateInvItem(self, TPL_ARMOR_H);
	CreateInvItem(self, VLK_ARMOR_M);
	CreateInvItem(self, VLK_ARMOR_L);

	//----------------------------------------
	//Artifacts.d
	//----------------------------------------

	//Magic	Runes
	CreateInvItem(self, ItAr_RuneLight);
	CreateInvItem(self, ItAr_RuneFirebolt);
	CreateInvItem(self, ItAr_RuneFireball);
	CreateInvItem(self, ItAr_RuneFirestorm);
	CreateInvItem(self, ItAr_RuneFireRain);
	CreateInvItem(self, ItAr_RuneTeleport1);
	CreateInvItem(self, ItAr_RuneTeleport2);
	CreateInvItem(self, ItAr_RuneTeleport3);
	CreateInvItem(self, ItAr_RuneTeleport5);
	CreateInvItem(self, ItAr_RuneHeal);
	CreateInvItem(self, ItAr_RuneChainLightning);
	CreateInvItem(self, ItAr_RuneThunderbolt);
	CreateInvItem(self, ItAr_RuneThunderball);
	CreateInvItem(self, ItAr_RuneIceCube);
	CreateInvItem(self, ItAr_RuneIceWave);
	CreateInvItem(self, ItAr_RuneDestroyUndead);

	//Magic	Scrolls
	CreateInvItems(self, ItAr_ScrollLight, 10);
	CreateInvItems(self, ItAr_ScrollFirebolt, 10);
	CreateInvItems(self, ItAr_ScrollFireball, 10);
	CreateInvItems(self, ItAr_ScrollFirestorm, 10);
	CreateInvItems(self, ItAr_ScrollFireRain, 10);
	CreateInvItems(self, ItAr_ScrollTeleport1, 10);
	CreateInvItems(self, ItAr_ScrollTeleport2, 10);
	CreateInvItems(self, ItAr_ScrollTeleport3, 10);
	CreateInvItems(self, ItAr_ScrollTeleport5, 10);
	CreateInvItems(self, ItAr_ScrollHeal, 10);

	// Tieverwandlung
	CreateInvItems(self, ItAr_ScrollTrfBloodfly, 10);
	CreateInvItems(self, ItAr_ScrollTrfCrawler, 10);
	CreateInvItems(self, ItAr_ScrollTrfLurker, 10);
	CreateInvItems(self, ItAr_ScrollTrfMeatbug, 10);
	CreateInvItems(self, ItAr_ScrollTrfMolerat, 10);
	CreateInvItems(self, ItAr_ScrollTrfOrcdog, 10);
	CreateInvItems(self, ItAr_ScrollTrfScavenger, 10);
	CreateInvItems(self, ItAr_ScrollTrfShadowbeast, 10);
	CreateInvItems(self, ItAr_ScrollTrfSnapper, 10);
	CreateInvItems(self, ItAr_ScrollTrfWaran, 10);
	CreateInvItems(self, ItAr_ScrollTrfWolf, 10);

	CreateInvItems(self, ItAr_ScrollChainLightning, 10);
	CreateInvItems(self, ItAr_ScrollThunderbolt, 10);
	CreateInvItems(self, ItAr_ScrollThunderball, 10);
	CreateInvItems(self, ItAr_ScrollIceCube, 10);
	CreateInvItems(self, ItAr_ScrollIceWave, 10);

	CreateInvItems(self, ItAr_ScrollSummonDemon, 10);
	CreateInvItems(self, ItAr_ScrollSummonSkeletons, 10);
	CreateInvItems(self, ItAr_ScrollSummonGolem, 10);
	CreateInvItems(self, ItAr_ScrollArmyOfDarkness, 10);

	CreateInvItems(self, ItAr_ScrollDestroyUndead, 10);

	//Psi-Runes
	CreateInvItem(self, ItAr_RuneWindfist);
	CreateInvItem(self, ItAr_RuneStormfist);
	CreateInvItem(self, ItAr_RuneTelekinesis);
	CreateInvItem(self, ItAr_RuneCharm);
	CreateInvItem(self, ItAr_RuneSleep);
	CreateInvItem(self, ItAr_RunePyrokinesis);
	CreateInvItem(self, ItAr_RuneControl);
	CreateInvItem(self, ItAr_RuneBreathOfDeath);

	//Psi-Scrolls
	CreateInvItems(self, ItAr_ScrollFear, 10);
	CreateInvItems(self, ItAr_ScrollBerzerk, 10);

	CreateInvItems(self, ItAr_ScrollShrink, 10);

	CreateInvItems(self, ItAr_ScrollWindfist, 10);
	CreateInvItems(self, ItAr_ScrollStormfist, 10);
	CreateInvItems(self, ItAr_ScrollTelekinesis, 10);
	CreateInvItems(self, ItAr_ScrollCharm, 10);
	CreateInvItems(self, ItAr_ScrollSleep, 10);
	CreateInvItems(self, ItAr_ScrollPyrokinesis, 10);
	CreateInvItems(self, ItAr_ScrollControl, 10);
	CreateInvItems(self, ItAr_ScrollBreathOfDeath, 10);

	//---------------------------------------------------
	// Bow Resources
	//---------------------------------------------------
	CreateInvItems(self, ItMi_Fletcherknife, 10);
	CreateInvItems(self, ItMi_FletcherWood, 10);
	CreateInvItems(self, ItMi_BowWood, 10);

	//----------------------------------------
	//Food.d
	//----------------------------------------
	CreateInvItems(self, ItFo_Ham, 20);
	CreateInvItems(self, ItFo_Apple, 5);
	CreateInvItems(self, ItFo_Loaf, 5);
	CreateInvItems(self, ItFo_Mutton, 10);
	CreateInvItems(self, ItFo_MuttonRaw, 20);
	CreateInvItems(self, ItFo_Cheese, 5);
	CreateInvItems(self, ItFo_Booze, 10);
	CreateInvItems(self, ItFo_Wine, 5);
	CreateInvItems(self, ItFo_Grapes, 5);
	CreateInvItems(self, ItFo_Beer, 5);
	CreateInvItems(self, ItMi_Salt, 5);

	//PFLANZEN
	CreateInvItems(self, ItPl_Mountainmoss, 5);
	CreateInvItems(self, ItPl_Stoneroot, 5);
	CreateInvItems(self, ItPl_BloodThistle, 5);
	CreateInvItems(self, ItPl_OrcLeaf, 5);
	CreateInvItems(self, ItPl_RavenHerb, 5);
	CreateInvItems(self, ItPl_Nightshade, 5);

	CreateInvItems(self, ItPl_CaveMushroom, 5);
	CreateInvItems(self, ItPl_SwampWeed, 5);

	CreateInvItems(self, ItPl_Woodberry, 5);
	CreateInvItems(self, ItPl_Flameberry, 5);
	CreateInvItems(self, ItPl_Trollberry, 5);

	//----------------------------------------
	//MISC //Schlüssel
	//----------------------------------------
	CreateInvItem(self, ItKe_Key1);
	CreateInvItem(self, ItKe_Key2);
	CreateInvItem(self, ItKe_Key3);
	CreateInvItem(self, ItKe_Key4);
	CreateInvItems(self, ItKe_Lockpick, 100);
	// Storyschlüssel
	CreateInvItems(self, ItKe_Pos, 1);
	CreateInvItems(self, ItKe_Nabor, 1);

	//----------------------------------------
	//MISC /Light_sources
	//----------------------------------------
	CreateInvItems(self, ItLsTorch, 50);
	CreateInvItems(self, ItLsTorchBurned, 1);

	//----------------------------------------
	//misc.d
	//----------------------------------------
	CreateInvItems(self, ItMi_Silver, 1000);
	CreateInvItems(self, ItMi_Pliers, 1);


	CreateInvItems(self, ItMi_Hammer, 1);
	CreateInvItems(self, ItMi_Scoop, 1);
	CreateInvItems(self, ItLs_TorchFireSpit, 1);
	CreateInvItems(self, ItMi_Alarmhorn, 1);
	CreateInvItems(self, ItMi_Lute, 1);
	CreateInvItems(self, ItMi_Stomper, 1);
	CreateInvItems(self, ItMi_Flask, 5);

	//---------------------------------------------------
	//MISC STUFF
	//-------------------------------------------------
	CreateInvItems(self, ItMi_Wedel, 1);
	CreateInvItems(self, ItMi_Brush, 1);
	CreateInvItems(self, ItMiJoint_1, 5);
	CreateInvItems(self, ItMiJoint_2, 5);
	CreateInvItems(self, ItMiJoint_3, 5);
	CreateInvItems(self, FakeScroll, 1);
	CreateInvItems(self, ItWr_Worldmap, 1);
	CreateInvItems(self, ItMi_Saw, 1);
	CreateInvItems(self, FakeBook, 1);

	//----------------------------------------
	//Ranged_weapons.d
	//----------------------------------------
	//Kurzbogen
	CreateInvItem(self, ItRw_ShortBow);
	CreateInvItem(self, ItRw_RiderBow );
	CreateInvItem(self, ItRw_FieldBow );
	CreateInvItem(self, ItRw_HuntingBow );
	//Langbogen
	CreateInvItem(self, ItRw_LongBow);
	CreateInvItem(self, ItRw_HedgeBow);
	CreateInvItem(self, ItRw_YewBow);
	//Kriegsbogen
	CreateInvItem(self, ItRw_ArmyBow);
	CreateInvItem(self, ItRw_WarBow);
	CreateInvItem(self, ItRw_StormBow);
	//Armbrust
	CreateInvItem(self, ItRw_LightCrossBow);
	CreateInvItem(self, ItRw_CrossBow);
	CreateInvItem(self, ItRw_HeavyCrossBow);
	CreateInvItem(self, ItRw_WarCrossBow);

	//Orc
	//CreateInvItem(self, ItRwOrcstaff);

	//----------------------------------------
	//Ammunition.d
	//----------------------------------------
	CreateInvItems(self, ItAm_Arrow, 50);
	CreateInvItems(self, ItAm_Bolt, 50);

	//----------------------------------------
	//Written.d
	//----------------------------------------
	CreateInvItems(self, ItWr_Book_Circle_01, 1);
	CreateInvItems(self, ItWr_Book_Circle_02, 1);
	CreateInvItems(self, ItWr_Book_Circle_03, 1);
	CreateInvItems(self, ItWr_Book_Circle_04, 1);
	CreateInvItems(self, ItWr_Book_Circle_05, 1);
	CreateInvItems(self, ItWr_Book_Circle_06, 1);

	//----------------------------------------
	//Melee_weapons.d
	//----------------------------------------
	// provisorische Waffen
	CreateInvItem(self, ItMw_Club);
	CreateInvItem(self, ItMw_Poker);
	CreateInvItem(self, ItMw_Sickle);
	CreateInvItem(self, ItMw_Pickaxe);
	CreateInvItem(self, ItMw_BloodPickaxe);
	CreateInvItem(self, ItMw_Sledgehammer);
	CreateInvItem(self, ItMw_Scythe);

	// normale Waffen
	CreateInvItem(self, ItMw_Shortsword);
	CreateInvItem(self, ItMw_Longsword);
	CreateInvItem(self, ItMw_Broadsword);
	CreateInvItem(self, ItMw_Bastardsword);
	CreateInvItem(self, ItMw_2HSword);
	CreateInvItem(self, ItMw_OrcSword);
	CreateInvItem(self, ItMw_Hatchet);
	CreateInvItem(self, ItMw_Battleaxe);
	CreateInvItem(self, ItMw_DoublebladedAxe);
	CreateInvItem(self, ItMw_BerserkAxe);
	CreateInvItem(self, ItMw_OrcAxe);
	CreateInvItem(self, ItMw_IronClub);
	CreateInvItem(self, ItMw_Mace);
	CreateInvItem(self, ItMw_Morningstar);
	CreateInvItem(self, ItMw_Warhammer);
	CreateInvItem(self, ItMw_OrcHammer);

	//----------------------------------------
	// Schmiedezubehör
	//----------------------------------------
	// Nuggets
	CreateInvItems(self, ItMi_OreNugget, 1000);
	CreateInvItems(self, ItMi_BloodOreNugget, 1000);
	CreateInvItems(self, ItMi_DarkOreNugget, 1000);

	CreateInvItems(self, ItMi_RawIron, 10);
	CreateInvItems(self, ItMi_RawLongIron, 10);
	CreateInvItems(self, ItMi_BloodRawLongIron, 10);
	CreateInvItems(self, ItMi_DarkRawLongIron, 10);

	CreateInvItems(self, ItMi_HotIron, 10);
	CreateInvItems(self, ItMi_HotLongIron, 10);
	CreateInvItems(self, ItMi_BloodHotLongIron, 10);
	CreateInvItems(self, ItMi_DarkHotLongIron, 10);

	CreateInvItems(self, ItMi_HotSwordBlade, 10);
	CreateInvItems(self, ItMi_HotAxeBlade, 10);
	CreateInvItems(self, ItMi_HotStump, 10);
	CreateInvItems(self, ItMi_Hot2HSwordBlade, 10);
	CreateInvItems(self, ItMi_Hot2HAxeBlade, 10);
	CreateInvItems(self, ItMi_Hot2HStump, 10);

	CreateInvItems(self, ItMi_BloodHot2HSwordBlade, 10);
	CreateInvItems(self, ItMi_BloodHot2HAxeBlade, 10);
	CreateInvItems(self, ItMi_BloodHot2HStump, 10);

	CreateInvItems(self, ItMi_DarkHot2HSwordBlade, 10);
	CreateInvItems(self, ItMi_DarkHot2HAxeBlade, 10);
	CreateInvItems(self, ItMi_DarkHot2HStump, 10);

	CreateInvItems(self, ItMi_SwordBlade, 10);
	CreateInvItems(self, ItMi_AxeBlade, 10);
	CreateInvItems(self, ItMi_Stump, 10);
	CreateInvItems(self, ItMi_2HSwordBlade, 10);
	CreateInvItems(self, ItMi_2HAxeBlade, 10);
	CreateInvItems(self, ItMi_2HStump, 10);

	CreateInvItems(self, ItMi_Blood2HSwordBlade, 10);
	CreateInvItems(self, ItMi_Blood2HAxeBlade, 10);
	CreateInvItems(self, ItMi_Blood2HStump, 10);

	CreateInvItems(self, ItMi_Dark2HSwordBlade, 10);
	CreateInvItems(self, ItMi_Dark2HAxeBlade, 10);
	CreateInvItems(self, ItMi_Dark2HStump, 10);

	//-----------------------------------------------------------
	//Amulette
	//----------------------------------------------------------
	CreateInvItem(self, ItMi_Amulet_Psi);
	CreateInvItem(self, Schutzamulett_Feuer);
	CreateInvItem(self, Schutzamulett_Waffen);
	CreateInvItem(self, Schutzamulett_Geschosse);
	CreateInvItem(self, Schutzamulett_Magie);
	CreateInvItem(self, Schutzamulett_Magie_Feuer);
	CreateInvItem(self, Schutzamulett_Waffen_Geschosse);
	CreateInvItem(self, Schutzamulett_Total);
	CreateInvItem(self, Gewandtheitsamulett);
	CreateInvItem(self, Gewandtheitsamulett2);
	CreateInvItem(self, Staerkeamulett);
	CreateInvItem(self, Staerkeamulett2);
	CreateInvItem(self, Lebensamulett);
	CreateInvItem(self, Amulett_der_Magie);
	CreateInvItem(self, Amulett_der_Macht);
	CreateInvItem(self, Amulett_der_Erleuchtung);

	//-----------------------------------------------------------
	//Ringe
	//-----------------------------------------------------------
	CreateInvItem(self, ItRi_Fire_01);
	CreateInvItem(self, ItRi_Fire_02);
	CreateInvItem(self, ItRi_Point_01);
	CreateInvItem(self, ItRi_Point_02);
	CreateInvItem(self, ItRi_Edge_01);
	CreateInvItem(self, Schutzring_Waffen2);
	CreateInvItem(self, Schutzring_Magie1);
	CreateInvItem(self, Schutzring_Magie2);
	CreateInvItem(self, Schutzring_Magie1_Fire1);
	CreateInvItem(self, Schutzring_Magie2_Fire2);
	CreateInvItem(self, Schutzring_Geschosse1_Waffen1);
	CreateInvItem(self, ItRi_Point_02_Waffen2);
	CreateInvItem(self, Schutzring_Total1);
	CreateInvItem(self, Schutzring_Total2);
	CreateInvItem(self, Ring_des_Geschicks);
	CreateInvItem(self, Ring_des_Geschicks2);
	CreateInvItem(self, Ring_des_Lebens);
	CreateInvItem(self, Ring_des_Lebens2);
	CreateInvItem(self, Staerkering);
	CreateInvItem(self, Staerkering2);
	CreateInvItem(self, Ring_der_Magie);
	CreateInvItem(self, Ring_der_Erleuchtung);
	CreateInvItem(self, Machtring);

	//---------------------------------------------------------------------
	//Potions
	//---------------------------------------------------------------------
	CreateInvItem(self, ItFo_Potion_Mana_01);
	CreateInvItem(self, ItFo_Potion_Mana_02);
	CreateInvItem(self, ItFo_Potion_Mana_03);
	CreateInvItem(self, ItFo_Potion_Health_01);
	CreateInvItem(self, ItFo_Potion_Health_02);
	CreateInvItem(self, ItFo_Potion_Health_03);
	CreateInvItem(self, ItFo_Potion_Strength_01);
	CreateInvItem(self, ItFo_Potion_Strength_02);
	CreateInvItem(self, ItFo_Potion_Strength_03);
	CreateInvItem(self, ItFo_Potion_Dex_01);
	CreateInvItem(self, ItFo_Potion_Dex_02);
	CreateInvItem(self, ItFo_Potion_Dex_03);
	CreateInvItem(self, ItFo_Potion_Health_Perma_01);
	CreateInvItem(self, ItFo_Potion_Health_Perma_02);
	CreateInvItem(self, ItFo_Potion_Health_Perma_03);
	CreateInvItem(self, ItFo_Potion_Mana_Perma_01);
	CreateInvItem(self, ItFo_Potion_Mana_Perma_02);
	CreateInvItem(self, ItFo_Potion_Mana_Perma_03);
	CreateInvItem(self, ItFo_Potion_Master_01);
	CreateInvItem(self, ItFo_Potion_Master_02);
	CreateInvItem(self, ItFo_Potion_Haste_01);
	CreateInvItem(self, ItFo_Potion_Haste_02);
	CreateInvItem(self, ItFo_Potion_Haste_03);

	//---------------------------------------------------------------------
	// Animaltropy
	//---------------------------------------------------------------------
	CreateInvItems(self, ItAt_Meatbug, 5);
	CreateInvItems(self, ItAt_MoleratGrease, 5);
	CreateInvItems(self, ItAt_Teeth, 5);
	CreateInvItems(self, ItAt_Wolf, 5);
	CreateInvItems(self, ItAt_Wolf_02, 5);
	CreateInvItems(self, ItAt_Waran, 5);
	CreateInvItems(self, ItAt_Claws, 5);
	CreateInvItems(self, ItAt_PlatesCrawler, 5);
	CreateInvItems(self, ItAt_MandiblesCrawler, 5);
	CreateInvItems(self, ItAt_ShadowFur, 5);
	CreateInvItems(self, ItAt_ShadowHorn, 5);
	CreateInvItems(self, ItAt_LurkerClaw, 5);
	CreateInvItems(self, ItAt_LurkerSkin, 5);
	CreateInvItems(self, ItAt_TrollTheeth, 5);
	CreateInvItems(self, ItAt_TrollFur, 5);
	CreateInvItems(self, ItAt_SwampsharkTeeth, 5);
	CreateInvItems(self, ItAt_SwampsharkSkin, 5);
	CreateInvItems(self, ItAt_BloodflySting, 5);
	CreateInvItems(self, ItAt_BloodflyWings, 5);
	CreateInvItems(self, ItAt_StoneGolemHeart, 1);
	CreateInvItems(self, ItAt_FireGolemHeart, 1);
	CreateInvItems(self, ItAt_IceGolemHeart, 1);
	CreateInvItems(self, ItAt_IceGolemPiece, 1);

	// ---------------------------------------------------------------------
	// Alchemy Resources
	// ---------------------------------------------------------------------
	CreateInvItems(self, ItMi_Sulphur, 1);
	CreateInvItems(self, ItMi_Quicksilver, 1);
	CreateInvItems(self, ItMi_Syrianoil, 1);
	CreateInvItems(self, ItMi_Alcohol, 1);
	CreateInvItems(self, ItWr_Book_HealingPotions, 1);
	CreateInvItems(self, ItWr_Book_ManaPotions, 1);
	CreateInvItems(self, ItWr_Book_SpeedPotions, 1);

	// ---------------------------------------------------------------------
	// Cook Resources
	// ---------------------------------------------------------------------
	CreateInvItems(self, ItFo_MeatbugSoup, 1);
	CreateInvItems(self, ItFo_MoleratSoup, 1);
	CreateInvItems(self, ItFo_HerbSoup, 1);
	CreateInvItems(self, ItFo_MushroomSoup, 1);
	CreateInvItems(self, ItFo_MeatSoup, 1);
	CreateInvItems(self, ItFo_MeatbugStew, 1);
	CreateInvItems(self, ItFo_MoleratStew, 1);
	CreateInvItems(self, ItFo_HerbStew, 1);
	CreateInvItems(self, ItFo_MushroomStew, 1);
	CreateInvItems(self, ItFo_MeatStew, 1);
	CreateInvItems(self, ItFo_MeatbugPie, 1);
	CreateInvItems(self, ItFo_MoleratPie, 1);
	CreateInvItems(self, ItFo_HerbPie, 1);
	CreateInvItems(self, ItFo_MushroomPie, 1);
	CreateInvItems(self, ItFo_MeatPie, 1);
	// Kochbücher
	CreateInvItems(self, ItWr_Recipe_Meatbug, 1);
	CreateInvItems(self, ItWr_Recipe_Molerat, 1);
	CreateInvItems(self, ItWr_Recipe_Herb, 1);
	CreateInvItems(self, ItWr_Recipe_Mushroom, 1);
	CreateInvItems(self, ItWr_Recipe_Meat, 1);

	//-----------------------------------------------------------------------
	// Mission Items Sequel
	//-----------------------------------------------------------------------
	CreateInvItems(self, ItMi_Coin, 5);
	CreateInvItems(self, ItArScrollTeleport4, 1);
	CreateInvItems(self, ItWr_Book_Thief_01, 1);
	CreateInvItems(self, ItKe_Smith_01, 1);
	CreateInvItems(self, ItWr_RECIPE_01, 1);
	CreateInvItems(self, ItWr_Smith_Art_01, 1);
	CreateInvItems(self, ItMi_Miss_Candel_01, 1);
	CreateInvItems(self, ItWr_Book_Thief_02, 1);
	CreateInvItems(self, ItKe_Edo, 1);
	CreateInvItems(self, ItKe_Bartok, 1);
	CreateInvItems(self, ItAr_ScrollHeal_Copy, 1);
	CreateInvItems(self, ItAr_ScrollLight_Copy, 1);
	CreateInvItems(self, ItWr_HalvorRecipe, 1);
	CreateInvItems(self, ItKe_Halvor, 1);
	CreateInvItems(self, ItKe_Jail, 1);
	CreateInvItems(self, ItMi_StinkingSalt, 1);
	CreateInvItems(self, ItAr_ScrollHealPossessed, 1);
	CreateInvItems(self, ItFo_SleepWine, 1);
	CreateInvItems(self, ItWr_Nefarius_Diary, 1);
	CreateInvItems(self, ItWr_Bullit_Note, 1);
	CreateInvItems(self, ItWr_Phoenix1, 1);
	CreateInvItems(self, ItWr_Phoenix2, 1);
	CreateInvItems(self, ItWr_Phoenix3, 1);
	CreateInvItems(self, ItWr_Phoenix4, 1);
	CreateInvItems(self, ItWr_Phoenix5, 1);
	CreateInvItems(self, ItWr_Phoenix6, 1);
	CreateInvItems(self, ItWr_Phoenix7, 1);
	CreateInvItems(self, ItWr_Phoenix8, 1);
	CreateInvItems(self, ItWr_PhoenixCheat, 1);
	CreateInvItems(self, ItPo_ElexirOfMind, 1);
	CreateInvItems(self, ItFo_Placebo, 1);
	CreateInvItems(self, ItWr_BloodThistle, 1);
	CreateInvItems(self, ItWr_Helvegor, 1);
	CreateInvItems(self, ItWr_Gods, 1);
	CreateInvItems(self, ItWr_Palgur, 1);
	CreateInvItems(self, ItWr_Worker, 1);

	// ---------------------------------------------------------------------
	// Rune Resources
	// ---------------------------------------------------------------------
	CreateInvItems(self, ItAr_RuneBlank, 1);
	CreateInvItems(self, ItAr_BloodRuneBlank, 1);
	CreateInvItems(self, ItAr_DarkRuneBlank, 1);

	// -------- missions --------
	// mission Items Sequel

	// -------- daily routine --------
};
