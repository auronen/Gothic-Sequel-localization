// ZS-KONSTANTEN FÜR ITEMSTATUS

const int TA_IT_NONE = 0;
const int TA_IT_APPLE = 1;
const int TA_IT_LOAF = 2;
const int TA_IT_CHEESE = 3;
const int TA_IT_BEER = 4;
const int TA_IT_MEAT = 5;
const int TA_IT_SOUP = 6;
const int TA_IT_Meatbugsoup = 7;
const int TA_IT_JOINT = 8;
const int TA_IT_BOOZE = 9;
const int TA_IT_WINE = 10;
const int TA_IT_SMALLTALK_ACTIVE = 11;
const int TA_IT_SMALLTALK_PASSIVE = 12;
const int TA_IT_SMALLTALK = 13;
const int TA_IT_FORCEDSMALLTALK = 14;

// ABFRAGEN LAGERZUGEHÖRIGKEIT

//Wahrnehmungset auswählen

//Wach-Anis abspielen
func void B_InitArmor()
{
	PrintDebugNpc(PD_TA_DETAIL, "B_InitArmor");

	var C_Item myarmor;
	myarmor = Npc_GetEquippedArmor(self);

	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))
	{
		AI_PlayAni(self, "T_STAND_2_LGUARD");
	}
	else if ((Hlp_IsItem(myarmor, GRD_ARMOR_H)) || (Hlp_IsItem(myarmor, GRD_ARMOR_M)))
	{
		AI_PlayAni(self, "T_STAND_2_HGUARD");
	};
};

func void B_PlayArmor()
{
	PrintDebugNpc(PD_TA_DETAIL, "B_PlayArmor");

	var int guardreaktion;
	guardreaktion = Hlp_Random(100);

	var C_Item myarmor;

	myarmor = Npc_GetEquippedArmor(self);

	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))
	{
		if (guardreaktion >= 90)
		{
			AI_PlayAni(self, "T_LGUARD_2_STAND");
			AI_PlayAni(self, "T_STAND_2_LGUARD");
		}
		else if (guardreaktion >= 80)
		{
			AI_PlayAni(self, "T_LGUARD_SCRATCH");
		}
		else if (guardreaktion >= 70)
		{
			AI_PlayAni(self, "T_LGUARD_STRETCH");
		}
		else if (guardreaktion >= 60)
		{
			AI_PlayAni(self, "T_LGUARD_CHANGELEG");
		};
	}
	else if ((Hlp_IsItem(myarmor, GRD_ARMOR_H)) || (Hlp_IsItem(myarmor, GRD_ARMOR_M)))
	{
		guardreaktion = Hlp_Random(100);

		if (guardreaktion >= 95)
		{
			AI_PlayAni(self, "T_HGUARD_2_STAND");
			AI_PlayAni(self, "T_STAND_2_HGUARD");
		}
		else if (guardreaktion >= 90)
		{
			AI_PlayAni(self, "T_HGUARD_LOOKAROUND");
		};
	};
};

func void B_ExitArmor()
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ExitArmor");

	var C_Item myarmor;

	myarmor = Npc_GetEquippedArmor(self);

	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))
	{
		AI_PlayAni(self, "T_LGUARD_2_STAND");
	}
	else if ((Hlp_IsItem(myarmor, GRD_ARMOR_H)) || (Hlp_IsItem(myarmor, GRD_ARMOR_M)))
	{
		AI_PlayAni(self, "T_HGUARD_2_STAND");
	};
};

// ITEM-USE-ANIS ABSPIELEN

func void B_EatSmall(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_EatSmall");

	if ((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(100) > 20))
	{
		AI_PlayAni(self, "T_FOOD_RANDOM_1");
		Npc_SetStateTime(self, 0);

		self.aivar[AIV_ITEMFREQ] = (Hlp_Random(5) + 5);
	};
};

func void B_EatHuge(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_EatHuge");

	if (Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAni(self, "T_FOODHUGE_RANDOM_1");
		Npc_SetStateTime(self, 0);

		self.aivar[AIV_ITEMFREQ] = (Hlp_Random(5) + 5);
	};
};

func void B_ThrowApple(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ThrowApple");

	if (Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAni(self, "T_FOOD_RANDOM_2");
		Npc_SetStateTime(self, 0);

		self.aivar[AIV_ITEMFREQ] = (Hlp_Random(5) + 5);
	};
};

