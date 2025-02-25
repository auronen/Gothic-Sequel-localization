/*
const int	Value_KaeseBrot			=	 10;		const int	HP_KaeseBrot				=	12;

INSTANCE ItFo_CheeseLoaf(C_Item)
{	
	name 				=	"Käsebrot";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Brot;

	visual 				=	"ItFo_Loaf_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseCheeseLoaf;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_KaeseBrot;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_KaeseBrot;

};

	FUNC VOID UseCheeseLoaf()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_KaeseBrot);
	};


func int PSITESTLAB () // PsiLabTest mit einem Brot und Käse, das Mobsi im Testlevel hat aber im Augenblick nicht diese Memberfunktion
{
	PrintDebugNpc	(PD_ZS_FRAME,"PsiLab_StateFunc");
	if ((Npc_HasItems (self, ItFo_Loaf) >= 1) && (Npc_HasItems (self, ItFo_Cheese) >= 1))
	{
		if (self.aivar[AIV_ITEMSCHWEIN] == TRUE)
		{
			Print ("Das gibt ein Käsebrot");
			_ = Npc_RemoveInvItem	( self, ItFo_Loaf);
			_ = Npc_RemoveInvItem	( self, ItFo_Cheese);
		
			CreateInvItem	(self, ItFo_CheeseLoaf);
			return 1;
		}
		else
		{
			Print (	"Das gibt ein talentloses Käsebrot");
			_ = Npc_RemoveInvItem	( self, ItFo_Loaf);
			_ = Npc_RemoveInvItem	( self, ItFo_Cheese);
		
			CreateInvItem	(self, ItFo_CheeseLoaf);
			return 1;
		};
	};
};

func void ProcessVerteiler_01 ()
{
	var C_NPC her; her = Hlp_GetNpc(PC_Hero); 
	self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
};

func int ProcessVerteiler_02 ()
{
	return 1;
};

func int PSITESTLAB_ProcessVerteil ()
{

	if	(B_CompareNpcInstance (self,hero))
	{
		var C_NPC her; her = Hlp_GetNpc(PC_Hero); 
		self.aivar[AIV_INVINCIBLE]=TRUE;
		if (Npc_HasItems	( self, ItFo_Loaf) == 1)
		{
			
			ProcessVerteiler_01 ();
		}
		else
		{
			ProcessVerteiler_02 ();
		};
		
	};
};

//-------------------- Gar nicht schlafen -------------------------

INSTANCE PC_NoPotion (c_Info)

{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_NoPotion_Condition;
	information		= PC_NoPotion_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_NoPotion_Condition()
{		
		return 1;
};

func VOID PC_NoPotion_Info()
{
	AI_StopProcessInfos (self);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	
};

//---------------------- morgens --------------------------------------

INSTANCE PC_Potion_Mana (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Potion_Mana_Condition;
	information		= PC_Potion_Mana_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mana-Trank herstellen"; 
};

FUNC INT PC_Potion_Mana_Condition()
{		
		return 1;
};

func void PC_Potion_Mana_Info ()
{
	CreateInvItem	( self, ITFO_POTION_MANA_01);
};

//--------------------- mittags -----------------------------------------

INSTANCE PC_Potion_LifeEnergy (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Potion_LifeEnergy_Condition;
	information		= PC_Potion_LifeEnergy_Info;
	important		= 0;
	permanent		= 1;
	description		= "Lebensenergie Trank herstellen"; 
};

FUNC INT PC_Potion_LifeEnergy_Condition()
{		
		return 1;
};

func void PC_Potion_LifeEnergy_Info ()
{
	CreateInvItem	( self, ItFo_Loaf);
};



*/


