///////////////////////////////////////////////////////////////////////////////////
//	Jeder Arbeitsschritt an einem Produktions-MOBSI führt zur Veränderung
//	eines Item im SC-Inventory:
//	- Rohstoffe aus Inventory entfernen
//	- produziertes Item ins Inventory legen
//	- entsprechende Bildschirmausgabe
///////////////////////////////////////////////////////////////////////////////////
func void B_ProduceItem(var int productAmount, 		// Anzahl Produkt
var int productInstance, 							// Art Produkt
var string productName, 							// Produkt-Name
var int rawAmount, 									// Anzahl Rohstoff
var int rawInstance) 								// Art Rohstoff
{
	//-------- Gegenstände transferieren --------
	if (rawAmount > 0)
	{
		_ = Npc_RemoveInvItems(hero, rawInstance, rawAmount);
	};

	if (productAmount > 0)
	{
		CreateInvItems(hero, productInstance, productAmount);
	};

	//-------- Ani spielen & Meldung zusammenbauen --------
	var string msg;

	//-------- MOB_ORE --------
	if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_ORE)
	{
		msg = ConcatStrings(productName, NAME_Smith_Ore_Done);

		//Erzzähler für das entsprechende Mobsi runterzählen
		MOB_Ore_ReduceOre(productAmount);
	}

	//-------- MOB_MELTER --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_MELTER)
	{
		msg = ConcatStrings(productName, NAME_Smith_Melter_Done);

		//Tat-Animation abspielen
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", rawInstance);
		AI_PlayAni(self, "T_BSMELTER_MELT_1");
		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", productInstance);
		AI_PlayAni(self, "T_BSMELTER_MELT_2");
		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	}

	//-------- MOB_FIRE --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_FIRE)
	{
		msg = ConcatStrings(productName, NAME_Smith_Fire_Done);

		AI_CreateItemInSlot(self, "ZS_LEFTHAND", rawInstance);
		AI_PlayAni(self, "T_BSFIRE_RANDOM_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", productInstance);
		AI_PlayAni(self, "T_BSFIRE_RANDOM_2");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	}

	//-------- MOB_ANVIL --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_ANVIL)
	{
		msg = ConcatStrings(productName, NAME_Smith_Anvil_Done);

		//Tat-Animation abspielen
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", rawInstance);
		AI_PlayAni(self, "T_BSANVIL_RANDOM_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", productInstance);
		AI_PlayAni(self, "T_BSANVIL_RANDOM_2");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	}

	//-------- MOB_COOL --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_COOL)
	{
		msg = ConcatStrings(productName, NAME_Smith_Cool_Done);

		//Tat-Animation abspielen
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", rawInstance);
		AI_PlayAni(self, "T_BSCOOL_RANDOM_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", productInstance);
		AI_PlayAni(self, "T_BSCOOL_RANDOM_2");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	}

	//-------- MOB_SHARP --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_SHARP)
	{
		msg = ConcatStrings(productName, NAME_Smith_Sharp_Done);

		//Tat-Animation abspielen
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", rawInstance);
		AI_PlayAni(self, "T_BSSHARP_RANDOM_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", productInstance);
		AI_PlayAni(self, "T_BSSHARP_RANDOM_2");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	}

	//-------- MOB_LAB --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_LAB)
	{
		msg = ConcatStrings(productName, NAME_LAB_Done);
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Flask);
		AI_PlayAni(self, "T_LAB_RANDOM_1");
		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	}

	//-------- MOB_CAULDRON --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_CAULDRON)
	{
		msg = ConcatStrings(productName, NAME_CAULDRON_Done);
		// Rohstoff in Kessel werfen
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", rawInstance);
		AI_PlayAni(self, "T_CAULDRON_DROP_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_PlayAni(self, "T_CAULDRON_DROP_2");

		// Einmal umrühren
		AI_PlayAni(self, "T_CAULDRON_MIX_1");

		// und teller vollmachen :)
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", productInstance);
		AI_PlayAni(self, "T_CAULDRON_FILL_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_PlayAni(self, "T_CAULDRON_FILL_2");
		// Ani-ENDE
	}
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_WOOD)
	{
		msg = ConcatStrings(productName, NAME_WOOD_Done);

		//Zähler für das entsprechende Mobsi runterzählen
		MOB_Wood_ReduceWood(productAmount);
	}
	//-------- MOB_BOW --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BOW)
	{
		msg = ConcatStrings(productName, NAME_BOW_Done);
		//AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_BowMachine);
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_BowWood);

		AI_PlayAni(self, "T_BOGENMACHER_RANDOM_1");
		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	}

	//-------- MOB_RUNEMAKER --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_RUNEMAKER)
	{
		msg = ConcatStrings(productName, NAME_RUNEMAKER_Done);
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", rawInstance);
		AI_PlayAni(self, "T_RMAKER_RANDOM_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", productInstance);
		AI_PlayAni(self, "T_RMAKER_RANDOM_2");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	}

	//-------- MOB_RUNEMELTER --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_RUNEMELTER)
	{
		msg = ConcatStrings(productName, NAME_RUNEMELTER_Done);
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", rawInstance);
		AI_PlayAni(self, "T_RMELTER_RANDOM_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", productInstance);
		AI_PlayAni(self, "T_RMELTER_RANDOM_2");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	}

	//-------- MOB_STOMPER --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_STOMPER)
	{
		msg = ConcatStrings(productName, NAME_STOMPER_Done);
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItMi_Stomper);
		AI_PlayAni(self, "T_HERB_RANDOM_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	}

	//-------- MOB_FLETCHER --------
	else if (hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_Fletcher)
	{
		PrintDebugMobsi("MOB_fletcher Produce");
		msg = ConcatStrings(productName, NAME_Fletcher_Done);
		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ITMI_FletcherKnife);
		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_FletcherWood);
		AI_PlayAni(self, "T_SCHNITZER_RANDOM_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	};

	if (productAmount > 1)
	{
		var string prefix;

		prefix = IntToString(productAmount);
		prefix = ConcatStrings(prefix, " ");
		msg = ConcatStrings(prefix, msg);
	};

	_ = AI_PrintScreen(self, msg, -1, _YPOS_MESSAGE_PRODUCE, FONT_OLD_SMALL, _TIME_MESSAGE_PRODUCE, TEXT_COLOR_WHITE);
};

