func void B_CheckStolenEquipment()
{
	var C_Item melee;
	var C_Item ranged;
	var C_Item armor;

	melee = Npc_GetEquippedMeleeWeapon(other);
	ranged = Npc_GetEquippedRangedWeapon(other);
	armor = Npc_GetEquippedArmor(other);

	PrintDebugNpc(PD_ZS_CHECK, ".B_CheckStolenEquipment");

	if (Npc_OwnedByNpc(melee, self))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...SC trägt Nahkampf-Waffe des NSCs offen!");
		self.aivar[AIV_WANTEDITEM] = Hlp_GetInstanceID(melee);
		Npc_ClearAIQueue(self);
		C_LookAtNpc(self, other);
		self.aivar[AIV_PLAYERHASMYWEAPON] = TRUE;
		B_GetBackPersonalWeapon(self);
		return;
	}
	else if (Npc_OwnedByNpc(ranged, self))
	{
		PrintDebugNpc(PD_ZS_CHECK, "...SC trägt Fernkampf-Waffe des NSCs offen!");
		self.aivar[AIV_WANTEDITEM] = Hlp_GetInstanceID(ranged);
		Npc_ClearAIQueue(self);
		C_LookAtNpc(self, other);
		self.aivar[AIV_PLAYERHASMYWEAPON] = TRUE;
		B_GetBackPersonalWeapon(self);
		return;
	};

	if (self.aivar[AIV_PLAYERHASMYWEAPON] == TRUE)
	{
		B_GetBackPersonalWeapon(self);
	};
};
