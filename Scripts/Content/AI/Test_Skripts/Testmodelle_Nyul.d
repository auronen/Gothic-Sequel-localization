/*************************************************************************
**																		**
**		TESTMODELLE_NYUL.D												**
**		==================												**
**																		**
**																		**
*************************************************************************/


INSTANCE PC_Nyul(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name 			= "PC_Nyul";
	Npctype			= Npctype_Main;
	guild			= GIL_NONE;
	level			= 10;
	voice			= 15;
	id				= 0;

	//--------- abilities --------
	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		50;
	attribute[ATR_MANA_MAX] =		50;
	attribute[ATR_MANA] =			50;
	attribute[ATR_HITPOINTS_MAX] =	200;
	attribute[ATR_HITPOINTS] =		200;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			-1);

	//Npc_LearnTalent		( self, TAL_STEAL);
	//Npc_LearnTalent		( self, TAL_SNEAK);
	//Npc_LearnTalent		( self, TAL_PICKLOCK);
	//Npc_LearnTalent		( self, TAL_IRONWILL);
	//Npc_LearnTalent		( self, TAL_MANA);
	//Npc_LearnTalent		( self, TAL_HEAL);

	//Npc_LearnFightTalent    (self, TAL_NEW_1H2);
	//Npc_LearnFightTalent	(self, TAL_NEW_1H1);
	//Npc_LearnFightTalent	(self, TAL_NEW_2H1);
	//Npc_LearnFightTalent	(self, TAL_NEW_2H2);
	//Npc_LearnFightTalent	(self, TAL_NEW_BOW1);
	//Npc_LearnFightTalent	(self, TAL_NEW_CROSSBOW1);


	//-------- inventory --------

//----------------------------------------
//Melee_weapons.d
//----------------------------------------
//----------------------------------------
//Ranged_weapons.d
//----------------------------------------
	EquipItem		(self,ItRw_LongBow);
	CreateInvItem	(self,ItRw_LightCrossBow);

//----------------------------------------
//Ammunition.d
//----------------------------------------
	CreateInvItems	(self,ItAm_Arrow,100);
	CreateInvItems	(self,ItAm_Bolt,100);

//----------------------------------------
//Armor.d
//----------------------------------------
	CreateInvItem(self,EBR_ARMOR_H2);

//----------------------------------------
//Artifacts.d
//----------------------------------------
//Magic Runes
	CreateInvItem(self,ItAr_RuneLight);
	CreateInvItem(self,ItAr_RuneFirebolt);
	CreateInvItem(self,ItAr_RuneFireball);
	CreateInvItem(self,ItAr_RuneFirestorm);
	CreateInvItem(self,ItAr_RuneFireRain);
	CreateInvItem(self,ItAr_RuneTeleport1);
	CreateInvItem(self,ItAr_RuneTeleport2);
	CreateInvItem(self,ItAr_RuneTeleport3);
	CreateInvItems(self,ItArScrollTeleport4, 20);
	CreateInvItem(self,ItAr_RuneTeleport5);

	CreateInvItem(self,ItAr_RuneHeal);
	CreateInvItem(self,ItAr_RuneChainLightning);
	CreateInvItem(self,ItAr_RuneThunderbolt);
	CreateInvItem(self,ItAr_RuneThunderball);
	CreateInvItem(self,ItAr_RuneIceCube);
	CreateInvItem(self,ItAr_RuneIceWave);


	CreateInvItem(self,ItAr_RuneDestroyUndead);

//Magic Scrolls
	CreateInvItems(self,ItAr_ScrollTrfBloodfly,		20);
	CreateInvItems(self,ItAr_ScrollTrfCrawler,		20);
	CreateInvItems(self,ItAr_ScrollTrfLurker,		20);
	CreateInvItems(self,ItAr_ScrollTrfMeatbug,		20);
	CreateInvItems(self,ItAr_ScrollTrfMolerat,		20);
	CreateInvItems(self,ItAr_ScrollTrfOrcdog,		20);
	CreateInvItems(self,ItAr_ScrollTrfScavenger,		20);
	CreateInvItems(self,ItAr_ScrollTrfShadowbeast,	20);
	CreateInvItems(self,ItAr_ScrollTrfSnapper,		20);
	CreateInvItems(self,ItAr_ScrollTrfWaran,			20);
	CreateInvItems(self,ItAr_ScrollTrfWolf,			20);

	CreateInvItems(self,ItAr_ScrollSummonDemon,		20);
	CreateInvItems(self,ItAr_ScrollSummonSkeletons,	20);
	CreateInvItems(self,ItAr_ScrollSummonGolem,		20);
	CreateInvItems(self,ItAr_ScrollArmyOfDarkness,	20);

//Psi-Runes
	CreateInvItem(self,ItAr_RuneWindfist);
	CreateInvItem(self,ItAr_RuneStormfist);
	CreateInvItem(self,ItAr_RuneTelekinesis);
	CreateInvItem(self,ItAr_RuneCharm);
	CreateInvItem(self,ItAr_RuneSleep);
	CreateInvItem(self,ItAr_RunePyrokinesis);
	CreateInvItem(self,ItAr_RuneControl);
	CreateInvItem(self,ItAr_RuneBreathOfDeath);

//Psi-Scrolls
	CreateInvItems(self,ItAr_ScrollFear,		20);
	CreateInvItems(self,ItAr_ScrollBerzerk,	20);
	CreateInvItems(self,ItAr_ScrollShrink,	20);

//----------------------------------------
//Food.d
//----------------------------------------
	CreateInvItems(self,ItFo_Ham,20);
	CreateInvItems(self,ItFo_Beer,20);


//----------------------------------------
//MISC.D
//----------------------------------------
	CreateInvItems(self,ItKe_Lockpick,	20);
	CreateInvItems(self,ItLsTorch,		20);
	CreateInvItems(self,ItMi_Silver,	2000);
	

//----------------------------------------
//Written.d
//----------------------------------------
	CreateInvItem	(self,ItWr_Worldmap);

	CreateInvItem	(self,ItWr_Phoenix1);
	CreateInvItem	(self,ItWr_Phoenix2);
	CreateInvItem	(self,ItWr_Phoenix3);
	CreateInvItem	(self,ItWr_Phoenix4);
	CreateInvItem	(self,ItWr_Phoenix5);
	CreateInvItem	(self,ItWr_Phoenix6);
	CreateInvItem	(self,ItWr_Phoenix7);
	CreateInvItem	(self,ItWr_Phoenix8);

//---------------------------------------------------------------------
//Potions
//---------------------------------------------------------------------
	CreateInvItems(self,ItFo_Potion_Mana_01, 10);
	CreateInvItems(self,ItFo_Potion_Health_01, 10);
};