func void B_ProduceItem2(var int productAmount, 	// Anzahl Produkt
var int productInstance, 							// Art Produkt
var string productName, 							// Produkt-Name
var int rawAmount1, 								// Anzahl Rohstoff 1
var int rawInstance1, 								// Art Rohstoff 1
var int rawAmount2, 								// Anzahl Rohstoff 2
var int rawInstance2) 								// Art Rohstoff 2
{
	//-------- 2. Rohstoff entfernen --------
	if (rawAmount2 > 0)
	{
		_ = Npc_RemoveInvItems(hero, rawInstance2, rawAmount2);
	};

	//-------- für den Rest die normale Funktion aufrufen --------
	B_ProduceItem(productAmount,
	productInstance,
	productName,
	rawAmount1,
	rawInstance1);
};

func void B_ProduceItem3(var int productAmount, 	// Anzahl Produkt
var int productInstance, 							// Art Produkt
var string productName, 							// Produkt-Name
var int rawAmount1, 								// Anzahl Rohstoff 1
var int rawInstance1, 								// Art Rohstoff 1
var int rawAmount2, 								// Anzahl Rohstoff 2
var int rawInstance2, 								// Art Rohstoff 2
var int rawAmount3, 								// Anzahl Rohstoff 3
var int rawInstance3) 								// Art Rohstoff 3
{
	//-------- 3. Rohstoff entfernen --------
	if (rawAmount3 > 0)
	{
		_ = Npc_RemoveInvItems(hero, rawInstance3, rawAmount3);
	};

	//-------- für den Rest die normale Funktion aufrufen --------
	B_ProduceItem2(productAmount,
	productInstance,
	productName,
	rawAmount1,
	rawInstance1,
	rawAmount2,
	rawInstance2);
};
