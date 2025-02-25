/********************************************
*         ZS_ArmorMaker         			*
* Benutzen des Rüstngsständers				*
********************************************/

func void ZS_ArmorMaker()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArmorMaker");

	B_SetPerception(self);

	if (!(C_BodyStateContains(self, BS_MOBINTERACT)))
	{
		AI_SetWalkMode(self, NPC_WALK);		// Walkmode für den Zustand
		AI_GotoWP(self, self.wp);
		B_StartUseMob(self, SCEMENAME_ARMORSTAND);
	};
};

func int ZS_ArmorMaker_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_ArmorMaker_Loop"); // Da hier nur eine Ani geloopt wird reicht es diese in Begin und End zu benutzen

	if (!(C_BodyStateContains(self, BS_MOBINTERACT)))
	{
		AI_SetWalkMode(self, NPC_WALK);		// Walkmode für den Zustand
		B_StartUseMob(self, SCEMENAME_ARMORSTAND);
	};

	var int randomizer;
	randomizer = Hlp_Random(20);
	if (Npc_GetStateTime(self) >= 100 + randomizer)
	{
		B_InterruptMob(SCEMENAME_ARMORSTAND);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_ArmorMaker_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_ArmorMaker_End");
	B_StopUseMob(self, SCEMENAME_ARMORSTAND);		//Verlassen sie bitte ihr Mobsi
};
