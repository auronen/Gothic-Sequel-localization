/////////////////////////////////////////////////////////////////////////
// 	B_InterruptMob
//	==============
//	Funktion um die Nsc´s während der Mobbenutzung zwischen-
//	durch ein paar Random-Anis abspielen zu lassen
// 	Aufrufende Funktionen sind in drei Klassen zu unterteilen.
// 	Erstens: Funktionen, die nur ein Mob benutzen und kein Item benötigen
// 	ZS_CookForMe, ZS_ReadBook, ZS_ArmorMaker, ZS_RoastScavenger
//	Zweitens: Funktionen die Mobs mit items benutzen
//	ZS_Schnitzer, ZS_PickOre, ZS_BowMaker, ZS_PotionAlchemy, ZS_RepairHut
//	ZS_SawWood, ZS_StoneMason,
//	Funktionen wie zwei, nur das in der Mobsibenutzung Items ausgetauscht werden,
//	bei diesen wird in der Zustandsloop das Itemhandling übernommen, so daß
//	diese Mobsis wie Kategorie eins behandelt werden :
//	ZS_Smith_Sharp, ZS_Smith_Anvil, ZS_Smith_Cool, ZS_Smith_Fire, ZS_Cook
////////////////////////////////////////////////////////////////////////////
func void B_InterruptMob(var string mobsi)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_InterruptMob");
	B_StopUseMob(self, mobsi);
	var int randomize_mob;
	randomize_mob = Hlp_Random(7);
	if ((randomize_mob == 1) && !C_NpcIsBoss(self))
	{
		AI_PlayAni(self, "T_BORINGKICK");
	};

	if (randomize_mob == 2)
	{
		AI_PlayAni(self, "T_SEARCH");
	};

	if (randomize_mob == 3)
	{
		AI_PlayAni(self, "R_SCRATCHHEAD");
	};

	if (randomize_mob == 4)
	{
		AI_PlayAni(self, "R_LEGSHAKE");
	};

	if (randomize_mob == 5)
	{
		AI_PlayAni(self, "R_SCRATCHRSHOULDER");
	};

	if (randomize_mob == 6)
	{
		AI_PlayAni(self, "R_SCRATCHLSHOULDER");
	};

	Npc_SetStateTime(self, 0);
	_ = AI_UseMob(self, mobsi, 1);
	B_UseMobItems(self, mobsi);
	self.aivar[AIV_DONTUSEMOB] = 1;
};
