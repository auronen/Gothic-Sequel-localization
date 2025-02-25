/*******************************************
*          NSC benutzt Kochkessel          *
*******************************************/

func void ZS_Cook()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Cook");

	B_SetPerception(self);

	if (!C_BodyStateContains(self, BS_MOBINTERACT))
	{
		AI_SetWalkMode(self, NPC_WALK);		// Walkmode für den Zustand
		if ((Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == 0))
		{
			AI_GotoWP(self, self.wp);
		};

		AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");

		_ = AI_UseMob(self, SCEMENAME_CAULDRON, 1);		// Benutze den Mob einmal bis zum angegebenen State

		AI_CreateItemInSlot(self, "ZS_RIGHTHAND", ItMi_Scoop);
	};
};

func int ZS_Cook_Loop()
{
	PrintDebugNpc(PD_TA_LOOP, "ZS_Cook_Loop"); // Da hier nur eine Ani geloopt wird reicht es diese in Begin und End zu benutzen
	var int randomizer;
	randomizer = Hlp_Random(20);
	// Ani nur abspielen, wenn auch am Mobsi, weil sonst die Ani in der Luft gemacht wird
	if (Wld_GetInteractMobState(self, SCEMENAME_CAULDRON) == 1)
	{
		PrintDebugNpc(PD_TA_LOOP, "ZS_Cook_Loop ...Mob state");

		AI_PlayAni(self, "T_CAULDRON_MIX_1");

		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItPl_CaveMushroom);
		AI_PlayAni(self, "T_CAULDRON_DROP_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_PlayAni(self, "T_CAULDRON_DROP_2");

		AI_PlayAni(self, "T_CAULDRON_MIX_1");

		AI_CreateItemInSlot(self, "ZS_LEFTHAND", Itat_Meatbug);
		AI_PlayAni(self, "T_CAULDRON_DROP_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_PlayAni(self, "T_CAULDRON_DROP_2");

		AI_PlayAni(self, "T_CAULDRON_MIX_1");
		AI_PlayAni(self, "T_CAULDRON_MIX_1");

		AI_PlayAni(self, "T_CAULDRON_MIX_1");
		AI_PlayAni(self, "T_CAULDRON_MIX_1");

		AI_CreateItemInSlot(self, "ZS_LEFTHAND", ItFo_MushroomSoup);
		AI_PlayAni(self, "T_CAULDRON_FILL_1");
		AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
		AI_PlayAni(self, "T_CAULDRON_FILL_2");
	};

	if (Npc_GetStateTime(self) >= 100 + randomizer)
	{
		B_InterruptMob(SCEMENAME_CAULDRON);
	};

	AI_Wait(self, 1);
	return LOOP_CONTINUE;
};

func void ZS_Cook_End()
{
	PrintDebugNpc(PD_TA_FRAME, "ZS_Cook_End");
	_ = AI_UseMob(self, SCEMENAME_CAULDRON, -1);		//Verlassen sie bitte ihr Mobsi
	AI_RemoveItemFromSlot(self, "ZS_RIGHTHAND");
	AI_RemoveItemFromSlot(self, "ZS_LEFTHAND");
};