func void B_DrinkBottle(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_DrinkBottle");

	if ((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(100) > 30))
	{
		AI_PlayAni(self, "T_POTION_RANDOM_1");
		Npc_SetStateTime(self, 0);

		self.aivar[AIV_ITEMFREQ] = (Hlp_Random(5) + 5);
	};
};

func void B_WipeMouth(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_WipeMouth");

	if ((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(100) > 50))
	{
		AI_PlayAni(self, "T_POTION_RANDOM_2");
		Npc_SetStateTime(self, 0);

		self.aivar[AIV_ITEMFREQ] = (Hlp_Random(5) + 5);
	};
};

func void B_LookBottle(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_LookBottle");

	if (Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAni(self, "T_POTION_RANDOM_3");
		Npc_SetStateTime(self, 0);

		self.aivar[AIV_ITEMFREQ] = (Hlp_Random(5) + 5);
	};
};

func void B_DrawJoint(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_DrawJoint");

	if (Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAni(self, "T_JOINT_RANDOM_1");
		Npc_SetStateTime(self, 0);

		self.aivar[AIV_ITEMFREQ] = (Hlp_Random(5) + 5);
	};
};

func void B_EatMeat(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_EatMeat");

	if (Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAni(self, "T_MEAT_RANDOM_1");
		Npc_SetStateTime(self, 0);

		self.aivar[AIV_ITEMFREQ] = (Hlp_Random(5) + 5);
	};
};

func void B_EatMeatbugSoup(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_EatMeatbugSoup");

	if ((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && Hlp_Random(1) == 1)
	{
		AI_PlayAni(self, "T_RICE_RANDOM_1");
		Npc_SetStateTime(self, 0);

		self.aivar[AIV_ITEMFREQ] = (Hlp_Random(5) + 5);
	}
	else
	{
		AI_PlayAni(self, "T_RICE_RANDOM_2");
		Npc_SetStateTime(self, 0);

		self.aivar[AIV_ITEMFREQ] = (Hlp_Random(5) + 5);
	};
};

func void B_PlayItemRandoms(var C_Npc self)
{
	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_APPLE)
	{
		B_EatSmall(self);
	};

	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_LOAF)
	{
		B_EatHuge(self);
	};

	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_CHEESE)
	{
		B_EatHuge(self);
	};

	if ((self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER) || (self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE) || (self.aivar[AIV_ITEMSTATUS] == TA_IT_WINE))
	{
		B_DrinkBottle(self);
	};

	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_JOINT)
	{
		B_DrawJoint(self);
	};

	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_MEAT)
	{
		B_EatMeat(self);
	};

	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_MeatbugSoup)
	{
		B_EatMeatbugSoup(self);
	};

	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_APPLE)
	{
		B_ThrowApple(self);
	};

	if ((self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER) || (self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE))
	{
		B_LookBottle(self);
	};

	if ((self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER) || (self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE) || (self.aivar[AIV_ITEMSTATUS] == TA_IT_WINE))
	{
		B_WipeMouth(self);
	};
};

// Itemauswahlfunktionen

func void B_ChooseApple(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ChooseApple");

	self.aivar[AIV_ITEMSTATUS] = TA_IT_APPLE;
	/*
	if (Npc_HasItems(self, ItFo_Apple) == 0)
	{
		CreateInvItem(self, ItFo_Apple);
	};

	AI_UseItemToState(self, ItFo_Apple, 0);
	*/
	// Neues Itemverfahren, damit man im sitzen Essen kann

	AI_PlayAni(self, "T_MOB_FOOD_1");
	AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItFo_Apple);
	AI_PlayAni(self, "T_MOB_FOOD_2");

	// Hilfsvar um die beiden Randomanis zu toggeln
	var int int_randomizer;
	int_randomizer = Hlp_Random(20);

	if (int_randomizer < 10)
	{
		AI_PlayAni(self, "T_MOB_FOOD_RANDOM_1");
	}
	else
	{
		AI_PlayAni(self, "T_MOB_FOOD_RANDOM_2");
	};

	AI_PlayAni(self, "T_MOB_FOOD_3");
	AI_Wait(self, 1);
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	self.aivar[AIV_ITEMFREQ] = 1;
};

