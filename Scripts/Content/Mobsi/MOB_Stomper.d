const int Amnt_GreenNovice = 1;
const int Amnt_BlackWise = 2;
const int Amnt_DreamCall = 3;

func int MOB_Stomper_HasBasics()
{
	PrintDebugMobsi("MOB_Stomper_HasBasics");
	if ((hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_Stomper)
	&& (Npc_HasItems(hero, ItMi_Stomper) >= 1))
	{
		PrintDebugMobsi("MOB_Cauldron_HasBasics ... TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("MOB_Cauldron_HasBasics ... FALSE");
		return FALSE;
	};
};

func int Mob_Stomper_CanProduceGreenNovice()
{
	PrintDebugMobsi("Mob_Stomper_CanProduceGreen");

	if ((Npc_HasItems(self, ItPl_Swampweed) >= Amnt_GreenNovice)
	&& MOB_Stomper_HasBasics())
	{
		PrintDebugMobsi("Mob_Stomper_CanProduceGreen ... True");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("Mob_Stomper_CanProduceGreen ...False");
		return FALSE;
	};
};

func int Mob_Stomper_CanProduceBlackWise()
{
	PrintDebugMobsi("Mob_Stomper_CanProduceBlackWise");
	if ((Npc_HasItems(self, ItPl_Swampweed) >= Amnt_BlackWise)
	&& MOB_Stomper_HasBasics())
	{
		PrintDebugMobsi("Mob_Stomper_CanProduceBlackWise ...True");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("Mob_Stomper_CanProduceBlackWise...False");
		return FALSE;
	};
};

func int Mob_Stomper_CanProduceDreamCall()
{
	PrintDebugMobsi("Mob_Stomper_CanProduceDreamCall");
	if ((Npc_HasItems(self, ItPl_Swampweed) >= Amnt_DreamCall)
	&& MOB_Stomper_HasBasics())
	{
		PrintDebugMobsi("Mob_Stomper_CanProduceDreamCall True");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("Mob_Stomper_CanProduceDreamCall ...False");
		return FALSE;
	};
};

func int Mob_Stomper_CanProduce()
{
	PrintDebugMobsi("Mob_Stomper_CanProduce");
	if (Mob_Stomper_CanProduceGreenNovice()
	|| Mob_Stomper_CanProduceBlackWise()
	|| Mob_Stomper_CanProduceDreamCall())
	{
		PrintDebugMobsi("Mob_Stomper_CanProduce ...True");
		return TRUE;
	}
	else
	{
		PrintDebugMobsi("Mob_Stomper_CanProduce ...False");
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Stomper_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string MOB_Stomper_GetCantString()
{
	PrintDebugMobsi("MOB_Stomper_GetCantString");

	if (Npc_HasItems(self, ItMi_Stomper) < 1)
	{
		PrintDebugMobsi("MOB_Stomper_GetCantString... no Tool");
		return _STR_MESSAGE_MOBSI_Stomper_TOOL;
	}
	else
	{
		PrintDebugMobsi("MOB_Stomper_GetCantString no Material");
		return _STR_MESSAGE_MOBSI_Stomper_MAT;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Stomper_EXIT(C_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_Stomper_HasBasics;
	information		= MOB_Stomper_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_Stomper_EXIT_Info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	_ = AI_UseMob(self, SCEMENAME_STOMPER, -1);
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Stomper_AutoExit()
{
	PrintDebugMobsi("MOB_Stomper_AutoExit");

	if (!MOB_Stomper_CanProduce())
	{
		MOB_Stomper_Exit_Info();
	};
};

func void MOB_PRODUCE_GreenNovice()
{
	B_ProduceItem(1,
	ItMiJoint_1,
	NAME_Joint1,
	Amnt_GreenNovice,
	ItPl_Swampweed);

	MOB_Stomper_AutoExit();
};

func void MOB_PRODUCE_BlackWise()
{
	B_ProduceItem(1,
	ItMiJoint_2,
	NAME_Joint2,
	Amnt_BlackWise,
	ItPl_Swampweed);

	MOB_Stomper_AutoExit();
};

func void MOB_PRODUCE_DreamCall()
{
	B_ProduceItem(1,
	ItMiJoint_3,
	NAME_Joint3,
	Amnt_DreamCall,
	ItPl_Swampweed);

	MOB_Stomper_AutoExit();
};

/////////////////////////////////////////////////////////////////
//	Kraut Stampfer	(JP)
//	===================
//
//	- in diesem File werden die verschiedenen Dialoge angelegt, die
//	nötig sind, damit der Spieler mit dem Krautstampfer Joints rollen
//	kann
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
//	Stomper Grüner Novice
///////////////////////////////////////////////////////////////////////////////////

instance MOB_Stomper(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= Mob_Stomper_CanProduceGreenNovice;
	information		= MOB_StomperDialog_Info;
	permanent		= TRUE;
	description		= "Grünen Novicen rollen";
};

func void MOB_StomperDialog_Info()
{
	MOB_PRODUCE_GreenNovice();
};

func void MOB_Stomper_BACK()
{
	Info_ClearChoices(MOB_Stomper);
};

instance MOB_Stomper_BlackWise(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= Mob_Stomper_CanProduceBlackWise;
	information		= MOB_Stomper_BlackWiseDialog_Info;
	permanent		= TRUE;
	description		= "Schwarzen Weisen rollen";
};

func void MOB_Stomper_BlackWiseDialog_Info()
{
	MOB_PRODUCE_BlackWise();
};

instance MOB_Stomper_DreamCall(C_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= Mob_Stomper_CanProduceDreamCall;
	information		= MOB_Stomper_DreamCallDialog_Info;
	permanent		= TRUE;
	description		= "Traumruf rollen";
};

func void MOB_Stomper_DreamCallDialog_Info()
{
	MOB_PRODUCE_DreamCall();
};

func int MOB_Stomper_CONDITION()
{
	PrintDebugMobsi("MOB_Stomper_CONDITION");
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_Stomper;

	if (Npc_IsPlayer(self))
	{
		if (MOB_Stomper_CanProduce())
		{
			PrintDebugMobsi("MOB_Stomper_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			_ = PrintScreen(MOB_Stomper_GetCantString(), -1, _YPOS_MESSAGE_MOBSI, FONT_OLD_SMALL, _TIME_MESSAGE_MOBSI);
			AI_PlayAni(self, "T_DONTKNOW");
			PrintDebugMobsi("MOB_Stomper_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		PrintDebugMobsi("MOB_Stomper_CONDITION...TRUE");
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//
//	Triggerfunktion
//
///////////////////////////////////////////////////////////////////////////////////

func void MOB_Stomper_S1()
{
	PrintDebugMobsi("MOB_Stomper_S1");

	if (B_CompareNpcInstance(self, hero))
	{
		PrintDebugMobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;
		self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_Stomper;

		AI_ProcessInfos(self);
	};
};