func void B_ChooseLoaf(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ChooseLoaf");

	self.aivar[AIV_ITEMSTATUS] = TA_IT_LOAF;

	if (Npc_HasItems(self, ItFo_Loaf) == 0)
	{
		CreateInvItem(self, ItFo_Loaf);
	};

	AI_UseItemToState(self, ItFo_Loaf, 0);

	self.aivar[AIV_ITEMFREQ] = 1;
};

func void B_ChooseCheese(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ChooseCheese");

	self.aivar[AIV_ITEMSTATUS] = TA_IT_CHEESE;

	if (Npc_HasItems(self, ItFo_Cheese) == 0)
	{
		CreateInvItem(self, ItFo_Cheese);
	};

	AI_UseItemToState(self, ItFo_Cheese, 0);

	self.aivar[AIV_ITEMFREQ] = 1;
};

func void B_ChooseBeer(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ChooseBeer");

	self.aivar[AIV_ITEMSTATUS] = TA_IT_BEER;

	if (Npc_HasItems(self, ItFo_Beer) == 0)
	{
		CreateInvItem(self, ItFo_Beer);
	};

	AI_UseItemToState(self, ItFo_Beer, 0);

	self.aivar[AIV_ITEMFREQ] = 1;
};

func void B_ChooseMeat(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ChooseMeat");

	self.aivar[AIV_ITEMSTATUS] = TA_IT_MEAT;

	if (Npc_HasItems(self, ItFo_Mutton) == 0)
	{
		CreateInvItem(self, ItFo_Mutton);
	};

	AI_UseItemToState(self, ItFo_Mutton, 0);

	self.aivar[AIV_ITEMFREQ] = 1;
};

func void B_ChooseSoup(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ChooseSoup");

	self.aivar[AIV_ITEMSTATUS] = TA_IT_SOUP;

	if (Npc_HasItems(self, ItFo_MeatbugSoup) == 0)
	{
		CreateInvItem(self, ItFo_MeatbugSoup);
	};

	AI_UseItemToState(self, ItFo_MeatbugSoup, 0);

	self.aivar[AIV_ITEMFREQ] = 1;
};

func void B_ChooseMeatbugSoup(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ChooseMeatbugsoup");

	self.aivar[AIV_ITEMSTATUS] = TA_IT_MeatbugSoup;

	if (Npc_HasItems(self, ItFo_MeatbugSoup) == 0)
	{
		CreateInvItem(self, ItFo_Meatbugsoup);
	};

	AI_UseItemToState(self, ItFo_MeatbugSoup, 0);

	self.aivar[AIV_ITEMFREQ] = 1;
};

func void B_ChooseJoint(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ChooseJoint");

	self.aivar[AIV_ITEMSTATUS] = TA_IT_JOINT;

	if (Npc_HasItems(self, ItMiJoint_1) == 0)
	{
		CreateInvItem(self, ItMiJoint_1);
	};

	AI_UseItemToState(self, ItMiJoint_1, 0);

	self.aivar[AIV_ITEMFREQ] = 1;
};

func void B_ChooseBooze(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ChooseBooze");

	self.aivar[AIV_ITEMSTATUS] = TA_IT_BOOZE;

	if (Npc_HasItems(self, ItFo_Booze) == 0)
	{
		CreateInvItem(self, ItFo_Booze);
	};

	AI_UseItemToState(self, ItFo_Booze, 0);

	self.aivar[AIV_ITEMFREQ] = 1;
};

func void B_ChooseWine(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ChooseWine");

	self.aivar[AIV_ITEMSTATUS] = TA_IT_WINE;

	if (Npc_HasItems(self, ItFo_Wine) == 0)
	{
		CreateInvItem(self, ItFo_Wine);
	};

	AI_UseItemToState(self, ItFo_Wine, 0);

	self.aivar[AIV_ITEMFREQ] = 1;
};

//------------------------------------------------------------------------------------------

func void B_Pee(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_Pee");
	if (Wld_IsFPAvailable(self, "PEE"))
	{
		AI_StandUp(self);
		AI_SetWalkMode(self, NPC_WALK);
		AI_GotoFP(self, "PEE");
		AI_PlayAni(self, "T_PEE");
		AI_ContinueRoutine(self);			//MH: Bugfix
	};
};

func void B_Bored(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_Bored");

	var int choice;
	choice = Hlp_Random(100);

	if (choice < 20) { AI_PlayAni(self, "T_BORINGKICK"); }
	else if (choice < 30) { AI_PlayAni(self, "R_SCRATCHLSHOULDER"); }
	else if (choice < 40) { AI_PlayAni(self, "R_SCRATCHRSHOULDER"); }
	else if (choice < 60) { AI_PlayAni(self, "R_SCRATCHEGG"); }
	else if (choice < 80) { AI_PlayAni(self, "R_SCRATCHHEAD"); }
	else if (choice < 100) { AI_PlayAni(self, "R_LEGSHAKE"); };
	AI_Wait(self, 1);
};

func void B_ResetIterator(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ResetIterator");
	if (self.aivar[AIV_GUARDITERATOR] >= 5000)
	{
		self.aivar[AIV_GUARDITERATOR] = 0;
	};

	self.aivar[AIV_GUARDITERATOR] += 1;
};

func void B_ClearItem(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_ClearItem");

	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_APPLE) { AI_UseItemToState(self, ItFo_Apple, -1);PrintDebugNpc(PD_TA_DETAIL, "-ItFo_Apple"); }
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_LOAF) { AI_UseItemToState(self, ItFo_Loaf, -1);PrintDebugNpc(PD_TA_DETAIL, "-ItFo_Loaf"); }
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_CHEESE) { AI_UseItemToState(self, ItFo_Cheese, -1);PrintDebugNpc(PD_TA_DETAIL, "-ItFo_Cheese"); }
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER) { AI_UseItemToState(self, ItFo_Beer, -1);PrintDebugNpc(PD_TA_DETAIL, "-ItFo_Beer"); }
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_MEAT) { AI_UseItemToState(self, ItFo_Mutton, -1);PrintDebugNpc(PD_TA_DETAIL, "-ItFo_Mutton"); }
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_SOUP) { AI_UseItemToState(self, ItFo_MeatbugSoup, -1);PrintDebugNpc(PD_TA_DETAIL, "-ItFo_MeatbugSoup"); }
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_MeatbugSoup) { AI_UseItemToState(self, ItFo_MeatbugSoup, -1);PrintDebugNpc(PD_TA_DETAIL, "-ItFo_MeatbugSoup"); }
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_JOINT) { AI_UseItemToState(self, ItMiJoint_1, -1);PrintDebugNpc(PD_TA_DETAIL, "-ItMiJoint_1"); }
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE) { AI_UseItemToState(self, ItFo_Booze, -1);PrintDebugNpc(PD_TA_DETAIL, "-ItFo_Booze"); }
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_WINE) { AI_UseItemToState(self, ItFo_Wine, -1);PrintDebugNpc(PD_TA_DETAIL, "-ItFo_Wine"); };
	self.aivar[AIV_ITEMSTATUS] = TA_IT_NONE;
};

////////////////////////////////////////////////////////////////
//	B_StartUseMob
//	=============
//	Positionierung zum und anmelden am Mob
////////////////////////////////////////////////////////////////
func void B_StartUseMob(var C_Npc slf, var string mobname)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_StartUseMob");
	PrintDebugNpc(PD_TA_DETAIL, mobname);

	if (!(C_BodyStateContains(slf, BS_MOBINTERACT))
	|| (C_BodyStateContains(slf, BS_MOBINTERACT_INTERRUPT)))
	{
		PrintDebugNpc(PD_TA_DETAIL, "B_StartUseMob ... Kein Mobsi");
		PrintDebugNpc(PD_TA_DETAIL, mobname);
		AI_SetWalkMode(slf, NPC_WALK);
		if ((Hlp_StrCmp(Npc_GetNearestWP(slf), slf.wp) == 0))
		{
			PrintDebugNpc(PD_TA_DETAIL, "B_StartUseMob ... Nicht auf meinem WP");
			AI_GotoWP(slf, slf.wp);
		};

		_ = AI_UseMob(slf, mobname, 1);
	};
};

////////////////////////////////////////////////////////////////
// 	B_StopUseMob
//	============
//	Übernimmt die komplette Mobsiabmeldung inklusive Items
//	Löschen, die für die Benutzung des Mobsis generiert werden
/////////////////////////////////////////////////////////////////
func void B_StopUseMob(var C_Npc slf, var string mobname)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_StopUseMob");

	_ = AI_UseMob(slf, mobname, -1);
	AI_RemoveItemFromSlot(slf, "ZS_RIGHTHAND");
	AI_RemoveItemFromSlot(slf, "ZS_LEFTHAND");
};
